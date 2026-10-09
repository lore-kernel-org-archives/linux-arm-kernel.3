Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42432CA6012
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  9 Oct 2026 10:18:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IK08WvoWJC1h6DlgEI7ITQrkIpsRhrwFymhPxbueT8=; b=PuUBJquQH+OQlZ4/KVU6cDODRa
	Bq+8DJF7rxknuD/LhMw2dFxGdTCLNNV2dhIputmEC3/Wc8DZ3a0woDqrQv00MMFE2sUpfj/RfuTDi
	ggMz7TlIjtROVoGV/uc4Zmxb5ltzC123russRYLygpBxPdPG7gN1aSaiBQ3NSUS90tRpWCy7IVs7i
	Cg90sA1cqSX1pK81rpD0gVmQ6mAUvNvxGFoerGuA8S7VXNafjPP3oSv6SEuUUKqT+TL0ugRH3357E
	b01M8Dps2EyB7B3rIM1wLF+6AgLKWqzfo0caMJ04mLfDiZoZQty6ky/TSIiuVzF+dutr7DGybB5W2
	1cJ/da4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7g2-000000061mJ-19bL;
	Fri, 09 Oct 2026 10:18:10 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xF7g1-000000061m9-0v4f;
	Fri, 09 Oct 2026 10:18:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 705AC41471;
	Fri,  9 Oct 2026 10:18:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AE501F000FF;
	Fri,  9 Oct 2026 10:18:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791541087;
	bh=2IK08WvoWJC1h6DlgEI7ITQrkIpsRhrwFymhPxbueT8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MIDk5/IU6tP3YARpKWHfyeeG7ABschktkAyCEp43D1TgmMbNhOnbWuBEzKUe9lWMR
	 /CeFpSIl8ufe90s/Wj6YSXA790NYrCVsD/XaiFPrAXIUoy5zv077JDbwfOGfBHnyE/
	 sYHwIJ6/3zjaaO/jmSOCGbNfKnCqX4PMK8LZEGaoxVzmJ0SWiD3f9xAnAAu3gdQZsl
	 rP020XSgCfBZJozzUCXHBjZlzD9pHyfe1LVKQZcyQU+wwfTu4KrSPWEs2Tv7/4Jpv5
	 hsvQXwOCt7ynkBKCapGo5icvAj5mPENhu6iEZFYuyLRzhlSD6Chd9NXO7gQtP/ABb1
	 3FJyzVLyxAj7A==
Date: Fri, 9 Oct 2026 12:18:03 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Tim Kuo <Tim.Kuo@mediatek.com>
Cc: Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, linux-spi@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Steven Liu <Steven.Liu@mediatek.com>, 
	Sky Huang <Skylake.Huang@mediatek.com>, Sam Shih <Sam.Shih@mediatek.com>
Subject: Re: [PATCH v3 1/2] spi: dt-bindings: mediatek,spi-mt65xx: add
 MT7987/MT7989 compatibles
Message-ID: <20261009-tricky-fine-aardwolf-cca31a@quoll>
References: <20261008085332.802898-1-Tim.Kuo@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261008085332.802898-1-Tim.Kuo@mediatek.com>
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

On Thu, Oct 08, 2026 at 04:53:31PM +0800, Tim Kuo wrote:
> The MT7987 and MT7989 SPI IPs are IPM designs, so they keep
> "mediatek,spi-ipm" as their fallback compatible, but they widen the tick
> delay field of SPI_CMD_REG and therefore need compatibles of their own.
> 
> Signed-off-by: Tim Kuo <Tim.Kuo@mediatek.com>
> ---
> v2: Add mt7987 and mt7989 real device compatible
> v3:
>  - Drop "mediatek,spi-ipm-v59" 
>  - Move compatible of mt7987 and mt7989 to group of spi-ipm fallback
> 
>  Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml | 2 ++
>  1 file changed, 2 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> index 3bf3eb1f8728..63b23928c734 100644
> --- a/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> +++ b/Documentation/devicetree/bindings/spi/mediatek,spi-mt65xx.yaml
> @@ -35,8 +35,10 @@ properties:
>            - enum:
>                - mediatek,mt7981-spi-ipm
>                - mediatek,mt7986-spi-ipm
> +              - mediatek,mt7987-spi
>                - mediatek,mt7988-spi-quad
>                - mediatek,mt7988-spi-single
> +              - mediatek,mt7989-spi
>                - mediatek,mt8188-spi-ipm
>            - const: mediatek,spi-ipm

Nope. How is this a specific compatible?

Look at git or even read the REST of this file.

Best regards,
Krzysztof


