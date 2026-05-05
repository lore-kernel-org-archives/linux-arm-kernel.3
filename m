Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEBF0CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 14:05:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bzAmGgGY/dSK6+CdNPktp+U9mdUQBdGow+GRko2hdRE=; b=RzRp2SHa2qhBpIBPvyfJrxDLyb
	GJcbdTij65MK7bf2Y0+2t9AHQcicU09uEQCBwLPPtZgDCR1A+KFo7maM3UB8MXNNEMjz9OWp3TVoa
	K6XROFrZA0BHbZTsn1WjvlD4wBZI91fjGOuwMmdF8ek9UjeEU6jGqKzEuEEUkqdrOtEYQpRuPwIeZ
	0ZXIfpf7TEhZAG6WRG1ai0DXAZVWeOHzJkUfgqthIWjse21Sp+ua0vtFEzPIMK2ypKOHG8aCNwKMF
	4UaX9xjlxrrBKH2RkjwQBoWq6X/mFi5jlcDCMCW10CIRjvnYyruGz18/Qs7qbKWucjmMB3Vd5Bj1M
	u+J7q7Zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGP0-0000000GR53-1C17;
	Tue, 05 May 2026 14:05:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKGOy-0000000GR2y-0bzL;
	Tue, 05 May 2026 14:05:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A37843028;
	Tue,  5 May 2026 07:05:25 -0700 (PDT)
Received: from e120398-lin.trondheim.arm.com (e120398-lin.trondheim.arm.com [10.42.46.160])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 0ECEB3F763;
	Tue,  5 May 2026 07:05:25 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1777989931; bh=KdjJokghEpzcHqn4wsyrc1a9I5jF3xtB5+lD//QPMcQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=gbT5svfs82uL8DSJ7EcBrAcKFt2ZUSB1ZoCcsr2K37gs1m8xIl5m9QiYUT3j+dktl
	 5YWsJG+sxkkYE00LR9+b4ZE4OJgCFhq+Mh74JCE0+CDE02fRXgoaEucmSA4F3tPC+v
	 k9vg1+AfuVXFIU2H4AcBaShfPlRmMGkglThp6Who=
From: Ketil Johnsen <ketil.johnsen@arm.com>
To: David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	=?UTF-8?q?Christian=20K=C3=B6nig?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Liviu Dudau <liviu.dudau@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Cc: dri-devel@lists.freedesktop.org,
	linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org,
	Yong Wu <yong.wu@mediatek.com>,
	Yunfei Dong <yunfei.dong@mediatek.com>,
	Florent Tomasin <florent.tomasin@arm.com>,
	Ketil Johnsen <ketil.johnsen@arm.com>
Subject: [PATCH 1/8] dma-heap: Add proper kref handling on dma-buf heaps
Date: Tue,  5 May 2026 16:05:07 +0200
Message-ID: <20260505140516.1372388-2-ketil.johnsen@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260505140516.1372388-1-ketil.johnsen@arm.com>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_070532_297576_33FB1060 
X-CRM114-Status: GOOD (  14.60  )
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

From: John Stultz <jstultz@google.com>

Add proper reference counting on the dma_heap structure. While
existing heaps are built-in, we may eventually have heaps loaded
from modules, and we'll need to be able to properly handle the
references to the heaps

Signed-off-by: John Stultz <jstultz@google.com>
Signed-off-by: T.J. Mercier <tjmercier@google.com>
Signed-off-by: Yong Wu <yong.wu@mediatek.com>
[Yong: Just add comment for "minor" and "refcount"]
Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
[Yunfei: Change reviewer's comments]
Signed-off-by: Florent Tomasin <florent.tomasin@arm.com>
[Florent: Rebase]
Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>
[Ketil: Rebase]
---
 drivers/dma-buf/dma-heap.c | 29 +++++++++++++++++++++++++++++
 include/linux/dma-heap.h   |  2 ++
 2 files changed, 31 insertions(+)

diff --git a/drivers/dma-buf/dma-heap.c b/drivers/dma-buf/dma-heap.c
index ac5f8685a6494..9fd365ddbd517 100644
--- a/drivers/dma-buf/dma-heap.c
+++ b/drivers/dma-buf/dma-heap.c
@@ -12,6 +12,7 @@
 #include <linux/dma-heap.h>
 #include <linux/err.h>
 #include <linux/export.h>
+#include <linux/kref.h>
 #include <linux/list.h>
 #include <linux/nospec.h>
 #include <linux/syscalls.h>
@@ -31,6 +32,7 @@
  * @heap_devt:		heap device node
  * @list:		list head connecting to list of heaps
  * @heap_cdev:		heap char device
+ * @refcount:		reference counter for this heap device
  *
  * Represents a heap of memory from which buffers can be made.
  */
@@ -41,6 +43,7 @@ struct dma_heap {
 	dev_t heap_devt;
 	struct list_head list;
 	struct cdev heap_cdev;
+	struct kref refcount;
 };
 
 static LIST_HEAD(heap_list);
@@ -248,6 +251,7 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 	if (!heap)
 		return ERR_PTR(-ENOMEM);
 
+	kref_init(&heap->refcount);
 	heap->name = exp_info->name;
 	heap->ops = exp_info->ops;
 	heap->priv = exp_info->priv;
@@ -313,6 +317,31 @@ struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info)
 }
 EXPORT_SYMBOL_NS_GPL(dma_heap_add, "DMA_BUF_HEAP");
 
+static void dma_heap_release(struct kref *ref)
+{
+	struct dma_heap *heap = container_of(ref, struct dma_heap, refcount);
+	unsigned int minor = MINOR(heap->heap_devt);
+
+	mutex_lock(&heap_list_lock);
+	list_del(&heap->list);
+	mutex_unlock(&heap_list_lock);
+
+	device_destroy(dma_heap_class, heap->heap_devt);
+	cdev_del(&heap->heap_cdev);
+	xa_erase(&dma_heap_minors, minor);
+
+	kfree(heap);
+}
+
+/**
+ * dma_heap_put - drops a reference to a dmabuf heap, potentially freeing it
+ * @heap: DMA-Heap whose reference count to decrement
+ */
+void dma_heap_put(struct dma_heap *heap)
+{
+	kref_put(&heap->refcount, dma_heap_release);
+}
+
 static char *dma_heap_devnode(const struct device *dev, umode_t *mode)
 {
 	return kasprintf(GFP_KERNEL, "dma_heap/%s", dev_name(dev));
diff --git a/include/linux/dma-heap.h b/include/linux/dma-heap.h
index 648328a64b27e..ff57741700f5f 100644
--- a/include/linux/dma-heap.h
+++ b/include/linux/dma-heap.h
@@ -46,6 +46,8 @@ const char *dma_heap_get_name(struct dma_heap *heap);
 
 struct dma_heap *dma_heap_add(const struct dma_heap_export_info *exp_info);
 
+void dma_heap_put(struct dma_heap *heap);
+
 extern bool mem_accounting;
 
 #endif /* _DMA_HEAPS_H */
-- 
2.43.0


