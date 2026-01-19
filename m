Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 95A70D2ECE6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 21:19:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:From:
	To:Cc:Subject:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+zd79SvLMG1hly2QtcgDamJi4UDVLpEodKvpOQbHx3E=; b=NlhIvhex9Y0m3KUe0grD4zMKj0
	SCdy5btzRxKsJOLksSpu4AJNRYiSo9HVhuRKGXk7CfrFIcg9Dyyqkp49jPrhTe+s3fw08MkSof052
	ZdFB6CSwwWmePtn5QhArW1+Lssw4Z3VE29yR37XXbcTR/YLDuVZYDE+1HcZ1vUL01nrWNtlm5ixto
	7v0bnNgMhcHDmNnxSMZuBxecc8/2emQ0r/o+KtFeQ7y7Hm4MX70GjJ+jfVYCnrBavkZn1YyLABsGW
	xpn8D5Ximy5z63E71q0wT2S2CJ9HxMO++k6nkZSXP48USCAiQOFY+sspufrrmOzQoDPzOk6SlrHaC
	NYlDMfOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhwf1-00000002sl7-3OLR;
	Mon, 19 Jan 2026 21:19:43 +0000
Received: from smtpout-02.galae.net ([185.246.84.56])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhweu-00000002sjG-3bYu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 21:19:39 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-02.galae.net (Postfix) with ESMTPS id 80F661A29A6;
	Mon, 19 Jan 2026 21:19:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id 5349460731;
	Mon, 19 Jan 2026 21:19:34 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id CB8AB10B68B40;
	Mon, 19 Jan 2026 22:19:26 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1768857572; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=+zd79SvLMG1hly2QtcgDamJi4UDVLpEodKvpOQbHx3E=;
	b=Cx1fTB/anyFkJSlJojV05GGAUS8Rrrj2qHPs3Cw9BTX1xfq2a0z1psGb46PsIiLjSWtdXG
	6+3qiW2HEbVTQTvxQBBE+UuWJuWhvGMc0vYGoiYgklXHi2JgcgD3fJBWDdqGnWRU9npwcB
	uR9urfBFw0wc2ShFmN9TPUAEcUf75mOjPy+SAjkkxHLu2EEwWt7Ywsodvqg7brBq/xl5D+
	QURco2CNWXdR/C5VD8fo+1LMcE4l2zvNGfgv+QK/3Oluj1JCCC0ShO+jUu7Io0ignMKtJt
	FkC+Jtrtqmhen15CTNLMjNxnMDBMqo3AIZrivQFMN0DcBqeELvnb+y4R9SVkGA==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Mon, 19 Jan 2026 22:19:26 +0100
Message-Id: <DFSVOBV5UY37.3HTQHOJT3A40N@bootlin.com>
Subject: Re: [PATCH v4 18/25] drm/tilcdc: Convert to DRM managed resources
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
X-Mailer: aerc 0.20.1
References: <20260116-feature_tilcdc-v4-0-2c1c22143087@bootlin.com>
 <20260116-feature_tilcdc-v4-18-2c1c22143087@bootlin.com>
In-Reply-To: <20260116-feature_tilcdc-v4-18-2c1c22143087@bootlin.com>
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_131938_058976_1D92F9DC 
X-CRM114-Status: GOOD (  22.76  )
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

On Fri Jan 16, 2026 at 6:02 PM CET, Kory Maincent (TI.com) wrote:
> Convert the tilcdc driver to use DRM managed resources (drmm_* APIs)
> to eliminate resource lifetime issues, particularly in probe deferral
> scenarios.
>
> This conversion addresses potential use-after-free bugs by ensuring
> proper cleanup ordering through the DRM managed resource framework.
> The changes include:
> - Replace drm_crtc_init_with_planes() with drmm_crtc_alloc_with_planes()
> - Replace drm_universal_plane_init() with drmm_universal_plane_alloc()
> - Replace drm_simple_encoder_init() with drmm_simple_encoder_alloc()
> - Remove manual cleanup in tilcdc_crtc_destroy() and error paths
> - Remove drm_encoder_cleanup() from encoder error handling paths
> - Use drmm_add_action_or_reset() for remaining cleanup operations
>
> This approach is recommended by the DRM subsystem for improved resource
> lifetime management and is particularly important for drivers that may
> experience probe deferral.
>
> Signed-off-by: Kory Maincent (TI.com) <kory.maincent@bootlin.com>
> ---
>
> Change in v4:
> - Newt patch.

Why? Adding patches along the way does not help getting your series merged
timely. If there's a good reason for adding a new patch, please mention it
here.

> -void tilcdc_crtc_destroy(struct drm_crtc *crtc)
> +static void tilcdc_crtc_destroy(struct drm_device *dev, void *data)
>  {
> -	struct tilcdc_drm_private *priv =3D ddev_to_tilcdc_priv(crtc->dev);
> +	struct tilcdc_drm_private *priv =3D (struct tilcdc_drm_private *)data;
>
> -	tilcdc_crtc_shutdown(crtc);
> +	tilcdc_crtc_shutdown(priv->crtc);
>
>  	flush_workqueue(priv->wq);
>
> -	of_node_put(crtc->port);
> -	drm_crtc_cleanup(crtc);
> +	of_node_put(priv->crtc->port);
>  }
>
>  int tilcdc_crtc_update_fb(struct drm_crtc *crtc,
> @@ -714,7 +714,6 @@ static void tilcdc_crtc_reset(struct drm_crtc *crtc)
>  }
>
>  static const struct drm_crtc_funcs tilcdc_crtc_funcs =3D {
> -	.destroy        =3D tilcdc_crtc_destroy,
>  	.set_config     =3D drm_atomic_helper_set_config,
>  	.page_flip      =3D drm_atomic_helper_page_flip,
>  	.reset		=3D tilcdc_crtc_reset,
> @@ -960,12 +959,27 @@ int tilcdc_crtc_create(struct drm_device *dev)
>  {
>  	struct tilcdc_drm_private *priv =3D ddev_to_tilcdc_priv(dev);
>  	struct tilcdc_crtc *tilcdc_crtc;
> +	struct tilcdc_plane *primary;
>  	struct drm_crtc *crtc;
>  	int ret;
>
> -	tilcdc_crtc =3D devm_kzalloc(dev->dev, sizeof(*tilcdc_crtc), GFP_KERNEL=
);
> -	if (!tilcdc_crtc)
> -		return -ENOMEM;
> +	primary =3D tilcdc_plane_init(dev);
> +	if (IS_ERR(primary)) {
> +		dev_err(dev->dev, "Failed to initialize plane: %pe\n", primary);
> +		return PTR_ERR(primary);
> +	}
> +
> +	tilcdc_crtc =3D drmm_crtc_alloc_with_planes(dev, struct tilcdc_crtc, ba=
se,
> +						  &primary->base,
> +						  NULL,
> +						  &tilcdc_crtc_funcs,
> +						  "tilcdc crtc");
> +	if (IS_ERR(tilcdc_crtc)) {
> +		dev_err(dev->dev, "Failed to init CRTC: %pe\n", tilcdc_crtc);
> +		return PTR_ERR(tilcdc_crtc);
> +	}
> +
> +	tilcdc_crtc->primary =3D primary;

(*) see below

>
>  	init_completion(&tilcdc_crtc->palette_loaded);
>  	tilcdc_crtc->palette_base =3D dmam_alloc_coherent(dev->dev,
> @@ -978,10 +992,6 @@ int tilcdc_crtc_create(struct drm_device *dev)
>
>  	crtc =3D &tilcdc_crtc->base;
>
> -	ret =3D tilcdc_plane_init(dev, &tilcdc_crtc->primary);
> -	if (ret < 0)
> -		goto fail;
> -
>  	mutex_init(&tilcdc_crtc->enable_lock);
>
>  	init_waitqueue_head(&tilcdc_crtc->frame_done_wq);
> @@ -989,20 +999,12 @@ int tilcdc_crtc_create(struct drm_device *dev)
>  	spin_lock_init(&tilcdc_crtc->irq_lock);
>  	INIT_WORK(&tilcdc_crtc->recover_work, tilcdc_crtc_recover_work);
>
> -	ret =3D drm_crtc_init_with_planes(dev, crtc,
> -					&tilcdc_crtc->primary,
> -					NULL,
> -					&tilcdc_crtc_funcs,
> -					"tilcdc crtc");
> -	if (ret < 0)
> -		goto fail;
> -
>  	drm_crtc_helper_add(crtc, &tilcdc_crtc_helper_funcs);
>
> +	ret =3D drmm_add_action_or_reset(dev, tilcdc_crtc_destroy, priv);
> +	if (ret)
> +		return ret;

Not related to your patch, but if the dmam_alloc_coherent() (not visible in
the diff) fails, tilcdc_crtc_destroy() won't be called. Is this intended?
At first sight this drmm_add_action_or_reset() should be moved at (*), just
after the allocation.

However being not related to your patch I'd leave this for another series
anyway, to avoid making this series a moving target.

> +
>  	priv->crtc =3D crtc;
>  	return 0;
> -
> -fail:
> -	tilcdc_crtc_destroy(crtc);
> -	return ret;
>  }

I find this patch hard to read and I think because it is converting
multiple things at once. Splitting it in small steps would have been nice,
even thought I'm not 100% sure it would have been doable.

Nevertheless it looks correct, so:

Reviewed-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

Luca

--
Luca Ceresoli, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

