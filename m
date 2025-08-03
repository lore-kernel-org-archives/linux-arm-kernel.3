Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 278C8C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  3 Aug 2025 10:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:Subject:
	Message-ID:Date:From:MIME-Version:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4oRnuP4jSrdJzDgvqaR3lx1iHlupn4sHr1B/8K6MSts=; b=qQqXU1QaV/XtNOXtebyFeHlTU4
	jLKs+YZGNw91PtcBLftF2iLlgL1eF7XVWEgSUJWbhX4Hm3SdZ+Dv7eoIs/4kEI1dnNxp1pMlTGaJs
	sw5cv81NYIxe1UTwlrDUIX070WKcjiE8Uk4ivqHuazy0dH1MgoE7NNtZIVtv61PYYnREYK1WYPi8w
	Nl6kixv11S7Z4ob3z7YsiBL44L7/IDw0gxI/0gJ9m3SafOyEtw0YTxwFzKkmyIFJo3VZ/f0tLfOJt
	izM0T2ycKaHr0q6L9T45U5cBAvn/ZFOmtDVh/KFu23Z1yfD4QykyOSWxuiwBvZD5JbSVqsafDIUNg
	gwB+YeqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiW4G-00000008bc2-1f2a;
	Sun, 03 Aug 2025 10:35:52 +0000
Received: from mail-ej1-x632.google.com ([2a00:1450:4864:20::632])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiW1d-00000008bRO-1d6N;
	Sun, 03 Aug 2025 10:33:10 +0000
Received: by mail-ej1-x632.google.com with SMTP id a640c23a62f3a-af939afe5efso245969466b.2;
        Sun, 03 Aug 2025 03:33:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754217187; x=1754821987; darn=lists.infradead.org;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=4oRnuP4jSrdJzDgvqaR3lx1iHlupn4sHr1B/8K6MSts=;
        b=Sc9oQaZVTJMujt3EHlVCM8EmeW3h+BcbOP7tPEzFFoHUDqz+GAat5zfK1GF70OeOO4
         10L+wKr2QgmjWo6ukbEGQhiLCL5JAY3iCNn1TXJU3YCFMaCwMKlRnCixNQFFl3hel6V+
         XPmydn5/cWxs7yLVazqpmWCeE6YhEbfGMvklyH410pmSkjbnbQDqd5gkv+U2QzDog8Rk
         RYbB63qc4XYp7KNsFovxJvL14bML7+X3O7PlAfkYxIrF40AfsRHCFXzWKdEzwn/gpnje
         QHaTQhl8vYMXuVW9l7844SXjRJA4oTuN67nBmha/RJADNRBZH0X5nPO882tANNBgRMlV
         kFZA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754217187; x=1754821987;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=4oRnuP4jSrdJzDgvqaR3lx1iHlupn4sHr1B/8K6MSts=;
        b=ZjizvBquWGNXpS4jgy2n+k982wDYWJR3t6Y/VlkTvtDRICFEWCIpoxvC1xHDhav6ip
         z/atwDF1oJVEgcLexG6fFsdxXHbYa7jhq+pkVu+d+GX8lxQI7y1gQFKe4ysyvcOb01Gw
         UFv4NKKOhy3X+YOp38u6WT2u9zioA4Tp0VFNwJaM7yd55IEHDi7LSOkm/SrP9BqoPSpv
         Kzlbns8M66y4Pl8OnumYhqUGx5xEenvaENeAZnCjRdzn8S1u0AD0K+Ecwqod22dF6lBk
         eMn/xX7TAxyhPgOq9cPblf8diY5s19pdhTDiXihKV9Y0ThbV73TnHds16SQmS+021trk
         OfJA==
X-Forwarded-Encrypted: i=1; AJvYcCXbbUSKnaZYs1jT3vrgOhvxYUllcNQuKk5c3Ec/bhH4+T6FVt2XY32t3tmIQBdnASrOAbef9/ytVhmmWyHOtA==@lists.infradead.org
X-Gm-Message-State: AOJu0YwR21XcumwrglCacuPG2LjUjS3YQ5mVsrL6IUjrKxUn4JJOjnQh
	4PbbdRTrX8voFmTO1P4dTbXkebx+K5S9osDSsdHD3bWHEsZKAKIxQsoUkqlmSoH1yrQAVC6pbDj
	NM0MekzByyAZtYmI3HglSpZcO+OaEDnIDnr1SwoJJxQ==
X-Gm-Gg: ASbGnctptfjlCVpot8FA/VDBMAcYj/EXBOLnbNCCVHOWU/O9bzRuR+IZKFbZkR/6eVY
	ZIU1Z8uoSKzERghXho2/SfMsw6BdtXl1lr8sqZ7OsNXS34MeYls7EbDb6AvJmSLYZDHrZs/CamZ
	qm4aA0nQKmDd3e2/Tp1G7XJK6ZI2GDBBmeSKhN6o4b676CmWSWjzBVJGAgo4JQgprCUoFdXSEKD
	y/e9wnXkPHMJeQ2EPzn1TTyPzpBLKUNfegizssCxA==
X-Google-Smtp-Source: AGHT+IEsiLjMRyXYhncxuci92btZ+xh5rvmcRX5wKkTyopgH/WMz7bhDERZr/gb2/fxeD2QWq8Haa1xO8DxrAysRNyE=
X-Received: by 2002:a17:907:7fa3:b0:af9:3d0a:f38f with SMTP id
 a640c23a62f3a-af93fd64bf3mr624693166b.0.1754217186911; Sun, 03 Aug 2025
 03:33:06 -0700 (PDT)
MIME-Version: 1.0
From: Haru Zheng <towwy321@gmail.com>
Date: Sun, 3 Aug 2025 18:32:55 +0800
X-Gm-Features: Ac12FXzIOcl_0A4Ih1a8nY3gchgr3V34vE8-EiuwlXia7lYUBWk08DLPwS9N9FI
Message-ID: <CACw2aoTa8KU-KkxqA10OeVK+yV7t-B94KDa4Odi1sbpY6qAENg@mail.gmail.com>
Subject: [PATCH] drm/mediatek: dp: Fix suspend/resume training failure
To: granquet@baylibre.com, "ck.hu@mediatek.com" <ck.hu@mediatek.com>, 
	"msp@baylibre.com" <msp@baylibre.com>, 
	"angelogioacchino.delregno@collabora.com" <angelogioacchino.delregno@collabora.com>, 
	"matthias.bgg@gmail.com" <matthias.bgg@gmail.com>, "simona@ffwll.ch" <simona@ffwll.ch>, 
	"airlied@gmail.com" <airlied@gmail.com>, "p.zabel@pengutronix.de" <p.zabel@pengutronix.de>, chunkuang.hu@kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org, 
	rex-bc.chen@mediatek.com
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250803_033309_449722_3CABBC8F 
X-CRM114-Status: GOOD (  16.90  )
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

From 4919bd858cd9cba8e4aadba7c3d1fd434ef3b09e Mon Sep 17 00:00:00 2001
From: Haru Zheng <towwy321@gmail.com>
Date: Wed, 18 Jun 2025 11:28:37 +0800
Subject: [PATCH] drm/mediatek: dp: Fix suspend/resume training failure

When suspending and resuming DisplayPort via Type-C,
link training may fail.

This patch backports the software IRQ handling for DP,
as eDP uses hardware IRQ while DP uses software IRQ.
Additionally, cable_plugged_in is flipped in
mtk_dp_hpd_event to ensure correct hotplug detection
during resume.

These changes fix the DP training failure after suspend/resume.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Tested-on: Genio G700 EVK
Signed-off-by: Haru Zheng <towwy321@gmail.com>
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 100 ++++++++++++++++++++++++--
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |   3 +
 2 files changed, 96 insertions(+), 7 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c
b/drivers/gpu/drm/mediatek/mtk_dp.c
index bef6eeb30d3e..0cfe792bc36d 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1012,6 +1012,16 @@ static u32 mtk_dp_swirq_get_clear(struct mtk_dp *mtk_dp)
  return irq_status;
 }

+static void mtk_dp_swirq_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+ if (enable)
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C4, 0,
+    SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK);
+ else
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C4, 0xFFFF,
+    SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK);
+}
+
 static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
 {
  u32 irq_status = (mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3418) &
@@ -1751,6 +1761,8 @@ static int mtk_dp_parse_capabilities(struct
mtk_dp *mtk_dp)
      mtk_dp->train_info.sink_ssc)
  return 0;

+ memset(mtk_dp->rx_cap, 0, DP_RECEIVER_CAP_SIZE);
+
  ret = drm_dp_read_dpcd_caps(&mtk_dp->aux, mtk_dp->rx_cap);
  if (ret < 0)
  return ret;
@@ -2031,8 +2043,8 @@ static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
  spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);

  if (cable_sta_chg) {
- if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
-        HPD_DB_DP_TRANS_P0_MASK))
+ if (!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
+       HPD_DB_DP_TRANS_P0_MASK))
  mtk_dp->train_info.cable_plugged_in = true;
  else
  mtk_dp->train_info.cable_plugged_in = false;
@@ -2265,6 +2277,41 @@ static ssize_t mtk_dp_aux_transfer(struct
drm_dp_aux *mtk_aux,
  return ret;
 }

+static void mtk_dp_swirq_hpd(struct mtk_dp *mtk_dp, u8 conn)
+{
+ u32 data;
+
+ data = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414);
+
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    HPD_OVR_EN_DP_TRANS_P0_MASK,
+    HPD_OVR_EN_DP_TRANS_P0_MASK);
+
+ if (conn)
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    HPD_SET_DP_TRANS_P0_MASK,
+    HPD_SET_DP_TRANS_P0_MASK);
+ else
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    0,
+    HPD_SET_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_swirq_hpd_interrupt_set(struct mtk_dp *mtk_dp, u8 status)
+{
+ dev_info(mtk_dp->dev, "[DPTX] status:%d [2:DISCONNECT, 4:CONNECT]\n", status);
+
+ if (status == MTK_DP_HPD_CONNECT) {
+ mtk_dp_init_port(mtk_dp);
+ mtk_dp_swirq_hpd(mtk_dp, TRUE);
+ } else {
+ mtk_dp_swirq_hpd(mtk_dp, FALSE);
+ }
+
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C0, status,
+    SW_IRQ_SET_DP_TRANS_P0_MASK);
+}
+
 static int mtk_dp_poweron(struct mtk_dp *mtk_dp)
 {
  int ret;
@@ -2534,7 +2581,7 @@ static int mtk_dp_bridge_atomic_check(struct
drm_bridge *bridge,

  dev_dbg(mtk_dp->dev, "input format 0x%04x, output format 0x%04x\n",
  bridge_state->input_bus_cfg.format,
- bridge_state->output_bus_cfg.format);
+ bridge_state->output_bus_cfg.format);

  if (input_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
  mtk_dp->info.format = DP_PIXELFORMAT_YUV422;
@@ -2552,6 +2599,30 @@ static int mtk_dp_bridge_atomic_check(struct
drm_bridge *bridge,
  return 0;
 }

+static void mtk_dp_bridge_hpd_notify(struct drm_bridge *bridge,
+      enum drm_connector_status status)
+{
+ struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+ struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
+
+ if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+ if (mtk_dp->hpd_state != status) {
+ if (status == connector_status_disconnected) {
+ train_info->cable_plugged_in = false;
+ } else {
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    HPD_OVR_EN_DP_TRANS_P0_MASK,
+    HPD_OVR_EN_DP_TRANS_P0_MASK);
+ mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+    HPD_SET_DP_TRANS_P0_MASK,
+    HPD_SET_DP_TRANS_P0_MASK);
+ train_info->cable_plugged_in = true;
+ }
+ mtk_dp->hpd_state = status;
+ }
+ }
+}
+
 static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
  .atomic_check = mtk_dp_bridge_atomic_check,
  .atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -2801,7 +2872,8 @@ static int mtk_dp_probe(struct platform_device *pdev)
  mtk_dp_power_enable(mtk_dp);

  /* Disable HW interrupts: we don't need any for eDP */
- mtk_dp_hwirq_enable(mtk_dp, false);
+ mtk_dp_hwirq_enable(mtk_dp, true);
+ mtk_dp_swirq_enable(mtk_dp, false);

  /*
  * Power on the AUX to allow reading the EDID from aux-bus:
@@ -2829,6 +2901,9 @@ static int mtk_dp_probe(struct platform_device *pdev)
  }
  }
  } else {
+ mtk_dp_swirq_enable(mtk_dp, false);
+ mtk_dp_hwirq_enable(mtk_dp, false);
+ mtk_dp_swirq_enable(mtk_dp, true);
  mtk_dp->bridge.ops = DRM_BRIDGE_OP_DETECT |
       DRM_BRIDGE_OP_EDID | DRM_BRIDGE_OP_HPD;
  ret = devm_drm_bridge_add(dev, &mtk_dp->bridge);
@@ -2861,10 +2936,15 @@ static int mtk_dp_suspend(struct device *dev)
  struct mtk_dp *mtk_dp = dev_get_drvdata(dev);

  mtk_dp_power_disable(mtk_dp);
- if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+
+ if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
  mtk_dp_hwirq_enable(mtk_dp, false);
- pm_runtime_put_sync(dev);
+ } else {
+ mtk_dp_swirq_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_DISCONNECT);
+ mtk_dp_swirq_enable(mtk_dp, false);
+ }

+ pm_runtime_put_sync(dev);
  return 0;
 }

@@ -2874,8 +2954,14 @@ static int mtk_dp_resume(struct device *dev)

  pm_runtime_get_sync(dev);
  mtk_dp_init_port(mtk_dp);
- if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+
+ if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
  mtk_dp_hwirq_enable(mtk_dp, true);
+ } else {
+ mtk_dp_swirq_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_CONNECT);
+ mtk_dp_swirq_enable(mtk_dp, true);
+ }
+
  mtk_dp_power_enable(mtk_dp);

  return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 8ad7a9cc259e..7c97e230be50 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -286,7 +286,10 @@
 #define POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK BIT(9)
 #define POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK BIT(10)
 #define POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK BIT(11)
+#define MTK_DP_TRANS_P0_35C0 0x35c0
+#define MTK_DP_TRANS_P0_35C4 0x35c4
 #define MTK_DP_TRANS_P0_35C8 0x35c8
+#define SW_IRQ_SET_DP_TRANS_P0_MASK GENMASK(15, 0)
 #define SW_IRQ_CLR_DP_TRANS_P0_MASK GENMASK(15, 0)
 #define SW_IRQ_STATUS_DP_TRANS_P0_MASK GENMASK(15, 0)
 #define MTK_DP_TRANS_P0_35D0 0x35d0
-- 
2.45.2

