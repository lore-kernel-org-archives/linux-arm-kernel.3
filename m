Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3A15C83F18
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 08:05:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9WykevEdyaCE2xtV/9zhvlEaoKymfUiWZVZRcFyl6DM=; b=lJ4ZPYPFs8mUhlf6BCQ1Fer+I1
	yhL9o/06PUwAhWNsR4bCp2vtgivmKM2j6yLMn7n1I2Te097jshBHksWWhfRKWamaPsSvzaEx6lm6j
	2kQPuL1o7jPegw/MB1WeLnBGJgjobl8r5wYlThsEFKseAj9cKPcZbSHZ7OGNt1KAYjaS0uxVt+qUx
	MjxaQt5ecT51ltyP6f9xXPY4VcV4gRiAZdMbsdfYo7z5OS7YvaKhcTfOPq5FvKzt1FeDcbMtTjB+p
	aEDOLEyejhpG/V68AWUkYU3zmxTqXFqBHLh9fy3EebqwLG572ghl12FGdNrenu6CwaDYioUCWaPiM
	CvgH9OHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZmH7-0000000B6tb-2gyQ;
	Thu, 10 Jul 2025 08:05:01 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZlTa-0000000Axyi-38EV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Jul 2025 07:13:51 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B741C44176;
	Thu, 10 Jul 2025 07:13:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D023C4CEE3;
	Thu, 10 Jul 2025 07:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752131629;
	bh=1PZ5SYT8dRkcymT3/gj366sIXjNSe/oKNBKj+FH3zao=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=f7liWRLKF+YRv9KHpnqXc8KJJfHiKxyOMTbrf4C4eZLOzV18t8Z8ofdOCIkIpSfjd
	 QjwwFAS/CPeAASRC1DoCC2k8C9ZEtSRB60GCwhZk9OQJFhR8W3CglMyxGmmESsoRIL
	 UzSxbYpbOICcCujzD1mfSJKvQ++TcK5Ena+0BrPt/h/6JOuLAhzGIDeL+vjhYOWgXI
	 2xjCaIuea75KvEb/UOKsQrKc3AA4OlEehzaF5nmVyEB6hX7XZGil98DEUJPffpX4Rb
	 D32VrK3JfP3LBa27Efxq5OpODdxs0hx27s31b6i7QJcLxVSy5yXr2KZHuc/5iZlIZi
	 yJAKt7lEuWJVA==
Date: Thu, 10 Jul 2025 09:13:46 +0200
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, Jonas Karlman <jonas@kwiboo.se>, 
	Jernej Skrabec <jernej.skrabec@gmail.com>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Liu Ying <victor.liu@nxp.com>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>, 
	Philipp Zabel <p.zabel@pengutronix.de>, Hui Pu <Hui.Pu@gehealthcare.com>, 
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>, linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
Message-ID: <20250710-daffy-mini-booby-574fca@houat>
References: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-0-48920b9cf369@bootlin.com>
 <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-4-48920b9cf369@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="ksuiit4bl62avew6"
Content-Disposition: inline
In-Reply-To: <20250709-drm-bridge-alloc-getput-drm_bridge_get_next_bridge-v1-4-48920b9cf369@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250710_001350_823759_FC5C9146 
X-CRM114-Status: GOOD (  17.65  )
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


--ksuiit4bl62avew6
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 4/9] drm/omapdrm: use drm_bridge_chain_get_last_bridge()
MIME-Version: 1.0

On Wed, Jul 09, 2025 at 06:48:03PM +0200, Luca Ceresoli wrote:
> Use drm_bridge_chain_get_last_bridge() instead of open coding a loop with
> two invocations of drm_bridge_get_next_bridge() per iteration.
>=20
> Besides being cleaner and more efficient, this change is necessary in
> preparation for drm_bridge_get_next_bridge() to get a reference to the
> returned bridge.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
> ---
>  drivers/gpu/drm/omapdrm/omap_drv.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/omapdrm/omap_drv.c b/drivers/gpu/drm/omapdrm=
/omap_drv.c
> index 054b71dba6a75b8c42198c4b102a093f43a675a2..3bbcec01428a6f290afdfa40e=
f6f79629539a584 100644
> --- a/drivers/gpu/drm/omapdrm/omap_drv.c
> +++ b/drivers/gpu/drm/omapdrm/omap_drv.c
> @@ -378,12 +378,12 @@ static int omap_display_id(struct omap_dss_device *=
output)
>  	struct device_node *node =3D NULL;
> =20
>  	if (output->bridge) {
> -		struct drm_bridge *bridge =3D output->bridge;
> -
> -		while (drm_bridge_get_next_bridge(bridge))
> -			bridge =3D drm_bridge_get_next_bridge(bridge);
> +		struct drm_bridge *bridge =3D
> +			drm_bridge_chain_get_last_bridge(output->bridge->encoder);
> =20
>  		node =3D bridge->of_node;
> +
> +		drm_bridge_put(bridge);

Any reason you're not using __free(drm_bridge_put) here?

Maxime

--ksuiit4bl62avew6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCaG9oKgAKCRAnX84Zoj2+
dv+SAYD8WXoxdQImd1WsoY8Qa7eR03ok/mPvEvPAbyHoymKSL55M0Dxyg3aTw6DJ
SBzQpokBgJjlL8l44Tp0J8chUUsawNg8WYvr0GQO++AMrH0GWH7vZttF78pb1xGe
YlVI2cDkew==
=+6FN
-----END PGP SIGNATURE-----

--ksuiit4bl62avew6--

