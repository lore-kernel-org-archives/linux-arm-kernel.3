Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D4D7D606A31F
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 Oct 2026 14:08:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=0mfTkRS1;
	dkim=pass (2048-bit key, unprotected) header.d=bytedance.com header.i=@bytedance.com header.a=rsa-sha256 header.s=google header.b=BrbI1pek
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:
	List-Unsubscribe-Post:List-Owner;
	bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=; b=0mfTkRS1sSWFBqA/sBPjt3wyjC
	tuZ/S4iddo40Q5YgpsQjX0cYYLECdmf/rs+IQTUZfjLSTMSs9f6HIfbdpq7KEtT3dtWmTGcE1Ws4e
	T1YJ/ykel66R87NzCU99aOEyiq9reCgtyIwM7OhuUSDZzVVDRkdbvJzqCSqcXamsRU9/eCW9g+1KK
	YRbuRLzX3BXXZ6FENrgKOfOxtpbnQow3AH7WPv8bolvty44R9H+47rcQ8AsVf4obZiAC6nj8qVHk1
	uEcbzdAAvsRpB0IJd+KxfPZekxNqdMpOSyY1ckgViVuEfYh9Tun/aYoASEiPFobNefWVejVMXFqPj
	IzG9WMWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHX-0000000BpTc-2JU0;
	Fri, 30 Oct 2026 14:08:35 +0000
Received: from mail-pl1-x631.google.com ([2607:f8b0:4864:20::631])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xMnHV-0000000BpSU-0Wi0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 Oct 2026 14:08:34 +0000
Received: by mail-pl1-x631.google.com with SMTP id d9443c01a7336-2e60f9af6e6so7116555ad.3
        for <linux-arm-kernel@lists.infradead.org>; Fri, 30 Oct 2026 07:08:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=bytedance.com; s=google; t=1793369307; x=1793974107; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
        b=BrbI1pekzAKQ+q8CKC6tmVz81e6h1QG4jp3z7fvmC7WysHXzd1UgAVpEENxNr6nqn9
         f7cY3UksuAizHhT/naaHAoWUA9BuR4QNIYBULNIdifsjGABx8tPjgJ34XsDraXFnEcn+
         osCAlBzR6tzY33vFEsAR2k63EbTFP2E4BWo5dwCKlf4bRCKRuAk0jzawhduKcLXM9uFF
         TYrRDNlBBMAGvMfoGYqqom2LKm0xmBa0uh/qV208mHCNY8aNPXQt4Yfi0kY/J984nmnu
         6sDjsDa5RMJ/ikfHrIq4/UlbN8tvGDj395rt/P2OcQ5v4mDQyp/Q6WJIf9/+DW/b9oNI
         uT0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793369307; x=1793974107;
        h=content-transfer-encoding:mime-version:message-id:date:subject:cc
         :to:from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=OGrdsvz70oET1GgEqFqkefkFXtM+kYm4wLwbKsNMt9o=;
        b=BhcErSRGn7zwt/WXwLejebzFSMz5qeXbZpRmYfp1nDNDfHdwnUC4d4wfnMCP/FItJW
         xVdehT3Mi4yRirxJc4wY1o7zI7my2ERgTwZNh1IgNM502DJw2zeF5rFuhyDUw7FXOJ5t
         EW5/yMeNXLDkT4rw2Jfkpqozr2OPkvu8ZbMlXaX9Ie6pUmZEmS4mXWF3udvpqTxQjWPd
         fUSFHDCUZi26iSjOViEBIZDIwo8wOCk3s8mXVFPYpe/U9OHrXmaqqmDB4uqcKMe/gecE
         9sDKo2Cmp+ZyuXkNu3IKVe15zCIXZoyo0AMxnO7JOnIexHdvcK6+UWvGCU9IVRSDS5G6
         UpgA==
X-Forwarded-Encrypted: i=1; AKwUvBxQOOtkZRqZV0IgDZwIqx+N6upn6RAT0GQvQlHfG/3T6wYN2Ea1cMY5zTJq8DA6WAL1/fZkrRPr9t7LG8WQpk97@lists.infradead.org
X-Gm-Message-State: AFq9FYI7nx4h/ILK5e47yuqDBwqs0lQeXvhX9/N6fOnsMemxbF6L1Zht
	59tGUhnQBCXMYMilaTVUXqjIuPGSD0XkpVC4ZRU5FnqqnV3EeyjZvShkBo+PrPMgwQ0=
X-Gm-Gg: AYBFou1+PBfBm8bvFzlWDs3dLr4bYT292Wxt+FjzMmQ9YLtUKeBc8Gu+Q/kGl/hbJ8q
	klemYuj47sQmLpz6iRhgxVJvg8FNUYc0/v7tnXdJ1FLio+bWIpztpNYhbH7g38I2dwrZgabmCJA
	3sp/U0iqALEFJHkOwvd0kb7+zYu/g4eoP+rd2cIGkf7ZBGordCCF8sGLUwuScvkFVlW2VjqTEjR
	d4z3pcHCvutLsnKH+h6rzXpq1PnkrqKLe/JLYHzES6s9if3SSCMdFcVzNKXbxHTtu6Pie8QShzj
	yaMOTanq3mxwrJMNRHbB8JwKk59PLfEysN1htMyqCCEuGoiJNcncklxs1OQV68AlCwtSXdWdSvY
	diSWl7bIc0SRjqu1Br3knYj1uSIZSkiBCfXR44sS+cmh8WUwCjyc9KfTJhVZNlalY5N71gJnQrB
	GW8japTgl6G3DS/iyWOXrOSVAOHapfbVTB4X2zlmcBXaUF+jpOgym7ELRuiLWOWftMDA4i3Hc/Y
	QuQWRCtt4WORH5cik8Txdm4PRXPNlS4gdnah+mlskw8iU2n6wiKMpS3FjoQZILaenQ0OWdWb9bR
	sU/lzKMzawnmDjxaRU6AkNgpHIPb6sVxpd+c6IjQOjrJIXTezwg=
X-Received: by 2002:a17:903:24b:b0:2e3:1bb4:610d with SMTP id d9443c01a7336-2eb364f6800mr27744295ad.50.1793369307550;
        Fri, 30 Oct 2026 07:08:27 -0700 (PDT)
Received: from n232-176-004.byted.org ([36.110.163.100])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2eb3929b27bsm7601795ad.62.2026.10.30.07.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 30 Oct 2026 07:08:26 -0700 (PDT)
From: Muchun Song <songmuchun@bytedance.com>
To: David Hildenbrand <david@kernel.org>,
	Madhavan Srinivasan <maddy@linux.ibm.com>,
	Mike Rapoport <rppt@kernel.org>,
	Andrew Morton <akpm@linux-foundation.org>
Cc: Lance Yang <lance.yang@linux.dev>,
	Michael Ellerman <mpe@ellerman.id.au>,
	Nicholas Piggin <npiggin@gmail.com>,
	Christophe Leroy <chleroy@kernel.org>,
	Ritesh Harjani <ritesh.list@gmail.com>,
	Shrikanth Hegde <sshegde@linux.ibm.com>,
	Oscar Salvador <osalvador@suse.de>,
	Qi Zheng <qi.zheng@linux.dev>,
	Muchun Song <muchun.song@linux.dev>,
	linux-mm@kvack.org,
	linuxppc-dev@lists.ozlabs.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org,
	x86@kernel.org,
	loongarch@lists.linux.dev,
	linux-s390@vger.kernel.org,
	Muchun Song <songmuchun@bytedance.com>
Subject: [PATCH 0/4] mm: Simplify device DAX vmemmap optimization plumbing
Date: Fri, 30 Oct 2026 22:07:16 +0800
Message-ID: <20261030140720.1256062-1-songmuchun@bytedance.com>
X-Mailer: git-send-email 2.54.0
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261030_070833_160111_658AA5F4 
X-CRM114-Status: GOOD (  10.71  )
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
X-Spam-Status: No, score=-13.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS,USER_AGENT_GIT autolearn=unavailable
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

Hi,

This series is split out from the earlier, larger series "mm: Generalize
HVO for HugeTLB and device DAX" [1]. While the parent series generalizes
vmemmap optimization across HugeTLB and device DAX, this subset addresses
a single, self-contained step: simplifying the device DAX vmemmap
optimization plumbing.

After device DAX was converted to section-based vmemmap optimization,
whether a mapping can be optimized is carried in mem_section, and the
architecture-specific population path can handle any remaining fallback.
The code still retains the DAX-specific vmemmap_can_optimize() helper, a
PowerPC override, and @pgmap arguments threaded through lower-level
vmemmap population and memory-removal interfaces. These duplicate the
section-order policy and keep otherwise generic paths coupled to
dev_pagemap.

This series removes that obsolete plumbing by consolidating the
optimization policy around memory-section metadata and simplifying the
generic and architecture-specific population paths. This also eliminates
dependencies that are no longer needed once the optimization state is
carried by the memory section.

This leaves the section compound order as the single source of truth for
vmemmap optimization and decouples the generic sparse-vmemmap and
memory-hotplug paths from device DAX.

This is another smaller step toward the broader HVO generalization.

[1] https://lore.kernel.org/20260513130542.35604-1-songmuchun@bytedance.com/

Muchun Song (4):
  powerpc/mm: make vmemmap_populate_compound_pages() static
  powerpc/mm: drop powerpc vmemmap_can_optimize()
  mm/sparse-vmemmap: drop vmemmap_can_optimize()
  mm/sparse-vmemmap: drop @pgmap from vmemmap population APIs

 arch/arm64/mm/mmu.c                        |  5 ++-
 arch/loongarch/mm/init.c                   |  5 ++-
 arch/powerpc/include/asm/book3s/64/radix.h | 12 -------
 arch/powerpc/mm/book3s64/radix_pgtable.c   | 23 ++++---------
 arch/powerpc/mm/init_64.c                  |  1 +
 arch/powerpc/mm/mem.c                      |  5 ++-
 arch/riscv/mm/init.c                       |  5 ++-
 arch/s390/mm/init.c                        |  5 ++-
 arch/x86/mm/init_64.c                      |  5 ++-
 include/linux/memory_hotplug.h             |  8 ++---
 include/linux/mm.h                         | 40 +---------------------
 mm/memory_hotplug.c                        | 16 ++++-----
 mm/memremap.c                              |  4 +--
 mm/sparse-vmemmap.c                        | 34 ++++++++++--------
 mm/sparse.c                                |  6 ++--
 15 files changed, 54 insertions(+), 120 deletions(-)


base-commit: 5e6c45aaaf93343c7f8a1cde9797080238af5c1b
-- 
2.54.0


