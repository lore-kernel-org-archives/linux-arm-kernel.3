Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84580CD37AC
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 13 May 2026 21:52:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VmY5S5fM8AoCCFdXEvoltLd2gDk1b3FPoGY3dWz/ZhU=; b=y5TmfL9cuX7UqM0BhOhsyBSwr9
	9WMshcO+12oTz9Qf6FZQrWQC6v6Y84skLQFRLtYgeFuCeVv1xcmIoutZMdhTERjq3UOqbuc1bRzRx
	yFVJcyYkdRY2anPDfZanFJ25YC+IDk/qk92XPiayRsqff33F+dG4Um0kM3BP9oLdv9miU8Yv+7bhY
	GqSyGvjE+4ktgouR7dIVSC21jvy+pRoV0WfEvvDgHQH47Ezp23x18nBd2HUpcVuCaqr55JAAkT4Cf
	SBsZ/WwD2k/EKBV6NnErFr4JmG1EnU16HmzNA+Er/0K151gS8UoU+KB6UeZNr3E9mSsJMY90A2HeH
	3WNLRiuw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHVd-00000003rpA-29uk;
	Wed, 13 May 2026 21:52:53 +0000
Received: from mail-ed1-x549.google.com ([2a00:1450:4864:20::549])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wNHVa-00000003rnU-0xiu
	for linux-arm-kernel@lists.infradead.org;
	Wed, 13 May 2026 21:52:51 +0000
Received: by mail-ed1-x549.google.com with SMTP id 4fb4d7f45d1cf-678ad5bfc8cso7147262a12.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 13 May 2026 14:52:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778709168; x=1779313968; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=VmY5S5fM8AoCCFdXEvoltLd2gDk1b3FPoGY3dWz/ZhU=;
        b=kH1RCuFc5KvisC69KhOlu+xLxYubqfISUJWfjOLNYaTWdw5gzCCwIO84W6or3UskAh
         XPUGrDqPTsfHx8lGGEhdyMKAdTTCVrNF0kjilootqyAS7lDjk+liT/rHDPY/lAtwHHgb
         h0K39b30B55PpRj1147suRycb2w85IeWMx/oKnjgyXxpYyh6yP76pqZyytztLSGqsdQB
         UNHgUBJ0UkTbI1aEVezcvMUNwitkMU8ObhSD+VijSRGwNyW2KD68mI7PEGutXESJOJsP
         SS0qVE6UROujg/urtGyd10gwMJKHUviasgV/KxmwjXQukYZRfrLmkZR/xq5egju/6cb1
         0Ryw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778709168; x=1779313968;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=VmY5S5fM8AoCCFdXEvoltLd2gDk1b3FPoGY3dWz/ZhU=;
        b=nmoh19KtgQZT5gCUlS4zb5We0of5nYhfThn7aCqKeWvtlcpsCUg8V5StQFP+PPRSnK
         NITUUSOOU2t5lzdaHrGLI+Q2Owlu2eiqY8Gp6oli2PmQqlsR9X8vZR0rC5QEsULUxtLQ
         0C9b/IeH7hrVj12Su5Ve83ntblIUhPzO4cO2aSj4drIBHVdC8UwVV8KfBoKbNdgxwiKx
         V8Bscic4NvVBAp75oj9QNSAMOmZmOpR4ewkJCH9/qGXO5IXLmxoWnDiny3ZcyVIYCzdr
         3uYdNYZFuLGyxQouADmiNSJ4xfW5M5F8p3K4eM1WrmWb1BVF4X4GX2ECpTo9tBnTBb0R
         1irQ==
X-Forwarded-Encrypted: i=1; AFNElJ+DwdzzdGVkOt/NffZ30Ij2XQJirne5pPtskDTDACvOqdgLRe9tp6OfyipJIYRXPF7Y/OfCCSMpPzqspaFFKRI6@lists.infradead.org
X-Gm-Message-State: AOJu0Yxssbzpxq8czNtQTXu3jujKiJu4PD3A3C64la9zRq5Yin3QdqvL
	aH8aDZOM6NTPSU3JAlBuTDi8OM6R0yOwfabU992n3TrTbJ+amEgzCeF22ji+61X9ED6OOsYHRuI
	CSN84rrMNaD28jw==
X-Received: from edbel4.prod.google.com ([2002:a05:6402:3604:b0:67c:d93d:89cd])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:8cb:b0:66d:d2f9:520c with SMTP id 4fb4d7f45d1cf-68256d5afa3mr2319843a12.19.1778709167343;
 Wed, 13 May 2026 14:52:47 -0700 (PDT)
Date: Wed, 13 May 2026 21:52:02 +0000
In-Reply-To: <20260513215203.3852661-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260513215203.3852661-1-smostafa@google.com>
X-Mailer: git-send-email 2.54.0.563.g4f69b47b94-goog
Message-ID: <20260513215203.3852661-3-smostafa@google.com>
Subject: [PATCH 2/3] iommu/io-pgtable-arm: Rework to use the iommu-pages API
From: Mostafa Saleh <smostafa@google.com>
To: iommu@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Cc: robin.murphy@arm.com, will@kernel.org, joro@8bytes.org, jgg@ziepe.ca, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260513_145250_291099_9F83836F 
X-CRM114-Status: GOOD (  17.00  )
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

Update the io-pgtable-arm allocator to use the iommu-pages API.

Replace the DMA API usage from __arm_lpae_alloc_pages() with
iommu_pages_start_incoherent() and from __arm_lpae_free_pages() with
iommu_pages_free_incoherent().

Since the iommu-pages API relies on metadata stored in the struct page
during iommu_alloc_pages_node_sz(), it cannot be used safely with memory
allocated via the custom cfg->alloc (which may not be backed by pages).
So, isolate that logic and keep it as it.

Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 drivers/iommu/io-pgtable-arm.c | 79 ++++++++++++++++++++++++----------
 1 file changed, 56 insertions(+), 23 deletions(-)

diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 0cbe545c491d..86b23aa04324 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -248,24 +248,15 @@ static dma_addr_t __arm_lpae_dma_addr(void *pages)
 	return (dma_addr_t)virt_to_phys(pages);
 }
 
-static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
-				    struct io_pgtable_cfg *cfg,
-				    void *cookie)
+static void *__arm_lpae_cfg_alloc(size_t size, gfp_t gfp,
+				  struct io_pgtable_cfg *cfg,
+				  void *cookie)
 {
 	struct device *dev = cfg->iommu_dev;
 	dma_addr_t dma;
 	void *pages;
 
-	/*
-	 * For very small starting-level translation tables the HW requires a
-	 * minimum alignment of at least 64 to cover all cases.
-	 */
-	size = max(size, 64);
-	if (cfg->alloc)
-		pages = cfg->alloc(cookie, size, gfp);
-	else
-		pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
-
+	pages = cfg->alloc(cookie, size, gfp);
 	if (!pages)
 		return NULL;
 
@@ -289,14 +280,55 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 	dma_unmap_single(dev, dma, size, DMA_TO_DEVICE);
 
 out_free:
-	if (cfg->free)
-		cfg->free(cookie, pages, size);
-	else
-		iommu_free_pages(pages);
-
+	cfg->free(cookie, pages, size);
 	return NULL;
 }
 
+static void __arm_lpae_cfg_free(void *pages, size_t size,
+				struct io_pgtable_cfg *cfg,
+				void *cookie)
+{
+	if (!cfg->coherent_walk)
+		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
+				 size, DMA_TO_DEVICE);
+
+	cfg->free(cookie, pages, size);
+}
+
+static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
+				    struct io_pgtable_cfg *cfg,
+				    void *cookie)
+{
+	struct device *dev = cfg->iommu_dev;
+	void *pages;
+
+	/*
+	 * For very small starting-level translation tables the HW requires a
+	 * minimum alignment of at least 64 to cover all cases.
+	 */
+	size = max(size, 64);
+
+	if (cfg->alloc)
+		return __arm_lpae_cfg_alloc(size, gfp, cfg, cookie);
+
+	pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
+	if (!pages)
+		return NULL;
+
+	if (!cfg->coherent_walk) {
+		int ret = iommu_pages_start_incoherent(pages, dev);
+
+		if (ret) {
+			if (ret == -EOPNOTSUPP)
+				dev_err(dev, "Cannot accommodate DMA translation for IOMMU page tables\n");
+			iommu_free_pages(pages);
+			return NULL;
+		}
+	}
+
+	return pages;
+}
+
 static void __arm_lpae_free_pages(void *pages, size_t size,
 				  struct io_pgtable_cfg *cfg,
 				  void *cookie)
@@ -304,12 +336,13 @@ static void __arm_lpae_free_pages(void *pages, size_t size,
 	/* See __arm_lpae_alloc_pages(). */
 	size = max(size, 64);
 
-	if (!cfg->coherent_walk)
-		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
-				 size, DMA_TO_DEVICE);
+	if (cfg->free) {
+		__arm_lpae_cfg_free(pages, size, cfg, cookie);
+		return;
+	}
 
-	if (cfg->free)
-		cfg->free(cookie, pages, size);
+	if (!cfg->coherent_walk)
+		iommu_pages_free_incoherent(pages, cfg->iommu_dev);
 	else
 		iommu_free_pages(pages);
 }
-- 
2.54.0.563.g4f69b47b94-goog


