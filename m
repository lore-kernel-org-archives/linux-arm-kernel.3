Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC2F4C0219B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 18:38:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6V9XdmICxp4Hexya/nQkhPgoydXLp1nIO5M4c0d4YnY=; b=UEThpT8KT0l+8CcgvRZGqJmIxn
	vAOZ3luUNVMNo+JfNxOtl9oRD+Sa4ehYOyMZqhUcCOefE/H+cefB2oO3XTC9htP7KPiCnO//67vtu
	UdmnhvF6kFtiEn8b1jk4ctcUZ74FNCAzp28P4R8oZzfBIg1yRFI3uu5GbTAyKGZE+WcZYvF+gRkDG
	DkX2LP1HEqw5/pI4UpW4k/juObumPzZStb+OM5ciVEIpCPXsDow+CCXCSfeyV2sz3JgnpbPmIWYJG
	SSdMxJhgNBiPNbCsiztzOghpLvt6xVtd/D1CQevMzTglqqYbuwOoYPT8abvuVJVFr0aq/HaldXg7S
	ybtbgQsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thYfw-00000000xRv-3BgI;
	Mon, 10 Feb 2025 18:38:32 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYbp-00000000wDc-1E4T
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:34:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DC8A75C55BF;
	Mon, 10 Feb 2025 18:33:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A5E6DC4CED1;
	Mon, 10 Feb 2025 18:34:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739212456;
	bh=ktJrQgrd5tNbtyj+LrP9zGWCOfkEzbfTm6w/svlvBbM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o5Wk+kBV1aZJtbf3H7CfmLvS51rq9NiYwCuz4IDx8h1ik9VzGoglngQaCFpN6OLJA
	 skaqSgw/OGOXMym8t5hnoX1PkEt8RUDx8j/okhPpwGqisL2hEMFLsDmJB3TC+jwVJi
	 ef1TeaYrPbDnyDDRg8tKmv//f4XDEy5i7n91v+CbnePoWvNIr3tnJ44+GKOXpTU22i
	 G8/m1x3AXaDb8KwR9S8+xLkAQ3Cgw0iw2ZPSAA89UycoX5S/+DKF+e1XsBhJ0E1zGE
	 NjQzLVAOn5wRf9LVcv8lWSgejbM7F2BRm0zlvJkM59yAjBeokQLuHIakhVk4bDEeRa
	 3UwFxcrReNcTw==
Date: Mon, 10 Feb 2025 19:34:13 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
Message-ID: <20250210-amusing-bobcat-of-pluck-0d4c09@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="fcofu4bb2ss3srog"
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-8-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_103417_416788_65686E86 
X-CRM114-Status: GOOD (  32.99  )
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


--fcofu4bb2ss3srog
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 08/26] drm/bridge: panel: add a panel_bridge to every
 panel
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 07:14:23PM +0100, Luca Ceresoli wrote:
> Adding a panel does currently not add a panel_bridge wrapping it. Usually
> the panel_bridge creation happens when some other driver (e.g. the previo=
us
> bridge or the encoder) calls *_of_get_bridge() and the following element =
in
> the pipeline is a panel.
>=20
> This has some drawbacks:
>=20
>  * the panel_bridge is not created in the context of the driver of the
>    underlying physical device (the panel driver), but of some other driver
>  * that "other driver" is not aware of whether the returned drm_bridge
>    pointer is a panel_bridge created on the fly, a pre-existing
>    panel_bridge or a non-panel bridge
>  * removal of a panel_bridge requires calling drm_panel_bridge_remove(),
>    but the "other driver" doesn't know whether this is needed because it
>    doesn't know whether it has created a panel_bridge or not
>=20
> So far this approach has been working because devm and drmm ensure the
> panel bridge would be dealloacted at some later point. However with the
> upcoming implementation of dynamic bridge lifetime this will get more
> complicated.
>=20
> Correct removal of a panel_bridge might possibly be obtained by adding mo=
re
> devm/drmm technology to have it freed correctly at all times. However this
> would add more complexity and not help making lifetime more understandabl=
e.
>=20
> Use a different approach instead: always create a panel_bridge with a
> drm_panel, thus matching the lifetime of the drm_panel and the panel_brid=
ge
> wrapping it. This makes lifetime much more straightforward to understand
> and to further develop on.
>=20
> With the panel_bridge always created, the functions to get a bridge
> [devm_drm_of_get_bridge() and drmm_of_get_bridge()] become simpler because
> the bridge they are looking for exists already (if it can exist at all). =
In
> turn, this is implemented based on a variant of
> drm_of_find_panel_or_bridge() that only looks for panels:
> of_drm_find_bridge_by_endpoint(). In the future
> drm_of_find_panel_or_bridge() can be progressively removed because there
> will never be a panel not exposing a bridge.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/panel.c | 74 +++++++++++++++++++++++++++++++++---=
------
>  include/drm/drm_panel.h        |  8 +++++
>  2 files changed, 66 insertions(+), 16 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/panel.c b/drivers/gpu/drm/bridge/pane=
l.c
> index 58570ff6952ca313b3def084262c9bb3772272ef..6995de605e7317dd1eb153afd=
475746ced764712 100644
> --- a/drivers/gpu/drm/bridge/panel.c
> +++ b/drivers/gpu/drm/bridge/panel.c
> @@ -69,6 +69,9 @@ EXPORT_SYMBOL(drm_panel_init);
>   */
>  void drm_panel_add(struct drm_panel *panel)
>  {
> +	panel->bridge =3D drm_panel_bridge_add(panel);
> +	WARN_ON(!panel->bridge);
> +
>  	mutex_lock(&panel_lock);
>  	list_add_tail(&panel->list, &panel_list);
>  	mutex_unlock(&panel_lock);
> @@ -86,6 +89,9 @@ void drm_panel_remove(struct drm_panel *panel)
>  	mutex_lock(&panel_lock);
>  	list_del_init(&panel->list);
>  	mutex_unlock(&panel_lock);
> +
> +	drm_panel_bridge_remove(panel->bridge);
> +	panel->bridge =3D NULL;
>  }
>  EXPORT_SYMBOL(drm_panel_remove);

Given that drm_panel_add and drm_panel_remove are typically called at
probe/remove, it's pretty much equivalent to using devm. Both of these
solutions aren't safe, and the drm_panel lifetime is still broken.

I'd rather work on a solution that actually fixes those lifetime issues.

Maxime

--fcofu4bb2ss3srog
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pGpQAKCRAnX84Zoj2+
dupmAX0QCqXAlwjOigazwjLqLppxgT//Mch4tKS4d4c1SuZ5OCPF+108O+yXaidt
tq6KGDwBf1aBzn4NygKkr+X8NMETD8f58JqWfuEBykbqP2ZhQvQgM/RII/JgW0QQ
gJXXs7dFkQ==
=CCam
-----END PGP SIGNATURE-----

--fcofu4bb2ss3srog--

