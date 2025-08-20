Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C0878CA0EFF
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 20 Aug 2025 20:49:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M28Gme2cYTbw9Uxdc5Tf1T7+KmnA+5ymqjm+7PgofnY=; b=TeAKjHPSa6+q/cUCswBhkWN/w6
	7zNgK0Nq9BFBUNzOvJTIQOPa40ASI7awzXjyIVYkVsWTwBo4VlTOVP5Q0qhRZtcU+1RLFGjsZMIvr
	5/xekUpriSU5g8zu2ASVbZoC4XJI9CGZAfgWLz+ZEmD7oi0Da57Qsss4AlaJ7+eY/COcXSvsbCVzy
	FUDEmziXFPBnbWU57erMAVxyH4ciiSgs+jWjf5vQ0vJLALxwROojSixf83GE31TJQQfSmCMFubCNt
	K+MRMzKcJcFh35GsUQrGklQYCyPkyZqH+1hqJmyH2wqimY+Duj/4dUWPercfgd/YnmN5wtYGaVAlW
	i7f6UKGw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uopkT-0000000Eruz-4146;
	Wed, 20 Aug 2025 20:49:33 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uol8Z-0000000EJVt-034H
	for linux-arm-kernel@lists.infradead.org;
	Wed, 20 Aug 2025 15:54:08 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3412D1D31;
	Wed, 20 Aug 2025 08:53:56 -0700 (PDT)
Received: from [10.57.90.209] (unknown [10.57.90.209])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 2F5FE3F63F;
	Wed, 20 Aug 2025 08:53:57 -0700 (PDT)
Message-ID: <4a828975-d412-4a4b-975e-4702572315da@arm.com>
Date: Wed, 20 Aug 2025 17:53:55 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH v5 00/18] pkeys-based page table hardening
To: linux-hardening@vger.kernel.org,
 Rick Edgecombe <rick.p.edgecombe@intel.com>
Cc: linux-kernel@vger.kernel.org, Andrew Morton <akpm@linux-foundation.org>,
 Andy Lutomirski <luto@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Dave Hansen <dave.hansen@linux.intel.com>,
 David Hildenbrand <david@redhat.com>, Ira Weiny <ira.weiny@intel.com>,
 Jann Horn <jannh@google.com>, Jeff Xu <jeffxu@chromium.org>,
 Joey Gouly <joey.gouly@arm.com>, Kees Cook <kees@kernel.org>,
 Linus Walleij <linus.walleij@linaro.org>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>, Marc Zyngier <maz@kernel.org>,
 Mark Brown <broonie@kernel.org>, Matthew Wilcox <willy@infradead.org>,
 Maxwell Bland <mbland@motorola.com>, "Mike Rapoport (IBM)"
 <rppt@kernel.org>, Peter Zijlstra <peterz@infradead.org>,
 Pierre Langlois <pierre.langlois@arm.com>,
 Quentin Perret <qperret@google.com>, Ryan Roberts <ryan.roberts@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Vlastimil Babka <vbabka@suse.cz>,
 Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
 linux-mm@kvack.org, x86@kernel.org
References: <20250815085512.2182322-1-kevin.brodsky@arm.com>
Content-Language: en-GB
From: Kevin Brodsky <kevin.brodsky@arm.com>
In-Reply-To: <20250815085512.2182322-1-kevin.brodsky@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250820_085407_136534_B3C31420 
X-CRM114-Status: GOOD (  31.21  )
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

On 15/08/2025 10:54, Kevin Brodsky wrote:
> [...]
>
> Performance
> ===========
>
> No arm64 hardware currently implements POE. To estimate the performance
> impact of kpkeys_hardened_pgtables, a mock implementation of kpkeys has
> been used, replacing accesses to the POR_EL1 register with accesses to
> another system register that is otherwise unused (CONTEXTIDR_EL1), and
> leaving everything else unchanged. Most of the kpkeys overhead is
> expected to originate from the barrier (ISB) that is required after
> writing to POR_EL1, and from setting the POIndex (pkey) in page tables;
> both of these are done exactly in the same way in the mock
> implementation.

It turns out this wasn't the case regarding the pkey setting - because
patch 6 gates set_memory_pkey() on system_supports_poe() and not
arch_kpkeys_enabled(), the mock implementation turned set_memory_pkey()
into a no-op. Many thanks to Rick Edgecombe for highlighting that the
overheads were suspiciously low for some benchmarks!

> The original implementation of kpkeys_hardened_pgtables is very
> inefficient when many PTEs are changed at once, as the kpkeys level is
> switched twice for every PTE (two ISBs per PTE). Patch 18 introduces
> an optimisation that makes use of the lazy_mmu mode to batch those
> switches: 1. switch to KPKEYS_LVL_PGTABLES on arch_enter_lazy_mmu_mode(),
> 2. skip any kpkeys switch while in that section, and 3. restore the
> kpkeys level on arch_leave_lazy_mmu_mode(). When that last function
> already issues an ISB (when updating kernel page tables), we get a
> further optimisation as we can skip the ISB when restoring the kpkeys
> level.
>
> Both implementations (without and with batching) were evaluated on an
> Amazon EC2 M7g instance (Graviton3), using a variety of benchmarks that
> involve heavy page table manipulations. The results shown below are
> relative to the baseline for this series, which is 6.17-rc1. The
> branches used for all three sets of results (baseline, with/without
> batching) are available in a repository, see next section.
>
> Caveat: these numbers should be seen as a lower bound for the overhead
> of a real POE-based protection. The hardware checks added by POE are
> however not expected to incur significant extra overhead.
>
> Reading example: for the fix_size_alloc_test benchmark, using 1 page per
> iteration (no hugepage), kpkeys_hardened_pgtables incurs 17.35% overhead
> without batching, and 14.62% overhead with batching. Both results are
> considered statistically significant (95% confidence interval),
> indicated by "(R)".
>
> +-------------------+----------------------------------+------------------+---------------+
> | Benchmark         | Result Class                     | Without batching | With batching |
> +===================+==================================+==================+===============+
> | mmtests/kernbench | real time                        |            0.30% |         0.11% |
> |                   | system time                      |        (R) 3.97% |     (R) 2.17% |
> |                   | user time                        |            0.12% |         0.02% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/fork      | fork: h:0                        |      (R) 217.31% |        -0.97% |
> |                   | fork: h:1                        |      (R) 275.25% |     (R) 2.25% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/munmap    | munmap: h:0                      |       (R) 15.57% |        -1.95% |
> |                   | munmap: h:1                      |      (R) 169.53% |     (R) 6.53% |
> +-------------------+----------------------------------+------------------+---------------+
> | micromm/vmalloc   | fix_size_alloc_test: p:1, h:0    |       (R) 17.35% |    (R) 14.62% |
> |                   | fix_size_alloc_test: p:4, h:0    |       (R) 37.54% |     (R) 9.35% |
> |                   | fix_size_alloc_test: p:16, h:0   |       (R) 66.08% |     (R) 3.15% |
> |                   | fix_size_alloc_test: p:64, h:0   |       (R) 82.94% |        -0.39% |
> |                   | fix_size_alloc_test: p:256, h:0  |       (R) 87.85% |        -1.67% |
> |                   | fix_size_alloc_test: p:16, h:1   |       (R) 50.31% |         3.00% |
> |                   | fix_size_alloc_test: p:64, h:1   |       (R) 59.73% |         2.23% |
> |                   | fix_size_alloc_test: p:256, h:1  |       (R) 62.14% |         1.51% |
> |                   | random_size_alloc_test: p:1, h:0 |       (R) 77.82% |        -0.21% |
> |                   | vm_map_ram_test: p:1, h:0        |       (R) 30.66% |    (R) 27.30% |
> +-------------------+----------------------------------+------------------+---------------+

These numbers therefore correspond to set_memory_pkey() being a no-op,
in other words they represent the overhead of switching the pkey
register only.

I have amended the mock implementation so that set_memory_pkey() is run
as it would on a real POE implementation (i.e. actually setting the PTE
bits). Here are the new results, representing the overhead of both pkey
register switching and setting the pkey of page table pages (PTPs) on
alloc/free:

+-------------------+----------------------------------+------------------+---------------+
| Benchmark         | Result Class                     | Without
batching | With batching |
+===================+==================================+==================+===============+
| mmtests/kernbench | real time                        |           
0.32% |         0.35% |
|                   | system time                      |        (R)
4.18% |     (R) 3.18% |
|                   | user time                        |           
0.08% |         0.20% |
+-------------------+----------------------------------+------------------+---------------+
| micromm/fork      | fork: h:0                        |      (R)
221.39% |     (R) 3.35% |
|                   | fork: h:1                        |      (R)
282.89% |     (R) 6.99% |
+-------------------+----------------------------------+------------------+---------------+
| micromm/munmap    | munmap: h:0                      |       (R)
17.37% |        -0.28% |
|                   | munmap: h:1                      |      (R)
172.61% |     (R) 8.08% |
+-------------------+----------------------------------+------------------+---------------+
| micromm/vmalloc   | fix_size_alloc_test: p:1, h:0    |       (R)
15.54% |    (R) 12.57% |
|                   | fix_size_alloc_test: p:4, h:0    |       (R)
39.18% |     (R) 9.13% |
|                   | fix_size_alloc_test: p:16, h:0   |       (R)
65.81% |         2.97% |
|                   | fix_size_alloc_test: p:64, h:0   |       (R)
83.39% |        -0.49% |
|                   | fix_size_alloc_test: p:256, h:0  |       (R)
87.85% |    (I) -2.04% |
|                   | fix_size_alloc_test: p:16, h:1   |       (R)
51.21% |         3.77% |
|                   | fix_size_alloc_test: p:64, h:1   |       (R)
60.02% |         0.99% |
|                   | fix_size_alloc_test: p:256, h:1  |       (R)
63.82% |         1.16% |
|                   | random_size_alloc_test: p:1, h:0 |       (R)
77.79% |        -0.51% |
|                   | vm_map_ram_test: p:1, h:0        |       (R)
30.67% |    (R) 27.09% |
+-------------------+----------------------------------+------------------+---------------+

Those results are overall very similar to the original ones.
micromm/fork is however clearly impacted - around 4% additional overhead
from set_memory_pkey(); it makes sense considering that forking requires
duplicating (and therefore allocating) a full set of page tables.
kernbench is also a fork-heavy workload and it gets a 1% hit in system
time (with batching).

It seems fair to conclude that, on arm64, setting the pkey whenever a
PTP is allocated/freed is not particularly expensive. The situation may
well be different on x86 as Rick pointed out, and it may also change on
newer arm64 systems as I noted further down. Allocating/freeing PTPs in
bulk should help if setting the pkey in the pgtable ctor/dtor proves too
expensive.

- Kevin

> Benchmarks:
> - mmtests/kernbench: running kernbench (kernel build) [4].
> - micromm/{fork,munmap}: from David Hildenbrand's benchmark suite. A
>   1 GB mapping is created and then fork/unmap is called. The mapping is
>   created using either page-sized (h:0) or hugepage folios (h:1); in all
>   cases the memory is PTE-mapped.
> - micromm/vmalloc: from test_vmalloc.ko, varying the number of pages
>   (p:) and whether huge pages are used (h:).
>
> On a "real-world" and fork-heavy workload like kernbench, the estimated
> overhead of kpkeys_hardened_pgtables is reasonable: 4% system time
> overhead without batching, and about half that figure (2.2%) with
> batching. The real time overhead is negligible.
>
> Microbenchmarks show large overheads without batching, which increase
> with the number of pages being manipulated. Batching drastically reduces
> that overhead, almost negating it for micromm/fork. Because all PTEs in
> the mapping are modified in the same lazy_mmu section, the kpkeys level
> is changed just twice regardless of the mapping size; as a result the
> relative overhead actually decreases as the size increases for
> fix_size_alloc_test.
>
> Note: the performance impact of set_memory_pkey() is likely to be
> relatively low on arm64 because the linear mapping uses PTE-level
> descriptors only. This means that set_memory_pkey() simply changes the
> attributes of some PTE descriptors. However, some systems may be able to
> use higher-level descriptors in the future [5], meaning that
> set_memory_pkey() may have to split mappings. Allocating page tables
> from a contiguous cache of pages could help minimise the overhead, as
> proposed for x86 in [1].
>
> [...]

