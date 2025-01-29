Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71527C0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 16:33:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=byiVld+Q14b4wqtFruYG/RojbXAMzaQCOSXjxOSNz0E=; b=fMyMLQrWatn5WFkmT3ko1DjR7J
	uWVuWOa6UQQtSdhiRhh91MKZcaDaLlyKC/vDyd81rHWY0S8Y8xby5j5TjwmfAqvZfoTECwZt5Lloh
	zaUQb8WOKE1nACepqPOb+5ir7Cvn9YVAM0Qg38rlhNHHWVfWeV4aswB3eMbDhpLVDE308IgQpbLfY
	xuLERVCv4RwuAJS9lDxS2FEVdKYJmnP5rWXCKcem4T2uR+0eNeA88uA1JJA/vysDx6btQw0SlXrRN
	uUK8MXHtKpKo/+lQno0htX2F34LIY1/Ncmd4b+ANTUjOxaPnG5uq7qh1w88xyw59QACb1DQ1gAUeY
	tZsnOfIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAzo-00000007OTR-16vd;
	Wed, 29 Jan 2025 16:32:56 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tdAyU-00000007ONf-2l6s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 16:31:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 18077497;
	Wed, 29 Jan 2025 08:31:59 -0800 (PST)
Received: from [10.57.77.31] (unknown [10.57.77.31])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 97C3E3F63F;
	Wed, 29 Jan 2025 08:31:28 -0800 (PST)
Message-ID: <864f4228-43fc-46cc-b63e-37004fdacfe6@arm.com>
Date: Wed, 29 Jan 2025 16:31:26 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v6 07/43] arm64: RME: Define the user ABI
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
 <20241212155610.76522-8-steven.price@arm.com>
 <f6668e66-313a-4c56-92ba-08855878ebf9@redhat.com>
From: Steven Price <steven.price@arm.com>
Content-Language: en-GB
In-Reply-To: <f6668e66-313a-4c56-92ba-08855878ebf9@redhat.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_083134_786568_C1EA5F8C 
X-CRM114-Status: GOOD (  31.21  )
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

On 28/01/2025 23:51, Gavin Shan wrote:
> On 12/13/24 1:55 AM, Steven Price wrote:
>> There is one (multiplexed) CAP which can be used to create, populate and
>> then activate the realm.
>>
>> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
>> Signed-off-by: Steven Price <steven.price@arm.com>
>> ---
>> Changes from v5:
>>   * Actually expose the new VCPU capability (KVM_ARM_VCPU_REC) by bumping
>>     KVM_VCPU_MAX_FEATURES - note this also exposes KVM_ARM_VCPU_HAS_EL2!
>> ---
>>   Documentation/virt/kvm/api.rst    |  1 +
>>   arch/arm64/include/uapi/asm/kvm.h | 49 +++++++++++++++++++++++++++++++
>>   include/uapi/linux/kvm.h          | 12 ++++++++
>>   3 files changed, 62 insertions(+)
>>
>> diff --git a/Documentation/virt/kvm/api.rst b/Documentation/virt/kvm/
>> api.rst
>> index 454c2aaa155e..df4679415a4c 100644
>> --- a/Documentation/virt/kvm/api.rst
>> +++ b/Documentation/virt/kvm/api.rst
>> @@ -5088,6 +5088,7 @@ Recognised values for feature:
>>       =====      ===========================================
>>     arm64      KVM_ARM_VCPU_SVE (requires KVM_CAP_ARM_SVE)
>> +  arm64      KVM_ARM_VCPU_REC (requires KVM_CAP_ARM_RME)
>>     =====      ===========================================
>>     Finalizes the configuration of the specified vcpu feature.
>> diff --git a/arch/arm64/include/uapi/asm/kvm.h b/arch/arm64/include/
>> uapi/asm/kvm.h
>> index 66736ff04011..8810719523ec 100644
>> --- a/arch/arm64/include/uapi/asm/kvm.h
>> +++ b/arch/arm64/include/uapi/asm/kvm.h
>> @@ -108,6 +108,7 @@ struct kvm_regs {
>>   #define KVM_ARM_VCPU_PTRAUTH_ADDRESS    5 /* VCPU uses address
>> authentication */
>>   #define KVM_ARM_VCPU_PTRAUTH_GENERIC    6 /* VCPU uses generic
>> authentication */
>>   #define KVM_ARM_VCPU_HAS_EL2        7 /* Support nested
>> virtualization */
>> +#define KVM_ARM_VCPU_REC        8 /* VCPU REC state as part of Realm */
>>     struct kvm_vcpu_init {
>>       __u32 target;
>> @@ -418,6 +419,54 @@ enum {
>>   #define   KVM_DEV_ARM_VGIC_SAVE_PENDING_TABLES    3
>>   #define   KVM_DEV_ARM_ITS_CTRL_RESET        4
>>   +/* KVM_CAP_ARM_RME on VM fd */
>> +#define KVM_CAP_ARM_RME_CONFIG_REALM        0
>> +#define KVM_CAP_ARM_RME_CREATE_RD        1
>> +#define KVM_CAP_ARM_RME_INIT_IPA_REALM        2
>> +#define KVM_CAP_ARM_RME_POPULATE_REALM        3
>> +#define KVM_CAP_ARM_RME_ACTIVATE_REALM        4
>> +
> 
> I guess it would be nice to rename KVM_CAP_ARM_RME_CREATE_RD to
> KVM_CAP_ARM_RME_CREATE_REALM
> since it's to create a realm. All other macros have suffix "_REALM".

This makes sense - the RMI call is RMI_REALM_CREATE so there's no need
to use the RMM jargon of 'RD' in the public interface here.

> Besides, KVM_CAP_ARM_RME_INIT_IPA_REALM
> would be KVM_CAP_ARM_RME_INIT_REALM_IPA, and
> KVM_CAP_ARM_RME_POPULATE_REALM would be
> KVM_CAP_ARM_RME_POPULATE_REALM_IPA. Something like below.
> 
> /* KVM_CAP_ARM_RME on VM fd */
> #define KVM_CAP_ARM_RME_CONFIG_REALM        0
> #define KVM_CAP_ARM_RME_CREATE_RD        1
> #define KVM_CAP_ARM_RME_INIT_REALM_IPA        2
> #define KVM_CAP_ARM_RME_POPULATE_REALM_IPA    3
> #define KVM_CAP_ARM_RME_ACTIVATE_REALM        4

I'm a little confused here. You've got CREATE_RD again (was that a
mistake?). But the other two changes seem odd to me:

 * INIT_IPA_REALM vs INIT_REALM_IPA. Both names are somewhat confusing
but I read the 'IPA' as being a adjective attached to the init verb.
It's not the IPA (intermediate physical address) that we're
initialising. Perhaps KVM_CAP_ARM_RME_INIT_RIPAS_REALM (matching the RMI
name) would be best?

 * POPULATE_REALM vs POPULATE_REALM_IPA. Again the IPA part is superfluous.

>> +#define KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256        0
>> +#define KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA512        1
>> +
>> +#define KVM_CAP_ARM_RME_RPV_SIZE 64
>> +
>> +/* List of configuration items accepted for
>> KVM_CAP_ARM_RME_CONFIG_REALM */
>> +#define KVM_CAP_ARM_RME_CFG_RPV            0
>> +#define KVM_CAP_ARM_RME_CFG_HASH_ALGO        1
>> +
> 
> The comments for the list of configuration items accepted for
> KVM_CAP_ARM_RME_CONFIG_REALM,
> it shall be moved before KVM_CAP_ARM_RME_MEASUREMENT_ALGO_SHA256 to
> cover all the definitions
> applied to KVM_CAP_ARM_RME_CONFIG_REALM.

Ack

> Besides, the prefix "KVM_CAP_" in those definitions, except the first 5
> definitions like
> KVM_CAP_ARM_RME_CONFIG_REALM, are confusing. The macros with "KVM_CAP_"
> prefix are usually
> indicating capabilities. In this specific case, they're applied to the
> argument (struct),
> carried by the corresponding sub-command. So I would suggest to
> eleminate the prefix,
> something like below:
> 
> /* List of configurations accepted for KVM_CAP_ARM_RME_CONFIG_REALM */
> #define ARM_RME_CONFIG_RPV        0
> #define ARM_RME_CONFIG_HASH_ALGO    1
> 
> #define ARM_RME_CONFIG_MEASUREMENT_ALGO_SHA256    0
> #define ARM_RME_CONFIG_MEASUREMENT_ALGO_SHA512    1
> 
> #define ARM_RME_CONFIG_RPV_SIZE    64

Yes, that's clearer - thanks for the suggestion.

> struct arm_rme_config {
>         :
> };
> 
> 
>> +struct kvm_cap_arm_rme_config_item {
>> +    __u32 cfg;
>> +    union {
>> +        /* cfg == KVM_CAP_ARM_RME_CFG_RPV */
>> +        struct {
>> +            __u8    rpv[KVM_CAP_ARM_RME_RPV_SIZE];
>> +        };
>> +
>> +        /* cfg == KVM_CAP_ARM_RME_CFG_HASH_ALGO */
>> +        struct {
>> +            __u32    hash_algo;
>> +        };
>> +
>> +        /* Fix the size of the union */
>> +        __u8    reserved[256];
>> +    };
>> +};
>> +
>> +#define KVM_ARM_RME_POPULATE_FLAGS_MEASURE    BIT(0)
>> +struct kvm_cap_arm_rme_populate_realm_args {
>> +    __u64 populate_ipa_base;
>> +    __u64 populate_ipa_size;
>> +    __u32 flags;
>> +    __u32 reserved[3];
>> +};
>> +
> 
> BIT(0) has type of 'unsigned long', inconsistent to '__u32 flags'. So it
> would
> be something like below.
> 
> #define ARM_RME_POPULATE_REALM_IPA_FLAG_MEASURE        (1 << 0)

Ok, I'll change, although personally I feel BIT(0) is clearer and it
will happily convert to a u32.

> struct arm_rme_populate_realm_ipa {
>     __u64 base;
>     __u64 size;
>     __u32 flags;
>     __u32 reserved[3];
> };
> 
>> +struct kvm_cap_arm_rme_init_ipa_args {
>> +    __u64 init_ipa_base;
>> +    __u64 init_ipa_size;
>> +    __u32 reserved[4];
>> +};
>> +
> 
> Similiarly, it would be something like below:
> 
> struct arm_rme_init_realm_ipa {
>     __u64 base;
>     __u64 size;
>     __u64 reserved[2];
> };

Yes, that's better - they were somewhat repetitive before!

Thanks,
Steve

>>   /* Device Control API on vcpu fd */
>>   #define KVM_ARM_VCPU_PMU_V3_CTRL    0
>>   #define   KVM_ARM_VCPU_PMU_V3_IRQ    0
>> diff --git a/include/uapi/linux/kvm.h b/include/uapi/linux/kvm.h
>> index 502ea63b5d2e..f448198838cf 100644
>> --- a/include/uapi/linux/kvm.h
>> +++ b/include/uapi/linux/kvm.h
>> @@ -934,6 +934,8 @@ struct kvm_enable_cap {
>>   #define KVM_CAP_X86_APIC_BUS_CYCLES_NS 237
>>   #define KVM_CAP_X86_GUEST_MODE 238
>>   +#define KVM_CAP_ARM_RME 300 /* FIXME: Large number to prevent
>> conflicts */
>> +
>>   struct kvm_irq_routing_irqchip {
>>       __u32 irqchip;
>>       __u32 pin;
>> @@ -1581,4 +1583,14 @@ struct kvm_pre_fault_memory {
>>       __u64 padding[5];
>>   };
>>   +/* Available with KVM_CAP_ARM_RME, only for VMs with
>> KVM_VM_TYPE_ARM_REALM  */
>> +struct kvm_arm_rmm_psci_complete {
>> +    __u64 target_mpidr;
>> +    __u32 psci_status;
>> +    __u32 padding[3];
>> +};
>> +
>> +/* FIXME: Update nr (0xd2) when merging */
>> +#define KVM_ARM_VCPU_RMM_PSCI_COMPLETE    _IOW(KVMIO, 0xd2, struct
>> kvm_arm_rmm_psci_complete)
>> +
>>   #endif /* __LINUX_KVM_H */
> 
> Thanks,
> Gavin
> 


