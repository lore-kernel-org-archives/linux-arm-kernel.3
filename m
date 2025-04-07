Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3380C3601E
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  7 Apr 2025 09:57:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zzzoSA42unHPq3blB0h8MsMPa11UOtrCu037wqmBEyY=; b=HGdQVvP9BAsYx+jQVi3Sknvq4K
	TGBA0FuM8n0Q84BkJ8SJxWiKZV+/LG0IG4qDXnm2UPdk+nOfswLUpIpuXCZJSNKCMUS8Qi+fWXKqW
	5MLxZimFiLA5b08l3cVa70qKM/DQ9jD8Y5vu+NlESCrAaLydy/k4b75AWcHGd45V/XsaSQ6NlLNIa
	2I6DHfcMn4U5hT5V0NXHutSH/25mvWt9g5abRudX0VD/AGC22mG4b4jMXb8bymO6OHol3hIHEGHIC
	IPKUdPaiipGyLwbLhmP3BUkUnVEVQoKzEc9CRt5Nv3YxyseomRPDq/Iu7LSkzTl70tcN8r2Du6Ejz
	Gk1EQwXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1jEQ-0000000HIAe-42Vb;
	Mon, 07 Apr 2025 09:57:30 +0000
Received: from mail-wm1-f74.google.com ([209.85.128.74])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1u1hpe-0000000H01O-0kfD
	for linux-arm-kernel@lists.infradead.org;
	Mon, 07 Apr 2025 08:27:51 +0000
Received: by mail-wm1-f74.google.com with SMTP id 5b1f17b1804b1-43ce245c5acso51474785e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 07 Apr 2025 01:27:49 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1744014468; x=1744619268; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=zzzoSA42unHPq3blB0h8MsMPa11UOtrCu037wqmBEyY=;
        b=yOb+4WPWhb3YQpNafXCx9x68JbJraLWLVM/mqMsTD2bpvODg56nMjC3h+cbceUi4fk
         YM7yVGpJwG+V/vT6pdVZNkhZkF+DMIFjyjEsa42d01xf7j87bV1dVdVxeNvhedUjwar2
         gr4u2cMTpt1eP9U4SYzAtveSrvPwy2dG/cVsRONwSylPrFXrTGy3gzzQoZ3GFvi+yjaD
         AFRsYyEEvIW3le+NTVB050ku3gyYVekFJYhnFBv9dbJQcMZQQ4dPxrCPYpp6nM1Fbr/K
         ppyQxvEHxVG8Ov5gAhWeDfJAf3a6PzCPVjJElQE9sNS6UEQfIOnZuFeQOtWZtOOxlIzV
         /Q8A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1744014468; x=1744619268;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=zzzoSA42unHPq3blB0h8MsMPa11UOtrCu037wqmBEyY=;
        b=cbT5oBQaIvYJftQStZ4wcmAZvyfgK6mmGtnha986xIB/u1mvIpR4pTs95fT4eufRiT
         kocSpn2VeVsI1r+Yl1igSLJ7p+2F2vZmo+MpZmgbQ/Npvn5qGWcjccLCslF9AukAccYi
         ZmYUP+uuSVRTd84ArOb/6Nmz2+O61S4o8CSP5ciL9PzQQMcyrBPsuXc5FqBacPP/nu53
         HW1sOFd505o/uJ77QX24a0aAa/NMm94w3F4GTGThgHKtgNgGxp485uR2R+WJAohBXmht
         b/QOtQJ2uYcEvl7JfRGAMWHIxkXwZFMRXXtoQUtidPl6q4uYRe6hUrdGHp4ZWCEpyr2B
         bc9Q==
X-Forwarded-Encrypted: i=1; AJvYcCU+hYKlwp/C2q1QdFnvXXm/UAThiZQRAgEHBNR9M5GPD/+xgsvBHCrzW8u93XgjHnyQ80sUSH+HK3PKU0KWusbA@lists.infradead.org
X-Gm-Message-State: AOJu0YxV5llL4NAHslirLRieBr1zTY+wDh7JDuCWwCB8rCeohlMCcJDW
	woVjevXJSOCF0IUeSCy7bTuqUEmcJQvCXDCXOWiztw8C4L97uMccch6UszFs6Tf4nNxyMY1KcTc
	yhWqqmRwAG7JChWxV5w==
X-Google-Smtp-Source: AGHT+IGnUridpgjPubam8YujaYbrltWFNlafyAl6T6J8kp+n5+9Me3rdeXELJVFMtMw+9kg5EqHn5wZkJZc7sPGe
X-Received: from wmbfl21.prod.google.com ([2002:a05:600c:b95:b0:43d:4ba5:b5d6])
 (user=vdonnefort job=prod-delivery.src-stubby-dispatcher) by
 2002:a05:600c:1f17:b0:43d:4e9:27fe with SMTP id 5b1f17b1804b1-43ed0bc77bcmr112690825e9.8.1744014467973;
 Mon, 07 Apr 2025 01:27:47 -0700 (PDT)
Date: Mon,  7 Apr 2025 09:27:06 +0100
In-Reply-To: <20250407082706.1239603-1-vdonnefort@google.com>
Mime-Version: 1.0
References: <20250407082706.1239603-1-vdonnefort@google.com>
X-Mailer: git-send-email 2.49.0.504.g3bcea36a83-goog
Message-ID: <20250407082706.1239603-10-vdonnefort@google.com>
Subject: [PATCH v3 9/9] KVM: arm64: np-guest CMOs with PMD_SIZE fixmap
From: Vincent Donnefort <vdonnefort@google.com>
To: maz@kernel.org, oliver.upton@linux.dev, joey.gouly@arm.com, 
	suzuki.poulose@arm.com, yuzenghui@huawei.com, catalin.marinas@arm.com, 
	will@kernel.org
Cc: qperret@google.com, linux-arm-kernel@lists.infradead.org, 
	kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org, kernel-team@android.com, 
	Vincent Donnefort <vdonnefort@google.com>
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250407_012750_220348_22D819A8 
X-CRM114-Status: GOOD (  18.68  )
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

With the introduction of stage-2 huge mappings in the pKVM hypervisor,
guest pages CMO is needed for PMD_SIZE size. Fixmap only supports
PAGE_SIZE and iterating over the huge-page is time consuming (mostly due
to TLBI on hyp_fixmap_unmap) which is a problem for EL2 latency.

Introduce a shared PMD_SIZE fixmap (hyp_fixblock_map/hyp_fixblock_unmap)
to improve guest page CMOs when stage-2 huge mappings are installed.

On a Pixel6, the iterative solution resulted in a latency of ~700us,
while the PMD_SIZE fixmap reduces it to ~100us.

Because of the horrendous private range allocation that would be
necessary, this is disabled for 64KiB pages systems.

Suggested-by: Quentin Perret <qperret@google.com>
Signed-off-by: Vincent Donnefort <vdonnefort@google.com>
Signed-off-by: Quentin Perret <qperret@google.com>

diff --git a/arch/arm64/include/asm/kvm_pgtable.h b/arch/arm64/include/asm/kvm_pgtable.h
index 1b43bcd2a679..2888b5d03757 100644
--- a/arch/arm64/include/asm/kvm_pgtable.h
+++ b/arch/arm64/include/asm/kvm_pgtable.h
@@ -59,6 +59,11 @@ typedef u64 kvm_pte_t;
 
 #define KVM_PHYS_INVALID		(-1ULL)
 
+#define KVM_PTE_TYPE			BIT(1)
+#define KVM_PTE_TYPE_BLOCK		0
+#define KVM_PTE_TYPE_PAGE		1
+#define KVM_PTE_TYPE_TABLE		1
+
 #define KVM_PTE_LEAF_ATTR_LO		GENMASK(11, 2)
 
 #define KVM_PTE_LEAF_ATTR_LO_S1_ATTRIDX	GENMASK(4, 2)
diff --git a/arch/arm64/kvm/hyp/include/nvhe/mm.h b/arch/arm64/kvm/hyp/include/nvhe/mm.h
index 230e4f2527de..b0c72bc2d5ba 100644
--- a/arch/arm64/kvm/hyp/include/nvhe/mm.h
+++ b/arch/arm64/kvm/hyp/include/nvhe/mm.h
@@ -13,9 +13,11 @@
 extern struct kvm_pgtable pkvm_pgtable;
 extern hyp_spinlock_t pkvm_pgd_lock;
 
-int hyp_create_pcpu_fixmap(void);
+int hyp_create_fixmap(void);
 void *hyp_fixmap_map(phys_addr_t phys);
 void hyp_fixmap_unmap(void);
+void *hyp_fixblock_map(phys_addr_t phys);
+void hyp_fixblock_unmap(void);
 
 int hyp_create_idmap(u32 hyp_va_bits);
 int hyp_map_vectors(void);
diff --git a/arch/arm64/kvm/hyp/nvhe/mem_protect.c b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
index da82d554ff88..858994f20741 100644
--- a/arch/arm64/kvm/hyp/nvhe/mem_protect.c
+++ b/arch/arm64/kvm/hyp/nvhe/mem_protect.c
@@ -220,16 +220,52 @@ static void guest_s2_put_page(void *addr)
 	hyp_put_page(&current_vm->pool, addr);
 }
 
+static void *__fixmap_guest_page(void *va, size_t *size)
+{
+	if (IS_ALIGNED(*size, PMD_SIZE)) {
+		void *addr = hyp_fixblock_map(__hyp_pa(va));
+
+		if (addr)
+			return addr;
+
+		*size = PAGE_SIZE;
+	}
+
+	if (IS_ALIGNED(*size, PAGE_SIZE))
+		return hyp_fixmap_map(__hyp_pa(va));
+
+	WARN_ON(1);
+
+	return NULL;
+}
+
+static void __fixunmap_guest_page(size_t size)
+{
+	switch (size) {
+	case PAGE_SIZE:
+		hyp_fixmap_unmap();
+		break;
+	case PMD_SIZE:
+		hyp_fixblock_unmap();
+		break;
+	default:
+		WARN_ON(1);
+	}
+}
+
 static void clean_dcache_guest_page(void *va, size_t size)
 {
 	WARN_ON(!PAGE_ALIGNED(size));
 
 	while (size) {
-		__clean_dcache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
-					  PAGE_SIZE);
-		hyp_fixmap_unmap();
-		va += PAGE_SIZE;
-		size -= PAGE_SIZE;
+		size_t fixmap_size = size == PMD_SIZE ? size : PAGE_SIZE;
+		void *addr = __fixmap_guest_page(va, &fixmap_size);
+
+		__clean_dcache_guest_page(addr, fixmap_size);
+		__fixunmap_guest_page(fixmap_size);
+
+		size -= fixmap_size;
+		va += fixmap_size;
 	}
 }
 
@@ -238,11 +274,14 @@ static void invalidate_icache_guest_page(void *va, size_t size)
 	WARN_ON(!PAGE_ALIGNED(size));
 
 	while (size) {
-		__invalidate_icache_guest_page(hyp_fixmap_map(__hyp_pa(va)),
-					       PAGE_SIZE);
-		hyp_fixmap_unmap();
-		va += PAGE_SIZE;
-		size -= PAGE_SIZE;
+		size_t fixmap_size = size == PMD_SIZE ? size : PAGE_SIZE;
+		void *addr = __fixmap_guest_page(va, &fixmap_size);
+
+		__invalidate_icache_guest_page(addr, fixmap_size);
+		__fixunmap_guest_page(fixmap_size);
+
+		size -= fixmap_size;
+		va += fixmap_size;
 	}
 }
 
diff --git a/arch/arm64/kvm/hyp/nvhe/mm.c b/arch/arm64/kvm/hyp/nvhe/mm.c
index f41c7440b34b..e3b1bece8504 100644
--- a/arch/arm64/kvm/hyp/nvhe/mm.c
+++ b/arch/arm64/kvm/hyp/nvhe/mm.c
@@ -229,9 +229,8 @@ int hyp_map_vectors(void)
 	return 0;
 }
 
-void *hyp_fixmap_map(phys_addr_t phys)
+static void *fixmap_map_slot(struct hyp_fixmap_slot *slot, phys_addr_t phys)
 {
-	struct hyp_fixmap_slot *slot = this_cpu_ptr(&fixmap_slots);
 	kvm_pte_t pte, *ptep = slot->ptep;
 
 	pte = *ptep;
@@ -243,10 +242,21 @@ void *hyp_fixmap_map(phys_addr_t phys)
 	return (void *)slot->addr;
 }
 
+void *hyp_fixmap_map(phys_addr_t phys)
+{
+	return fixmap_map_slot(this_cpu_ptr(&fixmap_slots), phys);
+}
+
 static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
 {
 	kvm_pte_t *ptep = slot->ptep;
 	u64 addr = slot->addr;
+	u32 level;
+
+	if (FIELD_GET(KVM_PTE_TYPE, *ptep) == KVM_PTE_TYPE_PAGE)
+		level = KVM_PGTABLE_LAST_LEVEL;
+	else
+		level = KVM_PGTABLE_LAST_LEVEL - 1; /* create_fixblock() guarantees PMD level */
 
 	WRITE_ONCE(*ptep, *ptep & ~KVM_PTE_VALID);
 
@@ -260,7 +270,7 @@ static void fixmap_clear_slot(struct hyp_fixmap_slot *slot)
 	 * https://lore.kernel.org/kvm/20221017115209.2099-1-will@kernel.org/T/#mf10dfbaf1eaef9274c581b81c53758918c1d0f03
 	 */
 	dsb(ishst);
-	__tlbi_level(vale2is, __TLBI_VADDR(addr, 0), KVM_PGTABLE_LAST_LEVEL);
+	__tlbi_level(vale2is, __TLBI_VADDR(addr, 0), level);
 	dsb(ish);
 	isb();
 }
@@ -273,9 +283,9 @@ void hyp_fixmap_unmap(void)
 static int __create_fixmap_slot_cb(const struct kvm_pgtable_visit_ctx *ctx,
 				   enum kvm_pgtable_walk_flags visit)
 {
-	struct hyp_fixmap_slot *slot = per_cpu_ptr(&fixmap_slots, (u64)ctx->arg);
+	struct hyp_fixmap_slot *slot = (struct hyp_fixmap_slot *)ctx->arg;
 
-	if (!kvm_pte_valid(ctx->old) || ctx->level != KVM_PGTABLE_LAST_LEVEL)
+	if (!kvm_pte_valid(ctx->old) || (ctx->end - ctx->start) != kvm_granule_size(ctx->level))
 		return -EINVAL;
 
 	slot->addr = ctx->addr;
@@ -296,13 +306,73 @@ static int create_fixmap_slot(u64 addr, u64 cpu)
 	struct kvm_pgtable_walker walker = {
 		.cb	= __create_fixmap_slot_cb,
 		.flags	= KVM_PGTABLE_WALK_LEAF,
-		.arg = (void *)cpu,
+		.arg = (void *)per_cpu_ptr(&fixmap_slots, cpu),
 	};
 
 	return kvm_pgtable_walk(&pkvm_pgtable, addr, PAGE_SIZE, &walker);
 }
 
-int hyp_create_pcpu_fixmap(void)
+#ifndef CONFIG_ARM64_64K_PAGES
+static struct hyp_fixmap_slot hyp_fixblock_slot;
+static DEFINE_HYP_SPINLOCK(hyp_fixblock_lock);
+
+void *hyp_fixblock_map(phys_addr_t phys)
+{
+	hyp_spin_lock(&hyp_fixblock_lock);
+	return fixmap_map_slot(&hyp_fixblock_slot, phys);
+}
+
+void hyp_fixblock_unmap(void)
+{
+	fixmap_clear_slot(&hyp_fixblock_slot);
+	hyp_spin_unlock(&hyp_fixblock_lock);
+}
+
+static int create_fixblock(void)
+{
+	struct kvm_pgtable_walker walker = {
+		.cb	= __create_fixmap_slot_cb,
+		.flags	= KVM_PGTABLE_WALK_LEAF,
+		.arg = (void *)&hyp_fixblock_slot,
+	};
+	unsigned long addr;
+	phys_addr_t phys;
+	int ret, i;
+
+	/* Find a RAM phys address, PMD aligned */
+	for (i = 0; i < hyp_memblock_nr; i++) {
+		phys = ALIGN(hyp_memory[i].base, PMD_SIZE);
+		if (phys + PMD_SIZE < (hyp_memory[i].base + hyp_memory[i].size))
+			break;
+	}
+
+	if (i >= hyp_memblock_nr)
+		return -EINVAL;
+
+	hyp_spin_lock(&pkvm_pgd_lock);
+	addr = ALIGN(__io_map_base, PMD_SIZE);
+	ret = __pkvm_alloc_private_va_range(addr, PMD_SIZE);
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_hyp_map(&pkvm_pgtable, addr, PMD_SIZE, phys, PAGE_HYP);
+	if (ret)
+		goto unlock;
+
+	ret = kvm_pgtable_walk(&pkvm_pgtable, addr, PMD_SIZE, &walker);
+
+unlock:
+	hyp_spin_unlock(&pkvm_pgd_lock);
+
+	return ret;
+}
+#else
+void hyp_fixblock_unmap(void) { WARN_ON(1); }
+void *hyp_fixblock_map(phys_addr_t phys) { return NULL; }
+static int create_fixblock(void) { return 0; }
+#endif
+
+int hyp_create_fixmap(void)
 {
 	unsigned long addr, i;
 	int ret;
@@ -322,7 +392,7 @@ int hyp_create_pcpu_fixmap(void)
 			return ret;
 	}
 
-	return 0;
+	return create_fixblock();
 }
 
 int hyp_create_idmap(u32 hyp_va_bits)
diff --git a/arch/arm64/kvm/hyp/nvhe/setup.c b/arch/arm64/kvm/hyp/nvhe/setup.c
index d62bcb5634a2..fb69cf5e6ea8 100644
--- a/arch/arm64/kvm/hyp/nvhe/setup.c
+++ b/arch/arm64/kvm/hyp/nvhe/setup.c
@@ -295,7 +295,7 @@ void __noreturn __pkvm_init_finalise(void)
 	if (ret)
 		goto out;
 
-	ret = hyp_create_pcpu_fixmap();
+	ret = hyp_create_fixmap();
 	if (ret)
 		goto out;
 
diff --git a/arch/arm64/kvm/hyp/pgtable.c b/arch/arm64/kvm/hyp/pgtable.c
index df5cc74a7dd0..c351b4abd5db 100644
--- a/arch/arm64/kvm/hyp/pgtable.c
+++ b/arch/arm64/kvm/hyp/pgtable.c
@@ -11,12 +11,6 @@
 #include <asm/kvm_pgtable.h>
 #include <asm/stage2_pgtable.h>
 
-
-#define KVM_PTE_TYPE			BIT(1)
-#define KVM_PTE_TYPE_BLOCK		0
-#define KVM_PTE_TYPE_PAGE		1
-#define KVM_PTE_TYPE_TABLE		1
-
 struct kvm_pgtable_walk_data {
 	struct kvm_pgtable_walker	*walker;
 
-- 
2.49.0.504.g3bcea36a83-goog


