Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 06652CCF9EE
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Oct 2025 02:41:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A5uz61rbwSt5HsnGaxVWjNojcH1LShGKAXFGdI/MgxU=; b=4rmk3Q96jWClPorR7lCqsDfmrO
	pTuI8Zv388F9HEl2tyiCImi24B3ZOoeTWc5J8p+k48YNiV2Uz167RU3Y3cihfrmcadwSkeQGcQniR
	gjTzfUfoc7KIaBFxQjVWjwKHVwgAAJ1gXDux/Ksq+9x0iBjhFgrJGB342Tky9JNR+c7kNUL6yEG17
	vBUw6jNoEdD40I2hFZY/PlVW1ksMKK9NiN6Bpld/4BsEaQg/Xgz9Lnb72KnRJP/Za7As9AXhb1m9d
	prg5Tyvv19x1H5Q7uTfu1Hv8WiEHzFukiAxqax920uQW6pKOV+1+IrplFNhxvzzAs4RZM2sA47jQP
	LdoZIdOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIbQ-00000003Ntl-21v7;
	Thu, 30 Oct 2025 02:41:28 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEIbN-00000003Nt2-1QPV
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Oct 2025 02:41:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D4DE12C42;
	Wed, 29 Oct 2025 19:41:13 -0700 (PDT)
Received: from [10.164.18.45] (unknown [10.164.18.45])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DD7E33F66E;
	Wed, 29 Oct 2025 19:41:18 -0700 (PDT)
Message-ID: <434eebff-069d-424f-a2b8-d9dae4e2202f@arm.com>
Date: Thu, 30 Oct 2025 08:11:15 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64/mm: Add remaining TLBI_XXX_MASK macros
To: Jonathan Cameron <jonathan.cameron@huawei.com>
Cc: linux-arm-kernel@lists.infradead.org, ben.horgan@arm.com,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,
 linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev
References: <20251024040207.137480-1-anshuman.khandual@arm.com>
 <20251024040207.137480-3-anshuman.khandual@arm.com>
 <20251024120014.000020af@huawei.com>
 <6e7d0bf3-ddf1-44a0-a0cb-7dc994101878@arm.com>
 <20251028124334.00001e77@huawei.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251028124334.00001e77@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251029_194125_499622_16AF74A3 
X-CRM114-Status: GOOD (  14.02  )
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



On 28/10/25 6:13 PM, Jonathan Cameron wrote:
> On Mon, 27 Oct 2025 07:06:45 +0530
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> On 24/10/25 4:30 PM, Jonathan Cameron wrote:
>>> On Fri, 24 Oct 2025 05:02:07 +0100
>>> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>>   
>>>> Add remaining TLBI_XXX_MASK macros and replace current open encoded fields.
>>>> While here replace hard coded page size based shifts but with derived ones
>>>> via ilog2() thus adding some required context.
>>>>
>>>> TLBI_TTL_MASK has been split into separate TLBI_TTL_MASK and TLBI_TG_MASK
>>>> as appropriate because currently it simultaneously contains both page size
>>>> and translation table level information. KVM on arm64 has been updated to
>>>> accommodate these changes to TLBI_TTL_MASK.
>>>>
>>>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>>>> Cc: Will Deacon <will@kernel.org>
>>>> Cc: Marc Zyngier <maz@kernel.org>
>>>> Cc: Oliver Upton <oliver.upton@linux.dev>
>>>> Cc: linux-arm-kernel@lists.infradead.org
>>>> Cc: linux-kernel@vger.kernel.org
>>>> Cc: kvmarm@lists.linux.dev
>>>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>>>> ---
>>>>  arch/arm64/include/asm/tlbflush.h | 26 ++++++++++++++++++--------
>>>>  arch/arm64/kvm/nested.c           |  8 +++++---
>>>>  2 files changed, 23 insertions(+), 11 deletions(-)
>>>>
>>>> diff --git a/arch/arm64/include/asm/tlbflush.h b/arch/arm64/include/asm/tlbflush.h
>>>> index 131096094f5b..cf75fc2a06c3 100644
>>>> --- a/arch/arm64/include/asm/tlbflush.h
>>>> +++ b/arch/arm64/include/asm/tlbflush.h
>>>> @@ -57,9 +57,10 @@
>>>>  /* This macro creates a properly formatted VA operand for the TLBI */
>>>>  #define __TLBI_VADDR(addr, asid)				\
>>>>  	({							\
>>>> -		unsigned long __ta = (addr) >> 12;		\
>>>> -		__ta &= GENMASK_ULL(43, 0);			\
>>>> -		__ta |= (unsigned long)(asid) << 48;		\
>>>> +		unsigned long __ta = (addr) >> ilog2(SZ_4K);	\
>>>> +		__ta &= TLBI_BADDR_MASK;			\
>>>> +		__ta &= ~TLBI_ASID_MASK;			\
>>>> +		__ta |= FIELD_PREP(TLBI_ASID_MASK, asid);	\  
>>> I think you can replace the two lines above with
>>> 		FIELD_MODIFY(TLBI_ASID_MASK, &__ta, asid);
>>>
>>> It's a small reduction in code but I don't mind much either way.  
>>
>> Right. FIELD_MODIFY() might be appropriate in this scenario but
>> there will be some additional code churn needed. I don't have a
>> strong opinion either way.
>>
>> --- a/arch/arm64/include/asm/tlbflush.h
>> +++ b/arch/arm64/include/asm/tlbflush.h
>> @@ -55,13 +55,12 @@
>>  } while (0)
>>
>>  /* This macro creates a properly formatted VA operand for the TLBI */
>> -#define __TLBI_VADDR(addr, asid)                               \
>> -       ({                                                      \
>> -               unsigned long __ta = (addr) >> ilog2(SZ_4K);    \
>> -               __ta &= TLBI_BADDR_MASK;                        \
>> -               __ta &= ~TLBI_ASID_MASK;                        \
>> -               __ta |= FIELD_PREP(TLBI_ASID_MASK, asid);       \
>> -               __ta;                                           \
>> +#define __TLBI_VADDR(addr, asid)                                       \
>> +       ({                                                              \
>> +               unsigned long __ta = (addr) >> ilog2(SZ_4K);            \
>> +               __ta &= TLBI_BADDR_MASK;                                \
>> +               __ta |= FIELD_MODIFY(TLBI_ASID_MASK, &__ta, asid);      \
> 		  FIELD_MODIFY(TLBI_ASID_MASK, &__tab, asid);
> 
> as it's done in place in the second parameter.

Sorry but could not understand your point above.

