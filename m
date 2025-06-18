Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D947C7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 19:12:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eTsSA5tSG0BBeG/tO1836ylFVVkJ0QYKSkBxCV3iQpM=; b=qdcJNqsgCSME6EqveDGztBrcPW
	pJ7TK/NpxQmb2JuvMf8v1snWooz61WwGEodAkr9LV0MjtPMRMKHYdzYvNP8Aup8E/y6RhIEmurE5D
	DPc8QeIvtUo5tuoGr0Xq7YBOvCIdekr3F4vBYHvv7NvHEZjLGP6zZGAlU/L9A1eJqk4wdcYTCU0u4
	DW/qkV6WC5ngUrBCv+c1hWcT26+cFtFw9PAyECd57oxKRGT+5Qt6pi53YPZ1LEmrDE7jZAOOSo1Nx
	twrtvP67VTCHGBrfPk3c2amMHAHEVgwlbEv+pisfHIPcOVfg0pTqC30+bApdxJYlQFiDpWyUtKZ/2
	IyfDJI1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRyCO-0000000BA3T-0xL1;
	Wed, 18 Jun 2025 19:11:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwne-0000000Atc9-12Pl;
	Wed, 18 Jun 2025 17:42:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=eTsSA5tSG0BBeG/tO1836ylFVVkJ0QYKSkBxCV3iQpM=; b=gqcyXCKAIjcERbqUt1Ljgjsk0p
	3h6fxO0etkd70l/E21ZfcZ45FWeA/IFIuOtBqiyOIRE0/bKzDpMLSBQBFgsViCMjvoayPIaiyz4DN
	kjkzLI8vgbewwVzsUDgP/+TCmo8KFLJyJddjOBNk+5+OVbrYVha1Co7eq3M0i3V8HSPHo4U7UHm1p
	TcbWrtj9/mVSTxDaOtM67HZa56xrIy+GPxGYqNr1t5s4KEpax2D111d5ZlWO5Rv4hcC/wAvjQ9VsI
	GUrjRAMsivP1e18oNpApsVVEsSuneLs8l3kOJSgoSDLioF/+6kcY1CF89IrH3gfQEwod6AamJO4ce
	ZNa8lGYw==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwnb-00000004Eax-3SdL;
	Wed, 18 Jun 2025 17:42:13 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uRwez-000000004uy-0gef;
	Wed, 18 Jun 2025 17:41:59 +0000
Date: Wed, 18 Jun 2025 19:41:50 +0200
From: Daniel Golle <daniel@makrotopia.org>
To: Frank Wunderlich <linux@fw-web.de>
Cc: Felix Fietkau <nbd@nbd.name>, Sean Wang <sean.wang@mediatek.com>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S. Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@google.com>,
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Frank Wunderlich <frank-w@public-files.de>, netdev@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org, Simon Horman <horms@kernel.org>,
	arinc.unal@arinc9.com
Subject: Re: [net-next v5 3/3] net: ethernet: mtk_eth_soc: skip first IRQ if
 not used
Message-ID: <aFL6XhghHobju0th@pidgin.makrotopia.org>
References: <20250618130717.75839-1-linux@fw-web.de>
 <20250618130717.75839-4-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618130717.75839-4-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_184211_927639_B39001BF 
X-CRM114-Status: GOOD (  29.82  )
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

On Wed, Jun 18, 2025 at 03:07:14PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> On SoCs without MTK_SHARED_INT capability (all except mt7621 and
> mt7628) platform_get_irq() is called for the first IRQ (eth->irq[0])
> but it is never used.

I know that technically MTK_SHARED_INT is a capability flag, but it's
rather a non-capability. Hardware having dedicated interrupts for RX and
TX is "more capable" than (older, legacy) hardware with just one shared
interrupt for both...

So maybe better:
"On SoCs with dedicated RX and TX interrupts (all except MT7621 and
MT7628) ..."

Reading the datasheet of some recent MediaTek SoC it is worth
noting that there are 4 interrupts assigned to the frame engine and
the FE_INT_GRP register can be used to assign functions to them.

So technically, calling them RX and TX in DT is wrong, becaues they
are fe_int0, fe_int1, fe_int2 and fe_int3, which are then assigned
one or more functions by the driver using that FE_INT_GRP register.

However, it's the driver then assigns QDMA TX to fe_int1 and RX to
fe_int2 while leaving fe_int0 and fe_int3 unsued.

That's what the magic value 0x21021000 which is written to FE_INT_GRP
register does.

On MT7988 and newer, in addition to those 4 frame engine interrupts
there are **another 4** interrupts for PDMA, typically used to
service 4 RX rings while one of the fe_int* is used to indicate
TX done.

> Skip the first IRQ and reduce the IRQ-count to 2.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> ---
> v5:
> - change commit title and description
> v4:
> - drop >2 condition as max is already 2 and drop the else continue
> - update comment to explain which IRQs are taken in legacy way
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 12 ++++++++----
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  4 ++--
>  2 files changed, 10 insertions(+), 6 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 875e477a987b..7990c84b2b56 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3354,10 +3354,14 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
>  	 * the second is for TX, and the third is for RX.
>  	 */
>  	for (i = 0; i < MTK_FE_IRQ_NUM; i++) {
> -		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> -			eth->irq[i] = eth->irq[MTK_FE_IRQ_SHARED];
> -		else
> -			eth->irq[i] = platform_get_irq(pdev, i);
> +		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
> +			if (i == 0)

This would make it even more readable:
			if (i == MTK_FE_IRQ_SHARED)


Other than that looks good to me:

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> +				eth->irq[MTK_FE_IRQ_SHARED] = platform_get_irq(pdev, i);
> +			else
> +				eth->irq[i] = eth->irq[MTK_FE_IRQ_SHARED];
> +		} else {
> +			eth->irq[i] = platform_get_irq(pdev, i + 1);
> +		}
>  
>  		if (eth->irq[i] < 0) {
>  			dev_err(&pdev->dev, "no IRQ%d resource found\n", i);
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 8cdf1317dff5..9261c0e13b59 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -643,8 +643,8 @@
>  #define MTK_MAC_FSM(x)		(0x1010C + ((x) * 0x100))
>  
>  #define MTK_FE_IRQ_SHARED	0
> -#define MTK_FE_IRQ_TX		1
> -#define MTK_FE_IRQ_RX		2
> +#define MTK_FE_IRQ_TX		0
> +#define MTK_FE_IRQ_RX		1
>  #define MTK_FE_IRQ_NUM		(MTK_FE_IRQ_RX + 1)
>  
>  struct mtk_rx_dma {
> -- 
> 2.43.0
> 
> 

