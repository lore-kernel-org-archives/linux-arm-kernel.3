Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53565F33805
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:41:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1GwlbKCuRkMEJtcMvq6Y2vEjKV9Tt6Itzx4uW6Jnu0w=; b=szjyx6apYK1dhi7+SUA2qsY4qJ
	udGhZQlteMJ97PoDuRn+l0fW/q6zITcID5+xGaKLJlRbOX+ZNBdlFWpY0nNVzYuGiWUVVADcTP+cI
	MbWpZdh2TsQ0lGLde95f4z1UJJGWItwI3t8kdMO6Ko5AbXZJoqAWYYxn20Vihwjz7ohrc8eWMbzFA
	1Wwi9Xvz/f1IfZT7cDbOuH75FVrtX9LdAVipY4sRMyGyf48rqAY8dYDOhAH5+khy7Yrjr2joL2Lz+
	35KW0bK4NwyDSW/dvHzvQCTq2RB3xaTlVtwZsvpJca8S9H91lL81uvFBDDp7jO1JilDVJ7Qy4oqzQ
	Cvz4nubg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7S-00000005VuA-0YPo;
	Tue, 17 Mar 2026 06:41:35 +0000
Received: from mail-pg1-x52c.google.com ([2607:f8b0:4864:20::52c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7Q-00000005VsZ-10xo
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:41:33 +0000
Received: by mail-pg1-x52c.google.com with SMTP id 41be03b00d2f7-c06cb8004e8so2158882a12.0
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 23:41:31 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729691; x=1774334491; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=1GwlbKCuRkMEJtcMvq6Y2vEjKV9Tt6Itzx4uW6Jnu0w=;
        b=HnOMok8NAtC5kQog0o+SawsSrGSK2oHZmCrygIQZfsR9oVLp2bpsF9GgdINBZ0WWxe
         QUsnQzT2lFZi/pPHuCwNeD3wa5q5DYQiE90EjFmHXlvthCrpUbnW2OMcAMyF3xcIWwwx
         /BFU1nNXNhR87aWH9DLu+UxL2spBH5kj7bv64=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729691; x=1774334491;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=1GwlbKCuRkMEJtcMvq6Y2vEjKV9Tt6Itzx4uW6Jnu0w=;
        b=JVs2kedtMXUqYvo+mUp0DTiYA0YlbrLSUUWJW1SHTITY8EOmLCrneBVaGSRoPilGUI
         mxp3cWW92RpSdH/4v3cit/YJedKDxtnEY7HLHaD3GRbSUsWQbFnsYlaNf2YgWIQSqQfe
         ABOfqVlvlRLffez3Iz9/b7fTTvRH8x5lj1y0bjieWGqCtFeD1/glYLtp97/sxknneX1s
         90uoU6BgV4bmDoBzOMdKNHY/Vr9aGgKKzT2JaJTLDPRzzJy1EDlMGqKwhRH5pkL2NPXq
         1BcUUjsn5s0cuzxOpTWwQmeMdWdFWAEVP2TPbBQUQDMFim8+5HHLb0nd89LR/F02JEf1
         HTGg==
X-Forwarded-Encrypted: i=1; AJvYcCUoxC5nHVMfLh8gxPXV4S3ccY3iwGbVCW/vJ/duga+HCgJVbeQDmo40lhvhIxrz5McSvODWLDhrpnGzUi3epEh4@lists.infradead.org
X-Gm-Message-State: AOJu0YwYImFgXs1Z7TNsfGoccac9pE6O2P46ND+8QpcKqsrjU07CrpqX
	YTB4K++PSqOiOJ4JvV6wo5Q5G5BWBOjgyB+08OwQfJRfbsBpamM4FL3FNs2J4nEkJw==
X-Gm-Gg: ATEYQzzHLCmTQhRcX+QMCmAtJOiNYQFLBQsuM9xfgyrG6muMMhwX3pQX9WHUR4ikJOR
	TgJIqpkLvqkP8cuapARj02AaRk7SlOvbglR0mc+BEQF5gTjW2V87UBsz955viBGzAevb9iqcmM/
	/XVH8x0bg/0XYSUAWrumOP06E8qhrq1vgB/kCldc4C1m4gjwpA5wQRl2bxx8x9T/DZ97yzTiJRu
	sw2sj6BqKEpbT3gBXyZTyJrWGhRY5Z2UpcFfFyPNdXko0K0JMgOtNpCAHY9iXAoCDH2bFJQq9m5
	nahfYnp5/UbuEduMoPo6+c7BuZcKYOqjm2RPp00as1Qi4EGbWiXLez8XuNIRxqdkVH8+bLBAt46
	F0Sb3vP99wPAOWJnaRcckf8gNj3dJf59naR+XqqfOP0Nyz9ApyLpo8jDNcbetpzKHmEeSrCxO91
	EmX38SyXB1dEAHm/QRBmVWSCJl8xbA68mnda4jZYm/LoewpDuu7GeBsjCZnakjJJLw3jk3KGiYo
	gz4gZVT
X-Received: by 2002:a17:902:ecd2:b0:2b0:5a4c:726a with SMTP id d9443c01a7336-2b05a5bbfdfmr53881605ad.43.1773729691244;
        Mon, 16 Mar 2026 23:41:31 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.28
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:30 -0700 (PDT)
From: Chen-Yu Tsai <wenst@chromium.org>
To: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>,
	Simona Vetter <simona@ffwll.ch>
Cc: Rob Herring <robh@kernel.org>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>,
	dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev,
	Chen-Yu Tsai <wenst@chromium.org>,
	Sasha Finkelstein <fnkl.kernel@gmail.com>,
	Janne Grunau <j@jannau.net>
Subject: [PATCH v2 4/4] drm/gem-dma: Support DRM_MODE_DUMB_KERNEL_MAP flag
Date: Tue, 17 Mar 2026 14:40:46 +0800
Message-ID: <20260317064049.696795-5-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260317064049.696795-1-wenst@chromium.org>
References: <20260317064049.696795-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_234132_303098_3A2FF2F4 
X-CRM114-Status: GOOD (  22.31  )
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

From: Rob Herring <robh@kernel.org>

Add support in DMA helpers to handle callers specifying
DRM_MODE_DUMB_KERNEL_MAP flag. Existing behavior is maintained with this
change. drm_gem_dma_dumb_create() always creates a kernel mapping as
before. drm_gem_dma_dumb_create_internal() lets the caller set the flags
as desired.

Most drivers that use drm_gem_dma_dumb_create_internal() are already
using the internal client interface via drm_client_setup*() and
DRM_FBDEV_DMA_DRIVER_OPS, and do not have other direct kernel
accesses to the buffer memory internally. Therefore, there is no need
to add the DRM_MODE_DUMB_KERNEL_MAP flag for them.

The only outlier is the adp driver. The DRM_MODE_DUMB_KERNEL_MAP flag
is added to its dumb_create() function, adp_drm_gem_dumb_create().

Signed-off-by: Rob Herring <robh@kernel.org>
[wenst@chromium.org: Rebase onto renamed GEM DMA helpers]
[wenst@chromium.org: show "vaddr=(no mapping)" in drm_gem_dma_print_info()]
[wenst@chromium.org: Drop DRM_MODE_DUMB_KERNEL_MAP driver changes]
[wenst@chromium.org: Add DRM_MODE_DUMB_KERNEL_MAP to adp_drm_gem_dumb_create()]
[wenst@chromium.org: Add flags field to drm_gem_dma_create_with_handle()
		     kerneldoc]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
---
Changes since v1:
- Rebased onto renamed GEM DMA helpers
- Added check in drm_fb_dma_get_scanout_buffer() and drm_gem_dma_vmap().
- Made drm_gem_dma_print_info() show "vaddr=(no mapping)" for objects
  allocated without kernel mapping
- Dropped existing DRM_MODE_DUMB_KERNEL_MAP flag addition in various
  drivers
- Added DRM_MODE_DUMB_KERNEL_MAP flag to adp_drm_gem_dumb_create()
- Added flags field kerneldoc for drm_gem_dma_create_with_handle()

Cc: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Janne Grunau <j@jannau.net>
Cc: asahi@lists.linux.dev
---
 drivers/gpu/drm/adp/adp_drv.c        |  1 +
 drivers/gpu/drm/drm_fb_dma_helper.c  |  4 ++
 drivers/gpu/drm/drm_gem_dma_helper.c | 67 +++++++++++++++++-----------
 3 files changed, 47 insertions(+), 25 deletions(-)

diff --git a/drivers/gpu/drm/adp/adp_drv.c b/drivers/gpu/drm/adp/adp_drv.c
index 4554cf75565e..c549b44b3814 100644
--- a/drivers/gpu/drm/adp/adp_drv.c
+++ b/drivers/gpu/drm/adp/adp_drv.c
@@ -95,6 +95,7 @@ static int adp_drm_gem_dumb_create(struct drm_file *file_priv,
 {
 	args->height = ALIGN(args->height, 64);
 	args->size = args->pitch * args->height;
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 
 	return drm_gem_dma_dumb_create_internal(file_priv, drm, args);
 }
diff --git a/drivers/gpu/drm/drm_fb_dma_helper.c b/drivers/gpu/drm/drm_fb_dma_helper.c
index fd71969d2fb1..12a44accc48c 100644
--- a/drivers/gpu/drm/drm_fb_dma_helper.c
+++ b/drivers/gpu/drm/drm_fb_dma_helper.c
@@ -187,6 +187,10 @@ int drm_fb_dma_get_scanout_buffer(struct drm_plane *plane,
 	if (!dma_obj->vaddr)
 		return -ENODEV;
 
+	/* Buffer was allocated with NO_KERNEL_MAPPING */
+	if (dma_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+		return -ENODEV;
+
 	iosys_map_set_vaddr(&sb->map[0], dma_obj->vaddr);
 	sb->format = fb->format;
 	sb->height = fb->height;
diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 9722c9fc86f3..281fb563f061 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -116,26 +116,8 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 	return ERR_PTR(ret);
 }
 
-/**
- * drm_gem_dma_create - allocate an object with the given size
- * @drm: DRM device
- * @size: size of the object to allocate
- *
- * This function creates a DMA GEM object and allocates memory as backing store.
- * The allocated memory will occupy a contiguous chunk of bus address space.
- *
- * For devices that are directly connected to the memory bus then the allocated
- * memory will be physically contiguous. For devices that access through an
- * IOMMU, then the allocated memory is not expected to be physically contiguous
- * because having contiguous IOVAs is sufficient to meet a devices DMA
- * requirements.
- *
- * Returns:
- * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
- * error code on failure.
- */
-struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
-					      size_t size)
+static struct drm_gem_dma_object *
+drm_gem_dma_create_flags(struct drm_device *drm, size_t size, u32 flags)
 {
 	struct drm_gem_dma_object *dma_obj;
 	int ret;
@@ -146,6 +128,9 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 	if (IS_ERR(dma_obj))
 		return dma_obj;
 
+	if (!(flags & DRM_MODE_DUMB_KERNEL_MAP))
+		dma_obj->dma_attrs |= DMA_ATTR_NO_KERNEL_MAPPING;
+
 	if (dma_obj->map_noncoherent) {
 		dma_obj->vaddr = dma_alloc_noncoherent(drm_dev_dma_dev(drm),
 						       size,
@@ -171,6 +156,30 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 	drm_gem_object_put(&dma_obj->base);
 	return ERR_PTR(ret);
 }
+
+/**
+ * drm_gem_dma_create - allocate an object with the given size
+ * @drm: DRM device
+ * @size: size of the object to allocate
+ *
+ * This function creates a DMA GEM object and allocates memory as backing store.
+ * The allocated memory will occupy a contiguous chunk of bus address space.
+ *
+ * For devices that are directly connected to the memory bus then the allocated
+ * memory will be physically contiguous. For devices that access through an
+ * IOMMU, then the allocated memory is not expected to be physically contiguous
+ * because having contiguous IOVAs is sufficient to meet a devices DMA
+ * requirements.
+ *
+ * Returns:
+ * A struct drm_gem_dma_object * on success or an ERR_PTR()-encoded negative
+ * error code on failure.
+ */
+struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
+					      size_t size)
+{
+	return drm_gem_dma_create_flags(drm, size, DRM_MODE_DUMB_KERNEL_MAP);
+}
 EXPORT_SYMBOL_GPL(drm_gem_dma_create);
 
 /**
@@ -179,6 +188,7 @@ EXPORT_SYMBOL_GPL(drm_gem_dma_create);
  * @file_priv: DRM file-private structure to register the handle for
  * @drm: DRM device
  * @size: size of the object to allocate
+ * @flags: DRM_MODE_DUMB_* flags if any
  * @handle: return location for the GEM handle
  *
  * This function creates a DMA GEM object, allocating a chunk of memory as
@@ -194,14 +204,14 @@ EXPORT_SYMBOL_GPL(drm_gem_dma_create);
  */
 static struct drm_gem_dma_object *
 drm_gem_dma_create_with_handle(struct drm_file *file_priv,
-			       struct drm_device *drm, size_t size,
+			       struct drm_device *drm, size_t size, u32 flags,
 			       uint32_t *handle)
 {
 	struct drm_gem_dma_object *dma_obj;
 	struct drm_gem_object *gem_obj;
 	int ret;
 
-	dma_obj = drm_gem_dma_create(drm, size);
+	dma_obj = drm_gem_dma_create_flags(drm, size, DRM_MODE_DUMB_KERNEL_MAP);
 	if (IS_ERR(dma_obj))
 		return dma_obj;
 
@@ -283,7 +293,7 @@ int drm_gem_dma_dumb_create_internal(struct drm_file *file_priv,
 		args->size = args->pitch * args->height;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
-						 &args->handle);
+						 args->flags, &args->handle);
 	return PTR_ERR_OR_ZERO(dma_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gem_dma_dumb_create_internal);
@@ -313,12 +323,13 @@ int drm_gem_dma_dumb_create(struct drm_file *file_priv,
 	struct drm_gem_dma_object *dma_obj;
 	int ret;
 
+	args->flags = DRM_MODE_DUMB_KERNEL_MAP;
 	ret = drm_mode_size_dumb(drm, args, 0, 0);
 	if (ret)
 		return ret;
 
 	dma_obj = drm_gem_dma_create_with_handle(file_priv, drm, args->size,
-						 &args->handle);
+						 args->flags, &args->handle);
 	return PTR_ERR_OR_ZERO(dma_obj);
 }
 EXPORT_SYMBOL_GPL(drm_gem_dma_dumb_create);
@@ -412,7 +423,10 @@ void drm_gem_dma_print_info(const struct drm_gem_dma_object *dma_obj,
 			    struct drm_printer *p, unsigned int indent)
 {
 	drm_printf_indent(p, indent, "dma_addr=%pad\n", &dma_obj->dma_addr);
-	drm_printf_indent(p, indent, "vaddr=%p\n", dma_obj->vaddr);
+	if (dma_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+		drm_printf_indent(p, indent, "vaddr=(no mapping)\n");
+	else
+		drm_printf_indent(p, indent, "vaddr=%p\n", dma_obj->vaddr);
 }
 EXPORT_SYMBOL(drm_gem_dma_print_info);
 
@@ -511,6 +525,9 @@ EXPORT_SYMBOL_GPL(drm_gem_dma_prime_import_sg_table);
 int drm_gem_dma_vmap(struct drm_gem_dma_object *dma_obj,
 		     struct iosys_map *map)
 {
+	if (dma_obj->dma_attrs & DMA_ATTR_NO_KERNEL_MAPPING)
+		return -ENOMEM;
+
 	iosys_map_set_vaddr(map, dma_obj->vaddr);
 
 	return 0;
-- 
2.53.0.851.ga537e3e6e9-goog


