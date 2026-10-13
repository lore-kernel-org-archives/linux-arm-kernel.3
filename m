Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D741CC6B03
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Oct 2026 12:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b35gyqtypMMfbLXDKU179g34nu1XmunQVKn+LDLfT4Y=; b=4d1mt2PCoezlCaJ2F8Y67k7ixz
	U0Vxn8J03mPsCkLpxeMnMOhMj1ccB+KqoRbRFuKeaac0oRHxgq+NRr3L0uv3/igvD7leJ2mZrEFnQ
	cSIhMlADslgeY7fU4jEgk3DLeCKtVvC2hONBXaNvklFxYPsx+uVj5nUZR6ewXQvCpJOj7VMlE69vF
	C7v1cTR37BMH169s0icfG84nLXKbhTLoHWH97InFa4b8tBOSCaU5lanZNQqwA/7jXStVnkQW1tLEr
	wP1YOMF6ht6fyAyITLrTn3d2IQPXbDrhgelWnkhao2fkCAMqX1iG34/UDhRZQN4FhiCUUB3qdRoiU
	ab7a1Vlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbtC-0000000Cr1f-2DlJ;
	Tue, 13 Oct 2026 12:45:54 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGbt9-0000000Cr0X-1lHP
	for linux-arm-kernel@lists.infradead.org;
	Tue, 13 Oct 2026 12:45:52 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id A693F1A11FE;
	Tue, 13 Oct 2026 12:45:47 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 708AB60362;
	Tue, 13 Oct 2026 12:45:47 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 48F3C11D7117D;
	Tue, 13 Oct 2026 14:45:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1791895546; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=b35gyqtypMMfbLXDKU179g34nu1XmunQVKn+LDLfT4Y=;
	b=luxXCgWp9wH3wbc1Nno+EuCfsV4mY2cUXjBcb+yfFmV+yijxiOYbZGvJxwys2PWin8ofek
	abIe2l/NMdiuYD4DtHYPxnW2LB3UuTnQyr7xUK6GrmwmmvWkk1fIJnagUn6ZDVbQ/tIJJI
	7yLlXpXJ+G+w1tZR6X3863NJnRIcR/aXDLm3/wpFY1uK4xyp0GY4/uKwLk9ZE8P2uylwkJ
	51K96yUWUVCK15nnjG95GqnYhFGz+CmHvhn6tHbOf2f2KOVPCN/wcmtVmQrND0yCRzFzZw
	qmxM9tw/5lQ3NKiNoSW9Qj7sCWpZU2oOslw1lurWccatsu511RDqyrg7fBhKdg==
Message-ID: <73ae9104-a79f-4369-a3da-245db11be834@bootlin.com>
Date: Tue, 13 Oct 2026 14:45:43 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net 1/2] net: stmmac: Track the TX DMA threshold per queue
To: Ovidiu Panait <ovidiu.panait.rb@renesas.com>, andrew+netdev@lunn.ch,
 davem@davemloft.net, edumazet@kernel.org, kuba@kernel.org,
 pabeni@redhat.com, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 xiaoliang.yang_1@nxp.com
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20261013114503.57487-1-ovidiu.panait.rb@renesas.com>
 <20261013114503.57487-2-ovidiu.panait.rb@renesas.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261013114503.57487-2-ovidiu.panait.rb@renesas.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261013_054551_617099_27AF399E 
X-CRM114-Status: GOOD (  26.20  )
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

Hi,

On 10/13/26 13:45, Ovidiu Panait wrote:
> Commit 3a6c12a0c6c3 ("net: stmmac: bump tc when get underflow error from
> DMA descriptor") made dwmac4 raise the DMA threshold of the queues that
> report TX underflows. This is done by incrementing a module global
> parameter 'tc' by 64 on each underflow.
> 
> This leads to inconsistent TX DMA thresholds between queues and causes
> issues on platforms with multiple stmmac controllers, as 'tc' is shared
> by all of them. Once 'tc' goes over 256 the bumping stops, and queues
> that did not underflow before are left at the initial threshold.
> 
> On the Renesas RZ/V2H platform, which has two dwmac4 controllers, we
> observed sporadic iperf3 TCP TX failures:
> 
>   iperf3 -c <server> -t5 --bind-dev end1
>   ...
>   [  5]   0.00-5.00   sec  1.00 MBytes  1.68 Mbits/sec   87       sender
>   [  5]   0.00-5.00   sec   768 KBytes  1.26 Mbits/sec            receiver
> 
> This happens because the TX queues of end1 were underflowing on a large
> fraction of the packets, but the DMA TX threshold was never raised from
> the default of 64 bytes. The threshold was not raised because end0
> had underflowed first and had already pushed 'tc' past 256. Which
> controller is affected depends on which one underflows first.
> 
> To fix this, make the TX DMA threshold per queue instead of global.
> Each time an underflow happens on a queue, its TX DMA threshold gets
> incremented, without affecting other queues or controllers. With this
> change, 'tc' is only used as the initial value, and the RX threshold
> is no longer bumped together with the TX one, as TX underflows have
> nothing to do with the RX side.
> 
> Fixes: 3a6c12a0c6c3 ("net: stmmac: bump tc when get underflow error from DMA descriptor")
> Signed-off-by: Ovidiu Panait <ovidiu.panait.rb@renesas.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/stmmac.h  |  1 +
>  .../net/ethernet/stmicro/stmmac/stmmac_main.c | 33 +++++++++++--------
>  2 files changed, 21 insertions(+), 13 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac.h b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> index 9278378407e8..85d63450693e 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac.h
> @@ -270,6 +270,7 @@ struct stmmac_priv {
>  	bool sph_capable;
>  	u32 sarc_type;
>  	u32 rx_riwt[MTL_MAX_RX_QUEUES];
> +	u32 tx_threshold[MTL_MAX_TX_QUEUES];
>  	int hwts_rx_en;
>  	bool tsfupdt_coarse;
>  
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> index b8b4de4c5b1a..b5ee0f297df6 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_main.c
> @@ -2622,7 +2622,6 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
>  	}
>  
>  	if (priv->plat->force_thresh_dma_mode) {
> -		txmode = tc;
>  		rxmode = tc;
>  	} else if (priv->plat->force_sf_dma_mode || priv->plat->tx_coe) {
>  		/*
> @@ -2636,7 +2635,6 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
>  		rxmode = SF_DMA_MODE;
>  		priv->xstats.threshold = SF_DMA_MODE;
>  	} else {
> -		txmode = tc;
>  		rxmode = SF_DMA_MODE;
>  	}
>  
> @@ -2655,8 +2653,11 @@ static void stmmac_dma_operation_mode(struct stmmac_priv *priv)
>  	for (chan = 0; chan < tx_channels_count; chan++) {
>  		qmode = priv->plat->tx_queues_cfg[chan].mode_to_use;
>  
> -		stmmac_dma_tx_mode(priv, priv->ioaddr, txmode, chan,
> -				txfifosz, qmode);
> +		if (txmode == SF_DMA_MODE)
> +			priv->tx_threshold[chan] = SF_DMA_MODE;
> +
> +		stmmac_dma_tx_mode(priv, priv->ioaddr, priv->tx_threshold[chan],
> +				   chan, txfifosz, qmode);
>  	}
>  }
>  
> @@ -2822,17 +2823,20 @@ static bool stmmac_xdp_xmit_zc(struct stmmac_priv *priv, u32 queue, u32 budget)
>  
>  static void stmmac_bump_dma_threshold(struct stmmac_priv *priv, u32 chan)
>  {
> -	if (unlikely(priv->xstats.threshold != SF_DMA_MODE) && tc <= 256) {
> -		tc += 64;
> +	u32 thresh = priv->tx_threshold[chan];
>  
> -		if (priv->plat->force_thresh_dma_mode)
> -			stmmac_set_dma_operation_mode(priv, tc, tc, chan);
> -		else
> -			stmmac_set_dma_operation_mode(priv, tc, SF_DMA_MODE,
> -						      chan);
> +	if (unlikely(thresh == SF_DMA_MODE) || thresh > 256)
> +		return;
>  
> -		priv->xstats.threshold = tc;
> -	}
> +	thresh += 64;
> +
> +	if (priv->plat->force_thresh_dma_mode)
> +		stmmac_set_dma_operation_mode(priv, thresh, tc, chan);
> +	else
> +		stmmac_set_dma_operation_mode(priv, thresh, SF_DMA_MODE, chan);
> +
> +	priv->tx_threshold[chan] = thresh;
> +	priv->xstats.threshold = thresh;
>  }
>  
>  /**
> @@ -8133,6 +8137,9 @@ static int __stmmac_dvr_probe(struct device *device,
>  
>  	priv->xstats.threshold = tc;
>  
> +	for (i = 0; i < MTL_MAX_TX_QUEUES; i++)
> +		priv->tx_threshold[i] = tc;
> +
>  	/* Initialize RSS */
>  	rxq = priv->plat->rx_queues_to_use;
>  	netdev_rss_key_fill(priv->rss.key, sizeof(priv->rss.key));


