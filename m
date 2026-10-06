Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58270CA5FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Oct 2026 15:08:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2W3RNEnVYCGzFPqg63OJywzypc/QTiWR/0QRs92Quq4=; b=Z5u4usbus/RxTuC9/jb9fie3Oh
	DjqXTJtDC34iV1pUtrOl66BJXOIkxlaxJCFgNPD4B8kw50ZwjOfOZatgw98K4l7pba5iRHTy0jpuO
	aGk1SSJOjDlKu/2dy8Gp2pBt6Xg/ZXuuzCq4U4HNcgpCIR7Ax3oTWRH43Pi0xTh4LUOew41Il9vSL
	IUNAXWAW4dure+cF/iN/zmUpyH1iL0Rt/AcSFo8xON9s4U6IFg2tszgSdsDQpAsI6MzJX5oqGtqF0
	38QLPbwAj8pnDPtsobRO1x8cZ0zEv20I/KOA6p+vlVnhojbiqNWbTWl5tcFiB9L5BgK9F3RoXxAMc
	lcp+p+/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6mQ-0000000109V-1ejX;
	Tue, 06 Oct 2026 15:08:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xE6mP-0000000109E-13Rr;
	Tue, 06 Oct 2026 15:08:33 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4F896601E4;
	Tue,  6 Oct 2026 15:08:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D13531F0089B;
	Tue,  6 Oct 2026 15:08:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791299312;
	bh=2W3RNEnVYCGzFPqg63OJywzypc/QTiWR/0QRs92Quq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FetpF4dLDjLQPjYWIVDdyp6sJOWTAW8m2d/wqsHRGmqDX6p5TVSaj81wLhLBnM4xR
	 C6CV/F0olerJaRm5EwL0lsjmZoHRScNEjx5M8bajzrP668cyrXPbZuC0J2b0iXsksg
	 bhATh99T9yZiSC7Ubi+0TwM+OKjiXpaOM3Hb19x5qEjc/b2xJDyYxmyVIijZPtViFu
	 xigb9BdusvPjV+qF6VwVCVInG7XjL0iuNwas8ds+V7rXn1djd5G+f+7k37cFODbkDy
	 G+pkkfR8tER0znlKB3bPjMmtWGR85uvKErwC/hDhJoyTG4KMOyHqafrd46BtGsZisV
	 Suqwun02c/jhA==
Date: Tue, 6 Oct 2026 10:08:31 -0500
From: Rob Herring <robh@kernel.org>
To: Coia Prant <coiaprant@gmail.com>
Cc: Jakub Kicinski <kuba@kernel.org>, Andrew Lunn <andrew+netdev@lunn.ch>,
	"David S . Miller" <davem@davemloft.net>,
	Eric Dumazet <edumazet@kernel.org>, Paolo Abeni <pabeni@redhat.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Maxime Chevallier <maxime.chevallier@bootlin.com>,
	Heiner Kallweit <hkallweit1@gmail.com>,
	Russell King <linux@armlinux.org.uk>,
	David Wu <david.wu@rock-chips.com>, netdev@vger.kernel.org,
	linux-rockchip@lists.infradead.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH net-next v10 1/6] dt-bindings: net: pcs: add
 rockchip,rk3568-xpcs support
Message-ID: <20261006150831.GC2194299-robh@kernel.org>
References: <20261005223011.1124347-1-coiaprant@gmail.com>
 <20261005223011.1124347-2-coiaprant@gmail.com>
 <20261006132428.GA1659963-robh@kernel.org>
 <96FA84EA-3C0E-4FAC-963F-2A8165538748@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <96FA84EA-3C0E-4FAC-963F-2A8165538748@gmail.com>
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

On Tue, Oct 06, 2026 at 09:59:49PM +0800, Coia Prant wrote:
> On October 6, 2026 9:24:28 PM GMT+08:00, Rob Herring <robh@kernel.org> wrote:
> >On Tue, Oct 06, 2026 at 06:30:03AM +0800, Coia Prant wrote:
> >> Add device tree binding documentation for the Synopsys DesignWare
> >> XPCS integrated on the Rockchip RK3568 SoC.
> >> 
> >> The XPCS is accessed over the APB3 bus and internally connected to
> >> a Naneng Combo SerDes PHY.  It supports 1000BASE-X, SGMII, and
> >> QSGMII modes, with four MII ports.
> >> 
> >> The four MII ports are described as ethernet-pcs-mii@N child nodes,
> >> consumed by the Rockchip XPCS glue driver later in this series.
> >> 
> >> phys and phy-names are required because dtbs_check only validates
> >> required properties for enabled nodes. The SerDes link is a board-level
> >> design choice (combphy1 on some boards, combphy2 on others), so these
> >> properties must be provided by the board device tree, not the SoC dtsi.
> >> 
> >> The CRU reset lines (SRST_XPCS*) are intentionally not described: no
> >> in-tree user requests them, and bring-up relies on the PD_PIPE power
> >> domain, the SerDes PHY and the in-IP soft reset. They can be added
> >> later as optional without breaking ABI.
> >> 
> >> Signed-off-by: Coia Prant <coiaprant@gmail.com>
> >> ---
> >>  .../net/pcs/rockchip,rk3568-xpcs.yaml         | 110 ++++++++++++++++++
> >>  1 file changed, 110 insertions(+)
> >>  create mode 100644 Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
> >> 
> >> diff --git a/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
> >> new file mode 100644
> >> index 0000000000000..703fcff0e3f70
> >> --- /dev/null
> >> +++ b/Documentation/devicetree/bindings/net/pcs/rockchip,rk3568-xpcs.yaml
> >> @@ -0,0 +1,110 @@
> >> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> >> +%YAML 1.2
> >> +---
> >> +$id: http://devicetree.org/schemas/net/pcs/rockchip,rk3568-xpcs.yaml#
> >> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> >> +
> >> +title: Rockchip RK3568 Synopsys DesignWare Ethernet PCS
> >> +
> >> +maintainers:
> >> +  - Coia Prant <coiaprant@gmail.com>
> >> +
> >> +description: |
> >> +  Rockchip RK3568 SoC integrates a Synopsys DesignWare Ethernet Physical
> >> +  Coding Sublayer (XPCS).
> >> +  The PCS provides an interface between the Media Access Control (MAC)
> >> +  and the Physical Medium Attachment (PMA) sublayer through a Media
> >> +  Independent Interface (GMII).
> >> +
> >> +  The XPCS is accessed over the APB3 bus and internally connected to a
> >> +  Naneng Combo SerDes PHY.
> >> +  It supports 1000BASE-X, SGMII and QSGMII modes.
> >> +
> >> +  The block contains four MII ports that can be individually enabled and
> >> +  routed to one of the Ethernet GMAC controllers via the pcs-handle
> >> +  property in the MAC device tree node.
> >> +
> >> +properties:
> >> +  compatible:
> >> +    const: rockchip,rk3568-xpcs
> >> +
> >> +  reg:
> >> +    maxItems: 1
> >> +
> >> +  "#address-cells":
> >> +    const: 1
> >> +
> >> +  "#size-cells":
> >> +    const: 0
> >> +
> >> +  clocks:
> >> +    items:
> >> +      - description: APB3 bus interface clock (clk_csr_i), required for register access
> >> +      - description: EEE clock (clk_eee_i), required for Energy Efficient Ethernet operation
> >> +
> >> +  clock-names:
> >> +    items:
> >> +      - const: csr
> >> +      - const: eee
> >> +
> >> +  phys:
> >> +    maxItems: 1
> >> +
> >> +  phy-names:
> >> +    const: serdes
> >
> >You don't really need phy-names if there is only 1 entry.
> >
> >> +
> >> +  power-domains:
> >> +    maxItems: 1
> >> +
> >> +patternProperties:
> >> +  "^ethernet-pcs-mii@[0-3]$":
> >> +    type: object
> >> +    description:
> >> +      One of the four MII ports of the XPCS. The port is linked to an
> >> +      Ethernet MAC controller via the pcs-handle property in the MAC's
> >> +      device tree node.
> >> +
> >> +    properties:
> >> +      reg:
> >> +        description: MII port number.
> >> +        enum: [0, 1, 2, 3]
> >> +
> >> +    required:
> >> +      - reg
> >
> >Why the child nodes? They don't contain anything.
> >
> >Perhaps that's due to pcs-handle not supporting arg cells to pass the 
> >port number? That's about to change[1].
> >
> >Rob
> >
> >[1] https://github.com/devicetree-org/dt-schema/pull/198
> 
> Hi Rob,
> 
> Both points make sense.
> 
> 1. I'll drop phy-names since there's only a single entry.
> 
> 2. For the ethernet-pcs-mii child nodes: you're right that they only
>    contain 'reg'. The reason I used child nodes is because pcs-handle
>    arg cells are not available yet -- PR #198 is still open and in
>    RFC/change-request state.
> 
>    The RZN1 MII converter binding does the same thing: it declares
>    MII ports as subnodes and references the PCS via pcs-handle, until
>    arg cells land.
> 
>    So I'd like to keep the child nodes as a temporary workaround, and
>    I'll add a note in the binding that this can be simplified once
>    PR #198 is merged.

Bindings are an ABI. You can't merge the binding then change it. Please 
comment on the PR that you all need it.

Rob

