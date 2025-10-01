Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D1AECAC5BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Oct 2025 15:54:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MuhU57g0ePRs2VUdASztQsed9zwHpVhPHphcOslECPI=; b=Cf5hUY6j0iRXSX8CZLfwpY5aXF
	xOm1tN2oiggKFg/UaWxhyr9uVIhx0v5fVKnGnnOvOyUpJscpgtlspUKvTnw0ZYpJbVm0uWhE+8ZsC
	FGL4PmPKCLhHaxmIfU9ghDAJcGbMGzoAcig/ezGQFhLjS8q5ffoI79GrPuWY9vT81lFoagUT/1Nix
	rEQ/+q3RkUuFZr7ZgtsjlylrJ0KQNbBWHrFmMDUEyh/QsOS2gu1mMBzlJmSu5s1qVimn8EtVSN3Rl
	yGleWeC7OtT+0rTut14uDrscmFh06Ce6lgiIBVzYCruG6+A6WPBP454og2+1yZzmszXJXHgnm34Dl
	X2ep9ycg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3zA2-00000008SWF-2KyV;
	Wed, 01 Oct 2025 15:54:34 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v3z9z-00000008SVQ-3OIi
	for linux-arm-kernel@lists.infradead.org;
	Wed, 01 Oct 2025 15:54:33 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 6EA751692;
	Wed,  1 Oct 2025 08:54:21 -0700 (PDT)
Received: from [10.57.0.204] (unknown [10.57.0.204])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CFFF43F66E;
	Wed,  1 Oct 2025 08:54:23 -0700 (PDT)
Message-ID: <a89b9047-7d0c-41c7-93a3-f31e55315ebd@arm.com>
Date: Wed, 1 Oct 2025 16:54:21 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v10 09/43] KVM: arm64: Allow passing machine type in KVM
 creation
To: Marc Zyngier <maz@kernel.org>
Cc: kvm@vger.kernel.org, kvmarm@lists.linux.dev,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 James Morse <james.morse@arm.com>, Oliver Upton <oliver.upton@linux.dev>,
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
References: <20250820145606.180644-1-steven.price@arm.com>
 <20250820145606.180644-10-steven.price@arm.com>
 <86frc2zq6m.wl-maz@kernel.org>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <86frc2zq6m.wl-maz@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251001_085431_928651_8D093776 
X-CRM114-Status: GOOD (  33.33  )
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

On 01/10/2025 14:50, Marc Zyngier wrote:
> On Wed, 20 Aug 2025 15:55:29 +0100,
> Steven Price <steven.price@arm.com> wrote:
>>
>> Previously machine type was used purely for specifying the physical
>> address size of the guest. Reserve the higher bits to specify an ARM
>> specific machine type and declare a new type 'KVM_VM_TYPE_ARM_REALM'
>> used to create a realm guest.
>>
>> Reviewed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Reviewed-by: Gavin Shan <gshan@redhat.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes since v9:
>>  * Explictly set realm.state to REALM_STATE_NONE rather than rely on the
>>    zeroing of the structure.
>> Changes since v7:
>>  * Add some documentation explaining the new machine type.
>> Changes since v6:
>>  * Make the check for kvm_rme_is_available more visible and report an
>>    error code of -EPERM (instead of -EINVAL) to make it explicit that
>>    the kernel supports RME, but the platform doesn't.
>> ---
>>  Documentation/virt/kvm/api.rst | 16 ++++++++++++++--
>>  arch/arm64/kvm/arm.c           | 16 ++++++++++++++++
>>  arch/arm64/kvm/mmu.c           |  3 ---
>>  include/uapi/linux/kvm.h       | 19 +++++++++++++++----
>>  4 files changed, 45 insertions(+), 9 deletions(-)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/api.rst
>> index 69c0a9eba6c5..fad3191df311 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -181,8 +181,20 @@ flag KVM_VM_MIPS_VZ.
>>  ARM64:
>>  ^^^^^^
>>  
>> -On arm64, the physical address size for a VM (IPA Size limit) is limited
>> -to 40bits by default. The limit can be configured if the host supports the
>> +On arm64, the machine type identifier is used to encode a type and the
>> +physical address size for the VM. The lower byte (bits[7-0]) encode the
>> +address size and the upper bits[11-8] encode a machine type. The machine
>> +types that might be available are:
>> +
>> + ======================   ============================================
>> + KVM_VM_TYPE_ARM_NORMAL   A standard VM
>> + KVM_VM_TYPE_ARM_REALM    A "Realm" VM using the Arm Confidential
>> +                          Compute extensions, the VM's memory is
>> +                          protected from the host.
>> + ======================   ============================================
>> +
>> +The physical address size for a VM (IPA Size limit) is limited to 40bits
>> +by default. The limit can be configured if the host supports the
>>  extension KVM_CAP_ARM_VM_IPA_SIZE. When supported, use
>>  KVM_VM_TYPE_ARM_IPA_SIZE(IPA_Bits) to set the size in the machine type
>>  identifier, where IPA_Bits is the maximum width of any physical
>> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
>> index 8c0e9ec34f0a..5b582b705eee 100644
>> --- a/arch/arm64/kvm/arm.c
>> +++ b/arch/arm64/kvm/arm.c
>> @@ -172,6 +172,22 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>>  	mutex_unlock(&kvm->lock);
>>  #endif
>>  
>> +	if (type & ~(KVM_VM_TYPE_ARM_MASK | KVM_VM_TYPE_ARM_IPA_SIZE_MASK))
>> +		return -EINVAL;
>> +
>> +	switch (type & KVM_VM_TYPE_ARM_MASK) {
>> +	case KVM_VM_TYPE_ARM_NORMAL:
>> +		break;
>> +	case KVM_VM_TYPE_ARM_REALM:
>> +		if (!static_branch_unlikely(&kvm_rme_is_available))
>> +			return -EPERM;
> 
> EPERM? That's rather odd. You can only do that if the CCA capability
> has been advertised. So asking for it when you can find that it is not
> there deserves more of an EINVAL response.

Ack

>> +		WRITE_ONCE(kvm->arch.realm.state, REALM_STATE_NONE);
>> +		kvm->arch.is_realm = true;
>> +		break;
>> +	default:
>> +		return -EINVAL;
>> +	}
>> +
>>  	kvm_init_nested(kvm);
>>  
>>  	ret = kvm_share_hyp(kvm, kvm + 1);
>> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
>> index de10dbde4761..130f28dfb3cb 100644
>> --- a/arch/arm64/kvm/mmu.c
>> +++ b/arch/arm64/kvm/mmu.c
>> @@ -881,9 +881,6 @@ static int kvm_init_ipa_range(struct kvm *kvm,
>>  	if (kvm_is_realm(kvm))
>>  		kvm_ipa_limit = kvm_realm_ipa_limit();
>>  
>> -	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>> -		return -EINVAL;
>> -
> 
> How about the *other* bits? You need to be able to detect that
> userspace is using the reserved bits and error out.

That check is now further up in kvm_arch_init_vm():

>> +	if (type & ~(KVM_VM_TYPE_ARM_MASK | KVM_VM_TYPE_ARM_IPA_SIZE_MASK))
>> +		return -EINVAL;

(along with the default branch in the switch handling unknown 'types')

>>  	phys_shift = KVM_VM_TYPE_ARM_IPA_SIZE(type);
>>  	if (is_protected_kvm_enabled()) {
>>  		phys_shift = kvm_ipa_limit;
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 7dafb443368a..b70ecee918de 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -672,14 +672,25 @@ struct kvm_enable_cap {
>>  #define KVM_S390_SIE_PAGE_OFFSET 1
>>  
>>  /*
>> - * On arm64, machine type can be used to request the physical
>> - * address size for the VM. Bits[7-0] are reserved for the guest
>> - * PA size shift (i.e, log2(PA_Size)). For backward compatibility,
>> - * value 0 implies the default IPA size, 40bits.
>> + * On arm64, machine type can be used to request both the machine type and
>> + * the physical address size for the VM.
>> + *
>> + * Bits[11-8] are reserved for the ARM specific machine type.
>> + *
>> + * Bits[7-0] are reserved for the guest PA size shift (i.e, log2(PA_Size)).
>> + * For backward compatibility, value 0 implies the default IPA size, 40bits.
>>   */
>> +#define KVM_VM_TYPE_ARM_SHIFT		8
>> +#define KVM_VM_TYPE_ARM_MASK		(0xfULL << KVM_VM_TYPE_ARM_SHIFT)
>> +#define KVM_VM_TYPE_ARM(_type)		\
>> +	(((_type) << KVM_VM_TYPE_ARM_SHIFT) & KVM_VM_TYPE_ARM_MASK)
>> +#define KVM_VM_TYPE_ARM_NORMAL		KVM_VM_TYPE_ARM(0)
>> +#define KVM_VM_TYPE_ARM_REALM		KVM_VM_TYPE_ARM(1)
> 
> Why can't that be just "PROTECTED", using bit 31, just like pKVM?  I
> don't see the point in deviating from an established practice.

As far as I'm aware this pKVM practise isn't upstream. We also need to
distinguish between pKVM and CCA - it's entirely possible that both
might coexist on the same platform.

This is just extending a proposal that Will posted years ago[1] for pkvm
with room for more types - that used bit 8 for a
KVM_VM_TYPE_ARM_PROTECTED flag. I agree there might be an argument for
the realm type being 2 if we want to keep 1 for pKVM. But it looks like
downstream pKVM has done something different and incompatible anyway.

Thanks,
Steve

[1]
https://lists.infradead.org/pipermail/linux-arm-kernel/2022-May/744865.html

