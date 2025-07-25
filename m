Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B84EC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Jul 2025 14:45:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BsUAVxHnGkag5oTJIYVyfiJRrTt8YKY7fgkxVnrdXUM=; b=waczTjt9/fAr1dLgcBhvP4J9TR
	9JKKNDgSUwIRiONAidhoHA6GMhPgqWljJ2f5L7ZRSiuJ1M6lubAc1LYklhVsQHdmi6h6pCj52u2Bi
	QKYjOTAbjCjXh/eQmOUp/RVp1IO+Sehp5FZcsUdGM7gdAyYGp+v0hnYw4APN1RvqcLgGee6gp0dsB
	yBmNTI3X4bK9FnhYegHL+XVS7DmRqVLEF5LzGs4WMIolNgBPfkfOoQJr2X48+Sga95HNRUn7YGXa5
	aW91rixbeZGuafhcBli+kVR4DhRiCeHtgNguBN+4IPLIU10Zcv9JXdCw6h55M9ehk45DJRPaJB5Hq
	+Sl7xrjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJfL-0000000A2Br-2kV7;
	Fri, 25 Jul 2025 14:44:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ufJcs-0000000A20Z-2uhL
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Jul 2025 14:42:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id AAE68601EC;
	Fri, 25 Jul 2025 14:42:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 661ABC4CEE7;
	Fri, 25 Jul 2025 14:42:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753454541;
	bh=8iRdMW1aE2BbhTjoWRlltAZU6iEl44melmXgxsXXddI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DhhcIARWBhiLWtmXe3rcXknKWufSzD1f15T+B36AEnDjAtOv2j0ZOXPg/wIYU06zQ
	 ZsebC0EXfLMN5wys9bOmzpYv5zkrYql56Is6uBiH5WrZASeLvEV8KgGJruIiGvB0mU
	 6zM4/UB106SYXv3vmfFE67kg0xeBjUeaLFtroaEDFMzMUNA6+CjbUOveInAOlWVwSE
	 NiMJcsXCQPLigkJQBE8P/lfNyYhJpSRZ94RkgVtjgmqEgOVbz0Qe9WHqb89F6wkKr6
	 L/5ShPPLnboGKYs8WfMZSjvyPmbkzAJwq/GTUNqMBnn614WNOCCmuHbMEWNkmsXi9M
	 kaHS6h6gQub/w==
Date: Fri, 25 Jul 2025 15:42:17 +0100
From: Catalin Marinas <cmarinas@kernel.org>
To: Linus Torvalds <torvalds@linux-foundation.org>
Cc: Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [GIT PULL] arm64 updates for 6.17
Message-ID: <aIOXyQG1OA8pv49m@arm.com>
References: <20250725143925.1674618-1-catalin.marinas@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250725143925.1674618-1-catalin.marinas@arm.com>
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

On Fri, Jul 25, 2025 at 03:39:25PM +0100, Catalin Marinas wrote:
> Please pull the arm64 updates below. A quick summary - perf support for
> Branch Record Buffer Extensions (BRBE), typical PMU hardware updates,
> small additions to MTE for store-only tag checking and exposing
> non-address bits to signal handlers, HAVE_LIVEPATCH enabled on arm64,
> VMAP_STACK forced on. There is also a TLBI optimisation on hardware that
> does not require break-before-make when changing the user PTEs between
> contiguous and non-contiguous. These patches touch the iommu/SMMU code.
> More details in the tag.

I forgot to send the original with my kernel.org address, in case it
ends up in your spam folder. So, here it is.

> Thanks.
> 
> The following changes since commit ef8923e6c051a98164c2889db943df9695a39888:
> 
>   arm64: efi: Fix KASAN false positive for EFI runtime stack (2025-07-04 14:47:06 +0100)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux tags/arm64-upstream
> 
> for you to fetch changes up to 5b1ae9de71335865d06ff0e60eadcf368a735edf:
> 
>   Merge branch 'for-next/feat_mte_store_only' into for-next/core (2025-07-24 16:03:34 +0100)
> 
> ----------------------------------------------------------------
> arm64 updates for 6.17:
> 
> Perf and PMU updates:
> 
>  - Add support for new (v3) Hisilicon SLLC and DDRC PMUs
> 
>  - Add support for Arm-NI PMU integrations that share interrupts between
>    clock domains within a given instance
> 
>  - Allow SPE to be configured with a lower sample period than the
>    minimum recommendation advertised by PMSIDR_EL1.Interval
> 
>  - Add suppport for Arm's "Branch Record Buffer Extension" (BRBE)
> 
>  - Adjust the perf watchdog period according to cpu frequency changes
> 
>  - Minor driver fixes and cleanups
> 
> Hardware features:
> 
>  - Support for MTE store-only checking (FEAT_MTE_STORE_ONLY)
> 
>  - Support for reporting the non-address bits during a synchronous MTE
>    tag check fault (FEAT_MTE_TAGGED_FAR)
> 
>  - Optimise the TLBI when folding/unfolding contiguous PTEs on hardware
>    with FEAT_BBM (break-before-make) level 2 and no TLB conflict aborts
> 
> Software features:
> 
>  - Enable HAVE_LIVEPATCH after implementing arch_stack_walk_reliable()
>    and using the text-poke API for late module relocations
> 
>  - Force VMAP_STACK always on and change arm64_efi_rt_init() to use
>    arch_alloc_vmap_stack() in order to avoid KASAN false positives
> 
> ACPI:
> 
>  - Improve SPCR handling and messaging on systems lacking an SPCR table
> 
> Debug:
> 
>  - Simplify the debug exception entry path
> 
>  - Drop redundant DBG_MDSCR_* macros
> 
> Kselftests:
> 
>  - Cleanups and improvements for SME, SVE and FPSIMD tests
> 
> Miscellaneous:
> 
>  - Optimise loop to reduce redundant operations in contpte_ptep_get()
> 
>  - Remove ISB when resetting POR_EL0 during signal handling
> 
>  - Mark the kernel as tainted on SEA and SError panic
> 
>  - Remove redundant gcs_free() call
> 
> ----------------------------------------------------------------
> Ada Couprie Diaz (13):
>       arm64: debug: clean up single_step_handler logic
>       arm64: refactor aarch32_break_handler()
>       arm64: debug: call software breakpoint handlers statically
>       arm64: debug: call step handlers statically
>       arm64: debug: remove break/step handler registration infrastructure
>       arm64: entry: Add entry and exit functions for debug exceptions
>       arm64: debug: split hardware breakpoint exception entry
>       arm64: debug: refactor reinstall_suspended_bps()
>       arm64: debug: split single stepping exception entry
>       arm64: debug: split hardware watchpoint exception entry
>       arm64: debug: split brk64 exception entry
>       arm64: debug: split bkpt32 exception entry
>       arm64: debug: remove debug exception registration infrastructure
> 
> Alok Tiwari (3):
>       perf/cxlpmu: Fix devm_kcalloc() argument order in cxl_pmu_probe()
>       perf/cxlpmu: Remove unintended newline from IRQ name format string
>       perf/cxlpmu: Fix typos in cxl_pmu.c comments and documentation
> 
> Anshuman Khandual (6):
>       arm64/debug: Drop redundant DBG_MDSCR_* macros
>       KVM: selftests: Change MDSCR_EL1 register holding variables as uint64_t
>       arm64/sysreg: Add BRBE registers and fields
>       arm64: Handle BRBE booting requirements
>       KVM: arm64: nvhe: Disable branch generation in nVHE guests
>       arm64/mm: Drop redundant addr increment in set_huge_pte_at()
> 
> Breno Leitao (9):
>       arm64: Mandate VMAP_STACK
>       arm64: efi: Remove CONFIG_VMAP_STACK check
>       arm64: Remove CONFIG_VMAP_STACK conditionals from THREAD_SHIFT and THREAD_ALIGN
>       arm64: remove CONFIG_VMAP_STACK conditionals from irq stack setup
>       arm64: remove CONFIG_VMAP_STACK conditionals from traps overflow stack
>       arm64: remove CONFIG_VMAP_STACK checks from stacktrace overflow logic
>       arm64: remove CONFIG_VMAP_STACK checks from SDEI stack handling
>       arm64: remove CONFIG_VMAP_STACK checks from entry code
>       arm64: Mark kernel as tainted on SAE and SError panic
> 
> Catalin Marinas (4):
>       arm64: cpufeature: Introduce MATCH_ALL_EARLY_CPUS capability type
>       arm64: Kconfig: Keep selects somewhat alphabetically ordered
>       Merge branches 'for-next/livepatch', 'for-next/user-contig-bbml2', 'for-next/misc', 'for-next/acpi', 'for-next/debug-entry', 'for-next/feat_mte_tagged_far', 'for-next/kselftest', 'for-next/mdscr-cleanup' and 'for-next/vmap-stack', remote-tracking branch 'arm64/for-next/perf' into for-next/core
>       Merge branch 'for-next/feat_mte_store_only' into for-next/core
> 
> Colin Ian King (1):
>       perf: imx9_perf: make the read-only array mask static const
> 
> Dylan Hatch (1):
>       arm64/module: Use text-poke API for late relocations.
> 
> Jeremy Linton (1):
>       arm64/gcs: task_gcs_el0_enable() should use passed task
> 
> Junhao He (5):
>       drivers/perf: hisi: Simplify the probe process for each DDRC version
>       drivers/perf: hisi: Add support for HiSilicon DDRC v3 PMU driver
>       drivers/perf: hisi: Use ACPI driver_data to retrieve SLLC PMU information
>       drivers/perf: hisi: Add support for HiSilicon SLLC v3 PMU driver
>       drivers/perf: hisi: Relax the event number check of v2 PMUs
> 
> Kevin Brodsky (1):
>       arm64: signal: Remove ISB when resetting POR_EL0
> 
> Leo Yan (1):
>       perf: arm_spe: Relax period restriction
> 
> Li Chen (2):
>       ACPI: Return -ENODEV from acpi_parse_spcr() when SPCR support is disabled
>       ACPI: Suppress misleading SPCR console message when SPCR table is absent
> 
> Mark Brown (11):
>       kselftest/arm64: Convert tpidr2 test to use kselftest.h
>       kselftest/arm64: Fix check for setting new VLs in sve-ptrace
>       kselftest/arm64: Fix test for streaming FPSIMD write in sve-ptrace
>       kselftest/arm64: Specify SVE data when testing VL set in sve-ptrace
>       arm64/gcs: Don't call gcs_free() when releasing task_struct
>       kselftest/arm4: Provide local defines for AT_HWCAP3
>       kselftest/arm64: Allow sve-ptrace to run on SME only systems
>       kselftest/arm64: Test FPSIMD format data writes via NT_ARM_SVE in fp-ptrace
>       kselftest/arm64: Test SME on SME only systems in fp-ptrace
>       kselftest/arm64: Fix SVE write data generation for SME only systems
>       kselftest/arm64: Handle attempts to disable SM on SME only systems
> 
> Mark Rutland (1):
>       arm64: stacktrace: Check kretprobe_find_ret_addr() return value
> 
> Masahiro Yamada (2):
>       arm64: pi: use 'targets' instead of extra-y in Makefile
>       arm64: fix unnecessary rebuilding when CONFIG_DEBUG_EFI=y
> 
> Mikołaj Lenczewski (3):
>       arm64: Add BBM Level 2 cpu feature
>       iommu/arm: Add BBM Level 2 smmu feature
>       arm64/mm: Elide tlbi in contpte_convert() under BBML2
> 
> Rob Herring (Arm) (1):
>       perf: arm_pmuv3: Add support for the Branch Record Buffer Extension (BRBE)
> 
> Robin Murphy (4):
>       perf/arm-ni: Set initial IRQ affinity
>       perf/arm-cmn: Reduce stack usage during discovery
>       perf/arm: Add missing .suppress_bind_attrs
>       perf/arm-ni: Consolidate CPU affinity handling
> 
> Shouping Wang (1):
>       perf/arm-ni: Support sharing IRQs within an NI instance
> 
> Song Liu (2):
>       arm64: stacktrace: Implement arch_stack_walk_reliable()
>       arm64: Implement HAVE_LIVEPATCH
> 
> Xavier Xia (1):
>       arm64/mm: Optimize loop to reduce redundant operations of contpte_ptep_get
> 
> Yeoreum Yun (18):
>       arm64/cpufeature: Add FEAT_MTE_TAGGED_FAR feature
>       arm64: Report address tag when FEAT_MTE_TAGGED_FAR is supported
>       KVM: arm64: Expose FEAT_MTE_TAGGED_FAR feature to guest
>       kselftest/arm64: Add MTE_FAR hwcap test
>       kselftest/arm64/mte: Register mte signal handler with SA_EXPOSE_TAGBITS
>       kselftest/arm64/mte: Check MTE_FAR feature is supported
>       kselftest/arm64/mte: Add address tag related macro and function
>       kselftest/arm64/mte: Add verification for address tag in signal handler
>       kselftest/arm64/mte: Refactor check_mmap_option test
>       kselftest/arm64/mte: Add mtefar tests on check_mmap_options
>       arm64/cpufeature: Add MTE_STORE_ONLY feature
>       prctl: Introduce PR_MTE_STORE_ONLY
>       arm64/kernel: Support store-only mte tag check
>       arm64/hwcaps: Add MTE_STORE_ONLY hwcaps
>       KVM: arm64: Expose MTE_STORE_ONLY feature to guest
>       kselftest/arm64/abi: Add MTE_STORE_ONLY feature hwcap test
>       kselftest/arm64/mte: Preparation for mte store only test
>       kselftest/arm64/mte: Add MTE_STORE_ONLY testcases
> 
> Yicong Yang (3):
>       watchdog/perf: Provide function for adjusting the event period
>       arm64/watchdog_hld: Add a cpufreq notifier for update watchdog thresh
>       drivers/perf: hisi: Support PMUs with no interrupt
> 
> Zhiyuan Dai (1):
>       perf/arm-cmn: Broaden module description for wider interconnect support
> 
>  Documentation/arch/arm64/booting.rst               |  21 +
>  Documentation/arch/arm64/elf_hwcaps.rst            |   6 +
>  Documentation/arch/arm64/tagged-pointers.rst       |  11 +-
>  arch/arm64/Kconfig                                 |   4 +
>  arch/arm64/include/asm/assembler.h                 |   4 +-
>  arch/arm64/include/asm/cpufeature.h                |  28 +
>  arch/arm64/include/asm/debug-monitors.h            |  40 +-
>  arch/arm64/include/asm/el2_setup.h                 |  71 +-
>  arch/arm64/include/asm/exception.h                 |  14 +-
>  arch/arm64/include/asm/gcs.h                       |   2 +-
>  arch/arm64/include/asm/hwcap.h                     |   2 +
>  arch/arm64/include/asm/kgdb.h                      |  12 +
>  arch/arm64/include/asm/kprobes.h                   |   8 +
>  arch/arm64/include/asm/kvm_host.h                  |   2 +
>  arch/arm64/include/asm/memory.h                    |   6 +-
>  arch/arm64/include/asm/processor.h                 |   2 +
>  arch/arm64/include/asm/stacktrace.h                |   6 +-
>  arch/arm64/include/asm/sysreg.h                    |  16 +-
>  arch/arm64/include/asm/system_misc.h               |   4 -
>  arch/arm64/include/asm/thread_info.h               |   5 +-
>  arch/arm64/include/asm/traps.h                     |   6 +
>  arch/arm64/include/asm/uprobes.h                   |  11 +
>  arch/arm64/include/uapi/asm/hwcap.h                |   2 +
>  arch/arm64/kernel/Makefile                         |   2 +-
>  arch/arm64/kernel/acpi.c                           |  10 +-
>  arch/arm64/kernel/cpufeature.c                     | 116 ++-
>  arch/arm64/kernel/cpuinfo.c                        |   2 +
>  arch/arm64/kernel/debug-monitors.c                 | 277 +++----
>  arch/arm64/kernel/efi.c                            |   5 -
>  arch/arm64/kernel/entry-common.c                   | 156 +++-
>  arch/arm64/kernel/entry.S                          |   6 -
>  arch/arm64/kernel/hw_breakpoint.c                  |  60 +-
>  arch/arm64/kernel/irq.c                            |  13 -
>  arch/arm64/kernel/kgdb.c                           |  39 +-
>  arch/arm64/kernel/module.c                         | 101 ++-
>  arch/arm64/kernel/mte.c                            |  11 +-
>  arch/arm64/kernel/pi/Makefile                      |   2 +-
>  arch/arm64/kernel/probes/kprobes.c                 |  31 +-
>  arch/arm64/kernel/probes/kprobes_trampoline.S      |   2 +-
>  arch/arm64/kernel/probes/uprobes.c                 |  24 +-
>  arch/arm64/kernel/process.c                        |  13 +-
>  arch/arm64/kernel/sdei.c                           |   8 +-
>  arch/arm64/kernel/signal.c                         |   7 +-
>  arch/arm64/kernel/stacktrace.c                     |  59 +-
>  arch/arm64/kernel/traps.c                          |  84 +-
>  arch/arm64/kernel/watchdog_hld.c                   |  58 ++
>  arch/arm64/kvm/debug.c                             |   4 +
>  arch/arm64/kvm/hyp/nvhe/debug-sr.c                 |  32 +
>  arch/arm64/kvm/hyp/nvhe/switch.c                   |   2 +-
>  arch/arm64/kvm/sys_regs.c                          |  11 +-
>  arch/arm64/mm/contpte.c                            | 211 ++++-
>  arch/arm64/mm/fault.c                              |  83 +-
>  arch/arm64/mm/gcs.c                                |   6 -
>  arch/arm64/mm/hugetlbpage.c                        |   2 +-
>  arch/arm64/mm/proc.S                               |   2 +-
>  arch/arm64/tools/cpucaps                           |   3 +
>  arch/arm64/tools/sysreg                            | 132 +++
>  drivers/firmware/efi/libstub/Makefile.zboot        |   2 +-
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c    |   3 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c        |   3 +
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h        |   2 +
>  drivers/perf/Kconfig                               |  11 +
>  drivers/perf/Makefile                              |   1 +
>  drivers/perf/arm-cmn.c                             |  20 +-
>  drivers/perf/arm-ni.c                              | 153 ++--
>  drivers/perf/arm_brbe.c                            | 805 +++++++++++++++++++
>  drivers/perf/arm_brbe.h                            |  47 ++
>  drivers/perf/arm_pmu.c                             |  16 +-
>  drivers/perf/arm_pmuv3.c                           | 107 ++-
>  drivers/perf/arm_spe_pmu.c                         |  18 +-
>  drivers/perf/cxl_pmu.c                             |  12 +-
>  drivers/perf/fsl_imx9_ddr_perf.c                   |   8 +-
>  drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c      | 354 ++++----
>  drivers/perf/hisilicon/hisi_uncore_hha_pmu.c       |   6 +-
>  drivers/perf/hisilicon/hisi_uncore_pa_pmu.c        |   2 +-
>  drivers/perf/hisilicon/hisi_uncore_pmu.c           |  11 +-
>  drivers/perf/hisilicon/hisi_uncore_pmu.h           |   2 +
>  drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c      | 220 +++--
>  include/linux/acpi.h                               |   2 +-
>  include/linux/nmi.h                                |   2 +
>  include/linux/perf/arm_pmu.h                       |   8 +
>  include/uapi/linux/prctl.h                         |   2 +
>  kernel/watchdog_perf.c                             |  22 +
>  tools/testing/selftests/arm64/abi/Makefile         |   2 +-
>  tools/testing/selftests/arm64/abi/hwcap.c          |  16 +
>  tools/testing/selftests/arm64/abi/tpidr2.c         | 140 +---
>  tools/testing/selftests/arm64/fp/fp-ptrace.c       |  77 +-
>  tools/testing/selftests/arm64/fp/sve-ptrace.c      |  12 +-
>  .../selftests/arm64/mte/check_buffer_fill.c        |  12 +-
>  .../selftests/arm64/mte/check_child_memory.c       |   8 +-
>  .../selftests/arm64/mte/check_hugetlb_options.c    |  10 +-
>  .../selftests/arm64/mte/check_ksm_options.c        |   6 +-
>  .../selftests/arm64/mte/check_mmap_options.c       | 890 +++++++++++++++++++--
>  tools/testing/selftests/arm64/mte/check_prctl.c    |  29 +-
>  .../selftests/arm64/mte/check_tags_inclusion.c     |  10 +-
>  tools/testing/selftests/arm64/mte/check_user_mem.c |   4 +-
>  .../testing/selftests/arm64/mte/mte_common_util.c  |  84 +-
>  .../testing/selftests/arm64/mte/mte_common_util.h  |   9 +-
>  tools/testing/selftests/arm64/mte/mte_def.h        |   8 +
>  .../testing/selftests/kvm/arm64/debug-exceptions.c |   4 +-
>  100 files changed, 3768 insertions(+), 1249 deletions(-)
>  create mode 100644 drivers/perf/arm_brbe.c
>  create mode 100644 drivers/perf/arm_brbe.h

