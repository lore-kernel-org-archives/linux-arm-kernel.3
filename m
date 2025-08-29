Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 547E2CA0FF9
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 16:39:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7w9teeFYDUzsWu3vGE4c76DWiitJCRaMttY09eeImT4=; b=H2ijzR4bhBkzJrUlzTAYa/1SMb
	/widcDTGgbwzUm2za+lKTxJ1GVwVMUT0K86jfpenyngTxW7H438NyB76rHcrbAZJ0o6liqxpozUhY
	r7UqzoXce0Qbp//gW3caSlNlZrYiMsMQOld8PHqqXy3lzzJJLXL6wrpjJn896c8adoes8T7hpD8IR
	pJSVGKjmreHXqiPRxU7gDPQxsj0KCjdlb9sipvA7HtoC7dxaV7rL2KP232g4EUsatVOqW5f5OlayZ
	XSgEWtqia3SVP6B3AT28bG6OLa6abKV4eoMzqHPMsRQo+2dqK2CXTF2DfYz1M/2LIyoFrsQkf21EM
	udwpDTwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us28D-00000006QUW-2k1z;
	Fri, 29 Aug 2025 16:39:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urzFn-00000005pVX-4C2U
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 13:34:57 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 19D5815A1;
	Fri, 29 Aug 2025 06:34:46 -0700 (PDT)
Received: from [10.163.69.116] (unknown [10.163.69.116])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7BBC33F738;
	Fri, 29 Aug 2025 06:34:51 -0700 (PDT)
Message-ID: <143768ff-3363-4a30-be87-08a382b3c445@arm.com>
Date: Fri, 29 Aug 2025 19:04:46 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH V2 2/2] arm64/sysreg: Replace TCR_EL1 field macros
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Oliver Upton <oliver.upton@linux.dev>, Mark Brown <broonie@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, kvmarm@lists.linux.dev,
 linux-kernel@vger.kernel.org
References: <20250829060215.1086792-1-anshuman.khandual@arm.com>
 <20250829060215.1086792-3-anshuman.khandual@arm.com>
 <867bymeean.wl-maz@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <867bymeean.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250829_063456_129913_F69349A0 
X-CRM114-Status: GOOD (  17.61  )
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



On 29/08/25 1:43 PM, Marc Zyngier wrote:
> On Fri, 29 Aug 2025 07:02:15 +0100,
> Anshuman Khandual <anshuman.khandual@arm.com> wrote:
>>
>> This just replaces all used TCR_EL1 field macros with tools sysreg variant
>> based fields and subsequently drops them from the header (pgtable-hwdef.h)
>> and moves them into KVM header (asm/kvm_arm.h) for continued usage in KVM.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Marc Zyngier <maz@kernel.org>
>> Cc: Mark Brown <broonie@kernel.org>
>> Cc: kvmarm@lists.linux.dev
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>> Changes in V2:
>>
>> - Dropped all TCR_EL1 replacements from KVM code
>> - Moved existing TCR_XXX macros from (asm/pgtable-hwdef.h) into KVM header
>>   (asm/kvm_arm.h) for their continued usage
>>
>>  arch/arm64/include/asm/assembler.h     |   6 +-
>>  arch/arm64/include/asm/cputype.h       |   2 +-
>>  arch/arm64/include/asm/kvm_arm.h       |  92 +++++++++++++++++++++++
>>  arch/arm64/include/asm/mmu_context.h   |   4 +-
>>  arch/arm64/include/asm/pgtable-hwdef.h | 100 +------------------------
>>  arch/arm64/include/asm/pgtable-prot.h  |   2 +-
>>  arch/arm64/kernel/cpufeature.c         |   4 +-
>>  arch/arm64/kernel/pi/map_kernel.c      |   8 +-
>>  arch/arm64/kernel/vmcore_info.c        |   2 +-
>>  arch/arm64/mm/proc.S                   |  36 +++++----
>>  tools/arch/arm64/include/asm/cputype.h |   2 +-
>>  11 files changed, 134 insertions(+), 124 deletions(-)
>>
> 
> [...]
> 
>> diff --git a/arch/arm64/include/asm/kvm_arm.h b/arch/arm64/include/asm/kvm_arm.h
>> index 1da290aeedce..ad3c305c6374 100644
>> --- a/arch/arm64/include/asm/kvm_arm.h
>> +++ b/arch/arm64/include/asm/kvm_arm.h
>> @@ -107,6 +107,98 @@
>>  
>>  #define MPAMHCR_HOST_FLAGS	0
>>  
>> +#define TCR_T0SZ_OFFSET		0
>> +#define TCR_T1SZ_OFFSET		16
> 
> These are unused by KVM.

I have dropped them for now.

But shall I audit these moved macros here and drop the ones
that are not used in KVM currently ?
 > 
>> +#define TCR_TxSZ(x)		(TCR_T0SZ(x) | TCR_T1SZ(x))
>> +#define TCR_TxSZ_WIDTH		6
>> +#define TCR_T0SZ_MASK		(((UL(1) << TCR_TxSZ_WIDTH) - 1) << TCR_T0SZ_OFFSET)
>> +#define TCR_T1SZ_MASK		(((UL(1) << TCR_TxSZ_WIDTH) - 1) << TCR_T1SZ_OFFSET)
> 
> [eyeroll]
> 
> Why do you need to repeat all of this, while you just introduced
> new definitions? Surely you can write a script that express one in
> term of the other, and add that to KVM, instead of just blindly moving
> stuff around?

Tried expressing them in terms of TCR_EL1_XXX field definitions added
earlier. I hope this works.

#define TCR_T0SZ_MASK		TCR_EL1_T0SZ_MASK
#define TCR_T1SZ_MASK		TCR_EL1_T1SZ_MASK

#define TCR_EPD0_MASK		TCR_EL1_EPD0_MASK
#define TCR_IRGN0_MASK		TCR_EL1_IRGN0_MASK
#define TCR_IRGN0_NC		(TCR_EL1_IRGN0_NC << TCR_EL1_IRGN0_SHIFT)
#define TCR_IRGN0_WBWA		(TCR_EL1_IRGN0_WBWA << TCR_EL1_IRGN0_SHIFT)
#define TCR_IRGN0_WT		(TCR_EL1_IRGN0_WT << TCR_EL1_IRGN0_SHIFT)
#define TCR_IRGN0_WBnWA		(TCR_EL1_IRGN0_WBnWA << TCR_EL1_IRGN0_SHIFT)

#define TCR_EPD1_MASK		TCR_EL1_EPD1_MASK
#define TCR_IRGN1_MASK		TCR_EL1_IRGN1_MASK
#define TCR_IRGN1_NC		(TCR_EL1_IRGN1_NC << TCR_EL1_IRGN1_SHIFT)
#define TCR_IRGN1_WBWA		(TCR_EL1_IRGN1_WBWA << TCR_EL1_IRGN1_SHIFT)
#define TCR_IRGN1_WT		(TCR_EL1_IRGN1_WT << TCR_EL1_IRGN1_SHIFT)
#define TCR_IRGN1_WBnWA		(TCR_EL1_IRGN1_WBnWA << TCR_EL1_IRGN1_SHIFT)

#define TCR_IRGN_NC		(TCR_EL1_IRGN0_NC | TCR_EL1_IRGN1_NC)
#define TCR_IRGN_WT		(TCR_EL1_IRGN0_WT | TCR_EL1_IRGN1_WT)
#define TCR_IRGN_WBnWA		(TCR_EL1_IRGN0_WBnWA | TCR_EL1_IRGN1_WBnWA)
#define TCR_IRGN_MASK		(TCR_EL1_IRGN0_MASK | TCR_EL1_IRGN1_MASK)

#define TCR_ORGN0_MASK		TCR_EL1_ORGN0_MASK
#define TCR_ORGN0_NC		(TCR_EL1_ORGN0_NC << TCR_EL1_ORGN0_SHIFT)
#define TCR_ORGN0_WBWA		(TCR_EL1_ORGN0_WBWA << TCR_EL1_ORGN0_SHIFT)
#define TCR_ORGN0_WT		(TCR_EL1_ORGN0_WT << TCR_EL1_ORGN0_SHIFT)
#define TCR_ORGN0_WBnWA		(TCR_EL1_ORGN0_WBnWA << TCR_EL1_ORGN0_SHIFT)

#define TCR_ORGN1_MASK		TCR_EL1_ORGN1_MASK
#define TCR_ORGN1_NC		TCR_EL1_ORGN1_NC
#define TCR_ORGN1_WBWA		TCR_EL1_ORGN1_WBWA
#define TCR_ORGN1_WT		TCR_EL1_ORGN1_WT
#define TCR_ORGN1_WBnWA		TCR_EL1_ORGN1_WBnWA

#define TCR_ORGN_NC		(TCR_EL1_ORGN0_NC | TCR_EL1_ORGN1_NC)
#define TCR_ORGN_WT		(TCR_EL1_ORGN0_WT | TCR_EL1_ORGN1_WT)
#define TCR_ORGN_WBnWA		(TCR_EL1_ORGN0_WBnWA | TCR_EL1_ORGN1_WBnWA)
#define TCR_ORGN_MASK		(TCR_EL1_ORGN0_MASK | TCR_EL1_ORGN1_MASK)

#define TCR_SH0_MASK		TCR_EL1_SH0_MASK
#define TCR_SH0_INNER		(TCR_EL1_SH0_INNER << TCR_EL1_SH0_SHIFT)

#define TCR_SH1_MASK		TCR_EL1_SH1_MASK
#define TCR_SH1_INNER		(TCR_EL1_SH1_INNER << TCR_EL1_SH1_SHIFT)

#define TCR_TG0_SHIFT		TCR_EL1_TG0_SHIFT
#define TCR_TG0_MASK		TCR_EL1_TG0_MASK
#define TCR_TG0_4K		(TCR_EL1_TG0_4K << TCR_EL1_TG0_SHIFT)
#define TCR_TG0_64K		(TCR_EL1_TG0_64K << TCR_EL1_TG0_SHIFT)
#define TCR_TG0_16K		(TCR_EL1_TG0_16K << TCR_EL1_TG0_SHIFT)

#define TCR_TG1_SHIFT		TCR_EL1_TG1_SHIFT
#define TCR_TG1_MASK		TCR_EL1_TG1_MASK
#define TCR_TG1_16K		(TCR_EL1_TG1_16K << TCR_EL1_TG1_SHIFT)
#define TCR_TG1_4K		(TCR_EL1_TG1_4K << TCR_EL1_TG1_SHIFT)
#define TCR_TG1_64K		(TCR_EL1_TG1_64K << TCR_EL1_TG1_SHIFT)

#define TCR_IPS_SHIFT		TCR_EL1_IPS_SHIFT
#define TCR_IPS_MASK		TCR_EL1_IPS_MASK
#define TCR_A1			TCR_EL1_A1
#define TCR_ASID16		TCR_EL1_AS
#define TCR_TBI0		TCR_EL1_TBI0
#define TCR_TBI1		TCR_EL1_TBI1
#define TCR_HA			TCR_EL1_HA
#define TCR_HD			TCR_EL1_HD
#define TCR_HPD0		TCR_EL1_HPD0
#define TCR_HPD1		TCR_EL1_HPD1
#define TCR_TBID0		TCR_EL1_TBID0
#define TCR_TBID1		TCR_EL1_TBID1
#define TCR_NFD0		TCR_EL1_NFD0
#define TCR_NFD1		TCR_EL1_NFD1
#define TCR_E0PD0		TCR_EL1_E0PD0
#define TCR_E0PD1		TCR_EL1_E0PD1
#define TCR_TCMA0		TCR_EL1_TCMA0
#define TCR_TCMA1		TCR_EL1_TCMA1
#define TCR_DS			TCR_EL1_DS

