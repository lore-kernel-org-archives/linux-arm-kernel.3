Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DCC2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  7 Jul 2026 11:37:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PC9H9+hfBUgJc1h9fKgLECYX3wbgWyiwPKt7KOMjAiE=; b=wdjoUX0R7doTtk4Orys9Tqo/4z
	6w7qkf3yIzKuVBDTnCXaJhYhwZhpU+WdVIYv0KpGoN81uIP7IbBsW6ljQVpnNjl+LJei7D2qEw5Rw
	SAJoY9mDOpVukMdRD2WqD1xc5clCy/JOKdPY27rbqOyBornImn3NyaRkf87Cw2XbEHONwTyFRGufs
	Xymb0e5zMJDf1R2LyO/xXuF9odSLVL2ab1+OE6IeZDHPBn3aAUfws8zgKbKNn9l12owJtA6D6S7SV
	ifqe/9t8A7c5hia2abIVR7JK7WtKwhEpdrQHK5reur9o/s7jqdrkz16VxONsAHczvJk5QPv1KbkcJ
	edYXHt8A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh46t-0000000Erjy-0NLb;
	Tue, 07 Jul 2026 11:37:07 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wh46p-0000000ErjI-2yrY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 07 Jul 2026 11:37:05 +0000
Received: from [133.11.54.183] (h183.csg.ci.i.u-tokyo.ac.jp [133.11.54.183])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 667BaXR6009375
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Tue, 7 Jul 2026 20:36:33 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=PC9H9+hfBUgJc1h9fKgLECYX3wbgWyiwPKt7KOMjAiE=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1783424194; v=1;
        b=TJ9+WCJuvN2HY9GfRKpGwzZshGSjYSg+ZCQPyx+qgt+W3BRyH5dvAMZNxppn7WPz
         KWg4fLBC8zWUuwbNrQrvtEciEtr3hzWw2BgyPziP7Tz9IAtBBJ96qe1kaSSZyN1a
         CtNdBeuNKcYX6EG9UT8iaiSkatol3VYDd+FkjSQqNMVCD0ajPTR8LH/cQd2teirB
         WhZc42jMhxC7y3nYH4eeUVst6bLixn5KanS+l+9ciFjtWUfnH5ZfdaGif2Sg3Z0o
         iUTu6Pc2W3lxcodV0dFvbkAQDmL18va8K84f1tATGhEOsG/TV0InJ0JkrkuR1WFR
         driv6wIpea3cPdDdCv26EA==
Message-ID: <db672f83-a6c4-4d94-a959-930a624a7915@rsg.ci.i.u-tokyo.ac.jp>
Date: Tue, 7 Jul 2026 20:36:32 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v8 6/7] KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, Shuah Khan <skhan@linuxfoundation.org>,
        linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
        linux-kernel@vger.kernel.org, linux-hardening@vger.kernel.org,
        devel@daynix.com, kvm@vger.kernel.org, linux-doc@vger.kernel.org,
        linux-kselftest@vger.kernel.org
References: <20260706-hybrid-v8-0-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <20260706-hybrid-v8-6-de459617b59d@rsg.ci.i.u-tokyo.ac.jp>
 <akvsuBcqCCzlrBLk@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <akvsuBcqCCzlrBLk@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260707_043703_979716_476CFEA7 
X-CRM114-Status: GOOD (  25.67  )
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

On 2026/07/07 2:58, Oliver Upton wrote:
> On Mon, Jul 06, 2026 at 07:03:29PM +0900, Akihiko Odaki wrote:
>> +1.6 ATTRIBUTE: KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY
>> +------------------------------------------------------
>> +
>> +:Parameters: no additional parameter in kvm_device_attr.addr
>> +
>> +:Returns:
>> +
>> +	 =======  ==================================================
>> +	 -EBUSY   PMUv3 already initialized, a VCPU has already run,
>> +		  an event filter has already been set or
>> +		  a hardware PMU has already been specified
>> +	 -ENXIO   Attempted to get before setting
>> +	 -ENODEV  Attempted to set while PMUv3 not supported
>> +	 =======  ==================================================
>> +
>> +If set, KVM emulates PMUv3 without programmable event counters. Only fixed
>> +counters are exposed to the guest: the cycle counter today, and the instruction
>> +counter if support for FEAT_PMUv3_ICNTR is added.
> 
> Drop the mention of cycle counter and FEAT_PMUv3_ICNTR, I want to avoid
> the argument later down the line when ICNTR support is added to this
> mode.
> 
> The expectation is that the VMM discovers the feature set using the ID
> registers just like every other CPU feature. KVM documentation doesn't
> need to describe the architecture.
I'll drop it with the next version.

> 
>> +With programmable counters disabled, the VCPU can run on any physical CPU.
>> +This is particularly useful on heterogeneous systems where different hardware
>> +PMUs cover different physical CPUs. All VCPUs in a VM share this attribute.
> 
>    When this attribute is enabled, the vCPU can run on any physical CPU
>    that has a PMU, regardless of the underlying implementation. This
>    attribute is VM-scoped.
> 
> The documentation is focused on unambiguously representing the UAPI, not
> providing application recommendations.

I agree. I'll use your wording for the next version.

> 
>>   2. GROUP: KVM_ARM_VCPU_TIMER_CTRL
>>   =================================
>>   
>> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/uapi/asm/kvm.h
>> index 1c13bfa2d38a..39a1a1e412e6 100644
>> --- a/arch/arm64/include/uapi/asm/kvm.h
>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>> @@ -437,6 +437,7 @@ enum {
>>   #define   KVM_ARM_VCPU_PMU_V3_FILTER		2
>>   #define   KVM_ARM_VCPU_PMU_V3_SET_PMU		3
>>   #define   KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS	4
>> +#define   KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY	5
>>   #define KVM_ARM_VCPU_TIMER_CTRL		1
>>   #define   KVM_ARM_VCPU_TIMER_IRQ_VTIMER		0
>>   #define   KVM_ARM_VCPU_TIMER_IRQ_PTIMER		1
>> diff --git a/arch/arm64/kvm/pmu-emul.c b/arch/arm64/kvm/pmu-emul.c
>> index 40cad183376c..ad9ff4d0d89c 100644
>> --- a/arch/arm64/kvm/pmu-emul.c
>> +++ b/arch/arm64/kvm/pmu-emul.c
>> @@ -1149,11 +1149,13 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>>   		arm_pmu = entry->arm_pmu;
>>   		if (arm_pmu->pmu.type == pmu_id) {
>>   			if (kvm_vm_has_ran_once(kvm) ||
>> +			    kvm_pmu_fixed_counters_only(kvm) ||
>>   			    (kvm->arch.pmu_filter && kvm->arch.arm_pmu != arm_pmu)) {
>>   				ret = -EBUSY;
>>   				break;
>>   			}
>>   
>> +			set_bit(KVM_ARCH_FLAG_PMU_V3_EXPLICIT, &kvm->arch.flags);
> 
> Why is this flag necessary? kvm->arch.arm_pmu is NULL if no PMU
> implementation was selected by userspace.

The explicit flag is there because kvm->arch.arm_pmu is also populated
by KVM_ARM_VCPU_INIT through kvm_arm_set_default_pmu(). I wanted to keep
allowing userspace to enable FIXED_COUNTERS_ONLY after that default PMU
selection, as long as PMUv3 has not been initialized and the VM has not
run, while still rejecting it after an explicit SET_PMU.

> 
>>   			kvm_arm_set_pmu(kvm, arm_pmu);
>>   			cpumask_copy(kvm->arch.supported_cpus, &arm_pmu->supported_cpus);
>>   			ret = 0;
>> @@ -1164,6 +1166,22 @@ static int kvm_arm_pmu_v3_set_pmu(struct kvm_vcpu *vcpu, int pmu_id)
>>   	return ret;
>>   }
>>   
>> +static int kvm_arm_pmu_v3_set_pmu_fixed_counters_only(struct kvm_vcpu *vcpu)
>> +{
>> +	struct kvm *kvm = vcpu->kvm;
>> +
>> +	lockdep_assert_held(&kvm->arch.config_lock);
>> +
>> +	if (kvm_vm_has_ran_once(kvm) || kvm->arch.pmu_filter ||
>> +	    test_bit(KVM_ARCH_FLAG_PMU_V3_EXPLICIT, &kvm->arch.flags))
>> +		return -EBUSY;
>> +
>> +	set_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY, &kvm->arch.flags);
>> +	kvm_arm_set_nr_counters(kvm, 0);
>> +
>> +	return 0;
>> +}
>> +
>>   static int kvm_arm_pmu_v3_set_nr_counters(struct kvm_vcpu *vcpu, unsigned int n)
>>   {
>>   	struct kvm *kvm = vcpu->kvm;
>> @@ -1238,7 +1256,7 @@ int kvm_arm_pmu_v3_set_attr(struct kvm_vcpu *vcpu, struct kvm_device_attr *attr)
>>   		     filter.action != KVM_PMU_EVENT_DENY))
>>   			return -EINVAL;
>>   
>> -		if (kvm_vm_has_ran_once(kvm))
>> +		if (kvm_vm_has_ran_once(kvm) || kvm_pmu_fixed_counters_only(kvm))
> 
> There's no reason for doing this, just let userspace create an event
> filter. Even with the current PMU implementation it's possible that the
> fixed cycle counter gets filtered.

This check was added as the consequence of the discussion in the 
following thread:
https://lore.kernel.org/all/327f74e4-78b8-4629-a418-d1d3ba78859f@rsg.ci.i.u-tokyo.ac.jp/

Regards,
Akihiko Odaki

