Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A06DD0C608
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 13:48:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0I0lmdaVWwriQSvcFurg/c2RbB4El0QHg1Q+i/IyzUs=; b=hMzgmbSAnPz97D1kQlZx8j30AV
	BWI56ypCEPo0ekEH9j3/JEMMgkKvf5Y5tD5/7ns4v8j4HD85Eb8SccefuC8Tki12WEpH+Z5JNyHtg
	+6AOFGZvlX/YIzglmIfuGTH6PLwBy4sZ98DX8jyXwu6hwbtOul23a60XjcvXqcPZ5PgW/4SImtEp+
	epSQASy1HsmNC7VvYuVF8NHo7hR4nh+v07A9ADKR47JcW86A144retmpCtMlgejNe5bmkIRPAbKVs
	J5ZDXmz43dphjyef7tN3kfxOdLVs7cYSPKxBY4Jtvac29VXHgOrNJLYAEb/IkMRCmQ8B2k61msnpU
	QVLmnKjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4Kfb-00000003s5Q-0Old;
	Fri, 25 Oct 2024 13:48:03 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4KJ6-00000003oLr-1dNo
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 13:24:49 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E512C339;
	Fri, 25 Oct 2024 06:25:15 -0700 (PDT)
Received: from [10.1.36.18] (e122027.cambridge.arm.com [10.1.36.18])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C42393F71E;
	Fri, 25 Oct 2024 06:24:41 -0700 (PDT)
Message-ID: <bba3e573-989f-432b-82c9-3f5872563e9f@arm.com>
Date: Fri, 25 Oct 2024 14:24:39 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v5 04/43] arm64: RME: Handle Granule Protection Faults
 (GPFs)
To: "Aneesh Kumar K.V" <aneesh.kumar@kernel.org>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>,
 Suzuki K Poulose <suzuki.poulose@arm.com>, Zenghui Yu
 <yuzenghui@huawei.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org, Joey Gouly <joey.gouly@arm.com>,
 Alexandru Elisei <alexandru.elisei@arm.com>,
 Christoffer Dall <christoffer.dall@arm.com>, Fuad Tabba <tabba@google.com>,
 linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>
References: <20241004152804.72508-1-steven.price@arm.com>
 <20241004152804.72508-5-steven.price@arm.com> <yq5a8qudmvp6.fsf@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <yq5a8qudmvp6.fsf@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_062448_552105_3CDA162F 
X-CRM114-Status: GOOD (  24.54  )
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

On 24/10/2024 15:17, Aneesh Kumar K.V wrote:
> Steven Price <steven.price@arm.com> writes:
> 
>> If the host attempts to access granules that have been delegated for use
>> in a realm these accesses will be caught and will trigger a Granule
>> Protection Fault (GPF).
>>
>> A fault during a page walk signals a bug in the kernel and is handled by
>> oopsing the kernel. A non-page walk fault could be caused by user space
>> having access to a page which has been delegated to the kernel and will
>> trigger a SIGBUS to allow debugging why user space is trying to access a
>> delegated page.
>>
> 
> A non-page walk fault can also be caused by host kernel trying to access a
> page which it had delegated before. It would be nice to dump details
> like FAR in that case. Right now it shows only the below.

While I agree FAR would be handy, this isn't specific to a GPF.

arm64_notify_die() takes the FAR, but in the case of a kernel fault
ignores it and calls die(). I'm not sure if there's a good reason for it
not calling die_kernel_fault() instead which would print the FAR. Or
indeed whether the FAR should be passed instead of the ESR (although
changing that now would probably be confusing).

This affects e.g. do_sea(), do_mem_abort() and others too. It might be
worth sending a patch to improve that behaviour, but I think the
handling for GPFs of using arm64_notify_die() is correct.

Thanks,
Steve

> [  285.122310] Internal error: Granule Protection Fault not on table walk: 0000000096000068 [#1] PREEMPT SMP               
> [  285.122427] Modules linked in:                                                                                                                                                
> [  285.122512] CPU: 1 UID: 0 PID: 217 Comm: kvm-vcpu-0 Not tainted 6.12.0-rc1-00082-g8461d8333829 #42
> [  285.122656] Hardware name: FVP Base RevC (DT)
> [  285.122733] pstate: 81400009 (Nzcv daif +PAN -UAO -TCO +DIT -SSBS BTYPE=--)
> [  285.122871] pc : clear_page+0x18/0x50
> [  285.122975] lr : kvm_gmem_get_pfn+0xbc/0x190
> [  285.123110] sp : ffff800082cef900
> [  285.123182] x29: ffff800082cef910 x28: 0000000090000000 x27: 0000000090000006
> .....
> 
> -aneesh
> 
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v2:
>>  * Include missing "Granule Protection Fault at level -1"
>> ---
>>  arch/arm64/mm/fault.c | 31 +++++++++++++++++++++++++------
>>  1 file changed, 25 insertions(+), 6 deletions(-)
>>
>> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
>> index 8b281cf308b3..f9d72a936d48 100644
>> --- a/arch/arm64/mm/fault.c
>> +++ b/arch/arm64/mm/fault.c
>> @@ -804,6 +804,25 @@ static int do_tag_check_fault(unsigned long far, unsigned long esr,
>>  	return 0;
>>  }
>>  
>> +static int do_gpf_ptw(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	const struct fault_info *inf = esr_to_fault_info(esr);
>> +
>> +	die_kernel_fault(inf->name, far, esr, regs);
>> +	return 0;
>> +}
>> +
>> +static int do_gpf(unsigned long far, unsigned long esr, struct pt_regs *regs)
>> +{
>> +	const struct fault_info *inf = esr_to_fault_info(esr);
>> +
>> +	if (!is_el1_instruction_abort(esr) && fixup_exception(regs))
>> +		return 0;
>> +
>> +	arm64_notify_die(inf->name, regs, inf->sig, inf->code, far, esr);
>> +	return 0;
>> +}
>> +
>>  static const struct fault_info fault_info[] = {
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"ttbr address size fault"	},
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"level 1 address size fault"	},
>> @@ -840,12 +859,12 @@ static const struct fault_info fault_info[] = {
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 32"			},
>>  	{ do_alignment_fault,	SIGBUS,  BUS_ADRALN,	"alignment fault"		},
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 34"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 35"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 36"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 37"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 38"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 39"			},
>> -	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 40"			},
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level -1" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 0" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 1" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 2" },
>> +	{ do_gpf_ptw,		SIGKILL, SI_KERNEL,	"Granule Protection Fault at level 3" },
>> +	{ do_gpf,		SIGBUS,  SI_KERNEL,	"Granule Protection Fault not on table walk" },
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"level -1 address size fault"	},
>>  	{ do_bad,		SIGKILL, SI_KERNEL,	"unknown 42"			},
>>  	{ do_translation_fault,	SIGSEGV, SEGV_MAPERR,	"level -1 translation fault"	},
>> -- 
>> 2.34.1


