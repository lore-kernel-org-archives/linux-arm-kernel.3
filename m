Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9FAECD343F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 21:46:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+13wAwrWoBXN18Chi5bGmWHAFyIongjx10W5PyDknCQ=; b=rD/lG2oIC6hqhCWyv0uHNJ0g9h
	tkyoGcC8dPXep+8G7NXhnv4zXg9mKN9gqoSNX4F7KiXUI8/Rm5m64crh9LhEOOMdKtxwC1mlHNqZ9
	yimPXQ2JSBXK4Ei0NN5YH3Bl/RCwYK/Fb/bSq+dq5PFjxgbyq/yG/d2dNpfkIhMZ+Xz3aOdTynQ+R
	xX8qEqyDQPO8OfT437UUqLjD2bbxRDs/5igrs2/egx+QELEN0j/yHSnEGFoI2eMmAqMkOCgHnjCbf
	FdJLJIOKP/yGIAeVML8ObQX4JEr2i8Q9Vgo+KHqx2PSwXMNbVjs7IGhprvBKPcuzr7VgjTlVesiOY
	abaJaOkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5nY-0000000H1yS-2SxK;
	Mon, 18 May 2026 21:46:52 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP5nU-0000000H1xV-2eIh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 21:46:50 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 63D1A1F8004F
	for <linux-arm-kernel@lists.infradead.org>; Mon, 18 May 2026 21:46:42 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id E2C07B4080F; Mon, 18 May 2026 21:46:40 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 10FC4B40809;
	Mon, 18 May 2026 21:46:40 +0000 (UTC)
Date: Mon, 18 May 2026 23:46:38 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: linux-sunxi@lists.linux.dev, Andre Przywara <andre.przywara@arm.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: allwinner: A133: add support for
 Baijie Helper A133 board
Message-ID: <aguIvpKQM18kX97T@shepard>
References: <20260510201644.4143710-1-alexander.sverdlin@gmail.com>
 <20260510201644.4143710-4-alexander.sverdlin@gmail.com>
 <agr9m_tidBr6Cu2h@collins>
 <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n/6HFoDPod6U7Z7S"
Content-Disposition: inline
In-Reply-To: <04da68168f92b196cce4d49c766fc62702bf6472.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_144649_001535_8F745FF7 
X-CRM114-Status: GOOD (  37.16  )
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


--n/6HFoDPod6U7Z7S
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Alexander,

On Mon 18 May 26, 22:05, Alexander Sverdlin wrote:
> Hi Paul,
>=20
> thanks for the review!
>=20
> On Mon, 2026-05-18 at 13:52 +0200, Paul Kocialkowski wrote:
> >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dts=
i b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
> > > new file mode 100644
> > > index 000000000000..65b094f30bf5
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baije-core.dtsi
>=20
> []
>=20
> > You should add:
> >=20
> > 	chosen {
> > 		stdout-path =3D "serial0:115200n8";
> > 	};
>=20
> I actually have it in .dts, but it's theoretically possible to deploy
> the core board in a way that serial0 is *not* a console, so the above
> probably will not be valid in all cases in .dtsi.

Yes I figured out later that it was in the board dts file and I initially
assumed it was missing entirely.

In practice both options are fine, although the reference software does
hardcode UART0 as debug serial.

> > > +&reg_dcdc2 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt =3D <500000>;
> > > +	regulator-max-microvolt =3D <1300000>;
> >=20
> > Should be:
> > 	regulator-min-microvolt =3D <900000>;
> > 	regulator-max-microvolt =3D <1300000>;
>=20
> 0.81..1.2v according to A133 Datasheet Revision 1.1 Jul.14, 2020?

I guess the initial values are taken from the allwinner-perf1 board dts.

The 900 mV-1.3 V range matches the CPU OPPs (although it really only goes up
to 1.13 V). Maybe down to 810 mV does work, but we don't have an OPP for it.
I think I took these values from the reference BSP for the board.

Also it would be good to add:

	regulator-name =3D "vdd-cpux";

> >=20
> > > +&reg_dcdc4 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt =3D <500000>;
> > > +	regulator-max-microvolt =3D <1300000>;
> > > +	regulator-name =3D "vdd-sys";
> >=20
> > Should be:
> > 	regulator-min-microvolt =3D <810000>;
> > 	regulator-max-microvolt =3D <990000>;
> > 	regulator-name =3D "vcc-usb-sys";
>=20
> I'm a bit puzzled here: datasheet says 0.9..1.0v
> and it has no "Typ" value, similar to VDD_CPU, but
> VDD_SYS is not part of OPP tables, so who is going
> to adjust this? Or shall it be just
>=20
> regulator-min-microvolt =3D <950000>;
> regulator-max-microvolt =3D <950000>;
>=20
> ?

Yes the reference BSP runs it at 950 mV, LGTM.

>=20
> >=20
> > > +};
> > > +
> > > +&reg_dcdc5 {
> > > +	regulator-always-on;
> > > +	regulator-min-microvolt =3D <800000>;
> > > +	regulator-max-microvolt =3D <1840000>;
> > > +	regulator-name =3D "vcc-dram";
> >=20
> > Should be:
> > 	regulator-min-microvolt =3D <1100000>;
> > 	regulator-max-microvolt =3D <1100000>;
> > 	regulator-name =3D "vcc-dram-2";
> >=20
> > ALDO2 is the main DRAM supply, this is the second one.
>=20
> Core schematics mentions 1.1V/1.2/1.35/1.5 on this rail...
> Currently U-Boot has CONFIG_AXP_DCDC5_VOLT=3D1100, but potentially
> this is adjustable, right? At some point LPDDR4 chips they
> are soldering today will be unavailable. And in the current
> market it will happen rather sooner than later...

It is part of the LPDDR4 spec that the main voltage should be 1.8 V and
the second and I/O buffer ones should be 1.1 V. See JESD209-4D Table 180 =
=E2=80=94
Recommended DC Operating Conditions.

Maybe they jsut copied this comment from a reference design that allows for
other types of DRAM too. In any case their BSP hardcodes 1.1 V anyway.

> >=20
> > > +};
> > > +
> > > +/* DCDC6 unused */
> > > +
> > > +&reg_dldo1 {
> > > +	regulator-min-microvolt =3D <700000>;
> > > +	regulator-max-microvolt =3D <3300000>;
> > > +	regulator-enable-ramp-delay =3D <1000>;
> >=20
> > Should be:
> > 	regulator-min-microvolt =3D <1800000>;
> > 	regulator-max-microvolt =3D <1800000>;
> > 	regulator-name =3D "vcc-pg";
>=20
> Do suggest to drop vendor's
>=20
> regulator-enable-ramp-delay =3D <1000>;
>=20
> in all cases?

Well we generally don't have the delays in the axp regulator definitions and
it works well without them, but I guess they don't hurt either.

In practice many drivers will have a delay after a regulator power on anyway
because we generally expect that hardware needs some time to power up,
in addition to the regulator. So all in all it's rarely critical.

>=20
> > >=20
> > > diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.=
dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
> > > new file mode 100644
> > > index 000000000000..ccbca5d0a40c
> > > --- /dev/null
> > > +++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-baijie-helper.dts
>=20
> []
>=20
> > > +	aliases {
> > > +		serial0 =3D &uart0;
> >=20
> > The is best added to the core dtsi.
> >=20
> > > +	};
> > > +
> > > +	chosen {
> > > +		stdout-path =3D "serial0:115200n8";
> >=20
> > Ditto.
>=20
> But it only physically materializes in Helperboard, the carrier.
> Potentially this one can be left floating or used for something else.

Yes fair enough, I'm happy with having it on the helperboard dts file.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--n/6HFoDPod6U7Z7S
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoLiL4ACgkQhP3B6o/u
lQzu7w/+Li3WB/RqyOhBotp67F5Kst4upx8CaFkmpfvnE1C+xCKF8o9JNYivUnIV
+b0k9Gzb2riSG/LSkroml7G684MdWJ13L9Lf0By5T4odFvkrYP8iqJY87NFXgGkk
tiw4gP5MaAJlErtzvisLh9o1XncrxEzWMjeS8Zqf8gp7FDW551PX3QN89KfHI/cF
sL1IEJ01Gc43nlrPyDrbMc+rU+XKnQK/VdbUNtaIQnBHgeBz++Ngi4d6EPwL4ST4
9asVDJiWa5up6319Nwv8BZYzgR2UqURVfKCALQCy21aQWhKlGGIDMPtH15K9ZB+Q
A42Now55/m8Ld6m293eMu9k8aNIdfMaAM3RkwRDRP9rmAhZjQ16XpbwHasgBjTgK
FskGcacWVAdhj3D96HSQ76DDJ64kJhOyPL7GipEyuG+P+rOSLBHICo1bw4plI+lc
CQG72K3bPWQ4TYYVQyTcVFyNKAnRx5J7t6cFNKDXM8/ghf5IXIxRypGoFNfS9hts
ZBt7B1gP2enqtCvuUcgrHKKmgRqKKm7KEWpdULsMkfj4GlcM7330BuWsKUg8h8EM
dO4upS6qp0pR/tfJrfkaB4lJ5HwdEimwXugq0KeFywXzOfv+vTZlVUQBKqin3MWs
Z/vovo0munJJASdEaQRy4bQZOiEI/R+Uo4NzRYiqQJUKobbaVH0=
=/6pF
-----END PGP SIGNATURE-----

--n/6HFoDPod6U7Z7S--

