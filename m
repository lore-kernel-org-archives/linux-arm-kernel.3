Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76608CA5FA1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 10:38:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MclBdn8qJNnkVxx6agDK+453pDYr2WeUrlYel3GftU0=; b=xIVKHeBisD0JzBjwFNtTy2T3JG
	45WyOsShr9jKI3dz8j2y+KiyJtUiKZFl++bgKcj3bh2XT9Vg3F+SzFa+daWKQpICSa4NRzqKWINO8
	RftDCByb1YX+o5ZKEnUDKI6jysguQq2DoBYF/kK8bMeyjszea69TMr9BlJl8q/v7z61/wQkt6S8L0
	Q1gOcDip+qLhyZwdXCYIFbnOburx6J5G5nje8zNIHSTj7m/6hLPSZBLMamOCwerafmxzwyCNTNwGD
	pL9lVyh9Z2/xGLq6XBTyK+EeUd/vJ7FipcpNdRD4NFbotQO+3/jgoobrgOemDRFiKMQJPtopBSBJ9
	MWj68zpg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDk-00000003GyW-08rv;
	Tue, 29 Sep 2026 10:38:00 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVDB-00000003Gjl-0tRZ
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 29 Sep 2026 10:37:25 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=Cc:To:In-Reply-To:References:Message-Id
	:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:From:Sender
	:Reply-To:Content-ID:Content-Description;
	bh=MclBdn8qJNnkVxx6agDK+453pDYr2WeUrlYel3GftU0=; b=sEhUfRC8E35EU4K+OPfTO+dX1C
	Rc/x44ES9HxnnaeDeM2aKsqnavr/lVOS1sOILrlQ2Ga0WWCZ1x/zvFkf4t07vMkmmTlPDZS7hgubs
	9VQevClBeo+zfHKlrFyre5TU9bYylxEQrxo3PAIg1xKDyKJOWyBUTPtALE7nNzhd0KO8EP/lT37mu
	0tqz05XRrAO5MIHJABioNORBWhOL6L+nBI0HK64LA/aofOruI12orI8YnzsTKEZv00Dsk6P1jNvxq
	kebZi1YK9PQSJTiujsbwP6pifbKePR/rkQ4jcxo8AnP1IA6gvgHWKN92pszGxPdwEqsVLA6LAPFOa
	DPMFIfzg==;
Received: from smtpout-03.galae.net ([185.246.85.4])
	by casper.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBVD7-0000000CLA4-1esb
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 10:37:24 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-03.galae.net (Postfix) with ESMTPS id 0E4004E410B7;
	Tue, 29 Sep 2026 10:37:12 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id D5209601BD;
	Tue, 29 Sep 2026 10:37:11 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id A5A2E103297BD;
	Tue, 29 Sep 2026 12:37:01 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1790678226; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=MclBdn8qJNnkVxx6agDK+453pDYr2WeUrlYel3GftU0=;
	b=HkhamXZzgsVwqQsF7Kmnz7704aC5HD1bfqTX3uzG6BqJoUGvqaSUI9zNcnKgIBSEbn+JpB
	9DJ8JEXRm/gt1JAQxriQDyv0LM4Xuf49tr3Bt1+BPC6M2+g0vYsjlXDFXSMh42vFmyjiK7
	HGFOKUFbsIZqM431WrmtlAdsht6DuqfcsU+ZQ/gqIBOc5QlE7V3MQ3S5BCCfQWzZPFPkf9
	cfNpZ5qWD3YhOpqCLCDiDxGz/YLurO+vR6RNkc/gGZNR63uPUSHA3jE9WJxUUPh8Ysq5JF
	KHQDoOo40uMZz+P+VkI1Db8JucLABcWmeR6xbP3G/wV+dYvheg21Dn4R0DYlsQ==
From: Luca Ceresoli <luca.ceresoli@bootlin.com>
Date: Tue, 29 Sep 2026 12:36:36 +0200
Subject: [PATCH 4/7] drm/bridge: dw-mipi-dsi2: stop using deprecated
 devm_drm_of_get_bridge()
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260929-drm-fix-of_get_bridge-build-regression-v1-4-ccb7e602daad@bootlin.com>
References: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
In-Reply-To: <20260929-drm-fix-of_get_bridge-build-regression-v1-0-ccb7e602daad@bootlin.com>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Icenowy Zheng <zhengxingda@iscas.ac.cn>, 
 Andrzej Hajda <andrzej.hajda@intel.com>, 
 Neil Armstrong <neil.armstrong@linaro.org>, Robert Foss <rfoss@kernel.org>, 
 Laurent Pinchart <Laurent.pinchart@ideasonboard.com>, 
 Jonas Karlman <jonas@kwiboo.se>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
 Dave Stevenson <dave.stevenson@raspberrypi.com>, 
 =?utf-8?q?Ma=C3=ADra_Canal?= <mcanal@igalia.com>, 
 Raspberry Pi Kernel Maintenance <kernel-list@raspberrypi.com>, 
 Geert Uytterhoeven <geert+renesas@glider.be>
Cc: Arnd Bergmann <arnd@kernel.org>, Doug Anderson <dianders@chromium.org>, 
 Hui Pu <Hui.Pu@gehealthcare.com>, Ian Ray <ian.ray@gehealthcare.com>, 
 Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 linux-renesas-soc@vger.kernel.org, 
 Luca Ceresoli <luca.ceresoli@bootlin.com>
X-Mailer: b4 0.16.0
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260929_113721_814804_7C644C26 
X-CRM114-Status: GOOD (  11.40  )
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

devm_drm_of_get_bridge() is deprecated, switch to
of_drm_get_bridge_by_endpoint(). As of_drm_get_bridge_by_endpoint() returns
a refcounted bridge, ensure it is put by using bridge.next_bridge.

Signed-off-by: Luca Ceresoli <luca.ceresoli@bootlin.com>

---

Unlike other commits in this series, this is not a fix: this code can be
built only when CONFIG_OF=y. Do this change to keep dw-mipi-dsi
dw-mipi-dsi2 as similar as they are already.
---
 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c | 9 +++------
 1 file changed, 3 insertions(+), 6 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
index 7fd2f1e60654..a008450d83aa 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi2.c
@@ -192,7 +192,6 @@ struct cmd_header {
 struct dw_mipi_dsi2 {
 	struct drm_bridge bridge;
 	struct mipi_dsi_host dsi_host;
-	struct drm_bridge *panel_bridge;
 	struct device *dev;
 	struct regmap *regmap;
 	struct clk *pclk;
@@ -528,12 +527,12 @@ static int dw_mipi_dsi2_host_attach(struct mipi_dsi_host *host,
 	dsi2->format = device->format;
 	dsi2->mode_flags = device->mode_flags;
 
-	bridge = devm_drm_of_get_bridge(dsi2->dev, dsi2->dev->of_node, 1, 0);
+	bridge = of_drm_get_bridge_by_endpoint(dsi2->dev->of_node, 1, 0);
 	if (IS_ERR(bridge))
 		return PTR_ERR(bridge);
 
 	bridge->pre_enable_prev_first = true;
-	dsi2->panel_bridge = bridge;
+	dsi2->bridge.next_bridge = bridge;
 
 	drm_bridge_add(&dsi2->bridge);
 
@@ -565,8 +564,6 @@ static int dw_mipi_dsi2_host_detach(struct mipi_dsi_host *host,
 
 	drm_bridge_remove(&dsi2->bridge);
 
-	drm_of_panel_bridge_remove(host->dev->of_node, 1, 0);
-
 	return 0;
 }
 
@@ -884,7 +881,7 @@ static int dw_mipi_dsi2_bridge_attach(struct drm_bridge *bridge,
 	encoder->encoder_type = DRM_MODE_ENCODER_DSI;
 
 	/* Attach the panel-bridge to the dsi bridge */
-	return drm_bridge_attach(encoder, dsi2->panel_bridge, bridge,
+	return drm_bridge_attach(encoder, dsi2->bridge.next_bridge, bridge,
 				 flags);
 }
 

-- 
2.55.0


