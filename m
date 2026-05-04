Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB91DFF885A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SSjbkd7u9s/dzg55YrV/09rhDl4sPM/aDTP4vRABfBI=; b=mwGWkEq21+MqtxXGHEqMHkpIGi
	TMaLZ1AM39Y/uEC8HDSuHAgVsO1P4ID+801Gf9GDg2cmiuxrTpfqKAfyA8t/tZqTCDzmcnRyX+11b
	Adln9g/vPyIovH6Rt73AwAR3qA0Vibyb3uXqjcoksvReJPzcIm1F9YG6DMBaa9frfhYuAk8PVIypN
	vuwrC2MtPXf4/fJpXCw/7FW7DU30JuG1qcqxF9THGNI5/i6WsAQgmVeae3e2EQFSVLE2Uud8RzFr8
	al/Htk3DXPL1EdsFQeXm8BTxsYWcCZwAgj5uCS/JYvQ+S2GGmFLwlsqQDey19TMQXf8E3lC2UM4bN
	Fko6Vzww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyht-0000000E5X1-3Ick;
	Mon, 04 May 2026 19:11:53 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhj-0000000E5CO-2hLN
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:11:46 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921903; bh=SSjbkd7u9s/dzg55YrV/09rhDl4sPM/aDTP4vRABfBI=;
 b=IFFeULg/AjdbvfAZi7GM95VQnUsja9Y7K3K4+FfoW9ZDHSH5fGyV8KoRM7JFdUX89pGi4kQXl
 UE8WJmgCYdB+Cy8kp3OdCDOnhznqRoAld0gB70O5VPIP49LCvS2Q2OmelCAJsjHKei2QHnASrKA
 ukK5Dc0hvm+M4xAV7l1wK/1Qjk/nWaiaGIOjoFtMo0ZygZ9CtRGGAXo6KC3gV/G6ghBAh0GzS0X
 T1bH+di7q4V77GBN5XST3uoZYJNT0/z1eb4RK96+mMO6STpJfcEADk1MmSz2OZm9nUU2gkV7Ifr
 Txc6HUPgQu7aH70Lbf2X0Akw0oKPsqLyHRMDC8zuADnw==
X-Forward-Email-ID: 69f8ef6304bb1dff846bb8a5
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.7.7
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
Subject: [PATCH v4 06/17] drm: bridge: dw_hdmi: Remove previous_mode and mode_set
Date: Mon,  4 May 2026 19:10:43 +0000
Message-ID: <20260504191059.275928-7-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121144_273342_EF19C626 
X-CRM114-Status: GOOD (  12.60  )
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
v4: No change
v3: Collect r-b tag
v2: No change
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 19 +------------------
 1 file changed, 1 insertion(+), 18 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 7211beffd59e..a287bf56bd9f 100644
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
 					  struct drm_atomic_state *state)
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


