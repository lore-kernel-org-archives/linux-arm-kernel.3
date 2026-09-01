Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 553A3C624D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:53:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sNYdn9OZQ6wtZ/i/e7RFUhdRPOE4lJ9rjfaR+WZElgA=; b=ZaeQd9a2DZ8RKbmato1m2whZjC
	TKdtxP8JKS/T+TGlL7FTixeCQGGQzex18cetOHSu6xHln1PLuApRBY6iCzfhhzWTA3Faec2FaHJN2
	UMCFVuTJXcwCGqu+p7fW27DICNqR6Ap+g0QPJiCO4hx05zNiWOrQYjxnD+sXX0Z64IRyNd7th0hsF
	qqlIA+dUwvzJ++Mw9SWQhbUUrwpzYwD29tl1o96sqfYereXy9wXIH32HhYYq693Q2LXz7+w+LxJgK
	EProklNu0inT44ruaS2F5bTqTaNKJdnpPDuT8fTnbbfv2a/fAccrRYLfvlsKcVzs1M2lVt10BaZhV
	sbMSfepg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TbS-0000000D4Ou-1gIq;
	Tue, 01 Sep 2026 18:53:02 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZp-0000000D1Ip-1hy7;
	Tue, 01 Sep 2026 18:51:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=sNYdn9OZQ6wtZ/i/e7RFUhdRPOE4lJ9rjfaR+WZElgA=; b=hnvOn3q5uNnr20gtnC3JBiV6X0
	H2iy27wPUoy349Bka/oOI8tc46j+u1aRVJH5JzDS4ZCBKn37JP13owCVyfsumneBNB0I3sQbycxkq
	N5LfiDI79MjDPh8oaELh5XQyBWZ4JrZCsW8w7cKX4PNWiuMKthoR58bTmAqtV7qOPjN15ExZSN417
	jwthJrK1cc7/+iQ4/RtoZ40F7EWpYR64Mb5/EQ1bzJSmqoi2vQxA5wVynjKHI4rsKBkn+Y1SNCsWw
	txfdMs0HPjqRdnZRwZSKDHkYyqXxoRcM5yNKNo0fr9VGhNN5W3Se1pq+FgFnUaoMnH3DWugqlJng9
	6Ro2pT4Q==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZm-0000000BHVy-1mMI;
	Tue, 01 Sep 2026 18:51:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288677;
	bh=7TffjHT/FiznFowY3x4vtvfUjZAAe2Mb5KIXYD9cBBU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=dNQpFuO2JjXd3aIpv2AD5Fdlo87mTkfdOfX6Fog0LxsbkwpmiFqXuAcKGAoIh6tqX
	 kdGlN5d3oWVjVeogBMIUsaHRID3/XOKwWE4564YplxsbAhjkQAxuhWeEMwoeKLoSs+
	 hsQwlznCXZL7rQ+LOUxPjLN3UxieHJM4giristfeaa5YoAlpDoyjqpM/GAdM/9SMzX
	 0lM4Pk4+gM8j0T8qs1vTdIOvdvX6yJfE3cPsrGB9Bcr9QmzeZdAk6FEpBKoTyT/Mib
	 xT+Oh2ZR2YEddj9PlW4GJ7u2d10vOuljh6Nenl4os6ZN2rAf9GHh5cMxGLTWgyR9iv
	 gW3cJpIiyrEPg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 27AF817E3C6E;
	Tue, 01 Sep 2026 20:51:17 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:51:13 +0300
Subject: [PATCH v11 49/74] drm/display: hdmi-state-helper: Drop
 drm_atomic_helper_connector_hdmi_force()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-49-bc12954a0688@collabora.com>
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
 linux-fbdev@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195118_650347_F54B8D71 
X-CRM114-Status: UNSURE (   9.68  )
X-CRM114-Notice: Please train this message.
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

With all callers converted to the .force_ctx() connector helper, this
function has no users left.  Remove it.

Reviewed-by: Maxime Ripard <mripard@kernel.org>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_hdmi_state_helper.c | 15 ---------------
 include/drm/display/drm_hdmi_state_helper.h     |  1 -
 2 files changed, 16 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_hdmi_state_helper.c b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
index 7cdb7ca3dc12..d661385c3e64 100644
--- a/drivers/gpu/drm/display/drm_hdmi_state_helper.c
+++ b/drivers/gpu/drm/display/drm_hdmi_state_helper.c
@@ -1441,21 +1441,6 @@ int drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
 }
 EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_hotplug);
 
-/**
- * drm_atomic_helper_connector_hdmi_force - HDMI Connector implementation of the force callback
- * @connector: A pointer to the HDMI connector
- *
- * This function implements the .force() callback for the HDMI connectors. It
- * can either be used directly as the callback or should be called from within
- * the .force() callback implementation to maintain the HDMI-specific
- * connector's data.
- */
-void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector)
-{
-	drm_atomic_helper_connector_hdmi_update(connector, NULL, connector->status);
-}
-EXPORT_SYMBOL(drm_atomic_helper_connector_hdmi_force);
-
 /**
  * drm_atomic_helper_connector_hdmi_force_ctx - HDMI Connector implementation
  * of the force_ctx callback
diff --git a/include/drm/display/drm_hdmi_state_helper.h b/include/drm/display/drm_hdmi_state_helper.h
index 965342f6bbc9..5c827409db45 100644
--- a/include/drm/display/drm_hdmi_state_helper.h
+++ b/include/drm/display/drm_hdmi_state_helper.h
@@ -27,7 +27,6 @@ int drm_atomic_helper_connector_hdmi_update_infoframes(struct drm_connector *con
 int drm_atomic_helper_connector_hdmi_hotplug(struct drm_connector *connector,
 					     struct drm_modeset_acquire_ctx *ctx,
 					     enum drm_connector_status status);
-void drm_atomic_helper_connector_hdmi_force(struct drm_connector *connector);
 int drm_atomic_helper_connector_hdmi_force_ctx(struct drm_connector *connector,
 					       struct drm_modeset_acquire_ctx *ctx);
 

-- 
2.55.0


