Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5595FF60F0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 15:18:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YKPDyHEuL6bh2ruQLk25OvZMRBgR26W2PRgnkZLvzBs=; b=b6QHPI6eBBqRc4yKWgljBAJoTf
	sI5NeE0EdtoCL72R92HdntbUWD/1FWRA7EIdw0ro54AOgwctnRm0h2Fb0urrTrbfAFy7qPZfJn0cs
	gAKthYnUaMkDh1nn6fZv6+KUAIgAz1R67bHh5VidxiDJNc9D7qBATME9+fNhNfonklUD5lUDwqmRd
	UGrN67mW9n6rdcgLnTltLgeEqpCD7gFEOM+Az+F5ne4YDIXLPM1y2EvfoCuzRLl7P8y3arJ/7s3ae
	CbY9C0DzdCPi/zJrlyyn/VaYjDj2vd5K4genoP9QRS11es1xIRHkzSYDUbL/C15TVDGtI4l9jBMro
	myBPylNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aqs-0000000DA9o-0ff3;
	Tue, 31 Mar 2026 15:17:58 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7aqo-0000000DA7h-3gXz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 15:17:56 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 04D621F8005E
	for <linux-arm-kernel@lists.infradead.org>; Tue, 31 Mar 2026 15:17:46 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 2E241B2EFD3; Tue, 31 Mar 2026 15:17:45 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 41E46B2EFC8;
	Tue, 31 Mar 2026 15:17:43 +0000 (UTC)
Date: Tue, 31 Mar 2026 17:17:41 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Lucas Stach <l.stach@pengutronix.de>
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
	Krzysztof =?utf-8?Q?Ha=C5=82asa?= <khalasa@piap.pl>,
	Marco Felsch <m.felsch@pengutronix.de>,
	Liu Ying <victor.liu@nxp.com>
Subject: Re: [PATCH 2/3] drm: lcdif: Use dedicated set/clr registers for
 polarity/edge
Message-ID: <acvllbRTHyVFTgmS@collins>
References: <20260330224619.2620782-1-paulk@sys-base.io>
 <20260330224619.2620782-3-paulk@sys-base.io>
 <f5b628f50def756da356184ff6febb11cc9aaa68.camel@pengutronix.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="/Y3a12dyBXGbAn3r"
Content-Disposition: inline
In-Reply-To: <f5b628f50def756da356184ff6febb11cc9aaa68.camel@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_081755_246595_1F11F05E 
X-CRM114-Status: GOOD (  33.26  )
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


--/Y3a12dyBXGbAn3r
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Lucas,

Le Tue 31 Mar 26, 11:09, Lucas Stach a =C3=A9crit :
> Hi Paul,
>=20
> Am Dienstag, dem 31.03.2026 um 00:46 +0200 schrieb Paul Kocialkowski:
> > The lcdif v3 hardware comes with dedicated registers to set and clear
> > polarity bits in the CTRL register. It is unclear if there is a
> > difference with writing to the CTRL register directly.
> >=20
> > Follow the NXP BSP reference by using these registers, in case there is
> > a subtle difference caused by using them.
> >=20
> I don't really like that patch, as it blows up what is currently a
> single register access to three separate ones. If there is no clear
> benefit (as in it has been shown to fix any issue), I would prefer this
> code to stay as-is.

Well I guess the cost of a few writes vs a single one is rather
negligible. I'm rather worried that there might be an undocumented
reason why these registers exist in the first place and why they are
used in the BSP.

But yes this is only speculation and I could not witness any actual
issue. My setup (lcdif3 with hdmi) uses all positive polarities which is
the default state, so not a good way to check.

It would be great if somebody from NXP could confirm whether this is
needed or not. In the meantime I guess we can drop the patch. It'll stay
on the list in case someone has polarity issues later :)

All the best,

Paul

> Regards,
> Lucas
>=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> >  drivers/gpu/drm/mxsfb/lcdif_kms.c | 23 ++++++++++++++++-------
> >  1 file changed, 16 insertions(+), 7 deletions(-)
> >=20
> > diff --git a/drivers/gpu/drm/mxsfb/lcdif_kms.c b/drivers/gpu/drm/mxsfb/=
lcdif_kms.c
> > index a00c4f6d63f4..1aac354041c7 100644
> > --- a/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > +++ b/drivers/gpu/drm/mxsfb/lcdif_kms.c
> > @@ -296,18 +296,27 @@ static void lcdif_set_formats(struct lcdif_drm_pr=
ivate *lcdif,
> >  static void lcdif_set_mode(struct lcdif_drm_private *lcdif, u32 bus_fl=
ags)
> >  {
> >  	struct drm_display_mode *m =3D &lcdif->crtc.state->adjusted_mode;
> > -	u32 ctrl =3D 0;
> > +	u32 ctrl;
> > =20
> >  	if (m->flags & DRM_MODE_FLAG_NHSYNC)
> > -		ctrl |=3D CTRL_INV_HS;
> > +		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_SET);
> > +	else
> > +		writel(CTRL_INV_HS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> > +
> >  	if (m->flags & DRM_MODE_FLAG_NVSYNC)
> > -		ctrl |=3D CTRL_INV_VS;
> > +		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_SET);
> > +	else
> > +		writel(CTRL_INV_VS, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> > +
> >  	if (bus_flags & DRM_BUS_FLAG_DE_LOW)
> > -		ctrl |=3D CTRL_INV_DE;
> > -	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> > -		ctrl |=3D CTRL_INV_PXCK;
> > +		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_SET);
> > +	else
> > +		writel(CTRL_INV_DE, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> > =20
> > -	writel(ctrl, lcdif->base + LCDC_V8_CTRL);
> > +	if (bus_flags & DRM_BUS_FLAG_PIXDATA_DRIVE_NEGEDGE)
> > +		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_SET);
> > +	else
> > +		writel(CTRL_INV_PXCK, lcdif->base + LCDC_V8_CTRL + REG_CLR);
> > =20
> >  	writel(DISP_SIZE_DELTA_Y(m->vdisplay) |
> >  	       DISP_SIZE_DELTA_X(m->hdisplay),
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--/Y3a12dyBXGbAn3r
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnL5ZQACgkQhP3B6o/u
lQxgrw//a0o+aXG0xYeofhRxty58+PDTHipKdthiX6kA1F3s9h+oFSlsP7xo65CW
Bf+q9KrUXxRmSwKbVLNwNv2rD2QgBso6MboJh1tZxgu5zfyMPe06Y2a4Dv8TLBV8
4tKTxd8qKZ/dv3lUzkXHRilotZfDr2rktpmrI5f3Ur4bqNBWUTUyslGeE1E0jn0a
dRDw1gbXp3AunYTca1Nuc+VN/EfvcACOra4dtzlnY5woQTOrQ8Po6GUmy3gTY/vd
P+hEzKrIDbUG9WKym/b+eHoT/2LM1+g0QiWc2Y7mWTYnMeXwEkdPL7H0mCqeionu
hegWBbQHvSljPBj/mZiWkHlu+ZPq4V6XsZsBEXztZ9oqVHRH3/8/6/HlBxVszgZc
Fg3zeMvhgd8arvlz/c23BgoYjYkIIjRDluUFan/+t2hzNKBgUVDfOivdmuRsnaPg
nejYqNEocGX/kkn8rXNg1P723L4Hwvrn9ClmTlN+ilTTpEHtIRrFnbMYJnC49bdh
42BeP2Ne2z56Ly8r6f/uoCYKj0kQTUk+pNjGYLnE+V5sBk9TmiZVif75WTlDiqPp
r2zFGQnbINtq3KVIe13i+yrxTVTBe5bUVtGc4qjCnQjIBDUYXXiJa599Dx78pagB
JqdGrYggUEwWL+6Sq3YVDInit8khsTwHuoypi3/HcuRF49RMDMw=
=YlyP
-----END PGP SIGNATURE-----

--/Y3a12dyBXGbAn3r--

