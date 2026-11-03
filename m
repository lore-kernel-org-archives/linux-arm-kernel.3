Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E3459606A32E
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:17:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=u5h6/NFU;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=zYjpugOr
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=vHjbXN5GPOj+3N/hZYmdpYePqr3N047W/AZ1HDpQr5U=; b=u5h6/NFUYlogxF
	KuytFG0qlpgEyNMe2pRTto8uSPe/8YpNWFrTdHkTqjz1LSp+chvo0zt+xOZ5sVZAv8vKCPAXAMgL+
	7oEyGCf5bnOxNRq14eWplQJC0RdQ28htoSvBZW2dW260Y5DcKAjrq594L8NA8Fyqlo8kOpgJT0tfr
	NzAxGwpqu2AwAUlCssKbutFqIPHTDd1Ye7tqx53g8hKRvoLvcLhoxihJV2zVBaJJMG8Ap4Y9CVFsy
	8p7Ezy+dLHHRqsArMGRCEmXTtck5aK9+JeD8EUqF1BbczBEw5XCgLwwQ4Po0Sd4g1XU8tOO+iKJHy
	MsTIfLQKa6P+dwpYDrsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBaE-00000001x4H-2QmC;
	Tue, 03 Nov 2026 10:17:38 +0000
Received: from mail-dy1-x132b.google.com ([2607:f8b0:4864:20::132b])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBa9-00000001x0y-0E3m
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:17:37 +0000
Received: by mail-dy1-x132b.google.com with SMTP id 5a478bee46e88-3535a54bed9so5936557eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:17:32 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701052; x=1794305852; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=vHjbXN5GPOj+3N/hZYmdpYePqr3N047W/AZ1HDpQr5U=;
        b=zYjpugOrbxedM34B5PzEz3Pebtythpa/6OeI5Ycu9Wcp2+QFpWLBuL5L8gnJK/0uec
         UX5qwPdybLw/2jZT8ZD8WzP780wydgqBEIcEyEziYPNJ9hu4N2hh8Xk7NjXCLdws4LmS
         HiVDS386dsBqRXqKTI3nW5VD5nIuMJ016gc7y7yvkLaX6V1cVEsH+v6HtddOXTNe6hx/
         YqpObrxTEvFMi4pRuAEW/6vtNanwG3yIH58x03tcTDUjEdiPDrYJkco9IohxeC6/5FMb
         7/6wQ2IWGQ/jGOeozTekaY08GrlHow7Rgd+disFrRZthpWlpm8OjFcm6lIWgxrf2TbNd
         hrLg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701052; x=1794305852;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=vHjbXN5GPOj+3N/hZYmdpYePqr3N047W/AZ1HDpQr5U=;
        b=g9608fAAUc0rDuqoWd983N/arpMJhMAluRBiex4i2ST3lDiD4mtfgUMe53ZsdnTZ/p
         FZ5xTaxjJg2HAfCN+V/xjOJF+qcJT+5Va7DBGEnMvNQpLQUyPIOXs/AFuPZTU/V8vpov
         pcGceYXfaPfDZ49IoJEEatl+RXCHvBHfyImuiTpdA2tR2A8AfiriVSoPBPF7pxR4pZzP
         cUDSSnGG/js7Zoad1XYWcPJ6mO+LfOcoDbl8ZzQRZHuog9Zqgt7g0veT7vUADPf5ELT8
         UQKdFRbUZRF1TPLo2sM1buOQ1mTV0LZkQIRTfazBcBoxAH+fpOU68cH4FKJrKDoKWRoi
         n8eA==
X-Forwarded-Encrypted: i=1; AKwUvBx9CRWBAftqt0KdnuACKEM4z11pXlGXE9t7IhwGhEpTixRfiQ2hFwaF6MC6OBY7S7VqKk0ic5M1nbkPiDg+NUO0@lists.infradead.org
X-Gm-Message-State: APuU4Z9kZElcXCXTCZqkLizplzZXaePbJEJQdG9MOU4iMT0c8p0q9Zf9
	SdfRknrv6+265sCQuPvErKbWLfjfFSgKexkdnLsh8VO1fDToYlaTJj5P
X-Gm-Gg: AYBFou2wZIFb5uikAz8dSjhwuUanPkG4KwH/fCxiHuDlFrPX6Fi85sXX/MUKrexsw5B
	0b7/ABOk5C18AA0v26UO+FaRbV1QojCFbIC2uVX2G98CGaQfz8GD89Yepk/AvHCHf5otg1jmRzy
	6lDoOiqranrI8C34vbGyum+TjKK4YUjEUbo3YBs52mY3Fj5pVfz7nQVG/Ptpw/HHZYMX3mEe4ll
	D78U0nQJ1dqhL9CWRGLwPni74lPneGOy4gpA6WIGiI2n3WxzvcLaUpuj/H0UNz1LOL4rdm8m7b8
	WVMgp6oR1YP6GIDXHOlfTpK7nm+yG2xPoPK8WmJFklYZoWomJTwzxhrqgsjGAPUCqkLhFfUeKJh
	MqlG5mjRJTVRw52Q11ODU81nD0/mAaHdE+d9fFAF62TyjbSy0B2bON6Vx/qf64QbyqSfoF8Inne
	SSHomyhvEaPbxsyECt/432ckj0ZumtiY7O6rGKOsbR1SuDHRscHItKV2+3M8pdOBqOJ1WDGKf2/
	LqQN6NUxBNcQ9qus9eKmiyzR6dndVcUTlGFI9iLMjrHA/CL4heAMpMcDisXAkN7H1CVk7z897v2
	h+/HFKjABnIPL/Gl9C0nUnFo9+6/e31/SXucESnPewJDI3/lJUk=
X-Received: by 2002:a05:7300:5b89:b0:36a:1732:1e7 with SMTP id 5a478bee46e88-36a424c7b7dmr29521974eec.31.1793701051925;
        Tue, 03 Nov 2026 02:17:31 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:31 -0800 (PST)
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
	ryan.roberts@arm.com
Subject: [PATCH v11 03/10] mm/vmalloc: use vmap_pte_set_huge()/vmap_pte_clear_huge() for PTE-level block mappings
Date: Tue,  3 Nov 2026 18:16:51 +0800
Message-Id: <20261103101658.766905-4-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021733_130639_69668DE8 
X-CRM114-Status: GOOD (  15.46  )
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

From: Wen Jiang <jiangwen6@xiaomi.com>

vmap installs PTE-level block mappings by reusing set_huge_pte_at() and
huge_ptep_get_and_clear() under #ifdef CONFIG_HUGETLB_PAGE. This makes
the feature silently unavailable on CONFIG_HUGETLB_PAGE=n kernels and
couples mm/vmalloc.c to HugeTLB internals it does not otherwise need.

Now that arm64 and powerpc/8xx provide vmap_pte_set_huge() and
vmap_pte_clear_huge(), add the generic fallbacks next to the existing
pmd/pud_set_huge() family and convert vmap_pte_range() and
vunmap_pte_range() to the new helpers. The CONFIG_HUGETLB_PAGE guards
around the block-mapping paths are dropped, so PTE-level block mappings
now also work on CONFIG_HUGETLB_PAGE=n kernels, and mm/vmalloc.c no
longer includes <linux/hugetlb.h>.

The fallbacks exist only to keep the build working on architectures
without PTE-level block mapping support. They are unreachable there:
the callers only run when arch_vmap_pte_range_map_size() or
arch_vmap_pte_range_unmap_size() return a size other than PAGE_SIZE,
which requires an arch implementation. BUILD_BUG() makes that
explicit rather than silently doing nothing.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
Reviewed-by: Uladzislau Rezki (Sony) <urezki@gmail.com>
---
 include/linux/pgtable.h | 29 +++++++++++++++++++++++++++++
 mm/vmalloc.c            | 19 ++++++-------------
 2 files changed, 35 insertions(+), 13 deletions(-)

diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
index 780fe849ff8b..78689941b637 100644
--- a/include/linux/pgtable.h
+++ b/include/linux/pgtable.h
@@ -2204,6 +2204,35 @@ static inline int pmd_free_pte_page(pmd_t *pmd, unsigned long addr)
 }
 #endif	/* CONFIG_HAVE_ARCH_HUGE_VMAP */
 
+/*
+ * PTE-level block mappings for vmap.
+ *
+ * vmap_pte_set_huge() only has to be implemented by architectures whose
+ * arch_vmap_pte_range_map_size() can return a size other than PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_VMAP_PTE_SET_HUGE
+static inline void vmap_pte_set_huge(pte_t *ptep, unsigned long addr,
+				phys_addr_t phys, pgprot_t prot,
+				unsigned long size)
+{
+	BUILD_BUG();
+}
+#endif
+
+/*
+ * Likewise, vmap_pte_clear_huge() only has to be implemented by architectures
+ * whose arch_vmap_pte_range_unmap_size() can return a size other than
+ * PAGE_SIZE.
+ */
+#ifndef __HAVE_ARCH_VMAP_PTE_CLEAR_HUGE
+static inline pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr,
+				   unsigned long size)
+{
+	BUILD_BUG();
+	return __pte(0);
+}
+#endif
+
 #ifndef __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 /*
diff --git a/mm/vmalloc.c b/mm/vmalloc.c
index f7aa4686fe5b..df37c8490ae7 100644
--- a/mm/vmalloc.c
+++ b/mm/vmalloc.c
@@ -38,7 +38,6 @@
 #include <linux/rbtree_augmented.h>
 #include <linux/overflow.h>
 #include <linux/pgtable.h>
-#include <linux/hugetlb.h>
 #include <linux/sched/mm.h>
 #include <asm/tlbflush.h>
 #include <asm/shmparam.h>
@@ -100,7 +99,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 	pte_t *pte;
 	u64 pfn;
 	struct page *page;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
 		return -EINVAL;
@@ -121,17 +120,12 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 			BUG();
 		}
 
-#ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
 		if (size != PAGE_SIZE) {
-			pte_t entry = pfn_pte(pfn, prot);
-
-			entry = arch_make_huge_pte(entry, ilog2(size), 0);
-			set_huge_pte_at(&init_mm, addr, pte, entry, size);
+			vmap_pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
 			pfn += PFN_DOWN(size);
 			continue;
 		}
-#endif
 		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
 		pfn++;
 	} while (pte += PFN_DOWN(size), addr += size, addr != end);
@@ -391,25 +385,24 @@ static void vunmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
 {
 	pte_t *pte;
 	pte_t ptent;
-	unsigned long size = PAGE_SIZE;
+	unsigned long size;
 
 	pte = pte_offset_kernel(pmd, addr);
 	lazy_mmu_mode_enable();
 
 	do {
-#ifdef CONFIG_HUGETLB_PAGE
 		size = arch_vmap_pte_range_unmap_size(addr, pte);
 		if (size != PAGE_SIZE) {
 			if (WARN_ON(!IS_ALIGNED(addr, size))) {
 				addr = ALIGN_DOWN(addr, size);
 				pte = PTR_ALIGN_DOWN(pte, sizeof(*pte) * (size >> PAGE_SHIFT));
 			}
-			ptent = huge_ptep_get_and_clear(&init_mm, addr, pte, size);
+			ptent = vmap_pte_clear_huge(pte, addr, size);
 			if (WARN_ON(end - addr < size))
 				size = end - addr;
-		} else
-#endif
+		} else {
 			ptent = ptep_get_and_clear(&init_mm, addr, pte);
+		}
 		WARN_ON(!pte_none(ptent) && !pte_present(ptent));
 	} while (pte += (size >> PAGE_SHIFT), addr += size, addr != end);
 
-- 
2.34.1


