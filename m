Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E4D04E7719E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jan 2025 03:40:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=FsECYO8sB292CmYpC3fxwMu7nIovFj7xiGwzKOJEc7U=; b=RW8VruuVVvnxvKpkzpTr+/R7Jz
	R/0cQQtvHG3sZDTk1X559oxAFT3jBJoNtzICjMKEZycLowg34qeaV7ZN5MoGoTOLnwb8/SM5BmT5m
	JiYr3MLWBrOqKW8k72xH9rdheo0NYEulwvDiBYy1XR8pq4qlJayIkcWx54zND0j18rwzz8EbWkeYn
	Vhh+pf9txtAuX68tjvSx9Ykp0Hqm8VTJmpgAOnBcABAEE2MyB6b9AZJTWXjK7NK1oykjCbJc4QPn/
	alQ2RPYvMIEBwQTOLRulNVb5IUnZxvGdfFROJNSF1pAefTNPAfhi4OwXiwBJxmg3HbWQpr0uUa2Qi
	77eaeuSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBJf-00000003vRi-1qqS;
	Mon, 13 Jan 2025 03:40:39 +0000
Received: from mail-pj1-x1029.google.com ([2607:f8b0:4864:20::1029])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tXBIM-00000003v6A-2Z43;
	Mon, 13 Jan 2025 03:39:20 +0000
Received: by mail-pj1-x1029.google.com with SMTP id 98e67ed59e1d1-2ee50ffcf14so7330552a91.0;
        Sun, 12 Jan 2025 19:39:18 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736739558; x=1737344358; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to;
        bh=FsECYO8sB292CmYpC3fxwMu7nIovFj7xiGwzKOJEc7U=;
        b=KcFwuuKjqVPMik/afWzb0jQ8dr+lcGEfJrTHoX34/i+c+4zBUQEpoPYNhUJCZXoQTg
         GJ4dnlfpR7Mxt0jM50fuH5d64QPdcjb20nz5GHSY0TMjv/G/CCMS7ItBW/S26AmeakA3
         HIeSg3gmXNSlSpw97rVEV91SQDwHXI7wDHRVf5fHEIJwiMlPldCgKc4Z5830H4jwC9NR
         UWYDI0YRirZ82u7yLtZPxcoC94ZEDRE16MqEpvXq9UE7FB+Bb9Fu2MbrZI6r74PXq2H1
         vKpPXg98n6/wmuQbNM7bipwNHc2aXhB88/vKp2xR3x3sG3oC1dqOq16OnSDbqXG1BnrE
         fNGw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736739558; x=1737344358;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=FsECYO8sB292CmYpC3fxwMu7nIovFj7xiGwzKOJEc7U=;
        b=u4yIWW0cvCv4Zwa6nJh6emAvuDBUzc77MMkIsIsG4nZtXV6on/y3IvHHzr0zqP7dpu
         TgkiQvqZ1ts9eMDzJ26wqwvlLe43roH/W5jhF7eUKWwVnFd2B4cUMhVqqJButo5OegFi
         x5+gQTYwbsQFfvJo6ga9iFUfZXlkmliOuFT/6yV302eNynZiSog7m8mXEqxHxmeMTH0i
         yvfvXOdBhSnyEr58Uiz3vTeO5ySAyVd4WEZteaMR6zs5431JBj6PXhPUuLEa+F4LwTPg
         TjIPeyU/VSS9AEjLNsOr6/ynubmxpOCh3huAUr7H4vm7h9nCKXBafs8iofYirJKzD9ou
         SwPg==
X-Forwarded-Encrypted: i=1; AJvYcCUPlFToCiow+jmgh/N2K2H2hzEpG3mYEhO3U3+lRBC2edoa+bP2vsR6O2VEOWBe/1dWEFJsz5SFgDK6QY0v5hQ1@lists.infradead.org, AJvYcCVTVUDyE3mrc3wucyXVz15HwSsyy0FOhbfh9LnlJUAbRame1W3+squDlqo1NbNBz5hMJ876Ze/wbZJwTVw=@lists.infradead.org
X-Gm-Message-State: AOJu0Yw3u/iDAWvx7578uRmYYu/c7pur10ethlFjPd1fmgEr0IN7BY0f
	ZLecbR4FBpBBmHJa2JBt2aSgEIdaPyc6OGdiYgTVkwrHHDlC3Sa1FauxHw==
X-Gm-Gg: ASbGncvtnp74KQ3vFNXJbVkWy4L0J0qC38vZ9p9fo46X+dkZCL8jp4K/FZD29cRJk+V
	dwp1i5dR3hpOhGOZIF1hZCiPtVPGBdzEVN+wRIYB8EQIhwhJZjQTygytLk+VRtnuNCAr4tNyvaY
	i3sQLWgP4XYwSjHrISPh+fM0Nq5k/zO78qBZYa7QyVUUoOoe1HMDcgZcv+OPR5mLr0FwI0yRQG1
	HEtEzv59uPRVlPlkPNciluan4tOzQ+pRWEfL92b+GID1HINvsvFZR981FOeZgmhZomuV15Wy1m9
	+R9RzfLl
X-Google-Smtp-Source: AGHT+IHOVUEQIwahsNe0JPIF/xCrkqjPY47Zb3CsoPvALwPFRqBWuqOSOx1Y9Cfq48Gfus/C7iH6nw==
X-Received: by 2002:a17:90b:3848:b0:2f5:63a:44f8 with SMTP id 98e67ed59e1d1-2f55443a0e3mr25854156a91.8.1736739557599;
        Sun, 12 Jan 2025 19:39:17 -0800 (PST)
Received: from Barrys-MBP.hub ([2407:7000:af65:8200:39b5:3f0b:acf3:9158])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-21a9f25aabfsm44368405ad.246.2025.01.12.19.39.11
        (version=TLS1_3 cipher=TLS_CHACHA20_POLY1305_SHA256 bits=256/256);
        Sun, 12 Jan 2025 19:39:17 -0800 (PST)
From: Barry Song <21cnbao@gmail.com>
To: akpm@linux-foundation.org,
	linux-mm@kvack.org
Cc: baolin.wang@linux.alibaba.com,
	chrisl@kernel.org,
	david@redhat.com,
	ioworker0@gmail.com,
	kasong@tencent.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	ryan.roberts@arm.com,
	v-songbaohua@oppo.com,
	x86@kernel.org,
	linux-riscv@lists.infradead.org,
	ying.huang@intel.com,
	zhengtangquan@oppo.com,
	lorenzo.stoakes@oracle.com
Subject: [PATCH v2 0/4] mm: batched unmap lazyfree large folios during reclamation
Date: Mon, 13 Jan 2025 16:38:57 +1300
Message-Id: <20250113033901.68951-1-21cnbao@gmail.com>
X-Mailer: git-send-email 2.39.3 (Apple Git-146)
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250112_193918_654798_ABEC0B43 
X-CRM114-Status: GOOD (  11.96  )
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

-v2:
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

 arch/arm64/include/asm/tlbflush.h |  26 +++----
 arch/arm64/mm/contpte.c           |   2 +-
 arch/riscv/include/asm/tlbflush.h |   3 +-
 arch/riscv/mm/tlbflush.c          |   3 +-
 arch/x86/include/asm/tlbflush.h   |   3 +-
 mm/huge_memory.c                  |  17 ++++-
 mm/rmap.c                         | 112 ++++++++++++++++++++----------
 7 files changed, 111 insertions(+), 55 deletions(-)

-- 
2.39.3 (Apple Git-146)


