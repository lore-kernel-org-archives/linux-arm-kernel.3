Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2D68FF8860
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:35:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:References:Mime-Version:In-Reply-To:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=prYizMoqeWKaDZjQ0nuvo6tbUP8AzcnCOIOw0eqIeeQ=; b=svr1O4pcDw63gc1ke9VWkjKYm+
	JFl1SzYCCS/TcIFxMEuZdez1CEG37YvgsAvw/kforgFDOY2bT0J9/MjDPK/YhjdszQXGervEXhsOd
	BOHXXfSAVHD3B+qH0KLLc9o/Mkzt2uZDtVhGTyWDBN3K1CBoAtaBAGFCGitm4icb1E+MuZ51vri/v
	9+VXueCh242sBy1AaKhXqoJu5Qst+QUnw1aPNdCYv6ZwkKMYNFPseeM3xptkthGDviqonYixQbcra
	QMG3z+RbUtzYBiWarYoin3jpn1t5skCalJwLWgCpg5ZJaQvle5NhBb/Y+XVeiPGX+PKOv5fDNuamw
	8jn7pfDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzw-0000000HCWX-3PYd;
	Mon, 27 Apr 2026 15:35:48 +0000
Received: from mail-wr1-x449.google.com ([2a00:1450:4864:20::449])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzo-0000000HCQi-3y45
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:42 +0000
Received: by mail-wr1-x449.google.com with SMTP id ffacd0b85a97d-43efc93e4f6so8292495f8f.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:40 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304139; x=1777908939; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:from:to:cc:subject:date:message-id:reply-to;
        bh=prYizMoqeWKaDZjQ0nuvo6tbUP8AzcnCOIOw0eqIeeQ=;
        b=ZNCI0PKTLJcI8kM1IupBSIK6A1fZjft7ie4VEfVqKwj5/cybItfHND02lkfIS9aBEU
         VJIYmlkxmIvs4m6G69/qr7NiWOansxOE7Cu094SW1Gi0+hFbO2MyqEFnUuER61aCYjqj
         HpLNn0maZz6yxgZXLs5Hv9XFXiInMtnHn2HlMbDjCEt5zPl0AyeWg/btC5Yxuxx7xHWN
         /oqfc/R8vnCF/4j9cBRU+rtzpz6NW8GO6BfOYpYLPSnYKqM7ijFvxzksvqHgKcx5ss75
         Nonqvpx/MOnTOkq4Jsji6SnCpu73nC3cLuOpLfEE985ADVoeVCKYRCdly3c1h4XCEOdU
         QRnw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304139; x=1777908939;
        h=cc:to:from:subject:message-id:references:mime-version:in-reply-to
         :date:x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=prYizMoqeWKaDZjQ0nuvo6tbUP8AzcnCOIOw0eqIeeQ=;
        b=rcxCU4fixp3xfZKB2v32JCNq7UYmt/XYDO32AOdPDJfyGtpcLHTuclPTlaa0n42+ab
         dhnKEI8T9Q3HtQjffXQ4yt6zwbbFbrfDo60ejiUlSPXKY0P1ZUz4gdZS3tkXC8wLLopu
         w4aJiSFVCkWZjCCBgJoo2HuutvdqrBNAezk32LMhQxtnrnxZq6yiTgb6+6LJhumzl8Tk
         IboJuPzWH1LeHEUJpou/C1r/b6uoMDv840wJ83LZHbXsidh6tTkzDEtL6FzNJBzA1rrY
         p7Tzp1FzYdtvTPNAhRAovdSWHDz89YttDLztACTItlNj2sKrBA80pSIwBGIEvWu5qEP5
         NXaw==
X-Gm-Message-State: AOJu0Yz/AHKlDFFaQizK5euAt/bc2nD3xCmvbexcWixhuCOfr/wIHsU1
	XQeWuAE8Clbot6C/ZG7vq9xds/Q2igNLqnu/829D+cNyS5C++vFsNbZi+3Jkm/B2YQznYqlVU5/
	cskYEWNQ5u4B4XQ+26EAItzZC7sD0LUi0+fhie5UePk4rtGwhB/yS52w+5SUSaWQ/r83BEbQvv6
	164T2rceqEmdZuWXqcAw7HzZKN60VQGgFywgczZ9kVlp0s
X-Received: from wrpx17.prod.google.com ([2002:adf:f651:0:b0:441:2eb5:f2f3])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:621a:b0:48a:6268:18a9
 with SMTP id 5b1f17b1804b1-48a626818cdmr232216125e9.13.1777304138328; Mon, 27
 Apr 2026 08:35:38 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:21 +0200
In-Reply-To: <20260427153416.2103979-17-ardb+git@google.com>
Mime-Version: 1.0
References: <20260427153416.2103979-17-ardb+git@google.com>
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=2701; i=ardb@kernel.org;
 h=from:subject; bh=aEcnYdyzs+Jl6x1LXyRc2wvdSGWl6fC+aTg1LsbHjwQ=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN94//XXIcrTPk7rYUCN2cm+KhM2sqjKyt3IviukIL3z
 nmlYokdpSwMYlwMsmKKLAKz/77beXqiVK3zLFmYOaxMIEMYuDgFYCITmhn+h+c0/z7TXLNLwT+5
 2H668O/amKwlTWfv3NYJ/6xb++rrQYb/3i4e3oYrxG//mbFf4HQ3M8eGnkiV+PfzOz49Fdq1VO4 XGwA=
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-21-ardb+git@google.com>
Subject: [PATCH v4 04/15] arm64: mm: Preserve non-contiguous descriptors when
 mapping DRAM
From: Ard Biesheuvel <ardb+git@google.com>
To: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com, 
	mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, 
	Anshuman Khandual <anshuman.khandual@arm.com>, Liz Prucka <lizprucka@google.com>, 
	Seth Jenkins <sethjenkins@google.com>, Kees Cook <kees@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, David Hildenbrand <david@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, linux-mm@kvack.org, 
	linux-hardening@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260427_083541_013517_5E3B3A93 
X-CRM114-Status: GOOD (  14.49  )
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

From: Ard Biesheuvel <ardb@kernel.org>

Instead of blindly overwriting existing live entries with the contiguous
bit cleared when mapping DRAM regions, check whether the contiguous
region in question starts with a descriptor that has the valid bit set
and the contiguous bit cleared, and in that case, leave the contiguous
bit unset on the entire region. This permits the logic of mapping the
kernel's linear alias to be simplified in a subsequent patch.

Note that not setting the contiguous bit on any of the descriptors in
the contiguous region can only result in an invalid configuration if it
was already invalid to begin with.

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
---
 arch/arm64/include/asm/pgtable.h | 4 ++++
 arch/arm64/mm/mmu.c              | 6 ++++--
 2 files changed, 8 insertions(+), 2 deletions(-)

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 4dfa42b7d053..a1c5894332d9 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -181,6 +181,10 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
  * Returns true if the pte is valid and has the contiguous bit set.
  */
 #define pte_valid_cont(pte)	(pte_valid(pte) && pte_cont(pte))
+/*
+ * Returns true if the pte is valid and has the contiguous bit cleared.
+ */
+#define pte_valid_noncont(pte)	(pte_valid(pte) && !pte_cont(pte))
 /*
  * Could the pte be present in the TLB? We must check mm_tlb_flush_pending
  * so that we don't erroneously return false for pages that have been
diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
index 801a54ade76f..005844e521bd 100644
--- a/arch/arm64/mm/mmu.c
+++ b/arch/arm64/mm/mmu.c
@@ -224,7 +224,8 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
 
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PTE_MASK) == 0) &&
-		    (flags & NO_CONT_MAPPINGS) == 0)
+		    (flags & NO_CONT_MAPPINGS) == 0 &&
+		    !pte_valid_noncont(__ptep_get(ptep)))
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
 		init_pte(ptep, addr, next, phys, __prot);
@@ -324,7 +325,8 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
 
 		/* use a contiguous mapping if the range is suitably aligned */
 		if ((((addr | next | phys) & ~CONT_PMD_MASK) == 0) &&
-		    (flags & NO_CONT_MAPPINGS) == 0)
+		    (flags & NO_CONT_MAPPINGS) == 0 &&
+		    !pte_valid_noncont(pmd_pte(READ_ONCE(*pmdp))))
 			__prot = __pgprot(pgprot_val(prot) | PTE_CONT);
 
 		ret = init_pmd(pmdp, addr, next, phys, __prot, pgtable_alloc, flags);
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


