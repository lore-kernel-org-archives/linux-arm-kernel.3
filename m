Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 80821606A31C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 29 Oct 2026 08:09:32 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=U9LE0vHA;
	dkim=pass (2048-bit key, unprotected) header.d=bootlin.com header.i=@bootlin.com header.a=rsa-sha256 header.s=dkim header.b=Zvg33d27
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=SIToZkKJiTtocWGYYd40RoA4lGJhq2+ecl7+6P+eM1U=; b=U9LE0vHA1V0EB1
	CqosrlycqlbCvV7xo5LiJ3yMkh8cSPnP2R/uAlFrH0vGt0LYZhDsRsO8ujYP6gxGnatubuWglkgE4
	3pcSj9Ihf6pVjYjDwi6UuCwiAC2bpyXaUfjJ769neRNF8wQ3uw5a0qA18MSzeOI7lV8E0ftw5li5a
	cgJoDxEbjcevVbFgY3b5IypF9sE9aLzJL7/bomEfy77YwCo13IRiKWu/UUVPA7RuY9b430fxgc6Qf
	d+F2i2mmrKjwTzp8Ljdxjjh9aX80XPL26Cw5cE1gppkN9cBiZfH6m5egALmhNfsft2FID8WpKXPvf
	zy3SSiGv3rXq5vt2Bzuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLCP-00000008gFS-38f6;
	Thu, 29 Oct 2026 08:09:25 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMLCM-00000008gEg-0YhP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 29 Oct 2026 08:09:23 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id C21D5C4CBC2;
	Thu, 29 Oct 2026 08:10:20 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 7E29160360;
	Thu, 29 Oct 2026 08:09:18 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id B8C52103290D0;
	Thu, 29 Oct 2026 09:09:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1793261357; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:content-language:in-reply-to:references;
	bh=SIToZkKJiTtocWGYYd40RoA4lGJhq2+ecl7+6P+eM1U=;
	b=Zvg33d27e49cp7GF2v+hjaJmeasHG4kDoeNlNOWurUCseSJEtZ7HqOk8tEK1qk+8gxOlyQ
	GUgO8BAulmvU7Zlv1proWthMt0rk/kWiA+2L3BvWfdWtDmRxrT174ik6evleh9IR3oo7et
	mURYdbnEcaDdvEaeSQkBZ73c9Gte21dTY4Z3nDr/Sn/26Ny3LaOxRuaEly+6X+X+r0m9a+
	2+e3G8wjz1XY0pweycwgModFULQvVw974N7gCs/z8Yt9ZgzGyYic8QT1Bwfse5/DeA91Ue
	h2L0MEAu4l7+JEONfbn/uYzrZ6NiBavzNeDL8F+EelInmsnX7Uu7REOdriXGqw==
Message-ID: <29d6ab3e-be31-4d11-8060-85c1ced14387@bootlin.com>
Date: Thu, 29 Oct 2026 09:09:11 +0100
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH net v4 2/3] net: stmmac: pass the desired EST enable state
 to est_configure()
To: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>,
 Andrew Lunn <andrew+netdev@lunn.ch>, "David S. Miller"
 <davem@davemloft.net>, Eric Dumazet <edumazet@kernel.org>,
 Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>,
 Richard Cochran <richardcochran@gmail.com>,
 Russell King <linux@armlinux.org.uk>, Jose Abreu <Jose.Abreu@synopsys.com>,
 James Hilliard <james.hilliard1@gmail.com>
Cc: netdev@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20261026-stmmac-est-fixes-v4-0-999dac4de44f@oss.qualcomm.com>
 <20261026-stmmac-est-fixes-v4-2-999dac4de44f@oss.qualcomm.com>
Content-Language: en-US
From: Maxime Chevallier <maxime.chevallier@bootlin.com>
In-Reply-To: <20261026-stmmac-est-fixes-v4-2-999dac4de44f@oss.qualcomm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261029_010922_528542_2EC2564C 
X-CRM114-Status: GOOD (  20.27  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-17.4 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,USER_AGENT_SANE_1
	autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

On 10/26/26 17:55, Lorenzo Bianconi wrote:
> Pass the desired EST enable state explicitly to est_configure() instead
> of having it derive from cfg->enable. This decouples the hardware
> programming state from the priv->est->enable flag, which records whether
> the taprio offload is attached.
> 
> No functional change intended: the callers keep toggling
> priv->est->enable around the EST programming, as before.
> 
> Signed-off-by: Lorenzo Bianconi <lorenzo.bianconi@oss.qualcomm.com>

Reviewed-by: Maxime Chevallier <maxime.chevallier@bootlin.com>

Maxime

> ---
>  drivers/net/ethernet/stmicro/stmmac/hwif.h       | 2 +-
>  drivers/net/ethernet/stmicro/stmmac/stmmac_est.c | 6 +++---
>  drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c | 4 ++--
>  drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c  | 4 ++--
>  4 files changed, 8 insertions(+), 8 deletions(-)
> 
> diff --git a/drivers/net/ethernet/stmicro/stmmac/hwif.h b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> index 50b590d67d87..b28509555d81 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/hwif.h
> +++ b/drivers/net/ethernet/stmicro/stmmac/hwif.h
> @@ -620,7 +620,7 @@ struct stmmac_mmc_ops {
>  
>  struct stmmac_est_ops {
>  	int (*configure)(struct stmmac_priv *priv, struct stmmac_est *cfg,
> -			 unsigned int ptp_rate);
> +			 unsigned int ptp_rate, bool enable);
>  	void (*irq_status)(struct stmmac_priv *priv, struct net_device *dev,
>  			   struct stmmac_extra_stats *x, u32 txqcnt);
>  };
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
> index afc516059b89..f15d4d046aa7 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_est.c
> @@ -26,7 +26,7 @@ static int est_write(void __iomem *est_addr, u32 reg, u32 val, bool gcl)
>  }
>  
>  static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
> -			 unsigned int ptp_rate)
> +			 unsigned int ptp_rate, bool enable)
>  {
>  	void __iomem *est_addr = priv->estaddr;
>  	int i, ret = 0;
> @@ -62,7 +62,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
>  		ctrl |= ((NSEC_PER_SEC / ptp_rate) * EST_GMAC5_PTOV_MUL) <<
>  			 EST_GMAC5_PTOV_SHIFT;
>  	}
> -	if (cfg->enable)
> +	if (enable)
>  		ctrl |= EST_EEST | EST_SSWL | EST_DFBS;
>  	else
>  		ctrl &= ~EST_EEST;
> @@ -70,7 +70,7 @@ static int est_configure(struct stmmac_priv *priv, struct stmmac_est *cfg,
>  	writel(ctrl, est_addr + EST_CONTROL);
>  
>  	/* Configure EST interrupt */
> -	if (cfg->enable)
> +	if (enable)
>  		ctrl = EST_IECGCE | EST_IEHS | EST_IEHF | EST_IEBE | EST_IECC;
>  	else
>  		ctrl = 0;
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> index e54a3c887826..9a32af00d7d2 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_ptp.c
> @@ -74,7 +74,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
>  		mutex_lock(&priv->est_lock);
>  		priv->est->enable = false;
>  		stmmac_est_configure(priv, priv, priv->est,
> -				     priv->plat->clk_ptp_rate);
> +				     priv->plat->clk_ptp_rate, false);
>  		mutex_unlock(&priv->est_lock);
>  	}
>  
> @@ -105,7 +105,7 @@ static int stmmac_adjust_time(struct ptp_clock_info *ptp, s64 delta)
>  		priv->est->btr[1] = (u32)time.tv_sec;
>  		priv->est->enable = true;
>  		ret = stmmac_est_configure(priv, priv, priv->est,
> -					   priv->plat->clk_ptp_rate);
> +					   priv->plat->clk_ptp_rate, true);
>  		mutex_unlock(&priv->est_lock);
>  		if (ret)
>  			netdev_err(priv->dev, "failed to configure EST\n");
> diff --git a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> index aea235a69105..ac926c60f9f9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/stmmac_tc.c
> @@ -1090,7 +1090,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  	tc_taprio_map_maxsdu_txq(priv, qopt);
>  
>  	ret = stmmac_est_configure(priv, priv, priv->est,
> -				   priv->plat->clk_ptp_rate);
> +				   priv->plat->clk_ptp_rate, true);
>  	mutex_unlock(&priv->est_lock);
>  	if (ret) {
>  		netdev_err(priv->dev, "failed to configure EST\n");
> @@ -1109,7 +1109,7 @@ static int tc_taprio_configure(struct stmmac_priv *priv,
>  		mutex_lock(&priv->est_lock);
>  		priv->est->enable = false;
>  		stmmac_est_configure(priv, priv, priv->est,
> -				     priv->plat->clk_ptp_rate);
> +				     priv->plat->clk_ptp_rate, false);
>  		/* Reset taprio status */
>  		for (i = 0; i < priv->plat->tx_queues_to_use; i++) {
>  			priv->xstats.max_sdu_txq_drop[i] = 0;
> 


