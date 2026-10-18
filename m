Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93477CCA490
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p5TpCCsQqnD4QG+2bjVbDEjYxKSQEwUSAkDIhu0AbYI=; b=EHy38neCv5jfZBPDRY3dHji9qR
	8O7aVeaE6HaSoSWbSFa3usWUQSCyYGgdegsTwFfYrWE+yx95ewvZE55VotMPG5+P1KP5ipuaEqV4v
	of8n9aoBIkCRzgzkEq37/mjTHn78MhkGd5dqs9yu/Tksx3jRxUwVcux5u/CzQjwG/WO5ILxXD3OoW
	KrFZl2IYxLRUwNufSGxSUtcjuJF5rTtZXpaSZiN4SirjCWUfzRAj4HB4xVJfMI0BXO/+EO6EXPZNs
	4nj/+x53IaH5McmA1m0mrJ5ZUjcWcGb+hIb4p6UDzieYHi34RRB2rj0Bhd7Xk+SC/KWUAfXhGOR0/
	EPlFsknA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQj-00000005lhK-0zlD;
	Sun, 18 Oct 2026 10:47:53 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQX-00000005lbV-2Ge9
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 10:47:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D1825447EE;
	Sun, 18 Oct 2026 10:47:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3E7AF1F000C6;
	Sun, 18 Oct 2026 10:47:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792320460;
	bh=p5TpCCsQqnD4QG+2bjVbDEjYxKSQEwUSAkDIhu0AbYI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=nqtSWVLoBK2Humt8uvOaWCveH2suxdczI2gVBMRmQfPK+TvBFJMtq15befhSrbV+P
	 vHa3QBeMt4Mf2B8PiWuBhDb5Md/X3gvEiH5OfMdNpSx+0bFYmP3TtJsELqiguoPLwP
	 Lg2l9wqxq2g0NOnOnrUnUhr+n7LFRQmlXd9WX8eDVF3hzTWKUjOdNfjQExIPUNktMG
	 Hy5a3U2SNyze/vS1/pjAEhFBwU9nDWfOckLKRHo2K7Abq9zoE1lLsJEX2HGR1wWMCd
	 BTZDKLGAOrBRG7OJOfta3VYnnn39//dp6Dnut0Vb75Wly3X41fnKh+Om/qTo4aP3Vx
	 198K8V01ul07w==
Subject: Re: [PATCH net-next v3 6/9] net: stmmac: qcom-ethqos: set initial
 RGMII link clock to lowest speed
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, lorenzo.bianconi@oss.qualcomm.com,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Sun, 18 Oct 2026 10:47:38 +0000
Message-ID: <179232045880.3135.12626840484816071779@kernel.org>
In-Reply-To: <20261017-shikra_ethernet-v3-6-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-6-26a8beb44b8f@oss.qualcomm.com>
X-sashiko-severity: High
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

Critical: 0 · High: 1 · Medium: 0 · Low: 0

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [High] Probe now sets the RGMII link clock to the 10M rate.

--

net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed

At probe, this patch sets the RGMII link clock using SPEED_10 instead of
SPEED_1000, so the 250 MHz source clock is no longer running while there
is no link. The commit message says set_clk_tx_rate will update the rate
once a link comes up.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index a92bf4a6a2dbd..2471871562ed9 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  				     "Failed to get serdes phy\n");
>  
>  	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
> -			       SPEED_1000);
> +			       SPEED_10);

[Severity: High]
After this change, is the 1G DLL calibrated against the wrong link_clk
rate on the first gigabit link-up after boot?

In stmmac_mac_link_up(), fix_mac_speed() runs before set_clk_tx_rate():

drivers/net/ethernet/stmicro/stmmac/stmmac_main.c:stmmac_mac_link_up() {
    ...
	if (priv->plat->fix_mac_speed)
		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
					  speed, mode);
    ...
	if (priv->plat->set_clk_tx_rate) {
		ret = priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
						priv->plat->clk_tx_i,
						interface, speed);
    ...
}

In the non-ID RGMII modes (rgmii, rgmii-rxid, rgmii-txid), the first
SPEED_1000 link-up then runs the whole 1G DLL bring-up in
ethqos_fix_mac_speed_rgmii() while link_clk is still at 5 MHz:

drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c:ethqos_fix_mac_speed_rgmii() {
    ...
		/* wait for DLL LOCK */
		if (read_poll_timeout_atomic(rgmii_readl, val,
					     val & SDC4_STATUS_DLL_LOCK,
					     1000, 1000000, true,
					     ethqos, SDC4_STATUS))
			dev_err(dev, "Timeout while waiting for DLL lock\n");
	}

	if (speed == SPEED_1000)
		ethqos_dll_configure(ethqos);
    ...
}

ethqos_set_clk_tx_rate() raises link_clk to 250 MHz only after this. As
far as I can tell, nothing recalibrates the DLL at the new rate until the
next link-up.

Before this patch, probe left link_clk at 250 MHz, so the first 1G
calibration saw the correct rate. That masked an ordering change from
commit 9192320a65b7 ("net: stmmac: qcom-ethqos: convert to
set_clk_tx_rate() method"). Before that commit, ethqos_fix_mac_speed()
called ethqos_update_link_clk() before ethqos_configure().

Could this produce "Timeout while waiting for DLL lock" or CK_OUT_EN
timeout errors? It could also mean up to about 3 seconds of busy-waiting
in read_poll_timeout_atomic() on the link-up path, or a DLL tuned to the
wrong period until the link flaps.

In-tree boards that use these modes include qcs404-evb-4000.dts (rgmii),
sa8155p-adp.dts (rgmii) and sa8540p-ride.dts (rgmii-txid, two ports).
rgmii-id (DLL bypassed) and 10/100 links are not affected.

Later patches in the series do not appear to change this ordering or the
probe rate.

Would it make sense to call set_clk_tx_rate() before fix_mac_speed() in
stmmac_mac_link_up()? The other option is to update the link clock inside
the qcom fix_mac_speed path before the DLL is configured.

>  
>  	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	ethqos_set_func_clk_en(ethqos);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261017-shikra_ethernet-v3-0-26a8beb44b8f%40oss.qualcomm.com

