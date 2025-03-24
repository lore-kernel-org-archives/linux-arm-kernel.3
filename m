Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AB82FC36008
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 19:39:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=dMfQea7xSO0kQipkV+BSfV7TUzpMwwNyiKkQPOfAfYg=; b=NmPfVONCVQc9bgGvx1MUsmhuvt
	2fIT1dY/vK4SYmQFgZzEQvhRm+kfojGBLHq5J7J51ptlYubetAx25HqK6zwJWu/Q011z3RRJD+PVj
	viLjWMzMcWjTI6jECqREsSiNyj8HZ0wmgebvT676/2Md+08zjg1BSMO9Ui4qe3Oat34omA2ydV5uR
	6yKpAJnkIEA4r2qNmr7DXbQnOWpDui5lKjziRmW+zDtwoSP6UOjRFoMEedF9EOD+84cNPFUMox6hs
	SZbIXcSkq91xztfDSDs7iXTy0TeqTM+6bCv3GOXe4AWfvyQIQqpU1nwzZa5AR31+GPXhp0R0sCL8G
	OTO/Tytg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twndY-0000000466w-0vuS;
	Mon, 24 Mar 2025 19:39:04 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twn2R-000000040YW-1aOE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 19:00:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id DB51F5C014A;
	Mon, 24 Mar 2025 18:58:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 63592C4CEE4;
	Mon, 24 Mar 2025 19:00:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1742842842;
	bh=J2S+Lv5BWjXt0yK/pyBR8FIhxgiGWlr1lgLVl1VE8bM=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=05HgBDQeslUIUY/vJ1dLJYwJvx06M1BHpFtq2SPcG/JnnDUcnGl/yLWXUtKX/1Dq9
	 g1g9z3zdTkWAEi7bHcAah0n21MBlcXw3NJ/9XbnZBhG8X87UqWBrvbyOWGtRQ2GNGQ
	 FRBXjdmjTUmC0KF5ahknL4R3K/xUOU6gynRK2RiU=
Subject: Patch "KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN" has been added to the 6.12-stable tree
To: broonie@kernel.org,catalin.marinas@arm.com,gregkh@linuxfoundation.org,joey.gouly@arm.com,kvmarm@lists.linux.dev,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,maz@kernel.org,oliver.upton@linux.dev,suzuki.poulose@arm.com,tabba@google.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Mon, 24 Mar 2025 11:59:05 -0700
In-Reply-To: <20250321-stable-sve-6-12-v2-4-417ca2278d18@kernel.org>
Message-ID: <2025032405-dizzy-promotion-0062@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_120043_513299_AA980ED5 
X-CRM114-Status: GOOD (  20.05  )
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

    KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN

to the 6.12-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.zen.patch
and it can be found in the queue-6.12 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From broonie@kernel.org Thu Mar 20 17:13:41 2025
From: Mark Brown <broonie@kernel.org>
Date: Fri, 21 Mar 2025 00:13:00 +0000
Subject: KVM: arm64: Remove VHE host restore of CPACR_EL1.ZEN
To: Greg Kroah-Hartman <gregkh@linuxfoundation.org>,  Marc Zyngier <maz@kernel.org>, Oliver Upton <oliver.upton@linux.dev>,  Joey Gouly <joey.gouly@arm.com>, Suzuki K Poulose <suzuki.poulose@arm.com>,  Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,  linux-kernel@vger.kernel.org, stable@vger.kernel.org,  Mark Brown <broonie@kernel.org>, Mark Rutland <mark.rutland@arm.com>,  Fuad Tabba <tabba@google.com>
Message-ID: <20250321-stable-sve-6-12-v2-4-417ca2278d18@kernel.org>

From: Mark Rutland <mark.rutland@arm.com>

[ Upstream commit 459f059be702056d91537b99a129994aa6ccdd35 ]

When KVM is in VHE mode, the host kernel tries to save and restore the
configuration of CPACR_EL1.ZEN (i.e. CPTR_EL2.ZEN when HCR_EL2.E2H=1)
across kvm_arch_vcpu_load_fp() and kvm_arch_vcpu_put_fp(), since the
configuration may be clobbered by hyp when running a vCPU. This logic is
currently redundant.

The VHE hyp code unconditionally configures CPTR_EL2.ZEN to 0b01 when
returning to the host, permitting host kernel usage of SVE.

Now that the host eagerly saves and unbinds its own FPSIMD/SVE/SME
state, there's no need to save/restore the state of the EL0 SVE trap.
The kernel can safely save/restore state without trapping, as described
above, and will restore userspace state (including trap controls) before
returning to userspace.

Remove the redundant logic.

Signed-off-by: Mark Rutland <mark.rutland@arm.com>
Reviewed-by: Mark Brown <broonie@kernel.org>
Tested-by: Mark Brown <broonie@kernel.org>
Acked-by: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>
Cc: Fuad Tabba <tabba@google.com>
Cc: Marc Zyngier <maz@kernel.org>
Cc: Oliver Upton <oliver.upton@linux.dev>
Reviewed-by: Oliver Upton <oliver.upton@linux.dev>
Link: https://lore.kernel.org/r/20250210195226.1215254-4-mark.rutland@arm.com
Signed-off-by: Marc Zyngier <maz@kernel.org>
[Rework for refactoring of where the flags are stored -- broonie]
Signed-off-by: Mark Brown <broonie@kernel.org>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 arch/arm64/include/asm/kvm_host.h |    2 --
 arch/arm64/kvm/fpsimd.c           |   16 ----------------
 2 files changed, 18 deletions(-)

--- a/arch/arm64/include/asm/kvm_host.h
+++ b/arch/arm64/include/asm/kvm_host.h
@@ -891,8 +891,6 @@ struct kvm_vcpu_arch {
 /* Save TRBE context if active  */
 #define DEBUG_STATE_SAVE_TRBE	__vcpu_single_flag(iflags, BIT(6))
 
-/* SVE enabled for host EL0 */
-#define HOST_SVE_ENABLED	__vcpu_single_flag(sflags, BIT(0))
 /* SME enabled for EL0 */
 #define HOST_SME_ENABLED	__vcpu_single_flag(sflags, BIT(1))
 /* Physical CPU not in supported_cpus */
--- a/arch/arm64/kvm/fpsimd.c
+++ b/arch/arm64/kvm/fpsimd.c
@@ -65,10 +65,6 @@ void kvm_arch_vcpu_load_fp(struct kvm_vc
 	fpsimd_save_and_flush_cpu_state();
 	*host_data_ptr(fp_owner) = FP_STATE_FREE;
 
-	vcpu_clear_flag(vcpu, HOST_SVE_ENABLED);
-	if (read_sysreg(cpacr_el1) & CPACR_EL1_ZEN_EL0EN)
-		vcpu_set_flag(vcpu, HOST_SVE_ENABLED);
-
 	if (system_supports_sme()) {
 		vcpu_clear_flag(vcpu, HOST_SME_ENABLED);
 		if (read_sysreg(cpacr_el1) & CPACR_EL1_SMEN_EL0EN)
@@ -202,18 +198,6 @@ void kvm_arch_vcpu_put_fp(struct kvm_vcp
 		 * when needed.
 		 */
 		fpsimd_save_and_flush_cpu_state();
-	} else if (has_vhe() && system_supports_sve()) {
-		/*
-		 * The FPSIMD/SVE state in the CPU has not been touched, and we
-		 * have SVE (and VHE): CPACR_EL1 (alias CPTR_EL2) has been
-		 * reset by kvm_reset_cptr_el2() in the Hyp code, disabling SVE
-		 * for EL0.  To avoid spurious traps, restore the trap state
-		 * seen by kvm_arch_vcpu_load_fp():
-		 */
-		if (vcpu_get_flag(vcpu, HOST_SVE_ENABLED))
-			sysreg_clear_set(CPACR_EL1, 0, CPACR_EL1_ZEN_EL0EN);
-		else
-			sysreg_clear_set(CPACR_EL1, CPACR_EL1_ZEN_EL0EN, 0);
 	}
 
 	local_irq_restore(flags);


Patches currently in stable-queue which might be from broonie@kernel.org are

queue-6.12/kvm-arm64-calculate-cptr_el2-traps-on-activating-traps.patch
queue-6.12/regulator-check-that-dummy-regulator-has-been-probed-before-using-it.patch
queue-6.12/kvm-arm64-eagerly-switch-zcr_el-1-2.patch
queue-6.12/kvm-arm64-mark-some-header-functions-as-inline.patch
queue-6.12/kvm-arm64-remove-host-fpsimd-saving-for-non-protected-kvm.patch
queue-6.12/regulator-dummy-force-synchronous-probing.patch
queue-6.12/kvm-arm64-refactor-exit-handlers.patch
queue-6.12/kvm-arm64-unconditionally-save-flush-host-fpsimd-sve-sme-state.patch
queue-6.12/kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.smen.patch
queue-6.12/kvm-arm64-remove-vhe-host-restore-of-cpacr_el1.zen.patch

