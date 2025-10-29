Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7CC4CCF9EB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:07:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/7JCIegUBdAQZY+vgxiVHz9LXyGZZsVQm2bonF0TxOI=; b=4xv/5O452xTokWle1/pqilR1op
	OOXBkLRmI/JqWgN4kSIAkDma7aeyvzqpll/Rfxu7bopFjDUzMfsEuxiGdqVXChowxQJ8GnVjY97tX
	063Setr+/oRFxcZpwtW+Y8vk1EP+mFCPMFeY1r4MfcMigvnF6om+ByaeQz8LRO6PRnadeQecYwymC
	9CZvYIKsErVjhIUPNpOk0TQZNfqRRIU/GBu9sTLB7stBGqU1nMnmFuVF4osv3VvYiCyFni2Ce9jd0
	dWO4QZ6kc1Yto7seXEIcXnjs9q6fo633Bl05v7oVUsVSxlU9axGdHh9NGypZTM6OjRaaPiN/t90in
	jGy3Sbtw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAa1-00000002Lmk-37bB;
	Wed, 29 Oct 2025 18:07:29 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEAa0-00000002Llw-1HYG;
	Wed, 29 Oct 2025 18:07:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 485596000A;
	Wed, 29 Oct 2025 18:07:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2D15C4CEF7;
	Wed, 29 Oct 2025 18:07:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761761246;
	bh=HOvHrd9lTlExQNxMx+bs7lEVd82AgmD5uhqp7QkEUdA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X4q/lDtQpA2b2W99z9QNzL38dlSOCO1t6RvlIzLwq7zlhayOqakk9R0+/0d8tjPPZ
	 YSmZcay+0TvIe5sLPWqHMXVhMz9cNpcLMNDI0TyB5EmmPPZjzlrWpxmV3LXcB6mKBr
	 ek4FLQYqJirLYxiMdtCqmE+qcrtrpXza0Sz/O1r8z9zb9ykUK2x4Gm4Ga9pssIbJ/m
	 1r+fE3IbvooxK8LvD95nlxLT5bidqE346ZtRYrEyy/EqpLaViNsesDZ9dsMFvqCnZ/
	 cJd3VJTafiD0dJU18sZDBGsQM2URy9M/duSwaqMg0wdlSzREQU8TPgdA5OXgNdv/58
	 cI4Mphoh1SnHg==
Date: Wed, 29 Oct 2025 18:07:22 +0000
From: Conor Dooley <conor@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Lorenzo Bianconi <lorenzo@kernel.org>,
	linux-arm-kernel@lists.infradead.org, linux-phy@lists.infradead.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 2/4] dt-bindings: phy: Add documentation for Airoha
 AN7581 USB PHY
Message-ID: <20251029-mutual-scotch-7ca52e17da69@spud>
References: <20251029173713.7670-1-ansuelsmth@gmail.com>
 <20251029173713.7670-3-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Z7BQNDIzoaCE66cj"
Content-Disposition: inline
In-Reply-To: <20251029173713.7670-3-ansuelsmth@gmail.com>
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


--Z7BQNDIzoaCE66cj
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 06:37:10PM +0100, Christian Marangi wrote:
> Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> for the USB controller.
>=20
> Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> always supported. The USB 3.0 mode is optional and depends on the Serdes
> mode currently configured on the system for the relevant USB port.
>=20
> The first USB port on the SoC can be both used for USB 3.0 operation or
> Ethernet (HSGMII).
> The second USB port on the SoC can be both used for USB 3.0 operation or
> for an additional PCIe line.
>=20
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>=20
> For DT maintainers, in v2 there were some comments, hope the new
> description and names of the property better clarify the usage and
> why they are needed.
>=20
>  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 76 +++++++++++++++++++
>  MAINTAINERS                                   |  7 ++
>  .../dt-bindings/phy/airoha,an7581-usb-phy.h   | 11 +++
>  3 files changed, 94 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an7581-u=
sb-phy.yaml
>  create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h
>=20
> diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.=
yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> new file mode 100644
> index 000000000000..5106685c124d
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> @@ -0,0 +1,76 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Airoha AN7581 SoC USB PHY
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: >
> +  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB contro=
ller.
> +
> +  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> +  always supported. The USB 3.0 mode is optional and depends on the Serd=
es
> +  mode currently configured on the system for the relevant USB port.
> +
> +  The first USB port on the SoC can be both used for USB 3.0 operation or
> +  Ethernet (HSGMII).
> +  The second USB port on the SoC can be both used for USB 3.0 operation =
or
> +  for an additional PCIe line.
> +
> +properties:
> +  compatible:
> +    const: airoha,an7581-usb-phy
> +
> +  reg:
> +    maxItems: 1
> +
> +  airoha,usb2-monitor-clk-sel:
> +    description: Describe what oscillator across the available 4
> +      should be selected for USB 2.0 Slew Rate calibration.

Why's this being set in dt? What actually determines what oscillator
should be used? Do they have different performance characteristics?
How is someone meant to know which one to use?

> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [0, 1, 2, 3]
> +
> +  airoha,usb3-serdes:
> +    description: Describe what Serdes line is attached to the USB 3.0 po=
rt.
> +      Can be either Serdes USB1 or Serdes USB2.
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [2, 3]

This is confusing. Why 2 and 3 for usb1 and usb2? What even is the
mapping? Is it 2:1/3:2 or 2:2/3:1?

> +
> +  airoha,scu:
> +    description: Phandle to the SCU syscon to configure the Serdes line.
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +
> +  '#phy-cells':
> +    description: Describe if the referred PHY is the USB 2.0 PHY or USB =
3.0 PHY.
> +    const: 1

Which is which here?

> +
> +required:
> +  - compatible
> +  - reg
> +  - airoha,usb2-monitor-clk-sel
> +  - airoha,usb3-serdes
> +  - airoha,scu
> +  - '#phy-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/phy/airoha,an7581-usb-phy.h>
> +    #include <dt-bindings/soc/airoha,scu-ssr.h>
> +
> +    phy@1fac0000 {
> +        compatible =3D "airoha,an7581-usb-phy";
> +        reg =3D <0x1fac0000 0x10000>;
> +
> +        airoha,usb2-monitor-clk-sel =3D <AIROHA_USB2_MONCLK_SEL1>;
> +        airoha,usb3-serdes =3D <AIROHA_SCU_SERDES_USB1>;
> +        airoha,scu =3D <&scu>;
> +
> +        #phy-cells =3D <1>;
> +    };
> +
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 8085fdca7bcd..af23c590bbc6 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -763,6 +763,13 @@ S:	Maintained
>  F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
>  F:	drivers/spi/spi-airoha-snfi.c
> =20
> +AIROHA USB PHY DRIVER
> +M:	Christian Marangi <ansuelsmth@gmail.com>
> +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
> +S:	Maintained
> +F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> +F:	include/dt-bindings/phy/airoha,an7581-usb-phy.h
> +
>  AIRSPY MEDIA DRIVER
>  L:	linux-media@vger.kernel.org
>  S:	Orphan
> diff --git a/include/dt-bindings/phy/airoha,an7581-usb-phy.h b/include/dt=
-bindings/phy/airoha,an7581-usb-phy.h
> new file mode 100644
> index 000000000000..efbb0ae75e3a
> --- /dev/null
> +++ b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
> @@ -0,0 +1,11 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +
> +#ifndef _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
> +#define _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
> +
> +#define AIROHA_USB2_MONCLK_SEL0                 0
> +#define AIROHA_USB2_MONCLK_SEL1                 1
> +#define AIROHA_USB2_MONCLK_SEL2                 2
> +#define AIROHA_USB2_MONCLK_SEL3                 3

These definitions seem completely pointless. The property is called
"airoha,usb2-monitor-clk-sel" so any use will look like
"airoha,usb2-monitor-clk-sel =3D <3>;"
That's more informative than the define is, since it doesn't even
truncate "monitor". I'd just delete this header entirely and use the
number. If you want the define in the driver to avoid magic numbers,
just define it in the driver.

pw-bot: changes-requested

Cheers,
Conor.

> +
> +#endif
> --=20
> 2.51.0
>=20

--Z7BQNDIzoaCE66cj
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJX2gAKCRB4tDGHoIJi
0jsDAQDITrn7gsppDeHnAxbwqv7YYEnEDsZJ/nPYsQk3xGv+mwEAi/4/ynU5ENSf
0DpmF4S9GFe864MRVZI5RN5s6C21pQQ=
=kyYV
-----END PGP SIGNATURE-----

--Z7BQNDIzoaCE66cj--

