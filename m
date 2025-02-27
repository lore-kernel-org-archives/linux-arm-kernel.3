Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 607FFC021BE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Feb 2025 09:52:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BysMY6QVPyInEXV5D5QMrMXYQTfMwHZhtRjxoxcaZWY=; b=Raa5pEK2oJwaaWjGYkYIRBkUhJ
	bfFDRL0i8cs8RZOTI9wA6VJrdsHTXeYY1qCRA2e3Xq3vfSkxVIQDf7HyQXMY3KTjMoAPV0BRIJ+5O
	CprVacbICpQ8BE9kinUVWTpYTTn/TdVspGQBKyJP0fvXRsgdqLkkzTVHe+/tVigyXfWwXxRNjYezG
	kOJImpe0KyAAYPzF/HWvgpR8RSwQ7c6g2ZXInIKpgDbvmp8g4C5T30h/Y+1hIPDsAJN/U6yicxGom
	7j046ZHb8UO1081HoCx777yHlugA5v3qZlglJVSDjhq+YrT6iAO+bF5k/kxKThl3gG6y0E86nr5eB
	wbQvLzzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaZG-00000006uy7-40GV;
	Thu, 27 Feb 2025 09:52:34 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tnaFk-00000006s5y-2a8z
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Feb 2025 09:32:25 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id F1D395C4936;
	Thu, 27 Feb 2025 09:31:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 204F9C4CEDD;
	Thu, 27 Feb 2025 09:32:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740648743;
	bh=5MNjAbAl4fq6g53JUWJsJzNozHy0lxgqYwA7jNUEmtQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HBdUalSSz94olOqrDU0Rw3cVMKA5bNW+HF7LQQXNYIZlbVkXAURmoKovc3RQdDTpn
	 Sahs5l3xeGIJvcru9uX97A07H9+JfmChDZRwmFpoNUzhY/whhjiLCAg2nJoseqjL/r
	 m8tn7rfPSp/qjYWWX9kUZ0DPhOTeXWKRdvyOVB+JQIqyl2t+lH6/JLegCWrvnVQCHn
	 sKNW97Q+mNWXaNMs8uIMKUKLvXfR85loCdZIVwihoCUJAHzjoSkrWkWqy7L3XyPaUU
	 sBzBZQL93A8fTIGHNUras/ZHSOXQSyttEBHC9gnZTmsjNjMf2LT8lxTBgvZja5n6hZ
	 XY6qZ2lp2Gmuw==
Date: Thu, 27 Feb 2025 10:32:20 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
Message-ID: <20250227-savvy-monumental-toucan-edffe2@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-14-9d6f2c9c3058@bootlin.com>
 <20250207-ingenious-daffodil-dugong-51be57@houat>
 <20250210181252.5ee028d4@booty>
 <20250211-merciful-nyala-of-justice-a4fabb@houat>
 <20250226152813.4a1ad218@booty>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="dfdgpsludo7guwgc"
Content-Disposition: inline
In-Reply-To: <20250226152813.4a1ad218@booty>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250227_013224_746710_38803550 
X-CRM114-Status: GOOD (  35.04  )
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


--dfdgpsludo7guwgc
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 14/26] drm/bridge: add support for refcounted DRM
 bridges
MIME-Version: 1.0

On Wed, Feb 26, 2025 at 03:28:13PM +0100, Luca Ceresoli wrote:
> On Tue, 11 Feb 2025 14:10:50 +0100
> Maxime Ripard <mripard@kernel.org> wrote:
> > On Mon, Feb 10, 2025 at 06:12:52PM +0100, Luca Ceresoli wrote:
> > > On Fri, 7 Feb 2025 12:47:51 +0100
> > > Maxime Ripard <mripard@kernel.org> wrote:
> > >  =20
> > > > > diff --git a/include/drm/drm_bridge.h b/include/drm/drm_bridge.h
> > > > > index ad7ba444a13e5ecf16f996de3742e4ac67dc21f1..43cef0f6ccd36034f=
64ad2babfebea62db1d9e43 100644
> > > > > --- a/include/drm/drm_bridge.h
> > > > > +++ b/include/drm/drm_bridge.h
> > > > > @@ -31,6 +31,7 @@
> > > > >  #include <drm/drm_encoder.h>
> > > > >  #include <drm/drm_mode_object.h>
> > > > >  #include <drm/drm_modes.h>
> > > > > +#include <drm/drm_print.h>
> > > > > =20
> > > > >  struct device_node;
> > > > > =20
> > > > > @@ -863,6 +864,22 @@ struct drm_bridge {
> > > > >  	const struct drm_bridge_timings *timings;
> > > > >  	/** @funcs: control functions */
> > > > >  	const struct drm_bridge_funcs *funcs;
> > > > > +
> > > > > +	/**
> > > > > +	 * @container_offset: Offset of this struct within the container
> > > > > +	 * struct embedding it. Used for refcounted bridges to free the
> > > > > +	 * embeddeing struct when the refcount drops to zero. Unused on
> > > > > +	 * legacy bridges.
> > > > > +	 */
> > > > > +	size_t container_offset;   =20
> > > >=20
> > > > This shouldn't be in there. You can create an intermediate structur=
e and
> > > > store both pointers for the action to consume. =20
> > >=20
> > > You mean to store container_offset + refcount + is_refcounted? =20
> >=20
> > No, I meant for the private structure pointer and the drm_bridge
> > pointer. refcount should be in drm_bridge, and I think is_refcounted
> > should be dropped.
>=20
> Storing the container pointer instead of the offset is a good idea, it
> will allow to get rid of is_refcounted: drm_bridge_is_refcounted() can
> just return "container !=3D NULL" instead of "bridge->is_refcounted". So
> far so good.

Again, I don't think the whole is_refcounted thing is a good idea. Once
we have the right API, we should convert all bridges to the new
allocation and assume that they are refcounted.

> I'm not sure about the intermediate struct you have in mind though.
>=20
> Do you mean:
>=20
> struct drm_bridge_pointers {
>     struct drm_bridge *bridge;
>     void              *container;
> }
>=20
> ?

Yes

> If that's what you mean, should it be embedded in drm_struct or
> allocated separately?

Separately, but still as part of the bridge allocation function.

> If you mean to embed that struct in drm_bridge, then I the drm_bridge
> pointer inside the intermediate struct would be useless.
>=20
> If instead you mean to embed it in drm_struct: I'm not sure I see much
> benefit except maybe not exposing the container pointer to drm_bridge
> users, but I see a drawbacks: at the last put we need to find the
> container pointer to free from a struct kref pointer, which can work
> only if the container pointer is in the same struct as struct kref.

Yeah, that's true. Storing the container pointer in drm_bridge makes
sense to solve this.

I'm still not sure why we need the container offset though: if we have a
bridge and container pointer, then the offset is bridge - container, so
there's no point in storing it, right?

Maxime

--dfdgpsludo7guwgc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ8AxJAAKCRAnX84Zoj2+
dsUUAX0Xxg2iIgwuaxtZwjtxFd46vyTrOtN+YPw9iz5R3BpZftRillij5tLub5PD
xL/MSucBfA/oFAKN4+mbZfJTb26QK8zau3RtslBEbH3sp+gHU1I5Rcyle08ZtMS9
W2Wo0G3KCQ==
=6jsA
-----END PGP SIGNATURE-----

--dfdgpsludo7guwgc--

