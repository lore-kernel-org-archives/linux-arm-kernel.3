Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28D19C87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Aug 2025 16:27:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=EuLKrEo/38TeccYm6/Zrtps7StZfzswaxcTtPYrzP+U=; b=seDq3lzpqyjq4F2idALBR47QRs
	/mzZXX9edvBTuyTnYg8EVyjpWlOo75IJqCU3Uxx7GKshi2sYxUp8s2Jgon3ojKc39i+vXnC0Mxd5O
	ptywwq21fmNqIjwbw4VVi+j+Dth08vgoOI/W/bvVwaYS/VGBqlthh8pp3vTMdz89ngUwOA8der5GA
	flRNpM7yt8D93lZITz5OjBO2HlIsSojkyLRu00JYjN0mKFJRIzU+a2FWShmLpdCSn+Sjd+lnUewFb
	3qsHUOR/F4nGn3SsQif48ZUymxthoa3ddxDX0JH/vKXEQ0Gk7oPMRjVMm7iu6BRoFqWhIAAAxbOwu
	TK/Mt7DQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uiy1Z-0000000AyYv-2rCu;
	Mon, 04 Aug 2025 16:26:57 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uixfB-0000000Ax0R-3W5c;
	Mon, 04 Aug 2025 16:03:51 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2402bbb4bf3so42034105ad.2;
        Mon, 04 Aug 2025 09:03:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1754323429; x=1754928229; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=EuLKrEo/38TeccYm6/Zrtps7StZfzswaxcTtPYrzP+U=;
        b=mCR2aj0fy51KLqhsavn9Z+r3KRruZKoAdc8LjgZu+113S20poQu+ng4al10g94ZbB1
         JvQZAcEbs3BOS/Updv38XOLrz7h6O8Bg9MQuaaW3bUzJuKexe3l8VDhInGFLIQUCmLXS
         ak/y7bULL464NZNwQDgy85cXEI7p+Ghju2qordPvdyosSL68NGmQdriUf4NYO5mk8iBN
         A7TvrIihqvEauoMV3p7loyn56fWwELUyohvlRCTAlOvZ97v/dKt3aJWogm3v1W3txY64
         iGaT+4F11Wh64raTdJtQRPN6nCNQFuTTjwBsgGHhU4/nGyqOoba/bI6RUTf7wiepH1MZ
         3YWQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1754323429; x=1754928229;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=EuLKrEo/38TeccYm6/Zrtps7StZfzswaxcTtPYrzP+U=;
        b=SBWbryki9QaHJOwZPnW7I6Xh4pCkkUVEfop53aIk/LiMCO8RQSyZcoAeF5R9rp2PIg
         OqWStKARvlBoBM8451a4w9m7Y2Yv+K8SJ6lKP0t3zeCbn3ESQQUzXdVPjzYYiRfDWZC1
         qjzojAS2qHy1qSM55JpOa+uM6EiIdlkARSn+SfpIrZEL9F9L9HGlceH6NNnjOs3olkSr
         pUeD1JUK6ofg/M2zHtdJRkUU8eMJBhTVyP4SUXqAV2ouiCXxGrETCwP5IeiY34pUq8fZ
         gYqj43dCxkij97fv2assYTngmNEWtl+HMW31lsvxLosFjfx3zu71OaOWpM8Y4EZOfeOL
         zx+w==
X-Forwarded-Encrypted: i=1; AJvYcCWpPgbB+RCtNVVbmOne8d2+Pr38glJDJtEoJ2S92byQXf7RhU26QGB3hTwWURS0B395rv/uaxWfM7HPkZV1ujdY@lists.infradead.org, AJvYcCXWSphOvOFADxoS/jtfEL0v6Wev1PlN4PBuSGdGkedRbzYrrGFdP3BsqlTVnFOqsai7yDC0sdMRkpYVGCR+OtI=@lists.infradead.org
X-Gm-Message-State: AOJu0YyQrt1Zk2Ep9RugyljA7rbm+gcP4JnaWyBy2svSogU3v6QFJNqX
	AI3cJNzrzW1YgIRisjlxJt2umkmQUBvmLCCIH3QtI6pH/G78ugORPtXv
X-Gm-Gg: ASbGncsuna90lWI+sGhjgmIrE3bv4wWIi5w2z0D+oppnuloqEmjTYWUDiuN+Nawv/dh
	7bklRDWfECcSfH0QZMpQrvcNwf288qboMIXH6glMaj4s3/eqB6M/B7gAX4Lj6eOLzXUX4BATXoK
	aLnWyEYSx1gEHSRRBxOksTrhcrcztKli2LtckslC387JzlIDvLkn7tcb/cJpOaySMfbtuPnQoai
	8N/jLvNyXO/TvTTeNNDInlP9hOmlEANkaNGo+jbhhncUrSBLHHX/vcrg+pDKHvfnmTBjei01Cea
	BDyMcbR4GB6SmOpnlcKD/GFLuyVwRfUJ1rxVrJMm/Tb8X6NNNzTEF9PML3lkWPqn+oSylIC0Mfp
	SN03oVpo3SdXbQKTLM+H9MpOJ6DfN35vbtIo6GI35vsYBxfIcnULnfwcIbuNWxsWXOI+/AuPbSj
	8rNNiYIOUwHcZwTGueCzA5xVIgiYfgiMcu/THJT1ymS73ON7ijFuY3cGzjkA==
X-Google-Smtp-Source: AGHT+IFpFHly+Ozf0EOVxfTWjc4+nDDGQgtb7fAKJmSeMzRkWUAP4gN7GeK0k4+gfh2wEmGHwbVPbg==
X-Received: by 2002:a17:902:cecd:b0:240:2281:bd0e with SMTP id d9443c01a7336-24246f2d317mr137834605ad.2.1754323428265;
        Mon, 04 Aug 2025 09:03:48 -0700 (PDT)
Received: from localhost.localdomain (2001-b011-7005-5e00-dd65-4c2e-14df-36e2.dynamic-ip6.hinet.net. [2001:b011:7005:5e00:dd65:4c2e:14df:36e2])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-241e899adc3sm113990615ad.118.2025.08.04.09.03.44
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Mon, 04 Aug 2025 09:03:47 -0700 (PDT)
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
Subject: [PATCH v2] drm/mediatek: dp: Fix suspend/resume training failure
Date: Tue,  5 Aug 2025 00:03:36 +0800
Message-Id: <20250804160336.7615-1-towwy321@gmail.com>
X-Mailer: git-send-email 2.23.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250804_090349_886695_395B4D22 
X-CRM114-Status: GOOD (  20.55  )
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
- Corrected HW/SW IRQ logic:
  * eDP uses hardware IRQ, DP uses software IRQ
  * Previously some logic was reversed causing issues
- Fixed hotplug detection logic in mtk_dp_hpd_event:
  * cable_plugged_in flag inverted to ensure correct detection on resume

Code flow:
- On suspend, DP disables training and IRQs accordingly.
- On resume, IRQs for DP are re-enabled via software IRQ handler.
- HPD events are processed with correct plug/unplug state, ensuring training succeeds.

---
 drivers/gpu/drm/mediatek/mtk_dp.c     | 94 ++++++++++++++++++++++++---
 drivers/gpu/drm/mediatek/mtk_dp_reg.h |  3 +
 2 files changed, 87 insertions(+), 10 deletions(-)

diff --git a/drivers/gpu/drm/mediatek/mtk_dp.c b/drivers/gpu/drm/mediatek/mtk_dp.c
index bef6eeb30d3e..b0f96c7c279e 100644
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
@@ -2031,8 +2037,8 @@ static irqreturn_t mtk_dp_hpd_event(int hpd, void *dev)
 	spin_unlock_irqrestore(&mtk_dp->irq_thread_lock, flags);
 
 	if (cable_sta_chg) {
-		if (!!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
-		       HPD_DB_DP_TRANS_P0_MASK))
+		if (!(mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414) &
+		      HPD_DB_DP_TRANS_P0_MASK))
 			mtk_dp->train_info.cable_plugged_in = true;
 		else
 			mtk_dp->train_info.cable_plugged_in = false;
@@ -2252,7 +2258,7 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 					     to_access, &msg->reply);
 
 		if (ret) {
-			dev_info(mtk_dp->dev,
+			dev_dbg(mtk_dp->dev,
 				 "Failed to do AUX transfer: %d\n", ret);
 			goto err;
 		}
@@ -2265,6 +2271,35 @@ static ssize_t mtk_dp_aux_transfer(struct drm_dp_aux *mtk_aux,
 	return ret;
 }
 
+static void mtk_dp_swirq_hpd(struct mtk_dp *mtk_dp, u8 conn)
+{
+	u32 data;
+
+	data = mtk_dp_read(mtk_dp, MTK_DP_TRANS_P0_3414);
+
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
@@ -2326,7 +2361,13 @@ static int mtk_dp_bridge_attach(struct drm_bridge *bridge,
 	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP) {
 		irq_clear_status_flags(mtk_dp->irq, IRQ_NOAUTOEN);
 		enable_irq(mtk_dp->irq);
+		/* eDP does use HW IRQs */
 		mtk_dp_hwirq_enable(mtk_dp, true);
+		mtk_dp_swirq_enable(mtk_dp, false);
+	} else {
+		/* DP does use SW IRQs */
+		mtk_dp_hwirq_enable(mtk_dp, false);
+		mtk_dp_swirq_enable(mtk_dp, true);
 	}
 
 	return 0;
@@ -2534,7 +2575,7 @@ static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
 
 	dev_dbg(mtk_dp->dev, "input format 0x%04x, output format 0x%04x\n",
 		bridge_state->input_bus_cfg.format,
-		 bridge_state->output_bus_cfg.format);
+		bridge_state->output_bus_cfg.format);
 
 	if (input_bus_format == MEDIA_BUS_FMT_YUYV8_1X16)
 		mtk_dp->info.format = DP_PIXELFORMAT_YUV422;
@@ -2552,6 +2593,30 @@ static int mtk_dp_bridge_atomic_check(struct drm_bridge *bridge,
 	return 0;
 }
 
+static void mtk_dp_bridge_hpd_notify(struct drm_bridge *bridge,
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
@@ -2566,6 +2631,7 @@ static const struct drm_bridge_funcs mtk_dp_bridge_funcs = {
 	.mode_valid = mtk_dp_bridge_mode_valid,
 	.edid_read = mtk_dp_edid_read,
 	.detect = mtk_dp_bdg_detect,
+	.hpd_notify = mtk_dp_bridge_hpd_notify,
 };
 
 static void mtk_dp_debounce_timer(struct timer_list *t)
@@ -2800,9 +2866,6 @@ static int mtk_dp_probe(struct platform_device *pdev)
 		mtk_dp_initialize_aux_settings(mtk_dp);
 		mtk_dp_power_enable(mtk_dp);
 
-		/* Disable HW interrupts: we don't need any for eDP */
-		mtk_dp_hwirq_enable(mtk_dp, false);
-
 		/*
 		 * Power on the AUX to allow reading the EDID from aux-bus:
 		 * please note that it is necessary to call power off in the
@@ -2861,10 +2924,15 @@ static int mtk_dp_suspend(struct device *dev)
 	struct mtk_dp *mtk_dp = dev_get_drvdata(dev);
 
 	mtk_dp_power_disable(mtk_dp);
-	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp_hwirq_enable(mtk_dp, false);
-	pm_runtime_put_sync(dev);
+	} else {
+		mtk_dp_swirq_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_DISCONNECT);
+		mtk_dp_swirq_enable(mtk_dp, false);
+	}
 
+	pm_runtime_put_sync(dev);
 	return 0;
 }
 
@@ -2874,8 +2942,14 @@ static int mtk_dp_resume(struct device *dev)
 
 	pm_runtime_get_sync(dev);
 	mtk_dp_init_port(mtk_dp);
-	if (mtk_dp->bridge.type != DRM_MODE_CONNECTOR_eDP)
+
+	if (mtk_dp->bridge.type == DRM_MODE_CONNECTOR_eDP) {
 		mtk_dp_hwirq_enable(mtk_dp, true);
+	} else {
+		mtk_dp_swirq_hpd_interrupt_set(mtk_dp, MTK_DP_HPD_CONNECT);
+		mtk_dp_swirq_enable(mtk_dp, true);
+	}
+
 	mtk_dp_power_enable(mtk_dp);
 
 	return 0;
diff --git a/drivers/gpu/drm/mediatek/mtk_dp_reg.h b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
index 8ad7a9cc259e..7c97e230be50 100644
--- a/drivers/gpu/drm/mediatek/mtk_dp_reg.h
+++ b/drivers/gpu/drm/mediatek/mtk_dp_reg.h
@@ -286,7 +286,10 @@
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


