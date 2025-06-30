Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89E01C7EE30
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 30 Jun 2025 01:15:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=qvYmFatUul6C95sdqfwhbwawXh1OZ/t57imv68gIbAs=; b=1Jb2YyiZrIATcXXAYY9N7BA/w4
	ZVsz9fctp+4dCrhzle0FtR3B76x4pOFKTuFrNFFQfWDZrdi3Pbxi6dK1rK2kKTA+K1FmIcxG7RUUu
	aiNGWUQaoIgB4tst2+jJuNiVu4cMU/7Qz0IjKBZ/d2/5orT26ariXFEHgXZL2/bHBwyfhz/TW0oDB
	lmGCaK+TF0RtYWlApJ9r1KBe6l7AXSDAV5/jyZNQpXYnSS7XSTJDzoIGY0x0rV9YqiJirIWBiIn3s
	1qUqEBhK7IrqQNOh9NDLlw+XNWa1K1DPydG4Np5TeB3/VtRm15ISdKDh+zENkqaz2sepd1JUQoVXC
	5bA7kVYQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW37Y-00000000xZ0-354D;
	Mon, 30 Jun 2025 01:15:44 +0000
Received: from mail-wr1-x433.google.com ([2a00:1450:4864:20::433])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uW35E-00000000xJ1-0OR1;
	Mon, 30 Jun 2025 01:13:21 +0000
Received: by mail-wr1-x433.google.com with SMTP id ffacd0b85a97d-3a57ae5cb17so909722f8f.0;
        Sun, 29 Jun 2025 18:13:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751245998; x=1751850798; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=qvYmFatUul6C95sdqfwhbwawXh1OZ/t57imv68gIbAs=;
        b=lt1kgp73AjmEO+Dz5diIkVIlYlmwZQACZLTXqfPH+wBpnE5zZbsUYL7pO2u5O7Cd/g
         y/cFmdfBMabGIyVuGtWlEDQdEZGyrRqqKw/mL73LC8ehyUaMgcaOKZt81yFk+AvlTUIW
         l1TPbxY+C8LqMA+czRFuime5HzHoC/iZ9u4CHx9RFxGhjWoOMKJPgkxRrcpeVYQalvXY
         SkJ9cd2TiaDymvjy0SAuGs6YxgqarYJ8jTDJAGnEq5rkW47plIHpeV6RkgX7RVE46/ql
         7llsG+5qRyOM/X6/OvrfWR+MZOC29pUHaRzVpHDsN4bvj5SCF3i8zfaFM8N/aa+pCxMZ
         7X3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751245998; x=1751850798;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=qvYmFatUul6C95sdqfwhbwawXh1OZ/t57imv68gIbAs=;
        b=xEg9UhT7aIeJP/NFvcYGhIv99/Wj/abrVOIZG14bJq7he6mfgLecIwaoU7LDZus59F
         pVr3jGoVMkij3f2Y0ZM9zecO40wMYisuQjlV9Vc4QTNPE01zI3WxGx5QZvA/3Fe5P3al
         602m82YfkJEQyZD2VIY9wSSqsdQrLKrSXre/cBqwbOpMsReTL7JbIqH/VOYR64UlEUhd
         ajfbvqCpVwYRnSJoWD8yb4f1HGjDG+YulKcoSXc8rFA2PvFS59eeYvV5NoGewF1NJR1o
         /P8EK/lwiPKM+cNVQpVWp7w2rKvyFDSlQSxoBMNj9J8klAMJaogU8QL7Ld8UkJF6tHm8
         L34Q==
X-Forwarded-Encrypted: i=1; AJvYcCWbpAM9oUC7eCfRRMPk66/Sp7jjkfIh8Cc6Sht0FFHGezx6eRYkE7cgAtjevtOFzmXpL+bDncun8mqCsSE=@lists.infradead.org, AJvYcCXlm3pO86Z9a4Ry9eqs8drx8C/WH2g9C1WghrxiyZHAkRIKqRCeSjheS5cjPa8IQnQg67Z1G2CS4lnCXSEuZtWJ@lists.infradead.org
X-Gm-Message-State: AOJu0YyDcAOxlSoJ0BVm3+9fEL8aLfs85d5fYNVZmDAKrSIw+yKguuPW
	dePwVAowLWiOfSuj/A2gvTpgK+fNQt4CMR80NmCyfe96frfgMitDaP2M
X-Gm-Gg: ASbGnct13yFGqzNT50i3kvcT3qBQYMJo4+p8K4stDL+nlOKNKRKaFYFs3KsbmWbr6MK
	BUA9Sv+XvVtvs5I+ENrKX+NIJWN8AqOzcPn7kFyLA5G8kp0zRT4DNAuePt/W5gbHunrFJnRUgO7
	SkL2gmdgDl2mVTZMaZTAZAc7SxYvkWjF0NM+gQr6rsQI7pCoxKktGIjvCzTP8+8CsTldetEQHET
	BRYTS8yDgobAX2oK6F2d3iM1TCNxavItDSH5d1Vakf+EPbTk+Y0c5uMNyCdeTy/c4jkP0EtTcx5
	ckz5iCUUeE/ewTfHweSVC+fRSLfOdPSAUGJ+ectmUHGC86D9
X-Google-Smtp-Source: AGHT+IG9vFE1ILgi8HDEneBoTPP9xiU1dYIZXp7wDUVsQw07A+lHFULl/cv0/NgbZly8KJ0xCHEmug==
X-Received: by 2002:a05:6000:42c7:b0:3a4:e5bc:9892 with SMTP id ffacd0b85a97d-3a8f50cc97cmr7907228f8f.21.1751245997833;
        Sun, 29 Jun 2025 18:13:17 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::302c])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a88c7e74fbsm9123735f8f.10.2025.06.29.18.13.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 29 Jun 2025 18:13:17 -0700 (PDT)
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
	stable@vger.kernel.org,
	Barry Song <baohua@kernel.org>,
	Lance Yang <lance.yang@linux.dev>
Subject: [PATCH v3 1/1] mm/rmap: fix potential out-of-bounds page table access during batched unmap
Date: Mon, 30 Jun 2025 09:13:05 +0800
Message-ID: <20250630011305.23754-1-lance.yang@linux.dev>
X-Mailer: git-send-email 2.49.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250629_181320_135413_2EFDEB1F 
X-CRM114-Status: GOOD (  18.99  )
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
may read past the end of a PTE table when a large folio's PTE mappings
are not fully contained within a single page table.

While this scenario might be rare, an issue triggerable from userspace must
be fixed regardless of its likelihood. This patch fixes the out-of-bounds
access by refactoring the logic into a new helper, folio_unmap_pte_batch().

The new helper correctly calculates the safe batch size by capping the scan
at both the VMA and PMD boundaries. To simplify the code, it also supports
partial batching (i.e., any number of pages from 1 up to the calculated
safe maximum), as there is no strong reason to special-case for fully
mapped folios.

[1] https://lore.kernel.org/linux-mm/a694398c-9f03-4737-81b9-7e49c857fcbe@redhat.com

Fixes: 354dffd29575 ("mm: support batched unmap for lazyfree large folios during reclamation")
Cc: <stable@vger.kernel.org>
Acked-by: Barry Song <baohua@kernel.org>
Suggested-by: David Hildenbrand <david@redhat.com>
Suggested-by: Barry Song <baohua@kernel.org>
Signed-off-by: Lance Yang <lance.yang@linux.dev>
---
v2 -> v3:
 - Tweak changelog (per Barry and David)
 - Pick AB from Barry - thanks!
 - https://lore.kernel.org/linux-mm/20250627062319.84936-1-lance.yang@linux.dev

v1 -> v2:
 - Update subject and changelog (per Barry)
 - https://lore.kernel.org/linux-mm/20250627025214.30887-1-lance.yang@linux.dev

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


