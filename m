Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F9E9C79FBD
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 21:47:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FxBSLHEWu2/1G96Z6KFNQmOj13e4MqJqI7BFG+PRBx8=; b=sPsH3k/aetP13fEdfNVgLd+/hf
	XEpGt8EZhLhTtJ4SXT5EOMGSqn5tskRYXM0P5x3LxbQebgfLTdYUpf0K6bGqzYnaIvvCi4Rcm0rWG
	54PhyoERejI0s6Cm9YC3Ut/uHWwxABhYTnalIvZLbNJ8UUfs6+T1b8irQGahrS4IVLptuMWkx4cno
	XohX3aWi+wfk4mZkFLvFvDcETQf268d5OTHxSEwd8Cs+W3wcoeXBzo7Z1TfEdid41N3IltW/vU177
	NR/uWjvhhU40ohjpLTbe7KwK4FGnhzwPQyJprLjXgHenSrPESUjssC68lBXTPSRoFNXE14Gja1iYJ
	HfHLVyhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8r-0000000Cuuv-1ERu;
	Wed, 09 Sep 2026 21:47:41 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4Q8S-0000000CuiD-45s8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 21:47:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 61AD940460;
	Wed,  9 Sep 2026 21:47:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A988A1F0089E;
	Wed,  9 Sep 2026 21:47:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788990436;
	bh=FxBSLHEWu2/1G96Z6KFNQmOj13e4MqJqI7BFG+PRBx8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=RLK1H/PIsUiDOqIca81fOUftBIE4B9yVnBc15zQnGdC0xvSRd0PZ6sP04/+ExWWYq
	 qHKxtsor4qPpM4BhoS4l9U8C3rI9ZeDsBK8bXpeUpa2SSHQJM8UNIZs/nwIXXyhov4
	 yB9FFQIFA5DpcCP6IQICHFLnOFAzK8JuL6GOx8I228rcqy35XwwV0fm4m/l3IpYgs/
	 jXwehY8NKl9uwi/RF8rYkdmksg10cUI9h07KkaS0jFYPsRlqtIfvQII0qIu1LFcaze
	 fpVzRpQ9GrGmOD7WXOJELXpSlBCn8I+Hj2/kyxtTG6x/6F7c71wKbARCnvCWc0q0dt
	 2Ev55LfnAlzAw==
Subject: Re: [PATCH net-next 7/9] net: stmmac: qcom-ethqos: set initial RGMII
 link clock to lowest speed
From: netdev-bot+sashiko@kernel.org
To: mohd.anwar@oss.qualcomm.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, afd@ti.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, richardcochran@gmail.com, andersson@kernel.org,
 konradybcio@kernel.org, alexandre.torgue@foss.st.com, peppe.cavallaro@st.com,
 joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-msm@vger.kernel.org,
 linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org
Date: Wed, 09 Sep 2026 21:47:14 +0000
Message-ID: <178899043421.219967.5744989113878369948@kernel.org>
In-Reply-To: <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
References: <20260904-shikra_ethernet-v1-7-a50765996035@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider:

Critical: 0 · High: 2 · Medium: 1 · Low: 0

- [High] Lowering the probe-time link clock to the SPEED_10 rate makes
  the first link-up's RGMII IO-macro/DLL programming run with a…
- [High] The RGMII source-clock rate no longer matches the programmed IO-
  macro/DLL delay mode for phy-mode "rgmii-txid" and "rgmii-rxid" at…
- [Medium] The commit message's safety argument, "fix_mac_speed updates
  the rate once a link is established", describes a mechanism that no…

--

net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed

The probe-time initialisation of the RGMII link clock is changed from
SPEED_1000 to SPEED_10, so the source clock starts at the 10 Mbps rate
instead of 250 MHz while no link is present.

> net: stmmac: qcom-ethqos: set initial RGMII link clock to lowest speed
>
> On probe the RGMII link clock is initialised at SPEED_1000, which
> translates to a 250 MHz source clock even when no PHY link is present,
> drawing unnecessary power.
>
> Initialise at SPEED_10 instead; fix_mac_speed updates the rate once
> a link is established.

[Severity: Medium]
Is the sentence "fix_mac_speed updates the rate once a link is established"
accurate for this driver?

Neither ethqos_fix_mac_speed_rgmii() nor ethqos_fix_mac_speed_sgmii()
contains a clk_set_rate() call.  The only place the link clock rate is
programmed is ethqos_set_clk_tx_rate():

	return clk_set_rate(ethqos->link_clk, rate);

which is installed as plat_dat->set_clk_tx_rate in qcom_ethqos_probe().

stmmac_mac_link_up() calls the two callbacks in this order:

	if (priv->plat->fix_mac_speed)
		priv->plat->fix_mac_speed(priv->plat->bsp_priv, interface,
					  speed, mode);
	...
	if (priv->plat->set_clk_tx_rate) {
		ret = priv->plat->set_clk_tx_rate(priv->plat->bsp_priv,
						priv->plat->clk_tx_i,
						interface, speed);

So the rate is updated by set_clk_tx_rate(), and it happens after
fix_mac_speed() rather than before it.  Could the changelog be reworded to
match the callback that actually applies the rate, and the ordering it runs
in?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 2ca2f03de3017..4f9bef662c579 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -814,7 +814,7 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  				     "Failed to get serdes phy\n");
>  
>  	ethqos_set_clk_tx_rate(ethqos, NULL, plat_dat->phy_interface,
> -			       SPEED_1000);
> +			       SPEED_10);

[Severity: High]
Does this leave the first link-up's DLL programming running at the 10 Mbps
reference rate on the legacy RGMII phy-modes?

Because stmmac_mac_link_up() runs fix_mac_speed() before set_clk_tx_rate(),
ethqos_fix_mac_speed_rgmii() always executes with the previously programmed
link_clk rate.  After this change that rate is, on the first link event,
whatever ethqos_set_clk_tx_rate() computed for SPEED_10: 5 MHz for
phy-mode "rgmii" and 2.5 MHz for "rgmii-txid"/"rgmii-rxid", instead of the
250 MHz it was before.

Only rgmii-id takes the bypass early return in
ethqos_fix_mac_speed_rgmii():

	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);

		ethqos_rgmii_id_macro_init(ethqos, speed);

		return;
	}

rgmii, rgmii-txid and rgmii-rxid fall through to the DLL enable and lock
poll, and at 1G also to ethqos_dll_configure():

	/* wait for DLL LOCK */
	if (read_poll_timeout_atomic(rgmii_readl, val,
				     val & SDC4_STATUS_DLL_LOCK,
				     1000, 1000000, true,
				     ethqos, SDC4_STATUS))
		dev_err(dev, "Timeout while waiting for DLL lock\n");

	if (speed == SPEED_1000)
		ethqos_dll_configure(ethqos);

ethqos_dll_configure() programs a calibration constant that is explicitly a
function of the MCLK frequency:

	rgmii_updatel(ethqos, SDCC_DLL_CONFIG2_MCLK_FREQ_CALC,
		      FIELD_PREP(SDCC_DLL_CONFIG2_MCLK_FREQ_CALC, 26),
		      SDCC_HC_REG_DLL_CONFIG2);

Can the DLL lock and calibrate at 2.5/5 MHz?  A lock timeout is only logged
with dev_err() and the link is brought up anyway, and nothing re-runs the
DLL sequence after set_clk_tx_rate() raises the rate, so the calibration
performed at the stale rate is the one that stays in effect.  There is also
up to ~3 seconds of busy-wait from the three 1 s read_poll_timeout_atomic()
budgets in this path.

arch/arm64/boot/dts/qcom/sa8540p-ride.dts uses phy-mode = "rgmii-txid" on
both ethqos ports (ethernet1 with a fixed-link at 1000), so the very first
link-up on that board takes this path.  Would raising the rate before
calling fix_mac_speed(), or restricting this initialisation change to the
DLL-bypass mode, avoid that?

[Severity: High]
Separately, does the rate computed here match the delay mode that
ethqos_fix_mac_speed_rgmii() programs for rgmii-txid and rgmii-rxid?

ethqos_set_clk_tx_rate() doubles the rate only for plain RGMII or at 1G:

	/* Clock Rate Requirements:
	 * MAC added delay: 250/50/5 Mhz for 1G/100M/10M
	 * No MAC delay (DLL bypass): 250/25/2.5 Mhz for 1G/100M/10M
	 */
	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII ||
	    speed == SPEED_1000)
		rate *= 2;

But DDR bypass is only programmed for PHY_INTERFACE_MODE_RGMII_ID, so
rgmii-txid and rgmii-rxid stay in MAC-added-delay mode and, per the comment
above, need 5 MHz at 10M and 50 MHz at 100M rather than 2.5/25 MHz.

Before this series the driver did clk_set_rate(link_clk, rate * 2)
unconditionally, which matched every mode reaching the legacy path; the
condition was narrowed by "net: stmmac: qcom-ethqos: fix RGMII_ID mode to
use DLL bypass" and is unchanged at the end of the series.  Can 10/100 Mbps
links pass traffic on sa8540p-ride (phy-mode "rgmii-txid") with a
half-frequency RGMII TXC?  This patch routes the probe-time initialisation
through the same calculation, so such boards are left at the bypass 10M
rate instead of the MAC-delay 10M rate.

>  
>  	qcom_ethqos_set_sgmii_loopback(ethqos, true);
>  	ethqos_set_func_clk_en(ethqos);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260904-shikra_ethernet-v1-0-a50765996035%40oss.qualcomm.com

