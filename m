Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3668DF588E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:24:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w4/gdDUDWYUob1ngGbDVxqxNgGl8EDQI0dPMkkvkH2I=; b=1pknTVcuXXp2I43LtGfnQzBpC3
	JAk8jqktpINgD/dXLSz1EmsN11qbwd4jDP/MJlG1KFvaR+auACik4MYTTx2G5q1cJjGei0w3Dwada
	Tv+rmOwvPS7ETHz2uUtndbJrQZIZ9/JwM4mJ7ZxOFmPjXWl61xZUpuf9czLW0E6+WF7CnpExwXbc4
	kjm0H/7NaNFNIj1eh82guGhNG2z02egDvT7kz68BBY3kWWrj3/F7K8aVfyP34Mp3+/AUbwNz7Gaja
	H4eaZ9Z94GnDdF21DnniEXb6ql+2iYAwojpfPsBilU1kMWBjVjevh1oQO+sfHCl5p2D0BbvnUF4Sa
	M4QjelBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqU1-00000007FKS-19da;
	Mon, 20 Apr 2026 15:24:21 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqTy-00000007FJ7-3gcs;
	Mon, 20 Apr 2026 15:24:20 +0000
Received: from [100.79.96.139] (unknown [4.194.122.170])
	by linux.microsoft.com (Postfix) with ESMTPSA id BBE0220B6F08;
	Mon, 20 Apr 2026 08:24:07 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com BBE0220B6F08
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1776698657;
	bh=w4/gdDUDWYUob1ngGbDVxqxNgGl8EDQI0dPMkkvkH2I=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Gc+2WE/eO+xkaQbw1qp8fgMEoA3jNGlJO6G4ofFU2lSmXj7NJoZK6YZ+uwr2ggthz
	 own7HXfhLWSx0Gp65Uc7hwhtUsdafZywcOgz9efHgJYLtd7EfBoKNz00YBahTEHbIA
	 6GHxdYpdpwGOY4q+UtSSf9iw+hlggFkYVxMtd9TU=
Message-ID: <1407300a-83a2-41d3-a33b-e91d3178b0a2@linux.microsoft.com>
Date: Mon, 20 Apr 2026 20:54:04 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 10/11] Drivers: hv: Add support for arm64 in MSHV_VTL
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
 mrigendrachaubey <mrigendra.chaubey@gmail.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-riscv@lists.infradead.org" <linux-riscv@lists.infradead.org>
References: <20260316121241.910764-1-namjain@linux.microsoft.com>
 <20260316121241.910764-11-namjain@linux.microsoft.com>
 <SN6PR02MB41576766C5FB291952CC58E8D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41576766C5FB291952CC58E8D450A@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_082419_036336_5120CDD0 
X-CRM114-Status: GOOD (  25.83  )
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



On 4/1/2026 10:28 PM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Monday, March 16, 2026 5:13 AM
>>
>> Add necessary support to make MSHV_VTL work for arm64 architecture.
>> * Add stub implementation for mshv_vtl_return_call_init(): not required
>>    for arm64
>> * Remove fpu/legacy.h header inclusion, as this is not required
>> * handle HV_REGISTER_VSM_CODE_PAGE_OFFSETS register: not supported
>>    in arm64
>> * Configure custom percpu_vmbus_handler by using
>>    hv_setup_percpu_vmbus_handler()
>> * Handle hugepage functions by config checks
>>
>> Signed-off-by: Roman Kisel <romank@linux.microsoft.com>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>>   arch/arm64/include/asm/mshyperv.h |  2 ++
>>   drivers/hv/mshv_vtl_main.c        | 21 ++++++++++++++-------
>>   2 files changed, 16 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/include/asm/mshyperv.h
>> b/arch/arm64/include/asm/mshyperv.h
>> index 36803f0386cc..027a7f062d70 100644
>> --- a/arch/arm64/include/asm/mshyperv.h
>> +++ b/arch/arm64/include/asm/mshyperv.h
>> @@ -83,6 +83,8 @@ static inline int hv_vtl_get_set_reg(struct hv_register_assoc *regs, bool set, u
>>   	return 1;
>>   }
>>
>> +static inline void mshv_vtl_return_call_init(u64 vtl_return_offset) {}
>> +
>>   void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>>   bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu);
>>   #endif
>> diff --git a/drivers/hv/mshv_vtl_main.c b/drivers/hv/mshv_vtl_main.c
>> index 4c9ae65ad3e8..5702fe258500 100644
>> --- a/drivers/hv/mshv_vtl_main.c
>> +++ b/drivers/hv/mshv_vtl_main.c
>> @@ -23,8 +23,6 @@
>>   #include <trace/events/ipi.h>
>>   #include <uapi/linux/mshv.h>
>>   #include <hyperv/hvhdk.h>
>> -
>> -#include "../../kernel/fpu/legacy.h"
> 
> Was there a particular code change that made this unnecessary? Or was it
> unnecessary from the start of this source code file? Just curious ....

This was present in initial driver changes when the assembly code was 
part of this driver. Then it moved to arch files and this was left here.
Just cleaning it up.


> 
>>   #include "mshv.h"
>>   #include "mshv_vtl.h"
>>   #include "hyperv_vmbus.h"
>> @@ -206,18 +204,21 @@ static void mshv_vtl_synic_enable_regs(unsigned int cpu)
>>   static int mshv_vtl_get_vsm_regs(void)
>>   {
>>   	struct hv_register_assoc registers[2];
>> -	int ret, count = 2;
>> +	int ret, count = 0;
>>
>> -	registers[0].name = HV_REGISTER_VSM_CODE_PAGE_OFFSETS;
>> -	registers[1].name = HV_REGISTER_VSM_CAPABILITIES;
>> +	registers[count++].name = HV_REGISTER_VSM_CAPABILITIES;
>> +	/* Code page offset register is not supported on ARM */
>> +	if (IS_ENABLED(CONFIG_X86_64))
>> +		registers[count++].name = HV_REGISTER_VSM_CODE_PAGE_OFFSETS;
>>
>>   	ret = hv_call_get_vp_registers(HV_VP_INDEX_SELF, HV_PARTITION_ID_SELF,
>>   				       count, input_vtl_zero, registers);
>>   	if (ret)
>>   		return ret;
>>
>> -	mshv_vsm_page_offsets.as_uint64 = registers[0].value.reg64;
>> -	mshv_vsm_capabilities.as_uint64 = registers[1].value.reg64;
>> +	mshv_vsm_capabilities.as_uint64 = registers[0].value.reg64;
>> +	if (IS_ENABLED(CONFIG_X86_64))
>> +		mshv_vsm_page_offsets.as_uint64 = registers[1].value.reg64;
>>
>>   	return ret;
>>   }
> 
> This function has gotten somewhat messy to handle the x86 and arm64
> differences. Let me suggest a different approach. Have this function only
> get the VSM capabilities register, as that is generic across x86 and
> arm64. Then, update x86 mshv_vtl_return_call_init() to get the
> PAGE_OFFSETS register and then immediately use the value to update
> the static call. The global variable mshv_vms_page_offsets is no longer
> necessary.
> 
> My suggestion might be little more code because hv_call_get_vp_registers()
> is invoked in two different places. But it cleanly separates the two use
> cases, and keeps the x86 hackery under arch/x86.
> 

I implemented this in my dev branch, and it works fine. Thanks for the 
suggestion.


>> @@ -280,10 +281,13 @@ static int hv_vtl_setup_synic(void)
>>
>>   	/* Use our isr to first filter out packets destined for userspace */
>>   	hv_setup_vmbus_handler(mshv_vtl_vmbus_isr);
>> +	/* hv_setup_vmbus_handler() is stubbed for ARM64, add per-cpu VMBus handlers instead */
>> +	hv_setup_percpu_vmbus_handler(mshv_vtl_vmbus_isr);
>>
>>   	ret = cpuhp_setup_state(CPUHP_AP_ONLINE_DYN, "hyperv/vtl:online",
>>   				mshv_vtl_alloc_context, NULL);
>>   	if (ret < 0) {
>> +		hv_setup_percpu_vmbus_handler(vmbus_isr);
>>   		hv_setup_vmbus_handler(vmbus_isr);
>>   		return ret;
>>   	}
>> @@ -296,6 +300,7 @@ static int hv_vtl_setup_synic(void)
>>   static void hv_vtl_remove_synic(void)
>>   {
>>   	cpuhp_remove_state(mshv_vtl_cpuhp_online);
>> +	hv_setup_percpu_vmbus_handler(vmbus_isr);

hv_setup_percpu_vmbus_handler() calls will also be removed with the 
redesign.

Regards,
Naman

