Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CDD5CFF8868
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Apr 2026 15:35:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:Cc:To:From:
	Subject:Message-ID:Mime-Version:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=YrjY8IxNTKfKtmD2Yq6xqpB77zy7Hr/7JUIGpo0JaOI=; b=45AgrWKJOiVCpqoRfGOh8YmwTG
	f+q75x4I8G0hPOhcy9mONNBiu49uyORc/qr7ktgTSJFf/+kCe8Gb+SAeg/QYh16uxEvYaqe49idCZ
	eJgaAHD0bXKBIZsNCVv3KsgPmvE2CGMQxHaMdeRuekSyVVYKEetmmlmhisQRkzh2EiR95m091h99I
	q0VLRj1YSOt745r9L3GXz4IbL3SyAgfAcbXeFR3V1hjrZNX13BvktUb99R5xBpMGqNi7NYufk4kef
	72Kns8hbd+ZYSF8xM6dvvQ4Fj6qrFbcaAkjzLppAy/99RPWEy8KAfB1vAJ1donZcn2fldAIutyrcp
	TLvD79YQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzn-0000000HCQz-1Tf9;
	Mon, 27 Apr 2026 15:35:39 +0000
Received: from mail-wm1-x34a.google.com ([2a00:1450:4864:20::34a])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wHNzl-0000000HCPg-17hY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Apr 2026 15:35:38 +0000
Received: by mail-wm1-x34a.google.com with SMTP id 5b1f17b1804b1-488d8deb75fso85319055e9.3
        for <linux-arm-kernel@lists.infradead.org>; Mon, 27 Apr 2026 08:35:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1777304134; x=1777908934; darn=lists.infradead.org;
        h=cc:to:from:subject:message-id:mime-version:date:from:to:cc:subject
         :date:message-id:reply-to;
        bh=YrjY8IxNTKfKtmD2Yq6xqpB77zy7Hr/7JUIGpo0JaOI=;
        b=rH++j1CT0y+lW1TxWrnA2HjelnJEN/wW/iRBzfeqIeZcwGJI7KnXKUU7Ur22J/tCRD
         rxF5TMDRAscJF+giAxW+rY6EnvMF2IGmSBSIgjEuoduj7MeaEA3EwjqFXqWS8QeC/BVM
         tjb8sEGx+rbAPFYRSXzQ9xLGgmuVenjhIXSU3j2jzbC9mrn2jCoAfg6oCVuHMQx9lo34
         2fKoqMn/ZU94AeV0TMD+uiRky7yINxLhzzOmN/W8mG10GKpu+FNA39BDmFaoJTZfZrLp
         6X1aj7GBoHGS+OAIQgDoH+XqdlH3jCIO8TfL7zOuXh6fZTjqTKFGiBFM+x3Bhlw571SM
         eNRA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1777304134; x=1777908934;
        h=cc:to:from:subject:message-id:mime-version:date:x-gm-message-state
         :from:to:cc:subject:date:message-id:reply-to;
        bh=YrjY8IxNTKfKtmD2Yq6xqpB77zy7Hr/7JUIGpo0JaOI=;
        b=qxBYo0y9H3/XrHfNKJPouqIlPHTMf/hnWoaSrAAXOwj9NLtdKvM9dwAqVNqSDq7aiJ
         qBbZqsFeiN8J2aFTjCaCLgdfwehgDHQzgLplAWnNcwvfiPDOtaNNXZ9yE4bzOHSinNj/
         YuU44tQrZ8i1ENOpALLg1k3FO6jTdtS41ziUeA5BmDcvyQ8alCTXtrVJQAheorzCcNx5
         VLqFoV3crvJ0jfiLQgUtJYkg6JMFfWi5VJST6onkRDM2H6bxmHcGqB98IW60wd4Ucc8h
         AcnyNBKBmD/CApYMLY67mTVHWFg81hmn1WQ1J8QunIQ0s2fyIn6E8UZncH7ENIDwgX74
         k+SA==
X-Gm-Message-State: AOJu0YyhxNULyE4DgnLRggR6q5d/8P/NHe5PMySYCrdcId4rjIaFERO2
	seX7kHGgI4I6ao1EdWEjOdCcUgjaY6nYpvs0QJ/1AyLxk4aY6y4uXJIhEeD/wYe/VnAZjZtIDLg
	HWb4DRtj1a/jRkPCMhyJSvIBWw0bWq1/Q1/+LjFx3UIlsGKJGCzwlzV9zTHZ+oejMn73vkp0fFb
	UtbYAQVBfUu3Q+DBX6EaXnn6r0xAA13xFW8bmFQrskgZi1
X-Received: from wmbjx26.prod.google.com ([2002:a05:600c:579a:b0:485:34ec:2b75])
 (user=ardb job=prod-delivery.src-stubby-dispatcher) by 2002:a05:600c:1da1:b0:488:d376:42cd
 with SMTP id 5b1f17b1804b1-488fb785901mr663577045e9.22.1777304134363; Mon, 27
 Apr 2026 08:35:34 -0700 (PDT)
Date: Mon, 27 Apr 2026 17:34:17 +0200
Mime-Version: 1.0
X-Developer-Key: i=ardb@kernel.org; a=openpgp; fpr=F43D03328115A198C90016883D200E9CA6329909
X-Developer-Signature: v=1; a=openpgp-sha256; l=3717; i=ardb@kernel.org;
 h=from:subject; bh=LVM+Y6mOTsDAEGVgOMgatOUvHVY5AE8R0yMbkioDilo=;
 b=owGbwMvMwCVmkMcZplerG8N4Wi2JIfN9488nT45tn57o6vvE7q8ny9U5wpOCLGfNE187e/1Rp
 nVSOrNsO0pZGMS4GGTFFFkEZv99t/P0RKla51myMHNYmUCGMHBxCsBEir4yMvxY9lqk7ujm5tS7
 xyZaFgXbXOJ9Of3Dt6l/Uw/4vXS8MzuU4Z/xlCfNa575zJdKs4u0OnaxjvUIEy/3O1G52/Y+7/z ZU9kB
X-Mailer: git-send-email 2.54.0.rc2.544.gc7ae2d5bb8-goog
Message-ID: <20260427153416.2103979-17-ardb+git@google.com>
Subject: [PATCH v4 00/15] arm64: Unmap linear alias of kernel data/bss
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
X-CRM114-CacheID: sfid-20260427_083537_363952_2AA26F59 
X-CRM114-Status: GOOD (  16.39  )
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

One of the reasons the lack of randomization of the linear map on arm64
is considered problematic is the fact that bootloaders adhering to the
original arm64 boot protocol (i.e., a substantial fraction of all
Android phones) may place the kernel at the base of DRAM, and therefore
at the base of the non-randomized linear map. This puts a writable alias
of the kernel's data and bss regions at a predictable location, removing
the need for an attacker to guess where KASLR mapped the kernel.

Let's unmap this linear, writable alias entirely, so that knowing the
location of the linear alias does not give write access to the kernel's
data and bss regions.

Changes since v3:
- Drop bogus patch adding hierarchical PXN to the fixmap mapping, which
  breaks the KPTI trampoline (thanks to Sashiko)
- Add generic patch to move the empty_zero_page to __ro_after_init, as
  it now lives in generic code.
- Add patches to remap the linear aliases of the fixmap page tables
  read-only too - these live at an a priori known offset in the linear
  map if physical KASLR was omitted, and control a priori known
  addresses in the virtual kernel space.
- Rebase onto v7.1-rc1

Changes since v2:
- Keep bm_pte[] in the region that is remapped r/o or unmapped, as it is
  only manipulated via its kernel alias
- Drop check that prohibits any manipulation of descriptors with the
  CONT bit set
- Add Ryan's ack to a couple of patches
- Rebase onto v7.0-rc4

Changes since v1:
- Put zero page patch at the start of the series
- Tweak __map_memblock() API to respect existing table and contiguous
  mappings, so that the logic to map the kernel alias can be simplified
- Stop abusing the MEMBLOCK_NOMAP flag to initially omit the kernel
  linear alias from the linear map
- Some additional cleanup patches
- Use proper API [set_memory_valid()] to (un)map the linear alias of
  data/bss.

Cc: Ryan Roberts <ryan.roberts@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: Liz Prucka <lizprucka@google.com>
Cc: Seth Jenkins <sethjenkins@google.com>
Cc: Kees Cook <kees@kernel.org>
Cc: Mike Rapoport <rppt@kernel.org>
Cc: David Hildenbrand <david@kernel.org>
Cc: Andrew Morton <akpm@linux-foundation.org>
Cc: linux-mm@kvack.org
Cc: linux-hardening@vger.kernel.org

Ard Biesheuvel (15):
  arm64: mm: Map the linear alias of text/rodata as tagged
  mm: Make empty_zero_page __ro_after_init
  arm64: mm: Preserve existing table mappings when mapping DRAM
  arm64: mm: Preserve non-contiguous descriptors when mapping DRAM
  arm64: mm: Remove bogus stop condition from map_mem() loop
  arm64: mm: Drop redundant pgd_t* argument from map_mem()
  arm64: mm: Permit contiguous descriptors to be rewritten
  arm64: kfence: Avoid NOMAP tricks when mapping the early pool
  arm64: mm: Permit contiguous attribute for preliminary mappings
  arm64: Move fixmap page tables to end of kernel image
  arm64: mm: Don't abuse memblock NOMAP to check for overlaps
  arm64: mm: Map the kernel data/bss read-only in the linear map
  arm64: mm: Unmap kernel data/bss entirely from the linear map
  arm64: mm: Generalize manipulation code of read-only descriptors
  arm64: mm: Remap linear aliases of the fixmap page tables read-only

 arch/arm64/include/asm/pgtable.h  |  33 ++--
 arch/arm64/include/asm/sections.h |   1 +
 arch/arm64/kernel/vmlinux.lds.S   |  14 +-
 arch/arm64/mm/fixmap.c            |   8 +-
 arch/arm64/mm/mmu.c               | 167 +++++++++++---------
 mm/mm_init.c                      |   2 +-
 6 files changed, 130 insertions(+), 95 deletions(-)


base-commit: 254f49634ee16a731174d2ae34bc50bd5f45e731
-- 
2.54.0.rc2.544.gc7ae2d5bb8-goog


