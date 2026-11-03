Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A43F3606A331
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 10:17:31 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=AZTH7D1t;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=WcZ7lV9+
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=iIqgn31oqWqTiWXF2IW0vHwpw1vMj9WhwN7adf+gUg0=; b=AZTH7D1toEsYMQ
	GfYRnDFmQei6/TtfiI+d/B/ORpN2ufBfYa2AE574sGpHFsfiG6+jbm/Q0Ppfj8NTOdG8cvHhcsbHb
	xaeOwBQdj0I5nCZcyb2bxSrDx9Osa/7Wt6ZXnEPaMM6fqx25hUYlzVe5/d64iEgNv0aBMynp4a5Zi
	491SH9W8/2A0FZ3wmKKeNYZmfVsITov7nhD/MsMpapXJb5XhXMhuh68iQMjkzm8A3yyR+cKBzb2r8
	lIlYYMDcZKqkTMH7v5tka9KM0tps4fEu3DGzn89C7qtDr2K7Jl7cUyfUPylJxLSM7F4rXpTIy+pwT
	zqCIyPd9XD9rODquxB/Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBa1-00000001wx3-2Kii;
	Tue, 03 Nov 2026 10:17:25 +0000
Received: from mail-dy1-x1331.google.com ([2607:f8b0:4864:20::1331])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOBZw-00000001wvJ-1NCf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 10:17:22 +0000
Received: by mail-dy1-x1331.google.com with SMTP id 5a478bee46e88-36a1947498bso3892727eec.1
        for <linux-arm-kernel@lists.infradead.org>; Tue, 03 Nov 2026 02:17:19 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1793701039; x=1794305839; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=iIqgn31oqWqTiWXF2IW0vHwpw1vMj9WhwN7adf+gUg0=;
        b=WcZ7lV9+MGDcdfmizCxunNho7IdjivSeWV30arMl5rVieh5ijwHlE503UT7199CUCf
         VWiTAtofZbqeykwt0Qtc8yGLsZRwMowtsZ8XNBcXRuaXgMpSnirBDJ8WA3NcRzZPQThm
         PjfLAZS6FejvSXj4SjPmxtqfEuUe9o4Y4AXW8sUbxzAMZnitpf06oiHUZN1CkxwBAT/u
         jFqCo0kw0JpArUJBDCiQrERAyA7TPPN0glpldYoohkSPcIRlzSGTuw2ZHWW1vBGkZlBm
         THc0IVSh6Lz9ZEUlN6JHOzBYaBfXCBelyWgllV9gOEh/o7lxHFjgp/+NzxT8YV/uhdOm
         VWwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793701039; x=1794305839;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=iIqgn31oqWqTiWXF2IW0vHwpw1vMj9WhwN7adf+gUg0=;
        b=AYBlpd9uW+czAT6OsKtLukQSqG3rjlfK2I4Aq/LuNbX5U+4izoHnT+4wQbOec2KGrR
         nnik1jD1kFMV52A/ce+ZQY6lEpvixTGcJvFJMYG0X/9u+Ijhy/4yrtO8nUu0UndyYEJB
         hzC/GTvL3tVoCBiC7ehfgur56fwSEeFzZA3Jp0bUSCq9fRCUSG+C3IZl4aKFYtAhTcX5
         c9uZXQkLgT0AjYQdh2YBp2G5PdAWO+WIjceVHz52GvFz/cMrILcx67AzBvpvyfC/r5/b
         5LUdlWRjvojF6gnp51SMi3ezTLUJHE3BIHrHxUCgJXG7qKuqJ62jWOdE2lLmY2RWsAfr
         Vg8g==
X-Forwarded-Encrypted: i=1; AKwUvBy3TtYf9a77c8wMgmXEwp4MY1ytR6OAHT6/o8rE0Env9V15P90Upw1R3nTpZ4+IP8cib5hePK8hk9y/o6vg6s/o@lists.infradead.org
X-Gm-Message-State: APuU4Z9HO3pDHir8Vp/5XgQNVu/pB7ENcxAS+FxtcJ7qshJx/+dQ6KSC
	5mUzhazDMPExsvBFE02y0sovC3w5sAv+kvDj7oxQvSX6qN3b6EadE2kA
X-Gm-Gg: AYBFou1TyA8FxLEy4GCBXVnyN2pKHtDw0rsiD6t7CjpZVjoXXNSenVGOq8BmLVik4N3
	16PnoLkxaWteiXuF66nE0oebXxbY6fP9eU82JADfFHFfssT18SiSu99jvadJ2fv/6JookyQ3576
	K3Bz52OGZu+/2jamdVMpEQMJT29TW3s3nHHrdH+lnmYLCQOzZwaSq5OKi4obj+UvotFW/pLHjpO
	fRvwwGBUob+xlNp6K4bADHZgl+Dl3WvTZLB1Jh6jvnhylNhR98OKYRNLCcnWV6lFZYr7eS11hf1
	aqxsMTjyCVNBXsZSbUK6Uqd9Bn9mKtQp2bpDJTVag0UtEH4V6HvjNH9m1FPywxkiLw8Zn7Gve6i
	vDQtQnZLV7+J53NmpowZe8USQQsy5gsIrEUc1oJvF0muXulFhr8HeHaiGUxESlsHVHOuNBJTENo
	Qu6nWfFPz+puA6un3Yk/mCX5/uTUFtw+ff0uuWhE39yzPfDNRbl3K93dhrbLaTam+oTRM+sdm4x
	Jbv6YhxKgSRSnt7d9DOp0pbOeO9tL3I+ePmX+/a0zX52IfLUKoFpmkRWaW6xK4jTLML7Ip6+nzQ
	i0FfUJlVbc7r8RIVhn7RTj/+zdOxLA==
X-Received: by 2002:a05:7300:471a:b0:36a:2382:7dab with SMTP id 5a478bee46e88-36a4232cda7mr18277051eec.6.1793701038947;
        Tue, 03 Nov 2026 02:17:18 -0800 (PST)
Received: from 027.. ([2409:8a20:4a5:7150:84fc:ce3c:7b09:dbca])
        by smtp.gmail.com with ESMTPSA id 5a478bee46e88-36a4291e38fsm53145387eec.15.2026.11.03.02.17.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 03 Nov 2026 02:17:18 -0800 (PST)
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
Subject: [PATCH v11 01/10] arm64/mm: add vmap_pte_set_huge() and vmap_pte_clear_huge()
Date: Tue,  3 Nov 2026 18:16:49 +0800
Message-Id: <20261103101658.766905-2-jiangwenxiaomi@gmail.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
References: <20261103101658.766905-1-jiangwenxiaomi@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261103_021720_513737_47E00D7B 
X-CRM114-Status: GOOD (  11.74  )
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

vmap installs PTE-level block mappings (PTE_CONT on arm64) by reusing
set_huge_pte_at() and huge_ptep_get_and_clear(), which are HugeTLB
helpers gated by CONFIG_HUGETLB_PAGE. This makes the feature silently
unavailable on CONFIG_HUGETLB_PAGE=n kernels and couples mm/vmalloc.c to
HugeTLB internals it does not otherwise need.

Add vmap_pte_set_huge()/vmap_pte_clear_huge() to arm64, joining the
existing pmd_set_huge()/pud_set_huge() family in mm/mmu.c. They build on
__set_ptes() and __get_and_clear_full_ptes() directly, so they do not
depend on CONFIG_HUGETLB_PAGE.

There is no caller yet: mm/vmalloc.c is converted later in this series,
once the generic fallbacks are in place.

Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
Reviewed-by: Barry Song <baohua@kernel.org>
---
 arch/arm64/include/asm/pgtable.h |  6 ++++++
 arch/arm64/mm/mmu.c              | 28 ++++++++++++++++++++++++++++
 2 files changed, 34 insertions(+)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index a474c9fb485a..fe138590972a 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -1927,6 +1927,12 @@ static inline void clear_young_dirty_ptes(struct vm_area_struct *vma,
 
 #endif /* CONFIG_ARM64_CONTPTE */
 
+#define __HAVE_ARCH_VMAP_PTE_SET_HUGE
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size);
+#define __HAVE_ARCH_VMAP_PTE_CLEAR_HUGE
+pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size);
+
 #endif /* !__ASSEMBLER__ */
 
 #endif /* __ASM_PGTABLE_H */
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 140520b351e2..2929bec8821c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -1912,6 +1912,34 @@ int pmd_clear_huge(pmd_t *pmdp)
 	return 1;
 }
 
+void vmap_pte_set_huge(pte_t *ptep, unsigned long addr, phys_addr_t phys,
+		  pgprot_t prot, unsigned long size)
+{
+	unsigned long pfn = __phys_to_pfn(phys);
+	pte_t pte = pte_mkcont(pfn_pte(pfn, prot));
+	unsigned int nr = size >> PAGE_SHIFT;
+
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(pfn, CONT_PTES));
+
+	/* For vmap, there is no valid -> valid transition */
+	VM_WARN_ON(pte_valid(__ptep_get(ptep)));
+
+	__set_ptes(&init_mm, addr, ptep, pte, nr);
+}
+
+pte_t vmap_pte_clear_huge(pte_t *ptep, unsigned long addr, unsigned long size)
+{
+	/* Kernel mappings only */
+
+	VM_WARN_ON(!IS_ALIGNED(size, CONT_PTE_SIZE));
+	VM_WARN_ON(!IS_ALIGNED(addr, CONT_PTE_SIZE));
+
+	return __get_and_clear_full_ptes(&init_mm, addr, ptep,
+					 size >> PAGE_SHIFT, 0);
+}
+
 int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
 {
 	pte_t *table;
-- 
2.34.1


