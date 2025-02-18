Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EAAAC021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 10:26:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iUi6aUgh5dzXiRu0mqXyDuYn3tA23TuwPXfZOIvC2MQ=; b=MY/qpo7GguuhgyksxgqmR+ftwX
	tu5htlTgbi+5ZuHKechhdBy4PurzZ7593DpBxAEPAR0R2dJKfheoV/ZXHVyi7O4wZFEVB+2KgKZ5p
	goQpcTVsf019k5geDJhgRY/yCoCfvNCBZiXkHYyKrIimwmURi2PTlwzbnWAx5sLVa7umpyDv1cwQL
	Ss1hX8t2DHJCVrJ5yqH7rbFbonQbf8KzR9d+9faDdd/T93h2HrWyxwMKEFzMJIPldkrPBqrzKUP/O
	yPslwJHvgQUUShInjpXARdCBI95nw6imYDsfqUqmEa9lYa+5v0rF8f9FdKSStpp+cpkJ2HZSaula8
	ypGzbFLw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKo5-00000007jzX-2x5L;
	Tue, 18 Feb 2025 10:26:25 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkKfh-00000007iJH-1NG6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 10:17:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 182C6A41E6D;
	Tue, 18 Feb 2025 10:15:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23E01C4CEE4;
	Tue, 18 Feb 2025 10:17:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739873863;
	bh=NLD8opqn3YtLQC0AnIIaIIsuFrJzaowTdytwyVGeif4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=m13Jm2OvSnrjPlWwHqdK2nog9N7C/6Y+OHw9jJ/aM2EDUTgeusD6HiPtlU3lcfrlj
	 ffwIZJYOD10g3wodvRUlb/fJ53xUE5yenPv5TKHTMGo5G1R6MHW184sb+xs6IwY9GX
	 iygExOym+TUpWMEvqE8K/kbfjdo4I2GIhVnWdSxhDUvVfBDmLQtgzjUtmaO6T5/iSB
	 /S0wIWXmk6sU9pkaPa+LSeTNMNtZBm8kQSJGGi6seIvSIxf/JrcehN/jl1iXG+xHgT
	 64YDPejgo5mPAWGe/7Sh1YGAS+umsTtiQ2dedgr9Ga5Ve9IouzZDESIEDP/taorC8g
	 MiRPy/K1igTKQ==
Date: Tue, 18 Feb 2025 11:17:41 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Chen-Yu Tsai <wenst@chromium.org>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <20250218-faithful-white-magpie-da9ac9@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
 <20250210-amusing-bobcat-of-pluck-0d4c09@houat>
 <CAGXv+5GSF=YSiHTgty1J2suAvVYUtOgPShW2mmvuxYiFwK-yeg@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="5h2a6fgfbfdj4ehp"
Content-Disposition: inline
In-Reply-To: <CAGXv+5GSF=YSiHTgty1J2suAvVYUtOgPShW2mmvuxYiFwK-yeg@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_021745_496580_AD5F5AF9 
X-CRM114-Status: GOOD (  49.25  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--5h2a6fgfbfdj4ehp
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
MIME-Version: 1.0

On Tue, Feb 18, 2025 at 05:43:43PM +0800, Chen-Yu Tsai wrote:
> On Tue, Feb 11, 2025 at 2:34=E2=80=AFAM Maxime Ripard <mripard@kernel.org=
> wrote:
> >
> > On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> > > Adding a panel does currently not add a panel_bridge wrapping it. Usu=
ally
> > > the panel_bridge creation happens when some other driver (e.g. the pr=
evious
> > > bridge or the encoder) calls *_of_get_bridge() and the following elem=
ent in
> > > the pipeline is a panel.
> > >
> > > This has some drawbacks:
> > >
> > >  * the panel_bridge is not created in the context of the driver of the
> > >    underlying physical device (the panel driver), but of some other d=
river
> > >  * that "other driver" is not aware of whether the returned drm_bridge
> > >    pointer is a panel_bridge created on the fly, a pre-existing
> > >    panel_bridge or a non-panel bridge
> > >  * removal of a panel_bridge requires calling drm_panel_bridge_remove=
(),
> > >    but the "other driver" doesn't know whether this is needed because=
 it
> > >    doesn't know whether it has created a panel_bridge or not
> > >
> > > So far this approach has been working because devm and drmm ensure the
> > > panel bridge would be dealloacted at some later point. However with t=
he
> > > upcoming implementation of dynamic bridge lifetime this will get more
> > > complicated.
> > >
> > > Correct removal of a panel_bridge might possibly be obtained by addin=
g more
> > > devm/drmm technology to have it freed correctly at all times. However=
 this
> > > would add more complexity and not help making lifetime more understan=
dable.
> > >
> > > Use a different approach instead: always create a panel_bridge with a
> > > drm_panel, thus matching the lifetime of the drm_panel and the panel_=
bridge
> > > wrapping it. This makes lifetime much more straightforward to underst=
and
> > > and to further develop on.
> > >
> > > With the panel_bridge always created, the functions to get a bridge
> > > [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler be=
cause
> > > the bridge they are looking for exists already (if it can exist at al=
l). In
> > > turn, this is implemented based on a variant of
> > > drm_of_find_panel_or_bridge() that only looks for panels:
> > > of_drm_find_bridge_by_endpoint(). In the future
> > > drm_of_find_panel_or_bridge() can be progressively removed because th=
ere
> > > will never be a panel not exposing a bridge.
> > >
> > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > >
> > > ---
> > >
> > > This patch was added in v6.
> > > ---
> > >  drivers/gpu/drm/bridge/panel.c | 74 ++++++++++++++++++++++++++++++++=
+---------
> > >  include/drm/drm_panel.h        |  8 +++++
> > >  2 files changed, 66 insertions(+), 16 deletions(-)
> > >
> > > diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/=
panel.c
> > > index 58570ff6952ca313b3def084262c9bb3772272ef..6995de605e7317dd1eb15=
3afd475746ced764712 100644
> > > --- a/drivers/gpu/drm/bridge/panel.c
> > > +++ b/drivers/gpu/drm/bridge/panel.c
> > > @@ -69,6 +69,9 @@ EXPORT_SYMBOL(drm_panel_init);
> > >   */
> > >  void drm_panel_add(struct drm_panel *panel)
> > >  {
> > > +     panel->bridge =3D drm_panel_bridge_add(panel);
> > > +     WARN_ON(!panel->bridge);
> > > +
> > >       mutex_lock(&panel_lock);
> > >       list_add_tail(&panel->list, &panel_list);
> > >       mutex_unlock(&panel_lock);
> > > @@ -86,6 +89,9 @@ void drm_panel_remove(struct drm_panel *panel)
> > >       mutex_lock(&panel_lock);
> > >       list_del_init(&panel->list);
> > >       mutex_unlock(&panel_lock);
> > > +
> > > +     drm_panel_bridge_remove(panel->bridge);
> > > +     panel->bridge =3D NULL;
> > >  }
> > >  EXPORT_SYMBOL(drm_panel_remove);
> >
> > Given that drm_panel_add and drm_panel_remove are typically called at
> > probe/remove, it's pretty much equivalent to using devm. Both of these
> > solutions aren't safe, and the drm_panel lifetime is still broken.
>=20
> FWIW I believe this solves the panel vs panel_bridge lifetime
> inconsistencies we previously reported [1]. Of course, as you rightly
> point out, any pointers to the bridge become stale if the panel gets
> removed.
>=20
> > I'd rather work on a solution that actually fixes those lifetime issues.
>=20
> I think that can happen once the bridges are ref-counted?

Not all panel users use a bridge, some are using the panel API directly.

> Instead of removing the bridge from the list, it can just clear the
> panel pointer and have all the callbacks skip any operations involving
> the panel.
>=20
> The other option is to have the panel itself be ref-counted. I don't
> think that's worth pursuing if the idea is to move everything over to
> panel_bridge and things are somewhat ready.

Yeah, maybe. I'm kind of skeptical it would be easier than just doing
the work we're doing here though. Most of the "easy" users have been
converted already, and only the problematic ones remain, which will be
difficult to move over. sun4i_rgb and sun6i_dsi, for example, won't be
trivial to switch to panel_bridge. And given that sun4i_rgb is mostly
obsolete, and sun6i_dsi unmaintainable, I don't think it's likely to
happen.

So I don't think it's fair to expect that work from such a series, or to
rely on it eventually being fixed.

I think a solution where we have a bridge in drm_panel is a better
solution (and easier to convert to), but that requires a new panel
allocation API too. We've started to work on it as well, so everything
might just click.

Maxime

--5h2a6fgfbfdj4ehp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ7ReRAAKCRAnX84Zoj2+
dk60AYCcZBzfluhLprG5SA6HA5XjK+12gVtI9ZdvrJlY2TWQT3Lu0BAIdYcdKdV6
rF/QLKEBgP6HIH1uD51d7M6znAEXnWnTH+jB+R6tdXJc5Bajy8qkrNPoWEOQQnYg
1yfhz+rwPQ==
=c3vr
-----END PGP SIGNATURE-----

--5h2a6fgfbfdj4ehp--

