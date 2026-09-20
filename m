Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 80C3CC982EB
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 20 Sep 2026 17:03:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sxi4AzxEIOT2AErdFjZXxdrhgAaTfW/VmGrSAynXI5w=; b=Ah9enITFF3R0gV/9m1w5SxW5bG
	WKdPTmcs28ijYssdxx9VyVwxtKlzl7iTUbxcp0LKFogwpG8/tVr+E8UPdjSIvIDn3J9pbtW/IMMEu
	MWiqL+/JaZY7oxaneuX9pvAYxcc/BZPhEo86J8cSERlDldZ3haSbiGTJemFecMgfiskzwvnNBc+5K
	zDRIwAi52dlD7Wzl9tMl7ltMQ0rowEzY4EM34Q/CfWsprIAU3qhJ3LgBbjgYWICo4APqLK14i/jzG
	JSr6J8p5nWVGRu0pPoAJ6viEPd1o3Xd2ir6nOH0DbxTEJm+j9yteVyZyVJ8JrGms7keovl+sTwYl+
	wJ4HY0Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8KwI-0000000097J-3zcG;
	Sun, 20 Sep 2026 17:02:54 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8KwF-00000000936-0Mu1
	for linux-arm-kernel@lists.infradead.org;
	Sun, 20 Sep 2026 17:02:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 1EAE260209;
	Sun, 20 Sep 2026 17:02:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 891751F00893;
	Sun, 20 Sep 2026 17:02:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789923769;
	bh=Sxi4AzxEIOT2AErdFjZXxdrhgAaTfW/VmGrSAynXI5w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=PfuH4UFXpsMG0D655ancdlsev0JCtjI7KQRw7GqgPSpO+dy30Fn2iWoGHFbCp+6aU
	 fXwbG0GbisoZSv9t/sWKu4NJ++6ffLmJIxSQ+9vFRlb0GCSSv4YttVg8eAiIPQ54GZ
	 uEX/wk3ldtUDZQg1VuvVnc3PTUGDeRZr87c1VDv2yzWIvbVbQBWXT8Vnf5YkwXhKx+
	 3HJN3baOxcuwIoZO/Z9PM6S8sVXJTSnG0/7MNgF2Ko0fPJFQjHva5berYREGiSp82e
	 Png5BqwN/ZLAXWJrakdJafsbqPlo/9jQkDaQvl7Tr8xw+MoFzrsshzIWuk6Kiuunqx
	 CXWwEQcPpZh5w==
Subject: Re: [PATCH net-next v3 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: richard.genoud@bootlin.com, andrew+netdev@lunn.ch, davem@davemloft.net,
 edumazet@google.com, kuba@kernel.org, pabeni@redhat.com, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, wens@kernel.org,
 jernej.skrabec@gmail.com, samuel@sholland.org, alexandre.torgue@foss.st.com,
 peppe.cavallaro@st.com, joabreu@synopsys.com, maxime.chevallier@bootlin.com,
 mcoquelin.stm32@gmail.com, mripard@kernel.org, alastair@d-silva.org,
 netdev@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com
Date: Sun, 20 Sep 2026 17:02:48 +0000
Message-ID: <178992376814.2160803.7753352020074814044@kernel.org>
In-Reply-To: <20260917-submit-h616-emac1-v1-v3-3-62cb8316e19b@gmail.com>
References: <20260917-submit-h616-emac1-v1-v3-3-62cb8316e19b@gmail.com>
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

- [Medium] The new `emac_variant_h616_emac1` in
  drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c (lines 153-158)…

--

net: stmmac: sun8i: add support for Allwinner H616 EMAC1

Adds a new emac_variant for the H616 secondary EMAC, pointing at a
dedicated syscon clock register at offset 0x34, and registers the
allwinner,sun50i-h616-emac1 compatible.  The variant is described as
RMII-only with the PHY handled by the co-packaged AC200/AC300 driver.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 4523a14f5e0c3..1020168f1c3a0 100644
> --- a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> +++ b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> @@ -81,6 +81,13 @@ static const struct reg_field sun8i_syscon_reg_field = {
>  	.msb = 31,
>  };
>  
> +/* EMAC1 clock register @ 0x34 in the "system control" address range */
> +static const struct reg_field sun8i_syscon_reg_field_emac1 = {
> +	.reg = 0x34,
> +	.lsb = 0,
> +	.msb = 31,
> +};
> +
>  /* EMAC clock register @ 0x164 in the CCU address range */
>  static const struct reg_field sun8i_ccu_reg_field = {
>  	.reg = 0x164,

[ ... ]

> @@ -143,6 +150,13 @@ static const struct emac_variant emac_variant_h6 = {
>  	.tx_delay_max = 7,
>  };
>  
> +static const struct emac_variant emac_variant_h616_emac1 = {
> +	.syscon_field = &sun8i_syscon_reg_field_emac1,
> +	/* The co-packaged AC200/AC300 PHY does not use the H3 PHY controls. */
> +	.soc_has_internal_phy = false,
> +	.support_rmii = true,
> +};

[Severity: Medium]
The commit message says "Add an EMAC1 variant using the dedicated register
and enable only RMII".  Where is support_rmii actually consumed?

Grepping drivers/net/ethernet/stmicro/stmmac/ at this commit, every
occurrence of support_mii/support_rmii/support_rgmii is either the
kernel-doc line for struct emac_variant, the bool member declaration, or a
per-variant initializer.  There is no variant->support_* read anywhere in
the tree, so setting only .support_rmii here has no runtime effect.

The one interface-mode gate left in the driver is variant agnostic, in
sun8i_dwmac_set_syscon():

	switch (plat->phy_interface) {
	case PHY_INTERFACE_MODE_MII:
		/* default */
		break;
	case PHY_INTERFACE_MODE_RGMII:
	case PHY_INTERFACE_MODE_RGMII_ID:
	case PHY_INTERFACE_MODE_RGMII_RXID:
	case PHY_INTERFACE_MODE_RGMII_TXID:
		reg |= SYSCON_EPIT | SYSCON_ETCS_INT_GMII;
		break;
	case PHY_INTERFACE_MODE_RMII:
		reg |= SYSCON_RMII_EN | SYSCON_ETCS_EXT_GMII;
		break;
	default:
		dev_err(dev, "Unsupported interface mode: %s",
			phy_modes(plat->phy_interface));
		return -EINVAL;
	}

	regmap_field_write(gmac->regmap_field, reg);

With compatible = "allwinner,sun50i-h616-emac1" and phy-mode = "rgmii",
does this probe successfully and program SYSCON_EPIT |
SYSCON_ETCS_INT_GMII into the new EMAC1 clock register at syscon 0x34?
And with phy-mode = "mii", is SYSCON_RMII_EN simply left clear?  Both
select a clock/pin routing this instance does not have, with no -EINVAL and
no message logged.

Nothing downstream re-adds the restriction either: dwmac-sun8i provides no
get_interfaces callback, so stmmac_phylink_setup() just accepts whatever
firmware picked:

	if (phy_interface_empty(config->supported_interfaces))
		__set_bit(priv->plat->phy_interface,
			  config->supported_interfaces);

That leaves the RMII-only constraint expressed only in the binding added by
the preceding patch in the series, "dt-bindings: net: allwinner: add H616
EMAC1" (phy-mode: const: rmii for this compatible), which is checked by
dtbs_check at build time rather than at probe time.

Would it make sense to reject non-RMII modes for this variant in
sun8i_dwmac_set_syscon(), or to start reading variant->support_* there?

On a related note, the commit message says the block "supports only RMII at
10/100 Mbps", but sun8i_dwmac_setup() still advertises gigabit for every
variant, including this one:

	mac->link.caps = MAC_ASYM_PAUSE | MAC_SYM_PAUSE |
			 MAC_10 | MAC_100 | MAC_1000;

Should the H616 EMAC1 variant also limit link.caps to MAC_10 | MAC_100?

> +
>  #define EMAC_BASIC_CTL0 0x00
>  #define EMAC_BASIC_CTL1 0x04
>  #define EMAC_INT_STA    0x08
> @@ -1276,6 +1290,8 @@ static const struct of_device_id sun8i_dwmac_match[] = {
>  		.data = &emac_variant_a64 },
>  	{ .compatible = "allwinner,sun50i-h6-emac",
>  		.data = &emac_variant_h6 },
> +	{ .compatible = "allwinner,sun50i-h616-emac1",
> +		.data = &emac_variant_h616_emac1 },
>  	{ }
>  };
>  MODULE_DEVICE_TABLE(of, sun8i_dwmac_match);

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917-submit-h616-emac1-v1-v3-0-62cb8316e19b%40gmail.com

