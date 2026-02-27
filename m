Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 94FC8FD5319
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Feb 2026 09:36:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=px5XieEPKmbuo9CrIiuS5zCR9teM+ZDzb7WZFA/ue1Q=; b=QgBdDG/Yjt3MdaF5UoLRvdPYrE
	DUwyo8Nf5PmRPAhiOa2TDLfFotsoK8O4atXQgSZ/I7enF94TWvRkR9w4v/FJPZl62ZtknSsVoO2Rd
	Ut7cMl6AcDnxoV3XDpw5KLdxXRd20hw86Cx4Z9kCzLu9VAzmJob8R4XPF7mXmiq05szRFU7EGHEox
	OkOK3/uQjnXvv+xBOiS//IyhGTxvjAq+fq1qaIdyUx7RgWSZhx3vCp69U+/IaDcvyy9vyxKgwwR+2
	Os7i26uLSBP4mmMHgWt08i/D2bb5oxiSl0Bbol5/TZroYIoW9md65j/TMm5LcjE9KwLqolWdcpJEF
	p1byHR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuGL-000000089Xi-3boR;
	Fri, 27 Feb 2026 09:35:57 +0000
Received: from www3579.sakura.ne.jp ([49.212.243.89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvuGI-000000089VF-3P3E
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Feb 2026 09:35:56 +0000
Received: from [133.11.54.205] (h205.csg.ci.i.u-tokyo.ac.jp [133.11.54.205])
	(authenticated bits=0)
	by www3579.sakura.ne.jp (8.16.1/8.16.1) with ESMTPSA id 61R9YgsP068326
	(version=TLSv1.2 cipher=ECDHE-RSA-AES256-GCM-SHA384 bits=256 verify=NO);
	Fri, 27 Feb 2026 18:35:18 +0900 (JST)
	(envelope-from odaki@rsg.ci.i.u-tokyo.ac.jp)
DKIM-Signature: a=rsa-sha256; bh=px5XieEPKmbuo9CrIiuS5zCR9teM+ZDzb7WZFA/ue1Q=;
        c=relaxed/relaxed; d=rsg.ci.i.u-tokyo.ac.jp;
        h=From:Message-ID:To:Subject:Date;
        s=rs20250326; t=1772184918; v=1;
        b=s5jjOGFrW9QHij3qAVZnKPHOFsghNeaW8zQT6IuwDs7t2PShZEQeXy33VCPfziRT
         6+JLSEU28wP8EP+nDfodCUc7u0vjTX8JvWrUn7LjgiiAnrf2awCPPJ4igZ9E9R2u
         EzJUyQp1USQYoeFg8Br9VmnI+LJ6k7aYUW0ouGDfIFavAUjllPQacOyDX5G7DkoZ
         lYsPFUHKC4JAv4XTVx+zXs/TdwawYCujbocHIZMdP+UYxMwmL6t4OlqONRmNB6T+
         LYR9C0XdtF0IdswVYWd/1UoXymFJy4NRNlQukRqsUNDU8239NEk5KQ7SxiYqV/Tk
         F5cf5t2Hjd8Rd5pxcreQew==
Message-ID: <c5e5d2b2-ee47-4241-b0c8-3099cd8e73cb@rsg.ci.i.u-tokyo.ac.jp>
Date: Fri, 27 Feb 2026 18:34:40 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 1/2] KVM: arm64: PMU: Introduce FIXED_COUNTERS_ONLY
To: Oliver Upton <oupton@kernel.org>
Cc: Marc Zyngier <maz@kernel.org>, Joey Gouly <joey.gouly@arm.com>,
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
References: <20260225-hybrid-v3-0-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp>
 <20260225-hybrid-v3-1-46e8fe220880@rsg.ci.i.u-tokyo.ac.jp>
 <aaA0gn9O8QAf9Gpu@kernel.org>
 <fbcadab4-676b-44e4-8afa-b8bd095f8981@rsg.ci.i.u-tokyo.ac.jp>
 <b81cbeb7-6541-4a1f-b08e-2b5c9ee66b69@rsg.ci.i.u-tokyo.ac.jp>
 <aaDRtkdU85kULqwm@kernel.org>
Content-Language: en-US
From: Akihiko Odaki <odaki@rsg.ci.i.u-tokyo.ac.jp>
In-Reply-To: <aaDRtkdU85kULqwm@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260227_013555_299975_FB5508B8 
X-CRM114-Status: GOOD (  43.44  )
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



On 2026/02/27 8:05, Oliver Upton wrote:
> On Thu, Feb 26, 2026 at 11:47:54PM +0900, Akihiko Odaki wrote:
>> On 2026/02/26 23:43, Akihiko Odaki wrote:
>>> On 2026/02/26 20:54, Oliver Upton wrote:
>>>> Hi Akihiko,
>>>>
>>>> On Wed, Feb 25, 2026 at 01:31:15PM +0900, Akihiko Odaki wrote:
>>>>> @@ -629,6 +629,8 @@ void kvm_arch_vcpu_load(struct kvm_vcpu
>>>>> *vcpu, int cpu)
>>>>>            kvm_vcpu_load_vhe(vcpu);
>>>>>        kvm_arch_vcpu_load_fp(vcpu);
>>>>>        kvm_vcpu_pmu_restore_guest(vcpu);
>>>>> +    if (test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY,
>>>>> &vcpu- >kvm->arch.flags))
>>>>> +        kvm_make_request(KVM_REQ_CREATE_PMU, vcpu);
>>>>
>>>> We only need to set the request if the vCPU has migrated to a different
>>>> PMU implementation, no?
>>>
>>> Indeed. I was too lazy to implement such a check since it won't affect
>>> performance unless the new feature is requested, but having one may be
>>> still nice.
> 
> I'd definitely like to see this.
> 
>>>>
>>>>>        if (kvm_arm_is_pvtime_enabled(&vcpu->arch))
>>>>>            kvm_make_request(KVM_REQ_RECORD_STEAL, vcpu);
>>>>> @@ -1056,6 +1058,9 @@ static int check_vcpu_requests(struct
>>>>> kvm_vcpu *vcpu)
>>>>>            if (kvm_check_request(KVM_REQ_RELOAD_PMU, vcpu))
>>>>>                kvm_vcpu_reload_pmu(vcpu);
>>>>> +        if (kvm_check_request(KVM_REQ_CREATE_PMU, vcpu))
>>>>> +            kvm_vcpu_create_pmu(vcpu);
>>>>> +
>>>>
>>>> My strong preference would be to squash the migration handling into
>>>> kvm_vcpu_reload_pmu(). It is already reprogramming PMU events in
>>>> response to other things.
>>>
>>> Can you share a reason for that?
>>>
>>> In terms of complexity, I don't think it will help reducing complexity
>>> since the only common things between kvm_vcpu_reload_pmu() and
>>> kvm_vcpu_create_pmu() are the enumeration of enabled counters, which is
>>> simple enough.
> 
> I prefer it in terms of code organization. We should have a single
> helper that refreshes the backing perf events when something has
> globally changed for the vPMU.
> 
> Besides this, "create" is confusing since the vPMU has already been
> instantiated.
> 
>>> In terms of performance, I guess it is better to keep
>>> kvm_vcpu_create_pmu() small since it is triggered for each migration.
> 
> I think the surrounding KVM code for iterating over the counters is
> inconsequential compared to the overheads of calling into perf to
> recreate the PMU events. Since we expect this to be slow, we should only
> set the request when absolutely necessary.

I see. I'll squash it into kvm_vcpu_reload_pmu().

> 
>>>>> +static bool kvm_pmu_counter_is_enabled(struct kvm_pmc *pmc)
>>>>> +{
>>>>> +    struct kvm_vcpu *vcpu = kvm_pmc_to_vcpu(pmc);
>>>>> +
>>>>> +    return kvm_pmu_enabled_counter_mask(vcpu) & BIT(pmc->idx);
>>>>>    }
>>>>
>>>> You're churning a good bit of code, this needs to happen in a separate
>>>> patch (if at all).
>>>
>>> It makes sense. The next version will have a separate patch for this.
> 
> If I have the full picture right, you may not need it with a common
> request handler.

I think I'm going to use it to check if the vCPU is covered by the perf 
events currently enabled before requesting KVM_REQ_RELOAD_PMU.

> 
>>>>
>>>>> @@ -689,6 +710,14 @@ static void
>>>>> kvm_pmu_create_perf_event(struct kvm_pmc *pmc)
>>>>>        int eventsel;
>>>>>        u64 evtreg;
>>>>> +    if (!arm_pmu) {
>>>>> +        arm_pmu = kvm_pmu_probe_armpmu(vcpu->cpu);
>>>>
>>>> kvm_pmu_probe_armpmu() takes a global mutex, I'm not sure that's what we
>>>> want.
>>>>
>>>> What prevents us from opening a PERF_TYPE_RAW event and allowing perf to
>>>> work out the right PMU for this CPU?
>>>
>>> Unfortunately perf does not seem to have a capability to switch to the
>>> right PMU. tools/perf/Documentation/intel-hybrid.txt says the perf tool
>>> creates events for each PMU in a hybird configuration, for example.
>>
>> I think I misunderstood what you meant. Letting
>> perf_event_create_kernel_counter() to figure out what a PMU to use may be a
>> good idea. I'll give a try with the next version.
> 
> Yep, this is what I was alluding to.

I tried this, but unfortunately it didn't work well. Simply using 
PERF_TYPE_RAW let perf_event_create_kernel_counter() choose an arbitrary 
PMU, potentially not covering the current PCPU.

We can change the cpu parameter of the function to fix this, but it 
binds the perf event to that particular PCPU and requires recreating 
perf event when migrating to another PCPU covered by the same PMU.

I think I'm going to use RCU to avoid locking a global mutex.

> 
>>>
>>>>
>>>>> +        if (!arm_pmu) {
>>>>> +            vcpu_set_on_unsupported_cpu(vcpu);
>>>>
>>>> At this point it seems pretty late to flag the CPU as unsupported. Maybe
>>>> instead we can compute the union cpumask for all the PMU implemetations
>>>> the VM may schedule on.
>>>
>>> This is just a safe guard and it is a responsibility of the userspace to
>>> schedule the VCPU properly. It is conceptually same with what
>>> kvm_arch_vcpu_load() does when migrating to an unsupported CPU.
> 
> I agree with you that we need to have some handling for this situation.
> 
> What I don't like about this is userspace doesn't discover its mistake
> until the guest actually programs a PMC. I'd much rather preserve the
> existing ABI where KVM proactively rejects running a vCPU on an
> unsupported CPU.

Thanks for explanation. I'll change this with the next version.

> 
>>>>> +    case KVM_ARM_VCPU_PMU_V3_FIXED_COUNTERS_ONLY:
>>>>> +        lockdep_assert_held(&vcpu->kvm->arch.config_lock);
>>>>> +        if (test_bit(KVM_ARCH_FLAG_PMU_V3_FIXED_COUNTERS_ONLY,
>>>>> &vcpu->kvm->arch.flags))
>>>>> +            return 0;
>>>>
>>>> We don't need a getter for this, userspace should remember how it
>>>> provisioned the VM.
>>>
>>> The getter is useful for debugging and testing. The selftest will use it
>>> to query the current state.
> 
> That's fine for debugging this on your own kernel but we don't need it
> upstream. There's several other vPMU attributes that are write-only,
> like KVM_ARM_VCPU_PMU_V3_SET_PMU.

Not just for debugging kernel, but it will be useful for userspace 
debugging.

Indeed there are other readonly attributes, but there is also an 
attribute with getter: KVM_ARM_VCPU_PMU_V3_IRQ. I think there are more 
if you look at a scope broader than the KVM_ARM_VCPU_PMU_V3_CTRL group, 
and such existing getters for read/write attributes are probably only 
useful for kernel/userspace debugging either. I think having a getter 
can be justified, given that these preexisting examples.

Regards,
Akihiko Odaki

