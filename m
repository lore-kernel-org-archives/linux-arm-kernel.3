Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1738F9D0D0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Apr 2026 13:48:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=w6TU4rtp5CW1EdfAgHGfRqeEU3SrkLfQhVy8sUg4kuk=; b=bAg9RUgogcBUami5rs7ZXs1Fra
	mHqqMwsXxZIyhs75tJzOIyPOTO6J3pVS+WqzLcCZGcqOF78ZWMPph1SGSVO9d1UnRmlThxDI95/xe
	MS2j1r/ZVzHNysLXHD+bM8xAaRGh0yE7d2PE15mzimtZzx6wlPQDQivl4GR/wuzzpBu8jlN/9IPSu
	Ne09jQKz5ItNeUbIOIyQxnn3zy8EFIZT2hrB+KxNOPumpXJnf7P0em6N47RpPegKblyuJqb1lYUMo
	4TXBouAWFCeRRqgv42faUGGD2yXYx80YC4xXkfrztLVZkEbY0O4nNkIuuUVRwusMw818VaYMlhzoP
	RXqLS7mw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe7V-0000000HOnq-1TXz;
	Tue, 14 Apr 2026 13:48:01 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCe7T-0000000HOnK-1tFs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Apr 2026 13:48:00 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1D0524E94;
	Tue, 14 Apr 2026 06:47:50 -0700 (PDT)
Received: from arm.com (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id ACA533F7B4;
	Tue, 14 Apr 2026 06:47:54 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1776174475; bh=1XQlTsD4jfTYLxhowZ0bb9PAuHzRWOaEI2yXbKzxcoU=;
	h=Date:From:To:Cc:Subject:From;
	b=Gwcp1suj9H2vNVvJwjI5ZyUQJRh33xWJFG3lUW9qh6+/Cj6bs5Qa89gdfrgiTyeh4
	 8AxdBYYg2V5khGHCNrDkqilH9miJQUG68QT8Dci1c7kHMIcWXB6SmGCx26nOLvdvAW
	 TGEkyH5VLszYkcGIOKYHYZOkJt2OLFZq1q5ZZRXE=
Date: Tue, 14 Apr 2026 14:47:51 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, Thomas Gleixner <tglx@linutronix.de>,
	James Morse <james.morse@arm.com>, Ben Horgan <ben.horgan@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: [GIT PULL] arm64 updates for 7.1
Message-ID: <ad5Fh5JUqptcYkrp@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260414_064759_602794_13AEEF9A 
X-CRM114-Status: GOOD (  22.43  )
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

Please pull the first round of arm64 updates for 7.1. The biggest
changes are MPAM enablement in drivers/resctrl and new PMU support under
drivers/perf. On the core side, FEAT_LSUI lets futex atomic operations
with EL0 permissions, avoiding PAN toggling. The rest is mostly TLB
invalidation refactoring, further generic entry work, sysreg updates and
a few fixes. More details in the tag.

The generic entry patches touch include/linux/*entry* and kernel/entry/*
as they are based on a tag from tip. Not sure when Thomas will send them
your way, so sending the arm64 pull request in the meantime.

There are a couple of trivial conflicts against mainline with the KVM
tree and an arm64 fix. I solved them as below:

-------------8<-----------------------------
diff --cc arch/arm64/kernel/rsi.c
index 9e846ce4ef9c,6e883bc43186..92160f2e57ff
--- a/arch/arm64/kernel/rsi.c
+++ b/arch/arm64/kernel/rsi.c
@@@ -145,9 -144,9 +145,9 @@@ void __init arm64_rsi_init(void
  		return;
  	if (!rsi_version_matches())
  		return;
- 	if (WARN_ON(rsi_get_realm_config(&config)))
+ 	if (WARN_ON(rsi_get_realm_config(lm_alias(&config))))
  		return;
 -	prot_ns_shared = BIT(config.ipa_bits - 1);
 +	prot_ns_shared = __phys_to_pte_val(BIT(config.ipa_bits - 1));
  
  	if (arm64_ioremap_prot_hook_register(realm_ioremap_hook))
  		return;
diff --cc arch/arm64/kvm/at.c
index a024d9a770dc,1adf88a57328..9f8f0ae8e86e
--- a/arch/arm64/kvm/at.c
+++ b/arch/arm64/kvm/at.c
@@@ -1753,8 -1785,10 +1783,10 @@@ int __kvm_at_swap_desc(struct kvm *kvm
  	if (!writable)
  		return -EPERM;
  
 -	ptep = (u64 __user *)hva + offset;
 +	ptep = (void __user *)hva + offset;
- 	if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
+ 	if (cpus_have_final_cap(ARM64_HAS_LSUI))
+ 		r = __lsui_swap_desc(ptep, old, new);
+ 	else if (cpus_have_final_cap(ARM64_HAS_LSE_ATOMICS))
  		r = __lse_swap_desc(ptep, old, new);
  	else
  		r = __llsc_swap_desc(ptep, old, new);
-------------8<-----------------------------

Thanks.

The following changes since commit 1f318b96cc84d7c2ab792fcc0bfd42a7ca890681:

  Linux 7.0-rc3 (2026-03-08 16:56:54 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream

for you to fetch changes up to 480a9e57cceaf42db6ff874dbfe91de201935035:

  Merge branches 'for-next/misc', 'for-next/tlbflush', 'for-next/ttbr-macros-cleanup', 'for-next/kselftest', 'for-next/feat_lsui', 'for-next/mpam', 'for-next/hotplug-batched-tlbi', 'for-next/bbml2-fixes', 'for-next/sysreg', 'for-next/generic-entry' and 'for-next/acpi', remote-tracking branches 'arm64/for-next/perf' and 'arm64/for-next/read-once' into for-next/core (2026-04-10 14:22:24 +0100)

----------------------------------------------------------------
arm64 updates for 7.1:

Core features:

 - Add support for FEAT_LSUI, allowing futex atomic operations without
   toggling Privileged Access Never (PAN)

 - Further refactor the arm64 exception handling code towards the
   generic entry infrastructure

 - Optimise __READ_ONCE() with CONFIG_LTO=y and allow alias analysis
   through it

Memory management:

 - Refactor the arm64 TLB invalidation API and implementation for better
   control over barrier placement and level-hinted invalidation

 - Enable batched TLB flushes during memory hot-unplug

 - Fix rodata=full block mapping support for realm guests (when
   BBML2_NOABORT is available)

Perf and PMU:

 - Add support for a whole bunch of system PMUs featured in NVIDIA's
   Tegra410 SoC (cspmu extensions for the fabric and PCIe, new drivers
   for CPU/C2C memory latency PMUs)

 - Clean up iomem resource handling in the Arm CMN driver

 - Fix signedness handling of AA64DFR0.{PMUVer,PerfMon}

MPAM (Memory Partitioning And Monitoring):

 - Add architecture context-switch and hiding of the feature from KVM

 - Add interface to allow MPAM to be exposed to user-space using resctrl

 - Add errata workaround for some existing platforms

 - Add documentation for using MPAM and what shape of platforms can use
   resctrl

Miscellaneous:

 - Check DAIF (and PMR, where relevant) at task-switch time

 - Skip TFSR_EL1 checks and barriers in synchronous MTE tag check mode
   (only relevant to asynchronous or asymmetric tag check modes)

 - Remove a duplicate allocation in the kexec code

 - Remove redundant save/restore of SCS SP on entry to/from EL0

 - Generate the KERNEL_HWCAP_ definitions from the arm64 hwcap
   descriptions

 - Add kselftest coverage for cmpbr_sigill()

 - Update sysreg definitions

----------------------------------------------------------------
Aneesh Kumar K.V (Arm) (1):
      arm64: rsi: use linear-map alias for realm config buffer

Anshuman Khandual (5):
      arm64/mm: Describe TTBR1_BADDR_4852_OFFSET
      arm64/mm: Directly use TTBRx_EL1_ASID_MASK
      arm64/mm: Directly use TTBRx_EL1_CnP
      arm64/mm: Enable batched TLB flush in unmap_hotplug_range()
      arm64/mm: Reject memory removal that splits a kernel leaf mapping

Ben Horgan (11):
      arm_mpam: Reset when feature configuration bit unset
      arm64/sysreg: Add MPAMSM_EL1 register
      KVM: arm64: Preserve host MPAM configuration when changing traps
      KVM: arm64: Make MPAMSM_EL1 accesses UNDEF
      arm64: mpam: Drop the CONFIG_EXPERT restriction
      arm64: mpam: Initialise and context switch the MPAMSM_EL1 register
      arm_mpam: resctrl: Hide CDP emulation behind CONFIG_EXPERT
      arm_mpam: resctrl: Add rmid index helpers
      arm_mpam: resctrl: Wait for cacheinfo to be ready
      arm_mpam: resctrl: Add monitor initialisation and domain boilerplate
      arm64: mpam: Add initial MPAM documentation

Besar Wicaksono (7):
      perf/arm_cspmu: nvidia: Rename doc to Tegra241
      perf/arm_cspmu: nvidia: Add Tegra410 UCF PMU
      perf/arm_cspmu: Add arm_cspmu_acpi_dev_get
      perf/arm_cspmu: nvidia: Add Tegra410 PCIE PMU
      perf/arm_cspmu: nvidia: Add Tegra410 PCIE-TGT PMU
      perf: add NVIDIA Tegra410 CPU Memory Latency PMU
      perf: add NVIDIA Tegra410 C2C PMU

Catalin Marinas (1):
      Merge branches 'for-next/misc', 'for-next/tlbflush', 'for-next/ttbr-macros-cleanup', 'for-next/kselftest', 'for-next/feat_lsui', 'for-next/mpam', 'for-next/hotplug-batched-tlbi', 'for-next/bbml2-fixes', 'for-next/sysreg', 'for-next/generic-entry' and 'for-next/acpi', remote-tracking branches 'arm64/for-next/perf' and 'arm64/for-next/read-once' into for-next/core

Chen Ni (1):
      perf/arm-cmn: Fix incorrect error check for devm_ioremap()

Dave Martin (2):
      arm_mpam: resctrl: Convert to/from MPAMs fixed-point formats
      arm_mpam: resctrl: Add kunit test for control format conversions

Haoyu Lu (1):
      ACPI: AGDI: fix missing newline in error message

James Clark (3):
      KVM: arm64: Read PMUVer as unsigned
      arm64: cpufeature: Make PMUVer and PerfMon unsigned
      arm64: cpufeature: Use pmuv3_implemented() function

James Morse (22):
      arm64: mpam: Context switch the MPAM registers
      arm64: mpam: Re-initialise MPAM regs when CPU comes online
      arm64: mpam: Advertise the CPUs MPAM limits to the driver
      arm64: mpam: Add cpu_pm notifier to restore MPAM sysregs
      arm64: mpam: Add helpers to change a task or cpu's MPAM PARTID/PMG values
      KVM: arm64: Force guest EL1 to use user-space's partid configuration
      arm_mpam: resctrl: Add boilerplate cpuhp and domain allocation
      arm_mpam: resctrl: Pick the caches we will use as resctrl resources
      arm_mpam: resctrl: Implement resctrl_arch_reset_all_ctrls()
      arm_mpam: resctrl: Add resctrl_arch_get_config()
      arm_mpam: resctrl: Implement helpers to update configuration
      arm_mpam: resctrl: Add plumbing against arm64 task and cpu hooks
      arm_mpam: resctrl: Add CDP emulation
      arm_mpam: resctrl: Add support for 'MB' resource
      arm_mpam: resctrl: Add support for csu counters
      arm_mpam: resctrl: Allow resctrl to allocate monitors
      arm_mpam: resctrl: Add resctrl_arch_rmid_read()
      arm_mpam: resctrl: Update the rmid reallocation limit
      arm_mpam: resctrl: Add empty definitions for assorted resctrl functions
      arm64: mpam: Select ARCH_HAS_CPU_RESCTRL
      arm_mpam: resctrl: Call resctrl_init() on platforms that can support resctrl
      arm_mpam: Quirk CMN-650's CSU NRDY behaviour

Jisheng Zhang (1):
      arm64: remove ARCH_INLINE_*

Kevin Brodsky (1):
      arm64: mm: Use generic enum pgtable_level

Marco Elver (2):
      arm64: Optimize __READ_ONCE() with CONFIG_LTO=y
      arm64, compiler-context-analysis: Permit alias analysis through __READ_ONCE() with CONFIG_LTO=y

Mark Brown (7):
      arm64/sysreg: Update SMIDR_EL1 to DDI0601 2025-06
      arm64/hwcap: Generate the KERNEL_HWCAP_ definitions for the hwcaps
      arm64/sysreg: Update ID_AA64ISAR0_EL1 description to DDI0601 2025-12
      arm64/sysreg: Update ID_AA64ISAR2_EL1 description to DDI0601 2025-12
      arm64/sysreg: Update ID_AA64FPFR0_EL1 description to DDI0601 2025-12
      arm64/sysreg: Update ID_AA64ZFR0_EL1 description to DDI0601 2025-12
      arm64/sysreg: Update ID_AA64SMFR0_EL1 description to DDI0601 2025-12

Mark Rutland (10):
      entry: Fix stale comment for irqentry_enter()
      entry: Remove local_irq_{enable,disable}_exit_to_user()
      entry: Move irqentry_enter() prototype later
      entry: Split kernel mode logic from irqentry_{enter,exit}()
      entry: Split preemption from irqentry_exit_to_kernel_mode()
      arm64: entry: Don't preempt with SError or Debug masked
      arm64: entry: Consistently prefix arm64-specific wrappers
      arm64: entry: Use irqentry_{enter_from,exit_to}_kernel_mode()
      arm64: entry: Use split preemption logic
      arm64: Check DAIF (and PMR) at task-switch time

Michael Ugrin (1):
      arm64: Kconfig: fix duplicate word in CMDLINE help text

Muhammad Usama Anjum (1):
      arm64: mte: Skip TFSR_EL1 checks and barriers in synchronous tag check mode

Nathan Chancellor (1):
      perf/arm-cmn: Fix resource_size_t printk specifier in arm_cmn_init_dtc()

Robin Murphy (1):
      perf/arm-cmn: Stop claiming entire iomem region

Ryan Roberts (13):
      arm64: mm: Re-implement the __tlbi_level macro as a C function
      arm64: mm: Introduce a C wrapper for by-range TLB invalidation
      arm64: mm: Implicitly invalidate user ASID based on TLBI operation
      arm64: mm: Re-implement the __flush_tlb_range_op macro in C
      arm64: mm: Refactor flush_tlb_page() to use __tlbi_level_asid()
      arm64: mm: Refactor __flush_tlb_range() to take flags
      arm64: mm: More flags for __flush_tlb_range()
      arm64: mm: Wrap flush_tlb_page() around __do_flush_tlb_range()
      arm64: mm: Provide level hint for flush_tlb_page()
      arm64: mm: __ptep_set_access_flags must hint correct TTL
      arm64: mm: Fix rodata=full block mapping support for realm guests
      arm64: mm: Handle invalid large leaf mappings correctly
      arm64: mm: Remove pmd_sect() and pud_sect()

Shanker Donthineni (4):
      arm_mpam: Add quirk framework
      arm_mpam: Add workaround for T241-MPAM-1
      arm_mpam: Add workaround for T241-MPAM-4
      arm_mpam: Add workaround for T241-MPAM-6

Wang Wensheng (1):
      arm64: kexec: Remove duplicate allocation for trans_pgd

Will Deacon (5):
      arm64: scs: Remove redundant save/restore of SCS SP on entry to/from EL0
      arm64: mm: Push __TLBI_VADDR() into __tlbi_level()
      arm64: mm: Inline __TLBI_VADDR_RANGE() into __tlbi_range()
      arm64: mm: Simplify __TLBI_RANGE_NUM() macro
      arm64: mm: Simplify __flush_tlb_range_limit_excess()

Yeoreum Yun (8):
      arm64: cpufeature: Add FEAT_LSUI
      KVM: arm64: Expose FEAT_LSUI to guests
      KVM: arm64: kselftest: set_id_regs: Add test for FEAT_LSUI
      arm64: futex: Refactor futex atomic operation
      arm64: futex: Support futex with FEAT_LSUI
      KVM: arm64: Use CAST instruction for swapping guest descriptor
      arm64: Kconfig: Add support for LSUI
      arm64: armv8_deprecated: Disable swp emulation when FEAT_LSUI present

Yifan Wu (1):
      selftests/arm64: Implement cmpbr_sigill() to hwcap test

Zeng Heng (1):
      arm_mpam: Ensure in_reset_state is false after applying configuration

 Documentation/admin-guide/perf/index.rst           |    3 +-
 .../{nvidia-pmu.rst => nvidia-tegra241-pmu.rst}    |    8 +-
 .../admin-guide/perf/nvidia-tegra410-pmu.rst       |  522 ++++++
 Documentation/arch/arm64/index.rst                 |    1 +
 Documentation/arch/arm64/mpam.rst                  |   72 +
 Documentation/arch/arm64/silicon-errata.rst        |    9 +
 arch/arm/include/asm/arm_pmuv3.h                   |    7 +
 arch/arm64/Kconfig                                 |   54 +-
 arch/arm64/include/asm/asm-uaccess.h               |    2 +-
 arch/arm64/include/asm/cpucaps.h                   |    2 +
 arch/arm64/include/asm/el2_setup.h                 |    3 +-
 arch/arm64/include/asm/futex.h                     |  311 +++-
 arch/arm64/include/asm/hugetlb.h                   |   12 +-
 arch/arm64/include/asm/hwcap.h                     |  120 +-
 arch/arm64/include/asm/lsui.h                      |   27 +
 arch/arm64/include/asm/mmu.h                       |   10 +-
 arch/arm64/include/asm/mmu_context.h               |    3 +-
 arch/arm64/include/asm/mpam.h                      |   96 ++
 arch/arm64/include/asm/mte.h                       |    6 +
 arch/arm64/include/asm/pgtable-hwdef.h             |    9 +-
 arch/arm64/include/asm/pgtable-prot.h              |    2 +
 arch/arm64/include/asm/pgtable.h                   |   60 +-
 arch/arm64/include/asm/resctrl.h                   |    2 +
 arch/arm64/include/asm/rwonce.h                    |   24 +-
 arch/arm64/include/asm/scs.h                       |    8 +
 arch/arm64/include/asm/thread_info.h               |    3 +
 arch/arm64/include/asm/tlb.h                       |    6 +-
 arch/arm64/include/asm/tlbflush.h                  |  471 +++---
 arch/arm64/include/asm/uaccess.h                   |    6 +-
 arch/arm64/kernel/Makefile                         |    1 +
 arch/arm64/kernel/armv8_deprecated.c               |   14 +
 arch/arm64/kernel/cpufeature.c                     |   47 +-
 arch/arm64/kernel/entry-common.c                   |   52 +-
 arch/arm64/kernel/entry.S                          |    6 +-
 arch/arm64/kernel/machine_kexec.c                  |    3 -
 arch/arm64/kernel/mpam.c                           |   62 +
 arch/arm64/kernel/mte.c                            |   10 +-
 arch/arm64/kernel/process.c                        |   32 +
 arch/arm64/kernel/rsi.c                            |    2 +-
 arch/arm64/kernel/sys_compat.c                     |    2 +-
 arch/arm64/kvm/at.c                                |   34 +-
 arch/arm64/kvm/debug.c                             |    5 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |   12 +-
 arch/arm64/kvm/hyp/nvhe/hyp-init.S                 |    4 +-
 arch/arm64/kvm/hyp/nvhe/mm.c                       |    2 +-
 arch/arm64/kvm/hyp/nvhe/tlb.c                      |    2 -
 arch/arm64/kvm/hyp/pgtable.c                       |    4 +-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c                 |   16 +
 arch/arm64/kvm/hyp/vhe/tlb.c                       |    2 -
 arch/arm64/kvm/sys_regs.c                          |    5 +-
 arch/arm64/mm/context.c                            |    8 +-
 arch/arm64/mm/contpte.c                            |   12 +-
 arch/arm64/mm/fault.c                              |   30 +-
 arch/arm64/mm/hugetlbpage.c                        |   10 +-
 arch/arm64/mm/init.c                               |    9 +-
 arch/arm64/mm/mmu.c                                |  286 +++-
 arch/arm64/mm/pageattr.c                           |   50 +-
 arch/arm64/mm/trans_pgd.c                          |   42 +-
 arch/arm64/tools/Makefile                          |    8 +-
 arch/arm64/tools/cpucaps                           |    1 +
 arch/arm64/tools/gen-kernel-hwcaps.sh              |   23 +
 arch/arm64/tools/sysreg                            |   36 +-
 drivers/acpi/arm64/agdi.c                          |    2 +-
 drivers/perf/Kconfig                               |   14 +
 drivers/perf/Makefile                              |    2 +
 drivers/perf/arm-cmn.c                             |   70 +-
 drivers/perf/arm_cspmu/arm_cspmu.c                 |   19 +-
 drivers/perf/arm_cspmu/arm_cspmu.h                 |   17 +-
 drivers/perf/arm_cspmu/nvidia_cspmu.c              |  618 ++++++-
 drivers/perf/nvidia_t410_c2c_pmu.c                 | 1051 ++++++++++++
 drivers/perf/nvidia_t410_cmem_latency_pmu.c        |  736 +++++++++
 drivers/resctrl/Kconfig                            |    9 +-
 drivers/resctrl/Makefile                           |    1 +
 drivers/resctrl/mpam_devices.c                     |  305 +++-
 drivers/resctrl/mpam_internal.h                    |  108 +-
 drivers/resctrl/mpam_resctrl.c                     | 1704 ++++++++++++++++++++
 drivers/resctrl/test_mpam_resctrl.c                |  315 ++++
 include/linux/arm_mpam.h                           |   32 +
 include/linux/entry-common.h                       |    2 +-
 include/linux/irq-entry-common.h                   |  256 ++-
 kernel/entry/common.c                              |  107 +-
 tools/testing/selftests/arm64/abi/hwcap.c          |    3 +-
 tools/testing/selftests/kvm/arm64/set_id_regs.c    |    1 +
 83 files changed, 7117 insertions(+), 946 deletions(-)
 rename Documentation/admin-guide/perf/{nvidia-pmu.rst => nvidia-tegra241-pmu.rst} (98%)
 create mode 100644 Documentation/admin-guide/perf/nvidia-tegra410-pmu.rst
 create mode 100644 Documentation/arch/arm64/mpam.rst
 create mode 100644 arch/arm64/include/asm/lsui.h
 create mode 100644 arch/arm64/include/asm/mpam.h
 create mode 100644 arch/arm64/include/asm/resctrl.h
 create mode 100644 arch/arm64/kernel/mpam.c
 create mode 100644 arch/arm64/tools/gen-kernel-hwcaps.sh
 create mode 100644 drivers/perf/nvidia_t410_c2c_pmu.c
 create mode 100644 drivers/perf/nvidia_t410_cmem_latency_pmu.c
 create mode 100644 drivers/resctrl/mpam_resctrl.c
 create mode 100644 drivers/resctrl/test_mpam_resctrl.c

-- 
Catalin

