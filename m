Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4E44FC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 17:12:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sb3Ia46GvHWQG/m6KFesc++Cm7iF3bdWTLNCqcNKb+I=; b=HuIjYBMrhfM0cyk0xtWGoUZIBF
	BqLMr90jyki2nccGqi2gi5eekbbOwEzoJSHLDMe7f1ROs8Raj1JgPto4cks20htGt7wzuQpbnUvAd
	yYMwgPy1RWeGe0VVNBbLt8zsqnK1oTaUi2jc0xxM2cnBVEWwGk1q1sC2JPXQa/vmzBgU3VFjYGfbC
	IE5gfGDvw38dpdfUTu6Cb/t7hnQ72UckjmeN+GDXCsZ6jm4b9oDr9gLZo5aBDg1x7B0i53uyz5fxy
	iZkIpC/Mk5cLchx8S3wFekFpAYOtqdRsti+g6US5d60GI99oc1H9TFCKXS1wMJw6rCcUnkj9b34Bn
	kb+bmERA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBrU-000000064SZ-0m0M;
	Tue, 08 Jul 2025 17:12:08 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZBMY-00000005zpB-1weI;
	Tue, 08 Jul 2025 16:40:11 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Type:In-Reply-To:References;
	bh=sb3Ia46GvHWQG/m6KFesc++Cm7iF3bdWTLNCqcNKb+I=;
	b=dksLHObk0QrRNQZmlmL/+dJtNO+pEIS0BjbKjBO4wVwFEL6YF6UOFbfSgNLv6odRG2HoVD+Jku4BAu8HuNmCKlHAzOVEgohL/X3aCL8tDlxlev9/Xup8ohr/rClTZd4PmNHOGyTeD+Zdb46ZsObIcMw/dKHhpRuFS6shPbW4MzQ=
Received: from lukas-hpz440workstation.localnet (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPSA
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256)
	; Tue, 8 Jul 2025 18:39:49 +0200
From: Lukas Schmid <lukas.schmid@netcube.li>
To: wens@csie.org
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>,
 Jernej Skrabec <jernej.skrabec@gmail.com>,
 Samuel Holland <samuel@sholland.org>,
 Paul Walmsley <paul.walmsley@sifive.com>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>, Maxime Ripard <mripard@kernel.org>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
 linux-riscv@lists.infradead.org
Subject: Re: [PATCH v3 2/5] riscv: dts: allwinner: d1s-t113: Add pinctrl's required by
 NetCube Systems Nagami SoM
Date: Tue, 08 Jul 2025 18:39:48 +0200
Message-ID: <2513861.jE0xQCEvom@lukas-hpz440workstation>
In-Reply-To: <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
References: <20250707184420.275991-1-lukas.schmid@netcube.li>
 <20250707184420.275991-3-lukas.schmid@netcube.li>
 <CAGb2v663GHk9jWXMBg36T6Qf8mwbnQcQ80=F+-tpbZ0Bau+79Q@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="nextPart2440550.NG923GbCHz";
 micalg="pgp-sha512"; protocol="application/pgp-signature"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_094010_808986_150EFC99 
X-CRM114-Status: GOOD (  17.51  )
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

--nextPart2440550.NG923GbCHz
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="UTF-8"; protected-headers="v1"
From: Lukas Schmid <lukas.schmid@netcube.li>
To: wens@csie.org
Date: Tue, 08 Jul 2025 18:39:48 +0200
Message-ID: <2513861.jE0xQCEvom@lukas-hpz440workstation>
MIME-Version: 1.0

On Dienstag, 8. Juli 2025 18:36:03 CEST Chen-Yu Tsai wrote:
> On Tue, Jul 8, 2025 at 8:35=E2=80=AFAM Lukas Schmid <lukas.schmid@netcube=
=2Eli> wrote:
> > Added the following pinctrl's used by the NetCube Systems Nagami SoM
> >=20
> >   * i2c2_pins
> >   * i2c3_pins
> >   * i2s1_pins, i2s1_din_pins, i2s1_dout_pins
> >   * spi1_pins
> >=20
> > Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
> > ---
> >=20
> >  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    | 36 +++++++++++++++++++
> >  1 file changed, 36 insertions(+)
> >=20
> > diff --git a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi index
> > e4175adb0..8dc3deccb 100644
> > --- a/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > +++ b/arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi
> > @@ -78,6 +78,36 @@ dsi_4lane_pins: dsi-4lane-pins {
> >=20
> >                                 function =3D "dsi";
> >                        =20
> >                         };
> >=20
> > +                       /omit-if-no-ref/
> > +                       i2c2_pins: i2c2-pins {
> > +                               pins =3D "PD20", "PD21";
> > +                               function =3D "i2c2";
> > +                       };
> > +
> > +                       /omit-if-no-ref/
> > +                       i2c3_pins: i2c3-pins {
> > +                               pins =3D "PG10", "PG11";
> > +                               function =3D "i2c3";
> > +                       };
> > +
> > +                       /omit-if-no-ref/
> > +                       i2s1_pins: i2s1-pins {
> > +                               pins =3D "PG12", "PG13";
> > +                               function =3D "i2s1";
> > +                       };
> > +
> > +                       /omit-if-no-ref/
> > +                       i2s1_din_pins: i2s1-din-pins {
> > +                               pins =3D "PG14";
> > +                               function =3D "i2s1_din";
> > +                       };
> > +
> > +                       /omit-if-no-ref/
> > +                       i2s1_dout_pins: i2s1-dout-pins {
> > +                               pins =3D "PG15";
> > +                               function =3D "i2s1_dout";
> > +                       };
> > +
> >=20
> >                         /omit-if-no-ref/
> >                         lcd_rgb666_pins: lcd-rgb666-pins {
> >                        =20
> >                                 pins =3D "PD0", "PD1", "PD2", "PD3", "P=
D4",
> >                                 "PD5",
> >=20
> > @@ -126,6 +156,12 @@ spi0_pins: spi0-pins {
> >=20
> >                                 function =3D "spi0";
> >                        =20
> >                         };
> >=20
> > +                       /omit-if-no-ref/
> > +                       spi1_pins: spi1-pins {
> > +                               pins =3D "PD10", "PD11", "PD12", "PD13",
> > "PD14", "PD15";
> Could you split out the WP and HOLD pins as separate nodes. They aren't
> strictly needed for SPI, and folks might have designs that use the two
> pins for other purposes.
>=20
Sure. Do you want them as seperate ones, or is "spi1_hold_wp_pins" fine?
>=20
> Thanks
> ChenYu
>=20
> > +                               function =3D "spi1";
> > +                       };
> > +
> >=20
> >                         /omit-if-no-ref/
> >                         uart1_pg6_pins: uart1-pg6-pins {
> >                        =20
> >                                 pins =3D "PG6", "PG7";
> >=20
> > --
> > 2.39.5


--nextPart2440550.NG923GbCHz
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part.
Content-Transfer-Encoding: 7Bit

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEPv6dcBmn59ssZMkSJnN+drMVRtgFAmhtSdQACgkQJnN+drMV
Rtg4KAf9EVLKK7Fj2AIGp+nnuZ4ruR8JzYCN3oLuyUWUifIWvCkBMjPZpW/H0A88
cxYL5e2fNcxc8qNDCEZWuqMLXDMqlfmwnUluIbSNCERK8lhdHu8X+5WE9/3S+FVi
pnfm/gzL6aL07i1NdY/qTbJRa8zp5rFUmKUD+yWYAJBG+rHbnX0znNSvmy7Cwkqh
1cEXCgee3dOHgznWHSNecnGBd1ICGzIo/IlBFQimeBaCwPJN1BJfUoAnU39RQDd1
6PeaoU00Sx8LfCkXeGExjkJmjxNs+cdTVnV8YnR4Gi6rLyVx0QshZMC+Bsd3i/1f
OVNr7M98Z7d1krM+RFY5oqry49Gsrg==
=XHV/
-----END PGP SIGNATURE-----

--nextPart2440550.NG923GbCHz--





