Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 969F3E6BF35
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Jan 2026 19:31:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:
	Subject:From:To:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZLGyw2o+DLXAyrrWouaf03BW3C9KjQLxvXzg8AfGBkc=; b=Y4Eh2mjlZyCZrAMXGxoauI0lX/
	OT42m19u0mvykYaghzYCafsJHEc1FAr8PA9HSERb/YkZ4J/vqEkOmRXwdZBPpBbiTHL8IG53FZOqC
	uyYMsnxJUlE9SHRPpHpb1SGLaen6rODSaqq97s57hu6ceYWgpqes3hMvj5x0xwUozMjYpv3bu0yl3
	g1zlnUWitI7YzZluEPIP/Ha++TaMQr7QZW/qaEUxhJ4lNJNFlG47bGu8dYjlNsHuVVQmNQ8h33RHu
	e8rA7lHKvi8vipA1K1Z5XOGTEqGrbKDr2Ri+H6oxTza+fEMFgxZjTit47wxQzHVuapqBFHcqwx/Ba
	xlLjp5nQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluDR-00000001tJt-3Eky;
	Fri, 30 Jan 2026 19:31:37 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vluDM-00000001tJ9-1S7Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Jan 2026 19:31:36 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 06A1D1A2B42;
	Fri, 30 Jan 2026 19:31:29 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB8EF6075A;
	Fri, 30 Jan 2026 19:31:28 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8D4BE119A8855;
	Fri, 30 Jan 2026 20:31:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1769801487; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=ZLGyw2o+DLXAyrrWouaf03BW3C9KjQLxvXzg8AfGBkc=;
	b=RagN86tKQ/gbF5s6lgXDNrwDwkAtcfIcyWKBZ/427DEGvTml7qFCOGlm7qU9H3xeccpd9a
	fbMUyPOkF1UckSQH7EPlH7WpBElj8VSUIwK5tImGGeeTe8wObzfBiA+GWQADzvU/EJeuio
	Tn9NpGBZ+Xr1EwsIfShumDydhik97QxJFPW10mUjhLJQmroNE9Vg9/gDAXf4ySEOYO+f0K
	JiFu/HOf6YPSrXkxQuKMHVPE0lKtUc+qJs0sQPfNNJEK4Dj4NCfK0+zxJndYU5XBOljfRP
	jGl+/mIyAK2jmTBzOKyheM/VCANoLuyq3PerhlB05Gd6xma6Lnh1eRm6pQ1fIA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 30 Jan 2026 20:31:11 +0100
Message-Id: <DG269FV5MZ8I.2VFNJXA0N2Y26@bootlin.com>
Cc: "Markus Schneider-Pargmann" <msp@baylibre.com>, "Bajjuri Praneeth"
 <praneeth@ti.com>, "Louis Chauvet" <louis.chauvet@bootlin.com>, "Thomas
 Petazzoni" <thomas.petazzoni@bootlin.com>, "Miguel Gazquez"
 <miguel.gazquez@bootlin.com>, "Herve Codina" <herve.codina@bootlin.com>,
 <dri-devel@lists.freedesktop.org>, <devicetree@vger.kernel.org>,
 <linux-kernel@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-omap@vger.kernel.org>
To: "Kory Maincent (TI.com)" <kory.maincent@bootlin.com>, "Jyri Sarha"
 <jyri.sarha@iki.fi>, "Tomi Valkeinen" <tomi.valkeinen@ideasonboard.com>,
 "Maarten Lankhorst" <maarten.lankhorst@linux.intel.com>, "Maxime Ripard"
 <mripard@kernel.org>, "Thomas Zimmermann" <tzimmermann@suse.de>, "David
 Airlie" <airlied@gmail.com>, "Simona Vetter" <simona@ffwll.ch>, "Rob
 Herring" <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>,
 "Conor Dooley" <conor+dt@kernel.org>, "Russell King"
 <linux@armlinux.org.uk>, "Bartosz Golaszewski" <brgl@bgdev.pl>, "Tony
 Lindgren" <tony@atomide.com>, "Andrzej Hajda" <andrzej.hajda@intel.com>,
 "Neil Armstrong" <neil.armstrong@linaro.org>, "Robert Foss"
 <rfoss@kernel.org>, "Laurent Pinchart" <Laurent.pinchart@ideasonboard.com>,
 "Jonas Karlman" <jonas@kwiboo.se>, "Jernej Skrabec"
 <jernej.skrabec@gmail.com>
From: "Luca Ceresoli" <luca.ceresoli@bootlin.com>
Subject: Re: [PATCH v5 20/25] drm/tilcdc: Use devm_drm_of_get_bridge()
 helper
X-Mailer: aerc 0.20.1
References: <20260123-feature_tilcdc-v5-0-5a44d2aa3f6f@bootlin.com>
 <20260123-feature_tilcdc-v5-20-5a44d2aa3f6f@bootlin.com>
In-Reply-To: <20260123-feature_tilcdc-v5-20-5a44d2aa3f6f@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260130_113132_521583_F8A224C2 
X-CRM114-Status: GOOD (  16.87  )
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

Hi Kory,

On Fri Jan 23, 2026 at 5:12 PM CET, Kory Maincent (TI.com) wrote:
> Replace drm_of_find_panel_or_bridge() with the newer
> devm_drm_of_get_bridge() helper which simplifies the code by:
> - Automatically handling both panel and bridge cases internally
> - Managing the panel-to-bridge conversion when needed
> - Using devres for resource management, eliminating manual cleanup
>
> This removes the need for explicit panel-to-bridge conversion via
> devm_drm_panel_bridge_add_typed() and the associated error handling path.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>

I'm OK with this patch, based on the v4 discussion. I have a question
however, see below.

> --- a/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
> +++ b/drivers/gpu/drm/tilcdc/tilcdc_encoder.c
> @@ -55,15 +55,12 @@ int tilcdc_encoder_create(struct drm_device *ddev)
>  	struct tilcdc_drm_private *priv =3D ddev_to_tilcdc_priv(ddev);
>  	struct tilcdc_encoder *encoder;
>  	struct drm_bridge *bridge;
> -	struct drm_panel *panel;
> -	int ret;
>
> -	ret =3D drm_of_find_panel_or_bridge(ddev->dev->of_node, 0, 0,
> -					  &panel, &bridge);
> -	if (ret =3D=3D -ENODEV)
> +	bridge =3D devm_drm_of_get_bridge(ddev->dev, ddev->dev->of_node, 0, 0);
> +	if (PTR_ERR(bridge) =3D=3D -ENODEV)
>  		return 0;
> -	else if (ret)
> -		return ret;
> +	else if (IS_ERR(bridge))
> +		return PTR_ERR(bridge);
>
>  	encoder =3D drmm_simple_encoder_alloc(ddev, struct tilcdc_encoder,
>  					    base, DRM_MODE_ENCODER_NONE);
> @@ -73,12 +70,5 @@ int tilcdc_encoder_create(struct drm_device *ddev)
>  	}
>  	priv->encoder =3D encoder;
>
> -	if (panel) {
> -		bridge =3D devm_drm_panel_bridge_add_typed(ddev->dev, panel,
> -							 DRM_MODE_CONNECTOR_DPI);

You are introducing a subtle difference here: while you pass the connector
type to devm_drm_panel_bridge_add_typed(), devm_drm_of_get_bridge() does
not take it and expects it to ahve been set previously and errors out if it
hasn't.

Can you ensure the connector type is alway set before this
devm_drm_of_get_bridge() call?

All the changes to the driver in the previous patches of this series make
it hard to find that out from here.

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

