Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 948E6606A327
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Oct 2026 11:25:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=JlmUPyMV;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=AN0kYifX
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=; b=JlmUPyMVkFLJ2+6+MxUS1iS9P5
	kG6sdj5+54Q+IBP5Ohu0D5qmg6fqixDujEY+wWakzPvyPGfnamsLhb+WBWQvhSargFFo5L0UptSQT
	edR7r5HaRVDj5G1dTMsINllSqrcDUY03x50GyIvjR2ECgkMjWPMz08IP6JSBFdsQXr/MzMyFW+EWw
	9KuL0lJUiI8Fn2O5MQ5rBFRSktcRDkgfmHokDrJI5ohzVjjk4Txulwc8LrOA0nO5spFEXLcKtOpFI
	MwaxZNZZCKpfgbsPM4Y87/ymqFd3h95XVLrV6jG/YCrl/+ScESnkbt0swXkhfE/SdeB3WnO0S2ecn
	LQ0bERtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7y7-00000009XMx-0R0m;
	Tue, 20 Oct 2026 11:25:23 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJ7y3-00000009XLj-3pz5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Oct 2026 11:25:21 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-35829219da8so815725eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 20 Oct 2026 04:25:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792495519; x=1793100319; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=;
        b=AN0kYifX9SRHHqErzwxZTX1lOfshGG8ItR4gok0Syew0/kU5EbI8a8igBUJn34IjGP
         A1T5UuBEmA+h9OljFk8HFtcgUVW1Qa4VPK5b+xvpsZxjCQfG6gfhz+iSxtKF3SDgV7I7
         rRC/MM6BTj8XisWrW8GBXM9Oh7gdOvj7bazJrFiDVM7SNvciwpLu2fGlm+hLukjtuL4/
         Def/29pLjT75P25J0iawK8z3jvVLIguiFSmTtSHER1OdqA4gJqlf953+6zzlPd7Fi59M
         J9Ve5Z12xpA0sphi2slPVIrJ36wBrsUtmrZGy2aQNsZFAJUUkavu/c0h0edb/rC8+Fl/
         U6qg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792495519; x=1793100319;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:from
         :date:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=4DDHfULZCMXfKJmNIYoOvk990SrMTlrtJb/r57iKJOo=;
        b=TEcwjAXnY1PG/2V0iXcdBv5Z60S6uq1xoOA0ChCcngA1xwyOKQE2xkm4gLtDVK3LC1
         5yxvUgqKESZ6xYGXC5pArePMYnBv1837dI5jeW4gRvOleB7ujE2Scxzo6Ozgggm5H1k1
         Sq+M30MnKKbXURSHxXw8U6KrnyS5jjPqy+BcqBvuYvOlXSPFxXW7AM05mu4DWtZpzcYj
         KfJZ/DRFU7hCdkMU5NkW/9glic4SKcUEdnzvmjGpmbtIFJaz+g6IHIShFCSfn+5KzB6E
         bC9nl+7+BEEBW3hZHgZ3Y2Zx5YOTkCbjEomWwNEio03I8E0W4Hx5vTtBgfrVtK8ur9zx
         gHZg==
X-Forwarded-Encrypted: i=1; AKwUvBzz/1rT70vnEkjnd+HuUCzJjCEoHq44Fw6iMH62qzgF1ENzEgjSssAqVV1OMqX5Q/+5dQM4RDtL5dhBLqKAAzBw@lists.infradead.org
X-Gm-Message-State: AFq9FYKmrH0IygSF+lNLa2fyPZEw1y4dKxaqZ1H4bSxom6lUK7L1j2gW
	+vYx4DzGyGaFWqUAhR69GvISx6IevxWjXumORaC/24sD67yZPbLbUupn
X-Gm-Gg: AYBFou3lVA5drv1mgk0Dcmj1O8CMq9hs36ed9ytrbq6/wmhAA/xoWumkTns+wtn/wTk
	bMD67H+imfXSpK2z387no6ST6b84G8Ouf3Eqp51k5h0SpvFfw4gElzh6eupLb9E+9iYE4LV2kTo
	NHjXsxiZzDYBtoWOmzdUKeQD+otT1z3PNjwX1LdC8jz+EbGP576+Z1/6Aqbz++cNA2psGzHKHnf
	a9fSbAaGmoxv4Od21aXY7UKTRBAsghOOk49hLUB+suQpLQTIsunSTWKmeRl566+Em75gVGgyjVT
	KMZl5Upgd0+xYPe+QCPzF0XzWj/zPmRr9nWvUQyDl083LezuafZe4hcqJV8DN2qFyLtSTiNFcyC
	/i9D/N+4w6ZJJrwWgW4q4LDLBcoakfAoBRtD8Hb5RZZvCcmq2coDMsgzoI3BEUUkingCGMFsYYn
	1QH7nfPvmLaDpwbkWHPuoAbrlVlJ4kpwjKhe0Bj4t2cGv4inTCc7Ud8OH+sEaBD+tCG+RELy9nD
	TtU
X-Received: by 2002:a05:701b:4553:20b0:17a:a3d4:8b17 with SMTP id a92af1059eb24-18db9f2cfbbmr2343488c88.12.1792495518528;
        Tue, 20 Oct 2026 04:25:18 -0700 (PDT)
Received: from leonardoc-nb ([67.159.246.222])
        by smtp.gmail.com with ESMTPSA id a92af1059eb24-1831b75be5esm48988354c88.16.2026.10.20.04.25.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Oct 2026 04:25:17 -0700 (PDT)
Date: Tue, 20 Oct 2026 08:25:10 -0300
From: Leonardo Costa <leoreis.costa@gmail.com>
To: sashiko-reviews@lists.linux.dev, 
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Andrzej Hajda <andrzej.hajda@intel.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, Frank Li <Frank.li@oss.nxp.com>, 
	Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Luca Ceresoli <luca.ceresoli@bootlin.com>, David Airlie <airlied@gmail.com>, 
	Simona Vetter <simona@ffwll.ch>, Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
	Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, dri-devel@lists.freedesktop.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	Leonardo Costa <leonardo.costa@toradex.com>
Subject: Re: [PATCH v2 2/3] drm/bridge: simple-bridge: Support
 data-enable-active endpoint property
Message-ID: <svnjkyubpps5ocerr3pdaylmhsvlo44olqax7fcco2hahahocd@xnvocnkddfu6>
References: <20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com>
 <20261019-v2-apalis-imx6-enable-vga-v2-2-ef6a3a780472@toradex.com>
 <sashiko-outbox-176995@kernel.org>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <sashiko-outbox-176995@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261020_042519_961646_79825555 
X-CRM114-Status: GOOD (  38.53  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-7.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=no
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Mon, Oct 19, 2026 at 10:34:06AM +0000, sashiko-bot@kernel.org wrote:
> Thank you for your contribution! Sashiko AI review found 2 potential issue(s) to consider:
> - [High] drm/bridge: simple-bridge: missing atomic_check() to propagate DE bus flags
> - [Medium] drm/bridge: simple-bridge: timings devm_kzalloc() lifetime mismatch
> --
> 
> commit 17d03fa8dcd99e5bb3af7da622344c856ca2c887
> Author: Leonardo Costa <leonardo.costa@toradex.com>
> 
> drm/bridge: simple-bridge: Support data-enable-active endpoint property
> 
> This commit reads the data-enable-active property from the input endpoint in
> simple_bridge_probe() and allocates a drm_bridge_timings structure to set
> DRM_BUS_FLAG_DE_HIGH or DRM_BUS_FLAG_DE_LOW in input_bus_flags when the bridge
> does not already define its own timings.
> 
> > diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
> > index 3fba7002322e9..393228bed6e28 100644
> > --- a/drivers/gpu/drm/bridge/simple-bridge.c
> > +++ b/drivers/gpu/drm/bridge/simple-bridge.c
> > @@ -171,6 +171,9 @@ static int simple_bridge_probe(struct platform_device *pdev)
> >  {
> >  	struct simple_bridge *sbridge;
> >  	struct device_node *remote;
> > +	struct device_node *ep;
> > +	bool de_present;
> > +	u32 de;
> >  
> >  	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
> >  					bridge, &simple_bridge_bridge_funcs);
> > @@ -208,10 +211,26 @@ static int simple_bridge_probe(struct platform_device *pdev)
> >  		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
> >  				     "Unable to retrieve enable GPIO\n");
> >  
> > -	/* Register the bridge. */
> >  	sbridge->bridge.of_node = pdev->dev.of_node;
> >  	sbridge->bridge.timings = sbridge->info->timings;
> >  
> > +	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
> > +	de_present = !of_property_read_u32(ep, "data-enable-active", &de);
> > +	of_node_put(ep);
> > +
> > +	if (de_present && !sbridge->bridge.timings) {
> > +		struct drm_bridge_timings *timings;
> > +
> > +		timings = devm_kzalloc(&pdev->dev, sizeof(*timings), GFP_KERNEL);
> > +		if (!timings)
> > +			return -ENOMEM;
> 
> [Severity: Medium]
> Can allocating timings with devm_kzalloc() in simple_bridge_probe() cause a
> lifetime mismatch with sbridge->bridge?
> 
> sbridge is allocated via devm_drm_bridge_alloc(), which manages the container's
> lifetime through sbridge->bridge.refcount and only frees it in
> __drm_bridge_free() after all drm_bridge references are dropped:
> 
> drivers/gpu/drm/drm_bridge.c:__drm_bridge_free()
> 	if (bridge->funcs->destroy)
> 		bridge->funcs->destroy(bridge);
> 
> 	drm_bridge_put(bridge->next_bridge);
> 
> 	kfree(bridge->container);
> 
> If pdev is unbound while an upstream bridge or encoder still holds a reference
> to sbridge->bridge, devres_release_all() will free timings immediately, leaving
> sbridge->bridge.timings as a dangling pointer that can be dereferenced by
> upstream drivers (for example, in imx8mp_hdmi_pvi_bridge_enable()).
> 
> Would embedding struct drm_bridge_timings inside struct simple_bridge (as done
> in lvds-codec.c and ti-tfp410.c), or pointing to static const
> drm_bridge_timings instances for DRM_BUS_FLAG_DE_HIGH and DRM_BUS_FLAG_DE_LOW,
> avoid this lifetime mismatch?

This seemed to make sense to me, but I'm having trouble implementing either of
Sashiko's suggestions in a proper way, as both seemed problematic to me when
actually trying to make the changes. 

Adding static const drm_bridge_timings instances for each of the flags goes
against the current pattern of using these to list configurations of actual
pieces of hardware.

On the other hand, embedding struct drm_bridge_timings inside
struct simple_bridge leads to duplicating information in the driver. It would
look something like in the diff below. In this case, when the bridge provides
a timings struct, the embedded drm_bridge_timings needs to receive a copy of it,
despite serving no purpose in this situation, it seems to me to add too much
complexity.

Laurent, do you think this is still better than adding a compatible for the
Apalis iMX6 VGA bridge, as was done in V1? Let me know if you think any of
these concerns are not actual issues, or if you think there is a pattern that
better fits this driver.

Best regards,
Leonardo

diff --git a/drivers/gpu/drm/bridge/simple-bridge.c b/drivers/gpu/drm/bridge/simple-bridge.c
index 848c2df2a276..9787eb7f7b82 100644
--- a/drivers/gpu/drm/bridge/simple-bridge.c
+++ b/drivers/gpu/drm/bridge/simple-bridge.c
@@ -28,6 +28,7 @@ struct simple_bridge_info {
 struct simple_bridge {
 	struct drm_bridge	bridge;
 	struct drm_connector	connector;
+	struct drm_bridge_timings timings;
 
 	const struct simple_bridge_info *info;
 
@@ -183,6 +184,8 @@ static int simple_bridge_probe(struct platform_device *pdev)
 {
 	struct simple_bridge *sbridge;
 	struct device_node *remote;
+	struct device_node *ep;
+	u32 de;
 
 	sbridge = devm_drm_bridge_alloc(&pdev->dev, struct simple_bridge,
 					bridge, &simple_bridge_bridge_funcs);
@@ -220,10 +223,24 @@ static int simple_bridge_probe(struct platform_device *pdev)
 		return dev_err_probe(&pdev->dev, PTR_ERR(sbridge->enable),
 				     "Unable to retrieve enable GPIO\n");
 
-	/* Register the bridge. */
 	sbridge->bridge.of_node = pdev->dev.of_node;
 	sbridge->bridge.timings = sbridge->info->timings;
 
+	if (sbridge->info->timings)
+		sbridge->timings = *sbridge->info->timings;
+
+	ep = of_graph_get_endpoint_by_regs(pdev->dev.of_node, 0, -1);
+
+	if (!of_property_read_u32(ep, "data-enable-active", &de) &&
+	    !sbridge->bridge.timings) {
+		sbridge->timings.input_bus_flags |= de ? DRM_BUS_FLAG_DE_HIGH :
+							 DRM_BUS_FLAG_DE_LOW;
+		sbridge->bridge.timings = &sbridge->timings;
+	}
+
+	of_node_put(ep);
+
+	/* Register the bridge. */
 	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
 }

> > +
> > +		timings->input_bus_flags = de ? DRM_BUS_FLAG_DE_HIGH :
> > +						DRM_BUS_FLAG_DE_LOW;
> > +		sbridge->bridge.timings = timings;
> > +	}
> 
> [Severity: High]
> Will setting only sbridge->bridge.timings->input_bus_flags actually propagate
> the DE polarity to upstream atomic encoders and bridges?
> 
> simple_bridge_bridge_funcs registers atomic state callbacks without an
> .atomic_check callback:
> 
> drivers/gpu/drm/bridge/simple-bridge.c:
> static const struct drm_bridge_funcs simple_bridge_bridge_funcs = {
> 	.atomic_create_state = drm_atomic_helper_bridge_create_state,
> 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
> 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
> 	.attach		= simple_bridge_attach,
> 	.atomic_enable = simple_bridge_enable,
> 	.atomic_disable = simple_bridge_disable,
> };
> 
> During an atomic modeset, drm_atomic_bridge_chain_check() calls
> drm_atomic_bridge_propagate_bus_flags(), which overwrites
> bridge_state->input_bus_cfg.flags with output_flags from the downstream bridge
> or connector (0 for a VGA connector) and never checks
> bridge->timings->input_bus_flags:
> 
> drivers/gpu/drm/drm_bridge.c:drm_atomic_bridge_propagate_bus_flags()
> 	bridge_state->output_bus_cfg.flags = output_flags;
> 	...
> 	bridge_state->input_bus_cfg.flags = output_flags;
> 
> Because simple-bridge has a valid drm_bridge_state, upstream bridges and atomic
> encoders such as imx_pd_bridge_atomic_check() in
> drivers/gpu/drm/imx/ipuv3/parallel-display.c read
> next_bridge_state->input_bus_cfg.flags instead of
> next_bridge->timings->input_bus_flags:
> 
> drivers/gpu/drm/imx/ipuv3/parallel-display.c:imx_pd_bridge_atomic_check()
> 	if (next_bridge_state)
> 		bus_flags = next_bridge_state->input_bus_cfg.flags;
> 	else
> 		bus_flags = di->bus_flags;
> 
> As a result, bus_flags remains 0 instead of DRM_BUS_FLAG_DE_LOW or
> DRM_BUS_FLAG_DE_HIGH.
> 
> Should simple_bridge_bridge_funcs implement an .atomic_check callback that
> copies sbridge->bridge.timings->input_bus_flags into
> bridge_state->input_bus_cfg.flags (similar to tfp410_atomic_check() in
> drivers/gpu/drm/bridge/ti-tfp410.c)?
> 
> > +
> > +	/* Register the bridge. */
> >  	return devm_drm_bridge_add(&pdev->dev, &sbridge->bridge);
> >  }
> 
> -- 
> Sashiko AI review · https://sashiko.dev/#/patchset/20261019-v2-apalis-imx6-enable-vga-v2-0-ef6a3a780472@toradex.com?part=2

This second finding was a false positive, as per my response in the 3/3
patch.

