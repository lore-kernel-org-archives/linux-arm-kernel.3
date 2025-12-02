Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D2C8ED12687
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 23:06:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbK9xpPsHCqfDqU8OBqwoueMuCuKKdgNoew0cDAPlE8=; b=MI+i2JUQl2NnPZm36E8IT5I2yE
	qEh62LCqPxpC03F+a3ng43jFbb5Kw1Sp7kDi0waNncEI+5TSDXmi7nqo+8cyz16bFA0TJ1/IRfQGp
	RV4NhsI9dm1IULMDVGFtRNDYoFYog4e2cXbBCujr/llmgxIOQyZRiW5QlaC+n2W7XAP77OP8jlYjr
	sDWWmILlyfL/f3v9RKCPoyolNUL6+nAxoTjegjC5CJtmjraBv2vbkpY0rtYLTUx34ne9WPDTOIiJT
	8RP39fGu/9XCzYxZta4d4h6ahqretwfP4VfcOWXeytQv3jxosH/etJVfgUl3qSQNfoCDqF4t6O+tL
	r4EAYuNQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZRd-00000005vDg-2JQj;
	Tue, 02 Dec 2025 23:06:07 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQZRa-00000005vDC-3sgw
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 23:06:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 5885B42422;
	Tue,  2 Dec 2025 23:06:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09B7FC4CEF1;
	Tue,  2 Dec 2025 23:05:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764716760;
	bh=pHU3EfrZbeuFjroWSfke9OzSQALgGHeLgARaRoMnolo=;
	h=Date:From:To:Cc:Subject:From;
	b=iIN06bM7UJeJ+l0D2cctCvtJ7j1Qb+s983NCLbpMq5DSkpUetPuheNd9wVaOfbsAA
	 11ByT/AhZSz3PIz58cQ2Pz8EJ9ThuMv0Etd8dwebx/cuoKn9iRKxLX8gb0FBBsfFmi
	 4ZSMyMRUAqbKi6CWylQHzfPtlbRwLcxrC9jTn+IB3aWFAsdnEjb9tK+FuGNSvHtWVp
	 g4wkxiDZzPIt6LPFmXdDZSpEoyf6GJjRxIjNl73Lj++AKRKqrb2czbVvHpeQADnXMU
	 zHaj2KiHjT+ynZUh80w48LBz5oAIwip01DG/ri7mNZtG39gD5HzZdfqIh96X9CIVVA
	 JONDRjGuUstAg==
Date: Tue, 2 Dec 2025 23:05:56 +0000
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Ard Biesheuvel <ardb@kernel.org>
Subject: [GIT PULL] arm64 updates for 6.19
Message-ID: <aS9w1LWtsZFLX9I9@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_150603_018071_80F01A3A 
X-CRM114-Status: GOOD (  24.10  )
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

Hi Linus,

These are the arm64 updates for 6.19. The biggest part is the Arm MPAM
driver under drivers/resctrl/. There's a patch touching mm/ to handle
spurious faults for huge pmd (similar to the pte version). The
corresponding arm64 part allows us to avoid the TLB maintenance if a
(huge) page is reused after a write fault. There's EFI refactoring to
allow runtime services with preemption enabled and the rest is the usual
perf/PMU updates and several cleanups/typos.

The git conflicts are relatively simple, see the end of this email
(after diffstats) for my resolution. However, there's another diff
needed to avoid build failures after the merge due to the changes via
the tip tree, commit 8cea569ca785 ("sched/mmcid: Use proper data
structures"). Same resolution as in -next:

------------------8<------------------------
diff --git a/drivers/firmware/efi/efi.c b/drivers/firmware/efi/efi.c
index fc407d891348..a9070d00b833 100644
--- a/drivers/firmware/efi/efi.c
+++ b/drivers/firmware/efi/efi.c
@@ -75,7 +75,7 @@ struct mm_struct efi_mm = {
 	.mmlist			= LIST_HEAD_INIT(efi_mm.mmlist),
 	.cpu_bitmap		= { [BITS_TO_LONGS(NR_CPUS)] = 0},
 #ifdef CONFIG_SCHED_MM_CID
-	.cpus_allowed_lock	= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.cpus_allowed_lock),
+	.mm_cid.lock		= __RAW_SPIN_LOCK_UNLOCKED(efi_mm.mm_cid.lock),
 #endif
 };
------------------8<------------------------

Thanks.

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

for you to fetch changes up to edde060637b92607f3522252c03d64ad06369933:

  Merge branch 'for-next/set_memory' into for-next/core (2025-11-28 15:48:03 +0000)

----------------------------------------------------------------
arm64 updates for 6.19:

Core features:

 - Basic Arm MPAM (Memory system resource Partitioning And Monitoring)
   driver under drivers/resctrl/ which makes use of the fs/rectrl/ API

Perf and PMU:

 - Avoid cycle counter on multi-threaded CPUs

 - Extend CSPMU device probing and add additional filtering support for
   NVIDIA implementations

 - Add support for the PMUs on the NoC S3 interconnect

 - Add additional compatible strings for new Cortex and C1 CPUs

 - Add support for data source filtering to the SPE driver

 - Add support for i.MX8QM and "DB" PMU in the imx PMU driver

Memory managemennt:

 - Avoid broadcast TLBI if page reused in write fault

 - Elide TLB invalidation if the old PTE was not valid

 - Drop redundant cpu_set_*_tcr_t0sz() macros

 - Propagate pgtable_alloc() errors outside of __create_pgd_mapping()

 - Propagate return value from __change_memory_common()

ACPI and EFI:

 - Call EFI runtime services without disabling preemption

 - Remove unused ACPI function

Miscellaneous:

 - ptrace support to disable streaming on SME-only systems

 - Improve sysreg generation to include a 'Prefix' descriptor

 - Replace __ASSEMBLY__ with __ASSEMBLER__

 - Align register dumps in the kselftest zt-test

 - Remove some no longer used macros/functions

 - Various spelling corrections

----------------------------------------------------------------
Anshuman Khandual (3):
      arm64/mm: Drop cpu_set_[default|idmap]_tcr_t0sz()
      arm64/mm: Ensure PGD_SIZE is aligned to 64 bytes when PA_BITS = 52
      arm64/sysreg: Replace TCR_EL1 field macros

Ard Biesheuvel (7):
      efi: Add missing static initializer for efi_mm::cpus_allowed_lock
      efi/runtime-wrappers: Keep track of the efi_runtime_lock owner
      arm64/fpsimd: Don't warn when EFI execution context is preemptible
      arm64/fpsimd: Permit kernel mode NEON with IRQs off
      arm64/efi: Drop efi_rt_lock spinlock from EFI arch wrapper
      arm64/efi: Move uaccess en/disable out of efi_set_pgd()
      arm64/efi: Call EFI runtime services without disabling preemption

Ben Horgan (8):
      ACPI / PPTT: Add acpi_pptt_cache_v1_full to use pptt cache as one structure
      platform: Define platform_device_put cleanup handler
      ACPI: Define acpi_put_table cleanup handler and acpi_get_table_pointer() helper
      arm_mpam: Consider overflow in bandwidth counter state
      MAINTAINERS: new entry for MPAM Driver
      KVM: arm64: selftests: Remove ARM64_FEATURE_FIELD_BITS and its last user
      KVM: arm64: selftests: Consider all 7 possible levels of cache
      arm64/sysreg: Remove unused define ARM64_FEATURE_FIELD_BITS

Besar Wicaksono (4):
      perf/arm_cspmu: Add callback to reset filter config
      perf/arm_cspmu: Add pmpidr support
      perf/arm_cspmu: nvidia: Add revision id matching
      perf/arm_cspmu: nvidia: Add pmevfiltr2 support

Bo Liu (1):
      arm64: Fix double word in comments

Cai Xinchen (1):
      arm64: remove duplicate ARCH_HAS_MEM_ENCRYPT

Catalin Marinas (3):
      Merge branches 'for-next/misc', 'for-next/kselftest', 'for-next/efi-preempt', 'for-next/assembler-macro', 'for-next/typos', 'for-next/sme-ptrace-disable', 'for-next/local-tlbi-page-reused', 'for-next/mpam', 'for-next/acpi' and 'for-next/documentation', remote-tracking branch 'arm64/for-next/perf' into for-next/core
      Merge branch 'for-next/sysreg' into for-next/core
      Merge branch 'for-next/set_memory' into for-next/core

Chaitanya S Prakash (1):
      arm64/mm: Allow __create_pgd_mapping() to propagate pgtable_alloc() errors

Dawei Li (1):
      arm64: Remove assertion on CONFIG_VMAP_STACK

Dev Jain (3):
      arm64/mm: Elide TLB flush in certain pte protection transitions
      arm64/pageattr: Propagate return value from __change_memory_common
      arm64/mm: Document why linear map split failure upon vm_reset_perms is not problematic

Frank Li (3):
      dt-bindings: perf: fsl-imx-ddr: Add compatible string for i.MX8QM, i.MX8QXP and i.MX8DXL
      perf/imx_ddr: Move ida_alloc() from ddr_perf_init() to ddr_perf_probe()
      perf/imx_ddr: Get and enable optional clks

Huang Ying (2):
      mm: add spurious fault fixing support for huge pmd
      arm64, tlbflush: don't TLBI broadcast if page reused in write fault

James Clark (2):
      perf: Add perf_event_attr::config4
      perf: arm_spe: Add support for filtering on data source

James Morse (27):
      ACPI / PPTT: Add a helper to fill a cpumask from a processor container
      ACPI / PPTT: Stop acpi_count_levels() expecting callers to clear levels
      ACPI / PPTT: Find cache level by cache-id
      ACPI / PPTT: Add a helper to fill a cpumask from a cache_id
      arm64: kconfig: Add Kconfig entry for MPAM
      ACPI / MPAM: Parse the MPAM table
      arm_mpam: Add probe/remove for mpam msc driver and kbuild boiler plate
      arm_mpam: Add the class and component structures for firmware described ris
      arm_mpam: Add MPAM MSC register layout definitions
      arm_mpam: Add cpuhp callbacks to probe MSC hardware
      arm_mpam: Probe hardware to find the supported partid/pmg values
      arm_mpam: Add helpers for managing the locking around the mon_sel registers
      arm_mpam: Probe the hardware features resctrl supports
      arm_mpam: Merge supported features during mpam_enable() into mpam_class
      arm_mpam: Reset MSC controls from cpuhp callbacks
      arm_mpam: Add a helper to touch an MSC from any CPU
      arm_mpam: Extend reset logic to allow devices to be reset any time
      arm_mpam: Register and enable IRQs
      arm_mpam: Use a static key to indicate when mpam is enabled
      arm_mpam: Allow configuration to be applied and restored during cpu online
      arm_mpam: Probe and reset the rest of the features
      arm_mpam: Add helpers to allocate monitors
      arm_mpam: Add mpam_msmon_read() to read monitor value
      arm_mpam: Track bandwidth counter state for power management
      arm_mpam: Add helper to reset saved mbwu state
      arm_mpam: Add kunit test for bitmap reset
      arm_mpam: Add kunit tests for props_mismatch()

Joakim Zhang (1):
      perf/imx_ddr: Add support for PMU in DB (system interconnects)

Li Qiang (1):
      arm64: add unlikely hint to MTE async fault check in el0_svc_common

Linu Cherian (1):
      arm64/mm: Rename try_pgd_pgtable_alloc_init_mm

Linus Walleij (1):
      arm64: entry: Clean out some indirection

Ma Ke (1):
      perf: arm_cspmu: fix error handling in arm_cspmu_impl_unregister()

Marc Zyngier (1):
      ACPI: GTDT: Get rid of acpi_arch_timer_mem_init()

Mark Brown (3):
      arm64/sme: Support disabling streaming mode via ptrace on SME only systems
      kselftst/arm64: Test NT_ARM_SVE FPSIMD format writes on non-SVE systems
      kselftest/arm64: Cover disabling streaming mode without SVE in fp-ptrace

Mark Rutland (1):
      kselftest/arm64: Align zt-test register dumps

Omar Sandoval (1):
      arm64: remove unused ARCH_PFN_OFFSET

Osama Abdelkader (1):
      arm64: acpi: add newline to deferred APEI warning

Rob Herring (Arm) (1):
      perf: arm_pmuv3: Add new Cortex and C1 CPU PMUs

Robin Murphy (2):
      perf/arm-ni: Add NoC S3 support
      perf/arm-ni: Fix and optimise register offset calculation

Rohit Mathew (2):
      arm_mpam: Probe for long/lwd mbwu counters
      arm_mpam: Use long MBWU counters if supported

Ryo Takakura (1):
      arm64: use SOFTIRQ_ON_OWN_STACK for enabling softirq stack

Sascha Bischoff (4):
      arm64/sysreg: Fix checks for incomplete sysreg definitions
      arm64/sysreg: Support feature-specific fields with 'Prefix' descriptor
      arm64/sysreg: Move generation of RES0/RES1/UNKN to function
      arm64/sysreg: Add ICH_VMCR_EL2

Seongsu Park (1):
      arm64: atomics: lse: Remove unused parameters from ATOMIC_FETCH_OP_AND macros

Thomas Huth (2):
      arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in uapi headers
      arm64: Replace __ASSEMBLY__ with __ASSEMBLER__ in non-uapi headers

Yang Shi (2):
      arm64: mm: make linear mapping permission update more robust for patial range
      arm64: mm: use untagged address to calculate page index

Yicong Yang (2):
      perf: arm_pmuv3: Don't use PMCCNTR_EL0 on SMT cores
      arch_topology: Provide a stub topology_core_has_smt() for !CONFIG_GENERIC_ARCH_TOPOLOGY

Zenon Xiu (1):
      Documentation/arm64: Fix the typo of register names

mrigendrachaubey (1):
      arm64: Fix typos and spelling errors in comments

 Documentation/arch/arm64/booting.rst               |    8 +-
 Documentation/arch/arm64/sve.rst                   |    5 +
 .../devicetree/bindings/perf/fsl-imx-ddr.yaml      |   29 +-
 MAINTAINERS                                        |   10 +
 arch/arm64/Kconfig                                 |   26 +-
 arch/arm64/include/asm/alternative-macros.h        |    8 +-
 arch/arm64/include/asm/alternative.h               |    4 +-
 arch/arm64/include/asm/arch_gicv3.h                |    4 +-
 arch/arm64/include/asm/asm-extable.h               |    6 +-
 arch/arm64/include/asm/assembler.h                 |   12 +-
 arch/arm64/include/asm/atomic_lse.h                |   20 +-
 arch/arm64/include/asm/barrier.h                   |    4 +-
 arch/arm64/include/asm/cache.h                     |    4 +-
 arch/arm64/include/asm/cpucaps.h                   |    4 +-
 arch/arm64/include/asm/cpufeature.h                |    8 +-
 arch/arm64/include/asm/cputype.h                   |    6 +-
 arch/arm64/include/asm/current.h                   |    4 +-
 arch/arm64/include/asm/debug-monitors.h            |    4 +-
 arch/arm64/include/asm/efi.h                       |   13 +-
 arch/arm64/include/asm/el2_setup.h                 |    4 +-
 arch/arm64/include/asm/elf.h                       |    4 +-
 arch/arm64/include/asm/esr.h                       |    4 +-
 arch/arm64/include/asm/fixmap.h                    |    4 +-
 arch/arm64/include/asm/fpsimd.h                    |    2 +-
 arch/arm64/include/asm/ftrace.h                    |    6 +-
 arch/arm64/include/asm/gpr-num.h                   |    6 +-
 arch/arm64/include/asm/hwcap.h                     |    2 +-
 arch/arm64/include/asm/image.h                     |    4 +-
 arch/arm64/include/asm/insn.h                      |    4 +-
 arch/arm64/include/asm/jump_label.h                |    4 +-
 arch/arm64/include/asm/kasan.h                     |    2 +-
 arch/arm64/include/asm/kexec.h                     |    4 +-
 arch/arm64/include/asm/kgdb.h                      |    4 +-
 arch/arm64/include/asm/kvm_asm.h                   |    4 +-
 arch/arm64/include/asm/kvm_mmu.h                   |    4 +-
 arch/arm64/include/asm/kvm_mte.h                   |    4 +-
 arch/arm64/include/asm/kvm_ptrauth.h               |    6 +-
 arch/arm64/include/asm/linkage.h                   |    2 +-
 arch/arm64/include/asm/memory.h                    |    5 +-
 arch/arm64/include/asm/mmu.h                       |    4 +-
 arch/arm64/include/asm/mmu_context.h               |   20 +-
 arch/arm64/include/asm/mte-kasan.h                 |    4 +-
 arch/arm64/include/asm/mte.h                       |    4 +-
 arch/arm64/include/asm/page.h                      |    4 +-
 arch/arm64/include/asm/pgtable-hwdef.h             |  125 +-
 arch/arm64/include/asm/pgtable-prot.h              |    6 +-
 arch/arm64/include/asm/pgtable.h                   |   22 +-
 arch/arm64/include/asm/proc-fns.h                  |    4 +-
 arch/arm64/include/asm/processor.h                 |    4 +-
 arch/arm64/include/asm/ptrace.h                    |    4 +-
 arch/arm64/include/asm/rsi_smc.h                   |    4 +-
 arch/arm64/include/asm/rwonce.h                    |    4 +-
 arch/arm64/include/asm/scs.h                       |    4 +-
 arch/arm64/include/asm/sdei.h                      |    4 +-
 arch/arm64/include/asm/simd.h                      |    2 +-
 arch/arm64/include/asm/smp.h                       |    4 +-
 arch/arm64/include/asm/spectre.h                   |    4 +-
 arch/arm64/include/asm/stacktrace/frame.h          |    4 +-
 arch/arm64/include/asm/suspend.h                   |    2 +-
 arch/arm64/include/asm/sysreg.h                    |   12 +-
 arch/arm64/include/asm/system_misc.h               |    4 +-
 arch/arm64/include/asm/thread_info.h               |    2 +-
 arch/arm64/include/asm/tlbflush.h                  |   85 +-
 arch/arm64/include/asm/vdso.h                      |    4 +-
 arch/arm64/include/asm/vdso/compat_barrier.h       |    4 +-
 arch/arm64/include/asm/vdso/compat_gettimeofday.h  |    4 +-
 arch/arm64/include/asm/vdso/getrandom.h            |    4 +-
 arch/arm64/include/asm/vdso/gettimeofday.h         |    4 +-
 arch/arm64/include/asm/vdso/processor.h            |    4 +-
 arch/arm64/include/asm/vdso/vsyscall.h             |    4 +-
 arch/arm64/include/asm/virt.h                      |    4 +-
 arch/arm64/include/asm/vmap_stack.h                |    4 -
 arch/arm64/include/uapi/asm/kvm.h                  |    2 +-
 arch/arm64/include/uapi/asm/ptrace.h               |    4 +-
 arch/arm64/include/uapi/asm/sigcontext.h           |    4 +-
 arch/arm64/kernel/acpi.c                           |    4 +-
 arch/arm64/kernel/cpufeature.c                     |    6 +-
 arch/arm64/kernel/efi.c                            |   46 +-
 arch/arm64/kernel/entry-common.c                   |   28 +-
 arch/arm64/kernel/entry-ftrace.S                   |    2 +-
 arch/arm64/kernel/fpsimd.c                         |   29 +-
 arch/arm64/kernel/ftrace.c                         |    2 +-
 arch/arm64/kernel/irq.c                            |    2 +-
 arch/arm64/kernel/machine_kexec.c                  |    2 +-
 arch/arm64/kernel/pi/map_kernel.c                  |    8 +-
 arch/arm64/kernel/probes/uprobes.c                 |    2 +-
 arch/arm64/kernel/ptrace.c                         |   40 +-
 arch/arm64/kernel/sdei.c                           |    6 +-
 arch/arm64/kernel/smp.c                            |    4 +-
 arch/arm64/kernel/syscall.c                        |    2 +-
 arch/arm64/kernel/traps.c                          |    2 +-
 arch/arm64/kernel/vmcore_info.c                    |    2 +-
 arch/arm64/kvm/arch_timer.c                        |    2 +-
 arch/arm64/kvm/arm.c                               |    2 +-
 arch/arm64/kvm/hyp/nvhe/ffa.c                      |    2 +-
 arch/arm64/kvm/mmu.c                               |    2 +-
 arch/arm64/kvm/nested.c                            |    2 +-
 arch/arm64/mm/contpte.c                            |    3 +-
 arch/arm64/mm/fault.c                              |    8 +-
 arch/arm64/mm/mmu.c                                |  220 +-
 arch/arm64/mm/pageattr.c                           |   12 +-
 arch/arm64/mm/pgd.c                                |    2 +-
 arch/arm64/mm/proc.S                               |   36 +-
 arch/arm64/net/bpf_jit_comp.c                      |    2 +-
 arch/arm64/tools/gen-sysreg.awk                    |  146 +-
 arch/arm64/tools/sysreg                            |   21 +
 drivers/Kconfig                                    |    2 +
 drivers/Makefile                                   |    1 +
 drivers/acpi/arm64/Kconfig                         |    3 +
 drivers/acpi/arm64/Makefile                        |    1 +
 drivers/acpi/arm64/gtdt.c                          |   34 -
 drivers/acpi/arm64/mpam.c                          |  411 +++
 drivers/acpi/pptt.c                                |  280 +-
 drivers/acpi/tables.c                              |    2 +-
 drivers/firmware/efi/efi.c                         |    3 +
 drivers/firmware/efi/runtime-wrappers.c            |   17 +-
 drivers/perf/arm-ni.c                              |   97 +-
 drivers/perf/arm_cspmu/arm_cspmu.c                 |   52 +-
 drivers/perf/arm_cspmu/arm_cspmu.h                 |   39 +-
 drivers/perf/arm_cspmu/nvidia_cspmu.c              |  194 +-
 drivers/perf/arm_pmu.c                             |    6 +
 drivers/perf/arm_pmuv3.c                           |   24 +
 drivers/perf/arm_spe_pmu.c                         |   37 +
 drivers/perf/fsl_imx8_ddr_perf.c                   |   95 +-
 drivers/resctrl/Kconfig                            |   24 +
 drivers/resctrl/Makefile                           |    4 +
 drivers/resctrl/mpam_devices.c                     | 2723 ++++++++++++++++++++
 drivers/resctrl/mpam_internal.h                    |  658 +++++
 drivers/resctrl/test_mpam_devices.c                |  389 +++
 include/linux/acpi.h                               |   27 +-
 include/linux/arch_topology.h                      |   17 +-
 include/linux/arm_mpam.h                           |   66 +
 include/linux/efi.h                                |    2 +
 include/linux/huge_mm.h                            |    2 +-
 include/linux/perf/arm_pmu.h                       |    1 +
 include/linux/pgtable.h                            |    4 +
 include/linux/platform_device.h                    |    1 +
 include/uapi/linux/perf_event.h                    |    2 +
 mm/huge_memory.c                                   |   33 +-
 mm/internal.h                                      |    2 +-
 mm/memory.c                                        |   62 +-
 tools/arch/arm64/include/asm/cputype.h             |    4 +-
 tools/arch/arm64/include/asm/esr.h                 |    4 +-
 tools/arch/arm64/include/asm/gpr-num.h             |    6 +-
 tools/arch/arm64/include/asm/sysreg.h              |   12 +-
 tools/arch/arm64/include/uapi/asm/kvm.h            |    2 +-
 tools/testing/selftests/arm64/fp/fp-ptrace.c       |    5 +-
 tools/testing/selftests/arm64/fp/sve-ptrace.c      |   61 +
 tools/testing/selftests/arm64/fp/zt-test.S         |    2 +-
 tools/testing/selftests/kvm/arm64/set_id_regs.c    |   10 +-
 150 files changed, 5997 insertions(+), 711 deletions(-)
 create mode 100644 drivers/acpi/arm64/mpam.c
 create mode 100644 drivers/resctrl/Kconfig
 create mode 100644 drivers/resctrl/Makefile
 create mode 100644 drivers/resctrl/mpam_devices.c
 create mode 100644 drivers/resctrl/mpam_internal.h
 create mode 100644 drivers/resctrl/test_mpam_devices.c
 create mode 100644 include/linux/arm_mpam.h

------------------8<------------------------------
diff --cc arch/arm64/include/asm/el2_setup.h
index 99a7c0235e6d,cb0d72401d45..cacd20df1786
--- a/arch/arm64/include/asm/el2_setup.h
+++ b/arch/arm64/include/asm/el2_setup.h
@@@ -24,7 -24,11 +24,7 @@@
  	 * ID_AA64MMFR4_EL1.E2H0 < 0. On such CPUs HCR_EL2.E2H is RES1, but it
  	 * can reset into an UNKNOWN state and might not read as 1 until it has
  	 * been initialized explicitly.
- 	 * Initalize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
 -	 *
 -	 * Fruity CPUs seem to have HCR_EL2.E2H set to RAO/WI, but
 -	 * don't advertise it (they predate this relaxation).
 -	 *
+ 	 * Initialize HCR_EL2.E2H so that later code can rely upon HCR_EL2.E2H
  	 * indicating whether the CPU is running in E2H mode.
  	 */
  	mrs_s	x1, SYS_ID_AA64MMFR4_EL1
diff --cc arch/arm64/include/asm/scs.h
index c59f6324f2bb,d31b128f683f..0fbc2e7867d3
--- a/arch/arm64/include/asm/scs.h
+++ b/arch/arm64/include/asm/scs.h
@@@ -53,8 -53,8 +53,8 @@@ enum 
  	EDYNSCS_INVALID_CFA_OPCODE		= 4,
  };
  
 -int __pi_scs_patch(const u8 eh_frame[], int size);
 +int __pi_scs_patch(const u8 eh_frame[], int size, bool skip_dry_run);
  
- #endif /* __ASSEMBLY __ */
+ #endif /* __ASSEMBLER__ */
  
  #endif /* _ASM_SCS_H */
diff --cc arch/arm64/include/asm/spectre.h
index 900454aaa292,0527c53b0ec5..296ae3420bfd
--- a/arch/arm64/include/asm/spectre.h
+++ b/arch/arm64/include/asm/spectre.h
@@@ -117,7 -117,6 +117,7 @@@ void spectre_bhb_patch_wa3(struct alt_i
  			   __le32 *origptr, __le32 *updptr, int nr_inst);
  void spectre_bhb_patch_clearbhb(struct alt_instr *alt,
  				__le32 *origptr, __le32 *updptr, int nr_inst);
 +void spectre_print_disabled_mitigations(void);
  
- #endif	/* __ASSEMBLY__ */
+ #endif	/* __ASSEMBLER__ */
  #endif	/* __ASM_SPECTRE_H */

-- 
Catalin

