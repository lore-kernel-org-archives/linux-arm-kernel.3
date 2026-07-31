Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 412A3C54F54
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 09:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VtOJfD4p94dJgUc2OpIekcciEzoJu2Zgz9AGQI7/JTo=; b=mNuu03unjgEarMrzSTa8FfiYjI
	5fg2P+J6z65PTpYrTh91KED+aNKkmOX7D2cS1ta86jABDYjrJK3+b1ioVSH2qWmwuKWBERLYnFAWz
	QRk3Lr8WaexCPXZuERnPMb4f+DpQeydbuzEARyYRVokR5/ysUDmMEtQA4spNUI46fTXKfd3QfvCiw
	gj4FeI4uMDyMCoAseg2cLlY2xG1MnsTSDEXhLKs2SALFXMiaNg1833NdW7Vh9FAqmP14J9S7cM56v
	Ia+eBHM2HW3LwBHr0k96YXKofrnkkGdqZVDJPTlbhcU6dR0m/0ckasjQLZxFcoGzaadGfQCLYCrLZ
	dgeayfoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjg4-0000000CCAq-2CG0;
	Fri, 31 Jul 2026 09:37:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpjg2-0000000CCAL-3uE5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Jul 2026 09:37:14 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 10A206004E;
	Fri, 31 Jul 2026 09:37:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8C31F000E9;
	Fri, 31 Jul 2026 09:37:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785490633;
	bh=VtOJfD4p94dJgUc2OpIekcciEzoJu2Zgz9AGQI7/JTo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=dC50tkWcX5U1kIBETUug6y4niAnBF4Ww+ABwoFRhkm/qo5+02DrpWT4y8aiFmjnBl
	 E2Uu+S0YNS60FYGhZBBHblpmFpWGaSX+hEz7da8r7F54aCLbWZ+LCNstx20Moj75ez
	 emBWljhnrvNf6XaK8dHdp411RTBhG3nij2/Ax5AzebkJzZ2op9IR+N5yx7+q/yZjAs
	 z33frTnXcUPuMeZcZmqWLMYuf09idRf+Nuk9NKD6ESJ2XH6RTU9t6whaqh/hgfFaOQ
	 dlADzbfPDOmB395QI1QI+jghcrYxsumlIKiTRsjeuFnLaS58sihV53SPUaSPrW7HV3
	 wHfl2F3VUzohQ==
Date: Fri, 31 Jul 2026 11:37:09 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Bjorn Andersson <andersson@kernel.org>, 
	Mathieu Poirier <mathieu.poirier@linaro.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Peng Fan <peng.fan@nxp.com>, Frank Li <Frank.Li@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Daniel Baluta <daniel.baluta@oss.nxp.com>, 
	Francesco Dolcini <francesco@dolcini.it>, linux-remoteproc@vger.kernel.org, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 1/4] dt-bindings: remoteproc: imx_rproc: document
 optional "memory-region-names"
Message-ID: <20260731-merciful-whispering-serpent-3a8eef@quoll>
References: <20260730163412.1145-1-laurentiumihalcea111@gmail.com>
 <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260730163412.1145-2-laurentiumihalcea111@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Unsubscribe: <http://lists.infradead.org/mailman/options/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=unsubscribe>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Thu, Jul 30, 2026 at 09:34:09AM -0700, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> The carveout region names are derived based on the DT node names. Because
> of this, the DT node names are ABI, which is not supposed to happen.
> 
> Fix this by documenting an additional, optional property:
> "memory-region-names". This way, the software will have a way to build the
> carveout region names without relying on the DT node names.

That's not the point of xxx-names property. It only serves as a helper
to get the resource.

> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../devicetree/bindings/remoteproc/fsl,imx-rproc.yaml         | 4 ++++
>  1 file changed, 4 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> index c18f71b64889..8e3e6676a95e 100644
> --- a/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> +++ b/Documentation/devicetree/bindings/remoteproc/fsl,imx-rproc.yaml
> @@ -62,6 +62,10 @@ properties:
>      minItems: 1
>      maxItems: 32
>  
> +  memory-region-names:
> +    minItems: 1
> +    maxItems: 32

This cannot be flexible and unspecific. Why "yellow submarine" would be
a correct name?

Best regards,
Krzysztof


