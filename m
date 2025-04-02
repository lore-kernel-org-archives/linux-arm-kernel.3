Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A8EB9C28B20
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Apr 2025 09:17:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HCl71+B/mWDteASs/fx+ejiotd32rdy+bdrr9fbBE6E=; b=irMiL0Mm9MFmAaWw91fQkdYcMf
	t9IYbNQX+Rnx29tA45W52CyCjebxLTR1EPYaJmq3fs4EROy1cyw3xAw9Xl5K/X+gOH7dw6seZi9+U
	dr4kXeFNa3g+Akw/GNanPgn/Y9Ki/n46AHQJ1UizvvlZsMFhyLJGvLmJ02i3NXxV8YXK/OI5AJUWr
	DciUcnun6PzDsHHh5f7vAiDBjhzSnVXCKxar81JHSwjEoNwTGqK8gmLctTkjGjaZwiw1gsQsmU5w2
	psLJ57o9mW5UKGBBuMYb0VhZ+sfbNvCx0jSX3cxgNVVJWiy/yyySakNxr5UJ5HaOQCB51JlruIZji
	+vT0TW0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzuDb-00000005f9c-0Rgz;
	Wed, 02 Apr 2025 09:17:07 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzu5u-00000005dZJ-16vG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Apr 2025 09:09:11 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 41F29102780A3;
	Wed,  2 Apr 2025 11:09:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743584947; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=HCl71+B/mWDteASs/fx+ejiotd32rdy+bdrr9fbBE6E=;
	b=CqkqJPFcH1TcNaBCn2t6uGeAIdCw2h1slnVMqXrmW/JT7ppsePNm2Vx3Q2fLQ7nvPxArQ+
	J1K5fTD3ipeu1yjmqhLq0RRyvx7shceWlUM1p+ib55UYqtU2i/kqpILONhteDluRPFdrYI
	JDIye+0JirnA0n1JJfFIhZkOXMWfI6dS9lTDkYxilQtHqHo2dATH/kBIPgczgkR+b0DoNu
	eWqx7dqwKSpEhbOHAPM6aW7JvYsMK/chP/8Y5BoulEJCYTd+jI6yKtW37M3REMvtaxrC8d
	ccoh8qVabatxQ/hZhOQvuwZPRPG1yf9BSSkSIClM8Xasovt/AFmIFnKWOeR8Zw==
Date: Wed, 2 Apr 2025 11:09:00 +0200
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
Subject: Re: [PATCH v3 1/4] dt-bindings: net: Add MTIP L2 switch description
Message-ID: <20250402110900.6141cc1b@wsk>
In-Reply-To: <20250401230346.GA28557-robh@kernel.org>
References: <20250331103116.2223899-1-lukma@denx.de>
	<20250331103116.2223899-2-lukma@denx.de>
	<20250331235518.GA2823373-robh@kernel.org>
	<20250401123507.2e3bf0a6@wsk>
	<20250401230346.GA28557-robh@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/0sOa=FWTe.Vb=8T9Ymlk/qv";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250402_020910_609014_D26C2121 
X-CRM114-Status: GOOD (  43.02  )
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

--Sig_/0sOa=FWTe.Vb=8T9Ymlk/qv
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

On Tue, 1 Apr 2025 18:03:46 -0500
Rob Herring <robh@kernel.org> wrote:

> On Tue, Apr 01, 2025 at 12:35:07PM +0200, Lukasz Majewski wrote:
> > Hi Rob,
> >  =20
> > > On Mon, Mar 31, 2025 at 12:31:13PM +0200, Lukasz Majewski wrote: =20
> > > > This patch provides description of the MTIP L2 switch available
> > > > in some NXP's SOCs - e.g. imx287.
> > > >=20
> > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > > ---
> > > > Changes for v2:
> > > > - Rename the file to match exactly the compatible
> > > >   (nxp,imx287-mtip-switch)
> > > >=20
> > > > Changes for v3:
> > > > - Remove '-' from const:'nxp,imx287-mtip-switch'
> > > > - Use '^port@[12]+$' for port patternProperties
> > > > - Drop status =3D "okay";
> > > > - Provide proper indentation for 'example' binding (replace 8
> > > >   spaces with 4 spaces)
> > > > - Remove smsc,disable-energy-detect; property
> > > > - Remove interrupt-parent and interrupts properties as not
> > > > required
> > > > - Remove #address-cells and #size-cells from required properties
> > > > check
> > > > - remove description from reg:
> > > > - Add $ref: ethernet-switch.yaml#
> > > > ---
> > > >  .../bindings/net/nxp,imx287-mtip-switch.yaml  | 154
> > > > ++++++++++++++++++ 1 file changed, 154 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> > > > b/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> > > > new file mode 100644 index 000000000000..98eba3665f32 ---
> > > > /dev/null +++
> > > > b/Documentation/devicetree/bindings/net/nxp,imx287-mtip-switch.yaml
> > > > @@ -0,0 +1,154 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR
> > > > BSD-2-Clause) +%YAML 1.2
> > > > +---
> > > > +$id:
> > > > http://devicetree.org/schemas/net/nxp,imx287-mtip-switch.yaml#
> > > > +$schema: http://devicetree.org/meta-schemas/core.yaml# +
> > > > +title: NXP SoC Ethernet Switch Controller (L2 MoreThanIP
> > > > switch) +
> > > > +maintainers:
> > > > +  - Lukasz Majewski <lukma@denx.de>
> > > > +
> > > > +description:
> > > > +  The 2-port switch ethernet subsystem provides ethernet packet
> > > > (L2)
> > > > +  communication and can be configured as an ethernet switch. It
> > > > provides the
> > > > +  reduced media independent interface (RMII), the management
> > > > data input
> > > > +  output (MDIO) for physical layer device (PHY) management.
> > > > +
> > > > +$ref: ethernet-switch.yaml#   =20
> > >=20
> > > This needs to be: ethernet-switch.yaml#/$defs/ethernet-ports
> > >=20
> > > With that, you can drop much of the below part. More below...
> > >  =20
> > > > +
> > > > +properties: =20
> >=20
> > So it shall be after the "properties:"
> >=20
> > $ref: ethernet-switch.yaml#/$defs/ethernet-ports   [*] =20
>=20
> It can stay where it is, just add "/$defs/ethernet-ports"
>=20
>=20
> > > > +  compatible:
> > > > +    const: nxp,imx287-mtip-switch
> > > > +
> > > > +  reg:
> > > > +    maxItems: 1
> > > > +
> > > > +  phy-supply:
> > > > +    description:
> > > > +      Regulator that powers Ethernet PHYs.
> > > > +
> > > > +  clocks:
> > > > +    items:
> > > > +      - description: Register accessing clock
> > > > +      - description: Bus access clock
> > > > +      - description: Output clock for external device - e.g.
> > > > PHY source clock
> > > > +      - description: IEEE1588 timer clock
> > > > +
> > > > +  clock-names:
> > > > +    items:
> > > > +      - const: ipg
> > > > +      - const: ahb
> > > > +      - const: enet_out
> > > > +      - const: ptp
> > > > +
> > > > +  interrupts:
> > > > +    items:
> > > > +      - description: Switch interrupt
> > > > +      - description: ENET0 interrupt
> > > > +      - description: ENET1 interrupt
> > > > +
> > > > +  pinctrl-names: true
> > > > +   =20
> > >  =20
> > > > +  ethernet-ports: =20
> >=20
> > And then this "node" can be removed as it has been referenced above
> > [*]? =20
>=20
> Well, you have to keep it to have 'required' in the child nodes.
>=20
> >=20
> > (I shall only keep the properties, which are not standard to [*] if
> > any).
> >  =20
> > > > +    type: object
> > > > +    additionalProperties: false
> > > > +
> > > > +    properties:
> > > > +      '#address-cells':
> > > > +        const: 1
> > > > +      '#size-cells':
> > > > +        const: 0
> > > > +
> > > > +    patternProperties:
> > > > +      '^port@[12]+$':   =20
> > >=20
> > > Note that 'ethernet-port' is the preferred node name though
> > > 'port' is allowed. =20
> >=20
> > Ok. That would be the correct define:
> >=20
> > ethernet-ports {
> >      mtip_port1: ethernet-port@1 {
> >                reg =3D <1>;
> >                label =3D "lan0";
> >                local-mac-address =3D [ 00 00 00 00 00 00 ];
> >                phy-mode =3D "rmii";
> >                phy-handle =3D <&ethphy0>;
> > 	       };
> >=20
> >                mtip_port2: port@2 { =20
>=20
> And here...
>=20
> > 		....
> > 	       };
> >  =20
> > >  =20
> > > > +        type: object
> > > > +        description: MTIP L2 switch external ports
> > > > +
> > > > +        $ref: ethernet-controller.yaml#
> > > > +        unevaluatedProperties: false
> > > > +
> > > > +        properties:
> > > > +          reg:
> > > > +            items:
> > > > +              - enum: [1, 2]
> > > > +            description: MTIP L2 switch port number
> > > > +
> > > > +          label:
> > > > +            description: Label associated with this port
> > > > +
> > > > +        required:
> > > > +          - reg
> > > > +          - label
> > > > +          - phy-mode
> > > > +          - phy-handle   =20
> > >=20
> > > All the above under 'ethernet-ports' can be dropped though you
> > > might want to keep 'required' part. =20
> >=20
> > Ok, I will keep it. =20
>=20
> So I think you just want this:
>=20
> ethernet-ports:
>   type: object
>   additionalProperties: true  # Check if you need this
>=20
>   patternProperties:
>     '^ethernet-port@[12]$':
>       required:
>         - label
>         - phy-mode
>         - phy-handle
>=20

I had to add:

$ref: ethernet-switch.yaml#/$defs/ethernet-ports
patternProperties:
  "^(ethernet-)?ports$":
    type: object
    additionalProperties: true

after the=20
description:

to avoid issues when checking DT schema.

Simple adding=20

   patternProperties:
     '^ethernet-port@[12]$':
       required:
         - label
         - phy-mode
         - phy-handle

Causes more errors.

> Rob




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/0sOa=FWTe.Vb=8T9Ymlk/qv
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmfs/qwACgkQAR8vZIA0
zr086wgA5Jn0IbIaaEpVjBvcYY2ArHgPvw/BZFmTl1ybvb3477EmZI1iEIn1UHyW
qMO4jx5mlSoR9QkP/GfI9DE99ySe+EQgqSqPqcY79JPlqq6WeT578E9NBqLO7YT5
h59WwQShvBR4np37X5r26HtcdP8CXEWYUFITteTqh+EYiXDKPeXi4e6KiGmcJAuJ
jT4riux80AJ4ImCRjnj9S/pv3ODm6Q//Rd9DKse/k/RPUKRrqCM9MvLval02tdzV
SD+MsepkMI+j/NXayLHABP++2Lcl3lNNW3fnAGKckvqdGBPmIRlS4MnqN+PzAprB
tkiD4bkrDW3Eu65fMpIQtsnOT47bkA==
=9mZL
-----END PGP SIGNATURE-----

--Sig_/0sOa=FWTe.Vb=8T9Ymlk/qv--

