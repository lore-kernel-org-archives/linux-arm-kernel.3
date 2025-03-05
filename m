Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4F961C19F32
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Mar 2025 16:27:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x+s+ixIn3nQU4d14dxB+2raEmgcn4RItoB0+nGzdFhw=; b=SFSeJfzXAvbuBKM7qhx1QpfPZo
	ckHlLdgOihetcAiutbrCTdD39hEkXqOQiP3pneMI7bMuW30zLOllm/zTRfg8qYsVdhEIWBDIkBo97
	jaQMAP+g/FGdrTE/KQ7F9iYFWYnbw+aswtqw6K1mDaeTJHb2MlvwE1obCwRvEuJrbt64uQlEU50Nc
	EDFW+nDDbMABIFwaocsJ7RQKLrP7NrtvXomvnbewxqSptayV1aASx598GdzkzWxg5NEv/fvV3PND8
	mdICKGUqFvFDAnMNw7Yte9l7bRSea+QtUSjoRaThF3n8zQ6xuawSCFrjc86m4UgOEz2eioTmH58sW
	PNXzrHCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprad-00000008etg-3k69;
	Wed, 05 Mar 2025 16:27:23 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tprYk-00000008eYu-0vjU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Mar 2025 16:25:27 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id D5D60FEC;
	Wed,  5 Mar 2025 08:25:36 -0800 (PST)
Received: from [10.57.67.16] (unknown [10.57.67.16])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 1FB763F5A1;
	Wed,  5 Mar 2025 08:25:18 -0800 (PST)
Message-ID: <ea9bb982-cf31-4079-8fea-dc39e91a975b@arm.com>
Date: Wed, 5 Mar 2025 16:25:17 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 09/45] kvm: arm64: Expose debug HW register numbers for
 Realm
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
Cc: Suzuki K Poulose <suzuki.poulose@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-10-steven.price@arm.com>
 <cec600f2-2ddc-4c71-9bab-0a0403132b43@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <cec600f2-2ddc-4c71-9bab-0a0403132b43@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250305_082526_347000_A62ED253 
X-CRM114-Status: GOOD (  21.35  )
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

Hi Gavin,

On 03/03/2025 04:48, Gavin Shan wrote:
> On 2/14/25 2:13 AM, Steven Price wrote:
>> From: Suzuki K Poulose <suzuki.poulose@arm.com>
>>
>> Expose VM specific Debug HW register numbers.

Looking at this now, this patch description is garbage. Probably the
patch has changed over time - so I suspect it's my fault not Suzuki's.
We're not exposing anything new here. This is purely about telling the
VMM that a realm cannot (currently) be debugged. Something like the
below would be more accurate:

"""
kvm: arm64: Don't expose debug capabilities for realm guests

RMM v1.0 provides no mechanism for the host to perform debug operations
on the guest. So don't expose KVM_CAP_SET_GUEST_DEBUG and report 0
breakpoints and 0 watch points.
"""

>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/kvm/arm.c | 24 +++++++++++++++++++++---
>>   1 file changed, 21 insertions(+), 3 deletions(-)
>>
> 
> Documentation/virt/kvm/api.rst needs to be updated accordingly.

I don't think (with the above clarification) there's anything to update
in the API documentation. There's nothing new being added, just
capabilities being hidden where the functionality isn't available.

And eventually we hope to add support for this (in a later RMM spec) - I
don't yet know exactly what form this will take, but I hope to keep the
interfaces as close as possible to what we already have so that existing
tooling can be used.

Thanks,
Steve

>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index b8fa82be251c..df6eb5e9ca96 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -78,6 +78,22 @@ bool is_kvm_arm_initialised(void)
>>       return kvm_arm_initialised;
>>   }
>>   +static u32 kvm_arm_get_num_brps(struct kvm *kvm)
>> +{
>> +    if (!kvm_is_realm(kvm))
>> +        return get_num_brps();
>> +    /* Realm guest is not debuggable. */
>> +    return 0;
>> +}
>> +
>> +static u32 kvm_arm_get_num_wrps(struct kvm *kvm)
>> +{
>> +    if (!kvm_is_realm(kvm))
>> +        return get_num_wrps();
>> +    /* Realm guest is not debuggable. */
>> +    return 0;
>> +}
>> +
> 
> The above two comments "Realm guest is not debuggable." can be dropped
> since
> the code is self-explanatory, and those two functions are unnecessary to be
> kept in that way, for example:
> 
>     case KVM_CAP_GUEST_DEBUG_HW_BPS:
>         return kvm_is_realm(kvm) ? 0 : get_num_brps();
>     case KVM_CAP_GUEST_DEBUG_HW_WRPS:
>         return kvm_is_realm(kvm) ? 0 : get_num_wrps();
> 
> 
>>   int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>>   {
>>       return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>> @@ -323,7 +339,6 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>       case KVM_CAP_ARM_IRQ_LINE_LAYOUT_2:
>>       case KVM_CAP_ARM_NISV_TO_USER:
>>       case KVM_CAP_ARM_INJECT_EXT_DABT:
>> -    case KVM_CAP_SET_GUEST_DEBUG:
>>       case KVM_CAP_VCPU_ATTRIBUTES:
>>       case KVM_CAP_PTP_KVM:
>>       case KVM_CAP_ARM_SYSTEM_SUSPEND:
>> @@ -331,6 +346,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm,
>> long ext)
>>       case KVM_CAP_COUNTER_OFFSET:
>>           r = 1;
>>           break;
>> +    case KVM_CAP_SET_GUEST_DEBUG:
>> +        r = !kvm_is_realm(kvm);
>> +        break;
>>       case KVM_CAP_SET_GUEST_DEBUG2:
>>           return KVM_GUESTDBG_VALID_MASK;
>>       case KVM_CAP_ARM_SET_DEVICE_ADDR:
>> @@ -376,10 +394,10 @@ int kvm_vm_ioctl_check_extension(struct kvm
>> *kvm, long ext)
>>           r = cpus_have_final_cap(ARM64_HAS_32BIT_EL1);
>>           break;
>>       case KVM_CAP_GUEST_DEBUG_HW_BPS:
>> -        r = get_num_brps();
>> +        r = kvm_arm_get_num_brps(kvm);
>>           break;
>>       case KVM_CAP_GUEST_DEBUG_HW_WPS:
>> -        r = get_num_wrps();
>> +        r = kvm_arm_get_num_wrps(kvm);
>>           break;
>>       case KVM_CAP_ARM_PMU_V3:
>>           r = kvm_arm_support_pmu_v3();
> 
> Thanks,
> Gavin
> 


