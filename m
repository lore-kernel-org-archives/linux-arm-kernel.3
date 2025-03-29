Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C9DDC36008
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 29 Mar 2025 22:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OfWmKzMpdhulgNMGGh3laefwHhLvWPtC8uEl5axzFsw=; b=ilxBjySLvDXF0KG+L/9aHAqml0
	r/unVchIAyBIbzKiW5FL62tqAP6M96DTcHD20ZTRFCp5fQM+JlvSyZvBW48+pzZr0ilHrbWWHXbzr
	Noy6hAZ/RLmJdvuT/oijYWAzHGZQ4Pl0cHOhnYba4oLI5wfwcMV80eoMGXOQo9Y3EFNnqWo5fixub
	nFauP73vd9PqGZGPLjDRLTjDokn4DCTr6l2dGHQ88CyE8v8UuBUfrtW/n5iApKKrpVxxgLQqKDq0K
	/mKbEY9T+jv31xEdDQmgIrLPIBxKAhgB8BrIrmoPosFlLGZZJH5c1vQhaRFROElXmXGS/+x9W/rak
	Ej3LGx/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyePJ-0000000FYts-1bbf;
	Sat, 29 Mar 2025 22:12:01 +0000
Received: from mx.denx.de ([89.58.32.78])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tyeNY-0000000FYlH-13aT
	for linux-arm-kernel@lists.infradead.org;
	Sat, 29 Mar 2025 22:10:14 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2117910290279;
	Sat, 29 Mar 2025 23:10:06 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743286209; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=OfWmKzMpdhulgNMGGh3laefwHhLvWPtC8uEl5axzFsw=;
	b=AE8ZduE3XoX4GiJCzdR+S+uagY3W1crhK/9Od/0Du+QVU4y8VvoDLlYYTDV9kGoIoNpilx
	WR3M9k1vokP49/Jn1bmr8qz7R86785D0aJ3iKLhYhpS4gtcANNPMRIDso7WMGTKdMOUzX2
	eO5q4adU7YC7IFkjmcY3sMOEPGgbqou7xoIuZ03aiLgGXXaUuk6FlMNdsGUOYE0+JS9Qgj
	ncNBLIEhuz2buRy3I6eQinFMApz+GtQm1owfcp97isb/GbKyt6Dv9wIelTUU3mvWvc9H9z
	O8GLVicWGe3phK+pjb6gV6wvRPH2H+OeHpQEHAjhrxQOJKgreOGqXSy9dYmM3A==
Date: Sat, 29 Mar 2025 23:10:04 +0100
From: Lukasz Majewski <lukma@denx.de>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Andrew Lunn <andrew+netdev@lunn.ch>, davem@davemloft.net, Eric Dumazet
 <edumazet@google.com>, Jakub Kicinski <kuba@kernel.org>, Paolo Abeni
 <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Shawn Guo
 <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix
 Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>,
 Richard Cochran <richardcochran@gmail.com>, netdev@vger.kernel.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 1/4] dt-bindings: net: Add MTIP L2 switch description
Message-ID: <20250329231004.4432831b@wsk>
In-Reply-To: <e6f3e50f-8d97-4dbc-9de3-1d9a137ae09c@kernel.org>
References: <20250328133544.4149716-1-lukma@denx.de>
	<20250328133544.4149716-2-lukma@denx.de>
	<e6f3e50f-8d97-4dbc-9de3-1d9a137ae09c@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/GOaK/S/VyPuiJbaUJ6=UdAb";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250329_151012_587728_ED1AD414 
X-CRM114-Status: GOOD (  35.09  )
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

--Sig_/GOaK/S/VyPuiJbaUJ6=UdAb
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

> On 28/03/2025 14:35, Lukasz Majewski wrote:
> > This patch provides description of the MTIP L2 switch available in
> > some NXP's SOCs - e.g. imx287.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> > Changes for v2:
> > - Rename the file to match exactly the compatible
> >   (nxp,imx287-mtip-switch) =20
>=20
> Please implement all the changes, not only the rename. I gave several
> comments, although quick glance suggests you did implement them, so
> then changelog is just incomplete.

Those comments were IMHO addressed automatically, as this time I took
(I suppose :-) ) better file as a starting point.

To be more specific it was:
./Documentation/devicetree/bindings/net/ti,cpsw-switch.yaml

as I've been advised to use for the MTIP driver the same DTS
description as the above one has (i.e. they are conceptually similar,
so DTS description ABI can be used for both).

I've also checked the:
make CHECK_DTBS=3Dy DT_SCHEMA_FILES=3Dnxp,imx287-mtip-switch.yaml
nxp/mxs/imx28-xea.dtb

on Linux next and it gave no errors.

>=20
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
> > + =20
>=20
> If this is ethernet switch, why it does not reference ethernet-switch
> schema? or dsa.yaml or dsa/ethernet-ports? I am not sure which one
> should go here, but surprising to see none.

It uses:
$ref:=C2=B7ethernet-controller.yaml#

for "ports".

Other crucial node is "mdio", which references $ref: mdio.yaml#

>=20
> > +properties:
> > +  compatible:
> > +    const: nxp,imx287-mtip--switch =20
>=20
> Just one -.
>=20

Ok.

> > +
> > +  reg:
> > +    maxItems: 1
> > +    description:
> > +      The physical base address and size of the MTIP L2 SW module
> > IO range =20
>=20
> Wasn't here, drop.
>=20

The 'reg' property (reg =3D <0x800f0000 0x20000>;) is defined in
imx28.dtsi, where the SoC generic properties (as suggested by Andrew -
like clocks, interrupts, clock-names) are moved.

> > +
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
> > +  pinctrl-names: true =20
>=20
> Drop

The 'pinctrl-names =3D "default";' are specified.

Shouldn't it be kept?

>=20
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
> > +      "^port@[0-9]+$": =20
>=20
> Keep consistent quotes, either " or '. Also [01]
>=20

[12] - ports are numbered starting from 1.

>=20
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
> > +        status =3D "okay"; =20
>=20
> Drop

Ok.

>=20
> > +
> > +        ethernet-ports {
> > +                #address-cells =3D <1>;
> > +                #size-cells =3D <0>; =20
>=20
> Messed indentation. See example-schema or writing-schema.
>=20

Ok.

>=20
>=20
> Best regards,
> Krzysztof




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/GOaK/S/VyPuiJbaUJ6=UdAb
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfob7wACgkQAR8vZIA0
zr1dnAf+K8wn68GHQnDP8Ngyr4LbkqtyX9vgW/b3tfNaPTIZkL1lMEUZ2HD2n+yv
zlFrkNAv/msNWFbZKT/+yFvX3YNPLS0gc8TV0SyMoZ6naIlto86WX8t4qv1pWi6X
38gwP4DGcCYMSALmPwyn3JH2pOnY7LuGT2GbomsOYfdn8UgjACmHJIVDWyhn/AA3
cQHdJbFC2p7J+7QFGihcig3Neoepo1vI76sProBWIw7U9dIu+ybP14y5tmBAaxpV
Urcqt7Wg43hU7HgM27muOk7XFttDbfbt408y//qjkHKdsQehjfJKpT4NKhol0oDK
baCZykor3+/dSnMz0IhemScHL+k6rw==
=IoZW
-----END PGP SIGNATURE-----

--Sig_/GOaK/S/VyPuiJbaUJ6=UdAb--

