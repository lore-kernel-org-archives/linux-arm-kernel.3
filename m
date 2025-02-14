Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 85804C021A4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:35:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fYY5o/q5rsrfsQ4J/LjZ+h5x5F/3ppu3Uc96Z+8j+c0=; b=dmily7q43TmKDkZVVOH6OZBM0C
	X7GsJanKaSUp+XRT0uEjvj/nQSr1C1qSOjvbMGJEsvvt6oBHEIeKNvNhpAi9ZBpp9/t+CWh7Veztt
	4FJ2kdFW63+BLm0M9iqB+23sh7uAYQis+tzkVoChTpbYTyGXx41kWQCZOW6IGY9AowC2YoyEZart6
	tPRk/x66Tqvj4FlsllZ7TbkcMll/0NrXQs1QSGP48MEb/r5O8lwkB7SKc6eVZNVRfR/Sd7ZDpk8HH
	QXbywkzgcVDlwK0/WSeo7ZGMMrgx9o7VuFzCTPhDjv6gEqEDlkqx9Ori27vkFyxj2AFmwDUCCDFhO
	Oquifa3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tis69-0000000ELq3-1ZlF;
	Fri, 14 Feb 2025 09:35:01 +0000
Received: from mail-pl1-x633.google.com ([2607:f8b0:4864:20::633])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tis25-0000000EKSe-3KhU;
	Fri, 14 Feb 2025 09:30:50 +0000
Received: by mail-pl1-x633.google.com with SMTP id d9443c01a7336-21f6a47d617so30940295ad.2;
        Fri, 14 Feb 2025 01:30:49 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739525449; x=1740130249; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=fYY5o/q5rsrfsQ4J/LjZ+h5x5F/3ppu3Uc96Z+8j+c0=;
        b=QvnpdKid+x4VTg62Dh+1coqzrqqxqzNfcecidx5E8CDHSWSkk28w/dRnnRjRxYpVnW
         Sp47iT5H8rxFwYKUS+m4nnfE4cH1bpvhZIVGNLPS0CtrkLy89mQ6GrAtRxIiVDyNJHGH
         olhPEl4rU8A7Jnr64QNpc22X78JTV4oNC4/NUhvlO7Q9ztVoN3c/p/Sain+m41dgcgrE
         cB/dM2F3IJ9I3SikktVxxkWGimUdwSsMRZZ+f6QlkL242T+aL25u7dfmSFjmCTOX77DF
         JMWo47eZ8TJTUcJzHi9/MNvr2hm4xPEFM1SCsUuWLQauDz1PTVGI9t7ovIwS1Tpq50W7
         T1uw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525449; x=1740130249;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=fYY5o/q5rsrfsQ4J/LjZ+h5x5F/3ppu3Uc96Z+8j+c0=;
        b=q0fVVIDv6kwJGolsIEWkig2kx4l9OzUFUqcvLWoxV4n+soo2DkNIpJCh/5wHHWymgm
         HYhUzoIP8G55Tx309SDUpiswnU9RB2OYMQDK/Ap1YTeZyu+Da8NzGLbn+uhEi2aVKlHB
         nDUczqg38ijCs/eWqtZpSOHYkySBjMJJ4/1Iia/l6igQ2+f+c+0CN6AW0e9gVRLpycd9
         uOMFu26pcZorV5Q+dpy0aFEAulxllXqZk6+JfvOpR7YwD1usFcFbS4Sw3kMFBB7LND3E
         P3Npydo58vszAFqzAgsHegJw0McOfmcvH/Q0B8OQimeI3eCPwuNthYJMRExQnlbQMiMB
         Whfw==
X-Forwarded-Encrypted: i=1; AJvYcCV9aZeZD1P2lhk1N23DMEB49CYLuTGX++hRjrnFANb0bEEEs3PbwzMKjj2btpWI1gW4+7KW9FnLP8oWHxMl2as1@lists.infradead.org, AJvYcCVrSmLfkYbnnQTEuHzTi+7ETee26mSrXr8XZr7+N3nlKFN4vmokgRSdY46d26BFSd5+ByGPt/KLrOD/LxY=@lists.infradead.org
X-Gm-Message-State: AOJu0Yxx3cu+tvJh7Ej1UR2wyRH2kI2G4hXAq4rlW3MEPdoOStjgTjnt
	vPvmmo8mKwCJYXscCUibJpDfseP9KgoAQvmUJPey5eHxH8/sxIAS
X-Gm-Gg: ASbGncuD0K3qT2/UE5WIVzdlW9ITncywT5cogLceGShSoACRxTpokbGy8eNcJjooB4M
	s3FVP8mtpURqCG+MAPXnLD2uo+kWQ4XPG2j8Qx00L5AgZP4RN3aHXQ15rb+2zVXo9UzQA8Xe92B
	HKPcTwip7AhXYTqoXXw4tHDYwYD8nf3rf9rdwBeuRMv4TITkb/u+78uBJnkQZB1btKHg+BOfras
	TCk9HNX4MGOEummI2K16TgIIQfo3MwkxMYH0y5K006JO8bUCtwKimWY092n+SmUmR9x2hsVinB0
	sd5TpMBw0lZRtwviOQjrgOZMWjJOSqA=
X-Google-Smtp-Source: AGHT+IGBw+VKYQOOSQZMxOqYuMGxHuHa76uW0Guam1HUKu41ToHalQ66sh7ofZywZvlaeJqNnNB3MA==
X-Received: by 2002:a17:903:2292:b0:20d:cb6:11e with SMTP id d9443c01a7336-220bbb101fbmr163987715ad.26.1739525448736;
        Fri, 14 Feb 2025 01:30:48 -0800 (PST)
Received: from Barrys-MBP.hub ([118.92.30.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c814sm25440515ad.148.2025.02.14.01.30.37
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Feb 2025 01:30:48 -0800 (PST)
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
	Mark Rutland <mark.rutland@arm.com>,
	"Kirill A. Shutemov" <kirill.shutemov@linux.intel.com>,
	Yosry Ahmed <yosryahmed@google.com>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Yicong Yang <yangyicong@hisilicon.com>,
	Will Deacon <will@kernel.org>,
	Kefeng Wang <wangkefeng.wang@huawei.com>
Subject: [PATCH v4 2/4] mm: Support tlbbatch flush for a range of PTEs
Date: Fri, 14 Feb 2025 22:30:13 +1300
Message-Id: <20250214093015.51024-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250214093015.51024-1-21cnbao@gmail.com>
References: <20250214093015.51024-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_013049_838220_C29AA948 
X-CRM114-Status: GOOD (  17.13  )
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
Reviewed-by: Kefeng Wang <wangkefeng.wang@huawei.com>
---
 arch/arm64/include/asm/tlbflush.h | 23 +++++++++++------------
 arch/arm64/mm/contpte.c           |  2 +-
 arch/riscv/include/asm/tlbflush.h |  3 +--
 arch/riscv/mm/tlbflush.c          |  3 +--
 arch/x86/include/asm/tlbflush.h   |  3 +--
 mm/rmap.c                         | 10 +++++-----
 6 files changed, 20 insertions(+), 24 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index bc94e036a26b..b7e1920570bd 100644
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
@@ -533,6 +526,12 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 	dsb(ish);
 	isb();
 }
+
+static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+		struct mm_struct *mm, unsigned long start, unsigned long end)
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
index 72e559934952..ce0dd0fed764 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -60,8 +60,7 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 
 bool arch_tlbbatch_should_defer(struct mm_struct *mm);
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
-			       struct mm_struct *mm,
-			       unsigned long uaddr);
+		struct mm_struct *mm, unsigned long start, unsigned long end);
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..74dd9307fbf1 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -186,8 +186,7 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 }
 
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
-			       struct mm_struct *mm,
-			       unsigned long uaddr)
+		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
 }
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 02fc2aa06e9e..29373da7b00a 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -279,8 +279,7 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 }
 
 static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
-					     struct mm_struct *mm,
-					     unsigned long uaddr)
+		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
diff --git a/mm/rmap.c b/mm/rmap.c
index 1320527e90cd..89e51a7a9509 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -672,7 +672,7 @@ void try_to_unmap_flush_dirty(void)
 	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
 
 static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
-				      unsigned long uaddr)
+		unsigned long start, unsigned long end)
 {
 	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
 	int batch;
@@ -681,7 +681,7 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
 	if (!pte_accessible(mm, pteval))
 		return;
 
-	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr);
+	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, start, end);
 	tlb_ubc->flush_required = true;
 
 	/*
@@ -757,7 +757,7 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 }
 #else
 static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
-				      unsigned long uaddr)
+		unsigned long start, unsigned long end)
 {
 }
 
@@ -1946,7 +1946,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address);
+				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
@@ -2329,7 +2329,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address);
+				set_tlb_ubc_flush_pending(mm, pteval, address, address + PAGE_SIZE);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
-- 
2.39.3 (Apple Git-146)


