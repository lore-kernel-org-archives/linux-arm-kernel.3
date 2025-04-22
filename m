Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B614C369CB
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=ZaXHHI8lva1aK+zO5t1lI/RkZtPN7bIrIKSVAiINhXw=; b=i3Y+Rv71L13PWGGVJRj4Kyw1iy
	L6tB5m5FntethX1bmt2hcQ8Hf7RiN1K4HlZNkkXwR43AQxuJEXpcFk9QZvm2dssE0HURLPswiDV3a
	BZS1XEfZIiTyjBEWLjj8q/iDy6CvCoWmXndzosFZ1ZnReOwNRAYMUOJx6qsKSQwbvPdpJyChPXHaB
	fY+RIJsmcv4fX+Gu/ufn9Q+mq4YiXXsOcQUj4W7KYu6i07cHP4N7/LuvPEgh0xykrQ4eA+XQCyQwe
	HzLDosGiVz22Je3KXw1F9qeuZ7JiaGUNsc+EWIj/mXDEuEDV46WINcMbqFs0mAGeeCPFExXlx1U0r
	vBhNqqSg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77uc-000000065ts-0ncy;
	Tue, 22 Apr 2025 07:19:22 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77Nv-000000061Sb-0GAf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:45:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 1F5EB439B8;
	Tue, 22 Apr 2025 06:45:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F3F4DC4CEE9;
	Tue, 22 Apr 2025 06:45:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745304334;
	bh=VkXzwaT9wtKIz/d4m5vRZsHJwe8PYlAhRlJlvVkCYWE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=WcV1H+9o/pwXfMuT9sx3g416SprdvHIqB8zlYubEPWkdbepBPwr54k57q1dAEZkuE
	 Dz/JB5SsyTTqW2AotJ1WRDcUBau495F9fEKVKEkIkyxDKJunlSItF9WgvykTCXQznc
	 FIUp4icReAAGi/TeU/o6yCPEpWwbf29QwFXB0OdM=
Subject: Patch "KVM: arm64: Eagerly switch ZCR_EL{1,2}" has been added to the 5.15-stable tree
To: broonie@kernel.org,catalin.marinas@arm.com,gregkh@linuxfoundation.org,james.morse@arm.com,kvmarm@lists.cs.columbia.edu,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,maz@kernel.org,oleg@redhat.com,oliver.upton@linux.dev,suzuki.poulose@arm.com,tabba@google.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 08:45:14 +0200
In-Reply-To: <20250408-stable-sve-5-15-v3-11-ca9a6b850f55@kernel.org>
Message-ID: <2025042214-ecologist-zoom-cb8c@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_234535_154758_CB24F32B 
X-CRM114-Status: GOOD (  35.37  )
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


This is a note to let you know that I've just added the patch titled

    KVM: arm64: Eagerly switch ZCR_EL{1,2}

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-eagerly-switch-zcr_el-1-2.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From broonie@kernel.org Tue Apr  8 20:22:53 2025
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:10:06 +0100
Subject: KVM: arm64: Eagerly switch ZCR_EL{1,2}
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>,  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,  Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,  linux-kernel@vger.kernel.org, stable@vger.kernel.org,  Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,  Fuad Tabba <tabba@google.com>
Message-ID: <20250408-stable-sve-5-15-v3-11-ca9a6b850f55@kernel.org>

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 59419f10045bc955d2229819c7cf7a8b0b9c5b59 ]

In non-protected KVM modes, while the guest FPSIMD/SVE/SME state is live on the
CPU, the host's active SVE VL may differ from the guest's maximum SVE VL:

* For VHE hosts, when a VM uses NV, ZCR_EL2 contains a value constrained
  by the guest hypervisor, which may be less than or equal to that
  guest's maximum VL.

  Note: in this case the value of ZCR_EL1 is immaterial due to E2H.

* For nVHE/hVHE hosts, ZCR_EL1 contains a value written by the guest,
  which may be less than or greater than the guest's maximum VL.

  Note: in this case hyp code traps host SVE usage and lazily restores
  ZCR_EL2 to the host's maximum VL, which may be greater than the
  guest's maximum VL.

This can be the case between exiting a guest and kvm_arch_vcpu_put_fp().
If a softirq is taken during this period and the softirq handler tries
to use kernel-mode NEON, then the kernel will fail to save the guest's
FPSIMD/SVE state, and will pend a SIGKILL for the current thread.

This happens because kvm_arch_vcpu_ctxsync_fp() binds the guest's live
FPSIMD/SVE state with the guest's maximum SVE VL, and
fpsimd_save_user_state() verifies that the live SVE VL is as expected
before attempting to save the register state:

| if (WARN_ON(sve_get_vl() != vl)) {
|         force_signal_inject(SIGKILL, SI_KERNEL, 0, 0);
|         return;
| }

Fix this and make this a bit easier to reason about by always eagerly
switching ZCR_EL{1,2} at hyp during guest<->host transitions. With this
happening, there's no need to trap host SVE usage, and the nVHE/nVHE
__deactivate_cptr_traps() logic can be simplified to enable host access
to all present FPSIMD/SVE/SME features.

In protected nVHE/hVHE modes, the host's state is always saved/restored
by hyp, and the guest's state is saved prior to exit to the host, so
from the host's PoV the guest never has live FPSIMD/SVE/SME state, and
the host's ZCR_EL1 is never clobbered by hyp.

Fixes: 8c8010d69c132273 ("KVM: arm64: Save/restore SVE state for nVHE")
Fixes: 2e3cf82063a00ea0 ("KVM: arm64: nv: Ensure correct VL is loaded before saving SVE state")
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Will Deacon <will@kernel.org>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-9-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[ v6.6 lacks pKVM saving of host SVE state, pull in discovery of maximum
  host VL separately -- broonie ]
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/kvm_host.h       |    1 
 arch/arm64/include/asm/kvm_hyp.h        |    7 ++++
 arch/arm64/kvm/fpsimd.c                 |   19 +++++------
 arch/arm64/kvm/hyp/entry.S              |    5 ++
 arch/arm64/kvm/hyp/include/hyp/switch.h |   55 ++++++++++++++++++++++++++++++++
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |    9 ++---
 arch/arm64/kvm/hyp/nvhe/switch.c        |   31 +++++++++---------
 arch/arm64/kvm/hyp/vhe/switch.c         |    4 ++
 arch/arm64/kvm/reset.c                  |    3 +
 9 files changed, 106 insertions(+), 28 deletions(-)

--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -64,6 +64,7 @@ enum kvm_mode kvm_get_mode(void);
 DECLARE_STATIC_KEY_FALSE(userspace_irqchip_in_use);
 
 extern unsigned int kvm_sve_max_vl;
+extern unsigned int kvm_host_sve_max_vl;
 int kvm_arm_init_sve(void);
 
 u32 __attribute_const__ kvm_target_cpu(void);
--- a/arch/arm64/include/asm/kvm_hyp.h
+++ b/arch/arm64/include/asm/kvm_hyp.h
@@ -117,5 +117,12 @@ void __noreturn __host_enter(struct kvm_
 
 extern u64 kvm_nvhe_sym(id_aa64mmfr0_el1_sys_val);
 extern u64 kvm_nvhe_sym(id_aa64mmfr1_el1_sys_val);
+extern unsigned int kvm_nvhe_sym(kvm_host_sve_max_vl);
+
+static inline bool guest_owns_fp_regs(struct kvm_vcpu *vcpu)
+{
+	return vcpu->arch.flags & KVM_ARM64_FP_ENABLED;
+}
+
 
 #endif /* __ARM64_KVM_HYP_H__ */
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -129,15 +129,16 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcp
 	local_irq_save(flags);
 
 	if (vcpu->arch.flags & KVM_ARM64_FP_ENABLED) {
-		if (vcpu_has_sve(vcpu)) {
-			__vcpu_sys_reg(vcpu, ZCR_EL1) = read_sysreg_el1(SYS_ZCR);
-
-			/* Restore the VL that was saved when bound to the CPU */
-			if (!has_vhe())
-				sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1,
-						       SYS_ZCR_EL1);
-		}
-
+		/*
+		 * Flush (save and invalidate) the fpsimd/sve state so that if
+		 * the host tries to use fpsimd/sve, it's not using stale data
+		 * from the guest.
+		 *
+		 * Flushing the state sets the TIF_FOREIGN_FPSTATE bit for the
+		 * context unconditionally, in both nVHE and VHE. This allows
+		 * the kernel to restore the fpsimd/sve state, including ZCR_EL1
+		 * when needed.
+		 */
 		fpsimd_save_and_flush_cpu_state();
 	}
 
--- a/arch/arm64/kvm/hyp/entry.S
+++ b/arch/arm64/kvm/hyp/entry.S
@@ -44,6 +44,11 @@ alternative_if ARM64_HAS_RAS_EXTN
 alternative_else_nop_endif
 	mrs	x1, isr_el1
 	cbz	x1,  1f
+
+	// Ensure that __guest_enter() always provides a context
+	// synchronization event so that callers don't need ISBs for anything
+	// that would usually be synchonized by the ERET.
+	isb
 	mov	x0, #ARM_EXCEPTION_IRQ
 	ret
 
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -215,6 +215,61 @@ static inline void __hyp_sve_restore_gue
 	write_sysreg_el1(__vcpu_sys_reg(vcpu, ZCR_EL1), SYS_ZCR);
 }
 
+static inline void fpsimd_lazy_switch_to_guest(struct kvm_vcpu *vcpu)
+{
+	u64 zcr_el1, zcr_el2;
+
+	if (!guest_owns_fp_regs(vcpu))
+		return;
+
+	if (vcpu_has_sve(vcpu)) {
+		zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
+
+		write_sysreg_el2(zcr_el2, SYS_ZCR);
+
+		zcr_el1 = __vcpu_sys_reg(vcpu, ZCR_EL1);
+		write_sysreg_el1(zcr_el1, SYS_ZCR);
+	}
+}
+
+static inline void fpsimd_lazy_switch_to_host(struct kvm_vcpu *vcpu)
+{
+	u64 zcr_el1, zcr_el2;
+
+	if (!guest_owns_fp_regs(vcpu))
+		return;
+
+	/*
+	 * When the guest owns the FP regs, we know that guest+hyp traps for
+	 * any FPSIMD/SVE/SME features exposed to the guest have been disabled
+	 * by either fpsimd_lazy_switch_to_guest() or kvm_hyp_handle_fpsimd()
+	 * prior to __guest_entry(). As __guest_entry() guarantees a context
+	 * synchronization event, we don't need an ISB here to avoid taking
+	 * traps for anything that was exposed to the guest.
+	 */
+	if (vcpu_has_sve(vcpu)) {
+		zcr_el1 = read_sysreg_el1(SYS_ZCR);
+		__vcpu_sys_reg(vcpu, ZCR_EL1) = zcr_el1;
+
+		/*
+		 * The guest's state is always saved using the guest's max VL.
+		 * Ensure that the host has the guest's max VL active such that
+		 * the host can save the guest's state lazily, but don't
+		 * artificially restrict the host to the guest's max VL.
+		 */
+		if (has_vhe()) {
+			zcr_el2 = vcpu_sve_max_vq(vcpu) - 1;
+			write_sysreg_el2(zcr_el2, SYS_ZCR);
+		} else {
+			zcr_el2 = sve_vq_from_vl(kvm_host_sve_max_vl) - 1;
+			write_sysreg_el2(zcr_el2, SYS_ZCR);
+
+			zcr_el1 = vcpu_sve_max_vq(vcpu) - 1;
+			write_sysreg_el1(zcr_el1, SYS_ZCR);
+		}
+	}
+}
+
 /* Check for an FPSIMD/SVE trap and handle as appropriate */
 static inline bool __hyp_handle_fpsimd(struct kvm_vcpu *vcpu)
 {
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -19,13 +19,17 @@
 
 DEFINE_PER_CPU(struct kvm_nvhe_init_params, kvm_init_params);
 
+unsigned int kvm_host_sve_max_vl;
+
 void __kvm_hyp_host_forward_smc(struct kvm_cpu_context *host_ctxt);
 
 static void handle___kvm_vcpu_run(struct kvm_cpu_context *host_ctxt)
 {
 	DECLARE_REG(struct kvm_vcpu *, vcpu, host_ctxt, 1);
 
+	fpsimd_lazy_switch_to_guest(kern_hyp_va(vcpu));
 	cpu_reg(host_ctxt, 1) =  __kvm_vcpu_run(kern_hyp_va(vcpu));
+	fpsimd_lazy_switch_to_host(kern_hyp_va(vcpu));
 }
 
 static void handle___kvm_adjust_pc(struct kvm_cpu_context *host_ctxt)
@@ -237,11 +241,6 @@ void handle_trap(struct kvm_cpu_context
 	case ESR_ELx_EC_SMC64:
 		handle_host_smc(host_ctxt);
 		break;
-	case ESR_ELx_EC_SVE:
-		sysreg_clear_set(cptr_el2, CPTR_EL2_TZ, 0);
-		isb();
-		sve_cond_update_zcr_vq(ZCR_ELx_LEN_MASK, SYS_ZCR_EL2);
-		break;
 	case ESR_ELx_EC_IABT_LOW:
 	case ESR_ELx_EC_DABT_LOW:
 		handle_host_mem_abort(host_ctxt);
--- a/arch/arm64/kvm/hyp/nvhe/switch.c
+++ b/arch/arm64/kvm/hyp/nvhe/switch.c
@@ -34,15 +34,13 @@ DEFINE_PER_CPU(struct kvm_host_data, kvm
 DEFINE_PER_CPU(struct kvm_cpu_context, kvm_hyp_ctxt);
 DEFINE_PER_CPU(unsigned long, kvm_hyp_vector);
 
-static bool guest_owns_fp_regs(struct kvm_vcpu *vcpu)
-{
-	return vcpu->arch.flags & KVM_ARM64_FP_ENABLED;
-}
-
 static void __activate_cptr_traps(struct kvm_vcpu *vcpu)
 {
 	u64 val = CPTR_EL2_TAM;	/* Same bit irrespective of E2H */
 
+	if (!guest_owns_fp_regs(vcpu))
+		__activate_traps_fpsimd32(vcpu);
+
 	/* !hVHE case upstream */
 	if (1) {
 		val |= CPTR_EL2_TTA | CPTR_NVHE_EL2_RES1;
@@ -52,12 +50,22 @@ static void __activate_cptr_traps(struct
 
 		if (!guest_owns_fp_regs(vcpu))
 			val |= CPTR_EL2_TFP;
+
+		write_sysreg(val, cptr_el2);
 	}
+}
 
-	if (!guest_owns_fp_regs(vcpu))
-		__activate_traps_fpsimd32(vcpu);
+static void __deactivate_cptr_traps(struct kvm_vcpu *vcpu)
+{
+	/* !hVHE case upstream */
+	if (1) {
+		u64 val = CPTR_NVHE_EL2_RES1;
 
-	write_sysreg(val, cptr_el2);
+		if (!cpus_have_final_cap(ARM64_SVE))
+			val |= CPTR_EL2_TZ;
+
+		write_sysreg(val, cptr_el2);
+	}
 }
 
 static void __activate_traps(struct kvm_vcpu *vcpu)
@@ -86,7 +94,6 @@ static void __activate_traps(struct kvm_
 static void __deactivate_traps(struct kvm_vcpu *vcpu)
 {
 	extern char __kvm_hyp_host_vector[];
-	u64 cptr;
 
 	___deactivate_traps(vcpu);
 
@@ -111,11 +118,7 @@ static void __deactivate_traps(struct kv
 
 	write_sysreg(this_cpu_ptr(&kvm_init_params)->hcr_el2, hcr_el2);
 
-	cptr = CPTR_EL2_DEFAULT;
-	if (vcpu_has_sve(vcpu) && (vcpu->arch.flags & KVM_ARM64_FP_ENABLED))
-		cptr |= CPTR_EL2_TZ;
-
-	write_sysreg(cptr, cptr_el2);
+	__deactivate_cptr_traps(vcpu);
 	write_sysreg(__kvm_hyp_host_vector, vbar_el2);
 }
 
--- a/arch/arm64/kvm/hyp/vhe/switch.c
+++ b/arch/arm64/kvm/hyp/vhe/switch.c
@@ -114,6 +114,8 @@ static int __kvm_vcpu_run_vhe(struct kvm
 
 	sysreg_save_host_state_vhe(host_ctxt);
 
+	fpsimd_lazy_switch_to_guest(vcpu);
+
 	/*
 	 * ARM erratum 1165522 requires us to configure both stage 1 and
 	 * stage 2 translation for the guest context before we clear
@@ -144,6 +146,8 @@ static int __kvm_vcpu_run_vhe(struct kvm
 
 	__deactivate_traps(vcpu);
 
+	fpsimd_lazy_switch_to_host(vcpu);
+
 	sysreg_restore_host_state_vhe(host_ctxt);
 
 	if (vcpu->arch.flags & KVM_ARM64_FP_ENABLED)
--- a/arch/arm64/kvm/reset.c
+++ b/arch/arm64/kvm/reset.c
@@ -42,11 +42,14 @@ static u32 kvm_ipa_limit;
 				 PSR_AA32_I_BIT | PSR_AA32_F_BIT)
 
 unsigned int kvm_sve_max_vl;
+unsigned int kvm_host_sve_max_vl;
 
 int kvm_arm_init_sve(void)
 {
 	if (system_supports_sve()) {
 		kvm_sve_max_vl = sve_max_virtualisable_vl;
+		kvm_host_sve_max_vl = sve_max_vl;
+		kvm_nvhe_sym(kvm_host_sve_max_vl) = kvm_host_sve_max_vl;
 
 		/*
 		 * The get_sve_reg()/set_sve_reg() ioctl interface will need


Patches currently in stable-queue which might be from broonie@kernel.org are

queue-5.15/kvm-arm64-remove-host-fpsimd-saving-for-non-protected-kvm.patch
queue-5.15/spi-cadence-qspi-fix-probe-on-am62a-lp-sk.patch
queue-5.15/asoc-qdsp6-q6asm-dai-fix-q6asm_dai_compr_set_params-error-path.patch
queue-5.15/kvm-arm64-eagerly-switch-zcr_el-1-2.patch
queue-5.15/kvm-arm64-unconditionally-save-flush-host-fpsimd-sve-sme-state.patch
queue-5.15/kvm-arm64-always-start-with-clearing-sve-flag-on-load.patch
queue-5.15/asoc-codecs-lpass-wsa-macro-fix-vi-feedback-rate.patch
queue-5.15/arm64-fpsimd-track-the-saved-fpsimd-state-type-separately-to-tif_sve.patch
queue-5.15/kvm-arm64-get-rid-of-host-sve-tracking-saving.patch
queue-5.15/kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.zen.patch
queue-5.15/asoc-fsl_audmix-register-card-device-depends-on-dais.patch
queue-5.15/arm64-fpsimd-have-kvm-explicitly-say-which-fp-registers-to-save.patch
queue-5.15/kvm-arm64-discard-any-sve-state-when-entering-kvm-guests.patch
queue-5.15/arm64-fpsimd-stop-using-tif_sve-to-manage-register-saving-in-kvm.patch
queue-5.15/asoc-codecs-lpass-wsa-macro-fix-logic-of-enabling-vi-channels.patch
queue-5.15/kvm-arm64-calculate-cptr_el2-traps-on-activating-traps.patch

