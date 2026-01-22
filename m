Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E06CD3EE6C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:49:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=j08CZYreWkoiN+l1Th5hMC9vcpfI9DQRPaNd9bd6GEg=; b=Vw+Qe2OomQuIKtAcbPE6+Ows6G
	Ew6pAuMJ420ZutaAjlbkPojJZDpvikK75BhJNNrp+Iiwhdl/iW//UbXMkHEpLmB21pPVQ9IajxzSD
	PJopmAMEq/RaaVIFOKRLe4ghf9vzffhnwQmtP2DYFMO0gMqqq34BR62RAkMDlNQW3W8GbqfzjQIyW
	ylqXEy5QhZg2tMLGa+uk+Ji8P756+FYjykbnWUV3sKfp+8KnTnmQbiX8SqHmpTIr3QK3Jetg1xewr
	vNaR7WkVo9tH+21Cllx66yVM/9jcrjdsLQVaA5TeSeATwyd5rmy9uM5NPDJCsJGbFnGmGvV2JhbZn
	4EMGdXcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivzX-00000007GHI-02O8;
	Thu, 22 Jan 2026 14:48:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivzT-00000007GGt-0hgs
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:48:57 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id A2132C21AA4;
	Thu, 22 Jan 2026 14:48:49 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id AFB01606B6;
	Thu, 22 Jan 2026 14:48:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 4717D119B80D3;
	Thu, 22 Jan 2026 15:48:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769093328; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=j08CZYreWkoiN+l1Th5hMC9vcpfI9DQRPaNd9bd6GEg=;
	b=n6CtIly1fP5j1hMNuel0x4IJ8soH2Y27mG0LvBri9txYrMg8cZER1vYfcL9yJtxNrKMBg+
	rhXDMCJe+gffQTTjPsRnAH7GqnCpy+BTRhK4TmLM0H+MioItDgnC/qM8EWsQkjvIqHBxI0
	lz950Po5n0+lcL1n2z1iy3FS3INpMLlJ0IJbO0YhH4dXKoWEZMSQZNhWNaDdSDtSy8Ll4c
	foHOGs+RryPdVSdBNpvFEfNqQPMPM8AUk25pQs+GJVPhH8b/mLgSdHbneG40g9D018R6gX
	MR0icGk6lg1P12qn75OSgYLvo+G9C5LZCF1f/YdytVkqUFWXkVUi94cv/tXShQ==
Date: Thu, 22 Jan 2026 15:48:40 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v4 18/25] drm/tilcdc: Convert to DRM managed resources
Message-ID: <20260122154840.5185671a@kmaincent-XPS-13-7390>
In-Reply-To: <DFSVOBV5UY37.3HTQHOJT3A40N@bootlin.com>
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
	<20260116-feature_tilcdc-v4-18-2c1c22143087@bootlin.com>
	<DFSVOBV5UY37.3HTQHOJT3A40N@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_064855_352352_BB99C087 
X-CRM114-Status: GOOD (  32.17  )
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

On Mon, 19 Jan 2026 22:19:26 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:

> On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> > Convert the tilcdc driver to use DRM managed resources (drmm_* APIs)
> > to eliminate resource lifetime issues, particularly in probe deferral
> > scenarios.
> >
> > This conversion addresses potential use-after-free bugs by ensuring
> > proper cleanup ordering through the DRM managed resource framework.
> > The changes include:
> > - Replace drm_crtc_init_with_planes() with drmm_crtc_alloc_with_planes()
> > - Replace drm_universal_plane_init() with drmm_universal_plane_alloc()
> > - Replace drm_simple_encoder_init() with drmm_simple_encoder_alloc()
> > - Remove manual cleanup in tilcdc_crtc_destroy() and error paths
> > - Remove drm_encoder_cleanup() from encoder error handling paths
> > - Use drmm_add_action_or_reset() for remaining cleanup operations
> >
> > This approach is recommended by the DRM subsystem for improved resource
> > lifetime management and is particularly important for drivers that may
> > experience probe deferral.
> >
> > Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> > ---
> >
> > Change in v4:
> > - Newt patch. =20
>=20
> Why? Adding patches along the way does not help getting your series merged
> timely. If there's a good reason for adding a new patch, please mention it
> here.

Thanks for your review.

Sorry for that. The reason is that I faced a null pointer dereference koops=
 if
for example the panel module is not installed. Then the
drm_of_find_panel_or_bridge() function return eprobe defer and something go=
es
wrong with the DRM resources. Using DRM managed resources solves it.
I will mention it for the v5.

> > +	tilcdc_crtc =3D drmm_crtc_alloc_with_planes(dev, struct tilcdc_crtc,
> > base,
> > +						  &primary->base,
> > +						  NULL,
> > +						  &tilcdc_crtc_funcs,
> > +						  "tilcdc crtc");
> > +	if (IS_ERR(tilcdc_crtc)) {
> > +		dev_err(dev->dev, "Failed to init CRTC: %pe\n",
> > tilcdc_crtc);
> > +		return PTR_ERR(tilcdc_crtc);
> > +	}
> > +
> > +	tilcdc_crtc->primary =3D primary; =20
>=20
> (*) see below
>=20
> >
> >  	init_completion(&tilcdc_crtc->palette_loaded);
> >  	tilcdc_crtc->palette_base =3D dmam_alloc_coherent(dev->dev,
> > @@ -978,10 +992,6 @@ int tilcdc_crtc_create(struct drm_device *dev)
> >
> >  	crtc =3D &tilcdc_crtc->base;
> >
> > -	ret =3D tilcdc_plane_init(dev, &tilcdc_crtc->primary);
> > -	if (ret < 0)
> > -		goto fail;
> > -
> >  	mutex_init(&tilcdc_crtc->enable_lock);
> >
> >  	init_waitqueue_head(&tilcdc_crtc->frame_done_wq);
> > @@ -989,20 +999,12 @@ int tilcdc_crtc_create(struct drm_device *dev)
> >  	spin_lock_init(&tilcdc_crtc->irq_lock);
> >  	INIT_WORK(&tilcdc_crtc->recover_work, tilcdc_crtc_recover_work);
> >
> > -	ret =3D drm_crtc_init_with_planes(dev, crtc,
> > -					&tilcdc_crtc->primary,
> > -					NULL,
> > -					&tilcdc_crtc_funcs,
> > -					"tilcdc crtc");
> > -	if (ret < 0)
> > -		goto fail;
> > -
> >  	drm_crtc_helper_add(crtc, &tilcdc_crtc_helper_funcs);
> >
> > +	ret =3D drmm_add_action_or_reset(dev, tilcdc_crtc_destroy, priv);
> > +	if (ret)
> > +		return ret; =20
>=20
> Not related to your patch, but if the dmam_alloc_coherent() (not visible =
in
> the diff) fails, tilcdc_crtc_destroy() won't be called. Is this intended?
> At first sight this drmm_add_action_or_reset() should be moved at (*), ju=
st
> after the allocation.

You are totally right.

> However being not related to your patch I'd leave this for another series
> anyway, to avoid making this series a moving target.

I think it is related to this patch.
Before this patch there was no need for cleanup as the only action before t=
he
dmam_alloc_coherent() was a devm_kzalloc().
Now the plane and the crtc are initialize before the dmam_alloc_coherent() =
so
the cleanup need to happen if it fails an error.

> I find this patch hard to read and I think because it is converting
> multiple things at once. Splitting it in small steps would have been nice,
> even thought I'm not 100% sure it would have been doable.

Yes, it brought more error when not converting the whole to DRM Managed
resources in one go.

>=20
> Nevertheless it looks correct, so:
>=20
> Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Thanks, but I will remove it due to the small change.=20
Or maybe it is ok for you if I keep it with only the move of
drmm_add_action_or_reset().

Regards.
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

