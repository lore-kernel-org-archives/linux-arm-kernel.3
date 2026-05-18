Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 17D45CD4F4A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:02:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UTke0A6Lv/1fUQtQniAEq60/oKDmSb3Qk0p4Red78bM=; b=HvkxxgcycRJDUFhQzFDYqp5tWM
	jPRc6M714l7yox3hDtMUIE/S2bDGoYhYJF5mYq5NNfSkLl3ZKCDx8yerQZi/MetcW12MnFNTTgeul
	3NycVgCX4JknNAqW8jdDHdpo9gvsHzmi4D6a0SKR0QJd4CNCbBD9EInLk5zUgRTSZE24ZKLJyh7oc
	EEqQQWiHlW3GqKo3M2Q+2ZbWdIPeITjihYUf9cBLmfHmzfB8/w/bUWZXHAU5qnWf+dEFgQCTwcLV3
	KxFLLAShiAQLEr+PwVidKWfVMdBy3bS8aEpR41u7cpdtXgknmpRKSXzjSWlxOrQ/+/R2mqo9cEQoi
	BaYaIh9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Ie-0000000GSnu-2Cfx;
	Mon, 18 May 2026 18:02:44 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2IY-0000000GSef-1SnY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:02:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127357; bh=UTke0A6Lv/1fUQtQniAEq60/oKDmSb3Qk0p4Red78bM=;
 b=nHUCDO5JZlhrIrzW336/5Uej+6ONc//nxQAv95reVUGE7dHiYviqxoPOIPzTxGKhW725hqqWX
 TVqXiHfCIIJ7UGBiGchCx3mSsIqINDMQn+fcYABnFo5bdbIfIy2uEqLNo3JR1umS8GTMEV7NOiZ
 wx7CQqnDHnaxUH/ffYmPZLFNJLpVpB4z25JqgOdVHsZCVcixh+0OnHAxGzmLJxWYXCT6awEjNQV
 gwZfxSMdnMLl2c9kJOjnC2GPwkz/KKMS0iTFE4LUmvK+PNihzeE3oXhbsl3tAzuDoAibosy/mHS
 F/GdKND0TP9EjBqy6YWVsP7dduZe2hqCk3L7EvYRPmfg==
X-Forward-Email-ID: 6a0b543bb84dbc72d2274e1b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
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
Subject: [PATCH v7 05/23] drm: bridge: dw_hdmi: Call poweron/poweroff from atomic enable/disable
Date: Mon, 18 May 2026 18:01:41 +0000
Message-ID: <20260518180206.2480119-6-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110238_572125_8E2909A0 
X-CRM114-Status: GOOD (  13.22  )
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

Change to only call poweron/poweroff from atomic_enable/atomic_disable
funcs instead of trying to be clever by keeping a bridge_is_on state and
poweron/off in the hotplug IRQ handler.

The bridge is already enabled/disabled depending on connection status
with the call to drm_helper_hpd_irq_event() in hotplug IRQ handler.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # Rock64, RockPro64, Quartz64-B
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: No change
v6: Update commit message,
    Collect t-b tag
v5: No change
v4: No change
v3: Collect r-b tag
v2: Update commit message
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 33 ++---------------------
 1 file changed, 2 insertions(+), 31 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 9d795c550f8a..8bec9b5cd803 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -171,7 +171,6 @@ struct dw_hdmi {
 	enum drm_connector_force force;	/* mutex-protected force state */
 	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
 	bool disabled;			/* DRM has disabled our bridge */
-	bool bridge_is_on;		/* indicates the bridge is on */
 	bool rxsense;			/* rxsense state */
 	u8 phy_mask;			/* desired phy int mask settings */
 	u8 mc_clkdis;			/* clock disable register */
@@ -2400,8 +2399,6 @@ static void initialize_hdmi_ih_mutes(struct dw_hdmi *hdmi)
 
 static void dw_hdmi_poweron(struct dw_hdmi *hdmi)
 {
-	hdmi->bridge_is_on = true;
-
 	/*
 	 * The curr_conn field is guaranteed to be valid here, as this function
 	 * is only be called when !hdmi->disabled.
@@ -2415,30 +2412,6 @@ static void dw_hdmi_poweroff(struct dw_hdmi *hdmi)
 		hdmi->phy.ops->disable(hdmi, hdmi->phy.data);
 		hdmi->phy.enabled = false;
 	}
-
-	hdmi->bridge_is_on = false;
-}
-
-static void dw_hdmi_update_power(struct dw_hdmi *hdmi)
-{
-	int force = hdmi->force;
-
-	if (hdmi->disabled) {
-		force = DRM_FORCE_OFF;
-	} else if (force == DRM_FORCE_UNSPECIFIED) {
-		if (hdmi->rxsense)
-			force = DRM_FORCE_ON;
-		else
-			force = DRM_FORCE_OFF;
-	}
-
-	if (force == DRM_FORCE_OFF) {
-		if (hdmi->bridge_is_on)
-			dw_hdmi_poweroff(hdmi);
-	} else {
-		if (!hdmi->bridge_is_on)
-			dw_hdmi_poweron(hdmi);
-	}
 }
 
 /*
@@ -2563,7 +2536,6 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
 
 	mutex_lock(&hdmi->mutex);
 	hdmi->force = connector->force;
-	dw_hdmi_update_power(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	mutex_unlock(&hdmi->mutex);
 }
@@ -3001,7 +2973,7 @@ static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = true;
 	hdmi->curr_conn = NULL;
-	dw_hdmi_update_power(hdmi);
+	dw_hdmi_poweroff(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, false);
 	mutex_unlock(&hdmi->mutex);
@@ -3019,7 +2991,7 @@ static void dw_hdmi_bridge_atomic_enable(struct drm_bridge *bridge,
 	mutex_lock(&hdmi->mutex);
 	hdmi->disabled = false;
 	hdmi->curr_conn = connector;
-	dw_hdmi_update_power(hdmi);
+	dw_hdmi_poweron(hdmi);
 	dw_hdmi_update_phy_mask(hdmi);
 	handle_plugged_change(hdmi, true);
 	mutex_unlock(&hdmi->mutex);
@@ -3119,7 +3091,6 @@ void dw_hdmi_setup_rx_sense(struct dw_hdmi *hdmi, bool hpd, bool rx_sense)
 		if (hpd)
 			hdmi->rxsense = true;
 
-		dw_hdmi_update_power(hdmi);
 		dw_hdmi_update_phy_mask(hdmi);
 	}
 	mutex_unlock(&hdmi->mutex);
-- 
2.54.0


