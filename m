Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28ECDC36010
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 21:18:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E+Q42HuBJVYjxIr4gMUzVEJL9DLxf8H/aqvsj5v31NM=; b=tiswnsQfCiejw0Qa40iLDdyB0W
	yvyihnIr72U0HIW8GHBXUwRzYj0EDPwiisWTEz5r6GE/Cxl+PKDiheUTccRC/8OAL4+C0bcT7ION6
	PAq3Vn9ZZNregeyg4Lhsmk9+RX8HvCqcQy+dJWh1LAeU95tCTQLa1ot+MRk1fpVrkTaJl1YN97KRd
	vwuGDehbSDKcAfqDoBpoOBTCx5l84/bpc1l003q1wNkACuzWdJ0s3IhQY5MnPTBSIVvxBFfVKeh6K
	QZMhdgaSbeBUSIJq4a/8VhyJ13KurLZEV4Hyfe6/i4QTFnp1YZ9qZrik2wNKWiDy7FWKS8vaHX8Vn
	mpYQTSlQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tydZ7-0000000FWpo-0Z7R;
	Sat, 29 Mar 2025 21:18:05 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tydXM-0000000FWjv-1ME9
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 21:16:17 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A819E10290279;
	Sat, 29 Mar 2025 22:16:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743282971; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=E+Q42HuBJVYjxIr4gMUzVEJL9DLxf8H/aqvsj5v31NM=;
	b=dwKw+b6qh5jtAWhPOdTJyhdDYqJyD+e/0NF81irefap/jm1/yZ3Hldf8JrB/Lh+lwrSfAo
	EPZTRXjZfC+Wt9Kazgrh+3CIIclSLyiDdAbtAyr4HUFdNEXHpoyGW+0TaX0zXMXzz58EcF
	77yk0yPRlhkY5S/CRFESl5Jwq3388FDeHBosoQugGXeaSZYKAJCuA3kvCe5zTr4gXVLytG
	CiJr/3Vp5MEXXwPA4UiRXl6N7z5wY+GWug8naGXqOZN1N9Yh52GtPJ+6rJZp71/2+N5FPV
	Y462Zn1yuWF9PQDEst1GxzMGtb1ok0Fdg0EXvPYOE9KdEW1hP8zGQE+F8hojOw==
Date: Sat, 29 Mar 2025 22:16:03 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Richard Cochran
 <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add MTIP L2 switch description
Message-ID: <20250329221603.1567e82c@wsk>
In-Reply-To: <20250329170936.GA2246988-robh@kernel.org>
References: <20250328133544.4149716-1-lukma@denx.de>
	<20250328133544.4149716-2-lukma@denx.de>
	<20250329170936.GA2246988-robh@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/=NAIwEwO9lbdwvsUnTeQSey";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_141616_666585_B03BC37D 
X-CRM114-Status: GOOD (  34.09  )
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

--Sig_/=NAIwEwO9lbdwvsUnTeQSey
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> On Fri, Mar 28, 2025 at 02:35:41PM +0100, Lukasz Majewski wrote:
> > This patch provides description of the MTIP L2 switch available in
> > some NXP's SOCs - e.g. imx287.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> > Changes for v2:
> > - Rename the file to match exactly the compatible
> >   (nxp,imx287-mtip-switch)
> > ---
> >  .../bindings/net/nxp,imx287-mtip-switch.yaml  | 165
> > ++++++++++++++++++ 1 file changed, 165 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> > b/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> > new file mode 100644 index 000000000000..a3e0fe7783ec --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> > @@ -0,0 +1,165 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR
> > BSD-2-Clause) +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,imx287-mtip-switch.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP switch)
> > +
> > +maintainers:
> > +  - Lukasz Majewski <lukma@denx.de>
> > +
> > +description:
> > +  The 2-port switch ethernet subsystem provides ethernet packet
> > (L2)
> > +  communication and can be configured as an ethernet switch. It
> > provides the
> > +  reduced media independent interface (RMII), the management data
> > input
> > +  output (MDIO) for physical layer device (PHY) management.
> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,imx287-mtip--switch
> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      The physical base address and size of the MTIP L2 SW module
> > IO range +
> > +  phy-supply:
> > +    description:
> > +      Regulator that powers Ethernet PHYs.
> > +
> > +  clocks:
> > +    items:
> > +      - description: Register accessing clock
> > +      - description: Bus access clock
> > +      - description: Output clock for external device - e.g. PHY
> > source clock
> > +      - description: IEEE1588 timer clock
> > +
> > +  clock-names:
> > +    items:
> > +      - const: ipg
> > +      - const: ahb
> > +      - const: enet_out
> > +      - const: ptp
> > +
> > +  interrupts:
> > +    items:
> > +      - description: Switch interrupt
> > +      - description: ENET0 interrupt
> > +      - description: ENET1 interrupt
> > +
> > +  pinctrl-names: true
> > +
> > +  ethernet-ports:
> > +    type: object
> > +    additionalProperties: false
> > +
> > +    properties:
> > +      '#address-cells':
> > +        const: 1
> > +      '#size-cells':
> > +        const: 0
> > +
> > +    patternProperties:
> > +      "^port@[0-9]+$":
> > +        type: object
> > +        description: MTIP L2 switch external ports
> > +
> > +        $ref: ethernet-controller.yaml#
> > +        unevaluatedProperties: false
> > +
> > +        properties:
> > +          reg:
> > +            items:
> > +              - enum: [1, 2]
> > +            description: MTIP L2 switch port number
> > +
> > +          label:
> > +            description: Label associated with this port
> > +
> > +        required:
> > +          - reg
> > +          - label
> > +          - phy-mode
> > +          - phy-handle
> > +
> > +  mdio:
> > +    type: object
> > +    $ref: mdio.yaml#
> > +    unevaluatedProperties: false
> > +    description:
> > +      Specifies the mdio bus in the switch, used as a container
> > for phy nodes. +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - clock-names
> > +  - interrupts
> > +  - mdio
> > +  - ethernet-ports
> > +  - '#address-cells'
> > +  - '#size-cells'
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include<dt-bindings/interrupt-controller/irq.h>
> > +    switch@800f0000 {
> > +        compatible =3D "nxp,imx287-mtip-switch";
> > +        reg =3D <0x800f0000 0x20000>;
> > +        pinctrl-names =3D "default";
> > +        pinctrl-0 =3D <&mac0_pins_a>, <&mac1_pins_a>;
> > +        phy-supply =3D <&reg_fec_3v3>;
> > +        interrupts =3D <100>, <101>, <102>;
> > +        clocks =3D <&clks 57>, <&clks 57>, <&clks 64>, <&clks 35>;
> > +        clock-names =3D "ipg", "ahb", "enet_out", "ptp";
> > +        status =3D "okay";
> > +
> > +        ethernet-ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                mtip_port1: port@1 {
> > +                        reg =3D <1>;
> > +                        label =3D "lan0";
> > +                        local-mac-address =3D [ 00 00 00 00 00 00 ];
> > +                        phy-mode =3D "rmii";
> > +                        phy-handle =3D <&ethphy0>;
> > +                };
> > +
> > +                mtip_port2: port@2 {
> > +                        reg =3D <2>;
> > +                        label =3D "lan1";
> > +                        local-mac-address =3D [ 00 00 00 00 00 00 ];
> > +                        phy-mode =3D "rmii";
> > +                        phy-handle =3D <&ethphy1>;
> > +                };
> > +        };
> > +
> > +        mdio_sw: mdio {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>;
> > +
> > +                reset-gpios =3D <&gpio2 13 0>;
> > +                reset-delay-us =3D <25000>;
> > +                reset-post-delay-us =3D <10000>;
> > +
> > +                ethphy0: ethernet-phy@0 {
> > +                        reg =3D <0>;
> > +                        smsc,disable-energy-detect; =20
>=20
> With a custom property, you should have a specific compatible.

I could add:
compatible =3D "ethernet-phy-id0007.c0f0","ethernet-phy-ieee802.3-c22";

but it would not make things either clearer nor simpler.

I will just remove this property.

>=20
> > +                        /* Both PHYs (i.e. 0,1) have the same,
> > single GPIO, */
> > +                        /* line to handle both, their interrupts
> > (AND'ed) */
> > +                        interrupt-parent =3D <&gpio4>;
> > +                        interrupts =3D <13 IRQ_TYPE_EDGE_FALLING>; =20
>=20
> The error report is because the examples have to guess the number of=20
> provider interrupt cells and only 1 guess is supported. It guessed 1=20
> from above.
>=20
> In any case, unless the phys are built-in and fixed, they are out of=20
> scope of this binding. So perhaps drop the interrupts and smsc
> property.

Ok, I will remove them.

>=20
> Rob




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/=NAIwEwO9lbdwvsUnTeQSey
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfoYxQACgkQAR8vZIA0
zr0/EwgAx/s1HQ3OV9LuT1M2dDnFpa7Ck55tkTu6Id5VMV6ygsaFR4D7/UpS++xQ
g+YhbzhnrVE1ri5GYyfwYhCCT8XFesFyhbpqJydqNbAGHNnY7if9if3lxni0/Pz2
wNeZOcdAGmem3uhT1yK7pWxHgIIYcCJ0Roq5iu9Urdjr0VpuAhhlXOexcKqfyzXk
MMnBPBo3XGqk6DUh3ncY02wE6hDh8y5DZZRk5PgzvyCdUVvnX8ekpnklIk3VKKVh
te7QIf3ECkgKqzQYFUq4mGnOzcH7ODz0kf0rt/DCdKDyIJXqqMzM+1cT7TZLcTE5
TU5jL4DS18I0ufbg1ZbAb2xrlbk1WQ==
=u478
-----END PGP SIGNATURE-----

--Sig_/=NAIwEwO9lbdwvsUnTeQSey--

