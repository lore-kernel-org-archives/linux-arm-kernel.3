Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15D1AC3601E
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Apr 2025 06:55:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dC+swCRK/KUh4UpmroT3tdqRkB1Za1ha1GQJntXx8y8=; b=duYvDqna3Cjpgq0KWNrg05QT9O
	oWRyBSl5UM3xzOYeRPFQuLuD1AmQY8FSGf4z5QW+8XaK1xNAIkNfw2zip3ACDCUa7++shVwnEJC3y
	LhDLLbX3f4hfMwcJ6KcQgysuMHl2Jbgg8WgrXngbOIAXHkUidrXlI91WGkPMOwDSJUaco+0EUKmKe
	c1/9ghSNkYCyCEFIHHoMIqUVMVZyFLSoy/70dzhYqvHzkU/nlYNxtz0BKS0tGlk1Q7Sf0DOHbG4mh
	QefLKqWR9mZbu1zBGBBNVa8FnSQDA/C88r6QrgdUet3xdsdWTKV7yVCViAgGfERKWa/QRkUlPMvUJ
	YhR3GzTA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2loN-00000009RKE-3KZx;
	Thu, 10 Apr 2025 06:54:55 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u2lR1-00000009NDo-0j5o
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 10 Apr 2025 06:30:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=dC+swCRK/KUh4UpmroT3tdqRkB1Za1ha1GQJntXx8y8=; b=ct0ghSgYpY5YZcApptsY0QSxjc
	0abxxOhCVuQxidHLMY+p+W9M+Jje5/sP76Go79PZRpJZGPZmiq9FPJc/mB3A8eKRX2c0NNMPuYDDh
	NbXHF6IiGWlx+GUeZdt9GKuLpZpEQRZvhUXRpPJcEnW/TL9Xvwnxk8dQg8pkOZpavYO73M0zRcsQ8
	U+I+lnA8hA3JGfxXeuLR5i/g4lLJtH5Vxcw4+gNJKlNjngg4CJsns+02Fxmh9kPOPDntQXdIlgj1D
	dyaSmZJGu9u2ZjRYw4I2Sw8Rm4zp1onfVf6T30hEe1w0xfrWF8slhUrskEJuny9IgSA5TboARmlnW
	PiFsoLsg==;
Received: from mailgw01.mediatek.com ([216.200.240.184])
	by desiato.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u2lQx-00000008lbn-3nUV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Apr 2025 06:30:46 +0000
X-UUID: 46e2539c15d511f083f2a1c9db70dae0-20250409
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=mediatek.com; s=dk;
	h=Content-Type:Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:CC:To:From; bh=dC+swCRK/KUh4UpmroT3tdqRkB1Za1ha1GQJntXx8y8=;
	b=sj2nyJ/NCX1GJWxBpyEaSwtajXZUaj7fnmYyArdlWSeiGRXgI27eKzCLlxxC/nqmeP5abIxI1s8XDEzQ5toxCBIZUmKg9qS4Us3uXVyAyynSki4eZ/mRbGiu6+FcUS89IYicO7wwHbVlb+l1Fx9gU6+WTaMO40D3WjOxA02Yi9U=;
X-CID-P-RULE: Release_Ham
X-CID-O-INFO: VERSION:1.2.1,REQID:cc0681af-1de0-47eb-9f32-44a0df2abf08,IP:0,UR
	L:0,TC:0,Content:0,EDM:0,RT:0,SF:0,FILE:0,BULK:0,RULE:Release_Ham,ACTION:r
	elease,TS:0
X-CID-META: VersionHash:0ef645f,CLOUDID:adc86f8d-f5b8-47d5-8cf3-b68fe7530c9a,B
	ulkID:nil,BulkQuantity:0,Recheck:0,SF:81|82|102,TC:nil,Content:0|50,EDM:-3
	,IP:nil,URL:0,File:nil,RT:nil,Bulk:nil,QS:nil,BEC:nil,COL:0,OSI:0,OSA:0,AV
	:0,LES:1,SPR:NO,DKR:0,DKP:0,BRR:0,BRE:0,ARC:0
X-CID-BVR: 5,DFT
X-CID-BAS: 5,DFT,0,_
X-CID-FACTOR: TF_CID_SPAM_SNR
X-UUID: 46e2539c15d511f083f2a1c9db70dae0-20250409
Received: from mtkmbs09n2.mediatek.inc [(172.21.101.94)] by mailgw01.mediatek.com
	(envelope-from <kyrie.wu@mediatek.com>)
	(musrelay.mediatek.com ESMTP with TLSv1.2 ECDHE-RSA-AES256-GCM-SHA384 256/256)
	with ESMTP id 102164400; Wed, 09 Apr 2025 23:30:20 -0700
Received: from mtkmbs11n1.mediatek.inc (172.21.101.185) by
 MTKMBS14N1.mediatek.inc (172.21.101.75) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1258.39; Thu, 10 Apr 2025 14:30:18 +0800
Received: from mhfsdcap04.gcn.mediatek.inc (10.17.3.154) by
 mtkmbs11n1.mediatek.inc (172.21.101.73) with Microsoft SMTP Server id
 15.2.1258.39 via Frontend Transport; Thu, 10 Apr 2025 14:30:17 +0800
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
Subject: [PATCH v2 08/12] media: mediatek: jpeg: fix stop streaming flow for multi-core
Date: Thu, 10 Apr 2025 14:30:01 +0800
Message-ID: <20250410063006.5313-9-kyrie.wu@mediatek.com>
X-Mailer: git-send-email 2.46.0
In-Reply-To: <20250410063006.5313-1-kyrie.wu@mediatek.com>
References: <20250410063006.5313-1-kyrie.wu@mediatek.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-MTK: N
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250410_073044_382377_D4A4468A 
X-CRM114-Status: GOOD (  17.52  )
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

1. For multi-core jpegdec, the all hws may run at the same time,
if one hw decoded firstly, the function of mtk_jpeg_dec_stop_streaming
would be called, but others input buffers are decoding, this will
cause some running buffers to be buffer done, causing errors;
2. add a parameter to calculate the decoding buffer counts, it
wil decrease to 0 until the all buffers decoded and the
mtk_jpeg_dec_stop_streaming could continue to be executed.

Signed-off-by: kyrie.wu <kyrie.wu@mediatek.com>
---
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.c | 16 ++++++++++++++++
 .../media/platform/mediatek/jpeg/mtk_jpeg_core.h |  2 ++
 .../platform/mediatek/jpeg/mtk_jpeg_dec_hw.c     |  9 +++++++++
 .../platform/mediatek/jpeg/mtk_jpeg_enc_hw.c     |  9 +++++++++
 4 files changed, 36 insertions(+)

diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
index 79a47a59caba..172a8aa80a2b 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.c
@@ -860,8 +860,12 @@ static struct vb2_v4l2_buffer *mtk_jpeg_buf_remove(struct mtk_jpeg_ctx *ctx,
 static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
+	if (jpeg->variant->multi_core)
+		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) == 0));
+
 	while ((vb = mtk_jpeg_buf_remove(ctx, q->type)))
 		v4l2_m2m_buf_done(vb, VB2_BUF_STATE_ERROR);
 }
@@ -869,6 +873,7 @@ static void mtk_jpeg_enc_stop_streaming(struct vb2_queue *q)
 static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 {
 	struct mtk_jpeg_ctx *ctx = vb2_get_drv_priv(q);
+	struct mtk_jpeg_dev *jpeg = ctx->jpeg;
 	struct vb2_v4l2_buffer *vb;
 
 	/*
@@ -876,6 +881,9 @@ static void mtk_jpeg_dec_stop_streaming(struct vb2_queue *q)
 	 * Before STREAMOFF, we still have to return the old resolution and
 	 * subsampling. Update capture queue when the stream is off.
 	 */
+	if (jpeg->variant->multi_core)
+		wait_event(jpeg->hw_wq, (atomic_read(&ctx->buf_list_cnt) == 0));
+
 	if (ctx->state == MTK_JPEG_SOURCE_CHANGE &&
 	    V4L2_TYPE_IS_CAPTURE(q->type)) {
 		struct mtk_jpeg_src_buf *src_buf;
@@ -1185,6 +1193,7 @@ static int mtk_jpeg_open(struct file *file)
 	v4l2_fh_init(&ctx->fh, vfd);
 	file->private_data = &ctx->fh;
 	v4l2_fh_add(&ctx->fh);
+	atomic_set(&ctx->buf_list_cnt, 0);
 
 	ctx->jpeg = jpeg;
 	ctx->fh.m2m_ctx = v4l2_m2m_ctx_init(jpeg->m2m_dev, ctx,
@@ -1567,6 +1576,11 @@ static int mtk_jpegdec_set_hw_param(struct mtk_jpeg_ctx *ctx,
 	return 0;
 }
 
+static void jpeg_buf_queue_inc(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_inc(&ctx->buf_list_cnt);
+}
+
 static irqreturn_t mtk_jpeg_enc_done(struct mtk_jpeg_dev *jpeg)
 {
 	struct mtk_jpeg_ctx *ctx;
@@ -1691,6 +1705,7 @@ static void mtk_jpegenc_worker(struct work_struct *work)
 			     &src_buf->vb2_buf);
 	mtk_jpeg_set_enc_params(ctx, comp_jpeg[hw_id]->reg_base);
 	mtk_jpeg_enc_start(comp_jpeg[hw_id]->reg_base);
+	jpeg_buf_queue_inc(ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 
@@ -1822,6 +1837,7 @@ static void mtk_jpegdec_worker(struct work_struct *work)
 				&bs,
 				&fb);
 	mtk_jpeg_dec_start(comp_jpeg[hw_id]->reg_base);
+	jpeg_buf_queue_inc(ctx);
 	v4l2_m2m_job_finish(jpeg->m2m_dev, ctx->fh.m2m_ctx);
 	spin_unlock_irqrestore(&comp_jpeg[hw_id]->hw_lock, flags);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
index 25ba21d80de7..3e0a2e44ea1c 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_core.h
@@ -307,6 +307,7 @@ struct mtk_jpeg_q_data {
  * @dst_done_queue:		encoded frame buffer queue
  * @done_queue_lock:		encoded frame operation spinlock
  * @last_done_frame_num:	the last encoded frame number
+ * @buf_list_cnt:		the frame buffer count own by jpeg driver
  */
 struct mtk_jpeg_ctx {
 	struct mtk_jpeg_dev		*jpeg;
@@ -325,6 +326,7 @@ struct mtk_jpeg_ctx {
 	/* spinlock protecting the encode done buffer */
 	spinlock_t done_queue_lock;
 	u32 last_done_frame_num;
+	atomic_t buf_list_cnt;
 };
 
 #endif /* _MTK_JPEG_CORE_H */
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
index f59d86431295..ec4120ef9043 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_dec_hw.c
@@ -524,6 +524,11 @@ static void mtk_jpegdec_put_buf(struct mtk_jpegdec_comp_dev *jpeg)
 	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
 }
 
+static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_dec(&ctx->buf_list_cnt);
+}
+
 static void mtk_jpegdec_timeout_work(struct work_struct *work)
 {
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
@@ -532,9 +537,11 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 			     job_timeout_work.work);
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
+	ctx = cjpeg->hw_param.curr_ctx;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
 	mtk_jpeg_dec_reset(cjpeg->reg_base);
@@ -545,6 +552,7 @@ static void mtk_jpegdec_timeout_work(struct work_struct *work)
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(cjpeg);
+	jpeg_buf_queue_dec(ctx);
 }
 
 static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
@@ -585,6 +593,7 @@ static irqreturn_t mtk_jpegdec_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegdec_put_buf(jpeg);
+	jpeg_buf_queue_dec(ctx);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->jdec_clk.clks->clk);
 
diff --git a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
index 73b99a5ea5da..cb6b9caeae2b 100644
--- a/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
+++ b/drivers/media/platform/mediatek/jpeg/mtk_jpeg_enc_hw.c
@@ -264,6 +264,11 @@ static void mtk_jpegenc_put_buf(struct mtk_jpegenc_comp_dev *jpeg)
 	spin_unlock_irqrestore(&ctx->done_queue_lock, flags);
 }
 
+static void jpeg_buf_queue_dec(struct mtk_jpeg_ctx *ctx)
+{
+	atomic_dec(&ctx->buf_list_cnt);
+}
+
 static void mtk_jpegenc_timeout_work(struct work_struct *work)
 {
 	struct delayed_work *dly_work = to_delayed_work(work);
@@ -274,9 +279,11 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	struct mtk_jpeg_dev *master_jpeg = cjpeg->master_dev;
 	enum vb2_buffer_state buf_state = VB2_BUF_STATE_ERROR;
 	struct vb2_v4l2_buffer *src_buf, *dst_buf;
+	struct mtk_jpeg_ctx *ctx;
 
 	src_buf = cjpeg->hw_param.src_buffer;
 	dst_buf = cjpeg->hw_param.dst_buffer;
+	ctx = cjpeg->hw_param.curr_ctx;
 	v4l2_m2m_buf_copy_metadata(src_buf, dst_buf, true);
 
 	mtk_jpeg_enc_reset(cjpeg->reg_base);
@@ -287,6 +294,7 @@ static void mtk_jpegenc_timeout_work(struct work_struct *work)
 	wake_up(&master_jpeg->hw_wq);
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(cjpeg);
+	jpeg_buf_queue_dec(ctx);
 }
 
 static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
@@ -320,6 +328,7 @@ static irqreturn_t mtk_jpegenc_hw_irq_handler(int irq, void *priv)
 	buf_state = VB2_BUF_STATE_DONE;
 	v4l2_m2m_buf_done(src_buf, buf_state);
 	mtk_jpegenc_put_buf(jpeg);
+	jpeg_buf_queue_dec(ctx);
 	pm_runtime_put(ctx->jpeg->dev);
 	clk_disable_unprepare(jpeg->venc_clk.clks->clk);
 
-- 
2.46.0


