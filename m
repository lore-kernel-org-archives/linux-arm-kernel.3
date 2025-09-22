Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCA19CAC592
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 22 Sep 2025 10:42:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gQn6e7GjiTDnHBEHUTLTLFZIxBjW0XgHJTIbpGXMwjU=; b=W1VI5+4Dj1ISBYZZ99IrPZ0LAX
	6/uIyuLBndAi2wCHpr8ImOnydGmAxrPujxQqltzAJWKChOtWEI5S4s7cQLQtuiQLvwRp/wb+HienE
	ADmUmVc9+V1g3L2IyHs2MiSx6v+/KO0vuSSWvdvnu5rJl8R3lY8h6oqeBGMDIrLxu1MkpuMsVbzji
	6Dd/yJm1qBXJ162rKTZMnYGMjsQ5mbjjMOxuOFgXhr7vFZ6gh0ulHlOhnVeCGvem8FBwW2elkfkBX
	0NqtWGRwwILpkk6hoK1SCbCSEW4yin7bxSSEZO39S7SrH44xhxsvNQ200fF9736UYWGb1gk6fc3vV
	G9Z+5tOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0e0E-0000000A67b-0UmU;
	Mon, 22 Sep 2025 10:42:38 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v0e0B-0000000A66q-2nF8;
	Mon, 22 Sep 2025 10:42:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758537753;
	bh=Ih1cqIyFne9UJCmMiU/r1H207xbYTp3gU6PQi6WJ/js=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=gH2nDDxrMAvWyOHVpMLA6hKcjMOujozkD4zDZWlMdKphN0qhDkEz4blZqpQX/mEq9
	 +O0GZLWMnm9OqJqAzao1t3U0a9VmK2bQFx6ULM7xpgR37XcxtyeSmUtgN8BBB7jcnD
	 foZ4n7AXc/FW4oVoTyJ5RJUqK7nU5e0vsF3cfu3R+6gU1hgH0jUzZ3kZrmjPWVsNoK
	 KQ/rms4AJz+3Y5W2wAgNRUQDI9zFeXANCft9o7CrY5CXxjY/5PGktYG678qKG5UadN
	 O6GEnl6yc/J51h02W6ePQyZX++Azsn8rpwIYMDgI0xGgS+TECp8yZdrn9cL0BJzFP6
	 wfFxIk4t1iuDg==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D0D0217E0125;
	Mon, 22 Sep 2025 12:42:32 +0200 (CEST)
Message-ID: <e4a6feaf-a9cd-4092-a083-c356a7d954b2@collabora.com>
Date: Mon, 22 Sep 2025 12:42:32 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/3] dmaengine: mediatek: mtk-uart-apdma: support more
 than 33 bits for DMA bitmask
To: wctrl@proton.me, Sean Wang <sean.wang@mediatek.com>,
 Vinod Koul <vkoul@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Long Cheng <long.cheng@mediatek.com>
Cc: dmaengine@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20250921-uart-apdma-v1-0-107543c7102c@proton.me>
 <20250921-uart-apdma-v1-2-107543c7102c@proton.me>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250921-uart-apdma-v1-2-107543c7102c@proton.me>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250922_034235_880984_88128DB3 
X-CRM114-Status: GOOD (  28.67  )
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

Il 21/09/25 13:03, Max Shevchenko via B4 Relay ha scritto:
> From: Max Shevchenko <wctrl@proton.me>
> 
> Drop mediatek,dma-33bits property and introduce a platform data with
> field representing DMA bitmask.
> 
> The reference SoCs were taken from the downstream kernel (6.6) for
> the MT6991 SoC.
> 

That's a good idea - but it doesn't work like that.

The VFF_4G_SUPPORT register really is called {RX,TX}_VFF_ADDR2 - and on all of
the newer SoCs that support more than 33 bits, this register holds the upper
X bits of the TX/RX addr, where X is (dma_bits - 32) meaning that, for example,
for MT6985 X=(36-32) -> X=4.

The downstream driver does have a reference implementation for this - and there
is no simpler way around it: you either implement it all, or you don't.

Simply put: with your code, you're not supporting more than 33 bits, because even
though you're setting the dma mask, you're never correctly using the hardware (as
in, you're never programming the additional registers to make use of that).


> Signed-off-by: Max Shevchenko <wctrl@proton.me>
> ---
>   drivers/dma/mediatek/mtk-uart-apdma.c | 47 +++++++++++++++++++++++++----------
>   1 file changed, 34 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/dma/mediatek/mtk-uart-apdma.c b/drivers/dma/mediatek/mtk-uart-apdma.c
> index 08e15177427b94246951d38a2a1d76875c1e452e..68dd3a4ee0d88fd508870a5de24ae67505023495 100644
> --- a/drivers/dma/mediatek/mtk-uart-apdma.c
> +++ b/drivers/dma/mediatek/mtk-uart-apdma.c
> @@ -42,6 +42,7 @@
>   #define VFF_EN_CLR_B		0
>   #define VFF_INT_EN_CLR_B	0
>   #define VFF_4G_SUPPORT_CLR_B	0
> +#define VFF_ORI_ADDR_BITS_NUM	32
>   
>   /*
>    * interrupt trigger level for tx
> @@ -74,10 +75,14 @@
>   #define VFF_DEBUG_STATUS	0x50
>   #define VFF_4G_SUPPORT		0x54
>   
> +struct mtk_uart_apdma_data {
> +	unsigned int dma_bits;
> +};
> +
>   struct mtk_uart_apdmadev {
>   	struct dma_device ddev;
>   	struct clk *clk;
> -	bool support_33bits;
> +	unsigned int support_bits;

You don't really need to carry support_bits... there's no real usage of that
information across the code, if not at probe time.

bool support_extended_addr; /* rename to your liking */

>   	unsigned int dma_requests;
>   };
>   
> @@ -148,7 +153,7 @@ static void mtk_uart_apdma_start_tx(struct mtk_chan *c)
>   		mtk_uart_apdma_write(c, VFF_WPT, 0);
>   		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_TX_INT_CLR_B);
>   
> -		if (mtkd->support_33bits)
> +		if (mtkd->support_bits > VFF_ORI_ADDR_BITS_NUM)

if (mtkd->support_extended_addr)
	mtk_uart_apdma_write(c, VFF_4G_SUPPORT, upper_32_bits(d->addr);

... do the same for RX and you should be 99.9% done :-)



>   			mtk_uart_apdma_write(c, VFF_4G_SUPPORT, VFF_4G_EN_B);
>   	}
>   
> @@ -191,7 +196,7 @@ static void mtk_uart_apdma_start_rx(struct mtk_chan *c)
>   		mtk_uart_apdma_write(c, VFF_RPT, 0);
>   		mtk_uart_apdma_write(c, VFF_INT_FLAG, VFF_RX_INT_CLR_B);
>   
> -		if (mtkd->support_33bits)
> +		if (mtkd->support_bits > VFF_ORI_ADDR_BITS_NUM)
>   			mtk_uart_apdma_write(c, VFF_4G_SUPPORT, VFF_4G_EN_B);
>   	}
>   
> @@ -297,7 +302,7 @@ static int mtk_uart_apdma_alloc_chan_resources(struct dma_chan *chan)
>   		goto err_pm;
>   	}
>   
> -	if (mtkd->support_33bits)
> +	if (mtkd->support_bits > VFF_ORI_ADDR_BITS_NUM)
>   		mtk_uart_apdma_write(c, VFF_4G_SUPPORT, VFF_4G_SUPPORT_CLR_B);
>   
>   err_pm:
> @@ -467,8 +472,27 @@ static void mtk_uart_apdma_free(struct mtk_uart_apdmadev *mtkd)
>   	}
>   }
>   
> +static const struct mtk_uart_apdma_data mt6577_data = {
> +	.dma_bits = 32
> +};
> +
> +static const struct mtk_uart_apdma_data mt6795_data = {
> +	.dma_bits = 33
> +};
> +
> +static const struct mtk_uart_apdma_data mt6779_data = {
> +	.dma_bits = 34
> +};
> +
> +static const struct mtk_uart_apdma_data mt6985_data = {
> +	.dma_bits = 35
> +};
> +
>   static const struct of_device_id mtk_uart_apdma_match[] = {
> -	{ .compatible = "mediatek,mt6577-uart-dma", },
> +	{ .compatible = "mediatek,mt6577-uart-dma", .data = &mt6577_data },

What about doing, instead...

{ .compatible = "mediatek,mt6577-uart-dma", .data = (void *)32 },

> +	{ .compatible = "mediatek,mt6795-uart-dma", .data = &mt6795_data },
> +	{ .compatible = "mediatek,mt6779-uart-dma", .data = &mt6779_data },
> +	{ .compatible = "mediatek,mt6985-uart-dma", .data = &mt6985_data },
>   	{ /* sentinel */ },
>   };
>   MODULE_DEVICE_TABLE(of, mtk_uart_apdma_match);
> @@ -477,7 +501,8 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
>   {
>   	struct device_node *np = pdev->dev.of_node;
>   	struct mtk_uart_apdmadev *mtkd;
> -	int bit_mask = 32, rc;
> +	const struct mtk_uart_apdma_data *data;
> +	int rc;
>   	struct mtk_chan *c;
>   	unsigned int i;
>   
> @@ -492,13 +517,9 @@ static int mtk_uart_apdma_probe(struct platform_device *pdev)
>   		return rc;
>   	}
>   
> -	if (of_property_read_bool(np, "mediatek,dma-33bits"))
> -		mtkd->support_33bits = true;
> -
> -	if (mtkd->support_33bits)
> -		bit_mask = 33;
> -
> -	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(bit_mask));
> +	data = of_device_get_match_data(&pdev->dev);
> +	mtkd->support_bits = data->dma_bits;

...and there you just get that single number you need, store it locally, then you
can do

mtkd->support_extended_addr = apdma_num_bits > 32;

> +	rc = dma_set_mask_and_coherent(&pdev->dev, DMA_BIT_MASK(data->dma_bits));
>   	if (rc)
>   		return rc;
>   


Cheers,
Angelo



