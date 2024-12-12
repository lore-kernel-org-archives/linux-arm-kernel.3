Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 055AEE7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 10:57:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bcsvLEEvJkZn1ij2TFEhsaydTQ50wm0i/4k5xXn2KlU=; b=l4lX/gCBM3nEGUxmUxEI7Rempw
	vmxgmWKhK1X9m2TU0DjQcpDAzn4h9Dm4c3/iPDbKqbNhg69dDxrw8n7nO1hXG4A7SzsSYuzn1ZSa/
	SthNfR/JTKhTkFD0sKnFhu/xHkPWB9gPE5KSrmLQ4Yq3rISH/kPUvMl8aqIK7WShSw3boZnir0T35
	V5VGsjbyp1eG6LCF4wy/jyz+CDznEsCOfKnp4Q5WXukEZP5I+eBlg9x0h6eEH0Okayj8VYcCdbn1D
	2EFqEDM+gAuFyb7yGgIldnU0y44ifMU+UodYBHto/o16rqBgUknrb+JRT2jT1IBDe+L6VaYvgIBXQ
	aiu9wCfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgsL-000000007BZ-0pqI;
	Thu, 12 Dec 2024 10:56:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLgrG-0000000070O-31v3
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 10:55:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 92E3C153B;
	Thu, 12 Dec 2024 02:56:17 -0800 (PST)
Received: from [10.57.92.2] (unknown [10.57.92.2])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 102953F720;
	Thu, 12 Dec 2024 02:55:46 -0800 (PST)
Message-ID: <084c5ada-51af-4c1a-b50a-4401e62ddbd6@arm.com>
Date: Thu, 12 Dec 2024 10:55:45 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RESEND RFC PATCH v1 2/5] arm64: Add BBM Level 2 cpu feature
Content-Language: en-GB
To: Marc Zyngier <maz@kernel.org>,
 =?UTF-8?Q?Miko=C5=82aj_Lenczewski?= <miko.lenczewski@arm.com>
Cc: catalin.marinas@arm.com, will@kernel.org, corbet@lwn.net,
 oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
 yuzenghui@huawei.com, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org,
 kvmarm@lists.linux.dev
References: <20241211160218.41404-1-miko.lenczewski@arm.com>
 <20241211160218.41404-3-miko.lenczewski@arm.com>
 <87cyhxs3xq.wl-maz@kernel.org>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <87cyhxs3xq.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_025550_853686_BEE778A7 
X-CRM114-Status: GOOD (  41.85  )
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

On 12/12/2024 08:25, Marc Zyngier wrote:
> Ah, so this is where this is hiding. I missed it in my review of patch
> #1 yesterday.
> 
> On Wed, 11 Dec 2024 16:01:38 +0000,
> Mikołaj Lenczewski <miko.lenczewski@arm.com> wrote:
>>
>> The Break-Before-Make cpu feature supports multiple levels (levels 0-2),
>> and this commit adds a dedicated BBML2 cpufeature to test against
>> support for.
>>
>> In supporting BBM level 2, we open ourselves up to potential TLB
>> Conflict Abort Exceptions during expected execution, instead of only
>> in exceptional circumstances. In the case of an abort, it is
>> implementation defined at what stage the abort is generated, and
> 
> *IF* stage-2 is enabled. Also, in the case of the EL2&0 translation
> regime, no stage-2 applies, so it can only be a stage-1 abort.
> 
>> the minimal set of required invalidations is also implementation
>> defined. The maximal set of invalidations is to do a `tlbi vmalle1`
>> or `tlbi vmalls12e1`, depending on the stage.
>>
>> Such aborts should not occur on Arm hardware, and were not seen in
>> benchmarked systems, so unless performance concerns arise, implementing
> 
> Which systems? Given that you have deny-listed *all* half recent ARM
> Ltd implementations, I'm a bit puzzled.
> 
>> the abort handlers with the worst-case invalidations seems like an
>> alright hack.
>>
>> Signed-off-by: Mikołaj Lenczewski <miko.lenczewski@arm.com>
>> ---
>>  arch/arm64/include/asm/cpufeature.h | 14 ++++++++++++++
>>  arch/arm64/kernel/cpufeature.c      |  7 +++++++
>>  arch/arm64/mm/fault.c               | 27 ++++++++++++++++++++++++++-
>>  arch/arm64/tools/cpucaps            |  1 +
>>  4 files changed, 48 insertions(+), 1 deletion(-)
>>
>> diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
>> index 8b4e5a3cd24c..a9f2ac335392 100644
>> --- a/arch/arm64/include/asm/cpufeature.h
>> +++ b/arch/arm64/include/asm/cpufeature.h
>> @@ -866,6 +866,20 @@ static __always_inline bool system_supports_mpam_hcr(void)
>>  	return alternative_has_cap_unlikely(ARM64_MPAM_HCR);
>>  }
>>  
>> +static inline bool system_supports_bbml2(void)
>> +{
>> +	/* currently, BBM is only relied on by code touching the userspace page
>> +	 * tables, and as such we are guaranteed that caps have been finalised.
>> +	 *
>> +	 * if later we want to use BBM for kernel mappings, particularly early
>> +	 * in the kernel, this may return 0 even if BBML2 is actually supported,
>> +	 * which means unnecessary break-before-make sequences, but is still
>> +	 * correct
> 
> Comment style, capitalisation, punctuation.
> 
>> +	 */
>> +
>> +	return alternative_has_cap_unlikely(ARM64_HAS_BBML2);
>> +}
>> +
>>  int do_emulate_mrs(struct pt_regs *regs, u32 sys_reg, u32 rt);
>>  bool try_emulate_mrs(struct pt_regs *regs, u32 isn);
>>  
>> diff --git a/arch/arm64/kernel/cpufeature.c b/arch/arm64/kernel/cpufeature.c
>> index 6ce71f444ed8..7cc94bd5da24 100644
>> --- a/arch/arm64/kernel/cpufeature.c
>> +++ b/arch/arm64/kernel/cpufeature.c
>> @@ -2917,6 +2917,13 @@ static const struct arm64_cpu_capabilities arm64_features[] = {
>>  		.matches = has_cpuid_feature,
>>  		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, EVT, IMP)
>>  	},
>> +	{
>> +		.desc = "BBM Level 2 Support",
>> +		.capability = ARM64_HAS_BBML2,
>> +		.type = ARM64_CPUCAP_SYSTEM_FEATURE,
>> +		.matches = has_cpuid_feature,
>> +		ARM64_CPUID_FIELDS(ID_AA64MMFR2_EL1, BBM, 2)
>> +	},
>>  	{
>>  		.desc = "52-bit Virtual Addressing for KVM (LPA2)",
>>  		.capability = ARM64_HAS_LPA2,
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index ef63651099a9..dc119358cbc1 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -844,6 +844,31 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>>  	return 0;
>>  }
>>  
>> +static int do_conflict_abort(unsigned long far, unsigned long esr,
>> +			     struct pt_regs *regs)
>> +{
>> +	if (!system_supports_bbml2())
>> +		return do_bad(far, esr, regs);
>> +
>> +	/* if we receive a TLB conflict abort, we know that there are multiple
>> +	 * TLB entries that translate the same address range. the minimum set
>> +	 * of invalidations to clear these entries is implementation defined.
>> +	 * the maximum set is defined as either tlbi(vmalls12e1) or tlbi(alle1).
>> +	 *
>> +	 * if el2 is enabled and stage 2 translation enabled, this may be
>> +	 * raised as a stage 2 abort. if el2 is enabled but stage 2 translation
>> +	 * disabled, or if el2 is disabled, it will be raised as a stage 1
>> +	 * abort.
>> +	 *
>> +	 * local_flush_tlb_all() does a tlbi(vmalle1), which is enough to
>> +	 * handle a stage 1 abort.
> 
> Same comment about comments.
> 
>> +	 */
>> +
>> +	local_flush_tlb_all();
> 
> The elephant in the room: if TLBs are in such a sorry state, what
> guarantees we can make it this far?

I'll leave Miko to respond to your other comments, but I wanted to address this
one, since it's pretty fundamental. We went around this loop internally and
concluded that what we are doing is architecturally sound.

The expectation is that a conflict abort can only be generated as a result of
the change in patch 4 (and patch 5). That change makes it possible for the TLB
to end up with a multihit. But crucially that can only happen for user space
memory because that change only operates on user memory. And while the TLB may
detect the conflict at any time, the conflict abort is only permitted to be
reported when an architectural access is prevented by the conflict. So we never
do anything that would allow a conflict for a kernel memory access and a user
memory conflict abort can never be triggered as a result of accessing kernel memory.

Copy/pasting comment from AlexC on the topic, which explains it better than I can:

"""
The intent is certainly that in cases where the hardware detects a TLB conflict
abort, it is only permitted to report it (by generating an exception) if it
applies to an access that is being attempted architecturally. ... that property
can be built from the following two properties:

1. The TLB conflict can only be reported as an Instruction Abort or a Data Abort

2. Those two exception types must be reported synchronously and precisely.
"""

> 
> I honestly don't think you can reliably handle a TLB Conflict abort in
> the same translation regime as the original fault, given that we don't
> know the scope of that fault. You are probably making an educated
> guess that it is good enough on the CPUs you know of, but I don't see
> anything in the architecture that indicates the "blast radius" of a
> TLB conflict.

OK, so I'm claiming that the blast radius is limited to the region of memory
that we are operating on in contpte_collapse() in patch 4. Perhaps we need to go
re-read the ARM and come back with the specific statements that led us to that
conclusion?

Thanks,
Ryan

> 
> Which makes me think that your KVM patch is equally broken on nVHE and
> hVHE. Such fault should probably be handled while at EL2, not after
> returning to EL1.
> 
> Thanks,
> 
> 	M.
> 


