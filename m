Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1928CCAC597
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Sep 2025 14:09:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m05uluONPFMJKrSnjCYxpUMKf4+AK/D2kfoK5Mv7GGc=; b=kV2Yt/9ROqHo03p7JfbDElIc2J
	7bhkwfAU9WlWCf3kOdSgcwqKxs6JQsCFg6T1FT798fawvCAbeRglIhzLjUS4d1sHz50+AWPiLRQBa
	frgHFjahZtNQEL2Rx16+TRRImqTYL8JfY3C6nL3TexaAfwuLpQYxPhDlrg1mzaOSCe2oKFThIHK2g
	4uJ248KeOYye2FS24DHMtm7x0HAeJRS/uIo9rU+65A2DMmz2didxNS030p3dTgHn+cR4Ax8Dfw14/
	JjB1iNCc6d4ppPp4t0jSxUiZcVVaO1Vyt1rVOUvkBNuhZEq9/0mw/+NnjCjTF4GLy0gu7trKiWV7P
	AXrez3EQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9tW-00000004bhZ-1hkA;
	Mon, 15 Sep 2025 14:09:26 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uy9tS-00000004bf9-3x8a
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Sep 2025 14:09:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id ACEAE1424;
	Mon, 15 Sep 2025 07:09:11 -0700 (PDT)
Received: from donnerap (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 055483F66E;
	Mon, 15 Sep 2025 07:09:17 -0700 (PDT)
Date: Mon, 15 Sep 2025 15:09:14 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?=" <j.ne@posteo.net>
Cc: "J. =?UTF-8?B?TmV1c2Now6RmZXI=?= via B4 Relay"
 <devnull+j.ne.posteo.net@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec
 <jernej.skrabec@gmail.com>, Samuel Holland <samuel@sholland.org>, Maxime
 Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
 linux-kernel@vger.kernel.org
Subject: Re: [PATCH 2/2] arm64: dts: allwinner: h313: Add Amediatech X96Q
Message-ID: <20250915150914.75e1df2b@donnerap>
In-Reply-To: <aMgXPPn3D3epmAua@probook>
References: <20250912-x96q-v1-0-8471daaf39db@posteo.net>
	<20250912-x96q-v1-2-8471daaf39db@posteo.net>
	<20250912105449.70717d80@donnerap>
	<aMgXPPn3D3epmAua@probook>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250915_070923_059346_EB7E27B1 
X-CRM114-Status: GOOD (  56.62  )
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

On Mon, 15 Sep 2025 13:40:15 +0000
J. Neusch=C3=A4fer <j.ne@posteo.net> wrote:

> On Fri, Sep 12, 2025 at 10:54:49AM +0100, Andre Przywara wrote:
> > On Fri, 12 Sep 2025 01:52:10 +0200
> > J. Neusch=C3=A4fer via B4 Relay <devnull+j.ne.posteo.net@kernel.org> wr=
ote:
> >=20
> > Hi,
> >=20
> > many thanks for posting the DT, I really wish more people would do that!
> >  =20
> > > From: "J. Neusch=C3=A4fer" <j.ne@posteo.net>
> > >=20
> > > The X96Q is a set-top box with an H313 SoC, AXP305 PMIC, 1 or 2 GiB R=
AM,
> > > 8 or 16 GiB eMMC flash, 2x USB A, Micro-SD, HDMI, Ethernet, audio/vid=
eo
> > > output, and infrared input.
> > >=20
> > >   https://x96mini.com/products/x96q-tv-box-android-10-set-top-box
> > >=20
> > > Tested, works:
> > > - debug UART
> > > - status LED
> > > - USB ports in host mode
> > > - MicroSD
> > > - eMMC
> > > - recovery button hidden behind audio/video port
> > > - analog audio (line out)
> > >=20
> > > Does not work:
> > > - Ethernet (requires AC200 MFD/EPHY driver)
> > > - analog video output (requires AC200 driver)
> > > - HDMI audio/video output
> > >=20
> > > Untested:
> > > - "OTG" USB port in device mode
> > > - built-in IR receiver
> > > - external IR receiver
> > > - WLAN (requires out-of-tree XRadio driver)
> > >=20
> > > Table of regulators on the downstream kernel, for reference:
> > >=20
> > >  vcc-5v      1   15      0 unknown  5000mV     0mA  5000mV  5000mV
> > >     dcdca    0    0      0 unknown   900mV     0mA     0mV     0mV
> > >     dcdcb    0    0      0 unknown  1350mV     0mA     0mV     0mV
> > >     dcdcc    0    0      0 unknown   900mV     0mA     0mV     0mV
> > >     dcdcd    0    0      0 unknown  1500mV     0mA     0mV     0mV
> > >     dcdce    0    0      0 unknown  3300mV     0mA     0mV     0mV
> > >     aldo1    0    0      0 unknown  3300mV     0mA     0mV     0mV
> > >     aldo2    0    0      0 unknown   700mV     0mA     0mV     0mV
> > >     aldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> > >     bldo1    0    0      0 unknown  1800mV     0mA     0mV     0mV
> > >     bldo2    0    0      0 unknown  1800mV     0mA     0mV     0mV
> > >     bldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> > >     bldo4    0    0      0 unknown   700mV     0mA     0mV     0mV
> > >     cldo1    0    0      0 unknown  2500mV     0mA     0mV     0mV
> > >     cldo2    0    0      0 unknown   700mV     0mA     0mV     0mV
> > >     cldo3    0    0      0 unknown   700mV     0mA     0mV     0mV
> > >=20
> > > Signed-off-by: J. Neusch=C3=A4fer <j.ne@posteo.net>
> > > ---
> > >  arch/arm64/boot/dts/allwinner/Makefile             |   1 +
> > >  arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts | 235 +++++++++++=
++++++++++
> > >  2 files changed, 236 insertions(+)
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot=
/dts/allwinner/Makefile
> > > index 780aeba0f3a4e14d69c9602e37b8d299165507b9..2edfa7bf4ab31c4aa934d=
a98e5e042edc9aaf600 100644
> > > --- a/arch/arm64/boot/dts/allwinner/Makefile
> > > +++ b/arch/arm64/boot/dts/allwinner/Makefile
> > > @@ -41,6 +41,7 @@ dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-pine-h64-mo=
del-b.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h6-tanix-tx6-mini.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-tanix-tx1.dtb
> > > +dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h313-x96q.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-cb1-manta.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-bigtreetech-pi.dtb
> > >  dtb-$(CONFIG_ARCH_SUNXI) +=3D sun50i-h616-orangepi-zero2.dtb
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts b/arc=
h/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > > new file mode 100644
> > > index 0000000000000000000000000000000000000000..9534eb03b89557f2545af=
5af7cf43390be722cf0
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-h313-x96q.dts
> > > @@ -0,0 +1,235 @@
> > > +// SPDX-License-Identifier: (GPL-2.0-or-later OR MIT)
> > > +/*
> > > + * Copyright (C) 2025 J. Neusch=C3=A4fer <j.ne@posteo.net>
> > > + */
> > > +
> > > +/dts-v1/;
> > > +
> > > +#include "sun50i-h616.dtsi"
> > > +#include "sun50i-h616-cpu-opp.dtsi"
> > > +
> > > +#include <dt-bindings/gpio/gpio.h>
> > > +#include <dt-bindings/interrupt-controller/arm-gic.h>
> > > +#include <dt-bindings/input/linux-event-codes.h>
> > > +#include <dt-bindings/leds/common.h>
> > > +
> > > +/ {
> > > +	model =3D "X96Q";
> > > +	compatible =3D "amediatech,x96q", "allwinner,sun50i-h616";
> > > +
> > > +	aliases {
> > > +		mmc0 =3D &mmc0;
> > > +		mmc1 =3D &mmc1;
> > > +		mmc2 =3D &mmc2; =20
> >=20
> > We don't do mmc aliases in the upstream DTs. Long story, but you should
> > not need them. I guess you want to disagree ;-), =20
>=20
> I've seen mmc aliases before, and I've seen the annoying effects of an
> unstable probe order, so this is mostly of thing of habit.

Yes, as I said, it's a long story ;-) IIUC Rockchip does it, we
traditionally don't. There are arguments for both ways, and the decision
for sunxi was to not do it.

> > in this case U-Boot has
> > you covered, by adding the aliases during build time: just use
> > $fdtcontroladdr, as you should do anyway. =20
>=20
> I'm using a recent upstream U-Boot with a FIT image ('make image.fit' in
> the Linux source tree). In this case U-Boot does not add mmc aliases.
> Is there a special Kconfig option I need to enable in U-Boot?

U-Boot now automatically sync's the kernel DTs into the U-Boot tree, so
U-Boot is using the exact same DT for itself - and can pass that on to any
kernel. The trick is to just not load a DTB, but instead forward the
address of the one U-Boot is already using: $fdtcontroladdr.
If you are using EFI boot, this is done automatically, if you are using
the traditional booti method, you just change the last parameter:
=3D> booti $kernel_addr_r $ramdisk_addr_r:$filesize $fdtcontroladdr

I don't know how this works exactly with FIT images, so if you can
override the DTB in there or not include it in the first place. The
concept of bundling a particular DTB with a kernel is admittedly a long
standing practise in the embedded world, but does not make much sense
outside of it (in a single image, distribution world), and I like to treat
the embedded use case as a special case of a more generic approach.

> What do you mean by 'build time'? U-Boot's?

When U-Boot builds the DTB it uses itself, it will add some nodes, mostly
from arch/arm/dts/sunxi-u-boot.dtsi.
And because U-Boot relies on the MMC aliases internally, we add them
there. So if you pass on that DT, you will get the aliases.

Cheers,
Andre

> > > +		serial0 =3D &uart0;
> > > +	}; =20
> [...]
> > > +&mmc0 {
> > > +	vmmc-supply =3D <&reg_aldo1>;
> > > +	cd-gpios =3D <&pio 5 6 GPIO_ACTIVE_LOW>;	/* PF6 */
> > > +	disable-wp;
> > > +	bus-width =3D <4>;
> > > +	max-frequency =3D <150000000>; =20
> >=20
> > That line is already in the .dtsi file, so redundant. =20
>=20
> Good point, removing.
> >  =20
> > > +	status =3D "okay";
> > > +	/* =C2=B5SD */ =20
> >=20
> > If we really need this comment, it should be above, right after the
> > "&mmc0 {". And I wonder if it should be "microSD" instead. =20
>=20
> Good points, I'll do both.
>=20
> > > +};
> > > +
> > > +&mmc1 {
> > > +	/* TODO: XRadio XR819 WLAN */ =20
> >=20
> > Either you just keep the comment, an mention mmc1, but don't reference =
the
> > node, or you add the properties that you know of already, like
> > vmmc-supply, vqmmc-supply, mmc-pwrseq, bus-width, non-removable.
> > But this "empty reference with a comment" is somewhat odd. =20
>=20
> I'll change it to a pure comment for now.
>=20
> > > +};
> > > +
> > > +&mmc2 {
> > > +	vmmc-supply =3D <&reg_aldo1>;
> > > +	vqmmc-supply =3D <&reg_bldo1>;
> > > +	non-removable;
> > > +	cap-mmc-hw-reset;
> > > +	mmc-ddr-1_8v;
> > > +	mmc-hs200-1_8v;
> > > +	bus-width =3D <8>;
> > > +	max-frequency =3D <100000000>; =20
> >=20
> > Are you sure you need that? =20
>=20
> I found it in the downstream DT. The eMMC probes fine without it, so
> I'll remove it. The eMMC datasheet (assuming I found the right one),
> claims a maximum of 200 MHz, so the 100 MHz restriction seems
> unnecessary.
>=20
> >  =20
> > > +	status =3D "okay";
> > > +	/* eMMC */ =20
> >=20
> > Please move that comment up. =20
>=20
> Will do.
>=20
>=20
> [...]
> > > +		regulators {
> > > +			reg_dcdca: dcdca {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt =3D <810000>;
> > > +				regulator-max-microvolt =3D <1100000>;
> > > +				regulator-name =3D "vdd-cpu";
> > > +			};
> > > +
> > > +			dcdcb {
> > > +				/* unused */
> > > +			};
> > > +
> > > +			reg_dcdcc: dcdcc {
> > > +				regulator-always-on;
> > > +				regulator-min-microvolt =3D <810000>;
> > > +				regulator-max-microvolt =3D <990000>;
> > > +				regulator-name =3D "vdd-gpu-sys";
> > > +			};
> > > +
> > > +			dcdcd {
> > > +				regulator-always-on; =20
> >=20
> > Why is this always on? What happens if you remove that line or turn it =
off?
> > For always-on regulators we either need a comment saying why, or, bette=
r,
> > have an explanatory regulator-name (like above).
> > Is that for DRAM, by any chance (1.5V for DDR3 chips)? =20
>=20
> The observed behavior is that the system halts when dcdcd is disabled.
> The relationship is a bit hard to determine without schematics, but the
> DDR3 chips (Micron MT41J256M4) do indeed use 1.5V. Since this is the
> only source of 1.5V, I think it's a safe guess that this is indeed the
> DRAM regulator.
>=20
> >=20
> > Cheers,
> > Andre =20
>=20
> Thanks for the review!
> J. Neusch=C3=A4fer


