Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5B4DC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:38:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PVeB7xF2M8hKCvAKuhk8vj/WTr+meD/UB7mpplN6FUY=; b=27/x7US+l+LCH7d1SQT0yiYDV9
	noM23BAp6aoXm9tMYMOIqixB59ziUty2JYB6TiWuYTI6UAfLQG8wWZhzRlkFbZbqZJf0lUyDGY0uY
	nOotjCLj0+Tz1QRW+RRuviy8EX//wa4whVV4veBtjKWe9dLJJoyu7IJ8pVZR1NHLYRn7NDaDv6P0H
	bVAOZXhnDjgeAL7auzH10OXL/74KH9biq/b8dUWRn+lqjTiVyX+glIO26zc+2bM++wb+N5uibTzxj
	lvtrQRTqO09LeYUuy3zBna6HwlyCVw49VYjhx2B+9bTy9hiju8UnM86Jwkp1D+3XA3P24YQrXLIg+
	uthV4KhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYfn-00000000xFV-13YB;
	Mon, 10 Feb 2025 18:38:23 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYQF-00000000tvU-3404
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:22:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 4875FA41EF2;
	Mon, 10 Feb 2025 18:20:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 07A8BC4CED1;
	Mon, 10 Feb 2025 18:22:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739211738;
	bh=kW4WlH1HkjqvMNtVdOaqv6Bu3HBYq9GrG/aLmkyGeCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=be1eT55i+UR6ruMjbhjaLYShzWBV7ozYReKlgdefdv/FGyh77+ltMi3kDsqbo/sVF
	 eHRVRXaqBUzsfLgIzgOEeKSp6hKXCEOrVSin5J1mkd58bPYgwxnnU+qKyP4sPeMqIf
	 tVBEhX6NQHBU8JD/H0/rIZJaX2T6mhwDPsz43JOINFl1GVXwNWJGH9zcJFAQZRC20C
	 qnVOrHalrHMtHpuxYxkC6VZ9o7zMhOGGeYftsHslUmYk5whiorSveKLY1PZC/FOPA+
	 h0OGLPdtge3ogo82C6Ksqvc6KrUWpWrKHm7mdekN5jTU8J5DPSdCCb5CZwBVoAkPaY
	 aVJ7wRqrkyRgg==
Date: Mon, 10 Feb 2025 19:22:15 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
Message-ID: <20250210-vague-fluorescent-toad-c7d1ce@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="a3gp6fts62sykw5k"
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-10-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_102219_898952_CBECA77C 
X-CRM114-Status: GOOD (  27.91  )
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


--a3gp6fts62sykw5k
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 10/26] drm/bridge: add devm_drm_of_get_bridge_by_node()
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 07:14:25PM +0100, Luca Ceresoli wrote:
> devm_drm_of_get_bridge(), which is based on graph links, is the recommend=
ed
> function to get a pointer to the following bridge.
>=20
> This is valid even for panels, for which the recommended device tree
> description is via graph links and not (or not only) panel subnodes of a
> panel controller (e.g. "dsi@1234" controller node with a "panel@0"
> subnode).
>=20
> However there are drivers supporting the panel subnode description in
> addition to the graph links. For those drivers add a _by_node variant that
> takes the node of the target node.
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/drm_bridge.c | 30 ++++++++++++++++++++++++++++++
>  include/drm/drm_bridge.h     |  8 ++++++++
>  2 files changed, 38 insertions(+)
>=20
> diff --git a/drivers/gpu/drm/drm_bridge.c b/drivers/gpu/drm/drm_bridge.c
> index 2aa17fbe538b86066c4e68f0d0e8046e9ca9b965..b0834b8644284e5f7751cec81=
724af849b4180e7 100644
> --- a/drivers/gpu/drm/drm_bridge.c
> +++ b/drivers/gpu/drm/drm_bridge.c
> @@ -1407,6 +1407,36 @@ struct drm_bridge *devm_drm_of_get_bridge(struct d=
evice *dev,
>  }
>  EXPORT_SYMBOL(devm_drm_of_get_bridge);
> =20
> +/**
> + * devm_drm_of_get_bridge_by_node - Return bridge for a given OF node
> + * @dev: device to tie the bridge lifetime to
> + * @bridge_node: device node of the remote bridge
> + *
> + * Given a bridge DT node, returns the associated bridge if any. This
> + * should be used in addition to devm_drm_of_get_bridge() when the regul=
ar
> + * graph link search is not enough, e.g. for drivers that need to support
> + * panels described only as subnodes.
> + *
> + * RETURNS:
> + * A pointer to the bridge if successful, or an error pointer otherwise.
> + */
> +struct drm_bridge *devm_drm_of_get_bridge_by_node(struct device *dev,
> +						  struct device_node *bridge_node)
> +{
> +	struct drm_bridge *bridge;
> +	int ret;
> +
> +	if (!bridge_node)
> +		return ERR_PTR(-EINVAL);
> +
> +	bridge =3D of_drm_find_bridge(bridge_node);
> +	if (!bridge)
> +		return ERR_PTR(-ENODEV);
> +
> +	return bridge;
> +}
> +EXPORT_SYMBOL(devm_drm_of_get_bridge_by_node);
> +

A bridge is a KMS-facing structure, there's no reason to tie it to the
lifetime of the device.

Maxime

--a3gp6fts62sykw5k
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pD1wAKCRAnX84Zoj2+
duqYAYCyFN95MaOSOiHSy48n6f+H3RwjknEahucK0hxM//iGFFhtWemOcArKOv5O
ruChdWsBgMttvepbPSgqHfhHAKiGVSo2oYhJYPPZWeYyVlDWHVRi49u6PZWnEoWZ
iHl0s6SF1A==
=82V5
-----END PGP SIGNATURE-----

--a3gp6fts62sykw5k--

