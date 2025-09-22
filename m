Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B9ABCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 20:48:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdn+nBJsk+Q9wroRF9vIAmfxf7ee0czxlH+k6Mt1PIc=; b=JHqI2uW08njbfJYL91468XIYAr
	z7MZnFZ0cIP70iy+CHyMK/0WPEOJxHOgbylbTpHBRFFFxm8yRGo2GvicQlK6rEQikWPFmTBzQFVm/
	VRNV/So6SaOamLSiIvtBNM1S0FDGDb4t+LftFSordAnjhuxnJFdeq7uwHktPw2sI1USIUxchU2Fhr
	7DUh7eTpqMHV+DlzuGYDLA4NRLA7ywVXC5A17kTvAIEGAtC1lSSbOrIGgEAXrCtHfD4rKwkKyZmvG
	abQnFmC/woLqEigaqEj3NW81U42Xllf4w67m1NKmpPCHBLMhs05yUS2gjOHRp7lMzxlca1c6jW2op
	dVPnBX/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nS3-0000000BU0E-3ewO;
	Mon, 22 Sep 2025 20:47:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0nS2-0000000BTzw-3HDs;
	Mon, 22 Sep 2025 20:47:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DB72C60243;
	Mon, 22 Sep 2025 20:47:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70920C4CEF0;
	Mon, 22 Sep 2025 20:47:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758574077;
	bh=TGffaL/a1AwXsRo2g8p0Qj75pdptlmyikx5RELula7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PTZUthHXAfXAzGtefWP7IZeJ3vJtSWfBDfpDm8wveQXWtpjc+EQ+Y3XF6vjettdKi
	 U65xc3FwwcapHYICo+BqYYSyAscU2Oqm+GAzahI5tLUO6mZCetVXi98OwOnTzFKyB5
	 hb0DvN7aWJ36yjx5L50kJYRu6dbAHsDmiu7/gG7dUHXHahtqPRV9afI3I1SBUmcUhd
	 Bc2PV7qi2p6h95Ec5iIrzuKMwA1dwYdwD77d69mQk04HKjbwcJBipxGDI8XP7sOx7/
	 F4WngtZ8UPIjioaszV5aSvlqKmSTV6pnxq6XD+RyMTpIigdCq5QzwXW54ZBaJ8pIHo
	 Ji06y3mnG+a7A==
Date: Mon, 22 Sep 2025 15:47:56 -0500
From: Rob Herring <robh@kernel.org>
To: Max Shevchenko <wctrl@proton.me>
Cc: Sean Wang <sean.wang@mediatek.com>, Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Long Cheng <long.cheng@mediatek.com>, dmaengine@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: dma: mediatek,uart-dma: drop
 mediatek,dma-33bits property
Message-ID: <20250922204756.GA1294776-robh@kernel.org>
References: <20250921-uart-apdma-v1-0-107543c7102c@proton.me>
 <20250921-uart-apdma-v1-1-107543c7102c@proton.me>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250921-uart-apdma-v1-1-107543c7102c@proton.me>
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

On Sun, Sep 21, 2025 at 02:03:40PM +0300, Max Shevchenko wrote:
> Many newer SoCs support more than 33 bits for DMA.
> Drop the property in order to switch to the platform data.
> 
> The reference SoCs were taken from the downstream kernel (6.6) for
> the MT6991 SoC.
> 
> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>  Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml | 11 ++++-------
>  1 file changed, 4 insertions(+), 7 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> index dab468a88942d694525aa391f695c44d192f0c42..9dfdfe81af7edbe3540e4b757547a5d5e6ae810c 100644
> --- a/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> +++ b/Documentation/devicetree/bindings/dma/mediatek,uart-dma.yaml
> @@ -22,12 +22,14 @@ properties:
>        - items:
>            - enum:
>                - mediatek,mt2712-uart-dma
> -              - mediatek,mt6795-uart-dma
>                - mediatek,mt8365-uart-dma
>                - mediatek,mt8516-uart-dma
>            - const: mediatek,mt6577-uart-dma
>        - enum:
> -          - mediatek,mt6577-uart-dma
> +          - mediatek,mt6577-uart-dma  # 32 bits
> +          - mediatek,mt6795-uart-dma  # 33 bits

Unless all existing s/w supported mediatek,mt6795-uart-dma, you just 
broke this platform which was relying on the fallback compatible. 

> +          - mediatek,mt6779-uart-dma  # 34 bits
> +          - mediatek,mt6985-uart-dma  # 35 bits
>  
>    reg:
>      minItems: 1
> @@ -56,10 +58,6 @@ properties:
>        Number of virtual channels of the UART APDMA controller
>      maximum: 16
>  
> -  mediatek,dma-33bits:
> -    type: boolean
> -    description: Enable 33-bits UART APDMA support

If this is in use, you need to mark it 'deprecated' instead.

> -
>  required:
>    - compatible
>    - reg
> @@ -116,7 +114,6 @@ examples:
>              dma-requests = <12>;
>              clocks = <&pericfg CLK_PERI_AP_DMA>;
>              clock-names = "apdma";
> -            mediatek,dma-33bits;
>              #dma-cells = <1>;
>          };
>      };
> 
> -- 
> 2.51.0
> 

