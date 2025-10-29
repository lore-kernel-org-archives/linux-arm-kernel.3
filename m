Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31960CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 09:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v7pPSxVjfFnZqAxMJ+sGIAdHaQdsCPSzUAxM2mL0tpI=; b=eunpEK6vRKKU0q9fkSVHN66WEG
	XyECP1uB91FwjKuX+V62PAu+3rcRuCnfuhEUuBrgNu2jw90YF4Et6YjQYaEpl7so9lZhEkoCPHebZ
	J5aYU4zKFBKVZeRNbZDeKL6//CHxxHGeRI721N5fDYVy5uDqtsTUvGeRdpDsTH3GACWBZfeqQ0c6H
	jThuI5sF+K2oIpC6ajZ7S+sxRDzxWQbWs8KVThJquIuYg6ZCx76DzHxRnkU6wmeO5G/twA6o5vRto
	gRsnWB/kDNbg8l7AebzYe49iU9kTKz9Ye8GqBuHSqqbdjuo1IzKVmD8uSCu18QT9FsmE2Ktk/r0t6
	BAMX/wUw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2pW-00000000ZpX-3mMd;
	Wed, 29 Oct 2025 09:50:58 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vE2pU-00000000Znm-1nli
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Oct 2025 09:50:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id C49AC1A1730;
	Wed, 29 Oct 2025 09:50:52 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 90DAD606E8;
	Wed, 29 Oct 2025 09:50:52 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id BB9BC117F1CA5;
	Wed, 29 Oct 2025 10:50:44 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1761731451; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=v7pPSxVjfFnZqAxMJ+sGIAdHaQdsCPSzUAxM2mL0tpI=;
	b=C+PZLcyx1AOma7VJkAQZZamM3jX0cbRO4grqIhfRtY0kvo5ln8ZWYiWvTgboKjYp9RMqfg
	poaMjO7bu0CGfHkOk38U8B7R4yUd22FZ8AmaZ9I2fX//KKHxZCWPmbBN/+vWw0dQjNj+uj
	ILvXecH/0NwNl6DlXhTRJ9wQLgH+V6wpOMOF4Svro3oi7qO9xgFYQtn2Sk+7cIomj6kH12
	Ug/luwRNYTG5xGpnE+dCfPieMpaEh63NLKN7Jwk8kq1hyf/Szizz5tZc/daHaF/UOb0CMB
	n38t5nT3aFmSgS0VPfmm9S0POfEqGfCLqQPi/sN8/Xr8+rM7tEmtm/2gyrzT/A==
Message-ID: <07589613-8567-4e14-b17a-a8dd04f3098c@bootlin.com>
Date: Wed, 29 Oct 2025 10:50:44 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net-next 4/4] net: stmmac: socfpga: Add hardware supported
 cross-timestamp
To: rohan.g.thomas@altera.com, Andrew Lunn <andrew+netdev@lunn.ch>,
 "David S. Miller" <davem@davemloft.net>, Eric Dumazet <edumazet@google.com>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
Cc: netdev@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251029-agilex5_ext-v1-0-1931132d77d6@altera.com>
 <20251029-agilex5_ext-v1-4-1931132d77d6@altera.com>
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
Content-Language: en-US
In-Reply-To: <20251029-agilex5_ext-v1-4-1931132d77d6@altera.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_025056_627148_CC8BA811 
X-CRM114-Status: GOOD (  25.90  )
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

Hi Rohan,

On 29/10/2025 09:06, Rohan G Thomas via B4 Relay wrote:
> From: Rohan G Thomas <rohan.g.thomas@altera.com>
> 
> Cross timestamping is supported on Agilex5 platform with Synchronized
> Multidrop Timestamp Gathering(SMTG) IP. The hardware cross-timestamp
> result is made available the applications through the ioctl call
> PTP_SYS_OFFSET_PRECISE, which inturn calls stmmac_getcrosststamp().
> 
> Device time is stored in the MAC Auxiliary register. The 64-bit System
> time (ARM_ARCH_COUNTER) is stored in SMTG IP. SMTG IP is an MDIO device
> with 0xC - 0xF MDIO register space holds 64-bit system time.
> 
> This commit is similar to following commit for Intel platforms:
> Commit 341f67e424e5 ("net: stmmac: Add hardware supported cross-timestamp")
> 
> Signed-off-by: Rohan G Thomas <rohan.g.thomas@altera.com>
> ---
>  .../net/ethernet/stmicro/stmmac/dwmac-socfpga.c    | 125 +++++++++++++++++++++
>  drivers/net/ethernet/stmicro/stmmac/dwxgmac2.h     |   5 +
>  2 files changed, 130 insertions(+)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> index 37fcf272a46920d1d97a4b651a469767609373b4..d36c9b77003ef4ad3ac598929fee3f7a8b94b9bc 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-socfpga.c
> @@ -5,6 +5,7 @@
>   */
>  
>  #include <linux/mfd/altera-sysmgr.h>
> +#include <linux/clocksource_ids.h>
>  #include <linux/of.h>
>  #include <linux/of_address.h>
>  #include <linux/of_net.h>
> @@ -15,8 +16,10 @@
>  #include <linux/reset.h>
>  #include <linux/stmmac.h>
>  
> +#include "dwxgmac2.h"
>  #include "stmmac.h"
>  #include "stmmac_platform.h"
> +#include "stmmac_ptp.h"
>  
>  #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_GMII_MII 0x0
>  #define SYSMGR_EMACGRP_CTRL_PHYSEL_ENUM_RGMII 0x1
> @@ -41,6 +44,13 @@
>  #define SGMII_ADAPTER_ENABLE		0x0000
>  #define SGMII_ADAPTER_DISABLE		0x0001
>  
> +#define SMTG_MDIO_ADDR		0x15
> +#define SMTG_TSC_WORD0		0xC
> +#define SMTG_TSC_WORD1		0xD
> +#define SMTG_TSC_WORD2		0xE
> +#define SMTG_TSC_WORD3		0xF
> +#define SMTG_TSC_SHIFT		16
> +
>  struct socfpga_dwmac;
>  struct socfpga_dwmac_ops {
>  	int (*set_phy_mode)(struct socfpga_dwmac *dwmac_priv);
> @@ -269,6 +279,117 @@ static int socfpga_set_phy_mode_common(int phymode, u32 *val)
>  	return 0;
>  }
>  
> +static void get_smtgtime(struct mii_bus *mii, int smtg_addr, u64 *smtg_time)
> +{
> +	u64 ns;
> +
> +	ns = mdiobus_read(mii, smtg_addr, SMTG_TSC_WORD3);
> +	ns <<= SMTG_TSC_SHIFT;
> +	ns |= mdiobus_read(mii, smtg_addr, SMTG_TSC_WORD2);
> +	ns <<= SMTG_TSC_SHIFT;
> +	ns |= mdiobus_read(mii, smtg_addr, SMTG_TSC_WORD1);
> +	ns <<= SMTG_TSC_SHIFT;
> +	ns |= mdiobus_read(mii, smtg_addr, SMTG_TSC_WORD0);
> +
> +	*smtg_time = ns;
> +}
> +
> +static int dwxgmac_cross_ts_isr(struct stmmac_priv *priv)
> +{
> +	return (readl(priv->ioaddr + XGMAC_INT_STATUS) & XGMAC_INT_TSIS);
> +}
> +
> +static int smtg_crosststamp(ktime_t *device, struct system_counterval_t *system,
> +			    void *ctx)
> +{
> +	struct stmmac_priv *priv = (struct stmmac_priv *)ctx;
> +	u32 num_snapshot, gpio_value, acr_value;
> +	void __iomem *ptpaddr = priv->ptpaddr;
> +	void __iomem *ioaddr = priv->hw->pcsr;
> +	unsigned long flags;
> +	u64 smtg_time = 0;
> +	u64 ptp_time = 0;
> +	int i, ret;
> +
> +	/* Both internal crosstimestamping and external triggered event
> +	 * timestamping cannot be run concurrently.
> +	 */
> +	if (priv->plat->flags & STMMAC_FLAG_EXT_SNAPSHOT_EN)
> +		return -EBUSY;
> +
> +	mutex_lock(&priv->aux_ts_lock);
> +	/* Enable Internal snapshot trigger */
> +	acr_value = readl(ptpaddr + PTP_ACR);
> +	acr_value &= ~PTP_ACR_MASK;
> +	switch (priv->plat->int_snapshot_num) {
> +	case AUX_SNAPSHOT0:
> +		acr_value |= PTP_ACR_ATSEN0;
> +		break;
> +	case AUX_SNAPSHOT1:
> +		acr_value |= PTP_ACR_ATSEN1;
> +		break;
> +	case AUX_SNAPSHOT2:
> +		acr_value |= PTP_ACR_ATSEN2;
> +		break;
> +	case AUX_SNAPSHOT3:
> +		acr_value |= PTP_ACR_ATSEN3;
> +		break;
> +	default:
> +		mutex_unlock(&priv->aux_ts_lock);
> +		return -EINVAL;
> +	}
> +	writel(acr_value, ptpaddr + PTP_ACR);
> +
> +	/* Clear FIFO */
> +	acr_value = readl(ptpaddr + PTP_ACR);
> +	acr_value |= PTP_ACR_ATSFC;
> +	writel(acr_value, ptpaddr + PTP_ACR);
> +	/* Release the mutex */
> +	mutex_unlock(&priv->aux_ts_lock);
> +
> +	/* Trigger Internal snapshot signal. Create a rising edge by just toggle
> +	 * the GPO0 to low and back to high.
> +	 */
> +	gpio_value = readl(ioaddr + XGMAC_GPIO_STATUS);
> +	gpio_value &= ~XGMAC_GPIO_GPO0;
> +	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
> +	gpio_value |= XGMAC_GPIO_GPO0;
> +	writel(gpio_value, ioaddr + XGMAC_GPIO_STATUS);
> +
> +	/* Time sync done Indication - Interrupt method */
> +	if (!wait_event_interruptible_timeout(priv->tstamp_busy_wait,
> +					      dwxgmac_cross_ts_isr(priv),
> +					      HZ / 100)) {
> +		priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
> +		return -ETIMEDOUT;

Don't you need to set priv->plat->flags |= STMMAC_FLAG_INT_SNAPSHOT_EN first?
Otherwise, timestamp_interrupt() in stmmac_hwtstamp() won't call wake_up()
on the wait_queue.

> +	}
> +
> +	*system = (struct system_counterval_t) {
> +		.cycles = 0,
> +		.cs_id = CSID_ARM_ARCH_COUNTER,
> +		.use_nsecs = true,
> +	};
> +
> +	num_snapshot = (readl(ioaddr + XGMAC_TIMESTAMP_STATUS) &
> +			XGMAC_TIMESTAMP_ATSNS_MASK) >>
> +			XGMAC_TIMESTAMP_ATSNS_SHIFT;
> +
> +	/* Repeat until the timestamps are from the FIFO last segment */
> +	for (i = 0; i < num_snapshot; i++) {
> +		read_lock_irqsave(&priv->ptp_lock, flags);
> +		stmmac_get_ptptime(priv, ptpaddr, &ptp_time);
> +		*device = ns_to_ktime(ptp_time);
> +		read_unlock_irqrestore(&priv->ptp_lock, flags);
> +	}
> +
> +	get_smtgtime(priv->mii, SMTG_MDIO_ADDR, &smtg_time);
> +	system->cycles = smtg_time;
> +
> +	priv->plat->flags &= ~STMMAC_FLAG_INT_SNAPSHOT_EN;
> +
> +	return ret;
> +}

Maxime

