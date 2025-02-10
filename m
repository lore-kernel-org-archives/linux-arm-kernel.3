Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D7ABC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:24:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hmf+iGwtFnWAiFSUFfwBJhOvfTtCm11UEdLbp3WauH0=; b=HGtjnnOvYBWHwbGeUN9eatZniQ
	veHvcz96F/qt1XpBA7T29us7haJubi+FmWhRacJsPurpAjPiRjJsE3K7xoukaIBp3CKpIYflWLmQa
	3HcQjud2sHPcuYAsTx0j7PKAeylH7vvG41ZgY2/5fID4mHz3JD3Dg0IDAauv1aKBjmX/v5D2sn8Ie
	l9qkwOEvEaS7ya0V2HyLQomurtIMTfoAH8617+d1fbHfyhr7ogqJY+99mdinMOAk2cSn0zHwhD30p
	YFuiEUXrQfM3UlKmO4bEnK413xMZJp7LaEgdYrFjfgcs3JOKxETGJQrhGMkDjnLbBL3FDymlhy9KH
	8mB5adXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYS0-00000000uN7-0xu8;
	Mon, 10 Feb 2025 18:24:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYLw-00000000sy6-01Bh
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 18:17:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=hmf+iGwtFnWAiFSUFfwBJhOvfTtCm11UEdLbp3WauH0=; b=XFfDliKTNKeW+FX1tD9f/kmedI
	7XQuAb6NDYI5toZqa7omOH5UaBFG+E/PkEWaxbOGnxvpah7DxpssBqMWkDHdynaN+9sS32qiP7g97
	/p44Wk1MpIhO1ZJkBr3ZhHhHEKBQIswxzoela1jnPs7wQ4CyT9xk7zF3pT4rhWe9D0zsXjnOfu0JB
	I2QNEnRIdD4tcBUfLmyQRiaPoOqvF0pDd6fhjZM3LodcESLhljPVYFPWj4mPT1ceGLIrQ0DzCa7Y4
	BDPHTJmWI/XMYVyQ56UgDNwyG3GM1WEslDGnbN8mMuyKvilD+Kie+DY0PfcT6CKe61ri2Dsf3Lsyu
	ouzAoRJQ==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYLt-00000000CVw-0ZUY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:17:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 406E6A41EF6;
	Mon, 10 Feb 2025 18:15:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 02401C4CEE6;
	Mon, 10 Feb 2025 18:17:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739211462;
	bh=WiOKGuitaydzhswX/7JM6O1nTPijJq8eyPlKsuXqT/0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SYC5e8jAmnFQbgWzl7VBI9YMtbd7So6JvOfGkmZR4rPjBqZ4L77d44l+d00zp2aPK
	 vdY2EDi971nV/mQePhMvYhghFcmArOCv3gVcP2lJiAK0FN3KPcy2bhUNSh+b8pbgMK
	 jD+oZXJW6CRk1yRxk36qHlpWWwKFwyXuQ5iEPykue89vmpXr2X9MqFOqc2O0gBdD6a
	 oCyBLJXpsqq0u00imJlBSuR+8Y6VTLMeycXL1n0SI8dszQCypYTkKHx4OGpFwOmEiT
	 jYACq03l9RxT9tsx6qROQ4SbUcgSmnx8ymMVJUb1kGv2HGgKdi5gmL/d1Y97vRoS9w
	 3uMgSSMariMfg==
Date: Mon, 10 Feb 2025 19:17:39 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250210-proficient-millipede-of-recreation-91da6c@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210-bold-steel-collie-cecbad@houat>
 <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ctkvotoob64tevup"
Content-Disposition: inline
In-Reply-To: <CAA8EJppyDiAeH8bm-rdCUsGoyVOrp=4AvrYLJ-=5BTLtmnP11g@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_181749_438492_202095EC 
X-CRM114-Status: GOOD (  45.63  )
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
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, =?utf-8?B?SGVydsOp?= Codina <herve.codina@bootlin.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, Sam Ravnborg <sam@ravnborg.org>, linux-doc@vger.kernel.org, Catalin Marinas <catalin.marinas@arm.com>, Paul Kocialkowski <contact@paulk.fr>, dri-devel@lists.freedesktop.org, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Andrzej Hajda <andrzej.hajda@intel.com>, David Airlie <airlied@gmail.com>, Fabio Estevam <festevam@gmail.com>, Marek Szyprowski <m.szyprowski@samsung.com>, Simona Vetter <simona@ffwll.ch>, Robert Foss <rfoss@kernel.org>, Jonathan Corbet <corbet@lwn.net>, Will Deacon <will@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, Daniel Thompson <danielt@kernel.org>, Jagan Teki <jagan@amarulasolutions.com>, Jessica Zhang <quic_jesszhan@quicinc.com>, Luca Ceresoli <luca.ceresoli@bootlin.com>, Thomas Zimmermann <tzimmermann@suse.de>, Jonas Karlman <jonas@kwiboo.se>, Sascha Hauer <s.hauer@pengutronix.de>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, Inki Dae <inki.dae@samsung.com>, linux-arm-kernel@lists.infradead.org, Neil Armstrong <neil.armstrong@linaro.org>, Boris Brezillon <bbrezillon@kernel.org>, linux-kernel@vger.kernel.org, Paul Kocialkowski <paul.kocialkowski@bootlin.com>, Pengutronix Kernel Team <kernel@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org


--ctkvotoob64tevup
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Mon, Feb 10, 2025 at 04:23:44PM +0200, Dmitry Baryshkov wrote:
> On Mon, 10 Feb 2025 at 14:31, Maxime Ripard <mripard@kernel.org> wrote:
> >
> > On Fri, Feb 07, 2025 at 09:54:06PM +0200, Dmitry Baryshkov wrote:
> > > On Fri, Feb 07, 2025 at 12:47:51PM +0100, Maxime Ripard wrote:
> > > > Hi,
> > > >
> > > > On Thu, Feb 06, 2025 at 07:14:29PM +0100, Luca Ceresoli wrote:
> > > > > DRM bridges are currently considered as a fixed element of a DRM =
card, and
> > > > > thus their lifetime is assumed to extend for as long as the card
> > > > > exists. New use cases, such as hot-pluggable hardware with video =
bridges,
> > > > > require DRM bridges to be added and removed to a DRM card without=
 tearing
> > > > > the card down. This is possible for connectors already (used by D=
P MST), so
> > > > > add this possibility to DRM bridges as well.
> > > > >
> > > > > Implementation is based on drm_connector_init() as far as it make=
s sense,
> > > > > and differs when it doesn't. A difference is that bridges are not=
 exposed
> > > > > to userspace, hence struct drm_bridge does not embed a struct
> > > > > drm_mode_object which would provide the refcount. Instead we add =
to struct
> > > > > drm_bridge a refcount field (we don't need other struct drm_mode_=
object
> > > > > fields here) and instead of using the drm_mode_object_*() functio=
ns we
> > > > > reimplement from those functions the few lines that drm_bridge ne=
eds for
> > > > > refcounting.
> > > > >
> > > > > Also add a new devm_drm_bridge_alloc() macro to allocate a new re=
fcounted
> > > > > bridge.
> > > > >
> > > > > Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> > > >
> > > > So, a couple of general comments:
> > > >
> > > > - I've said it a couple of times already, but I really think you're
> > > >   making it harder than necessary for you here. This (and only this=
!)
> > > >   should be the very first series you should be pushing. The rest c=
an
> > > >   only ever work if that work goes through, and it's already hard e=
nough
> > > >   as it is. So, split that patch into a series of its own, get that
> > > >   merged, and then we will be able to deal with panels conversion a=
nd
> > > >   whatever. That's even more true with panels since there's ongoing=
 work
> > > >   that will make it easier for you too. So the best thing here is
> > > >   probably to wait.
> > >
> > > Luca and I had a quick chat on this during FOSDEM. I really think that
> > > panel (part of the) series can go in first as it fixes a very well kn=
own
> > > bug _and_ allows a pretty good cleanup to a whole set of drivers.
> >
> > I don't necessarily disagree on principle, but if you state that it can
> > get first, and fixes a known problem (which one?), then it should be a
> > separate, standalone, series.
>=20
> A problem of panel bridges having the wrong lifetime because of devm_
> attachment to a wrong device and so either being kept for too long or
> being destroyed too early.

Yeah, and panels too. Which isn't solved there.

> > Ever-expanding features are bad for both the reviewers and the
> > contributors, even more so when the discussion happens off-list.
> >
> > > With all those panel / bridge wrappers gone we should be able to see a
> > > clearer picture of what individual drivers are doing. In other words,
> > > which memory and which code actually hosts and uses internal
> > > 'next_bridge' reference.
> > >
> > > > - This patch really needs to be split into several patches, somethi=
ng
> > > >   along the lines of:
> > > >
> > > >   + Creating devm_drm_bridge_alloc()
> > > >   + Adding refcounting
> > > >   + Taking the references in all the needed places
> > > >   + Converting a bunch of drivers
> > >
> > > The last two parts seem troublematic to me, but, I must admit, I didn=
't
> > > spend so much time reviewing all drm_bridge usage patterns.
> >
> > Why? the third one is already done by that patch, the fourth can
> > relatively easily be done using coccinelle.
>=20
> I have doubts about cocci. It doesn't have a way to know, what is the
> lifetime of the references to the reference-holding memory. Maybe I'm
> missing a point there.

It doesn't matter? Cocci doesn't (have to) understand the code, it
generates a patch for you. It's up to the author to make a correct
patch.

Maxime

--ctkvotoob64tevup
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pCwwAKCRAnX84Zoj2+
ds3DAYCmyuWWTQzL+uHFZsj4ooH84JF7ylfCHkygjk4bJCQXQisORfKKbJfiPywk
z2E+5o0BgLSZ3mrnwgjna4TApCO5ujytoxWxMXYaZK8XX1nkPOV0t4H3yXXgLltd
APIGGfkStg==
=nbSx
-----END PGP SIGNATURE-----

--ctkvotoob64tevup--

