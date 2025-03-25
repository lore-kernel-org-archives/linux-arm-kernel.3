Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 98990C35FFC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 25 Mar 2025 11:37:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=Rpnai9VXBrf/fJ/k4amxW5E+ReIs+XgkD+X/EeNU7Fc=; b=k0bxGyawYzolMt9CMCv1W6mjRS
	zQf+stF69ygNhClbPLxY67WRWcxtqiXND6Zi8WEeuyt0EnqRCtxamtIX/9LaU34TNj3t9r0znlBSV
	hcbLuVKMMd9qeVUxR8YzO3o83JByssU7fcQFR53SSJRdk1wY1gnOW9v0rZ4/HeoVcOrbab/b63ZWl
	oPIiX/fkTejUQ0Q0qGO/jo4V2/Q6CbTjBbxAUG9CU2xAfflVlBKfyRfbCEKESQKEwhpb0HNxV3UUg
	bP9OJDU4JqQIkKqDLHIYOAtXHOpLXbSw7xihAGN1MRVxQaEphiqQFgvDPSNtVAUDfa8cyaM0JJlio
	iWtWs+zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2ax-00000005ens-1DQS;
	Tue, 25 Mar 2025 11:37:23 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tx2UJ-00000005dis-2ZWy
	for linux-arm-kernel@lists.infradead.org;
	Tue, 25 Mar 2025 11:30:33 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id EADC85C57EB;
	Tue, 25 Mar 2025 11:28:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D36CC4CEE4;
	Tue, 25 Mar 2025 11:30:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742902230;
	bh=bW5pq7nRDARYHxsUJPciapbMKvnHI6897yo2Pn8WucE=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=RhYxyk2Vhd8slEi/vkRdp1buodTxIbMqG+g1M/SxXRtQ99e4SRTtS3jDg/HFmpmAh
	 SbQlYlXk008V/oKUQ98p/tAcgtxakEEwlLf02hMvTrS+WvATN1sQgFAQjjUxND5+qU
	 BPeQ8WzQOngIoE9YjcXaSWpugE+8wvPBSifC7Ayk=
Subject: Patch "KVM: arm64: Remove host FPSIMD saving for non-protected KVM" has been added to the 6.6-stable tree
To: broonie@kernel.org,catalin.marinas@arm.com,gregkh@linuxfoundation.org,james.morse@arm.com,kvmarm@lists.linux.dev,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,maz@kernel.org,oliver.upton@linux.dev,suzuki.poulose@arm.com,tabba@google.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Tue, 25 Mar 2025 07:28:56 -0400
In-Reply-To: <20250321-stable-sve-6-6-v1-3-0b3a6a14ea53@kernel.org>
Message-ID: <2025032556-quizzical-epilogue-bf3b@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250325_043031_770226_BFC59BD1 
X-CRM114-Status: GOOD (  21.07  )
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

to the 6.6-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-remove-host-fpsimd-saving-for-non-protected-kvm.patch
and it can be found in the queue-6.6 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-125721-greg=kroah.com@vger.kernel.org Thu Mar 20 20:20:22 2025
From: Mark Brown <broonie@kernel.org>
Date: Fri, 21 Mar 2025 00:16:03 +0000
Subject: KVM: arm64: Remove host FPSIMD saving for non-protected KVM
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,  James Morse <james.morse@arm.com>,  Suzuki K Poulose <suzuki.poulose@arm.com>,  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,  linux-kernel@vger.kernel.org, stable@vger.kernel.org,  Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,  Fuad Tabba <tabba@google.com>
Message-ID: <20250321-stable-sve-6-6-v1-3-0b3a6a14ea53@kernel.org>

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
 arch/arm64/kvm/fpsimd.c                 |    2 --
 arch/arm64/kvm/hyp/include/hyp/switch.h |    4 ----
 arch/arm64/kvm/hyp/nvhe/hyp-main.c      |    1 -
 4 files changed, 8 deletions(-)

--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -535,7 +535,6 @@ struct kvm_vcpu_arch {
 	struct kvm_guest_debug_arch vcpu_debug_state;
 	struct kvm_guest_debug_arch external_debug_state;
 
-	struct user_fpsimd_state *host_fpsimd_state;	/* hyp VA */
 	struct task_struct *parent_task;
 
 	struct {
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -49,8 +49,6 @@ int kvm_arch_vcpu_run_map_fp(struct kvm_
 	if (ret)
 		return ret;
 
-	vcpu->arch.host_fpsimd_state = kern_hyp_va(fpsimd);
-
 	/*
 	 * We need to keep current's task_struct pinned until its data has been
 	 * unshared with the hypervisor to make sure it is not re-used by the
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@ -321,10 +321,6 @@ static bool kvm_hyp_handle_fpsimd(struct
 	}
 	isb();
 
-	/* Write out the host state if it's in the registers */
-	if (vcpu->arch.fp_state == FP_STATE_HOST_OWNED)
-		__fpsimd_save_state(vcpu->arch.host_fpsimd_state);
-
 	/* Restore the guest state */
 	if (sve_guest)
 		__hyp_sve_restore_guest(vcpu);
--- a/arch/arm64/kvm/hyp/nvhe/hyp-main.c
+++ b/arch/arm64/kvm/hyp/nvhe/hyp-main.c
@@ -41,7 +41,6 @@ static void flush_hyp_vcpu(struct pkvm_h
 	hyp_vcpu->vcpu.arch.fp_state	= host_vcpu->arch.fp_state;
 
 	hyp_vcpu->vcpu.arch.debug_ptr	= kern_hyp_va(host_vcpu->arch.debug_ptr);
-	hyp_vcpu->vcpu.arch.host_fpsimd_state = host_vcpu->arch.host_fpsimd_state;
 
 	hyp_vcpu->vcpu.arch.vsesr_el2	= host_vcpu->arch.vsesr_el2;
 


Patches currently in stable-queue which might be from broonie@kernel.org are

queue-6.6/kvm-arm64-calculate-cptr_el2-traps-on-activating-traps.patch
queue-6.6/regulator-check-that-dummy-regulator-has-been-probed-before-using-it.patch
queue-6.6/kvm-arm64-eagerly-switch-zcr_el-1-2.patch
queue-6.6/kvm-arm64-mark-some-header-functions-as-inline.patch
queue-6.6/kvm-arm64-remove-host-fpsimd-saving-for-non-protected-kvm.patch
queue-6.6/regulator-dummy-force-synchronous-probing.patch
queue-6.6/kvm-arm64-refactor-exit-handlers.patch
queue-6.6/kvm-arm64-unconditionally-save-flush-host-fpsimd-sve-sme-state.patch
queue-6.6/kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.smen.patch
queue-6.6/kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.zen.patch

