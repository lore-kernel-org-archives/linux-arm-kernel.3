Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EDF9C369BA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Apr 2025 07:38:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Sc8sq8yhI+eFhQYdluameP+NynQUgnB1EXAG4gA7e5Y=; b=cOf6YiptNsHXFhVpxP1DsrAIo0
	JENTnDOJ+iQdih3vATCIb1WBm7lHXZ7IDeEfOZd4Hk9sCtyn9PbkZ/VChl3B4Y8ZT3F+pGHqdR03e
	+13YNTml+/4j+q+jiWBVjsmIywvydd7Gat6hi2bdcPXuV5qhOCe5rdIDiaEqOfaFrg/7/z3R5m0H5
	T792XxKPdtRaWI04ag/4WyFKa27vzKn6i/PaDQN20ScruWUERdSV54jCo7ZQFkOdWnOY5Chddud4x
	8z1lB0MTRa8ZdVOVaTeeRbiMl6khJYGwFJ1Jg6MKAptnDSiPdhem54nvyTzjmGoyqy4I+6Ts17D9m
	J1Ezd62Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xLm-00000008eXH-2Vgr;
	Wed, 16 Apr 2025 07:38:26 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u4xJu-00000008dxt-2JRo
	for linux-arm-kernel@lists.infradead.org;
	Wed, 16 Apr 2025 07:36:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 2EC4E1039EF29;
	Wed, 16 Apr 2025 09:36:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1744788986; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 in-reply-to:references; bh=Sc8sq8yhI+eFhQYdluameP+NynQUgnB1EXAG4gA7e5Y=;
	b=JzOjblXdlaekTamo8vCfUy3Ccow5WSv7kuJMoqEphQvpslF7jgaW2BA7J2Qb+roH1s+ial
	vcJ8xp3FUvObAG4mBYArwOhUASkLeJYZzOuYhVJJWd7XUqdrfRyzz4HI24J3Zh4brxITY9
	5AWwam9y4nvogEQzuEquNnvBLUkAzjcPvDdbkkFYSLzKauk8rEUyciJqgitEt5BpYczfFk
	WPrKe1+3lF8mBlc0stvH8IodYsJfbd7jSxmRrCsaGGrGYftW6wlVvjJ+z6eyaPrLStuosJ
	CEd06l5IUlWCk84OMgNl8Ctb2sU1Xv0zQF1LSPq1N6D37Q1oxAVQNgFKoCSI2Q==
Date: Wed, 16 Apr 2025 09:36:18 +0200
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
Subject: Re: [net-next v5 1/6] dt-bindings: net: Add MTIP L2 switch
 description
Message-ID: <20250416093618.6269ae22@wsk>
In-Reply-To: <20250415220853.GA903775-robh@kernel.org>
References: <20250414140128.390400-1-lukma@denx.de>
	<20250414140128.390400-2-lukma@denx.de>
	<20250415220853.GA903775-robh@kernel.org>
Organization: denx.de
X-Mailer: Claws Mail 3.19.0 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/E+Y3p4p0EiminI1G.eDIyI2";
 protocol="application/pgp-signature"; micalg=pgp-sha512
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250416_003630_900365_F40A8F05 
X-CRM114-Status: GOOD (  33.35  )
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

--Sig_/E+Y3p4p0EiminI1G.eDIyI2
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: quoted-printable

Hi Rob,

> On Mon, Apr 14, 2025 at 04:01:23PM +0200, Lukasz Majewski wrote:
> > This patch provides description of the MTIP L2 switch available in
> > some NXP's SOCs - e.g. imx287.
> >=20
> > Signed-off-by: Lukasz Majewski <lukma@denx.de>
> > ---
> > Changes for v2:
> > - Rename the file to match exactly the compatible
> >   (nxp,imx287-mtip-switch)
> >=20
> > Changes for v3:
> > - Remove '-' from const:'nxp,imx287-mtip-switch'
> > - Use '^port@[12]+$' for port patternProperties
> > - Drop status =3D "okay";
> > - Provide proper indentation for 'example' binding (replace 8
> >   spaces with 4 spaces)
> > - Remove smsc,disable-energy-detect; property
> > - Remove interrupt-parent and interrupts properties as not required
> > - Remove #address-cells and #size-cells from required properties
> > check
> > - remove description from reg:
> > - Add $ref: ethernet-switch.yaml#
> >=20
> > Changes for v4:
> > - Use $ref: ethernet-switch.yaml#/$defs/ethernet-ports and remove
> > already referenced properties
> > - Rename file to nxp,imx28-mtip-switch.yaml
> >=20
> > Changes for v5:
> > - Provide proper description for 'ethernet-port' node
> > ---
> >  .../bindings/net/nxp,imx28-mtip-switch.yaml   | 141
> > ++++++++++++++++++ 1 file changed, 141 insertions(+)
> >  create mode 100644
> > Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> >=20
> > diff --git
> > a/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > new file mode 100644 index 000000000000..6f2b5a277ac2 --- /dev/null
> > +++
> > b/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.yaml
> > @@ -0,0 +1,141 @@ +# SPDX-License-Identifier: (GPL-2.0-only OR
> > BSD-2-Clause) +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
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
> > +$ref: ethernet-switch.yaml#/$defs/ethernet-ports
> > +
> > +properties:
> > +  compatible:
> > +    const: nxp,imx28-mtip-switch
> > +
> > +  reg:
> > +    maxItems: 1
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
> > +  pinctrl-names: true
> > +
> > +  ethernet-ports:
> > +    type: object
> > +    additionalProperties: true
> > +    properties:
> > +      ethernet-port:
> > +        type: object
> > +        unevaluatedProperties: false =20
>=20
> This is going to fail if you have any property other than 'reg'.

The DT schema check shall fail when reg is not equal to 1 or 2, as this
switch has only two ports.

> But=20
> then it will never be applied because you never have a node called
> 'ethernet-port' since you have more than 1 child node.
> You need this=20
> under 'patternProperties' and 'additionalProperties: true' instead.
> And please test some of the requirements here. Like a reg value of 3
> or remove 'phy-mode'.

In linux-next we now also have realtek,rtl9301-switch.yaml which uses
just:

properties:
  ethernet-ports:
    type: object

but when in "examples" I do remove for example "phy-handle" the command:
make dt_binding_check DT_SCHEMA_FILES=3Drealtek,rtl9301-switch.yaml

is executed without errors.


IMHO the problem is with proper usage of
$ref: ethernet-switch.yaml#/$defs/ethernet-ports

which shall in my case be extended to have:
$ref: ethernet-switch.yaml#/$defs/ethernet-ports/patternProperties

In the case of MTIP - the following SCHEMA description shall be used:

  ethernet-ports:
    type: object
    $ref: ethernet-switch.yaml#/$defs/ethernet-ports/patternProperties
    additionalProperties: true

    patternProperties:
      '^ethernet-port@[12]$':
        type: object
        additionalProperties: true
        properties:
          reg:
            items:
              - enum: [1, 2]
            description: MTIP L2 switch port number

        required:
          - reg
          - label
          - phy-mode
          - phy-handle


And then, when I remove from 'example:' the 'label':

make dt_binding_check DT_SCHEMA_FILES=3Dnxp,imx28-mtip-switch.yaml
/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.example.dtb:
switch@800f0000: ethernet-ports:ethernet-port@2: 'label' is a required
property from schema $id:
http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#
/Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.example.dtb:
switch@800f0000: Unevaluated properties are not allowed
('ethernet-ports' was unexpected) from schema $id:
http://devicetree.org/schemas/net/nxp,imx28-mtip-switch.yaml#

or when reg =3D <3>;

Documentation/devicetree/bindings/net/nxp,imx28-mtip-switch.example.dtb:
switch@800f0000: ethernet-ports:ethernet-port@2:reg:0:0: 3 is not one
of [1, 2]

When I do use the untouched example: node - it compiles without errors.

I do guess that this is the expected behaviour... :-)

>=20
> > +
> > +        properties:
> > +          reg:
> > +            items:
> > +              - enum: [1, 2]
> > +            description: MTIP L2 switch port number
> > +
> > +        required:
> > +          - reg
> > +          - label
> > +          - phy-mode
> > +          - phy-handle =20




Best regards,

Lukasz Majewski

--

DENX Software Engineering GmbH,      Managing Director: Erika Unter
HRB 165235 Munich, Office: Kirchenstr.5, D-82194 Groebenzell, Germany
Phone: (+49)-8142-66989-59 Fax: (+49)-8142-66989-80 Email: lukma@denx.de

--Sig_/E+Y3p4p0EiminI1G.eDIyI2
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQEzBAEBCgAdFiEEgAyFJ+N6uu6+XupJAR8vZIA0zr0FAmf/XfIACgkQAR8vZIA0
zr1GTwf/b33OaBe5N9vRxgAOvVMNfYHagLQoWiI/DqsxTokp7CwJmXhQnAF1wQQX
5NRUw5pMohXvR4hJmOQ5ME+14OH0GkvxVWje/CfobWpV65pdXZA20IYztqaoLgQn
QeBVZZgsEhQShUd/Ksy64CnSMjD3Ln4cDffE+8Ep7uST7fNwncVbFkEHjuGch4XK
zXx7DrkfUyrDhBQU6GS9DNELju4NaK6lEPEATOV9tCQ5AfGmcPIZ9oWho84aLg9/
XSzStIBJThE3XKK8w+DkDx9CYWMUUqT+tRrKktqK8ad3ASLMvRICe41L0ovly1Ng
GBZVi8lIMMneCqM7qFyYDVg46xk++g==
=tuno
-----END PGP SIGNATURE-----

--Sig_/E+Y3p4p0EiminI1G.eDIyI2--

