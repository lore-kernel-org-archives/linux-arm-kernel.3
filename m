Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A78E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Dec 2024 07:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2NEgCeL51JT5BD5Wt5m0yvGuqpK+aCayCOtc7nyedUo=; b=KlmbLZRdB95/p0xEveytdmIR1v
	tpo3sUa1jmRP4BXxYKPj7oJ8ZND2b9w0M2EzQVRDKGgGQIIBSpFVSDCqyNIyBQ1lYzoxcRQwKhgBf
	avNEQlmEQi9uJcBgsYAiFwfQDy3Sz6mb8fK22AGkxPQew1xrrqzO09cQc1iJsNHUZNpa3kDqCkhgi
	6F67Ixhx0o69Vb9cewhbRU+LFnDZoyY4WBlcOxQGg/x0EnvV3vLRQtgaa4WaFcbW79KMugyhXp79S
	ZCd7M+BBd5Nk7amFUNaiYH1bqJ/InmNG6Gzxn2pc6iG2QrPvniXmtoDiN/br77ABdipuovNgH5p+2
	ly508s4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRq2-0000000CYGS-1pbm;
	Tue, 17 Dec 2024 07:17:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNRVO-0000000CUel-3w3g
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Dec 2024 06:56:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 3E2725C4074;
	Tue, 17 Dec 2024 06:55:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C729C4CED3;
	Tue, 17 Dec 2024 06:56:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734418590;
	bh=FCSExKI+sgfvXIQDvMbcaGs6YRB5dHmX79mWUjjc3eA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=bFfO8JQg3wxopxrXFvL6Gw3ZPLinopI5zBctBetd4wKhWw4eaY+ogB5PbWvBlVwg7
	 C+LjxWNxzudKW61+tD/qQ8wNTzA/bmYXcSRH1fSIl/FFtOsfEnQeYT2+fyyl56F+mu
	 zAjaF91teEODc4HFMIzFCO2XgYn+AgG/C6QWao0JlVgeiDcmaswLwgA+f8soTbzMTG
	 gr4E+DFIx56etk80NP/eZ5bVd+7XLvFzXmxpKgGidL8SWD+QRejrM2nVpoi47qVzf0
	 kwZFYMyJnLlJIF7RK83pxjEDSP+caRx+8DrAKcTDN1VBMTng9RB94vt2vxwW3ACyaZ
	 gXaGfW0W2eQuQ==
Date: Tue, 17 Dec 2024 07:56:26 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Laurentiu Mihalcea <laurentiumihalcea111@gmail.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Daniel Baluta <daniel.baluta@nxp.com>, Mark Brown <broonie@kernel.org>, 
	Kuninori Morimoto <kuninori.morimoto.gx@renesas.com>, Takashi Iwai <tiwai@suse.com>, 
	Bard Liao <yung-chuan.liao@linux.intel.com>, Peter Ujfalusi <peter.ujfalusi@linux.intel.com>, 
	Jaroslav Kysela <perex@perex.cz>, Frank Li <Frank.li@nxp.com>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-sound@vger.kernel.org, 
	imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/5] ASoC: dt-bindings: support imx95's CM7 core
Message-ID: <jwhjz7a7spikaj3sgrpqqt5deygeedspz4iar7h6tofadk44nr@ytl7dnnbcrom>
References: <20241216145039.3074-1-laurentiumihalcea111@gmail.com>
 <20241216145039.3074-3-laurentiumihalcea111@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241216145039.3074-3-laurentiumihalcea111@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_225631_014729_E5BC10B9 
X-CRM114-Status: GOOD (  13.47  )
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

On Mon, Dec 16, 2024 at 09:50:36AM -0500, Laurentiu Mihalcea wrote:
> From: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> 
> Add binding for imx95's CM7 core, used for audio processing.

Adding common binding and using it should be the same patch, for such
relatively small bindings.

> 
> Signed-off-by: Laurentiu Mihalcea <laurentiu.mihalcea@nxp.com>
> ---
>  .../bindings/sound/fsl,imx95-cm7-sof.yaml     | 44 +++++++++++++++++++
>  1 file changed, 44 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/sound/fsl,imx95-cm7-sof.yaml

...

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    cm7-cpu@80000000 {
> +        compatible = "fsl,imx95-cm7-sof";
> +        reg = <0x80000000 0x6100000>;
> +        mboxes = <&mu7 2 0>, <&mu7 2 1>, <&mu7 3 0>, <&mu7 3 1>;
> +        mbox-names = "txdb0", "txdb1", "rxdb0", "rxdb1";
> +        memory-region = <&adma_res>;
> +        port {
> +          /* SAI3-WM8962 link */

Keep consistent indentation.

> +          endpoint { remote-endpoint = <&wm8962_ep>; };

This should not be one line, but three lines.

> +        };
> +    };
> -- 
> 2.34.1
> 

