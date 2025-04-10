Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 244D9C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:44:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYIvoPHqS7fFfpG+Rto6CBB7IAELSjTzUOJtSVPuK3g=; b=k2KQ8bmoRUDSvKRgEHlEas2zWa
	jTzXTXB6/Vn6c8M8iAXlJAx41PNfPG0lERpkPeTQGTEjQB3jDcX9/hIdKrguns4Zlk1P98IsaBzPC
	YDYhtmInKrnqelOhGdZ5WIJV3iD3R07zBfU9XG8+vpWiclAUtqK+EGljXHmSoWAP847hgsDcz/wqF
	arSM1mOKsfv5DRVUw5JvE6EBVo4DQLuFrydj74sLzW9Rz6BJ6ncfrD6swDD9WcpxO7BD4+MUpHJPR
	cOQP4bAsqSqMMMGDJda7AMgDaHqtsJGOnn36WUA0xBEfpJT+ePgJLfZLzj4a9qfOoqK5yQvViVzmx
	VHKmSVbw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2ldi-00000009PUN-3463;
	Thu, 10 Apr 2025 06:43:54 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lQf-00000009N7H-1Ppo;
	Thu, 10 Apr 2025 06:30:32 +0000
X-UUID: 475a0c5215d511f0a1e849db4cc18d44-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=fYIvoPHqS7fFfpG+Rto6CBB7IAELSjTzUOJtSVPuK3g=;
	b=aCsBynpSu6VQAz5SBWUL5LAy125hDBl6cIkiUach74P+6+lrWYIIo9lmF2j5eZk5OqiK8i1tNrCXFYkiZ7W082UmUYrco/pizp4nzsLvtOxZE1sJu4dxBXlbnVVhepey0WYP2lNIEPd2TACp9pQ62QFAH/Kia1R9flUqnN0cYD4=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:88558820-1531-4383-b2d0-eae4aeebfc68,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:6cffe7a5-c619-47e3-a41b-90eedbf5b947,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT|NGT
X-CID-BAS: 5,DFT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 475a0c5215d511f0a1e849db4cc18d44-20250409
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 877805864; Wed, 09 Apr 2025 23:30:21 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 mtkmbs11n1.mediatek.inc (172.21.101.185) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:19 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:18 +0800
From: kyrie.wu <kyrie.wu@mediatek.com>
To: Hans Verkuil <hverkuil-cisco@xs4all.nl>, Mauro Carvalho Chehab
	<mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
	<matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
	<angelogioacchino.delregno@collabora.com>, kyrie wu
	<kyrie.wu@mediatek.corp-partner.google.com>, <linux-media@vger.kernel.org>,
	<devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
	<linux-arm-kernel@lists.infradead.org>, <linux-mediatek@lists.infradead.org>
CC: kyrie.wu <kyrie.wu@mediatek.com>
Subject: [PATCH v2 09/12] media: mediatek: jpeg: refactor multi-core clk suspend and resume setting
Date: Thu, 10 Apr 2025 14:30:02 +0800
Message-ID: <20250410063006.5313-10-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250410063006.5313-1-kyrie.wu@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233025_440876_5760408A 
X-CRM114-Status: GOOD (  16.86  )
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

refactor jpeg clk suspend and resume setting for multi-core

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 28 +++----
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 75 ++++++++++++++++++-
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 75 ++++++++++++++++++-
 3 files changed, 151 insertions(+), 27 deletions(-)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 172a8aa80a2b..7dc6e78e95d4 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1125,6 +1125,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 {
 	int ret;
 
+	if (jpeg->variant->multi_core)
+		return;
+
 	ret = clk_bulk_prepare_enable(jpeg->variant->num_clks,
 				      jpeg->variant->clks);
 	if (ret)
@@ -1133,6 +1136,9 @@ static void mtk_jpeg_clk_on(struct mtk_jpeg_dev *jpeg)
 
 static void mtk_jpeg_clk_off(struct mtk_jpeg_dev *jpeg)
 {
+	if (jpeg->variant->multi_core)
+		return;
+
 	clk_bulk_disable_unprepare(jpeg->variant->num_clks,
 				   jpeg->variant->clks);
 }
@@ -1674,13 +1680,6 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 		goto enc_end;
 	}
 
-	ret = clk_prepare_enable(comp_jpeg[hw_id]->venc_clk.clks->clk);
-	if (ret) {
-		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
-			__func__, __LINE__);
-		goto enc_end;
-	}
-
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
@@ -1794,20 +1793,13 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 
 	mtk_jpegdec_set_hw_param(ctx, hw_id, src_buf, dst_buf);
-	ret = pm_runtime_get_sync(comp_jpeg[hw_id]->dev);
+	ret = pm_runtime_resume_and_get(comp_jpeg[hw_id]->dev);
 	if (ret < 0) {
 		dev_err(jpeg->dev, "%s : %d, pm_runtime_get_sync fail !!!\n",
 			__func__, __LINE__);
 		goto dec_end;
 	}
 
-	ret = clk_prepare_enable(comp_jpeg[hw_id]->jdec_clk.clks->clk);
-	if (ret) {
-		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
-			__func__, __LINE__);
-		goto clk_end;
-	}
-
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
 	v4l2_m2m_dst_buf_remove(ctx->fh.m2m_ctx);
 
@@ -1817,7 +1809,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 				 &dst_buf->vb2_buf, &fb)) {
 		dev_err(jpeg->dev, "%s : %d, mtk_jpeg_set_dec_dst fail\n",
 			__func__, __LINE__);
-		goto setdst_end;
+		goto set_dst_fail;
 	}
 
 	schedule_delayed_work(&comp_jpeg[hw_id]->job_timeout_work,
@@ -1843,9 +1835,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 
 	return;
 
-setdst_end:
-	clk_disable_unprepare(comp_jpeg[hw_id]->jdec_clk.clks->clk);
-clk_end:
+set_dst_fail:
 	pm_runtime_put(comp_jpeg[hw_id]->dev);
 dec_end:
 	v4l2_m2m_src_buf_remove(ctx->fh.m2m_ctx);
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index ec4120ef9043..e98170a6b9df 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -545,14 +545,13 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
-	clk_disable_unprepare(cjpeg->jdec_clk.clks->clk);
-	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(cjpeg);
 	jpeg_buf_queue_dec(ctx);
+	pm_runtime_put(cjpeg->dev);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -594,12 +593,11 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
 	jpeg_buf_queue_dec(ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
 	atomic_inc(&master_jpeg->hw_rdy);
+	pm_runtime_put(jpeg->dev);
 
 	return IRQ_HANDLED;
 }
@@ -706,15 +704,84 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	mtk_jpegdec_smmu_init(dev);
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
+	ret = devm_clk_bulk_get(dev->dev,
+				jpegdec_clk->clk_num,
+				jpegdec_clk->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_jpeg_clk_on(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(jpeg->jdec_clk.clk_num,
+				      jpeg->jdec_clk.clks);
+	if (ret)
+		dev_err(jpeg->dev, "%s : %d, jpegdec clk_prepare_enable fail\n",
+			__func__, __LINE__);
+}
+
+static void mtk_jpeg_clk_off(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	clk_bulk_disable_unprepare(jpeg->jdec_clk.clk_num,
+				   jpeg->jdec_clk.clks);
+}
+
+static __maybe_unused int mtk_jpegdec_pm_suspend(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_off(jpeg);
 
 	return 0;
 }
 
+static __maybe_unused int mtk_jpegdec_pm_resume(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_on(jpeg);
+
+	return 0;
+}
+
+static __maybe_unused int mtk_jpegdec_suspend(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
+	return pm_runtime_force_suspend(dev);
+}
+
+static __maybe_unused int mtk_jpegdec_resume(struct device *dev)
+{
+	struct mtk_jpegdec_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+	return ret;
+}
+
+static const struct dev_pm_ops mtk_jpegdec_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_jpegdec_suspend, mtk_jpegdec_resume)
+	SET_RUNTIME_PM_OPS(mtk_jpegdec_pm_suspend, mtk_jpegdec_pm_resume, NULL)
+};
+
 static struct platform_driver mtk_jpegdec_hw_driver = {
 	.probe = mtk_jpegdec_hw_probe,
 	.driver = {
 		.name = "mtk-jpegdec-hw",
 		.of_match_table = mtk_jpegdec_hw_ids,
+		.pm             = &mtk_jpegdec_pm_ops,
 	},
 };
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index cb6b9caeae2b..ca4fc18f496b 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -287,14 +287,13 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
-	clk_disable_unprepare(cjpeg->venc_clk.clks->clk);
-	pm_runtime_put(cjpeg->dev);
 	cjpeg->hw_state = MTK_JPEG_HW_IDLE;
 	atomic_inc(&master_jpeg->hw_rdy);
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(cjpeg);
 	jpeg_buf_queue_dec(ctx);
+	pm_runtime_put(cjpeg->dev);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -329,12 +328,11 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(jpeg);
 	jpeg_buf_queue_dec(ctx);
-	pm_runtime_put(ctx->jpeg->dev);
-	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 
 	jpeg->hw_state = MTK_JPEG_HW_IDLE;
 	wake_up(&master_jpeg->hw_wq);
 	atomic_inc(&master_jpeg->hw_rdy);
+	pm_runtime_put(jpeg->dev);
 
 	return IRQ_HANDLED;
 }
@@ -440,15 +438,84 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	mtk_jpegenc_smmu_init(dev);
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
+	ret = devm_clk_bulk_get(dev->dev,
+				jpegenc_clk->clk_num,
+				jpegenc_clk->clks);
+	if (ret) {
+		dev_err(&pdev->dev, "Failed to init clk\n");
+		return ret;
+	}
+
+	return 0;
+}
+
+static void mtk_jpeg_clk_on(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	int ret;
+
+	ret = clk_bulk_prepare_enable(jpeg->venc_clk.clk_num,
+				      jpeg->venc_clk.clks);
+	if (ret)
+		dev_err(jpeg->dev, "%s : %d, jpegenc clk_prepare_enable fail\n",
+			__func__, __LINE__);
+}
+
+static void mtk_jpeg_clk_off(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	clk_bulk_disable_unprepare(jpeg->venc_clk.clk_num,
+				   jpeg->venc_clk.clks);
+}
+
+static __maybe_unused int mtk_jpegenc_pm_suspend(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_off(jpeg);
 
 	return 0;
 }
 
+static __maybe_unused int mtk_jpegenc_pm_resume(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	mtk_jpeg_clk_on(jpeg);
+
+	return 0;
+}
+
+static __maybe_unused int mtk_jpegenc_suspend(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+
+	v4l2_m2m_suspend(jpeg->master_dev->m2m_dev);
+	return pm_runtime_force_suspend(dev);
+}
+
+static __maybe_unused int mtk_jpegenc_resume(struct device *dev)
+{
+	struct mtk_jpegenc_comp_dev *jpeg = dev_get_drvdata(dev);
+	int ret;
+
+	ret = pm_runtime_force_resume(dev);
+	if (ret < 0)
+		return ret;
+
+	v4l2_m2m_resume(jpeg->master_dev->m2m_dev);
+	return ret;
+}
+
+static const struct dev_pm_ops mtk_jpegenc_pm_ops = {
+	SET_SYSTEM_SLEEP_PM_OPS(mtk_jpegenc_suspend, mtk_jpegenc_resume)
+	SET_RUNTIME_PM_OPS(mtk_jpegenc_pm_suspend, mtk_jpegenc_pm_resume, NULL)
+};
+
 static struct platform_driver mtk_jpegenc_hw_driver = {
 	.probe = mtk_jpegenc_hw_probe,
 	.driver = {
 		.name = "mtk-jpegenc-hw",
 		.of_match_table = mtk_jpegenc_drv_ids,
+		.pm = &mtk_jpegenc_pm_ops,
 	},
 };
 
-- 
2.46.0


