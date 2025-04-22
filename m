Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 30C0DC369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:27:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=OhjMBLNeMDO3uJ93DVTKdFy+XBxJfXI1TdN+ktOOWcI=; b=sUAfKVjVX5Y20v3MkvnJ961gOn
	WNUQ7CpwPRmn9aB4B/dCI5YwelueU7sKdHwKfS1W1H5OMEG5iglC1ta1/qItfXnSryzZlKQxzzvac
	uiRlBtI0AjcxskkcqXy0UoUxKkOdNo68D1zgwTP0zM3slmj5SwDQdAu2c//EjMWcHgFJFeGjg2iUl
	UBYwS7DV++nX7D5GQAgTMbkymCu0LC+Prfi+YVuncKGt7tlz7GSRg/owqN8KFWqLibIIl06dbk7hU
	31xd0LXmsTf+SPG6oMs8PAqVv7OLFGy9AeqkFEEeEuzeAYOJ2km0tjf1/2LN10a5+7z/Ue6rAvllE
	B+tadnzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u781y-0000000676n-46DK;
	Tue, 22 Apr 2025 07:26:58 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77O6-000000061Wu-1k2c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:45:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 96E4CA4BCCB;
	Tue, 22 Apr 2025 06:40:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 169BBC4CEE9;
	Tue, 22 Apr 2025 06:45:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745304345;
	bh=Rri21VOEYDniTPNhyTjMinUkbx1j8ejG15dMonehiZc=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=Wrs3MCg6hojnuAhuSiIXg3fn0YsEJEvuZ2gTuRzQ/2n3ppouTWqlxzDJr9JAS/Gbc
	 e10H8/oA/GWjUNjC+J4Q1bKkWQKFB3F5tgaoE5FshuZzJ8RtyagqwqwiGBjwv+O5+A
	 /SRZBOpcwBJh++QGoGxiLp3+IAmjw9S9Txq4TNCc=
Subject: Patch "KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state" has been added to the 5.15-stable tree
To: broonie@kernel.org,catalin.marinas@arm.com,eauger@redhat.com,eric.auger@redhat.com,fweimer@redhat.com,gregkh@linuxfoundation.org,james.morse@arm.com,jeremy.linton@arm.com,kvmarm@lists.cs.columbia.edu,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,maz@kernel.org,oleg@redhat.com,oliver.upton@linux.dev,pbonzini@redhat.com,suzuki.poulose@arm.com,tabba@google.com,wilco.dijkstra@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 08:45:14 +0200
In-Reply-To: <20250408-stable-sve-5-15-v3-7-ca9a6b850f55@kernel.org>
Message-ID: <2025042214-mute-deodorize-2a01@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_234546_591012_B7374A80 
X-CRM114-Status: GOOD (  26.70  )
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

    KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-unconditionally-save-flush-host-fpsimd-sve-sme-state.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From broonie@kernel.org Tue Apr  8 20:22:40 2025
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:10:02 +0100
Subject: KVM: arm64: Unconditionally save+flush host FPSIMD/SVE/SME state
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>,  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,  Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,  linux-kernel@vger.kernel.org, stable@vger.kernel.org,  Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,  Eric Auger <eauger@redhat.com>, Wilco Dijkstra <wilco.dijkstra@arm.com>,  Eric Auger <eric.auger@redhat.com>, Florian Weimer <fweimer@redhat.com>,  Fuad Tabba <tabba@google.com>, Jeremy Linton <jeremy.linton@arm.com>,  Paolo Bonzini <pbonzini@redhat.com>
Message-ID: <20250408-stable-sve-5-15-v3-7-ca9a6b850f55@kernel.org>

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit fbc7e61195e23f744814e78524b73b59faa54ab4 ]

There are several problems with the way hyp code lazily saves the host's
FPSIMD/SVE state, including:

* Host SVE being discarded unexpectedly due to inconsistent
  configuration of TIF_SVE and CPACR_ELx.ZEN. This has been seen to
  result in QEMU crashes where SVE is used by memmove(), as reported by
  Eric Auger:

  https://issues.redhat.com/browse/RHEL-68997

* Host SVE state is discarded *after* modification by ptrace, which was an
  unintentional ptrace ABI change introduced with lazy discarding of SVE state.

* The host FPMR value can be discarded when running a non-protected VM,
  where FPMR support is not exposed to a VM, and that VM uses
  FPSIMD/SVE. In these cases the hyp code does not save the host's FPMR
  before unbinding the host's FPSIMD/SVE/SME state, leaving a stale
  value in memory.

Avoid these by eagerly saving and "flushing" the host's FPSIMD/SVE/SME
state when loading a vCPU such that KVM does not need to save any of the
host's FPSIMD/SVE/SME state. For clarity, fpsimd_kvm_prepare() is
removed and the necessary call to fpsimd_save_and_flush_cpu_state() is
placed in kvm_arch_vcpu_load_fp(). As 'fpsimd_state' and 'fpmr_ptr'
should not be used, they are set to NULL; all uses of these will be
removed in subsequent patches.

Historical problems go back at least as far as v5.17, e.g. erroneous
assumptions about TIF_SVE being clear in commit:

  8383741ab2e773a9 ("KVM: arm64: Get rid of host SVE tracking/saving")

... and so this eager save+flush probably needs to be backported to ALL
stable trees.

Fixes: 93ae6b01bafee8fa ("KVM: arm64: Discard any SVE state when entering KVM guests")
Fixes: 8c845e2731041f0f ("arm64/sve: Leave SVE enabled on syscall if we don't context switch")
Fixes: ef3be86021c3bdf3 ("KVM: arm64: Add save/restore support for FPMR")
Reported-by: Eric Auger <eauger@redhat.com>
Reported-by: Wilco Dijkstra <wilco.dijkstra@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Tested-by: Eric Auger <eric.auger@redhat.com>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Florian Weimer <fweimer@redhat.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Jeremy Linton <jeremy.linton@arm.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Cc: Paolo Bonzini <pbonzini@redhat.com>
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-2-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[ Mark: Handle vcpu/host flag conflict, remove host_data_ptr() ]
Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/kernel/fpsimd.c |   25 -------------------------
 arch/arm64/kvm/fpsimd.c    |   13 ++++++++++---
 2 files changed, 10 insertions(+), 28 deletions(-)

--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -1155,31 +1155,6 @@ void fpsimd_signal_preserve_current_stat
 }
 
 /*
- * Called by KVM when entering the guest.
- */
-void fpsimd_kvm_prepare(void)
-{
-	if (!system_supports_sve())
-		return;
-
-	/*
-	 * KVM does not save host SVE state since we can only enter
-	 * the guest from a syscall so the ABI means that only the
-	 * non-saved SVE state needs to be saved.  If we have left
-	 * SVE enabled for performance reasons then update the task
-	 * state to be FPSIMD only.
-	 */
-	get_cpu_fpsimd_context();
-
-	if (test_and_clear_thread_flag(TIF_SVE)) {
-		sve_to_fpsimd(current);
-		current->thread.fp_type = FP_STATE_FPSIMD;
-	}
-
-	put_cpu_fpsimd_context();
-}
-
-/*
  * Associate current's FPSIMD context with this cpu
  * The caller must have ownership of the cpu FPSIMD context before calling
  * this function.
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -74,9 +74,16 @@ void kvm_arch_vcpu_load_fp(struct kvm_vc
 	vcpu->arch.flags &= ~KVM_ARM64_FP_ENABLED;
 	vcpu->arch.flags |= KVM_ARM64_FP_HOST;
 
-	fpsimd_kvm_prepare();
-
-	vcpu->arch.flags &= ~KVM_ARM64_HOST_SVE_ENABLED;
+	/*
+	 * Ensure that any host FPSIMD/SVE/SME state is saved and unbound such
+	 * that the host kernel is responsible for restoring this state upon
+	 * return to userspace, and the hyp code doesn't need to save anything.
+	 *
+	 * When the host may use SME, fpsimd_save_and_flush_cpu_state() ensures
+	 * that PSTATE.{SM,ZA} == {0,0}.
+	 */
+	fpsimd_save_and_flush_cpu_state();
+	vcpu->arch.flags &= ~KVM_ARM64_FP_HOST;
 
 	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
 		vcpu->arch.flags |= KVM_ARM64_HOST_SVE_ENABLED;


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

