Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8572EF99355
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Apr 2026 09:01:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:In-Reply-To:Date:From:Cc:To:Subject:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:References:List-Owner;
	bh=6lZSIbd/k7DXSDjUZHdCgbgIHswjqbSqn1mDcUG8pRs=; b=z9a+vWNUMMgKzFu9QkKI9LiCMi
	Y0A9AHvwhwJ/8LWn/DhzZBj8d/niRJvFZedbkZajRdbGJNeDvR6jZVtBCLgetStGNhJBoYkvCd150
	KexSX0E5QvKCVR3mHGL8sU00Q0weH+G1hz7Ibx4k0qTchxYOjSMKw+rxi2Altp7D6hKzXNrldAeSn
	A8X8Hxz+8RrnlTX9UX88Afu0+YKjNJ1h3e6wQQ/mN8q9kVRc7vFMETqIu9A7dmySPvnK7HdOLySfD
	cqnLP4e9Rby+icWIpVjoJKgcSDCArRxzfkb67tqRPO7ieF6ZEL7Xv86Z5SGMDzKgY4x124vl/lTUw
	hnagg1zw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpvz-0000000BIad-3b4V;
	Thu, 23 Apr 2026 09:01:19 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFpvy-0000000BIZO-0ffF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Apr 2026 09:01:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 259AF60121;
	Thu, 23 Apr 2026 09:01:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 850A8C2BCAF;
	Thu, 23 Apr 2026 09:01:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=linuxfoundation.org;
	s=korg; t=1776934876;
	bh=bac0X5AMsir+Lol6B3LdACvbo0ncJBVnoZ2USo7iwCU=;
	h=Subject:To:Cc:From:Date:In-Reply-To:From;
	b=Wvx4bS/0nMGW/3jwg8t8nGS4xO6kNhOmz5St9PICR8IbOIxYnpTgXAEXaWGC7S/+u
	 vFKarunF1F+l2wjItup8d0T+0Khjpxa+EME1dWd9VSHxfQK6mzRuMS1rIauFACpzj8
	 ztjPP23nYmrl76FjKIZKGdgA/qvEZnyBLSHSbkcU=
Subject: Patch "arm64: errata: Work around early CME DVMSync acknowledgement" has been added to the 6.18-stable tree
To: broonie@kernel.org,catalin.marinas@arm.com,gregkh@linuxfoundation.org,james.morse@arm.com,linux-arm-kernel@lists.infradead.org,mark.rutland@arm.com,will@kernel.org
Cc: <stable-commits@vger.kernel.org>
From: <gregkh@linuxfoundation.org>
Date: Thu, 23 Apr 2026 11:01:14 +0200
In-Reply-To: <20260421100018.335793-7-catalin.marinas@arm.com>
Message-ID: <2026042314-direction-feisty-ada3@gregkh>
MIME-Version: 1.0
Content-Type: text/plain; charset=ANSI_X3.4-1968
Content-Transfer-Encoding: 8bit
X-stable: commit
X-Patchwork-Hint: ignore 
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

    arm64: errata: Work around early CME DVMSync acknowledgement

to the 6.18-stable tree which can be found at:
    http://www.kernel.org/git/?p=linux/kernel/git/stable/stable-queue.git;a=summary

The filename of the patch is:
     arm64-errata-work-around-early-cme-dvmsync-acknowledgement.patch
and it can be found in the queue-6.18 subdirectory.

If you, or anyone else, feels it should not be added to the stable tree,
please let <stable@vger.kernel.org> know about it.


From stable+bounces-240114-greg=kroah.com@vger.kernel.org Tue Apr 21 12:07:30 2026
From: Catalin Marinas <catalin.marinas@arm.com>
Date: Tue, 21 Apr 2026 11:00:17 +0100
Subject: arm64: errata: Work around early CME DVMSync acknowledgement
To: stable@vger.kernel.org
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org
Message-ID: <20260421100018.335793-7-catalin.marinas@arm.com>

From: Catalin Marinas <catalin.marinas@arm.com>

commit 0baba94a9779c13c857f6efc55807e6a45b1d4e4 upstream.

C1-Pro acknowledges DVMSync messages before completing the SME/CME
memory accesses. Work around this by issuing an IPI to the affected CPUs
if they are running in EL0 with SME enabled.

Note that we avoid the local DSB in the IPI handler as the kernel runs
with SCTLR_EL1.IESB=1. This is sufficient to complete SME memory
accesses at EL0 on taking an exception to EL1. On the return to user
path, no barrier is necessary either. See the comment in
sme_set_active() and the more detailed explanation in the link below.

To avoid a potential IPI flood from malicious applications (e.g.
madvise(MADV_PAGEOUT) in a tight loop), track where a process is active
via mm_cpumask() and only interrupt those CPUs.

Link: https://lore.kernel.org/r/ablEXwhfKyJW1i7l@J2N7QTR9R3
Cc: Will Deacon <will@kernel.org>
Cc: Mark Rutland <mark.rutland@arm.com>
Cc: James Morse <james.morse@arm.com>
Cc: Mark Brown <broonie@kernel.org>
Reviewed-by: Will Deacon <will@kernel.org>
Signed-off-by: Catalin Marinas <catalin.marinas@arm.com>
Signed-off-by: Greg Kroah-Hartman <gregkh@linuxfoundation.org>
---
 Documentation/arch/arm64/silicon-errata.rst |    2 
 arch/arm64/Kconfig                          |   12 ++++
 arch/arm64/include/asm/cpucaps.h            |    2 
 arch/arm64/include/asm/fpsimd.h             |   21 +++++++
 arch/arm64/include/asm/tlbbatch.h           |   10 ++-
 arch/arm64/include/asm/tlbflush.h           |   72 ++++++++++++++++++++++++-
 arch/arm64/kernel/cpu_errata.c              |   30 ++++++++++
 arch/arm64/kernel/entry-common.c            |    3 +
 arch/arm64/kernel/fpsimd.c                  |   79 ++++++++++++++++++++++++++++
 arch/arm64/kernel/process.c                 |   36 ++++++++++++
 arch/arm64/tools/cpucaps                    |    1 
 11 files changed, 264 insertions(+), 4 deletions(-)

--- a/Documentation/arch/arm64/silicon-errata.rst
+++ b/Documentation/arch/arm64/silicon-errata.rst
@@ -202,6 +202,8 @@ stable kernels.
 +----------------+-----------------+-----------------+-----------------------------+
 | ARM            | Neoverse-V3AE   | #3312417        | ARM64_ERRATUM_3194386       |
 +----------------+-----------------+-----------------+-----------------------------+
+| ARM            | C1-Pro          | #4193714        | ARM64_ERRATUM_4193714       |
++----------------+-----------------+-----------------+-----------------------------+
 | ARM            | MMU-500         | #841119,826419  | ARM_SMMU_MMU_500_CPRE_ERRATA|
 |                |                 | #562869,1047329 |                             |
 +----------------+-----------------+-----------------+-----------------------------+
--- a/arch/arm64/Kconfig
+++ b/arch/arm64/Kconfig
@@ -1154,6 +1154,18 @@ config ARM64_ERRATUM_3194386
 
 	  If unsure, say Y.
 
+config ARM64_ERRATUM_4193714
+	bool "C1-Pro: 4193714: SME DVMSync early acknowledgement"
+	depends on ARM64_SME
+	default y
+	help
+	  Enable workaround for C1-Pro acknowledging the DVMSync before
+	  the SME memory accesses are complete. This will cause TLB
+	  maintenance for processes using SME to also issue an IPI to
+	  the affected CPUs.
+
+	  If unsure, say Y.
+
 config CAVIUM_ERRATUM_22375
 	bool "Cavium erratum 22375, 24313"
 	default y
--- a/arch/arm64/include/asm/cpucaps.h
+++ b/arch/arm64/include/asm/cpucaps.h
@@ -66,6 +66,8 @@ cpucap_is_possible(const unsigned int ca
 		return IS_ENABLED(CONFIG_ARM64_WORKAROUND_REPEAT_TLBI);
 	case ARM64_WORKAROUND_SPECULATIVE_SSBS:
 		return IS_ENABLED(CONFIG_ARM64_ERRATUM_3194386);
+	case ARM64_WORKAROUND_4193714:
+		return IS_ENABLED(CONFIG_ARM64_ERRATUM_4193714);
 	case ARM64_MPAM:
 		/*
 		 * KVM MPAM support doesn't rely on the host kernel supporting MPAM.
--- a/arch/arm64/include/asm/fpsimd.h
+++ b/arch/arm64/include/asm/fpsimd.h
@@ -428,6 +428,24 @@ static inline size_t sme_state_size(stru
 	return __sme_state_size(task_get_sme_vl(task));
 }
 
+void sme_enable_dvmsync(void);
+void sme_set_active(void);
+void sme_clear_active(void);
+
+static inline void sme_enter_from_user_mode(void)
+{
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
+	    test_thread_flag(TIF_SME))
+		sme_clear_active();
+}
+
+static inline void sme_exit_to_user_mode(void)
+{
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714) &&
+	    test_thread_flag(TIF_SME))
+		sme_set_active();
+}
+
 #else
 
 static inline void sme_user_disable(void) { BUILD_BUG(); }
@@ -456,6 +474,9 @@ static inline size_t sme_state_size(stru
 	return 0;
 }
 
+static inline void sme_enter_from_user_mode(void) { }
+static inline void sme_exit_to_user_mode(void) { }
+
 #endif /* ! CONFIG_ARM64_SME */
 
 /* For use by EFI runtime services calls only */
--- a/arch/arm64/include/asm/tlbbatch.h
+++ b/arch/arm64/include/asm/tlbbatch.h
@@ -2,11 +2,17 @@
 #ifndef _ARCH_ARM64_TLBBATCH_H
 #define _ARCH_ARM64_TLBBATCH_H
 
+#include <linux/cpumask.h>
+
 struct arch_tlbflush_unmap_batch {
+#ifdef CONFIG_ARM64_ERRATUM_4193714
 	/*
-	 * For arm64, HW can do tlb shootdown, so we don't
-	 * need to record cpumask for sending IPI
+	 * Track CPUs that need SME DVMSync on completion of this batch.
+	 * Otherwise, the arm64 HW can do tlb shootdown, so we don't need to
+	 * record cpumask for sending IPI
 	 */
+	cpumask_var_t cpumask;
+#endif
 };
 
 #endif /* _ARCH_ARM64_TLBBATCH_H */
--- a/arch/arm64/include/asm/tlbflush.h
+++ b/arch/arm64/include/asm/tlbflush.h
@@ -80,6 +80,71 @@ static inline unsigned long get_trans_gr
 	}
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+
+void sme_do_dvmsync(const struct cpumask *mask);
+
+static inline void sme_dvmsync(struct mm_struct *mm)
+{
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		return;
+
+	sme_do_dvmsync(mm_cpumask(mm));
+}
+
+static inline void sme_dvmsync_add_pending(struct arch_tlbflush_unmap_batch *batch,
+					   struct mm_struct *mm)
+{
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		return;
+
+	/*
+	 * Order the mm_cpumask() read after the hardware DVMSync.
+	 */
+	dsb(ish);
+	if (cpumask_empty(mm_cpumask(mm)))
+		return;
+
+	/*
+	 * Allocate the batch cpumask on first use. Fall back to an immediate
+	 * IPI for this mm in case of failure.
+	 */
+	if (!cpumask_available(batch->cpumask) &&
+	    !zalloc_cpumask_var(&batch->cpumask, GFP_ATOMIC)) {
+		sme_do_dvmsync(mm_cpumask(mm));
+		return;
+	}
+
+	cpumask_or(batch->cpumask, batch->cpumask, mm_cpumask(mm));
+}
+
+static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
+{
+	if (!alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		return;
+
+	if (!cpumask_available(batch->cpumask))
+		return;
+
+	sme_do_dvmsync(batch->cpumask);
+	cpumask_clear(batch->cpumask);
+}
+
+#else
+
+static inline void sme_dvmsync(struct mm_struct *mm)
+{
+}
+static inline void sme_dvmsync_add_pending(struct arch_tlbflush_unmap_batch *batch,
+					   struct mm_struct *mm)
+{
+}
+static inline void sme_dvmsync_batch(struct arch_tlbflush_unmap_batch *batch)
+{
+}
+
+#endif /* CONFIG_ARM64_ERRATUM_4193714 */
+
 /*
  * Level-based TLBI operations.
  *
@@ -189,12 +254,14 @@ static inline void __tlbi_sync_s1ish(str
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
+	sme_dvmsync(mm);
 }
 
-static inline void __tlbi_sync_s1ish_batch(void)
+static inline void __tlbi_sync_s1ish_batch(struct arch_tlbflush_unmap_batch *batch)
 {
 	dsb(ish);
 	__repeat_tlbi_sync(vale1is, 0);
+	sme_dvmsync_batch(batch);
 }
 
 static inline void __tlbi_sync_s1ish_kernel(void)
@@ -357,7 +424,7 @@ static inline bool arch_tlbbatch_should_
  */
 static inline void arch_tlbbatch_flush(struct arch_tlbflush_unmap_batch *batch)
 {
-	__tlbi_sync_s1ish_batch();
+	__tlbi_sync_s1ish_batch(batch);
 }
 
 /*
@@ -546,6 +613,7 @@ static inline void arch_tlbbatch_add_pen
 		struct mm_struct *mm, unsigned long start, unsigned long end)
 {
 	__flush_tlb_range_nosync(mm, start, end, PAGE_SIZE, true, 3);
+	sme_dvmsync_add_pending(batch, mm);
 }
 #endif
 
--- a/arch/arm64/kernel/cpu_errata.c
+++ b/arch/arm64/kernel/cpu_errata.c
@@ -11,6 +11,7 @@
 #include <asm/cpu.h>
 #include <asm/cputype.h>
 #include <asm/cpufeature.h>
+#include <asm/fpsimd.h>
 #include <asm/kvm_asm.h>
 #include <asm/smp_plat.h>
 
@@ -551,6 +552,23 @@ static const struct midr_range erratum_s
 };
 #endif
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+static bool has_sme_dvmsync_erratum(const struct arm64_cpu_capabilities *entry,
+				    int scope)
+{
+	if (!id_aa64pfr1_sme(read_sanitised_ftr_reg(SYS_ID_AA64PFR1_EL1)))
+		return false;
+
+	return is_affected_midr_range(entry, scope);
+}
+
+static void cpu_enable_sme_dvmsync(const struct arm64_cpu_capabilities *__unused)
+{
+	if (this_cpu_has_cap(ARM64_WORKAROUND_4193714))
+		sme_enable_dvmsync();
+}
+#endif
+
 #ifdef CONFIG_AMPERE_ERRATUM_AC03_CPU_38
 static const struct midr_range erratum_ac03_cpu_38_list[] = {
 	MIDR_ALL_VERSIONS(MIDR_AMPERE1),
@@ -870,6 +888,18 @@ const struct arm64_cpu_capabilities arm6
 		ERRATA_MIDR_RANGE_LIST(erratum_spec_ssbs_list),
 	},
 #endif
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+	{
+		.desc = "C1-Pro SME DVMSync early acknowledgement",
+		.capability = ARM64_WORKAROUND_4193714,
+		.type = ARM64_CPUCAP_LOCAL_CPU_ERRATUM,
+		.matches = has_sme_dvmsync_erratum,
+		.cpu_enable = cpu_enable_sme_dvmsync,
+		/* C1-Pro r0p0 - r1p2 (the latter only when REVIDR_EL1[0]==0) */
+		.midr_range = MIDR_RANGE(MIDR_C1_PRO, 0, 0, 1, 2),
+		MIDR_FIXED(MIDR_CPU_VAR_REV(1, 2), BIT(0)),
+	},
+#endif
 #ifdef CONFIG_ARM64_WORKAROUND_SPECULATIVE_UNPRIV_LOAD
 	{
 		.desc = "ARM errata 2966298, 3117295",
--- a/arch/arm64/kernel/entry-common.c
+++ b/arch/arm64/kernel/entry-common.c
@@ -21,6 +21,7 @@
 #include <asm/daifflags.h>
 #include <asm/esr.h>
 #include <asm/exception.h>
+#include <asm/fpsimd.h>
 #include <asm/irq_regs.h>
 #include <asm/kprobes.h>
 #include <asm/mmu.h>
@@ -84,6 +85,7 @@ static __always_inline void __enter_from
 {
 	enter_from_user_mode(regs);
 	mte_disable_tco_entry(current);
+	sme_enter_from_user_mode();
 }
 
 static __always_inline void arm64_enter_from_user_mode(struct pt_regs *regs)
@@ -102,6 +104,7 @@ static __always_inline void arm64_exit_t
 	local_irq_disable();
 	exit_to_user_mode_prepare(regs);
 	local_daif_mask();
+	sme_exit_to_user_mode();
 	mte_check_tfsr_exit();
 	exit_to_user_mode();
 }
--- a/arch/arm64/kernel/fpsimd.c
+++ b/arch/arm64/kernel/fpsimd.c
@@ -15,6 +15,7 @@
 #include <linux/compiler.h>
 #include <linux/cpu.h>
 #include <linux/cpu_pm.h>
+#include <linux/cpumask.h>
 #include <linux/ctype.h>
 #include <linux/kernel.h>
 #include <linux/linkage.h>
@@ -28,6 +29,7 @@
 #include <linux/sched/task_stack.h>
 #include <linux/signal.h>
 #include <linux/slab.h>
+#include <linux/smp.h>
 #include <linux/stddef.h>
 #include <linux/sysctl.h>
 #include <linux/swab.h>
@@ -1384,6 +1386,83 @@ void do_sve_acc(unsigned long esr, struc
 	put_cpu_fpsimd_context();
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+
+/*
+ * SME/CME erratum handling.
+ */
+static cpumask_t sme_dvmsync_cpus;
+
+/*
+ * These helpers are only called from non-preemptible contexts, so
+ * smp_processor_id() is safe here.
+ */
+void sme_set_active(void)
+{
+	unsigned int cpu = smp_processor_id();
+
+	if (!cpumask_test_cpu(cpu, &sme_dvmsync_cpus))
+		return;
+
+	cpumask_set_cpu(cpu, mm_cpumask(current->mm));
+
+	/*
+	 * A subsequent (post ERET) SME access may use a stale address
+	 * translation. On C1-Pro, a TLBI+DSB on a different CPU will wait for
+	 * the completion of cpumask_set_cpu() above as it appears in program
+	 * order before the SME access. The post-TLBI+DSB read of mm_cpumask()
+	 * will lead to the IPI being issued.
+	 *
+	 * https://lore.kernel.org/r/ablEXwhfKyJW1i7l@J2N7QTR9R3
+	 */
+}
+
+void sme_clear_active(void)
+{
+	unsigned int cpu = smp_processor_id();
+
+	if (!cpumask_test_cpu(cpu, &sme_dvmsync_cpus))
+		return;
+
+	/*
+	 * With SCTLR_EL1.IESB enabled, the SME memory transactions are
+	 * completed on entering EL1.
+	 */
+	cpumask_clear_cpu(cpu, mm_cpumask(current->mm));
+}
+
+static void sme_dvmsync_ipi(void *unused)
+{
+	/*
+	 * With SCTLR_EL1.IESB on, taking an exception is sufficient to ensure
+	 * the completion of the SME memory accesses, so no need for an
+	 * explicit DSB.
+	 */
+}
+
+void sme_do_dvmsync(const struct cpumask *mask)
+{
+	/*
+	 * This is called from the TLB maintenance functions after the DSB ISH
+	 * to send the hardware DVMSync message. If this CPU sees the mask as
+	 * empty, the remote CPU executing sme_set_active() would have seen
+	 * the DVMSync and no IPI required.
+	 */
+	if (cpumask_empty(mask))
+		return;
+
+	preempt_disable();
+	smp_call_function_many(mask, sme_dvmsync_ipi, NULL, true);
+	preempt_enable();
+}
+
+void sme_enable_dvmsync(void)
+{
+	cpumask_set_cpu(smp_processor_id(), &sme_dvmsync_cpus);
+}
+
+#endif /* CONFIG_ARM64_ERRATUM_4193714 */
+
 /*
  * Trapped SME access
  *
--- a/arch/arm64/kernel/process.c
+++ b/arch/arm64/kernel/process.c
@@ -26,6 +26,7 @@
 #include <linux/reboot.h>
 #include <linux/interrupt.h>
 #include <linux/init.h>
+#include <linux/cpumask.h>
 #include <linux/cpu.h>
 #include <linux/elfcore.h>
 #include <linux/pm.h>
@@ -339,8 +340,41 @@ void flush_thread(void)
 	flush_gcs();
 }
 
+#ifdef CONFIG_ARM64_ERRATUM_4193714
+
+static void arch_dup_tlbbatch_mask(struct task_struct *dst)
+{
+	/*
+	 * Clear the inherited cpumask with memset() to cover both cases where
+	 * cpumask_var_t is a pointer or an array. It will be allocated lazily
+	 * in sme_dvmsync_add_pending() if CPUMASK_OFFSTACK=y.
+	 */
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		memset(&dst->tlb_ubc.arch.cpumask, 0,
+		       sizeof(dst->tlb_ubc.arch.cpumask));
+}
+
+static void arch_release_tlbbatch_mask(struct task_struct *tsk)
+{
+	if (alternative_has_cap_unlikely(ARM64_WORKAROUND_4193714))
+		free_cpumask_var(tsk->tlb_ubc.arch.cpumask);
+}
+
+#else
+
+static void arch_dup_tlbbatch_mask(struct task_struct *dst)
+{
+}
+
+static void arch_release_tlbbatch_mask(struct task_struct *tsk)
+{
+}
+
+#endif /* CONFIG_ARM64_ERRATUM_4193714 */
+
 void arch_release_task_struct(struct task_struct *tsk)
 {
+	arch_release_tlbbatch_mask(tsk);
 	fpsimd_release_task(tsk);
 }
 
@@ -356,6 +390,8 @@ int arch_dup_task_struct(struct task_str
 
 	*dst = *src;
 
+	arch_dup_tlbbatch_mask(dst);
+
 	/*
 	 * Drop stale reference to src's sve_state and convert dst to
 	 * non-streaming FPSIMD mode.
--- a/arch/arm64/tools/cpucaps
+++ b/arch/arm64/tools/cpucaps
@@ -101,6 +101,7 @@ WORKAROUND_2077057
 WORKAROUND_2457168
 WORKAROUND_2645198
 WORKAROUND_2658417
+WORKAROUND_4193714
 WORKAROUND_AMPERE_AC03_CPU_38
 WORKAROUND_AMPERE_AC04_CPU_23
 WORKAROUND_TRBE_OVERWRITE_FILL_MODE


Patches currently in stable-queue which might be from catalin.marinas@arm.com are

queue-6.18/arm64-tlb-allow-xzr-argument-to-tlbi-ops.patch
queue-6.18/arm64-tlb-introduce-__tlbi_sync_s1ish_-kernel-batch-for-tlb-maintenance.patch
queue-6.18/arm64-tlb-optimize-arm64_workaround_repeat_tlbi.patch
queue-6.18/arm64-tlb-pass-the-corresponding-mm-to-__tlbi_sync_s1ish.patch
queue-6.18/arm64-cputype-add-c1-pro-definitions.patch
queue-6.18/arm64-errata-work-around-early-cme-dvmsync-acknowledgement.patch

