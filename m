Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 82406606A335
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  1 Nov 2026 14:30:46 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=K6r+ZIrK;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=PDqqcrJv
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=VsDtHDQeo9yaAAGX90Le6/Q23q/oZg9HWR3FqkNaI5Q=; b=K6r+ZIrKyBMOKnPk/tAKZ1LdYw
	XZV1APU5KjCgzEf7WEjlWBrmawazBwLYFVKvmOWwuJKok68HIIsNSRAhwp0umjaEBUj6xSKBYplkd
	YE+HVbllmqM3tGleUSYM85o71Dn9gyWYyoBP9jMXsS7O5ZCQOQ+W1mFklO7Q7TRS1BmvU0e2KWROx
	3dre3pwh+NVmpQZyzH5Z7yqWP1Jr9dWSf+kgu374ym60xXfUMl3ZLE9mps4Qni3oCKa0cakP3kYAs
	TCO4uBtZUleJ8xFTFuLGAz8UNHSdr8Mfx17vWmirE3Sc+WYPQ2kgUe4YCAGQAjlMsTx6aTW8pg8fP
	8YMUBphg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWZz-0000000EaeI-2oCK;
	Sun, 01 Nov 2026 14:30:39 +0000
Received: from mail-wm1-x32d.google.com ([2a00:1450:4864:20::32d])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xNWZw-0000000EadQ-1DPz
	for linux-arm-kernel@lists.infradead.org;
	Sun, 01 Nov 2026 14:30:38 +0000
Received: by mail-wm1-x32d.google.com with SMTP id 5b1f17b1804b1-4a214af2076so16129465e9.0
        for <linux-arm-kernel@lists.infradead.org>; Sun, 01 Nov 2026 06:30:34 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793543433; x=1794148233; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=VsDtHDQeo9yaAAGX90Le6/Q23q/oZg9HWR3FqkNaI5Q=;
        b=PDqqcrJv4T7yRLr6t1DggggsypXjyHSmzicdOlbLiTKAKSzoxeoQuKbeEwjlRxkeOm
         MSwnzYw+RVTfGyd6arU4XM/T4R2zFkq9p/aHebxsafRmIXiaoKVewAEUYQynPslebuYR
         DHHtEc6cDP+ICq+EQq+VkWrjlZpW9Xwb3jZaOKmPxuUDEb4YWGsWpc2c+SNUaCJ2/avr
         gsxm+eXS7wxlJEHXKZtT48ncc9EuW5GZVh9YSFOI5hrMJXKBZQ65aUZcDCNH0Hkq+w3A
         NXPGlK3wUSDaQd648+l9E+0P9/wFGHJ4/yMjr7ir9IJFr8YCPkymhq75dXV62rqDQXr+
         KWZg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793543433; x=1794148233;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=VsDtHDQeo9yaAAGX90Le6/Q23q/oZg9HWR3FqkNaI5Q=;
        b=VAPQaj2hbsRy09MhyO1dYPcwlHAlo21Xn8dSPC0OHyjSM+N59UEwDYz6gCrjKBk+HA
         oIOQybJSA84FHhg1mK35D0zWR8iih9vaUWK7gwIpAgGm80Y0KGz+WYupJXuPhKDj/CHd
         h2ZpqRu72lLaBbSPaUmN/P7EAJKipXG8hbfrRsszAsjw7WzTKsQ5dCLE2nqr+y5AfAVb
         eLwyY6cpPHsN/09hOKoBUGoJX1zmOhrHDo1MwCateIbmg1Yg9P1hy91dRxJC8ni7f8F+
         F9hmosiUXdYXt3lW9QTlrgDITjLCWTHHWRBYVZzgYYvcexw9YUeiYIgC2xJ4vrBHVRPv
         oopQ==
X-Forwarded-Encrypted: i=1; AKwUvBwSU4+v/ijCqGed6wmc9j7DB/aSCE1Td6Y2cEq1YU9gUp0UJyUP7cJbWxhg5MTQh49sTcTq/QHO8PreB44nKqYR@lists.infradead.org
X-Gm-Message-State: AFq9FYKuyFibKI5LDlEQJhKhPCuyKdrmNjBqSXCkEu8CvsRJUPdZWZks
	ipUU2nyQRdsqJy8UqeOaz4/1l8p/thlNnpNGwhJfVDjb0VoFmqIRp/IC
X-Gm-Gg: AYBFou0nu0UKapT8qDCZMi/5+AtEqtjIjBFf78Pc+KEoSVuPpPpZV6G/oLVj2rKCjLZ
	UA+Tow3qKtTpKGf2Xq0tDZ1EuvR3m9ybzg+HXkWO38fv0pkDAmBOpwVkQB3+Eu0dzx44cytGYwv
	Kv4dya1mrSeG+El8heiNOep9SIofXEMcLGrKTw/H/YbH7TW3InY30G8ATAYr9iO3vfHq94bPX8U
	FKiQlns8Rl5i8yuKZe2xoW0U4Gq9W2WJPaO8Ozi1Fy4pc9h4h9qFl8kr3QWwycAjrFn7NxOwaKh
	CNZQ9Rfb0J7VW3oQWffEk25suGkn5QArpQUpNjcqaxs90jLPVI4if+47m/P+3qywpWxM86SJQNJ
	UYNv4uyFZnEo5RhjIXzCtCDYQL2n0hSlQVedYbUz4CdK5Vrz/lekxVI5In6d4HYUMzGilJ55hf3
	X44QcNy26UhmEGjadPaZ5Gp9cmfQS4XFR4aLbT8eYhmFKPQkS6lF3sTKjslc1aaT+FuiF2WtYDG
	PClUpYqHfr4cV5TqLJV95qN3N2Nj0tN6elrFvCtC0TwuW3c0PA2nXsStv1DvmhzBtpJnpp6mi+h
	4LULVextsOy/036HBPH3ju1TuiPIp9oyfla3WNERJRkSOrzoI9gIqF1Hu6uoYWUgV7Ys/SPtcy9
	+gzsutLWKHUUj99DN7AdBGO+V5sPBj+KnRTB7F5tb488ugA==
X-Received: by 2002:a05:600c:a30a:b0:4ac:b0b2:fa12 with SMTP id 5b1f17b1804b1-4acb0b2fac0mr117941165e9.1.1793543433238;
        Sun, 01 Nov 2026 06:30:33 -0800 (PST)
Received: from romain-ThinkPad-P14s-Gen-5-AMD.tail433d9c.ts.net ([2001:861:39c2:e340:849f:a468:4121:a85])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e71b8011csm16223169f8f.31.2026.11.01.06.30.32
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 01 Nov 2026 06:30:32 -0800 (PST)
From: Romain TISSERAND <romain.tisserand@gmail.com>
To: Andrzej Hajda <andrzej.hajda@intel.com>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Robert Foss <rfoss@kernel.org>
Cc: Laurent Pinchart <Laurent.pinchart@ideasonboard.com>,
	Jonas Karlman <jonas@kwiboo.se>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Sandy Huang <hjc@rock-chips.com>,
	=?UTF-8?q?Heiko=20St=C3=BCbner?= <heiko@sntech.de>,
	Andy Yan <andy.yan@rock-chips.com>,
	Liu Ying <victor.liu@nxp.com>,
	Chaoyi Chen <chaoyi.chen@rock-chips.com>,
	dri-devel@lists.freedesktop.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	sashiko-reviews@lists.linux.dev
Subject: [PATCH v2] drm/bridge: dw-mipi-dsi: let the glue compute the hcomponent lbcc
Date: Sun,  1 Nov 2026 15:30:31 +0100
Message-ID: <20261101143031.880389-1-romain.tisserand@gmail.com>
X-Mailer: git-send-email 2.43.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261101_063036_949399_3B47720D 
X-CRM114-Status: GOOD (  26.75  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Commit ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock
rate to calculate lbcc") counts HSA, HBP and HLINE from the pixel clock,
which is only right when the lanes run at the pixel bandwidth (pixel
clock * bpp / lanes). Commit 93e82bb4de01 ("drm/bridge: synopsys:
dw-mipi-dsi: Fix hcomponent lbcc for burst mode") went back to the lane
rate for burst mode, where the lanes are faster on purpose.

The Rockchip glue runs the lanes faster in every mode: at 1.25 times
(bpp / lanes, rounded down) times the pixel clock, or 1000 Mbps, above
the pixel bandwidth. In non-burst video mode the line programmed in lane
byte clocks is then shorter than the DPI line. On the GPD XD (RK3288,
ILI9881C panel, 4 lanes at 448 Mbps, 59.5 MHz pixel clock, htotal 747)
HLINE was 561 lane byte clocks (10.0 us) for a 12.55 us line, and the
panel shows garbage as soon as a client page-flips.

The glue picks the lane rate, so let it compute the lane byte clock
cycles too: add an optional get_hcomponent_lbcc() callback to
dw_mipi_dsi_plat_data, and implement it in the Rockchip glue from the
lane rate. Glues without it (i.MX93, Meson, STM) keep the current
computation, and so does Rockchip dual-DSI, which this hasn't been
tested on. On the GPD XD this gives HLINE 704, HSA 13 and HBP 4, and
the picture is stable.

Fixes: ac87d23694f4 ("drm/bridge: synopsys: dw-mipi-dsi: Use pixel clock rate to calculate lbcc")
Signed-off-by: Romain TISSERAND <romain.tisserand@gmail.com>
---
Changes in v2:
- Drop the 1/8 threshold: the glue now computes the lane byte clock
  cycles through a new optional get_hcomponent_lbcc() callback in
  dw_mipi_dsi_plat_data, and the Rockchip glue implements it from its
  lane rate (Chaoyi Chen). This also covers RGB666 packed on 4 lanes,
  which the 1/8 slack missed (Sashiko).
- Rockchip dual-DSI keeps the core computation: the lane rate would
  change the timing of the dual-DSI Gru Scarlet panels (innolux,p097pfg,
  non-burst, 4+4 lanes), which I can't test.
- Commit message: the Rockchip glue doesn't follow a panel rate in
  mainline, and the GPD XD numbers are now those of the rate it picks
  (448 Mbps).
- v1: https://lore.kernel.org/all/20261025142639.3454322-1-romain.tisserand@gmail.com/

Notes for reviewers (not for the changelog):
- The callback returns 0 to let the core compute the value, so a glue
  can implement it for some configurations only (Rockchip: single DSI).
- Testing: built with W=1 for arm (multi_v7) and arm64 (defconfig),
  DRM_DW_MIPI_DSI=y and =m, together with the Meson and i.MX93 glues, no
  warnings. Tested live on the GPD XD (RK3288, ILI9881C, non-burst with
  sync pulses, 4 lanes at 448 Mbps) on 6.18.54 with this exact change:
  without it HLINE 561, HSA 10, HBP 3 and garbage on screen as soon as
  the UI page-flips; with it HLINE 704, HSA 13, HBP 4 and a clean, stable
  picture in the UI and in games. Not tested on i.MX93, Meson, STM or
  Rockchip dual-DSI hardware; their computation is unchanged.
- Tool disclosure: this patch was prepared with Claude Opus 5.5
  (Anthropic) as a coding assistant, in an interactive session where I
  asked it to bring up the GPD XD display and then to prepare the fix
  for upstream. It located the cause from the DSI host registers, went
  through the history of the lbcc computation (ac87d23694f4,
  93e82bb4de01) and the lane rates of the other dw-mipi-dsi glues, and
  drafted the code change and the changelog; v2 follows the reviews of
  Chaoyi Chen and Sashiko. I reviewed and understand both, and tested
  the patch on the GPD XD as described above.

 drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c | 39 ++++++++++++-------
 .../gpu/drm/rockchip/dw-mipi-dsi-rockchip.c   | 23 +++++++++++
 include/drm/bridge/dw_mipi_dsi.h              | 10 +++++
 3 files changed, 57 insertions(+), 15 deletions(-)

diff --git a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
index 22d1b8cbe1..b7578265ca 100644
--- a/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
+++ b/drivers/gpu/drm/bridge/synopsys/dw-mipi-dsi.c
@@ -780,28 +780,37 @@ static u32 dw_mipi_dsi_get_hcomponent_lbcc(struct dw_mipi_dsi *dsi,
 					   const struct drm_display_mode *mode,
 					   u32 hcomponent)
 {
+	const struct dw_mipi_dsi_plat_data *pdata = dsi->plat_data;
 	u32 frac, lbcc, minimum_lbcc;
 	int bpp;
 
-	if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
-		/* lbcc based on lane_mbps */
-		lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
-	} else {
-		/* lbcc based on pixel clock rate */
-		bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
-		if (bpp < 0) {
-			dev_err(dsi->dev, "failed to get bpp\n");
-			return 0;
+	lbcc = 0;
+	if (pdata->get_hcomponent_lbcc)
+		lbcc = pdata->get_hcomponent_lbcc(pdata->priv_data, mode,
+						  hcomponent);
+
+	if (!lbcc) {
+		if (dsi->mode_flags & MIPI_DSI_MODE_VIDEO_BURST) {
+			/* lbcc based on lane_mbps */
+			lbcc = hcomponent * dsi->lane_mbps * MSEC_PER_SEC / 8;
+		} else {
+			/* lbcc based on pixel clock rate */
+			bpp = mipi_dsi_pixel_format_to_bpp(dsi->format);
+			if (bpp < 0) {
+				dev_err(dsi->dev, "failed to get bpp\n");
+				return 0;
+			}
+
+			lbcc = div_u64((u64)hcomponent * mode->clock * bpp,
+				       dsi->lanes * 8);
 		}
 
-		lbcc = div_u64((u64)hcomponent * mode->clock * bpp, dsi->lanes * 8);
+		frac = lbcc % mode->clock;
+		lbcc = lbcc / mode->clock;
+		if (frac)
+			lbcc++;
 	}
 
-	frac = lbcc % mode->clock;
-	lbcc = lbcc / mode->clock;
-	if (frac)
-		lbcc++;
-
 	minimum_lbcc = dw_mipi_dsi_get_minimum_lbcc(dsi);
 
 	if (lbcc < minimum_lbcc)
diff --git a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
index aab3353945..57ebb3a59f 100644
--- a/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
+++ b/drivers/gpu/drm/rockchip/dw-mipi-dsi-rockchip.c
@@ -771,6 +771,28 @@ dw_mipi_dsi_phy_get_timing(void *priv_data, unsigned int lane_mbps,
 	return dw_mipi_dsi_phy_px30_get_timing(dsi, lane_mbps, timing);
 }
 
+/*
+ * dw_mipi_dsi_get_lane_mbps() runs the lanes faster than the pixel bandwidth
+ * in every video mode, not only in burst mode: count the horizontal timings
+ * from the lane rate, or the line is shorter than the DPI line.
+ *
+ * Dual-DSI keeps the core computation (return 0): the lane rate would change
+ * the timing of the dual-DSI panels in use, and that hasn't been tested.
+ */
+static u32
+dw_mipi_dsi_rockchip_get_hcomponent_lbcc(void *priv_data,
+					 const struct drm_display_mode *mode,
+					 u32 hcomponent)
+{
+	struct dw_mipi_dsi_rockchip *dsi = priv_data;
+
+	if (dsi->slave || dsi->is_slave)
+		return 0;
+
+	return DIV_ROUND_UP_ULL((u64)hcomponent * dsi->lane_mbps *
+				MSEC_PER_SEC / 8, mode->clock);
+}
+
 static const struct dw_mipi_dsi_phy_ops dw_mipi_dsi_rockchip_phy_ops = {
 	.init = dw_mipi_dsi_phy_init,
 	.power_on = dw_mipi_dsi_phy_power_on,
@@ -1494,6 +1516,7 @@ static int dw_mipi_dsi_rockchip_probe(struct platform_device *pdev)
 	dsi->dev = dev;
 	dsi->pdata.base = dsi->base;
 	dsi->pdata.max_data_lanes = dsi->cdata->max_data_lanes;
+	dsi->pdata.get_hcomponent_lbcc = dw_mipi_dsi_rockchip_get_hcomponent_lbcc;
 	dsi->pdata.phy_ops = &dw_mipi_dsi_rockchip_phy_ops;
 	dsi->pdata.host_ops = &dw_mipi_dsi_rockchip_host_ops;
 	dsi->pdata.priv_data = dsi;
diff --git a/include/drm/bridge/dw_mipi_dsi.h b/include/drm/bridge/dw_mipi_dsi.h
index 65d5e68065..6580c16d80 100644
--- a/include/drm/bridge/dw_mipi_dsi.h
+++ b/include/drm/bridge/dw_mipi_dsi.h
@@ -62,6 +62,16 @@ struct dw_mipi_dsi_plat_data {
 	bool (*mode_fixup)(void *priv_data, const struct drm_display_mode *mode,
 			   struct drm_display_mode *adjusted_mode);
 
+	/*
+	 * Optional: number of lane byte clock cycles for @hcomponent pixels
+	 * of @mode, for glues whose lanes don't run at the pixel bandwidth.
+	 * Without it, or when it returns 0, the core uses the lane rate in
+	 * burst mode and the pixel clock otherwise.
+	 */
+	u32 (*get_hcomponent_lbcc)(void *priv_data,
+				   const struct drm_display_mode *mode,
+				   u32 hcomponent);
+
 	u32 *(*get_input_bus_fmts)(void *priv_data,
 				   struct drm_bridge *bridge,
 				   struct drm_bridge_state *bridge_state,

base-commit: cf61bef3801c3c9d0d8c39026b7b2fb242898a3a
-- 
2.43.0


