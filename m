Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 31771C5B549
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 30 May 2025 10:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CTzSZ9olDTno0mjswXGJwTAaIz9iKLd2D6NNKCY/+BM=; b=zFMPcLgtA31HrXygQjvgWBarB3
	r+7EgcfOjDomI7vf/sxAeT1qV7Xa2u/W2eYOUvf9++Q6bjXAiUKW5On4PpWdpshQzIgs+LPUSUP4n
	6z2i9WrIMf0uLSF1pTxaidzaVTKqva2Rjz+oEoISAgApfvHT6pXhU1KYwZIw8yP0TLJhJzKe1g8NS
	kHIEvWMi/0X2JAu+h/QXntQ2Wokm8tr4uTX240WHuVkVxGogXE+1KM8oN2mNSLmG3q+bQYA/n8Isa
	y05zVh64xHCEsutlvsLH1nRwwWkoyVK6nsm8BwPEKyFoXZ764sKuia3S26YDWTrBdsvYNfLBjt8Q9
	iMBdrNuA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxN5-00000000L37-0VID;
	Fri, 30 May 2025 10:53:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uKxKx-00000000Kok-0AaU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 30 May 2025 10:51:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E031616F2;
	Fri, 30 May 2025 03:51:25 -0700 (PDT)
Received: from [10.57.95.14] (unknown [10.57.95.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CB0233F5A1;
	Fri, 30 May 2025 03:51:39 -0700 (PDT)
Message-ID: <23fc2527-cd32-4750-9b3b-df65f4f76609@arm.com>
Date: Fri, 30 May 2025 11:51:38 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/3] Enable huge-vmalloc permission change
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org
References: <20250530090407.19237-1-dev.jain@arm.com>
 <adfe981a-ec9a-4051-a26f-91b691230161@arm.com>
 <381fec11-0e05-4bf0-9cd8-f272fde7558f@arm.com>
 <090440b6-9501-4f29-8b9f-1f6e6f3a6fbc@arm.com>
 <6f8d893e-ddb9-4416-979f-eca3b0f9fb5b@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <6f8d893e-ddb9-4416-979f-eca3b0f9fb5b@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250530_035143_167166_C9BD6211 
X-CRM114-Status: GOOD (  24.04  )
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

On 30/05/2025 11:42, Dev Jain wrote:
> 
> On 30/05/25 4:07 pm, Ryan Roberts wrote:
>> On 30/05/2025 11:10, Dev Jain wrote:
>>> On 30/05/25 3:33 pm, Ryan Roberts wrote:
>>>> On 30/05/2025 10:04, Dev Jain wrote:
>>>>> This series paves the path to enable huge mappings in vmalloc space by
>>>>> default on arm64. > For this we must ensure that we can handle any permission
>>>>> games on vmalloc space.
>>>> And the linear map :)
>>>>
>>>>> Currently, __change_memory_common() uses
>>>>> apply_to_page_range() which does not support changing permissions for
>>>>> leaf mappings.
>>>> nit: A "leaf mapping" is the lowest level entry in the page tables for a given
>>>> address - i.e. it maps an address to some actual memory rather than to another
>>>> pgtable. It includes what the Arm ARM calls "page mappings" (PTE level) and
>>>> "block mappings" (PMD/PUD/.. level). apply_to_page_range() does support page
>>>> mappings, so saying it doesn't support leaf mappings is incorrect. It doesn't
>>>> support block mappings.
>>> Sorry, again got confused by nomenclature : )
>>>
>>>>> We attempt to move away from this by using walk_page_range_novma(),
>>>>> similar to what riscv does right now; however, it is the responsibility
>>>>> of the caller to ensure that we do not pass a range, or split the range
>>>>> covering a partial leaf mapping.
>>>>>
>>>>> This series is tied with Yang Shi's attempt [1] at using huge mappings
>>>>> in the linear mapping in case the system supports BBML2, in which case
>>>>> we will be able to split the linear mapping if needed without break-before-
>>>>> make.
>>>>> Thus, Yang's series, IIUC, will be one such user of my series; suppose we
>>>>> are changing permissions on a range of the linear map backed by PMD-hugepages,
>>>>> then the sequence of operations should look like the following:
>>>>>
>>>>> split_range(start, (start + HPAGE_PMD_SIZE) & ~HPAGE_PMD_MASK);
>>>>> split_range(end & ~HPAGE_PMD_MASK, end);
>>>> I don't understand what the HPAGE_PMD_MASK twiddling is doing? That's not
>>>> right.
>>>> It's going to give you the offset within the 2M region. You just want:
>>>>
>>>> split_range(start)
>>>> split_range(end)
>>>>
>>>> right?
>>> Suppose start = 2M + 4K, end = 8M + 5K. Then my sequence will compute to
>> 8M + 5K is not a valid split point. It has to be at least page aligned.
> 
> Sorry, so consider 8M + 4K.
> 
>>> split_range(2M + 4K, 3M)
>>> split_range(8M, 8M + 5K)
>> We just want to split at start and end. What are the 3M and 8M params supposed
>> to be? Anyway, this is off-topic for this series.
> 
> I think we are both saying the same thing; yes we will split only the start and
> the end,
> so if the address 2Mb + 4Kb is mapped as a PMD-hugepage, we need to split this
> PMD into
> a PTE table, which will map 2Mb till 4Mb as base pages now.

Not quite; if you start with [2M, 4M) mapped by PMD, then want to ensure a
boundary at 2M+4K, I think you would end up with the first 64K (16 pages) mapped
by base page, then the then the next 1984K mapped by contpte blocks (31 contpte
blocks).

But yes, we agree :)

> 
>>
>>> __change_memory_common(2M + 4K, 8M + 5K)
>>>
>>> So now __change_memory_common() wouldn't have to deal with splitting the
>>> starts and ends. Please correct me if I am wrong.
>>>
>>>>> __change_memory_common(start, end);
>>>>>
>>>>> However, this series can be used independently of Yang's; since currently
>>>>> permission games are being played only on pte mappings (due to
>>>>> apply_to_page_range
>>>>> not supporting otherwise), this series provides the mechanism for enabling
>>>>> huge mappings for various kernel mappings like linear map and vmalloc.
>>>> In other words, you are saying that this series is a prerequisite for Yang's
>>>> series (and both are prerequisites for huge vmalloc by default). Your series
>>>> adds a new capability that Yang's series will rely on (the ability to change
>>>> permissions on block mappings).
>>> That's right.
>>>
>>>> Thanks,
>>>> Ryan
>>>>
>>>>> [1] https://lore.kernel.org/all/20250304222018.615808-1-
>>>>> yang@os.amperecomputing.com/
>>>>>
>>>>> Dev Jain (3):
>>>>>     mm: Allow pagewalk without locks
>>>>>     arm64: pageattr: Use walk_page_range_novma() to change memory
>>>>>       permissions
>>>>>     mm/pagewalk: Add pre/post_pte_table callback for lazy MMU on arm64
>>>>>
>>>>>    arch/arm64/mm/pageattr.c | 81 +++++++++++++++++++++++++++++++++++++---
>>>>>    include/linux/pagewalk.h |  4 ++
>>>>>    mm/pagewalk.c            | 18 +++++++--
>>>>>    3 files changed, 94 insertions(+), 9 deletions(-)
>>>>>


