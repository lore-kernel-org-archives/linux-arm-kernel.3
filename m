Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6EFC531E3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 21:52:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=kMl37oK2w+vYUAZ8lrB8sak304qneVWgo5V/NQRfIxM=; b=4xKdDRUsG9l/rXhl7vGy5nP0u2
	8SXKTrYFaU2nQS9LwEbwtm6hrzr8XjBXox313OYOYpYxHKURx/mUeUPHMdLlFA1sP6YAKpfGojUY/
	yyRU4VI1oVh1T7N609NqD6cU9kvUKlgY4D8ZyDaDygcrQZdlN/a544mxEXSyaCtAIc02pPLb24y77
	e/5UcniBjoqI5vVDxKRc9aKYb1aPw4kU9aeLp6xMlw/ekguQn4+Ax8bPRxP4QIneeo0OoJyJTU8ke
	7d3X9DeUdy9qx+pnKFhK7n5X//mH9Yl4pIL26lUYgdmGkW/YpuUm71B0zD1I9TKnkoUEuAaY+F77r
	SdtyFwbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBwW-0000000C71f-017i;
	Thu, 19 Feb 2026 21:52:16 +0000
Received: from [50.53.43.113] (helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtpsa (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtBwT-0000000C71G-0u9V;
	Thu, 19 Feb 2026 21:52:13 +0000
From: Randy Dunlap <rdunlap@infradead.org>
To: dri-devel@lists.freedesktop.org
Cc: Randy Dunlap <rdunlap@infradead.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Helge Deller <deller@gmx.de>,
	linux-fbdev@vger.kernel.org
Subject: [PATCH v2] gpu: ipu-v3: clean up kernel-doc warnings
Date: Thu, 19 Feb 2026 13:52:11 -0800
Message-ID: <20260219215211.459108-1-rdunlap@infradead.org>
X-Mailer: git-send-email 2.53.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

Correct all kernel-doc warnings:
- fix a typedef kernel-doc comment
- mark a list_head as private
- use Returns: for function return values

Warning: include/video/imx-ipu-image-convert.h:31 struct member 'list' not
 described in 'ipu_image_convert_run'
Warning: include/video/imx-ipu-image-convert.h:40 function parameter
 'ipu_image_convert_cb_t' not described in 'void'
Warning: include/video/imx-ipu-image-convert.h:40 expecting prototype for
 ipu_image_convert_cb_t(). Prototype was for void() instead
Warning: include/video/imx-ipu-image-convert.h:66 No description found for
 return value of 'ipu_image_convert_verify'
Warning: include/video/imx-ipu-image-convert.h:90 No description found for
 return value of 'ipu_image_convert_prepare'
Warning: include/video/imx-ipu-image-convert.h:125 No description found for
 return value of 'ipu_image_convert_queue'
Warning: include/video/imx-ipu-image-convert.h:163 No description found for
 return value of 'ipu_image_convert'

Signed-off-by: Randy Dunlap <rdunlap@infradead.org>
Reviewed-by: Philipp Zabel <p.zabel@pengutronix.de>
---
v2: add Reviewed-by, update Cc: list, rebase, resend

Cc: Philipp Zabel <p.zabel@pengutronix.de>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>
Cc: Maxime Ripard <mripard@kernel.org>
Cc: Thomas Zimmermann <tzimmermann@suse.de>
Cc: David Airlie <airlied@gmail.com>
Cc: Simona Vetter <simona@ffwll.ch>
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: Helge Deller <deller@gmx.de>
Cc: linux-fbdev@vger.kernel.org

 include/video/imx-ipu-image-convert.h |   16 +++++++++++-----
 1 file changed, 11 insertions(+), 5 deletions(-)

--- linux-next-20260218.orig/include/video/imx-ipu-image-convert.h
+++ linux-next-20260218/include/video/imx-ipu-image-convert.h
@@ -27,12 +27,13 @@ struct ipu_image_convert_run {
 
 	int status;
 
+	/* private: */
 	/* internal to image converter, callers don't touch */
 	struct list_head list;
 };
 
 /**
- * ipu_image_convert_cb_t - conversion callback function prototype
+ * typedef ipu_image_convert_cb_t - conversion callback function prototype
  *
  * @run:	the completed conversion run pointer
  * @ctx:	a private context pointer for the callback
@@ -60,7 +61,7 @@ void ipu_image_convert_adjust(struct ipu
  * @out:	output image format
  * @rot_mode:	rotation mode
  *
- * Returns 0 if the formats and rotation mode meet IPU restrictions,
+ * Returns: 0 if the formats and rotation mode meet IPU restrictions,
  * -EINVAL otherwise.
  */
 int ipu_image_convert_verify(struct ipu_image *in, struct ipu_image *out,
@@ -77,11 +78,11 @@ int ipu_image_convert_verify(struct ipu_
  * @complete:	run completion callback
  * @complete_context:	a context pointer for the completion callback
  *
- * Returns an opaque conversion context pointer on success, error pointer
+ * In V4L2, drivers should call ipu_image_convert_prepare() at streamon.
+ *
+ * Returns: an opaque conversion context pointer on success, error pointer
  * on failure. The input/output formats and rotation mode must already meet
  * IPU retrictions.
- *
- * In V4L2, drivers should call ipu_image_convert_prepare() at streamon.
  */
 struct ipu_image_convert_ctx *
 ipu_image_convert_prepare(struct ipu_soc *ipu, enum ipu_ic_task ic_task,
@@ -122,6 +123,8 @@ void ipu_image_convert_unprepare(struct
  * In V4L2, drivers should call ipu_image_convert_queue() while
  * streaming to queue the conversion of a received input buffer.
  * For example mem2mem devices this would be called in .device_run.
+ *
+ * Returns: 0 on success or -errno on error.
  */
 int ipu_image_convert_queue(struct ipu_image_convert_run *run);
 
@@ -155,6 +158,9 @@ void ipu_image_convert_abort(struct ipu_
  * On successful return the caller can queue more run requests if needed, using
  * the prepared context in run->ctx. The caller is responsible for unpreparing
  * the context when no more conversion requests are needed.
+ *
+ * Returns: pointer to the created &struct ipu_image_convert_run that has
+ * been queued on success; an ERR_PTR(errno) on error.
  */
 struct ipu_image_convert_run *
 ipu_image_convert(struct ipu_soc *ipu, enum ipu_ic_task ic_task,

