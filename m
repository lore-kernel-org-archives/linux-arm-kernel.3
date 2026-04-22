Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23412F94CDB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 07:08:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=spF9IOW2V15dt6bJE0CRBrgMv2oh2xWd5j7mz2cgmZk=; b=RBqWN2v90BNdsJrtdwR9GxlVtX
	nym7g/4mx5oB86kWbRM6R9LaIkabh3ZD95IMB4TyPHm8goN+xMihodNWRjSfUmd2shE95XIsu39db
	oQwjXzaHz3RY6wuk20TQdXUKCvwdV3V4W/J3uTBluSTbHy6cZxDGWkEAP4igqMtIiYaqn8NwXSUhQ
	4Wq0Hd+9LhAJzzC+cPJ5nyqLht2JAPyFHRT2YIRbSLVgAWA9Y1A8GEkEsw4kzyyLv7owlSG3rBDCJ
	moD/IDmvYXRwvKI9utCN1iPpPPa/TwNx7zKZPi65W61TJ7lDWM/ccR0TM3lcDFG2gxs1ClZ6RFjtd
	1XZktNtQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRgi-00000009hdw-12QT;
	Wed, 22 Apr 2026 07:07:56 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFRge-00000009hdR-3cBO
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 07:07:54 +0000
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 63M726wI004805
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Wed, 22 Apr 2026 16:02:06 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=spF9IOW2V15dt6bJE0CRBrgMv2oh2xWd5j7mz2cgmZk=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1776841326; v=1;
        b=nazrWpPOx1MUGEQQP5jnqy7DnpgSUPBt+epaBv0wb9yxB67VjM13b0XbIxSdZ8Dz
         T5CQmSpsVMKBnJWJBfvZMyngEYKJFfZMNjN4w3ZhdoyB/XSw+qLYb41eEckAGS2X
         BEH57BHzIM/fhzGcS+hQUiDIl6RRIFTOkCguyNTRX1mIApCowv428/0fWfm5Kd6Z
         7toEuwuPTFRzu6kLLpeWean3D2SrmYR7F6yyBrnOXU1DR15c0U959WEwh6XJm81g
         ttzTKQqQ/7GXlyL+w+Y5UGnyurFKA4AzE/cgET+zMT1z4YjUDTpISkP1n8h/yvfC
         7KGiBzQMkIDtiEEF+lvS1A==
Message-ID: <327f74e4-78b8-4629-a418-d1d3ba78859f@rsg.ci.i.u-tokyo.ac.jp>
Date: Wed, 22 Apr 2026 16:02:05 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 3/4] KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
To: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oupton@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
        Suzuki K Poulose <suzuki.poulose@arm.com>,
        Zenghui Yu
 <yuzenghui@huawei.com>,
        Catalin Marinas <catalin.marinas@arm.com>,
        Will Deacon <will@kernel.org>, Kees Cook <kees@kernel.org>,
        "Gustavo A. R. Silva" <gustavoars@kernel.org>,
        Paolo Bonzini <pbonzini@redhat.com>, Jonathan Corbet <corbet@lwn.net>,
        Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
        kvmarm@lists.linux.dev, linux-kernel@vger.kernel.org,
        linux-hardening@vger.kernel.org, devel@daynix.com, kvm@vger.kernel.org,
        linux-doc@vger.kernel.org, linux-kselftest@vger.kernel.org
References: <20260418-hybrid-v7-0-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
 <20260418-hybrid-v7-3-2bf39ad009bf@rsg.ci.i.u-tokyo.ac.jp>
 <87ldeic1gk.wl-maz@kernel.org>
 <06c6664c-7f0c-47b2-babf-ba2a541fd9f2@rsg.ci.i.u-tokyo.ac.jp>
 <86qzoa0xj6.wl-maz@kernel.org>
 <ad44c69e-2f99-4f31-81b4-faae52eea080@rsg.ci.i.u-tokyo.ac.jp>
 <86ldeh20xg.wl-maz@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <86ldeh20xg.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260422_000753_133878_ACA65592 
X-CRM114-Status: GOOD (  39.67  )
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

On 2026/04/20 22:53, Marc Zyngier wrote:
> On Mon, 20 Apr 2026 13:07:15 +0100,
> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>>
>> On 2026/04/20 18:51, Marc Zyngier wrote:
>>> On Mon, 20 Apr 2026 09:36:16 +0100,
>>> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>>>>
>>>> On 2026/04/20 2:19, Marc Zyngier wrote:
>>>>> On Sat, 18 Apr 2026 09:14:25 +0100,
>>>>> Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp> wrote:
>>>>>>
>>>>>> On a heterogeneous arm64 system, KVM's PMU emulation is based on the
>>>>>> features of a single host PMU instance. When a vCPU is migrated to a
>>>>>> pCPU with an incompatible PMU, counters such as PMCCNTR_EL0 stop
>>>>>> incrementing.
>>>>>>
>>>>>> Although this behavior is permitted by the architecture, Windows does
>>>>>> not handle it gracefully and may crash with a division-by-zero error.
>>>>>>
>>>>>> The current workaround requires VMMs to pin vCPUs to a set of pCPUs
>>>>>> that share a compatible PMU. This is difficult to implement correctly in
>>>>>> QEMU/libvirt, where pinning occurs after vCPU initialization, and it
>>>>>> also restricts the guest to a subset of available pCPUs.
>>>>>>
>>>>>> Introduce the KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY attribute to
>>>>>> create a "fixed-counters-only" PMU. When set, KVM exposes a PMU that is
>>>>>> compatible with all pCPUs but that does not support programmable
>>>>>> event counters which may have different feature sets on different PMUs.
>>>>>>
>>>>>> This allows Windows guests to run reliably on heterogeneous systems
>>>>>> without crashing, even without vCPU pinning, and enables VMMs to
>>>>>> schedule vCPUs across all available pCPUs, making full use of the host
>>>>>> hardware.
>>>>>>
>>>>>> Much like KVM_ARM_VCPU_PMU_V3_IRQ and other read-write attributes, this
>>>>>> attribute provides a getter that facilitates kernel and userspace
>>>>>> debugging/testing.
>>>>>
>>>>> OK, so that's the sales pitch. But how is it implemented? I would like
>>>>> to be able to read a high-level description of the implementation
>>>>> trade-offs.
>>>>
>>>> Implementation-wise it is very trivial. Essentially the following
>>>> addition in kvm_arm_pmu_v3_get_attr() is the entire implementation:
>>>> +	case KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY:
>>>> +		if (test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY,
>>>> &vcpu->kvm->arch.flags))
>>>> +			return 0;
>>>>
>>>> Both its functionality and code complexity is trivial. So we can argue that:
>>>> - the functionality is too trivial to be useful or
>>>> - the interface/implementation complexity is so trivial that it does not
>>>>     incur maintenance burden
>>>>
>>>> In this case the selftest uses the getter so I was more inclined to
>>>> have it, but adding one just for the selftest sounds too ad-hoc, so
>>>> here I looked into other attributes to ensure that it was not
>>>> introducing inconsistency with existing interfaces.
>>>>
>>>> As the result, I found there are other read-write attributes; in fact
>>>> there are more read-write attributes than write-only ones.
>>>
>>> You're completely missing the point. I'm referring to the whole of the
>>> commit message, which is more of a marketing slide than a technical
>>> description.
>>
>> In terms of implementation, the obvious tradeoff is that it adds more
>> code to implement the feature. One thing to note is that
>> kvm_vcpu_load_pmu() is added and is called each time a vCPU migrates
>> across pCPUs. The heavy part, making the KVM_REQ_RELOAD_PMU request,
>> only happens when the feature is enabled.
> 
> Well, that's what I want to see. The repeated blurb about Windows
> being broken is cover letter material, but not fir for a commit
> message.

I understand. I'll leave the Windows issue the cover letter and write 
focused patch messages after splitting patches.

> 
> [...]
> 
>>>>> "for the first time" gives the impression that it will work if you try
>>>>> again. I'd rather we say that "This feature is incompatible with the
>>>>> existence of a PMU event filter".
>>>>
>>>> The following sequence will work:
>>>> 1. Set KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY
>>>> 2. Set KVM_ARM_VCPU_PMU_V3_FILTER
>>>> 3. Set KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY
>>>>
>>>> This is to make the behavior conistent with KVM_ARM_VCPU_PMU_V3_SET_PMU.
>>>
>>> I don't think this is correct. Filtering is completely at odds with
>>> this patch, and I don't want to have to reason about the combination.
>>
>> kvm_arm_pmu_v3_set_pmu() has the following condition:
>>
>> if (kvm_vm_has_ran_once(kvm) ||
>>      (kvm->arch.pmu_filter && kvm->arch.arm_pmu != arm_pmu)) {
>> 	ret = -EBUSY;
>> 	break;
>> }
>>
>> kvm_arm_pmu_v3_set_pmu_fixed_counters_only() has the corresponding
>> condition for consistency:
>>
>> if (kvm_vm_has_ran_once(kvm) ||
>>      (kvm->arch.pmu_filter &&
>>       !test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY,
>> 	       &kvm->arch.flags)))
>> 	return -EBUSY;
>>
>> We can of course kill the PMU event filter for
>> FIXED_COUNTERS_ONLY. The filter is effectively no-op with
>> FIXED_COUNTERS_ONLY and I don't think that consistency matters much.
> 
> We shouldn't allow weird combinations in the UAPI. Since it makes no
> sense to have both fixed-function *and* filters, we should make them
> mutually exclusive.

Then I think it makes sense to make KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS 
mutually exclusive for consistency, but I found something weird with it.

The documentation says it already "mandates that a PMU has explicitly 
been selected via KVM_ARM_VCPU_PMU_V3_SET_PMU", but apparently that's 
not properly implemented.

kvm_arm_pmu_v3_set_nr_counters() has the following check:
	if (!kvm->arch.arm_pmu)
		return -EINVAL;

I suspect it is intended to check if a PMU has explicitly been selected, 
but this check is effectively no-op because kvm_arm_set_default_pmu() 
has already set kvm->arch.arm_pmu before reaching there.

Furthermore, tools/testing/selftests/kvm/arm64/vpmu_counter_access.c 
seems to expect KVM_ARM_VCPU_PMU_V3_SET_NR_COUNTERS to work without 
selecting a PMU via KVM_ARM_VCPU_PMU_V3_SET_PMU.

How should we deal with the discrepancy between the documentation and 
the implementation/selftest?

> 
> [...]
> 
>>>> I expect migration will be handled with the conventional register
>>>> getters and setters, but please share if you have a concern.
>>>
>>> At the very least I want to see some documentation explaining that.
>>
>> What kind of documentation do you expect?
> 
> A description of what counters are exposed by this feature, and what
> architectural features they are dependent on.

I'll update the attribute documentation accordingly.

> 
>> If we change kvm_vcpu_load_pmu() to avoid for_each_set_bit(), there
>> would be a good chance to forget updating it when mechanically
>> updating existing for_each_set_bit() instances, so it is a candidate
>> for documentation. But I don't have a good idea where to place it
>> either.
> 
> The moment we introduce FEAT_PMUv3_ICNTR, the whole PMUv3 emulation
> will catch fire anyway, as we already limit ourselves to 32 bits for
> reset and nesting switch.
> 
> So this will be a major redesign anyway. If you are really worried,
> leave a comment in there.

I'll leave one line comment in the implementation corresponding to the 
attribute documentation.

Regards,
Akihiko Odaki

