Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0D09F33806
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Mar 2026 06:41:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beYKL+KpJYqTN09SlrzQ/IJhFB/kZtPqCQ/2b0LTAW0=; b=xt1aoNtn58K4BDTUUKR6MW95qN
	uUvpt/NAd8o/3BgV6RK7XlQ/juuas6ailebTWgtJbA4LLOqizqvfluo+jUVSOz+e7a+DY9KzrZWAD
	xYdV7bbpVtRpRMaXQ+ZStWbMHEBwSTOi/2Izj4XjfAL9l+4vhSO7u690cb1JnV4wJyjuWmUPp91kV
	4ujeY3o1e/OXHXJBe6DEmZ8nPxELwdbEDgTTJXH7nJ3dWXVRvK1BC4o6aQLZbAEm3rj4cNrPww5QX
	/uB3+XrrDtVvk7KkEofUy9qydt7uCqLmFgartoxkLk8zoAM07YO22QOmpjo/H+mF1OStJnR9Xvwqg
	n0L8XwuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7R-00000005Vto-3TKR;
	Tue, 17 Mar 2026 06:41:33 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2O7M-00000005Vqk-4555
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Mar 2026 06:41:30 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2ad9f316d68so26059545ad.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 16 Mar 2026 23:41:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=chromium.org; s=google; t=1773729688; x=1774334488; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=beYKL+KpJYqTN09SlrzQ/IJhFB/kZtPqCQ/2b0LTAW0=;
        b=ViF3nzC61DhMIC5IjnX3GzcUOhjgTs0ofNo0GdlxQeOyo4mZFVLO11cmU9nzs3n4+F
         UsKrRC6GwfuQjMZMkgACFhBhgd8PwBtT/8jpYMFo4W+ld+52EBNjgqdPtNtFAw5QCcWB
         O3ANmZ4w/Lxw5KgEklkwPFBbXUkaMfx+CLa28=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1773729688; x=1774334488;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=beYKL+KpJYqTN09SlrzQ/IJhFB/kZtPqCQ/2b0LTAW0=;
        b=m/J6e/3OD/+nC6f3w9aGkcpqiuaZQUjt3wBnmQNULfsj8HVwr5c2M3yKB/7BMeR4ng
         2QtPsRe4shA7MIdXgAobuaJ2vNOIOrZBllyq4ygvkIs6kc/9I4Os65q/wN8s2+gsTthm
         ONicktkAbXU/zcjBbe6Rzyuhp+DZbZpToKHkOKocKQx6c6Yi7xeZdEiBUIJsGWUyi9qW
         6L+GXjqw02D4fqvGsCD2mdA38Y48VqOnm9wdYjVJzdEYvLTkJ6OdQBX+wrLhZY1xXREU
         4Wkt3MkrbA2R7TUbVZ4/eIrd++W/qL39Uv0gw7fdhcGlxBAB/zD5FmOy25Zf1D4gMu8g
         uwJg==
X-Forwarded-Encrypted: i=1; AJvYcCX57ZtMt2Q6kj7/2lmcD3AGH+fCX9ReSLA2msVCL2upMBuE123vVba5yLrD9JdYm6Xw7JUyK3Lj9YMc7iKfs2lR@lists.infradead.org
X-Gm-Message-State: AOJu0Yy6jfUJggnM9JImKvvUDHuVFfggeCt45nqH8DkbF5pq6PLxoeQd
	mhVhKR4r1vMPtm5FvOS/nyD/98HBV/Frtdw6kFRa6pPfp4zYnP8K+gDuyaU+JQsNkA==
X-Gm-Gg: ATEYQzxtvnKKm6rTDwtYZod3jCzd+nF0UHdu0UOrmsCNLcdn1e5fxP/S4hKX2NaNEle
	YNXnchW0YuNhYkglM7M7mwVQRnSUrsk9F6ZUSgzZRTE2u2agakjf4iD4ZD4WiRcemU3LBpWiDca
	0COnWP/6aqdF8mGIegqafMPUMu6ARqqlffXG/f2o4mC07jf9yZqLEJFW9Z/0kVtwInawIVmDETA
	eRy4ONyDExe+KfL8chVuAKpZm77nZcsZ3JtO+zETK3DQvSsymmQmMbK9tsFU93xlg990YS05YHz
	6OXirsUCqZtq9q8zIk235gsi1k9UQdsN89F8obJTkfaazRg1E3TPTcr1ne1/32nPU2MzjaTwtYR
	RnGWktDhJaCIFhSRPFyK+tKqeEY55ogGk0UAViBjrh1Ys6SZLByeKQRfic4kkFw5rfjHsD4l45N
	DoNkQjLrg2w5xn/K/5RHQOmvSrKdwNstOIVFqQhKur/TCjQDVyTV9UQKd2/8MH9UxhDPVMuutcb
	AeRWxS/
X-Received: by 2002:a17:903:37d0:b0:2b0:4a57:e498 with SMTP id d9443c01a7336-2b04a57e8demr100300115ad.15.1773729688017;
        Mon, 16 Mar 2026 23:41:28 -0700 (PDT)
Received: from wenstp920.tpe.corp.google.com ([2a00:79e0:201d:8:a064:c65d:a199:5cb6])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2aece605231sm124269425ad.27.2026.03.16.23.41.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 16 Mar 2026 23:41:27 -0700 (PDT)
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
	Chen-Yu Tsai <wenst@chromium.org>
Subject: [PATCH v2 3/4] drm/gem-dma: Use the dma_*_attr API variant
Date: Tue, 17 Mar 2026 14:40:45 +0800
Message-ID: <20260317064049.696795-4-wenst@chromium.org>
X-Mailer: git-send-email 2.53.0.851.ga537e3e6e9-goog
In-Reply-To: <20260317064049.696795-1-wenst@chromium.org>
References: <20260317064049.696795-1-wenst@chromium.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260316_234129_024321_29921E7E 
X-CRM114-Status: GOOD (  18.23  )
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

In preparation to allow DRM DMA users to adjust the DMA_ATTR_* flags,
convert the DMA helper code to use the dma_*_attr APIs instead of the
dma_*_wc variants.

Only the DMA_ATTR_WRITE_COMBINE and DMA_ATTR_NO_WARN attributes are set
in this commit, so there's no functional change.

Also change the dma_free_wc() call in vc4_bo_purge() in the vc4 driver
to use dma_free_attrs() to match. vc4_bo is a sub-class of
drm_gem_dma_object.

Sub-classes of |struct drm_gem_dma_object| can also set additional
DMA_ATTR_* flags if they choose so. For example a sub-class could
set DMA_ATTR_FORCE_CONTIGUOUS in certain cases.

Signed-off-by: Rob Herring <robh@kernel.org>
[wenst@chromium.org: Rebase onto renamed DMA helpers]
[wenst@chromium.org: Make vc4_bo_purge() use matching dma_free_attrs()]
[wenst@chromium.org: Expand commit message to mention that sub-classes
                     can set extra DMA_ATTR_* flags]
Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

---
Changes since v1:
- Rebased onto renamed DMA helpers
- Made vc4_bo_purge() use matching dma_free_attrs()
- Expanded commit message to mention that sub-classes can set extra
  DMA_ATTR_* flags
---
 drivers/gpu/drm/drm_gem_dma_helper.c | 26 +++++++++++++++-----------
 drivers/gpu/drm/vc4/vc4_bo.c         |  2 +-
 include/drm/drm_gem_dma_helper.h     |  3 +++
 3 files changed, 19 insertions(+), 12 deletions(-)

diff --git a/drivers/gpu/drm/drm_gem_dma_helper.c b/drivers/gpu/drm/drm_gem_dma_helper.c
index 1c00a71ab3c9..9722c9fc86f3 100644
--- a/drivers/gpu/drm/drm_gem_dma_helper.c
+++ b/drivers/gpu/drm/drm_gem_dma_helper.c
@@ -108,6 +108,7 @@ __drm_gem_dma_create(struct drm_device *drm, size_t size, bool private)
 		goto error;
 	}
 
+	dma_obj->dma_attrs |= DMA_ATTR_NO_WARN | DMA_ATTR_WRITE_COMBINE;
 	return dma_obj;
 
 error:
@@ -152,9 +153,10 @@ struct drm_gem_dma_object *drm_gem_dma_create(struct drm_device *drm,
 						       DMA_TO_DEVICE,
 						       GFP_KERNEL | __GFP_NOWARN);
 	} else {
-		dma_obj->vaddr = dma_alloc_wc(drm_dev_dma_dev(drm), size,
-					      &dma_obj->dma_addr,
-					      GFP_KERNEL | __GFP_NOWARN);
+		dma_obj->vaddr = dma_alloc_attrs(drm_dev_dma_dev(drm), size,
+						 &dma_obj->dma_addr,
+						 GFP_KERNEL | __GFP_NOWARN,
+						 dma_obj->dma_attrs);
 	}
 	if (!dma_obj->vaddr) {
 		drm_dbg(drm, "failed to allocate buffer with size %zu\n",
@@ -242,9 +244,9 @@ void drm_gem_dma_free(struct drm_gem_dma_object *dma_obj)
 					     dma_obj->vaddr, dma_obj->dma_addr,
 					     DMA_TO_DEVICE);
 		else
-			dma_free_wc(drm_dev_dma_dev(gem_obj->dev),
-				    dma_obj->base.size, dma_obj->vaddr,
-				    dma_obj->dma_addr);
+			dma_free_attrs(drm_dev_dma_dev(gem_obj->dev),
+				       dma_obj->base.size, dma_obj->vaddr,
+				       dma_obj->dma_addr, dma_obj->dma_attrs);
 	}
 
 	drm_gem_object_release(gem_obj);
@@ -435,8 +437,9 @@ struct sg_table *drm_gem_dma_get_sg_table(struct drm_gem_dma_object *dma_obj)
 	if (!sgt)
 		return ERR_PTR(-ENOMEM);
 
-	ret = dma_get_sgtable(drm_dev_dma_dev(obj->dev), sgt, dma_obj->vaddr,
-			      dma_obj->dma_addr, obj->size);
+	ret = dma_get_sgtable_attrs(drm_dev_dma_dev(obj->dev), sgt,
+				    dma_obj->vaddr, dma_obj->dma_addr,
+				    obj->size, dma_obj->dma_attrs);
 	if (ret < 0)
 		goto out;
 
@@ -546,9 +549,10 @@ int drm_gem_dma_mmap(struct drm_gem_dma_object *dma_obj, struct vm_area_struct *
 				     vma, vma->vm_end - vma->vm_start,
 				     virt_to_page(dma_obj->vaddr));
 	} else {
-		ret = dma_mmap_wc(drm_dev_dma_dev(dma_obj->base.dev), vma,
-				  dma_obj->vaddr, dma_obj->dma_addr,
-				  vma->vm_end - vma->vm_start);
+		ret = dma_mmap_attrs(drm_dev_dma_dev(dma_obj->base.dev), vma,
+				     dma_obj->vaddr, dma_obj->dma_addr,
+				     vma->vm_end - vma->vm_start,
+				     dma_obj->dma_attrs);
 	}
 	if (ret)
 		drm_gem_vm_close(vma);
diff --git a/drivers/gpu/drm/vc4/vc4_bo.c b/drivers/gpu/drm/vc4/vc4_bo.c
index f45ba47b4ba8..981593739a0f 100644
--- a/drivers/gpu/drm/vc4/vc4_bo.c
+++ b/drivers/gpu/drm/vc4/vc4_bo.c
@@ -304,7 +304,7 @@ static void vc4_bo_purge(struct drm_gem_object *obj)
 
 	drm_vma_node_unmap(&obj->vma_node, dev->anon_inode->i_mapping);
 
-	dma_free_wc(dev->dev, obj->size, bo->base.vaddr, bo->base.dma_addr);
+	dma_free_attrs(dev->dev, obj->size, bo->base.vaddr, bo->base.dma_addr, bo->base.dma_attrs);
 	bo->base.vaddr = NULL;
 	bo->madv = __VC4_MADV_PURGED;
 }
diff --git a/include/drm/drm_gem_dma_helper.h b/include/drm/drm_gem_dma_helper.h
index f2678e7ecb98..e815ff121e23 100644
--- a/include/drm/drm_gem_dma_helper.h
+++ b/include/drm/drm_gem_dma_helper.h
@@ -16,6 +16,8 @@ struct drm_mode_create_dumb;
  *       more than one entry but they are guaranteed to have contiguous
  *       DMA addresses.
  * @vaddr: kernel virtual address of the backing memory
+ * @dma_attrs: DMA attributes used when allocating backing memory.
+ *             Only applies to coherent memory.
  * @map_noncoherent: if true, the GEM object is backed by non-coherent memory
  */
 struct drm_gem_dma_object {
@@ -25,6 +27,7 @@ struct drm_gem_dma_object {
 
 	/* For objects with DMA memory allocated by GEM DMA */
 	void *vaddr;
+	unsigned long dma_attrs;
 
 	bool map_noncoherent;
 };
-- 
2.53.0.851.ga537e3e6e9-goog


