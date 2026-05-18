Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615FCCD4F50
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:03:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ozZ64lc/u62KCDiC1IyBlegc4d7ugh2Odmie8y2x51Y=; b=B69ATVXokmjCjFv/01UH0xnbua
	EOUg0O2F7ZqOULnult2hDDfNynzIFcaqkMqXyEjV7snxybpLYlGoqWnN1v1HwQ9u1xx7T/XwUqPZS
	K5FTomtCUGgUGxbrnTG5s/2Iv9QdT9nzLddE4draJjFydcdRsZMZ3gdvl0nKitBr1VMqegibb1TbE
	KoVT8gVR1vZYyHKMXZJwNkaVeHnMJG+d6zUkZpx9sEvyEQoI8lDMxe05iN1x2ScMHMoXXKQaa530w
	kVPsSjtnIsQ0P5ximvT1yB+96z82yVtX0aH1wtRwQYhZLL9ozTI0aPoh7pEZDRfa38rBIpkS87a1c
	7UBmpiIA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2JI-0000000GTru-2jLt;
	Mon, 18 May 2026 18:03:25 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2JF-0000000GTlZ-3DNV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:03:23 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127401; bh=ozZ64lc/u62KCDiC1IyBlegc4d7ugh2Odmie8y2x51Y=;
 b=iRD1Bil56FSaomRC7C3X8yWlq5QFlMqkQ9Dku00doXt6Nvod2Yi9WNAZt33XU9hwbQKCq+gpG
 kgpc2hCnZekgHCI1YyLg4FKRxMcyrTrdAIQG4HGuYxlLCYB+tH5E+vB/74N0JgxbfNM9ICbhdlP
 YY9Aq6+MqbE95/yKhX0IM4f4JKHlqabVwWZ6Y5cisXUB9eqVAfuHKENPgeUEBXBxrZG4Vx2ArvX
 O1BBbIUiCQ2STZkDx6Yt1EYYKA8W/e6OELbuzQuVByRVpfRS9qalGRlAO0Xb6M9tv5v9K8N/2i9
 +ZZgtd0M4bg6YhcN5B8b9nUF27MXaikj6cjCxs97T7ew==
X-Forward-Email-ID: 6a0b5465b84dbc72d2274f3e
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
X-Forward-Email-Version: 2.8.12
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Luca Ceresoli <luca.ceresoli@bootlin.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Liu Ying <victor.liu@nxp.com>,
	Sandy Huang <hjc@rock-chips.com>,
	Andy Yan <andy.yan@rock-chips.com>,
	Chen-Yu Tsai <wens@kernel.org>,
	Christian Hewitt <christianshewitt@gmail.com>,
	Diederik de Haas <diederik@cknow-tech.com>,
	Nicolas Frattaroli <nicolas.frattaroli@collabora.com>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-amlogic@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v7 15/23] drm: bridge: dw_hdmi: Use generic CEC notifier helpers
Date: Mon, 18 May 2026 18:01:51 +0000
Message-ID: <20260518180206.2480119-16-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110321_969709_5911DC43 
X-CRM114-Status: GOOD (  14.28  )
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

The commit 8b1a8f8b2002 ("drm/display: add CEC helpers code") added
generic CEC helpers to be used by HDMI drivers.

Replace the open-coded CEC notifier handling with use of the generic CEC
notifier helpers. Ensure DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER is also
selected when DRM_DW_HDMI_CEC is enabled so that the CEC helpers is
available.

The drmm release action for the generic CEC notifier should run just
before dw_hdmi_connector_destroy(), closely matching the lifetime of
the replaced CEC notifier and the connector.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Update commit message,
    Collect t-b tag
v5: Collect r-b tag
v4: New patch
---
 drivers/gpu/drm/bridge/synopsys/Kconfig   |  1 +
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 26 +++++------------------
 2 files changed, 6 insertions(+), 21 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/Kconfig b/drivers/gpu/drm/bridge/synopsys/Kconfig
index a46df7583bcf..e6723af03b43 100644
--- a/drivers/gpu/drm/bridge/synopsys/Kconfig
+++ b/drivers/gpu/drm/bridge/synopsys/Kconfig
@@ -49,6 +49,7 @@ config DRM_DW_HDMI_CEC
 	depends on DRM_DW_HDMI
 	select CEC_CORE
 	select CEC_NOTIFIER
+	select DRM_DISPLAY_HDMI_CEC_NOTIFIER_HELPER
 	help
 	  Support the CE interface which is part of the Synopsys
 	  Designware HDMI block.
diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 0e84dff72470..37406555af7b 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -23,12 +23,11 @@
 #include <linux/dma-mapping.h>
 #include <linux/spinlock.h>
 
-#include <media/cec-notifier.h>
-
 #include <linux/media-bus-format.h>
 #include <linux/videodev2.h>
 
 #include <drm/bridge/dw_hdmi.h>
+#include <drm/display/drm_hdmi_cec_helper.h>
 #include <drm/display/drm_hdmi_helper.h>
 #include <drm/display/drm_scdc_helper.h>
 #include <drm/drm_atomic.h>
@@ -183,8 +182,6 @@ struct dw_hdmi {
 	void (*enable_audio)(struct dw_hdmi *hdmi);
 	void (*disable_audio)(struct dw_hdmi *hdmi);
 
-	struct cec_notifier *cec_notifier;
-
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
 	enum drm_connector_status last_connector_result;
@@ -2453,7 +2450,7 @@ dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
 
 	if (status == connector_status_disconnected) {
 		drm_edid_connector_update(connector, NULL);
-		cec_notifier_phys_addr_invalidate(hdmi->cec_notifier);
+		drm_connector_cec_phys_addr_invalidate(connector);
 		return;
 	}
 
@@ -2462,8 +2459,7 @@ dw_hdmi_connector_status_update(struct dw_hdmi *hdmi,
 	drm_edid_free(drm_edid);
 
 	if (status == connector_status_connected)
-		cec_notifier_set_phys_addr(hdmi->cec_notifier,
-				connector->display_info.source_physical_address);
+		drm_connector_cec_phys_addr_set(connector);
 }
 
 static enum drm_connector_status
@@ -2525,9 +2521,6 @@ static void dw_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
 
-	cec_notifier_conn_unregister(hdmi->cec_notifier);
-	hdmi->cec_notifier = NULL;
-
 	drm_connector_cleanup(connector);
 	drm_bridge_put(&hdmi->bridge);
 }
@@ -2550,8 +2543,6 @@ static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs =
 static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 {
 	struct drm_connector *connector = &hdmi->connector;
-	struct cec_connector_info conn_info;
-	struct cec_notifier *notifier;
 	int ret;
 
 	if (hdmi->version >= 0x200a)
@@ -2587,15 +2578,8 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 
 	drm_connector_attach_encoder(connector, hdmi->bridge.encoder);
 
-	cec_fill_conn_info_from_drm(&conn_info, connector);
-
-	notifier = cec_notifier_conn_register(hdmi->dev, NULL, &conn_info);
-	if (!notifier)
-		return -ENOMEM;
-
-	hdmi->cec_notifier = notifier;
-
-	return 0;
+	return drmm_connector_hdmi_cec_notifier_register(connector, NULL,
+							 hdmi->dev);
 }
 
 /* -----------------------------------------------------------------------------
-- 
2.54.0


