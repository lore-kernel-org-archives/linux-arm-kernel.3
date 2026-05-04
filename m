Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B894DCD3427
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 May 2026 19:12:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7r4j/cIIbHblsYJNpSFl32UgTklMpNIhimhDTe7b9kw=; b=zed6R2wiot4A5Ztpx11sUXRAJh
	7GNbJiW7gRtJZnMCbKWrQxOWYJP98UY9JutVX4jL+YAm4ZzgQwS9fJS7XU4Qrq8cdiQG+DqOwSNcj
	mCFZR6d/cCfLM6SUYmvPp4CDUTIWDoo7avbi4QkCQ40lb5tdFMYqYiRWRPwLolQOqCQwNbOAOktR/
	WSyv80svQTWx9f1AZHETNkD/CNscAD8CbMUNCW+YXaNoCUseBuamJkV+h13JfxXA3sa85WXoQ4h/y
	9RI7GGwblNY7/sVkiUMvn/9wk/yhr6f//WyqN/easvbc26swYIhEvI6IL3utbziM5nIQ5fORwEtji
	ZlUkQpww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyi9-0000000E5zJ-11Dn;
	Mon, 04 May 2026 19:12:09 +0000
Received: from smtp.forwardemail.net ([121.127.44.66])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wJyhv-0000000E5Z4-36M2
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 May 2026 19:11:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1777921914; bh=7r4j/cIIbHblsYJNpSFl32UgTklMpNIhimhDTe7b9kw=;
 b=OpkOBr/alX5CfUgX31IARt7qSztoO/oR7dNAQhRBg+10PSBJ3+WNbZU3leibzzyhTGq+EDZtP
 6IPjjQYjWYW+98JNI/gLBQr0RhCEtYh+b9SuX2DOIGR1AvpsD5nK4ofdWWDy36U0Efcx/lsGPWc
 ZyNnx/Uni+ln5u9mSi9j+Dl/wv5ObucsXh2PAHCVzBNKHzBGlz7DbyiAlh4XVC+MNLD+MKn4QR9
 ZnPpTtguEP/PY9aKcb+HdKPopnm0Itwfhjjpuxp7uUffZR2dshUnegB3Tn/l4FMLKcgFwbyac2F
 ySE5YFOp9SLwMxYT88wpVJU1j7NMhy+P3FK7FJ7zJS6g==
X-Forward-Email-ID: 69f8ef7704bb1dff846bb949
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.66
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
Subject: [PATCH v4 11/17] drm: bridge: dw_hdmi: Use display_info is_hdmi and has_audio
Date: Mon,  4 May 2026 19:10:48 +0000
Message-ID: <20260504191059.275928-12-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260504191059.275928-1-jonas@kwiboo.se>
References: <20260504191059.275928-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260504_121155_954669_2669712B 
X-CRM114-Status: GOOD (  14.47  )
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

drm_edid_connector_update() is being called from bridge connector funcs
and from detect and force funcs for dw-hdmi connector.

Change to use is_hdmi and has_audio from display_info directly instead
of keeping our own state in sink_is_hdmi and sink_has_audio.

Also remove the old and unused edid struct member and related define.

Reviewed-by: Neil Armstrong <neil.armstrong@linaro.org>
Reviewed-by: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>
Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v4: Collect r-b tag
v3: No change
v2: Collect r-b tag
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 32 ++++-------------------
 1 file changed, 5 insertions(+), 27 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 47616c11fcd7..4c712aa07a89 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -46,8 +46,6 @@
 #define DDC_CI_ADDR		0x37
 #define DDC_SEGMENT_ADDR	0x30
 
-#define HDMI_EDID_LEN		512
-
 /* DW-HDMI Controller >= 0x200a are at least compliant with SCDC version 1 */
 #define SCDC_MIN_SOURCE_VERSION	0x1
 
@@ -147,8 +145,6 @@ struct dw_hdmi {
 
 	int vic;
 
-	u8 edid[HDMI_EDID_LEN];
-
 	struct {
 		const struct dw_hdmi_phy_ops *ops;
 		const char *name;
@@ -158,8 +154,6 @@ struct dw_hdmi {
 
 	struct i2c_adapter *ddc;
 	void __iomem *regs;
-	bool sink_is_hdmi;
-	bool sink_has_audio;
 
 	struct pinctrl *pinctrl;
 	struct pinctrl_state *default_state;
@@ -2056,7 +2050,7 @@ static void hdmi_av_composer(struct dw_hdmi *hdmi,
 		HDMI_FC_INVIDCONF_IN_I_P_INTERLACED :
 		HDMI_FC_INVIDCONF_IN_I_P_PROGRESSIVE;
 
-	inv_val |= hdmi->sink_is_hdmi ?
+	inv_val |= display->is_hdmi ?
 		HDMI_FC_INVIDCONF_DVI_MODEZ_HDMI_MODE :
 		HDMI_FC_INVIDCONF_DVI_MODEZ_DVI_MODE;
 
@@ -2292,7 +2286,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
 	if (hdmi->hdmi_data.enc_out_bus_format == MEDIA_BUS_FMT_FIXED)
 		hdmi->hdmi_data.enc_out_bus_format = MEDIA_BUS_FMT_RGB888_1X24;
 
-	hdmi->hdmi_data.rgb_limited_range = hdmi->sink_is_hdmi &&
+	hdmi->hdmi_data.rgb_limited_range = display->is_hdmi &&
 		drm_default_rgb_quant_range(mode) ==
 		HDMI_QUANTIZATION_RANGE_LIMITED;
 
@@ -2312,7 +2306,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
 	/* HDMI Initialization Step B.3 */
 	dw_hdmi_enable_video_path(hdmi);
 
-	if (hdmi->sink_has_audio) {
+	if (display->has_audio) {
 		dev_dbg(hdmi->dev, "sink has audio support\n");
 
 		/* HDMI Initialization Step E - Configure audio */
@@ -2321,7 +2315,7 @@ static int dw_hdmi_poweron(struct dw_hdmi *hdmi,
 	}
 
 	/* not for DVI mode */
-	if (hdmi->sink_is_hdmi) {
+	if (display->is_hdmi) {
 		dev_dbg(hdmi->dev, "%s HDMI mode\n", __func__);
 
 		/* HDMI Initialization Step F - Configure AVI InfoFrame */
@@ -2435,29 +2429,13 @@ static const struct drm_edid *dw_hdmi_edid_read(struct dw_hdmi *hdmi,
 						struct drm_connector *connector)
 {
 	const struct drm_edid *drm_edid;
-	const struct edid *edid;
 
 	if (!hdmi->ddc)
 		return NULL;
 
 	drm_edid = drm_edid_read_ddc(connector, hdmi->ddc);
-	if (!drm_edid) {
+	if (!drm_edid)
 		dev_dbg(hdmi->dev, "failed to get edid\n");
-		return NULL;
-	}
-
-	/*
-	 * FIXME: This should use connector->display_info.is_hdmi and
-	 * connector->display_info.has_audio from a path that has read the EDID
-	 * and called drm_edid_connector_update().
-	 */
-	edid = drm_edid_raw(drm_edid);
-
-	dev_dbg(hdmi->dev, "got edid: width[%d] x height[%d]\n",
-		edid->width_cm, edid->height_cm);
-
-	hdmi->sink_is_hdmi = drm_detect_hdmi_monitor(edid);
-	hdmi->sink_has_audio = drm_detect_monitor_audio(edid);
 
 	return drm_edid;
 }
-- 
2.54.0


