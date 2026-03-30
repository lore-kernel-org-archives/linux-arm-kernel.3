Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDA171061B13
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 16:09:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DYQ9wjqSdht1392dW4oQAD2+eULrFKr44hzGOCtVMiI=; b=UCjTt5E/qf7Qg7Gcei16o3wZS9
	njAg/D8bEgT7oyn42Pd17bf4zB181y7L/1e2AgZ1L26NQa6qsbiPcZMrT2YF7fZeZlcf6RJT7+IFt
	PmvVi9ogRsi3AGf+56C2Mqh9AF2LwK8Ok4V8Dopw4Sctbdzmq8zvcuLOtc3cvAbnKyCzWtEeSTI0N
	R9tqTHbAbHanQZMM1ia5S+q+fLJOxWgj7RNZwmomw1E9SfwLZkIxPOPedeZMUS7oja+duILoTNwgu
	+Lh5ufK0CaLeVc4fdTWzegrzufgUE4QKox62faQzyAeVGvnUpc0c3gb0bJY4CtM3FeyyaY8q+kRqs
	Z+s4LPgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FBY-0000000BcMk-3ruS;
	Mon, 30 Mar 2026 16:09:52 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7FBV-0000000BcMK-06M2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 16:09:51 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id E66F21F8005C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 16:09:38 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 231D3B2EA49; Mon, 30 Mar 2026 16:09:36 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 4AAEAB2EA3F;
	Mon, 30 Mar 2026 16:09:33 +0000 (UTC)
Date: Mon, 30 Mar 2026 18:09:31 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: Liu Ying <victor.liu@nxp.com>, Maxime Ripard <mripard@kernel.org>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Marek Vasut <marex@nabladev.com>, Stefan Agner <stefan@agner.ch>,
	Simona Vetter <simona@ffwll.ch>, imx@lists.linux.dev,
	Fabio Estevam <festevam@gmail.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Sascha Hauer <s.hauer@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	Lucas Stach <l.stach@pengutronix.de>
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
Message-ID: <acqgO5b8_1fL9t_U@shepard>
References: <m3ms04caaj.fsf@t19.piap.pl>
 <32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
 <m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
 <20260320-amiable-hairy-bullfinch-28bfda@houat>
 <m3a4w2d4ds.fsf@t19.piap.pl>
 <ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com>
 <m3se9onkv0.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Jn217E1wIDKakohc"
Content-Disposition: inline
In-Reply-To: <m3se9onkv0.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_090949_508447_64460E87 
X-CRM114-Status: GOOD (  27.52  )
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


--Jn217E1wIDKakohc
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi folks,

On Wed 25 Mar 26, 13:40, Krzysztof Ha=C5=82asa wrote:
> Why did the first (boot) sequence result in success and this second one
> in failure? This is somehow reproducible.

I've been seeing the same issue that is described in this thread when drivi=
ng
a regular 1080p@60 monitor, which shows a solid color background with a pix=
el
=66rom the previous frame when reconfiguring the mode from time to time.

When that happens, I see the lcdif fifo underrun/empty status until a new m=
ode
is applied, which often resolves the situation. This situation never happens
with the downstream nxp bsp driver.

After weeks of investigation I finally narrowed it down to a part of the nxp
original code that is missing in the upstream driver:
https://github.com/phytec/linux-phytec-imx/blob/v6.6.23-2.0.0-phy/drivers/g=
pu/imx/lcdifv3/lcdifv3-common.c#L492

A big old sleep that waits for the DMA engine to finish handling the current
frame before it is disabled. When this delay is not respected, there seems =
to
be "unlucky" times when disabling the DMA engine too early will confuse the
unit and make it unable to resume proper operation later.

It is a bit surprising that the issue is not actually related to configuring
the display engine but to disabling it. This is why the first mode set alwa=
ys
works but subsequentil ones might fail. The crtc is essentially disabled and
re-enabled each time a new mode is applied.

Adding the sleep solves the issue on my side and all mode sets now work
reliably. It does add a delay before returning to userspace when configuring
a new mode, but it seems legitimate to me if the underlying hardware is sti=
ll
in-flight. I'm also unsure if it would apply to an async atomic commit.

I will send a patch adding the delay and the undocumented fifo clear
bit that was discovered in this thread too.

All the best,

Paul

Perhaps there is a more elegant way to handle this=20


> Interestingly, Weston usually starts fine in subsequent launches.
>=20
> How is this first (actually second - after the first VSYNC) frame
> different from all the others? Maybe we're programming UPDATE_SHADOW
> after the actual start of blanking period, but before DE, so it has no
> chance to reload registers, yet the DMA is somehow not ready?
>=20
> The manual (LCDIF display control Register (CTRL)) suggests that the DMA
> (with present settings) starts to fetch FB data at the end of the
> previous active video pixel time (DE and pixel data going inactive):
> fetch_start_option (bits 9-8): Indicates when to start fetching for new
> frame. This signals also decide the shadow load, fifo clear time
> 00b - fetch start as soon as FPV begins(as the end of the data_enable).
>=20
> This should leave a lot of time to fill the FIFO (before the next DE),
> shouldn't it?
>=20
> 297 MHz pixclk, 3840x2160, 30 Hz, H back porch 296 pixclks, Vfp 176,
> V back porch 72 lines, Hfp 8 lines, VSYNC 10 lines, HSYNC 88 pixclks.
> HTotal =3D 4400 pixels which makes Vactive time =3D 4400 * 2160/297e6 =3D
> 32 ms, with the remaining 1.3333 ms for all the V sync stuff.
> --=20
> Krzysztof "Chris" Ha=C5=82asa
>=20
> Sie=C4=87 Badawcza =C5=81ukasiewicz
> Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> Al. Jerozolimskie 202, 02-486 Warszawa

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--Jn217E1wIDKakohc
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnKoDsACgkQhP3B6o/u
lQyx4Q//VSSRsJUGm5WCV7YPfDUG0xf7mOtp4abi14Aex6rUK3pqhg5tQhgPH2+B
5G/OHVQ9/c8JyD+DInPLpF+4Om0Dh29RYG0MPVpjZoCDMUXUKQ0IjX4kc+ALeU0Z
zNazd3fX+X5oLLZJWODeXWWEt3aMDQ9YOGVVaNVGEHD/b89BGwqPQiO9MPC4IttA
VJfX8vaYI0k1ZHgQ5fsj1fny7DXk4wsPVMPEkwZSl5Mq/777aNAMTI0uGq4hvx4c
Wm2QiF9j9CZnvy8hhc1LPkq5VItvMnKY6bMt9IJO2pRD2+hXdBC5zA94B9SLRyWi
CmcfqfEVNUGytlIRa0bfR7/CnpQtBnMR6SwP2sJ61TAYt5qo3yS28w1yhUoAr+GQ
zXWKLJ+CcNIO2PMUNi6xRNQyXdfLGxra8kHAKWuMUocmPuG49TXfuRGRjamC4iOV
7TnwrSlqcIycrKrPl3zFWrJ4dcmL2iWyzMbwociHkwsAGKfDySOzGsvf0wdxHUSu
OrvzrwXOqysrquDlaePDw3H4Sz3piJq1bigGcA6hia6yvn3S4MXOn7kS6hGwmyX5
dAYL/eovcdJmskL0QywMqW643Te+8lc+/iZoJBytRjnKk4oA4CATIRvA25fQGM/J
BXUFUn0PAqrg7GwVbKn6/9thlUfuwnqGZ7czriJiZ9z0MKVU4is=
=Hjtk
-----END PGP SIGNATURE-----

--Jn217E1wIDKakohc--

