Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EBE30606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 06:41:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=1seJgbCY;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=aGLMi++N
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=; b=1seJgbCYVYHypu
	OWOslCqXtjqY4AL+F7MgEQPGJKe2ELC9ThTurpsPTSunJHD16u3O96s0HcQYbYTdZft36ulyGFy4Z
	pKG1Awa17aezOC5CLtYfIp17qldSUWcRofBFtpVL6Ci03QkCFF5+aUtBGqT1UWhRMdqTnACrJvu1g
	4ZuelpeOHZPz8wFrOLeCn78s/LHEZwz2TE7MiZqUOHmcyjSyElAAcpqmLm9ydd+f4xC1kzzCkM8d5
	0Q72NIKk4V20S8IDY76Yo133ceDi6vI9nPUm3/Ollc9xnw6K6dWcpmJu2kAu62f9JzcLze3GJK9yd
	Ix2faDkj73z573yusmvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8xA-0000000Fbst-3mP0;
	Fri, 23 Oct 2026 06:40:36 +0000
Received: from mail-wm1-x331.google.com ([2a00:1450:4864:20::331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xK8wr-0000000FbXb-3Lp1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 06:40:22 +0000
Received: by mail-wm1-x331.google.com with SMTP id 5b1f17b1804b1-4a1ec92f655so4399315e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 22 Oct 2026 23:40:17 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792737616; x=1793342416; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=;
        b=aGLMi++NYYVPoCl2qGqq2uIIirVBjC5oJvG2dANx5GWxFKwTQ+ZReE2W6N3df6XnWI
         GDVtk+f3AvmftnjFwGOcRm1hQpN4oqaZLafDorBtUezyM3fp4aM8Wd+tirpEWp6tZ1xP
         wdOdbeGNhHnKVcRc5+CdJ45s9dbTNfbwuFih66E7TFFdW1rR0OrXanH/LM91lbUIcG6k
         LaIyCICnTqcIIQokdZxJ3DASkWkLOGcwzGhQaK5H27ejlHRg+sAk746Sl/AtTgepXy0h
         X2cjNEQLyDry7APbBL3lH0avMkLM12daMtQ+aIsd20Hy7XrWPIguD4+DNRboQZ9kMLo+
         C1VQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792737616; x=1793342416;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :content-type:mime-version:subject:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=7r0UNu5wEL8POkOSz3+rOlJOKvPQ5Qd38WxY0JoWHCY=;
        b=SY/5PW+aq0DfAr3MR7WWn8ExDYOWbPdkPO2D6XAm44gFIvsWzr62KuCtl+eEehvwFz
         0OHWfdxy8gAwTjIi5tBvQUg13EzwO1G/AQgrHDmL7wopZMJ72CDDrvpoH84ZZtYVNesS
         Ma2Fp1/oGQDUxA8Ew6hPms+FuK6y+umiOkyfQvaE0diaFCI3xOHdqvLiY7/ok0lAx+oA
         DZY/5qKhF9l1Pt2NlbzSpxfiiArPsxYtA9HJ7EJRwF5F7hf2ggZczkw4ZzTxhFSGEKsa
         mk0LUc5ATzczflSrWRk6Ap6Jng1q9gAN5cCMK6GlLcgwfXmxkM5tGSQOFMcVU88U71v+
         XcHg==
X-Gm-Message-State: AFq9FYIFn8bf9/vxUaQYUj+U9HiIH/WfCTIqM04gABynduO5w06kgax6
	HIXt+VZ5Q38LqcmhUibjcO78yNyDWTF7EkBzm1k1DJwub6yp+WGGbO6K
X-Gm-Gg: AYBFou2qZuu5G3Ki9RcnkAyJqTWjchxZzYVqbAComlSxWkYsw3rxfg+9o8UBTPYrH5h
	/Wecq9vE26NkSP1qLEdwwisW6v6bqtcEV1+XX6G3zTONnNrcebkFfvK4Jn24+FY9Rf5DvUl94XR
	NrvWmPSs0vL1GFV6JxbRFZiYflk0uZbLG1pVCD3pAm8CwMSAfMVwZsQ+jTNyfRUQAtkfVepO/pK
	eCw4pArroMaL8tNVHnmljGy4AQWI3ik9xMiuxF2eTSS0eQf+kRVi1sqII2cueaRoBIPxj0C06ei
	5D1bke5J9mTKdieWFcz19r2tMor2ioRxNUm7f5dbYMUmztXCS7wUO8U85z+WnMZenjq9GKTrZpd
	b+fWZklSSQs2z9guBoFllxTeTSPUi8amXHBgqrllji0jODpJUSjDkoqgTpoNBZJtmg63OMSHA3D
	BtqXjOCc84OJaWGZXVsR88gRrkOC7qfEeEz6f8vudGO7sakYofoRED1xRiLgmN9IIHR7XDVoJ3F
	MHc5mBQbnmUWkvvnqzXKpSUQBEvtHVsaWh6xVqaBXYPm9erga+dMEMK9EYpP+UQeL+avJRau4/5
	sNWh25qkfwUGrzy8MPUZHACnV99Xr5B+TunocgOeF/d7D6O2tOVHGIGlpQESl709bQgMSXfk+sb
	XKqI=
X-Received: by 2002:a05:600c:6387:b0:4a2:bbd:ea3a with SMTP id 5b1f17b1804b1-4a211c51aa9mr18565345e9.6.1792737615806;
        Thu, 22 Oct 2026 23:40:15 -0700 (PDT)
Received: from [192.168.1.22] (cst-prg-49-173.cust.vodafone.cz. [46.135.49.173])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-48e38030c47sm3104782f8f.21.2026.10.22.23.40.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 22 Oct 2026 23:40:15 -0700 (PDT)
From: Tomeu Vizoso <tomeu.vizoso@gmail.com>
X-Google-Original-From: Tomeu Vizoso <tomeu@tomeuvizoso.net>
Date: Fri, 23 Oct 2026 08:39:37 +0200
Subject: [PATCH v3 12/16] accel/thames: Install memory mappings populated
 and dirty
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261023-thames-v3-12-3ab40aa17157@tomeuvizoso.net>
References: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
In-Reply-To: <20261023-thames-v3-0-3ab40aa17157@tomeuvizoso.net>
To: Nishanth Menon <nm@ti.com>, "Andrew F. Davis" <afd@ti.com>, 
 Randolph Sapp <rs@ti.com>, Jonathan Humphreys <j-humphreys@ti.com>, 
 Andrei Aldea <a-aldea@ti.com>, Chirag Shilwant <c-shilwant@ti.com>, 
 Vignesh Raghavendra <vigneshr@ti.com>, Beleswar Padhi <b-padhi@ti.com>, 
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Oded Gabbay <ogabbay@kernel.org>, 
 Jonathan Corbet <corbet@lwn.net>, Sumit Semwal <sumit.semwal@linaro.org>, 
 =?utf-8?q?Christian_K=C3=B6nig?= <christian.koenig@amd.com>, 
 Robert Nelson <robertcnelson@gmail.com>, David Airlie <airlied@gmail.com>, 
 Simona Vetter <simona@ffwll.ch>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Jani Nikula <jani.nikula@linux.intel.com>, 
 Tvrtko Ursulin <tursulin@ursulin.net>, 
 Markus Elfring <Markus.Elfring@web.de>, 
 Bjorn Andersson <andersson@kernel.org>, 
 Mathieu Poirier <mathieu.poirier@linaro.org>, Suman Anna <s-anna@ti.com>, 
 Kees Cook <kees@kernel.org>, "Gustavo A. R. Silva" <gustavoars@kernel.org>, 
 Shuah Khan <skhan@linuxfoundation.org>, 
 Randy Dunlap <rdunlap@infradead.org>
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org, 
 linux-doc@vger.kernel.org, linux-media@vger.kernel.org, 
 linaro-mm-sig@lists.linaro.org, Tomeu Vizoso <tomeu@tomeuvizoso.net>, 
 linux-remoteproc@vger.kernel.org, linux-hardening@vger.kernel.org
X-Mailer: b4 0.15.2
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261022_234017_923676_9D8D51DD 
X-CRM114-Status: GOOD (  17.32  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

The GEM DMA mmap helper maps the whole buffer up front, but with pages
that fault on their first write, since the A53 in the J722S has no
hardware dirty-bit management. The GEM shmem helper maps by page fault,
one at each page's first touch and another at its first write, which
its write-notify needs. Neither helper can install the pages writable
and dirty, so the driver sets the protection itself: for contiguous
buffers it calls dma_mmap_pages() with it, and for the others it
installs the pages with remap_pfn_range().

This saves 20% of the total time in the first invoke of a model on the
J722S.

Assisted-by: LLM
Signed-off-by: Tomeu Vizoso <tomeu@tomeuvizoso.net>
---
 drivers/accel/thames/thames_gem.c | 76 +++++++++++++++++++++++++++++++++++++--
 1 file changed, 73 insertions(+), 3 deletions(-)

diff --git a/drivers/accel/thames/thames_gem.c b/drivers/accel/thames/thames_gem.c
index 5a4dc497768f..9f55169c6370 100644
--- a/drivers/accel/thames/thames_gem.c
+++ b/drivers/accel/thames/thames_gem.c
@@ -808,12 +808,82 @@ static void thames_gem_shmem_bo_free(struct drm_gem_object *obj)
 	drm_gem_shmem_free(&bo->shmem);
 }
 
+/*
+ * Installed dirty and writable: the A53s have no hardware dirty-bit management,
+ * so every first write would fault.
+ */
+static int thames_gem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct drm_gem_dma_object *dma_obj = to_drm_gem_dma_obj(obj);
+	pgprot_t prot;
+	int ret;
+
+	vma->vm_pgoff -= drm_vma_node_start(&obj->vma_node);
+	vm_flags_mod(vma, VM_DONTDUMP | VM_DONTEXPAND, VM_PFNMAP);
+
+	prot = vm_get_page_prot(vma->vm_flags);
+	if (vma->vm_flags & VM_WRITE)
+		prot = pte_pgprot(pte_mkdirty(pte_mkwrite_novma(pfn_pte(0, prot))));
+	vma->vm_page_prot = prot;
+
+	ret = dma_mmap_pages(drm_dev_dma_dev(obj->dev), vma, vma->vm_end - vma->vm_start,
+			     virt_to_page(dma_obj->vaddr));
+	if (ret)
+		drm_gem_vm_close(vma);
+
+	return ret;
+}
+
+/*
+ * Every page installed now, dirty and writable: they are pinned for the
+ * object's life, and the helper would take two faults on each.
+ */
+static int thames_gem_shmem_mmap(struct drm_gem_object *obj, struct vm_area_struct *vma)
+{
+	struct thames_gem_object *bo = to_thames_bo(obj);
+	unsigned long addr = vma->vm_start;
+	struct scatterlist *sg;
+	pgprot_t prot;
+	unsigned int i;
+	int ret;
+
+	if (vma_is_cow_mapping(vma))
+		return -EINVAL;
+
+	vm_flags_set(vma, VM_PFNMAP | VM_DONTEXPAND | VM_DONTDUMP);
+
+	prot = vm_get_page_prot(vma->vm_flags);
+	if (vma->vm_flags & VM_WRITE)
+		prot = pte_pgprot(pte_mkdirty(pte_mkwrite_novma(pfn_pte(0, prot))));
+	vma->vm_page_prot = prot;
+
+	for_each_sgtable_sg(bo->shmem.sgt, sg, i) {
+		unsigned long len = min_t(unsigned long, sg->length, vma->vm_end - addr);
+
+		ret = remap_pfn_range(vma, addr, page_to_pfn(sg_page(sg)), len, prot);
+		if (ret)
+			return ret;
+
+		addr += len;
+		if (addr == vma->vm_end)
+			break;
+	}
+
+	return 0;
+}
+
+/* Only the GEM reference: the pages are pinned for the object's life. */
+static const struct vm_operations_struct thames_gem_shmem_vm_ops = {
+	.open = drm_gem_vm_open,
+	.close = drm_gem_vm_close,
+};
+
 static const struct drm_gem_object_funcs thames_gem_funcs = {
 	.free = thames_gem_bo_free,
 	.print_info = drm_gem_dma_object_print_info,
 	.get_sg_table = drm_gem_dma_object_get_sg_table,
 	.vmap = drm_gem_dma_object_vmap,
-	.mmap = drm_gem_dma_object_mmap,
+	.mmap = thames_gem_mmap,
 	.vm_ops = &drm_gem_dma_vm_ops,
 };
 
@@ -825,8 +895,8 @@ static const struct drm_gem_object_funcs thames_gem_shmem_funcs = {
 	.get_sg_table = drm_gem_shmem_object_get_sg_table,
 	.vmap = drm_gem_shmem_object_vmap,
 	.vunmap = drm_gem_shmem_object_vunmap,
-	.mmap = drm_gem_shmem_object_mmap,
-	.vm_ops = &drm_gem_shmem_vm_ops,
+	.mmap = thames_gem_shmem_mmap,
+	.vm_ops = &thames_gem_shmem_vm_ops,
 };
 
 int thames_ioctl_bo_create(struct drm_device *ddev, void *data, struct drm_file *file)

-- 
2.54.0


