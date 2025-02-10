Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C682FC0219E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Feb 2025 19:40:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GQHzHaGuLex597rtUln9xcTUWwbbjj2n6s255mKdpQU=; b=vUCIKFjHKjddqIQwAdaKMZSjzo
	M+cqNt4qoRixgbN9Lr5sWsqBtX8zeSKcQIvlfnC92q+5ztZPYI2/e+LuNEAdREsEoQS0vNOT0F0Vi
	vxl1f3YHLrSOISOf5KvF59GmtHy70ilM9LA52s15zCDsvBSfR+Cq9WfWr6i7D0XWuIBxny9qANX2/
	qKdn6M+oYtZsq25qhd/gJm/XifAAGgoq5iBXPpB7zNNHz2TyockXUiT+MivVNjgpYxhnA1xVU68B/
	eihd7ZpE9DlpIrkjs3qIgRvnAoEFsyJI2/LU2ot6Bcl6vHsOxR4aOBWOhwQRYuw5tLbERA/ho4SLh
	U1c+G2tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thZeA-00000001AWb-2CeB;
	Mon, 10 Feb 2025 19:40:46 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYRn-00000000uIN-0mln
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 10 Feb 2025 18:23:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=GQHzHaGuLex597rtUln9xcTUWwbbjj2n6s255mKdpQU=; b=KRlMlOfnd3kEENAOiE9a3HrMEe
	rZ9rgX0PkThPUQt9w1IAYc7wWhnUxX9wUPcYUExFgf0qW/rejGkE2hfM49Lj7NiR2uSgHh1wRGebO
	8NC71M3fOnit0mIkaICeQP9emlsMZrL1JC1/APa5W3kRSqWvjH05ATFTmiYxJXuoMsfUDA4BhcLfc
	4eU+w8YQ6C8ZxEpeNq6Goqb6sKPVCxWW40RbQR+KOU3/6gTIb3/+syn+QMQ0VGKSsuSFNVubMOl70
	IfdsAl4cAEGiWaTtvGS0pfaWgWRqXgF8Kao+FIxv9XfCODkwdkdKJHKBD4gLjvujPksLgBCPWaF6Y
	wxFhqqOg==;
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thYRk-00000000Cc5-0LyU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Feb 2025 18:23:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2BC3AA41F64;
	Mon, 10 Feb 2025 18:22:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CF350C4CEEB;
	Mon, 10 Feb 2025 18:23:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739211830;
	bh=oYaoNIca/prrl6BbAu9QFMCD9Wkhq7BkULEeqssB7Bs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=D2evZvDm6o+cP6BrTglQP35ObWhuCuDK/FcZISz+0R5Kf3YzsV9ZAsdZek9eua8k2
	 2PI3jfczob2R0shNArMq12gB+zCqAjNLgBEzHZ1xyFT0g00Q1AWp32mKKeAihEVspG
	 c5iI09SYNlvyLtCZjQdkPMKlu2/jEqr+SZc+JkVt/ESIyIUmZRj/hS8a4E0qm16dpH
	 MjhhFZNZp/ZOawzjKiEFvhP9vnD0rQG94ni4b+ou9Nu2X7M6kNZanCQ1VIjxEgPgG9
	 GlmDfmt4VT3wRLIyHI51b4Ml7/jZ+WaMFdEw/l2R8kTWOSSKkjFxt3sr9UP+Zd0T0S
	 1fXHpKEEkW8kg==
Date: Mon, 10 Feb 2025 19:23:47 +0100
From: Maxime Ripard <mripard@kernel.org>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
Message-ID: <20250210-bronze-copperhead-of-faith-12d0a9@houat>
References: <20250206-hotplug-drm-bridge-v6-0-9d6f2c9c3058@bootlin.com>
 <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha384;
	protocol="application/pgp-signature"; boundary="etdpmgzxb265ivsl"
Content-Disposition: inline
In-Reply-To: <20250206-hotplug-drm-bridge-v6-11-9d6f2c9c3058@bootlin.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250210_182352_437163_E8268AC7 
X-CRM114-Status: GOOD (  31.62  )
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


--etdpmgzxb265ivsl
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v6 11/26] drm/bridge: samsung-dsim: use
 devm_drm_of_get_bridge[_by_node] to find the out_bridge
MIME-Version: 1.0

On Thu, Feb 06, 2025 at 07:14:26PM +0100, Luca Ceresoli wrote:
> In order to support panels described either via graph links or via a
> subnode (e.g. "panel@0"), this driver uses low-level deprecated functions
> to find the next bridge. The resulting logic is complex and duplicates co=
de
> already present in the DRM bridge core. Switch to the new APIs in DRM
> bridge core that allow to do the same in a much cleaner way.
>=20
> Note there are two slight changes in the new logic intended to improve the
> final result:
>=20
>  * the old code looks for a subnode with any name except "port" or "ports=
",
>    while the new code uses the node passed as a parameter
>=20
>  * the old code looks for a subnode first and falls back to a graph link,
>    while the new code uses the reverse order because graph links are the
>    recommended device tree representation now
>=20
> The first change makes the code more robust by avoiding the risk of using
> an unrelated node which is not describing a panel and not names "port" or
> "ports".
>=20
> The second change is not expected to expose regressions because, in the
> cases where both a subnode and a graph link are used to describe a panel,
> the graph link should point to the subnode itself, such as in
> arch/arm64/boot/dts/qcom/sdm850-lenovo-yoga-c630.dts
>=20
> As a further cleanup, use a temporary variable to assign dsi->out_bridge
> only on success. This avoids the risk of leaving a non-NULL value in
> dsi->out_bridge when samsung_dsim_host_attach() fails.
>=20
> Suggested-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>
>=20
> ---
>=20
> This patch was added in v6.
> ---
>  drivers/gpu/drm/bridge/samsung-dsim.c | 55 ++++++-----------------------=
------
>  1 file changed, 9 insertions(+), 46 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/samsung-dsim.c b/drivers/gpu/drm/brid=
ge/samsung-dsim.c
> index f8b4fb8357659018ec0db65374ee5d05330639ae..bbd0a4f5a3f52b61bf48f10d6=
e8ca741bffa5e46 100644
> --- a/drivers/gpu/drm/bridge/samsung-dsim.c
> +++ b/drivers/gpu/drm/bridge/samsung-dsim.c
> @@ -1704,55 +1704,16 @@ static int samsung_dsim_host_attach(struct mipi_d=
si_host *host,
>  	const struct samsung_dsim_plat_data *pdata =3D dsi->plat_data;
>  	struct device *dev =3D dsi->dev;
>  	struct device_node *np =3D dev->of_node;
> -	struct device_node *remote;
> -	struct drm_panel *panel;
> +	struct drm_bridge *out_bridge;
>  	int ret;
> =20
> -	/*
> -	 * Devices can also be child nodes when we also control that device
> -	 * through the upstream device (ie, MIPI-DCS for a MIPI-DSI device).
> -	 *
> -	 * Lookup for a child node of the given parent that isn't either port
> -	 * or ports.
> -	 */
> -	for_each_available_child_of_node(np, remote) {
> -		if (of_node_name_eq(remote, "port") ||
> -		    of_node_name_eq(remote, "ports"))
> -			continue;
> +	out_bridge =3D devm_drm_of_get_bridge(dev, np, 1, 0);
> +	if (IS_ERR(out_bridge) && PTR_ERR(out_bridge) !=3D -EPROBE_DEFER)
> +		out_bridge =3D devm_drm_of_get_bridge_by_node(dev, device->dev.of_node=
);
> =20

For the same reason I mentioned earlier, this is inherently unsafe if
the bridge device goes away but the DRM device doesn't.

Maxime

--etdpmgzxb265ivsl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iJUEABMJAB0WIQTkHFbLp4ejekA/qfgnX84Zoj2+dgUCZ6pEMwAKCRAnX84Zoj2+
doYqAX0ZaluJTI4PSfPTqVMOAG5TZK+XUyRofxt6QFR9rI9Q4sU0nkYYSkhQYgjF
pn8pQS0BgNQjNe0c2Ynpkp6HpXjapBAAkIo35EtMoD45WFYl09nft0+VjWBNwrN4
vaCFaeigwA==
=lqhs
-----END PGP SIGNATURE-----

--etdpmgzxb265ivsl--

