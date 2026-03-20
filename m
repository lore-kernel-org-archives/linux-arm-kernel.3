Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3680F10987AB
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Mar 2026 16:39:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NDdhTUO0o/W+fy8nSqH4jXgfOj/viI08I2v7j4zkJH4=; b=Yx8W42JTBihT/Te+aM97vHBEId
	XUe/1zNTydEd/8KmlziNKFh16Snd9lvY5xDkQtug1Bk2y/J4YETOCj+BvOJuhaUbWKMaMIgd3dn11
	RYJZr+AobDUmmYNdOGbOnOjLc2lWuEzyWCGzFoxJ0qu3kGM2HZ3abIxn7hU4q72C6krnos0I6hc0O
	Tdl9HMrXgP5/zldRuKY/gFZQyMJ3J+5P1ArNZYwp6YqzR7OxhYOKGr+jZaHY8nI3xtwH1uGgK7G6y
	0wb4XuSVOm1ThQHovo9WYspUPE7XzB2OAAdcjoJOizKF4QyTpZvk+VwgM+cyi1ELP/BAvKef+x/wf
	pV/iKbxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3csh-0000000DAFv-12EO;
	Fri, 20 Mar 2026 16:39:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3cse-0000000DAEt-27WB
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Mar 2026 16:39:25 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 46592165C;
	Fri, 20 Mar 2026 09:39:17 -0700 (PDT)
Received: from [10.1.29.20] (e122027.cambridge.arm.com [10.1.29.20])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 415983F7BD;
	Fri, 20 Mar 2026 09:39:19 -0700 (PDT)
Message-ID: <33150925-095a-485f-83a9-34b6fb9fbd6a@arm.com>
Date: Fri, 20 Mar 2026 16:39:16 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v13 23/48] KVM: arm64: Expose support for private memory
To: Wei-Lin Chang <weilin.chang@arm.com>, kvm@vger.kernel.org,
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
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>,
 Vishal Annapurve <vannapurve@google.com>
References: <20260318155413.793430-1-steven.price@arm.com>
 <20260318155413.793430-24-steven.price@arm.com>
 <ea5hsyyhitiemen6hsacrig3g72igi3rgms3ja2n7jlhumsjjh@mkkk65t4to2p>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <ea5hsyyhitiemen6hsacrig3g72igi3rgms3ja2n7jlhumsjjh@mkkk65t4to2p>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260320_093924_635597_6C1FAA41 
X-CRM114-Status: GOOD (  18.71  )
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

On 19/03/2026 19:01, Wei-Lin Chang wrote:
> On Wed, Mar 18, 2026 at 03:53:47PM +0000, Steven Price wrote:
>> Select KVM_GENERIC_MEMORY_ATTRIBUTES and provide the necessary support
>> functions.
>>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v12:
>>  * Only define kvm_arch_has_private_mem() when
>>    CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES is set to avoid build issues
>>    when KVM is disabled.
>> Changes since v10:
>>  * KVM_GENERIC_PRIVATE_MEM replacd with KVM_GENERIC_MEMORY_ATTRIBUTES.
>> Changes since v9:
>>  * Drop the #ifdef CONFIG_KVM_PRIVATE_MEM guard from the definition of
>>    kvm_arch_has_private_mem()
>> Changes since v2:
>>  * Switch kvm_arch_has_private_mem() to a macro to avoid overhead of a
>>    function call.
>>  * Guard definitions of kvm_arch_{pre,post}_set_memory_attributes() with
>>    #ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES.
>>  * Early out in kvm_arch_post_set_memory_attributes() if the WARN_ON
>>    should trigger.
>> ---
>>  arch/arm64/include/asm/kvm_host.h |  4 ++++
>>  arch/arm64/kvm/Kconfig            |  1 +
>>  arch/arm64/kvm/mmu.c              | 24 ++++++++++++++++++++++++
>>  3 files changed, 29 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
>> index 64304848aad4..1efea996f474 100644
>> --- a/arch/arm64/include/asm/kvm_host.h
>> +++ b/arch/arm64/include/asm/kvm_host.h
>> @@ -1486,6 +1486,10 @@ struct kvm *kvm_arch_alloc_vm(void);
>>  
>>  #define vcpu_is_protected(vcpu)		kvm_vm_is_protected((vcpu)->kvm)
>>  
>> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
>> +#define kvm_arch_has_private_mem(kvm) ((kvm)->arch.is_realm)
>> +#endif
>> +
>>  int kvm_arm_vcpu_finalize(struct kvm_vcpu *vcpu, int feature);
>>  bool kvm_arm_vcpu_is_finalized(struct kvm_vcpu *vcpu);
>>  
>> diff --git a/arch/arm64/kvm/Kconfig b/arch/arm64/kvm/Kconfig
>> index 4f803fd1c99a..1cac6dfc0972 100644
>> --- a/arch/arm64/kvm/Kconfig
>> +++ b/arch/arm64/kvm/Kconfig
>> @@ -38,6 +38,7 @@ menuconfig KVM
>>  	select SCHED_INFO
>>  	select GUEST_PERF_EVENTS if PERF_EVENTS
>>  	select KVM_GUEST_MEMFD
>> +	select KVM_GENERIC_MEMORY_ATTRIBUTES
> 
> Hi,
> 
> I believe we should also add this:
> 
> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
> index bfa0ab343081..13722f876dcd 100644
> --- a/Documentation/virt/kvm/api.rst
> +++ b/Documentation/virt/kvm/api.rst
> @@ -6365,7 +6365,7 @@ Returns -EINVAL if called on a protected VM.
>  -------------------------------
>  
>  :Capability: KVM_CAP_MEMORY_ATTRIBUTES
> -:Architectures: x86
> +:Architectures: x86, arm64
>  :Type: vm ioctl
>  :Parameters: struct kvm_memory_attributes (in)
>  :Returns: 0 on success, <0 on error

Good spot.

Thanks,
Steve

> 
> Thanks,
> Wei-Lin Chang
> 
>>  	help
>>  	  Support hosting virtualized guest machines.
>>  
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index b705ad6c6c8b..bad93938acdb 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -2494,6 +2494,30 @@ int kvm_arch_prepare_memory_region(struct kvm *kvm,
>>  	return ret;
>>  }
>>  
>> +#ifdef CONFIG_KVM_GENERIC_MEMORY_ATTRIBUTES
>> +bool kvm_arch_pre_set_memory_attributes(struct kvm *kvm,
>> +					struct kvm_gfn_range *range)
>> +{
>> +	WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm));
>> +	return false;
>> +}
>> +
>> +bool kvm_arch_post_set_memory_attributes(struct kvm *kvm,
>> +					 struct kvm_gfn_range *range)
>> +{
>> +	if (WARN_ON_ONCE(!kvm_arch_has_private_mem(kvm)))
>> +		return false;
>> +
>> +	if (range->arg.attributes & KVM_MEMORY_ATTRIBUTE_PRIVATE)
>> +		range->attr_filter = KVM_FILTER_SHARED;
>> +	else
>> +		range->attr_filter = KVM_FILTER_PRIVATE;
>> +	kvm_unmap_gfn_range(kvm, range);
>> +
>> +	return false;
>> +}
>> +#endif
>> +
>>  void kvm_arch_free_memslot(struct kvm *kvm, struct kvm_memory_slot *slot)
>>  {
>>  }
>> -- 
>> 2.43.0
>>


