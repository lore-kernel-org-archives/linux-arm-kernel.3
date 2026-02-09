Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 91876E78D6A
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 09:09:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2wXLPrF3c7P97b6gTT96e+3ioNg8zNrz2OKrVFmg5jY=; b=g2DKsvFGvSyVBdZJsY+DQ5AWJ/
	oRB4QZJDW4L+GvC1KCfOzpyqzAcXMAuzPh6BfPetOIanMclm84KmPXFI13jnSa+8dM4DuBn/o25aY
	iMVSEIJhSrA5Cm3BejhljVOcypuJNTGEku0zvbY9y51OrWnBM4VB46pOc6f06i8+fN8xectoPCniG
	LV9acSZgtMIP0Cc1rSmO8RyQgkXpRGk+xv8lTd4ZKr2hLG24KXE2mYm90cEP6fItfzca6RmGvOh2T
	/qA0f2vxWa89lmt/C5lVr+zOyuPGMShsuoLe+0USTSer2jWTk704/Mz9fRK67j2mN95Pi0+V0TxDd
	s+ZZepWg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNH5-0000000F61H-0Sxw;
	Mon, 09 Feb 2026 09:09:43 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpNH4-0000000F60W-209K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 09:09:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A0DC60008;
	Mon,  9 Feb 2026 09:09:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D26BBC116C6;
	Mon,  9 Feb 2026 09:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770628181;
	bh=5nuDSACBfO1w4dYNx+WaobWzgCQZBOlLbjl0OCUaDVg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=QpaCy0kzVd4IM6z6DErGLY+U81uSuhZNpp97Oy6ER3Mhj0ry4O2rjFJv4YuLDpuJW
	 SLje45zN8tKMCDqQpfecKeqg1BpGsCusv4+O+BgEf1/ZgKfh0Sbu1pA4/5eBbL/N/8
	 l+QkmCo8KGkZ+s1VlQ15q4HgVxNY+e58LuFLkZX3HweDwVrXiKDN45FNAiospV98w+
	 oxVzVIskWVUi5Jk16M5x6/YBWOo+HykdpgVafv/ot6GwFHaoSfKJGmc1Bt9wUFDaXI
	 N0pT3nwBvcZDxqNy7E2Ue2yL8p5RdeEd3NfAQ2+kA0D+VJ2tZ+70xb9d5TBoQ/YQkN
	 rGiHwyo/HpxUg==
Message-ID: <07d55759-a50a-457a-badd-85697174116f@kernel.org>
Date: Mon, 9 Feb 2026 10:09:32 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 4/5] arm64: mm: implement the architecture-specific
 clear_flush_young_ptes()
To: Baolin Wang <baolin.wang@linux.alibaba.com>, Chris Mason <clm@meta.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, will@kernel.org,
 lorenzo.stoakes@oracle.com, ryan.roberts@arm.com, Liam.Howlett@oracle.com,
 vbabka@suse.cz, rppt@kernel.org, surenb@google.com, mhocko@suse.com,
 riel@surriel.com, harry.yoo@oracle.com, jannh@google.com,
 willy@infradead.org, baohua@kernel.org, dev.jain@arm.com,
 linux-mm@kvack.org, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
References: <cover.1766631066.git.baolin.wang@linux.alibaba.com>
 <9d866a2644051e13a41ef4d6ca3909c6e1f9e229.1766631066.git.baolin.wang@linux.alibaba.com>
 <20260128114936.72280-1-clm@meta.com>
 <de141225-a0c1-41fd-b3e1-bcab09827ddd@linux.alibaba.com>
From: "David Hildenbrand (Arm)" <david@kernel.org>
Content-Language: en-US
Autocrypt: addr=david@kernel.org; keydata=
 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
 qIws/H2t
In-Reply-To: <de141225-a0c1-41fd-b3e1-bcab09827ddd@linux.alibaba.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
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

On 1/29/26 02:42, Baolin Wang wrote:
> 
> 
> On 1/28/26 7:47 PM, Chris Mason wrote:
>> Baolin Wang <baolin.wang@linux.alibaba.com> wrote:
>>> Implement the Arm64 architecture-specific clear_flush_young_ptes() to 
>>> enable
>>> batched checking of young flags and TLB flushing, improving 
>>> performance during
>>> large folio reclamation.
>>>
>>> Performance testing:
>>> Allocate 10G clean file-backed folios by mmap() in a memory cgroup, 
>>> and try to
>>> reclaim 8G file-backed folios via the memory.reclaim interface. I can 
>>> observe
>>> 33% performance improvement on my Arm64 32-core server (and 10%+ 
>>> improvement
>>> on my X86 machine). Meanwhile, the hotspot folio_check_references() 
>>> dropped
>>> from approximately 35% to around 5%.
>>
>> Hi everyone, I ran mm-new through my AI review prompts and this one was
>> flagged.  AI review below:
>>
>>> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/ 
>>> asm/pgtable.h
>>> --- a/arch/arm64/include/asm/pgtable.h
>>> +++ b/arch/arm64/include/asm/pgtable.h
>>> @@ -1838,6 +1838,17 @@ static inline int 
>>> ptep_clear_flush_young(struct vm_area_struct *vma,
>>>       return contpte_clear_flush_young_ptes(vma, addr, ptep, 1);
>>>   }
>>>
>>> +#define clear_flush_young_ptes clear_flush_young_ptes
>>> +static inline int clear_flush_young_ptes(struct vm_area_struct *vma,
>>> +                     unsigned long addr, pte_t *ptep,
>>> +                     unsigned int nr)
>>> +{
>>> +    if (likely(nr == 1 && !pte_cont(__ptep_get(ptep))))
>>> +        return __ptep_clear_flush_young(vma, addr, ptep);
>>
>> Should this be checking !pte_valid_cont() instead of !pte_cont()?
>>
>> The existing ptep_clear_flush_young() above uses !pte_valid_cont() to
>> determine when to take the fast path. The new function only checks
>> !pte_cont(), which differs when handling non-present PTEs.
>>
>> Non-present PTEs (device-private, device-exclusive) can reach
>> clear_flush_young_ptes() through folio_referenced_one()->
>> clear_flush_young_ptes_notify(). These entries may have bit 52 set as
>> part of their encoding, but they aren't valid contiguous mappings.
>>
>> With the current check, wouldn't such entries incorrectly trigger the
>> contpte path and potentially cause contpte_clear_flush_young_ptes() to
>> process additional unrelated PTEs beyond the intended single entry?
> 
> Indeed. I previously discussed with Ryan whether using pte_cont() was 
> enough, and we believed that invalid PTEs wouldn’t have the PTE_CONT bit 
> set. But we clearly missed the device-folio cases. Thanks for reporting.
> 
> Andrew, could you please squash the following fix into this patch? If 
> you prefer a new version, please let me know. Thanks.

Isn't the real problem that we should never ever ever ever, try clearing 
the young bit on a non-present pte?

See damon_ptep_mkold() how that is handled with the flushing/notify.

There needs to be a pte_present() check in the caller.


BUT

I recall that folio_referenced() should never apply to ZONE_DEVICE 
folios. folio_referenced() is only called from memory reclaim code, and 
ZONE_DEVICE pages never get reclaimed through vmscan.c

-- 
Cheers,

David

