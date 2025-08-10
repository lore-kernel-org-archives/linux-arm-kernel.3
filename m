Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B42D1C87FCA
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 10 Aug 2025 06:22:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=iHiYD5TAx7oNSWd0V98bNdA/j3BdzqRXYpMd86EugcI=; b=KjMA/nFGwg7lfO4S18CtgRnyMn
	DsLduH/xLPrJFMSC4XY7QyIE31vMzAce87VI/zk2ysc+sAs0++EMwI8dTO49JAYwtUpRz1tSdJpZD
	lqhDI6+GNp9Ig53f4H5QBBL4XQWwmfQy7HtLdxpv+xXwezXYLTjesKNwkE3lGu2Gg0Lami+iUMXeR
	jxbgTppEIBJPL8D3DEHwipmgFXwbSN9cueSOQyPYPnjQZ/55K7YF38JxAoQWFu3AcqentJr5jNt7L
	eNeOJktpNQ5v+YXGeaR47UTuvlZeHXDjZo9/zTmSbP4ifpp0MDaMbe9AS768hwS3pIi0h+UGnvga6
	82cXg3Lg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukzS0-00000005KrK-207H;
	Sun, 10 Aug 2025 06:22:36 +0000
Received: from mail-pl1-x636.google.com ([2607:f8b0:4864:20::636])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ukzPT-00000005KZl-2Efo;
	Sun, 10 Aug 2025 06:20:00 +0000
Received: by mail-pl1-x636.google.com with SMTP id d9443c01a7336-2400f746440so28117115ad.2;
        Sat, 09 Aug 2025 23:19:58 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754806798; x=1755411598; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=iHiYD5TAx7oNSWd0V98bNdA/j3BdzqRXYpMd86EugcI=;
        b=MYay+L0mbPbQZaHObS+JQcbrVwNhyy/oMX0aoCKRVMFmefdJzFOjAO7Hj+pC4Lqqb9
         5iudTGwBxbjKYVRtlBoffmZEM0b0aZn9wp13/OgmjvCvWaFbIHgxA5yLhtnvG9RDAeTo
         VhboGygvjCGlkVpHfR01wxaqMTYIBQgUrySNSvoF7EXRMxD7nNyRr4GqMkjLANyb5zJ6
         dQN81I43sL+nM8MyFtTNjbo9oFCF2frbbCWtuvjeNzQxlClZC+DOBkNjgeOd1Dr9UAyL
         WWs0a4tiU19uFavCCl3QyKndKSgnHOE5yXG+VuUU12NttAQZ3K3GrhqaJ+khI+le/dg3
         V52w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754806798; x=1755411598;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=iHiYD5TAx7oNSWd0V98bNdA/j3BdzqRXYpMd86EugcI=;
        b=q0Yg5x+5lvBsz9pkIfPpvu6unyoq67Fw3L5+2shJl6E8q/bFqJo6PcMW9TI6+VPv2k
         nqABBThDLmHPGg/sGLq3dMgJg4561KJOY6O9HGk/33waqitaj81kvN1+7V+3KOF2IBHE
         mCXDNCHK6uFNvp0QBVSRglpylxKGKTQ4Wg6EwjTiu+u+6jOliMrA0yZ16Fs4Dy5UjfG4
         SuEXvlzzFD3l1uzq8v6fo0XuKHKKYUlV0MNu66iVDZ2su5Y7LS7AvyovRXoyzRL4pvXM
         md9Z5vFbZM8TwiEb90KpkG/VdUnQPJRvLqiw3pcb3Ul0JKd9tbaHjwYqHQxIE991rLLY
         S/8g==
X-Forwarded-Encrypted: i=1; AJvYcCUN2fA1/epmxV6Kq9Gj2l3TiWKObDvQnh5OnchbmsCh6vwyorfdiEkh/dG2vrtT21Tt0pVODalFjvJx11i10U8=@lists.infradead.org, AJvYcCWZQK4cDTpQMgiLou9VUrOJ6Unxy10bLntP7Y4lKs0l4RtbwNQIG2Zuitvlj86418Q3QpbNe+vIUSN2UVY9O+QF@lists.infradead.org
X-Gm-Message-State: AOJu0Yw22B3MwEUJD9gzDTRmtlvdRH1Rz1SDtWGdZzMCW/t5vYTw1FKX
	ASDM8zYqZlOojy9QLq0zZ47SKLEoeemnO0WhEjqGuIQ0wcsZhB2nk691
X-Gm-Gg: ASbGncvynlr+A0O04mQ9+5LGO3Ne/fdQF219GrtkGi0hbO9D9yVTw4MNqAwy1oKzu1s
	Ct5eDRJorGHOBpDxrQGonTEgHSLvqkWNhg8yBhFyl7BF+kscXl6rJhAalyuSbCVUMqoPT9VS2bW
	8BvtTSWjzX2nkRegzzzbku13PGXTmtxxAywB78Bni/0rVNy4jnx7nzAXfyrZ/WxEqAyb785G+Tb
	yRboJJTZDwYUCQf4L3dDsci0VwLWoXAnx7qpOHh+uhPNXvWihDE4tooChdnVuY2GJJw37EtZRN6
	z9+mwqaIzOXpL85oAVXp6HEm/K92yqZ8lQ3uAH6n+OZldByih7avYQss45wdtPTL9Aicv61xKB4
	EOw3XfqJUliONg2f3+uDktjUlSbdxw3BIAhTLP7Wrhe1/FbeeU/iqelG5t7fJIH01rsQWO+dywc
	9UzsHYJc9LaWnrw1kZsNK4ewUH892vodQvQGKfu241a5RIHrgKyhJ89Xs=
X-Google-Smtp-Source: AGHT+IENAQKQ8XTl+dkcliLFRwObtOaTyEJC19RE34RM0jlE+rwWy/8UzGyV6oZqdnLlbRj/GYf5Jw==
X-Received: by 2002:a17:902:ecd0:b0:234:d778:13fa with SMTP id d9443c01a7336-242c22a0364mr135754725ad.26.1754806798195;
        Sat, 09 Aug 2025 23:19:58 -0700 (PDT)
Received: from localhost.localdomain (2001-b400-e35c-3cf4-810c-15a2-7205-9994.emome-ip6.hinet.net. [2001:b400:e35c:3cf4:810c:15a2:7205:9994])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-31f63f36311sm28348371a91.34.2025.08.09.23.19.52
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Sat, 09 Aug 2025 23:19:57 -0700 (PDT)
From: Haru Zheng <towwy321@gmail.com>
To: Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Markus Schneider-Pargmann <msp@baylibre.com>,
	CK Hu <ck.hu@mediatek.com>,
	Guillaume Ranquet <granquet@baylibre.com>
Cc: Bo-Chen Chen <rex-bc.chen@mediatek.com>,
	linux-kernel@vger.kernel.org,
	dri-devel@lists.freedesktop.org,
	linux-mediatek@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org,
	Haru Zheng <towwy321@gmail.com>
Subject: [PATCH v3] drm/mediatek: dp: Fix suspend/resume training failure
Date: Sun, 10 Aug 2025 14:17:38 +0800
Message-Id: <20250810061738.10977-1-towwy321@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250809_231959_574981_EC8E6134 
X-CRM114-Status: GOOD (  17.33  )
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

When suspending and resuming DisplayPort via Type-C,
link training will be fail.

This patch backports the software IRQ handling for DP,
as eDP uses hardware IRQ while DP uses software IRQ.
Additionally, cable_plugged_in is flipped in
mtk_dp_hpd_event to ensure correct hotplug detection
during resume.

These changes fix the DP training failure after suspend/resume.

Fixes: f70ac097a2cf ("drm/mediatek: Add MT8195 Embedded DisplayPort driver")
Signed-off-by: Haru Zheng <towwy321@gmail.com>

---

Changes since v1:
- Fixed indentation to use tabs
- Simplified swirq_enable() logic with ternary
- Removed unnecessary memset()
- Replaced dev_info() with dev_dbg()
- Add mtk_dp_bridge_hpd_notify() declaration to struct drm_bridge_funcs mtk_dp_bridge_funcs
- Removed IRQ enable from probe() to avoid enabling IRQ for eDP
- Corrected HW/SW IRQ logic for eDP and DP
- Fixed hotplug check logic in mtk_dp_hpd_event

Changes since v2:
- Dropped mtk_dp_bridge_hpd_notify() in favor of mtk_dp_altmode_hpd_notify()
- Removed IRQ enabling from probe() for eDP
- Restricted SW IRQ enabling to DP only, in bridge_attach()
- Corrected cable_plugged_in logic in mtk_dp_hpd_event()
- Cleaned up unused variables in mtk_dp_swirq_hpd()
- Updated comments to reflect eDP/DP IRQ separation
---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 81 ++++++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  5 ++
 2 files changed, 77 insertions(+), 9 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index 33cf9fe1ccde..5fdb319ec62c 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp.c
+++ b/drivers/gpu/drm/mediatek/mtk_dp.c
@@ -1012,6 +1012,12 @@ static u32 mtk_dp_swirq_get_clear(struct mtk_dp *mtk_dp)
 	return irq_status;
 }
 
+static void mtk_dp_swirq_enable(struct mtk_dp *mtk_dp, bool enable)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C4, enable ? 0 : 0xFFFF,
+			   SW_IRQ_FINAL_STATUS_DP_TRANS_P0_MASK);
+}
+
 static u32 mtk_dp_hwirq_get_clear(struct mtk_dp *mtk_dp)
 {
 	u32 irq_status = (mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3418) &
@@ -2265,6 +2271,31 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	return ret;
 }
 
+static void mtk_dp_swirq_hpd(struct mtk_dp *mtk_dp, u8 conn)
+{
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+			   HPD_OVR_EN_DP_TRANS_P0_MASK,
+			   HPD_OVR_EN_DP_TRANS_P0_MASK);
+
+	if (conn)
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+				   HPD_SET_DP_TRANS_P0_MASK,
+				   HPD_SET_DP_TRANS_P0_MASK);
+	else
+		mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+				   0,
+				   HPD_SET_DP_TRANS_P0_MASK);
+}
+
+static void mtk_dp_swirq_hpd_interrupt_set(struct mtk_dp *mtk_dp, u8 status)
+{
+	dev_dbg(mtk_dp->dev, "[DPTX] status:%d [2:DISCONNECT, 4:CONNECT]\n", status);
+
+	mtk_dp_swirq_hpd(mtk_dp, status == MTK_DP_HPD_CONNECT ? TRUE : FALSE);
+	mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_35C0, status,
+			   SW_IRQ_SET_DP_TRANS_P0_MASK);
+}
+
 static int mtk_dp_poweron(struct mtk_dp *mtk_dp)
 {
 	int ret;
@@ -2324,9 +2355,9 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 	mtk_dp->drm_dev = bridge->dev;
 
 	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
-		irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
-		enable_irq(mtk_dp->irq);
-		mtk_dp_hwirq_enable(mtk_dp, true);
+		/* DP does use SW IRQs */
+		mtk_dp_hwirq_enable(mtk_dp, false);
+		mtk_dp_swirq_enable(mtk_dp, true);
 	}
 
 	return 0;
@@ -2534,7 +2565,7 @@ static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
 
 	dev_dbg(mtk_dp->dev, "input format 0x%04x, output format 0x%04x\n",
 		bridge_state->input_bus_cfg.format,
-		bridge_state->output_bus_cfg.format);
+		 bridge_state->output_bus_cfg.format);
 
 	if (input_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
 		mtk_dp->info.format = DP_PIXELFORMAT_YUV422;
@@ -2552,6 +2583,30 @@ static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void mtk_dp_altmode_hpd_notify(struct drm_bridge *bridge,
+				     enum drm_connector_status status)
+{
+	struct mtk_dp *mtk_dp = mtk_dp_from_bridge(bridge);
+	struct mtk_dp_train_info *train_info = &mtk_dp->train_info;
+
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+		if (mtk_dp->hpd_state != status) {
+			if (status == connector_status_disconnected) {
+				train_info->cable_plugged_in = false;
+			} else {
+				mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+						   HPD_OVR_EN_DP_TRANS_P0_MASK,
+						   HPD_OVR_EN_DP_TRANS_P0_MASK);
+				mtk_dp_update_bits(mtk_dp, MTK_DP_TRANS_P0_3414,
+						   HPD_SET_DP_TRANS_P0_MASK,
+						   HPD_SET_DP_TRANS_P0_MASK);
+				train_info->cable_plugged_in = true;
+			}
+			mtk_dp->hpd_state = status;
+		}
+	}
+}
+
 static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.atomic_check = mtk_dp_bridge_atomic_check,
 	.atomic_duplicate_state = drm_atomic_helper_bridge_duplicate_state,
@@ -2566,6 +2621,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.mode_valid = mtk_dp_bridge_mode_valid,
 	.edid_read = mtk_dp_edid_read,
 	.detect = mtk_dp_bdg_detect,
+	.hpd_notify = mtk_dp_altmode_hpd_notify,
 };
 
 static void mtk_dp_debounce_timer(struct timer_list *t)
@@ -2861,10 +2917,13 @@ static int mtk_dp_suspend(struct device *dev)
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
 
 	mtk_dp_power_disable(mtk_dp);
-	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
-		mtk_dp_hwirq_enable(mtk_dp, false);
-	pm_runtime_put_sync(dev);
 
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp_swirq_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_DISCONNECT);
+		mtk_dp_swirq_enable(mtk_dp, false);
+	}
+
+	pm_runtime_put_sync(dev);
 	return 0;
 }
 
@@ -2874,8 +2933,12 @@ static int mtk_dp_resume(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 	mtk_dp_init_port(mtk_dp);
-	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
-		mtk_dp_hwirq_enable(mtk_dp, true);
+
+	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
+		mtk_dp_swirq_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_CONNECT);
+		mtk_dp_swirq_enable(mtk_dp, true);
+	}
+
 	mtk_dp_power_enable(mtk_dp);
 
 	return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 8ad7a9cc259e..c9a022ffd0ac 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -262,6 +262,8 @@
 #define HPD_DISC_THD_DP_TRANS_P0_MASK				GENMASK(11, 8)
 #define HPD_CONN_THD_DP_TRANS_P0_MASK				GENMASK(15, 12)
 #define MTK_DP_TRANS_P0_3414				0x3414
+#define HPD_OVR_EN_DP_TRANS_P0_MASK				BIT(0)
+#define HPD_SET_DP_TRANS_P0_MASK				BIT(1)
 #define HPD_DB_DP_TRANS_P0_MASK					BIT(2)
 #define MTK_DP_TRANS_P0_3418				0x3418
 #define IRQ_CLR_DP_TRANS_P0_MASK				GENMASK(3, 0)
@@ -286,7 +288,10 @@
 #define POST_MISC_DATA_LANE1_OV_DP_TRANS_P0_MASK		BIT(9)
 #define POST_MISC_DATA_LANE2_OV_DP_TRANS_P0_MASK		BIT(10)
 #define POST_MISC_DATA_LANE3_OV_DP_TRANS_P0_MASK		BIT(11)
+#define MTK_DP_TRANS_P0_35C0				0x35c0
+#define MTK_DP_TRANS_P0_35C4				0x35c4
 #define MTK_DP_TRANS_P0_35C8				0x35c8
+#define SW_IRQ_SET_DP_TRANS_P0_MASK				GENMASK(15, 0)
 #define SW_IRQ_CLR_DP_TRANS_P0_MASK				GENMASK(15, 0)
 #define SW_IRQ_STATUS_DP_TRANS_P0_MASK				GENMASK(15, 0)
 #define MTK_DP_TRANS_P0_35D0				0x35d0
-- 
2.23.0


