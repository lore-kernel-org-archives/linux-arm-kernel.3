Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 34E55D3EE66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 22 Jan 2026 14:43:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=C6eCzkj1176VlHCYcYnZQ6VEts1T0yp1oiCUKCwQDMg=; b=1Nv+LXoCs9b+N6NPuIuyrUFq+T
	J2xmS8zl1+bWZ1/bxU41oibQqAZvQ/b0pSIT6M1CVVf+z4L6eEz6qw0spAOlxGmcr8g02L1Nkcvpa
	w1DKVXmnkSJVVpamMVQ8bzTaesgr67Cvbt4b9pQrDrTUEV1iDyutCZCJMctlQXm3wyEGQj/h7YZ2Q
	xHVggcEBsbMnnM4KTvv++Fb4Jzk/XtAe8lF0xocN2SDXiUCWswT0ujHfHHSP/dUnShZuCdklUgDqW
	cC/uOV+4+wsDdVngEFQlt57eEUORikRijK5SMIGwt35EBdai8YRyoxdw1HBvSynyJBCS0Gfr8fThH
	PkvQvvlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivuJ-00000007Fzy-0mAA;
	Thu, 22 Jan 2026 14:43:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vivuC-00000007FzR-1N41
	for linux-arm-kernel@lists.infradead.org;
	Thu, 22 Jan 2026 14:43:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F2CE91476;
	Thu, 22 Jan 2026 06:43:19 -0800 (PST)
Received: from [10.57.80.101] (unknown [10.57.80.101])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DC2AD3F694;
	Thu, 22 Jan 2026 06:43:24 -0800 (PST)
Message-ID: <b3122ea6-7bbc-4c07-b329-3355bbb16db9@arm.com>
Date: Thu, 22 Jan 2026 14:43:23 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [v5 PATCH] arm64: mm: show direct mapping use in /proc/meminfo
Content-Language: en-GB
To: Yang Shi <yang@os.amperecomputing.com>, Will Deacon <will@kernel.org>
Cc: catalin.marinas@arm.com, cl@gentwo.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260107002944.2940963-1-yang@os.amperecomputing.com>
 <aWZYXhrT6D2M-7-N@willie-the-truck>
 <bdd7bd07-dbed-432e-ae87-dc6381c05ddd@arm.com>
 <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <70b37582-fd26-4d23-a6d6-9a98e3f2eecf@os.amperecomputing.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260122_064328_445495_3304D069 
X-CRM114-Status: GOOD (  58.62  )
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

On 21/01/2026 22:44, Yang Shi wrote:
> 
> 
> On 1/21/26 9:23 AM, Ryan Roberts wrote:
>> On 13/01/2026 14:36, Will Deacon wrote:
>>> On Tue, Jan 06, 2026 at 04:29:44PM -0800, Yang Shi wrote:
>>>> Since commit a166563e7ec3 ("arm64: mm: support large block mapping when
>>>> rodata=full"), the direct mapping may be split on some machines instead
>>>> keeping static since boot. It makes more sense to show the direct mapping
>>>> use in /proc/meminfo than before.
>>>> This patch will make /proc/meminfo show the direct mapping use like the
>>>> below (4K base page size):
>>>> DirectMap4K:       94792 kB
>>>> DirectMap64K:      134208 kB
>>>> DirectMap2M:     1173504 kB
>>>> DirectMap32M:     5636096 kB
>>>> DirectMap1G:    529530880 kB
>>>>
>>>> Although just the machines which support BBML2_NOABORT can split the
>>>> direct mapping, show it on all machines regardless of BBML2_NOABORT so
>>>> that the users have consistent view in order to avoid confusion.
>>>>
>>>> Although ptdump also can tell the direct map use, but it needs to dump
>>>> the whole kernel page table. It is costly and overkilling. It is also
>>>> in debugfs which may not be enabled by all distros. So showing direct
>>>> map use in /proc/meminfo seems more convenient and has less overhead.
>>>>
>>>> Signed-off-by: Yang Shi <yang@os.amperecomputing.com>
>>>> ---
>>>> v5: * Rebased to v6.19-rc4
>>>>      * Fixed the build error for !CONFIG_PROC_FS
>>>> v4: * Used PAGE_END instead of _PAGE_END(VA_BITS_MIN) per Ryan
>>>>      * Used shorter name for the helpers and variables per Ryan
>>>>      * Fixed accounting for memory hotunplug
>>>> v3: * Fixed the over-accounting problems per Ryan
>>>>      * Introduced helpers for add/sub direct map use and #ifdef them with
>>>>        CONFIG_PROC_FS per Ryan
>>>>      * v3 is a fix patch on top of v2
>>>> v2: * Counted in size instead of the number of entries per Ryan
>>>>      * Removed shift array per Ryan
>>>>      * Use lower case "k" per Ryan
>>>>      * Fixed a couple of build warnings reported by kernel test robot
>>>>      * Fixed a couple of poential miscounts
>>>>
>>>>   arch/arm64/mm/mmu.c | 202 +++++++++++++++++++++++++++++++++++++++-----
>>>>   1 file changed, 181 insertions(+), 21 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
>>>> index 8e1d80a7033e..422441c9a992 100644
>>>> --- a/arch/arm64/mm/mmu.c
>>>> +++ b/arch/arm64/mm/mmu.c
>>>> @@ -29,6 +29,7 @@
>>>>   #include <linux/mm_inline.h>
>>>>   #include <linux/pagewalk.h>
>>>>   #include <linux/stop_machine.h>
>>>> +#include <linux/proc_fs.h>
>>>>     #include <asm/barrier.h>
>>>>   #include <asm/cputype.h>
>>>> @@ -171,6 +172,85 @@ static void init_clear_pgtable(void *table)
>>>>       dsb(ishst);
>>>>   }
>>>>   +enum dm_type {
>>>> +    PTE,
>>>> +    CONT_PTE,
>>>> +    PMD,
>>>> +    CONT_PMD,
>>>> +    PUD,
>>>> +    NR_DM_TYPE,
>>>> +};
>>>> +
>>>> +#ifdef CONFIG_PROC_FS
>>>> +static unsigned long dm_meminfo[NR_DM_TYPE];
>>>> +
>>>> +void arch_report_meminfo(struct seq_file *m)
>>>> +{
>>>> +    char *size[NR_DM_TYPE];
>>> const?
>>>
>>>> +
>>>> +#if defined(CONFIG_ARM64_4K_PAGES)
>>>> +    size[PTE] = "4k";
>>>> +    size[CONT_PTE] = "64k";
>>>> +    size[PMD] = "2M";
>>>> +    size[CONT_PMD] = "32M";
>>>> +    size[PUD] = "1G";
>>>> +#elif defined(CONFIG_ARM64_16K_PAGES)
>>>> +    size[PTE] = "16k";
>>>> +    size[CONT_PTE] = "2M";
>>>> +    size[PMD] = "32M";
>>>> +    size[CONT_PMD] = "1G";
>>>> +#elif defined(CONFIG_ARM64_64K_PAGES)
>>>> +    size[PTE] = "64k";
>>>> +    size[CONT_PTE] = "2M";
>>>> +    size[PMD] = "512M";
>>>> +    size[CONT_PMD] = "16G";
>>>> +#endif
>>>> +
>>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>> +            size[PTE], dm_meminfo[PTE] >> 10);
>>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>> +            size[CONT_PTE],
>>>> +            dm_meminfo[CONT_PTE] >> 10);
>>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>> +            size[PMD], dm_meminfo[PMD] >> 10);
>>>> +    seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>> +            size[CONT_PMD],
>>>> +            dm_meminfo[CONT_PMD] >> 10);
>>>> +    if (pud_sect_supported())
>>>> +        seq_printf(m, "DirectMap%s:    %8lu kB\n",
>>>> +            size[PUD], dm_meminfo[PUD] >> 10);
>>> This seems a bit brittle to me. If somebody adds support for l1 block
>>> mappings for !4k pages in future, they will forget to update this and
>>> we'll end up returning kernel stack in /proc/meminfo afaict.
>>>
>>>> +static inline bool is_dm_addr(unsigned long addr)
>>>> +{
>>>> +    return (addr >= PAGE_OFFSET) && (addr < PAGE_END);
>>>> +}
>>>> +
>>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>>>> +                  enum dm_type type)
>>>> +{
>>>> +    if (is_dm_addr(addr))
>>>> +        dm_meminfo[type] += size;
>>>> +}
>>>> +
>>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>>>> +                  enum dm_type type)
>>>> +{
>>>> +    if (is_dm_addr(addr))
>>>> +        dm_meminfo[type] -= size;
>>>> +}
>>>> +#else
>>>> +static inline void dm_meminfo_add(unsigned long addr, unsigned long size,
>>>> +                  enum dm_type type)
>>>> +{
>>>> +}
>>>> +
>>>> +static inline void dm_meminfo_sub(unsigned long addr, unsigned long size,
>>>> +                  enum dm_type type)
>>>> +{
>>>> +}
>>>> +#endif
>>>> +
>>>>   static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>>>>                phys_addr_t phys, pgprot_t prot)
>>>>   {
>>>> @@ -236,6 +316,11 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned
>>>> long addr,
>>>>             init_pte(ptep, addr, next, phys, __prot);
>>>>   +        if (pgprot_val(__prot) & PTE_CONT)
>>>> +            dm_meminfo_add(addr, (next - addr), CONT_PTE);
>>>> +        else
>>>> +            dm_meminfo_add(addr, (next - addr), PTE);
>>>> +
>>>>           ptep += pte_index(next) - pte_index(addr);
>>>>           phys += next - addr;
>>>>       } while (addr = next, addr != end);
>>>> @@ -266,6 +351,17 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr,
>>>> unsigned long end,
>>>>               (flags & NO_BLOCK_MAPPINGS) == 0) {
>>>>               pmd_set_huge(pmdp, phys, prot);
>>>>   +            /*
>>>> +             * It is possible to have mappings allow cont mapping
>>>> +             * but disallow block mapping. For example,
>>>> +             * map_entry_trampoline().
>>>> +             * So we have to increase CONT_PMD and PMD size here
>>>> +             * to avoid double counting.
>>>> +             */
>>>> +            if (pgprot_val(prot) & PTE_CONT)
>>>> +                dm_meminfo_add(addr, (next - addr), CONT_PMD);
>>>> +            else
>>>> +                dm_meminfo_add(addr, (next - addr), PMD);
>>> I don't understand the comment you're adding here. If somebody passes
>>> NO_BLOCK_MAPPINGS then that also prevents contiguous entries except at
>>> level 3.
>>>
>>> It also doesn't look you handle the error case properly when the mapping
>>> fails.
>>>
>>>> -static void unmap_hotplug_pte_range(pmd_t *pmdp, unsigned long addr,
>>>> +static void unmap_hotplug_pte_range(pte_t *ptep, unsigned long addr,
>>>>                       unsigned long end, bool free_mapped,
>>>>                       struct vmem_altmap *altmap)
>>>>   {
>>>> -    pte_t *ptep, pte;
>>>> +    pte_t pte;
>>>>         do {
>>>> -        ptep = pte_offset_kernel(pmdp, addr);
>>>>           pte = __ptep_get(ptep);
>>>>           if (pte_none(pte))
>>>>               continue;
>>>>             WARN_ON(!pte_present(pte));
>>>>           __pte_clear(&init_mm, addr, ptep);
>>>> +        dm_meminfo_sub(addr, PAGE_SIZE, PTE);
>>>>           flush_tlb_kernel_range(addr, addr + PAGE_SIZE);
>>>>           if (free_mapped)
>>>>               free_hotplug_page_range(pte_page(pte),
>>>>                           PAGE_SIZE, altmap);
>>> Is the existing code correct for contiguous entries here? I'd have
>>> thought that we'd need to make the range non-contiguous before knocking
>>> out the TLB.
>> The Arm ARM has this, which makes me think you are probably correct:
>>
>> IVNXYF:
>> The architecture does not require descriptors with the Contiguous bit set to 1
>> to be cached as a single TLB entry for the contiguous region. To avoid TLB
>> coherency issues, software is required to perform TLB maintenance on the entire
>> address region that results from using the Contiguous bit.
>>
>> I've asked for clarification internally. But I think we should hoist out the tlb
>> flush regardless because it will be faster if we just invalidate a single range.
>> I can handle that as a separate patch if you like.
> 
> Thanks, Ryan.

Of course it's not quite as simple as hoisting for the vmemmap unmapping case
since that is also freeing the memory, so we need to issue the tlbi before freeing.

vmemmap never uses contiguous mappings so could continue with the current
strategy for that and only hoist the tlbi-range for the unmapping the linear map
case.

Or could do a 2 phase approach for vmemmap where we first set VALID=0 for all
entries, then flush tlb, then walk again, to free clear the pte and free the
pointed to page.

Other ideas welcome... I'll have a play.

> 
>>
>>
>> However, I think there may be another problem; IIUC, any old range of memory can
>> be hot-unplugged as long as it is section aligned. It doesn't have to be the
>> same range that was previously hot-plugged. But if the linear map is block
>> mapped, the range being unplugged may cover a partial block mapping.
>>
>> For example, with 4K pages, the section size is 128M, so you could hot unmap
>> 128M from a PUD leaf mapping (1G). What am I missing that means this doesn't go
>> bang?
>>
>> This would have been an issue for the non-rodata-full config so predates the
>> work to split the linear map dynamically. I'm not really sure how to solve this
>> for systems without BBML2 but without non--rodata-full.
>>
>> I must be misunderstanding something crucial here... I'll dig some more.
> 
> I'm not expert on memory hotplug. I'm not 100% confident my understanding is
> correct. But I noticed something that I misunderstood before, when I was testing
> the patch.
> 
> The hotunplug actually has two stages: offline and unplug (physically remove the
> device).
> 
> When we echo offline to the sysfs file, it actually just does offline. The
> offline just isolates the memory from buddy, but it does *NOT* unmap the memory
> from the linear mapping. The linear mapping will be unmapped at unplug stage. I
> tested the patch with QEMU, I just can emulate hotplug/hotunplug the whole dimm,
> for example, hotplug 1G, then hotunplug the same 1G. I can't emulate hotunplug
> in the smaller size. I thought it may be the limitation of QEMU in the first
> place. But I realized we can't hotunplug a part of dimm physically either,
> right? For example, we insert 1G dimm to the board, we can't take out 128M from
> the dimm physically. So IIUC the partial unmap of linear mapping should never
> happen.

Looking at the code, it looks to me like memory_hotplug.c doesn't care and will
try to unplug any span of memory that it is asked to, as long as start and end
are aligned to memory_block_size_bytes() (which for arm64 is section size = 128M
for 4K base pages).

But it looks like all the higher level users will only ever unplug in the same
granularity that was plugged in (I might be wrong but that's the sense I get).

arm64 adds the constraint that it won't unplug any memory that was present at
boot - see prevent_bootmem_remove_notifier().

So in practice this is probably safe, though perhaps brittle.

Some options:

 - leave it as is and worry about it if/when something shifts and hits the
   problem.

 - Enhance prevent_bootmem_remove_notifier() to reject unplugging memory blocks
   whose boundaries are within leaf mappings.

 - For non-bbml2_noabort systems, map hotplug memory with a new flag to ensure
   that leaf mappings are always <= memory_block_size_bytes(). For
   bbml2_noabort, split at the block boundaries before doing the unmapping.

Given I don't think this can happen in practice, probably the middle option is
the best? There is no runtime impact and it will give us a warning if it ever
does happen in future.

What do you think?

Thanks,
Ryan

> 
> If I read the code correctly, the code does unmap the linear mapping on memory
> block granularity. The block linear mapping is unmapped when removing the first
> block if it covers multiple memory blocks. Then the page table will be none when
> removing the later blocks, but it is ok, the code just continue.
> 
> Thanks,
> Yang
> 
>>
>> Thanks,
>> Ryan
>>
>>
>>
>>> Will
> 


