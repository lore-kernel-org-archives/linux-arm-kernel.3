Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF09AC982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 23:44:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QnMacYZsTiu91aBrdpT044ZXgSNU90vCzZjH5YJEaR8=; b=hxPJ2T9Nlcfcd/y+fA8QFF+vl8
	AZ9uT890VpbuMf0V+x0PaRFyARlgJiF4XEwN0rNUZl1zXEJcibXc/x2F7IpjibB1KG//lOkbCrhIF
	uBV8hKG9xDWAw6+x0DYJfPx/RYDXU9nE897BMTHljYjx32bvXa54TBilvukE5ABiyf2esM7uigAI9
	jEeoNWPx4yI3SUQyPd52PZ3guRFqHRaFDipPsr41UI87uloZjWpmYam/IFw0lAEhLesn+QyQDKhgl
	ad2geYgF+X6CRP6296PlY09sbCgInPuvPclUdxiZdvZRev8vPzETh4b+OUj8bw0P4aLpZCjDHWSc3
	Gugv+KUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8ngO-00000003hln-1UaA;
	Mon, 21 Sep 2026 23:44:24 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8nfi-00000003hLx-0vac;
	Mon, 21 Sep 2026 23:43:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AAFE343D62;
	Mon, 21 Sep 2026 23:43:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 27C021F00898;
	Mon, 21 Sep 2026 23:43:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790034221;
	bh=QnMacYZsTiu91aBrdpT044ZXgSNU90vCzZjH5YJEaR8=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=abG50pjxo97oID9LJyNoCvvx1bHpw0G7bkaDhgKsg52JHt4tluPc/0omuk5lXHCcT
	 EwbuX7kQ6mjQPkzUwls9qiW4M8CbHPWF6OAIlBfmc4gH3ZK6T3ttgElAchXKSy015I
	 7oD1DlafWHNMczh3OxEr/aesUcx1FsPztvV5MClQvERqfXqzMptWEP4oFzPB24j70r
	 lMYnQAfRjVudko70OpR/EETtw56CjidQjB8VJM8+jRapQLBhCyP8Cok3XL6nF8pv4t
	 CTCbjBy0DglmI8VTQdjXgI9EbfzTA9tsOYoTBgpy2OuYAsCXq/ifJIy+KvI75SkU2D
	 HNz5mcLBMGzqg==
Subject: Re: [PATCH net-next v7 03/11] phy: rockchip: naneng-combphy: add
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
Date: Mon, 21 Sep 2026 23:43:39 +0000
Message-ID: <179003421974.2160803.11569061351280580358@kernel.org>
In-Reply-To: <20260917204624.2427486-4-coiaprant@gmail.com>
References: <20260917204624.2427486-4-coiaprant@gmail.com>
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

Critical: 0 · High: 0 · Medium: 1 · Low: 0 (1)

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In drivers/phy/rockchip/phy-rockchip-naneng-combphy.c,
  rk3568_combphy_cfg() now writes PIPE_GRF_XPCS_CON0 bit 1…

Pre-existing issues:
- [Low] Concern (validated as pre-existing style, not a new defect): the
  newly added rockchip_combphy_param_write(priv->pipe_grf,…

--

phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

This adds a "rockchip,sgmii-mac-sel" DT property to the RK3568 naneng
combphy driver so the SGMII lane can be routed to either GMAC0 or GMAC1
through PIPE_GRF_XPCS_CON0 bit 1 (pipe_sgmii_mac_sel).  The property is
read in rockchip_combphy_parse_dt() and applied in rk3568_combphy_cfg()
when the PHY type is PHY_TYPE_SGMII.

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)

A couple of questions below.

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

[Severity: Medium]
In rockchip_combphy_parse_dt(), the return value of
device_property_read_u32() is discarded and priv->sgmii_mac_sel is
pre-seeded with 1, so "property absent" and "property = 1" become
indistinguishable later on.

Is that intentional, or should the presence of the property be tracked
separately so the write below can be skipped when the DT says nothing?

>  	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
>  	/* fallback to old behaviour */
>  	if (PTR_ERR(priv->phy_rst) == -ENOENT)

[ ... ]

> @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
>  		break;
>  
>  	case PHY_TYPE_SGMII:
> +		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
> +					     priv->sgmii_mac_sel > 0);

[Severity: Medium]
Following on from the parse above: does this end up writing
PIPE_GRF_XPCS_CON0 bit 1 on every RK3568 SGMII init, including on DTBs
that do not carry the new property?

rockchip_combphy_param_write() is not a read-modify-preserve; it always
asserts the hiword write-enable for the bit:

drivers/phy/rockchip/phy-rockchip-naneng-combphy.c:rockchip_combphy_param_write() {
	tmp = en ? reg->enable : reg->disable;
	mask = GENMASK(reg->bitend, reg->bitstart);
	val = (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);

	return regmap_write(base, reg->offset, val);
}

With .pipe_sgmii_mac_sel = { 0x0040, 1, 1, 0x00, 0x01 } that gives
mask = GENMASK(1, 1) and val = (tmp << 1) | (mask << BIT_WRITEABLE_SHIFT),
so bit 1 is latched to either 0 or 1 unconditionally.

Before this patch the driver never touched that bit, so whatever the
bootloader or a previous boot (kexec) left there survived PHY init.  Can a
board whose firmware routed SGMII to GMAC0, running an older DTB without
"rockchip,sgmii-mac-sel", now get the mux forced back to GMAC1 while the
MAC driving the link is still GMAC0?

The commit message says:

    The hardware reset value is 1 (GMAC1). If the property is set to 0,
    the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
    remains at GMAC1.

Is "remains at GMAC1" accurate given the bit is now actively programmed
rather than left alone?  Writing the bit only when
device_property_read_u32() actually succeeds would keep the change inert
for existing DTBs; otherwise it may be worth stating in the commit message
that the driver now takes ownership of this bit from firmware.

[Severity: Low]
This isn't a bug introduced by this patch, but a pre-existing convention
worth noting: the regmap_write() error returned by
rockchip_combphy_param_write() is discarded here, as it is at all of the
other call sites in this file, so SGMII init can report success with the
MAC mux left unprogrammed.

With the in-tree DT this cannot actually fail; arch/arm64/boot/dts/rockchip/rk356x-base.dtsi
declares the pipe-grf region as:

	pipegrf: syscon@fdc50000 {
		reg = <0x0 0xfdc50000 0x0 0x1000>;
	};

so offset 0x40 is well inside the regmap.  The neighbouring
pipe_xpcs_phy_ready write at the same offset 0x40 already ignores its
return value too.

>  		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260917204624.2427486-1-coiaprant%40gmail.com

