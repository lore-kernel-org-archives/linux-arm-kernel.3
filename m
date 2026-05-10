Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69305CD37B8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 12:42:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rdh0BB0LH0hOOSmxBLwLWxnKBxaJU8xXHPIyn2MeIhg=; b=ohcOcluoG3+egbXE7oeTVBGZJe
	9naMsST97P/oCuhk0ks2KSt5Y/l+Kl6OH93hFkQrxJ3Ch8tgmGskxmZW4RBZExT1O0vN0lnB8MKuA
	nfFA+uMTxxqveBFOTOf4CXREu+t4hPMtyc94gL2Ggf+X6DuOHFtOMyMTJBgmS2FpKN4EH+WZbBlTB
	4KlqXeikB0zIKOF33YuqCoxH2XMElTtPv/kSml593YJoAfArMLob7KjNnq/KEnIYfS0SJ9fiIC9Fd
	f7xzRTtgXDDfKJq7Nd5UEIFzoa0kVQckRAJMtukqbWWQHPp+FoyNrM79JS/OZN+n4Y8QuveYa97Dn
	a7U/PkHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3UE-0000000AjsG-1JvK;
	Sun, 10 May 2026 12:42:22 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3UB-0000000Ajcj-0vPz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 12:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778416930; bh=Rdh0BB0LH0hOOSmxBLwLWxnKBxaJU8xXHPIyn2MeIhg=;
 b=vWYIABNVUVBgike+NcaC6eziTiuX+9FoSdKiBHxXDw/DxHVPKgUkTZL7pPBk3tjzYYLiCnhBl
 v/zo/EOOIqVbSfLpRfVP8+B+J7ythOCpen4mX9ofXirWXvowzaIod/s3t5U16k06+vJimEgs6xt
 yshErXSS4ek0kiwrIPp8iQlRYbPMmY5NOJzgoDRqYIlyR8UWIuMm9qlxjlWgIg056M52+yHTNDK
 DYuNSbg4he5JAnhzw/xM72FvlEB/fwTv8+oL+dE/Jk+r9NlqUIOEm6iPspLFoIg1+gsTEqV72z+
 kV2I7wi9wrKklLwwyedc+0alHp/g52R/4S96voZ8wXvg==
X-Forward-Email-ID: 6a007d090d91f03a31a0bbc9
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.8.0
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
Subject: [PATCH v5 06/21] drm: bridge: dw_hdmi: Remove previous_mode and mode_set
Date: Sun, 10 May 2026 12:40:50 +0000
Message-ID: <20260510124111.1226584-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510124111.1226584-1-jonas@kwiboo.se>
References: <20260510124111.1226584-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_054219_405833_40793C3C 
X-CRM114-Status: GOOD (  12.66  )
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

With the use of adjusted_mode directly from the crtc_state there is no
longer a need to store a copy in previous_mode, remove it and the now
unneeded mode_set ops.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: No change, rebase on next-20260508
v4: No change
v3: Collect r-b tag
v2: No change
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 607faf4da967..a176eb55418c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -156,8 +156,6 @@ struct dw_hdmi {
 		bool enabled;
 	} phy;
 
-	struct drm_display_mode previous_mode;
-
 	struct i2c_adapter *ddc;
 	void __iomem *regs;
 	bool sink_is_hdmi;
@@ -167,7 +165,7 @@ struct dw_hdmi {
 	struct pinctrl_state *default_state;
 	struct pinctrl_state *unwedge_state;
 
-	struct mutex mutex;		/* for state below and previous_mode */
+	struct mutex mutex;		/* for state below */
 	enum drm_connector_force force;	/* mutex-protected force state */
 	struct drm_connector *curr_conn;/* current connector (only valid when !disabled) */
 	bool disabled;			/* DRM has disabled our bridge */
@@ -2928,20 +2926,6 @@ dw_hdmi_bridge_mode_valid(struct drm_bridge *bridge,
 	return mode_status;
 }
 
-static void dw_hdmi_bridge_mode_set(struct drm_bridge *bridge,
-				    const struct drm_display_mode *orig_mode,
-				    const struct drm_display_mode *mode)
-{
-	struct dw_hdmi *hdmi = bridge->driver_private;
-
-	mutex_lock(&hdmi->mutex);
-
-	/* Store the display mode for plugin/DKMS poweron events */
-	drm_mode_copy(&hdmi->previous_mode, mode);
-
-	mutex_unlock(&hdmi->mutex);
-}
-
 static void dw_hdmi_bridge_atomic_disable(struct drm_bridge *bridge,
 					  struct drm_atomic_commit *state)
 {
@@ -3005,7 +2989,6 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_get_input_bus_fmts = dw_hdmi_bridge_atomic_get_input_bus_fmts,
 	.atomic_enable = dw_hdmi_bridge_atomic_enable,
 	.atomic_disable = dw_hdmi_bridge_atomic_disable,
-	.mode_set = dw_hdmi_bridge_mode_set,
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 	.detect = dw_hdmi_bridge_detect,
 	.edid_read = dw_hdmi_bridge_edid_read,
-- 
2.54.0


