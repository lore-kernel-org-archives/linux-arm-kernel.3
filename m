Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5631EC53219
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 17:41:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wN7ncCUCue1THMY2ZKNcVQ93G8DYx44tp9E4VnUYbxg=; b=NL/7t2xvCARruMy1fyzByo5p15
	2vt9OKhPKaQg/spGDaDc50DixbmsMBSCHr2+fMIaGlZ2lLrOpRbuRcNjZ/MeYf93aiPM+E6coGpDP
	FGBxWDmeoTWYhKOdeAJds5z4/TEvAGId0iT7ala311ORMcCGUKSqoICUy0rzapqRQ44Vkm+09m3ZB
	ymUAcIw1YXalpg2pPUnlseCjBm4SokfPkNfC0Gw8qjTiMimyB7mi0yQP548zbHUVeEh+MP+Qx1R94
	xZHHnIm5ILs4mwPL8B2BZ1R1HlzJtU2q0Jaipv2pLPu2yNUaDrQICygVRRWZHVQBDPwvo0AKqd70Q
	jPrTd/PA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnv-00000005zTN-3EsQ;
	Tue, 28 Jul 2026 17:41:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wolnV-00000005z74-00Ax;
	Tue, 28 Jul 2026 17:40:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=wN7ncCUCue1THMY2ZKNcVQ93G8DYx44tp9E4VnUYbxg=; b=cm1Pq3V/vPtW96y3xQg+M3Wg7K
	e5ovIQSkVD8kGlq9Q+DZ9x4AHEhRkdtE1vFCg+I8dZX1pj/Hzt4oXzdg8ZlNM66lLGkkD1JrToP6E
	QYNCYW3ZFTnHW69oDxagGdwlNsv98yeK21nPHtXfLel0pIee+N8TjxE8pM02aMxUpAm5dcH3FKWtM
	aeDyUIP1zIxs5R/nKwY27MyqjuW3LgGWHNxnVy9zhdOQkDK/d+3R0PDqqX+q16azyabRoF6hbx3K5
	QbFMHjRuMqACakqrKjXeZN96sDcw7mXaFpNwB31b/t3/HZeMYBbsORCDWJHKaOXpAlYAQjMcAp+5Q
	nsrsDNdg==;
Received: from bali.collaboradmins.com ([148.251.105.195])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1wolnS-00000005ARb-09DA;
	Tue, 28 Jul 2026 17:40:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1785260447;
	bh=q3naHX5TmJ2Z3PeAve02mXkhV6rTbeaS0T7QKybg3Xo=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=DaFKI57GhzeZV1sIDb6/SfQ/xh/tg0DPGAnVOQwLJnebwdv+BjDgbFJ/Dxm3rmZiz
	 rd48Es2vFiIDorpbXt1djY6gozDGodr70fU6ZqY1mjD0/xi9P9IJH2x8cdd+Ldr8Xa
	 4u1aR0v5frSvejmtNl5veKVAyBNgCHrFp9cmX50jXDDeh7ru8b3UogWtazAtbNCioI
	 5QUjyza9N28W5HKMQ5YBY4uYdrA1yL9R8e4qCXTRHJZ38rnobmqvwwYg6Ta1A72Gdd
	 262jzwEEflngATh3GpHmPYHTutqvh/z0ShwmF7H1apGJqt27ecnrcJ8SLHp/vxdFCC
	 U8z6Ls8lGH0og==
Received: from jupiter.universe (unknown [100.64.1.62])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519)
	(No client certificate requested)
	(Authenticated sender: sre)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id C71EE17E079B;
	Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
Received: by jupiter.universe (Postfix, from userid 1000)
	id 1B6ED48004C; Tue, 28 Jul 2026 19:40:46 +0200 (CEST)
From: Sebastian Reichel <sebastian.reichel@collabora.com>
Date: Tue, 28 Jul 2026 19:40:48 +0200
Subject: [PATCH v7 12/18] drm/bridge: synopsys: dw-dp: Add Runtime PM
 support
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260728-synopsys-dw-dp-improvements-v7-12-b7640fa8cf48@collabora.com>
References: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
In-Reply-To: <20260728-synopsys-dw-dp-improvements-v7-0-b7640fa8cf48@collabora.com>
To: Sandy Huang <hjc@rock-chips.com>, 
 =?utf-8?q?Heiko_St=C3=BCbner?= <heiko@sntech.de>, 
 Andy Yan <andy.yan@rock-chips.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
Cc: Cristian Ciocaltea <cristian.ciocaltea@collabora.com>, 
 Damon Ding <damon.ding@rock-chips.com>, Dmitry Baryshkov <lumag@kernel.org>, 
 Alexey Charkov <alchark@flipper.net>, dri-devel@lists.freedesktop.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 devicetree@vger.kernel.org, kernel@collabora.com, 
 linux-arm-kernel@lists.infradead.org, 
 Sebastian Reichel <sebastian.reichel@collabora.com>
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7079;
 i=sebastian.reichel@collabora.com; h=from:subject:message-id;
 bh=q3naHX5TmJ2Z3PeAve02mXkhV6rTbeaS0T7QKybg3Xo=;
 b=owJ4nAFtApL9kA0DAAoB2O7X88g7+poByyZiAGpo6Z3yCNlxFCWC1Xm4dXQ3oWYD6Psr9YJUS
 EqEGmBpn/eoyIkCMwQAAQoAHRYhBO9mDQdGP4tyanlUE9ju1/PIO/qaBQJqaOmdAAoJENju1/PI
 O/qa8OYP/3967NHapl8E1EHsBpz2gx8QSQfvRnq02DuHwt0ijWR+s0+m4qShF63nEJpaT1ozIcv
 Y7u0LazDkse5uU+WyS+xWYJvpJkx79H3Z3AeUcg1xiOqQpt12s4+uB9d091DbNpXDKfrmJ66jsZ
 fE4vfku6QqTi3PxlRZc9no81s4qKUaooKtS65dfg3OPBCYX2+14RwH/eWjujwHVO5OQIfHemfPQ
 33ioA+3lyVzJabDnynbGUiSlf0O1VYu6sHM2wxoVdeUS3nuR9tFWmEkkh5dErFpL3X4k43ZVFbp
 usoAlWBp8IOFw1Rehm79sk7SH5+CJaEcmSWGWhRHRwW5PRIGqWlxlvvQSOx9hekXYkr3FaHGzq3
 Elmyt6/U6lEiOxX2fa3U6Ncl/3XcWUsrW8+5E5RDVvY/ZMlbDaHsQoiHHn/ry3N6kpdk1Mc0BVg
 8jCGchP3K4G7o4LHSb5sh5eJOCV6vCv8ru6KqYZlH6bYdbHS6R64mLY0UifVIRzneFS1jC+ffJC
 ND2tGCP7f9TErHYUHX8wTcXpGvs996o3FjtSMlh8s+0bV9OAGBo6brZpmDv0XQF4b6eGian7Lpp
 1dnPYxspR4NRnaa7TTwVL/9nxifIgXMoW/Px0af9u9nv//gRlX72tiTg7OE+erpZf8zm9kCWNnt
 CX0eSNZN2luttpXwukbBDTg==
X-Developer-Key: i=sebastian.reichel@collabora.com; a=openpgp;
 fpr=EF660D07463F8B726A795413D8EED7F3C83BFA9A
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260728_184054_336808_19EFB975 
X-CRM114-Status: GOOD (  17.89  )
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

Add runtime PM stubs to the Synopsys DesignWare DisplayPort bridge
driver. Support is not enabled automatically and must be hooked up
in the vendor specific glue code.

Signed-off-by: Sebastian Reichel <sebastian.reichel@collabora.com>
---
 drivers/gpu/drm/bridge/synopsys/dw-dp.c | 126 ++++++++++++++++++++++++++++++--
 include/drm/bridge/dw_dp.h              |   3 +
 2 files changed, 121 insertions(+), 8 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-dp.c b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
index d4f75b7f85d0..8b650f904575 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-dp.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-dp.c
@@ -328,6 +328,9 @@ struct dw_dp {
 	struct dw_dp_link link;
 	struct dw_dp_plat_data plat_data;
 	u8 pixel_mode;
+	bool usbc_mode;
+	bool pm_active;
+	bool drm_bound;
 
 	struct drm_bridge *next_bridge;
 
@@ -1467,6 +1470,11 @@ static ssize_t dw_dp_aux_transfer(struct drm_dp_aux *aux,
 	if (WARN_ON(msg->size > 16))
 		return -E2BIG;
 
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dp->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return ret;
+
 	reinit_completion(&dp->complete);
 
 	switch (msg->request & ~DP_AUX_I2C_MOT) {
@@ -1664,6 +1672,13 @@ static void dw_dp_bridge_atomic_enable(struct drm_bridge *bridge,
 	struct drm_connector_state *conn_state;
 	int ret;
 
+	ret = pm_runtime_get_active(dp->dev, RPM_TRANSPARENT);
+	if (ret) {
+		dev_err(dp->dev, "runtime PM failure\n");
+		return;
+	}
+	dp->pm_active = true;
+
 	connector = drm_atomic_get_new_connector_for_encoder(state, bridge->encoder);
 	if (!connector) {
 		dev_err(dp->dev, "failed to get connector\n");
@@ -1714,10 +1729,15 @@ static void dw_dp_bridge_atomic_disable(struct drm_bridge *bridge,
 {
 	struct dw_dp *dp = bridge_to_dp(bridge);
 
+	if (!dp->pm_active)
+		return;
+	dp->pm_active = false;
+
 	dw_dp_video_disable(dp);
 	dw_dp_link_disable(dp);
 	bitmap_zero(dp->sdp_reg_bank, SDP_REG_BANK_SIZE);
 	dw_dp_reset(dp);
+	pm_runtime_put_autosuspend(dp->dev);
 }
 
 static bool dw_dp_hpd_detect_link(struct dw_dp *dp, struct drm_connector *connector)
@@ -1738,6 +1758,10 @@ static enum drm_connector_status dw_dp_bridge_detect(struct drm_bridge *bridge,
 {
 	struct dw_dp *dp = bridge_to_dp(bridge);
 
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dp->dev, pm);
+	if (PM_RUNTIME_ACQUIRE_ERR(&pm))
+		return connector_status_disconnected;
+
 	if (!dw_dp_hpd_detect(dp))
 		return connector_status_disconnected;
 
@@ -1920,6 +1944,11 @@ static void dw_dp_hpd_work(struct work_struct *work)
 	bool long_hpd;
 	int ret;
 
+	PM_RUNTIME_ACQUIRE_AUTOSUSPEND(dp->dev, pm);
+	ret = PM_RUNTIME_ACQUIRE_ERR(&pm);
+	if (ret)
+		return;
+
 	mutex_lock(&dp->irq_lock);
 	long_hpd = dp->hotplug.long_hpd;
 	mutex_unlock(&dp->irq_lock);
@@ -2059,25 +2088,52 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder)
 		goto put_next_bridge;
 	}
 
-	if (dw_dp_is_routed_to_usb_c(encoder)) {
-		dev_dbg(dev, "USB-C mode\n");
+	dp->usbc_mode = dw_dp_is_routed_to_usb_c(encoder);
 
-		if (dp->plat_data.hpd_sw_sel)
-			dp->plat_data.hpd_sw_sel(dp->plat_data.data, 1);
+	ret = pm_runtime_get_active(dev, RPM_TRANSPARENT);
+	if (ret) {
+		dev_err_probe(dev, ret, "Failed to get runtime PM\n");
+		goto put_next_bridge;
 	}
 
-	dw_dp_init_hw(dp);
+	/* resume once if runtime PM is disabled */
+	if (!pm_runtime_enabled(dev)) {
+		ret = dw_dp_runtime_resume(dp);
+		if (ret)
+			goto put_runtime_pm;
+	}
+
+	if (dp->plat_data.hpd_sw_sel)
+		dp->plat_data.hpd_sw_sel(dp->plat_data.data, dp->usbc_mode);
 
 	ret = phy_init(dp->phy);
 	if (ret) {
 		dev_err_probe(dev, ret, "phy init failed\n");
-		goto put_next_bridge;
+		goto put_manual_pm;
 	}
 
+	dp->drm_bound = true;
 	enable_irq(dp->irq);
 
+	/*
+	 * USB-C has out-of-band hotplug detection, so device may enter
+	 * runtime suspend. Native mode needs to be resumed for working
+	 * hotplug detection.
+	 */
+	if (dp->usbc_mode) {
+		dev_dbg(dev, "USB-C mode\n");
+		pm_runtime_put_autosuspend(dp->dev);
+	}
+
 	return 0;
 
+put_manual_pm:
+	if (!pm_runtime_enabled(dev))
+		dw_dp_runtime_suspend(dp);
+
+put_runtime_pm:
+	pm_runtime_put_sync(dp->dev);
+
 put_next_bridge:
 	drm_bridge_put(dp->next_bridge);
 
@@ -2090,9 +2146,22 @@ EXPORT_SYMBOL_GPL(dw_dp_bind);
 
 void dw_dp_unbind(struct dw_dp *dp)
 {
+	if (dp->usbc_mode)
+		pm_runtime_get_sync(dp->dev);
+
+	dp->drm_bound = false;
 	disable_irq(dp->irq);
+
 	cancel_work_sync(&dp->hpd_work);
 	phy_exit(dp->phy);
+
+	/* Last PM runtime suspend must be done with drm_bound = false */
+	pm_runtime_put_sync(dp->dev);
+
+	/* suspend once if runtime PM is disabled */
+	if (!pm_runtime_enabled(dp->dev))
+		dw_dp_runtime_suspend(dp);
+
 	drm_bridge_put(dp->next_bridge);
 	drm_dp_aux_unregister(&dp->aux);
 }
@@ -2151,13 +2220,13 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 		return ERR_CAST(dp->phy);
 	}
 
-	dp->apb_clk = devm_clk_get_enabled(dev, "apb");
+	dp->apb_clk = devm_clk_get(dev, "apb");
 	if (IS_ERR(dp->apb_clk)) {
 		dev_err_probe(dev, PTR_ERR(dp->apb_clk), "failed to get apb clock\n");
 		return ERR_CAST(dp->apb_clk);
 	}
 
-	dp->aux_clk = devm_clk_get_enabled(dev, "aux");
+	dp->aux_clk = devm_clk_get(dev, "aux");
 	if (IS_ERR(dp->aux_clk)) {
 		dev_err_probe(dev, PTR_ERR(dp->aux_clk), "failed to get aux clock\n");
 		return ERR_CAST(dp->aux_clk);
@@ -2202,6 +2271,47 @@ struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_
 }
 EXPORT_SYMBOL_GPL(dw_dp_probe);
 
+int dw_dp_runtime_suspend(struct dw_dp *dp)
+{
+	if (dp->drm_bound)
+		disable_irq(dp->irq);
+
+	clk_disable_unprepare(dp->aux_clk);
+	clk_disable_unprepare(dp->apb_clk);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dw_dp_runtime_suspend);
+
+int dw_dp_runtime_resume(struct dw_dp *dp)
+{
+	int ret;
+
+	ret = clk_prepare_enable(dp->apb_clk);
+	if (ret)
+		return ret;
+
+	ret = clk_prepare_enable(dp->aux_clk);
+	if (ret) {
+		clk_disable_unprepare(dp->apb_clk);
+		return ret;
+	}
+
+	dw_dp_init_hw(dp);
+
+	/*
+	 * HPD_HOT_PLUG bit is asserted only after the sink holds HPD
+	 * high for at least 100ms.
+	 */
+	msleep(110);
+
+	if (dp->drm_bound)
+		enable_irq(dp->irq);
+
+	return 0;
+}
+EXPORT_SYMBOL_GPL(dw_dp_runtime_resume);
+
 MODULE_AUTHOR("Andy Yan <andyshrk@163.com>");
 MODULE_DESCRIPTION("DW DP Core Library");
 MODULE_LICENSE("GPL");
diff --git a/include/drm/bridge/dw_dp.h b/include/drm/bridge/dw_dp.h
index 79b2cdf0df99..f20d2c2c40ca 100644
--- a/include/drm/bridge/dw_dp.h
+++ b/include/drm/bridge/dw_dp.h
@@ -29,4 +29,7 @@ int dw_dp_bind(struct dw_dp *dp, struct drm_encoder *encoder);
 void dw_dp_unbind(struct dw_dp *dp);
 
 struct dw_dp *dw_dp_probe(struct platform_device *pdev, const struct dw_dp_plat_data *plat_data);
+
+int dw_dp_runtime_suspend(struct dw_dp *dp);
+int dw_dp_runtime_resume(struct dw_dp *dp);
 #endif /* __DW_DP__ */

-- 
2.53.0


