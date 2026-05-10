Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 18904CD37B6
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 May 2026 12:44:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eodtZh9iVaDz2B6vyj0+s8P/hIWI6CUTD/IskUTvobM=; b=1yg+bjkYn98qCtZ9v1++rdwfN3
	zbTv5Va76l0tUpzJuv+0zVGHOEp1BrsLK8lyVCXy+N8k+5nnsr6MnhIIVNoj0yfV4QNWUkePvKSmn
	QFNNkn2kc2JnK6NtdWt/oIxhSQCBo8yd0msRluZAmWxQxi4Jh/6NB7AlusETNx1cqSshGed1S59If
	FbYbZTUMiMslACSgqj3EsZDkGnnTbdMlZhHhIl5eaBblKOkZik8lR7xkJU5atHZJXfmREaS8LINNc
	FYOnUSWrX+B1NbVDc7cA3O3aCA5zn2wi0rZiIb20cFZCVinTfgTBc/O2K8jAjZ8Y1VuY5eMlHbvTU
	ZSDfa6rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Vw-0000000Am7T-45Le;
	Sun, 10 May 2026 12:44:08 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wM3Vr-0000000Alzo-3l3V
	for linux-arm-kernel@lists.infradead.org;
	Sun, 10 May 2026 12:44:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1778417043; bh=eodtZh9iVaDz2B6vyj0+s8P/hIWI6CUTD/IskUTvobM=;
 b=K0Je3krxoGd2v4z/Cyf7MLb9OG7lpYtKC/o6LSETAy6S4y8YF6v5yQ8RK0a2XUbCpfvXqesQ3
 BwU/GHlWaf9mDuq1aeCLwPtfJuQxDNRun72Z/bAc1Jahd+kr0AAhEyCRvi1wxl29KIo39O1wVmt
 r4b+ZnArcoiSVbUhv96iSTd2h6wu/1lKAVwHnv9lzoGJg9h+bv79dcIC7r5yW7kuNZxXRrYJIfo
 ndwXpX9IWvTSv9BWswxsP+EirZ4GV7KRjollIn7+WkJ84B2mArlQlALrMq6NC3pECh6S5o5lUcK
 6IRYfOxjl0DrCBGSl/Kz+gszFtlLAXIfEfl9uXdT0CJA==
X-Forward-Email-ID: 6a007d370d91f03a31a0bd00
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
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
Subject: [PATCH v5 16/21] drm: bridge: dw_hdmi: Use delayed_work to debounce hotplug event
Date: Sun, 10 May 2026 12:41:00 +0000
Message-ID: <20260510124111.1226584-17-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260510124111.1226584-1-jonas@kwiboo.se>
References: <20260510124111.1226584-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260510_054403_960724_7D3F0872 
X-CRM114-Status: GOOD (  16.50  )
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

HDMI Specification Version 1.4b chapter 8.5 mentions:

  An HDMI Sink shall not assert high voltage level on its Hot Plug
  Detect pin when the E-EDID is not available for reading.

  A Source may use a high voltage level Hot Plug Detect signal to
  initiate the reading of E-EDID data.

  An HDMI Sink shall indicate any change to the contents of the E-EDID
  by driving a low voltage level pulse on the Hot Plug Detect pin. This
  pulse shall be at least 100 msec.

Use a delayed work to debounce reacting on HPD events to improve
handling of a HPD low voltage level pulse when a sink changes the EDID.

The delayed work is only active between enable_hpd()/hpd_enable() and
disable_hpd()/hpd_disable() calls from core, i.e. enabled after
attach/bind/resume and disabled before detach/unbind/suspend.

The 1100 msec hotplug debounce timeout was arbitrarily picked to match
other drivers using same const, and testing using a Raspberry Pi Monitor
seem to use a 200-300 msec pulse when going from standby to power on
state.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v5: Change to none-sync disable_delayed_work() in hpd disable ops,
    Change to cancel_delayed_work_sync() in remove,
    Add cancel_delayed_work_sync() to new suspend helper
v4: Disable/mask delayed_work until enable_hpd()/hpd_enable(),
    Read connector status directly from HW regs in hpd_work
v3: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 60 +++++++++++++++++++++--
 1 file changed, 56 insertions(+), 4 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index a6f2702bca83..f32eea9106b0 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
@@ -50,6 +50,8 @@
 
 #define HDMI14_MAX_TMDSCLK	340000000
 
+#define HOTPLUG_DEBOUNCE_MS	1100
+
 static const u16 csc_coeff_default[3][4] = {
 	{ 0x2000, 0x0000, 0x0000, 0x0000 },
 	{ 0x0000, 0x2000, 0x0000, 0x0000 },
@@ -185,6 +187,7 @@ struct dw_hdmi {
 	hdmi_codec_plugged_cb plugged_cb;
 	struct device *codec_dev;
 	enum drm_connector_status last_connector_result;
+	struct delayed_work hpd_work;
 };
 
 const struct dw_hdmi_plat_data *dw_hdmi_to_plat_data(struct dw_hdmi *hdmi)
@@ -2517,6 +2520,20 @@ static void dw_hdmi_connector_force(struct drm_connector *connector)
 	dw_hdmi_connector_status_update(connector, connector->status);
 }
 
+static void dw_hdmi_connector_enable_hpd(struct drm_connector *connector)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
+
+	enable_delayed_work(&hdmi->hpd_work);
+}
+
+static void dw_hdmi_connector_disable_hpd(struct drm_connector *connector)
+{
+	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
+
+	disable_delayed_work(&hdmi->hpd_work);
+}
+
 static void dw_hdmi_connector_destroy(struct drm_connector *connector)
 {
 	struct dw_hdmi *hdmi = container_of(connector, struct dw_hdmi, connector);
@@ -2538,6 +2555,8 @@ static const struct drm_connector_funcs dw_hdmi_connector_funcs = {
 static const struct drm_connector_helper_funcs dw_hdmi_connector_helper_funcs = {
 	.get_modes = dw_hdmi_connector_get_modes,
 	.atomic_check = dw_hdmi_connector_atomic_check,
+	.enable_hpd = dw_hdmi_connector_enable_hpd,
+	.disable_hpd = dw_hdmi_connector_disable_hpd,
 };
 
 static int dw_hdmi_connector_create(struct dw_hdmi *hdmi)
@@ -2959,6 +2978,20 @@ static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge
 	return dw_hdmi_edid_read(hdmi, connector);
 }
 
+static void dw_hdmi_bridge_hpd_enable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	enable_delayed_work(&hdmi->hpd_work);
+}
+
+static void dw_hdmi_bridge_hpd_disable(struct drm_bridge *bridge)
+{
+	struct dw_hdmi *hdmi = bridge->driver_private;
+
+	disable_delayed_work(&hdmi->hpd_work);
+}
+
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -2972,6 +3005,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 	.detect = dw_hdmi_bridge_detect,
 	.edid_read = dw_hdmi_bridge_edid_read,
+	.hpd_enable = dw_hdmi_bridge_hpd_enable,
+	.hpd_disable = dw_hdmi_bridge_hpd_disable,
 };
 
 /* -----------------------------------------------------------------------------
@@ -3092,10 +3127,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			status == connector_status_connected ?
 			"plugin" : "plugout");
 
-		if (hdmi->bridge.dev) {
-			drm_helper_hpd_irq_event(hdmi->bridge.dev);
-			drm_bridge_hpd_notify(&hdmi->bridge, status);
-		}
+		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
+				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
@@ -3105,6 +3138,19 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void dw_hdmi_hpd_work(struct work_struct *work)
+{
+	struct dw_hdmi *hdmi = container_of(work, struct dw_hdmi, hpd_work.work);
+	enum drm_connector_status status;
+
+	if (WARN_ON(!hdmi->bridge.dev))
+		return;
+
+	drm_helper_hpd_irq_event(hdmi->bridge.dev);
+	status = dw_hdmi_phy_read_hpd(hdmi, hdmi->phy.data);
+	drm_bridge_hpd_notify(&hdmi->bridge, status);
+}
+
 static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
 	{
 		.type = DW_HDMI_PHY_DWC_HDMI_TX_PHY,
@@ -3389,6 +3435,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		goto err_res;
 	}
 
+	INIT_DELAYED_WORK(&hdmi->hpd_work, dw_hdmi_hpd_work);
+	disable_delayed_work(&hdmi->hpd_work);
+
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
@@ -3521,6 +3570,8 @@ EXPORT_SYMBOL_GPL(dw_hdmi_probe);
 
 void dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
+	cancel_delayed_work_sync(&hdmi->hpd_work);
+
 	drm_bridge_remove(&hdmi->bridge);
 
 	if (hdmi->audio && !IS_ERR(hdmi->audio))
@@ -3570,6 +3621,7 @@ EXPORT_SYMBOL_GPL(dw_hdmi_unbind);
 
 void dw_hdmi_suspend(struct dw_hdmi *hdmi)
 {
+	cancel_delayed_work_sync(&hdmi->hpd_work);
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_suspend);
 
-- 
2.54.0


