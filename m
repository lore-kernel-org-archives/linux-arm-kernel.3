Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 981CFC71155
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Jun 2025 12:05:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Vp3AfiZ2LZFjKhstHkBO9Q4OAhKCPAS39Wba1LOxZe0=; b=FolOBv49uPyrJsipla71vSnitU
	R6tSJ/UAcNhXWraBnfMCEw1zbxRdJzQhT2AxCrpU6IgP4zKMc3JuIm5uTcmf2bJzXG3x8DxGwTomd
	pEkp5mqFuJlZOt2LpM0ZzbU3kGCeVqEcfYdKjOq1dXmPcsJTVFouD4y5hqBTnF9u8Ab19ziZasmrX
	yaQbQNcj3DG2UvZsBRlfxRTxP1lzzyL12Zd2nHKCDoScMxRNOPTlS4tX2dEsz3oR9tqoLgeptEZCO
	dc9l7KtHx21yyfgRgTKG2KPBO6VHne74pJrz1EL3r1TtP62h+OCxSsAD9R0j5O24H/+1RxUTRYEjU
	wsoTeSoA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR8aM-00000004IuL-3J4x;
	Mon, 16 Jun 2025 12:05:10 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uR7Mm-000000047Bh-2GTm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Jun 2025 10:47:05 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 319F8150C;
	Mon, 16 Jun 2025 03:46:42 -0700 (PDT)
Received: from [10.1.197.1] (ewhatever.cambridge.arm.com [10.1.197.1])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3ECE33F58B;
	Mon, 16 Jun 2025 03:47:01 -0700 (PDT)
Message-ID: <8bd3f2a3-09e5-4323-b798-3788a2b70c44@arm.com>
Date: Mon, 16 Jun 2025 11:47:00 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 07/43] arm64: RME: ioctls to create and configure
 realms
To: Steven Price <steven.price@arm.com>, kvm@vger.kernel.org,
 kvmarm@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Marc Zyngier <maz@kernel.org>,
 Will Deacon <will@kernel.org>, James Morse <james.morse@arm.com>,
 Oliver Upton <oliver.upton@linux.dev>, Zenghui Yu <yuzenghui@huawei.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 Joey Gouly <joey.gouly@arm.com>, Alexandru Elisei
 <alexandru.elisei@arm.com>, Christoffer Dall <christoffer.dall@arm.com>,
 Fuad Tabba <tabba@google.com>, linux-coco@lists.linux.dev,
 Ganapatrao Kulkarni <gankulkarni@os.amperecomputing.com>,
 Gavin Shan <gshan@redhat.com>, Shanker Donthineni <sdonthineni@nvidia.com>,
 Alper Gun <alpergun@google.com>, "Aneesh Kumar K . V"
 <aneesh.kumar@kernel.org>, Emi Kisanuki <fj0570is@fujitsu.com>
References: <20250611104844.245235-1-steven.price@arm.com>
 <20250611104844.245235-8-steven.price@arm.com>
Content-Language: en-US
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250611104844.245235-8-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250616_034704_678534_38F4AC48 
X-CRM114-Status: GOOD (  41.07  )
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

On 11/06/2025 11:48, Steven Price wrote:
> Add the KVM_CAP_ARM_RME_CREATE_RD ioctl to create a realm. This involves
> delegating pages to the RMM to hold the Realm Descriptor (RD) and for
> the base level of the Realm Translation Tables (RTT). A VMID also need
> to be picked, since the RMM has a separate VMID address space a
> dedicated allocator is added for this purpose.
> 
> KVM_CAP_ARM_RME_CONFIG_REALM is provided to allow configuring the realm
> before it is created. Configuration options can be classified as:
> 
>   1. Parameters specific to the Realm stage2 (e.g. IPA Size, vmid, stage2
>      entry level, entry level RTTs, number of RTTs in start level, LPA2)
>      Most of these are not measured by RMM and comes from KVM book
>      keeping.
> 
>   2. Parameters controlling "Arm Architecture features for the VM". (e.g.
>      SVE VL, PMU counters, number of HW BRPs/WPs), configured by the VMM
>      using the "user ID register write" mechanism. These will be
>      supported in the later patches.
> 
>   3. Parameters are not part of the core Arm architecture but defined
>      by the RMM spec (e.g. Hash algorithm for measurement,
>      Personalisation value). These are programmed via
>      KVM_CAP_ARM_RME_CONFIG_REALM.
> 
> For the IPA size there is the possibility that the RMM supports a
> different size to the IPA size supported by KVM for normal guests. At
> the moment the 'normal limit' is exposed by KVM_CAP_ARM_VM_IPA_SIZE and
> the IPA size is configured by the bottom bits of vm_type in
> KVM_CREATE_VM. This means that it isn't easy for the VMM to discover
> what IPA sizes are supported for Realm guests. Since the IPA is part of
> the measurement of the realm guest the current expectation is that the
> VMM will be required to pick the IPA size demanded by attestation and
> therefore simply failing if this isn't available is fine. An option
> would be to expose a new capability ioctl to obtain the RMM's maximum
> IPA size if this is needed in the future.
> 
> Co-developed-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Suzuki K Poulose <suzuki.poulose@arm.com>
> Signed-off-by: Steven Price <steven.price@arm.com>
> Reviewed-by: Gavin Shan <gshan@redhat.com>

minor nit below.

> ---
> Changes since v8:
>   * Fix free_delegated_granule() to not call kvm_account_pgtable_pages();
>     a separate wrapper will be introduced in a later patch to deal with
>     RTTs.
>   * Minor code cleanups following review.
> Changes since v7:
>   * Minor code cleanup following Gavin's review.
> Changes since v6:
>   * Separate RMM RTT calculations from host PAGE_SIZE. This allows the
>     host page size to be larger than 4k while still communicating with an
>     RMM which uses 4k granules.
> Changes since v5:
>   * Introduce free_delegated_granule() to replace many
>     undelegate/free_page() instances and centralise the comment on
>     leaking when the undelegate fails.
>   * Several other minor improvements suggested by reviews - thanks for
>     the feedback!
> Changes since v2:
>   * Improved commit description.
>   * Improved return failures for rmi_check_version().
>   * Clear contents of PGD after it has been undelegated in case the RMM
>     left stale data.
>   * Minor changes to reflect changes in previous patches.
> ---
>   arch/arm64/include/asm/kvm_emulate.h |   5 +
>   arch/arm64/include/asm/kvm_rme.h     |  19 ++
>   arch/arm64/kvm/arm.c                 |  16 ++
>   arch/arm64/kvm/mmu.c                 |  22 +-
>   arch/arm64/kvm/rme.c                 | 321 +++++++++++++++++++++++++++
>   5 files changed, 381 insertions(+), 2 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_emulate.h b/arch/arm64/include/asm/kvm_emulate.h
> index 020ced82e5e3..a640bb7dffbc 100644
> --- a/arch/arm64/include/asm/kvm_emulate.h
> +++ b/arch/arm64/include/asm/kvm_emulate.h
> @@ -704,6 +704,11 @@ static inline enum realm_state kvm_realm_state(struct kvm *kvm)
>   	return READ_ONCE(kvm->arch.realm.state);
>   }
>   
> +static inline bool kvm_realm_is_created(struct kvm *kvm)
> +{
> +	return kvm_is_realm(kvm) && kvm_realm_state(kvm) != REALM_STATE_NONE;
> +}
> +
>   static inline bool vcpu_is_rec(struct kvm_vcpu *vcpu)
>   {
>   	return false;
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 9c8a0b23e0e4..5dc1915de891 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -6,6 +6,8 @@
>   #ifndef __ASM_KVM_RME_H
>   #define __ASM_KVM_RME_H
>   
> +#include <uapi/linux/kvm.h>
> +
>   /**
>    * enum realm_state - State of a Realm
>    */
> @@ -46,11 +48,28 @@ enum realm_state {
>    * struct realm - Additional per VM data for a Realm
>    *
>    * @state: The lifetime state machine for the realm
> + * @rd: Kernel mapping of the Realm Descriptor (RD)
> + * @params: Parameters for the RMI_REALM_CREATE command
> + * @num_aux: The number of auxiliary pages required by the RMM
> + * @vmid: VMID to be used by the RMM for the realm
> + * @ia_bits: Number of valid Input Address bits in the IPA
>    */
>   struct realm {
>   	enum realm_state state;
> +
> +	void *rd;
> +	struct realm_params *params;
> +
> +	unsigned long num_aux;
> +	unsigned int vmid;
> +	unsigned int ia_bits;
>   };
>   
>   void kvm_init_rme(void);
> +u32 kvm_realm_ipa_limit(void);
> +
> +int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
> +int kvm_init_realm_vm(struct kvm *kvm);
> +void kvm_destroy_realm(struct kvm *kvm);
>   
>   #endif /* __ASM_KVM_RME_H */
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index 59dc992274fa..d1f9ab08c5ac 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -136,6 +136,11 @@ int kvm_vm_ioctl_enable_cap(struct kvm *kvm,
>   		}
>   		mutex_unlock(&kvm->lock);
>   		break;
> +	case KVM_CAP_ARM_RME:
> +		mutex_lock(&kvm->lock);
> +		r = kvm_realm_enable_cap(kvm, cap);
> +		mutex_unlock(&kvm->lock);
> +		break;
>   	default:
>   		break;
>   	}
> @@ -198,6 +203,13 @@ int kvm_arch_init_vm(struct kvm *kvm, unsigned long type)
>   
>   	bitmap_zero(kvm->arch.vcpu_features, KVM_VCPU_MAX_FEATURES);
>   
> +	/* Initialise the realm bits after the generic bits are enabled */
> +	if (kvm_is_realm(kvm)) {
> +		ret = kvm_init_realm_vm(kvm);
> +		if (ret)
> +			goto err_free_cpumask;
> +	}
> +
>   	return 0;
>   
>   err_free_cpumask:
> @@ -257,6 +269,7 @@ void kvm_arch_destroy_vm(struct kvm *kvm)
>   	kvm_unshare_hyp(kvm, kvm + 1);
>   
>   	kvm_arm_teardown_hypercalls(kvm);
> +	kvm_destroy_realm(kvm);
>   }
>   
>   static bool kvm_has_full_ptr_auth(void)
> @@ -411,6 +424,9 @@ int kvm_vm_ioctl_check_extension(struct kvm *kvm, long ext)
>   	case KVM_CAP_ARM_SUPPORTED_REG_MASK_RANGES:
>   		r = BIT(0);
>   		break;
> +	case KVM_CAP_ARM_RME:
> +		r = static_key_enabled(&kvm_rme_is_available);
> +		break;
>   	default:
>   		r = 0;
>   	}
> diff --git a/arch/arm64/kvm/mmu.c b/arch/arm64/kvm/mmu.c
> index 2942ec92c5a4..d654a817c063 100644
> --- a/arch/arm64/kvm/mmu.c
> +++ b/arch/arm64/kvm/mmu.c
> @@ -876,12 +876,16 @@ static struct kvm_pgtable_mm_ops kvm_s2_mm_ops = {
>   	.icache_inval_pou	= invalidate_icache_guest_page,
>   };
>   
> -static int kvm_init_ipa_range(struct kvm_s2_mmu *mmu, unsigned long type)
> +static int kvm_init_ipa_range(struct kvm *kvm,
> +			      struct kvm_s2_mmu *mmu, unsigned long type)
>   {
>   	u32 kvm_ipa_limit = get_kvm_ipa_limit();
>   	u64 mmfr0, mmfr1;
>   	u32 phys_shift;
>   
> +	if (kvm_is_realm(kvm))
> +		kvm_ipa_limit = kvm_realm_ipa_limit();
> +
>   	if (type & ~KVM_VM_TYPE_ARM_IPA_SIZE_MASK)
>   		return -EINVAL;
>   
> @@ -946,7 +950,7 @@ int kvm_init_stage2_mmu(struct kvm *kvm, struct kvm_s2_mmu *mmu, unsigned long t
>   		return -EINVAL;
>   	}
>   
> -	err = kvm_init_ipa_range(mmu, type);
> +	err = kvm_init_ipa_range(kvm, mmu, type);
>   	if (err)
>   		return err;
>   
> @@ -1072,6 +1076,20 @@ void kvm_free_stage2_pgd(struct kvm_s2_mmu *mmu)
>   	struct kvm_pgtable *pgt = NULL;
>   
>   	write_lock(&kvm->mmu_lock);
> +	if (kvm_is_realm(kvm) &&
> +	    (kvm_realm_state(kvm) != REALM_STATE_DEAD &&
> +	     kvm_realm_state(kvm) != REALM_STATE_NONE)) {
> +		/* Tearing down RTTs will be added in a later patch */
> +		write_unlock(&kvm->mmu_lock);
> +
> +		/*
> +		 * The physical PGD pages are delegated to the RMM, so cannot
> +		 * be freed at this point. This function will be called again
> +		 * from kvm_destroy_realm() after the physical pages have been
> +		 * returned at which point the memory can be freed.
> +		 */

I think this could be improved a litte bit, to explain the real reason.

	/*
	 * The PGD pages can be reclaimed only after the Realm (RD)
	 * is destroyed. We call this again from kvm_destroy_realm()
	 * after RD is destroyed.
	 */


Rest looks good to me.

Suzuki

