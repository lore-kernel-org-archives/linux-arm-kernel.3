Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 92B46CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 06:19:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PS9q9vFrxL7ECKYq1WxEMnI27qCXBcYwh91xX09th0E=; b=chHYvx9qVgtdLIHMVXzgmwFZZ3
	znQxTAe+JkmORSJIxW/ib0qj4339HmmdN0nws/ZKuxBYw1iN5pQWKZQNHarF/egHOABIEFY7ALYal
	ACJEVgxdHB1PLKdh0/yHE4onKwLuzhK/voVxsFLqpu1e9PfITRtyYL7gsCdgqzRZQSUSr8Vmu00uy
	t3/YhfDd2fIkBjopykioWf0aWW7SK0X0KtiS7ulA9Y4qoo9QCkEyVT+k6pz9WGr89aGx489m70jvD
	hybRT/ZlVM5I0X346vnSD1BR5OWr47/47mb5XJumt+N6zUs2hOXru+ktG3g7GRH3NtgA0WcJbikL1
	dxPrdPoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursS4-00000004cbu-1O2O;
	Fri, 29 Aug 2025 06:19:08 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ursLH-00000004bW9-3icB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 06:12:09 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id F195B1758;
	Thu, 28 Aug 2025 23:11:58 -0700 (PDT)
Received: from [10.164.18.63] (unknown [10.164.18.63])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CF5FC3F63F;
	Thu, 28 Aug 2025 23:12:04 -0700 (PDT)
Message-ID: <2bf90f7c-a026-488a-8a27-26f571b3d02a@arm.com>
Date: Fri, 29 Aug 2025 11:42:01 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC 3/3] arm64/ptdump: Add ARM64_PTDUMP_CONSOLE
To: "Ritesh Harjani (IBM)" <ritesh.list@gmail.com>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Mark Brown <broonie@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>,
 Mark Rutland <mark.rutland@arm.com>, linux-kernel@vger.kernel.org
References: <20250818091436.938517-1-anshuman.khandual@arm.com>
 <20250818091436.938517-4-anshuman.khandual@arm.com>
 <87bjo2qe5w.fsf@gmail.com> <7302615c-e190-43ac-bc29-e82d7b048403@arm.com>
 <87zfbikd4f.fsf@gmail.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <87zfbikd4f.fsf@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250828_231208_008141_FDB0F7A2 
X-CRM114-Status: GOOD (  25.53  )
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



On 29/08/25 9:12 AM, Ritesh Harjani (IBM) wrote:
> Anshuman Khandual <anshuman.khandual@arm.com> writes:
> 
>> On 26/08/25 9:16 PM, Ritesh Harjani (IBM) wrote:
>>> Anshuman Khandual <anshuman.khandual@arm.com> writes:
>>>
>>>> Enable early kernel page table dump for debug purpose when required via new
>>>> config ARM64_PDUMP_CONSOLE. This calls existing ptdump_walk() early on just
>>>> after ptdump has been initialized with ptdump_init().
>>>
>>> I happen to stumble upon this while looking for something else related
>>> to ptdump and was curious to understand where this will be really
>>> useful? 
>>>
>>> So instead of dumping it via cat /sys/kernel/debug/kernel_page_tables,
>>> this will dump at early boot during arch setup and before start_kernel().
>>
>> Right, primarily before vmalloc() space gets crowded. Also this provides
>> an opportunity to do a diff between early boot and after boot kernel page
>> table states.
> 
> Just want to understand this better - the diff here will mainly show the
> new page table entries for the remaining layout which will get populated
> in start_kernel() right? The existing mappings created during
> setup_arch() won't get changed right?

Correct.
> 
>>>
>>> I was curious, since this anyway gets enabled only in debug kernels.
>>> There we can always just boot with minimal busybox image which can jump
>>> to shell quickly and dump the kernel page tables, correct?
>>
>> Here the kernel page table dump could happen earlier than that as well.
>>>
>>> Also is ARM64_PTDUMP_CONSOLE config option added on purpose? A kernel cmdline
>>> like early_ptdump=yes|1|true could come much handy, right?
>>
>> Currently this is just for arm64 platform but could be enabled in general
>> for other platforms as well. Yes, early_ptdump=yes|1|true will be useful
>> as well. ARM64_PTDUMP_CONSOLE just build guards the additional code. But
>> if required cmdline option "early_ptdump=" could just provide the runtime
>> switch and then this could always be built enabled on CONFIG_PTDUMP.
>>>
>>> (Since I am fixing few issues on powerpc ptdump - hence was just curious
>>> to know whether this can come useful for me too or not :) )
>>
>> This feature could be extended in general to other platforms. Let me know
>> if you find this useful for powerpc.
> 
> Sure - as of now I don't have a direct usecase. But let me try to do
> an early page table dump by taking some inspiration from your patch to
> see if this adds value for powerpc case or not.

Sure, please do let us know how that goes.

> > Thanks for sharing the info.
> 
> -ritesh
> 
>>>
>>> Thanks!
>>> -ritesh
>>>
>>>>
>>>> Suggested-by: Ryan Roberts <ryan.roberts@arm.com>
>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>> ---
>>>>  arch/arm64/Kconfig.debug        | 12 ++++++++++++
>>>>  arch/arm64/include/asm/ptdump.h |  7 +++++++
>>>>  arch/arm64/kernel/setup.c       |  1 +
>>>>  arch/arm64/mm/ptdump.c          |  7 +++++++
>>>>  4 files changed, 27 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/Kconfig.debug b/arch/arm64/Kconfig.debug
>>>> index 265c4461031f..0f8af0dd0f4c 100644
>>>> --- a/arch/arm64/Kconfig.debug
>>>> +++ b/arch/arm64/Kconfig.debug
>>>> @@ -20,4 +20,16 @@ config ARM64_RELOC_TEST
>>>>  	depends on m
>>>>  	tristate "Relocation testing module"
>>>>  
>>>> +config ARM64_PTDUMP_CONSOLE
>>>> +	bool "Dump early kernel page table"
>>>> +	depends on DEBUG_KERNEL
>>>> +	depends on ARCH_HAS_PTDUMP
>>>> +	select PTDUMP
>>>> +	help
>>>> +	  Enable this option to dump early kernel page table entries during
>>>> +	  boot using the PTDUMP framework. This helps in examining kernel's
>>>> +	  page table mapping entries and their attributes etc.
>>>> +
>>>> +	  If in doubt, say N.
>>>> +
>>>>  source "drivers/hwtracing/coresight/Kconfig"
>>>> diff --git a/arch/arm64/include/asm/ptdump.h b/arch/arm64/include/asm/ptdump.h
>>>> index 27e774134e7f..81dc53ca9643 100644
>>>> --- a/arch/arm64/include/asm/ptdump.h
>>>> +++ b/arch/arm64/include/asm/ptdump.h
>>>> @@ -74,8 +74,15 @@ void __init ptdump_debugfs_register(struct ptdump_info *info, const char *name);
>>>>  static inline void ptdump_debugfs_register(struct ptdump_info *info,
>>>>  					   const char *name) { }
>>>>  #endif /* CONFIG_PTDUMP_DEBUGFS */
>>>> +
>>>> +#ifdef CONFIG_ARM64_PTDUMP_CONSOLE
>>>> +void __init arm64_kernel_pgtable_dump(void);
>>>> +#else
>>>> +static inline void __init arm64_kernel_pgtable_dump(void) { }
>>>> +#endif /* CONFIG_ARM64_PTDUMP_CONSOLE */
>>>>  #else
>>>>  static inline void __init ptdump_init(void) { }
>>>> +static inline void __init arm64_kernel_pgtable_dump(void) { }
>>>>  static inline void note_page(struct ptdump_state *pt_st, unsigned long addr,
>>>>  			     int level, pteval_t val) { }
>>>>  static inline void note_page_pte(struct ptdump_state *st, unsigned long addr, pte_t pte) { }
>>>> diff --git a/arch/arm64/kernel/setup.c b/arch/arm64/kernel/setup.c
>>>> index 0a3812c8e177..86bf7607d304 100644
>>>> --- a/arch/arm64/kernel/setup.c
>>>> +++ b/arch/arm64/kernel/setup.c
>>>> @@ -361,6 +361,7 @@ void __init __no_sanitize_address setup_arch(char **cmdline_p)
>>>>  	init_bootcpu_ops();
>>>>  	smp_init_cpus();
>>>>  	smp_build_mpidr_hash();
>>>> +	arm64_kernel_pgtable_dump();
>>>>  
>>>>  #ifdef CONFIG_ARM64_SW_TTBR0_PAN
>>>>  	/*
>>>> diff --git a/arch/arm64/mm/ptdump.c b/arch/arm64/mm/ptdump.c
>>>> index c78e6b496dea..f6d22462add6 100644
>>>> --- a/arch/arm64/mm/ptdump.c
>>>> +++ b/arch/arm64/mm/ptdump.c
>>>> @@ -407,6 +407,13 @@ void __init ptdump_init(void)
>>>>  	ptdump_initialize();
>>>>  }
>>>>  
>>>> +#ifdef CONFIG_ARM64_PTDUMP_CONSOLE
>>>> +void __init arm64_kernel_pgtable_dump(void)
>>>> +{
>>>> +	ptdump_walk(CONSOLE, &kernel_ptdump_info);
>>>> +}
>>>> +#endif
>>>> +
>>>>  static int __init ptdump_debugfs_init(void)
>>>>  {
>>>>  	ptdump_debugfs_register(&kernel_ptdump_info, "kernel_page_tables");
>>>> -- 
>>>> 2.25.1


