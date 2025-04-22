Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3E9D4C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Apr 2025 07:23:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=SXUmrlZMtZ2amkCJZGD1xL6Fwm5VShTa9XFroeSXrcw=; b=KqNZhyMyHOiu8+HXwffQVmSLVi
	bJ+BTW5Fq4wChqZIx58nZ2WyBZ3wGaazh7P66QnvsGiQ2JMLqjoO9opuoM7mwL1cB3UPYmGs3IzYi
	LRMSk+ktg57IF34fX8OvwcdYmzIj1N1qS2E46i3x4a/HaX8pDpLZZfj3SEJPvppv6Pfm269nBEiiz
	xaDY0txVkQKXYd2EITDHug9kP01/q5frhuEtCnZ40OBGnRc0dBcRmnF8IPx5YTKSyzFeLzVXYgQPr
	0A7qU7Kf/tYjR7+US7m1Q1dSOgimPE1IpCvln6JN9HTRtjUSkytAJB+Akevm3NSKpQrT5VzlIMVnM
	UFSG00sQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77yI-000000066N9-2L0q;
	Tue, 22 Apr 2025 07:23:10 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u77O1-000000061Vb-1ESf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Apr 2025 06:45:42 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 6B32A5C59C5;
	Tue, 22 Apr 2025 06:43:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5F72C4CEE9;
	Tue, 22 Apr 2025 06:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1745304340;
	bh=IelFZyqhnsZfH+nfLfqq2Dnn1AvLKiyy5Z1+g72g8ic=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=CIVQxLMOKyaz02zhzLW8SWe14WTia5KAKTjTW3zwUoKAVZIshPU2fVujnEhOkPBr7
	 GMAl3Y7AHGBgXLOteghgspY1GMDsJTcqNN+M7/+Z1oq8JwmLPYfbu8AFZjd3jbywf2
	 YOXizqDrEpR1Lzw1Q/IeLwG1WWUG3VnYmQqNyZhI=
Subject: Patch "KVM: arm64: Remove host FPSIMD saving for non-protected KVM" has been added to the 5.15-stable tree
To: broonie@kernel.org,catalin.marinas@arm.com,gregkh@linuxfoundation.org,james.morse@arm.com,kvmarm@lists.cs.columbia.edu,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,maz@kernel.org,oleg@redhat.com,oliver.upton@linux.dev,suzuki.poulose@arm.com,tabba@google.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 22 Apr 2025 08:45:14 +0200
In-Reply-To: <20250408-stable-sve-5-15-v3-8-ca9a6b850f55@kernel.org>
Message-ID: <2025042214-contend-fineness-2457@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250421_234541_451371_AE76D1F8 
X-CRM114-Status: GOOD (  18.99  )
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

    KVM: arm64: Remove host FPSIMD saving for non-protected KVM

to the 5.15-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-remove-host-fpsimd-saving-for-non-protected-kvm.patch
and it can be found in the queue-5.15 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From broonie@kernel.org Tue Apr  8 20:22:43 2025
From: Mark Brown <broonie@kernel.org>
Date: Tue, 08 Apr 2025 19:10:03 +0100
Subject: KVM: arm64: Remove host FPSIMD saving for non-protected KVM
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Marc Zyngier <maz@kernel.org>, James Morse <james.morse@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>,  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,  Oleg Nesterov <oleg@redhat.com>, Oliver Upton <oliver.upton@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.cs.columbia.edu,  linux-kernel@vger.kernel.org, stable@vger.kernel.org,  Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,  Fuad Tabba <tabba@google.com>
Message-ID: <20250408-stable-sve-5-15-v3-8-ca9a6b850f55@kernel.org>

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 8eca7f6d5100b6997df4f532090bc3f7e0203bef ]

Now that the host eagerly saves its own FPSIMD/SVE/SME state,
non-protected KVM never needs to save the host FPSIMD/SVE/SME state,
and the code to do this is never used. Protected KVM still needs to
save/restore the host FPSIMD/SVE state to avoid leaking guest state to
the host (and to avoid revealing to the host whether the guest used
FPSIMD/SVE/SME), and that code needs to be retained.

Remove the unused code and data structures.

To avoid the need for a stub copy of kvm_hyp_save_fpsimd_host() in the
VHE hyp code, the nVHE/hVHE version is moved into the shared switch
header, where it is only invoked when KVM is in protected mode.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-3-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/kvm_host.h       |    1 -
 arch/arm64/kvm/fpsimd.c                 |    1 -
 arch/arm64/kvm/hyp/include/hyp/switch.h |    6 +-----
 3 files changed, 1 insertion(+), 7 deletions(-)

--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -333,7 +333,6 @@ struct kvm_vcpu_arch {
 	struct kvm_guest_debug_arch external_debug_state;
 
 	struct thread_info *host_thread_info;	/* hyp VA */
-	struct user_fpsimd_state *host_fpsimd_state;	/* hyp VA */
 
 	struct {
 		/* {Break,watch}point registers */
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -55,7 +55,6 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_
 	}
 
 	vcpu->arch.host_thread_info = kern_hyp_va(ti);
-	vcpu->arch.host_fpsimd_state = kern_hyp_va(fpsimd);
 error:
 	return ret;
 }
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -251,11 +251,7 @@ static inline bool __hyp_handle_fpsimd(s
 	}
 	isb();
 
-	if (vcpu->arch.flags & KVM_ARM64_FP_HOST) {
-		__fpsimd_save_state(vcpu->arch.host_fpsimd_state);
-		vcpu->arch.flags &= ~KVM_ARM64_FP_HOST;
-	}
-
+	/* Restore the guest state */
 	if (sve_guest)
 		__hyp_sve_restore_guest(vcpu);
 	else


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

