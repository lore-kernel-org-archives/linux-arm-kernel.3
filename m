Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2A6BC108E1E9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 11:13:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=CHLXX+nhDu2ZJWlFFZ6qL7+Ox7hcV+YY7zJ+B+lxEvI=; b=egK66gvRTdSQU4VdQMJY1Yu/i1
	0t7D/JwhbUGH7EhcahsB914TVzcq0V8vuWZIjN1Jz52XuNQT5RnEa3w1j69djWdMtmrCkHvBWZhhu
	P8IdGwi99FHtFyfP5avnHY0NXjp51jvKhR0NKgHUBjPoaIX61LtlibHH7+bBl3tIgNCZNyECjL2Yv
	GA1eOVfCK0jEK/lh8vyXg8M1mAcoBVPxbc2I+2Z5Fi2WDS7HFvCMIxKFV45t0Sg4vd7sDTU0Bn+Cc
	X42KbfGxxbKVq/4G2ZrMXzFT5o9QOig8WjAG7tmaHl7vwegGREtWLYR34WIcwhp+21CCfLqwh7TnD
	KhB5VlwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BJO-0000000AUvj-2SGi;
	Thu, 19 Mar 2026 11:13:10 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3BJK-0000000AUuR-0z3j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 11:13:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E9FD242A47;
	Thu, 19 Mar 2026 11:13:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 78352C19424;
	Thu, 19 Mar 2026 11:13:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1773918785;
	bh=FyPZazHHaKDk1DFqPktOZumry+1emyWk09TDe+IHD+Y=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=JQqT7zZ7eX+BsNCSGdfqCsCS82piy53GLVkFBfd+ju8KF/NNNhSrYSb5XyNrkov7s
	 iQlyTZnH+NDwIqfoY7SLJnYUXqxlgcCAYEuPEqdkGbNnnwN4HJBeKBBC0IAKBuqAla
	 28p1rj75V7z4xTUFSm7iKHCBPdnaPyN2h30BLMyM=
Subject: Patch "arm64: mm: Don't remap pgtables per-cont(pte|pmd) block" has been added to the 6.6-stable tree
To: Jim.Perrin@microsoft.com,ardb@kernel.org,catalin.marinas@arm.com,echanude@redhat.com,itaru.kitayama@fujitsu.com,jaboutboul@microsoft.com,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,nmeyerhans@microsoft.com,ryan.roberts@arm.com,sgeorgejohn@microsoft.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 19 Mar 2026 12:12:51 +0100
In-Reply-To: <20260217133411.2881311-2-ryan.roberts@arm.com>
Message-ID: <2026031951-disband-calzone-f832@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_041306_323202_BC92A1C6 
X-CRM114-Status: GOOD (  18.42  )
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


This is a note to let you know that I've just added the patch titled

    arm64: mm: Don't remap pgtables per-cont(pte|pmd) block

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-mm-don-t-remap-pgtables-per-cont-pte-pmd-block.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-216825-greg=kroah.com@vger.kernel.org Tue Feb 17 14:34:47 2026
From: Ryan Roberts <ryan.roberts@arm.com>
Date: Tue, 17 Feb 2026 13:34:06 +0000
Subject: arm64: mm: Don't remap pgtables per-cont(pte|pmd) block
To: stable@vger.kernel.org
Cc: Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com, will@kernel.org, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, Jack Aboutboul <jaboutboul@microsoft.com>, Sharath George John <sgeorgejohn@microsoft.com>, Noah Meyerhans <nmeyerhans@microsoft.com>, Jim Perrin <Jim.Perrin@microsoft.com>, Itaru Kitayama <itaru.kitayama@fujitsu.com>, Eric Chanudet <echanude@redhat.com>, Mark Rutland <mark.rutland@arm.com>, Ard Biesheuvel <ardb@kernel.org>
Message-ID: <20260217133411.2881311-2-ryan.roberts@arm.com>

From: Ryan Roberts <ryan.roberts@arm.com>

[ Upstream commit 5c63db59c5f89925add57642be4f789d0d671ccd ]

A large part of the kernel boot time is creating the kernel linear map
page tables. When rodata=full, all memory is mapped by pte. And when
there is lots of physical ram, there are lots of pte tables to populate.
The primary cost associated with this is mapping and unmapping the pte
table memory in the fixmap; at unmap time, the TLB entry must be
invalidated and this is expensive.

Previously, each pmd and pte table was fixmapped/fixunmapped for each
cont(pte|pmd) block of mappings (16 entries with 4K granule). This means
we ended up issuing 32 TLBIs per (pmd|pte) table during the population
phase.

Let's fix that, and fixmap/fixunmap each page once per population, for a
saving of 31 TLBIs per (pmd|pte) table. This gives a significant boot
speedup.

Execution time of map_mem(), which creates the kernel linear map page
tables, was measured on different machines with different RAM configs:

               | Apple M2 VM | Ampere Altra| Ampere Altra| Ampere Altra
               | VM, 16G     | VM, 64G     | VM, 256G    | Metal, 512G
---------------|-------------|-------------|-------------|-------------
               |   ms    (%) |   ms    (%) |   ms    (%) |    ms    (%)
---------------|-------------|-------------|-------------|-------------
before         |  168   (0%) | 2198   (0%) | 8644   (0%) | 17447   (0%)
after          |   78 (-53%) |  435 (-80%) | 1723 (-80%) |  3779 (-78%)

Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Tested-by: Itaru Kitayama <itaru.kitayama@fujitsu.com>
Tested-by: Eric Chanudet <echanude@redhat.com>
Reviewed-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Ard Biesheuvel <ardb@kernel.org>
Link: https://lore.kernel.org/r/20240412131908.433043-2-ryan.roberts@arm.com
Signed-off-by: Will Deacon <will@kernel.org>
[ Ryan: Trivial backport ]
Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/mm/mmu.c |   27 ++++++++++++++-------------
 1 file changed, 14 insertions(+), 13 deletions(-)

--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -169,12 +169,9 @@ bool pgattr_change_is_safe(u64 old, u64
 	return ((old ^ new) & ~mask) == 0;
 }
 
-static void init_pte(pmd_t *pmdp, unsigned long addr, unsigned long end,
+static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
-	pte_t *ptep;
-
-	ptep = pte_set_fixmap_offset(pmdp, addr);
 	do {
 		pte_t old_pte = READ_ONCE(*ptep);
 
@@ -189,8 +186,6 @@ static void init_pte(pmd_t *pmdp, unsign
 
 		phys += PAGE_SIZE;
 	} while (ptep++, addr += PAGE_SIZE, addr != end);
-
-	pte_clear_fixmap();
 }
 
 static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
@@ -201,6 +196,7 @@ static void alloc_init_cont_pte(pmd_t *p
 {
 	unsigned long next;
 	pmd_t pmd = READ_ONCE(*pmdp);
+	pte_t *ptep;
 
 	BUG_ON(pmd_sect(pmd));
 	if (pmd_none(pmd)) {
@@ -216,6 +212,7 @@ static void alloc_init_cont_pte(pmd_t *p
 	}
 	BUG_ON(pmd_bad(pmd));
 
+	ptep = pte_set_fixmap_offset(pmdp, addr);
 	do {
 		pgprot_t __prot = prot;
 
@@ -226,20 +223,21 @@ static void alloc_init_cont_pte(pmd_t *p
 		    (flags & NO_CONT_MAPPINGS) == 0)
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
-		init_pte(pmdp, addr, next, phys, __prot);
+		init_pte(ptep, addr, next, phys, __prot);
 
+		ptep += pte_index(next) - pte_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
+
+	pte_clear_fixmap();
 }
 
-static void init_pmd(pud_t *pudp, unsigned long addr, unsigned long end,
+static void init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot,
 		     phys_addr_t (*pgtable_alloc)(int), int flags)
 {
 	unsigned long next;
-	pmd_t *pmdp;
 
-	pmdp = pmd_set_fixmap_offset(pudp, addr);
 	do {
 		pmd_t old_pmd = READ_ONCE(*pmdp);
 
@@ -265,8 +263,6 @@ static void init_pmd(pud_t *pudp, unsign
 		}
 		phys += next - addr;
 	} while (pmdp++, addr = next, addr != end);
-
-	pmd_clear_fixmap();
 }
 
 static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
@@ -276,6 +272,7 @@ static void alloc_init_cont_pmd(pud_t *p
 {
 	unsigned long next;
 	pud_t pud = READ_ONCE(*pudp);
+	pmd_t *pmdp;
 
 	/*
 	 * Check for initial section mappings in the pgd/pud.
@@ -294,6 +291,7 @@ static void alloc_init_cont_pmd(pud_t *p
 	}
 	BUG_ON(pud_bad(pud));
 
+	pmdp = pmd_set_fixmap_offset(pudp, addr);
 	do {
 		pgprot_t __prot = prot;
 
@@ -304,10 +302,13 @@ static void alloc_init_cont_pmd(pud_t *p
 		    (flags & NO_CONT_MAPPINGS) == 0)
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
-		init_pmd(pudp, addr, next, phys, __prot, pgtable_alloc, flags);
+		init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
 
+		pmdp += pmd_index(next) - pmd_index(addr);
 		phys += next - addr;
 	} while (addr = next, addr != end);
+
+	pmd_clear_fixmap();
 }
 
 static void alloc_init_pud(pgd_t *pgdp, unsigned long addr, unsigned long end,


Patches currently in stable-queue which might be from ryan.roberts@arm.com are

queue-6.6/arm64-mm-don-t-remap-pgtables-per-cont-pte-pmd-block.patch
queue-6.6/arm64-mm-don-t-remap-pgtables-for-allocate-vs-populate.patch
queue-6.6/arm64-mm-batch-dsb-and-isb-when-populating-pgtables.patch

