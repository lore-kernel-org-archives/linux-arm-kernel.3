Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1D383EC1451
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 13:54:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+jYjup8nFi8SWoxHxSscrmbSDma+UNQ0zsPOj1Qu5o8=; b=ZBZOKykgKyJ/5I4N3GcPKE5oTp
	HzYStp+D/ojIAJiqVTulVthTU97MKz+nz4IKdEWPVHV+IntD7y8uS/7F5M6BpRCZ/JzgjQGcHz8lC
	/jPY35PaPQZwioO2CYflFI2uQk42jf2WkxdPTbbCJmc6EFJRK1+ei9r7zYvt6XtQp6FRehDKCE7LI
	bOfygna/01CAjtKa9HZIhe1TDq3XtaA4zbSLsPKCemXt3HBKqvxCQk5Vz5cW9I8FXQhVj/tULBJB4
	8IZDftNd59TIwTW7/6KWEwyuMdoPkEtt/yA7/pvYYhKP/djfAuYKkojsC/u0m0PvoYIiZb0P7tlbI
	W8XVcjHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQCv-0000000FGfT-1RuK;
	Tue, 03 Mar 2026 13:54:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxQCs-0000000FGex-2uKO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 13:54:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 64DBD497;
	Tue,  3 Mar 2026 05:54:30 -0800 (PST)
Received: from [10.1.31.220] (XHFQ2J9959.cambridge.arm.com [10.1.31.220])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 467DB3F73B;
	Tue,  3 Mar 2026 05:54:35 -0800 (PST)
Message-ID: <28c7506f-a57e-4c59-b3ef-4596d8e1b11e@arm.com>
Date: Tue, 3 Mar 2026 13:54:33 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 11/13] arm64: mm: More flags for __flush_tlb_range()
Content-Language: en-GB
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: Will Deacon <will@kernel.org>, Ard Biesheuvel <ardb@kernel.org>,
 Catalin Marinas <catalin.marinas@arm.com>,
 Mark Rutland <mark.rutland@arm.com>,
 Linus Torvalds <torvalds@linux-foundation.org>,
 Oliver Upton <oliver.upton@linux.dev>, Marc Zyngier <maz@kernel.org>,
 Dev Jain <dev.jain@arm.com>, Linu Cherian <Linu.Cherian@arm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260302135602.3716920-1-ryan.roberts@arm.com>
 <20260302135602.3716920-12-ryan.roberts@arm.com>
 <20260303095718.00001320@huawei.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260303095718.00001320@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_055438_817642_A3B6C89B 
X-CRM114-Status: GOOD (  28.25  )
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

On 03/03/2026 09:57, Jonathan Cameron wrote:
> On Mon, 2 Mar 2026 13:55:58 +0000
> Ryan Roberts <ryan.roberts@arm.com> wrote:
> 
>> Refactor function variants with "_nosync", "_local" and "_nonotify" into
>> a single __always_inline implementation that takes flags and rely on
>> constant folding to select the parts that are actually needed at any
>> given callsite, based on the provided flags.
>>
>> Flags all live in the tlbf_t (TLB flags) type; TLBF_NONE (0) continues
>> to provide the strongest semantics (i.e. evict from walk cache,
>> broadcast, synchronise and notify). Each flag reduces the strength in
>> some way; TLBF_NONOTIFY, TLBF_NOSYNC and TLBF_NOBROADCAST are added to
>> complement the existing TLBF_NOWALKCACHE.
>>
>> There are no users that require TLBF_NOBROADCAST without
>> TLBF_NOWALKCACHE so implement that as BUILD_BUG() to avoid needing to
>> introduce dead code for vae1 invalidations.
>>
>> The result is a clearer, simpler, more powerful API.
> Hi Ryan,
> 
> There is one subtle change to rounding that should be called out at least.

Thanks for the review. I'm confident that there isn't actually a change to the
rounding here, but the responsibility has moved to the caller. See below...

> 
> Might even be worth pulling it to a precursor patch where you can add an
> explanation of why original code was rounding to a larger value than was
> ever needed.
> 
> Jonathan
> 
> 
>>
>> Signed-off-by: Ryan Roberts <ryan.roberts@arm.com>
> 
> 
>>  static inline void __flush_tlb_range(struct vm_area_struct *vma,
>> @@ -586,24 +615,9 @@ static inline void __flush_tlb_range(struct vm_area_struct *vma,
>>  				     unsigned long stride, int tlb_level,
>>  				     tlbf_t flags)
>>  {
>> -	__flush_tlb_range_nosync(vma->vm_mm, start, end, stride,
>> -				 tlb_level, flags);
>> -	__tlbi_sync_s1ish();
>> -}
>> -
>> -static inline void local_flush_tlb_contpte(struct vm_area_struct *vma,
>> -					   unsigned long addr)
>> -{
>> -	unsigned long asid;
>> -
>> -	addr = round_down(addr, CONT_PTE_SIZE);
> See below.
>> -
>> -	dsb(nshst);
>> -	asid = ASID(vma->vm_mm);
>> -	__flush_s1_tlb_range_op(vale1, addr, CONT_PTES, PAGE_SIZE, asid, 3);
>> -	mmu_notifier_arch_invalidate_secondary_tlbs(vma->vm_mm, addr,
>> -						    addr + CONT_PTE_SIZE);
>> -	dsb(nsh);
>> +	start = round_down(start, stride);
> See below.
>> +	end = round_up(end, stride);
>> +	__do_flush_tlb_range(vma, start, end, stride, tlb_level, flags);
>>  }
> 
>>  
>>  static inline bool __pte_flags_need_flush(ptdesc_t oldval, ptdesc_t newval)
>> diff --git a/arch/arm64/mm/contpte.c b/arch/arm64/mm/contpte.c
>> index 681f22fac52a1..3f1a3e86353de 100644
>> --- a/arch/arm64/mm/contpte.c
>> +++ b/arch/arm64/mm/contpte.c
> ...
> 
>> @@ -641,7 +641,10 @@ int contpte_ptep_set_access_flags(struct vm_area_struct *vma,
>>  			__ptep_set_access_flags(vma, addr, ptep, entry, 0);
>>  
>>  		if (dirty)
>> -			local_flush_tlb_contpte(vma, start_addr);
>> +			__flush_tlb_range(vma, start_addr,
>> +					  start_addr + CONT_PTE_SIZE,
>> +					  PAGE_SIZE, 3,
> 
> This results in a different stride to round down. 
> local_flush_tlb_contpte() did
> addr = round_down(addr, CONT_PTE_SIZE);
> 
> With this call we have
> start = round_down(start, stride); where stride is PAGE_SIZE.
> 
> I'm too lazy to figure out if that matters.

contpte_ptep_set_access_flags() is operating on a contpte block of ptes, and as
such, start_addr has already been rounded down to the start of the block, which
is always bigger than (and perfectly divisible by) PAGE_SIZE.

Previously, local_flush_tlb_contpte() allowed passing any VA in within the
contpte block and the function would automatically round it down to the start of
the block and invalidate the full block.

After the change, we are explicitly passing the already aligned block;
start_addr is already guaranteed to be at the start of the block and "start_addr
+ CONT_PTE_SIZE" is the end.

So in both cases, the rounding down that is done by local_flush_tlb_contpte() /
__flush_tlb_range() doesn't actually change the value.

Thanks,
Ryan


> 
> 
>> +					  TLBF_NOWALKCACHE | TLBF_NOBROADCAST);
>>  	} else {
>>  		__contpte_try_unfold(vma->vm_mm, addr, ptep, orig_pte);
>>  		__ptep_set_access_flags(vma, addr, ptep, entry, dirty);
> 


