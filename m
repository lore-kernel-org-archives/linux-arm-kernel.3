Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D979E7718B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Dec 2024 02:32:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Ys/6PWadFMMf0CT+9doN3qX4Fu8/PHNQBlHP0QonJA=; b=jqO0+9HidBUj1JZfpEm2Pv++bU
	1Qf+xZKCTysq1eP57GT1MD5el1VD3BcSFBC7rDwhNwPf4qdO/vTPUY6ee52mB7ogO0Wi/1lyryv+a
	o6QCc1jgQ1lWBrk8ZHm3mCaeJO2JUCVHEPw7V5SIfYJP9QEMJ4E3crpQjgS9+Dg8qhp772vdCwj3r
	QJ4rbaIkGReq6bnW4rrnRWScGGCy1o/rQ9K0gszYvHv0bHQ2cGyS5PB5ZEfVjOryfipPN/ppzaqpd
	QRpEatmTfpa8aOrDCg6ohDVFhPAa7/io3QRtjA0unSgdv2ZPK11yFDL2jeno3iYXF3qdH5Q98Oq9a
	c+/84qwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdfH-0000000Eyde-3RNJ;
	Thu, 26 Dec 2024 02:31:55 +0000
Received: from mx.treblig.org ([2a00:1098:5b::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tQdbl-0000000Exy8-447t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Dec 2024 02:28:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=treblig.org
	; s=bytemarkmx; h=MIME-Version:Message-ID:Date:Subject:From:Content-Type:From
	:Subject; bh=0Ys/6PWadFMMf0CT+9doN3qX4Fu8/PHNQBlHP0QonJA=; b=Hbo+h+Qc0gFhN1uU
	cZP9vtV4n77mGEgq0ULpbgkp2GX2pwmOezeKICNdTVBJuZY4YP8I5kvcnrfYVWW8FVaQ4A8QM2b8f
	Ia1ktdvHqRvY4289h4MVl2fgToBWNrbk1obRuO4/7wFgKylJjid04Mdjq9ugjLjhHH6dPDoNGPhsy
	FqYPOgdRPir/ydaTQi6p6i1nAs2xBg/JLqo7Csa19G6x3H49KkzVCCSsZoU/UueKECoKFsBzTYBWR
	f8oNAHV+2lQFWaqLaoBNyn5C2K0n3LI/ULy/BY9KO0dyO6PqRaG8rxFdUeHTLsmT0YSyPWbf95vNG
	5BahjFGcmuqsFUPl9w==;
Received: from localhost ([127.0.0.1] helo=dalek.home.treblig.org)
	by mx.treblig.org with esmtp (Exim 4.96)
	(envelope-from <linux@treblig.org>)
	id 1tQdbQ-007F0L-1Z;
	Thu, 26 Dec 2024 02:27:56 +0000
From: linux@treblig.org
To: p.zabel@pengutronix.de,
	airlied@gmail.com,
	simona@ffwll.ch,
	deller@gmx.de,
	shawnguo@kernel.org,
	s.hauer@pengutronix.de,
	kernel@pengutronix.de,
	festevam@gmail.com
Cc: dri-devel@lists.freedesktop.org,
	linux-fbdev@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	"Dr. David Alan Gilbert" <linux@treblig.org>
Subject: [PATCH 4/7] gpu: ipu-v3: Remove unused ipu_image_convert_* functions
Date: Thu, 26 Dec 2024 02:27:49 +0000
Message-ID: <20241226022752.219399-5-linux@treblig.org>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241226022752.219399-1-linux@treblig.org>
References: <20241226022752.219399-1-linux@treblig.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241225_182818_012873_F9BB87B3 
X-CRM114-Status: GOOD (  12.69  )
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

From: "Dr. David Alan Gilbert" <linux@treblig.org>

ipu_image_convert_enum_format() and ipu_image_convert_sync() were both
added in 2016 by
commit cd98e85a6b78 ("gpu: ipu-v3: Add queued image conversion support")

but have remained unused.

Remove them.

ipu_image_convert_sync() was the last user of
image_convert_sync_complete().

Remove it.

Signed-off-by: Dr. David Alan Gilbert <linux@treblig.org>
---
 drivers/gpu/ipu-v3/ipu-image-convert.c | 48 --------------------------
 include/video/imx-ipu-image-convert.h  | 32 -----------------
 2 files changed, 80 deletions(-)

diff --git a/drivers/gpu/ipu-v3/ipu-image-convert.c b/drivers/gpu/ipu-v3/ipu-image-convert.c
index 841316582ea9..3c33b4defab5 100644
--- a/drivers/gpu/ipu-v3/ipu-image-convert.c
+++ b/drivers/gpu/ipu-v3/ipu-image-convert.c
@@ -355,20 +355,6 @@ static void dump_format(struct ipu_image_convert_ctx *ctx,
 		(ic_image->fmt->fourcc >> 24) & 0xff);
 }
 
-int ipu_image_convert_enum_format(int index, u32 *fourcc)
-{
-	const struct ipu_image_pixfmt *fmt;
-
-	if (index >= (int)ARRAY_SIZE(image_convert_formats))
-		return -EINVAL;
-
-	/* Format found */
-	fmt = &image_convert_formats[index];
-	*fourcc = fmt->fourcc;
-	return 0;
-}
-EXPORT_SYMBOL_GPL(ipu_image_convert_enum_format);
-
 static void free_dma_buf(struct ipu_image_convert_priv *priv,
 			 struct ipu_image_convert_dma_buf *buf)
 {
@@ -2437,40 +2423,6 @@ ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
 }
 EXPORT_SYMBOL_GPL(ipu_image_convert);
 
-/* "Canned" synchronous single image conversion */
-static void image_convert_sync_complete(struct ipu_image_convert_run *run,
-					void *data)
-{
-	struct completion *comp = data;
-
-	complete(comp);
-}
-
-int ipu_image_convert_sync(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
-			   struct ipu_image *in, struct ipu_image *out,
-			   enum ipu_rotate_mode rot_mode)
-{
-	struct ipu_image_convert_run *run;
-	struct completion comp;
-	int ret;
-
-	init_completion(&comp);
-
-	run = ipu_image_convert(ipu, ic_task, in, out, rot_mode,
-				image_convert_sync_complete, &comp);
-	if (IS_ERR(run))
-		return PTR_ERR(run);
-
-	ret = wait_for_completion_timeout(&comp, msecs_to_jiffies(10000));
-	ret = (ret == 0) ? -ETIMEDOUT : 0;
-
-	ipu_image_convert_unprepare(run->ctx);
-	kfree(run);
-
-	return ret;
-}
-EXPORT_SYMBOL_GPL(ipu_image_convert_sync);
-
 int ipu_image_convert_init(struct ipu_soc *ipu, struct device *dev)
 {
 	struct ipu_image_convert_priv *priv;
diff --git a/include/video/imx-ipu-image-convert.h b/include/video/imx-ipu-image-convert.h
index 3c71b8b94b33..003b3927ede5 100644
--- a/include/video/imx-ipu-image-convert.h
+++ b/include/video/imx-ipu-image-convert.h
@@ -40,19 +40,6 @@ struct ipu_image_convert_run {
 typedef void (*ipu_image_convert_cb_t)(struct ipu_image_convert_run *run,
 				       void *ctx);
 
-/**
- * ipu_image_convert_enum_format() - enumerate the image converter's
- *	supported input and output pixel formats.
- *
- * @index:	pixel format index
- * @fourcc:	v4l2 fourcc for this index
- *
- * Returns 0 with a valid index and fills in v4l2 fourcc, -EINVAL otherwise.
- *
- * In V4L2, drivers can call ipu_image_enum_format() in .enum_fmt.
- */
-int ipu_image_convert_enum_format(int index, u32 *fourcc);
-
 /**
  * ipu_image_convert_adjust() - adjust input/output images to IPU restrictions.
  *
@@ -176,23 +163,4 @@ ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
 		  ipu_image_convert_cb_t complete,
 		  void *complete_context);
 
-/**
- * ipu_image_convert_sync() - synchronous single image conversion request
- *
- * @ipu:	the IPU handle to use for the conversion
- * @ic_task:	the IC task to use for the conversion
- * @in:		input image format
- * @out:	output image format
- * @rot_mode:	rotation mode
- *
- * Carry out a single image conversion. Returns when the conversion
- * completes. The input/output formats and rotation mode must already
- * meet IPU retrictions. The created context is automatically unprepared
- * and the run freed on return.
- */
-int ipu_image_convert_sync(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
-			   struct ipu_image *in, struct ipu_image *out,
-			   enum ipu_rotate_mode rot_mode);
-
-
 #endif /* __IMX_IPU_IMAGE_CONVERT_H__ */
-- 
2.47.1


