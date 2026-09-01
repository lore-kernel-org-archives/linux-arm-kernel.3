Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1C1E6C624D3
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Sep 2026 18:52:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cA+bbiCniqm7UNPiwvpddneSVwGhcae4Oh7Uu9E2Lh0=; b=fWBGFdUnVLdqyfsRB1Kk5LzdRn
	Wisw6/EiDVxzh289WKVVcOadLiH+VWlJrxFw4K3U9qk13QgsqakaTvxnmPZ7UzV7Z23bDzC40JcOU
	hEEgjaUL73WxJoqm0w+HSwU1PVXb+hy8BcbIGkWrQ3AnpvT/Lbcd0HJ1fni0qT2vnHSnNN2JdnpRn
	zgaqkrv6WMvkYqSKL6tiOan43CtJWeYz5+vqnG9KHVxVF32vECK4AoEVaJMXI8ZJ9Hu/hGVz0DBrB
	3NaVdjk4omQsSpAY9Od3PKC8C/KWFC7imRaB6JvBJm1TLA4RoxZXQWvozSNmXX+xR2CDtZLboybwm
	tbjN4DGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TaR-0000000D2Ke-2TjT;
	Tue, 01 Sep 2026 18:51:59 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x1TZb-0000000D14w-26Tj;
	Tue, 01 Sep 2026 18:51:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=cA+bbiCniqm7UNPiwvpddneSVwGhcae4Oh7Uu9E2Lh0=; b=FQTkCeAV3Q5hqQwF5GyAY1beZY
	Bq5CWf042C36Z3R4+69Id8qDQd1bw+pVT3rgHfxKle9H7/8cnNpbkoKoNE15CTOze/xjbRUxtJavk
	LjZjajkLROcgZ6oJddUxN8u8M4+3/zibhA29PfMjgU9ei/MF86SgkC/Ml4K8ckeoliX3qwMeFGjXn
	vvlm0g9HPUIEg4RtwK5ISNsMvRCvjeENSoBW6U7XNlA2SuyKaKSPLazXhcQNUzSXkmzZbTpWLHXmt
	fXYS655uVGs3pL8nReLk68TdfozUGUn7hWSxe6oN8IsdzSh/BOqs+rIw2hVGdPZTB6+mVFHh6Vs7x
	96DtGX/Q==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x1TZY-0000000BHNk-2XNe;
	Tue, 01 Sep 2026 18:51:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1788288663;
	bh=qtNL65/c4PhNmZPiAInduzePTu8PpXnaj5N7uxfmkyI=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=La/wzkFQKk9opqOqO3qi/KrubJMngitsHR7w+DZyLbGJRjEseGYzIt2NYp264hS9m
	 5iBH8lXQCIWl/fgsxKluH9VkUnJ1TKpswcqR/m09bSqX8uH82NLy3ljo1q/yOfFcjk
	 0XsGWFAXv2AuTTOvC0geW6xDnEnJAu+0MFRXf8hNZeMjn/r4KY//Q0mw6biyZsc3vk
	 so+QNj3hyEtOW1D5CAOKtgnDaEb64s3ILjxW3tGZygGBKdOLb83A8S2c3LV+/Zns9e
	 J/lPFn40gXC/+xgCCQSHA0RnwSBfczikxbbwRYu6EpHctQbiLrCP5KubJfaj9wneS7
	 z5cokJxjxRTHg==
Received: from localhost (unknown [100.64.0.241])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange secp256r1 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: cristicc)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3A4B517E3A04;
	Tue, 01 Sep 2026 20:51:03 +0200 (CEST)
From: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
Date: Tue, 01 Sep 2026 21:50:54 +0300
Subject: [PATCH v11 30/74] drm/bridge: dw-hdmi-qp: Provide
 dw_hdmi_qp_hpd_notify() helper
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260901-dw-hdmi-qp-scramb-v11-30-bc12954a0688@collabora.com>
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
 linux-fbdev@vger.kernel.org, Maud Spierings <maud_spierings@hotmail.com>, 
 Diederik de Haas <diederik@cknow-tech.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260901_195104_795720_2ABC6BBE 
X-CRM114-Status: GOOD (  16.95  )
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

Export dw_hdmi_qp_hpd_notify() for platform drivers to report hot-plug
detection events.  Unlike drm_helper_hpd_irq_event() which polls all
connectors, this helper targets only the affected connector and ensures
.detect_ctx() is invoked on reconnection events to trigger SCDC state
recovery.

Note that this helper may sleep, so it must only be called from a
threaded HPD interrupt handler or a work function.

Tested-by: Maud Spierings <maud_spierings@hotmail.com>
Tested-by: Diederik de Haas <diederik@cknow-tech.com>  # NanoPC-T6 LTS, Rock 5B
Signed-off-by: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c | 37 ++++++++++++++++++++++++++++
 include/drm/bridge/dw_hdmi_qp.h              |  1 +
 2 files changed, 38 insertions(+)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
index ee74266b7aa9..a2277531182c 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-hdmi-qp.c
@@ -28,6 +28,7 @@
 #include <drm/drm_edid.h>
 #include <drm/drm_modes.h>
 #include <drm/drm_print.h>
+#include <drm/drm_probe_helper.h>
 
 #include <media/cec.h>
 
@@ -163,6 +164,8 @@ struct dw_hdmi_qp {
 	struct regmap *regm;
 	int main_irq;
 
+	/* Written by the atomic enable/disable hooks, read locklessly by HPD */
+	struct drm_connector *curr_conn;
 	unsigned long tmds_char_rate;
 	bool no_hpd;
 };
@@ -785,6 +788,8 @@ static void dw_hdmi_qp_bridge_atomic_enable(struct drm_bridge *bridge,
 	dw_hdmi_qp_mod(hdmi, op_mode, OPMODE_DVI, LINK_CONFIG0);
 
 	drm_atomic_helper_connector_hdmi_update_infoframes(connector, state);
+
+	WRITE_ONCE(hdmi->curr_conn, connector);
 }
 
 static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
@@ -793,6 +798,7 @@ static void dw_hdmi_qp_bridge_atomic_disable(struct drm_bridge *bridge,
 	struct dw_hdmi_qp *hdmi = bridge->driver_private;
 	struct drm_connector *connector;
 
+	WRITE_ONCE(hdmi->curr_conn, NULL);
 	hdmi->tmds_char_rate = 0;
 
 	connector = drm_atomic_get_old_connector_for_encoder(state, bridge->encoder);
@@ -1409,6 +1415,37 @@ struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 }
 EXPORT_SYMBOL_GPL(dw_hdmi_qp_bind);
 
+/**
+ * dw_hdmi_qp_hpd_notify() - Notify a hot-plug detection event
+ * @hdmi: pointer to the DW HDMI QP controller
+ *
+ * Platform drivers should call this from their threaded IRQ handler or work
+ * function to notify the bridge of a connection status change.
+ * The bridge's .read_hpd() phy_ops callback is used to read the current
+ * connection status.
+ */
+void dw_hdmi_qp_hpd_notify(struct dw_hdmi_qp *hdmi)
+{
+	struct drm_connector *conn = READ_ONCE(hdmi->curr_conn);
+	enum drm_connector_status status;
+
+	status = hdmi->phy.ops->read_hpd(hdmi, hdmi->phy.data);
+	dev_dbg(hdmi->dev, "%s status=%d\n", __func__, status);
+
+	/*
+	 * When the display pipeline has been already active, switch to
+	 * drm_connector_helper_hpd_irq_event() to ensure .detect_ctx()
+	 * gets invoked, i.e. via drm_helper_probe_detect(), because
+	 * drm_bridge_hpd_notify() defers to a delayed hotplug path in
+	 * this case.
+	 */
+	if (conn && status == connector_status_connected)
+		drm_connector_helper_hpd_irq_event(conn);
+	else
+		drm_bridge_hpd_notify(&hdmi->bridge, status);
+}
+EXPORT_SYMBOL_GPL(dw_hdmi_qp_hpd_notify);
+
 void dw_hdmi_qp_suspend(struct device *dev, struct dw_hdmi_qp *hdmi)
 {
 	disable_irq(hdmi->main_irq);
diff --git a/include/drm/bridge/dw_hdmi_qp.h b/include/drm/bridge/dw_hdmi_qp.h
index b80fceffc315..b4fb1c578a5b 100644
--- a/include/drm/bridge/dw_hdmi_qp.h
+++ b/include/drm/bridge/dw_hdmi_qp.h
@@ -36,6 +36,7 @@ struct dw_hdmi_qp_plat_data {
 struct dw_hdmi_qp *dw_hdmi_qp_bind(struct platform_device *pdev,
 				   struct drm_encoder *encoder,
 				   const struct dw_hdmi_qp_plat_data *plat_data);
+void dw_hdmi_qp_hpd_notify(struct dw_hdmi_qp *hdmi);
 void dw_hdmi_qp_suspend(struct device *dev, struct dw_hdmi_qp *hdmi);
 void dw_hdmi_qp_resume(struct device *dev, struct dw_hdmi_qp *hdmi);
 #endif /* __DW_HDMI_QP__ */

-- 
2.55.0


