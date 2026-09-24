Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EBCAC98315
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 07:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BYKTemitrAEhbE5qfBfWWBprm2uQ4LAmZ3SOFCm3iVo=; b=45sHXfL1c0eI7lYG3K5Z9wq5XD
	g1jM9kbwXRKqUy9Lb2kSZtW+ZiA154YzLFuWhYt7Sl3H9y6QH6dbW92qcfIg5jGjd8odWi8uT7Bfw
	Zp3MVd784uUkdzld15ah154fKD2SGA9/h7i7igrvIscWbwdaspG1EdSsR3tmDMacZT9Rp2nXg5Lpo
	qvkHv5uOdr3bwETVUY7wwUP0E7rPDBybdykJEfwO07xEpuJ8Qlc+mxawWbhp2VzH3V563GQvtw1aZ
	IQPPup/oEaPUvK87BAMycCln38PmsSx9/G7Y5d0iWeM+y485KJFm4l6v2WLEfH8kXCEJGpe4Lsya6
	zPrBSX3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eHt-0000000ALpl-1BIv;
	Thu, 24 Sep 2026 07:54:37 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9eHr-0000000ALp1-1Zmk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 07:54:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 8D72E60211;
	Thu, 24 Sep 2026 07:54:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F05591F000FF;
	Thu, 24 Sep 2026 07:54:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790236474;
	bh=BYKTemitrAEhbE5qfBfWWBprm2uQ4LAmZ3SOFCm3iVo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=g5ihOwBLbAqVjP2jhDScCjB/Z0cfI+fd8Va7Qynkl5JbEYNsvO/Y7n4WV/xFCVaB5
	 7lsKMcO4YO6v9YZPBrMVDtzLug61/oPlDIgr6v17Qf76Ge3bOs4YxVuYgkmJfWmsXP
	 ns8y+Dl9+TvBqoxHpE2jvx2UH08Lnd1Q6trpG+uzO45OR8/HLKaMLrzUT5o9Hud43L
	 8O2AEF1tKkO8GJvyKoc3nvuE+myNd2XzY5X6OqdHFxcXfhGOcdG17291liB9eMjCim
	 aWKNrxXO6ICkOE5/N/9C2bSGcU3z9f94w+4adp5w7rj3rOvm9vhGRN3QlF2GnTi8XF
	 jCZfSjFtlLwzQ==
Subject: Re: [PATCH net 1/3] net: phylink: allow stopping a suspended instance
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: linux@armlinux.org.uk, andrew@lunn.ch, hkallweit1@gmail.com,
 davem@davemloft.net, edumazet@google.com, kuba@kernel.org, pabeni@redhat.com,
 qiangqing.zhang@nxp.com, rmk+kernel@armlinux.org.uk,
 maxime.chevallier@bootlin.com, andrew+netdev@lunn.ch,
 mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com, ansuelsmth@gmail.com,
 yangtiezhu@loongson.cn, chenhuacai@kernel.org, richard.genoud@bootlin.com,
 alastair@d-silva.org, mripard@kernel.org, netdev@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Thu, 24 Sep 2026 07:54:32 +0000
Message-ID: <179023647242.2160803.15587115569957913954@kernel.org>
In-Reply-To: <20260921-submit-stmmac-reset-fixes-v1-v1-1-87a4e431ee00@gmail.com>
References: <20260921-submit-stmmac-reset-fixes-v1-v1-1-87a4e431ee00@gmail.com>
X-sashiko-severity: Medium
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] phylink_stop() is newly documented and implemented as a legal
  replacement for phylink_resume() after phylink_suspend(), but it does…

--

net: phylink: allow stopping a suspended instance

This makes phylink_stop() usable directly on a suspended phylink instance,
so a MAC that cannot restore its hardware after system sleep can close the
netdev instead of calling phylink_resume(). An already stopped instance
returns early, and the MAC Wake-on-LAN case drains the resolve work,
completes the deferred link-down and clears PHYLINK_DISABLE_MAC_WOL.

> diff --git a/drivers/net/phy/phylink.c b/drivers/net/phy/phylink.c
> index a1458da8111b6..8f9278112623b 100644
> --- a/drivers/net/phy/phylink.c
> +++ b/drivers/net/phy/phylink.c
> @@ -2495,11 +2495,17 @@ EXPORT_SYMBOL_GPL(phylink_start);
>   *
>   * This will synchronously bring down the link if the link is not already
>   * down (in other words, it will trigger a mac_link_down() method call.)
> + * It may also be called after phylink_suspend() if the MAC cannot resume
> + * and the network device must be closed instead.
>   */
>  void phylink_stop(struct phylink *pl)
>  {
>  	ASSERT_RTNL();
>  
> +	/* phylink_suspend() already stops the link without MAC WoL. */
> +	if (test_bit(PHYLINK_DISABLE_STOPPED, &pl->phylink_disable_state))
> +		return;
> +

[Severity: Medium]
Does this new exit path leave the PHY advertisement clamped to the lowest
speed?

phylink_suspend() performs two things when PHY based power management speed
control is in use:

drivers/net/phy/phylink.c:phylink_suspend() {
	...
	} else {
		phylink_stop(pl);
	}

	if (phylink_phy_pm_speed_ctrl(pl))
		phylink_speed_down(pl, false);
}

The only place in phylink that reverses the second part is
phylink_resume():

drivers/net/phy/phylink.c:phylink_resume() {
	ASSERT_RTNL();

	if (phylink_phy_pm_speed_ctrl(pl))
		phylink_speed_up(pl);
	...
}

Both new exits added here, this early return and the MAC WoL completion
block below, return without calling phylink_speed_up().  So a MAC that
follows the new kernel-doc ("It may also be called after phylink_suspend()
if the MAC cannot resume and the network device must be closed instead")
ends up with the PHY still advertising only the lowest common speed, and
with the original advertisement left in phydev->adv_old where phylink will
never consume it.

Should the new documentation state that the MAC has to call
phylink_speed_up() itself in this case, or should phylink_stop() reverse
the speed-down on these paths?

The only in-tree user of wol_phy_speed_ctrl is stmmac, and stmmac_open()
calls phylink_speed_up() unconditionally, so the next open repairs the
residue in the common case.  The residue looks like it can become permanent
if another speed-down runs first, since stmmac_release() also calls
phylink_speed_down() when device_may_wakeup(priv->device) is true:

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_release() {
	...
	if (device_may_wakeup(priv->device))
		phylink_speed_down(priv->phylink, false);
	...
}

and phy_speed_down() overwrites the saved advertisement each time:

drivers/net/phy/phy.c:phy_speed_down() {
	...
	linkmode_copy(phydev->adv_old, adv_tmp);
	...
}

With no intervening phylink_speed_up(), would the second phy_speed_down()
store the already reduced set into phydev->adv_old, so the later
phylink_speed_up() restores the reduced advertisement rather than the
configured one?  Note device_may_wakeup(priv->device) can be true while
pl->wolopts_mac is zero, since stmmac calls
device_set_wakeup_capable(priv->device, 1) when plat->pmt is set.

>  	if (pl->sfp_bus)
>  		sfp_upstream_stop(pl->sfp_bus);
>  	if (pl->phydev)
> @@ -2512,6 +2518,16 @@ void phylink_stop(struct phylink *pl)
>  
>  	phylink_run_resolve_and_disable(pl, PHYLINK_DISABLE_STOPPED);
>  
> +	if (test_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state)) {
> +		/* Finish the link-down deferred by MAC WoL, without restarting. */
> +		flush_work(&pl->resolve);
> +		mutex_lock(&pl->state_mutex);
> +		if (pl->suspend_link_up)
> +			phylink_link_down(pl);
> +		__clear_bit(PHYLINK_DISABLE_MAC_WOL, &pl->phylink_disable_state);
> +		mutex_unlock(&pl->state_mutex);
> +	}
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921-submit-stmmac-reset-fixes-v1-v1-0-87a4e431ee00%40gmail.com

