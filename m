Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4582CC982C3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 16 Sep 2026 14:25:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5aWRJWR6JA0i2juUYsty9pizjjFdUj7YgK+zeY4lOn0=; b=IAEszfLKKtc2bTMvzsWAqdmrOq
	lAq8RhDuWI25vJ7RmFddj1n8mYSqfAtVolUEj/bWw9v99A1OlSGXtojENH5WSXLg24rspqtW5lWcS
	A1Fz15gO8xE7X7q8R/Ya3TPVNpm5TOOZ/29j/tcyLXYQB23J+3K1q6kYycLPZQkfY1fRvyifk7pqZ
	ItqqbBABnRjKRan2ypQJKHvefAEpDAPUCZp83a7m0EBW1/FXiORpCNKk3YpLhrsGaOBJ4x4ZHb03j
	6V+F8OGrnxXmi5lo9UC+TCAjWPlHH9MeNQqZ2MX57SO3ANgjef+LOoRYPbx1dIqlL3p4QCrxtDCB9
	lDwk6qWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qa7-00000009OT1-01Gm;
	Wed, 16 Sep 2026 14:25:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6qZy-00000009OOU-2Gmx;
	Wed, 16 Sep 2026 14:25:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Cc:To:In-Reply-To:References:
	Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Sender:Reply-To:Content-ID:Content-Description;
	bh=5aWRJWR6JA0i2juUYsty9pizjjFdUj7YgK+zeY4lOn0=; b=dOvsGLDUI8Ax1s5LzQxEWpBGoH
	ONM4+TV1Sz4STaREOuUeKeQdEYj0TZebZEZXvzQ+7570eC6ytKg3l+Ta1U810FYZ+Rzf6m7tkxfjA
	vL1g8/EJdcyNpOIIKq6nmfIGLALtPVGEC/LJEjxEqYldn02i5s+xUJOh6YlAwLV6EJSGlkuAGDXEp
	OPLWXOHhTEIJrUqU0uWCa5dykTk+4MJ599Gg/K2XybQR4KpuTVIcHMvoR71lEWjZ9E/uLMsmU6XjE
	JMXs4imj/SfJufiNwQvcM22IV9PaIZHz7eU06D0yZXpmHZ7iMCiTuB7zWizZFsLjskZy19XHRhfE0
	bHpsajdg==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x6qZv-00000007yVK-2S70;
	Wed, 16 Sep 2026 14:25:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1789568734;
	bh=Fxe8yW3F1jNzKsru3sFOSL1At3sZumtvqZQlyoS5WYU=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:From;
	b=kaeMnSd1+Nle9exhcSlW7s2cTufLBn7oxmmsA9ZcJkgt4L2v9ZZ3gYuOAyACaaV5q
	 72EIlf0O9gclljHKtvi5l+2/o/ElRAM2n03IWfrqInJknfMX/RZsunNa2sTt34PDep
	 A8Uzz0b7UGOtdxkySvSe8YqEAd/5+EAzpYlK22wmq10z9cFOzgfN6Y9P0ujhE50uxx
	 Kg/P8Te0Qyy5vn+dM3VPar6G3TC5jBRmgTJVuRsHuNaCheye/4cjMfadCRslAhO731
	 3UMaO3VR8k2mgpNM9Fh66MICToQpXvM8cg+lcgaRTtOPjrszvWyjv4d9pHTIYzLANM
	 haw8eI7M+/mNQ==
Received: from [192.168.0.15] (unknown [100.64.0.170])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: detlev)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6356817E047B;
	Wed, 16 Sep 2026 16:25:32 +0200 (CEST)
From: Detlev Casanova <detlev.casanova@collabora.com>
Date: Wed, 16 Sep 2026 10:25:27 -0400
Subject: [PATCH 2/4] media: Store v4l2_fh in the vb_queue
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260916-v4l2-add-mem-tracker-v1-2-900fa45e3e6a@collabora.com>
References: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
In-Reply-To: <20260916-v4l2-add-mem-tracker-v1-0-900fa45e3e6a@collabora.com>
To: Tomasz Figa <tfiga@chromium.org>, 
 Marek Szyprowski <m.szyprowski@samsung.com>, 
 Mauro Carvalho Chehab <mchehab@kernel.org>, 
 Nicolas Dufresne <nicolas.dufresne@collabora.com>, 
 Benjamin Gaignard <benjamin.gaignard@collabora.com>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Heiko Stuebner <heiko@sntech.de>, 
 Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>
Cc: kernel@collabora.com, linux-kernel@vger.kernel.org, 
 linux-media@vger.kernel.org, linux-rockchip@lists.infradead.org, 
 linux-arm-kernel@lists.infradead.org, 
 Detlev Casanova <detlev.casanova@collabora.com>
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260916_152539_776835_20C2ED10 
X-CRM114-Status: GOOD (  15.12  )
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

To be able to show the fd in the debug fs, add the v4l2_fh pointer to the
queue so that vb2 allocations can retrieve it.

Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
---
 drivers/media/common/videobuf2/v4l2-allocator.c       | 16 +++++++++++-----
 drivers/media/common/videobuf2/videobuf2-dma-contig.c |  1 +
 include/media/v4l2-allocator.h                        |  2 +-
 include/media/videobuf2-core.h                        |  1 +
 4 files changed, 14 insertions(+), 6 deletions(-)

diff --git a/drivers/media/common/videobuf2/v4l2-allocator.c b/drivers/media/common/videobuf2/v4l2-allocator.c
index 9dde9d4a342b..935fbbacd667 100644
--- a/drivers/media/common/videobuf2/v4l2-allocator.c
+++ b/drivers/media/common/videobuf2/v4l2-allocator.c
@@ -108,8 +108,8 @@ void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev)
 }
 EXPORT_SYMBOL_GPL(v4l2_allocator_cleanup);
 
-static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size,
-			      dma_addr_t dma_addr, const char *name)
+static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size, dma_addr_t dma_addr,
+			      struct v4l2_fh *fh, const char *name)
 {
 	struct v4l2_allocator *allocator = v4l2_dev->v4l2_allocator;
 	struct v4l2_allocator_entry *entry;
@@ -125,7 +125,13 @@ static int v4l2_allocator_add(struct v4l2_device *v4l2_dev, size_t size,
 	entry->dma_addr = dma_addr;
 	strscpy(entry->name, name, sizeof(entry->name));
 	get_task_comm(entry->creator, current->group_leader);
-	entry->tgid = current->tgid;
+	if (fh) {
+		entry->fd = fh->fd;
+		entry->tgid = fh->tgid;
+	} else {
+		entry->fd = 0;
+		entry->tgid = current->tgid;
+	}
 
 	mutex_lock(&allocator->lock);
 	list_add(&entry->list, &allocator->list);
@@ -156,12 +162,12 @@ static void v4l2_allocator_remove(struct v4l2_device *v4l2_dev, size_t size, dma
 
 void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			   size_t size, dma_addr_t *dma_handle,
-			   gfp_t flag, unsigned long attrs, const char *name)
+			   gfp_t flag, unsigned long attrs, struct v4l2_fh *fh, const char *name)
 {
 	void *ret = dma_alloc_attrs(dev, size, dma_handle, flag, attrs);
 
 	if (ret && v4l2_dev)
-		v4l2_allocator_add(v4l2_dev, size, *dma_handle, name);
+		v4l2_allocator_add(v4l2_dev, size, *dma_handle, fh, name);
 
 	return ret;
 }
diff --git a/drivers/media/common/videobuf2/videobuf2-dma-contig.c b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
index b6b7ddc96b9c..30e136dd02b7 100644
--- a/drivers/media/common/videobuf2/videobuf2-dma-contig.c
+++ b/drivers/media/common/videobuf2/videobuf2-dma-contig.c
@@ -205,6 +205,7 @@ static int vb2_dc_alloc_coherent(struct vb2_dc_buf *buf)
 					   &buf->dma_addr,
 					   GFP_KERNEL | q->gfp_flags,
 					   buf->attrs,
+					   q->v4l2_fh,
 					   name);
 	if (!buf->cookie)
 		return -ENOMEM;
diff --git a/include/media/v4l2-allocator.h b/include/media/v4l2-allocator.h
index f3fe0da10321..cdf0569bea0a 100644
--- a/include/media/v4l2-allocator.h
+++ b/include/media/v4l2-allocator.h
@@ -19,7 +19,7 @@ void v4l2_allocator_cleanup(struct v4l2_device *v4l2_dev);
 
 void *v4l2_dma_alloc_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			   size_t size, dma_addr_t *dma_handle,
-			   gfp_t flag, unsigned long attrs, const char *name);
+			   gfp_t flag, unsigned long attrs, struct v4l2_fh *fh, const char *name);
 
 void v4l2_dma_free_attrs(struct v4l2_device *v4l2_dev, struct device *dev,
 			 size_t size, void *cpu_addr,
diff --git a/include/media/videobuf2-core.h b/include/media/videobuf2-core.h
index 83a5aea34f3c..aa47f1c7c9d1 100644
--- a/include/media/videobuf2-core.h
+++ b/include/media/videobuf2-core.h
@@ -604,6 +604,7 @@ struct vb2_queue {
 	unsigned int			io_modes;
 	struct device			*dev;
 	struct v4l2_device		*v4l2_dev;
+	struct v4l2_fh			*v4l2_fh;
 	unsigned long			dma_attrs;
 	unsigned int			bidirectional:1;
 	unsigned int			fileio_read_once:1;

-- 
2.55.0


