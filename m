Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8835CCF2C9
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 Oct 2026 10:47:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SkZXiG1h3Fqd9FSyy/k/L6UQ3EgZGcMJZVDgN+k19A0=; b=kTenqE6KMYvy5lB15qVzhHBrbU
	iQKiV0W7Elk+E+/gs7Bq6yzR8ZG2+t1Xx+x8s3LyyxYS/9LEIWWhnrifAoYP+uRBb7Z/F+P0bCXbv
	mrWYA5/aVqfw7Py9Xy4TBXVV7fRf3lw4i2QMMe2pMOmbpsKYwYkOhePqz+NOChDShlTgU4sEkyiBZ
	eCncdtMFWBgjS+Pe9omXzte6FccyrJooCU5c79ZCa2YhFRUOvwjIaVlQTmvWE5jAU7RGxk2OclQMI
	UzF9xlzrAWideXjxeWkJ2QjXw61yFLw2djwW+ZETEtW/QfgIDM5YuXAV9yP9930GRSOSiAOQPyWgm
	I2oHZkkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQX-00000005lbU-02JI;
	Sun, 18 Oct 2026 10:47:41 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xIOQV-00000005lab-26Le
	for linux-arm-kernel@lists.infradead.org;
	Sun, 18 Oct 2026 10:47:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E671D60A58;
	Sun, 18 Oct 2026 10:47:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 40F871F000CB;
	Sun, 18 Oct 2026 10:47:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792320458;
	bh=SkZXiG1h3Fqd9FSyy/k/L6UQ3EgZGcMJZVDgN+k19A0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=iEGF7Hd7iGU5n2JR6YujAwA7khIGa4mbnwAw3mmnN9x8gBBEb2/tOiuJQp7Ju7Sh1
	 yRwGP6pS/oswxRYu5ZV0cIVts4dJsjTAKHuqRU7YqzvdIjgahXVk9oquuhyWLuU1sT
	 fZNpxIyOAWnwOkH+3YXAtPm4e6jIwO2+TIfwk1g3jtYfmbw1Z9Fig/9iRNYpxc06RW
	 3LyDAllfBONt1LqulwzSD9Xse8GqT2A5vLdMexZutYO3wx7edBJNMBkl3yxGFdm6b4
	 ZJhzHnmKvbQxoMScyW3kjpjivAh0GyU4kB9Qh026uQmLCA+Cxg3o5MwUIuxkPaL+3a
	 RCR+78lj3J97A==
Subject: Re: [PATCH net-next v3 5/9] net: stmmac: qcom-ethqos: warn about
 legacy RGMII PHY modes
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
Date: Sun, 18 Oct 2026 10:47:36 +0000
Message-ID: <179232045684.3135.7391017635736760910@kernel.org>
In-Reply-To: <20261017-shikra_ethernet-v3-5-26a8beb44b8f@oss.qualcomm.com>
References: <20261017-shikra_ethernet-v3-5-26a8beb44b8f@oss.qualcomm.com>
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

Thank you for your contribution! Sashiko AI review found 3 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 2

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] The new dev_warn() in qcom_ethqos_probe() calls "rgmii",
  "rgmii-rxid" and "rgmii-txid" legacy and tells the user to "consider…
- [Low] The commit message and the code disagree on which modes get the
  warning.
- [Low] In qcom_ethqos_probe() the legacy-mode dev_warn() runs early
  (line 769), before several steps that can return -EPROBE_DEFER: -…

--

net: stmmac: qcom-ethqos: warn about legacy RGMII PHY modes

This patch makes qcom_ethqos_probe() print a warning when the device tree
uses "rgmii", "rgmii-rxid" or "rgmii-txid". The aim is to move boards over
to "rgmii-id" with PHY-provided delays. The RGMII_ID case is moved below
the warning, so it still gets the same fix_mac_speed setup but does not
warn.

> The qcom-ethqos driver is moving towards using "rgmii-id" together
> with PHY-provided delays. However, existing DTBs use "rgmii" and
> "rgmii-txid" and must remain supported for backwards compatibility.
>
> Warn when either of these legacy PHY modes is used to encourage users
> to migrate to updated DTBs using "rgmii-id".

[Severity: Low]
This isn't a bug, but the commit message names two legacy modes and the
code warns for three. In qcom_ethqos_probe(), PHY_INTERFACE_MODE_RGMII_RXID
is still in the same case group as RGMII and RGMII_TXID, so "rgmii-rxid"
prints the warning too.

No in-tree qcom DTS uses "rgmii-rxid", so the "existing DTBs" reason does
not cover it.

Could the commit message mention rgmii-rxid and say why it counts as
legacy?

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> index 53fb9de4d92c7..a92bf4a6a2dbd 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-qcom-ethqos.c
> @@ -764,9 +764,11 @@ static int qcom_ethqos_probe(struct platform_device *pdev)
>  	ethqos->phy_mode = plat_dat->phy_interface;
>  	switch (ethqos->phy_mode) {
>  	case PHY_INTERFACE_MODE_RGMII:
> -	case PHY_INTERFACE_MODE_RGMII_ID:
>  	case PHY_INTERFACE_MODE_RGMII_RXID:
>  	case PHY_INTERFACE_MODE_RGMII_TXID:
> +		dev_warn(dev, "legacy RGMII phy-mode detected; consider upgrading to a newer DTB\n");

[Severity: Medium]
Is there a newer DTB for users to upgrade to? Every in-tree RGMII user of
this driver still uses one of the modes that now warn:

  arch/arm64/boot/dts/qcom/qcs404-evb-4000.dts:  phy-mode = "rgmii";
  arch/arm64/boot/dts/qcom/sa8155p-adp.dts:      phy-mode = "rgmii";
  arch/arm64/boot/dts/qcom/sa8540p-ride.dts:     phy-mode = "rgmii-txid";
                                                 (on both ports)

The example in Documentation/devicetree/bindings/net/qcom,ethqos.yaml
also uses phy-mode = "rgmii".

The series, up to and including "net: stmmac: qcom-ethqos: add Shikra
EMAC support", does not convert any of these files. The current mainline
DTBs would therefore hit this warning on every probe, and twice on
sa8540p-ride.

Should the DTS files and the binding example be converted first, or
should the warning wait until they are?

The text also does not name the recommended mode. Could the message
mention "rgmii-id"?

Moving to rgmii-id also takes more than a DT edit. In this driver,
RGMII_ID takes a different MAC path:

ethqos_fix_mac_speed_rgmii() {
    ...
	if (ethqos->phy_mode == PHY_INTERFACE_MODE_RGMII_ID) {
		rgmii_setmask(ethqos, SDCC_DLL_CONFIG_PDN, SDCC_HC_REG_DLL_CONFIG);
		rgmii_setmask(ethqos, SDCC_USR_CTL_DDR_BYPASS, SDCC_USR_CTL);

		ethqos_rgmii_id_macro_init(ethqos, speed);

		return;
	}
    ...
}

ethqos_set_clk_tx_rate() also uses a different link clock rate at
10/100M in this mode. No delay is added on the MAC side, so the PHY has to
add both the RX and TX delays.

If a board's PHY or PHY driver does not apply internal delays, could
following this warning break its RGMII link?

[Severity: Low]
Will this message repeat on deferred probe? The dev_warn() runs before
several steps in qcom_ethqos_probe() that can return -EPROBE_DEFER:

	ethqos->link_clk = devm_clk_get(dev, data->link_clk_name ?: "rgmii");
	...
	ethqos->serdes_phy = devm_phy_optional_get(dev, "serdes");
	...
	return devm_stmmac_pltfr_probe(pdev, plat_dat, &stmmac_res);

Each deferral runs qcom_ethqos_probe() again and prints the same warning
again. Could the warning move later in probe, after the steps that can
defer?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261017-shikra_ethernet-v3-0-26a8beb44b8f%40oss.qualcomm.com

