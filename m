Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id B5265606A81A
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:18:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=xD31okN3;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=LvqGtCPM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=Ze3zkZKDchYqmhLj/EpeAe13TGzwVFVPgW/gvJcl0x0=; b=xD31okN3GcwRvi
	6UqMD6srRlVvnpNz2I6dQ0pXbkTxNXwcdlQMa6Pk0eAFGtOd+ykjk9uEX/5lAyZhHHfBK/eiGCYWV
	PHvDIVDJ3jiSiUKUrrVopsjRIgdbpYvPwWOebXLbF+uzo+yESika9pb2zjmRK2V/LJjkWCpdzkTtB
	6G2aYRHJunrASAL7rDowU0xrwMswhhVtK+x6ZISMQbIXP6FEts1HtUze0QTUN8feII4te1EZH/mTQ
	99GsXK9S1aTlIr+jdscnBh1UftZfndsW6MAxNSP7H0CB+mhA5JqtRfROsO6mc4aqVhbZvveIjNiIE
	wLf/QNCmJq4MpuAmSVzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBac-00000001xN9-3QRE;
	Tue, 03 Nov 2026 10:18:02 +0000
Received: from mail-dy1-x1329.google.com ([2607:f8b0:4864:20::1329])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBaa-00000001xKb-0Lj3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:18:01 +0000
Received: by mail-dy1-x1329.google.com with SMTP id 5a478bee46e88-35829219da8so613147eec.0
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:17:59 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701079; x=1794305879; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=Ze3zkZKDchYqmhLj/EpeAe13TGzwVFVPgW/gvJcl0x0=;
        b=LvqGtCPM/wlc7n6KURUb0wo6yfFGVOypVQMTJ3fLqjADowWioQyjpExfDpw5tFSDI4
         nt0YxEJ7Aw29A+fyhd8dKOcAg+93W1hiXsDX7Q36l4JRsdoK7N2GeJGcWQaM+jdFyb5G
         lnLO/Kqna/7fZ7IVDWl8yxWlxVE4O8cttnkd1UtaG6FQqVm5vSTF7/kJ4g0iV4/uh+HX
         7FMmcfs7PAdFbXZYx01FsRJwxQmlFzCH72lS+9B76hWk5xx7xlHYNYQbv8SyiGmnRcrL
         0BIajVh4pqKrbXujvX7Qgaw5jMLB6ltowOehDEgDL2vQLW6a+k4b3mgzFJiTNeHMTAsZ
         DFyQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701079; x=1794305879;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=Ze3zkZKDchYqmhLj/EpeAe13TGzwVFVPgW/gvJcl0x0=;
        b=oonax6RBlmP1fIlp5NXrTCv23C4fQjonh9z5hecGeG94Mn3qLpc0TFYhCVAeVUydFe
         PbITP0aP2/KKWzYRkMeKVVG8f+I5SFKWONXqKl1VcH4OsWiiujIBs13pMRREbOBg2J15
         jcNPBMxN3Qu2aKqEjTKsB1fBf+enFuVRyBaRizEwP8EF3/3LEjZ4YXkb2fHMaSen0Krm
         gV2KJMK7iVbb0pzSDCsYPr1PZMinXVM32CspBbDtLbFWNyQuRK+RQCCwrprd5+/sQkW3
         C/ycdG8ALHgWLT18tQG1O47/hfbwGstymNIsodRzM38/Wtp/vrkDseI5ITTMh4Dx2RIs
         nl+Q==
X-Forwarded-Encrypted: i=1; AKwUvByDJGmHmKpbBV/kmsieBmPU2QCnqUCLMoPsVYrxA46qN7hGgZ9BxzH0u23YFMWyW/TfhkkMeJIoKo9HpGGQ93x9@lists.infradead.org
X-Gm-Message-State: APuU4Z8+MElIa3cnMleRyDIsMPmd5B5sZ8DPXb8+tjVT9Qsncm+MCRLe
	LbFc4lEFlIePvFnGIk1ozMW07tYdPSTP0nlz3ACNi16kZK1GB5pJijry
X-Gm-Gg: AYBFou2W1iC7mbGhoTn7Ky/JYWiqvlx9JZ/IhCxxX4gRRjI2auxRryOcpXXQlcq18Pw
	zaEtDLdeGLz/JyzHyyEtscijdTJ/e8wIYTjnkABdxbej4o9zfNa87KWqO+3ULwpkRc0RkvAwx7/
	uxm3AlFtDxWVMkFxUDPdAP21zo9WTaPj9Dn6veuk+QgCIgxo/jRSPcb0OR/hgGENnZ/ZA/NG2oY
	+B0SkWGZ3SFMRnSYcPpcJSYivF+xeo073odoZVqDj1foMnOFNzxwDw8yk2PqtyYm6rONFYHvvqi
	Ciyk5W/OrLt57p6kIO3XbZbbRI2k6HI3GEM/ZHN967yWifNTyo8jSGm4qm7bW45oWFkM8IPUDFr
	QdbjtRCd6j9v02rplbj9vq5wJV1oMKYfT+UgMeDx5y7IMTblDIVSPauTlySZA/nL9puyQMpQTas
	iPZnCKCjnQm5py2V0N7pCJjOU/2QFImJFl4vzYq66cRzG4rK1lwn633oC0z+gwnNgEHkvUScC0N
	3PnWQrJ8vZisverw9y8C9YHEK/9CXtJ18QbiqdSnlLcTe38n7ZvdKscxkOAx2KzEz0nNynRvavi
	uY6NCMEvEKBM9g0pe97c0eBpK9YOYg==
X-Received: by 2002:a05:693c:41ce:20b0:359:27e6:b684 with SMTP id 5a478bee46e88-36a2fd486a2mr23067415eec.3.1793701078964;
        Tue, 03 Nov 2026 02:17:58 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.52
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:58 -0800 (PST)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
To: akpm@linux-foundation.org,
	catalin.marinas@arm.com,
	linux-mm@kvack.org,
	urezki@gmail.com,
	will@kernel.org
Cc: Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com,
	anshuman.khandual@arm.com,
	baohua@kernel.org,
	chleroy@kernel.org,
	david@kernel.org,
	dev.jain@arm.com,
	jiangwen6@xiaomi.com,
	leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org,
	maddy@linux.ibm.com,
	mpe@ellerman.id.au,
	npiggin@gmail.com,
	rppt@kernel.org,
	ryan.roberts@arm.com,
	Xueyuan Chen <xueyuan.chen21@gmail.com>
Subject: [PATCH v11 07/10] mm/vmalloc: extend page table walk to support larger page_shift sizes and eliminate page table rewalk
Date: Tue,  3 Nov 2026 18:16:55 +0800
Message-Id: <20261103101658.766905-8-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021800_147681_4C6990F9 
X-CRM114-Status: GOOD (  17.07  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.8 required=3.0 tests=BAYES_00,DKIM_SIGNED,
	DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,FREEMAIL_FORGED_FROMDOMAIN,
	FREEMAIL_FROM,HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,
	INCLUDES_PATCH,MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_GIT autolearn=unavailable autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

From: "Barry Song (Xiaomi)" <baohua@kernel.org>

vmap_pages_range_noflush_walk() (formerly vmap_small_pages_range_noflush())
provides a clean interface by taking struct page **pages and mapping them
via direct PTE iteration. This avoids the page table rewalk seen when
using vmap_range_noflush() for page_shift values other than PAGE_SHIFT.

Extend it to support larger page_shift values, and add PMD- and
contiguous-PTE mappings as well.

Rename it to vmap_pages_range_noflush_walk() since it now handles
more than just small pages.

For vmalloc() allocations with VM_ALLOW_HUGE_VMAP, we no longer need to
iterate over pages one by one via vmap_range_noflush(), which would
otherwise lead to page table rewalk. The code is now unified with the
PAGE_SHIFT case by simply calling vmap_pages_range_noflush_walk().

Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
Tested-by: Leo Yan <leo.yan@arm.com>
Reviewed-by: Dev Jain <dev.jain@arm.com>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 mm/vmalloc.c | 84 +++++++++++++++++++++++++++++++---------------------
 1 file changed, 50 insertions(+), 34 deletions(-)

diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index e3ea9581e68d..61f2b6fbbcd9 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -558,8 +558,10 @@ void vunmap_range(unsigned long addr, unsigned long end)
 
 static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
+	unsigned long pfn, size;
+	unsigned int nr_pages;
 	int err = 0;
 	pte_t *pte;
 
@@ -590,9 +592,10 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 			break;
 		}
 
-		set_pte_at(&init_mm, addr, pte, mk_pte(page, prot));
-		(*nr)++;
-	} while (pte++, addr += PAGE_SIZE, addr != end);
+		pfn = page_to_pfn(page);
+		size = vmap_set_ptes(pte, addr, end, pfn, prot, shift);
+		nr_pages = PFN_DOWN(size);
+	} while (pte += nr_pages, *nr += nr_pages, addr += size, addr != end);
 
 	lazy_mmu_mode_disable();
 	*mask |= PGTBL_PTE_MODIFIED;
@@ -602,60 +605,88 @@ static int vmap_pages_pte_range(pmd_t *pmd, unsigned long addr,
 
 static int vmap_pages_pmd_range(pud_t *pud, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pmd_t *pmd;
 	unsigned long next;
+	int err;
 
 	pmd = pmd_alloc_track(&init_mm, pud, addr, mask);
 	if (!pmd)
 		return -ENOMEM;
 	do {
 		next = pmd_addr_end(addr, end);
-		if (vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+
+		if (shift >= PMD_SHIFT) {
+			struct page *page = pages[*nr];
+			phys_addr_t phys_addr;
+
+			if (WARN_ON(!page))
+				return -ENOMEM;
+			if (WARN_ON(!pfn_valid(page_to_pfn(page))))
+				return -EINVAL;
+
+			phys_addr = page_to_phys(page);
+
+			if (vmap_try_huge_pmd(pmd, addr, next, phys_addr, prot, shift)) {
+				*mask |= PGTBL_PMD_MODIFIED;
+				*nr += 1U << (PMD_SHIFT - PAGE_SHIFT);
+				continue;
+			}
+		}
+		err = vmap_pages_pte_range(pmd, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pmd++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_pages_pud_range(p4d_t *p4d, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	pud_t *pud;
 	unsigned long next;
+	int err;
 
 	pud = pud_alloc_track(&init_mm, p4d, addr, mask);
 	if (!pud)
 		return -ENOMEM;
 	do {
 		next = pud_addr_end(addr, end);
-		if (vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pmd_range(pud, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (pud++, addr = next, addr != end);
 	return 0;
 }
 
 static int vmap_pages_p4d_range(pgd_t *pgd, unsigned long addr,
 		unsigned long end, pgprot_t prot, struct page **pages, int *nr,
-		pgtbl_mod_mask *mask)
+		pgtbl_mod_mask *mask, unsigned int shift)
 {
 	p4d_t *p4d;
 	unsigned long next;
+	int err;
 
 	p4d = p4d_alloc_track(&init_mm, pgd, addr, mask);
 	if (!p4d)
 		return -ENOMEM;
 	do {
 		next = p4d_addr_end(addr, end);
-		if (vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask))
-			return -ENOMEM;
+		err = vmap_pages_pud_range(p4d, addr, next, prot, pages, nr, mask, shift);
+		if (err)
+			return err;
 	} while (p4d++, addr = next, addr != end);
 	return 0;
 }
 
-static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
-		pgprot_t prot, struct page **pages)
+/*
+ * It can take an array of pages which are not all contiguous, but it
+ * may have contiguous chunks, as hinted by @shift.
+ */
+static int vmap_pages_range_noflush_walk(unsigned long addr, unsigned long end,
+		pgprot_t prot, struct page **pages, unsigned int shift)
 {
 	unsigned long start = addr;
 	pgd_t *pgd;
@@ -670,7 +701,7 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 		next = pgd_addr_end(addr, end);
 		if (pgd_bad(*pgd))
 			mask |= PGTBL_PGD_MODIFIED;
-		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask);
+		err = vmap_pages_p4d_range(pgd, addr, next, prot, pages, &nr, &mask, shift);
 		if (err)
 			break;
 	} while (pgd++, addr = next, addr != end);
@@ -693,28 +724,13 @@ static int vmap_small_pages_range_noflush(unsigned long addr, unsigned long end,
 int __vmap_pages_range_noflush(unsigned long addr, unsigned long end,
 		pgprot_t prot, struct page **pages, unsigned int page_shift)
 {
-	unsigned int i, nr = (end - addr) >> PAGE_SHIFT;
-
 	if (WARN_ON_ONCE(page_shift < PAGE_SHIFT))
 		return -EINVAL;
 
-	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC) ||
-			page_shift == PAGE_SHIFT)
-		return vmap_small_pages_range_noflush(addr, end, prot, pages);
+	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMALLOC))
+		page_shift = PAGE_SHIFT;
 
-	for (i = 0; i < nr; i += 1U << (page_shift - PAGE_SHIFT)) {
-		int err;
-
-		err = vmap_range_noflush(addr, addr + (1UL << page_shift),
-					page_to_phys(pages[i]), prot,
-					page_shift);
-		if (err)
-			return err;
-
-		addr += 1UL << page_shift;
-	}
-
-	return 0;
+	return vmap_pages_range_noflush_walk(addr, end, prot, pages, page_shift);
 }
 
 int vmap_pages_range_noflush(unsigned long addr, unsigned long end,
-- 
2.34.1


