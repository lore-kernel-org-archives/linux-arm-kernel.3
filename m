Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3D39C02183
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jan 2025 04:10:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n9OhR8H2gjpx6QaBe0RO8fceTVFYek4y7WXPW0XqYgE=; b=TQLH+XZtnQk5eiP62HTY9LcsMb
	Mto30iZEIaff5ZrbUlmb8dH5szHm4uuKOTYUR0lVDcXrz+k8J8ThAyQWT+ioSK1dKADzvk4WagwRD
	Ez26qZOXek6xGgbkppyKyho/07U8pcPcMw+1CpX3ll17sT3epJKI73T1jhiB8JAdm+Xh29dHR8C+6
	mMBEFpQnhvN9WhJwhG52bQICllQbLUPItLoTnIKkE0uRJO2uCrvrL8quJKv4cqu1wNu4Gsc2PbbAP
	CDIiyzqmYtMGAa02aZ4/Gk5lErmv8Mu5WoUGAv9RgbbuX4tnh5JMLwhZXFk13Sn4p7e3DVAi/mvEe
	xLp0Jbig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYGK-00000007PhN-3M5H;
	Tue, 14 Jan 2025 04:10:44 +0000
Received: from mail-pl1-x62c.google.com ([2607:f8b0:4864:20::62c])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXYF3-00000007PY4-2ndL;
	Tue, 14 Jan 2025 04:09:27 +0000
Received: by mail-pl1-x62c.google.com with SMTP id d9443c01a7336-2164b662090so84613725ad.1;
        Mon, 13 Jan 2025 20:09:24 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736827764; x=1737432564; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=n9OhR8H2gjpx6QaBe0RO8fceTVFYek4y7WXPW0XqYgE=;
        b=PII0gMM+XnMYVu9KZAb8mmCFgh13jZksQV3tVXtnwfPs3FflIcu170UNFrz9DMlVBy
         Wha4d74hhWpdii29H2ZLG8Eij2A+KS1bLDaSXf8wedIrKZCybI6BmeFV7sDYe9P/8nZf
         +3S3IIWlsMghlr42mnAc3JyTvZHVnTBzAvYPWkaItMRm+a6Ee6xSQe82WWLQ7cxWgoPW
         lYc5gs6AwQ3H3kZIz7DofMCZ6dK0PE7z4GhnL0rsrmE/2QTRyMwuftVS3kWlA4KPp2Nl
         OPmVq+Lcyfqx/YDMVVcmkIC5g5QIIXZ94dYKZE9GSJG5erABecuIn2w20v/ynNYk4Obn
         C+9g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736827764; x=1737432564;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=n9OhR8H2gjpx6QaBe0RO8fceTVFYek4y7WXPW0XqYgE=;
        b=C8C9lelbidoK9j2R8y0pkVaiVdNM2D0JA6icSEoV8S5eXNBcfIb+hjdnamROVxifpC
         BkDvSpymTRfWjBnXXup3Gc7B+rfgrMivn6l/a3rAI958w56CZrizWtIiD6uitpLj0pv2
         GSWrTtBpjBT6FcR7UdWuX7vySn/u1GJ9Rq0uCcMZeV+farlFcS/M2xblDr+wlf6Gq2ti
         pYmssLzi+tNm7Cmr1B7MDao3jaIiTHv6VMmD99GN+TWWVhwZgj3B+3Fgx0u5LkobGzPL
         nV8eL9uzT8ekBEmqSGGSWV5+QSuOnlUY2KdG4tbOCl5JvGiG0+Ftdc3P+maLPahvx2ue
         vqpA==
X-Forwarded-Encrypted: i=1; AJvYcCWQNH+LY01y30rNZ3lwuCuWshc+pOTHsBzswbcSRPnTKCqGZPepGYQXtE2FyQXN5/LvR/vmJLhgGtGlyzrRIc8p@lists.infradead.org, AJvYcCWV0DVgLN8oYvdYovnlt1Dj9YN7cvKRzvbSLTQh/Lu9IJradvLcTEDiMYzSV7UW1hwV8rT2ys6GN60O5xw=@lists.infradead.org
X-Gm-Message-State: AOJu0YzYkK3nroSGzVB07sWxoIknxWjwRQAWUVslke+ikC2qM7PVIe3E
	2S8RPvJ+S30K2+0qePP2jjvRmHkuTjg8GY/JUa75pDb2oYxku/FZ
X-Gm-Gg: ASbGncsKxCAbRSj0bYj7Hw+emERxiHiK31p7FYFWnKvE9bSt/Wqumjuvzp8alhFO7Gw
	wR2TuIRdgIBdgwJQr7pe6lKDJfXk46IT9cnpkyRiGsFv6TqgkPuSMoteIBd9NEFukNhcaoboHx5
	B7XK4EKaE24RAyGL+LV+zAu85ZhLRxsowmW+c67/wZjbb8L7gQ9XwIom54B03YdvHk2MlhnWuy0
	Z76fYcKA/xCGoNGNJBmLgzfDB+49fsa2CPfJTN4eedyWholIUjEBwRipPgClewTyemfvoxZiMT9
	KGRcTqjy
X-Google-Smtp-Source: AGHT+IHT2li0BzNMESB2ucdlAXFPz0+v3u/41Z6CwFvGFPW3mNOsWkDv1pbcf1Z6H258l6sGfOmnJg==
X-Received: by 2002:a17:902:ecc5:b0:216:57a6:2887 with SMTP id d9443c01a7336-21a83f5db98mr392066215ad.21.1736827764068;
        Mon, 13 Jan 2025 20:09:24 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-2f54a2872a3sm10803658a91.16.2025.01.13.20.09.17
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Mon, 13 Jan 2025 20:09:23 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: baolin.wang@linux.alibaba.com
Cc: 21cnbao@gmail.com,
	akpm@linux-foundation.org,
	chrisl@kernel.org,
	david@redhat.com,
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
	ying.huang@intel.com,
	zhengtangquan@oppo.com
Subject: Re: [PATCH v2 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped THP in try_to_unmap
Date: Tue, 14 Jan 2025 17:09:14 +1300
Message-Id: <20250114040914.9986-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <c35845be-46dc-4868-b8f7-beb44eee04cc@linux.alibaba.com>
References: <c35845be-46dc-4868-b8f7-beb44eee04cc@linux.alibaba.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250113_200925_710428_51F17A29 
X-CRM114-Status: GOOD (  31.22  )
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

On Tue, Jan 14, 2025 at 4:40 PM Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
>
>
>
> On 2025/1/13 11:39, Barry Song wrote:
> > From: Barry Song <v-songbaohua@oppo.com>
> >
> > The try_to_unmap_one() function currently handles PMD-mapped THPs
> > inefficiently. It first splits the PMD into PTEs, copies the dirty
> > state from the PMD to the PTEs, iterates over the PTEs to locate
> > the dirty state, and then marks the THP as swap-backed. This process
> > involves unnecessary PMD splitting and redundant iteration. Instead,
> > this functionality can be efficiently managed in
> > __discard_anon_folio_pmd_locked(), avoiding the extra steps and
> > improving performance.
> >
> > The following microbenchmark redirties folios after invoking MADV_FREE,
> > then measures the time taken to perform memory reclamation (actually
> > set those folios swapbacked again) on the redirtied folios.
> >
> >   #include <stdio.h>
> >   #include <sys/mman.h>
> >   #include <string.h>
> >   #include <time.h>
> >
> >   #define SIZE 128*1024*1024  // 128 MB
> >
> >   int main(int argc, char *argv[])
> >   {
> >       while(1) {
> >               volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
> >                               MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> >
> >               memset((void *)p, 1, SIZE);
> >               madvise((void *)p, SIZE, MADV_FREE);
> >               /* redirty after MADV_FREE */
> >               memset((void *)p, 1, SIZE);
> >
> >               clock_t start_time = clock();
> >               madvise((void *)p, SIZE, MADV_PAGEOUT);
> >               clock_t end_time = clock();
> >
> >               double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
> >               printf("Time taken by reclamation: %f seconds\n", elapsed_time);
> >
> >               munmap((void *)p, SIZE);
> >       }
> >       return 0;
> >   }
> >
> > Testing results are as below,
> > w/o patch:
> > ~ # ./a.out
> > Time taken by reclamation: 0.007300 seconds
> > Time taken by reclamation: 0.007226 seconds
> > Time taken by reclamation: 0.007295 seconds
> > Time taken by reclamation: 0.007731 seconds
> > Time taken by reclamation: 0.007134 seconds
> > Time taken by reclamation: 0.007285 seconds
> > Time taken by reclamation: 0.007720 seconds
> > Time taken by reclamation: 0.007128 seconds
> > Time taken by reclamation: 0.007710 seconds
> > Time taken by reclamation: 0.007712 seconds
> > Time taken by reclamation: 0.007236 seconds
> > Time taken by reclamation: 0.007690 seconds
> > Time taken by reclamation: 0.007174 seconds
> > Time taken by reclamation: 0.007670 seconds
> > Time taken by reclamation: 0.007169 seconds
> > Time taken by reclamation: 0.007305 seconds
> > Time taken by reclamation: 0.007432 seconds
> > Time taken by reclamation: 0.007158 seconds
> > Time taken by reclamation: 0.007133 seconds
> > …
> >
> > w/ patch
> >
> > ~ # ./a.out
> > Time taken by reclamation: 0.002124 seconds
> > Time taken by reclamation: 0.002116 seconds
> > Time taken by reclamation: 0.002150 seconds
> > Time taken by reclamation: 0.002261 seconds
> > Time taken by reclamation: 0.002137 seconds
> > Time taken by reclamation: 0.002173 seconds
> > Time taken by reclamation: 0.002063 seconds
> > Time taken by reclamation: 0.002088 seconds
> > Time taken by reclamation: 0.002169 seconds
> > Time taken by reclamation: 0.002124 seconds
> > Time taken by reclamation: 0.002111 seconds
> > Time taken by reclamation: 0.002224 seconds
> > Time taken by reclamation: 0.002297 seconds
> > Time taken by reclamation: 0.002260 seconds
> > Time taken by reclamation: 0.002246 seconds
> > Time taken by reclamation: 0.002272 seconds
> > Time taken by reclamation: 0.002277 seconds
> > Time taken by reclamation: 0.002462 seconds
> > …
> >
> > This patch significantly speeds up try_to_unmap_one() by allowing it
> > to skip redirtied THPs without splitting the PMD.
> >
> > Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
> > Suggested-by: Lance Yang <ioworker0@gmail.com>
> > Signed-off-by: Barry Song <v-songbaohua@oppo.com>
> > ---
> >   mm/huge_memory.c | 17 ++++++++++++++---
> >   mm/rmap.c        | 11 ++++++++++-
> >   2 files changed, 24 insertions(+), 4 deletions(-)
> >
> > diff --git a/mm/huge_memory.c b/mm/huge_memory.c
> > index 3d3ebdc002d5..aea49f7125f1 100644
> > --- a/mm/huge_memory.c
> > +++ b/mm/huge_memory.c
> > @@ -3070,8 +3070,12 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
> >       int ref_count, map_count;
> >       pmd_t orig_pmd = *pmdp;
> >  
> > -     if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
> > +     if (pmd_dirty(orig_pmd))
> > +             folio_set_dirty(folio);
> > +     if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
> > +             folio_set_swapbacked(folio);
> >               return false;
> > +     }
> >  
> >       orig_pmd = pmdp_huge_clear_flush(vma, addr, pmdp);
> >  
> > @@ -3098,8 +3102,15 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
> >        *
> >        * The only folio refs must be one from isolation plus the rmap(s).
> >        */
> > -     if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
> > -         ref_count != map_count + 1) {
> > +     if (pmd_dirty(orig_pmd))
> > +             folio_set_dirty(folio);
> > +     if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
> > +             folio_set_swapbacked(folio);
> > +             set_pmd_at(mm, addr, pmdp, orig_pmd);
> > +             return false;
> > +     }
> > +
> > +     if (ref_count != map_count + 1) {
> >               set_pmd_at(mm, addr, pmdp, orig_pmd);
> >               return false;
> >       }
> > diff --git a/mm/rmap.c b/mm/rmap.c
> > index 3ef659310797..02c4e4b2cd7b 100644
> > --- a/mm/rmap.c
> > +++ b/mm/rmap.c
> > @@ -1671,7 +1671,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >       DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
> >       pte_t pteval;
> >       struct page *subpage;
> > -     bool anon_exclusive, ret = true;
> > +     bool anon_exclusive, lazyfree, ret = true;
> >       struct mmu_notifier_range range;
> >       enum ttu_flags flags = (enum ttu_flags)(long)arg;
> >       int nr_pages = 1;
> > @@ -1724,9 +1724,18 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
> >               }
> >  
> >               if (!pvmw.pte) {
> > +                     lazyfree = folio_test_anon(folio) && !folio_test_swapbacked(folio);
>
> You've checked lazyfree here, so can we remove the duplicate check in
> unmap_huge_pmd_locked()? Then the code should be:
>
>                 if (lazyfree && unmap_huge_pmd_locked(...))
>                         goto walk_done;


right. it seems unmap_huge_pmd_locked() only handles lazyfree pmd-mapped
thp. so i guess the code could be:

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index aea49f7125f1..c4c3a7896de4 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3131,11 +3131,10 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 	VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
 	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
 	VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
+	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
+	VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
 
-	if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
-		return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
-
-	return false;
+	return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
 }
 
 static void remap_page(struct folio *folio, unsigned long nr, int flags)
diff --git a/mm/rmap.c b/mm/rmap.c
index 02c4e4b2cd7b..72907eb1b8fe 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1671,7 +1671,7 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 	DEFINE_FOLIO_VMA_WALK(pvmw, folio, vma, address, 0);
 	pte_t pteval;
 	struct page *subpage;
-	bool anon_exclusive, lazyfree, ret = true;
+	bool anon_exclusive, ret = true;
 	struct mmu_notifier_range range;
 	enum ttu_flags flags = (enum ttu_flags)(long)arg;
 	int nr_pages = 1;
@@ -1724,18 +1724,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 
 		if (!pvmw.pte) {
-			lazyfree = folio_test_anon(folio) && !folio_test_swapbacked(folio);
-
-			if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
-						  folio))
-				goto walk_done;
-			/*
-			 * unmap_huge_pmd_locked has either already marked
-			 * the folio as swap-backed or decided to retain it
-			 * due to GUP or speculative references.
-			 */
-			if (lazyfree)
+			if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
+				if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
+					goto walk_done;
+				/*
+				 * unmap_huge_pmd_locked has either already marked
+				 * the folio as swap-backed or decided to retain it
+				 * due to GUP or speculative references.
+				 */
 				goto walk_abort;
+			}
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				/*

>
> >                       if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
> >                                                 folio))
> >                               goto walk_done;
> > +                     /*
> > +                      * unmap_huge_pmd_locked has either already marked
> > +                      * the folio as swap-backed or decided to retain it
> > +                      * due to GUP or speculative references.
> > +                      */
> > +                     if (lazyfree)
> > +                             goto walk_abort;
> >  
> >                       if (flags & TTU_SPLIT_HUGE_PMD) {
> >                               /*

