Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B78DCF45D7
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 22:27:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Z2d1VppKIhbvkARPz1sndofCHyC/ug+Foh+KfWYTZLA=; b=v6ObIICK2zFD7wenk5+NvnPlkK
	Ndz3+nNS85yG6Q+I4Bi0s3nAFovA3i+BG14NuiNFcoLi1f1IxZiy7/bpn6DkqJn1pm6pnW2gPWmP3
	isbRkeLVK2F9AskoLJudOY7KJ/FwECEdu4aMohmq+KDTKeVDwISFYLpYj/f6vki6Azore0Gdck2YI
	u9BxE8+u/Kgq6lmawaGBVvpif3zozO4Bfv2bFHgE0iyoZnHhl48SlTvVmc/mMMS+4swK8TN6HCcAe
	PqpXGJDWW9sIKheBiTCb6SO5MPAM/ax+HhNxVRKQRSPWWYeALNuwoGWlFa9qd1W+NnllYp1lPHrc9
	AFM0RE1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQND-00000006Fxt-1RPF;
	Mon, 12 Jan 2026 22:26:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQNA-00000006Fuo-150m;
	Mon, 12 Jan 2026 22:26:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=Z2d1VppKIhbvkARPz1sndofCHyC/ug+Foh+KfWYTZLA=; b=oXCoZHCjjrfb1mVD9HXDaAuQc6
	LEgjVc4XPqyM8JFgSnnN53okZoGLw8V8LRS7OKx+riSlR1QfQeODag8s6GpJSkknkZZN28YcRmZTi
	hzmsXXMGVky+kwcC2JQVQFaDwPXGMMe+FfSFfC/nGnFQ/5yw5pgo6iOeeBV06hV1zalQvIcMdRSMy
	KJv6Q0cPrVN5uvNsS+dSSf9s76Z0dD5SDwFo1/0k9dVzg0n/ch9dfPtL1NdYh7JfBYd02ahTuUJoZ
	K+YC3/wN3DeU2xgxv17tEZsD1hV10VwYeCrmRRTKCgMfiD5yNke/CmrSYFbklVLbZ+iSQPIzw2sV0
	57zNmBNQ==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfQN3-00000001l37-0MOO;
	Mon, 12 Jan 2026 22:26:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1768256796;
	bh=q2XOCP26rXDry7FzvFYoqU3pteV9bGFuLefzkF0bFwE=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=X2xgoBcUBWjBwhOqBnkdDA69GV+mqsMpSi4YB9jmY/g4Vx/2vDRVFXFIOgNumhSbS
	 W6LnyG1bEvN69FLm39lmHujJITPlN2A7lFLI4Kewqpe9XheKQSp4+Zl3EzhnrFrFD7
	 b6m2b8iDoumjAqtkCfAcDnrXU3kswLtgelExWPKjyHvBSbTL3DlXUX3wP3TChU2pKs
	 jI9vXFg8PtKrtrcQNVfL5pbA3a6NzZdynLy/yXM43U9gX2d9YM6kYO0nkpv00U68vr
	 qOfr8ljT1LcFcdfL/h3uG3Cs3HwrAqQyf3Rz5R3Y1fwdfPwCv2hz6/Xi9CTbPHgqU2
	 oDpyqHPmvDshw==
Received: from localhost (unknown [82.79.138.145])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3C11117E1416;
	Mon, 12 Jan 2026 23:26:36 +0100 (CET)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 13 Jan 2026 00:26:19 +0200
Subject: [PATCH v2 2/4] drm/bridge-connector: Switch to using ->detect_ctx
 hook
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260113-dw-hdmi-qp-scramb-v2-2-ae7b2c58d24d@collabora.com>
References: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
In-Reply-To: <20260113-dw-hdmi-qp-scramb-v2-0-ae7b2c58d24d@collabora.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>
Cc: kernel@collabora.com, dri-devel@lists.freedesktop.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, 
 Diederik de Haas <diederik@cknow-tech.com>, 
 Maud Spierings <maud_spierings@hotmail.com>
X-Mailer: b4 0.14.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260112_222646_598577_25520758 
X-CRM114-Status: GOOD (  15.11  )
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

In preparation to allow bridge drivers relying on the HDMI connector
framework to provide HDMI 2.0 support, make use of the atomic version of
drm_connector_funcs.detect() hook and invoke the newly introduced
drm_bridge_detect_ctx() helper.

In particular, this is going to be used for triggering an empty modeset
in drm_bridge_funcs.detect_ctx() callback, in order to manage SCDC
status lost on sink disconnects.

Tested-by: Diederik de Haas <diederik@cknow-tech.com>
Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/display/drm_bridge_connector.c | 73 ++++++++++++++------------
 1 file changed, 38 insertions(+), 35 deletions(-)

diff --git a/drivers/gpu/drm/display/drm_bridge_connector.c b/drivers/gpu/drm/display/drm_bridge_connector.c
index 57a0cceabd34..8a1f6afa8c6b 100644
--- a/drivers/gpu/drm/display/drm_bridge_connector.c
+++ b/drivers/gpu/drm/display/drm_bridge_connector.c
@@ -200,39 +200,6 @@ static void drm_bridge_connector_disable_hpd(struct drm_connector *connector)
  * Bridge Connector Functions
  */
 
-static enum drm_connector_status
-drm_bridge_connector_detect(struct drm_connector *connector, bool force)
-{
-	struct drm_bridge_connector *bridge_connector =
-		to_drm_bridge_connector(connector);
-	struct drm_bridge *detect = bridge_connector->bridge_detect;
-	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
-	enum drm_connector_status status;
-
-	if (detect) {
-		status = detect->funcs->detect(detect, connector);
-
-		if (hdmi)
-			drm_atomic_helper_connector_hdmi_hotplug(connector, status);
-
-		drm_bridge_connector_hpd_notify(connector, status);
-	} else {
-		switch (connector->connector_type) {
-		case DRM_MODE_CONNECTOR_DPI:
-		case DRM_MODE_CONNECTOR_LVDS:
-		case DRM_MODE_CONNECTOR_DSI:
-		case DRM_MODE_CONNECTOR_eDP:
-			status = connector_status_connected;
-			break;
-		default:
-			status = connector_status_unknown;
-			break;
-		}
-	}
-
-	return status;
-}
-
 static void drm_bridge_connector_force(struct drm_connector *connector)
 {
 	struct drm_bridge_connector *bridge_connector =
@@ -270,7 +237,6 @@ static void drm_bridge_connector_reset(struct drm_connector *connector)
 
 static const struct drm_connector_funcs drm_bridge_connector_funcs = {
 	.reset = drm_bridge_connector_reset,
-	.detect = drm_bridge_connector_detect,
 	.force = drm_bridge_connector_force,
 	.fill_modes = drm_helper_probe_single_connector_modes,
 	.atomic_duplicate_state = drm_atomic_helper_connector_duplicate_state,
@@ -283,6 +249,42 @@ static const struct drm_connector_funcs drm_bridge_connector_funcs = {
  * Bridge Connector Helper Functions
  */
 
+static int drm_bridge_connector_detect_ctx(struct drm_connector *connector,
+					   struct drm_modeset_acquire_ctx *ctx,
+					   bool force)
+{
+	struct drm_bridge_connector *bridge_connector =
+		to_drm_bridge_connector(connector);
+	struct drm_bridge *detect = bridge_connector->bridge_detect;
+	struct drm_bridge *hdmi = bridge_connector->bridge_hdmi;
+	int ret;
+
+	if (detect) {
+		ret = drm_bridge_detect_ctx(detect, connector, ctx);
+		if (ret < 0)
+			return ret;
+
+		if (hdmi)
+			drm_atomic_helper_connector_hdmi_hotplug(connector, ret);
+
+		drm_bridge_connector_hpd_notify(connector, ret);
+	} else {
+		switch (connector->connector_type) {
+		case DRM_MODE_CONNECTOR_DPI:
+		case DRM_MODE_CONNECTOR_LVDS:
+		case DRM_MODE_CONNECTOR_DSI:
+		case DRM_MODE_CONNECTOR_eDP:
+			ret = connector_status_connected;
+			break;
+		default:
+			ret = connector_status_unknown;
+			break;
+		}
+	}
+
+	return ret;
+}
+
 static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 					       struct drm_bridge *bridge)
 {
@@ -290,7 +292,7 @@ static int drm_bridge_connector_get_modes_edid(struct drm_connector *connector,
 	const struct drm_edid *drm_edid;
 	int n;
 
-	status = drm_bridge_connector_detect(connector, false);
+	status = drm_bridge_connector_detect_ctx(connector, NULL, false);
 	if (status != connector_status_connected)
 		goto no_edid;
 
@@ -376,6 +378,7 @@ static int drm_bridge_connector_atomic_check(struct drm_connector *connector,
 
 static const struct drm_connector_helper_funcs drm_bridge_connector_helper_funcs = {
 	.get_modes = drm_bridge_connector_get_modes,
+	.detect_ctx = drm_bridge_connector_detect_ctx,
 	.mode_valid = drm_bridge_connector_mode_valid,
 	.enable_hpd = drm_bridge_connector_enable_hpd,
 	.disable_hpd = drm_bridge_connector_disable_hpd,

-- 
2.52.0


