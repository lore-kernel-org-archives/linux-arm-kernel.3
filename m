Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B0465CA0EEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 Aug 2025 09:40:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=51cyszPwOuDVUWFPnX7QnONtW9SQhNG3VrtzjiXMCc0=; b=aETRHUCmnbsDFHUl3nxb+C8WsU
	RSh6kttTRSdHWoCJaydu0hgFCtPbw/aQwGQhrq4guCy6nw2spDGRrslL5j5fJs/bHjOC80rEQGh3j
	x9lS8Wa8xGi+pk2Bm+EJQF9wzrqYeYlfWh54maBLDWzxOl1gOQ8ptChxhcL8Y498pN7E8aftY05yP
	seaPmfJqld7YCguXL4PrbDUYugRUS0gKEBvsgRqhU27zIAsSyqeMzG3W84Fah4oZoJ35fwZki5FHO
	kZUHcdOR3EWqNKtbn5slU/qH1dg1ug8rcjK5keQAwil6VbqVS+VKwqeCOn/hB55FHBdbG7tjfDfQO
	3x2Qcnlg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up1ml-0000000GRrl-1mL8;
	Thu, 21 Aug 2025 09:40:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1up09D-0000000GA4t-3vAv
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 07:55:49 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1up09A-00073K-0D; Thu, 21 Aug 2025 09:55:44 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Thu, 21 Aug 2025 09:55:30 +0200
Subject: [PATCH 3/5] drm/panel: simple: add JuTouch JT101TM023
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-3-b492ef807d12@pengutronix.de>
References: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
In-Reply-To: <20250821-v6-17-topic-imx8mp-skov-dts-jutouch-10inch-v1-0-b492ef807d12@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Jessica Zhang <jessica.zhang@oss.qualcomm.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>, 
 Thierry Reding <thierry.reding@gmail.com>, Sam Ravnborg <sam@ravnborg.org>, 
 Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 dri-devel@lists.freedesktop.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org, 
 Steffen Trumtrar <s.trumtrar@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_005548_005269_335CE54F 
X-CRM114-Status: GOOD (  10.45  )
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

Add JuTouch Technology JT101TM023 10" 1280x800 LVDS panel support.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 drivers/gpu/drm/panel/panel-simple.c | 35 +++++++++++++++++++++++++++++++++++
 1 file changed, 35 insertions(+)

diff --git a/drivers/gpu/drm/panel/panel-simple.c b/drivers/gpu/drm/panel/panel-simple.c
index 3333d4a0750468b058155bcdddc694a521d342d6..3bb52a557a193a3687bc5125ab055ad6ff065d49 100644
--- a/drivers/gpu/drm/panel/panel-simple.c
+++ b/drivers/gpu/drm/panel/panel-simple.c
@@ -2889,6 +2889,38 @@ static const struct panel_desc innolux_zj070na_01p = {
 	},
 };
 
+static const struct display_timing jutouch_jt101tm023_timing = {
+	.pixelclock = { 66300000, 72400000, 78900000 },
+	.hactive = { 1280, 1280, 1280 },
+	.hfront_porch = { 12, 72, 132 },
+	.hback_porch = { 88, 88, 88 },
+	.hsync_len = { 10, 10, 48 },
+	.vactive = { 800, 800, 800 },
+	.vfront_porch = { 1, 15, 49 },
+	.vback_porch = { 23, 23, 23 },
+	.vsync_len = { 5, 6, 13 },
+	.flags = DISPLAY_FLAGS_HSYNC_LOW | DISPLAY_FLAGS_VSYNC_LOW |
+		 DISPLAY_FLAGS_DE_HIGH,
+};
+
+static const struct panel_desc jutouch_jt101tm023 = {
+	.timings = &jutouch_jt101tm023_timing,
+	.num_timings = 1,
+	.bpc = 8,
+	.size = {
+		.width = 217,
+		.height = 136,
+	},
+	.delay = {
+		.enable = 50,
+		.disable = 50,
+	},
+	.bus_format = MEDIA_BUS_FMT_RGB888_1X7X4_SPWG,
+	.bus_flags = DRM_BUS_FLAG_DE_HIGH,
+	.connector_type = DRM_MODE_CONNECTOR_LVDS,
+};
+
+
 static const struct display_timing koe_tx14d24vm1bpa_timing = {
 	.pixelclock = { 5580000, 5850000, 6200000 },
 	.hactive = { 320, 320, 320 },
@@ -5185,6 +5217,9 @@ static const struct of_device_id platform_of_match[] = {
 	}, {
 		.compatible = "innolux,zj070na-01p",
 		.data = &innolux_zj070na_01p,
+	}, {
+		.compatible = "jutouch,jt101tm023",
+		.data = &jutouch_jt101tm023,
 	}, {
 		.compatible = "koe,tx14d24vm1bpa",
 		.data = &koe_tx14d24vm1bpa,

-- 
2.49.0


