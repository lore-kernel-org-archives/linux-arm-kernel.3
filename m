Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FD57FF8875
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Apr 2026 09:58:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=glqfSPnZSBsC5GJM5wPOsyYjmETqsJsgYXJ3trO0o1Y=; b=Rp+710jgTPd3I2kQ9RwCpthdH0
	CvXoyFcRoGX3buRQ/a8UNHYCiJHFtHMSWk0qSycxqzVUjNDY1GcuICZQ7haqrIAe0TBA0yLOTBNfy
	l4pWsBS1jj18lVbMPHLrzn+UePW/+s5Hj4AO2si9Kk03TRDvyTKX92sHwfcmTG9N972vjGFxTKVDm
	Y/PSY2czt9sDxe8unpCo2ksCCbYTfoV6PNcTWz/TOQCsgUXl7yV0orUTW51AwU4qB3+6E+qE6NyOS
	KyMFryfiVP6wmnkoRl98K5Nlq651KNznDw4aSxxOg2L/PSceZMfysqr3qtwVSdehtMtqe5BHLKbf3
	Nx1FOWsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1gG-00000003PLC-0hwx;
	Wed, 29 Apr 2026 09:58:08 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1gC-00000003PK5-3r8j;
	Wed, 29 Apr 2026 09:58:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=glqfSPnZSBsC5GJM5wPOsyYjmETqsJsgYXJ3trO0o1Y=; b=MdgYJ2OnLLj9nuaaQwOR8k140y
	Fj3w9qhHcRuSowhlPOw2Qd9D4xIstpAJlNEV4EtcOn+9iCbNJpUc4Nn1fSVq0R0cBpxoBmAUZ8vHB
	/8v5ArgYn3WHBhK8K26bDzmTGJMXViqaDtwPsVjvktrUSVmSJpiREX9KaYviP3jSCvQCg/Vsbjidl
	e5hsHjBShvBbDRltgJ/J0bvO4VbGHSUby7KIM9Y+J4sRq3Ge85zVOuoiAXLa/uyX5u+vzftCDBW1w
	D/kXyCwbhnDLzphCFWdEzLjjnLkayIaX+MJ+b1eSLCScYjVN5BlJtVN/1ywqJXAM69OaA8wqk/bOW
	y0A/fR3g==;
Received: from linux.microsoft.com ([13.77.154.182])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wI1g9-000000052pj-2cLV;
	Wed, 29 Apr 2026 09:58:03 +0000
Received: from [10.95.65.160] (unknown [167.220.238.0])
	by linux.microsoft.com (Postfix) with ESMTPSA id AAA8120B716C;
	Wed, 29 Apr 2026 02:57:53 -0700 (PDT)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com AAA8120B716C
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1777456680;
	bh=glqfSPnZSBsC5GJM5wPOsyYjmETqsJsgYXJ3trO0o1Y=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=DwwTmFw8lT7PO8/kvWlFCX434M1go88YAYUFiOB7xJ1F+kocEhvrlQaUtuLbFgsgs
	 qpczmKHfDoN6xdxyX2dSLL7A3qYuWuJopov32H33TocopnxktApYAXXhDjaAJcsMV+
	 D/AJqX3CMxDfu3j87LG09egBB30+fv785wOjDaK0=
Message-ID: <567cf73b-6a48-4fc3-b312-9be6d71e2f22@linux.microsoft.com>
Date: Wed, 29 Apr 2026 15:27:49 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/15] Drivers: hv: mshv_vtl: Move
 hv_vtl_configure_reg_page() to x86
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
 <20260423124206.2410879-10-namjain@linux.microsoft.com>
 <SN6PR02MB4157467FDBC0203C67A67042D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Language: en-US
From: Naman Jain <namjain@linux.microsoft.com>
In-Reply-To: <SN6PR02MB4157467FDBC0203C67A67042D4362@SN6PR02MB4157.namprd02.prod.outlook.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260429_105801_951232_01398034 
X-CRM114-Status: GOOD (  22.99  )
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



On 4/27/2026 11:10 AM, Michael Kelley wrote:
> From: Naman Jain <namjain@linux.microsoft.com> Sent: Thursday, April 23, 2026 5:42 AM
>>
>> Move hv_vtl_configure_reg_page() from drivers/hv/mshv_vtl_main.c to
>> arch/x86/hyperv/hv_vtl.c. The register page overlay is an x86-specific
>> feature that uses HV_X64_REGISTER_REG_PAGE, so its configuration belongs
>> in architecture-specific code.
>>
>> Move struct mshv_vtl_per_cpu and union hv_synic_overlay_page_msr to
>> include/asm-generic/mshyperv.h so they are visible to both arch and
>> driver code.
>>
>> Change the return type from void to bool so the caller can determine
>> whether the register page was successfully configured and set
>> mshv_has_reg_page accordingly.
>>
>> Signed-off-by: Naman Jain <namjain@linux.microsoft.com>
>> ---
>>   arch/x86/hyperv/hv_vtl.c       | 32 ++++++++++++++++++++++
>>   drivers/hv/mshv_vtl_main.c     | 49 +++-------------------------------
>>   include/asm-generic/mshyperv.h | 17 ++++++++++++
>>   3 files changed, 53 insertions(+), 45 deletions(-)
>>

<snip>

>>   #if IS_ENABLED(CONFIG_HYPERV_VTL_MODE)
>> +/* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */
> 
> This comment pre-dates your patch, but I don't understand the point
> it is trying to make. The comment is factually true, but I don't know
> why calling that out is relevant. The REG_PAGE MSR seems to be
> conceptually separate and distinct from the SIMP MSR, so the fact
> that the layouts are the same is just a coincidence. Or is there some
> relationship between the two MSRs that I'm not aware of, and the
> comment is trying (and failing?) to point out?

This was added as per suggestion from Nuno in my initial series for 
MSHV_VTL. If the reference in "identical to" is misleading, I should 
remove it.

https://lore.kernel.org/all/68143eb0-e6a7-4579-bedb-4c2ec5aaef6b@linux.microsoft.com/

Quoting:
"""
it is a generic structure that
appears to be used for several overlay page MSRs (SIMP, SIEF, etc).

But, the type doesn't appear in the hv*dk headers explicitly; it's just
used internally by the hypervisor.

I think it should be renamed with a hv_ prefix to indicate it's part of
the hypervisor ABI, and a brief comment with the provenance:

/* SYNIC_OVERLAY_PAGE_MSR - internal, identical to hv_synic_simp */
union hv_synic_overlay_page_msr {
	/* <snip> */
};
"""

> 
>> +union hv_synic_overlay_page_msr {
>> +	u64 as_uint64;
>> +	struct {
>> +		u64 enabled: 1;
>> +		u64 reserved: 11;
>> +		u64 pfn: 52;
>> +	} __packed;
>> +};
>> +
>>   u8 __init get_vtl(void);
>>   void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0);
>> +bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu);
>>   #else
>>   static inline u8 get_vtl(void) { return 0; }
>>   static inline void mshv_vtl_return_call(struct mshv_vtl_cpu_context *vtl0) {}
>> +static inline bool hv_vtl_configure_reg_page(struct mshv_vtl_per_cpu *per_cpu) { return false; }
> 
> As with Patch 8, if CONFIG_HYPERV_VTL_MODE caused mshv_common.o
> to be built, this stub wouldn't be needed.
> 

Acked.


>>   #endif
>>
>>   #endif
>> --
>> 2.43.0
>>

Regards,
Naman

