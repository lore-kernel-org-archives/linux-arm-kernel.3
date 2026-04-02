Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90850D6AAE9
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Apr 2026 16:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mlba9zC+fU66rw56b6RFKQtSCojB8zTtDcm7/kpWvW0=; b=iI0jnQ+/po+Zs1PVyd1cAnq4rT
	hW2+X3XLvHfijC8ByF1esX2luuIoac1yp5P3LQrim5G+l+OMuVtKcBV9c5XzOsikMCAv4IargEP28
	sz+RlQPRXTPDNJl115e6npqyBSPq7eZwEs50aQNiEAQ19NbtW6mHNJ678VwbRb+H87PkoeZLtrG1x
	zEdrukGRcI8aIFcWyp3GG8okT1eXyPfbTARf9DqXDPu8r95BlmwaDssvfQvn7xlY4NVkGy2QS8CXV
	ETzqe4exEjwAa4sO9zdxYOY2sbv9+HlJtgfKcuqjKPXjZPr4oWPiNZVpB1pb2Sq/sq5NVR+jg53mI
	czyGjpqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kf7-00000000Urw-05PJ;
	Thu, 02 Apr 2026 16:12:53 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8Kf4-00000000UrV-1w2P
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Apr 2026 16:12:52 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 38C661F8004D
	for <linux-arm-kernel@lists.infradead.org>; Thu,  2 Apr 2026 16:12:48 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 7D6ACB40120; Thu,  2 Apr 2026 16:12:47 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id ABBCDB40114;
	Thu,  2 Apr 2026 16:12:46 +0000 (UTC)
Date: Thu, 2 Apr 2026 18:12:44 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Yannic Moog <Y.Moog@phytec.de>
Cc: "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
	"imx@lists.linux.dev" <imx@lists.linux.dev>,
	"linux-arm-kernel@lists.infradead.org" <linux-arm-kernel@lists.infradead.org>,
	"linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>
Subject: Re: [PATCH] arm64: dts: imx8mp-phyboard-pollux: Add HDMI support
Message-ID: <ac6VfJCKMZghi8My@shepard>
References: <20260330223712.2615273-1-paulk@sys-base.io>
 <573e4ebd9679517086a6b4acb162d72463429f35.camel@phytec.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1hlZwKtrqdPSeKCX"
Content-Disposition: inline
In-Reply-To: <573e4ebd9679517086a6b4acb162d72463429f35.camel@phytec.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260402_091250_861302_4D938A95 
X-CRM114-Status: GOOD (  25.74  )
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


--1hlZwKtrqdPSeKCX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Yannic,

On Wed 01 Apr 26, 12:06, Yannic Moog wrote:
> On Tue, 2026-03-31 at 00:37 +0200, Paul Kocialkowski wrote:
> > The PHYTEC phyBOARD Pollux comes with a HDMI port on the base board.
> > Add the required device-tree nodes to enable support for it.
>=20
> "Only" video is supported, but it does work. You could add that to the de=
scription since audio is
> also supported upstream and part of HDMI.

You're right, I didn't think about the audio part.
I'll add it in the next iteration.

All the best,

Paul
=20
> Yannic
>=20
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
>=20
> Reviewed-by: Yannic Moog <y.moog@phytec.de>
> Tested-by: Yannic Moog <y.moog@phytec.de>
>=20
> > ---
> > =C2=A0.../freescale/imx8mp-phyboard-pollux-rdk.dts=C2=A0 | 47 +++++++++=
++++++++++
> > =C2=A01 file changed, 47 insertions(+)
> >=20
> > diff --git a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.d=
ts
> > b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> > index 0fe52c73fc8f..0d52f29813f1 100644
> > --- a/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> > +++ b/arch/arm64/boot/dts/freescale/imx8mp-phyboard-pollux-rdk.dts
> > @@ -38,6 +38,18 @@ fan0: fan {
> > =C2=A0		#cooling-cells =3D <2>;
> > =C2=A0	};
> > =C2=A0
> > +	hdmi-connector {
> > +		compatible =3D "hdmi-connector";
> > +		label =3D "hdmi";
> > +		type =3D "a";
> > +
> > +		port {
> > +			hdmi_connector_in: endpoint {
> > +				remote-endpoint =3D <&hdmi_tx_out>;
> > +			};
> > +		};
> > +	};
> > +
> > =C2=A0	panel_lvds1: panel-lvds1 {
> > =C2=A0		/* compatible panel in overlay */
> > =C2=A0		backlight =3D <&backlight_lvds1>;
> > @@ -201,6 +213,28 @@ &flexcan2 {
> > =C2=A0	status =3D "okay";
> > =C2=A0};
> > =C2=A0
> > +&hdmi_pvi {
> > +	status =3D "okay";
> > +};
> > +
> > +&hdmi_tx {
> > +	pinctrl-names =3D "default";
> > +	pinctrl-0 =3D <&pinctrl_hdmi>;
> > +	status =3D "okay";
> > +
> > +	ports {
> > +		port@1 {
> > +			hdmi_tx_out: endpoint {
> > +				remote-endpoint =3D <&hdmi_connector_in>;
> > +			};
> > +		};
> > +	};
> > +};
> > +
> > +&hdmi_tx_phy {
> > +	status =3D "okay";
> > +};
> > +
> > =C2=A0&i2c2 {
> > =C2=A0	clock-frequency =3D <400000>;
> > =C2=A0	pinctrl-names =3D "default", "gpio";
> > @@ -244,6 +278,10 @@ &i2c3 {
> > =C2=A0	scl-gpios =3D <&gpio5 19 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
> > =C2=A0};
> > =C2=A0
> > +&lcdif3 {
> > +	status =3D "okay";
> > +};
> > +
> > =C2=A0&ldb_lvds_ch1 {
> > =C2=A0	remote-endpoint =3D <&panel1_in>;
> > =C2=A0};
> > @@ -444,6 +482,15 @@ MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21	0x154
> > =C2=A0		>;
> > =C2=A0	};
> > =C2=A0
> > +	pinctrl_hdmi: hdmigrp {
> > +		fsl,pins =3D <
> > +			MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL			0x1c3
> > +			MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA			0x1c3
> > +			MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD				0
> > x19
> > +			MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC				0
> > x19
> > +		>;
> > +	};
> > +
> > =C2=A0	pinctrl_i2c2: i2c2grp {
> > =C2=A0		fsl,pins =3D <
> > =C2=A0			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL		0x400001c2

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--1hlZwKtrqdPSeKCX
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnOlXwACgkQhP3B6o/u
lQykoBAAkQMdwVAx4iApkjsn7iiLIKHgM8rSRnLI9+6JuBEa1OG3dQLatwrrlUMq
xVCg0QnKlPG9nfAa8a+Lvu8AjvgkhWtH3hFWM2+Z+r4lEvn/zDlVYXnkhRmBD5q0
1Ce02KsovrQf3wQOZHDz59NqDo4Fl4XBTYy0BL/fch1FcxvHJS7u81C7hkk2jvbD
nkYb2HKtHb8vn+RUhJnuTIiRZlKuAi0K55Yll83ZiMjZ8rcgA3kLXjplcbv8TJek
CafJy0FowM7L1Op0PuctMc7UJVtzqo2NXYHNfTUrwEOu+0WI72zncRLJ3TcsMRYK
6Dq+mjJeh8pRRn7hW+tEHv3dqXYi+TzzLVKLNXTxDChGzuH/tSjuFVuJHZfEB7t8
PfNp3lGbjKJVDhoU65269u3pkhQx5lh649tC6OYZZQSuVYvj37bH6b6JopP6gwGX
8ELTqVxatgwKJ/oZ7U6pgvTzHAkXBzSZQKoOpw0ImRaT+WJO2hHk0WbkqUCltqcJ
XGAUkyaQwhnD6SC82jCrO3M4fjdx5VVvlFy62kOJx70V43Azh1oL3RgTIeP34hN6
TPF/xTXmnnf8vLJLTYMjJCfP/HvXkLmN5gJJJnL5Sj1xWlybN9Xr1nayj4LHOqcR
bqrhfWvNUH8rG2lqbRB0qgcvX6f6+aYxq3K5wyyW3VL+Fhgx92A=
=1jgm
-----END PGP SIGNATURE-----

--1hlZwKtrqdPSeKCX--

