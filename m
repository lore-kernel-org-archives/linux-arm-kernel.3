Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2CF3BCD98E2
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Jun 2026 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ytp+bdNRdXUdbPQ9Ezf0ymEFpvBnhLVGkSee+aNNB40=; b=o0xfjTgPwhXki/l4G5aKwSnoya
	/YCgijTC44d1bygNrilmwC9k964x6fbM1LHOsqudbJWyb6HMxJU7M1wAA4991pwHQoKudFxwIXfN8
	v+ipz+LaORHrVI/FbgrDgt5NpuRA8F8NLuMGzNGevRc1jUsXP8J2VD05DMAjDA6qj1VUFYjT2GM4P
	qXZiuwwrF25JyrlHfPORfzXb51AFwtTYvjLJbsbVC0ampar+HQ7c/u6TnsPn0PTzbi2Ji62ig4rqC
	nBi8eObmoKS6RbvBUKL2y3M8wB6FtRyfRlqO93j1s2e28BAEE59eUCzhm7Rnid8Imh9TVLm1nze8p
	C4L1o+EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8PS-00000000ruQ-2ePW;
	Thu, 18 Jun 2026 08:47:38 +0000
Received: from mail-pj1-x1036.google.com ([2607:f8b0:4864:20::1036])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wa8PP-00000000rtp-3ZX6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 18 Jun 2026 08:47:37 +0000
Received: by mail-pj1-x1036.google.com with SMTP id 98e67ed59e1d1-37ce68a54f8so251477a91.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 18 Jun 2026 01:47:35 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1781772454; x=1782377254; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=ytp+bdNRdXUdbPQ9Ezf0ymEFpvBnhLVGkSee+aNNB40=;
        b=XTC9V85e7MxSa+tpkYgfkIjrz+xZv0ZA+Ivh59Whno0FwyfT66kGliDWY7hyBI+4rI
         4vUn5HET9JFViADxLQkjpNq5FTU8CDRD2VULyuXF91VveLEtFi34RChXBOt3DnBOXVnY
         KpZgAghqjpmMa6JkgmvaUKtbvAmymwBYFcEquYqIWFnQHaKntfEx8kV/7JgRBtHG9Yvx
         FZmCXWj48f8XGdQrii75roUeobOOjiDa5vhsIfh44U/PY2sD5ctaEsE74fbYhaWfQxlb
         /1/HtWeXopL6ncgeRM28WWoGaW9JnYpbKceAezkG5cGwfO26AZxhkHjp4g4RHysUQf2D
         VZwQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781772454; x=1782377254;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=ytp+bdNRdXUdbPQ9Ezf0ymEFpvBnhLVGkSee+aNNB40=;
        b=lV2y9MpObE2sMMwdgXKRRGoMyZdLjazzuaruanbFLOdUqcpHxNTN/ccHVhe9jWMn2Y
         6h5Qer3etwNV60ElbcBEmixGMswZI18fnRxdL+eJy8aU6/l4+gg/4lFoRtSuj75aHUlg
         5G4RNa6IUBzAMKYUHMPzfi0dcPTATqsg0SusfvWe6LFwsvE5YzFfPR/14jJkDD7qViYs
         lovkyu2BsZIWU7L77l8SZUxhcwZUDnYwsyz83doKVRdWU09le55YZsSsHiBXliCp8pL4
         bS7C9qIktVFQAk2tssRPdCd9mnwVWw+JUCCEN/b6UODb5wBkF2LzO6KUYtEoHNt9NClH
         3Bfg==
X-Forwarded-Encrypted: i=1; AFNElJ+Vh652Eurlb1AM7efCCyJ7nerXzUy3lneAZ2GzVgwadYRkyo8GadUTG/txEykWUWf0vnCx0WuM1TFiTkAM8nbH@lists.infradead.org
X-Gm-Message-State: AOJu0YxAt+t5njSjjV/3056cBlqQlWLeohaAMk+G4e8J9NiTgwzTT6D5
	Xy0E5V4ObyBjbwAJrnEpsT4XkqqnduyCpA/BHjwFetfhLyDEx57bVfmO
X-Gm-Gg: AfdE7clNlU1VTcAa6BK2cVF/5LM5xT+4Ah5xbLKUYrFfn24zqWpYMc8hU4WtBQYQwll
	lRNpl/2Gakh4CW7kR6M9zgaedtlcUCaJg+GNAsA+V60EwkI8uutgyt71CtTXUkCWuhN6NiPkedn
	b44GfhTf2aHp6EoVfbKqn1YbAkmrIQ3RkGS4Y9c7RCwdzF/f0klAKgFSpGEEus6MPLE+b9btkhr
	A9Y2IVgUDjIDVS9ruiAZz+w4j1+OpK25keU9fl32p08IacnepvDB9HuA7Lh+YLls3i7+keZJEiG
	kIw5iqh3lCZyGK/cpDtzhIdwIUzfey0wkb7O5RXdNhUvICTwumzoMlkOO0g/z/UNkdBvXFORzlC
	fey402Wftpz8F914WKbsWT6ZteE6xzOHgePM+aKnm0h9Hy1ReLQefRhyf+/tNxlDAVeWUQ25uR8
	ALOcYCDzi0r+LQyqOR/v/dtlouwtR0BY5RQVA=
X-Received: by 2002:a17:90a:c2cc:b0:35b:9894:f6f9 with SMTP id 98e67ed59e1d1-37c9e9d41a7mr6843844a91.18.1781772454417;
        Thu, 18 Jun 2026 01:47:34 -0700 (PDT)
Received: from mi-OptiPlex-7060.mioffice.cn ([43.224.245.234])
        by smtp.gmail.com with ESMTPSA id 98e67ed59e1d1-37c521d8e7bsm8628856a91.5.2026.06.18.01.47.29
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 18 Jun 2026 01:47:33 -0700 (PDT)
From: Wen Jiang <jiangwenxiaomi@gmail.com>
X-Google-Original-From: Wen Jiang <jiangwen6@xiaomi.com>
To: linux-mm@kvack.org,
	linux-arm-kernel@lists.infradead.org,
	catalin.marinas@arm.com,
	will@kernel.org,
	akpm@linux-foundation.org,
	urezki@gmail.com
Cc: baohua@kernel.org,
	Xueyuan.chen21@gmail.com,
	dev.jain@arm.com,
	rppt@kernel.org,
	david@kernel.org,
	ryan.roberts@arm.com,
	anshuman.khandual@arm.com,
	ajd@linux.ibm.com,
	linux-kernel@vger.kernel.org,
	jiangwen6@xiaomi.com,
	shanghaoqiang@xiaomi.com
Subject: [PATCH v4 0/6] mm/vmalloc: Speed up ioremap, vmalloc and vmap with contiguous memory
Date: Thu, 18 Jun 2026 16:47:20 +0800
Message-Id: <20260618084726.1070022-1-jiangwen6@xiaomi.com>
X-Mailer: git-send-email 2.34.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260618_014735_895039_A3195796 
X-CRM114-Status: GOOD (  12.16  )
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

This patchset accelerates ioremap, vmalloc, and vmap when the memory
is physically fully or partially contiguous. Two techniques are used:

1. Avoid page table rewalk when setting PTEs/PMDs for multiple memory
   segments
2. Use batched mappings wherever possible in both vmalloc and ARM64
   layers

Besides accelerating the mapping path, this also enables large
mappings (PMD and cont-PTE) for vmap, which are currently not
supported.

Patches 1-2 extend ARM64 vmalloc CONT-PTE mapping to support multiple
CONT-PTE regions instead of just one.

Patch 3 extracts a common helper vmap_set_ptes() that consolidates PTE
mapping logic between the ioremap and vmalloc/vmap paths, handling both
CONT_PTE and regular PTE mappings. This prepares for the next patch.

Patch 4 extends the page table walk path to support page shifts other
than PAGE_SHIFT and eliminates the page table rewalk for huge vmalloc
mappings. The function is renamed from vmap_small_pages_range_noflush()
to vmap_pages_range_noflush_walk().

Patches 5-6 add huge vmap support for contiguous pages, including
support for non-compound pages with pfn alignment verification.

On the RK3588 8-core ARM64 SoC, with tasks pinned to a little core and
the performance CPUfreq policy enabled, benchmark results:

* ioremap(1 MB): 1.35x faster (3407 ns -> 2526 ns)
* vmalloc(1 MB) mapping time (excluding allocation) with
  VM_ALLOW_HUGE_VMAP: 1.42x faster (5.00 us -> 3.53us)
* vmap(100MB) with order-8 pages: 8.3x faster (1235 us -> 149 us)

Many thanks to Xueyuan Chen for his testing efforts on RK3588 boards.

Changes since v3:
- Squash vmap_pte_range() loop variable fix into patch 4 (patch 3, 4)
- Use shift >= PMD_SHIFT and fix *nr increment in
  vmap_pages_pmd_range() (patch 4)
- Pass page_shift directly without capping at PMD_SHIFT (patch 4, 5)
- Add vm_shift() helper and pass pgprot_t to get_vmap_batch_order()
  (patch 5)
- Use min(order, __ffs(pfn)) for graceful pfn alignment degradation,
  replacing IS_ALIGNED check (patch 5)
- Remove irrelevant ioremap_max_page_shift early-exit (patch 5)
- Add __get_vm_area_node_aligned_caller() wrapper, rename to
  vmap_get_aligned_vm_area() (patch 6)

Changes since v2:
- Use __fls instead of fls in arch_vmap_pte_range_map_size (patch 2)
- Add WARN_ON checks in vmap_pages_pmd_range (patch 4)
- Fix flush_cache_vmap to use saved start address instead of the
  already-advanced addr (patch 5)
- Rename __vmap_huge() to vmap_batched() (patch 5)
- Add caller parameter and unroll while(1) loop (patch 5)
- Squash patch 7 into patch 5 (stop scanning for compound pages after
  encountering small pages)

Changes since v1:
- Fix condition order and use PMD_SIZE instead of CONT_PMD_SIZE in
  patch 1 (Dev Jain)
- Squash patch 3+4 and patch 5+7 (Dev Jain)
- Replace "zigzag" with "page table rewalk" in commit messages
  (Dev Jain)
- Rename vmap_small_pages_range_noflush() to
  vmap_pages_range_noflush_walk() (Dev Jain)
- Extract vmap_set_ptes() as a new patch to consolidate PTE mapping
  logic between vmap_pte_range() and vmap_pages_pte_range(), handling
  both CONT_PTE and regular mappings (Mike Rapoport)
- Support non-compound pages in get_vmap_batch_order() by falling
  back to physical contiguity scanning with pfn alignment check
  (Dev Jain, Uladzislau Rezki)
- In get_vmap_batch_order(), filter out orders that the architecture
  cannot batch by checking arch_vmap_pte_supported_shift() directly.
  This avoids overhead for orders 1-3 on ARM64 CONT_PTE with 4K
  pages. (patch 5)

Barry Song (Xiaomi) (5):
  arm64/hugetlb: Extend batching of multiple CONT_PTE in a single PTE
    setup
  arm64/vmalloc: Allow arch_vmap_pte_range_map_size to batch multiple
    CONT_PTE
  mm/vmalloc: Extend page table walk to support larger page_shift sizes
    and eliminate page table rewalk
  mm/vmalloc: map contiguous pages in batches for vmap() if possible
  mm/vmalloc: align vm_area so vmap() can batch mappings

Wen Jiang (1):
  mm/vmalloc: Extract vmap_set_ptes() to consolidate PTE mapping logic

 arch/arm64/include/asm/vmalloc.h |   6 +-
 arch/arm64/mm/hugetlbpage.c      |  10 ++
 mm/vmalloc.c                     | 247 +++++++++++++++++++++++++------
 3 files changed, 213 insertions(+), 50 deletions(-)

-- 
2.34.1


