Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3DD6C3ABC9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 08:47:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Fi0Gbu6aDQ30lLHvX8QotTG0CofWbimlQkVK9vsGpzQ=; b=sx5J+SlWnuBDNjmmPLzGrx1Ehu
	cSHPe6bTLSyDqgAvgCnP6gjrBwBZ/YdG5v0LXFGynbirXVJvC5XiwwZTwpOVgd4tfJbEp9YI29iZh
	JBzJc7BCb+xm+YV0ehIeza5d1Re1+/7DepUYMlTb2y8RYssBZrgObH77WGCPDO9rbeMmVPi+dMhmj
	BD5NDgzH1aXhHVjNrWs4dLXHAJYJCARHF/wIVzf+og7deMnlP1xFwxWm5lq3JefdrVXwOpf2b4hox
	jHAJ2tiABfs1vtv8I1hAacIATAjyk+gf0ES3+HjMujq+6BJTtSDCd7u3wFhjWJ6r2snLw4+qlX0Py
	IN7c7ufg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFUFM-000000002Na-2vjR;
	Thu, 15 May 2025 08:47:20 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFU0R-0000000HZHb-32JV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 15 May 2025 08:31:57 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BBB310397281;
	Thu, 15 May 2025 10:31:46 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1747297910; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Fi0Gbu6aDQ30lLHvX8QotTG0CofWbimlQkVK9vsGpzQ=;
	b=ORs9VJ4HASNNxM8v+sEnhLcZOwGui+A+8YtPVkzc9ekhm984Z5WbHiiQdgPzyCIxDz1V8K
	P9IYjKL/RpOAukLtGAKN/j5KC36DNIYhoI/zsoHyh6jnpa5xGsYHdPUxb6JYYcDp2GwqaC
	Fv7F3hBvo6FNwP9FjOWyqTpWyrYUU9rML+mtJD9mtE61iFax0tfnPNr5lvbLI/sv44Va2J
	5LNr1MBsK15MHJ4crySIONzdcIfyKP9xbq9SB/xGBSEc9j5kyOdlDt9mEIejApKN9jLx5A
	XwZQe7JLVntjZaKVZkCI764x567zGg5dN4WxRmSz5Ut07+g3IwUiUm7ivgQBJA==
Date: Thu, 15 May 2025 10:31:43 +0200
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
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Stefan Wahren
 <wahrenst@gmx.net>, Simon Horman <horms@kernel.org>
Subject: Re: [net-next v11 1/7] dt-bindings: net: Add MTIP L2 switch
 description
Message-ID: <20250515103143.4d2255fc@wsk>
In-Reply-To: <20250514160115.GA2382587-robh@kernel.org>
References: <20250504145538.3881294-1-lukma@denx.de>
	<20250504145538.3881294-2-lukma@denx.de>
	<20250512164025.GA3454904-robh@kernel.org>
	<20250513080920.7c8a2a06@wsk>
	<20250514160115.GA2382587-robh@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/P_3M55nHRx=Laa9vzpqBEX+";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_013156_064688_25DB8C05 
X-CRM114-Status: GOOD (  44.46  )
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

--Sig_/P_3M55nHRx=Laa9vzpqBEX+
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

Hi Rob,

Thanks for your detailed explanation.

> On Tue, May 13, 2025 at 08:09:20AM +0200, Lukasz Majewski wrote:
> > Hi Rob,
> >  =20
> > > On Sun, May 04, 2025 at 04:55:32PM +0200, Lukasz Majewski wrote: =20
> > > > This patch provides description of the MTIP L2 switch available
> > > > in some NXP's SOCs - e.g. imx287.
> > > >=20
> > > > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > > > Reviewed-by: Stefan Wahren <wahrenst@gmx.net>
> > > >=20
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
> > > >=20
> > > > Changes for v4:
> > > > - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and
> > > > remove already referenced properties
> > > > - Rename file to nxp,imx28-mtip-switch.yaml
> > > >=20
> > > > Changes for v5:
> > > > - Provide proper description for 'ethernet-port' node
> > > >=20
> > > > Changes for v6:
> > > > - Proper usage of
> > > >   $ref:
> > > > ethernet-switch.yaml#/$defs/ethernet-ports/patternProperties
> > > > when specifying the 'ethernet-ports' property
> > > > - Add description and check for interrupt-names property
> > > >=20
> > > > Changes for v7:
> > > > - Change switch interrupt name from 'mtipl2sw' to 'enet_switch'
> > > >=20
> > > > Changes for v8:
> > > > - None
> > > >=20
> > > > Changes for v9:
> > > > - Add GPIO_ACTIVE_LOW to reset-gpios mdio phandle
> > > >=20
> > > > Changes for v10:
> > > > - None
> > > >=20
> > > > Changes for v11:
> > > > - None
> > > > ---
> > > >  .../bindings/net/nxp,imx28-mtip-switch.yaml   | 149
> > > > ++++++++++++++++++ 1 file changed, 149 insertions(+)
> > > >  create mode 100644
> > > > Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > > >=20
> > > > diff --git
> > > > a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > > > b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > > > new file mode 100644 index 000000000000..35f1fe268de7 ---
> > > > /dev/null +++
> > > > b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > > > @@ -0,0 +1,149 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR
> > > > BSD-2-Clause) +%YAML 1.2
> > > > +---
> > > > +$id:
> > > > http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
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
> > > > +properties:
> > > > +  compatible:
> > > > +    const: nxp,imx28-mtip-switch
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
> > > > +  interrupt-names:
> > > > +    items:
> > > > +      - const: enet_switch
> > > > +      - const: enet0
> > > > +      - const: enet1
> > > > +
> > > > +  pinctrl-names: true
> > > > +
> > > > +  ethernet-ports:
> > > > +    type: object
> > > > +    $ref:
> > > > ethernet-switch.yaml#/$defs/ethernet-ports/patternProperties   =20
> > >=20
> > > 'patternProperties' is wrong. Drop.
> > >  =20
> >=20
> > When I do drop it, then
> > make dt_binding_check DT_SCHEMA_FILES=3Dnxp,imx28-mtip-switch.yaml
> >=20
> > shows:
> >=20
> > nxp,imx28-mtip-switch.example.dtb: switch@800f0000: ethernet-ports:
> > 'oneOf' conditional failed, one must be fixed:
> >=20
> > 'ports' is a required property=20
> > 'ethernet-ports' is a required property
> >         from schema $id:
> >         http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
> > =20
>=20
> Actually, it needs to be at the top-level as well:
>=20
> allOf:
>   - $ref: ethernet-switch.yaml#/$defs/ethernet-ports
>=20

So after your suggestions - I've add:

allOf:
  - $ref: ethernet-switch.yaml#/$defs/ethernet-ports

In the top level of the file - above of
properties:
  ...
  ethernet-ports:
    type: object
    additionalProperties: true

    patternProperties:
	'^ethernet-port@[12]$':
	  type:=C2=B7object
          additionalProperties:=C2=B7true
          properties:
	    reg:
              items:
                - enum: [1, 2]
              description: MTIP L2 switch port number

And after calling:
make dt_binding_check DT_SCHEMA_FILES=3Dnxp,imx28-mtip-switch.yaml

there are no errors.

However, when I make a mistake nad in the "examples" section I change
'lablel' -> 'labelx' I see

switch@800f0000: ethernet-ports:ethernet-port@2: Unevaluated properties
are not allowed ('labelx' was unexpected)

which I suppose is expected behaviour.

>=20
> >=20
> > We do have ethernet-ports:
> > and we do "include" ($ref)
> > https://elixir.bootlin.com/linux/v6.14.6/source/Documentation/devicetre=
e/bindings/net/ethernet-switch.yaml#L77
> >=20
> > which is what we exactly need. =20
>=20
> The $ref is effectively pasting in what you reference, so the result=20
> would be:
>=20
> ethernet-ports:
>   type: object
>   "^(ethernet-)?ports$":
>     patternProperties:
>       "^(ethernet-)?port@[0-9a-f]+$":
>         description: Ethernet switch ports
>         $ref: ethernet-switch-port.yaml#
>         unevaluatedProperties: false
>=20
> A DT node/property name and json-schema keyword at the same level is=20
> never correct. json-schema behavior is to ignore (silently) any
> unknown keyword. So the validator sees the keyword
> "^(ethernet-)?ports$" and ignores everything below it.
>=20
>=20
> >  =20
> > > > +    additionalProperties: true   =20
> > >=20
> > > Drop.
> > >  =20
> >=20
> > When removed we do have:
> > nxp,imx28-mtip-switch.example.dtb: switch@800f0000: Unevaluated
> > properties are not allowed ('ethernet-ports' was unexpected)
> >=20
> > or=20
> >=20
> > nxp,imx28-mtip-switch.yaml: ethernet-ports: Missing
> > additionalProperties/unevaluatedProperties constraint =20
>=20
> 'additionalProperties: true' should suppress that.
>=20
> >=20
> > Depending if I do remove 'patternProperties' above.
> >=20
> > To sum up - with the current code, the DT schema checks pass. It
> > also looks like the $ref for ethernet-switch is used in an optimal
> > way.
> >=20
> > I would opt for keeping the code as is for v12. =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/P_3M55nHRx=Laa9vzpqBEX+
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmglpm8ACgkQAR8vZIA0
zr0lrwgAjYaokJU7/wM67PMOUKDCEun08foLIuNHkRs9C9qG7tZ55D3KAGKvglg2
MNAuHQUlKKLBMorzsKJ7TFfmcKAhrKJMM5w43t7AkeiNZhmCRv85RXQVtLkxkHeB
EP9yJCTt3AdAqsIxcv9VVVLB1xVKG1M/jFfiF2KcJACWZKTvMTmL6jfxG0VJXs40
P3H6kC04U/WZw8VKazlxdMRKo84ahVcua7H2tiyfM40olqEuZ0HOb86OXtuDRyIy
zhnWODQyp4vyJDFAQxNo1/ZXXM9J3YgH+IqH+lFbIWxHu276yFYuL6Qvn5hI9GZv
QAoqjGwAlKdwhnU2uTyeTlxoXRojdQ==
=uoB0
-----END PGP SIGNATURE-----

--Sig_/P_3M55nHRx=Laa9vzpqBEX+--

