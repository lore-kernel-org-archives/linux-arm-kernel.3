Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4B28FC590F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 08:45:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pFphdTndLHNJ6dEDlxcwFAibSwaeAzadK9od6j6FYeg=; b=PWe9tD4jawifn9DTxJkRG+euh7
	BOx/1vTrWB1q3dSm9t3PRD6TgxQ8WgwvH5BV7p64euoIpP2LF2Q95ar/7fLnkAr2ztZCx1vR4TO62
	7cMUQS01gV9XnEqVK07QqAkTmlAgE3cX6VfYzwoFdJL/WL/446WLbBjArwrg7ZIIQ2HuA1svKT71w
	tVttCyElRb4VykXphGxuJXZeau5eDw7+vH3Df5lMhnl2XsX4JOM9dEs/xpxt5kjVff4fDt8UCHqTL
	DTswQVbuZm4FE5I6BT3A62yP0i/xBOWKZLnYq3ICDgTC9h69as7YLGoS0+rwHoqfcvM8ioaJvxtAg
	PqhnTd9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWzw-00000005gmX-0186;
	Thu, 26 Feb 2026 08:45:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvWzt-00000005gls-2c0l
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 08:45:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7A6C51516;
	Thu, 26 Feb 2026 00:45:15 -0800 (PST)
Received: from [10.164.19.28] (unknown [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 00D4F3F7BD;
	Thu, 26 Feb 2026 00:45:15 -0800 (PST)
Message-ID: <e1858dc5-6526-4aac-8392-f4f2e19da1bc@arm.com>
Date: Thu, 26 Feb 2026 14:15:13 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [LSF/MM/BPF TOPIC] Per-process page size
To: Kalesh Singh <kaleshsingh@google.com>
Cc: lsf-pc@lists.linux-foundation.org, ryan.roberts@arm.com,
 catalin.marinas@arm.com, will@kernel.org, ardb@kernel.org,
 willy@infradead.org, hughd@google.com, baolin.wang@linux.alibaba.com,
 akpm@linux-foundation.org, david@kernel.org, lorenzo.stoakes@oracle.com,
 Liam.Howlett@oracle.com, vbabka@suse.cz, rppt@kernel.org, surenb@google.com,
 mhocko@suse.com, linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, =?UTF-8?Q?Mateusz_Ma=C4=87kowski?=
 <mmac@google.com>, =?UTF-8?Q?Adrian_Barna=C5=9B?= <abarnas@google.com>,
 Marcin Szymczyk <marcinszymczyk@google.com>
References: <20260217145026.3880286-1-dev.jain@arm.com>
 <CAC_TJvfD19E--wyeVyTmp-LP9ffoLQaUHruZARbdes2EnKgptQ@mail.gmail.com>
From: Dev Jain <dev.jain@arm.com>
Content-Language: en-US
In-Reply-To: <CAC_TJvfD19E--wyeVyTmp-LP9ffoLQaUHruZARbdes2EnKgptQ@mail.gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_004525_749085_4E89E7BA 
X-CRM114-Status: GOOD (  43.89  )
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



On 26/02/26 1:10 pm, Kalesh Singh wrote:
> On Tue, Feb 17, 2026 at 6:50 AM Dev Jain <dev.jain@arm.com> wrote:
>>
>> Hi everyone,
>>
>> We propose per-process page size on arm64. Although the proposal is for
>> arm64, perhaps the concept can be extended to other arches, thus the
>> generic topic name.
>>
>> -------------
>> INTRODUCTION
>> -------------
>> While mTHP has brought the performance of many workloads running on an arm64 4K
>> kernel closer to that of the performance on an arm64 64K kernel, a performance
>> gap still remains. This is attributed to a combination of greater number of
>> pgtable levels, less reach within the walk cache and higher data cache footprint
>> for pgtable memory. At the same time, 64K is not suitable for general
>> purpose environments due to it's significantly higher memory footprint.
>>
>> To solve this, we have been experimenting with a concept called "per-process
>> page size". This breaks the historic assumption of a single page size for the
>> entire system: a process will now operate on a page size ABI that is greater
>> than or equal to the kernel's page size. This is enabled by a key architectural
>> feature on Arm: the separation of user and kernel page tables.
>>
>> This can also lead to a future of a single kernel image instead of 4K, 16K
>> and 64K images.
>>
>> --------------
>> CURRENT DESIGN
>> --------------
>> The design is based on one core idea; most of the kernel continues to believe
>> there is only one page size in use across the whole system. That page size is
>> the size selected at compile-time, as is done today. But every process (more
>> accurately mm_struct) has a page size ABI which is one of the 3 page sizes
>> (4K, 16K or 64K) as long as that page size is greater than or equal to the
>> kernel page size (kernel page size is the macro PAGE_SIZE).
>>
>> Pagesize selection
>> ------------------
>> A process' selected page size ABI comes into force at execve() time and
>> remains fixed until the process exits or until the next execve(). Any forked
>> processes inherit the page size of their parent.
>> The personality() mechanism already exists for similar cases, so we propose
>> to extend it to enable specifying the required page size.
>>
>> There are 3 layers to the design. The first two are not arch-dependent,
>> and makes Linux support a per-process pagesize ABI. The last layer is
>> arch-specific.
>>
>> 1. ABI adapter
>> --------------
>> A translation layer is added at the syscall boundary to convert between the
>> process page size and the kernel page size. This effectively means enforcing
>> alignment requirements for addresses passed to syscalls and ensuring that
>> quantities passed as “number of pages” are interpreted relative to the process
>> page size and not the kernel page size. In this way the process has the illusion
>> that it is working in units of its page size, but the kernel is working in
>> units of the kernel page size.
>>
>> 2. Generic Linux MM enlightenment
>> ---------------------------------
>> We enlighten the Linux MM code to always hand out memory in the granularity
>> of process pages. Most of this work is greatly simplified because of the
>> existing mTHP allocation paths, and the ongoing support for large folios
>> across different areas of the kernel. The process order will be used as the
>> hard minimum mTHP order to allocate.
>>
>> File memory
>> -----------
>> For a growing list of compliant file systems, large folios can already be
>> stored in the page cache. There is even a mechanism, introduced to support
>> filesystems with block sizes larger than the system page size, to set a
>> hard-minimum size for folios on a per-address-space basis. This mechanism
>> will be reused and extended to service the per-process page size requirements.
>>
>> One key reason that the 64K kernel currently consumes considerably more memory
>> than the 4K kernel is that Linux systems often have lots of small
>> configuration files which each require a page in the page cache. But these
>> small files are (likely) only used by certain processes. So, we prefer to
>> continue to cache those using a 4K page.
>> Therefore, if a process with a larger page size maps a file whose pagecache
>> contains smaller folios, we drop them and re-read the range with a folio
>> order at least that of the process order.
>>
>> 3. Translation from Linux pagetable to native pagetable
>> -------------------------------------------------------
>> Assume the case of a kernel pagesize of 4K and app pagesize of 64K.
>> Now that enlightenment is done, it is guaranteed that every single mapping
>> in the 4K pagetable (which we call the Linux pagetable) is of granularity
>> at least 64K. In the arm64 MM code, we maintain a "native" pagetable per
>> mm_struct, which is based off a 64K geometry. Because of the guarantee
>> aforementioned, any pagetable operation on the Linux pagetable
>> (set_ptes, clear_flush_ptes, modify_prot_start_ptes, etc) is going to happen
>> at a granularity of at least 16 PTEs - therefore we can translate this
>> operation to modify a single PTE entry in the native pagetable.
>> Given that enlightenment may miss corner cases, we insert a warning in the
>> architecture code - on being presented with an operation not translatable
>> into a native operation, we fallback to the Linux pagetable, thus losing
>> the benefits borne out of the pagetable geometry but keeping
>> the emulation intact.
>>
>> -----------------------
>> What we want to discuss
>> -----------------------
>>  - Are there other arches which could benefit from this?
>>  - What level of compatibility we can achieve - is it even possible to
>>    contain userspace within the emulated ABI?
>>  - Rough edges of compatibility layer - pfnmaps, ksm, procfs, etc. For
>>    example, what happens when a 64K process opens a procfs file of
>>    a 4K process?
>>  - native pgtable implementation - perhaps inspiration can be taken
>>    from other arches with an involved pgtable logic (ppc, s390)?
>>
> 
> Hi Dev, Ryan,
> 
> I'd be very interested in joining this discussion at LSF/MM.

Thanks Kalesh for your interest!

> 
> On Android, we have a separate but very related use case: we emulate a
> larger userspace page size on x86, primarily to allow app developers
> to test their apps for 16KB compatibility using x86 emulators [1].
> 
> Similar to your proposed "ABI adapter" layer, our approach works by
> enforcing a larger 16KB granularity and alignment on the VMAs to
> emulate the userspace page size, while the underlying kernel still
> operates on a 4KB granularity [2].
> 
> In our emulation experience, we've run into a few specific rough edges:
> 
> 1. mmap and SIGBUS: Enforcing a larger VMA granularity means that
> mapping files can easily extend the VMA beyond the end of the file's
> valid offset. When userspace touches this padded area, the 4KB filemap
> fault cannot resolve to a valid index, resulting in a SIGBUS that
> applications aren't expecting.

You did mention in the other email the links below, and I went ahead
to compare :) I was puzzled to see some sort of VMA padding approach
in your patches. OTOH our approach pads anonymous pages. So for example,
if a 64K process maps a 12K sized file, we will map 52K/4K = 13 anonymous
pages into the 64K-aligned VMA.

Implementation-wise, we detect such a condition in filemap_fault
and return VM_FAULT_NEED_ANONPAGE, and redirect that to do_anonymous_page
to map 4K pages.

> 
> 2. userfaultfd: This inherently operates at the strict PTE granularity
> of the underlying kernel (4KB). Hiding this from a userspace that
> expects a 16KB/64KB fault granularity while the kernel still operates
> on 4KB granularity is messy ...

Indeed. We will have to fault in 16 4K pages.

> 
> 3. pagemap and PFN interfaces: As you noted with procfs, interfaces
> that expose or consume PFNs are problematic. Userspace tools reading
> /proc/pid/pagemap, /proc/kpagecount, /proc/kpageflags,
> /proc/kpagecgroup, and /sys/kernel/mm/page_idle/bitmap calculate
> offsets based on the userspace page size ABI, but the kernel returns
> 4KB PFNs which breaks such users.
> 
> 
> It would be great to explore if we can align on a unified approach to
> solve these.
> 
> [1] https://developer.android.com/guide/practices/page-sizes#16kb-emulator
> [2] https://source.android.com/docs/core/architecture/16kb-page-size/getting-started-cf-x86-64-pgagnostic
> 
> Thanks,
> Kalesh
> 
>> -------------
>> Key Attendees
>> -------------
>>  - Ryan Roberts (co-presenter)
>>  - mm folks (David Hildenbrand, Matthew Wilcox, Liam Howlett, Lorenzo Stoakes,
>>              and many others)
>>  - arch folks
>>


