Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D003DFF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:57:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QgIpyU8QZGJkXf492lXwNUttCaD3J45IhKenqaCb8JU=; b=uVS1dO1IWoLPhFIrzKfdqn23/4
	age9laFBoxsvdVcTsXgq2Nv/jvJ/xsZa0ygtNF6TXRFlJM14FU1cDpiE9sRyB7xNLY0OelluHz6d7
	vemlcNwUMmvNMCiURrW0DcEY9CuYL29bLs9XNlq254xyoA4qvq9sPBSe5a7oyuIG1uPwSLUetO5xk
	neBEYXJMtX2N1vJOjSf8XX2LAaiGx0O/EHO0LjVC7J/5qyeB96vRwD8OmNQcOMIWuVARS7058Safx
	llg9nafh+yAwTG+XmJTDy6PhTKs9fxkPazop/R+4O9k4s6LYg96wm8Cyg2H03SyMHF0oBELAlhPT0
	D0X5bSbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1f8-00000003Ovj-0CmK;
	Wed, 29 Apr 2026 09:56:58 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1f6-00000003Ouw-0o20;
	Wed, 29 Apr 2026 09:56:57 +0000
Received: from [10.95.65.160] (unknown [167.220.238.0])
	by linux.microsoft.com (Postfix) with ESMTPSA id 022BB20B716D;
	Wed, 29 Apr 2026 02:56:47 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 022BB20B716D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1777456615;
	bh=QgIpyU8QZGJkXf492lXwNUttCaD3J45IhKenqaCb8JU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=j3t1KqCo0xfeLFi9dtOHcVl1enYVvkTTCWZf/S6+1njDs+5WLIKxyCr+MaZT+dX6s
	 1GtfPpoCrizCdwBgAuRmIgUqS6cRpZ84PZrt9W+C1tH19AeqXBBCOSZB5ScCq91arB
	 2ycNK80H4Ji9sx2/5Zebo999PZQBXpkGPAZqdQ58=
Message-ID: <516a4e65-3a4d-4e09-b445-28cb740b5653@linux.microsoft.com>
Date: Wed, 29 Apr 2026 15:26:43 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 07/15] arm64: hyperv: Add support for
 mshv_vtl_return_call
To: Michael Kelley <mhklinux@outlook.com>,
 "K . Y . Srinivasan" <kys@microsoft.com>,
 Haiyang Zhang <haiyangz@microsoft.com>, Wei Liu <wei.liu@kernel.org>,
 Dexuan Cui <decui@microsoft.com>, Long Li <longli@microsoft.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Thomas Gleixner <tglx@kernel.org>, Ingo Molnar <mingo@redhat.com>,
 Borislav Petkov <bp@alien8.de>, Dave Hansen <dave.hansen@linux.intel.com>,
 "x86@kernel.org" <x86@kernel.org>, "H . Peter Anvin" <hpa@zytor.com>,
 Arnd Bergmann <arnd@arndb.de>, Paul Walmsley <pjw@kernel.org>,
 Palmer Dabbelt <palmer@dabbelt.com>, Albert Ou <aou@eecs.berkeley.edu>,
 Alexandre Ghiti <alex@ghiti.fr>
Cc: Marc Zyngier <maz@kernel.org>, Timothy Hayes <timothy.hayes@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Sascha Bischoff <sascha.bischoff@arm.com>,
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>,
 "vdso@mailbox.org" <vdso@mailbox.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>
References: <20260423124206.2410879-1-namjain@linux.microsoft.com>
 <20260423124206.2410879-8-namjain@linux.microsoft.com>
 <SN6PR02MB4157C147A1B915F9B45D3B74D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157C147A1B915F9B45D3B74D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_025656_262451_65193889 
X-CRM114-Status: GOOD (  23.15  )
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



On 4/27/2026 11:08 AM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, April 23, 2026 5:42 AM
>>
>> Add the arm64 variant of mshv_vtl_return_call() to support the MSHV_VTL
>> driver on arm64. This function enables the transition between Virtual
>> Trust Levels (VTLs) in MSHV_VTL when the kernel acts as a paravisor.
>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> Reviewed-by: Roman Kisel <vdso@mailbox.org>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>>   arch/arm64/hyperv/Makefile        |   1 +
>>   arch/arm64/hyperv/hv_vtl.c        | 158 ++++++++++++++++++++++++++++++
>>   arch/arm64/include/asm/mshyperv.h |  13 +++
>>   arch/x86/include/asm/mshyperv.h   |   2 -
>>   drivers/hv/mshv_vtl.h             |   3 +
>>   include/asm-generic/mshyperv.h    |   2 +
>>   6 files changed, 177 insertions(+), 2 deletions(-)
>>   create mode 100644 arch/arm64/hyperv/hv_vtl.c
>>
> 
> [snip]
> 
>> diff --git a/arch/arm64/include/asm/mshyperv.h b/arch/arm64/include/asm/mshyperv.h
>> index 585b23a26f1b..9eb0e5999f29 100644
>> --- a/arch/arm64/include/asm/mshyperv.h
>> +++ b/arch/arm64/include/asm/mshyperv.h
>> @@ -60,6 +60,18 @@ static inline u64 hv_get_non_nested_msr(unsigned int reg)
>>   				ARM_SMCCC_SMC_64,		\
>>   				ARM_SMCCC_OWNER_VENDOR_HYP,	\
>>   				HV_SMCCC_FUNC_NUMBER)
>> +
>> +struct mshv_vtl_cpu_context {
>> +/*
>> + * x18 is managed by the hypervisor. It won't be reloaded from this array.
>> + * It is included here for convenience in array indexing.
>> + * 'rsvd' field serves as alignment padding so q[] starts at offset 32*8=256.
>> + */
>> +	__u64 x[31];
>> +	__u64 rsvd;
>> +	__uint128_t q[32];
>> +};
>> +
>>   #ifdef CONFIG_HYPERV_VTL_MODE
>>   /*
>>    * Get/Set the register. If the function returns `1`, that must be done via
>> @@ -69,6 +81,7 @@ static inline int hv_vtl_get_set_reg(struct hv_register_assoc *regs,
>> bool set, b
>>   {
>>   	return 1;
>>   }
>> +
> 
> This appears to be a spurious blank line being added since there
> are no other changes in the vicinity.

Acked.

> 
>>   #endif
>>
>>   #include <asm-generic/mshyperv.h>
>> diff --git a/arch/x86/include/asm/mshyperv.h b/arch/x86/include/asm/mshyperv.h
>> index 08278547b84c..b4d80c9a673a 100644
>> --- a/arch/x86/include/asm/mshyperv.h
>> +++ b/arch/x86/include/asm/mshyperv.h
>> @@ -286,7 +286,6 @@ struct mshv_vtl_cpu_context {
>>   #ifdef CONFIG_HYPERV_VTL_MODE
>>   void __init hv_vtl_init_platform(void);
>>   int __init hv_vtl_early_init(void);
>> -void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>>   void mshv_vtl_return_call_init(u64 vtl_return_offset);
>>   void mshv_vtl_return_hypercall(void);
>>   void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>> @@ -294,7 +293,6 @@ int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set,
>> bool shared);
>>   #else
>>   static inline void __init hv_vtl_init_platform(void) {}
>>   static inline int __init hv_vtl_early_init(void) { return 0; }
>> -static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
>>   static inline void mshv_vtl_return_call_init(u64 vtl_return_offset) {}
>>   static inline void mshv_vtl_return_hypercall(void) {}
>>   static inline void __mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
>> diff --git a/drivers/hv/mshv_vtl.h b/drivers/hv/mshv_vtl.h
>> index a6eea52f7aa2..103f07371f3f 100644
>> --- a/drivers/hv/mshv_vtl.h
>> +++ b/drivers/hv/mshv_vtl.h
>> @@ -22,4 +22,7 @@ struct mshv_vtl_run {
>>   	char vtl_ret_actions[MSHV_MAX_RUN_MSG_SIZE];
>>   };
>>
>> +static_assert(sizeof(struct mshv_vtl_cpu_context) <= 1024,
>> +	      "struct mshv_vtl_cpu_context exceeds reserved space in struct
>> mshv_vtl_run");
>> +
>>   #endif /* _MSHV_VTL_H */
>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>> index db183c8cfb95..8cdf2a9fbdfb 100644
>> --- a/include/asm-generic/mshyperv.h
>> +++ b/include/asm-generic/mshyperv.h
>> @@ -396,8 +396,10 @@ static inline int hv_deposit_memory(u64 partition_id, u64 status)
>>
>>   #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
>>   u8 __init get_vtl(void);
>> +void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>>   #else
>>   static inline u8 get_vtl(void) { return 0; }
>> +static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
> 
> Is this stub needed? Maybe I missed something, but it looks to me like none
> of the code that calls this gets built unless CONFIG_HYPERV_VTL_MODE is set.
> See further comments about stubs in Patch 8 of this series.
> 

Config dependencies would handle such cases, and this is not required. I 
saw similar stubs added in the code, so I thought this is a norm that 
should be followed, and not rely on config dependencies.
I can remove it.

Regards,
Naman


