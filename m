Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8F6BCA5FAC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 20:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Message-ID:Date
	:Cc:To:From:Subject:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w9ECo7Zxk+E9vZum/tU3C35TNd/88XkTZm60kcGeGg=; b=k+Fjpkux2de7g1h6uR1Md9ZcGr
	r9FeUr8eOZS+cjsq/gLmOLZwcDwF24xolvXwuszYqEjmtmj/8IwfP7m2puVnlwx4RgCE3Bki3O9D2
	6srN6DMMmHxmHIiKfoT0UhygvaiU0s+LS0lg6l86IjilJM94M2NfSt5HGU/CXyyifbCme33VSSkzs
	yzQWmJMiNhOHve1b1lZ9V22qDJ8kyszCfL7mkSxdRBuLq7HmrZ+2BUsQms9x+BSKsYJJlUBPM4eQn
	VG5c7YH+L9hXGjAXfVge5gQdSc/QIaoRx3yLExw/CJ7cz7jMsqNsu+73cTEd0N57f3F5m7e27Gyyu
	tOJ/QtDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeXY-00000004V2L-2VjA;
	Tue, 29 Sep 2026 20:35:04 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBeXX-00000004V1r-2iNP;
	Tue, 29 Sep 2026 20:35:03 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C5D7E418DB;
	Tue, 29 Sep 2026 20:35:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7919E1F000FF;
	Tue, 29 Sep 2026 20:35:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790714101;
	bh=8w9ECo7Zxk+E9vZum/tU3C35TNd/88XkTZm60kcGeGg=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=CbrxtQ6vk6su3mcR4IiljTKlaqNDLPbvzMMmrM8D4wnDJrkBssMoPlFEFK0JtlAAt
	 6Q7QvNrGviQuflHRaMLIIoRInMl15+zDPyNRDKPINbT+b6q81pd9Cq1+rNOh0LWKfp
	 k/zmnZNFlaeVjsUVM8zIIN+3Iamanyg1PwTasslluMmLAQRrjxIL4WhM+7c/pI3Cae
	 eY6B4aR0GlPL1OgHvVSj6hSMki20wfedB/wsIc7tNqH0XW8pXMPg+oXW9VhqMdeClD
	 bHRA8KqKvnLyzNw4jRGVrPGpBUc+6KCzVkhg8Fuya7pPBrPdXLh6oONVC9dL44+ixZ
	 GKsmRpsx0vr2Q==
Subject: Re: [PATCH net-next v23 2/9] dt-bindings: net: Document support for
 AN8855 Switch Internal PHY
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
Date: Tue, 29 Sep 2026 20:34:59 +0000
Message-ID: <179071409998.434549.4068844959751707356@kernel.org>
In-Reply-To: <20260925182435.21207-3-ansuelsmth@gmail.com>
References: <20260925182435.21207-3-ansuelsmth@gmail.com>
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

- [Medium] Both PHY nodes in the example of the new binding
  Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml…
- [Low] In the example of
  Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml, the PHY…

--

dt-bindings: net: Document support for AN8855 Switch Internal PHY

This adds a binding for the internal PHYs of the Airoha AN8855 5-port
Gigabit switch, which are exposed on the MDIO bus. It also documents
optional nvmem-cells, which point at eFUSE cells used to calibrate each
PHY.

> diff --git a/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml
> new file mode 100644
> index 0000000000000..d2f86116badf4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/net/airoha,an8855-phy.yaml

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
Should this be "ethernet-phy-ieee802.3-c22"? The same pair is used for
ethernet-phy@2 below.

The rest of the series treats these PHYs as Clause 22 only. The MFD
binding in mfd/airoha,an8855.yaml uses "ethernet-phy-ieee802.3-c22" for
the same PHYs. The PHY driver in drivers/net/phy/air_an8855.c relies on
Clause 22 register 0x1f paging and has no Clause 45 callbacks.

When the c45 compatible is present, fwnode_mdiobus_register_phy()
ignores the fixed PHY ID:

drivers/net/mdio/fwnode_mdio.c:fwnode_mdiobus_register_phy() {
    ...
	is_c45 = fwnode_device_is_compatible(child, "ethernet-phy-ieee802.3-c45");
	if (is_c45 || fwnode_get_phy_id(child, &phy_id))
		phy = get_phy_device(bus, addr, is_c45);
    ...
}

The per-PHY buses that an8855_core_probe() creates come from
devm_mdio_regmap_register(). That function only sets Clause 22
accessors:

drivers/net/mdio/mdio-regmap.c:devm_mdio_regmap_register() {
    ...
	mii->read = mdio_regmap_read_c22;
	mii->write = mdio_regmap_write_c22;
    ...
}

Since read_c45 is never set, this chain fails:

get_phy_device(bus, addr, true)
  get_phy_c45_ids()
    mdiobus_c45_read() -> -EOPNOTSUPP
  -> -EIO

After that, fwnode_mdiobus_register_phy() fails and an8855_core_probe()
jumps to err_put_fwnodes. The whole AN8855 MFD then fails to probe,
including the switch and the efuse.

The schema accepts either compatible, so dt_binding_check won't catch
a board DT that copies this example.

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
Is ethernet-phy@2 meant to get the port 0 calibration cells here?

Later in the series, an8855_phy_bus_register() maps a PHY to a switch
port with phy_offset = addr - priv->switch_addr. This example also has
a PHY at address 1, so ethernet-phy@2 can't be port 0.

The sibling bindings agree:

- dsa/airoha,an8855-switch.yaml maps port@0 to internal_phy1 and port@1
  to internal_phy2.
- mfd/airoha,an8855.yaml puts the shift_sel_port0_* cells on
  ethernet-phy@1 and the shift_sel_port1_* cells on ethernet-phy@2.

an8855_config_init() writes whatever cells it gets into
AN8855_PHY_R50OHM_RSEL_TX_AB/CD. If a board DT copies this example, the
port 1 PHY would silently get the port 0 TX calibration.

Should the cells either move to ethernet-phy@1, or be renamed to
shift_sel_port1_*?

> +            nvmem-cell-names = "tx_a", "tx_b", "tx_c", "tx_d";
> +        };
> +    };

-- 
Sashiko AI review · https://netdev-ai.bots.linux.dev/sashiko/#/patchset/20260925182435.21207-1-ansuelsmth%40gmail.com

