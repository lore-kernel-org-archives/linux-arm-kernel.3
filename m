Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8B61C7EE32
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Jun 2025 09:58:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vfPg1bPzYUgjbdKxXUbIHHPyI6o1ylxUcethQzPOy2s=; b=NsYCbcmeAleryinG/2XKcU45qz
	mPzjsfEoazeYLb6eS6hrHgo/e+hjlH/MRxlcsezozHa6SqcZ3EYh2qPa/ldMuIM0c0VYMv4qKvKrh
	3Y+Wt1vczJFL0TN5JcXc8/7UXBzX8rD5Y+axvLdpJ/ALEMosP2aRGnuvKX6Ezn0D8M2HjmvffWJZg
	nBxsLpCq2UNobolxsVwJ1MFCxuf6GWqk1bWra6tMPOPExIkTK4MeNWA53axTNqTOtGcK278RC01MC
	SxvNW0IjmCwl/g9p0qRmOLBvfRb3Jaxv5BWR9vkw95JN5E1dG060sOAXjLljEzoxEQK55xBX4Ta5y
	U9DV2cFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUjNa-0000000BDnx-0GK3;
	Thu, 26 Jun 2025 09:58:50 +0000
Received: from mail-wr1-x42a.google.com ([2a00:1450:4864:20::42a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUiux-0000000B8g9-3xgt;
	Thu, 26 Jun 2025 09:29:17 +0000
Received: by mail-wr1-x42a.google.com with SMTP id ffacd0b85a97d-3a50fc819f2so551756f8f.2;
        Thu, 26 Jun 2025 02:29:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750930154; x=1751534954; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=vfPg1bPzYUgjbdKxXUbIHHPyI6o1ylxUcethQzPOy2s=;
        b=MzBz7bZ8GIzMiF0e83orZBlahEM2X6Aio15Q5pJsU5Z9ASdPoRiApc7RDj8kC6hBIb
         9bkndeOMTS8JQSHNiguOIe95cmzT2eEd/THVsLPoxSYwmZILfN+T7zNsTNOy2X809uNp
         ya6I0J6nvg1NrkX9rIeTGQWtSny7bXK8o6y7U7U67CPqBGppBlZdci6h80kOpnaaK8lC
         JS+0UtEradVw9BPsjkSqCATelLw5f90EDTjiK9PRDD1B7AMejynXOQ2XfAHtLVVw+29/
         35MltTEtAGFFCWeZkWt9dcBmPsYMnJqSB7da5cRZ9lvbx4afu0eg1+AlISxXI+IqXkoO
         AuzA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750930154; x=1751534954;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=vfPg1bPzYUgjbdKxXUbIHHPyI6o1ylxUcethQzPOy2s=;
        b=AAlg33Geeelw6BF6VhfFlRhftG9rqUuMQVOz6vyGfkDyFl55HGHC87AbV3WXrrKhBQ
         KV74sKG96Sm0yViY4wNpUjj2gWyvO+1QdkCainak0SeLyH1zSSozDKcnO2F5fRigz/bR
         /btgI7wk+Eu6x4fEipv4GMOLhwTeq1G97mTaU2pigDwjMukUubg2xOibJuhceGdE1ih3
         vgMRVZopRbAs/Dy6Uwfc6Wmefih5XTo7TUrFoA9cUs9Cj6nCvm4obrUmb5rpKHAkuSa9
         rRY6hfMvW9SKdJYNQi/Wwq5WMisgtj2D/tTEpHREFivNaZdv9y6uZDE7eGCDO6w40WaZ
         Tovw==
X-Forwarded-Encrypted: i=1; AJvYcCUhlYq7Sby8Wrdk8XOdLvltKj8u28VOKZr7ZSssT5POSwz1YmqHqZuXmd6Ji+mBPDyZCDNUh6Rr5n8inDqNRJgN@lists.infradead.org, AJvYcCVjpmF46L+g4zG1uBNCtu9RsQ/1O5v4GlqBxpvq7gPx1AusvUAuVLqR2PW5hCpSa8VhniB28B24rlv7Yp4=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywvqkym+TvF+1coYzkJuBBsNHabXbjYLriTC7B4+XDSTSSAfCjp
	CtCszEyMPFm7rl8HOAxkVsi9Ut4znjNcVZ4OnWReEoliZYw+m94rFJdd
X-Gm-Gg: ASbGncs3RRseZEuF14R97pOGo+AcZOWcnVtg5xSoozJfM/Hu6xkKcVUtjqkJN2WHcXX
	9yiCSZ1g0R3+k6zuwBL/qsK0YlvRGtP8cJekXGe+x52hsFE+gZrIYytgJsOf6eBejnCcMHNa+3m
	AFdMsL29p75+GVpmQ9tnzd56pRYxQxrYK4AqLutOblx/BFyFdT206PvB7AvRyJLp6i6LiRyN5e9
	FdlACuozcfVjxaXjfQNjNs8eC3GC0Ghqpj90+hTvDZceTUylHD6gc72OvXWOoKK6zYcvzfe6tTN
	0stDpV20id0TjZ1Xy+OuB9FqzI/oBuRJ9BoR9MHotvzJAPQ=
X-Google-Smtp-Source: AGHT+IFKXFVQqQF/e1a/uqOSmFAWHw7Suwi2bBnIU1uj7qmwG8d6IbJ3C4uZB9qONaL/NItzf1KkxQ==
X-Received: by 2002:a05:6000:4112:b0:3a5:8905:2dda with SMTP id ffacd0b85a97d-3a6ed646c23mr5123244f8f.43.1750930153481;
        Thu, 26 Jun 2025 02:29:13 -0700 (PDT)
Received: from EBJ9932692.tcent.cn ([2a09:0:1:2::3086])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-3a6e8113b00sm7002427f8f.96.2025.06.26.02.29.09
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Thu, 26 Jun 2025 02:29:13 -0700 (PDT)
From: Lance Yang <ioworker0@gmail.com>
To: david@redhat.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	ioworker0@gmail.com,
	kasong@tencent.com,
	lance.yang@linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	linux-riscv@lists.infradead.org,
	lorenzo.stoakes@oracle.com,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v4 3/4] mm: Support batched unmap for lazyfree large folios during reclamation
Date: Thu, 26 Jun 2025 17:29:05 +0800
Message-ID: <20250626092905.31305-1-ioworker0@gmail.com>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com>
References: <a5b5b0aa-21c4-4abf-b323-63af96aabcd5@redhat.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250626_022915_984821_C989806A 
X-CRM114-Status: GOOD (  15.25  )
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

Before I send out the real patch, I'd like to get some quick feedback to
ensure I've understood the discussion correctly ;)

Does this look like the right direction?

diff --git a/mm/rmap.c b/mm/rmap.c
index fb63d9256f09..5ebffe2137e4 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1845,23 +1845,37 @@ void folio_remove_rmap_pud(struct folio *folio, struct page *page,
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
+
+	/* ... where we must be able to batch the whole folio. */
+	if (pte_pfn(pte) != folio_pfn(folio) || max_nr != folio_nr_pages(folio))
+		return 1;
+	max_nr = folio_pte_batch(folio, addr, pvmw->pte, pte, max_nr, fpb_flags,
+				 NULL, NULL, NULL);
 
-	return folio_pte_batch(folio, addr, ptep, pte, max_nr, fpb_flags, NULL,
-			       NULL, NULL) == max_nr;
+	return (max_nr != folio_nr_pages(folio)) ? 1 : max_nr;
 }
 
 /*
@@ -2024,9 +2038,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 			if (pte_dirty(pteval))
 				folio_mark_dirty(folio);
 		} else if (likely(pte_present(pteval))) {
-			if (folio_test_large(folio) && !(flags & TTU_HWPOISON) &&
-			    can_batch_unmap_folio_ptes(address, folio, pvmw.pte))
-				nr_pages = folio_nr_pages(folio);
+			nr_pages = folio_unmap_pte_batch(folio, &pvmw, flags, pteval);
 			end_addr = address + nr_pages * PAGE_SIZE;
 			flush_cache_range(vma, address, end_addr);
 
@@ -2206,13 +2218,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
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

Thanks,
Lance

