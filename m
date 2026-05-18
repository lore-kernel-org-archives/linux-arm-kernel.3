Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB38BCD4F52
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:02:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rHR6JQhfCZioVtWjb43UfYe+VOtInpIVxB1wWysQtG0=; b=DBgvOIi3QYUF/OKuM2oHnLCI+f
	iufD9/Ih0ZqggZrJvVNJW7AxuxXKjwJYWY97q4votgI9IiI9j12hD0KIFRR6yosuiNaYKO8j9Aner
	ZTbTn+eOBdGVgXagKXWuvfG2k7R3/cYXuPcomg24xiy08KCDlvGfGq9YqzCT1l7CJLy0SNQNGuM6t
	uP3so3rfyMKcKv868qr9Lle6iD56nrzJi6x3wqe1DjeRpen5aYEAD0DPC/LmxG88E3oji19UJqNuh
	1Fj8yJi5EYNhfsGOdBfcjtlHPfHLEU4Cnne+Ft42ZLGUYjmzmpdqiy0r/flkx5hgnhQRAuXvJqLHT
	rPrVPimA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2IZ-0000000GShI-3ttz;
	Mon, 18 May 2026 18:02:39 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2IX-0000000GSdT-0BFy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:02:38 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127356; bh=rHR6JQhfCZioVtWjb43UfYe+VOtInpIVxB1wWysQtG0=;
 b=Ns+MaGNTyKv5bhavyC5fjKmcI9wvSGrPoTRdnjjPkasJrBFmGk9pc9ZbkROLqMyZZ2c5mfqaK
 6459D6WlFaIirJWwsLzSLBfrNvR/94sp4fQZrCcx7yYSlTwkQT/V785NEGZFel+ysbwwkkVW/9z
 ZSMNs2MDDhWSieMbXs+X7kySSTGDtuAIfHAIe0Sk3qDZ03nfRf0Z16CCCb1DLn0QGkOWiI0//5a
 CC0+iZBJcBjerzap7T/3hQwhQc8DwzBFElWEGXJT26oI1/jnMwCL+apgGXJR1zyB0hNILfXN2D/
 ZI70ozbzvqjLvVfY9GktiB5V3lk8keoFMwrEPwDlb36g==
X-Forward-Email-ID: 6a0b5436b84dbc72d2274e00
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
	Simona Vetter <simona@ffwll.ch>,
	Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
	Louis Chauvet <louis.chauvet@bootlin.com>
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
Subject: [PATCH v7 04/23] drm: bridge: dw_hdmi: Hold bridge ref until connector cleanup
Date: Mon, 18 May 2026 18:01:40 +0000
Message-ID: <20260518180206.2480119-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110237_185107_FF580A4D 
X-CRM114-Status: GOOD (  13.99  )
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

drmres connector cleanup typically run after devres has released the
last dw-hdmi bridge reference. Since struct dw_hdmi, where the connector
lives, is freed when the last bridge reference is released, connector
cleanup can end up accessing freed memory.

Call trace without a bridge reference held until connector cleanup:
- dw_hdmi_bridge_detach()
- dw_hdmi_bridge_destroy()      <<-- struct dw_hdmi is free()
- [drm:drm_managed_release] drmres release begin
- [drm:drm_managed_release] REL (...) drm_mode_config_init_release (0 bytes)
- dw_hdmi_connector_destroy()
  - drm_connector_cleanup()     <<-- drm_connector is use-after-free
  [...]
- [drm:drm_managed_release] drmres release end

Hold a bridge reference for as long as the connector exists and drop it
after drm_connector_cleanup() has completed to keep struct dw_hdmi alive
until connector teardown is finished and avoids the use-after-free.

Call trace with a bridge reference held until connector cleanup:
- dw_hdmi_bridge_detach()
- [drm:drm_managed_release] drmres release begin
- [drm:drm_managed_release] REL (...) drm_mode_config_init_release (0 bytes)
- dw_hdmi_connector_destroy()
  - drm_connector_cleanup()     <<-- drm_connector is destroy()
  - drm_bridge_put()
- dw_hdmi_bridge_destroy()      <<-- struct dw_hdmi is free()
  [...]
- [drm:drm_managed_release] drmres release end

Fixes: ed6987b67418 ("drm/bridge: dw-hdmi: convert to devm_drm_bridge_alloc() API")
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Add fixes tag, re-order patch
v6: Collect t-b tag
v5: New patch

This use-after-free issue likely existed before commit ed6987b67418 when
devm_kzalloc() was used instead of devm_drm_bridge_alloc(). However,
v6.16-rc1 first introduced bridge refcount and drm_bridge_put(),
parts that are used to help fix the use-after-free issue.

KASAN report a slab-use-after-free in __refcount_add_not_zero when,
  echo fe0a0000.hdmi > /sys/bus/platform/drivers/dwhdmi-rockchip/unbind
on a Rockchip RK3566 device prior to this fix.
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 23 ++++++++++++++++++-----
 1 file changed, 18 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index b7bfc0e9a6b2..9d795c550f8a 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -2568,10 +2568,18 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
 	mutex_unlock(&hdmi->mutex);
 }
 
+static void dw_hdmi_connector_destroy(struct drm_connector *connector)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
+
+	drm_connector_cleanup(connector);
+	drm_bridge_put(&hdmi->bridge);
+}
+
 static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.detect = dw_hdmi_connector_detect,
-	.destroy = drm_connector_cleanup,
+	.destroy = dw_hdmi_connector_destroy,
 	.force = dw_hdmi_connector_force,
 	.reset = drm_atomic_helper_connector_reset,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -2588,6 +2596,7 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 	struct drm_connector *connector = &hdmi->connector;
 	struct cec_connector_info conn_info;
 	struct cec_notifier *notifier;
+	int ret;
 
 	if (hdmi->version >= 0x200a)
 		connector->ycbcr_420_allowed =
@@ -2600,10 +2609,14 @@ static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
 
 	drm_connector_helper_add(connector, &dw_hdmi_connector_helper_funcs);
 
-	drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
-				    &dw_hdmi_connector_funcs,
-				    DRM_MODE_CONNECTOR_HDMIA,
-				    hdmi->ddc);
+	ret = drm_connector_init_with_ddc(hdmi->bridge.dev, connector,
+					  &dw_hdmi_connector_funcs,
+					  DRM_MODE_CONNECTOR_HDMIA,
+					  hdmi->ddc);
+	if (ret)
+		return ret;
+
+	drm_bridge_get(&hdmi->bridge);
 
 	/*
 	 * drm_connector_attach_max_bpc_property() requires the
-- 
2.54.0


