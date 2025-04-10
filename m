Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ACE71C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:47:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BJ9fDAhOkJvFn7vZ3dAC3ursU8DT6tUynz6Xsgxfog4=; b=DqbqTpN39kYOU8T8WrXYwjt9dw
	g20nEwwrSQ6BDZ/lcXw9GBQqV4wKiZKqeJtsaE52k+Ypf2vx6bXvDoYCrl9pHwcwVjVsD5l/b1BvZ
	zW5qQjhDx4O00fCtqgHV2ZL/35P+wrve43HJ7A3pVdKj8NX+uyMv+2ZADFsmFSiNsIJAb7fdMqxFf
	x45C8QrjF14F6JE5mm+u1xXSJWHmP5AihtzLAIBy3gDI/+6Cx6iDzctdu95mfEj2CVh0PeCZ2gI/i
	fZcWCgnljbs+IBK/vxGgm+V45nxSrqsMhTBYW7WGct3DQG/eKd+a1k3xnDi9jgImvwJDw2W0EZjJW
	czJCoCRQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lhG-00000009PyP-3i7z;
	Thu, 10 Apr 2025 06:47:35 +0000
Received: from mailgw02.mediatek.com ([216.200.240.185])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lQi-00000009N8t-2Ux8;
	Thu, 10 Apr 2025 06:30:35 +0000
X-UUID: 44e5f96815d511f0a1e849db4cc18d44-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=BJ9fDAhOkJvFn7vZ3dAC3ursU8DT6tUynz6Xsgxfog4=;
	b=RwDqo0knyc2Jrysh07hybwuG4ULnYUvSI0f8tbVWremvusCWbrW//Ek+eEENgixXapWi75tdmTX8oFP8PSuuv2yTDpW3IWMdCMbJFMRd+9+mNdp3r7RAnFyuW0MjyjgCXCh7wb9vgFQc/PZwTJcNB4on/cUPEhaL93Xd/LL3IPI=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:628fa03d-3acf-472a-8b28-4b8ff3e97979,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:cd9b138b-0afe-4897-949e-8174746b1932,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT|NGT
X-CID-BAS: 5,DFT|NGT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 44e5f96815d511f0a1e849db4cc18d44-20250409
Received: from mtkmbs13n2.mediatek.inc [(172.21.101.108)] by mailgw02.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 73235380; Wed, 09 Apr 2025 23:30:17 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:14 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:14 +0800
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
Subject: [PATCH v2 04/12] media: mediatek: jpeg: add jpeg smmu sid setting
Date: Thu, 10 Apr 2025 14:29:57 +0800
Message-ID: <20250410063006.5313-5-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250410063006.5313-1-kyrie.wu@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250409_233028_703901_FA56C8FD 
X-CRM114-Status: GOOD (  16.42  )
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

Add a configuration to set jpeg dec & enc smmu sid

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../platform/mediatek/jpeg/mtk_jpeg_core.c    | 34 +++++++++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_core.h    | 19 +++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c  | 24 +++++++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c  | 25 ++++++++++++++
 4 files changed, 102 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 63a6efc8e21a..97117f7babd9 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -1584,6 +1584,18 @@ static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 	return IRQ_HANDLED;
 }
 
+static void mtk_jpeg_enc_set_smmu_sid(struct mtk_jpegenc_comp_dev *jpeg)
+{
+	u32 val, mask;
+
+	val = readl(jpeg->smmu_info.smmu_base);
+	mask = ~(jpeg->smmu_info.mask << jpeg->smmu_info.shift);
+	val &= mask;
+	val |= (jpeg->smmu_info.sid << jpeg->smmu_info.shift);
+
+	writel(val, jpeg->smmu_info.smmu_base);
+}
+
 static void mtk_jpegenc_worker(struct work_struct *work)
 {
 	struct mtk_jpegenc_comp_dev *comp_jpeg[MTK_JPEGENC_HW_MAX];
@@ -1655,6 +1667,10 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	jpeg_dst_buf->frame_num = ctx->total_frame_num;
 	ctx->total_frame_num++;
 	mtk_jpeg_enc_reset(comp_jpeg[hw_id]->reg_base);
+
+	if (jpeg->variant->support_smmu_flag)
+		mtk_jpeg_enc_set_smmu_sid(comp_jpeg[hw_id]);
+
 	mtk_jpeg_set_enc_dst(ctx,
 			     comp_jpeg[hw_id]->reg_base,
 			     &dst_buf->vb2_buf);
@@ -1679,6 +1695,18 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 }
 
+static void mtk_jpeg_dec_set_smmu_sid(struct mtk_jpegdec_comp_dev *jpeg)
+{
+	u32 val, mask;
+
+	val = readl(jpeg->smmu_info.smmu_base);
+	mask = ~(jpeg->smmu_info.mask << jpeg->smmu_info.shift);
+	val &= mask;
+	val |= (jpeg->smmu_info.sid << jpeg->smmu_info.shift);
+
+	writel(val, jpeg->smmu_info.smmu_base);
+}
+
 static void mtk_jpegdec_worker(struct work_struct *work)
 {
 	struct mtk_jpeg_ctx *ctx = container_of(work, struct mtk_jpeg_ctx,
@@ -1771,6 +1799,10 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 	spin_lock_irqsave(&comp_jpeg[hw_id]->hw_lock, flags);
 	ctx->total_frame_num++;
 	mtk_jpeg_dec_reset(comp_jpeg[hw_id]->reg_base);
+
+	if (jpeg->variant->support_smmu_flag)
+		mtk_jpeg_dec_set_smmu_sid(comp_jpeg[hw_id]);
+
 	mtk_jpeg_dec_set_config(comp_jpeg[hw_id]->reg_base,
 				jpeg->variant->support_34bit,
 				&jpeg_src_buf->dec_param,
@@ -1933,6 +1965,7 @@ static struct mtk_jpeg_variant mtk8196_jpegenc_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_JPEG,
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegenc_worker,
+	.support_smmu_flag = true,
 };
 
 static const struct mtk_jpeg_variant mtk8195_jpegdec_drvdata = {
@@ -1959,6 +1992,7 @@ static const struct mtk_jpeg_variant mtk8196_jpegdec_drvdata = {
 	.cap_q_default_fourcc = V4L2_PIX_FMT_YUV420M,
 	.multi_core = true,
 	.jpeg_worker = mtk_jpegdec_worker,
+	.support_smmu_flag = true,
 };
 
 static const struct mtk_jpeg_variant mtk8188_jpegenc_drvdata = {
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 8fddc133c46c..17d2b9274469 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -82,6 +82,7 @@ struct mtk_jpeg_variant {
 	bool multi_core;
 	void (*jpeg_worker)(struct work_struct *work);
 	bool support_34bit;
+	bool support_smmu_flag;
 };
 
 struct mtk_jpeg_src_buf {
@@ -138,6 +139,20 @@ struct mtk_jpegdec_clk {
 	int clk_num;
 };
 
+/**
+ * struct mtk_smmu_info - Structure used to store smmu information
+ * @smmu_base:		JPEG encode smmu register mapping
+ * @sid:		JPEG encode smmu hw sid
+ * @shift:		JPEG encode smmu hw bit shift
+ * @mask:		JPEG encode smmu hw bit mask
+ */
+struct mtk_smmu_info {
+	void __iomem *smmu_base;
+	unsigned int sid;
+	unsigned int shift;
+	unsigned int mask;
+};
+
 /**
  * struct mtk_jpegenc_comp_dev - JPEG COREX abstraction
  * @dev:		JPEG device
@@ -150,6 +165,7 @@ struct mtk_jpegdec_clk {
  * @hw_param:		jpeg encode hw parameters
  * @hw_state:		record hw state
  * @hw_lock:		spinlock protecting the hw device resource
+ * @smmu_info:		SMMU information
  */
 struct mtk_jpegenc_comp_dev {
 	struct device *dev;
@@ -163,6 +179,7 @@ struct mtk_jpegenc_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct mtk_smmu_info smmu_info;
 };
 
 /**
@@ -177,6 +194,7 @@ struct mtk_jpegenc_comp_dev {
  * @hw_param:			jpeg decode hw parameters
  * @hw_state:			record hw state
  * @hw_lock:			spinlock protecting hw
+ * @smmu_info:			SMMU information
  */
 struct mtk_jpegdec_comp_dev {
 	struct device *dev;
@@ -190,6 +208,7 @@ struct mtk_jpegdec_comp_dev {
 	enum mtk_jpeg_hw_state hw_state;
 	/* spinlock protecting the hw device resource */
 	spinlock_t hw_lock;
+	struct mtk_smmu_info smmu_info;
 };
 
 /**
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index d868e46aaf37..1bc632f54bc2 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -618,6 +618,29 @@ static int mtk_jpegdec_hw_init_irq(struct mtk_jpegdec_comp_dev *dev)
 	return 0;
 }
 
+static void mtk_jpegdec_smmu_init(struct mtk_jpegdec_comp_dev *dev)
+{
+	struct resource *r;
+
+	r = platform_get_resource(dev->plat_dev, IORESOURCE_MEM, 1);
+	if (!r) {
+		dev_err(&dev->plat_dev->dev, "get smmu_base failed\n");
+		return;
+	}
+
+	dev->smmu_info.smmu_base =
+		devm_ioremap(&dev->plat_dev->dev, r->start,
+			     resource_size(r));
+	if (IS_ERR(dev->smmu_info.smmu_base)) {
+		dev_err(&dev->plat_dev->dev, "mmap smmu_base failed(%ld)\n",
+			PTR_ERR(dev->smmu_info.smmu_base));
+		return;
+	}
+
+	dev->smmu_info.sid = 0x4;
+	dev->smmu_info.shift = 8;
+	dev->smmu_info.mask = 0x7;
+}
 static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegdec_clk *jpegdec_clk;
@@ -670,6 +693,7 @@ static int mtk_jpegdec_hw_probe(struct platform_device *pdev)
 	master_dev->reg_decbase[i] = dev->reg_base;
 	dev->master_dev = master_dev;
 
+	mtk_jpegdec_smmu_init(dev);
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index ca06d4f435cd..db9b67830a72 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -353,6 +353,30 @@ static int mtk_jpegenc_hw_init_irq(struct mtk_jpegenc_comp_dev *dev)
 	return 0;
 }
 
+static void mtk_jpegenc_smmu_init(struct mtk_jpegenc_comp_dev *dev)
+{
+	struct resource *r;
+
+	r = platform_get_resource(dev->plat_dev, IORESOURCE_MEM, 1);
+	if (!r) {
+		dev_err(&dev->plat_dev->dev, "get smmu_base failed\n");
+		return;
+	}
+
+	dev->smmu_info.smmu_base =
+		devm_ioremap(&dev->plat_dev->dev, r->start,
+			     resource_size(r));
+	if (IS_ERR(dev->smmu_info.smmu_base)) {
+		dev_err(&dev->plat_dev->dev, "mmap smmu_base failed(%ld)\n",
+			PTR_ERR(dev->smmu_info.smmu_base));
+		return;
+	}
+
+	dev->smmu_info.sid = 0x5;
+	dev->smmu_info.shift = 4;
+	dev->smmu_info.mask = 0x7;
+}
+
 static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 {
 	struct mtk_jpegenc_clk *jpegenc_clk;
@@ -403,6 +427,7 @@ static int mtk_jpegenc_hw_probe(struct platform_device *pdev)
 	master_dev->reg_encbase[i] = dev->reg_base;
 	dev->master_dev = master_dev;
 
+	mtk_jpegenc_smmu_init(dev);
 	platform_set_drvdata(pdev, dev);
 	pm_runtime_enable(&pdev->dev);
 
-- 
2.46.0


