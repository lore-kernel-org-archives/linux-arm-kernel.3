Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0C045D3E77E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 21:19:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uMdVuGe/eOZmCC0J7/lWHxlTASMfQOARCRFkdT/yBsw=; b=xCaTBceqzQtJSf73IWdGIikPIY
	3FVqInRUGxh9iphVRdus7mvLgvHP19ebYa5Ake5lqEFl5vPBV9Jbn5soaU7Vm6zjUDh3+kRNZhGws
	td7DlrDodS+B9uxq2CyF+vgS+TxrKqHI6nL7Jb0f7gISwgvwBLSnMxWCtqPSBbikArGX2rAKQbqRi
	oTsDQAtbdwagDefWGO7snjSeCe+HrBU/6sxD6KryagBJvOmQmOqSXOPW9maZLtXRbC5jAUbYweZwU
	lZRuj5HZimj65FjrK47K9pGgoVdYZkRdH4E6wpyvPio7KNSWrQnHv4SnHYLRgVW7bFgHeQgutiG54
	5Be5vZWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRaY-0000000Ftg4-1X81;
	Wed, 10 Dec 2025 21:19:10 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTRaV-0000000Ftfo-3mV4;
	Wed, 10 Dec 2025 21:19:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 05EC160053;
	Wed, 10 Dec 2025 21:19:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 79D8CC4CEF1;
	Wed, 10 Dec 2025 21:19:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765401546;
	bh=03sknuYCPkmVcorTKYIKQw77FBLDwfM2hq1bZJa0BtA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VZQzKcpTIeBrOqwfcANcuGYiBVT/FqdKyu7Qe100DASv6TZAQqwbMmg/h8/sbQshq
	 MDXbkmvdXbc5pEMMiz+q8R4BnIqFDNmwgCnyKmbPNcUAOCrXUrMswwyWMG+QcWvttM
	 PhED7BkMQRj4c+rUJHAfaIJodgcN59wcQteZDc7/3U724wUabdqem6mXEs16tGujmK
	 nMVEulPcm9Ti83MplBvp48iq07FrCgpq29nnDcYnSlrT0JaX5DOeaE8O5t8ohYpt4m
	 O1JwcrmarbpGLvAcrNWicLX4Dp43PMIOGiWS+KpnOtJa5MrSHUoZahWSJFGLyjMlj5
	 NkwicSt2OojJQ==
Date: Wed, 10 Dec 2025 15:19:03 -0600
From: Rob Herring <robh@kernel.org>
To: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
Cc: Chunfeng Yun <chunfeng.yun@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Guillaume Ranquet <granquet@baylibre.com>, kernel@collabora.com,
	Krzysztof Kozlowski <krzk@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	=?iso-8859-1?Q?N=EDcolas_F=2E_R=2E_A=2E?= Prado <nfraprado@collabora.com>
Subject: Re: [PATCH 03/12] dt-bindings: phy: mediatek,hdmi-phy: Document
 extra clocks for MT8195
Message-ID: <20251210211903.GA3352325-robh@kernel.org>
References: <20251209-mtk-genio-evk-hdmi-support-v1-0-9a6106effba6@collabora.com>
 <20251209-mtk-genio-evk-hdmi-support-v1-3-9a6106effba6@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20251209-mtk-genio-evk-hdmi-support-v1-3-9a6106effba6@collabora.com>
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

On Tue, Dec 09, 2025 at 05:34:33PM +0100, Louis-Alexis Eyraud wrote:
> From: "Nícolas F. R. A. Prado" <nfraprado@collabora.com>
> 
> MT8195's HDMI PHY block has 4 clocks instead of just a single one.
> Describe the extra clocks for it.
> 
> Signed-off-by: Nícolas F. R. A. Prado <nfraprado@collabora.com>
> Signed-off-by: Louis-Alexis Eyraud <louisalexis.eyraud@collabora.com>
> ---
>  .../devicetree/bindings/phy/mediatek,hdmi-phy.yaml | 36 +++++++++++++++++++---
>  1 file changed, 32 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> index cd4ac42ee45e4648ed512f68f6f28d1f3f2e1116..91f8118689d5e838c4d75264822bb09a00fea21b 100644
> --- a/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> +++ b/Documentation/devicetree/bindings/phy/mediatek,hdmi-phy.yaml
> @@ -38,12 +38,12 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: PLL reference clock
> +    minItems: 1
> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: pll_ref
> +    minItems: 1
> +    maxItems: 4
>  
>    clock-output-names:
>      maxItems: 1
> @@ -79,6 +79,34 @@ required:
>    - "#phy-cells"
>    - "#clock-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: mediatek,mt8195-hdmi-phy

You just said mt8188 is compatible, but it's excluded here. If mt8188 
can work without knowing about the 3 new clocks (and no driver changes), 
then it is compatible .

> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: PLL reference clock
> +            - description: HDMI 26MHz clock
> +            - description: HDMI PLL1 clock
> +            - description: HDMI PLL2 clock
> +        clock-names:
> +          items:
> +            - const: pll_ref
> +            - const: hdmi_26m
> +            - const: hdmi_pll1
> +            - const: hdmi_pll2

Move all this to the top-level (so just add entries 2-4) and add 
'minItems: 1'. Here, just put 'minItems: 4' except that I assume it did 
work with 1 clock, so requiring 4 breaks the ABI.

Also, drop 'hdmi_'. It's redundant.

> +    else:
> +      properties:
> +        clocks:
> +          items:
> +            - description: PLL reference clock
> +        clock-names:
> +          items:
> +            - const: pll_ref

And here, just 'maxItems: 1'

> +
>  additionalProperties: false
>  
>  examples:
> 
> -- 
> 2.52.0
> 

