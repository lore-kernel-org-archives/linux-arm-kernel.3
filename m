Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 901E3CA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:35:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sh4qxehA1sx2vDYeAmAozq0PGtGDmtydJBAmf0IsWF4=; b=dOT3/Uqzt1P2JIwNmwdk0yMGjT
	ALmUiXTNIdgHHrfD1+LObkqL2CcRsAwU4QaO6N55Qfia7LNErMztk5KkkadagEgdPgCqLq1OXJiXp
	k885YPV1hdVfW1ptbog0lgw6zOBqQbiMUtLqvW7EC5l3M5LDKbVaD5ScBDzwgU/IrOuAnKtfQV1DS
	eXaqu2dTv4jVwxz0Af/3xEXxT6MsNNWb6+1BeMfe+DLmEz3tGbWBgpjCF7y3S26qVs+tMQCk2F4l6
	OcNgCOvjgjlCIxcyL7TohD3ROjMTot+s6wn0gY0lrYWKu1nUsWcfWfLlh4RHBVWiguaTG/bia8PW8
	h61b8LMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeXY-00000004V2V-3Gv0;
	Tue, 29 Sep 2026 20:35:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeXX-00000004V1x-3iX0;
	Tue, 29 Sep 2026 20:35:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 97C67438A9;
	Tue, 29 Sep 2026 20:35:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45C111F00893;
	Tue, 29 Sep 2026 20:35:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714103;
	bh=sh4qxehA1sx2vDYeAmAozq0PGtGDmtydJBAmf0IsWF4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Xj6N2xdFIi2RAHaYSlRw5HWY5+UHpfl5KIUikUnB65QDBpYx4Nr0cPKs5GDIdx/uP
	 ysnjB3K1iL7Zo3Tjwbu+PKEpa/d4W1+mwJk6uIO9Jlw9VTsN4mh67NPxLpWkU1tFZE
	 zVGi4+5jp1oiodW1OYDyj0X25t9yiShWwLY9lEL54E/cBtocbF3Wd15E49b7tJV1AF
	 fQKEht0W3q0baQa25JC4fnLIduXrUjy+CtnsW/MZjzdexWqWZ56/N98MFr5GDsNtOC
	 EzHhL2oXOyiCJ7dWdUYLIWrFB5xusZ8kgdNerQTqzxlVlGcDjHNDgutea1daB+HA8s
	 CftTuh5bA7d7w==
Subject: Re: [PATCH net-next v23 3/9] dt-bindings: mfd: Document support for
 Airoha AN8855 Switch SoC
From: netdev-bot+sashiko@kernel.org
To: ansuelsmth@gmail.com
Cc: lee@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrew+netdev@lunn.ch, davem@davemloft.net, edumazet@google.com,
 kuba@kernel.org, pabeni@redhat.com, olteanv@gmail.com, matthias.bgg@gmail.com,
 angelogioacchino.delregno@collabora.com, chester.a.unal@arinc9.com,
 daniel@makrotopia.org, hkallweit1@gmail.com, linux@armlinux.org.uk,
 horms@kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, netdev@vger.kernel.org,
 mfd@lists.linux.dev, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Date: Tue, 29 Sep 2026 20:35:01 +0000
Message-ID: <179071410185.434549.1910025420633087722@kernel.org>
In-Reply-To: <20260925182435.21207-4-ansuelsmth@gmail.com>
References: <20260925182435.21207-4-ansuelsmth@gmail.com>
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

- [Medium] Two bindings added in this series disagree on which MDIO
  clause the same AN8855 internal PHY (ethernet-phy-idc0ff.0410) uses.

--

dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC

This commit adds a DT binding for the Airoha AN8855 Switch SoC. The SoC
exposes an Ethernet switch, an efuse NVMEM provider and internal Ethernet
PHYs on an mdio subnode. The example shows the full layout, including the
nvmem cells the internal PHYs use.

> diff --git a/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml
> new file mode 100644
> index 0000000000000..48127e956c965
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/mfd/airoha,an8855.yaml

[ ... ]

> +            mdio {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                internal_phy1: ethernet-phy@1 {
> +                  compatible = "ethernet-phy-idc0ff.0410",
> +                               "ethernet-phy-ieee802.3-c22";

[Severity: Medium]
This example describes the internal PHY (ethernet-phy-idc0ff.0410) as
ethernet-phy-ieee802.3-c22. The PHY binding added later in this series,
Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml, describes
the same PHY as ethernet-phy-ieee802.3-c45 in its ethernet-phy@1 and
ethernet-phy@2 examples. Which one is intended?

The drivers later in the series suggest c22 is correct. The MFD core
registers each PHY on an mdio-regmap bus, and devm_mdio_regmap_register()
sets up only the C22 ops:

drivers/net/mdio/mdio-regmap.c:devm_mdio_regmap_register() {
    ...
    mii->read = mdio_regmap_read_c22;
    mii->write = mdio_regmap_write_c22;
    ...
}

bus->read_c45 is never set.

Now take a board DT that copies the c45 example from the PHY binding.
an8855_core_probe() would register each PHY like this:

an8855_core_probe()
  fwnode_mdiobus_register_phy()      /* is_c45 = true */
    get_phy_device(bus, addr, true)
      get_phy_c45_ids()
        get_phy_c45_devs_in_pkg()
          mdiobus_c45_read()         /* -EOPNOTSUPP, no read_c45 */

get_phy_c45_devs_in_pkg() turns that error into -EIO. The failure then
goes through err_put_fwnodes in an8855_core_probe().

Wouldn't that fail the whole AN8855 core probe, and with it the switch
and efuse children? The schema can't catch this because both compatibles
are valid under ethernet-phy.yaml.

This example looks correct. Should the c45 examples in
airoha,an8855-phy.yaml be changed to c22 so the two bindings match?

> +                  reg = <1>;
> +
> +                  nvmem-cells = <&shift_sel_port0_tx_a>,
> +                      <&shift_sel_port0_tx_b>,
> +                      <&shift_sel_port0_tx_c>,
> +                      <&shift_sel_port0_tx_d>;
> +                  nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +                };
> +
> +                internal_phy2: ethernet-phy@2 {
> +                  compatible = "ethernet-phy-idc0ff.0410",
> +                               "ethernet-phy-ieee802.3-c22";

[ ... ]

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925182435.21207-1-ansuelsmth%40gmail.com

