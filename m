Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A35FBC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 02:58:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=N6PzA7mB8f6GScrtLf4fvCqozUiHt2kWSKvUWfhehRw=; b=D62X0zir2VTgYhkyHQISNA2vGJ
	IiJ3oOdpw8xm601Kv+byIk65waxerlwKdoOkM1Er98Re+PnGfEBgOHDCnOiyGo6SDV6QHVbMdfl4W
	EDfoFe6SdloYT5TOPA2NC82CEk0a/QTwfhN07MyhBdwM4fWLlewi91hKIEoPoIik2lsZhwgJUQlbe
	OvYj0xf7ayDA/z3xk47gBRpbhMOdIiroyP6tA9bU1wZmMrvavl8dtq6D9PPt3aMnD++wo2UD/8Xay
	42enCgB5QrMDIinUEp8J3QQ+0lLTlhVjJFOngPI9bUdgnaJeaycs9AS6TXqq7ShVzwk9/SCVt5PJy
	OxUVmjmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzIN-0000000DOyx-2tW3;
	Fri, 27 Jun 2025 02:58:31 +0000
Received: from mail-wm1-x32c.google.com ([2a00:1450:4864:20::32c])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUzD3-0000000DOK4-031P;
	Fri, 27 Jun 2025 02:53:02 +0000
Received: by mail-wm1-x32c.google.com with SMTP id 5b1f17b1804b1-451ebd3d149so8985795e9.2;
        Thu, 26 Jun 2025 19:53:00 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750992779; x=1751597579; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=N6PzA7mB8f6GScrtLf4fvCqozUiHt2kWSKvUWfhehRw=;
        b=Lk2LZw0Di6c0WzExqM697p7Xa1CxY1wlD8vpiZGjKRQTYSGxNXeFBD1Wp7f2k/usck
         nVmMgM9jY0oToSG3v5vcNZErD7oZe8ei1Qg6IIxsOvChm8LIiOwYOyn0TBhPKuQxWu68
         NCo3fKdP8dLDoWiPFAu0rYA7dY8HMW5P8cxGjxDMPjde2NToYSUwrelhB1EFMZmlUfcZ
         dtyunY4KsYIm+19npHSbjx6UGDk7w/q/WoBS3f7G0K3w22QE8JuEcHqW4RGi0sbLKmXE
         7MYRgF3S0i1PaFp5hZaW88+zRfYmJxCIS0J4mhOpmvH2lxosQj8UE4VwUMmTVvn7hKO9
         4AkQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750992779; x=1751597579;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=N6PzA7mB8f6GScrtLf4fvCqozUiHt2kWSKvUWfhehRw=;
        b=RgTt78y/durYE9FbwR4M5T5UwOw9SmXiYQ9Fuq3Jhd1k4r2kRVAgmCRHrSKKdZ+7v9
         VfV6tEUhwHVNFqPs6WGxfmLfPgZ3KjGhI8cb7cC5EGN7p6o4hJ0GW3wn+GPJ3A5Hi9nz
         jAesdBH+DBWthmjJ3jhj9rw4bIL2e//X6xC3KDF4LG/l//img7noQh4TezHpLWCSfJTF
         9u25/WZbSpPWnZh5zlAqCAAIddRCctN/O33w5knmUf/L/oGCjFg+tiv+PsodiPuRNu94
         VPvajQ5hOYQMwryqoQxIuK0BIBb6HumI8mvOGDRSpw6MzX2V8N6M6o3ClSYSrkHYFY0C
         LtxQ==
X-Forwarded-Encrypted: i=1; AJvYcCUI+2O3vPGICkUe4BQQXNWgb5UZgzbf5jw0NLQtgHkPgKazszy/NWW+HK6jCZy2IPJvbgoaGXGZm1hKWbw=@lists.infradead.org, AJvYcCXfuVE2bF9TTblHzWfXDcwIWoRDZ+WRF6wnrP+7j5LSnATJt3bEm2DOJF7I6Y2XifWSHOQeD8sqESb0pda3t8ri@lists.infradead.org
X-Gm-Message-State: AOJu0YxPsQAJLbD3RxlE9vaKIX+QAVHbnthzCyfg1qPKIj4J2ZxlJkPO
	cmToGARf79xm+Vxddw+N8CZhXPyqM0UYnrLaDc17ng0SxVNfYO5U0XWG
X-Gm-Gg: ASbGncuj0jBkct9cyqFRjL14cZMpk2dYS6n7j1Ix7fF7N981JBGyPMHoPHYQ3+FpHbA
	6r392j+fud+cS7JBy8DVd/i/YQ2dn2p5/AJ1SWSYzUCCL4sfClifBPAjF6CQ+4fSaTMkJmSYyNK
	u+wqmX+xV2PnruZCqhpHYom37iHOYLF0vAwJUT/kXa8fC7O0MhKoYyh/9foqqmb/UFVu+IBeV7t
	bNg0qdk7/3PxppaVHfOWJ48fuZxfV3f/oAcbgSDe925JgcoV5OCCJBWlnxiee1J6SYbNkXIHjKA
	goXq0kS3vHn8FUD0JWdZMk0/rvpQ6mZoEQFuq49KvLThFJOx
X-Google-Smtp-Source: AGHT+IFBUodrO2XKQIiwzTtHA/m8Q0lEsRRL9iE7J3KYXgrGSCiuYQrK9rEZ8la7pXGRsNR2J1eheQ==
X-Received: by 2002:a05:600c:3582:b0:442:f482:c429 with SMTP id 5b1f17b1804b1-4538ee3b4dcmr12330455e9.8.1750992779126;
        Thu, 26 Jun 2025 19:52:59 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::302c])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-4538a4213f0sm36194695e9.36.2025.06.26.19.52.51
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 19:52:58 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
X-Google-Original-From: Lance Yang <lance.yang@linux.dev>
To: akpm@linux-foundation.org,
	david@redhat.com,
	21cnbao@gmail.com
Cc: baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	huang.ying.caritas@gmail.com,
	zhengtangquan@oppo.com,
	riel@surriel.com,
	Liam.Howlett@oracle.com,
	vbabka@suse.cz,
	harry.yoo@oracle.com,
	mingzhe.yang@ly.com,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH 1/1] mm/rmap: make folio unmap batching safe and support partial batches
Date: Fri, 27 Jun 2025 10:52:14 +0800
Message-ID: <20250627025214.30887-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_195301_055756_10D9EAFC 
X-CRM114-Status: GOOD (  17.66  )
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

From: Lance Yang <lance.yang@linux.dev>

As pointed out by David[1], the batched unmap logic in try_to_unmap_one()
can read past the end of a PTE table if a large folio is mapped starting at
the last entry of that table.

So let's fix the out-of-bounds read by refactoring the logic into a new
helper, folio_unmap_pte_batch().

The new helper now correctly calculates the safe number of pages to scan by
limiting the operation to the boundaries of the current VMA and the PTE
table.

In addition, the "all-or-nothing" batching restriction is removed to
support partial batches. The reference counting is also cleaned up to use
folio_put_refs().

[1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com

Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Barry Song <baohua@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
 mm/rmap.c | 46 ++++++++++++++++++++++++++++------------------
 1 file changed, 28 insertions(+), 18 deletions(-)

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..1320b88fab74 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,32 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
 #endif
 }
 
-/* We support batch unmapping of PTEs for lazyfree large folios */
-static inline bool can_batch_unmap_folio_ptes(unsigned long addr,
-			struct folio *folio, pte_t *ptep)
+static inline unsigned int folio_unmap_pte_batch(struct folio *folio,
+			struct page_vma_mapped_walk *pvmw,
+			enum ttu_flags flags, pte_t pte)
 {
 	const fpb_t fpb_flags = FPB_IGNORE_DIRTY | FPB_IGNORE_SOFT_DIRTY;
-	int max_nr = folio_nr_pages(folio);
-	pte_t pte = ptep_get(ptep);
+	unsigned long end_addr, addr = pvmw->address;
+	struct vm_area_struct *vma = pvmw->vma;
+	unsigned int max_nr;
+
+	if (flags & TTU_HWPOISON)
+		return 1;
+	if (!folio_test_large(folio))
+		return 1;
 
+	/* We may only batch within a single VMA and a single page table. */
+	end_addr = pmd_addr_end(addr, vma->vm_end);
+	max_nr = (end_addr - addr) >> PAGE_SHIFT;
+
+	/* We only support lazyfree batching for now ... */
 	if (!folio_test_anon(folio) || folio_test_swapbacked(folio))
-		return false;
+		return 1;
 	if (pte_unused(pte))
-		return false;
-	if (pte_pfn(pte) != folio_pfn(folio))
-		return false;
+		return 1;
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-			       NULL, NULL) == max_nr;
+	return folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+			       NULL, NULL, NULL);
 }
 
 /*
@@ -2024,9 +2033,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_dirty(pteval))
 				folio_mark_dirty(folio);
 		} else if (likely(pte_present(pteval))) {
-			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-				nr_pages = folio_nr_pages(folio);
+			nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
 			end_addr = address + nr_pages * PAGE_SIZE;
 			flush_cache_range(vma, address, end_addr);
 
@@ -2206,13 +2213,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			hugetlb_remove_rmap(folio);
 		} else {
 			folio_remove_rmap_ptes(folio, subpage, nr_pages, vma);
-			folio_ref_sub(folio, nr_pages - 1);
 		}
 		if (vma->vm_flags & VM_LOCKED)
 			mlock_drain_local();
-		folio_put(folio);
-		/* We have already batched the entire folio */
-		if (nr_pages > 1)
+		folio_put_refs(folio, nr_pages);
+
+		/*
+		 * If we are sure that we batched the entire folio and cleared
+		 * all PTEs, we can just optimize and stop right here.
+		 */
+		if (nr_pages == folio_nr_pages(folio))
 			goto walk_done;
 		continue;
 walk_abort:
-- 
2.49.0


