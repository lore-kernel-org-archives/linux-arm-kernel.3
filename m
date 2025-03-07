Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B0D6C28B28
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Mar 2025 21:39:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AQn5ANn8sPdQThZDb40ZlQuiCV58eIp0gfyjJ434Q7Y=; b=cbF3fKIpiJfsBPcvpWlPQaLBZd
	mLGurikssCBnA11g+2859EJ2QeaICYmuhoPFCUbGnCkbNrqyCawVfhH98SW4m6NfSklZzmBc1soDh
	4vn43cXJ/DElEH1A69txn08d0aNoDnTLZFMOkwhA8885lrA7C1ZrrvkTQTUDaK3cdmHnEwXNs8o8A
	aXfde2mhUSFslmvBhkwd3Bfq0o039COu0fkl992wpMI6TR6UBDsyzFqNYRUe77o5koRVw1JekMMvP
	juee/4HQzx9B7sbfz7hVX9EHVjOaVCDPC1FMgEeQanU6ec+IUa1/TpgGZArtAM21cqMgFWIyrf81d
	0IhtU1zQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfP7-0000000Fai7-00ob;
	Fri, 07 Mar 2025 21:38:49 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqfNU-0000000FaRI-2c8Z
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Mar 2025 21:37:09 +0000
Received: from [10.0.0.114] (c-67-182-156-199.hsd1.wa.comcast.net [67.182.156.199])
	by linux.microsoft.com (Postfix) with ESMTPSA id 0A4072038F3B;
	Fri,  7 Mar 2025 13:37:06 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 0A4072038F3B
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741383426;
	bh=AQn5ANn8sPdQThZDb40ZlQuiCV58eIp0gfyjJ434Q7Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=ri9FeBsdG2ROc74ZZVyndfL8/sgWlsUjKGFmQR0ft2q7cEBE5djWuwF6Ww5NkMOaa
	 O8OXBrORBWvVyXpqCzrNeWmckkZbq8mL9EZ0fXEJd47nUue5TWp9E35X5SwB6miF2f
	 CGgKsRXHGQy2tjtOS98IBThSjmzM1p9VmGwbcf0U=
Message-ID: <7f689725-f676-4465-974d-ca2477d445f7@linux.microsoft.com>
Date: Fri, 7 Mar 2025 13:36:48 -0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 03/10] arm64/hyperv: Add some missing functions to
 arm64
To: Michael Kelley <mhklinux@outlook.com>,
 Easwar Hariharan <eahariha@linux.microsoft.com>
Cc: "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-arch@vger.kernel.org" <linux-arch@vger.kernel.org>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 "kys@microsoft.com" <kys@microsoft.com>,
 "haiyangz@microsoft.com" <haiyangz@microsoft.com>,
 "wei.liu@kernel.org" <wei.liu@kernel.org>,
 "decui@microsoft.com" <decui@microsoft.com>,
 "catalin.marinas@arm.com" <catalin.marinas@arm.com>,
 "will@kernel.org" <will@kernel.org>, "tglx@linutronix.de"
 <tglx@linutronix.de>, "mingo@redhat.com" <mingo@redhat.com>,
 "bp@alien8.de" <bp@alien8.de>,
 "dave.hansen@linux.intel.com" <dave.hansen@linux.intel.com>,
 "hpa@zytor.com" <hpa@zytor.com>,
 "daniel.lezcano@linaro.org" <daniel.lezcano@linaro.org>,
 "joro@8bytes.org" <joro@8bytes.org>,
 "robin.murphy@arm.com" <robin.murphy@arm.com>, "arnd@arndb.de"
 <arnd@arndb.de>,
 "jinankjain@linux.microsoft.com" <jinankjain@linux.microsoft.com>,
 "muminulrussell@gmail.com" <muminulrussell@gmail.com>,
 "skinsburskii@linux.microsoft.com" <skinsburskii@linux.microsoft.com>,
 "mrathor@linux.microsoft.com" <mrathor@linux.microsoft.com>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 "apais@linux.microsoft.com" <apais@linux.microsoft.com>,
 "Tianyu.Lan@microsoft.com" <Tianyu.Lan@microsoft.com>,
 "stanislav.kinsburskiy@gmail.com" <stanislav.kinsburskiy@gmail.com>,
 "gregkh@linuxfoundation.org" <gregkh@linuxfoundation.org>,
 "vkuznets@redhat.com" <vkuznets@redhat.com>,
 "prapal@linux.microsoft.com" <prapal@linux.microsoft.com>,
 "muislam@microsoft.com" <muislam@microsoft.com>,
 "anrayabh@linux.microsoft.com" <anrayabh@linux.microsoft.com>,
 "rafael@kernel.org" <rafael@kernel.org>, "lenb@kernel.org"
 <lenb@kernel.org>, "corbet@lwn.net" <corbet@lwn.net>
References: <1740611284-27506-1-git-send-email-nunodasneves@linux.microsoft.com>
 <1740611284-27506-4-git-send-email-nunodasneves@linux.microsoft.com>
 <5f3d660d-fe2e-4ac1-94a7-66d6c8ffe579@linux.microsoft.com>
 <2fee888a-4f81-40aa-9545-617a49a7fb30@linux.microsoft.com>
 <SN6PR02MB41579F4147561B96A2C1C057D4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Nuno Das Neves <nunodasneves@linux.microsoft.com>
In-Reply-To: <SN6PR02MB41579F4147561B96A2C1C057D4CA2@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250307_133708_720001_9DBA98CE 
X-CRM114-Status: GOOD (  26.81  )
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

On 3/6/2025 11:05 AM, Michael Kelley wrote:
> From: Nuno Das Neves <nunodasneves@linux.microsoft.com> Sent: Thursday, February 27, 2025 4:21 PM
>>
>> On 2/26/2025 9:56 PM, Easwar Hariharan wrote:
>>> On 2/26/2025 3:07 PM, Nuno Das Neves wrote:
>>>> These non-nested msr and fast hypercall functions are present in x86,
>>>> but they must be available in both architetures for the root partition
>>>
>>> nit: *architectures*
>>>
>>>
>> Thanks!
>>
>>>> driver code.
>>>>
>>>> Signed-off-by: Nuno Das Neves <nunodasneves@linux.microsoft.com>
>>>> ---
>>>>  arch/arm64/hyperv/hv_core.c       | 17 +++++++++++++++++
>>>>  arch/arm64/include/asm/mshyperv.h | 12 ++++++++++++
>>>>  include/asm-generic/mshyperv.h    |  2 ++
>>>>  3 files changed, 31 insertions(+)
>>>>
>>>> diff --git a/arch/arm64/hyperv/hv_core.c b/arch/arm64/hyperv/hv_core.c
>>>> index 69004f619c57..e33a9e3c366a 100644
>>>> --- a/arch/arm64/hyperv/hv_core.c
>>>> +++ b/arch/arm64/hyperv/hv_core.c
>>>> @@ -53,6 +53,23 @@ u64 hv_do_fast_hypercall8(u16 code, u64 input)
>>>>  }
>>>>  EXPORT_SYMBOL_GPL(hv_do_fast_hypercall8);
>>>>
>>>> +/*
>>>> + * hv_do_fast_hypercall16 -- Invoke the specified hypercall
>>>> + * with arguments in registers instead of physical memory.
>>>> + * Avoids the overhead of virt_to_phys for simple hypercalls.
>>>> + */
>>>> +u64 hv_do_fast_hypercall16(u16 code, u64 input1, u64 input2)
>>>> +{
>>>> +	struct arm_smccc_res	res;
>>>> +	u64			control;
>>>> +
>>>> +	control = (u64)code | HV_HYPERCALL_FAST_BIT;
>>>> +
>>>> +	arm_smccc_1_1_hvc(HV_FUNC_ID, control, input1, input2, &res);
>>>> +	return res.a0;
>>>> +}
>>>> +EXPORT_SYMBOL_GPL(hv_do_fast_hypercall16);
>>>> +
>>>
>>> I'd like this to have been in arch/arm64/include/asm/mshyperv.h like its x86
>>> counterpart, but that's just my personal liking of symmetry. I see why it's here
>>> with its slow and 8-byte brethren.
>>>
>> Good point, I don't see a good reason this can't be in the header.
> 
> I was trying to remember if there was some reason I originally put
> hv_do_hypercall() and hv_do_fast_hypercall8() in the .c file instead of
> the header like on x86. But I don't remember a reason. During
> development, the code changed several times, and there might have
> been a reason that didn't persistent in the version that was finally
> accepted upstream.
> 
> My only comment is that hv_do_hypercall() and the 8 and 16 "fast"
> versions should probably stay together one place on the arm64 side,
> even if it doesn't match x86.
> 

I think I'll just keep them together here for now then. They
could be moved to the header in future if it seems worth doing.

>>
>>>>  /*
>>>>   * Set a single VP register to a 64-bit value.
>>>>   */
>>>> diff --git a/arch/arm64/include/asm/mshyperv.h
>> b/arch/arm64/include/asm/mshyperv.h
>>>> index 2e2f83bafcfb..2a900ba00622 100644
>>>> --- a/arch/arm64/include/asm/mshyperv.h
>>>> +++ b/arch/arm64/include/asm/mshyperv.h
>>>> @@ -40,6 +40,18 @@ static inline u64 hv_get_msr(unsigned int reg)
>>>>  	return hv_get_vpreg(reg);
>>>>  }
>>>>
>>>> +/*
>>>> + * Nested is not supported on arm64
>>>> + */
>>>> +static inline void hv_set_non_nested_msr(unsigned int reg, u64 value)
>>>> +{
>>>> +	hv_set_msr(reg, value);
>>>> +}
>>>
>>> empty line preferred here, also reported by checkpatch
>>>
>> Good point, missed that one...
>>
>>>> +static inline u64 hv_get_non_nested_msr(unsigned int reg)
>>>> +{
>>>> +	return hv_get_msr(reg);
>>>> +}
>>>> +
>>>>  /* SMCCC hypercall parameters */
>>>>  #define HV_SMCCC_FUNC_NUMBER	1
>>>>  #define HV_FUNC_ID	ARM_SMCCC_CALL_VAL(			\
>>>> diff --git a/include/asm-generic/mshyperv.h b/include/asm-generic/mshyperv.h
>>>> index c020d5d0ec2a..258034dfd829 100644
>>>> --- a/include/asm-generic/mshyperv.h
>>>> +++ b/include/asm-generic/mshyperv.h
>>>> @@ -72,6 +72,8 @@ extern void * __percpu *hyperv_pcpu_output_arg;
>>>>
>>>>  extern u64 hv_do_hypercall(u64 control, void *inputaddr, void *outputaddr);
>>>>  extern u64 hv_do_fast_hypercall8(u16 control, u64 input8);
>>>> +extern u64 hv_do_fast_hypercall16(u16 control, u64 input1, u64 input2);
>>>> +
>>>
>>> checkpatch warns against putting externs in header files, and FWIW, if
>> hv_do_fast_hypercall16()
>>> for arm64 were in arch/arm64/include/asm/mshyperv.h like its x86 counterpart, you
>> probably
>>> wouldn't need this?
>>>
>> Yes I wondered about that warning. That's true, if I just put it in the arm64 header
>> then this won't be needed at all, so I might just do that!
> 
> I always thought the checkpatch warning was simply that "extern" on a function
> declaration is superfluous. You can omit "extern" and nothing changes. Of
> course, the same is not true for data items.
> Good point, I think I'll clean up these "extern"s in the next version.

Nuno

> Michael
> 
>>
>>>>  bool hv_isolation_type_snp(void);
>>>>  bool hv_isolation_type_tdx(void);
>>>>
> 


