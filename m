Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAB0BCCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Oct 2025 18:36:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A/xTOmL4iVdVpg/mMPVyy/TLNl1UR/aB6TOhJjWRRds=; b=jToLuIfZwu+68pmGMiyMUV4OEj
	uhh46vVa6411WyApszK+pkWnAKeunhcie/n8QstonHoJ09/lNrUE36aA3qWOywTMGbCbIJ7k8p/0f
	Lb/uilQF0PD5lAC2Gzd2LARKFecjyMZZH67M/0qIjsCImdeCt6wgAYgmZBgpurvbEO34sJksb7BAJ
	5V9oNCS2PNoyU9XOzeNMDJKkXHlAt27FpRm1HjiJcGBjFgrRhxt3tjAgBmVmp16p6ZAD30i0W/NwF
	b4j0ArBMqyaGGB/kG3p4r9itkvDpru/g9E7x4gIp4OEN0MeGXpAfJzNdCCWB8E0woYzw8t9u32Z3+
	RVHaw+6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEB1a-00000002QPt-18yP;
	Wed, 29 Oct 2025 18:35:58 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEB1Y-00000002QPk-3JBv;
	Wed, 29 Oct 2025 18:35:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DE070603A3;
	Wed, 29 Oct 2025 18:35:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 69A13C4CEF7;
	Wed, 29 Oct 2025 18:35:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761762955;
	bh=sdripFbkO+G3eCx55o/qnidBR9lUVgPjsMG6dmmgndM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VDk+hmAVPgj8bzjbENtfSt4gMQi6YPiu1Npo9kRKRyFYNnRhDxKqFUUrgIst/yanY
	 mCTqLefFtL8Dh0SFiC1u5kDtRx1emWx1bW6OUIQIIVGuJkWk+vhc4pShoIzZCm1OPf
	 43wvYGzEC+ntnop0igedzSyUk9L6Psls+BdRhcfnnjddZ8z6cxluyIMOZqP47u/94z
	 NcDbyxefLk1JI85rDL0vCZcna5tE3oDcqUClL1yOuTc1nKUOzJk42ZiL0Nr45S0YR2
	 kOVCteh6kNEWuQuLKOQGbxsUB3aFQUrEKq86lMF24aola5gxnjTpUlTCC078odspwg
	 4pp30V9nwETOQ==
Date: Wed, 29 Oct 2025 18:35:51 +0000
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
Message-ID: <20251029-henna-easily-227513366e90@spud>
References: <20251029173713.7670-1-ansuelsmth@gmail.com>
 <20251029173713.7670-3-ansuelsmth@gmail.com>
 <20251029-mutual-scotch-7ca52e17da69@spud>
 <69025bc9.5d0a0220.1f0440.deb9@mx.google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oeEKek2lDmQPqfwa"
Content-Disposition: inline
In-Reply-To: <69025bc9.5d0a0220.1f0440.deb9@mx.google.com>
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


--oeEKek2lDmQPqfwa
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 29, 2025 at 07:24:04PM +0100, Christian Marangi wrote:
> On Wed, Oct 29, 2025 at 06:07:22PM +0000, Conor Dooley wrote:
> > On Wed, Oct 29, 2025 at 06:37:10PM +0100, Christian Marangi wrote:
> > > Add documentation for Airoha AN7581 USB PHY that describe the USB PHY
> > > for the USB controller.
> > >=20
> > > Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mode is
> > > always supported. The USB 3.0 mode is optional and depends on the Ser=
des
> > > mode currently configured on the system for the relevant USB port.
> > >=20
> > > The first USB port on the SoC can be both used for USB 3.0 operation =
or
> > > Ethernet (HSGMII).
> > > The second USB port on the SoC can be both used for USB 3.0 operation=
 or
> > > for an additional PCIe line.
> > >=20
> > > Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> > > ---
> > >=20
> > > For DT maintainers, in v2 there were some comments, hope the new
> > > description and names of the property better clarify the usage and
> > > why they are needed.
> > >=20
> > >  .../bindings/phy/airoha,an7581-usb-phy.yaml   | 76 +++++++++++++++++=
++
> > >  MAINTAINERS                                   |  7 ++
> > >  .../dt-bindings/phy/airoha,an7581-usb-phy.h   | 11 +++
> > >  3 files changed, 94 insertions(+)
> > >  create mode 100644 Documentation/devicetree/bindings/phy/airoha,an75=
81-usb-phy.yaml
> > >  create mode 100644 include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > >=20
> > > diff --git a/Documentation/devicetree/bindings/phy/airoha,an7581-usb-=
phy.yaml b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > > new file mode 100644
> > > index 000000000000..5106685c124d
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > > @@ -0,0 +1,76 @@
> > > +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/phy/airoha,an7581-usb-phy.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: Airoha AN7581 SoC USB PHY
> > > +
> > > +maintainers:
> > > +  - Christian Marangi <ansuelsmth@gmail.com>
> > > +
> > > +description: >
> > > +  The Airoha AN7581 SoC USB PHY describes the USB PHY for the USB co=
ntroller.
> > > +
> > > +  Airoha AN7581 SoC support a maximum of 2 USB port. The USB 2.0 mod=
e is
> > > +  always supported. The USB 3.0 mode is optional and depends on the =
Serdes
> > > +  mode currently configured on the system for the relevant USB port.
> > > +
> > > +  The first USB port on the SoC can be both used for USB 3.0 operati=
on or
> > > +  Ethernet (HSGMII).
> > > +  The second USB port on the SoC can be both used for USB 3.0 operat=
ion or
> > > +  for an additional PCIe line.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    const: airoha,an7581-usb-phy
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  airoha,usb2-monitor-clk-sel:
> > > +    description: Describe what oscillator across the available 4
> > > +      should be selected for USB 2.0 Slew Rate calibration.
> >=20
> > Why's this being set in dt? What actually determines what oscillator
> > should be used? Do they have different performance characteristics?
> > How is someone meant to know which one to use?
> >
>=20
> Hi Conor,
>=20
> thanks a lot for the review.
>=20
> The airoha,usb2-monitor-clk-sel is set in DT because it describe the HW
> and to what oscillator the PHY should be connected to.
>=20
> There are 2 PHY at different register space. One PHY needs to calibrate
> for oscillator 1 and the other PHY for oscillator 2 or the PHY doesn't
> work for USB 2.0 (the calibration fails)

This implies that the oscillator is not part of the phy block, if
there's multiple competing for the same one. Why are these oscillators
not represented as clocks?

> The previous implementation used an index property but that was rejected
> as it wasn't descriptive of the HW.
>=20
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [0, 1, 2, 3]
> > > +
> > > +  airoha,usb3-serdes:
> > > +    description: Describe what Serdes line is attached to the USB 3.=
0 port.
> > > +      Can be either Serdes USB1 or Serdes USB2.
> > > +    $ref: /schemas/types.yaml#/definitions/uint32
> > > +    enum: [2, 3]
> >=20
> > This is confusing. Why 2 and 3 for usb1 and usb2? What even is the
> > mapping? Is it 2:1/3:2 or 2:2/3:1?
> >=20
>=20
> AFAIK there isn't a way to directly reference dt-bindings.

Usually people put the name of the file in.

>=20
> 2 and 3 are from include/dt-bindings/soc/airoha,scu-ssr.h
>=20
> #define AIROHA_SCU_SERDES_USB1		2
> #define AIROHA_SCU_SERDES_USB2		3

Why overcomplicate like this? Just use 1 and 2. If that corresponds to
register settings of 2 and 3, do that conversion in the driver.
Properties are not shoving just register settings etc into, what happens,
for example, when the next soc comes along and these are actually usb1 is
3 and usb2 is 4 there? All of a sudden, your property has different
meanings depending on which device is being used.

> > > +
> > > +  airoha,scu:
> > > +    description: Phandle to the SCU syscon to configure the Serdes l=
ine.
> > > +    $ref: /schemas/types.yaml#/definitions/phandle
> > > +
> > > +  '#phy-cells':
> > > +    description: Describe if the referred PHY is the USB 2.0 PHY or =
USB 3.0 PHY.
> > > +    const: 1
> >=20
> > Which is which here?
> >
>=20
> Mhh I think I didn't understand here. #phy-cells describe the
> parameters to be used for phys property in a different node.
>=20
> The current usage would be
>=20
> <&usb0_phy PHY_TYPE_USB2> for USB 2.0
> or <&usb0_phy PHY_TYPE_USB3> for USB 3.0
>=20
> This node expose 2 PHY that can be referenced by the single parameters.

Ah, I didn't know that the 1 cell variant here was type not index.

> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - airoha,usb2-monitor-clk-sel
> > > +  - airoha,usb3-serdes
> > > +  - airoha,scu
> > > +  - '#phy-cells'
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/phy/airoha,an7581-usb-phy.h>
> > > +    #include <dt-bindings/soc/airoha,scu-ssr.h>
> > > +
> > > +    phy@1fac0000 {
> > > +        compatible =3D "airoha,an7581-usb-phy";
> > > +        reg =3D <0x1fac0000 0x10000>;
> > > +
> > > +        airoha,usb2-monitor-clk-sel =3D <AIROHA_USB2_MONCLK_SEL1>;
> > > +        airoha,usb3-serdes =3D <AIROHA_SCU_SERDES_USB1>;
> > > +        airoha,scu =3D <&scu>;
> > > +
> > > +        #phy-cells =3D <1>;
> > > +    };
> > > +
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8085fdca7bcd..af23c590bbc6 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -763,6 +763,13 @@ S:	Maintained
> > >  F:	Documentation/devicetree/bindings/spi/airoha,en7581-snand.yaml
> > >  F:	drivers/spi/spi-airoha-snfi.c
> > > =20
> > > +AIROHA USB PHY DRIVER
> > > +M:	Christian Marangi <ansuelsmth@gmail.com>
> > > +L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribe=
rs)
> > > +S:	Maintained
> > > +F:	Documentation/devicetree/bindings/phy/airoha,an7581-usb-phy.yaml
> > > +F:	include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > > +
> > >  AIRSPY MEDIA DRIVER
> > >  L:	linux-media@vger.kernel.org
> > >  S:	Orphan
> > > diff --git a/include/dt-bindings/phy/airoha,an7581-usb-phy.h b/includ=
e/dt-bindings/phy/airoha,an7581-usb-phy.h
> > > new file mode 100644
> > > index 000000000000..efbb0ae75e3a
> > > --- /dev/null
> > > +++ b/include/dt-bindings/phy/airoha,an7581-usb-phy.h
> > > @@ -0,0 +1,11 @@
> > > +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> > > +
> > > +#ifndef _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
> > > +#define _DT_BINDINGS_AIROHA_AN7581_USB_PHY_H_
> > > +
> > > +#define AIROHA_USB2_MONCLK_SEL0                 0
> > > +#define AIROHA_USB2_MONCLK_SEL1                 1
> > > +#define AIROHA_USB2_MONCLK_SEL2                 2
> > > +#define AIROHA_USB2_MONCLK_SEL3                 3
> >=20
> > These definitions seem completely pointless. The property is called
> > "airoha,usb2-monitor-clk-sel" so any use will look like
> > "airoha,usb2-monitor-clk-sel =3D <3>;"
> > That's more informative than the define is, since it doesn't even
> > truncate "monitor". I'd just delete this header entirely and use the
> > number. If you want the define in the driver to avoid magic numbers,
> > just define it in the driver.
> >=20
>=20
> Well yes the idea here is to not have to use magic numbers in DT and try
> to use the naming in the SoC documentation since they are called
> monclk_sel0, monclk_sel1 ...

Sometimes the "magic" number just makes sense to use. If something is
completely arbitrary, then sure use one to make it readable. If
literally the number itself, as it is here, don't bother.

--oeEKek2lDmQPqfwa
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCaQJehwAKCRB4tDGHoIJi
0uzdAP9bfvOWqmOLSu+ZjI8e5AECiH2Cisx+6CuyofLZGqxz1wEAgiA/AWgNS939
sMMOUiE+Hfbd0r0M7wiKPPrrVeMQfwY=
=R2uO
-----END PGP SIGNATURE-----

--oeEKek2lDmQPqfwa--

