Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D94EC282CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Mar 2025 18:06:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=x8hnEG2l1jyY2otqR4ZKh/7rSx49eygOxaK8sSzTQjA=; b=mPejWcV5wjY2fDS4cUIlOVHGjN
	qr9ehrXQiK9u75iWrfkFxTPLGitz868i0gAaaWrPqhH1kQNHOFTrC8jqfPPxsIdAVWbYk22WIQPDy
	hN77ZiWGxSlQq91cZN4edYrC46igiIgRWLnnH//RcoHbt2z91+EkARnb9+PMFWQNXfCFrnyhKkJi0
	WqbXgZtGMkLENRmgy6MclKUWddHdmAl5xlb+5bUCI5AGax9rIFIw1jTKcLOSRxVO4pBpMXWNmAx9o
	BmJmQSHE07GqwX8SbiVxJ5ORvukhCaCnUTYCruDjos0PdXINEh1H23I2mdb896NB9K3uD2TAWkB63
	E09OGVsw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpAAt-00000001t3h-3Iw7;
	Mon, 03 Mar 2025 18:05:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpA87-00000001scP-07qE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Mar 2025 18:03:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id AE804106F;
	Mon,  3 Mar 2025 10:03:14 -0800 (PST)
Received: from [10.57.37.67] (unknown [10.57.37.67])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 32E5E3F5A1;
	Mon,  3 Mar 2025 10:02:57 -0800 (PST)
Message-ID: <6a7bf3ea-6f9b-4f8f-aa23-9a75a7c2e190@arm.com>
Date: Mon, 3 Mar 2025 18:02:56 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 14/45] arm64: RME: Support for the VGIC in realms
Content-Language: en-GB
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
 <aneesh.kumar@kernel.org>
References: <20250213161426.102987-1-steven.price@arm.com>
 <20250213161426.102987-15-steven.price@arm.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <20250213161426.102987-15-steven.price@arm.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250303_100303_163697_79446687 
X-CRM114-Status: GOOD (  25.54  )
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

On 13/02/2025 16:13, Steven Price wrote:
> The RMM provides emulation of a VGIC to the realm guest but delegates
> much of the handling to the host. Implement support in KVM for
> saving/restoring state to/from the REC structure.
> 
> Signed-off-by: Steven Price <steven.price@arm.com>
> ---
> Changes from v5:
>   * Handle RMM providing fewer GIC LRs than the hardware supports.
> ---
>   arch/arm64/include/asm/kvm_rme.h |  1 +
>   arch/arm64/kvm/arm.c             | 16 +++++++++---
>   arch/arm64/kvm/rme.c             |  5 ++++
>   arch/arm64/kvm/vgic/vgic-init.c  |  2 +-
>   arch/arm64/kvm/vgic/vgic-v3.c    |  5 ++++
>   arch/arm64/kvm/vgic/vgic.c       | 43 ++++++++++++++++++++++++++++++--
>   6 files changed, 66 insertions(+), 6 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/kvm_rme.h b/arch/arm64/include/asm/kvm_rme.h
> index 5db377943db4..2e319db9a05f 100644
> --- a/arch/arm64/include/asm/kvm_rme.h
> +++ b/arch/arm64/include/asm/kvm_rme.h
> @@ -83,6 +83,7 @@ struct realm_rec {
>   
>   void kvm_init_rme(void);
>   u32 kvm_realm_ipa_limit(void);
> +u32 kvm_realm_vgic_nr_lr(void);
>   
>   int kvm_realm_enable_cap(struct kvm *kvm, struct kvm_enable_cap *cap);
>   int kvm_init_realm_vm(struct kvm *kvm);
> diff --git a/arch/arm64/kvm/arm.c b/arch/arm64/kvm/arm.c
> index a6a3034a2f50..a2bc86b3798f 100644
> --- a/arch/arm64/kvm/arm.c
> +++ b/arch/arm64/kvm/arm.c
> @@ -672,19 +672,24 @@ void kvm_arch_vcpu_put(struct kvm_vcpu *vcpu)
>   		kvm_call_hyp_nvhe(__pkvm_vcpu_put);
>   	}
>   
> +	kvm_timer_vcpu_put(vcpu);
> +	kvm_vgic_put(vcpu);
> +
> +	vcpu->cpu = -1;
> +
> +	if (vcpu_is_rec(vcpu))
> +		return;
> +
>   	kvm_vcpu_put_debug(vcpu);
>   	kvm_arch_vcpu_put_fp(vcpu);
>   	if (has_vhe())
>   		kvm_vcpu_put_vhe(vcpu);
> -	kvm_timer_vcpu_put(vcpu);
> -	kvm_vgic_put(vcpu);
>   	kvm_vcpu_pmu_restore_host(vcpu);
>   	if (vcpu_has_nv(vcpu))
>   		kvm_vcpu_put_hw_mmu(vcpu);
>   	kvm_arm_vmid_clear_active();
>   
>   	vcpu_clear_on_unsupported_cpu(vcpu);
> -	vcpu->cpu = -1;
>   }
>   
>   static void __kvm_arm_vcpu_power_off(struct kvm_vcpu *vcpu)
> @@ -889,6 +894,11 @@ int kvm_arch_vcpu_run_pid_change(struct kvm_vcpu *vcpu)
>   			return ret;
>   	}
>   
> +	if (!irqchip_in_kernel(kvm) && kvm_is_realm(vcpu->kvm)) {
> +		/* Userspace irqchip not yet supported with Realms */
> +		return -EOPNOTSUPP;
> +	}
> +
>   	mutex_lock(&kvm->arch.config_lock);
>   	set_bit(KVM_ARCH_FLAG_HAS_RAN_ONCE, &kvm->arch.flags);
>   	mutex_unlock(&kvm->arch.config_lock);
> diff --git a/arch/arm64/kvm/rme.c b/arch/arm64/kvm/rme.c
> index 0aa1f29b0610..195390a66bc4 100644
> --- a/arch/arm64/kvm/rme.c
> +++ b/arch/arm64/kvm/rme.c
> @@ -77,6 +77,11 @@ u32 kvm_realm_ipa_limit(void)
>   	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_S2SZ);
>   }
>   
> +u32 kvm_realm_vgic_nr_lr(void)
> +{
> +	return u64_get_bits(rmm_feat_reg0, RMI_FEATURE_REGISTER_0_GICV3_NUM_LRS);
> +}
> +
>   static int get_start_level(struct realm *realm)
>   {
>   	return 4 - ((realm->ia_bits - 8) / (RMM_PAGE_SHIFT - 3));
> diff --git a/arch/arm64/kvm/vgic/vgic-init.c b/arch/arm64/kvm/vgic/vgic-init.c
> index bc7e22ab5d81..0ec9f6f62e86 100644
> --- a/arch/arm64/kvm/vgic/vgic-init.c
> +++ b/arch/arm64/kvm/vgic/vgic-init.c
> @@ -79,7 +79,7 @@ int kvm_vgic_create(struct kvm *kvm, u32 type)
>   	 * the proper checks already.
>   	 */
>   	if (type == KVM_DEV_TYPE_ARM_VGIC_V2 &&
> -		!kvm_vgic_global_state.can_emulate_gicv2)
> +	    (!kvm_vgic_global_state.can_emulate_gicv2 || kvm_is_realm(kvm)))
>   		return -ENODEV;
>   
>   	/* Must be held to avoid race with vCPU creation */
> diff --git a/arch/arm64/kvm/vgic/vgic-v3.c b/arch/arm64/kvm/vgic/vgic-v3.c
> index d7233ab982d0..41c3de063e72 100644
> --- a/arch/arm64/kvm/vgic/vgic-v3.c
> +++ b/arch/arm64/kvm/vgic/vgic-v3.c
> @@ -8,9 +8,11 @@
>   #include <linux/kvm_host.h>
>   #include <linux/string_choices.h>
>   #include <kvm/arm_vgic.h>
> +#include <asm/kvm_emulate.h>
>   #include <asm/kvm_hyp.h>
>   #include <asm/kvm_mmu.h>
>   #include <asm/kvm_asm.h>
> +#include <asm/rmi_smc.h>
>   
>   #include "vgic.h"
>   
> @@ -748,6 +750,9 @@ void vgic_v3_put(struct kvm_vcpu *vcpu)
>   {
>   	struct vgic_v3_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v3;
>   
> +	if (vcpu_is_rec(vcpu))
> +		cpu_if->vgic_vmcr = vcpu->arch.rec.run->exit.gicv3_vmcr;
> +


>   	if (likely(!is_protected_kvm_enabled()))

	else if (likely(...)) ?

>   		kvm_call_hyp(__vgic_v3_save_vmcr_aprs, cpu_if);

Otherwise, the VMCR could be rewritten from what we set above and 
pointless APR saves ?

Rest looks good to me.

Suzuki

>   	WARN_ON(vgic_v4_put(vcpu));
> diff --git a/arch/arm64/kvm/vgic/vgic.c b/arch/arm64/kvm/vgic/vgic.c
> index 1077fab2df4b..4218de3ea9da 100644
> --- a/arch/arm64/kvm/vgic/vgic.c
> +++ b/arch/arm64/kvm/vgic/vgic.c
> @@ -10,7 +10,9 @@
>   #include <linux/list_sort.h>
>   #include <linux/nospec.h>
>   
> +#include <asm/kvm_emulate.h>
>   #include <asm/kvm_hyp.h>
> +#include <asm/kvm_rme.h>
>   
>   #include "vgic.h"
>   
> @@ -23,6 +25,8 @@ struct vgic_global kvm_vgic_global_state __ro_after_init = {
>   
>   static inline int kvm_vcpu_vgic_nr_lr(struct kvm_vcpu *vcpu)
>   {
> +	if (unlikely(vcpu_is_rec(vcpu)))
> +		return kvm_realm_vgic_nr_lr();
>   	return kvm_vgic_global_state.nr_lr;
>   }
>   
> @@ -864,10 +868,23 @@ static inline bool can_access_vgic_from_kernel(void)
>   	return !static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif) || has_vhe();
>   }
>   
> +static inline void vgic_rmm_save_state(struct kvm_vcpu *vcpu)
> +{
> +	struct vgic_v3_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v3;
> +	int i;
> +
> +	for (i = 0; i < kvm_vcpu_vgic_nr_lr(vcpu); i++) {
> +		cpu_if->vgic_lr[i] = vcpu->arch.rec.run->exit.gicv3_lrs[i];
> +		vcpu->arch.rec.run->enter.gicv3_lrs[i] = 0;
> +	}
> +}
> +
>   static inline void vgic_save_state(struct kvm_vcpu *vcpu)
>   {
>   	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
>   		vgic_v2_save_state(vcpu);
> +	else if (vcpu_is_rec(vcpu))
> +		vgic_rmm_save_state(vcpu);
>   	else
>   		__vgic_v3_save_state(&vcpu->arch.vgic_cpu.vgic_v3);
>   }
> @@ -894,10 +911,28 @@ void kvm_vgic_sync_hwstate(struct kvm_vcpu *vcpu)
>   	vgic_prune_ap_list(vcpu);
>   }
>   
> +static inline void vgic_rmm_restore_state(struct kvm_vcpu *vcpu)
> +{
> +	struct vgic_v3_cpu_if *cpu_if = &vcpu->arch.vgic_cpu.vgic_v3;
> +	int i;
> +
> +	for (i = 0; i < kvm_vcpu_vgic_nr_lr(vcpu); i++) {
> +		vcpu->arch.rec.run->enter.gicv3_lrs[i] = cpu_if->vgic_lr[i];
> +		/*
> +		 * Also populate the rec.run->exit copies so that a late
> +		 * decision to back out from entering the realm doesn't cause
> +		 * the state to be lost
> +		 */
> +		vcpu->arch.rec.run->exit.gicv3_lrs[i] = cpu_if->vgic_lr[i];
> +	}
> +}
> +
>   static inline void vgic_restore_state(struct kvm_vcpu *vcpu)
>   {
>   	if (!static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
>   		vgic_v2_restore_state(vcpu);
> +	else if (vcpu_is_rec(vcpu))
> +		vgic_rmm_restore_state(vcpu);
>   	else
>   		__vgic_v3_restore_state(&vcpu->arch.vgic_cpu.vgic_v3);
>   }
> @@ -938,7 +973,9 @@ void kvm_vgic_flush_hwstate(struct kvm_vcpu *vcpu)
>   
>   void kvm_vgic_load(struct kvm_vcpu *vcpu)
>   {
> -	if (unlikely(!irqchip_in_kernel(vcpu->kvm) || !vgic_initialized(vcpu->kvm))) {
> +	if (unlikely(!irqchip_in_kernel(vcpu->kvm) ||
> +		     !vgic_initialized(vcpu->kvm) ||
> +		     vcpu_is_rec(vcpu))) {
>   		if (has_vhe() && static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
>   			__vgic_v3_activate_traps(&vcpu->arch.vgic_cpu.vgic_v3);
>   		return;
> @@ -952,7 +989,9 @@ void kvm_vgic_load(struct kvm_vcpu *vcpu)
>   
>   void kvm_vgic_put(struct kvm_vcpu *vcpu)
>   {
> -	if (unlikely(!irqchip_in_kernel(vcpu->kvm) || !vgic_initialized(vcpu->kvm))) {
> +	if (unlikely(!irqchip_in_kernel(vcpu->kvm) ||
> +		     !vgic_initialized(vcpu->kvm) ||
> +		     vcpu_is_rec(vcpu))) {
>   		if (has_vhe() && static_branch_unlikely(&kvm_vgic_global_state.gicv3_cpuif))
>   			__vgic_v3_deactivate_traps(&vcpu->arch.vgic_cpu.vgic_v3);
>   		return;


