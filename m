Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 02AACC531C7
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jul 2026 01:40:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ljZhm7Vil1v/VyKyAEmw32W6blvRn8EYWBxnxQZ13zw=; b=FQduJdW41DuF2ZepAJwBJ2eU1g
	PzgeUvvEFE6gzKXVZrrkN+E1F9Bqy0YP5GkLGGzUa865pUHW4L7oIPAkDQvnmrqJ1A24Zko2PcNxB
	ihyyvnoCxCb7tOXF46X+sBbzB3pBa55JIZ07rNI30vwcppLG55OCs+uUBCoM2AzAO8RI6LeryB3MG
	Erw5/U40cmr1DkPnsPawZZM3jBYHrUiX+1wJV+EnYIeug8i7GjMJAp/T3uQRvOq7N6ZBeCs6003qs
	dug+++QGi7h4IsAyLAwCnnj9qYfiS3YY3NcBWM3BehI5/JktYKypk15akqmdhX1euj33f7968ijQW
	OzDhBLEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiPt-0000000D8OL-1eOB;
	Thu, 23 Jul 2026 01:40:05 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLo-0000000D3wE-0vyi;
	Thu, 23 Jul 2026 01:35:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=ljZhm7Vil1v/VyKyAEmw32W6blvRn8EYWBxnxQZ13zw=; b=uD6j5TLUA/4v3HYHcs8TD3bou5
	O0q2krUBnwYb+TGgk97RwFZ6YRKyTlkH7s7gnmFWQthwq6dsJHdANypn97tVTvqjq0uahEhOqj79o
	M60e8HXHRUdwwZ6PxJu+Mc3nFqt59UEtYQIJDGNtUlFOlKKTei7hZGlxUsN98xf9c0AlTm3mcbE61
	18te6ah3tobwmfs9pdPVZf723Xe65Jmsr4X6DsRt5f4U+88Zlx6vbDg2dVRh67VEcLXK4A4L5yJD4
	efeB5xyZgfoONWeKutcQXHGGkuQOmNx51v8gWMbv3ltdjhqLK5jH6tGNapPWBIY/yMnnIyqZsO+YY
	b5haYXEg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmiLk-0000000Gvp3-1idd;
	Thu, 23 Jul 2026 01:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1784770542;
	bh=Vzp/F64fnw8CoCJzCh5PzH4mTKY3HeFosa5V4jydq3U=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=V9zXrI47HQ20zWxnutO1JDlPbsbcFgwhWlZ9cjKrYh7jn/EIdBZLdA6fu/TKuA/Rm
	 8Y3TjrM3oEu69RGH7tjIdX66HZMn8wPp4T5DNI9hw5MxzW1A6xS3fDROwVXTc/0mhL
	 /xvO5lLBzigFi9hV3SPA1dD3/r7WY+HbU7/2MklPBsHzWqq9bjKZ4NUReQn+8S6Vv7
	 tQAbRgF5J/CtZUWj6wa2ayKRcX0Xx4UnR43F8jQ67qGozoNViwpErxHlwwo5WZIWT1
	 Y+munhl5hIPQ7DBhSUsf9UC6lUPpMPKAxxMhlwgkatG9nCnotNDV43WSh7gg5Dhnia
	 Cj0oWgQhXcDGw==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7344117E374A;
	Thu, 23 Jul 2026 03:35:42 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Thu, 23 Jul 2026 04:35:47 +0300
Subject: [PATCH v9 58/61] drm/connector: Remove drmm_connector_hdmi_ini2()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260723-dw-hdmi-qp-scramb-v9-58-4fb12ea22ac9@collabora.com>
References: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
In-Reply-To: <20260723-dw-hdmi-qp-scramb-v9-0-4fb12ea22ac9@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Chen-Yu Tsai <wens@kernel.org>, Samuel Holland <samuel@sholland.org>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260723_023548_533377_17F1D1A4 
X-CRM114-Status: GOOD (  11.15  )
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

All callers have been converted to the new drmm_connector_hdmi_init()
signature.  Remove the transitional drmm_connector_hdmi_ini2() function,
its declaration, its EXPORT_SYMBOL() and its kernel-doc.

Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/drm_connector.c | 104 ----------------------------------------
 include/drm/drm_connector.h     |   9 ----
 2 files changed, 113 deletions(-)

diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 96cca0ca64bd..d424d245ef71 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -694,110 +694,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 }
 EXPORT_SYMBOL(drmm_connector_hdmi_init);
 
-/**
- * drmm_connector_hdmi_ini2 - Init a preallocated HDMI connector
- * @dev: DRM device
- * @connector: A pointer to the HDMI connector to init
- * @vendor: HDMI Controller Vendor name
- * @product: HDMI Controller Product name
- * @funcs: callbacks for this connector
- * @hdmi_funcs: HDMI-related callbacks for this connector
- * @connector_type: user visible type of the connector
- * @ddc: optional pointer to the associated ddc adapter
- * @supported_formats: Bitmask of @drm_output_color_format listing supported output formats
- * @max_bpc: Maximum bits per char the HDMI connector supports
- *
- * Initialises a preallocated HDMI connector. Connectors can be
- * subclassed as part of driver connector objects.
- *
- * Cleanup is automatically handled with a call to
- * drm_connector_cleanup() in a DRM-managed action.
- *
- * The connector structure should be allocated with drmm_kzalloc().
- *
- * The @drm_connector_funcs.destroy hook must be NULL.
- *
- * Returns:
- * Zero on success, error code on failure.
- */
-int drmm_connector_hdmi_ini2(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
-			     unsigned long supported_formats,
-			     unsigned int max_bpc)
-{
-	int ret;
-
-	if (!vendor || !product)
-		return -EINVAL;
-
-	if ((strlen(vendor) > DRM_CONNECTOR_HDMI_VENDOR_LEN) ||
-	    (strlen(product) > DRM_CONNECTOR_HDMI_PRODUCT_LEN))
-		return -EINVAL;
-
-	if (!(connector_type == DRM_MODE_CONNECTOR_HDMIA ||
-	      connector_type == DRM_MODE_CONNECTOR_HDMIB))
-		return -EINVAL;
-
-	if (!supported_formats || !(supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_RGB444)))
-		return -EINVAL;
-
-	if (connector->ycbcr_420_allowed != !!(supported_formats & BIT(DRM_OUTPUT_COLOR_FORMAT_YCBCR420)))
-		return -EINVAL;
-
-	if (!(max_bpc == 8 || max_bpc == 10 || max_bpc == 12))
-		return -EINVAL;
-
-	if (!hdmi_funcs->avi.clear_infoframe ||
-	    !hdmi_funcs->avi.write_infoframe ||
-	    !hdmi_funcs->hdmi.clear_infoframe ||
-	    !hdmi_funcs->hdmi.write_infoframe)
-		return -EINVAL;
-
-	ret = drmm_connector_init(dev, connector, funcs, connector_type, ddc);
-	if (ret)
-		return ret;
-
-	connector->hdmi.supported_formats = supported_formats;
-	strtomem_pad(connector->hdmi.vendor, vendor, 0);
-	strtomem_pad(connector->hdmi.product, product, 0);
-
-	/*
-	 * drm_connector_attach_max_bpc_property() requires the
-	 * connector to have a state.
-	 */
-	if (connector->funcs->atomic_create_state) {
-		struct drm_connector_state *state;
-
-		state = connector->funcs->atomic_create_state(connector);
-		if (IS_ERR(state))
-			return PTR_ERR(state);
-
-		connector->state = state;
-	} else if (connector->funcs->reset) {
-		connector->funcs->reset(connector);
-	}
-
-	drm_connector_attach_max_bpc_property(connector, 8, max_bpc);
-	connector->max_bpc = max_bpc;
-
-	if (max_bpc > 8)
-		drm_connector_attach_hdr_output_metadata_property(connector);
-
-	ret = drm_connector_attach_color_format_property(connector, supported_formats);
-	if (ret)
-		return ret;
-
-	connector->hdmi.funcs = hdmi_funcs;
-
-	return 0;
-}
-EXPORT_SYMBOL(drmm_connector_hdmi_ini2);
-
 /**
  * drm_connector_attach_edid_property - attach edid property.
  * @connector: the connector
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 61ba20296f6a..b80cc667604e 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2670,15 +2670,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
 			     int connector_type,
 			     struct i2c_adapter *ddc);
-int drmm_connector_hdmi_ini2(struct drm_device *dev,
-			     struct drm_connector *connector,
-			     const char *vendor, const char *product,
-			     const struct drm_connector_funcs *funcs,
-			     const struct drm_connector_hdmi_funcs *hdmi_funcs,
-			     int connector_type,
-			     struct i2c_adapter *ddc,
-			     unsigned long supported_formats,
-			     unsigned int max_bpc);
 void drm_connector_attach_edid_property(struct drm_connector *connector);
 int drm_connector_register(struct drm_connector *connector);
 int drm_connector_dynamic_register(struct drm_connector *connector);

-- 
2.55.0


