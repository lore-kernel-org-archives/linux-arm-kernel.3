Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 17725606A319
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 21 Oct 2026 08:31:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=e/LCc5rd;
	dkim=pass (2048-bit key, unprotected) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20251104 header.b=BHg4NXSW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=; b=e/LCc5rdu/djnKFWUxUrtt0lyy
	oXo2wj4NANAWT74DEXmpXwhC9SJs9DAKMFeStiHpnQbWVk7SQPuAOAm7tDuLdTPXuZyX0BA2KFu2j
	g/g+rjU6U41LafeOerJo6dToYo+Yfc3My4KRZ8WBsa0s04i/YUKMt/BshRC9jFZu7ukvLxDPMHybU
	GUtO5s+Ha0OnOKRLiggbf+ldzNgmAnq3cQ33AkXCX7rEczRqoA0UdotpleD6PqWoO4jZrxFWS/9FI
	5Z8K3Ezf5FU4bAhZru77YQ15ABr+Sm+RTxaJLNvky8e8oXkZltQdzUQ4CQB5Jh8lPLJHO4+ZQP/gT
	elV2zCSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRjd-0000000BMn2-0Aoc;
	Wed, 21 Oct 2026 08:31:45 +0000
Received: from mail-pz2-x08.google.com ([2607:f8b0:4864:3b::8])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xJRja-0000000BMkm-1igl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 21 Oct 2026 08:31:44 +0000
Received: by mail-pz2-x08.google.com with SMTP id 41be03b00d2f7-cd613507bd1so29565a12.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 21 Oct 2026 01:31:42 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1792571502; x=1793176302; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
        b=BHg4NXSWd3Q6U6+eNuHq04m0S7bzCh1s9TfOZKxj5COItQbMkgdg1qtVrO+CM7acA7
         K9D0g2xFpV4S2gstWu7nESUQ/FV0ka1dC6gTez8+gtsS3XbsUgoqQu6UmVAgBneLI+Tg
         AIifcorR8ADorW4/9om6Hzl7Pbq6663bupn9PYsuoZornD9+vqZ+xEtlxuqD1Nl142uR
         +nZr4epNclhlYODp7JTyMHwpbRs4P+JRmpETPbjpNqzVV5B17Fpia7gpN7eHTecH7w3n
         ViORMTy2u22arGTYCCmkPiYWyT0beKr8fVI6JAQ4YQi9Tfw/vgf0FQOonC4Bx1zaHRzp
         0aKA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1792571502; x=1793176302;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=fKpfFiVoVVnNbFsiCGN8s68JTp1We4GBLmYun2RkI28=;
        b=ReEnpXHEZ1UcqXZkJjY1pMJJpp0ZrZkXBjTesvjlk9hAY7VrtNfBl/M6nOi4FvqiCr
         M1oORmC2EIcR2pv92FJOy2PVrcLh9ZAxHOnR+1KBRX7AavhhCl4cQ+K262z2VvKJsgnV
         4GQkofMUQAFvBMTDNhJBjTwEC5QsH9Uu0Py1/pWlAHE+ixEvMY5WOQ/X+sMNZtVI7qEL
         bmCA8JXQ8DW2De3BKPtFYE/H0F03FQ1DjD/JK5wT9xtsMZa7xptm3hLGV+kDoWkHnH3+
         OFXkb+hsM7RyZdziunDVXlsf26MMIIzyRwFFolj/HWuaXQzlnJKtKB9keX5Ribj0fATw
         nmDQ==
X-Forwarded-Encrypted: i=1; AKwUvBz5u11YH4+AXUzTQjCK8/8tqeGOLtchILfS36mD3lAV4X/ncgucmv4nvGITA8LAd4HO/OKfTc5ZNx2QYO4edfCg@lists.infradead.org
X-Gm-Message-State: AFq9FYLvdxGk9dXK3/uu4o3XgBRdWPaT094fQqhuYCLrLsLNkuOtEyzZ
	5zgzvS79qdWQxerEwcJVyEZf1thoriauaOYfKTC5rsnoL4d3QMwdFaXn
X-Gm-Gg: AYBFou1OBOKR8nNRolS79KrhXx9loT8XeQj/9+fqsn0dKd3jUn4/7KvDx6tGQNr4Cwq
	pIeQjPlCjdjm+e758uwKzkX6qO9by5w6gLNsDDUiGqFCr34DqaVRm2X+OKgjgMXCDsLF/npKw9T
	ua9ZIBlKqaIvz4dKpw5qcuTVGnQmEINBv0R6rFT7DW/lXuDetRxl54oN9518WX3jPzWAU4AkWyY
	KBbHUXcByR4opFee0VMmf4jE29vVQKFCCPSzr+o+ymBPp7Iam3Mmnur7yjWe8l6N4wnFVZmoEFA
	9wwWASzOOLVA1qhTL4MlmCH7tZJSjr74JqJ1KrcZnowgkJIvggjxzWrjWC0diu6x1HsQ3wBwsOZ
	mX6FAhNUSpQOlpCKtULH/uFcFc+Z+s4K7uxLctoO4hYuS45wT46lai4HPdUm2FUAChEb5R2yidz
	gCRzYzrldeYdscvfXoVzXoCSxlLpTt6nx0cqKbvANbiplvXWzWsvp4oG88Heg4CqeBlW0rdqxdI
	K6YHRmPnhN264aJQ9irAeFqwuDGwwdrJaA5wYVCdSH4lqm9/bbqR0dzqWz8t7PeWvYbKPmoknTv
	yfHImxDemzisHA==
X-Received: by 2002:a05:6a00:2d12:b0:882:e366:d99f with SMTP id d2e1a72fcca58-8a089d871famr1118755b3a.51.1792571501524;
        Wed, 21 Oct 2026 01:31:41 -0700 (PDT)
Received: from intel.company.local ([122.11.210.25])
        by smtp.gmail.com with ESMTPSA id d2e1a72fcca58-8a0895e273bsm600653b3a.41.2026.10.21.01.31.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 21 Oct 2026 01:31:39 -0700 (PDT)
From: Wandun Chen <chenwandun1@gmail.com>
To: robh@kernel.org,
	baoquan.he@linux.dev,
	rppt@kernel.org,
	m.szyprowski@samsung.com
Cc: catalin.marinas@arm.com,
	will@kernel.org,
	mark.rutland@arm.com,
	chenhuacai@kernel.org,
	kernel@xen0n.name,
	pjw@kernel.org,
	palmer@dabbelt.com,
	aou@eecs.berkeley.edu,
	alex@ghiti.fr,
	tglx@kernel.org,
	mingo@redhat.com,
	bp@alien8.de,
	dave.hansen@linux.intel.com,
	x86@kernel.org,
	hpa@zytor.com,
	saravanak@kernel.org,
	akpm@linux-foundation.org,
	pasha.tatashin@soleen.com,
	pratyush@kernel.org,
	ruirui.yang@linux.dev,
	robin.murphy@arm.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	loongarch@lists.linux.dev,
	linux-riscv@lists.infradead.org,
	devicetree@vger.kernel.org,
	kexec@lists.infradead.org,
	linux-mm@kvack.org,
	iommu@lists.linux.dev
Subject: [PATCH v9 5/8] memblock: introduce MEMBLOCK_NODUMP flag
Date: Wed, 21 Oct 2026 16:30:08 +0800
Message-ID: <20261021083011.2170525-6-chenwandun1@gmail.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20261021083011.2170525-1-chenwandun1@gmail.com>
References: <20261021083011.2170525-1-chenwandun1@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261021_013142_481138_5AE28A07 
X-CRM114-Status: GOOD (  14.42  )
X-Spam-Score: -1.9 (-)
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

From: Wandun Chen <chenwandun@lixiang.com>

Add MEMBLOCK_NODUMP to mark regions that should be excluded from
kdump vmcores.

The flag is meant for reserved memory that carries no data useful for
crash analysis. Reusable reserved regions such as CMA may hold useful
data, so these regions must not be marked MEMBLOCK_NODUMP. Subsequent
patches wire this up for /reserved-memory entries.

Suggested-by: Rob Herring <robh@kernel.org>
Signed-off-by: Wandun Chen <chenwandun@lixiang.com>
Tested-by: Meijing Zhao <zhaomeijing@lixiang.com>
Reviewed-by: Mike Rapoport (Microsoft) <rppt@kernel.org>
---
 include/linux/memblock.h |  9 +++++++++
 mm/memblock.c            | 16 ++++++++++++++++
 2 files changed, 25 insertions(+)

diff --git a/include/linux/memblock.h b/include/linux/memblock.h
index 40e6e0aa2f8d..67dbcfda6f49 100644
--- a/include/linux/memblock.h
+++ b/include/linux/memblock.h
@@ -52,6 +52,8 @@ extern unsigned long long max_possible_pfn;
  * know is good to use. It is the only memory that allocations may happen from
  * in this phase.
  * @MEMBLOCK_RSRV_HUGETLB: memory is reserved for hugetlb pages
+ * @MEMBLOCK_NODUMP: exclude from kdump vmcore. It carries no data useful
+ * for crash analysis (e.g. firmware carveouts).
  */
 enum memblock_flags {
 	MEMBLOCK_NONE		= 0x0,	/* No special request */
@@ -63,6 +65,7 @@ enum memblock_flags {
 	MEMBLOCK_RSRV_KERN	= 0x20,	/* memory reserved for kernel use */
 	MEMBLOCK_KHO_NOPRSRV	= 0x40,	/* memory with no KHO preservations */
 	MEMBLOCK_RSRV_HUGETLB	= 0x80, /* memory reserved for hugetlb pages */
+	MEMBLOCK_NODUMP		= 0x100,/* exclude from kdump vmcore */
 };
 
 /**
@@ -160,6 +163,7 @@ int memblock_reserved_mark_noinit(phys_addr_t base, phys_addr_t size);
 int memblock_reserved_mark_kern(phys_addr_t base, phys_addr_t size);
 int memblock_mark_kho_noprsrv(phys_addr_t base, phys_addr_t size);
 int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size);
+int memblock_mark_nodump(phys_addr_t base, phys_addr_t size);
 
 void memblock_free(void *ptr, size_t size);
 
@@ -305,6 +309,11 @@ static inline bool memblock_is_kho_noprsrv(struct memblock_region *m)
 	return m->flags & MEMBLOCK_KHO_NOPRSRV;
 }
 
+static inline bool memblock_is_nodump(struct memblock_region *m)
+{
+	return m->flags & MEMBLOCK_NODUMP;
+}
+
 int memblock_search_pfn_nid(unsigned long pfn, unsigned long *start_pfn,
 			    unsigned long  *end_pfn);
 void __next_mem_pfn_range(int *idx, int nid, unsigned long *out_start_pfn,
diff --git a/mm/memblock.c b/mm/memblock.c
index a450092a80fb..ab1432241432 100644
--- a/mm/memblock.c
+++ b/mm/memblock.c
@@ -1221,6 +1221,21 @@ __init int memblock_clear_kho_noprsrv(phys_addr_t base, phys_addr_t size)
 				    MEMBLOCK_KHO_NOPRSRV);
 }
 
+/**
+ * memblock_mark_nodump - Mark a memory region with flag MEMBLOCK_NODUMP.
+ * @base: the base phys addr of the region
+ * @size: the size of the region
+ *
+ * Mark the region as not to be included in crash dumps.
+ *
+ * Return: 0 on success, -errno on failure.
+ */
+int __init_memblock memblock_mark_nodump(phys_addr_t base, phys_addr_t size)
+{
+	return memblock_setclr_flag(&memblock.memory, base, size, 1,
+				    MEMBLOCK_NODUMP);
+}
+
 static bool should_skip_region(struct memblock_type *type,
 			       struct memblock_region *m,
 			       int nid, int flags)
@@ -2854,6 +2869,7 @@ static const char * const flagname[] = {
 	[ilog2(MEMBLOCK_RSRV_KERN)] = "RSV_KERN",
 	[ilog2(MEMBLOCK_KHO_NOPRSRV)] = "KHO_NOPRSRV",
 	[ilog2(MEMBLOCK_RSRV_HUGETLB)] = "RSV_HUGETLB",
+	[ilog2(MEMBLOCK_NODUMP)] = "NODUMP",
 };
 
 static int memblock_debug_show(struct seq_file *m, void *private)
-- 
2.43.0


