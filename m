Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7154EC982C4
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 12:20:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fEFhzHMPOvWbVMmoEUILoLP5Uzr9QE7En/pY6cDBeSo=; b=1EesLPIIA2pyDcE6tm9W/GMchc
	7bgQPlI+Ifci8E9iwwEo+lf1Yph+OX1qnK9oA4XmdMEWiE8wHB0+NVeTA7TDS+UEQuRSWi8lz8+V4
	gdybF+OP1fd8EzsjRaEMu4c1h+izNZWnXNHAcilGQU0CfTo700ZQZ7HvyhEZeRzMND3vHleIQBjmA
	yfAILHTrWPPJgtvPpbDPvxipX5OWyuBZfRipXnOj5oSgl0hunpoGpCEef9lEREvRPnD4pBFemTE5e
	vWnW8GRahn8VSp6JtIgCNlR+0dfsrQPgHtdA1Lk1zKRtYuAKww1f7Qn7ztHbq2nQFlatNW98VHc/I
	4sZGucnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ocJ-000000099o9-38Ip;
	Wed, 16 Sep 2026 12:19:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6ocJ-000000099nz-0FVW;
	Wed, 16 Sep 2026 12:19:59 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 837EC43C8F;
	Wed, 16 Sep 2026 12:19:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 588BA1F000FF;
	Wed, 16 Sep 2026 12:19:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789561198;
	bh=fEFhzHMPOvWbVMmoEUILoLP5Uzr9QE7En/pY6cDBeSo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=VETJ3404ZnXG12u1D26Ca2+XB8zTtwldgtksvFJ2Kjn7u1N0NC+CWdcTJu5V+X3F4
	 dStzW7ovl2Z3UWJOypGRErX5cAMtMadHbvOgtGJ50PmI5a7Qt78AuJo7ZXpt6jJ2iA
	 mf9BxlyFdC17517819knDAMxMgirrnaLiLMJimRS5GlVndwK1UX6GNx5fXacXjOzdc
	 exuXuCDgvodioicIU235GxKd3k5EsPwAk/9YeI27OtCWnCx2yxOp4uzw1RGonO+4pY
	 jFPUmEDyAK84nJ6lwe+z6tE2fGD65rmKpQFZpjYIr4QJ3WFEYAZbKQqwbvdTq3uRB/
	 s+8DRvBlxpkIQ==
Subject: Re: [PATCH v5 net-next] net: phy: mediatek: support MT7530 PHYs on
 EN71221 MCM
From: netdev-bot+sashiko@kernel.org
To: cjd@cjdns.fr
Cc: netdev@vger.kernel.org, daniel@makrotopia.org, dqfext@gmail.com,
 SkyLake.Huang@mediatek.com, andrew@lunn.ch, hkallweit1@gmail.com,
 linux@armlinux.org.uk, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 srherobrine20@gmail.com
Date: Wed, 16 Sep 2026 12:19:56 +0000
Message-ID: <178956119685.22033.3792668833363404378@kernel.org>
In-Reply-To: <20260915113427.113296-1-cjd@cjdns.fr>
References: <20260915113427.113296-1-cjd@cjdns.fr>
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

Critical: 0 · High: 1 · Medium: 1 · Low: 1

- [High] The new MCM detection in en751221_is_mcm_phy()
  (drivers/net/phy/mediatek/mtk-ge.c:138-144) tests the MDIO bus *parent…
- [Medium] mt7530_is_gphy() (drivers/net/phy/mediatek/mtk-ge.c:150-154)
  masks the raw return value of phy_read(phydev, MII_ESTATUS) with…
- [Low] The commit subject reads "net: phy: mediatek: support MT7530 PHYs
  on EN71221 MCM" while the commit body, the new code…

--

net: phy: mediatek: support MT7530 PHYs on EN71221 MCM

This adds a second phy_driver entry for MTK_GPHY_ID_MT7530 with an extra
register sequence for the EcoNet EN751221 multi-chip module, selects
between the two entries with new match_phy_device callbacks, and skips
MT7530-ID PHYs that report no gigabit support.

> net: phy: mediatek: support MT7530 PHYs on EN71221 MCM

[Severity: Low]
This isn't a bug, but the subject says EN71221 while the body, the code
(en751221_is_mcm_phy(), en751221_mcm_phy_config_init(), the driver name
"EcoNet EN751221 MCM PHY"), the compatible "econet,en751221" and every
other in-tree reference say EN751221.  Grepping the tree finds no
EN71221 identifier at all.

> diff --git a/drivers/net/phy/mediatek/mtk-ge.c b/drivers/net/phy/mediatek/mtk-ge.c
> index 96d8ac5154e5e..eddb66218d7c0 100644
> --- a/drivers/net/phy/mediatek/mtk-ge.c
> +++ b/drivers/net/phy/mediatek/mtk-ge.c

[ ... ]

> @@ -101,6 +102,69 @@ static int mt7530_phy_config_init(struct phy_device *phydev)
>  	return 0;
>  }
>  
> +/*
> + * The EcoNet EN751221 "G" multi-chip module MT7530 requires additional PHY
> + * configuration.
> + */
> +static int en751221_mcm_phy_config_init(struct phy_device *phydev)
> +{
> +	int ret;
> +
> +	ret = genphy_soft_reset(phydev);
> +	if (ret)
> +		return ret;

[ ... ]

> +static bool en751221_is_mcm_phy(struct phy_device *phydev)
> +{
> +	struct device *parent = phydev->mdio.bus->parent;
> +
> +	return parent && parent->of_node &&
> +	       of_device_is_compatible(parent->of_node, "econet,en751221");
> +}

[Severity: High]
Can this predicate ever return true?

"econet,en751221" is documented only as a machine compatible on the DT
root node:

Documentation/devicetree/bindings/mips/econet.yaml
  properties:
    $nodename:
      const: '/'
    compatible:
      oneOf:
        - description: Boards with EcoNet EN751221 family SoC
          items:
            - enum:
                - smartfiber,xp8421-b
            - const: econet,en751221

and the only in-tree users put it on '/':

arch/mips/boot/dts/econet/en751221.dtsi
  / {
        compatible = "econet,en751221";

arch/mips/boot/dts/econet/en751221_smartfiber_xp8421-b.dts
  / {
        model = "SmartFiber XP8421-B";
        compatible = "smartfiber,xp8421-b", "econet,en751221";

The node handed to of_device_is_compatible() here is the MDIO bus parent
device, which for MT7530-internal PHYs is the switch device:

drivers/net/dsa/mt7530.c:mt7530_setup_mdio() {
    ...
	bus->parent = dev;
    ...
}

of_device_is_compatible() only inspects the compatible list of the node it
is given, so a switch node that is a child of '/' will not match a root
node compatible.  Does that make en751221_phy_match() always return zero,
leaving the new "EcoNet EN751221 MCM PHY" entry and
en751221_mcm_phy_config_init() unreachable, with mt7530_phy_match()
binding the plain MT7530 entry on the MCM hardware instead?

Would matching the switch's own compatible work better here?  The EcoNet
MCM switch already has one in-tree:

drivers/net/dsa/mt7530-mmio.c
  { .compatible = "econet,en7528-switch", .data = &mt753x_table[ID_EN7528], },

Alternatively, of_machine_is_compatible("econet,en751221") would test the
root node, or a new documented compatible for the MCM switch/MDIO node
could be added.

> +
> +/*
> + * MTK_GPHY_ID_MT7530 ID is also used for an EcoNet SoC FE phy, but that PHY
> + * does not advertise ESTATUS_1000_TFULL.
> + */
> +static bool mt7530_is_gphy(struct phy_device *phydev)
> +{
> +	return phydev->phy_id == MTK_GPHY_ID_MT7530 &&
> +	       (phy_read(phydev, MII_ESTATUS) & ESTATUS_1000_TFULL) != 0;
> +}

[Severity: Medium]
Should the phy_read() return value be checked for an error before it is
masked?

ESTATUS_1000_TFULL is 0x2000, i.e. bit 13, and every small negative errno
has bit 13 set in two's complement (-EIO is 0xfffffffb, -ETIMEDOUT is
0xffffff92).  So a failed MDIO read makes mt7530_is_gphy() report
"gigabit capable", which is the opposite of the intended exclusion of the
FE PHY that shares MTK_GPHY_ID_MT7530.

phy_bus_match() returns the callback result verbatim:

drivers/net/phy/phy_device.c:phy_bus_match() {
    ...
	if (phydrv->match_phy_device)
		return phydrv->match_phy_device(phydev, phydrv);
    ...
}

so on a transient bus error the FE PHY would be claimed and programmed
with the GbE sequence in en751221_mcm_phy_config_init() (paged write of
0x3a04, MMD VEND2 0x0417, VEND1 0xa6 and 0x12) or mt7530_phy_config_init().

Should MII_ESTATUS also be gated on BMSR_ESTATEN, the way phylib does it
elsewhere?

drivers/net/phy/phy_device.c:genphy_read_abilities() {
    ...
	if (val & BMSR_ESTATEN) {
		val = phy_read(phydev, MII_ESTATUS);
		if (val < 0)
			return val;
    ...
}

Without that check, the value read from register 15 on a PHY that does not
implement it is not defined by Clause 22.

> +
> +static int mt7530_phy_match(struct phy_device *phydev,
> +			    const struct phy_driver *phydrv)
> +{
> +	return mt7530_is_gphy(phydev) && !en751221_is_mcm_phy(phydev);
> +}
> +
> +static int en751221_phy_match(struct phy_device *phydev,
> +			      const struct phy_driver *phydrv)
> +{
> +	return mt7530_is_gphy(phydev) && en751221_is_mcm_phy(phydev);
> +}
> +
>  static int mt7531_phy_config_init(struct phy_device *phydev)
>  {
>  	mtk_gephy_config_init(phydev);
> @@ -135,6 +199,23 @@ static struct phy_driver mtk_gephy_driver[] = {
>  		 */
>  		.config_intr	= genphy_no_config_intr,
>  		.handle_interrupt = genphy_handle_interrupt_no_ack,
> +		.match_phy_device = mt7530_phy_match,
> +		.suspend	= genphy_suspend,
> +		.resume		= genphy_resume,
> +		.read_page	= mtk_phy_read_page,
> +		.write_page	= mtk_phy_write_page,
> +	},
> +	{
> +		PHY_ID_MATCH_EXACT(MTK_GPHY_ID_MT7530),
> +		.name		= "EcoNet EN751221 MCM PHY",
> +		.probe		= mt7530_phy_probe,
> +		.config_init	= en751221_mcm_phy_config_init,
> +		/* Interrupts are handled by the switch, not the PHY
> +		 * itself.
> +		 */
> +		.config_intr	= genphy_no_config_intr,
> +		.handle_interrupt = genphy_handle_interrupt_no_ack,
> +		.match_phy_device = en751221_phy_match,
>  		.suspend	= genphy_suspend,
>  		.resume		= genphy_resume,
>  		.read_page	= mtk_phy_read_page,

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260915113427.113296-1-cjd%40cjdns.fr

