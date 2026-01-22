Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6758ED3EE89
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 16:43:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jqDl3p7A/X9xhjaNk9c96AZhaKRr5v73J5/tWCBru2Q=; b=JN+jrAyBIKwXu9S03E6zI56q0+
	IgGOpY5vc3YITy179IhHd6l6Rk8Yo+MZ3DCwJWxkMv5xrX7SCAItYIKTLT8XXXOgX9Qj1dm/JzXXf
	phYz/LTEEXGNydp/clUdels7jT5+zhzK20lyZzgqFnJi4sdd5l7CjrFK103W+J0mowJsjKo44U9Z2
	OBxkpDcQd+r3fsPbXDsm9awyjxBclh5qZXTxu2ZMPSSsuIFT2oeQRS18UvTeJFRV3KrFiRHXxXPQa
	vKjIYUYOLdfP3GLb0w546oIN1D+xYkZYw5HiBi6E6JwrQ9uCPIfZIJ3b8Er1kMolR3Zi2KdFHRHRG
	Osmk8Dcw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixmW-00000007SmQ-2fPM;
	Thu, 22 Jan 2026 16:43:40 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vixmT-00000007Slh-3OPt;
	Thu, 22 Jan 2026 16:43:39 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 9BCB41F80057;
	Thu, 22 Jan 2026 16:43:29 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3A346B1BB83; Thu, 22 Jan 2026 16:43:28 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 4E8C9B1BB7B;
	Thu, 22 Jan 2026 16:43:26 +0000 (UTC)
Date: Thu, 22 Jan 2026 17:43:23 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Aleksandr Shubin <privatesub2@gmail.com>
Cc: linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Cheo Fusi <fusibrandon13@gmail.com>, linux-pwm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-riscv@lists.infradead.org
Subject: Re: [PATCH v12 0/3] Add support for Allwinner PWM on D1/T113s/R329
 SoCs
Message-ID: <aXJTqzZaBrCMnTvv@shepard>
References: <20250427142500.151925-1-privatesub2@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8kvUD8u6sGarMbR3"
Content-Disposition: inline
In-Reply-To: <20250427142500.151925-1-privatesub2@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_084338_178735_75EA43B9 
X-CRM114-Status: GOOD (  19.33  )
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


--8kvUD8u6sGarMbR3
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Aleksandr,

On Sun 27 Apr 25, 17:24, Aleksandr Shubin wrote:
> Aleksandr Shubin (3):
>   dt-bindings: pwm: Add binding for Allwinner D1/T113-S3/R329 PWM
>     controller
>   pwm: Add Allwinner's D1/T113-S3/R329 SoCs PWM support
>   riscv: dts: allwinner: d1: Add pwm node
>=20
>  .../bindings/pwm/allwinner,sun20i-pwm.yaml    |  84 ++++
>  .../boot/dts/allwinner/sunxi-d1s-t113.dtsi    |  12 +
>  drivers/pwm/Kconfig                           |  10 +
>  drivers/pwm/Makefile                          |   1 +
>  drivers/pwm/pwm-sun20i.c                      | 379 ++++++++++++++++++
>  5 files changed, 486 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/allwinner,sun20=
i-pwm.yaml
>  create mode 100644 drivers/pwm/pwm-sun20i.c

Thanks for your work on this driver!

For context, this PWM controller seems to be a second-generation design from
Allwinner, which is found in the following chips: V5, A50, H616, V536, T7, =
A133,
V833, R329, D1/T113, R128, V851, A523 and A733.

I've tested your driver on A133, which works fine too. It seems that H616 u=
ses
a similar (but slightly different) register layout.

In case you've missed it, there's a follow-up series adding H616 support at:
https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D409036&archiv=
e=3Dboth&state=3D*

And there's also a standalone effort (which I've redirected to your series)=
 at:
https://patchwork.ozlabs.org/project/linux-pwm/list/?series=3D485644&archiv=
e=3Dboth&state=3D*

Now given that the new controller was introduced with the V5 (sun8iw12) from
2018, I think it would be a bit confusing to keep the sun20i-pwm name.

How about renaming the driver to sun8i-pwm instead? That would be more
consistent with how other second generation designs from Allwinner are usua=
lly
called in Linux and makes it more clear that it also targets sun8i and sun5=
0i
chips, in addition to sun20i.

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--8kvUD8u6sGarMbR3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmlyU6sACgkQhP3B6o/u
lQzLzw/7BSyJlA0VQWydAMnYMSXVRR1nWvDgL2BacWvoFGeQZLvkPIS+bS0Y1oje
CuoZsMChx9onTi+/OKOGwqLUfKtA7nmvp2LLJhelqIKfX1fMRmbXU7BnhoH4jqUc
Tnr0UHIUSXP6rzcY+/4bevCUC+iHKf4jJceuGZTFsHF0LZi8c62oOrXNBMTNia+/
joy6c/9RN5N4RxfbcEfBqmUc0cu88EErW17t8FhALQ6oEftzsNCju3gsOQ4S7lUB
SRH6ffY/o8LqXPZ/kqGDC5ipyFPJyuORXK3xS9zh1xDz+OSvmRh8v2hBsU0V4jxS
99oGXAOXJGljK1415Ush1uRcMKa+YXuF2deG9qJAfEaDq+kRhp2gXdzvN1/0HCgN
rQnyICWywvjX/oznc6j7gt1i+nzKofeXvVyT+Ym/Uk+2K4V2kZmUIGkO9vAgCb7d
KAZNs7Yf79OcoCNZBXAqec7tO2jS0ihWjQ3vSwhzlFa8EcF/nTQJJDgiu3JLPZtQ
Lu2PLgsmNarnKGk9AX8m7EirKdMJduYk5G7oyBxeGXeqNkf9nWf99WqH2cmzDz4o
GhVyfKf2rBfQv9MKU0Qz2CBRXA/rZl21s+kZ9NZEG6RHqGaGTfjOJgRjQo9SS07f
67gd5SFjE8HJPruOtaZrwhBq+ZLF1vGsCwlmvLRJLABl2NY7a8o=
=mx2z
-----END PGP SIGNATURE-----

--8kvUD8u6sGarMbR3--

