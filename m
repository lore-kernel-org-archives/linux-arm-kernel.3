Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E0DA7606FAD9
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:17:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=zfXlECf9;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=fCQKVPuk
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=+SJoEqsvZ+TRv506SN0uWYqGOCHbvZTF1hg+QTdNQpA=; b=zfXlECf9hiRvrW
	aX1no3UOYDhclM5c/gqs8YN0Mvb2mi3vTD+pBLMBmwaXslp+IkQffyEEqs+XhEgN2Vjp/uqoMksO/
	+2cOdhXa7EQGI9h5jUTBRgy2e3isAegwBsJloZeJF4cgmV8AflKCMyWcXBe7eVHCmZjtB0HAmscAo
	mxU9h/oHaVCYwQT6xj+P068tGeqqFtre0n3tpaWHYFT+/rQAsEwwiJ/QylY9mUeLkzLOPvycxloSW
	tRZpFzPOm6Om0XCHIkIKBx4kTzbaDP4slVi9oeL92CskLXYRFa8/jbMuvCLqWDIGV+TSW1KRHpLvz
	cEBUARvUAwG5ed+5HfRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBa7-00000001x0K-1wMl;
	Tue, 03 Nov 2026 10:17:31 +0000
Received: from mail-dy1-x1330.google.com ([2607:f8b0:4864:20::1330])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBa2-00000001wxW-3Tkr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:17:28 +0000
Received: by mail-dy1-x1330.google.com with SMTP id 5a478bee46e88-36661f953e4so6081250eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:17:26 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701046; x=1794305846; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=+SJoEqsvZ+TRv506SN0uWYqGOCHbvZTF1hg+QTdNQpA=;
        b=fCQKVPukGtIozwltCftfsKuCtD9QaXJMT/DABf80/X49R1y3Sg5JOqi2A6nHnK0q/a
         +v81HIkznHwvFx5TZ7cUG0SoY+EUJ/Q8gTK20DnElGjqo4XfblIliTq8ELdm4gazB2V4
         oVCGlxPWyZZQ5fYMoSJuuPZoOa1xZeWs0H9gBVWpCvVmf9j4n0f5pvYiMxNH6G5e0hAu
         is+Bx+J0sCEXLc4rNkPbNxCfjM2ho9rEObnTzW2RwCLgpAgKs7QnQ2IIeM0b8Afcm3HK
         iOkQNNW1ARsQndX4Tg+EmehiQAxup4J+mUA8zJpEJorZH1ZhMzkvmaWwg4NlMFIRecMm
         +P2g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701046; x=1794305846;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=+SJoEqsvZ+TRv506SN0uWYqGOCHbvZTF1hg+QTdNQpA=;
        b=hyGSW3C7AVGkanHMq6ng/KGnlmBjmt2CMYOFa4j9d0vj8fOJQr7fAHqQbC1FVWTtoU
         Vdp7BUz8svBe3JbEpuEQsJediw2rk+6BX7uZuq2qbcLwXqEDbcY0yJbU9HyVaimxbuRk
         Ge+gkuQuDcXIVFcZaBs9V5NCTf3G3u5+OaoO+3eZpxf8qEEHSb1zzCa/BWUhGWpfmfi/
         WK4VXyLai0UF3RsfGEMQPiLGLjOScI9z8twiD0CglzDDsJZpF6+n/igh3UxfXgR6PG0B
         6XOVATDuUAiPJIVy3Zeaucb+i+ydi1w1R4GtD+9yiyyjT4GHQi/iGhRJrNaszw8JFkBV
         Xldg==
X-Forwarded-Encrypted: i=1; AKwUvBxIJKCRnsN/skhlqt6a/sowYT4nb0qACdWTS6/S03uubApKhFb8nhAxKFVJMRvIC2Bvn4SATsSgsNJAB+NB4IJH@lists.infradead.org
X-Gm-Message-State: APuU4Z+T6Qcn52wiQIpPKvM7Nl04FamH7FoZW/LDIvcn6GE8Nk0NGvER
	ZqkvHilzXDKB+0LIKbGrVrMvV/5PCs8OIdZVQZ1QLfEOp3iHHLeH8/5A
X-Gm-Gg: AYBFou2Q8rLU0Gd5dr7fHfpeIyFhCqgtvMnZs/EAwWh5r6BrUZ/ykrZNdzzfBmvXAbm
	SBMt/JIVdjZ5eGx+s6kdKsbsNP7ZUfJ9qXRrmQHANEdZ230HjnS7I8apEolKHIFiDc+DTXvkL2F
	3NhYY1lyRlibeUqG3dSNFzRP2ap9+jjxRg4+ogzIlFcPjShxLZlrDhfGbTrDTDFrBX6qK56x5Jn
	sVrPi9g/deoWGiJRJpS+WY3midT7GAJ+qlMVFhEiVMIchiLXjmfiy2L/XTzn4GhO9Sk7kZq75fG
	viZlhF+yuBMXBbL1zPUX+t/tOn75S92k9gezLYUfbHapXaYqEpf68gmXeebbt6AMXkpzd13DPye
	gp6budCdZR/pmAHwDyI0dKhek3O0G9dOFkA27dXjr7YqTidQvIrnAI5TyMeRIlYfI2TDSd4dRB5
	LQrL1r7PphfR6TIagh7ydpzQMLo39p/D29gY6d98QlH37224V3a8z5gzasVSdVJKemuPPcFK6ZR
	xiOlfDJYZ8bFUjf/nKV9lYyy/Widl5V1bUPuV/RLUax0LW9nvTbICuKDX+8jcCxVF1t1DM9N3ne
	MClqlIK7IB9rzUJ2CLlLxRKxklRUtg==
X-Received: by 2002:a05:693c:894e:20b0:368:7c9d:1577 with SMTP id 5a478bee46e88-36a4238420dmr18800136eec.20.1793701045554;
        Tue, 03 Nov 2026 02:17:25 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.19
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:25 -0800 (PST)
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
Subject: [PATCH v11 02/10] powerpc/8xx: add vmap_pte_set_huge()
Date: Tue,  3 Nov 2026 18:16:50 +0800
Message-Id: <20261103101658.766905-3-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021727_558554_948FABCF 
X-CRM114-Status: GOOD (  15.19  )
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

vmap installs PTE-level block mappings (SZ_16K/SZ_512K on powerpc/8xx)
by reusing set_huge_pte_at(), a HugeTLB helper gated by
CONFIG_HUGETLB_PAGE. This makes the feature silently unavailable on
CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to HugeTLB
internals it does not otherwise need.

Add vmap_pte_set_huge() to powerpc/8xx, next to the existing
pmd_clear_huge()/pud_clear_huge() in mm/nohash/8xx.c. It builds the huge
PTE and writes it into the backing cells directly, without going through
set_huge_pte_at(), so it does not depend on CONFIG_HUGETLB_PAGE.

No vmap_pte_clear_huge() is needed: 8xx does not implement
arch_vmap_pte_range_unmap_size(), so the vmap unmap path never takes the
PTE-clearing branch.

In practice PPC_8xx selects HUGETLBFS unconditionally, so
CONFIG_HUGETLB_PAGE=n does not occur there today; this is a decoupling
cleanup rather than a new configuration.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Christophe Leroy (CS GROUP) <chleroy@kernel.org>
---
 arch/powerpc/include/asm/nohash/32/pte-8xx.h |  4 +++
 arch/powerpc/mm/nohash/8xx.c                 | 29 ++++++++++++++++++++
 2 files changed, 33 insertions(+)

diff --git a/arch/powerpc/include/asm/nohash/32/pte-8xx.h b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
index e2ea8ba9f8ca..6ea854d67a2e 100644
--- a/arch/powerpc/include/asm/nohash/32/pte-8xx.h
+++ b/arch/powerpc/include/asm/nohash/32/pte-8xx.h
@@ -235,6 +235,10 @@ static inline pte_t ptep_get(pte_t *ptep)
 }
 #endif /* CONFIG_PPC_16K_PAGES */
 
+#define __HAVE_ARCH_VMAP_PTE_SET_HUGE
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+
 #endif
 
 #endif /* __KERNEL__ */
diff --git a/arch/powerpc/mm/nohash/8xx.c b/arch/powerpc/mm/nohash/8xx.c
index a9d3f4729ead..54254182700c 100644
--- a/arch/powerpc/mm/nohash/8xx.c
+++ b/arch/powerpc/mm/nohash/8xx.c
@@ -220,3 +220,32 @@ int pmd_clear_huge(pmd_t *pmd)
 {
 	 return 0;
 }
+
+/*
+ * vmap PTE-level block mapping. Sets a present kernel mapping directly,
+ * so unlike set_huge_pte_at() it needs neither CONFIG_HUGETLB_PAGE nor
+ * set_pte_filter() (a no-op for non-exec kernel mappings).
+ */
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	pmd_t *pmdp = pmd_off(&init_mm, addr);
+	pte_t pte = pfn_pte(PHYS_PFN(phys), prot);
+	pte_basic_t val;
+	pte_basic_t *entry = (pte_basic_t *)ptep;
+	int num, i;
+
+	pte = arch_make_huge_pte(pte, ilog2(size), 0);
+	val = pte_val(pte);
+
+	/*
+	 * Make sure hardware valid bit is not set. We don't do
+	 * tlb flush for this update.
+	 */
+	VM_WARN_ON(pte_hw_valid(*ptep) && !pte_protnone(*ptep));
+
+	num = number_of_cells_per_pte(pmdp, val, 1);
+
+	for (i = 0; i < num; i++, entry++, val += SZ_4K)
+		*entry = val;
+}
-- 
2.34.1


