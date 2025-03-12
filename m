Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 033EAC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 21:32:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0jZMHKO18dXTXA4LJuA2uOeEgiBBF4NGlAFfPYSUkIg=; b=VDt/gHTSqAupmWz7YlBBCN2A7j
	Qixzl8KTrt2TRgcuM9dHdUdi6uPQYf0nUYytPKaThQiInOu054NAMGgK2A2k7VQlyw/N/RxvX49Am
	p9L7k2CGSCpmwoQgtfUzHE4uzZHNImsf/rlnZJwRZn8uFd4APQUTFlSfJxi7jQ3RfCF9jkJGrFVN7
	/VJpc59b0x/MWMX9T5TaSq9ma5ajGRMFv8loKTkGo78u5bAxq0GAWfTMFmazb4V81Lf5XqIcORwQy
	itzjwa2Y6zFmxJJT4dHHLWd9OpmsserA9piYuY64xBWJMp+su5uvFcDzQ5ca6oW7g1sOYO8d4udpc
	WYi3Y/0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTgs-00000009YP0-1Fku;
	Wed, 12 Mar 2025 21:32:38 +0000
Received: from linux.microsoft.com ([13.77.154.182])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsTfD-00000009YEx-2OdL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 21:30:56 +0000
Received: from [10.137.184.60] (unknown [131.107.160.188])
	by linux.microsoft.com (Postfix) with ESMTPSA id 56DB7210B15D;
	Wed, 12 Mar 2025 14:30:54 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 56DB7210B15D
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1741815054;
	bh=0jZMHKO18dXTXA4LJuA2uOeEgiBBF4NGlAFfPYSUkIg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jVYXdLGQsYulvVeW8IFJWbnpTdPhO3YkIzVogJSfNX4/5ywy0iqJqge8B5pZ1HaAV
	 Iv100RzYOsmebNCVxD7ORkWEDunwcz/79GyJiqkQhUDuH+nPFal96SJH1Ki4+uRbVB
	 jJP64KqnGyiH4Tkhk5Kk5cE7kjlh3hiRNV9MLqM8=
Message-ID: <3d26e47a-cb42-47f6-a18c-e330ee065a2b@linux.microsoft.com>
Date: Wed, 12 Mar 2025 14:30:54 -0700
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH hyperv-next v5 03/11] Drivers: hv: Enable VTL mode for
 arm64
To: Wei Liu <wei.liu@kernel.org>
Cc: Michael Kelley <mhklinux@outlook.com>, Arnd Bergmann <arnd@arndb.de>,
 "bhelgaas@google.com" <bhelgaas@google.com>, Borislav Petkov <bp@alien8.de>,
 Catalin Marinas <catalin.marinas@arm.com>, Conor Dooley
 <conor+dt@kernel.org>, Dave Hansen <dave.hansen@linux.intel.com>,
 Dexuan Cui <decui@microsoft.com>, Haiyang Zhang <haiyangz@microsoft.com>,
 "H. Peter Anvin" <hpa@zytor.com>, Joey Gouly <joey.gouly@arm.com>,
 "krzk+dt@kernel.org" <krzk+dt@kernel.org>,
 =?UTF-8?Q?Krzysztof_Wilczy=C5=84ski?= <kw@linux.com>,
 "K. Y. Srinivasan" <kys@microsoft.com>, Len Brown <lenb@kernel.org>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Manivannan Sadhasivam <manivannan.sadhasivam@linaro.org>,
 Mark Rutland <mark.rutland@arm.com>, Marc Zyngier <maz@kernel.org>,
 Ingo Molnar <mingo@redhat.com>, Oliver Upton <oliver.upton@linux.dev>,
 "Rafael J . Wysocki" <rafael@kernel.org>, Rob Herring <robh@kernel.org>,
 "ssengar@linux.microsoft.com" <ssengar@linux.microsoft.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Suzuki K Poulose <suzuki.poulose@arm.com>,
 Thomas Gleixner <tglx@linutronix.de>, Will Deacon <will@kernel.org>,
 Zenghui Yu <yuzenghui@huawei.com>,
 "devicetree@vger.kernel.org" <devicetree@vger.kernel.org>,
 "kvmarm@lists.linux.dev" <kvmarm@lists.linux.dev>,
 "linux-acpi@vger.kernel.org" <linux-acpi@vger.kernel.org>,
 Linux-Arch <linux-arch@vger.kernel.org>,
 "linux-arm-kernel@lists.infradead.org"
 <linux-arm-kernel@lists.infradead.org>,
 "linux-hyperv@vger.kernel.org" <linux-hyperv@vger.kernel.org>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-pci@vger.kernel.org" <linux-pci@vger.kernel.org>,
 "x86@kernel.org" <x86@kernel.org>, "apais@microsoft.com"
 <apais@microsoft.com>, "benhill@microsoft.com" <benhill@microsoft.com>,
 "bperkins@microsoft.com" <bperkins@microsoft.com>,
 "sunilmut@microsoft.com" <sunilmut@microsoft.com>
References: <20250307220304.247725-1-romank@linux.microsoft.com>
 <20250307220304.247725-4-romank@linux.microsoft.com>
 <e0f81049-688e-4f53-a002-5d246281bf8d@app.fastmail.com>
 <BN7PR02MB41488C06B7E42830C700318DD4D62@BN7PR02MB4148.namprd02.prod.outlook.com>
 <119cfb59-d68b-4718-b7cb-90cba67827e8@app.fastmail.com>
 <BN7PR02MB4148FC15ADF0E49327262B92D4D62@BN7PR02MB4148.namprd02.prod.outlook.com>
 <caa0d793-3f05-4d7c-88d0-224ec0503cfb@linux.microsoft.com>
 <Z9HvHsGyXDnN38_B@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Content-Language: en-US
From: Roman Kisel <romank@linux.microsoft.com>
In-Reply-To: <Z9HvHsGyXDnN38_B@liuwe-devbox-ubuntu-v2.lamzopl0uupeniq2etz1fddiyg.xx.internal.cloudapp.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_143055_662219_7255C9EE 
X-CRM114-Status: GOOD (  33.20  )
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



On 3/12/2025 1:31 PM, Wei Liu wrote:
> On Wed, Mar 12, 2025 at 11:33:11AM -0700, Roman Kisel wrote:
>>
>>
>> On 3/10/2025 3:18 PM, Michael Kelley wrote:
>>> From: Arnd Bergmann <arnd@arndb.de> Sent: Monday, March 10, 2025 2:21 PM
>>>>
>>>> On Mon, Mar 10, 2025, at 22:01, Michael Kelley wrote:
>>>>> From: Arnd Bergmann <arnd@arndb.de> Sent: Saturday, March 8, 2025 1:05 PM
>>>>>>>    config HYPERV_VTL_MODE
>>>>>>>    	bool "Enable Linux to boot in VTL context"
>>>>>>> -	depends on X86_64 && HYPERV
>>>>>>> +	depends on (X86_64 || ARM64)
>>>>>>>    	depends on SMP
>>>>>>> +	select OF_EARLY_FLATTREE
>>>>>>> +	select OF
>>>>>>>    	default n
>>>>>>>    	help
>>>>>>
>>>>>> Having the dependency below the top-level Kconfig entry feels a little
>>>>>> counterintuitive. You could flip that back as it was before by doing
>>>>>>
>>>>>>         select HYPERV_VTL_MODE if !ACPI
>>>>>>         depends on ACPI || SMP
>>>>>>
>>>>>> in the HYPERV option, leaving the dependency on HYPERV in
>>>>>> HYPERV_VTL_MODE.
>>>>>
>>>>> I would argue that we don't ever want to implicitly select
>>>>> HYPERV_VTL_MODE because of some other config setting or
>>>>> lack thereof.  VTL mode is enough of a special case that it should
>>>>> only be explicitly selected. If someone omits ACPI, then HYPERV
>>>>> should not be selectable unless HYPERV_VTL_MODE is explicitly
>>>>> selected.
>>>>>
>>>>> The last line of the comment for HYPERV_VTL_MODE says
>>>>> "A kernel built with this option must run at VTL2, and will not run
>>>>> as a normal guest."  In other words, don't choose this unless you
>>>>> 100% know that VTL2 is what you want.
>>>>
>>>> It sounds like the latter is the real problem: enabling a feature
>>>> should never prevent something else from working. Can you describe
>>>> what VTL context is and why it requires an exception to a rather
>>>> fundamental rule here? If you build a kernel that runs on every
>>>> single piece of arm64 hardware and every hypervisor, why can't
>>>> you add HYPERV_VTL_MODE to that as an option?
>>>>
>>
>> In the VTL mode, we're running the kernel as secure firmware inside the
>> guest (one might see VTL2 working as Intel SMM or Secure World on ARM).
>>
>> [...]
>>
>>>
>>> Ideally, a Linux kernel image could detect at runtime what VTL it is
>>> running at, and "do the right thing". Unfortunately, on x86 Linux this
>>> has proved difficult (or perhaps impossible) because the amount of
>>> boot-time setup required to ask the question about the current VTL
>>> is significant. The idiosyncrasies and historical baggage of x86 requires
>>> that Linux do some x86-specific initialization steps for VTL > 0
>>> before the question can be asked. Hence the introduction of
>>> CONFIG_HYPERV_VTL_MODE, and the behavior that when it is
>>> selected, the kernel image won't run normally in VTL 0.
>>>
>>> I'll go out on a limb and say that I suspect on arm64 a runtime
>>> determination based on querying the VTL *could* be made (though
>>> I'm not the person writing the code). But taking advantage of that
>>> on arm64 produces an undesirable dichotomy with x86.
>>
>> On arm64 that is much easier, I agree. On x86 we'd need a kludge of
>>
>> static void __naked __init __aligned(4096) early_hvcall_pg(void)
>> {
>> 	/*
>> 	 * Fill the early hvcall page with `0xF1` aka `INT1` to catch
>> 	 * programming errors. The hypervisor will overlay the page with
>> 	 * the vendor-specific code sequences to make hypercalls on x86(_64).
>> 	 */
>> 	asm (".skip 4096, 0xf1");
>> }
>>
>> static u8 __init early_hvcall_pg_input[4096] __attribute__((aligned(4096)));
>> static u8 __init early_hvcall_pg_output[4096]
>> __attribute__((aligned(4096)));
>>
>> static void __init early_connect_to_hv(void)
>> {
>> 	union hv_x64_msr_hypercall_contents hypercall_msr;
>> 	u64 guest_id;
>>
>> 	guest_id = hv_generate_guest_id(LINUX_VERSION_CODE);
>> 	wrmsrl(HV_X64_MSR_GUEST_OS_ID, guest_id);
>> 	rdmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>> 	hypercall_msr.enable = 1;
>> 	hypercall_msr.guest_physical_address =
>> __phys_to_pfn(virt_to_phys(early_hvcall_pg));
>> 	wrmsrl(HV_X64_MSR_HYPERCALL, hypercall_msr.as_uint64);
>> }
>>
>> or variations thereof.
> 
> OT here but what's stopping us from doing this on x86?
> 

At the first glance, seems like nothing I think. For the conf scenarios
like TDX and SEV-SNP, due to the early hvcall I/O pages above allocated
in BSS, might need to mark the pages as decrypted and zero them out so
they look like proper BSS section (the page contents are scrambled after
flipping the page encryption bit iirc).

> It seems to me there is some value in setting up the hypercall page as
> early as possible. The same page can be used through the lifetime of the
> partition. The early input and output pages should be reclaimed.
> 

Wholeheartedly agree!

> Also, since the hypervisor will insert an overlay page, it makes sense
> to not allocate a page from Linux at all. When I ported Xen to run as
> a guest on Hyper-V, I used that approach. The setup worked just fine.
> 
> All being said, things work today, so I'm in no hurry to change things.
> 

I'll try fleshing this out soon-ish if no one beats me to that :)

> Wei.

-- 
Thank you,
Roman


