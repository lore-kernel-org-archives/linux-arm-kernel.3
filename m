Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D9CEC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:38:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OYdDqavtq9jUGmr9BTt10VNZtJWCJbWghGFQiFP0UEc=; b=1gSn6o4FoyJHPsu0hgTTJ0XKO8
	khdieMH2Y0lyi/BtUdZIdx2aq4YKoxe5E+KvNGm8vixTafIcSJuk2lzhxSk2oOlJH54FCQPC5jqpI
	K3cjxf9NlYuRdPEi0dD7t2wEZfzf6tj2jXzmocFTf6qhILpMNRGmQRgGoVuztxunfWio0LZ7CCfr8
	dCoqu8b8IxjrQTE278krFmGZc/jbapU1ggLmsKGpFFQJvu/7FRadnN4bgJh+VVUsc48q/iINellBg
	gscPWcbet+8PAu8Sz0NWMhtIqDq69Xq4Uk+A10ZuKaDFvoDYHCHImqJtTb8yNbpFESMrLEb0XLin9
	0kE4XUJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tis91-0000000EMNb-42Gh;
	Fri, 14 Feb 2025 09:37:59 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tis2I-0000000EKZD-34HH;
	Fri, 14 Feb 2025 09:31:03 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-21f6a47d617so30942585ad.2;
        Fri, 14 Feb 2025 01:31:02 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739525462; x=1740130262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=OYdDqavtq9jUGmr9BTt10VNZtJWCJbWghGFQiFP0UEc=;
        b=WzWHKmmT6MwiO24y+vBEWGijhaXsuwiDa5/S0aF9KpSDtiLoEQBTObswKTNdRZ5bqg
         pRh42PI2Vc+Jk84txKXX2vKM5YQIAx0VCjiZfjUj1mszSxBf/gCVoASZmHbftDw8gMCU
         qyVvFBmPMutCt03dCBvkXYft2F9+k54RDd2FTzZ8ZxiC5643oi/qHEpGmVDlwbEzxHAL
         4v7Ja1Kc5Xj2ZdLBC6uXcFi4fmgdzyWf0J+Vzp/logy/SyFbTcVMPIHWfB6TJFKMtSqt
         qsQlKqNtfytw3uyni3fHbgMhPs4AsraHHREHHOZhEksXoH6EKOpNapIgpP2wSnjav6Gb
         Eoyg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525462; x=1740130262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=OYdDqavtq9jUGmr9BTt10VNZtJWCJbWghGFQiFP0UEc=;
        b=QxiuURx3pPJqlEo7xYOYIsj5hnymnERmoniY69EN7sW/4EQyxYCHrltJGNUpAJAN/h
         WQlcDd3leQmQyXSWXU+BqiGvh7QfvIa5mlRsrM6eXOJKubNIbdbsFsss/PaMJ962sTq2
         3Ix4Pok47l5pOYTPNlCgXkWO1EXvAKXV7T1w6M1hHQg+aGfFYJKqqy56R3dpDluQ+d0C
         m4JSbWr7epE09x6jUD8nuAj3m28ZhnyUDUwU5QDJODX+bP0fY5TR+CbYOj6klbmSxksS
         igPTRhTkyrJOxSv1iEwwvz66SxMvT0i4PC3fsheREMySerOod1yQtTHbePQZhoK7/ZTC
         fCVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVkQZIUt9IHxkx5eTajlEPskmvCBvPJ+lDcEiTME4UHgXdT66/HQ4Ea2RB7rklewkr+CkSHJ7hJpje0FO0edjzA@lists.infradead.org, AJvYcCWhHjIIIGKGCm7yi/KEtx+RPdggYJV0Ffv0mmIN0rVCZ378JEl1xeoKB8kkY3QsaYcF6oEr8g7C7t4IKRY=@lists.infradead.org
X-Gm-Message-State: AOJu0YzWLtliMJSuTs2qTk7yIh9NTjC+9Mtrm8MadHIADL4bm34nA6R6
	a0Uilo2oE52ohjfVaUpVtgklgz3BYHWSVdJwLdGU+JbBlwg8fcth
X-Gm-Gg: ASbGncuFBhrEyUSTsLOpKcb0coH73KStf70+sRCDFLmiw5sxbafyxWjrOPWFMJ03IrQ
	mvANDZ5h631Fzp/5ity5ANlMKWjLhjuAytC1RFEjntHy25tiJD8/6UpXXgCGH3sD3TcSg9FLAH5
	9taBpLTiUp+2urKytv+t8pzs/xHZB2rLhniCZ++N4Y6b+CWPsoOO54/V0u9668FVYKPRFAyq3Q2
	ASfzWvWZS+hFibVy7aUvqJxIlX0IzAW91dbETcy2X0uT4Z55bqhhNDNXgxY5DeQMyRrp2LXlUL4
	yLXnqskkJ8Oczf0aI1wMuFPuE9WFHjE=
X-Google-Smtp-Source: AGHT+IHG1ACAyCVdNpdCj3QS2lybJkeXxN0YXvZYc6Wbp6cHggvocX10uqRNnZxi4u23qNKsTl+Yhw==
X-Received: by 2002:a17:902:e5cc:b0:21f:3e2d:7d58 with SMTP id d9443c01a7336-220bbad65b4mr153804995ad.13.1739525461729;
        Fri, 14 Feb 2025 01:31:01 -0800 (PST)
Received: from Barrys-MBP.hub ([118.92.30.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c814sm25440515ad.148.2025.02.14.01.30.55
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Feb 2025 01:31:01 -0800 (PST)
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
	zhengtangquan@oppo.com
Subject: [PATCH v4 4/4] mm: Avoid splitting pmd for lazyfree pmd-mapped THP in try_to_unmap
Date: Fri, 14 Feb 2025 22:30:15 +1300
Message-Id: <20250214093015.51024-5-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
In-Reply-To: <20250214093015.51024-1-21cnbao@gmail.com>
References: <20250214093015.51024-1-21cnbao@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_013102_774893_897EB9D0 
X-CRM114-Status: GOOD (  14.41  )
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

The try_to_unmap_one() function currently handles PMD-mapped THPs
inefficiently. It first splits the PMD into PTEs, copies the dirty
state from the PMD to the PTEs, iterates over the PTEs to locate
the dirty state, and then marks the THP as swap-backed. This process
involves unnecessary PMD splitting and redundant iteration. Instead,
this functionality can be efficiently managed in
__discard_anon_folio_pmd_locked(), avoiding the extra steps and
improving performance.

The following microbenchmark redirties folios after invoking MADV_FREE,
then measures the time taken to perform memory reclamation (actually
set those folios swapbacked again) on the redirtied folios.

 #include <stdio.h>
 #include <sys/mman.h>
 #include <string.h>
 #include <time.h>

 #define SIZE 128*1024*1024  // 128 MB

 int main(int argc, char *argv[])
 {
 	while(1) {
 		volatile int *p = mmap(0, SIZE, PROT_READ | PROT_WRITE,
 				MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);

 		memset((void *)p, 1, SIZE);
 		madvise((void *)p, SIZE, MADV_FREE);
 		/* redirty after MADV_FREE */
 		memset((void *)p, 1, SIZE);

		clock_t start_time = clock();
 		madvise((void *)p, SIZE, MADV_PAGEOUT);
 		clock_t end_time = clock();

 		double elapsed_time = (double)(end_time - start_time) / CLOCKS_PER_SEC;
 		printf("Time taken by reclamation: %f seconds\n", elapsed_time);

 		munmap((void *)p, SIZE);
 	}
 	return 0;
 }

Testing results are as below,
w/o patch:
~ # ./a.out
Time taken by reclamation: 0.007300 seconds
Time taken by reclamation: 0.007226 seconds
Time taken by reclamation: 0.007295 seconds
Time taken by reclamation: 0.007731 seconds
Time taken by reclamation: 0.007134 seconds
Time taken by reclamation: 0.007285 seconds
Time taken by reclamation: 0.007720 seconds
Time taken by reclamation: 0.007128 seconds
Time taken by reclamation: 0.007710 seconds
Time taken by reclamation: 0.007712 seconds
Time taken by reclamation: 0.007236 seconds
Time taken by reclamation: 0.007690 seconds
Time taken by reclamation: 0.007174 seconds
Time taken by reclamation: 0.007670 seconds
Time taken by reclamation: 0.007169 seconds
Time taken by reclamation: 0.007305 seconds
Time taken by reclamation: 0.007432 seconds
Time taken by reclamation: 0.007158 seconds
Time taken by reclamation: 0.007133 seconds
…

w/ patch

~ # ./a.out
Time taken by reclamation: 0.002124 seconds
Time taken by reclamation: 0.002116 seconds
Time taken by reclamation: 0.002150 seconds
Time taken by reclamation: 0.002261 seconds
Time taken by reclamation: 0.002137 seconds
Time taken by reclamation: 0.002173 seconds
Time taken by reclamation: 0.002063 seconds
Time taken by reclamation: 0.002088 seconds
Time taken by reclamation: 0.002169 seconds
Time taken by reclamation: 0.002124 seconds
Time taken by reclamation: 0.002111 seconds
Time taken by reclamation: 0.002224 seconds
Time taken by reclamation: 0.002297 seconds
Time taken by reclamation: 0.002260 seconds
Time taken by reclamation: 0.002246 seconds
Time taken by reclamation: 0.002272 seconds
Time taken by reclamation: 0.002277 seconds
Time taken by reclamation: 0.002462 seconds
…

This patch significantly speeds up try_to_unmap_one() by allowing it
to skip redirtied THPs without splitting the PMD.

Suggested-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Suggested-by: Lance Yang <ioworker0@gmail.com>
Signed-off-by: Barry Song <v-songbaohua@oppo.com>
Reviewed-by: Baolin Wang <baolin.wang@linux.alibaba.com>
Reviewed-by: Lance Yang <ioworker0@gmail.com>
---
 mm/huge_memory.c | 24 +++++++++++++++++-------
 mm/rmap.c        | 13 ++++++++++---
 2 files changed, 27 insertions(+), 10 deletions(-)

diff --git a/mm/huge_memory.c b/mm/huge_memory.c
index 2eda2a9ec8fc..ab80348f33dd 100644
--- a/mm/huge_memory.c
+++ b/mm/huge_memory.c
@@ -3176,8 +3176,12 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 	int ref_count, map_count;
 	pmd_t orig_pmd = *pmdp;
 
-	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd))
+	if (pmd_dirty(orig_pmd))
+		folio_set_dirty(folio);
+	if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+		folio_set_swapbacked(folio);
 		return false;
+	}
 
 	orig_pmd = pmdp_huge_clear_flush(vma, addr, pmdp);
 
@@ -3204,8 +3208,15 @@ static bool __discard_anon_folio_pmd_locked(struct vm_area_struct *vma,
 	 *
 	 * The only folio refs must be one from isolation plus the rmap(s).
 	 */
-	if (folio_test_dirty(folio) || pmd_dirty(orig_pmd) ||
-	    ref_count != map_count + 1) {
+	if (pmd_dirty(orig_pmd))
+		folio_set_dirty(folio);
+	if (folio_test_dirty(folio) && !(vma->vm_flags & VM_DROPPABLE)) {
+		folio_set_swapbacked(folio);
+		set_pmd_at(mm, addr, pmdp, orig_pmd);
+		return false;
+	}
+
+	if (ref_count != map_count + 1) {
 		set_pmd_at(mm, addr, pmdp, orig_pmd);
 		return false;
 	}
@@ -3225,12 +3236,11 @@ bool unmap_huge_pmd_locked(struct vm_area_struct *vma, unsigned long addr,
 {
 	VM_WARN_ON_FOLIO(!folio_test_pmd_mappable(folio), folio);
 	VM_WARN_ON_FOLIO(!folio_test_locked(folio), folio);
+	VM_WARN_ON_FOLIO(!folio_test_anon(folio), folio);
+	VM_WARN_ON_FOLIO(folio_test_swapbacked(folio), folio);
 	VM_WARN_ON_ONCE(!IS_ALIGNED(addr, HPAGE_PMD_SIZE));
 
-	if (folio_test_anon(folio) && !folio_test_swapbacked(folio))
-		return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
-
-	return false;
+	return __discard_anon_folio_pmd_locked(vma, addr, pmdp, folio);
 }
 
 static void remap_page(struct folio *folio, unsigned long nr, int flags)
diff --git a/mm/rmap.c b/mm/rmap.c
index 8786704bd466..bcec8677f68d 100644
--- a/mm/rmap.c
+++ b/mm/rmap.c
@@ -1863,9 +1863,16 @@ static bool try_to_unmap_one(struct folio *folio, struct vm_area_struct *vma,
 		}
 
 		if (!pvmw.pte) {
-			if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd,
-						  folio))
-				goto walk_done;
+			if (folio_test_anon(folio) && !folio_test_swapbacked(folio)) {
+				if (unmap_huge_pmd_locked(vma, pvmw.address, pvmw.pmd, folio))
+					goto walk_done;
+				/*
+				 * unmap_huge_pmd_locked has either already marked
+				 * the folio as swap-backed or decided to retain it
+				 * due to GUP or speculative references.
+				 */
+				goto walk_abort;
+			}
 
 			if (flags & TTU_SPLIT_HUGE_PMD) {
 				/*
-- 
2.39.3 (Apple Git-146)


