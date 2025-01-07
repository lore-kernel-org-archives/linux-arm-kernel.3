Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2042E77197
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jan 2025 12:05:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nHKlEXCvhm7f0iP6MfDX/wykI4eDtiRC1Ijvi6v1xrg=; b=hCSKMpH+lLWs+KsRCP2p9xq02j
	DtgbPg4DeblxZ/MSGJj22OlhnWRoyAmI4aOd/o3uust6UZVTdyiqa+LhZeyQLLb5maggQ1ClD0CJi
	+g+Wxmfm0IyKhhLkwsDSWSIxzCf0/vcmAi10kO07anhGaO5Uh5iNf0dhaQeEAaC9cmZJiSIw3Vndx
	ltcfFZniDoIkZSgst4lOATm2k4AtruuEpkXOIxgqrUEdiwb/GIeOUjuN49UJVdcSEuX9YqyEZScZC
	76aThEji7uKUN97wfVpucnhfsogexs0eNyzsjYdhQNQv/7jXDPUjVEbW/l+bJKK3T/WmglB5MiEyi
	QNpepD6A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Ki-00000004gdS-2MOg;
	Tue, 07 Jan 2025 12:05:16 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tV8Bp-00000004eUa-3Kzq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jan 2025 11:56:10 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 5904E1F00050
	for <linux-arm-kernel@lists.infradead.org>; Tue,  7 Jan 2025 11:56:02 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 58AD0AA1106; Tue,  7 Jan 2025 11:56:01 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 3DEFEAA10EA;
	Tue,  7 Jan 2025 11:56:00 +0000 (UTC)
Date: Tue, 7 Jan 2025 12:55:57 +0100
From: Paul Kocialkowski <paulk@sys-base.io>
To: Maxime Ripard <mripard@kernel.org>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Paul Kocialkowski <contact@paulk.fr>
Subject: Re: [PATCH] pinctrl: sunxi: Use minimal debouncing period as default
Message-ID: <Z30WTaDHQOotVnpl@collins>
References: <20241119140805.3345412-1-paulk@sys-base.io>
 <20241119-prudent-jasmine-lizard-195cef@houat>
 <CACRpkdbcDwJaLmCa_YoP2zFw3fiWn-d1Q773jGh9kcVN8aWQKQ@mail.gmail.com>
 <20241217-impossible-chameleon-of-flowers-8ce18a@houat>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="6zNe2E/v+vJtRG0t"
Content-Disposition: inline
In-Reply-To: <20241217-impossible-chameleon-of-flowers-8ce18a@houat>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250107_035605_991344_CA4A513B 
X-CRM114-Status: GOOD (  27.54  )
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


--6zNe2E/v+vJtRG0t
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

Le Tue 17 Dec 24, 14:58, Maxime Ripard a =C3=A9crit :
> On Tue, Dec 17, 2024 at 02:41:36PM +0100, Linus Walleij wrote:
> > On Tue, Nov 19, 2024 at 3:43=E2=80=AFPM Maxime Ripard <mripard@kernel.o=
rg> wrote:
> >=20
> > > [Paul]
> > > > The pinctrl code supports an input-debounce device-tree property to=
 set
> > > > a specific debouncing period and choose which clock source is most
> > > > relevant. However the property is specified in microseconds, which =
is
> > > > longer than the minimal period achievable from the high-frequency
> > > > oscillator without a pre-scaler.
> > >
> > > That can be fixed by introducing a new property with a ns resolution.
> >=20
> > Perhaps, but I think a setting of 0 should just yield the minimum
> > resolution in this case, as apparently the debounce cannot be
> > turned off? This would also make sense to expose for
> > gpiod_set_debounce() as explained in my other mail.
>=20
> Yeah, if we want to have 0 =3D=3D lowest resolution, I'm all for it.

I agree that it would be easier and less confusing than introducing a new
property just to have a finer resolution.

I could craft a patch in that direction then, with a mention about it in the
bindings.

Cheers,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--6zNe2E/v+vJtRG0t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmd9Fk0ACgkQhP3B6o/u
lQxS1Q//VMjg+Eox4+uMR63N5HnPgzHWc2vTL8Uzc3l++hmb/8euN3yCcb6DDgIn
FvJQNxEsDwg8OidQhBxpxBhgXSgOS8QH4quq5WGEfl7LoJ4aBqC1AwaFvqro/xMt
57HfI2Ep36B5ax3By1b53ihQRwpwMNCPCyptkcbBj2D+cQPDj3mI9zeS6ddFDGNc
faRCy7sflT3nQyNUDkrix/X7uKXQ0bF2zoPCxWO27VpReCe+HNgvIj2wfKVbcB+9
LCOrWxinJ9zMqvdpMpCIOrZIv+fsriEW9O9disdbE8r/dmP6nV3Bd4D+/CVMSCoH
JJzZ6mEfFxetcMMOfQMJv45p/k6bM9LUBH/glAS1C4+ILAlEuE/Xd9+kmpvjdfpk
Nh+trrVZdkkEFFNCq8hKCYUFWTIve0asf0DPJo5odAnXRLRRfMdIc8Rd8ik5tsLy
6B3e+kED2gopiLkeE1XVJm4CNk+IfVbym+h0x6IdytuOdW3vTP2hpqPKgmcUYYtI
9Uj7Bq7ZVCDnySt1JFRBrf8dcxgXdbBrHx/hWoVNACbNiUgd323EDz4ESesotP2h
lSuNg3/TP32r37C56AVmTvgzf8ZbpwiHvdCLbMpx4isHlnP6RkVO/pzR4UJsZ/y1
9obh+6KFDPMRgktyDeBv2LuBsyn1XlhPy6TstPbOy21Vaavr6Tg=
=nOGL
-----END PGP SIGNATURE-----

--6zNe2E/v+vJtRG0t--

