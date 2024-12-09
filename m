Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4B41E77181
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Dec 2024 14:44:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m16HeTv0L0CtuYH/B+yfB6+rKUcSgAg6Vxdkd5F26V4=; b=Om44EpOc8kUGS5lUdWgxIqOe1n
	hr7JexokmB4b0EUmX9dP0IWn/SIyqEP/dbUODz+wOPvXtG1D+jFOjC/PUwhBNNHnXYXXYBjzSoP2Z
	jgoCClsxLh65XEXkz027dncbkhWwJpte3y3pRt9AVv2nn06BAa6sE+PfadClOkedp6jVB8cEBNn7u
	k2sQiOhW2Yaj+4dd19/jkrqAiJQ2u77UAfXiUusSOs1h6IWt+OGToSC9IY+loDy4BuozJVHnsO6tp
	G8gQ4+UlhNr+jsfHOvVRs99f09Wcbqvw4wTNYRYbUSFjJsUXbeeKSbADEbCn2dpDZ3Rh9N72jP5ij
	rZQ650fQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tKezZ-00000008FKa-0gWr;
	Mon, 09 Dec 2024 14:44:09 +0000
Received: from vps0.lunn.ch ([156.67.10.101])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tKeyV-00000008F0e-0jRC
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Dec 2024 14:43:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=lunn.ch;
	s=20171124; h=In-Reply-To:Content-Disposition:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:From:Sender:Reply-To:Subject:
	Date:Message-ID:To:Cc:MIME-Version:Content-Type:Content-Transfer-Encoding:
	Content-ID:Content-Description:Content-Disposition:In-Reply-To:References;
	bh=m16HeTv0L0CtuYH/B+yfB6+rKUcSgAg6Vxdkd5F26V4=; b=I645VjK9kvC67P7dLGOB/uZw3b
	Z59qZlJPd6n9JOP3MaUmCm1uVX9YCDOmrEvMN7HxwtbMmcu78/hwOo6KzU/vqSYgyPKfZwZ1nR1if
	dKPYNh9NyZoTYNr8pNjKZi+kA+T5QVf9o3bDGM593vNPHuO+p7tmg4+g5vrgJbo1oBYY=;
Received: from andrew by vps0.lunn.ch with local (Exim 4.94.2)
	(envelope-from <andrew@lunn.ch>)
	id 1tKeyK-00FgPR-5B; Mon, 09 Dec 2024 15:42:52 +0100
Date: Mon, 9 Dec 2024 15:42:52 +0100
From: Andrew Lunn <andrew@lunn.ch>
To: Matthias Schiffer <matthias.schiffer@ew.tq-group.com>
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Kees Cook <kees@kernel.org>, Tony Luck <tony.luck@intel.com>,
	"Guilherme G. Piccoli" <gpiccoli@igalia.com>,
	Felipe Balbi <balbi@kernel.org>,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-usb@vger.kernel.org,
	linux-hardening@vger.kernel.org, Devarsh Thakkar <devarsht@ti.com>,
	Hari Nagalla <hnagalla@ti.com>, linux@ew.tq-group.com
Subject: Re: [PATCH v2 5/5] arm64: dts: ti: Add TQ-Systems TQMa62xx SoM and
 MBa62xx carrier board Device Trees
Message-ID: <d25b1447-c28b-4998-b238-92672434dc28@lunn.ch>
References: <cover.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <95ff66ca2c89f69d893c2ce9eed9a0c677633c7b.1733737487.git.matthias.schiffer@ew.tq-group.com>
 <a9c5cfda-e3e3-436a-8d05-b2f096157cfe@lunn.ch>
 <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <c902a56cf34838f60cee67624bb923e91d74e9e0.camel@ew.tq-group.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241209_064303_210457_15191906 
X-CRM114-Status: GOOD (  26.39  )
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

On Mon, Dec 09, 2024 at 02:55:31PM +0100, Matthias Schiffer wrote:
> On Mon, 2024-12-09 at 14:24 +0100, Andrew Lunn wrote:
> > 
> > > +&cpsw_port1 {
> > > +	phy-mode = "rgmii-rxid";
> > > +	phy-handle = <&cpsw3g_phy0>;
> > > +};
> > > +
> > > +&cpsw_port2 {
> > > +	phy-mode = "rgmii-rxid";
> > > +	phy-handle = <&cpsw3g_phy3>;
> > > +};
> > 
> > rgmii-rxid is very odd.
> > 
> > > +
> > > +&cpsw3g_mdio {
> > > +	status = "okay";
> > > +	pinctrl-names = "default";
> > > +	pinctrl-0 = <&main_mdio1_pins>;
> > > +
> > > +	cpsw3g_phy0: ethernet-phy@0 {
> > > +		compatible = "ethernet-phy-ieee802.3-c22";
> > > +		reg = <0x0>;
> > > +		reset-gpios = <&main_gpio1 11 GPIO_ACTIVE_LOW>;
> > > +		reset-assert-us = <1000>;
> > > +		reset-deassert-us = <1000>;
> > > +		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
> > 
> > I guess this is the explanation.
> > 
> > What happens when you use rgmii-id, and don't have this delay here?
> > That would be normal.
> > 
> > 	Andrew
> 
> 
> This is normal for AM62-based boards, see the DTSI of the TI reference
> starterkit for example:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/arch/arm64/boot/dts/ti/k3-am62x-sk-common.dtsi#n451
> 
> With rgmii-id, both ti,rx-internal-delay and ti,tx-internal-delay should be set.
> As ti,*-internal-delay sets the delay on the PHY side, phy-mode "rgmii" is the
> one that would not use either:
> 
> https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/net/ti,dp83867.yaml#n78
> 
> At the end of the day, does it really matter as long as MAC and PHY agree on the
> used mode? We copied this part of the hardware design from the TI reference
> board, and did our hardware qualification with these settings, so I think it
> makes sense to use the same phy-mode configuration.

What i try to achieve is every board uses the same configuration. The
PHY adds the delays, not the MAC. There are a few exceptions, because
a few cheap PHYs don't support delays, and so the MAC needs to add
them. But in general, any board i review, i always ask that the PHY
does the delay.

Also, don't put too much value in vendor code. Vendors don't care
about Linux has a whole, being uniform across all systems. Many
vendors do the minimum to get their stuff working, sometimes Monkeys
typing Shakespeare, and not a lot more.

I also find a lot of developers don't really understand what phy-mode
and PHY_INTERFACE_MODE_RGMII_* actually mean. phy-mode = 'rgmii' means
the board has extra long clock lines, so the MAC/PHY does not need to
add delays. rgmii-rxid means the board has an extra long rx clock
line, but a normal length tx clock line. Now, i doubt your board is
actually like this?

You want to correctly describe your hardware in DT, which i guess is
"rgmii-id". That means something, either the MAC or the PHY needs to
add delays. PHY_INTERFACE_MODE_RGMII_* is what is passed to the
PHY. To get it to add the 2ns delays, you pass
PHY_INTERFACE_MODE_RGMII_ID, and you should not need any additional
properties in DT, it should default to 2ns. If you need to tune the
delay, 2ns does not work, but you actually need 1.8ns etc, then you
can add additional parameters. But given you have
DP83867_RGMIIDCTL_2_00_NS, i doubt you need this.

	Andrew

