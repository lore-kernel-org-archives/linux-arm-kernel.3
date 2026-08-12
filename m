Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9184C5CFEE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Aug 2026 09:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fR/0/3r75v+yGcETdlibeuFDJ1BCATQCLysdpwrh1jA=; b=sleOVirzOjqvuMA/6LmpyS5OYM
	e8wbENaOEHythosD/Zy4gti7N1QH7OlE9P0SL3a3APwV8GFZSugSxEgvf5b7wPeaXhCg9UhQy0nk9
	7o2LlxASzs0mtVQiwkqDjhdcZGQ8oTKgljepwztFp/3nijSwv+bff2LCcxNjGhaGKtEbZWA4DjITE
	SkdVmYVEQK2phHBgEGV7jT01Y1Errrw8C1JdnLLK9xATA1lTeEBvCUXf8wZW5/ObQppFOsi/CAnps
	dA4jFLhNu7hq5L1rvUZpBywH/YLNxSX1Upk32D5i63qHRZ7yB+bYaTi56kagi1UGbniZYAsBkvj4P
	z5mKuj3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zN-0000000FhUt-1wlO;
	Wed, 12 Aug 2026 09:11:09 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wu4zH-0000000FhRu-0CO2
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Aug 2026 09:11:05 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 71F061A15B2;
	Wed, 12 Aug 2026 09:10:58 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 3C1BA6045E;
	Wed, 12 Aug 2026 09:10:58 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id DA17E11C4CA6C;
	Wed, 12 Aug 2026 11:10:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1786525853; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=fR/0/3r75v+yGcETdlibeuFDJ1BCATQCLysdpwrh1jA=;
	b=gNL6sxA3B+IRcmagFuObaR94seeu7ukHGj5mkwtV3TpolLpK7uWRt+/NLgmPtq+R2qD0Qn
	1FINO+d5RSmrwax08yrxcJ5bBPPuEs3bHsmCEdnqeeVj0LJ4sUdjj4jYD4US6gR5TCCGrt
	w2JEdoZv1WwFtEqyxV1U3Z7L5OFS3h5SS0m2a1uNxfyaY8Xuvtm77GNs7aOOHl0FuLxsR+
	WRmSJF+DZkH3NAwIf8jJ2nQTgyv4wMqHsZWwneCZmQTcGIAuIkNrQtkCuyMvP8R8aF2urS
	q57zlWp2buAb6HzhoNHW7xvxm2FotSbYNsRZFRkpw9VMTbx7Sp9awszhA1vwog==
Message-ID: <b3d90606-781a-4055-8529-e68e22a45ce9@bootlin.com>
Date: Wed, 12 Aug 2026 11:10:45 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next v2] net: stmmac: dwxgmac2: add XGMAC timestamp
 interrupt support
To: Zxyan Zhu <zxyan0222@gmail.com>, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, andrew+netdev@lunn.ch, richardcochran@gmail.com
Cc: davem@davemloft.net, edumazet@google.com, kuba@kernel.org,
 pabeni@redhat.com, netdev@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260810100221.9166-1-zxyan0222@gmail.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20260810100221.9166-1-zxyan0222@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260812_021103_633605_048DE038 
X-CRM114-Status: GOOD (  29.38  )
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

On 8/10/26 12:02, Zxyan Zhu wrote:
> DWXGMAC2 uses XGMAC_TIMESTAMP_STATUS at offset 0xd20, while the
> generic stmmac PTP handler reads the dwmac4 offset GMAC_TIMESTAMP_STATUS
> (0xb20).  Before this change, the DWXGMAC2 and DWXLGMAC2 hwif entries
> used &stmmac_ptp, whose timestamp_interrupt callback read the wrong
> register and whose config_hw_tstamping callback never enabled the
> XGMAC timestamp interrupt (XGMAC_TSIE was not in XGMAC_INT_DEFAULT_EN).
> As a result, auxiliary snapshot events were never reported on XGMAC
> platforms.
> 
> Add a dedicated DWXGMAC2 timestamp interrupt handler that:
> - reads XGMAC_TIMESTAMP_STATUS before checking
>   STMMAC_FLAG_EXT_SNAPSHOT_EN, so that the timestamp interrupt status is
>   cleared even when auxiliary snapshots are disabled
> - derives the pending auxiliary snapshot count from the persistent
>   ATSNS field instead of the transient AUXTSTRIG status bit
> - generates the corresponding PTP_CLOCK_EXTTS events
> 
> Also enable XGMAC_TSIE in XGMAC_INT_DEFAULT_EN and hook the new
> handler into the DWXGMAC2 and DWXLGMAC2 hwif entries.
> 
> Signed-off-by: Zxyan Zhu <zxyan0222@gmail.com>

If there's an interrupt storm, then this should probably be a fix for -net
with a Fixes tag.

Maxime

> ---
> v1: https://lore.kernel.org/netdev/20260806-dwxgmac2-timestamp-irq-v1-1-c051c79c9d90@gmail.com/
> v2:
> - reads XGMAC_TIMESTAMP_STATUS before checking
>   STMMAC_FLAG_EXT_SNAPSHOT_EN, so that the timestamp interrupt status is
>   cleared even when auxiliary snapshots are disabled.
> - Drop the unnecessary (u64) cast in dwxgmac2_get_mac_tx_timestamp().
> - Reword the changelog to describe the real problem: the generic handler
>   read the wrong register offset (0xb20 vs 0xd20) and the interrupt was
>   never enabled, so auxiliary snapshot reporting never worked on XGMAC.
> - Update the comment to clarify that TXTSC is cleared by
>   XGMAC_TXTIMESTAMP_SEC, not by XGMAC_TIMESTAMP_STATUS.
> ---
>  .../net/ethernet/stmicro/stmmac/dwxgmac2.h    |  2 +-
>  .../ethernet/stmicro/stmmac/dwxgmac2_core.c   | 43 +++++++++++++++++++
>  drivers/net/ethernet/stmicro/stmmac/hwif.c    |  4 +-
>  drivers/net/ethernet/stmicro/stmmac/hwif.h    |  1 +
>  .../ethernet/stmicro/stmmac/stmmac_hwtstamp.c | 12 ++++++
>  .../net/ethernet/stmicro/stmmac/stmmac_ptp.h  |  1 +
>  6 files changed, 60 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> index 61b6d45a02f5..76e2860a9517 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h
> @@ -87,7 +87,7 @@
>  #define XGMAC_TSIE			BIT(12)
>  #define XGMAC_LPIIE			BIT(5)
>  #define XGMAC_PMTIE			BIT(4)
> -#define XGMAC_INT_DEFAULT_EN		(XGMAC_LPIIE | XGMAC_PMTIE)
> +#define XGMAC_INT_DEFAULT_EN		(XGMAC_LPIIE | XGMAC_PMTIE | XGMAC_TSIE)
>  #define XGMAC_Qx_TX_FLOW_CTRL(x)	(0x00000070 + (x) * 4)
>  #define XGMAC_PT			GENMASK(31, 16)
>  #define XGMAC_TFE			BIT(1)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> index f02b434bbd50..b849cebf9b29 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwxgmac2_core.c
> @@ -1154,6 +1154,49 @@ static int dwxgmac2_get_mac_tx_timestamp(struct mac_device_info *hw, u64 *ts)
>  	return 0;
>  }
>  
> +void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv)
> +{
> +	u32 ts_status, pending_snapshots, acr_value, channel;
> +	struct ptp_clock_event event;
> +	unsigned long flags;
> +	u64 ptp_time;
> +	int i;
> +
> +	/* Read XGMAC_TIMESTAMP_STATUS to get the AUX snapshot
> +	 * count.  This read also clears the TSIS bit in
> +	 * XGMAC_INT_STATUS.
> +	 * TX timestamp polling may have already cleared TSIS
> +	 * and AUXTSTRIG, so rely on ATSNS instead.
> +	 * TXTSC is cleared by XGMAC_TXTIMESTAMP_SEC, not by
> +	 * this register, so there is no conflict.
> +	 */
> +	ts_status = readl(priv->ioaddr + XGMAC_TIMESTAMP_STATUS);
> +
> +	if (!(priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN))
> +		return;
> +
> +	pending_snapshots = FIELD_GET(XGMAC_TIMESTAMP_ATSNS_MASK, ts_status);
> +	if (!pending_snapshots)
> +		return;
> +
> +	acr_value = readl(priv->ptpaddr + PTP_ACR);
> +	channel = FIELD_GET(PTP_ACR_MASK, acr_value);
> +	if (!channel)
> +		return;
> +	channel = ilog2(channel);
> +
> +	for (i = 0; i < pending_snapshots; i++) {
> +		read_lock_irqsave(&priv->ptp_lock, flags);
> +		stmmac_get_ptptime(priv, priv->ptpaddr, &ptp_time);
> +		read_unlock_irqrestore(&priv->ptp_lock, flags);
> +
> +		event.type = PTP_CLOCK_EXTTS;
> +		event.index = channel;
> +		event.timestamp = ptp_time;
> +		ptp_clock_event(priv->ptp_clock, &event);
> +	}
> +}
> +
>  static int dwxgmac2_flex_pps_config(void __iomem *ioaddr, int index,
>  				    struct stmmac_pps_cfg *cfg, bool enable,
>  				    u32 sub_second_inc, u32 systime_flags)
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.c b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> index 511b0fd5e834..9718582b8480 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.c
> @@ -258,7 +258,7 @@ static const struct stmmac_hwif_entry {
>  		.dma = &dwxgmac210_dma_ops,
>  		.mac = &dwxgmac210_ops,
>  		.vlan = &dwxgmac210_vlan_ops,
> -		.hwtimestamp = &stmmac_ptp,
> +		.hwtimestamp = &dwxgmac2_ptp,
>  		.ptp = &stmmac_ptp_clock_ops,
>  		.mode = NULL,
>  		.tc = &dwmac510_tc_ops,
> @@ -280,7 +280,7 @@ static const struct stmmac_hwif_entry {
>  		.dma = &dwxgmac210_dma_ops,
>  		.mac = &dwxlgmac2_ops,
>  		.vlan = &dwxlgmac2_vlan_ops,
> -		.hwtimestamp = &stmmac_ptp,
> +		.hwtimestamp = &dwxgmac2_ptp,
>  		.ptp = &stmmac_ptp_clock_ops,
>  		.mode = NULL,
>  		.tc = &dwmac510_tc_ops,
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index e6317b94fff7..818ab3daa91c 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -671,6 +671,7 @@ extern const struct stmmac_desc_ops ndesc_ops;
>  
>  extern const struct stmmac_hwtimestamp stmmac_ptp;
>  extern const struct stmmac_hwtimestamp dwmac1000_ptp;
> +extern const struct stmmac_hwtimestamp dwxgmac2_ptp;
>  
>  extern const struct stmmac_mode_ops ring_mode_ops;
>  extern const struct stmmac_mode_ops chain_mode_ops;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> index b9a985fa772c..9d7d24259abd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_hwtstamp.c
> @@ -277,3 +277,15 @@ const struct stmmac_hwtimestamp dwmac1000_ptp = {
>  	.get_ptptime = dwmac1000_get_ptptime,
>  	.timestamp_interrupt = dwmac1000_timestamp_interrupt,
>  };
> +
> +const struct stmmac_hwtimestamp dwxgmac2_ptp = {
> +	.config_hw_tstamping = config_hw_tstamping,
> +	.init_systime = init_systime,
> +	.config_sub_second_increment = config_sub_second_increment,
> +	.config_addend = config_addend,
> +	.adjust_systime = adjust_systime,
> +	.get_systime = get_systime,
> +	.get_ptptime = get_ptptime,
> +	.timestamp_interrupt = dwxgmac2_timestamp_interrupt,
> +	.hwtstamp_correct_latency = hwtstamp_correct_latency,
> +};
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
> index 3fe0e3a80e80..dade09614163 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.h
> @@ -103,6 +103,7 @@ int dwmac1000_ptp_enable(struct ptp_clock_info *ptp,
>  
>  void dwmac1000_get_ptptime(void __iomem *ptpaddr, u64 *ptp_time);
>  void dwmac1000_timestamp_interrupt(struct stmmac_priv *priv);
> +void dwxgmac2_timestamp_interrupt(struct stmmac_priv *priv);
>  
>  extern const struct ptp_clock_info stmmac_ptp_clock_ops;
>  extern const struct ptp_clock_info dwmac1000_ptp_clock_ops;


