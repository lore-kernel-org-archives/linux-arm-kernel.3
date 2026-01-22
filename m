Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E10FD3EE84
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:20:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ODV6DWyWwyzHacyT284vh1CWiBZdSB41LmGUHqCHHtc=; b=DY2uH8FRX2IyK76+dJxFg4zx8s
	QMDgcDqAP0Sy+uT3cCQ60C4FKFX8YZpbYvwrbSpr1knJvV9ew4wUMaQ5j2gYxQD2jCVNOghQlS3Kq
	Ja49OA16YDMQSUldI4eMo+fkcHZWErrqUGhuudlUzNShKAY8Is/5HOaswgMsNhQ4jF0/ElK/dBxh2
	XkXdUlFkzUzT3GrBU7mBJh8fSsnuCYLmLRXSiSeQrenX6U4EFdb5kUuEiqteckf8HL3EDBF87bBvE
	m9LEpbJJnesoP+k+Xc6D94XImAP/Hhq3r08O4G6Wzxbk0IgDq2KPpsaLcj7aN149mNQ9KRuiZ20pJ
	G4RQCyzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixPh-00000007Pz4-1num;
	Thu, 22 Jan 2026 16:20:05 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixPd-00000007Pxm-1cYq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 16:20:03 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 94E9B1F80057
	for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Jan 2026 16:19:50 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 13B16B1BB52; Thu, 22 Jan 2026 16:19:48 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 427D3B1BB4D;
	Thu, 22 Jan 2026 16:19:47 +0000 (UTC)
Date: Thu, 22 Jan 2026 17:19:44 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Richard Genoud <richard.genoud@bootlin.com>
Cc: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@baylibre.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	linux-pwm@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/4] Introduce Allwinner H616 PWM controller
Message-ID: <aXJOILxGXv_-f3PE@shepard>
References: <20251217082504.80226-1-richard.genoud@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="cf9nCAdpa1F+/l8I"
Content-Disposition: inline
In-Reply-To: <20251217082504.80226-1-richard.genoud@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_082001_758316_14B81600 
X-CRM114-Status: GOOD (  28.70  )
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


--cf9nCAdpa1F+/l8I
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello Richard,

On Wed 17 Dec 25, 09:25, Richard Genoud wrote:
> Allwinner H616 PWM controller is quite different from the A10 one.

Thanks for your patches!

For context here, the PWM controller in the H616 is an instance of the seco=
nd
generation Allwinner PWM controller, which was first seen in the V5 chip fr=
om
2018.

It is also present in the following SoCs: V5, A50, H616, V536, T7, A133, V8=
33,
R329, D1/T113, R128, V851, A523 and A733.

You probably missed it, but there is already an ongonig series to add suppo=
rt
for that second generation PWM controller from Aleksandr Shubin:
https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D454353&archiv=
e=3Dboth&state=3D*

And a patch was also proposed to add H616 support:
https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D409036&archiv=
e=3Dboth&state=3D*

So you should probably try these series and coordinate with their authors
instead of adding this new driver. I understand it's unfortunate that the w=
ork
was already done on your side.

All the best,

Paul

> It can drive 6 PWM channels, and like for the A10, each channel has a
> bypass that permits to output a clock, bypassing the PWM logic, when
> enabled.
>=20
> But, the channels are paired 2 by 2, sharing a first set of
> MUX/prescaler/gate.
> Then, for each channel, there's another prescaler (that will be bypassed
> if the bypass is enabled for this channel).
>=20
> It looks like that:
>             _____      ______      ________
> OSC24M --->|     |    |      |    |        |
> APB1 ----->| Mux |--->| Gate |--->| /div_m |-----> PWM_clock_src_xy
>            |_____|    |______|    |________|
>                           ________
>                          |        |
>                       +->| /div_k |---> PWM_clock_x
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_x
>                       |   |______|
> PWM_clock_src_xy -----+   ________
>                       |  |        |
>                       +->| /div_k |---> PWM_clock_y
>                       |  |________|
>                       |    ______
>                       |   |      |
>                       +-->| Gate |----> PWM_bypass_clock_y
>                           |______|
>=20
> Where xy can be 0/1, 2/3, 4/5
>=20
> PWM_clock_x/y serve for the PWM purpose.
> PWM_bypass_clock_x/y serve for the clock-provider purpose.
> The common clock framework has been used to manage those clocks.
>=20
> This PWM driver serves as a clock-provider for PWM_bypass_clocks.
> This is needed for example by the embedded AC300 PHY which clock comes
> from PMW5 pin (PB12).
>=20
> This series is based onto v6.19-rc1
>=20
> Changes since v1:
> - rebase onto v6.19-rc1
> - add missing headers
> - remove MODULE_ALIAS (suggested by Krzysztof)
> - use sun4i-pwm binding instead of creating a new one (suggested by Krzys=
ztof)
> - retrieve the parent clocks from the devicetree
> - switch num_parents to unsigned int
>=20
> Richard Genoud (4):
>   dt-bindings: pwm: allwinner: add h616 pwm compatible
>   pwm: sun50i: Add H616 PWM support
>   arm64: dts: allwinner: h616: add PWM controller
>   MAINTAINERS: Add entry on Allwinner H616 PWM driver
>=20
>  .../bindings/pwm/allwinner,sun4i-a10-pwm.yaml |  19 +-
>  MAINTAINERS                                   |   5 +
>  .../arm64/boot/dts/allwinner/sun50i-h616.dtsi |  47 +
>  drivers/pwm/Kconfig                           |  12 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun50i-h616.c                 | 892 ++++++++++++++++++
>  6 files changed, 975 insertions(+), 1 deletion(-)
>  create mode 100644 drivers/pwm/pwm-sun50i-h616.c
>=20
>=20
> base-commit: 8f0b4cce4481fb22653697cced8d0d04027cb1e8
> --=20
> 2.47.3
>=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--cf9nCAdpa1F+/l8I
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmlyTiAACgkQhP3B6o/u
lQwblQ//TuPP2uld56j19mxOPONXVvcqYj35vWi7jaFpTG/5FlLyAkltozy7KB35
EMNLfc1FsB+x4oxoyW7dz2QLl0X78frqioZx95jUiwZrsPW7dBP178sqdXvkqTh5
QHK43gywMn5FShGZtbkVTDKSr0Wp91MU7L63Pg+eCxf9+jknWQuroGGFR7nzl1Dt
Q2ScdsOBmu41MAs2iRCBcuob+6vhH1cf0ymT7M7TsXRmDciwcv3BVdleQWvWYGI6
OA2RHjCUZ2nQdUyaeGsDUtjvHJXbYFBiSmTjkXYGN4yml44WiW0FNxa3CZERZpsL
66an8uc+l1HQNJ4vwd32EGF/ctPaYe6x0VLXu4RQoleu027q9cvsnVJVJwWQoT+f
H3Pr/c0+t/SSZTWsH8FmWoi4BseughzJIinOf+6tlXfCCY6DaNnk29ptztAJPBTv
v4z0olpZw+4liXqSUmxHCgdzc1KYIJxjiKU6kZAX2sy/6F+BR0B+MZ2JkxjhU1WS
kE8HmHUhfRhxBmt6MkkRbGSpUXhyjk/EVhVQBVQabydBH3QZ2rZEFI94z2qQtPaQ
l2qr5a++/fbo1QTn6HArX3+R/UCgJR8DS8qkGFOmvQTYByzgNBL/0JgwDky2PftG
KsCvLqfxfnNE8Jt1oD+xkMf4TlQAum+mdcl8CAJm/gp1i5qySHI=
=4RNE
-----END PGP SIGNATURE-----

--cf9nCAdpa1F+/l8I--

