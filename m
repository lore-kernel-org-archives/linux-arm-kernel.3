Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31F4CCCD18C
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Oct 2025 17:03:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dwxMGeGR8HYAFgIYgFgH/nuyjFRZ9lUI5NYYPxFc2zQ=; b=XbCMTzZ6f5cMuErqBhC2JgWzv0
	xXbg0b8WxP35+e9hfcLZ01tfmjwlrtvuXpFh256Jc9/sUxEilHcXYLHYvccA1eIm4nVt2Z1b4Rf2k
	cl2nvwBd3v8JiRyQCVOPWJAp2GwFMvA1kbI7wOGhpdRH6rtqNjS2COmY+SlLAxqgN84T4ZSK/5WgS
	aUOHQnUsgRAy2/TZY2wpzwIKvpxXYYal7x6XiyR3d3x2VphvLgLFTHbjsirGe2LVz9IITjdHU+iyU
	GIlJF2UsPVIheji/BwXas/hQbTR15rBgJJ0x0I1xrfG+UVrm+dfxJqhU0rtcJ/IzxIGSaq1Rbacku
	kHmX2J7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0V-0000000ANe4-2iGA;
	Sat, 11 Oct 2025 17:03:47 +0000
Received: from mout-p-103.mailbox.org ([80.241.56.161])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v7d0R-0000000ANW5-3I65
	for linux-arm-kernel@lists.infradead.org;
	Sat, 11 Oct 2025 17:03:45 +0000
Received: from smtp102.mailbox.org (smtp102.mailbox.org [10.196.197.102])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by mout-p-103.mailbox.org (Postfix) with ESMTPS id 4ckVLk0J5wz9shj;
	Sat, 11 Oct 2025 19:03:42 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202222;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwxMGeGR8HYAFgIYgFgH/nuyjFRZ9lUI5NYYPxFc2zQ=;
	b=Iqfds4v7pM032cX+c0oD6WBAH+E4DuYE1XyRWfPvwZ2ws5O2a0eBDYUkdWqWCcN+kZezey
	H6eXHYfcd4itD1sQowC4UnSyv1GH7LIYvIvblnqaLAFEcGdyQW6FBSE/oqcaHr+MWUJcqU
	IBeiBpSin72mJtMfMbi4KKHHeucsM2+0uoxVLCTv3y8YXSAODrSegzfa5a+FYgdGerPhwd
	FAI4OVJRrkVONaFKR7kYRZQqu3XBYN3aoqdRN9ZLbdfmyKfzEZRVxwZJ1t+EiDMLnGVMkh
	3RLnkkc5yOGs20Bpun4Q3lS36XNw+LgvAqIkeKjGf0xUfh+tl/tKFPl+6yv6Uw==
From: Marek Vasut <marek.vasut@mailbox.org>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=mailbox.org; s=mail20150812;
	t=1760202219;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=dwxMGeGR8HYAFgIYgFgH/nuyjFRZ9lUI5NYYPxFc2zQ=;
	b=eC0dM4iMXPgFkO88uxIKQf7yJU+0FGLpCb1I6IGLT9x5qfcO1E2E0IezUU+2EWwSgv5t4B
	pcBr2tb8jbE7FZg7MMGtthlmQXlzZCKF7o2iWzedxWvUksbTgFr2HD/wdx7lxi171tDuW8
	gvpTdYjJDq7rdeztBgDQP+rnuKXkglmTYniDPXqrmBGGx3wdBFDpSecsabcTTCzlrFXof6
	k2NZNLrEmBM3S3DUx0tlitT3CyuAM9OF2ROSAtL5gFlGT2IeGhk2IOwC1snzL5mgebyNV6
	VgcAzeGr+GJ/fh6SQS0feujdliZtYkRu9a1JXGtVJ9XoJHjjwH6A5Qx5kvC27w==
To: dri-devel@lists.freedesktop.org
Cc: Marek Vasut <marek.vasut@mailbox.org>,
	Abel Vesa <abelvesa@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Liu Ying <victor.liu@nxp.com>,
	Lucas Stach <l.stach@pengutronix.de>,
	Peng Fan <peng.fan@nxp.com>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-clk@vger.kernel.org
Subject: [PATCH 17/39] drm/imx: dc: tc: Pass struct dc_tc_subdev_match_data via OF match data
Date: Sat, 11 Oct 2025 18:51:32 +0200
Message-ID: <20251011170213.128907-18-marek.vasut@mailbox.org>
In-Reply-To: <20251011170213.128907-1-marek.vasut@mailbox.org>
References: <20251011170213.128907-1-marek.vasut@mailbox.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-MBO-RS-ID: 4828139fbd68ded75fc
X-MBO-RS-META: e7tkbej4qt34ohijfjstm8jt6yepg418
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251011_100344_006347_DC03E723 
X-CRM114-Status: GOOD (  19.42  )
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

Introduce struct dc_tc_subdev_match_data which describes the differences
between i.MX8QXP and i.MX95, which in this case need for configuration
and address space offsets, and pass it as OF match data into the driver, so
the driver can use the match data to optionally configure the TCON.
This is a preparatory patch for i.MX95 addition. No functional change.

Signed-off-by: Marek Vasut <marek.vasut@mailbox.org>
---
Cc: Abel Vesa <abelvesa@kernel.org>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>
Cc: Liu Ying <victor.liu@nxp.com>
Cc: Lucas Stach <l.stach@pengutronix.de>
Cc: Peng Fan <peng.fan@nxp.com>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Shawn Guo <shawnguo@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: devicetree@vger.kernel.org
Cc: dri-devel@lists.freedesktop.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-clk@vger.kernel.org
---
 drivers/gpu/drm/imx/dc/dc-de.h |  1 +
 drivers/gpu/drm/imx/dc/dc-tc.c | 40 ++++++++++++++++++++++++++--------
 2 files changed, 32 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/imx/dc/dc-de.h b/drivers/gpu/drm/imx/dc/dc-de.h
index 797056a09ddb4..e74368aacf553 100644
--- a/drivers/gpu/drm/imx/dc/dc-de.h
+++ b/drivers/gpu/drm/imx/dc/dc-de.h
@@ -32,6 +32,7 @@ struct dc_fg {
 struct dc_tc {
 	struct device *dev;
 	struct regmap *reg;
+	bool need_config;
 };
 
 struct dc_de {
diff --git a/drivers/gpu/drm/imx/dc/dc-tc.c b/drivers/gpu/drm/imx/dc/dc-tc.c
index f44b68c0a5e6d..1f287706e8706 100644
--- a/drivers/gpu/drm/imx/dc/dc-tc.c
+++ b/drivers/gpu/drm/imx/dc/dc-tc.c
@@ -7,6 +7,7 @@
 #include <linux/mod_devicetable.h>
 #include <linux/module.h>
 #include <linux/platform_device.h>
+#include <linux/property.h>
 #include <linux/regmap.h>
 
 #include "dc-drv.h"
@@ -25,7 +26,12 @@
 #define MAPBIT27_24	0x430
 #define MAPBIT31_28	0x434
 
-static const struct dc_subdev_info dc_tc_info[] = {
+struct dc_tc_subdev_match_data {
+	bool				need_config;
+	const struct dc_subdev_info	*info;
+};
+
+static const struct dc_subdev_info dc_tc_info_imx8qxp[] = {
 	{ .reg_start = 0x5618c800, .id = 0, },
 	{ .reg_start = 0x5618e400, .id = 1, },
 	{ /* sentinel */ },
@@ -61,8 +67,16 @@ static const u32 dc_tc_mapbit[] = {
 	0x13121110, 0x03020100, 0x07060504, 0x00000908,
 };
 
+static const struct dc_tc_subdev_match_data dc_tc_match_data_imx8qxp = {
+	.need_config = true,
+	.info = dc_tc_info_imx8qxp,
+};
+
 void dc_tc_init(struct dc_tc *tc)
 {
+	if (!tc->need_config)
+		return;
+
 	/* reset TCON_CTRL to POR default so that TCON works in bypass mode */
 	regmap_write(tc->reg, TCON_CTRL, CTRL_RST_VAL);
 
@@ -73,6 +87,8 @@ void dc_tc_init(struct dc_tc *tc)
 
 static int dc_tc_bind(struct device *dev, struct device *master, void *data)
 {
+	const struct dc_tc_subdev_match_data *dc_tc_match_data = device_get_match_data(dev);
+	const struct dc_subdev_info *dc_tc_info = dc_tc_match_data->info;
 	struct platform_device *pdev = to_platform_device(dev);
 	struct dc_drm_device *dc_drm = data;
 	struct resource *res;
@@ -84,13 +100,19 @@ static int dc_tc_bind(struct device *dev, struct device *master, void *data)
 	if (!tc)
 		return -ENOMEM;
 
-	base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
-	if (IS_ERR(base))
-		return PTR_ERR(base);
-
-	tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
-	if (IS_ERR(tc->reg))
-		return PTR_ERR(tc->reg);
+	if (dc_tc_match_data->need_config) {
+		base = devm_platform_get_and_ioremap_resource(pdev, 0, &res);
+		if (IS_ERR(base))
+			return PTR_ERR(base);
+
+		tc->reg = devm_regmap_init_mmio(dev, base, &dc_tc_regmap_config);
+		if (IS_ERR(tc->reg))
+			return PTR_ERR(tc->reg);
+	} else {
+		res = platform_get_resource(to_platform_device(pdev->dev.parent), IORESOURCE_MEM, 0);
+		if (IS_ERR(res))
+			return PTR_ERR(res);
+	}
 
 	id = dc_subdev_get_id(dc_tc_info, res);
 	if (id < 0) {
@@ -126,7 +148,7 @@ static void dc_tc_remove(struct platform_device *pdev)
 }
 
 static const struct of_device_id dc_tc_dt_ids[] = {
-	{ .compatible = "fsl,imx8qxp-dc-tcon" },
+	{ .compatible = "fsl,imx8qxp-dc-tcon", .data = &dc_tc_match_data_imx8qxp },
 	{ /* sentinel */ }
 };
 MODULE_DEVICE_TABLE(of, dc_tc_dt_ids);
-- 
2.51.0


