Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B91B7C88E7B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 20:24:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZiBcmk8cWaqM0zhqdrD96cyC+N60s8OeNQrXU/Asq9E=; b=nXTfUuVMaNJo3XsRq4nqwhdmSO
	oGrJLbQ80LnenpaKSoOMYxXuQrJpWs4rPn53IykYRHj6PD9iwLgOn0HFGmtXVNV2Ae52F46GiVrVK
	NWp+kubdDprt91PjysBnZFKHHN18G43+6iw3nohEinlvib861rN+n/+S6ymoTrZACqlFgZuiqcRa1
	IM0yK6cNyx9UXpQeMpfSmBeQfSEv+nAu6o0tyA9wn213Nj3Qba0MzFRLC2+71cfvpjIRqvtziolwD
	d7ZdEzaGlUbrl9Pz9SNAIcvoh2+jwgZ4RwQiyVUKJHn04E9vZG9cI6hf1flYlQDfTLSg8IOu/+a4r
	zSBkIudA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEN-00000004aMp-47cr;
	Mon, 14 Sep 2026 20:24:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DEI-00000004aIY-0ODc;
	Mon, 14 Sep 2026 20:24:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 6564841A8A;
	Mon, 14 Sep 2026 20:24:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B1C931F0089B;
	Mon, 14 Sep 2026 20:24:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789417481;
	bh=ZiBcmk8cWaqM0zhqdrD96cyC+N60s8OeNQrXU/Asq9E=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=M2FLQpsM4Jpi8hGFsfsjLdGvoFDcPXyCVmBqtamWccxkqPPZ4jZzo3Hk203S0FUVe
	 IE/qBdWbEV6asBygalP5/8wGuWFAXF6AmYgigX3BzaO0RUvZBCr3EYXR/dPWA0MGXM
	 5uiNM9B1BeCfPQoeEoNkACOq54kXXALCzZhICB8eiMG8hH/zUWUPT7Rl4ZGdH+ZcqX
	 HDnhBbJcaGI9J3k0HcXI7mInhvY5HSUnNejDzVS8gYgtBV4IlbgD6mIiZ+S2marx4s
	 oSUzmDOuJzkYeWRP5CDcNNFSwgnQrcvRwvO1kMSIb2F8o9kr4ajQRbFB4Ti0OPKaEc
	 EktZ7M9fSj3uw==
Subject: Re: [PATCH net-next v5 03/11] phy: rockchip: naneng-combphy: add
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
Date: Mon, 14 Sep 2026 20:24:39 +0000
Message-ID: <178941747926.22033.15174869537556409251@kernel.org>
In-Reply-To: <20260913185849.907479-4-coiaprant@gmail.com>
References: <20260913185849.907479-4-coiaprant@gmail.com>
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

- [Low] In rk3568_combphy_cfg() (drivers/phy/rockchip/phy-rockchip-
  naneng-combphy.c:881-882) the newly added write of pipe_sgmii_mac_sel…

--

phy: rockchip: naneng-combphy: add SGMII MAC selection for RK3568

This adds a "rockchip,sgmii-mac-sel" DT property to pick whether the RK3568
SGMII interface is routed to GMAC0 or GMAC1 via PIPE_GRF_XPCS_CON0 bit 1.
The value is read in rockchip_combphy_parse_dt() and programmed from the
PHY_TYPE_SGMII branch of rk3568_combphy_cfg().

Link: https://dl.radxa.com/rock3/docs/hw/datasheet/Rockchip%20RK3568%20TRM%20Part1%20V1.1-20210301.pdf (Page 229)

One question about the commit message wording:

    The hardware reset value is 1 (GMAC1). If the property is set to 0,
    the driver routes SGMII to GMAC0; if set to 1 (or omitted), it
    remains at GMAC1.

Does "or omitted ... it remains at GMAC1" match the code?  The write in
rk3568_combphy_cfg() is unconditional, so in the omitted case the driver
does not leave the bit alone, it actively programs it to 1.  See the
inline comment below.

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
Since device_property_read_u32() leaves the output untouched on failure,
rockchip_combphy_parse_dt() ends up with priv->sgmii_mac_sel == 1 both when
the property says 1 and when the property is absent.  Is there a way for the
driver to express "leave the bit as firmware left it"?

Before this patch the kernel never touched PIPE_GRF_XPCS_CON0 bit 1, so a
board whose bootloader routed SGMII to GMAC0 kept that routing.  With this
change, a DT that instantiates the combphy as PHY_TYPE_SGMII but does not
carry the new property has the bit re-programmed to GMAC1 on every
phy_init().  Can that break such a board's SGMII link?

>  	priv->phy_rst = devm_reset_control_get_exclusive(dev, "phy");
>  	/* fallback to old behaviour */
>  	if (PTR_ERR(priv->phy_rst) == -ENOENT)
> @@ -873,6 +878,8 @@ static int rk3568_combphy_cfg(struct rockchip_combphy_priv *priv)
>  		break;
>  
>  	case PHY_TYPE_SGMII:
> +		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_sgmii_mac_sel,
> +					     priv->sgmii_mac_sel > 0);

[Severity: Low]
This write always happens, including in the "property omitted" case, and
rockchip_combphy_param_write() sets the write-enable mask along with the
value:

	tmp = en ? reg->enable : reg->disable;
	mask = GENMASK(reg->bitend, reg->bitstart);
	val = (tmp << reg->bitstart) | (mask << BIT_WRITEABLE_SHIFT);

	return regmap_write(base, reg->offset, val);

so with priv->sgmii_mac_sel defaulting to 1 the register gets
(0x1 << 1) | (GENMASK(1, 1) << 16), i.e. GMAC1 is forced.  Would it be
better to only issue this write when the property is actually present?

A second question: bit 1 of PIPE_GRF_XPCS_CON0 is a single SoC-wide mux,
while the property sits on a per-PHY node.  If two combphy instances that
share the same rockchip,pipe-grf syscon are both brought up as
PHY_TYPE_SGMII with different property values, the last phy_init() wins and
nothing is reported.  Should conflicting values be rejected or at least
warned about?

>  		rockchip_combphy_param_write(priv->pipe_grf, &cfg->pipe_xpcs_phy_ready, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_phymode_sel, true);
>  		rockchip_combphy_param_write(priv->phy_grf, &cfg->pipe_sel_qsgmii, true);
> @@ -984,6 +991,7 @@ static const struct rockchip_combphy_grfcfg rk3568_combphy_grfcfgs = {
>  	.con3_for_sata		= { 0x000c, 15, 0, 0x00, 0x4407 },
>  	/* pipe-grf */
>  	.pipe_con0_for_sata	= { 0x0000, 15, 0, 0x00, 0x2220 },
> +	.pipe_sgmii_mac_sel	= { 0x0040, 1, 1, 0x00, 0x01 },
>  	.pipe_xpcs_phy_ready	= { 0x0040, 2, 2, 0x00, 0x01 },

For what it is worth, the only in-tree SGMII consumer at the end of this
series, rk3568-photonicat.dts, sets rockchip,sgmii-mac-sel = <0>
explicitly, so no upstream DT changes behaviour today; the concern is about
out-of-tree or ported device trees and about the commit message wording.

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260913185849.907479-1-coiaprant%40gmail.com

