Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0011C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 06:56:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=UGeFXfrLgVlzMq3qfiUmU2ZE+ixxh3ZwJwRVrP4KJIw=; b=thv9HASzt5LLsG2niS3Xac1wq/
	S7JUJmdKRNNl/lYoayIvdnj8owaZOaJpA1Fqr7C5y1r3Q0rIbsaRdzIJk1ern0n6qxR60mVLAEskX
	qTkveEHnOP/G/P45THgbNUUdi1Yd3+j5m8JHK1G6LypzOo9Ag3I1sEpARMsb5j9/712ZpWNlQrwRR
	ZTPhS5/ttT7/iLgLw1sVvzAaaDihISMD23cPNGo8Kh3r9kTDcnyTKOlWSFJRxuV+c8e6uiKtsKxzj
	5H2mNGRYhZOVgQxwIdm+BhZa2kppJvg/YIbPPlkhe94zRLV2MVlfKvEgV/qk+q8pnkGEWtDHfn8X5
	Uc2WS0xw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77YV-000000062UH-0jBH;
	Tue, 22 Apr 2025 06:56:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77Md-0000000618w-1lbm
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:44:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 844C94A40E;
	Tue, 22 Apr 2025 06:44:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8A96CC4CEE9;
	Tue, 22 Apr 2025 06:44:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745304254;
	bh=XDtGk7Rrc9Jio4O5AaxnVgKnkrcCGmmu10ZjL0njNYc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=u9S5nvUdqth/AkYiw9vUNlRvrElJYebf+MuYzn2Ose7FLvkLE0F5PCv9UP2284egj
	 z4gNg/ky7f0YOlT+a2mmc7trI0PKWWJd28TaBmhODuGLSS3yoqqekp3Kv564E1ovbY
	 dOX67ItanHjUET6k1X5FPrjE6385DMZi9ZH44Yc8=
Subject: Patch "KVM: arm64: Mark some header functions as inline" has been added to the 6.1-stable tree
To: broonie@kernel.org,catalin.marinas@arm.com,gregkh@linuxfoundation.org,james.morse@arm.com,kvmarm@lists.cs.columbia.edu,kvmarm@lists.linux.dev,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,maz@kernel.org,oleg@redhat.com,oliver.upton@linux.dev,suzuki.poulose@arm.com,tabba@google.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 08:43:54 +0200
In-Reply-To: <20250404-stable-sve-6-1-v1-10-cd5c9eb52d49@kernel.org>
Message-ID: <2025042254-font-either-c344@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_234415_510012_F69F4924 
X-CRM114-Status: GOOD (  16.54  )
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

    KVM: arm64: Mark some header functions as inline

to the 6.1-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-mark-some-header-functions-as-inline.patch
and it can be found in the queue-6.1 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-128309-greg=kroah.com@vger.kernel.org Fri Apr  4 15:29:58 2025
From: Mark Brown <broonie@kernel.org>
Date: Fri, 04 Apr 2025 14:23:43 +0100
Subject: KVM: arm64: Mark some header functions as inline
To: Catalin Marinas <catalin.marinas@arm.com>,  Will Deacon <will@kernel.org>, Marc Zyngier <maz@kernel.org>,  James Morse <james.morse@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>,  Oliver Upton <oliver.upton@linux.dev>, Oleg Nesterov <oleg@redhat.com>,  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,  kvmarm@lists.linux.dev, kvmarm@lists.cs.columbia.edu,  Mark Brown <broonie@kernel.org>, stable@vger.kernel.org,  Mark Rutland <mark.rutland@arm.com>, Fuad Tabba <tabba@google.com>
Message-ID: <20250404-stable-sve-6-1-v1-10-cd5c9eb52d49@kernel.org>

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit f9dd00de1e53a47763dfad601635d18542c3836d ]

The shared hyp switch header has a number of static functions which
might not be used by all files that include the header, and when unused
they will provoke compiler warnings, e.g.

| In file included from arch/arm64/kvm/hyp/nvhe/hyp-main.c:8:
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:703:13: warning: 'kvm_hyp_handle_dabt_low' defined but not used [-Wunused-function]
|   703 | static bool kvm_hyp_handle_dabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~~~~~
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:682:13: warning: 'kvm_hyp_handle_cp15_32' defined but not used [-Wunused-function]
|   682 | static bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~~~~
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:662:13: warning: 'kvm_hyp_handle_sysreg' defined but not used [-Wunused-function]
|   662 | static bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~~~
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:458:13: warning: 'kvm_hyp_handle_fpsimd' defined but not used [-Wunused-function]
|   458 | static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~~~
| ./arch/arm64/kvm/hyp/include/hyp/switch.h:329:13: warning: 'kvm_hyp_handle_mops' defined but not used [-Wunused-function]
|   329 | static bool kvm_hyp_handle_mops(struct kvm_vcpu *vcpu, u64 *exit_code)
|       |             ^~~~~~~~~~~~~~~~~~~

Mark these functions as 'inline' to suppress this warning. This
shouldn't result in any functional change.

At the same time, avoid the use of __alias() in the header and alias
kvm_hyp_handle_iabt_low() and kvm_hyp_handle_watchpt_low() to
kvm_hyp_handle_memory_fault() using CPP, matching the style in the rest
of the kernel. For consistency, kvm_hyp_handle_memory_fault() is also
marked as 'inline'.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-8-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kvm/hyp/include/hyp/switch.h |   17 ++++++++---------
 1 file changed, 8 insertions(+), 9 deletions(-)

--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -173,7 +173,7 @@ static inline void __hyp_sve_restore_gue
  * If FP/SIMD is not implemented, handle the trap and inject an undefined
  * instruction exception to the guest. Similarly for trapped SVE accesses.
  */
-static bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_fpsimd(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	bool sve_guest;
 	u8 esr_ec;
@@ -331,7 +331,7 @@ static bool kvm_hyp_handle_ptrauth(struc
 	return true;
 }
 
-static bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_sysreg(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (cpus_have_final_cap(ARM64_WORKAROUND_CAVIUM_TX2_219_TVM) &&
 	    handle_tx2_tvm(vcpu))
@@ -347,7 +347,7 @@ static bool kvm_hyp_handle_sysreg(struct
 	return false;
 }
 
-static bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_cp15_32(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (static_branch_unlikely(&vgic_v3_cpuif_trap) &&
 	    __vgic_v3_perform_cpuif_access(vcpu) == 1)
@@ -356,19 +356,18 @@ static bool kvm_hyp_handle_cp15_32(struc
 	return false;
 }
 
-static bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_memory_fault(struct kvm_vcpu *vcpu,
+					       u64 *exit_code)
 {
 	if (!__populate_fault_info(vcpu))
 		return true;
 
 	return false;
 }
-static bool kvm_hyp_handle_iabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
-	__alias(kvm_hyp_handle_memory_fault);
-static bool kvm_hyp_handle_watchpt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
-	__alias(kvm_hyp_handle_memory_fault);
+#define kvm_hyp_handle_iabt_low		kvm_hyp_handle_memory_fault
+#define kvm_hyp_handle_watchpt_low	kvm_hyp_handle_memory_fault
 
-static bool kvm_hyp_handle_dabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
+static inline bool kvm_hyp_handle_dabt_low(struct kvm_vcpu *vcpu, u64 *exit_code)
 {
 	if (kvm_hyp_handle_memory_fault(vcpu, exit_code))
 		return true;


Patches currently in stable-queue which might be from broonie@kernel.org are

queue-6.1/kvm-arm64-remove-host-fpsimd-saving-for-non-protected-kvm.patch
queue-6.1/spi-cadence-qspi-fix-probe-on-am62a-lp-sk.patch
queue-6.1/asoc-qdsp6-q6asm-dai-fix-q6asm_dai_compr_set_params-error-path.patch
queue-6.1/asoc-qdsp6-q6apm-dai-fix-capture-pipeline-overruns.patch
queue-6.1/kvm-arm64-mark-some-header-functions-as-inline.patch
queue-6.1/kvm-arm64-eagerly-switch-zcr_el-1-2.patch
queue-6.1/kvm-arm64-unconditionally-save-flush-host-fpsimd-sve-sme-state.patch
queue-6.1/asoc-amd-add-dmi-quirk-for-acp6x-mic-support.patch
queue-6.1/kvm-arm64-refactor-exit-handlers.patch
queue-6.1/asoc-qdsp6-q6apm-dai-set-10-ms-period-and-buffer-alignment.patch
queue-6.1/asoc-codecs-lpass-wsa-macro-fix-vi-feedback-rate.patch
queue-6.1/arm64-fpsimd-track-the-saved-fpsimd-state-type-separately-to-tif_sve.patch
queue-6.1/kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.zen.patch
queue-6.1/kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.smen.patch
queue-6.1/asoc-fsl_audmix-register-card-device-depends-on-dais.patch
queue-6.1/arm64-fpsimd-have-kvm-explicitly-say-which-fp-registers-to-save.patch
queue-6.1/kvm-arm64-discard-any-sve-state-when-entering-kvm-guests.patch
queue-6.1/arm64-fpsimd-stop-using-tif_sve-to-manage-register-saving-in-kvm.patch
queue-6.1/asoc-codecs-lpass-wsa-macro-fix-logic-of-enabling-vi-channels.patch
queue-6.1/kvm-arm64-calculate-cptr_el2-traps-on-activating-traps.patch

