Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA9D8CA9EBE
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 10 Oct 2026 16:19:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yn2lBah6xI+UynibkzP0mMoar1PQ6rju9miwSdYL3cg=; b=NpKoYwpZ6Anf7ow1Zs6umB5zML
	ycBFyBLqG6Uh0MbwucrESaB4IqclE1br9LJWYHrI/u8XMMRQVPCYTh2YBv1yLOZkaVNxG2Bqzx5BE
	+oGd1aQaZMcGQA5dbtbkiMGVtkXoICJP7h9LPGBd0gVqWFJV+Nv1cVrlRbZtSB+/LWMv0c/WzSRnI
	su5df133YeRRIrLm80BhTSpURHftKVaXKl9c6AFjS9t63sfCDn9NYwyr381nJCSlGf8EKZjGEjFrH
	1PzfgHUcB0xsFXgqTvh2See6oCE1SzFFZC/t2aCGqWKiPz8XftpM8GyySsa4etTXaXvLOOyGUb66n
	y32DEG3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZn8-00000008FqB-2Q4i;
	Sat, 10 Oct 2026 16:19:22 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xFZn1-00000008FpE-3FP1;
	Sat, 10 Oct 2026 16:19:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 791DE600D4;
	Sat, 10 Oct 2026 16:19:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9A9CC1F00893;
	Sat, 10 Oct 2026 16:19:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791649154;
	bh=Yn2lBah6xI+UynibkzP0mMoar1PQ6rju9miwSdYL3cg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=GA5hs3b3tl0ADvVrI8j6CezxXK0m12HIsRI3rRPXOqkJXU9fY1lkvyNRTEJQJi7JZ
	 600cNvV1uBU6k7EPoOeh2OONUWKy9UrHbrhXRBTeH9OnyWRJnySnmKAU8HgvgvBwLP
	 rQQOK+/DsLSBflUoYj5s/kWtjGce7ac6kFjwW2M1s/vaJaUUsbLieApTm/DB4eC1x1
	 IDYLO+UA9Q8AYPRhK97cJiPUR8PzrLNL2Nyr7f9x9+89nCN9Rg4TAlUXzUDXba4AtQ
	 qnku2AOCkOGUrKC241nomPniShwmPjgXwGcOjnICITRdSc/KEeVS+BWSqVAX6W3QLY
	 0MGhUuL3E89Dg==
Subject: Re: [PATCH net-next v25 02/10] dt-bindings: net: Document support for
 AN8855 Switch Internal PHY
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
Date: Sat, 10 Oct 2026 16:19:12 +0000
Message-ID: <179164915210.434549.18428989361576378283@kernel.org>
In-Reply-To: <20261009161102.38961-3-ansuelsmth@gmail.com>
References: <20261009161102.38961-3-ansuelsmth@gmail.com>
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

Thank you for your contribution! Sashiko AI review found 2 potential
issue(s) to consider.

Critical: 0 · High: 0 · Medium: 1 · Low: 1

If you believe none of the issues are legitimate, please reply to each
issue of Medium severity or higher and explain why the AI is wrong.
If any of them are legitimate and you plan to respin, please let patchwork
know by including "pw-bot: cr" as a separate line at the end of your reply
(one such reply per series is enough).

- [Medium] In the example of
  Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml, both PHY…
- [Low] In the example of
  Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml,…

--

dt-bindings: net: Document support for AN8855 Switch Internal PHY

This adds a YAML binding for the internal PHYs of the Airoha AN8855
5-port Gigabit Switch. These PHYs are exposed on the MDIO bus. The binding
also lets each PHY node reference the SoC eFUSE NVMEM cells (tx_a..tx_d)
used for calibration.

> diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
> new file mode 100644
> index 0000000000000..d2f86116badf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
> @@ -0,0 +1,83 @@

[ ... ]

> +examples:
> +  - |
> +    mdio {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        ethernet-phy@1 {
> +            compatible = "ethernet-phy-idc0ff.0410",
> +                         "ethernet-phy-ieee802.3-c45";

[Severity: Medium]
Should this be "ethernet-phy-ieee802.3-c22" (or just the ID compatible)?
The same applies to ethernet-phy@2 below.

Later in the series, an8855_core_probe() in drivers/mfd/airoha-an8855.c
registers each internal PHY on a bus created by
devm_mdio_regmap_register(). That bus only provides C22 accessors:

drivers/net/mdio/mdio-regmap.c:devm_mdio_regmap_register() {
    ...
    mii->read = mdio_regmap_read_c22;
    mii->write = mdio_regmap_write_c22;
    ...
}

When the c45 compatible is present, fwnode_mdiobus_register_phy() ignores
the explicit c0ff.0410 ID and forces Clause 45 probing:

    is_c45 = fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45");
    if (is_c45 || fwnode_get_phy_id(child, &phy_id))
        phy = get_phy_device(bus, addr, is_c45);

bus->read_c45 is NULL, so __mdiobus_c45_read() returns -EOPNOTSUPP. The
call chain is:

get_phy_device()->get_phy_c45_ids()->get_phy_c45_devs_in_pkg()

and get_phy_c45_ids() turns that error into -EIO. an8855_core_probe()
treats a fwnode_mdiobus_register_phy() failure as fatal
(goto err_put_fwnodes). So a DT copied from this example would make the
whole AN8855 MFD fail to probe, and neither the switch nor the eFUSE
device would be created.

The PHY driver later in the series (drivers/net/phy/air_an8855.c) also
uses C22 paged access, and the MFD binding in the same series
("dt-bindings: mfd: Document support for Airoha AN8855 Switch SoC") uses
"ethernet-phy-ieee802.3-c22" for these same PHYs. ethernet-phy.yaml
accepts both strings, so dt_binding_check won't flag the mismatch.

> +
> +            reg = <1>;
> +        };
> +
> +        ethernet-phy@2 {
> +            compatible = "ethernet-phy-idc0ff.0410",
> +                         "ethernet-phy-ieee802.3-c45";
> +
> +            reg = <2>;
> +
> +            nvmem-cells = <&shift_sel_port0_tx_a>,
> +                          <&shift_sel_port0_tx_b>,
> +                          <&shift_sel_port0_tx_c>,
> +                          <&shift_sel_port0_tx_d>;

[Severity: Low]
Is the PHY at reg 2 meant to use port 0's calibration cells here? In this
example ethernet-phy@1 has no cells and ethernet-phy@2 uses
shift_sel_port0_tx_*.

The MFD binding later in the series maps them differently:
ethernet-phy@1 (internal_phy1) uses shift_sel_port0_tx_*, ethernet-phy@2
(internal_phy2) uses shift_sel_port1_tx_*, port@0 is internal_phy1 and
port@1 is internal_phy2.

an8855_phy_bus_register() computes the port from the address:

    phy_offset = addr - priv->switch_addr;
    if (phy_offset >= AN8855_MAX_PHY_PORT)
        return -EINVAL;

So when both reg 1 and reg 2 are present, the PHY at reg 2 can't be
port 0.

air_an8855.c reads tx_a..tx_d in an8855_probe() and writes them into the
VEND1 R50OHM_RSEL registers in an8855_config_init(). A DTS copied from this
example would put port 0's trim on a different PHY and leave the port 0 PHY
uncalibrated.

Would it make sense to match the MFD example, with port0 cells on
ethernet-phy@1 and port1 cells on ethernet-phy@2?

> +            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +        };
> +    };

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20261009161102.38961-1-ansuelsmth%40gmail.com

