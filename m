Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87814C02198
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:20:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P1ss1v0bvkD5l9H6qgtHX7kFY/vS319qh4txvfoWsq4=; b=Cp6d3fqNaeiIpt6NeU9UwEdolS
	clQJax50MqbV7/KFOHwfvIpfl/2e6LnZztR92g6nyRkFuT6ttlas5vTBdRj/dVS5O7WsrE4pjRaTX
	I0sJLcCctPSbayfLq/VWQF140nT/2d055z7kYWJdi4HiK9wTCt0ugfq3qZ76YZRuUhr4pf+lUGOvH
	6H+FRTyR7Z0P2YvT2N0bjgARsUaw5mZkVlrE4bipyDZmlwHCT06ftDUHEn8my/vJpl/fIX6CLElEh
	L8qKfphFEdvUqcqqdJvADv/4BBEx/BeGpV8ltFY2yuwmdPYeAjBjRDeMyiyLgaU3TsBszBr7k8uDM
	EyrCojDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYNs-00000000tRv-2ktp;
	Mon, 10 Feb 2025 18:19:52 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYKq-00000000shH-3YDb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:16:46 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 666F2A41EF6;
	Mon, 10 Feb 2025 18:14:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23C1FC4CEE6;
	Mon, 10 Feb 2025 18:16:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739211403;
	bh=P1ss1v0bvkD5l9H6qgtHX7kFY/vS319qh4txvfoWsq4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=nU59BCnvDkLk479ynMymoJdH9LGPPQspXrC9ge1Bqw5MC+ab9QddYvZz0MsQ6EH3g
	 215Adk2n3B75BaYdQNBv8cAoNL+jFR77sl8JGjbz1PvZLlKeA1FERlRiBWEpzVB/Ou
	 wt2yoOga77GA2y6TIH9MPaiwpW0Jmo0FdCZpUCB57ExqVHqMSGfsbkOK9K65Nu/3T4
	 tBhmZLlvzoCYi0LlsXm5L86NGYCGcwbaLzbathKuqAM78nNkzgSXjDxs7Hl66xwjuB
	 LvSdau0a9cqdIi+WrqnOH6FI9Zk1bPXKeA7GsUSj+tLSY0hvS5u6d6wAySJNd/hdQ7
	 QlUYiB3+MArbQ==
Date: Mon, 10 Feb 2025 19:16:40 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250210-spirited-premium-rabbit-34e1cc@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210-bold-steel-collie-cecbad@houat>
 <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
 <20250210181203.36798a31@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="rffgj3g2dkwuwd4j"
Content-Disposition: inline
In-Reply-To: <20250210181203.36798a31@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_101645_016425_A875177D 
X-CRM114-Status: GOOD (  43.05  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Sam Ravnborg <sam@ravnborg.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Thomas Zimmermann <tzimmermann@suse.de>, Will Deacon <will@kernel.org>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Dmitry Baryshkov <dmitry.baryshkov@linaro.org>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--rffgj3g2dkwuwd4j
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Mon, Feb 10, 2025 at 06:12:03PM +0100, Luca Ceresoli wrote:
> Hello Maxime, Dmitry,
>=20
> On Mon, 10 Feb 2025 16:23:44 +0200
> Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
>=20
> > On Mon, 10 Feb 2025 at 14:31, Maxime Ripard <mripard@kernel.org>
> > wrote:
> > >
> > > On Fri, Feb 07, 2025 at 09:54:06PM +0200, Dmitry Baryshkov wrote: =20
> > > > On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote: =20
> > > > > Hi,
> > > > >
> > > > > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote: =
=20
> > > > > > DRM bridges are currently considered as a fixed element of a
> > > > > > DRM card, and thus their lifetime is assumed to extend for as
> > > > > > long as the card exists. New use cases, such as hot-pluggable
> > > > > > hardware with video bridges, require DRM bridges to be added
> > > > > > and removed to a DRM card without tearing the card down. This
> > > > > > is possible for connectors already (used by DP MST), so add
> > > > > > this possibility to DRM bridges as well.
> > > > > >
> > > > > > Implementation is based on drm_connector_init() as far as it
> > > > > > makes sense, and differs when it doesn't. A difference is
> > > > > > that bridges are not exposed to userspace, hence struct
> > > > > > drm_bridge does not embed a struct drm_mode_object which
> > > > > > would provide the refcount. Instead we add to struct
> > > > > > drm_bridge a refcount field (we don't need other struct
> > > > > > drm_mode_object fields here) and instead of using the
> > > > > > drm_mode_object_*() functions we reimplement from those
> > > > > > functions the few lines that drm_bridge needs for refcounting.
> > > > > >
> > > > > > Also add a new devm_drm_bridge_alloc() macro to allocate a
> > > > > > new refcounted bridge.
> > > > > >
> > > > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com> =20
> > > > >
> > > > > So, a couple of general comments:
> > > > >
> > > > > - I've said it a couple of times already, but I really think
> > > > > you're making it harder than necessary for you here. This (and
> > > > > only this!) should be the very first series you should be
> > > > > pushing. The rest can only ever work if that work goes through,
> > > > > and it's already hard enough as it is. So, split that patch
> > > > > into a series of its own, get that merged, and then we will be
> > > > > able to deal with panels conversion and whatever. That's even
> > > > > more true with panels since there's ongoing work that will make
> > > > > it easier for you too. So the best thing here is probably to
> > > > > wait. =20
>=20
> The idea you proposed was to handle the issues current panel bridge
> code adds to the hotplug work by adding a .destroy callback and some
> more devm magic. I explored the idea but even after some clarifications
> from you it still didn't appear clearly doable and correct to me. And
> even in the case it were perfectly correct and doable, it is based on
> adding more complexity and "magic" on top of a topic that is already
> hard to understand: panel_bridge lifetime.

Not really, no. I told you several time that you shouldn't deal with
panels yet.

> So I opted for the other way: rework panel_bridge code so its lifetime
> is clear and as one would expect (panel_bridge lifetime =3D=3D panel
> lifetime).
>=20
> Possibly more work for me, but now it's done and it's in these patches
> so why waiting?

No, it's not done. You have the same issue with panels than you are
trying to fix with bridges: it's allocated through devm so they'll get
destroyed too soon. The panel_bridge might work fine now, but the panel
won't.

So it's more work, more scope-creep, and more discussions. For example,
I'm really not convinced on moving the drm_panel code under bridge.

Splitting it up will allow you to at least merge the parts that are
somewhat agreed upon. But do however you want :)

Maxime

--rffgj3g2dkwuwd4j
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pChAAKCRAnX84Zoj2+
dpqyAX9yyUCN76HmBvf3yU/Fwr0oPMOIzqBP07NsD/+k2jjVzrgSQM4ai90MiX0b
lSvbIdkBgPRVzIb7rhd6y4Pi4tuJ69NyDfsvuORTdgT42FpLlM3GPs3pujt/R1o9
AnFVC6dF0w==
=Xy4e
-----END PGP SIGNATURE-----

--rffgj3g2dkwuwd4j--

