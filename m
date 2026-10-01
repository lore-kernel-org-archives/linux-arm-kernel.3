Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0876BCA5FB3
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 08:11:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1iEXv1MzdrgaIRYlO6IHAkcD/PzrlJhsiGovH6P/zgo=; b=i41vwFzmECfGgmPnIzbIoDnl/F
	mxrl/WfMV/hIU2eVmJ8dKkM2752p8M9CDExeWccrvGIh+gkONzBJdzXBi1QM8Ylhokgwl26mbjtlw
	xc/p2hIYnn0ycybf6vxiRzErWe/kv6kjURw6DNahmD2fuwcX0J3pn7NGkacgQNKcv4z/GhnZJPJt5
	MlUAyeZhiTP8ms60CCeYTmn/XqaTf4sbnTztligGfc67tNfxqeNcVlZwVMG0G90qp+74kCM6wgAMf
	EfoVSRQ6UVw/YELocff0PWYeYh1amCTTSCx+NhnXXes90J8AbesAv8f45/Fs6EGRX4fg5J95tozKi
	kSW0SQEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBsa-000000086CU-05Gh;
	Thu, 01 Oct 2026 08:11:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCBsZ-000000086C3-19s9
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 01 Oct 2026 08:10:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Transfer-Encoding
	:Content-Type:References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=1iEXv1MzdrgaIRYlO6IHAkcD/PzrlJhsiGovH6P/zgo=; b=gOhpvQxPxa0NIH8ZHdKzTOijOY
	Q/+lszN5W3Y3fh198bB6rU29oNMwVfBNcy3bgC+4gqSh5nAxBLkg2KzD1dn15dYgZ14wzW6xvlNSz
	0SuTJ1iza/l1GZ3tUV4XDTKfdkxQH1Z/NE26UHckd0DTUaLk8Alia59USgsiPdeqRviZ5o3t/rYWq
	ReyXZqqEFPr5OD1aBeM0DrGULsdxt37zokBrAQVC12C0l5bNWBlPAy0JXl6rSNoHKD/CLeaGfL5C0
	HwADg94aYq6a1F/rb7ZPKgVwWxeZdplb9leX2lwSlIq0MVVzn/l+AsdmwjhAnYadO9nGy/kbYobdF
	nUrVHvcQ==;
Received: from smtpout-02.galae.net ([185.246.84.56])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xCBsW-00000004iL6-12LV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 08:10:58 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id E8C4C1A10A2;
	Thu,  1 Oct 2026 08:10:53 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id B9F4760341;
	Thu,  1 Oct 2026 08:10:53 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id F17D9103290CF;
	Thu,  1 Oct 2026 10:10:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790842251; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=1iEXv1MzdrgaIRYlO6IHAkcD/PzrlJhsiGovH6P/zgo=;
	b=TaSfPzZYx75PUEp1as/SOZwnqw+vAb7IWcXpDNW4dcPjGWosHLHT0VabrjEwdirzGLZqS7
	jngsLORTHpV8vfvGRDoN2XYRLPUa/cKaRJsPaG4C5Z/GJM+oWP8zPu72qnbLinphCk6jQD
	lFeEGgtltO2wtzB5QDOd3k2mgohWRf6yuY6ZL7mrJkKAU5mx/VnWo4CDFGKPNeF4V5FtKs
	W8JoNWgykWDPmsDm7bUxT1xs16ZZMLTFYZppy0yfI5F2h5WqrNaOuUVER/Mwy6gwC5ndKM
	pJnQwLqsQATFwFnLgpEIG1H1fCDMPjuXdWg1tHwMw6Fl4SDe1KklXU8Ty3Rq8Q==
Message-ID: <3fdc30dfdddfb5f529398541aefe92ae86a07b3e.camel@bootlin.com>
Subject: Re: [PATCH v2 4/7] drm/bridge: dw-mipi-dsi2: stop using deprecated
 devm_drm_of_get_bridge()
From: Paul Cercueil <paul.cercueil@bootlin.com>
To: Luca Ceresoli <luca.ceresoli@bootlin.com>, Maarten Lankhorst	
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>, 
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Frank Li	 <Frank.Li@nxp.com>, Sascha Hauer
 <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng	
 <zhengxingda@iscas.ac.cn>, Andrzej Hajda <andrzej.hajda@intel.com>, Neil
 Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>,
 Laurent Pinchart	 <Laurent.pinchart@ideasonboard.com>, Jonas Karlman
 <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, Dave
 Stevenson <dave.stevenson@raspberrypi.com>,  =?ISO-8859-1?Q?Ma=EDra?= Canal
	 <mcanal@igalia.com>, Raspberry Pi Kernel Maintenance	
 <kernel-list@raspberrypi.com>, Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>,
 Thomas Petazzoni	 <thomas.petazzoni@bootlin.com>,
 dri-devel@lists.freedesktop.org, 	imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, 	linux-kernel@vger.kernel.org,
 linux-renesas-soc@vger.kernel.org
Date: Thu, 01 Oct 2026 10:10:40 +0200
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v2-4-6da431d8f180@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v2-0-6da431d8f180@bootlin.com>
	 <20260929-drm-fix-of_get_bridge-build-regression-v2-4-6da431d8f180@bootlin.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261001_091056_527245_EB98D5D9 
X-CRM114-Status: GOOD (  18.75  )
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

Hi Luca (and not Lucas, sorry),

Le mardi 29 septembre 2026 =C3=A0 15:39 +0200, Luca Ceresoli a =C3=A9crit=
=C2=A0:
> devm_drm_of_get_bridge() is deprecated, switch to
> of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() retur=
ns
> a refcounted bridge, ensure it is put by using bridge.next_bridge.
>=20
> Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Reviewed-by: Paul Cercueil <paul.cercueil@bootlin.com>

With one nitpick below.

>=20
> ---
>=20
> Changes in v2:
> - fix bridge reference leak on attach error and detach paths
> ---
> =C2=A0drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c | 11 +++++------
> =C2=A01 file changed, 5 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> index 7fd2f1e60654..eb7d5713bd28 100644
> --- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> +++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
> @@ -192,7 +192,6 @@ struct cmd_header {
> =C2=A0struct dw_mipi_dsi2 {
> =C2=A0	struct drm_bridge bridge;
> =C2=A0	struct mipi_dsi_host dsi_host;
> -	struct drm_bridge *panel_bridge;
> =C2=A0	struct device *dev;
> =C2=A0	struct regmap *regmap;
> =C2=A0	struct clk *pclk;
> @@ -528,12 +527,12 @@ static int dw_mipi_dsi2_host_attach(struct mipi_dsi=
_host
> *host,
> =C2=A0	dsi2->format =3D device->format;
> =C2=A0	dsi2->mode_flags =3D device->mode_flags;
> =C2=A0
> -	bridge =3D devm_drm_of_get_bridge(dsi2->dev, dsi2->dev->of_node, 1, 0);
> +	bridge =3D of_drm_get_bridge_by_endpoint(dsi2->dev->of_node, 1, 0);
> =C2=A0	if (IS_ERR(bridge))
> =C2=A0		return PTR_ERR(bridge);
> =C2=A0
> =C2=A0	bridge->pre_enable_prev_first =3D true;
> -	dsi2->panel_bridge =3D bridge;
> +	dsi2->bridge.next_bridge =3D bridge;
> =C2=A0
> =C2=A0	drm_bridge_add(&dsi2->bridge);
> =C2=A0
> @@ -547,6 +546,7 @@ static int dw_mipi_dsi2_host_attach(struct mipi_dsi_h=
ost
> *host,
> =C2=A0
> =C2=A0err_remove_bridge:
> =C2=A0	drm_bridge_remove(&dsi2->bridge);
> +	drm_bridge_clear_and_put(&dsi2->bridge.next_bridge);
> =C2=A0	return ret;
> =C2=A0}
> =C2=A0
> @@ -564,8 +564,7 @@ static int dw_mipi_dsi2_host_detach(struct mipi_dsi_h=
ost
> *host,
> =C2=A0	}
> =C2=A0
> =C2=A0	drm_bridge_remove(&dsi2->bridge);
> -
> -	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
> +	drm_bridge_clear_and_put(&dsi2->bridge.next_bridge);
> =C2=A0
> =C2=A0	return 0;
> =C2=A0}
> @@ -884,7 +883,7 @@ static int dw_mipi_dsi2_bridge_attach(struct drm_brid=
ge
> *bridge,
> =C2=A0	encoder->encoder_type =3D DRM_MODE_ENCODER_DSI;
> =C2=A0
> =C2=A0	/* Attach the panel-bridge to the dsi bridge */
> -	return drm_bridge_attach(encoder, dsi2->panel_bridge, bridge,
> +	return drm_bridge_attach(encoder, dsi2->bridge.next_bridge, bridge,
> =C2=A0				 flags);

Same remark as for the patch 3/7, it would look a bit better to have the
'bridge' moved to the second line.

Cheers,
-Paul

