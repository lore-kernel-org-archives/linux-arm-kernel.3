Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86012C624A5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 15:29:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=irCGXXhFVKf83sDiQPQ3gXkYgJ1AJeMIuaHhsWH1YOk=; b=qR5ujots8uQsYVKUi2vGR4lUg3
	ZFXS7Z4uX/GhUmErMefruTh+JH1xeUvJJDd/G/M7uuNfe/i+gwiE6g71H22MKCH95pk2as2ljSmFh
	urV+DiFPE4HUyb7Kaek/UmOLRqTa9mdJztc8PXGvcpQaFvFi26ahSU5iffzIMOYADw3pnpWxYXaAc
	eZYgvFiB06COMIEyzwONN9xeDiaENUtMIBu4pd98+UViGpuDRH02P5ufgUz64Ljgn+00zG4L1HnRS
	wpc/bn+LH7EW9CezEy4Rz7JjouVpbsTrdl5xiSwLSZsMjtnHNaHGyd7qv0CAloUhk2VX3WbRRkT4l
	vq4MCVGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13wu-00000009rkZ-0QGZ;
	Mon, 31 Aug 2026 15:29:28 +0000
Received: from mail-wm1-x32a.google.com ([2a00:1450:4864:20::32a])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x13wr-00000009riq-2ECO
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 15:29:26 +0000
Received: by mail-wm1-x32a.google.com with SMTP id 5b1f17b1804b1-49b0dbfbf7bso26040415e9.2
        for <linux-arm-kernel@lists.infradead.org>; Mon, 31 Aug 2026 08:29:24 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1788190163; x=1788794963; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=irCGXXhFVKf83sDiQPQ3gXkYgJ1AJeMIuaHhsWH1YOk=;
        b=ivfXCqC5hYag1B0+e61pZF88HuMMAsudM/st/jgtKlsyrLVdLMRuKVkoA+6t1I58TE
         b0jvOX019BE7XoHrvHhRy4MTifvr8qKu+4gldDTTs5lonIP5GzRXWUUo2jg+xcPUvyec
         7P2EdksJAzOHj6kVYCQYvxeL1pzRWxNr9VBk9U5ByDmNhof25O9CITG/vvnyMCRqsRJK
         1X9XsKOzCg9q7llcZSOqICtxJCiLLY83rT0hzJb3ELnWR+I7c/2whkHsUX15JnPCDNcd
         Nh9hAoS9vaLUz1XTvGX1mWD1h8qVfONlbRceJC/Uqyx4Aco1WPN+UKalMUqHxHCjRgUK
         AzZw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788190163; x=1788794963;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=irCGXXhFVKf83sDiQPQ3gXkYgJ1AJeMIuaHhsWH1YOk=;
        b=LHyBgS2FWN1bNDLx9tDKPJGOy5SAJWm3/8/2tA+BL0FV4Qw+UaIBH/HvyIe/6pHC1P
         xcojxG4jDxRerngWgIu64LADgxdt+kz5U3yB3C+AqPxO9qtXmeSpDNWTNPgp8qy+88d6
         titamXI3K7GI3FeLB4LQqhdfbL3DvZKTTUonABOchcJVl0kH+LSyx2LItu3X5fay9T3s
         tq1BmWAZkIk1eui2D/H6RDQvfmUxvMWFI+zyN2WkEO8cj6ZjtcpBTjmr15wgqj9hWl6W
         6eGWv+bjKcGqhvsjpEiLYb3ae2caLqyM+rpGoDbNMLrRNtyeJ9Go1B/kTi3R3QqRCI2u
         abgw==
X-Forwarded-Encrypted: i=1; AHgh+Rp8mzMc+05hmFOtz+/hEIm6u6DIoonSk40gDWqjBB5nL3xkiI/cpzP1R92gCTmOKr+4pbnJDhbMQB+kLy/GHqR0@lists.infradead.org
X-Gm-Message-State: AFuF++lKdwLhi4Zw62J6lqx0E93QtEqb0Am6B2gXeSB0k97qfs7crXAS
	x4HE/yjlpco7ghxn/Iad7yr7ZeCEQ2/dOgbBxkGZmBTdeorqC931Gvza
X-Gm-Gg: AR+sD11dXfkSkBk9PyLp8DAjHgllzP2R2wPrQQmYqIg8cI7ctUKSTrE0wH3NvLyeu1Q
	MFliWbUEDeKqdVDZvXHBbZdS2mG4xNeqbYn4lJWZS4Cc63VSuxCqcBJsnrG8kon+7X+hHvS+SIH
	cGVWm8F6eRGR77XaPf+Y46efSo5Vu7dcoWDBVweEIIeoNiuhXwZqG6d+xyI+hFHbP87J0yDEluU
	qq+ITg2iivNqnn8qG5/S6mMPE7ECqfkXneEIXCBrlRI+Y+PxjBc88fwLNXNtmqL4VSlGeXsERma
	nK4eMqnqEPpnJKAfAeQz15X6ZGPVfeAEnlYtb0JyiHYjFDqRLOrmlWlx9jojUTKd+foLCnL6Lgw
	EEZjczjqCuY+ElHbjGP6fnQTx+WUBuxAYH6NhiCV84KvFOTrlvawbCWYbDkxW0kp9DZjWVo+TB1
	w4SPbvBQ5tphgHv/9s5BHa03bzoQaM4e8jYIwkxDQP4P4Wth/m8rC3R4ypRZwhws7FxzS71x1QH
	jJbep8rsTFtxFBZSqE0HHL+mUm/1sEqNHOGaIjAkQy+vwT9DlQAvGKqehyDFcsKMXh358NL16KR
	hjzWRqnQQqHwoyhX4ZPpvB0+wwxB/AAaADAvW9o3eEurqPjQynNplts1BbfufkFO5Zc4mKmU+U3
	lY8q+
X-Received: by 2002:a05:600c:524c:b0:49b:9161:db26 with SMTP id 5b1f17b1804b1-49cdc55a9e5mr19869665e9.14.1788190162893;
        Mon, 31 Aug 2026 08:29:22 -0700 (PDT)
Received: from MacBook-Pro-von-Karl.localdomain (dynamic-2a02-3100-acb9-0201-68d0-34d2-ad1a-175a.310.pool.telefonica.de. [2a02:3100:acb9:201:68d0:34d2:ad1a:175a])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-482fbb20793sm22661828f8f.17.2026.08.31.08.29.21
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 31 Aug 2026 08:29:22 -0700 (PDT)
From: Karl Mehltretter <kmehltretter@gmail.com>
To: stable@vger.kernel.org
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Ard Biesheuvel <ardb@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Karl Mehltretter <kmehltretter@gmail.com>
Subject: [PATCH 6.6.y v2] Revert "arm64: mm: Don't remap pgtables for allocate vs populate"
Date: Mon, 31 Aug 2026 17:29:06 +0200
Message-Id: <20260831152906.7000-1-kmehltretter@gmail.com>
X-Mailer: git-send-email 2.39.5 (Apple Git-154)
In-Reply-To: <2026083151-mascot-unshaken-5f46@gregkh>
References: <2026083151-mascot-unshaken-5f46@gregkh>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_082925_603468_94A81D06 
X-CRM114-Status: GOOD (  16.94  )
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

This reverts commit 54322d95309d9aa4cb77b34ee4b6c8b541f3e21f.

The 6.6.y backport removes the clearing performed by
early_pgtable_alloc(). Its replacement clears allocations made by the
generic page-table walkers, but 6.6's create_idmap() still allocates an
extra root level directly when a sub-48-bit VA kernel is loaded
sufficiently high in physical memory.

memblock_phys_alloc_range() does not zero the returned memory. The direct
caller can therefore publish an uncleared root page. A stale entry can
trip the bad-descriptor BUG_ON or be followed as a page-table descriptor,
preventing the kernel from booting.

Mainline is not affected because commit e6128a8e523c ("arm64: mm: Use
48-bit virtual addressing for the permanent ID map") removed the dynamic
extra level before commit 0e9df1c905d8 ("arm64: mm: Don't remap pgtables
for allocate vs populate") moved page-table initialization out of the
allocator.

Revert the optimization in 6.6.y to restore allocation-time clearing for
all callers.

Fixes: 54322d95309d ("arm64: mm: Don't remap pgtables for allocate vs populate")
Link: https://lore.kernel.org/r/2026083151-mascot-unshaken-5f46@gregkh
Assisted-by: LLM
Signed-off-by: Karl Mehltretter <kmehltretter@gmail.com>
---
Changes in v2:
- Replace the targeted extra-idmap clear with a full revert of
  54322d95309d (Ard).

 arch/arm64/mm/mmu.c | 58 ++++++++++++++++++++++-----------------------
 1 file changed, 29 insertions(+), 29 deletions(-)

diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index e075792d72257..c49cf99161881 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -106,12 +106,28 @@ EXPORT_SYMBOL(phys_mem_access_prot);
 static phys_addr_t __init early_pgtable_alloc(int shift)
 {
 	phys_addr_t phys;
+	void *ptr;
 
 	phys = memblock_phys_alloc_range(PAGE_SIZE, PAGE_SIZE, 0,
 					 MEMBLOCK_ALLOC_NOLEAKTRACE);
 	if (!phys)
 		panic("Failed to allocate page table page\n");
 
+	/*
+	 * The FIX_{PGD,PUD,PMD} slots may be in active use, but the FIX_PTE
+	 * slot will be free, so we can (ab)use the FIX_PTE slot to initialise
+	 * any level of table.
+	 */
+	ptr = pte_set_fixmap(phys);
+
+	memset(ptr, 0, PAGE_SIZE);
+
+	/*
+	 * Implicit barriers also ensure the zeroed page is visible to the page
+	 * table walker
+	 */
+	pte_clear_fixmap();
+
 	return phys;
 }
 
@@ -153,14 +169,6 @@ bool pgattr_change_is_safe(u64 old, u64 new)
 	return ((old ^ new) & ~mask) == 0;
 }
 
-static void init_clear_pgtable(void *table)
-{
-	clear_page(table);
-
-	/* Ensure the zeroing is observed by page table walks. */
-	dsb(ishst);
-}
-
 static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
 		     phys_addr_t phys, pgprot_t prot)
 {
@@ -203,15 +211,12 @@ static void alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 			pmdval |= PMD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pte_phys = pgtable_alloc(PAGE_SHIFT);
-		ptep = pte_set_fixmap(pte_phys);
-		init_clear_pgtable(ptep);
-		ptep += pte_index(addr);
 		__pmd_populate(pmdp, pte_phys, pmdval);
-	} else {
-		BUG_ON(pmd_bad(pmd));
-		ptep = pte_set_fixmap_offset(pmdp, addr);
+		pmd = READ_ONCE(*pmdp);
 	}
+	BUG_ON(pmd_bad(pmd));
 
+	ptep = pte_set_fixmap_offset(pmdp, addr);
 	do {
 		pgprot_t __prot = prot;
 
@@ -290,15 +295,12 @@ static void alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 			pudval |= PUD_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pmd_phys = pgtable_alloc(PMD_SHIFT);
-		pmdp = pmd_set_fixmap(pmd_phys);
-		init_clear_pgtable(pmdp);
-		pmdp += pmd_index(addr);
 		__pud_populate(pudp, pmd_phys, pudval);
-	} else {
-		BUG_ON(pud_bad(pud));
-		pmdp = pmd_set_fixmap_offset(pudp, addr);
+		pud = READ_ONCE(*pudp);
 	}
+	BUG_ON(pud_bad(pud));
 
+	pmdp = pmd_set_fixmap_offset(pudp, addr);
 	do {
 		pgprot_t __prot = prot;
 
@@ -336,15 +338,12 @@ static void alloc_init_pud(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			p4dval |= P4D_TABLE_PXN;
 		BUG_ON(!pgtable_alloc);
 		pud_phys = pgtable_alloc(PUD_SHIFT);
-		pudp = pud_set_fixmap(pud_phys);
-		init_clear_pgtable(pudp);
-		pudp += pud_index(addr);
 		__p4d_populate(p4dp, pud_phys, p4dval);
-	} else {
-		BUG_ON(p4d_bad(p4d));
-		pudp = pud_set_fixmap_offset(p4dp, addr);
+		p4d = READ_ONCE(*p4dp);
 	}
+	BUG_ON(p4d_bad(p4d));
 
+	pudp = pud_set_fixmap_offset(p4dp, addr);
 	do {
 		pud_t old_pud = READ_ONCE(*pudp);
 
@@ -426,10 +425,11 @@ void create_kpti_ng_temp_pgd(pgd_t *pgdir, phys_addr_t phys, unsigned long virt,
 
 static phys_addr_t __pgd_pgtable_alloc(int shift)
 {
-	/* Page is zeroed by init_clear_pgtable() so don't duplicate effort. */
-	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL & ~__GFP_ZERO);
-
+	void *ptr = (void *)__get_free_page(GFP_PGTABLE_KERNEL);
 	BUG_ON(!ptr);
+
+	/* Ensure the zeroed page is visible to the page table walker */
+	dsb(ishst);
 	return __pa(ptr);
 }
 
-- 
2.39.5 (Apple Git-154)

