Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 534D5C982D0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 17 Sep 2026 19:29:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wz7ynco97WHqvgbZ/Bh5SA7Wz6otJSPrEA15/FgWv6w=; b=N28R0/d8ko5JKgin7hmsESmH+h
	KlllPI24DiZMhvUqW3qgUFeKhmhVmqsKvocucuO4y+vPj1LB/bI4DV7ZeAaZnC9uMbHfX2K9CuXez
	c0UyITOCjsQKgaX1y/Q2v+zMDcQu0uHtWVZ1tpWw584CzBF4jzbSXtrqCt7JCVYDqWCOmwv4CWerw
	siHdRjU1tNRerkwAj2WUsKAEZAyq9iALZjnSKd0ih08jfw0M/KBrah7frm3FCBK/ls9SlrRJQR+sE
	9xj1FWsYeqBuGlSBkHbUBGfQlT00i18L9ttBRSd9ZpXBPvh56l30TwfTGYFYJvb6mwmz92iJZSq6w
	sDjl52IQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7H07-0000000CFLs-0e7p;
	Thu, 17 Sep 2026 18:38:27 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7Gzr-0000000CFFQ-47Pi;
	Thu, 17 Sep 2026 18:38:12 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 96EB844002;
	Thu, 17 Sep 2026 18:38:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 164D31F000FF;
	Thu, 17 Sep 2026 18:38:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789670291;
	bh=wz7ynco97WHqvgbZ/Bh5SA7Wz6otJSPrEA15/FgWv6w=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=TDnBLQheIeWQmYvRhrxYPJhx8S25S8ThmPsf7SKU1+1N5fDmjsC1dqinkmY9AAvau
	 3tc8ofayc8hBOk11I0oC04ZSt35cNK9hRBz59poz1KajiUcUh1IUo59f+1rqGejDPz
	 wWFBukaqFKu5By7CI423UEG3rHcUg+BSgnV34Aru0xo9Z7+HPXTV79e2J6KikESd0G
	 A9RYx43ZM+oRQtcLJ0fnUogKaPAXmP2bOwjBanQ0hR3vtgs/QEwbkL3prjJRlzFced
	 XaUacDVhdebipIMtb+m6LgGs45/DH4dwXuqif2kw9yg4o6s+3E+Es44ZZuI479psTr
	 +jyOjiCELLXrA==
Subject: Re: [PATCH net-next v6 03/11] phy: rockchip: naneng-combphy: add
 SGMII MAC selection for RK3568
From: netdev-bot+sashiko@kernel.org
To: coiaprant@gmail.com
Cc: andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, heiko@sntech.de, vkoul@kernel.org,
 maxime.chevallier@bootlin.com, mcoquelin.stm32@gmail.com,
 alexandre.torgue@foss.st.com, prabhakar.mahadev-lad.rj@bp.renesas.com,
 romain.gantois@bootlin.com, hkallweit1@gmail.com, neil.armstrong@linaro.org,
 linux@armlinux.org.uk, shawn.lin@rock-chips.com, david@ixit.cz,
 netdev@vger.kernel.org, linux-rockchip@lists.infradead.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, linux-phy@lists.infradead.org,
 linux-stm32@st-md-mailman.stormreply.com, linux-renesas-soc@vger.kernel.org
Date: Thu, 17 Sep 2026 18:38:09 +0000
Message-ID: <178967028966.22033.2377561177851606071@kernel.org>
In-Reply-To: <20260915123802.1561724-4-coiaprant@gmail.com>
References: <20260915123802.1561724-4-coiaprant@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 1 potential
issue(s) to consider:

Critical: 0 · High: 0 · Medium: 0 · Low: 1

- [Low] drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:380-381 reads
  'rockchip,sgmii-mac-sel' with device_property_read_u32() for every…

--

phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

This adds a "rockchip,sgmii-mac-sel" DT property so the RK3568 SGMII
interface can be routed to GMAC0 or GMAC1 via the PIPE_GRF_XPCS_CON0
pipe_sgmii_mac_sel bit, defaulting to GMAC1 to match the hardware reset
value.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)

> diff --git a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> index 7843356a4dd47..7b867e7520064 100644
> --- a/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c
> +++ b/drivers/phy/rockchip/phy-rockchip-naneng-combphy.c

[ ... ]

> @@ -375,6 +377,9 @@ static int rockchip_combphy_parse_dt(struct device *dev, struct rockchip_combphy
>  
>  	priv->ext_refclk = device_property_present(dev, "rockchip,ext-refclk");
>  
> +	priv->sgmii_mac_sel = 1;
> +	device_property_read_u32(dev, "rockchip,sgmii-mac-sel", &priv->sgmii_mac_sel);
> +

[Severity: Low]
This isn't a bug for any schema-checked device tree, but would it be worth
reacting to the return value here?

The binding restricts the property to two values and to one compatible:

  rockchip,sgmii-mac-sel:
    $ref: /schemas/types.yaml#/definitions/uint32
    enum: [0, 1]
    default: 1

  ...
        rockchip,sgmii-mac-sel: true
    else:
      properties:
        rockchip,sgmii-mac-sel: false

In rockchip_combphy_parse_dt() the result of device_property_read_u32() is
dropped, so a malformed property (for example a zero-length or wrong-sized
cell, which returns -ENODATA/-EOVERFLOW and leaves the output untouched)
ends up indistinguishable from an explicit request for GMAC1.

The read also happens for every compatible, including rk3528/rk3562/rk3576/
rk3588 where the binding declares the property invalid; there the value is
parsed and then never used, since only rk3568_combphy_cfg() consumes it.

[ ... ]

> @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
>  		break;
>  
>  	case PHY_TYPE_SGMII:
> +		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
> +					     priv->sgmii_mac_sel > 0);

[Severity: Low]
Should out-of-range values be rejected rather than folded into GMAC1?

The "priv->sgmii_mac_sel > 0" test collapses the u32 to a boolean, so a
device tree with rockchip,sgmii-mac-sel = <2> (or 0xffffffff) that was never
run through dtbs_check gets the GMAC1 routing and rk3568_combphy_cfg() still
returns success, with nothing logged.

A range check in rockchip_combphy_parse_dt() returning -EINVAL, or at least
a dev_warn(), would make such a device tree visible instead of silently
selecting the default route.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915123802.1561724-1-coiaprant%40gmail.com

