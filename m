Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32CD9CA6C9D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 08:57:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=G3OUQJWPgzI3B/WRHq+6BeFX8XUKCcwK9UJMVAqa6do=; b=r5bUjpgdAGvqw36/BeUqeSUF14
	rHLH0ApU//ZRbfDYCW1GRzjUjbIIckx2OM04nWfWlsA1DkIE2pwc6YDP8dSs+LjunV2tuUycoV0ZB
	FBQBgHx4myHvHOwQzaFoyzVdjY60mbh7Gwh0ga7Fc8BxN/ofvj/gYd+qQJi5BOWgS7Sxkk276GMVd
	ywxLHZ8By8+DWPRDdn7oufXEehNvoV6ktEIIuEVle0iPB6nbeEVvLJeLiAlB8HDTGkQFGhlijkWGZ
	TUDzrwPBf7jbHMzs+I3U+1U8I2Mc0fdml0SH6dJk2C6Umkh6RJF17uzT5NSnXQWDTi7bd1TW5wUUj
	NTmFd0/A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vketC-0000000Dt5h-2VLi;
	Tue, 27 Jan 2026 08:57:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vket9-0000000Dt4k-3MF7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 08:57:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64DD5339;
	Tue, 27 Jan 2026 00:57:22 -0800 (PST)
Received: from [10.57.94.246] (unknown [10.57.94.246])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C9CBF3F632;
	Tue, 27 Jan 2026 00:57:27 -0800 (PST)
Message-ID: <67570fb2-bde3-43e8-8661-ab62444b2626@arm.com>
Date: Tue, 27 Jan 2026 08:57:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, Will Deacon <will@kernel.org>,
 Anshuman Khandual <anshuman.khandual@arm.com>
Cc: catalin.marinas@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
 <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
 <b3122ea6-7bbc-4c07-b329-3355bbb16db9@arm.com>
 <a0aeed19-02d2-4d74-b82a-f906dc41e240@os.amperecomputing.com>
 <aXd2rud1E0Gff8-2@willie-the-truck>
 <04f816f9-5533-4fe1-99b0-cd405caac485@os.amperecomputing.com>
 <aXe5WHBdHLEnh-Bp@willie-the-truck>
 <f0214a9b-74bc-4ef5-95db-670802ceca4a@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <f0214a9b-74bc-4ef5-95db-670802ceca4a@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_005731_934832_6ED22799 
X-CRM114-Status: GOOD (  38.36  )
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

On 26/01/2026 20:50, Yang Shi wrote:
> 
> 
> On 1/26/26 10:58 AM, Will Deacon wrote:
>> On Mon, Jan 26, 2026 at 09:55:06AM -0800, Yang Shi wrote:
>>>
>>> On 1/26/26 6:14 AM, Will Deacon wrote:
>>>> On Thu, Jan 22, 2026 at 01:59:54PM -0800, Yang Shi wrote:
>>>>> On 1/22/26 6:43 AM, Ryan Roberts wrote:
>>>>>> On 21/01/2026 22:44, Yang Shi wrote:
>>>>>>> On 1/21/26 9:23 AM, Ryan Roberts wrote:
>>>>>> But it looks like all the higher level users will only ever unplug in the
>>>>>> same
>>>>>> granularity that was plugged in (I might be wrong but that's the sense I
>>>>>> get).
>>>>>>
>>>>>> arm64 adds the constraint that it won't unplug any memory that was present at
>>>>>> boot - see prevent_bootmem_remove_notifier().
>>>>>>
>>>>>> So in practice this is probably safe, though perhaps brittle.
>>>>>>
>>>>>> Some options:
>>>>>>
>>>>>>     - leave it as is and worry about it if/when something shifts and hits the
>>>>>>       problem.
>>>>> Seems like the most simple way :-)
>>>>>
>>>>>>     - Enhance prevent_bootmem_remove_notifier() to reject unplugging
>>>>>> memory blocks
>>>>>>       whose boundaries are within leaf mappings.
>>>>> I don't quite get why we should enhance prevent_bootmem_remove_notifier().
>>>>> If I read the code correctly, it just simply reject offline boot memory.
>>>>> Offlining a single memory block is fine. If you check the boundaries there,
>>>>> will it prevent from offlining a single memory block?
>>>>>
>>>>> I think you need enhance try_remove_memory(). But kernel may unmap linear
>>>>> mapping by memory blocks if altmap is used. So you should need an extra page
>>>>> table walk with the start and the size of unplugged dimm before removing the
>>>>> memory to tell whether the boundaries are within leaf mappings or not IIUC.
>>>>> Can it be done in arch_remove_memory()? It seems not because
>>>>> arch_remove_memory() may be called on memory block granularity if altmap is
>>>>> used.
>>>>>
>>>>>>     - For non-bbml2_noabort systems, map hotplug memory with a new flag to
>>>>>> ensure
>>>>>>       that leaf mappings are always <= memory_block_size_bytes(). For
>>>>>>       bbml2_noabort, split at the block boundaries before doing the
>>>>>> unmapping.
>>>>> The linear mapping will be at most 128M (4K page size), it sounds sub
>>>>> optimal IMHO.
>>>>>
>>>>>> Given I don't think this can happen in practice, probably the middle
>>>>>> option is
>>>>>> the best? There is no runtime impact and it will give us a warning if it ever
>>>>>> does happen in future.
>>>>>>
>>>>>> What do you think?
>>>>> I agree it can't happen in practice, so why not just take option #1 given
>>>>> the complexity added by option #2?
>>>> It still looks broken in the case that a region that was mapped with the
>>>> contiguous bit is then unmapped. The sequence seems to iterate over
>>>> each contiguous PTE, zapping the entry and doing the TLBI while the
>>>> other entries in the contiguous range remain intact. I don't think
>>>> that's sufficient to guarantee that you don't have stale TLB entries
>>>> once you've finished processing the whole range.
>>>>
>>>> For example, imagine you have an L1 TLB that only supports 4k entries
>>>> and an L2 TLB that supports 64k entries. Let's say that the contiguous
>>>> range is mapped by pte0 ... pte15 and we've zapped and invalidated
>>>> pte0 ... pte14. At that point, I think the hardware is permitted to use
>>>> the last remaining contiguous pte (pte15) to allocate a 64k entry in the
>>>> L2 TLB covering the whole range. A (speculative) walk via one of the
>>>> virtual addresses translated by pte0 ... pte14 could then hit that entry
>>>> and fill a 4k entry into the L1 TLB. So at the end of the sequence, you
>>>> could presumably still access the first 60k of the range thanks to stale
>>>> entries in the L1 TLB?
>>> It is a little bit hard for me to understand how come a (speculative) walk
>>> could happen when we reach here.
>>>
>>> Before we reach here, IIUC kernel has:
>>>
>>>   * offlined all the page blocks. It means they are freed and isolated from
>>> buddy allocator, even pfn walk (for example, compaction) should not reach
>>> them at all.
>>>   * vmemmap has been eliminated. So no struct page available.
>>>
>>>  From kernel point of view, they are nonreachable now. Did I miss and/or
>>> misunderstand something?
>> I'm talking about hardware speculation. It's mapped as normal memory so
>> the CPU can speculate from it. We can't really reason about the bounds
>> of that, especially in a world with branch predictors and history-based
>> prefetchers.
> 
> OK. If it could happen, I think the suggestions from you and Ryan should work IIUC:
> 
> Clear all the entries in the cont range, then invalidate TLB for the whole range.
> 
> I can come up with a patch or Ryan would like to take it?

Hi,

There are 2 separate issues that have been raised here and I think we are
conflating them a bit...


1: The contiguous range teardown + tlbi issue that Will raised. That is
definitely a problem and needs to be fixed. (though I think prior to the BBML2
dynamic linear block mapping support it would be rare in practice; probably it
would only affect cont-pmd mappings for 16K and 64K base page configs. With
BBML2 dynamic linear block mapping support, this can happen for contiguous
mappings at all levels with all base page sizes).

I roughed out a patch to hoist out the tlbis and issue as a single range after
clearing all the pgtable entries. I think this will be MUCH faster and will
solve the contiguous issue too. The one catch is that this only works for linear
map and the same helpers are used for the vmemmap. For the latter we also free
the memory, so the tlbis need to happen before the freeing. But vmemmap doesn't
use contiguous mappings so I've added a warning checking that and use a
different scheme based on whether we are freeing or not.

Anshuman has kindly agreed to knock the patch into shape and do the testing.
Hopefully he can post shortly.


2: hot-unplugging a range that starts or terminates in the middle of a large
leaf mapping. The low level hot-unplug implementation allows unplugging any
range of memory as long as it is section size aligned (128M). So theoretically
you could have a 1G PUD leaf mapping and try to unplug 128M from the middle of
it. In practice this doesn't happen because all the users of the hot-unplug code
group memory into devices. If you add a range, you can only remove that same
range. When adding, we will guarrantee that the leaf mappings exactly map the
range, so the same guarrantee can be given for hot-remove.

BUT, that feels fragile to me. I'd like to add a check in
prevent_bootmem_remove_notifier() to ensure that the proposed unplug range is
exactly covered by leaf mappings, and if it isn't, warn and reject. This will
allow us to fail safe for a tiny amount of overhead (which will be made up for
many, many times over by hoisting the tlbis batching the barriers in 1.).

Anshuman has also kindly agreed to put a patch together for that.


Thanks,
Ryan


> 
> Thanks,
> Yang
> 
>>
>> Will
> 


