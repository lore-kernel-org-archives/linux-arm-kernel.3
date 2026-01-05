Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 47332C79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 14:30:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m5a1q4+8KZ4VroTl8szIeT6DJLUnWji0vwzjJmPKVOY=; b=3MW6EeYwMP4yF/x8BWT+0Q799R
	Cush1NXFJ5kHZVKMg9Kp+e/DmE5jnov+zS0EITmCW07UgJu/Fg+2fvDaDUeWs7QCm8eW5MJZUNq8B
	CVSk46mVRHST0zgaKGMtdFJT43OipgQtHmFc8lr6L00msPDEpoceXNsShjyxHHtrFBTv5KimhWOuP
	my4TvHPiOxaHXqc+pN5I49DpmfrAAKrZquZq0BCiPTSYxF3aJnJRmGKC8sTxx1XjuxXLUHi2FgdRP
	2PnN205MJ0P358RK1PvE7t3jMPqXno/UQMlBeNZJq21LIdumTJj+fGpjN5n/aWC76WHLVtcF9II9R
	Sv9FCV7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclap-0000000BXE9-0kyf;
	Mon, 05 Jan 2026 14:29:59 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vclaj-0000000BXBM-3EAW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 14:29:56 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id 96213C1E486;
	Mon,  5 Jan 2026 14:29:23 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 8967F60726;
	Mon,  5 Jan 2026 14:29:49 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 9BBD0103C847C;
	Mon,  5 Jan 2026 15:29:40 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1767623388; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=m5a1q4+8KZ4VroTl8szIeT6DJLUnWji0vwzjJmPKVOY=;
	b=RT/UiyYEF8zOufF/RMp090pHJ3IBWOd4IbiXaTokdETQKrMOwK8Q8S2nZIFEcm1q63CHmV
	D08ZN1O3K/1Gs2xV+uE0bMucI+rbX1RqVtgt4MGGMn1AKSPqPRLs70HaBBQngw0tzHvfu0
	HUCwqMdkoZAydUqDN8ELrpazP6u4KUikTiPLwzPa1erGGDWdFePyrme9KN5cFNkjFRSC//
	NLlAMhDAxUNe/HzKmbxJnsGtmrWZInP+yWvx2+ecE05TJs/pIWEzfNTB3CCWUIyRXq7lmb
	7IpkvtZ1mpV3oOH4G5j0pzoFUC7DGbNC4qX92galMenfSPV+eKwOd+p3R0prog==
Date: Mon, 5 Jan 2026 15:29:39 +0100
From: Kory Maincent <kory.maincent@bootlin.com>
To: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Cc: "Jyri Sarha" <jyri.sarha@iki.fi>, "Tomi Valkeinen"
 <tomi.valkeinen@ideasonboard.com>, "Maarten Lankhorst"
 <maarten.lankhorst@linux.intel.com>, "Maxime Ripard" <mripard@kernel.org>,
 "Thomas Zimmermann" <tzimmermann@suse.de>, "David Airlie"
 <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Russell King" <linux@armlinux.org.uk>,
 "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony Lindgren" <tony@atomide.com>,
 "Andrzej Hajda" <andrzej.hajda@intel.com>, "Neil Armstrong"
 <neil.armstrong@linaro.org>, "Robert Foss" <rfoss@kernel.org>, "Laurent
 Pinchart" <Laurent.pinchart@ideasonboard.com>, "Jonas Karlman"
 <jonas@kwiboo.se>, "Jernej Skrabec" <jernej.skrabec@gmail.com>, "Markus
 Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, <dri-devel@lists.freedesktop.org>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <linux-arm-kernel@lists.infradead.org>, <linux-omap@vger.kernel.org>
Subject: Re: [PATCH v2 05/20] drm/tilcdc: Convert legacy panel binding via
 DT overlay at boot time
Message-ID: <20260105152939.49642d0a@kmaincent-XPS-13-7390>
In-Reply-To: <DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
References: <20251211-feature_tilcdc-v2-0-f48bac3cd33e@bootlin.com>
	<20251211-feature_tilcdc-v2-5-f48bac3cd33e@bootlin.com>
	<DF0K5UFX46JA.OH85T6IPC5MW@bootlin.com>
Organization: bootlin
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.41; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_062953_950953_9B038676 
X-CRM114-Status: GOOD (  35.75  )
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

Hello Luca,

Thank you for your full review on this series!

On Wed, 17 Dec 2025 15:23:26 +0100
"Luca Ceresoli" <luca.ceresoli@bootlin.com> wrote:
> > +config DRM_TILCDC_PANEL_LEGACY
> > +	bool "Support device tree blobs using TI LCDC Panel binding"
> > +	default n =20
>=20
> 'default' defaults to 'n', you can drop this line.
>=20
> However I think it should instead be enabled by default. You propose to
> entirely remove the tilcdc panel driver in the next patch, so any users
> without DRM_TILCDC_PANEL_LEGACY in their defconfig would be broken. For
> this reason, I propose to enable DRM_TILCDC_PANEL_LEGACY in all cases whe=
re
> the tilcdc_panel was compiled in, which I guess means:
>=20
>     default DRM_TILCDC
>=20
> Except I think if DRM_TILCDC=3Dm, DRM_TILCDC_PANEL_LEGACY should be =3Dy.=
 I
> don't know how to do that in Kconfig. But I'm not really sure about this
> last topic.

Just setting default to 'y' works for both cases TILCDC as a module or buil=
tin.=20

> > +	depends on DRM_TILCDC
> > +        depends on OF
> > +        depends on BACKLIGHT_CLASS_DEVICE
> > +        depends on PM
> > +	select OF_OVERLAY
> > +	select DRM_PANEL_SIMPLE
> > +	help
> > +	  Choose this option if you need a kernel that is compatible
> > +	  with device tree blobs using the obsolete "ti,tilcdc,panel"
> > +	  binding. If you find "ti,tilcdc,panel"-string from your DTB,
> > +	  you probably need this. Otherwise you do not. =20
>=20
> Maybe mention here what it does?
>=20
> For example, rewording your commit message:
>=20
>   Modifies the live device tree at early boot to convert the legacy
>   "ti,tilcdc,panel" devicetree node to the standard panel-dpi node.  This
>   allows to maintain backward compatibility for boards which were using t=
he
>   deprecated tilcdc_panel driver.

Ack, I will update it.

...

> > +static int __init tilcdc_panel_copy_props(struct device_node *old_pane=
l,
> > +					  struct device_node *new_panel)
> > +{
> > +	struct device_node *child, *old_timing, *new_timing, *panel_info;
> > +	u32 invert_pxl_clk =3D 0, sync_edge =3D 0;
> > +	struct property *prop;
> > +
> > +	/* Copy all panel properties to the new panel node */
> > +	for_each_property_of_node(old_panel, prop) {
> > +		if (!strncmp(prop->name, "compatible",
> > sizeof("compatible")))
> > +			continue;
> > +
> > +		tilcdc_panel_update_prop(new_panel, prop->name,
> > +					 prop->value, prop->length);
> > +	}
> > +
> > +	child =3D of_get_child_by_name(old_panel, "display-timings"); =20
>=20
> There's some housekeeping code in this function to ensure you put all the
> device_node refs. It would be simpler and less error prone to use a clean=
up
> action. E.g.:
>=20
> -	struct device_node *child, *old_timing, *new_timing, *panel_info;
>=20
> -	child =3D of_get_child_by_name(old_panel, "display-timings");
> +	struct device_node *child __free(device_node) =3D
> of_get_child_by_name(old_panel, "display-timings");

I am not used to this __free() macro and even some subsystem (net) are avoi=
ding
it but ok I will move to it. I don't know what are the pros and cons.

...

> > +	/* Copy all panel timing property to the new panel node */
> > +	for_each_property_of_node(old_timing, prop)
> > +		tilcdc_panel_update_prop(new_timing, prop->name,
> > +					 prop->value, prop->length);
> > +
> > +	panel_info =3D of_get_child_by_name(old_panel, "panel-info");
> > +	if (!panel_info)
> > +		return -EINVAL; =20
>=20
> tilcdc_panel_update_prop() has previously done various allocations which
> will not be freed if you return here. You shoudl probably do all the
> of_get_*() at the top, and if they all succeed start copying data along
> with with the needed allocations.

Ok.

...

> > +	ret =3D tilcdc_panel_copy_props(panel, new_panel);
> > +	if (ret)
> > +		goto overlay_remove;
> > +
> > +	/* Remove compatible property to avoid any driver compatible match
> > */
> > +	of_remove_property(panel, of_find_property(panel, "compatible",
> > +						   NULL));
> > +overlay_remove:
> > +	of_overlay_remove(&ovcs_id); =20
>=20
> Is it correct to remove the overlay here? Won't it remove what you have
> just added?

Indeed this should be only in the error path. That's weird that it was still
working during my tests.=20

>=20
> > +out:
> > +	of_node_put(new_panel);
> > +	of_node_put(panel);
> > +	of_node_put(lcdc); =20
>=20
> Here too you can use cleanup actions, even though the current code is
> slightly simpler than tilcdc_panel_copy_props as far as of_node_put() is
> concerned.

Ack.

Regards,
--=20
K=C3=B6ry Maincent, Bootlin
Embedded Linux and kernel engineering
https://bootlin.com

