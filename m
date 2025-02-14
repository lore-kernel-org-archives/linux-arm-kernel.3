Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7E0EC02198
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 14 Feb 2025 09:32:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DduguDwADVTSjMMK9ejwaGtXsiipFClLhmxdmWDmii0=; b=QdCsrj5kNHtiQazpPPKb89z+LS
	r+e09bPH++oFiSm/zqmP4UFh+nhVTzqANZQJ+i8wiLJkG4ZP86tKBPliaRYk9TEG+yO96eMout2F7
	dg5U6SiVyqgQ18OozQ1UmmI8Y0PEd+o6IYpYzT1a0mwbKSMu6YpB+xj4N/oc74p9+S4l07JD9uBO9
	aXHtTOI9S833PZXpViYHjkfsgO3+If/MEIBgZUUW+WM3qpDnjzAzMyPLIDXpZqadH361UWcPMVlcc
	ozJkjhdoTgY7bQtes2nef/8HjtxlASYflLtJ0OKC3/onqyFsetuj4Cscf0B04Z7KG+0haxi6i5HMf
	6ldP1xpw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tis3F-0000000EKp8-1mXz;
	Fri, 14 Feb 2025 09:32:01 +0000
Received: from mail-pl1-x629.google.com ([2607:f8b0:4864:20::629])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tis1n-0000000EKMC-2voM;
	Fri, 14 Feb 2025 09:30:33 +0000
Received: by mail-pl1-x629.google.com with SMTP id d9443c01a7336-21f78b1fb7dso31370885ad.3;
        Fri, 14 Feb 2025 01:30:31 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1739525430; x=1740130230; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=DduguDwADVTSjMMK9ejwaGtXsiipFClLhmxdmWDmii0=;
        b=PtfwXwiL8M1lGaZmVOqkOC/eMfUyACx+60eKdEQ0gCZ7/bTa+MA19M9rBzZLOVCori
         580r8eH3vowyyBTp7JIItw7w9G75X0wAQw2QGaqJe7v8hx6sFGp+5bgKAIrPxUSkrNVH
         3IcUJ4/y7mr0S2uW8WglScKPBbO66THUAkeqOyoxZayhcANCDMBf5mf4vJBt/QR1/8sy
         affZh5xZLQfeALBKzMCgbYzmEGiNwLUKWAlsgRMKvvc6Bi4YWafrvYhEewNAJZHDFirZ
         dBnNNYLIzT7FurIEtEP0zRBUZECz/hd/5wnuHVynzWJgAqSZSI350lo4xn03E60DNoFc
         9IvA==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1739525430; x=1740130230;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=DduguDwADVTSjMMK9ejwaGtXsiipFClLhmxdmWDmii0=;
        b=S+9jP7KvtjrrBogw6socEW5bSvjIWZSDZ7tElQZrK+OUHPNgHQS5Zr24PB0SzVxbWi
         8krX5WGTzI3N72weQz28P4oC4oMEwjC1CNLhyEBWWhiT57VQ58yvdg6fN6W/jf3Gl00o
         7FX+aIidxbqXa1KF0Bim9aSYgOm3tZg2tKngk1ApxifyTVsGniiOV/Z9HLof0pUyB1wk
         yT+7tPapAcGnhOag8WQQXkRe3MFSlk+SbWHBhB03u34Osj5byVpGBEmZmIKjuFml4sA9
         CscIvVjDy2hSkv8DD/+Ch0RgaYATCWEu7jddR6rxqzEM8RLmrhO0AcoS8Eb3j8dqkM7w
         SkQw==
X-Forwarded-Encrypted: i=1; AJvYcCVBs+xHuJ0w1NIEuOeugce2fBaZqjz5MFgizaRkIH5I1n7OaBOzpfPijy8Gaah7wq2wU/U/alfY8v+pNkw=@lists.infradead.org, AJvYcCVJpXzf4vkQ5HsCe5z1H9xRDTrPfSWQsy0cck7NxnBD0NrYKUiknb+cbN3wxz8ZCfdDG2vGqx9APhcjSc/k97Kl@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3IzgBWy927zGuzpzHIAC8kNenuBLnzMnYBB0UP/94KYOhCQeg
	owJTFogj2THdFIek5fCQiEX6IfQymvmp/3j9HH/gt7MGpx873QJ9
X-Gm-Gg: ASbGncuStMPFpnBVt8tO04HcuVNb5aIj6dyA+4PxYGOWEeusnauc4PTms4ljFX8VCNt
	d4oXST4HEaZf89p3+is2vZS2QNdVlUxpIdDdj8Yhwk/gq9HCPj6Lmh53QFTtZJDb3qbXyZFcdMx
	Ho5hCD8dV4U5cyP8o81BTzsbMtgePHB7LcMMe639+HAWVZ0eAYpcr8Qr8sWTFbNde2/iXkkSZaE
	PNN5Fl1fZxY0RW0Orvu/rqGNhoBwLZgZg64D8FsqQlGSicd3cr5waK8xb/sOrCA09Syn7QdXwZ1
	ip/ig3GZjjiBP4F1hDFRPdJgS84kPzc=
X-Google-Smtp-Source: AGHT+IFysR9EXVj8qAfuBiPky9qxf+cg8EqLe8Kd8ETuM6oFy6cIZ+w4UdkVArLA8+ej6cCexdZqiA==
X-Received: by 2002:a17:902:ce8b:b0:216:4883:fb43 with SMTP id d9443c01a7336-220bbc8f747mr173264085ad.32.1739525430357;
        Fri, 14 Feb 2025 01:30:30 -0800 (PST)
Received: from Barrys-MBP.hub ([118.92.30.135])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-220d545c814sm25440515ad.148.2025.02.14.01.30.24
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Fri, 14 Feb 2025 01:30:29 -0800 (PST)
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
Subject: [PATCH v4 0/4] mm: batched unmap lazyfree large folios during reclamation
Date: Fri, 14 Feb 2025 22:30:11 +1300
Message-Id: <20250214093015.51024-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250214_013031_738430_08F76755 
X-CRM114-Status: GOOD (  12.05  )
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

Commit 735ecdfaf4e8 ("mm/vmscan: avoid split lazyfree THP during
shrink_folio_list()") prevents the splitting of MADV_FREE'd THP in
madvise.c. 
However, those folios are still added to the deferred_split list in 
try_to_unmap_one() because we are unmapping PTEs and removing rmap
entries one by one.

Firstly, this has rendered the following counter somewhat confusing, 
/sys/kernel/mm/transparent_hugepage/hugepages-size/stats/split_deferred
The split_deferred counter was originally designed to track operations 
such as partial unmap or madvise of large folios. However, in practice, 
most split_deferred cases arise from memory reclamation of aligned 
lazyfree mTHPs as observed by Tangquan. This discrepancy has made
the split_deferred counter highly misleading.

Secondly, this approach is slow because it requires iterating through 
each PTE and removing the rmap one by one for a large folio. In fact, 
all PTEs of a pte-mapped large folio should be unmapped at once, and
the entire folio should be removed from the rmap as a whole.

Thirdly, it also increases the risk of a race condition where lazyfree
folios are incorrectly set back to swapbacked, as a speculative folio_get
may occur in the shrinker's callback.
deferred_split_scan() might call folio_try_get(folio) since we have
added the folio to split_deferred list while removing rmap for the
1st subpage, and while we are scanning the 2nd to nr_pages PTEs of
this folio in try_to_unmap_one(), the entire mTHP could be
transitioned back to swap-backed because the reference count is
incremented, which can make "ref_count == 1 + map_count" within
try_to_unmap_one() false.

   /*
    * The only page refs must be one from isolation
    * plus the rmap(s) (dropped by discard:).
    */
   if (ref_count == 1 + map_count &&
       (!folio_test_dirty(folio) ||
        ...
        (vma->vm_flags & VM_DROPPABLE))) {
           dec_mm_counter(mm, MM_ANONPAGES);
           goto discard;
   }

This patchset resolves the issue by marking only genuinely dirty folios 
as swap-backed, as suggested by David, and transitioning to batched 
unmapping of entire folios in try_to_unmap_one(). Consequently, the 
deferred_split count drops to zero, and memory reclamation performance 
improves significantly — reclaiming 64KiB lazyfree large folios is now 
2.5x faster(The specific data is embedded in the changelog of patch
3/4).

By the way, while the patchset is primarily aimed at PTE-mapped large 
folios, Baolin and Lance also found that try_to_unmap_one() handles 
lazyfree redirtied PMD-mapped large folios inefficiently — it splits 
the PMD into PTEs and iterates over them. This patchset removes the 
unnecessary splitting, enabling us to skip redirtied PMD-mapped large 
folios 3.5X faster during memory reclamation. (The specific data can 
be found in the changelog of patch 4/4).

-v4:
 * collect reviewed-by of Kefeng, Baolin, Lance, thanks!
 * rebase on top of David's "mm: fixes for device-exclusive entries
(hmm)" patchset v2:
 https://lore.kernel.org/all/20250210193801.781278-1-david@redhat.com/

-v3:
https://lore.kernel.org/all/20250115033808.40641-1-21cnbao@gmail.com/ 

 * collect reviewed-by and acked-by of Baolin, David, Lance and Will.
   thanks!
 * refine pmd-mapped THP lazyfree code per Baolin and Lance.
 * refine tlbbatch deferred flushing range support code per David.

-v2:
 https://lore.kernel.org/linux-mm/20250113033901.68951-1-21cnbao@gmail.com/

 * describle backgrounds, problems more clearly in cover-letter per
   Lorenzo Stoakes;
 * also handle redirtied pmd-mapped large folios per Baolin and Lance;
 * handle some corner cases such as HWPOSION, pte_unused;
 * riscv and x86 build issues.

-v1:
 https://lore.kernel.org/linux-mm/20250106031711.82855-1-21cnbao@gmail.com/

Barry Song (4):
  mm: Set folio swapbacked iff folios are dirty in try_to_unmap_one
  mm: Support tlbbatch flush for a range of PTEs
  mm: Support batched unmap for lazyfree large folios during reclamation
  mm: Avoid splitting pmd for lazyfree pmd-mapped THP in try_to_unmap

 arch/arm64/include/asm/tlbflush.h |  23 +++--
 arch/arm64/mm/contpte.c           |   2 +-
 arch/riscv/include/asm/tlbflush.h |   3 +-
 arch/riscv/mm/tlbflush.c          |   3 +-
 arch/x86/include/asm/tlbflush.h   |   3 +-
 mm/huge_memory.c                  |  24 ++++--
 mm/rmap.c                         | 136 ++++++++++++++++++------------
 7 files changed, 115 insertions(+), 79 deletions(-)

-- 
2.39.3 (Apple Git-146)


