Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB50CD4F58
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 18:03:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wJnhBtAKYj8914+p1N910J9+JVRtN9gFjiQ73Zs/23Y=; b=OJAFcZftLXKUapUor0JlYDS8N0
	JnWudxgDRzFzhmtuPyQ51KyQpsY3DR3eId7HAirbaEFluaVhAI/r6P46Vj5HiOp9ndLl+zcvDj3o2
	Wc6hlRpe2SIKb6UbNWINtL94nDZwhKiYV3ySnJBhfO4ntxtC2teztbowPm/CbUqiffL56jqmqXweW
	J5ZaYiTLlSup4IGg3QVeOWdCAU1+ibE+KjrfAEiHMLJgtB5uscK+VK7szHU92mlGSghXSwCBKYdUZ
	rxSeAtnjHxpuEng+GVrqKeayN1zH4kngYBCTo4+jreEM9J5FZIr0omd4eVMXlsBYJH0i8eYm2jdL7
	2DYDED2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2Jg-0000000GUcm-44Gc;
	Mon, 18 May 2026 18:03:49 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wP2JW-0000000GUGS-2Mm8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 18:03:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1779127417; bh=wJnhBtAKYj8914+p1N910J9+JVRtN9gFjiQ73Zs/23Y=;
 b=j1Mo358QTlTs+oIlHWM/1N1O/mnkOjEMOGfmN+Gh4B2vLISLcgEGiRflPpWI531A/NmLbeGKn
 bZ/o6jp5QqnlYoZclyYFWFmeD0gOWepBDolDY6tcpjF3Lf5Cdtxl2TTpOH7rNtg8+jYm9e58ntJ
 DXUp9b1DvpOJmDMtVrRun1QWllnXmLnh+HCUZOP83lKiVdO0uDQNW/qcvsaOjUyB+N+B6ePGwqA
 h/aiIT8T42UNFAB1N+y6UyBVKjzbrCNX+ZnUFzJ610DAQY1lttivis4Yn4JhSpXmXzZ3ejbYN4s
 W0mQowooado9/CmBIUv0Z6SU55gjeiikwI+HLgXFAMWA==
X-Forward-Email-ID: 6a0b5476b84dbc72d2274faa
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
Subject: [PATCH v7 19/23] drm: bridge: dw_hdmi: Use delayed_work to debounce hotplug event
Date: Mon, 18 May 2026 18:01:55 +0000
Message-ID: <20260518180206.2480119-20-jonas@kwiboo.se>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260518180206.2480119-1-jonas@kwiboo.se>
References: <20260518180206.2480119-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_110338_778959_16CB5031 
X-CRM114-Status: GOOD (  22.66  )
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

The delayed work is only enabled between enable_hpd()/hpd_enable() and
disable_hpd()/hpd_disable() calls from core, i.e. enabled after
attach/bind/resume and disabled before detach/unbind/suspend.

The 1100 msec hotplug debounce timeout was arbitrarily picked to match
other drivers using same const, and testing using a Raspberry Pi Monitor
seem to use a 200-300 msec pulse when going from standby to power on
state.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
v7: Change to free irq before mute and clear using IH regs, also include
    clear of STAT0_RX_SENSE
v6: Change back to disable_delayed_work_sync() in hpd disable ops,
    Ensure HPD interrupt is masked and IRQ handler is disabled early
    in dw_hdmi_remove() to prevent any irq re-arming of delayed work,
    Drop use of suspend helper
v5: Change to none-sync disable_delayed_work() in hpd disable ops,
    Change to cancel_delayed_work_sync() in remove,
    Add cancel_delayed_work_sync() to new suspend helper
v4: Disable/mask delayed_work until enable_hpd()/hpd_enable(),
    Read connector status directly from HW regs in hpd_work
v3: New patch
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi.c | 80 +++++++++++++++++++++--
 1 file changed, 75 insertions(+), 5 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi.c
index 8afc9d240121..270db58a0e7c 100644
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
 	dw_hdmi_connector_status_update(hdmi, connector, connector->status);
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
+	disable_delayed_work_sync(&hdmi->hpd_work);
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
@@ -2968,6 +2987,20 @@ static const struct drm_edid *dw_hdmi_bridge_edid_read(struct drm_bridge *bridge
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
+	disable_delayed_work_sync(&hdmi->hpd_work);
+}
+
 static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
 	.atomic_destroy_state = drm_atomic_helper_bridge_destroy_state,
@@ -2981,6 +3014,8 @@ static const struct drm_bridge_funcs dw_hdmi_bridge_funcs = {
 	.mode_valid = dw_hdmi_bridge_mode_valid,
 	.detect = dw_hdmi_bridge_detect,
 	.edid_read = dw_hdmi_bridge_edid_read,
+	.hpd_enable = dw_hdmi_bridge_hpd_enable,
+	.hpd_disable = dw_hdmi_bridge_hpd_disable,
 };
 
 /* -----------------------------------------------------------------------------
@@ -3101,8 +3136,8 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 			status == connector_status_connected ?
 			"plugin" : "plugout");
 
-		if (hdmi->bridge.dev)
-			drm_helper_hpd_irq_event(hdmi->bridge.dev);
+		mod_delayed_work(system_percpu_wq, &hdmi->hpd_work,
+				 msecs_to_jiffies(HOTPLUG_DEBOUNCE_MS));
 	}
 
 	hdmi_writeb(hdmi, intr_stat, HDMI_IH_PHY_STAT0);
@@ -3112,6 +3147,29 @@ static irqreturn_t dw_hdmi_irq(int irq, void *dev_id)
 	return IRQ_HANDLED;
 }
 
+static void dw_hdmi_hpd_work(struct work_struct *work)
+{
+	struct dw_hdmi *hdmi = container_of(work, struct dw_hdmi, hpd_work.work);
+	struct drm_device *dev = hdmi->bridge.dev;
+
+	if (WARN_ON(!dev))
+		return;
+
+	/*
+	 * Notify the DRM core of the HPD event using drm_helper_hpd_irq_event()
+	 * instead of drm_bridge_hpd_notify(). This will cause the DRM function
+	 * check_connector_changed() to be called, which in turn calls the
+	 * connector detect()/force() funcs to detect any connection status or
+	 * epoch changes. The bridge connector detect() func also ensures that
+	 * any hpd_notify() funcs are called for all bridges in the chain.
+	 *
+	 * drm_bridge_hpd_notify() shares a mutex with drm_bridge_hpd_disable(),
+	 * and can result in a deadlock due to the disable_delayed_work_sync()
+	 * call to wait on work to complete in dw_hdmi_bridge_hpd_disable().
+	 */
+	drm_helper_hpd_irq_event(dev);
+}
+
 static const struct dw_hdmi_phy_data dw_hdmi_phys[] = {
 	{
 		.type = DW_HDMI_PHY_DWC_HDMI_TX_PHY,
@@ -3396,6 +3454,9 @@ struct dw_hdmi *dw_hdmi_probe(struct platform_device *pdev,
 		goto err_res;
 	}
 
+	INIT_DELAYED_WORK(&hdmi->hpd_work, dw_hdmi_hpd_work);
+	disable_delayed_work(&hdmi->hpd_work);
+
 	ret = devm_request_threaded_irq(dev, irq, dw_hdmi_hardirq,
 					dw_hdmi_irq, IRQF_SHARED,
 					dev_name(dev), hdmi);
@@ -3532,6 +3593,18 @@ EXPORT_SYMBOL_GPL(dw_hdmi_probe);
 
 void dw_hdmi_remove(struct dw_hdmi *hdmi)
 {
+	struct platform_device *pdev = to_platform_device(hdmi->dev);
+	int irq = platform_get_irq(pdev, 0);
+
+	/* Free, mute and clear phy interrupts */
+	devm_free_irq(hdmi->dev, irq, hdmi);
+	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
+	hdmi_writeb(hdmi, HDMI_IH_PHY_STAT0_HPD | HDMI_IH_PHY_STAT0_RX_SENSE,
+		    HDMI_IH_PHY_STAT0);
+
+	/* Cancel any pending hot plug work */
+	cancel_delayed_work_sync(&hdmi->hpd_work);
+
 	drm_bridge_remove(&hdmi->bridge);
 
 	if (hdmi->audio && !IS_ERR(hdmi->audio))
@@ -3539,9 +3612,6 @@ void dw_hdmi_remove(struct dw_hdmi *hdmi)
 	if (!IS_ERR(hdmi->cec))
 		platform_device_unregister(hdmi->cec);
 
-	/* Disable all interrupts */
-	hdmi_writeb(hdmi, ~0, HDMI_IH_MUTE_PHY_STAT0);
-
 	if (hdmi->i2c)
 		i2c_del_adapter(&hdmi->i2c->adap);
 	else
-- 
2.54.0


