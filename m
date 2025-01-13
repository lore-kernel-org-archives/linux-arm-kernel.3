Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DE723E77188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 03:43:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eULRCDFJ0DJzA6lc7vvdVA8dxS/L+jVPc2aRWImXMe0=; b=K7xE+xtpDAqI/WWB2yE0wMNz9S
	FVA34cDAmQrgqDvzvXL5lYIPKcRgNaSy2OAGYX299yMENgjEzjsii2EKsVjpoProvZlfWZ5/7IWCR
	zbQjlHfQmV679nEx1f/8v/ZSJ3gt5VV10cFhJcbMsQVcKaeVdiwl7y9jfD1T01IVSea5U/XfRjn70
	foc2AOkbxNd/0iR5ToXuyD/cdU6WX3cmY1EnMoQnvwPGsXbmbAng+PTBlHLCkippkgeSq/DCUDgki
	oeXP8qFbquufnhwvwdd4OXqbVifa9lmD7gds/nPg4EzN4Ul3TMuXvXuBiIbVdxwsu7kd8j+ew1xL+
	xXncPvwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBMF-00000003vpw-00B1;
	Mon, 13 Jan 2025 03:43:19 +0000
Received: from mail-pl1-x630.google.com ([2607:f8b0:4864:20::630])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBIh-00000003vB1-1RG1;
	Mon, 13 Jan 2025 03:39:40 +0000
Received: by mail-pl1-x630.google.com with SMTP id d9443c01a7336-21a7ed0155cso63606035ad.3;
        Sun, 12 Jan 2025 19:39:39 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736739578; x=1737344378; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eULRCDFJ0DJzA6lc7vvdVA8dxS/L+jVPc2aRWImXMe0=;
        b=KPrsC2EUtUU8My0Sw58c/wgLVC3zx4BnO+52vKGilyOxOlWlTomeYWrpkTFyXa7iN8
         Uk6o3i7tOKjW6FFEdVGF4K3i6HnqEJ5kK3g6/dOJAfWA1A9+8ouc3deOs72BenhbGnX4
         eV/FRchjB5VLSUqu6U1vwsz1v3xWZn13wALhLpmGkQ9WqP1smCcy8O/ArWQwRJDE4NG3
         MroghzEmgMjedy5UWg+PKaYbZcUFql/shNhoWWtg/xXGQMCE0DRFJo1OjvU46915TXkj
         Zyt6PVtsekOPWnKmz0IxB72Rj63LU0n1F8hp9mzyO+lsAKCbigrcAzZVBFhXC7MlzB6P
         afpg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736739578; x=1737344378;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eULRCDFJ0DJzA6lc7vvdVA8dxS/L+jVPc2aRWImXMe0=;
        b=M6igPMsW/mTzjTs1X3Ilw2jsYyK+qvexFl526Q+iWOVegIUrgwWddN6fa2GeeyzrGh
         rJ/wv+7EW1ARtrPF19aANwLV1NSaivT0bmfDzdtqLiEZxKwimzMvlAFBDu2BjC2NCMST
         LVNZoyNNmw7TJOok4yi8EOpcZDMbRW7vteGJPTYC/cv2u7ErDU+m0rKhmqBpx+7l76V/
         AYTxLK2IsaOPnnvn1teopsQw8kUVSBcwwiR0M6/TW0rdgUIbM4q7pWTlvAv/qkTfNEGY
         HaW1Grkwdfssg0ol7WLdsllWVf1GxKIoa+a/y3fCwuJPdPZqw3vlMqgVFtg/xW2kyNwG
         N0fQ==
X-Forwarded-Encrypted: i=1; AJvYcCVLgCvoUyS0gOHyUTjbMxgxSr5aqvl++aoAfqWWwQSkkGXTmyEDjaw3tPsHBF2RzhTqLsJhXgDfWyrIXO0=@lists.infradead.org, AJvYcCWAS4cZqUsI2WJTgQw/rNyjxRbfrJ4+r3CxEm2w9aPm6hX1dWy4tLm+BWCHnI33NM5l175c3bhz/EtO8rSILr3M@lists.infradead.org
X-Gm-Message-State: AOJu0Yx9ks0TjJBR0jqLPGYUn6ABU/GPtbylPhrjUOudZ4Jd62ibTMpC
	xrgl5YbVDroRNEfDVOMPo6TSAvn9915QaaZNXe9JVuzL8WAxtlfx
X-Gm-Gg: ASbGncvBiVAZta4zaSu2QsgHYXEt8nT3qf7hYhJeU1Bk7+mIe9bcAaYwqromtXElSem
	UfVRKKVtDyu8niyU6Q1oOYPaHGAA6ChbsVUKvr6MZohEbd40t9NUjF/H6mgjiS6za0QVEIxIvaI
	9RECwX7VQNdiEChCBn9pKh32vw1NJuFbIYU8h9sVB6yPoV0h441s0UqJrMHDhHAWzkFICgiwWIN
	8MMfVL+vfCpX9oaZ1ra+P4ucveIMkpss/Wrqbh93weYeUSYMDTi6IdWOaxA5qCAbNYwKq2q2WFq
	+PJ0F/02
X-Google-Smtp-Source: AGHT+IGyqwjrrsZeQxoPWWpl+Lu4WtU0rXovoTE/PMvKn9xWPcPyfiEtn9aeXvMxYF6gWs977A6wvQ==
X-Received: by 2002:a17:902:c951:b0:215:bc30:c952 with SMTP id d9443c01a7336-21a83f4298fmr238697265ad.6.1736739578393;
        Sun, 12 Jan 2025 19:39:38 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25aabfsm44368405ad.246.2025.01.12.19.39.27
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 19:39:38 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com,
	lorenzo.stoakes@oracle.com,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
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
	Yicong Yang <yangyicong@hisilicon.com>
Subject: [PATCH v2 2/4] mm: Support tlbbatch flush for a range of PTEs
Date: Mon, 13 Jan 2025 16:38:59 +1300
Message-Id: <20250113033901.68951-3-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250113033901.68951-1-21cnbao@gmail.com>
References: <20250113033901.68951-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_193939_385674_6C4DAE90 
X-CRM114-Status: GOOD (  16.60  )
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

This is a preparatory patch to support batch PTE unmapping in
`try_to_unmap_one`. It first introduces range handling for
`tlbbatch` flush. Currently, the range is always set to the size of
PAGE_SIZE.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
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
---
 arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++------------
 arch/arm64/mm/contpte.c           |  2 +-
 arch/riscv/include/asm/tlbflush.h |  3 ++-
 arch/riscv/mm/tlbflush.c          |  3 ++-
 arch/x86/include/asm/tlbflush.h   |  3 ++-
 mm/rmap.c                         | 12 +++++++-----
 6 files changed, 28 insertions(+), 21 deletions(-)

diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
index bc94e036a26b..f34e4fab5aa2 100644
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
@@ -533,6 +526,15 @@ static inline void __flush_tlb_kernel_pgtable(unsigned long kaddr)
 	dsb(ish);
 	isb();
 }
+
+static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
+					     struct mm_struct *mm,
+					     unsigned long uaddr,
+					     unsigned long size)
+{
+	__flush_tlb_range_nosync(mm, uaddr, uaddr + size,
+				 PAGE_SIZE, true, 3);
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
index 72e559934952..7f3ea687ce33 100644
--- a/arch/riscv/include/asm/tlbflush.h
+++ b/arch/riscv/include/asm/tlbflush.h
@@ -61,7 +61,8 @@ void flush_pmd_tlb_range(struct vm_area_struct *vma, unsigned long start,
 bool arch_tlbbatch_should_defer(struct mm_struct *mm);
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       struct mm_struct *mm,
-			       unsigned long uaddr);
+			       unsigned long uaddr,
+			       unsigned long size);
 void arch_flush_tlb_batched_pending(struct mm_struct *mm);
 void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch);
 
diff --git a/arch/riscv/mm/tlbflush.c b/arch/riscv/mm/tlbflush.c
index 9b6e86ce3867..aeda64a36d50 100644
--- a/arch/riscv/mm/tlbflush.c
+++ b/arch/riscv/mm/tlbflush.c
@@ -187,7 +187,8 @@ bool arch_tlbbatch_should_defer(struct mm_struct *mm)
 
 void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 			       struct mm_struct *mm,
-			       unsigned long uaddr)
+			       unsigned long uaddr,
+			       unsigned long size)
 {
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
 }
diff --git a/arch/x86/include/asm/tlbflush.h b/arch/x86/include/asm/tlbflush.h
index 69e79fff41b8..4b62a6329b8f 100644
--- a/arch/x86/include/asm/tlbflush.h
+++ b/arch/x86/include/asm/tlbflush.h
@@ -279,7 +279,8 @@ static inline u64 inc_mm_tlb_gen(struct mm_struct *mm)
 
 static inline void arch_tlbbatch_add_pending(struct arch_tlbflush_unmap_batch *batch,
 					     struct mm_struct *mm,
-					     unsigned long uaddr)
+					     unsigned long uaddr,
+					     unsigned long size)
 {
 	inc_mm_tlb_gen(mm);
 	cpumask_or(&batch->cpumask, &batch->cpumask, mm_cpumask(mm));
diff --git a/mm/rmap.c b/mm/rmap.c
index de6b8c34e98c..365112af5291 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -672,7 +672,8 @@ void try_to_unmap_flush_dirty(void)
 	(TLB_FLUSH_BATCH_PENDING_MASK / 2)
 
 static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
-				      unsigned long uaddr)
+				      unsigned long uaddr,
+				      unsigned long size)
 {
 	struct tlbflush_unmap_batch *tlb_ubc = &current->tlb_ubc;
 	int batch;
@@ -681,7 +682,7 @@ static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
 	if (!pte_accessible(mm, pteval))
 		return;
 
-	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr);
+	arch_tlbbatch_add_pending(&tlb_ubc->arch, mm, uaddr, size);
 	tlb_ubc->flush_required = true;
 
 	/*
@@ -757,7 +758,8 @@ void flush_tlb_batched_pending(struct mm_struct *mm)
 }
 #else
 static void set_tlb_ubc_flush_pending(struct mm_struct *mm, pte_t pteval,
-				      unsigned long uaddr)
+				      unsigned long uaddr,
+				      unsigned long size)
 {
 }
 
@@ -1792,7 +1794,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address);
+				set_tlb_ubc_flush_pending(mm, pteval, address, PAGE_SIZE);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
@@ -2164,7 +2166,7 @@ static bool try_to_migrate_one(struct folio *folio, struct vm_area_struct *vma,
 				 */
 				pteval = ptep_get_and_clear(mm, address, pvmw.pte);
 
-				set_tlb_ubc_flush_pending(mm, pteval, address);
+				set_tlb_ubc_flush_pending(mm, pteval, address, PAGE_SIZE);
 			} else {
 				pteval = ptep_clear_flush(vma, address, pvmw.pte);
 			}
-- 
2.39.3 (Apple Git-146)


