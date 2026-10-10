Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2EE9FCA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 16:19:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CEh+OP+AcjYhR6oKB2h8hBH3yA6V2LOkzyhQyArnj+A=; b=EOSNrGMLgCK0fmjQhn4Y91dDCE
	WDkMuVUlMRh6aQGbUypoJBdc8Y/ekMs9WNx7tNb21+21/+heruUgP5pXEvh5+b2AXF3kYMqgXeTaO
	tOfFvBH37uMNT2VMH1DmrjvsqVdT9FghyoNUB2CbUYqqbKgsrbJDcjzjERFT5q1630OOCBaS5aDx+
	K76QxOkYjTmICC0NZxque3JvM6+/sPPZqqU3G+VKt404xAhlwHTW0XVXLzPR3aAw8/tOtiDLNRNeZ
	sCEZ+JHHtv3820gXoJ1K5KgNGSMQQfvXf4YSKdjEDmsoQOWRUoEv7QVGJJc/i29i/MAg47aH/2Oxb
	e3AO/m6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZn8-00000008FqT-2pir;
	Sat, 10 Oct 2026 16:19:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZn3-00000008FpH-1DpF;
	Sat, 10 Oct 2026 16:19:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A920244812;
	Sat, 10 Oct 2026 16:19:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D73691F000FF;
	Sat, 10 Oct 2026 16:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649156;
	bh=CEh+OP+AcjYhR6oKB2h8hBH3yA6V2LOkzyhQyArnj+A=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Ualu43NzJCXN1uI9AIW5f3AkQM2OGnJiDfICaNKenL5MPZlyKcfQskaWmpMhTNToC
	 4WTGUG9s9ycqc7uaCf9WgZHdEVxXuVNMiruNac4Vi8igrKi3k2odJaJZp3cYtXxmIu
	 hNaLMjoGKPR81Scq9NNT55Whmd8r/qQEEJ9W2seixXgEQMVXcaOXvORTE9zOELR5e0
	 e522Pztz3SYdS4bzU7/eUg6lDPzFDSihT3Fiq20X06tfYk1eSyxfw4hoRDw9WUwG6B
	 ruQG1dRA/sD0j1wDE/95m9OsMFgg1VfOO625MBNnIvXUgrOpd9fnnQ6we/DaWkB2d7
	 slACVnEUs8uDw==
Subject: Re: [PATCH net-next v25 03/10] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
From: netdev-bot+sashiko@kernel.org
To: ansuelsmth@gmail.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@kernel.org,
 kuba@kernel.org, pabeni@redhat.com, olteanv@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 horms@kernel.org, joey@tinyisr.com, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 andrew@lunn.ch
Date: Sat, 10 Oct 2026 16:19:14 +0000
Message-ID: <179164915433.434549.5287414575554706963@kernel.org>
In-Reply-To: <20261009161102.38961-4-ansuelsmth@gmail.com>
References: <20261009161102.38961-4-ansuelsmth@gmail.com>
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

- [Medium] The two AN8855 binding examples disagree on how the internal
  PHYs are accessed.

--

dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC

This commit adds a YAML binding for the Airoha AN8855 Switch SoC. The SoC
exposes an Ethernet switch, an eFUSE NVMEM provider and internal Ethernet
PHYs. The example puts the internal PHYs on a nested mdio node.

> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> new file mode 100644
> index 0000000000000..48127e956c965
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> @@ -0,0 +1,176 @@

[ ... ]

> +            mdio {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                internal_phy1: ethernet-phy@1 {
> +                  compatible = "ethernet-phy-idc0ff.0410",
> +                               "ethernet-phy-ieee802.3-c22";

[Severity: Medium]
This example gives the internal PHYs the ethernet-phy-ieee802.3-c22
compatible. The PHY binding added earlier in this series uses the C45
compatible for the same PHY ID:

Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml:
        ethernet-phy@1 {
            compatible = "ethernet-phy-idc0ff.0410",
                         "ethernet-phy-ieee802.3-c45";

Which of the two is correct?

The PHY binding selects on ethernet-phy-idc0ff.0410, so it also applies
to the PHY nodes nested here. Its $ref to ethernet-phy.yaml accepts both
c22 and c45, which means dt_binding_check won't catch the mismatch.

Later in the series, the MFD driver puts each PHY on a bus created with
devm_mdio_regmap_register(). That bus only provides C22 accessors:

drivers/net/mdio/mdio-regmap.c:devm_mdio_regmap_register()
    mii->read = mdio_regmap_read_c22;
    mii->write = mdio_regmap_write_c22;

Would a board DT that copies the PHY binding example end up on this path?

an8855_core_probe()
  fwnode_mdiobus_register_phy()      /* is_c45 is true */
    get_phy_device(bus, addr, true)
      get_phy_c45_ids()
        get_phy_c45_devs_in_pkg()
          mdiobus_c45_read()
            __mdiobus_c45_read()     /* -EOPNOTSUPP, no read_c45 */

That error turns into -EIO. an8855_core_probe() then jumps to
err_put_fwnodes, so the switch, eFUSE and PHYs never get registered.

The switch binding says its registers are reached by configuring the PHY
page. That also points to C22 access.

Should the PHY binding example use ethernet-phy-ieee802.3-c22, or drop the
C45 compatible, so the two bindings agree?

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009161102.38961-1-ansuelsmth%40gmail.com

