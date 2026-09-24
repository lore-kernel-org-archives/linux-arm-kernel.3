Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11606C98310
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Sep 2026 06:22:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kxyIbo/u3CdsE7qDsWfTtiTeOUnmJko1bwoqVR/WV28=; b=qLV792vLnJXfHwvDhcwbeaQNz7
	vxKdomf0bvIiury6xSp0hqu8LHzm1EsjYKx9V19AVU4NkoouAxfpP0W9Qle+yu5ChhgyrSD6yZpoA
	R3UlALsjT/AYnRgkaKQk15dkWhJwbeJlEPS3hsBef2rYeTOjkIgjGTJX7id6xIpO1Rx/5OsmzAtzs
	IlQWIG/r9RDoIRpo5K95rp2ffN5uAOFdos4a1f5AH2oBrZjEWB+Nb/+JJRE1NjEx6wHJ5BKyt5J2I
	Mg+TcE8hN0TNqGuWOyNh3U64cUrhegi1luIlaQvJw9A/GZLM/hsJ4sks4EFvcZODAijjoBRjiWDgG
	EgmJ0FvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cr6-0000000A993-0LGu;
	Thu, 24 Sep 2026 06:22:52 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9cqx-0000000A960-1oBU
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 24 Sep 2026 06:22:47 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:MIME-Version
	:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-Type:Content-ID:Content-Description;
	bh=kxyIbo/u3CdsE7qDsWfTtiTeOUnmJko1bwoqVR/WV28=; b=PdI0njl9TXMwvIS97PId9aiMH/
	yyBbdX7dgYSyjkOYgwRXAfvkNOSJQG8YOXO6ZwUbKXELLQWvtY5/ByDJrPAfA1TU1jDc1SAcR3dt5
	3pi24a7e++I7d8PPHaPPEPDXr/QAaROyRRC5jFzaEPVP7hh/mHH08TRhN1C/fIlysxCwv6q4AFwRn
	pbDQaSw4qGFNpQwvVZ1UH+bgXjlwg0c5zce00+Nv3kCn8kO0tPeabfuHR76SdaaegRRC4YoXMmWGO
	YWy31o8bjuDZDCetjWo/DgB/uhirZ95a7s6JZGpbGewRbX4pf304IQeA9tABVhrysNIeXmNgcDh8Q
	TgvtvR2w==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x9cqr-0000000Fajm-3HZD
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Sep 2026 06:22:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6F1641650;
	Wed, 23 Sep 2026 23:22:30 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 37B9F3F86C;
	Wed, 23 Sep 2026 23:22:32 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1790230953; bh=Izqyl3NqNDKyfXa9ucdwjbJWtozKpu+9KkF7o0jxLqU=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=OPa+4zC9f9wtpdd0jHUw79KM+PmDxqo33Qy51Nr+CSk2x54pJbO4UOQECBNk17oDq
	 47MeSSMtXam3UGJyZu6M9VB3iRorzwxWRsq7g8W5HqFQbtmH5CdE98QL3hJFujMxol
	 IgHW3ux46V5woHgSfjyTUXHAUC4ccX0FKBiX3G6Q=
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	Lorenzo Stoakes <ljs@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>,
	David Hildenbrand <david@kernel.org>,
	Mike Rapoport <rppt@kernel.org>,
	Linu Cherian <linu.cherian@arm.com>,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	kasan-dev@googlegroups.com
Subject: [PATCH V3 3/4] arm64/mm: Use p4dp_get() for P4D accesses
Date: Thu, 24 Sep 2026 11:52:13 +0530
Message-ID: <20260924062214.1635078-4-anshuman.khandual@arm.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260924062214.1635078-1-anshuman.khandual@arm.com>
References: <20260924062214.1635078-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260924_072240_163324_1215D04E 
X-CRM114-Status: GOOD (  21.14  )
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

Replace READ_ONCE() with p4dp_get() for P4D accesses in preparation for
supporting both D64 and D128 translation table formats.

READ_ONCE() cannot currently be used for 128-bit page table entries on
arm64 because it does not provide the required 128-bit single-copy
atomicity, causing builds to fail for accesses wider than 64 bits.

Although LDP/STP provide the required atomicity when FEAT_LSE is
available (as required by FEAT_D128), extending READ_ONCE() to support
128-bit accesses is undesirable. READ_ONCE() is a general-purpose API,
so doing so could encourage other 128-bit users that would either fail
to build in configurations without D128 support or, if D128 becomes a
runtime option, silently permit tearing on systems without the required
hardware support.

Instead, standardize P4D accesses on the existing page-table helpers.
These can be overridden on arm64 to provide 128-bit single-copy
atomicity when required.

For now override p4dp_get() which is same as the generic memory default
to avoid build dependency problem for callers in header <asm/pgtable.h>.

No functional change intended.

Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Will Deacon <will@kernel.org>
Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
Cc: kasan-dev@googlegroups.com
Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
---
Changes in V3

- Added platform override for p4dp_get()
- Replaced READ_ONCE() in pud_offset_phys() and pud_offset()

 arch/arm64/include/asm/pgtable.h | 10 ++++++++--
 arch/arm64/mm/fault.c            |  2 +-
 arch/arm64/mm/fixmap.c           |  2 +-
 arch/arm64/mm/hugetlbpage.c      |  2 +-
 arch/arm64/mm/kasan_init.c       |  4 ++--
 arch/arm64/mm/mmu.c              | 12 ++++++------
 arch/arm64/mm/pageattr.c         |  2 +-
 arch/arm64/mm/trans_pgd.c        |  4 ++--
 8 files changed, 22 insertions(+), 16 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index b46930f844a2..f235f68a7518 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -96,6 +96,12 @@ static inline pud_t pudp_get(pud_t *pudp)
 	return READ_ONCE(*pudp);
 }
 
+#define p4dp_get p4dp_get
+static inline p4d_t p4dp_get(p4d_t *p4dp)
+{
+	return READ_ONCE(*p4dp);
+}
+
 #ifdef CONFIG_TRANSPARENT_HUGEPAGE
 #define __HAVE_ARCH_FLUSH_PMD_TLB_RANGE
 
@@ -976,7 +982,7 @@ static inline phys_addr_t pud_offset_phys(p4d_t *p4dp, unsigned long addr)
 {
 	VM_WARN_ON_ONCE(!pgtable_l4_enabled());
 
-	return p4d_page_paddr(READ_ONCE(*p4dp)) + pud_index(addr) * sizeof(pud_t);
+	return p4d_page_paddr(p4dp_get(p4dp)) + pud_index(addr) * sizeof(pud_t);
 }
 
 static inline
@@ -990,7 +996,7 @@ pud_t *pud_offset_lockless(p4d_t *p4dp, p4d_t p4d, unsigned long addr)
 
 static inline pud_t *pud_offset(p4d_t *p4dp, unsigned long addr)
 {
-	return pud_offset_lockless(p4dp, READ_ONCE(*p4dp), addr);
+	return pud_offset_lockless(p4dp, p4dp_get(p4dp), addr);
 }
 #define pud_offset	pud_offset
 
diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
index 435e2e14c070..a6afd8929a10 100644
--- a/arch/arm64/mm/fault.c
+++ b/arch/arm64/mm/fault.c
@@ -174,7 +174,7 @@ static void show_pte(unsigned long addr)
 			break;
 
 		p4dp = p4d_offset_lockless(pgdp, pgd, addr);
-		p4d = READ_ONCE(*p4dp);
+		p4d = p4dp_get(p4dp);
 		ptval_to_str(pxd_str, p4d_val(p4d));
 		pr_cont(", p4d=%s", pxd_str);
 		if (p4d_none(p4d) || p4d_bad(p4d))
diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
index d9a870836faf..2a0fe0b0f771 100644
--- a/arch/arm64/mm/fixmap.c
+++ b/arch/arm64/mm/fixmap.c
@@ -74,7 +74,7 @@ static void __init early_fixmap_init_pmd(pud_t *pudp, unsigned long addr,
 static void __init early_fixmap_init_pud(p4d_t *p4dp, unsigned long addr,
 					 unsigned long end)
 {
-	p4d_t p4d = READ_ONCE(*p4dp);
+	p4d_t p4d = p4dp_get(p4dp);
 	pud_t *pudp;
 
 	if (CONFIG_PGTABLE_LEVELS > 3 && !p4d_none(p4d) &&
diff --git a/arch/arm64/mm/hugetlbpage.c b/arch/arm64/mm/hugetlbpage.c
index c9ad5e75b073..5771bf49e1fe 100644
--- a/arch/arm64/mm/hugetlbpage.c
+++ b/arch/arm64/mm/hugetlbpage.c
@@ -288,7 +288,7 @@ pte_t *huge_pte_offset(struct mm_struct *mm,
 		return NULL;
 
 	p4dp = p4d_offset(pgdp, addr);
-	if (!p4d_present(READ_ONCE(*p4dp)))
+	if (!p4d_present(p4dp_get(p4dp)))
 		return NULL;
 
 	pudp = pud_offset(p4dp, addr);
diff --git a/arch/arm64/mm/kasan_init.c b/arch/arm64/mm/kasan_init.c
index aad29bcc7622..4dd8c1186471 100644
--- a/arch/arm64/mm/kasan_init.c
+++ b/arch/arm64/mm/kasan_init.c
@@ -89,7 +89,7 @@ static pmd_t *__init kasan_pmd_offset(pud_t *pudp, unsigned long addr, int node,
 static pud_t *__init kasan_pud_offset(p4d_t *p4dp, unsigned long addr, int node,
 				      bool early)
 {
-	if (p4d_none(READ_ONCE(*p4dp))) {
+	if (p4d_none(p4dp_get(p4dp))) {
 		phys_addr_t pud_phys = early ?
 				__pa_symbol(kasan_early_shadow_pud)
 					: kasan_alloc_zeroed_page(node);
@@ -162,7 +162,7 @@ static void __init kasan_p4d_populate(pgd_t *pgdp, unsigned long addr,
 	do {
 		next = p4d_addr_end(addr, end);
 		kasan_pud_populate(p4dp, addr, next, node, early);
-	} while (p4dp++, addr = next, addr != end && p4d_none(READ_ONCE(*p4dp)));
+	} while (p4dp++, addr = next, addr != end && p4d_none(p4dp_get(p4dp)));
 }
 
 static void __init kasan_pgd_populate(unsigned long addr, unsigned long end,
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 22efaee79293..83709d987e7c 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -367,7 +367,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
 {
 	int ret = 0;
 	unsigned long next;
-	p4d_t p4d = READ_ONCE(*p4dp);
+	p4d_t p4d = p4dp_get(p4dp);
 	pud_t *pudp;
 
 	if (p4d_none(p4d)) {
@@ -457,7 +457,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 	}
 
 	do {
-		p4d_t old_p4d = READ_ONCE(*p4dp);
+		p4d_t old_p4d = p4dp_get(p4dp);
 
 		next = p4d_addr_end(addr, end);
 
@@ -467,7 +467,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
 			goto out;
 
 		VM_WARN_ON_ONCE(p4d_val(old_p4d) != 0 &&
-				p4d_val(old_p4d) != READ_ONCE(p4d_val(*p4dp)));
+				p4d_val(old_p4d) != (p4d_val(p4dp_get(p4dp))));
 
 		phys += next - addr;
 	} while (p4dp++, addr = next, addr != end);
@@ -1622,7 +1622,7 @@ static void unmap_hotplug_p4d_range(pgd_t *pgdp, unsigned long addr,
 	do {
 		next = p4d_addr_end(addr, end);
 		p4dp = p4d_offset(pgdp, addr);
-		p4d = READ_ONCE(*p4dp);
+		p4d = p4dp_get(p4dp);
 		if (p4d_none(p4d))
 			continue;
 
@@ -1788,7 +1788,7 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
 	do {
 		next = p4d_addr_end(addr, end);
 		p4dp = p4d_offset(pgdp, addr);
-		p4d = READ_ONCE(*p4dp);
+		p4d = p4dp_get(p4dp);
 		if (p4d_none(p4d))
 			continue;
 
@@ -1809,7 +1809,7 @@ static void free_empty_p4d_table(pgd_t *pgdp, unsigned long addr,
 	 */
 	p4dp = p4d_offset(pgdp, 0UL);
 	for (i = 0; i < PTRS_PER_P4D; i++) {
-		if (!p4d_none(READ_ONCE(p4dp[i])))
+		if (!p4d_none(p4dp_get(p4dp + i)))
 			return;
 	}
 
diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
index 07b2fa4de57f..826856ef64a8 100644
--- a/arch/arm64/mm/pageattr.c
+++ b/arch/arm64/mm/pageattr.c
@@ -403,7 +403,7 @@ bool kernel_page_present(struct page *page)
 		return false;
 
 	p4dp = p4d_offset(pgdp, addr);
-	if (p4d_none(READ_ONCE(*p4dp)))
+	if (p4d_none(p4dp_get(p4dp)))
 		return false;
 
 	pudp = pud_offset(p4dp, addr);
diff --git a/arch/arm64/mm/trans_pgd.c b/arch/arm64/mm/trans_pgd.c
index d119119455f1..7afe2beca4ba 100644
--- a/arch/arm64/mm/trans_pgd.c
+++ b/arch/arm64/mm/trans_pgd.c
@@ -99,7 +99,7 @@ static int copy_pud(struct trans_pgd_info *info, p4d_t *dst_p4dp,
 	unsigned long next;
 	unsigned long addr = start;
 
-	if (p4d_none(READ_ONCE(*dst_p4dp))) {
+	if (p4d_none(p4dp_get(dst_p4dp))) {
 		dst_pudp = trans_alloc(info);
 		if (!dst_pudp)
 			return -ENOMEM;
@@ -145,7 +145,7 @@ static int copy_p4d(struct trans_pgd_info *info, pgd_t *dst_pgdp,
 	src_p4dp = p4d_offset(src_pgdp, start);
 	do {
 		next = p4d_addr_end(addr, end);
-		if (p4d_none(READ_ONCE(*src_p4dp)))
+		if (p4d_none(p4dp_get(src_p4dp)))
 			continue;
 		if (copy_pud(info, dst_p4dp, src_p4dp, addr, next))
 			return -ENOMEM;
-- 
2.43.0


