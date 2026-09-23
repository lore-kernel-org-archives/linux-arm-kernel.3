Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98294C982FE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 00:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KrTLmJOH3qQHlf8D5JBVUOsbPmlvEiygci/2Qr0+388=; b=MIpX2FxYGNiQ1KFlrsye4e5OLf
	UB2GQcJ6YMPvloXd6WRdUi3ueVRHC5g2HFel7LNkS3XsMjWV+UeyLVzE6zJ6o+uMday+wE0/W7ocb
	DzWC572V2eKn+WAeDff+eTUV1tYS2tMoXXWHr4u9Xdizs+twaASmc7j6FBxKEgci94ohRZC/MKPOg
	fXVX474wxdcFcNKdk3lMkzr6TEKkETaSYtH3w2t373Elm6ybSw+W0TZsp2sWH/+5VkHZ82EG8Ph6Z
	YwCDNkT9GXa0ZOvfa62fV3JW4svWmNK6BzGGBPIRGCftnrf8wE2O7FKF8RjrS2pCP7TLyB/dcFuzh
	cd8WVdvw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9B9a-00000006oVA-1hwp;
	Wed, 23 Sep 2026 00:48:06 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9B9V-00000006oUG-3A9B
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Sep 2026 00:48:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6A8BE4480B;
	Wed, 23 Sep 2026 00:48:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D4F611F0089A;
	Wed, 23 Sep 2026 00:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790124481;
	bh=KrTLmJOH3qQHlf8D5JBVUOsbPmlvEiygci/2Qr0+388=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=WXZixN5ay+uv5TCtRe5igg5k7wZscJ5KFpll5JYdYwCu/ZyaG8VDHN51irbkMyDTE
	 50rLG2MgS2u9JUhkl44j81Wjd2+CXPwjXru7ndwlVjEz38RosdzjhwKW6oGqbc3lHG
	 1dMPCgcyvXZ+giRUfMORZXh41nUJLUSQ+QJb8hTmvFOsVSvUx4abiTK84ru26By1gO
	 JnXywmUX9WMeZpkOGqIVOQ9iPzKKOx8HIMGYjY5igH67eGcLLUauUnf3GZqr9ebZO+
	 DpGrVy+yYCpZ9z4qg0O8eN1hWGJf2IxDtSw1K/5tRPX6sIeMt/yRURgYA7k9oWB//b
	 4m+EiYJo6snfw==
Subject: Re: [PATCH net-next v5 3/3] net: stmmac: sun8i: add support for
 Allwinner H616 EMAC1
From: netdev-bot+sashiko@kernel.org
To: james.hilliard1@gmail.com
Cc: richard.genoud@bootlin.com, maxime.chevallier@bootlin.com,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, wens@kernel.org, jernej.skrabec@gmail.com,
 samuel@sholland.org, mcoquelin.stm32@gmail.com, alexandre.torgue@foss.st.com,
 clabbe.montjoie@gmail.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, peppe.cavallaro@st.com, joabreu@synopsys.com,
 alastair@d-silva.org, mripard@kernel.org, netdev@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-stm32@st-md-mailman.stormreply.com, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, andre.przywara@arm.com
Date: Wed, 23 Sep 2026 00:47:59 +0000
Message-ID: <179012447945.2160803.2360278915736082504@kernel.org>
In-Reply-To: <20260921-submit-h616-emac1-v1-v5-3-ada661ed9e9b@gmail.com>
References: <20260921-submit-h616-emac1-v1-v5-3-ada661ed9e9b@gmail.com>
X-sashiko-severity: Low
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

Thank you for your contribution! Sashiko AI review found more severe
issue(s) in other patches of this series. This mail is only an FYI, in case
you want to address the nit picks below when you respin.

Low priority / nit picks for your consideration:

- [Low] The new `emac_variant_h616_emac1`
  (drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c:153-158) expresses…

--

net: stmmac: sun8i: add support for Allwinner H616 EMAC1

Adds an emac_variant for the H616 secondary EMAC, using a dedicated
system-control clock register at offset 0x34 and declaring RMII-only
support, plus the matching allwinner,sun50i-h616-emac1 compatible entry.

> diff --git a/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c b/drivers/net/ethernet/stmicro/stmmac/dwmac-sun8i.c
> index 9598c386bb216..0ea1860cf2031 100644
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
> +

[Severity: Low]
The commit message says the variant "supports only RMII at 10/100 Mbps"
and that the change will "enable only RMII", but does .support_rmii
actually restrict anything at runtime?

Grepping drivers/net/ethernet/stmicro/stmmac/ finds 21 references to
support_mii/support_rmii/support_rgmii, and all of them are the kernel-doc
block, the struct emac_variant member declarations and the per-variant
initializers. Nothing in the driver ever reads these fields.

The only place the interface mode is checked is the variant-independent
switch in sun8i_dwmac_set_syscon():

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

So with compatible = "allwinner,sun50i-h616-emac1" and phy-mode = "mii" or
"rgmii" in the device tree, does probe succeed while the EMAC1 clock
register at syscon offset 0x34 gets programmed for a pad mode and TX clock
source this instance does not implement, leaving a silently dead interface
rather than an error?

The driver also installs no phylink get_interfaces/supported_interfaces
callback, so stmmac takes the firmware-selected mode as supported.

In practice the restriction is only enforced by the binding, via the
allOf if compatible contains allwinner,sun50i-h616-emac1 then phy-mode
const: rmii clause in
Documentation/devicetree/bindings/net/allwinner,sun8i-a83t-emac.yaml, so a
device tree that passes dt_binding_check cannot reach the MII/RGMII cases.
The unread flags are an existing convention in this file (emac_variant_v3s
sets only .support_mii yet RMII and RGMII are accepted for it too).

Would it be worth either making sun8i_dwmac_set_syscon() consult
gmac->variant->support_* before writing the register, or rewording the
commit message so it does not claim the driver enables only RMII?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260921-submit-h616-emac1-v1-v5-0-ada661ed9e9b%40gmail.com

