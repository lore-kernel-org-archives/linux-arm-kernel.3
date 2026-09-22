Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69CD5C98307
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 13:14:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0Rl6CILqO70QDksOqY0Bp+kvCcZlw9/1DWfpX87Gkto=; b=jcku45EqtaqWN8QzG2RFoWzFPx
	WdRI4t1GmgCw3XPeBdj6ISPZmQV42drWKqpOtFxG+4VR6sT9yskOEBgyAGfb5i0+6uTg6S4ZoyUfP
	uI0TbtGfxJB51iOOjINT9Nvp/m1AE/n3FtyByctxHVYQG42jK+bO0hi2/cViSbxsurepHMts1YYNS
	vOqmMP8AD9UdZncYmizuWjNhnVhxmeSY44ZPbSMGCCgwd0wz12ZXAaxZ8QfG4ov0+VfTEpTGTiv8t
	KhCGzHnGFvmW7LBDwUtBAp2LVUNe/CWbrxTyQQwDkwPes4ysf9aPwr8hvrkjb71q0XV/8NnZviney
	QZ6/vzHg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90Jj-00000005Sjh-1Bn2;
	Tue, 22 Sep 2026 13:13:51 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x90JR-00000005SSQ-4010
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 22 Sep 2026 13:13:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Cc:To:From:Subject:
	Message-ID:References:Mime-Version:In-Reply-To:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=0Rl6CILqO70QDksOqY0Bp+kvCcZlw9/1DWfpX87Gkto=; b=NPumjXtcoMgTRt74jlMP/2cMy3
	zGxMZR35ZEZbbxImbH41J+wxwTJCHjSuP35K8omEXQwyH3q02mzIJAPU+p35dYxx3gDDkSOxzdOaN
	JFBDvB8iqlzfOjc7YBlZfRNhxFCV7NjY3/uc2Cm3fqC9/lo5wjtZm3v1NQeItI0NfXEvyY9QKUwtQ
	0DkrJdE9xq7BtPagbPhOJlWGjh1wyP7zULpRRS/U+x3JDP7RLpcRNgRs/skpM4P06IdjewA4Nts4C
	HBafGKiC61P3Mpn9lWROFSil20PxA+oRqYZA5Lzp410y+xY7AQ9som2rdfh7mPP02Wkm6nDD8Kz4D
	JfcEhzag==;
Received: from mail-ed1-x546.google.com ([2a00:1450:4864:20::546])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x90JO-0000000DbfY-1M6d
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 13:13:32 +0000
Received: by mail-ed1-x546.google.com with SMTP id 4fb4d7f45d1cf-6a98e5d6e49so5757013a12.3
        for <linux-arm-kernel@lists.infradead.org>; Tue, 22 Sep 2026 06:13:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1790082808; x=1790687608; darn=lists.infradead.org;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=0Rl6CILqO70QDksOqY0Bp+kvCcZlw9/1DWfpX87Gkto=;
        b=LWpJzMf2QkiW6nfcruqp6I8CbFeKfOe0w0wAoauZNVTz9aOa+lnLmOWQ+SP19g1tRS
         baLAlfk9BCo6sTx5tiL3K1s1ogOpfS64cafCsPpzXK8sJH37Q8H9B8xdpqn/EKEMVb9F
         U0B+ea7RIs5jpb0hRhsddkvI4fo1G0uepIewoSZxg6cA2FTBLF6E5tb8nH9Wfw77jNcc
         3XCGsAwZbrSXFa29QY1YmVZlDEMnED0x3SnQvwy7fuTS7Tvn3B9RwZpd8jirbesudyal
         0c4lEVZh1sKjIqg6jkvvtEBw+i9w6lDcZ02rCta1+ipSoqOxtUA45Jqq0i8EZZAQsqO9
         Jm+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790082808; x=1790687608;
        h=content-type:cc:to:from:subject:message-id:references:mime-version
         :in-reply-to:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=0Rl6CILqO70QDksOqY0Bp+kvCcZlw9/1DWfpX87Gkto=;
        b=PUH8GQRdauH4a+gguxrJzhW1Naf4Bt1sp1qrGhR5ep5iLdjBET/Gqqu3gcqAsSGi6F
         Cq4qF2CSL9fxFYoZnb6fkSD+0G74XrqiuFwsh2lCFtTu+H/J4vKo1+AyN0XIA4Hr0FCL
         YXhHAnhxGFwaKxOErmbm1U9rX9c7XCBbeM9Md6MUxIAMc6gFaR3gm25ZSMNyUyYY/gpS
         m7SqEiCXzzf/cQjTLu2BPR4WYcl4AKV4m3mGO4+kmKIkD8hLfEwY37uaHGZO5JlujtQS
         bjIBfgCpRD60tvxqP2Sl3Ub1rYlUB9tJ3n0FObS6NUeOG+qQx8HUujYozn2zuSx6ruMk
         yeIA==
X-Gm-Message-State: AFuF++ld10QhoAQ4ZlSmXLJCyu0Xl1azRoGSYlb9W/yn1WC3Z+gNFD0I
	kP5OnLweW0lUtNT8WSNE/OrUZKt3q5uf5i6x2VDWreZ+B7eH/enS3PMvQdeR1EGr3RRgjt0wgi2
	+K7mQuBw/x1R/A/Cmn8ZAQK0KKU+D7hQJsIa5koqZWFnTSNZKfC8KRKrCkdvdCAk5PMCHWg0IgX
	JF4C0TCb4OXQvDqn3tptMePgRKIekIWkUkQAizd9vVYW6N9c/L6B30e7G5kqD5aTj1lw==
X-Received: from edyg23.prod.google.com ([2002:a05:6402:1817:b0:6a7:4541:3de3])
 (user=smostafa job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:6402:400e:b0:6aa:ad13:40bc with SMTP id 4fb4d7f45d1cf-6aaad1345f1mr269989a12.37.1790082808295;
 Tue, 22 Sep 2026 06:13:28 -0700 (PDT)
Date: Tue, 22 Sep 2026 13:12:54 +0000
In-Reply-To: <20260922131259.2975334-1-smostafa@google.com>
Mime-Version: 1.0
References: <20260922131259.2975334-1-smostafa@google.com>
X-Mailer: git-send-email 2.55.0.1082.g2b9226bbc0-goog
Message-ID: <20260922131259.2975334-22-smostafa@google.com>
Subject: [PATCH v8 21/25] iommu/io-pgtable-arm: Support io-pgtable-arm in the hypervisor
From: Mostafa Saleh <smostafa@google.com>
To: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
	kvmarm@lists.linux.dev, iommu@lists.linux.dev
Cc: catalin.marinas@arm.com, will@kernel.org, maz@kernel.org, 
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com, 
	yuzenghui@huawei.com, joro@8bytes.org, jgg@ziepe.ca, mark.rutland@arm.com, 
	qperret@google.com, tabba@google.com, vdonnefort@google.com, 
	sebastianene@google.com, keirf@google.com, 
	Mostafa Saleh <smostafa@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260922_141330_494039_E5E42E12 
X-CRM114-Status: GOOD (  20.20  )
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

To be able to populate the shadow stage-2 in the hypervisor, compile
io-pgtable-arm object for the hypervisor.

That requires the hypervisor to provide the iommu-pages allocator,
redefine the address conversion helpers, and stub out the DMA API.

Signed-off-by: Mostafa Saleh <smostafa@google.com>
---
 arch/arm64/kvm/hyp/nvhe/Makefile              |  3 +-
 .../arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h | 86 +++++++++++++++++++
 drivers/iommu/io-pgtable-arm.c                | 14 +--
 drivers/iommu/io-pgtable-arm.h                |  9 ++
 4 files changed, 104 insertions(+), 8 deletions(-)
 create mode 100644 drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h

diff --git a/arch/arm64/kvm/hyp/nvhe/Makefile b/arch/arm64/kvm/hyp/nvhe/Makefile
index aa76c0f3f147..64bfd9992d9e 100644
--- a/arch/arm64/kvm/hyp/nvhe/Makefile
+++ b/arch/arm64/kvm/hyp/nvhe/Makefile
@@ -36,7 +36,8 @@ hyp-obj-y += $(lib-objs)
 HYP_SMMU_V3_DRV_PATH = ../../../../../drivers/iommu/arm/arm-smmu-v3
 
 hyp-obj-$(CONFIG_ARM_SMMU_V3_PKVM) += $(HYP_SMMU_V3_DRV_PATH)/pkvm/arm-smmu-v3.o \
-	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o
+	$(HYP_SMMU_V3_DRV_PATH)/arm-smmu-v3-common-lib.o ../../../../../lib/hweight.o \
+	$(HYP_SMMU_V3_DRV_PATH)/../../io-pgtable-arm.o
 
 # Path to simple_ring_buffer.c
 CFLAGS_trace.nvhe.o += -I$(srctree)/kernel/trace/
diff --git a/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h
new file mode 100644
index 000000000000..16313814e5f8
--- /dev/null
+++ b/drivers/iommu/arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h
@@ -0,0 +1,86 @@
+/* SPDX-License-Identifier: GPL-2.0-only */
+#ifndef IO_PGTABLE_ARM_HYP_H_
+#define IO_PGTABLE_ARM_HYP_H_
+
+#include <nvhe/memory.h>
+#include <nvhe/iommu.h>
+
+#undef WARN_ONCE
+#define WARN_ONCE(condition, format...) WARN_ON(condition)
+
+static inline void *iommu_alloc_pages_node_sz(int nid, gfp_t gfp, size_t size)
+{
+	return pkvm_iommu_alloc_pages(get_order(size));
+}
+
+static inline void iommu_free_pages(void *virt)
+{
+	pkvm_iommu_free_pages(virt);
+}
+
+#define arm_lpae_alloc_data(type)	pkvm_iommu_alloc_pages(get_order(sizeof(type)))
+#define arm_lpae_free_data(p)		pkvm_iommu_free_pages(p)
+
+#undef phys_to_virt
+#define phys_to_virt(x)		hyp_phys_to_virt(x)
+
+#undef virt_to_phys
+#define virt_to_phys(x)		hyp_virt_to_phys(x)
+
+/* Stubs used by io-pgtable-arm but no relevant for hypervisor object. */
+#undef dma_map_single
+#define dma_map_single(d, p, s, dir) (virt_to_phys(p))
+
+#undef dma_unmap_single
+#define dma_unmap_single(d, a, s, r) \
+	do { (void)(d); (void)(a); (void)(s); (void)(r); } while (0)
+
+#define dma_sync_single_for_device(d, a, s, r) \
+	do { (void)(d); (void)(a); (void)(s); (void)(r); } while (0)
+
+#undef dma_mapping_error
+#define dma_mapping_error(...) (0)
+
+#undef dev_err
+#define dev_err(dev, format, ...)
+
+#undef iommu_dirty_bitmap_record
+#define iommu_dirty_bitmap_record(d, i, l) \
+	do { (void)(d); (void)(i); (void)(l); } while (0)
+
+static inline int iommu_pages_start_incoherent(void *virt, struct device *dma_dev)
+{
+	return 0;
+}
+
+static inline void iommu_pages_free_incoherent(void *virt,
+					       struct device *dma_dev)
+{
+}
+
+static inline void iommu_pages_flush_incoherent(struct device *dma_dev,
+						void *virt, size_t offset,
+						size_t len)
+{
+}
+
+static inline struct io_pgtable_ops *kvm_alloc_io_pgtable_ops(enum io_pgtable_fmt fmt,
+							      struct io_pgtable_cfg *cfg,
+							      void *cookie)
+{
+	struct io_pgtable *iop;
+
+	if (fmt != ARM_64_LPAE_S2)
+		return NULL;
+
+	iop = io_pgtable_arm_64_lpae_s2_init_fns.alloc(cfg, cookie);
+	if (!iop)
+		return NULL;
+
+	iop->fmt	= fmt;
+	iop->cookie	= cookie;
+	iop->cfg	= *cfg;
+
+	return &iop->ops;
+}
+#endif /* IO_PGTABLE_ARM_HYP_H_ */
diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
index 476c0e25631a..6b2668c2ef44 100644
--- a/drivers/iommu/io-pgtable-arm.c
+++ b/drivers/iommu/io-pgtable-arm.c
@@ -20,7 +20,6 @@
 #include <asm/barrier.h>
 
 #include "io-pgtable-arm.h"
-#include "iommu-pages.h"
 
 #define ARM_LPAE_MAX_ADDR_BITS		52
 #define ARM_LPAE_S2_MAX_CONCAT_PAGES	16
@@ -301,6 +300,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 {
 	struct device *dev = cfg->iommu_dev;
 	void *pages;
+	int nid = dev ? dev_to_node(dev) : NUMA_NO_NODE;
 
 	/*
 	 * For very small starting-level translation tables the HW requires a
@@ -311,7 +311,7 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
 	if (cfg->alloc)
 		return __arm_lpae_cfg_alloc(size, gfp, cfg, cookie);
 
-	pages = iommu_alloc_pages_node_sz(dev_to_node(dev), gfp, size);
+	pages = iommu_alloc_pages_node_sz(nid, gfp, size);
 	if (!pages)
 		return NULL;
 
@@ -650,7 +650,7 @@ static void arm_lpae_free_pgtable(struct io_pgtable *iop)
 	struct arm_lpae_io_pgtable *data = io_pgtable_to_data(iop);
 
 	__arm_lpae_free_pgtable(data, data->start_level, data->pgd);
-	kfree(data);
+	arm_lpae_free_data(data);
 }
 
 static size_t __arm_lpae_unmap(struct arm_lpae_io_pgtable *data,
@@ -964,7 +964,7 @@ arm_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg)
 	if (cfg->oas > ARM_LPAE_MAX_ADDR_BITS)
 		return NULL;
 
-	data = kmalloc_obj(*data);
+	data = arm_lpae_alloc_data(*data);
 	if (!data)
 		return NULL;
 
@@ -1091,7 +1091,7 @@ arm_64_lpae_alloc_pgtable_s1(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
@@ -1187,7 +1187,7 @@ arm_64_lpae_alloc_pgtable_s2(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
@@ -1266,7 +1266,7 @@ arm_mali_lpae_alloc_pgtable(struct io_pgtable_cfg *cfg, void *cookie)
 	return &data->iop;
 
 out_free_data:
-	kfree(data);
+	arm_lpae_free_data(data);
 	return NULL;
 }
 
diff --git a/drivers/iommu/io-pgtable-arm.h b/drivers/iommu/io-pgtable-arm.h
index ba7cfdf7afa0..ca765aea8745 100644
--- a/drivers/iommu/io-pgtable-arm.h
+++ b/drivers/iommu/io-pgtable-arm.h
@@ -27,4 +27,13 @@
 #define ARM_LPAE_TCR_PS_48_BIT		0x5ULL
 #define ARM_LPAE_TCR_PS_52_BIT		0x6ULL
 
+#ifndef __KVM_NVHE_HYPERVISOR__
+#include "iommu-pages.h"
+#define arm_lpae_alloc_data(type)	kmalloc_obj(type)
+#define arm_lpae_free_data(p)		kfree(p)
+
+#else
+#include "arm/arm-smmu-v3/pkvm/io-pgtable-arm-hyp.h"
+#endif
+
 #endif /* IO_PGTABLE_ARM_H_ */
-- 
2.55.0.1082.g2b9226bbc0-goog


