Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B220C02180
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jan 2025 03:43:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gFMoOwSJpv8P/wz3qgwCAFHIUmnEPnRJywSyGSBHca8=; b=oOjNS1Vxn/t5MtzSzIdDuHyXQC
	G8Q9TP59ZD7wpzFfITre90tPoOIWmGi4CWxNW7L5dm+9nicg+jaCYWJ1qAI9Me5AspEpYReLjs5rd
	TVOBlMMO2JuVzPuAjgtkPVRR78YitaurY3++dSzEfLdq9x7d50BxWD1o+Ge8vyM1X9Vl7EctDceIe
	kAix4oW6f49kZ2vhSdzI5Qs5fCR6G3g5yzB8ZB1mc+8joN+FfF6llnEwsEkwTpDPUK+apxnFd4uOP
	SKku3K7m4tXkjpxJcGAn81wseENm6VEC+Ez5P+9bxiip6MDnhhZrYgNcw+en6UHk5h6fL4/SBKVyR
	3mkiaS2w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuJl-0000000AXda-0LP8;
	Wed, 15 Jan 2025 03:43:45 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXuEw-0000000AWh4-0b2m;
	Wed, 15 Jan 2025 03:38:47 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-216281bc30fso132727605ad.0;
        Tue, 14 Jan 2025 19:38:45 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736912325; x=1737517125; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=gFMoOwSJpv8P/wz3qgwCAFHIUmnEPnRJywSyGSBHca8=;
        b=SjdlBJ07WFbC1uFFac/tV2wm7UsFQijuPdPqM/lDKcoSJ34ROWgnPOF8Go7YCN4vB7
         3a2KIf7OjAvliD/TOTFaK7AkmaEUgY+tcVamvU8cWUUanckIdjxo0XMp/KbB5UrzibEw
         uZKsoOZq3S/3dL+6pLqx22BhZ+l73OGW3j/KEWeDypXatTX9wadfUw3DC5DyRNsCEfPf
         2PxolzKve6lQ1VFjOaTCQgtfdBaQxSBD3nHrS/Hl5urwRTXM67cqqXMDxcIzSfwGBOjw
         PkdmpiCDd+zfQVVesmcaZI5WO0bzcV44nyLsOCSstMYU6dTjWup5U7XfTLzo2VYXc1Lg
         /zsw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736912325; x=1737517125;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=gFMoOwSJpv8P/wz3qgwCAFHIUmnEPnRJywSyGSBHca8=;
        b=Qu3x+AQkG0IMeRssLc75kazpKKJ+ZM2gU5G9rwB82/QMPQZY2kq1mA2K1HJyc8I8yZ
         nGiLgvGPmZsENhNTEXM+MW6SVLpv7y24cKAU3cGtcG8PSr1C0A0TVNzM0V1EvhQh4jIF
         gInbfnC5v+BaqiEm611+1AtU2XBh1IS/PcZ9j7pKU2+r3WkDmrWbA0yZ66rMh3M6uBt2
         Y6SonCU1cqxi0Oten2W6KpXeJo1mW9a/2bE3FP/TY7LyP84dW2PGqLVy50haUX2meYL8
         ZmNRBxB+8/IIG1ERVRPWb1tjUt8uAYhPv2pMer8pubL7zxXO5mrqArHILITXW/ebUx6I
         K4iA==
X-Forwarded-Encrypted: i=1; AJvYcCX11bN70EkI55P2sFbCD/HXn6730pDck7e1uHAA8nbib6sb6BCswSBVvYaIjAmZkdPuceHB8fWcWIdB8Rwz3iqW@lists.infradead.org, AJvYcCXMtcnHE9bLpJK1HIIwFIcur4xGgVrOB9NV0oIg6dysmpKczqpLHeQM6ZRtJpZA8fAQ2hhg1ujSrOnoj3w=@lists.infradead.org
X-Gm-Message-State: AOJu0YzPzSOrvDkgGSvsOS3McwKr1oqCP65Tuuc93/er42ENfS3/+Kzc
	JTqsHuj7ZtDdUEHE152EJpJ5TinHb4Uw8ewoCILG7Kf2UXxnnHnt
X-Gm-Gg: ASbGncu7L8tChxBzDHdtq1pxlygBFQVngObl0gUNsZPFe317XV32HUuqXUtunMqW1ei
	d3u15Ynp3TMihWjtAZKjjdOPfrLsBnhZ7IzWiJSYTSoYBPc/ND3FtVcCu2zkyp2jKac10eOn9PG
	NNwxsXbxdXsBRTK6KPRqYBRI4Qn4QLhj48Sg801m00EAb9FiZVZazgxL9K0bz4HmdjKcXdr7EAl
	CZ0S6Xp1rnUtZ3K7s0sxmjE5aY1m9fHcmyu7oqlOaE133HG9pZMWEs6/Z9VKNKLOU6QOJoJdzW5
	KuyKw+U7
X-Google-Smtp-Source: AGHT+IFF9bEbjjmNapGhmql+BuPntstAKEicpEzxJg3Qh6LkZHMTOzHOOAv9vQg9vg8A6/X699gIig==
X-Received: by 2002:a17:902:c941:b0:215:a179:14ca with SMTP id d9443c01a7336-21a83f3eec9mr416527735ad.2.1736912325125;
        Tue, 14 Jan 2025 19:38:45 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:e5d5:b870:ca9b:78f8])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f10dffbsm73368195ad.49.2025.01.14.19.38.34
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Tue, 14 Jan 2025 19:38:44 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: 21cnbao@gmail.com,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Thomas Gleixner <tglx@linutronix.de>,
	Ingo Molnar <mingo@redhat.com>,
	Borislav Petkov <bp@alien8.de>,
	Dave Hansen <dave.hansen@linux.intel.com>,
	"H. Peter Anvin" <hpa@zytor.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Shaoqin Huang <shahuang@redhat.com>,
	Gavin Shan <gshan@redhat.com>,
	Kefeng Wang <wangkefeng.wang@huawei.com>,
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Will Deacon <will@kernel.org>
Subject: [PATCH v3 2/4] mm: Support tlbbatch flush for a range of PTEs
Date: Wed, 15 Jan 2025 16:38:06 +1300
Message-Id: <20250115033808.40641-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250115033808.40641-1-21cnbao@gmail.com>
References: <20250115033808.40641-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250114_193846_194362_AE73A176 
X-CRM114-Status: GOOD (  17.20  )
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

From: Barry Song <v-songbaohua@oppo.com>

This patch lays the groundwork for supporting batch PTE unmapping in
try_to_unmap_one(). It introduces range handling for TLB batch flushing,
with the range currently set to the size of PAGE_SIZE.

The function __flush_tlb_range_nosync() is architecture-specific and is
only used within arch/arm64. This function requires the mm structure
instead of the vma structure. To allow its reuse by
arch_tlbbatch_add_pending(), which operates with mm but not vma, this
patch modifies the argument of __flush_tlb_range_nosync() to take mm
as its parameter.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Thomas Gleixner <tglx@linutronix.de>
Cc: Ingo Molnar <mingo@redhat.com>
Cc: Borislav Petkov <bp@alien8.de>
Cc: Dave Hansen <dave.hansen@linux.intel.com>
Cc: "H. Peter Anvin" <hpa@zytor.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Shaoqin Huang <shahuang@redhat.com>
Cc: Gavin Shan <gshan@redhat.com>
Cc: Kefeng Wang <wangkefeng.wang@huawei.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: David Hildenbrand <david@redhat.com>
Cc: Lance Yang <ioworker0@gmail.com>
Cc: "Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>
Cc: Yosry Ahmed <yosryahmed@google.com>
Cc: Paul Walmsley <paul.walmsley@sifive.com>
Cc: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Albert Ou <aou@eecs.berkeley.edu>
Cc: Yicong Yang <yangyicong@hisilicon.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Acked-by: Will Deacon <will@kernel.org>
---
 arch/arm64/include/asm/tlbflush.h | 25 +++++++++++++------------
 arch/arm64/mm/contpte.c           |  2 +-
 arch/riscv/include/asm/tlbflush.h |  5 +++--
 arch/riscv/mm/tlbflush.c          |  5 +++--
 arch/x86/include/asm/tlbflush.h   |  5 +++--
 mm/rmap.c                         | 12 +++++++-----
 6 files changed, 30 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index bc94e036a26b..98fbc8df7cf3 100644
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -322,13 +322,6 @@ static inline bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 	return true;
 }
 
-static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
-					     struct mm_struct *mm,
-					     unsigned long uaddr)
-{
-	__flush_tlb_page_nosync(mm, uaddr);
-}
-
 /*
  * If mprotect/munmap/etc occurs during TLB batched flushing, we need to
  * synchronise all the TLBI issued with a DSB to avoid the race mentioned in
@@ -448,7 +441,7 @@ static inline bool __flush_tlb_range_limit_excess(unsigned long start,
 	return false;
 }
 
-static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
+static inline void __flush_tlb_range_nosync(struct mm_struct *mm,
 				     unsigned long start, unsigned long end,
 				     unsigned long stride, bool last_level,
 				     int tlb_level)
@@ -460,12 +453,12 @@ static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
 	pages = (end - start) >> PAGE_SHIFT;
 
 	if (__flush_tlb_range_limit_excess(start, end, pages, stride)) {
-		flush_tlb_mm(vma->vm_mm);
+		flush_tlb_mm(mm);
 		return;
 	}
 
 	dsb(ishst);
-	asid = ASID(vma->vm_mm);
+	asid = ASID(mm);
 
 	if (last_level)
 		__flush_tlb_range_op(vale1is, start, pages, stride, asid,
@@ -474,7 +467,7 @@ static inline void __flush_tlb_range_nosync(struct vm_area_struct *vma,
 		__flush_tlb_range_op(vae1is, start, pages, stride, asid,
 				     tlb_level, true, lpa2_is_enabled());
 
-	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, start, end);
+	mmu_notifier_arch_invalidate_secondary_tlbs(mm, start, end);
 }
 
 static inline void __flush_tlb_range(struct vm_area_struct *vma,
@@ -482,7 +475,7 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
 				     unsigned long stride, bool last_level,
 				     int tlb_level)
 {
-	__flush_tlb_range_nosync(vma, start, end, stride,
+	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
 				 last_level, tlb_level);
 	dsb(ish);
 }
@@ -533,6 +526,14 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 	dsb(ish);
 	isb();
 }
+
+static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+		struct mm_struct *mm,
+		unsigned long start,
+		unsigned long end)
+{
+	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
+}
 #endif
 
 #endif
diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
index 55107d27d3f8..bcac4f55f9c1 100644
--- a/arch/arm64/mm/contpte.c
+++ b/arch/arm64/mm/contpte.c
@@ -335,7 +335,7 @@ int contpte_ptep_clear_flush_young(struct vm_area_struct *vma,
 		 * eliding the trailing DSB applies here.
 		 */
 		addr = ALIGN_DOWN(addr, CONT_PTE_SIZE);
-		__flush_tlb_range_nosync(vma, addr, addr + CONT_PTE_SIZE,
+		__flush_tlb_range_nosync(vma->vm_mm, addr, addr + CONT_PTE_SIZE,
 					 PAGE_SIZE, true, 3);
 	}
 
diff --git a/arch/riscv/include/asm/tlbflush.h b/arch/riscv/include/asm/tlbflush.h
index 72e559934952..e4c533691a7d 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -60,8 +60,9 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
 bool arch_tlbbatch_should_defer(struct mm_struct *mm);
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
-			       struct mm_struct *mm,
-			       unsigned long uaddr);
+		struct mm_struct *mm,
+		unsigned long start,
+		unsigned long end);
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..6d6e8e7cc576 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -186,8 +186,9 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 }
 
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
-			       struct mm_struct *mm,
-			       unsigned long uaddr)
+		struct mm_struct *mm,
+		unsigned long start,
+		unsigned long end)
 {
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
 }
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 69e79fff41b8..2b511972d008 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -278,8 +278,9 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 }
 
 static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
-					     struct mm_struct *mm,
-					     unsigned long uaddr)
+		struct mm_struct *mm,
+		unsigned long start,
+		unsigned long end)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
diff --git a/mm/rmap.c b/mm/rmap.c
index de6b8c34e98c..abeb9fcec384 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -672,7 +672,8 @@ void try_to_unmap_flush_dirty(void)
 	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
 
 static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
-				      unsigned long uaddr)
+		unsigned long start,
+		unsigned long end)
 {
 	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
 	int batch;
@@ -681,7 +682,7 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
 	if (!pte_accessible(mm, pteval))
 		return;
 
-	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr);
+	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, start, end);
 	tlb_ubc->flush_required = true;
 
 	/*
@@ -757,7 +758,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 }
 #else
 static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
-				      unsigned long uaddr)
+		unsigned long start,
+		unsigned long end)
 {
 }
 
@@ -1792,7 +1794,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address);
+				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
@@ -2164,7 +2166,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address);
+				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
-- 
2.39.3 (Apple Git-146)


