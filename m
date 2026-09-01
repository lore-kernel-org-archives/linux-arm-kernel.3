Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 997F8C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:54:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D5q76no92pCRz4RMP87fQFgo06TZrFbHeiSpbSuujY4=; b=hLbgyoklGX1gb4rYYdaYZWa9+I
	pHOm0cpsJIrXW6ma+GJl0OpMYMn8mHGUT4Cn7F/HQl10vbnsm+dOu3VArCicO+ljmu5/uc6j3o/ON
	OHXHv196CvISHhwW3+Qh+bcooCjSnq0uCT9oN1SVj2XprJxIzA5cEIzvdKD4v5wZylgNxa7wGgFKQ
	6eNSRN71N1aycsqRTF6YGyykeVMXKLyH38Wn5i/dOkCQ8H5XLGrTevC6P8NwTKYUidJYD+UMbvkWH
	9lhf9reQq0nyMsRIBs60u3fmD90hunnnSlT2AFh44V0yVij4v5+RfJL5XkbxMF3p/r9GHx4sd0cwe
	/FWQdK0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TcE-0000000D6He-1rnn;
	Tue, 01 Sep 2026 18:53:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1Ta4-0000000D1bc-3pJF;
	Tue, 01 Sep 2026 18:51:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=D5q76no92pCRz4RMP87fQFgo06TZrFbHeiSpbSuujY4=; b=B3uzgQCnzPlG3HrcDe0+pg1uR6
	m+qwGzTmCI9cg6omoff1F3naXXDtK642t7bgVGgPTosx1MBKCRvbK9cci3RvgCha87QO/bZG+R5MJ
	W8Qsr3OZ0EgFhMKCrOppAQxgQBuQzf9cnzl5L85wkQHGCI8KeUNoyWJqyKrgVxVTwx0JKjq7PHmQ6
	QPY8qMdWoC2XoN6CoFSo9eegMMMeuf9Wnou3LuhsBATvz65sWAN2PGmcQ1CrXjuZDK2dMDsWeMaNQ
	STaQIwFfaCWL3EJG2KwxzUB57jx8xh745PLG3NesAuFuA/9Qvmw9XiqrUS56IMnxKlkg8y0neSNmU
	oAQv4REg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1Ta1-0000000BHi9-3nIe;
	Tue, 01 Sep 2026 18:51:35 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288692;
	bh=WvZHGQUwLNHlXVJXJUmzneooB/o/bop5PxCRNXVE6KM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=br+Zi4pP1ctJ5jk3Zd/d0C1FvBB8sGMDTi9ZzhwG+4N3JJYx6yxT/ho+eFIx6jwRE
	 S68UKJ6ZNbyhxXrJPvB1qfceuPZMkNcIUqlW0R4nW8Gp+41uwSUOGf9AXeU70BoxYK
	 JuoikA8BdRQinLW8CUxG4wzwrSLllB6g7HEsc11DsLwApx4dXil3f75cVOsycTs2K9
	 gruAPO8T/Vq2Vy/LUxYnSvRa9U4q+ofleEOlhmzkhdJs7MLLFXJL5ZxkQqIiBMjxJU
	 GxNZxUlSXeBN/nEQZS2n6X0+7P/LR+jrMVfrF7CDVRGNirXZcnGvoQguKkdyalkmBI
	 ILMT1zN1PowFg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 8A0DA17E3CA1;
	Tue, 01 Sep 2026 20:51:32 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:34 +0300
Subject: [PATCH v11 70/74] drm/connector: Drop redundant hdmi
 supported_formats field
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-70-bc12954a0688@collabora.com>
References: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
In-Reply-To: <20260901-dw-hdmi-qp-scramb-v11-0-bc12954a0688@collabora.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 Dmitry Baryshkov <lumag@kernel.org>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>, Chen-Yu Tsai <wens@kernel.org>, 
 Samuel Holland <samuel@sholland.org>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Raphael Gallais-Pou <rgallaispou@gmail.com>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, Algea Cao <algea.cao@rock-chips.com>, 
 Daniel Stone <daniels@collabora.com>, Liu Ying <victor.liu@nxp.com>, 
 Phong LE <ple@baylibre.com>, Helge Deller <deller@gmx.de>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org, 
 linux-sunxi@lists.linux.dev, linux-rockchip@lists.infradead.org, 
 linux-fbdev@vger.kernel.org, Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195134_315765_A7B1025B 
X-CRM114-Status: GOOD (  13.19  )
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

Now that all users migrated to the new drmm_connector_hdmi_init()
signature, supported_formats is provided through struct
drm_connector_hdmi_funcs, a reference to which is already stored in
drm_connector_hdmi.

Drop the redundant field from drm_connector_hdmi and point its users to
hdmi.funcs->supported_formats instead.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 3 ++-
 drivers/gpu/drm/drm_connector.c                 | 3 ---
 include/drm/drm_connector.h                     | 6 ------
 3 files changed, 2 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 289dce6c6281..687793c62d55 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -428,7 +428,8 @@ sink_supports_format_bpc(const struct drm_connector *connector,
 		return false;
 	}
 
-	if (!(connector->hdmi.supported_formats & BIT(format))) {
+	if (!connector->hdmi.funcs ||
+	    !(connector->hdmi.funcs->supported_formats & BIT(format))) {
 		drm_dbg_kms(dev, "%s format unsupported by the connector.\n",
 			    drm_hdmi_connector_get_output_format_name(format));
 		return false;
diff --git a/drivers/gpu/drm/drm_connector.c b/drivers/gpu/drm/drm_connector.c
index 4d580aaec247..db4d8daacfa0 100644
--- a/drivers/gpu/drm/drm_connector.c
+++ b/drivers/gpu/drm/drm_connector.c
@@ -617,9 +617,6 @@ int drmm_connector_hdmi_init(struct drm_device *dev,
 	if (ret)
 		return ret;
 
-	/* TODO: remove after conversion to new drmm_connector_hdmi_init() */
-	connector->hdmi.supported_formats = hdmi_funcs->supported_formats;
-
 	/*
 	 * The supported HDMI version can be used to determinate the maximum
 	 * TMDS character rate allowed by the specification. Some controllers,
diff --git a/include/drm/drm_connector.h b/include/drm/drm_connector.h
index 182946279194..d0aaa87dad7b 100644
--- a/include/drm/drm_connector.h
+++ b/include/drm/drm_connector.h
@@ -2192,12 +2192,6 @@ struct drm_connector_hdmi_audio {
  * struct drm_connector_hdmi - DRM Connector HDMI-related structure
  */
 struct drm_connector_hdmi {
-	/**
-	 * @supported_formats: Bitmask of @drm_output_color_format
-	 * supported by the controller.
-	 */
-	unsigned long supported_formats;
-
 	/**
 	 * @max_tmds_char_rate: Maximum TMDS character rate, in Hz,
 	 * supported by the controller.

-- 
2.55.0


