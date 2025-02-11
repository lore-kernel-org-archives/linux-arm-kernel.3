Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D056CC021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 08:52:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=puc7CASEmMr/O55qZgG+hvcSLXStBdE42XWVq8gSQvY=; b=C9JXcUQZYJWsGHn0HaR6DSsWN/
	q9BjzJl2NW32E6WHlUZKK4afCGauBrawwnWDoAX6MHqH8ZrGo+7lCNvltM6TqgvJSi+CzsIPJnteL
	pxwazlBakeKHpnab4SSzoa2BLn0CZh9Cv+C3whfQz9J2uaarC7/r4qp3GSNbZKxems+aNGc5TRzaI
	Cu8mvvyIDYvyjCe7RtaGBGtXjrUIKMnsAAyNfreFLReB8Dpw9RjkXPm8LHz2Ls9ABFVSYTkwW6ZZI
	5NTWocK7Po7uED/Of3eTN9F+ckCaqgPShK9swT4PZBEL2haqnEtcwnv3bsWUwSiBL6b/WjyaJ2lYk
	s84sORHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thlzl-000000034IE-0S3q;
	Tue, 11 Feb 2025 08:51:53 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thlwZ-000000033T5-04Ll
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 08:48:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C2D74A40129;
	Tue, 11 Feb 2025 08:46:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 761D9C4CEDD;
	Tue, 11 Feb 2025 08:48:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739263714;
	bh=RaoR38MAfgncLsExh3zxNSsVfIrOsKI21zd8P7jRzvY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TU/TSiTjqCksvH33oti3xGiyB1AAaelkA14GCMUz1ViJyhuNCs0rZ2lGiQvhYEzBF
	 xwxHqqGp0sAbaVg5J9QS8SjnWvqSVYlFNYL3o9gNz3rHaCaWZuw8LO+YJ+9ozcyBRY
	 sHcps1c2+APyovdL2aSaQikD1nTcJp8F5ic7bGSiwgB6US+vd3+246yEC84lpU6sf0
	 LJaLwTn4VC325ONrYA0WOdOGr8c0Ed7W+ZirlI3BlL5r3mtcIHDeqbuDX6z+2eZzTm
	 4OguIw00rzH+A7srN3KXdRo9y9P+mAud410Fyhe8ShsdrrbP9yF2C4Vz2TRZH72BuX
	 hbFgnF5LZVeOw==
Date: Tue, 11 Feb 2025 09:48:31 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250211-venomous-dragon-of-competition-d76bf9@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
 <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="imifw34cjfchn5qq"
Content-Disposition: inline
In-Reply-To: <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_004835_179953_F48D9562 
X-CRM114-Status: GOOD (  25.71  )
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


--imifw34cjfchn5qq
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Tue, Feb 11, 2025 at 01:14:28AM +0200, Dmitry Baryshkov wrote:
> On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> > Hi Maxime, Dmitry
> >=20
> > On Fri, 7 Feb 2025 21:54:06 +0200
> > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> >=20
> > > > > +/* Internal function (for refcounted bridges) */
> > > > > +void __drm_bridge_free(struct kref *kref)
> > > > > +{
> > > > > +	struct drm_bridge *bridge =3D container_of(kref, struct drm_bri=
dge, refcount);
> > > > > +	void *container =3D ((void *)bridge) - bridge->container_offset;
> > > > > +
> > > > > +	DRM_DEBUG("bridge=3D%p, container=3D%p FREE\n", bridge, contain=
er); =20
> > > >=20
> > > > Pointers are not really useful to track here, since they are obfusc=
ated
> > > > most of the time. Using the bridge device name would probably be be=
tter
> > > > (or removing the SHOUTING DEBUG entirely :)) =20
> > >=20
> > > bridge device name or bridge funcs (I opted for the latter for the
> > > debugfs file)
> >=20
> > These DRM_DEBUG()s proved extremely useful exactly because of the
> > pointer. This is because when using hotplug one normally has the same
> > device added and removed multiple times, and so the device name or
> > bridge funcs is always the same, preventing from understanding which
> > instance is leaking, or being freed, get, put, etc.
> >=20
> > Do you think this is a sufficient motivation to keep it?
>=20
> Then it should be something like %px. I found that %p is mangled.
> What about having both device name _and_ a pointer?

No, %px must not be used there. %p is mangled but should be consistent
across calls. But yeah, it's kind of the reason I suggested to use the
bridge device name instead.

Maxime

--imifw34cjfchn5qq
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6sO0wAKCRAnX84Zoj2+
dpsfAX0XKk9jgzP+l4NaW5Vkc5IAqgJ0NPSMpGi70iR+EJy/2ca7vtNGaoaDTjQQ
YBBFvAQBfj5XOszrteaDSLvVerz2c7UtT6xwxq1cOmlS8TLC8qdnzjM7+/de1HH+
J+GkLTm69A==
=LMtT
-----END PGP SIGNATURE-----

--imifw34cjfchn5qq--

