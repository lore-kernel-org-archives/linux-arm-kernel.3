Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C43ED1061B22
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Mar 2026 21:16:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=68gdUMz2g9grlcrDSpgn+dvojozMOX9UEMee9F39uM8=; b=cK7KWe1UXYTzsQ+OcCHa6k0DIu
	MteKLGhgnG/nrxURiLSdrIIenx9ip/0A0TB4N9h4JbZQptGCgt7rCCMKzN66mg+61FrA6uiJwqKlh
	X1dvxHyf0a1rBvYHXrV8iDJgnwdLTlQy//TWuBbcXxzW/i0sEFDrIZ7KG3fUJQFUXQ4qXTlTugz17
	qtdmcHWlniQ1qPgJWjn5BsxHmW80WF2qkl92TPkS9Fw5g/bv3bEpZCYCTVi7BU6dfKHdbW/uuG9f5
	x3chGD8IiKOUdI7THagYGvM9R2uC8WlqNmrCXqqG4JkccpIfUZKZI8u46y0DDwd5CPiHxw2tJr88k
	gnzyyCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JyR-0000000Btzb-0ZpR;
	Mon, 30 Mar 2026 21:16:39 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7JyL-0000000Btyl-3495
	for linux-arm-kernel@lists.infradead.org;
	Mon, 30 Mar 2026 21:16:35 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 02A761F8005C
	for <linux-arm-kernel@lists.infradead.org>; Mon, 30 Mar 2026 21:16:28 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id AE7A3B2EB9B; Mon, 30 Mar 2026 21:16:27 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id B7459B2EB8F;
	Mon, 30 Mar 2026 21:16:24 +0000 (UTC)
Date: Mon, 30 Mar 2026 23:16:22 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Lucas Stach <l.stach@pengutronix.de>
Cc: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Liu Ying <victor.liu@nxp.com>, Maxime Ripard <mripard@kernel.org>,
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
	linux-arm-kernel@lists.infradead.org
Subject: Re: i.MX8MP: Fix HDMI LCDIF FIFO underruns
Message-ID: <acroJiSTReDL_2bB@shepard>
References: <m3ms04caaj.fsf@t19.piap.pl>
 <32317022-3c44-4ead-9e2d-04caa12b28cb@nabladev.com>
 <m36pvjbo4xy2rtdymshjpmwu7icl3wlyiwcmmjaozo7jpe5lqk@zt7byx7iwmym>
 <20260320-amiable-hairy-bullfinch-28bfda@houat>
 <m3a4w2d4ds.fsf@t19.piap.pl>
 <ecd02f87-c4b7-44ed-8ecf-98e0990af34a@nxp.com>
 <m3se9onkv0.fsf@t19.piap.pl>
 <acqgO5b8_1fL9t_U@shepard>
 <0e8863b39cc9cab3ef16aedde480c70a158c4cbe.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="CDf277NznvZQn5xT"
Content-Disposition: inline
In-Reply-To: <0e8863b39cc9cab3ef16aedde480c70a158c4cbe.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260330_141634_166181_DFF22C12 
X-CRM114-Status: GOOD (  49.99  )
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


--CDf277NznvZQn5xT
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

On Mon 30 Mar 26, 18:44, Lucas Stach wrote:
> Am Montag, dem 30.03.2026 um 18:09 +0200 schrieb Paul Kocialkowski:
> > After weeks of investigation I finally narrowed it down to a part of th=
e nxp
> > original code that is missing in the upstream driver:
> > https://github.com/phytec/linux-phytec-imx/blob/v6.6.23-2.0.0-phy/drive=
rs/gpu/imx/lcdifv3/lcdifv3-common.c#L492
> >=20
> Thanks for tracking this down! It was also on my list of things to look
> at.

Glad that it helps :)

> > A big old sleep that waits for the DMA engine to finish handling the cu=
rrent
> > frame before it is disabled. When this delay is not respected, there se=
ems to
> > be "unlucky" times when disabling the DMA engine too early will confuse=
 the
> > unit and make it unable to resume proper operation later.
> >=20
> I think we can be a bit more clever than a indiscriminate sleep. If we
> set the shadow load enable bit in the disable sequence, we should be
> able to wait for this bit to be cleared by the hardware. All the DMA
> parameters (presumably including the enable state) should be applied by
> the hardware when this bit is cleared.

I just tried it out and it works fine, thanks! It polls for a variable delay
=66rom < 1 ms to < 16 ms, which makes perfect sense for a 60 Hz mode.

This is much better than the hardcoded 25 ms. I'll add your Co-developed-by=
 tag
to the final commit.

> I guess the read_poll_timeout in lcdif_disable_controller() was
> supposed to do exactly that wait, but as it was actually copied from
> the mxsfb driver, it's not working as intended. It's my understanding
> that the old lcdif HW only cleared the enable bit once it is actually
> done, but on the lcdifv3 on i.MX8MP those states are double buffered,
> so the bit in the register would be cleared instantaneously, rendering
> the wait in the current code a no-op. The only reliable indicator to
> see if the HW has updated it's internal state is to set the shadow load
> enable bit and wait for it to be cleared.

Sounds right to me. Thanks for the details! Are there resources about the
different generations/families used by nxp/freescale? They seem to be in-ho=
use
designs but with lots of different variations.

> > It is a bit surprising that the issue is not actually related to config=
uring
> > the display engine but to disabling it. This is why the first mode set =
always
> > works but subsequentil ones might fail. The crtc is essentially disable=
d and
> > re-enabled each time a new mode is applied.
> >=20
> > Adding the sleep solves the issue on my side and all mode sets now work
> > reliably. It does add a delay before returning to userspace when config=
uring
> > a new mode, but it seems legitimate to me if the underlying hardware is=
 still
> > in-flight. I'm also unsure if it would apply to an async atomic commit.
> >=20
> This hardware doesn't support async commits. All DMA state changes are
> applied during vblank when the shadow load enable bit is set.

Ah sorry I meant non-blocking atomic commit, not async. Since this is in the
CRTC disable path, it probably makes the userspace process sleep even in the
case of a non-blocking commit (unless this happens in a kernel thread, I'm =
not
sure exactly). But I guess it is legitimate to block until the previous fra=
me
is finished if it is mandatory.

All the best,

Paul

>=20
> Regards,
> Lucas
>=20
> > I will send a patch adding the delay and the undocumented fifo clear
> > bit that was discovered in this thread too.
> >=20
> > All the best,
> >=20
> > Paul
> >=20
> > Perhaps there is a more elegant way to handle this=20
> >=20
> >=20
> > > Interestingly, Weston usually starts fine in subsequent launches.
> > >=20
> > > How is this first (actually second - after the first VSYNC) frame
> > > different from all the others? Maybe we're programming UPDATE_SHADOW
> > > after the actual start of blanking period, but before DE, so it has no
> > > chance to reload registers, yet the DMA is somehow not ready?
> > >=20
> > > The manual (LCDIF display control Register (CTRL)) suggests that the =
DMA
> > > (with present settings) starts to fetch FB data at the end of the
> > > previous active video pixel time (DE and pixel data going inactive):
> > > fetch_start_option (bits 9-8): Indicates when to start fetching for n=
ew
> > > frame. This signals also decide the shadow load, fifo clear time
> > > 00b - fetch start as soon as FPV begins(as the end of the data_enable=
).
> > >=20
> > > This should leave a lot of time to fill the FIFO (before the next DE),
> > > shouldn't it?
> > >=20
> > > 297 MHz pixclk, 3840x2160, 30 Hz, H back porch 296 pixclks, Vfp 176,
> > > V back porch 72 lines, Hfp 8 lines, VSYNC 10 lines, HSYNC 88 pixclks.
> > > HTotal =3D 4400 pixels which makes Vactive time =3D 4400 * 2160/297e6=
 =3D
> > > 32 ms, with the remaining 1.3333 ms for all the V sync stuff.
> > > --=20
> > > Krzysztof "Chris" Ha=C5=82asa
> > >=20
> > > Sie=C4=87 Badawcza =C5=81ukasiewicz
> > > Przemys=C5=82owy Instytut Automatyki i Pomiar=C3=B3w PIAP
> > > Al. Jerozolimskie 202, 02-486 Warszawa
> >=20
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--CDf277NznvZQn5xT
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnK6CYACgkQhP3B6o/u
lQyH5A//V/9yZvIamca2VLwgWSF16F64igms4AaRROuVg2t9+TzNgINKg6rOU77z
A6J9f6O4Wo36zukvA86exdLkrHAiCcgWhk5cAhxujIgvJ0LoeCqi1GgjN53K0PGQ
TN7fzxVBENSA72l+E/Gd8o77dUsUAJHb9fcq/yB6po2OqkK/k5CVxkutugT0CDZa
65w8gaTVdZ8z7XUIwdHKrmCfK5g1KixHBa/GGN3Dm/KO6klvpY8ErTH6WwzftdDr
gtct/x2RKkJrUc2rkYY47MP88b9Mu83Ob9kMn//h87uuaTh29M5demnJJ3p2++3B
EzE+SKR+E3Z289Lab5ricLwhROZ68lDjRaVICqrq6T5Elaf/cTyTkV0sgu3SC9yh
XKKihJFlddsruoUnBQzcZ/uXYlVO/YeBH4pXZtlopAgM+XIcV4zX6iAPRNfoYO6J
4/vArKYosjZAvmQ16S+V17aSvCCTWJcFoqeqlRhjgenZn8EVGU8l/JLubf4vNSTN
6IskqUahUGrXoZ/sfcrGaJVe3d63b4SoUGDaWXWF30XAFsuRw2RUkujF2+SdFhLQ
6RC/WNLF7DD93bcOgVyybP+gqa3ea8neNq2/lTNG36oQ9AIen2C5dPyxUzOVavJH
3gfTbgw4AYg6KgXKLY1U3DnNxebD99sXsso8y95FDyZ/yDd5JqU=
=/b6w
-----END PGP SIGNATURE-----

--CDf277NznvZQn5xT--

