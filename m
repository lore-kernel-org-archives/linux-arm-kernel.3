Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C244C606A326
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Nov 2026 12:43:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=Oq4qDY0o;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MUrI1d5y
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=AbLAJ3WxDTVKx50wvXdvbuoZC6cGIpM9TIIss9ASD2o=; b=Oq4qDY0ow3SpxJ9je8kefJLMRi
	lSyF+yb03x8+fob71J4soksWJfY332dQ+/SnfnFKSBaiCrCgZYDi0J7ySqbU73cLS9nBkak3YujA7
	7+0EwyMeGF/0UUSaA0dGWah8sHgwA3MoFLcznJTdmmsCzjQWuceAelAdh1GdeUbzfeakMuBGgN8vL
	XeG09ckqL5Z9AthNkqGGnU2Yl90gWl9Ygf5bbBTB5otAPojI715Fa9BKO3mWQNIrviWK+VH43Xzna
	W85gaQOo9kwYz8VWIXRdGuzEw0noApoS27GHFVV6aKtTerrp0/hpQ1M++GRrUqp/vFqGkOHGBIitP
	QDwKiOzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJHu-0000000CL2b-2aHO;
	Fri, 06 Nov 2026 12:43:23 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xPJHt-0000000CL2S-1clR
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Nov 2026 12:43:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id BA045601E3;
	Fri,  6 Nov 2026 12:43:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76A881F0089F;
	Fri,  6 Nov 2026 12:43:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793969000;
	bh=AbLAJ3WxDTVKx50wvXdvbuoZC6cGIpM9TIIss9ASD2o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MUrI1d5yzxmdokjfAzvYAko5RWwe/LLqGo8vqE81Gq9ySuahoNu4COUDy60hTQBG1
	 pbLci13U7h/1EfLfUkkw6PVEXOTy1Jb4tpApZIjjwNkF76HS63MAo3HFOdT+SE+zwz
	 6hJkNTD4AFpsg/qFh1uZTPCSOZFG/xQoyMA3DIB2K1exCK5HGLI6VYkDwa7ZNO4bRy
	 1e0KE3D0a18ueouSvtUbSlNTpuK/JBi1ZY8sShRcj9Vfw+sihRiNqc9H23lh9GLCF9
	 iJ91oNs768o/GkHrxRY2pNRH9N3PQ+pNL1ksBZZDoNBI5j+KWAqiwiSDSW7ia08lWN
	 gFZz0tdfOnZzQ==
Date: Fri, 6 Nov 2026 13:43:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Vincent Jardin <vjardin@free.fr>
Cc: Dong Aisheng <aisheng.dong@nxp.com>, 
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.Li@nxp.com>, Jacky Bai <ping.bai@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, NXP S32 Linux Team <s32@nxp.com>, 
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	"Christophe Leroy (CS GROUP)" <chleroy@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev, Vladimir Oltean <vladimir.oltean@nxp.com>
Subject: Re: [PATCH v2 2/5] dt-bindings: soc: fsl: layerscape-dcfg: add the
 LX2160A pad-mux child
Message-ID: <20261106-smiling-infrared-dugong-48ee5c@quoll>
References: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-0-3aad0860b984@free.fr>
 <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103-for-upstream-lx2160a-rcw-pinmux-v1-v2-2-3aad0860b984@free.fr>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 07:12:10PM +0100, Vincent Jardin wrote:
> On the LX2160A the DCFG node holds the pad mux, overridden through its
> DCSR view. Allow fsl,lx2160a-dcfg with simple-mfd, so that the child is
> populated, and the pinctrl child, on the LX2160A only.
> 
> Signed-off-by: Vincent Jardin <vjardin@free.fr>
> ---
>  .../bindings/soc/fsl/fsl,layerscape-dcfg.yaml          | 18 ++++++++++++++++++
>  1 file changed, 18 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> index fc14fd0bf84b..dd6a00ba04eb 100644
> --- a/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> +++ b/Documentation/devicetree/bindings/soc/fsl/fsl,layerscape-dcfg.yaml
> @@ -32,6 +32,7 @@ properties:
>        - items:
>            - enum:
>                - fsl,ls1028a-dcfg
> +              - fsl,lx2160a-dcfg
>            - const: syscon
>            - const: simple-mfd
>  
> @@ -62,6 +63,12 @@ properties:
>  
>    ranges: true
>  
> +  pinctrl:
> +    $ref: /schemas/pinctrl/fsl,lx2160a-rcw-pinmux.yaml#

Why other children are bus-addressed and this one not? Such mixing is
messy. Either this is a subdevice with its own addressing or not. Keep
bindings consistent.

Best regards,
Krzysztof


