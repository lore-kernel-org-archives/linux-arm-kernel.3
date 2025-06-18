Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D85FCC7115A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 16:15:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=umLK2dxLPyHpuXz4Khs32eyHKKlHSWcBYnc3qpF2C3A=; b=DYpaLtBK9V6Iz3E5/pFvO360Lb
	4CqCWALzNc64Nk2zQXT45zHE4ThvWsyfBZut2WgSMlzTnp9C0ydotY8wFdLKrzSG4Dbz4HdijzSUO
	8fEjVUl4YDCvp6uyezmiQ5BY9G0Nj3zq4iiPzDPX/ViXR6BoIaR6XqFiURGrWxh2xGRbpFu280JzB
	pn+Hfd/rygikiCPPaNaqckl0Z7xAbMRVHGgYO0mpb/4KtQw+fNC/a5dkpEK3Umjqfrq6AQGtiGnWU
	hkMRCkG+cQsCW8cnXiJDmIBLni6AjvEo8MUALBUuFxxesMk65P9h6OZTCERsRpqHJsiDqw2T17h6e
	TSnBKzqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRvRV-0000000AhZj-33PC;
	Wed, 18 Jun 2025 16:15:17 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRti0-0000000AQ75-2V7j;
	Wed, 18 Jun 2025 14:24:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=umLK2dxLPyHpuXz4Khs32eyHKKlHSWcBYnc3qpF2C3A=; b=elxwJDdTAJ/yWuMtRIhkxpqfKv
	WSnWF3q2MLkST/6+60+EYqUWFMwpYcuv5lioeN+GwRoZs4bXEVW/RdkAWg6EIlTuKSlhrUBdYhfHt
	I4ClFGfl3QRPtLTyx4SSUv8kBmrVt7/UBB1/2tFBq+BjG6KFZoF8H9yVUbrPsx4jLyMKK2HkOD6sW
	pb9OHaUU1wrUb6ZTu4y9tJWatD3Y7SP6r5l+Tw32V2qBrUXvPh5Y2M/ow/Xaur8Rq3+R5gC3dK/LX
	riNlc0j28GUlZ/pMvKTh1iDFjY9oTf7i0ZletRblm6+WrO97/n186Ecs6ZC3/1OoV+A0IpJKKQlzJ
	deEgNbGQ==;
Received: from pidgin.makrotopia.org ([2a07:2ec0:3002::65])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRthy-000000045pl-1Uu1;
	Wed, 18 Jun 2025 14:24:11 +0000
Received: from local
	by pidgin.makrotopia.org with esmtpsa (TLS1.3:TLS_AES_256_GCM_SHA384:256)
	 (Exim 4.98.2)
	(envelope-from <daniel@makrotopia.org>)
	id 1uRtZL-000000003nZ-3dHt;
	Wed, 18 Jun 2025 14:23:57 +0000
Date: Wed, 18 Jun 2025 16:23:49 +0200
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
Subject: Re: [net-next v5 2/3] net: ethernet: mtk_eth_soc: add consts for irq
 index
Message-ID: <aFLL9Uhu6zmovd2O@pidgin.makrotopia.org>
References: <20250618130717.75839-1-linux@fw-web.de>
 <20250618130717.75839-3-linux@fw-web.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250618130717.75839-3-linux@fw-web.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_152410_463017_DF26A90D 
X-CRM114-Status: GOOD (  27.33  )
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

On Wed, Jun 18, 2025 at 03:07:13PM +0200, Frank Wunderlich wrote:
> From: Frank Wunderlich <frank-w@public-files.de>
> 
> Use consts instead of fixed integers for accessing IRQ array.
> 
> Signed-off-by: Frank Wunderlich <frank-w@public-files.de>
> Reviewed-by: Simon Horman <horms@kernel.org>

Reviewed-by: Daniel Golle <daniel@makrotopia.org>

> ---
> v5:
> - rename consts to be compatible with upcoming RSS/LRO changes
>   MTK_ETH_IRQ_SHARED => MTK_FE_IRQ_SHARED
>   MTK_ETH_IRQ_TX => MTK_FE_IRQ_TX
>   MTK_ETH_IRQ_RX => MTK_FE_IRQ_RX
>   MTK_ETH_IRQ_MAX => MTK_FE_IRQ_NUM
> v4:
> - calculate max from last (rx) irq index and use it for array size too
> ---
>  drivers/net/ethernet/mediatek/mtk_eth_soc.c | 22 ++++++++++-----------
>  drivers/net/ethernet/mediatek/mtk_eth_soc.h |  7 ++++++-
>  2 files changed, 17 insertions(+), 12 deletions(-)
> 
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.c b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> index 39b673ed7495..875e477a987b 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.c
> @@ -3342,9 +3342,9 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
>  	int i;
>  
>  	/* future SoCs beginning with MT7988 should use named IRQs in dts */
> -	eth->irq[1] = platform_get_irq_byname(pdev, "tx");
> -	eth->irq[2] = platform_get_irq_byname(pdev, "rx");
> -	if (eth->irq[1] >= 0 && eth->irq[2] >= 0)
> +	eth->irq[MTK_FE_IRQ_TX] = platform_get_irq_byname(pdev, "tx");
> +	eth->irq[MTK_FE_IRQ_RX] = platform_get_irq_byname(pdev, "rx");
> +	if (eth->irq[MTK_FE_IRQ_TX] >= 0 && eth->irq[MTK_FE_IRQ_RX] >= 0)
>  		return 0;
>  
>  	/* legacy way:
> @@ -3353,9 +3353,9 @@ static int mtk_get_irqs(struct platform_device *pdev, struct mtk_eth *eth)
>  	 * On SoCs with non-shared IRQs the first entry is not used,
>  	 * the second is for TX, and the third is for RX.
>  	 */
> -	for (i = 0; i < 3; i++) {
> +	for (i = 0; i < MTK_FE_IRQ_NUM; i++) {
>  		if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT) && i > 0)
> -			eth->irq[i] = eth->irq[0];
> +			eth->irq[i] = eth->irq[MTK_FE_IRQ_SHARED];
>  		else
>  			eth->irq[i] = platform_get_irq(pdev, i);
>  
> @@ -3421,7 +3421,7 @@ static void mtk_poll_controller(struct net_device *dev)
>  
>  	mtk_tx_irq_disable(eth, MTK_TX_DONE_INT);
>  	mtk_rx_irq_disable(eth, eth->soc->rx.irq_done_mask);
> -	mtk_handle_irq_rx(eth->irq[2], dev);
> +	mtk_handle_irq_rx(eth->irq[MTK_FE_IRQ_RX], dev);
>  	mtk_tx_irq_enable(eth, MTK_TX_DONE_INT);
>  	mtk_rx_irq_enable(eth, eth->soc->rx.irq_done_mask);
>  }
> @@ -4907,7 +4907,7 @@ static int mtk_add_mac(struct mtk_eth *eth, struct device_node *np)
>  	eth->netdev[id]->features |= eth->soc->hw_features;
>  	eth->netdev[id]->ethtool_ops = &mtk_ethtool_ops;
>  
> -	eth->netdev[id]->irq = eth->irq[0];
> +	eth->netdev[id]->irq = eth->irq[MTK_FE_IRQ_SHARED];
>  	eth->netdev[id]->dev.of_node = np;
>  
>  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SOC_MT7628))
> @@ -5184,17 +5184,17 @@ static int mtk_probe(struct platform_device *pdev)
>  	}
>  
>  	if (MTK_HAS_CAPS(eth->soc->caps, MTK_SHARED_INT)) {
> -		err = devm_request_irq(eth->dev, eth->irq[0],
> +		err = devm_request_irq(eth->dev, eth->irq[MTK_FE_IRQ_SHARED],
>  				       mtk_handle_irq, 0,
>  				       dev_name(eth->dev), eth);
>  	} else {
> -		err = devm_request_irq(eth->dev, eth->irq[1],
> +		err = devm_request_irq(eth->dev, eth->irq[MTK_FE_IRQ_TX],
>  				       mtk_handle_irq_tx, 0,
>  				       dev_name(eth->dev), eth);
>  		if (err)
>  			goto err_free_dev;
>  
> -		err = devm_request_irq(eth->dev, eth->irq[2],
> +		err = devm_request_irq(eth->dev, eth->irq[MTK_FE_IRQ_RX],
>  				       mtk_handle_irq_rx, 0,
>  				       dev_name(eth->dev), eth);
>  	}
> @@ -5240,7 +5240,7 @@ static int mtk_probe(struct platform_device *pdev)
>  		} else
>  			netif_info(eth, probe, eth->netdev[i],
>  				   "mediatek frame engine at 0x%08lx, irq %d\n",
> -				   eth->netdev[i]->base_addr, eth->irq[0]);
> +				   eth->netdev[i]->base_addr, eth->irq[MTK_FE_IRQ_SHARED]);
>  	}
>  
>  	/* we run 2 devices on the same DMA ring so we need a dummy device
> diff --git a/drivers/net/ethernet/mediatek/mtk_eth_soc.h b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> index 6f72a8c8ae1e..8cdf1317dff5 100644
> --- a/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> +++ b/drivers/net/ethernet/mediatek/mtk_eth_soc.h
> @@ -642,6 +642,11 @@
>  
>  #define MTK_MAC_FSM(x)		(0x1010C + ((x) * 0x100))
>  
> +#define MTK_FE_IRQ_SHARED	0
> +#define MTK_FE_IRQ_TX		1
> +#define MTK_FE_IRQ_RX		2
> +#define MTK_FE_IRQ_NUM		(MTK_FE_IRQ_RX + 1)
> +
>  struct mtk_rx_dma {
>  	unsigned int rxd1;
>  	unsigned int rxd2;
> @@ -1292,7 +1297,7 @@ struct mtk_eth {
>  	struct net_device		*dummy_dev;
>  	struct net_device		*netdev[MTK_MAX_DEVS];
>  	struct mtk_mac			*mac[MTK_MAX_DEVS];
> -	int				irq[3];
> +	int				irq[MTK_FE_IRQ_NUM];
>  	u32				msg_enable;
>  	unsigned long			sysclk;
>  	struct regmap			*ethsys;
> -- 
> 2.43.0
> 

