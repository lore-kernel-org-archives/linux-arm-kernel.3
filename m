Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84262C88E4D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 11 Sep 2026 11:26:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=V1UQQs4RgrcoOL7IoOSvZHUpHULa8UMlbZavMMWsIAI=; b=b5Ixe9AiNc24Dlw0lljbdeX5NN
	SZ2e9+eWfEvga2w2nUqTizBuZZzzhuLDv3Jryz+kZy31IcE9KGxrg/5G2cvusUBT2+0zyA7A47x/F
	TCgEK8n2CuEy5NNFCeREM4POZAKeqlQPyhNQI8hCpUqdpK1HxAGORYEMfwGJOg45cX0CMrNtCSMw8
	xG1Y5KKci4JxGQoxrjHuA/ok3MyPa1exMAmUVTaXkNp6bnYQKrTbZHmVBA+ab67XHKKA6bI1HMvj0
	7bPIa76YLvcQmm73RqTjw8epR3qHzROOoPKfm/HjRkjya0lO4NS6YNk+TaG2WqLR6G4Xv80Yt9Kby
	cb7xZfUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zOF-0000000GUdI-3Vhq;
	Fri, 11 Sep 2026 11:25:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4zNl-0000000GUQv-3Ike
	for linux-arm-kernel@lists.infradead.org;
	Fri, 11 Sep 2026 11:25:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F0AB60A5E;
	Fri, 11 Sep 2026 11:25:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9C9751F0089E;
	Fri, 11 Sep 2026 11:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789125924;
	bh=V1UQQs4RgrcoOL7IoOSvZHUpHULa8UMlbZavMMWsIAI=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=ove7lllus3Mnvt02TUZBfOze1KGDqlxb6R9rnMNqnw6Kf1E4pznctBgX++hb19PQa
	 uWhOJGsg4oCtC5SrOcR1sZTis0HJWhaSlIV6CX6cGY1DozSwXAtGPODo/zK7UiNYGK
	 jAppYtz+UeKU2G2RDRJSjnH6SzZjj1qrYcNtIdYbQRB0qIlJ0cWKgKEHbVJxi3yVn9
	 vnRdMOsO+5Kzxx29nikCI02OiXNXW7tHhUqnnI3DN9Gc9YoiLIVn9RgHFzxkCfmt7x
	 7c/mu1yLry3EYV2K+UpNS9bc8IxSXjdup1uG3MSGsvga+lpilQEFP8GnWCq0pdej/B
	 NR4uFPy9ZVczg==
Subject: Re: [PATCH net-next v2 9/9] net: stmmac: qcom-ethqos: add Shikra EMAC support
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
Date: Fri, 11 Sep 2026 11:25:23 +0000
Message-ID: <178912592322.219967.17232145160989235559@kernel.org>
In-Reply-To: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
References: <20260908-shikra_ethernet-v2-9-bbe3389d0652@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider:

Critical: 0 · High: 1 · Medium: 1 · Low: 0

- [High] shikra_data (drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-
  ethqos.c:337) provides no .rgmii_por/.num_rgmii_por table, while the…
- [Medium] Adding the core-owned "stmmaceth" clock to shikra_noc_clks[]
  decouples that clock's programmed rate and enable state from the…

--

net: stmmac: qcom-ethqos: add Shikra EMAC support

Adds a qcom,shikra-ethqos compatible with a new shikra_data descriptor that
declares three NOC clocks (axi-noc, pcie-tile-axi-noc, stmmaceth) at
120 MHz and a 36-bit DMA address width.  A couple of questions below about
the new descriptor.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 8871d28594116..c474f1e5a0437 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -328,6 +328,36 @@ static const struct ethqos_emac_driver_data emac_v4_0_0_data = {
>  	},
>  };
>  
> +static const struct ethqos_noc_clk_cfg shikra_noc_clks[] = {
> +	{ "axi-noc", 120000000 },
> +	{ "pcie-tile-axi-noc", 120000000 },
> +	{ "stmmaceth", 120000000 },

[Severity: Medium]
Is it safe to put the core-owned "stmmaceth" clock into this table, given
that the 120 MHz rate and the OPP/VDD_CX vote then come from different
owners?

On the resume path the core enables the clock before this driver raises the
vote:

stmmac_platform.c:stmmac_bus_clks_config() {
	...
	ret = clk_prepare_enable(plat_dat->stmmac_clk);
	...
	if (plat_dat->clks_config) {
		ret = plat_dat->clks_config(plat_dat->bsp_priv, enabled);
	...
}

ethqos_clks_config(true) is the only place that calls
dev_pm_opp_set_rate(dev, ethqos->noc_clk_rates[0]), so for that window
stmmaceth is running at the previously programmed 120 MHz with the vote at
zero.  The same inversion happens at probe, where
devm_stmmac_probe_config_dt() enables stmmaceth before
qcom_ethqos_init_noc_clks() installs the OPP.

At detach the devm actions unwind in the opposite order to how they were
registered, so ethqos_clks_disable() runs before
devm_stmmac_remove_config_dt():

	} else {
		if (ethqos->num_noc_clks)
			clk_bulk_disable_unprepare(ethqos->num_noc_clks,
						   ethqos->noc_clks);
		clk_disable_unprepare(ethqos->link_clk);
		if (ethqos->num_noc_clks)
			dev_pm_opp_set_rate(&ethqos->pdev->dev, 0);
	}

The bulk disable only drops the glue's extra reference, the core still holds
one, so does this withdraw the performance-state vote while stmmaceth is
still running at 120 MHz?

The mid-sequence failure paths in ethqos_clks_config() look similar: if
clk_set_rate() fails for a later index, or clk_bulk_prepare_enable() fails,
only dev_pm_opp_set_rate(dev, 0) is issued and the rates already raised are
not rolled back.  The original stmmaceth rate is never recorded or restored
either.

> +};
> +
> +static const struct ethqos_emac_driver_data shikra_data = {
> +	.dma_addr_width = 36,
> +	.has_emac_ge_3 = true,
> +	.noc_clk_cfg = shikra_noc_clks,
> +	.num_noc_clks = ARRAY_SIZE(shikra_noc_clks),
> +	.rgmii_config_loopback_en = false,

[Severity: High]
Was a .rgmii_por / .num_rgmii_por table meant to be part of this patch?

All the other descriptors (emac_v2_1_0_data, emac_v2_3_0_data,
emac_v3_0_0_data, emac_v4_0_0_data) supply one, and shikra_data leaves
.link_clk_name unset, so qcom_ethqos_probe() ends up doing
devm_clk_get(dev, "rgmii"):

	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");

With num_rgmii_por == 0 the reset loop at the top of
ethqos_fix_mac_speed_rgmii() does nothing:

	/* Reset to POR values and enable clk */
	for (i = 0; i < ethqos->num_rgmii_por; i++)
		rgmii_writel(ethqos, ethqos->rgmii_por[i].value,
			     ethqos->rgmii_por[i].offset);

so RGMII_IO_MACRO_CONFIG, SDCC_HC_REG_DLL_CONFIG, SDCC_HC_REG_DDR_CONFIG and
RGMII_IO_MACRO_CONFIG2 are never brought back to a baseline before the
speed-specific programming, which is read-modify-write.

Can that leave stale bits across a speed change?  For has_emac_ge_3 (true
here) at 10/100M, ethqos_rgmii_macro_init() arms the extended RX-clock delay
path:

		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY,
			      SDCC_HC_REG_DDR_CONFIG);

		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_EXT_PRG_RCLK_DLY_EN,
			      SDCC_HC_REG_DDR_CONFIG);
	} else {

and the 1000M branch only programs the other path:

		rgmii_updatel(ethqos, SDCC_DDR_CONFIG_PRG_RCLK_DLY,
			      FIELD_PREP(SDCC_DDR_CONFIG_PRG_RCLK_DLY,
					 prg_rclk_dly), SDCC_HC_REG_DDR_CONFIG);

		rgmii_setmask(ethqos, SDCC_DDR_CONFIG_PRG_DLY_EN,
			      SDCC_HC_REG_DDR_CONFIG);

EXT_PRG_RCLK_DLY_EN is never cleared, so after 100M -> 1000M both delay
paths are enabled.  On the other platforms the POR write of 0x80040800 to
SDCC_HC_REG_DDR_CONFIG clears the extended path first.

Two related fields also look like they depend on the POR table:

- SDCC_DDR_CONFIG_TCXO_CYCLES_CNT is written nowhere else in the driver, yet
  the 1G delay values are derived from "TCXO period * TCXO_CYCLES_CNT /
  (2 * RX delay ns)", which assumes the POR value of 4.
- SDCC_HC_REG_DLL_CONFIG is never restored to its 0x2004642c baseline, and
  CDR_EN / CDR_EXT_EN set by ethqos_dll_configure() at 1G are not cleared
  when dropping to 10/100M, so residual values feed the DLL_RST/PDN toggle
  and the SDC4_STATUS_DLL_LOCK poll.
- RGMII_CONFIG_MAX_SPD_PRG_2 / MAX_SPD_PRG_9 are set for 100M/10M and not
  cleared for 1000M.

If Shikra is in fact not an RGMII part, then the descriptor and the binding
added in the same series look inconsistent the other way: the binding pins
the fourth clock to const "rgmii" and the descriptor sets the RGMII-only
.rgmii_config_loopback_en field.  Which of the two is intended?

> +	.dwmac4_addrs = {

[ ... ]

> +};
> +

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260908-shikra_ethernet-v2-0-bbe3389d0652%40oss.qualcomm.com

