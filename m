Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3BCF2E63FEA
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  4 Apr 2026 19:29:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F/ghfc/NPBSszU8XBN4ZLJm7UF3dMBAcxqdNzq+qaKQ=; b=KaOI+/a8hC6cN3SCn8eqBvnx0T
	UXAjKpvO45nNhyVJ05IMv4aEhDNu+tUCUx4id4S0Jq6g86z6TKMBAPQbhSNg2ncEj6o7LQZxBwdmT
	oSUVTOZIyku7j85MZLcU05HVTRSv/RvsMrvbcY2cYlTm/91hBTUTcfayHx/E4JToUVaabX70RUYAp
	GMyMcwA+f25mIvGXzowpO5bx4dAk0q14wpz/cvUvzsRXjBLdHC77zdcnCkQp1dMFzEzMq88v5KCuE
	E/DnKM3/BZtLT+ukhIak35SX8DgSK47k568eodIlIBv5c6RZm9aChhZqiwH/RTY8YlnTQ1c/KDpMQ
	DmcTYRRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w96gT-00000003hYP-0P3p;
	Sat, 04 Apr 2026 19:29:29 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w96gP-00000003hY0-2cH1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 04 Apr 2026 19:29:27 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 317261F8005E
	for <linux-arm-kernel@lists.infradead.org>; Sat,  4 Apr 2026 19:29:14 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 398ADB4016C; Sat,  4 Apr 2026 19:29:12 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 2D54EB40164;
	Sat,  4 Apr 2026 19:29:10 +0000 (UTC)
Date: Sat, 4 Apr 2026 21:29:08 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>
Cc: dri-devel@lists.freedesktop.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Marek Vasut <marex@denx.de>, Stefan Agner <stefan@agner.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 3/3] drm: lcdif: Wait for vblank before disabling DMA
Message-ID: <adFmhAZV_xKJDkOa@collins>
References: <20260330224619.2620782-1-paulk@sys-base.io>
 <20260330224619.2620782-4-paulk@sys-base.io>
 <m3y0j8mhoz.fsf@t19.piap.pl>
 <ac6eQcDS8lr-A4ia@shepard>
 <m3ldf4mzh4.fsf@t19.piap.pl>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sKLsLzeB6fFRB6Dl"
Content-Disposition: inline
In-Reply-To: <m3ldf4mzh4.fsf@t19.piap.pl>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260404_122926_153262_C6F86BE8 
X-CRM114-Status: GOOD (  32.82  )
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


--sKLsLzeB6fFRB6Dl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Krzysztof,

Le Fri 03 Apr 26, 06:36, Krzysztof Ha=C5=82asa a =C3=A9crit :
> Paul Kocialkowski <paulk@sys-base.io> writes:
> > Interestingly I tried to keep the clocks always on as an experiment and=
 it
> > had the opposite effect: the DMA engine would get confused every time a=
fter the
> > first mode set and disable. So for some reason the disabling of the clo=
cks seems
> > to mitigate the issue rather than aggravate it.
>=20
> Interesting. Fortunately we have a workaround.
>=20
> >> > +       ret =3D readl_poll_timeout(lcdif->base + LCDC_V8_CTRLDESCL0_=
5,
> >> > +                                reg, !(reg & CTRLDESCL0_5_SHADOW_LO=
AD_EN),
> >> > +                                0, 36000);     /* Wait ~2 frame tim=
es max */
> >>=20
> >> I guess this comment is not necessarily correct - at 2160p30 one frame=
 =3D
> >> ca. 33 ms. Still works, though (I guess anything more than one frame is
> >> enough). I don't know how long a frame on HDMI (or LVDS, MIPI etc.) can
> >> take. 30 FPS on 2160p is common because the i.MX8MP can't display 2160=
p60.
> >
> > Honestly I think we're good assuming 30 fps (33 ms) is a lower bound.
> > And the current 36 ms goes even beyond, so I think it's fine.
>=20
> Right. It is just the comment in the code which is not exactly true.
> I.e., we "wait for at least 1 complete frame time". I guess.
> Also, the 25 ms in the patch (commit) message is no longer accurate.

In the end I made it 50 ms, which should be fine for all modes, and
adapted the comment in v2.

> >> Also, found an issue. Perhaps unrelated? Powered the board without HDMI
> >> connected. Then connected 1080p60 display. It came in 1024x768, console
> >> 64x24 :-)
> >
> > That looks more related to a failure to fetch the EDID from the monitor.
> > 1024x768 is the default fallback that is used in this situation.
> > Maybe check if there is something wrong with the DDC lines from the hdmi
> > controller, maybe pinmux etc.
>=20
> No no no, I did that on purpose - the monitor was really disconnected at
> the boot time. Only then (but before starting weston) i reconnected it.
> But it indeed appears to be a separate issue, a software one - a mutex
> deadlock on access to clocks and power management. Both enable and
> disable paths interfere there. "I will post a patch when I have a patch
> to post" :-)

Okay good to know, I'll get back to you if I also see this in the future :)

All the best,

Paul

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--sKLsLzeB6fFRB6Dl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnRZoQACgkQhP3B6o/u
lQxm2Q/+LyHFI4D4iKgWRZIMkU6AgHeYB6Qu4I3Fi7P/RzXPYgtpxPLHgNnTMUaq
NMulcifqeIPQnqufj1pkBFyDZ5cDtw4LW45+Oedj6BDZDYMV0ERcB+5VJtDqfU2r
Y44Cc2+Aw78YB2XsRtwVpO5eUvoqID+YOkk2ZFifvcDHmiXKZ7Z48+HIXkkmhBA5
/yyfFjE90Vl+Wjkc5KnlbcWgXx8PCXJxBOpXOsvFeUI4fh0XIv51pVq4uQ7W2qVQ
z8NkvrxGvrYQ0yy4Vg9iXEF3JOD0R+MUIKwCWnjhnoupn7l8JwYjOYgetgNztgUy
r9tJ4Jw5XEIn74cObKHzFPg7bpVUg+15/RLEZx2+BjVrBSqJoMOGOCE+PQktzlhi
72QMfGQ4XBqW79HGeGLWFhKgsd5Lr17jRTqfdIkyJnij3Br4UzJxMuQsWV/ALfmf
fAjAgvHYkzOLTYlivCsXxZIRp/66I8M7+XZrzm5Of6+nOsePupQTl5556A0Y8bZk
uaifCFKjUgBjXTsMDYdfhw8SYqfGd24TiY7pJhuQStDPjy4AmyQqgmRGHyAxDU/7
cW1rg3Z9sgSGPGruUvC+GmYqOzxLo4c7gqKbFjcOh1FNmuIkBqlK7ct4JZvXNb6X
Fq9Ta6J6nBnsDzuxSbKuxXCqrZvGYSGCiTwiRwDAFHvWKWpU8P4=
=/NwV
-----END PGP SIGNATURE-----

--sKLsLzeB6fFRB6Dl--

