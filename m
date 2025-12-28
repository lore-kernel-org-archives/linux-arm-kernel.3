Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 214C1E784BE
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 28 Dec 2025 13:21:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NsMbiiRw5pwuhYdj9qM0uJazKIcwvpy1o66u9nBUaH4=; b=xVN24/J2NeICzlKSwb5X+7deFZ
	UtujkRZstpjCuj0dak01h4Uovp9x/upqO4qbK019i7PlbQmhNdgUY1m8rYhlMukShuq9l4R2OGMxz
	BituW6iOgjeFwF5rWU+F8faFUxuX/WXp3v2rVtUPj726Ost4Uf4M1hllItGGQwbD15CY7DP/2sntW
	MsnSOTf91J2xc+kab/H9uRIK7UP6Nw3kv1KAKcgt/aDP/awOv4mpeorYxU8Ur/C9KTaL759+bYiWb
	Pyq7IWZC3M9nKoTkukUsfkB3HqNE910Z33K6eQcskxozR4+kPZSmWoq4RVf3oZag32raEpey4mQE2
	b3BsU11w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqiM-00000002m9F-3wgt;
	Sun, 28 Dec 2025 13:21:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqiM-00000002m98-0jrY
	for linux-arm-kernel@bombadil.infradead.org;
	Sun, 28 Dec 2025 13:21:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=NsMbiiRw5pwuhYdj9qM0uJazKIcwvpy1o66u9nBUaH4=; b=LWaNG2C7sXkM2raEs/s9lbksWg
	8DtVc9mmrO6l9C7V9yn9d2MQxKCUec//teVDPmesknjKrSJjFIVaeSDrlc2k9WQPUVXYhQkkUwb5b
	si6MFgMqKsA48cbMxeIRTMz98oTFYEHBuB+pK7JJ0aQyD2ab3lSJOFJVdkfUAS7AJrzSjcSbRKGqy
	cKvvDnooHWbKKzMQwVaQ3L/ss6psolOlIFeizwPuePNx9fYBtKYaDel5KElmf6uDWEkZwANhFpgGK
	5OCwOqcw2j132ahUlLsVbO8d+vl5AYqXckVQsvGgFe33YPySTTvAoaVl7XdQghZj7sUWrnW2BMCE2
	2OKtz9pw==;
Received: from mail-pf1-x432.google.com ([2607:f8b0:4864:20::432])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZqiI-000000026wu-3usW
	for linux-arm-kernel@lists.infradead.org;
	Sun, 28 Dec 2025 13:21:40 +0000
Received: by mail-pf1-x432.google.com with SMTP id d2e1a72fcca58-8035e31d834so5762357b3a.2
        for <linux-arm-kernel@lists.infradead.org>; Sun, 28 Dec 2025 05:21:37 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1766928096; x=1767532896; darn=lists.infradead.org;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :from:to:cc:subject:date:message-id:reply-to;
        bh=NsMbiiRw5pwuhYdj9qM0uJazKIcwvpy1o66u9nBUaH4=;
        b=ZQVY2u/MpjOvK62MYaE8aW+HBQTAvoyyCB3CeaSayCvR0MZfE2kpJQjhziXGp0BXTk
         lD1//PBfJSCBYVTPBktvxrIFp+p/ouiVxJ3Qlye4U7sc1yv4TmK7bKAV9kWCIFU/pTYi
         +ybIyQAhMqVExbDRqnYk44ukfOnwY4G1aSGn+/JfqvLWneuhhyNyj9RXdxITDqTQnbly
         4r8QIInbflBPM+DqwlwXXUTrT/Kt1LfR5dtm6WlTJb+6oMIBidXYGJrhVKVOmmFP7uaX
         FmvJtdExELLjmECzRydWE38qdEaNtZFlNSSh1EcWCFGiVFiUnx3oCD0UYmFxmLAMayb1
         zk+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1766928096; x=1767532896;
        h=content-transfer-encoding:in-reply-to:from:content-language
         :references:cc:to:subject:user-agent:mime-version:date:message-id
         :x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=NsMbiiRw5pwuhYdj9qM0uJazKIcwvpy1o66u9nBUaH4=;
        b=YctsJSbNd0o0ceRnOgVmu5krXi2sHPXAmDeU+jStLFZKq6wpHMrPagUxjco5AcKZQy
         /EAR+LfnMA0EbCCP8PN7gtZs971rPVbYhJMxjfljGB7XZrc8LK3AdBXqQAMn/38BSueL
         B8n6yRF4HTMdXqsto93ORqkXJ4qq+t44urCZIe8bbtLiw9jZsODQoYbYI4SZvhlN12sc
         FS35LuGwJKhLr8dU//wLgJ05dqyV4FCNBZH1ccSkIXEeYJEo5TvX2/pVNeMnWzWQ/4c4
         KZ/VtlWFfSJ+i62hWOjagmnYZ1rVCct0uRo5e2aOzwTPOpqNljxXQG8i0yr5ibaqDo/X
         011A==
X-Forwarded-Encrypted: i=1; AJvYcCXNAblEUJJmnQFeDnZgUXf/btNQ39B0pUaQYk9rKZltL1MNkmcfNj3u1Kx9r9F6LenpwTdJt/rwlP+7cHvO4/uY@lists.infradead.org
X-Gm-Message-State: AOJu0YyV0pv/Z/QNY3hEkNR6PzzsfZvIjfEViWKFdLXEL7Hc67CTIEZs
	QY8b0W4HVBN7ZE4ytJFN/w5KEfe9u6f4JXlSbHTnbMwQaZxddXjmMQiq
X-Gm-Gg: AY/fxX5YuDhxy26eCTonn6hXDN2l54JxXuuOcZuul0/hNDmF8qlaejRF3m6TtmpBeOr
	G8uAjNsv3JbJ/e23fWF9IYZ4UvhhfaQ2ANckzcELA0dsA3mZnFFIPO597m0j/KqsWDbzN9Tm+lc
	c9s32WYKniJJwu4Z1+Mo5hdBECsKQC/UVlHB9dbUKBBClCTzruKarMqoPg1SdNi0J/BwvQ+YE92
	pwFMMIDlQ9xDR0EL9PCuIZuNhZMst1hynQPMSQG6v5HpsiO3RB4MEIlSmp4Bk51aGyIZklhCzJv
	kuEbxEBfabcDBdYtiJEQk4H9StFTMk6nKGcjZskI/oSBY8naeFMYJnL4Xx1wB6UgPNM64pxU63R
	uFjuJl/WdJ1J1jWzgZy+aoEOR0uQkPTO+5NXQdLEKwgagD9z6zbF0wq6KhbaflH+tRNuO9N9IHu
	Tz7SmNaov4XJK9w7/xK/qmY/w+cT0EiWHfQR9IFkMOEaizwPBuJ4/7jTxJbMOCqLNoQZkXoSDez
	pmgJCLF6UHl6NzyhGOGmbO9le+R6ghzoN/A6Q==
X-Google-Smtp-Source: AGHT+IHeg/aDmTAdO7reMjcuq8FZ1iHZdOJNA4rNPYOoWbba+9Xx9UUwrhaHrn5Pm5j+3g0csgItJg==
X-Received: by 2002:a05:6a20:e290:b0:364:13c3:3dd0 with SMTP id adf61e73a8af0-376a8eb6c35mr29010710637.36.1766928096301;
        Sun, 28 Dec 2025 05:21:36 -0800 (PST)
Received: from [172.27.236.57] (ec2-13-250-3-147.ap-southeast-1.compute.amazonaws.com. [13.250.3.147])
        by smtp.gmail.com with ESMTPSA id 41be03b00d2f7-c1e7bd602desm24490702a12.21.2025.12.28.05.21.27
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Sun, 28 Dec 2025 05:21:34 -0800 (PST)
Message-ID: <77111894-1b9f-4970-b41f-48e3a4c4b754@gmail.com>
Date: Sun, 28 Dec 2025 21:21:25 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 4/5] KVM: arm64: Enable HDBSS support and handle HDBSSF
 events
To: Tian Zheng <zhengtian10@huawei.com>, maz@kernel.org,
 oliver.upton@linux.dev, catalin.marinas@arm.com, corbet@lwn.net,
 pbonzini@redhat.com, will@kernel.org
Cc: linux-kernel@vger.kernel.org, yuzenghui@huawei.com,
 wangzhou1@hisilicon.com, yezhenyu2@huawei.com, xiexiangyou@huawei.com,
 zhengchuan@huawei.com, joey.gouly@arm.com, kvmarm@lists.linux.dev,
 kvm@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-doc@vger.kernel.org, suzuki.poulose@arm.com
References: <20251121092342.3393318-1-zhengtian10@huawei.com>
 <20251121092342.3393318-5-zhengtian10@huawei.com>
 <87df4cba-b191-49cf-9486-fc379470a6eb@gmail.com>
 <f8e59e80-33b2-47cd-a042-11f28cc61645@huawei.com>
Content-Language: en-US
From: Robert Hoo <robert.hoo.linux@gmail.com>
In-Reply-To: <f8e59e80-33b2-47cd-a042-11f28cc61645@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_132139_113767_7E86953A 
X-CRM114-Status: GOOD (  21.52  )
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

On 12/24/2025 2:15 PM, Tian Zheng wrote:
> 
> 
> On 12/17/2025 9:39 PM, Robert Hoo wrote:
>> On 11/21/2025 5:23 PM, Tian Zheng wrote:
>>> From: eillon <yezhenyu2@huawei.com>
>>>
>>> Implement the HDBSS enable/disable functionality using the
>>> KVM_CAP_ARM_HW_DIRTY_STATE_TRACK ioctl.
>>>
>>> Userspace (e.g., QEMU) can enable HDBSS by invoking the ioctl
>>> at the start of live migration, configuring the buffer size.
>>> The feature is disabled by invoking the ioctl again with size
>>> set to 0 once migration completes.
>>>
>>> Add support for updating the dirty bitmap based on the HDBSS
>>> buffer. Similar to the x86 PML implementation, KVM flushes the
>>> buffer on all VM-Exits, so running vCPUs only need to be kicked
>>> to force a VM-Exit.
>>>
>>> Signed-off-by: eillon <yezhenyu2@huawei.com>
>>> Signed-off-by: Tian Zheng <zhengtian10@huawei.com>
>>> ---
>>>   arch/arm64/include/asm/kvm_host.h |  10 +++
>>>   arch/arm64/include/asm/kvm_mmu.h  |  17 +++++
>>>   arch/arm64/kvm/arm.c              | 107 ++++++++++++++++++++++++++++++
>>>   arch/arm64/kvm/handle_exit.c      |  45 +++++++++++++
>>>   arch/arm64/kvm/hyp/vhe/switch.c   |   1 +
>>>   arch/arm64/kvm/mmu.c              |  10 +++
>>>   arch/arm64/kvm/reset.c            |   3 +
>>>   include/linux/kvm_host.h          |   1 +
>>>   8 files changed, 194 insertions(+)
>>>
>>> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/ 
>>> asm/kvm_host.h
>>> index d962932f0e5f..408e4c2b3d1a 100644
>>> --- a/arch/arm64/include/asm/kvm_host.h
>>> +++ b/arch/arm64/include/asm/kvm_host.h
>>> @@ -87,6 +87,7 @@ int __init kvm_arm_init_sve(void);
>>>   u32 __attribute_const__ kvm_target_cpu(void);
>>>   void kvm_reset_vcpu(struct kvm_vcpu *vcpu);
>>>   void kvm_arm_vcpu_destroy(struct kvm_vcpu *vcpu);
>>> +void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu);
>>>
>>>   struct kvm_hyp_memcache {
>>>       phys_addr_t head;
>>> @@ -793,6 +794,12 @@ struct vcpu_reset_state {
>>>       bool        reset;
>>>   };
>>>
>>> +struct vcpu_hdbss_state {
>>> +    phys_addr_t base_phys;
>>> +    u32 size;
>>> +    u32 next_index;
>>> +};
>>> +
>>>   struct vncr_tlb;
>>>
>>>   struct kvm_vcpu_arch {
>>> @@ -897,6 +904,9 @@ struct kvm_vcpu_arch {
>>>
>>>       /* Per-vcpu TLB for VNCR_EL2 -- NULL when !NV */
>>>       struct vncr_tlb    *vncr_tlb;
>>> +
>>> +    /* HDBSS registers info */
>>> +    struct vcpu_hdbss_state hdbss;
>>>   };
>>>
>>>   /*
>>> diff --git a/arch/arm64/include/asm/kvm_mmu.h b/arch/arm64/include/ 
>>> asm/kvm_mmu.h
>>> index e4069f2ce642..6ace1080aed5 100644
>>> --- a/arch/arm64/include/asm/kvm_mmu.h
>>> +++ b/arch/arm64/include/asm/kvm_mmu.h
>>> @@ -331,6 +331,23 @@ static __always_inline void __load_stage2(struct 
>>> kvm_s2_mmu *mmu,
>>>       asm(ALTERNATIVE("nop", "isb", ARM64_WORKAROUND_SPECULATIVE_AT));
>>>   }
>>>
>>> +static __always_inline void __load_hdbss(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct kvm *kvm = vcpu->kvm;
>>> +    u64 br_el2, prod_el2;
>>> +
>>> +    if (!kvm->enable_hdbss)
>>> +        return;
>>> +
>>> +    br_el2 = HDBSSBR_EL2(vcpu->arch.hdbss.base_phys, vcpu- >arch.hdbss.size);
>>> +    prod_el2 = vcpu->arch.hdbss.next_index;
>>> +
>>> +    write_sysreg_s(br_el2, SYS_HDBSSBR_EL2);
>>> +    write_sysreg_s(prod_el2, SYS_HDBSSPROD_EL2);
>>> +
>>> +    isb();
>>> +}
>>> +
>>>   static inline struct kvm *kvm_s2_mmu_to_kvm(struct kvm_s2_mmu *mmu)
>>>   {
>>>       return container_of(mmu->arch, struct kvm, arch);
>>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>>> index 870953b4a8a7..64f65e3c2a89 100644
>>> --- a/arch/arm64/kvm/arm.c
>>> +++ b/arch/arm64/kvm/arm.c
>>> @@ -79,6 +79,92 @@ int kvm_arch_vcpu_should_kick(struct kvm_vcpu *vcpu)
>>>       return kvm_vcpu_exiting_guest_mode(vcpu) == IN_GUEST_MODE;
>>>   }
>>>
>>> +void kvm_arm_vcpu_free_hdbss(struct kvm_vcpu *vcpu)
>>> +{
>>> +    struct page *hdbss_pg = NULL;
>>> +
>>> +    hdbss_pg = phys_to_page(vcpu->arch.hdbss.base_phys);
>>> +    if (hdbss_pg)
>>> +        __free_pages(hdbss_pg, vcpu->arch.hdbss.size);
>>> +
>>> +    vcpu->arch.hdbss = (struct vcpu_hdbss_state) {
>>> +        .base_phys = 0,
>>> +        .size = 0,
>>> +        .next_index = 0,
>>> +    };
>>> +}
>>> +
>>> +static int kvm_cap_arm_enable_hdbss(struct kvm *kvm,
>>> +                    struct kvm_enable_cap *cap)
>>> +{
>>> +    unsigned long i;
>>> +    struct kvm_vcpu *vcpu;
>>> +    struct page *hdbss_pg = NULL;
>>> +    int size = cap->args[0];
>>> +    int ret = 0;
>>> +
>>> +    if (!system_supports_hdbss()) {
>>> +        kvm_err("This system does not support HDBSS!\n");
>>> +        return -EINVAL;
>>> +    }
>>> +
>>> +    if (size < 0 || size > HDBSS_MAX_SIZE) {
>>> +        kvm_err("Invalid HDBSS buffer size: %d!\n", size);
>>> +        return -EINVAL;
>>> +    }
>>> +
>>
>> I think you should check if it's already enabled here. What if user space 
>> calls this twice?
> 
> Ok, I review the implement of qemu, when disable the hdbss feature in
> ram_save_cleanup, size=0 will be set, so here can add a check, if (size
> && kvm->arch.enable_hdbss), we will do nothing.
> 

I mean you should check if ' kvm->enable_hdbss' is already set, if so, return 
rather than alloc_pages() in below (you have allocated in previous call with 
valid 'size').

qemu is just one of the user space applications that would possibly call this 
API, you cannot rely on your qemu patch's flow/sequence as assumption to design 
a KVM API's implementation.

>>
>>> +    /* Enable the HDBSS feature if size > 0, otherwise disable it. */
>>> +    if (size) {
>>> +        kvm_for_each_vcpu(i, vcpu, kvm) {
>>> +            hdbss_pg = alloc_pages(GFP_KERNEL_ACCOUNT, size);
>>> +            if (!hdbss_pg) {
>>> +                kvm_err("Alloc HDBSS buffer failed!\n");
>>> +                ret = -ENOMEM;
>>> +                goto error_alloc;
>>> +            }
>>> +
>>> +            vcpu->arch.hdbss = (struct vcpu_hdbss_state) {
>>> +                .base_phys = page_to_phys(hdbss_pg),
>>> +                .size = size,
>>> +                .next_index = 0,
>>> +            };
>>> +        }
>>> +
>>> +        kvm->enable_hdbss = true;
>>> +        kvm->arch.mmu.vtcr |= VTCR_EL2_HD | VTCR_EL2_HDBSS;
>>



