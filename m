Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCC341049523
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Mar 2026 09:50:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45E5GmiW2zh+KTTZWc3r6uENZ0vLv56id0nOi4Pktsc=; b=i24yb66qnokT3jIpNSEO8GYnLs
	Ku9zBA3iSS9buRHhmwGgdR7r8fa12325280rfd9AVGatdm/qBg1IZIVwUOaL8c2dDJaFK78oH1m5a
	hlSFPYVAJt6PAAyqsJJg3PI8k2r9J9SMGzYqhh9yO+EEEJbuWu+4U2pbv8dCiigekDXTc23tEXE63
	c/0QIoyUacmo5w732qPxGc5wQRdGi5s1A+iyXDAeyBKrQcIBtiTGER7iG5MQaVnoWhNwdqKbVMYAf
	0X5dD0GjQfw7q1u6NGRpqXV2sT5GaXi4x9RecFkDPmC9y1/PA3l9IOPf+enl3MKWbjxX5zP5YkpQ0
	MvwkBwkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCl-0000000BJrN-28OS;
	Wed, 11 Mar 2026 09:50:15 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCj-0000000BJq2-305a
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 11 Mar 2026 09:50:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=45E5GmiW2zh+KTTZWc3r6uENZ0vLv56id0nOi4Pktsc=; b=jSQEM9N1QCBilAfIumQ2NDR6a6
	KOjYLMPsNeNNOA1E3rEcS8iVqat8rlQEWc2GkUgJSa29ywg4O7aVWtWZby8FliG/0/saV21+TS0aY
	EIcrZl6Sw2gbgSWbEtWVRpRCmptMg1FdQlzSDFSjePhJnid9L53E5yRa5wuPXMoeRolipemuiqXjg
	rhD/vkUinNQjFZ4QYoIUvQJxhQ8ehgcX6xnuAwG0NwtIrHc/6d4ocpNxoGtdfiI9xMhP3TmWcyvzk
	gGyioviRKL3Cx3zlYvMgEQKqDwMkFcC2CQf049GGLvlNlHGRbYSg1csCE6OK5JWpTkm/wLKtLTGwN
	A0PL9E1w==;
Received: from mail-pf1-x42b.google.com ([2607:f8b0:4864:20::42b])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0GCf-0000000Gbij-1Slg
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Mar 2026 09:50:12 +0000
Received: by mail-pf1-x42b.google.com with SMTP id d2e1a72fcca58-82985f42664so3643012b3a.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 11 Mar 2026 02:50:08 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773222607; x=1773827407; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=45E5GmiW2zh+KTTZWc3r6uENZ0vLv56id0nOi4Pktsc=;
        b=QL8xWPC/eYtXo2PwZ1UxLNY9Q6sMQFIJvgWFntJsoDomszmuccXYwLTdGd+AD2xLLA
         be6FFy8pT/Tpz0GXCm7mww4yEszfjQk42yGnNuEv7C+rW8yLt4XvG43pZKoIUfcKU1JA
         AdIF5yfQG6zwsxXcFon5U3O6bUG5XGrnzAES8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773222607; x=1773827407;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=45E5GmiW2zh+KTTZWc3r6uENZ0vLv56id0nOi4Pktsc=;
        b=qdiqdqglGFEQyUrcf/QQBJcTVMMTeDJfcLn5kYA16Ph9MzIdpcIC4rkcpuJZ8nHcDi
         CDYu1lzOTsKygMY53CoWNTa5R402/Nd6R8sYXI2FSU1QI7xkbUJltLVsHiEguqh7LGJj
         eVCsrsVz+eNajExnn9NS8FBMM8l4XMS/6HAt908qM9twKX+X//h0zuTUgri8eEo1IQGT
         LK3SRSufJ7l/dVuV1il+Ll+Fqk2cOkETQPPYc/7NPAri72U6QsW7mNA/HIXayYeB24SJ
         Z8/zEqpp6FVi/nYZgKYYZq2+VKl65+q1/vpT9rzMQ3VDRvre+hpLh5VaoKVeEpLrJ9tA
         zFhA==
X-Forwarded-Encrypted: i=1; AJvYcCWa+rLJ5gwFAta99JhDXjA4I2lbrSmyFAt5yJ2oSi52M0P7P6V0h2Y9CivzcBgNEpeoc2XEcJF8MvAusyxj83f1@lists.infradead.org
X-Gm-Message-State: AOJu0YxhWyst9t2JYFTFHhiNhNDW4ntXoDz3kW1y7jypt4OF451U44Rs
	VVVxwbB9+gaHOqNNwK2svfyCBXKuIPxpaoLGv/NXaIQRlU76Ccxlgju5fk66j/PFIg==
X-Gm-Gg: ATEYQzye036vvUoW+Ur5MuMN3i9Ul0cZYlURcqhPrBCgWUNOkq0TyV4SjhcfZ1ccU4/
	dHxREORRO89sfLI/Wio4gTszNkNxZESvPzYmtB3K9yLAqSAOTn0whl9o7WRg8oxIPK2zofy1tMe
	EKKTZougP+65fzdhdcvf8rMnCUZ3/amQsSIr21GQKhbPtqE3wsMhjDB4mez1v9AjL1fNBjU7J6R
	9boWxKEi5vJE7Fb/K0NZSDfKFlXiY0947lhOnb+LnFgHpw41f1gP0HSciLB/nzdRWvJwGV2w0GA
	1Y8SiT+onGo+SVs0kr7JnQ/wTV9R6NupcGr4vkD1aTYElHzW3M7o7QdNzzQsKab8MOWFmPLM5hZ
	YSP6Z4MmxyS9C3CkTnZmnaDSDRk0D5I76BmI1y2wJKDO/CN+g81aDwL3dqp2dOqIQs5dwv0lxka
	63BqrL+Cg15PNSgvKhIobRB3JrCfCYf6hrNcawCtVfbb+zKiNLsTfG+7vxRi7IlEYxGVLvJs0EX
	rNJ0bqL
X-Received: by 2002:a05:6a00:348a:b0:81f:3f10:6b7c with SMTP id d2e1a72fcca58-829f703e320mr1891131b3a.28.1773222606556;
        Wed, 11 Mar 2026 02:50:06 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:805b:14e9:f783:bcae])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-829f6e22f85sm1887598b3a.27.2026.03.11.02.50.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 11 Mar 2026 02:50:05 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	Chun-Kuang Hu <chunkuang.hu@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Chen-Yu Tsai <wenst@chromium.org>,
	linux-sunxi@lists.linux.dev,
	Paul Kocialkowski <paulk@sys-base.io>,
	linux-mediatek@lists.infradead.org,
	dri-devel@lists.freedesktop.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v2 3/4] drm/mediatek: Set dedicated DMA device and drop custom GEM callbacks
Date: Wed, 11 Mar 2026 17:49:27 +0800
Message-ID: <20260311094929.3393338-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.473.g4a7958ca14-goog
In-Reply-To: <20260311094929.3393338-1-wenst@chromium.org>
References: <20260311094929.3393338-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260311_095009_772238_27AD8D4F 
X-CRM114-Status: GOOD (  34.70  )
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

In commit 9b54a32c7c6a ("drm/mediatek: mtk_gem: Partial refactor and
use drm_gem_dma_object") the MediaTek DRM driver was refactored to use
drm_gem_dma_object, but custom callbacks were still needed to deal with
using the first device of the pipeline as the DMA device, instead of
the MMSYS device that the DRM driver binds to.

Turns out there is already partial support for dedicated DMA devices in
the DRM subsystem for PRIME imports. The preceding patches add support
for dedicated DMA devices to the GEM DMA helpers.

This allows us to just set the dedicated DMA device for the DRM device,
and drop all the custom GEM callbacks. Also drop the .dma_dev field
from the driver private data as it is no longer needed.

There are slight differences in the mmap helper: the VM_DONTDUMP and
VM_IO flags are no longer set. Both were lifted from drm_gem_mmap_obj().
VM_IO probably doesn't make sense since the buffer is allocated using
dma_alloc_attrs().

Reviewed-by: Thomas Zimmermann <tzimmermann@suse.de>
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Also remove reference to mtk_gem.c from the Makefile
---
 drivers/gpu/drm/mediatek/Makefile      |   1 -
 drivers/gpu/drm/mediatek/mtk_crtc.c    |   1 -
 drivers/gpu/drm/mediatek/mtk_drm_drv.c |  21 +--
 drivers/gpu/drm/mediatek/mtk_drm_drv.h |   1 -
 drivers/gpu/drm/mediatek/mtk_gem.c     | 231 -------------------------
 drivers/gpu/drm/mediatek/mtk_gem.h     |  17 --
 6 files changed, 3 insertions(+), 269 deletions(-)
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.c
 delete mode 100644 drivers/gpu/drm/mediatek/mtk_gem.h

diff --git a/drivers/gpu/drm/mediatek/Makefile b/drivers/gpu/drm/mediatek/Makefile
index e0ac49b07d50..952d294642fb 100644
--- a/drivers/gpu/drm/mediatek/Makefile
+++ b/drivers/gpu/drm/mediatek/Makefile
@@ -14,7 +14,6 @@ mediatek-drm-y := mtk_crtc.o \
 		  mtk_dsi.o \
 		  mtk_dpi.o \
 		  mtk_ethdr.o \
-		  mtk_gem.o \
 		  mtk_mdp_rdma.o \
 		  mtk_padding.o \
 		  mtk_plane.o
diff --git a/drivers/gpu/drm/mediatek/mtk_crtc.c b/drivers/gpu/drm/mediatek/mtk_crtc.c
index 351d58c50b84..fcb16f3f7b23 100644
--- a/drivers/gpu/drm/mediatek/mtk_crtc.c
+++ b/drivers/gpu/drm/mediatek/mtk_crtc.c
@@ -23,7 +23,6 @@
 #include "mtk_crtc.h"
 #include "mtk_ddp_comp.h"
 #include "mtk_drm_drv.h"
-#include "mtk_gem.h"
 #include "mtk_plane.h"
 
 /*
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.c b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
index a94c51a83261..6f6db2e1980e 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.c
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.c
@@ -19,6 +19,7 @@
 #include <drm/drm_fbdev_dma.h>
 #include <drm/drm_fourcc.h>
 #include <drm/drm_gem.h>
+#include <drm/drm_gem_dma_helper.h>
 #include <drm/drm_gem_framebuffer_helper.h>
 #include <drm/drm_ioctl.h>
 #include <drm/drm_of.h>
@@ -29,7 +30,6 @@
 #include "mtk_ddp_comp.h"
 #include "mtk_disp_drv.h"
 #include "mtk_drm_drv.h"
-#include "mtk_gem.h"
 
 #define DRIVER_NAME "mediatek"
 #define DRIVER_DESC "Mediatek SoC DRM"
@@ -565,8 +565,7 @@ static int mtk_drm_kms_init(struct drm_device *drm)
 		goto err_component_unbind;
 	}
 
-	for (i = 0; i < private->data->mmsys_dev_num; i++)
-		private->all_drm_private[i]->dma_dev = dma_dev;
+	drm_dev_set_dma_dev(drm, dma_dev);
 
 	/*
 	 * Configure the DMA segment size to make sure we get contiguous IOVA
@@ -600,26 +599,12 @@ static void mtk_drm_kms_deinit(struct drm_device *drm)
 
 DEFINE_DRM_GEM_FOPS(mtk_drm_fops);
 
-/*
- * We need to override this because the device used to import the memory is
- * not dev->dev, as drm_gem_prime_import() expects.
- */
-static struct drm_gem_object *mtk_gem_prime_import(struct drm_device *dev,
-						   struct dma_buf *dma_buf)
-{
-	struct mtk_drm_private *private = dev->dev_private;
-
-	return drm_gem_prime_import_dev(dev, dma_buf, private->dma_dev);
-}
-
 static const struct drm_driver mtk_drm_driver = {
 	.driver_features = DRIVER_MODESET | DRIVER_GEM | DRIVER_ATOMIC,
 
-	.dumb_create = mtk_gem_dumb_create,
+	DRM_GEM_DMA_DRIVER_OPS,
 	DRM_FBDEV_DMA_DRIVER_OPS,
 
-	.gem_prime_import = mtk_gem_prime_import,
-	.gem_prime_import_sg_table = mtk_gem_prime_import_sg_table,
 	.fops = &mtk_drm_fops,
 
 	.name = DRIVER_NAME,
diff --git a/drivers/gpu/drm/mediatek/mtk_drm_drv.h b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
index 675cdc90a440..1fc3df4b5485 100644
--- a/drivers/gpu/drm/mediatek/mtk_drm_drv.h
+++ b/drivers/gpu/drm/mediatek/mtk_drm_drv.h
@@ -54,7 +54,6 @@ struct mtk_mmsys_driver_data {
 
 struct mtk_drm_private {
 	struct drm_device *drm;
-	struct device *dma_dev;
 	bool mtk_drm_bound;
 	bool drm_master;
 	struct device *dev;
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.c b/drivers/gpu/drm/mediatek/mtk_gem.c
deleted file mode 100644
index f059a1452220..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_gem.c
+++ /dev/null
@@ -1,231 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-only
-/*
- * Copyright (c) 2015 MediaTek Inc.
- * Copyright (c) 2025 Collabora Ltd.
- *                    AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
- */
-
-#include <linux/dma-buf.h>
-#include <linux/vmalloc.h>
-
-#include <drm/drm.h>
-#include <drm/drm_device.h>
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
-#include <drm/drm_prime.h>
-#include <drm/drm_print.h>
-
-#include "mtk_drm_drv.h"
-#include "mtk_gem.h"
-
-static int mtk_gem_object_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma);
-
-static void mtk_gem_free_object(struct drm_gem_object *obj)
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-
-	if (dma_obj->sgt)
-		drm_prime_gem_destroy(obj, dma_obj->sgt);
-	else
-		dma_free_wc(priv->dma_dev, dma_obj->base.size,
-			    dma_obj->vaddr, dma_obj->dma_addr);
-
-	/* release file pointer to gem object. */
-	drm_gem_object_release(obj);
-
-	kfree(dma_obj);
-}
-
-/*
- * Allocate a sg_table for this GEM object.
- * Note: Both the table's contents, and the sg_table itself must be freed by
- *       the caller.
- * Returns a pointer to the newly allocated sg_table, or an ERR_PTR() error.
- */
-static struct sg_table *mtk_gem_prime_get_sg_table(struct drm_gem_object *obj)
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-	struct sg_table *sgt;
-	int ret;
-
-	sgt = kzalloc_obj(*sgt);
-	if (!sgt)
-		return ERR_PTR(-ENOMEM);
-
-	ret = dma_get_sgtable(priv->dma_dev, sgt, dma_obj->vaddr,
-			      dma_obj->dma_addr, obj->size);
-	if (ret) {
-		DRM_ERROR("failed to allocate sgt, %d\n", ret);
-		kfree(sgt);
-		return ERR_PTR(ret);
-	}
-
-	return sgt;
-}
-
-static const struct drm_gem_object_funcs mtk_gem_object_funcs = {
-	.free = mtk_gem_free_object,
-	.print_info = drm_gem_dma_object_print_info,
-	.get_sg_table = mtk_gem_prime_get_sg_table,
-	.vmap = drm_gem_dma_object_vmap,
-	.mmap = mtk_gem_object_mmap,
-	.vm_ops = &drm_gem_dma_vm_ops,
-};
-
-static struct drm_gem_dma_object *mtk_gem_init(struct drm_device *dev,
-					unsigned long size, bool private)
-{
-	struct drm_gem_dma_object *dma_obj;
-	int ret;
-
-	size = round_up(size, PAGE_SIZE);
-
-	if (size == 0)
-		return ERR_PTR(-EINVAL);
-
-	dma_obj = kzalloc_obj(*dma_obj);
-	if (!dma_obj)
-		return ERR_PTR(-ENOMEM);
-
-	dma_obj->base.funcs = &mtk_gem_object_funcs;
-
-	if (private) {
-		ret = 0;
-		drm_gem_private_object_init(dev, &dma_obj->base, size);
-	} else {
-		ret = drm_gem_object_init(dev, &dma_obj->base, size);
-	}
-	if (ret) {
-		DRM_ERROR("failed to initialize gem object\n");
-		kfree(dma_obj);
-		return ERR_PTR(ret);
-	}
-
-	return dma_obj;
-}
-
-static struct drm_gem_dma_object *mtk_gem_create(struct drm_device *dev, size_t size)
-{
-	struct mtk_drm_private *priv = dev->dev_private;
-	struct drm_gem_dma_object *dma_obj;
-	struct drm_gem_object *obj;
-	int ret;
-
-	dma_obj = mtk_gem_init(dev, size, false);
-	if (IS_ERR(dma_obj))
-		return ERR_CAST(dma_obj);
-
-	obj = &dma_obj->base;
-
-	dma_obj->vaddr = dma_alloc_wc(priv->dma_dev, obj->size,
-				      &dma_obj->dma_addr,
-				      GFP_KERNEL | __GFP_NOWARN);
-	if (!dma_obj->vaddr) {
-		DRM_ERROR("failed to allocate %zx byte dma buffer", obj->size);
-		ret = -ENOMEM;
-		goto err_gem_free;
-	}
-
-	DRM_DEBUG_DRIVER("vaddr = %p dma_addr = %pad size = %zu\n",
-			 dma_obj->vaddr, &dma_obj->dma_addr,
-			 size);
-
-	return dma_obj;
-
-err_gem_free:
-	drm_gem_object_release(obj);
-	kfree(dma_obj);
-	return ERR_PTR(ret);
-}
-
-int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
-			struct drm_mode_create_dumb *args)
-{
-	struct drm_gem_dma_object *dma_obj;
-	int ret;
-
-	args->pitch = DIV_ROUND_UP(args->width * args->bpp, 8);
-
-	/*
-	 * Multiply 2 variables of different types,
-	 * for example: args->size = args->spacing * args->height;
-	 * may cause coverity issue with unintentional overflow.
-	 */
-	args->size = args->pitch;
-	args->size *= args->height;
-
-	dma_obj = mtk_gem_create(dev, args->size);
-	if (IS_ERR(dma_obj))
-		return PTR_ERR(dma_obj);
-
-	/*
-	 * allocate a id of idr table where the obj is registered
-	 * and handle has the id what user can see.
-	 */
-	ret = drm_gem_handle_create(file_priv, &dma_obj->base, &args->handle);
-	if (ret)
-		goto err_handle_create;
-
-	/* drop reference from allocate - handle holds it now. */
-	drm_gem_object_put(&dma_obj->base);
-
-	return 0;
-
-err_handle_create:
-	mtk_gem_free_object(&dma_obj->base);
-	return ret;
-}
-
-static int mtk_gem_object_mmap(struct drm_gem_object *obj,
-			       struct vm_area_struct *vma)
-
-{
-	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
-	struct mtk_drm_private *priv = obj->dev->dev_private;
-	int ret;
-
-	/*
-	 * Set vm_pgoff (used as a fake buffer offset by DRM) to 0 and map the
-	 * whole buffer from the start.
-	 */
-	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
-
-	/*
-	 * dma_alloc_attrs() allocated a struct page table for mtk_gem, so clear
-	 * VM_PFNMAP flag that was set by drm_gem_mmap_obj()/drm_gem_mmap().
-	 */
-	vm_flags_mod(vma, VM_IO | VM_DONTEXPAND | VM_DONTDUMP, VM_PFNMAP);
-
-	vma->vm_page_prot = pgprot_writecombine(vm_get_page_prot(vma->vm_flags));
-	vma->vm_page_prot = pgprot_decrypted(vma->vm_page_prot);
-
-	ret = dma_mmap_wc(priv->dma_dev, vma, dma_obj->vaddr,
-			  dma_obj->dma_addr, obj->size);
-	if (ret)
-		drm_gem_vm_close(vma);
-
-	return ret;
-}
-
-struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sgt)
-{
-	struct drm_gem_dma_object *dma_obj;
-
-	/* check if the entries in the sg_table are contiguous */
-	if (drm_prime_get_contiguous_size(sgt) < attach->dmabuf->size) {
-		DRM_ERROR("sg_table is not contiguous");
-		return ERR_PTR(-EINVAL);
-	}
-
-	dma_obj = mtk_gem_init(dev, attach->dmabuf->size, true);
-	if (IS_ERR(dma_obj))
-		return ERR_CAST(dma_obj);
-
-	dma_obj->dma_addr = sg_dma_address(sgt->sgl);
-	dma_obj->sgt = sgt;
-
-	return &dma_obj->base;
-}
diff --git a/drivers/gpu/drm/mediatek/mtk_gem.h b/drivers/gpu/drm/mediatek/mtk_gem.h
deleted file mode 100644
index afebc3a970a8..000000000000
--- a/drivers/gpu/drm/mediatek/mtk_gem.h
+++ /dev/null
@@ -1,17 +0,0 @@
-/* SPDX-License-Identifier: GPL-2.0-only */
-/*
- * Copyright (c) 2015 MediaTek Inc.
- */
-
-#ifndef _MTK_GEM_H_
-#define _MTK_GEM_H_
-
-#include <drm/drm_gem.h>
-#include <drm/drm_gem_dma_helper.h>
-
-int mtk_gem_dumb_create(struct drm_file *file_priv, struct drm_device *dev,
-			struct drm_mode_create_dumb *args);
-struct drm_gem_object *mtk_gem_prime_import_sg_table(struct drm_device *dev,
-			struct dma_buf_attachment *attach, struct sg_table *sg);
-
-#endif
-- 
2.53.0.473.g4a7958ca14-goog


