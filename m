Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 117D4C02198
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Feb 2025 10:31:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2JbCjNEv08fCjjAua7LKhJjfZ3nq8T+bFw2iEtkSm7Y=; b=s528lrzFB5y733OVNkB7luDsGS
	Wyoegt0e8oXPef5b+iOnSD4LIY5K/PLKfH9EiRQcPYMdxoIv3e8aXIZJ/1ec1/NYckexmitnc6HuN
	sirtLOhiwotN3RE8jcCx9llaSuzczTHGO16vg4vz+zAeVOpXongw0K3sXjkPJTZkgSmCCsji+apW+
	Pn351HI3hCCehrWp/0wtmhztAY1+bwgjyMB066wf2o66OhZzR/rNVw52/TGkZq3wJJj88UwFC2euu
	WL+nE3vJQR+959dp/uHybDdQkP6KdaqDbfZTN+76ku7Ye5O9qbqzc9Tec9uqZWbnDFkjrGHTfSgkB
	GbwAop4g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiA1L-00000006zVD-1LaZ;
	Wed, 12 Feb 2025 10:31:07 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ti9fF-00000006vjU-3e0t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Feb 2025 10:08:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8822A5C5DEF;
	Wed, 12 Feb 2025 10:07:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4AAACC4CEDF;
	Wed, 12 Feb 2025 10:08:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739354896;
	bh=SZIYgUNCCnIL5V0seV/NEEb2Rim4jnuOX/CWoopZRZo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=BVr9syjrufyTLY9xamchuxaxhtBwatQn4E5nLYGo3FDTekqf1z2gkJHayWmn9KZaJ
	 bNmP+QFDQx2oinhW1Bj8Zj+b3YdHej+ggMUb99OkAqJ08Cn0ZnMEiP6iW06TKEJA7k
	 HutHsQ865WyPlyj253gDAw15bF0gKSH/wal3TwAhWjNPV2Hm3BDwBeNpRHvvk/6isx
	 IpAoIPlguCWJeEc7sJKvTz3WzPGkRV8tk5fZJD2h8DBGZFpfQp1qNbsZNRmZjIVSQ0
	 SyZuGYTItv+KchRHitB/qEwzMHf8LMQ/7DlPxayOqcbKZ3+Oas2iu2Jhda2oPHr+y0
	 agQ0hJJV4eLlw==
Date: Wed, 12 Feb 2025 11:08:14 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250212-petite-persimmon-termite-c0bce2@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <ucttjaf3trkgtpvhnsj7xfsybhnoi4qqow5ucwghlggivbagy7@gngjhbtu73lb>
 <20250210181244.0e3e9189@booty>
 <qnuskv4mln32nqgbgvwi2qcdwfma6tqfbq7e6sqb3za6pmms2j@ir7pt5634dsh>
 <20250211-venomous-dragon-of-competition-d76bf9@houat>
 <i5q5zuymhn6sy4nou22zxbolztqbq6soef2cwrdq3ey63vfugj@z3rv7zh7xhle>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="c2fwd2zsskly2q4c"
Content-Disposition: inline
In-Reply-To: <i5q5zuymhn6sy4nou22zxbolztqbq6soef2cwrdq3ey63vfugj@z3rv7zh7xhle>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250212_020818_085751_FB0F46C4 
X-CRM114-Status: GOOD (  30.19  )
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


--c2fwd2zsskly2q4c
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Wed, Feb 12, 2025 at 02:55:10AM +0200, Dmitry Baryshkov wrote:
> On Tue, Feb 11, 2025 at 09:48:31AM +0100, Maxime Ripard wrote:
> > On Tue, Feb 11, 2025 at 01:14:28AM +0200, Dmitry Baryshkov wrote:
> > > On Mon, Feb 10, 2025 at 06:12:44PM +0100, Luca Ceresoli wrote:
> > > > Hi Maxime, Dmitry
> > > >=20
> > > > On Fri, 7 Feb 2025 21:54:06 +0200
> > > > Dmitry Baryshkov <dmitry.baryshkov@linaro.org> wrote:
> > > >=20
> > > > > > > +/* Internal function (for refcounted bridges) */
> > > > > > > +void __drm_bridge_free(struct kref *kref)
> > > > > > > +{
> > > > > > > +	struct drm_bridge *bridge =3D container_of(kref, struct drm=
_bridge, refcount);
> > > > > > > +	void *container =3D ((void *)bridge) - bridge->container_of=
fset;
> > > > > > > +
> > > > > > > +	DRM_DEBUG("bridge=3D%p, container=3D%p FREE\n", bridge, con=
tainer); =20
> > > > > >=20
> > > > > > Pointers are not really useful to track here, since they are ob=
fuscated
> > > > > > most of the time. Using the bridge device name would probably b=
e better
> > > > > > (or removing the SHOUTING DEBUG entirely :)) =20
> > > > >=20
> > > > > bridge device name or bridge funcs (I opted for the latter for the
> > > > > debugfs file)
> > > >=20
> > > > These DRM_DEBUG()s proved extremely useful exactly because of the
> > > > pointer. This is because when using hotplug one normally has the sa=
me
> > > > device added and removed multiple times, and so the device name or
> > > > bridge funcs is always the same, preventing from understanding which
> > > > instance is leaking, or being freed, get, put, etc.
> > > >=20
> > > > Do you think this is a sufficient motivation to keep it?
> > >=20
> > > Then it should be something like %px. I found that %p is mangled.
> > > What about having both device name _and_ a pointer?
> >=20
> > No, %px must not be used there. %p is mangled but should be consistent
> > across calls. But yeah, it's kind of the reason I suggested to use the
> > bridge device name instead.
>=20
> Then we need to extend struct drm_bridge with struct device *dev (which
> I would appreciate, it will solve whole hdmi_audio_dev / CEC device /
> etc story).

Let's not get carried away and start yet another side discussion here.
Most of these log messages need to be reworked anyway, so I'm sure we
can find something that wouldn't require yet another rework to argue
about.

Maxime

--c2fwd2zsskly2q4c
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6xzDQAKCRAnX84Zoj2+
dkT0AYCkUL7FAvh7cyVAWf35anla6gaIPKKt7fnIaZU+CIoMLp/xlH2vfqItsVOF
V6M0p+4BgJd7VNGXdmw73nQmuc5U6UM6/Rn1xP94EajbmmZyjqxzR+xwsOjC0P2J
qhJjJSwQoQ==
=IEWS
-----END PGP SIGNATURE-----

--c2fwd2zsskly2q4c--

