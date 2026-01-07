Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BE1C2CFD640
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 Jan 2026 14:08:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pEa5ZTiF6T4s5tfkguyMLf5tjzP+HmXhqKgp6+XiUqI=; b=gxsoNnn4XQngnIFeko7cWzemVH
	fy63Y/km/MMhBjuepZcRhhIxpjgihr2VSSiGZBT7KQm5K/zF+Uh565/VSudkNXQdSaXjvOathfv05
	nrEl4F3yNf5FygF8qXmHprjRpWrtJkuE4ENQUx/IZER79EH0s1mNVyFlbBk9qO5RIAZdXJv1WcfIC
	a4OM+cF213Irh0GU/cufPdVD/1fohBf9WfCWmSDao4CyJU4K72rPyNDNEW6WHrdjn86F0zC2qxF++
	IuB7WpYcAqzUaxG5Tbya1zrEKD6DIah1Ad8E0aq8wBiURgKeiIgzW4oPq8pvEY/0fAbEjmoRnCC5i
	ZYgLpsCg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUCl-0000000F3ed-3QVN;
	Wed, 07 Jan 2026 14:08:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdUCk-0000000F3eU-2pUy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 Jan 2026 14:08:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id B773060007;
	Wed,  7 Jan 2026 14:08:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E9210C4CEF1;
	Wed,  7 Jan 2026 14:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1767794885;
	bh=tixylDIwkfMzESf8/JELPILstX0GopnvIR6u5lHwaKk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d+yKW82NNNJx2vwiMYS/bjv0OXWpntcMb8wDjG09HZnubqTCbaqj+8kpP90FLjKlZ
	 RDxkRBwLEpn+rnHZ/prOfonmw61IcVqCKKa0kFCJA7PQi0zVRjzu1HEA8XQC7t3vf8
	 AeUgLYHGtc5ZxJm+m1b12TIuNRSGZFN9sB27rL1MeXdz9zWJDR/3fw0T/NyYqPKYFy
	 SMwdLpHO4EFEwusImIAIZkIYBeIhkDzZRyC7ofsTkfJ9C/9ENFdLftj+HMgprXWwWC
	 VyxpGtJ8WBNM8CAjpmc64bFSQ2hdxU5ZhZ10rsar79OuzK5b2qoXW//ACFMqHR4eCb
	 Pu81Om00rpliA==
Date: Wed, 7 Jan 2026 15:08:03 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Philippe Cornu <philippe.cornu@st.com>, 
	benjamin.gaignard@linaro.org, Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Adrien Grassein <adrien.grassein@gmail.com>, 
	Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Inki Dae <inki.dae@samsung.com>, 
	Jagan Teki <jagan@amarulasolutions.com>, Marek Szyprowski <m.szyprowski@samsung.com>, 
	Hui Pu <Hui.Pu@gehealthcare.com>, Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
Message-ID: <20260107-weightless-adaptable-wildebeest-a3ed6f@houat>
References: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-0-283d7bba061a@bootlin.com>
 <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-9-283d7bba061a@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ljhomylig6poh7z3"
Content-Disposition: inline
In-Reply-To: <20260107-drm-bridge-alloc-getput-drm_of_find_bridge-2-v1-9-283d7bba061a@bootlin.com>
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


--ljhomylig6poh7z3
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 09/12] drm/bridge: imx8qxp-ldb: convert to
 of_drm_find_and_get_bridge()
MIME-Version: 1.0

Hi,

On Wed, Jan 07, 2026 at 02:13:00PM +0100, Luca Ceresoli wrote:
> of_drm_find_bridge() is deprecated. Move to its replacement
> of_drm_find_and_get_bridge() which gets a bridge reference, and ensure it
> is put when done.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c | 3 ++-
>  1 file changed, 2 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c b/drivers/gpu/drm/b=
ridge/imx/imx8qxp-ldb.c
> index 122502968927..6b80d798b27a 100644
> --- a/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> +++ b/drivers/gpu/drm/bridge/imx/imx8qxp-ldb.c
> @@ -552,7 +552,7 @@ static int imx8qxp_ldb_parse_dt_companion(struct imx8=
qxp_ldb *imx8qxp_ldb)
>  		goto out;
>  	}
> =20
> -	imx8qxp_ldb->companion =3D of_drm_find_bridge(companion_port);
> +	imx8qxp_ldb->companion =3D of_drm_find_and_get_bridge(companion_port);
>  	if (!imx8qxp_ldb->companion) {
>  		ret =3D -EPROBE_DEFER;
>  		DRM_DEV_DEBUG_DRIVER(dev,
> @@ -679,6 +679,7 @@ static void imx8qxp_ldb_remove(struct platform_device=
 *pdev)
>  	struct ldb *ldb =3D &imx8qxp_ldb->base;
> =20
>  	ldb_remove_bridge_helper(ldb);
> +	drm_bridge_put(imx8qxp_ldb->companion);

the companion bridge is used in pretty much every KMS hook, we need to
put the reference in destroy.

Maxime

--ljhomylig6poh7z3
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaV5ovQAKCRAnX84Zoj2+
dv4yAYC/18PKdVreCA8vF+oCiv+rArQOQdluKaPY7WyntK608MdJYBnbhVlGWFt3
m/w0WAkBgIx7i5jlphIWLhPUgfA0LxoI4W9QLV2N3AymAfzRp7rmhJPGXGDZ03P/
Q3gPy/78sg==
=3oDC
-----END PGP SIGNATURE-----

--ljhomylig6poh7z3--

