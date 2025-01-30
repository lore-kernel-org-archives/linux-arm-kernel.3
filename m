Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDA84C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jan 2025 14:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2KjwHI3YMt0/+O01Pl8e45GedVMGb4BxQmnccxG/FEg=; b=YZTNg1KX/D6leQG4/fs9K4CCf6
	JeeyiL7KHRQtar583ouLBQoNS7yqBiz8e66JbUIV5N7ZqDIprAWrujNcj0q/SaH9Bq1WqEW2+b2WW
	0yM9cwWnyJBKhoP+T/zKof4YXll/xgy8EEpkPd5V0IdlE2ZPxBcxUYfHHZfl0cL0MjmDVmTSW5+Q8
	c3jGJCeOduEhpE6M3litFUXx5IYihZF7GQZFLb2YU3zx33BYpFPe0w7yK7MNFjo1ZFl+mTLRUsF6B
	kFIo3DGV62DtaFMT0mtnpAI30JR6/a3NV+ZjycylY6aEesUqzDw0eyGxwWEZvgYAOU/Xy9sNxgq+Q
	qlAKfYgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVL2-00000008xKb-2Rng;
	Thu, 30 Jan 2025 14:16:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdVJi-00000008xBs-2fUN
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jan 2025 14:14:52 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 940B1497;
	Thu, 30 Jan 2025 06:15:14 -0800 (PST)
Received: from [10.1.32.52] (e122027.cambridge.arm.com [10.1.32.52])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3BF713F694;
	Thu, 30 Jan 2025 06:14:45 -0800 (PST)
Message-ID: <1356de81-2fa1-4ad5-80bd-d02440603288@arm.com>
Date: Thu, 30 Jan 2025 14:14:43 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 10/43] arm64: kvm: Allow passing machine type in KVM
 creation
To: Gavin Shan <gshan@redhat.com>, kvm@vger.kernel.org, kvmarm@lists.linux.dev
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
 Shanker Donthineni <sdonthineni@nvidia.com>, Alper Gun
 <alpergun@google.com>, "Aneesh Kumar K . V" <aneesh.kumar@kernel.org>
References: <20241212155610.76522-1-steven.price@arm.com>
 <20241212155610.76522-11-steven.price@arm.com>
 <a580d287-2fb0-4e9d-adbb-57e4dbf25765@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <a580d287-2fb0-4e9d-adbb-57e4dbf25765@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250130_061450_767920_23A5F5BF 
X-CRM114-Status: GOOD (  18.25  )
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

On 29/01/2025 04:07, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> Previously machine type was used purely for specifying the physical
>> address size of the guest. Reserve the higher bits to specify an ARM
>> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
>> used to create a realm guest.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>>   arch/arm64/kvm/arm.c     | 17 +++++++++++++++++
>>   arch/arm64/kvm/mmu.c     |  3 ---
>>   include/uapi/linux/kvm.h | 19 +++++++++++++++----
>>   3 files changed, 32 insertions(+), 7 deletions(-)
>>
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index c505ec61180a..73016e1e0067 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -207,6 +207,23 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned
>> long type)
>>       mutex_unlock(&kvm->lock);
>>   #endif
>>   +    if (type & ~(KVM_VM_TYPE_ARM_MASK |
>> KVM_VM_TYPE_ARM_IPA_SIZE_MASK))
>> +        return -EINVAL;
>> +
>> +    switch (type & KVM_VM_TYPE_ARM_MASK) {
>> +    case KVM_VM_TYPE_ARM_NORMAL:
>> +        break;
>> +    case KVM_VM_TYPE_ARM_REALM:
>> +        kvm->arch.is_realm = true;
>> +        if (!kvm_is_realm(kvm)) {
>> +            /* Realm support unavailable */
>> +            return -EINVAL;
>> +        }
>> +        break;
>> +    default:
>> +        return -EINVAL;
>> +    }
>> +
>>       kvm_init_nested(kvm);
>>         ret = kvm_share_hyp(kvm, kvm + 1);
> 
> Corresponding to comments for PATCH[6], the block of the code can be
> modified
> to avoid using kvm_is_realm() here. In this way, kvm_is_realm() can be
> simplifed
> as I commented for PATCH[6].
> 
>     case KVM_VM_TYPE_ARM_REALM:
>         if (static_branch_unlikely(&kvm_rme_is_available))
>             return -EPERM;    /* -EPERM may be more suitable than -
> EINVAL */
> 
>         kvm->arch.is_realm = true;
>         break;

Yes that's more readable. I'd used kvm_is_realm() because I wanted to
keep the check on kvm_rme_is_available to one place, but coming back to
the code there's definitely a "Huh?" moment from setting 'is_realm' and
then testing if it's a realm!

I also agree -EPERM is probably better to signify that the kernel
supports realms but the hardware doesn't.

Thanks,

Steve


