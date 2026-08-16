Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DA1F4C5B572
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Aug 2026 09:52:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=oIuRrb3QVBYcqpMRqXRM0GQcA85mBiNG/q1y/Rmt4v4=; b=3a9uTfV/df4s9vqjumz6n8hGJv
	JEgbEctbOd/9A0DgWDj4uTbaIShH9t7dSIkO7y80xg9IvQwqus3bavrJsgBpCwp3a812dEvDNpo0B
	u+bXVgl4MGhLTRLkA1LRyEGN6lp5dxGrdZDWv4Iz7lQMPdl7ioCAPbKWQSaXiWhhHLocmNwmSilUi
	xBdd3knbUBDsRQFrLlq+9Q2gVrG/urPhZYo5nll/zKCJIhvFNYTrTbYYlB/Wo+Ibeo5GdvFWayJyA
	yYltCMdADG3yQurAD6AhKZmxI9W3IxzEK1ltzs0WB8AieoMlQFy9/vfbnsjaBqKjaD7ckoM06oW69
	xLcju1Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXXf-00000004cvk-127Q;
	Sun, 16 Aug 2026 09:52:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wvXXc-00000004cvc-39XS
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Aug 2026 09:52:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DE13C6001D;
	Sun, 16 Aug 2026 09:52:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F22F1F000E9;
	Sun, 16 Aug 2026 09:52:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786873951;
	bh=oIuRrb3QVBYcqpMRqXRM0GQcA85mBiNG/q1y/Rmt4v4=;
	h=Date:From:To:Cc:Subject;
	b=VX+sIWQ2dkVOC2WSoeA9sktit8Ohb/9FuOi2nlKRPlKi9R8iitiWmm/MPLx9fR/E6
	 gTR/fC+aiV2ALH0Sl9TC4/9lmJvxbfCipC+jf+9Tp8Mp1bK37/Kudtogtd3noRMc1v
	 uU8654jxZki8tqC2LKCOJHa+2p7AXMuYqELMqqsaUHdTwdtdIrPXTLU/FQuxBt3Qxr
	 TujTywGPk+kXvXGkp6mEcNPEGd14PKZPyR+QNUoTD+2vyx7dfy825Mr6/3t0GBUG7F
	 sOuKwr9DycT5uDrwhjx6Cj43r5NWo3VT/r8Cwm24AdSuZrUG8B0UgA+55lYiAZmHIm
	 0g26njlBjrSGA==
Date: Sun, 16 Aug 2026 10:52:26 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	mark.rutland@arm.com
Subject: [GIT PULL] arm64 updates for 7.3
Message-ID: <aoGIWuq7XL2jnG7s@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
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

Please pull these arm64 updates for 7.3. There's a reasonable amount of
stuff here, including a bunch of updates to the perf PMU drivers and
some MPAM updates to expose the memory bandwidth counters via resctrl.
On the architecture side, some highlights include support for BBML3 and
steps towards support for an architectural NMI solution, all wrapped up
in a web of fixes for latent issues identified by Sashiko.

There were a couple of trivial conflicts in linux-next:

1. We add a vendor ID for Picoheart to include/linux/pci_ids.h as part
   of the DWC PCIe PMU driver support. This has a context conflict with
   an unrelated addition from the wireless tree.

2. We re-jig some capabilities in arch/arm64/tools/cpucaps which again
   gives rise to a context conflict due to kvm-arm's addition of some NV
   features and a GIC workaround.

You can also expect to see the for-next/coco branch merged here appear
in the dma-mapping pull request, as it builds on top of that rework.

The summary's in the tag, but please note that I've refreshed the expiry
date on my gpg key so you might need to update your copy to keep the
tools happy.

Cheers,

Will

--->8

The following changes since commit a13c140cc289c0b7b3770bce5b3ad42ab35074aa:

  Linux 7.2-rc3 (2026-07-12 14:16:39 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

for you to fetch changes up to 26b77009ee74f6122a067a4f9926ff6e09fffb94:

  Merge branch 'for-next/uapi' into for-next/core (2026-08-14 10:16:13 +0000)

----------------------------------------------------------------
arm64 updates for 7.3

ACPI:
- Combine reads of AMU counters into a single FFH feedback counter op.

Confidential computing:
- Fix smp_processor_id() in preemptible context when retrieving an
  attestation token inside a realm.

- Convert pKVM over to a "CC platform".

- Clean-up our SWIOTLB configuration in preparation for reworking the
  handling of encrypted/decryped DMA buffers in the dma-mapping tree.

CPU errata handling:
- Work around broken device memory ordering on NVIDIA Olympus cores.

- Fix broken 'nospectre_bhb' command-line option.

- Select the idle loop backend instruction on the command-line.

CPU features:
- Replace our BBML2-noabort feature with the new architectural BBML3
  feature.

- Disable in-kernel BTI for recent versions of Clang due to issues with
  livepatch that are still being investigated.

- Clean-up documentation describing which ID register fields are exposed
  to userspace.

Interrupts:
- Preliminary work towards supporting FEAT_NMI, which cleans up our
  IRQ entry code and fixes some latent issues with pseudo-NMI.

- Support for an SDEI backend to trigger an NMI backtrace.

Memory management:
- Treat all devices as coherent when CLIDR_EL1.LoC == 0.

- Fix no-map handling of sub-page-sized regions.

- Second attempt at unmapping the linear aliases of the kernel data and
  bss sections.

- Fix EFI runtime calls when software-PAN is enabled.

Miscellaneous:
- Add Mark Rutland as a reviewer!

- Tidy-up our futex cmpxchg logic when using the new LSUI instructions.

- Drop the requirement on DYNAMIC_FTRACE_WITH_CALL_OPS when selecting
  HAVE_DYNAMIC_FTRACE_WITH_DIRECT_CALLS.

- Fix a false-positive KCSCAN splat in the delay loop.

- Use a portable typedef for 128-bit scalar types in our UAPI headers.

- Non-critical fixes for Sashiko reports all over.

MPAM:
- Hook MPAM memory bandwidth counters into resctrl's counter assignment
  interface.

- Fix a quirk in the MPAM bandwidth counting on Nvidia T241 so that it
  also applies to 63 bit counters.

Perf:
- Workarounds for hardware issues in the CMN-S3 PMU (Graviton 5) and CPU
  PMU (NVIDIA Olympus again!)

- Add support for the DDR PMU on Marvell CN20K SoCs.

- Add support for Picoheart implementations of the DCW PCIe PMU.

- Add support for Channel/Rank/Bank filtering in the CXL PMU driver.

- Add support for 64-bit counters in the CSPMU device.

- Add support for revision 2 of the CMN S3 PMU.

Ptrace:
- Fix a decade-old bug in our handling of seccomp and tracing on syscall
  entry.

- Fix regset handling for inactive SVE and SSVE registers.

Selftests
- Add some tests for the decade-old bug that we just tried to fix in our
  syscall entry path.

- Fix SVE test crash on SME-only CPUs.

----------------------------------------------------------------
Ada Couprie Diaz (5):
      arm64: debug: don't mask DAIF for mdscr_write()
      arm64: hibernate: mask DAIF before restoring hibernated kernel
      arm64: suspend: rely on daif helpers to handle PMR
      arm64: entry: mask DAIF before returning from C EL1 handlers
      irqchip/gic-v3: make the unmasking of pseudo-NMIs explicit when handling IRQs

Ard Biesheuvel (1):
      arm64: mm: Unmap kernel data/bss entirely from the linear map

Aviv Bakal (1):
      perf/arm-cmn: Add workarounds for CMN-S3 on Graviton5

Ben Horgan (4):
      arm_mpam: resctrl: Pre-allocate assignable monitors
      arm64: mpam: Add memory bandwidth usage (MBWU) documentation
      arm_mpam: Fix a NULL pointer dereference on unbinding after an error interrupt
      arm_mpam: Disable driver unbind to avoid UAF

Besar Wicaksono (1):
      perf/arm_pmu: Skip PMCCNTR_EL0 on NVIDIA Olympus

Davidlohr Bueso (1):
      perf/cxlpmu: Fix 64-bit write to 32-bit HDM filter register

Geetha sowjanya (3):
      dt-bindings: perf: marvell: Add CN20K DDR PMU binding
      perf: marvell: Add CN20K DDR PMU support
      perf: marvell: Cancel CN10K DDR PMU hrtimer on device remove

Harshal Thakkar (2):
      perf/cxlpmu: Add missing CXL 4.0 events
      perf/cxlpmu: Support Channel/Rank/Bank filter

James Clark (1):
      perf: arm_pmuv3: Zero initialize hw_id branch stack field

James Morse (3):
      arm_mpam: resctrl: Pick classes for use as MBM counters
      arm_mpam: resctrl: Add resctrl_arch_config_cntr() for ABMC use
      arm_mpam: resctrl: Add resctrl_arch_cntr_read() & resctrl_arch_reset_cntr()

Jinjie Ruan (3):
      kselftest/arm64: Add seccomp ptrace x0 bypass test
      kselftest/arm64: Add testcase for SECCOMP_RET_TRACE orig_x0 bypass
      kselftest/arm64: Fix abi test compilation errors

Jose Fernandez (Anthropic) (2):
      arm64: ftrace: prepare ftrace_modify_call() for use without CALL_OPS
      arm64: ftrace: allow DIRECT_CALLS without CALL_OPS

Josh Poimboeuf (1):
      arm64: bti: Disable in-kernel BTI with recent versions of Clang

Karl Mehltretter (3):
      arm64: proton-pack: Restore the nospectre_bhb command-line option
      arm64/fpsimd: ptrace: Fix inactive SVE and SSVE regsets
      kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets

Kiryl Shutsemau (Meta) (4):
      firmware: arm_sdei: add sdei_is_present()
      firmware: arm_sdei: add SDEI_EVENT_SIGNAL support
      drivers/firmware: add SDEI cross-CPU NMI service for arm64
      arm64: escalate smp_send_stop() to an SDEI NMI as a last resort

Kohei Enju (2):
      virt: arm-cca-guest: use migrate_disable() for attestation token requests
      arm64: RSI: fix field-spanning write warning in attestation token init

Leo Yan (1):
      perf: arm_spe: Make wakeup range check overflow safe

Linu Cherian (6):
      arm64: cputype: Add Cortex-A520AE definitions
      arm64: cputype: Add C1-Nano definitions
      arm64: cpufeature: Extend bbml2_noabort support list
      arm64: sysreg: Add BBM_3
      arm64: cpufeature: Rename BBML2_NOABORT as BBML3
      arm64: cpufeature: Detect BBML3 based on ID_AA64MMFR2_EL1.BBM

Marc Zyngier (1):
      perf: arm_pmu_acpi: Get rid of the edge-triggered interrupt oddity

Marco Elver (1):
      arm64: Disable KCSAN instrumentation in delay.o

Mark Brown (6):
      arm64: Don't number registers in cpu-feature-registers.rst
      arm64: Document missing bitfields in cpu-feature-registers.rst
      arm64: Sort registers in cpu-feature-registers.rst
      arm64: Remove hidden bitfields from cpu-feature-registers.rst
      kselftest/arm64: Don't write to P0 in irritator on SME only systems
      tools: Ensure tools copy of linux/filter.h exports the UAPI

Mark Rutland (1):
      arm64: Clarify ARM64_WORKAROUND_REPEAT_TLBI semantics

Mostafa Saleh (2):
      arm64/mm: Simplify SWIOTLB setup in arch_mm_preinit()
      arm64/coco: Add pKVM as a CC platform

Pan Chuang (3):
      perf: Remove redundant dev_err()/dev_err_probe()
      perf: arm_cspmu: Remove redundant dev_err()
      drivers/perf: hisi: Remove redundant dev_err()/dev_err_probe()

Pengjie Zhang (2):
      ACPI: CPPC: add paired FFH feedback-counter read hook
      arm64: topology: read CPPC FFH feedback counters in one operation

Randy Dunlap (1):
      arm64: fix cpu-feature-registers Malformed table

Robin Murphy (11):
      perf/arm-cmn: Move DTM index data out of hw_perf_event
      ACPI/APMT: Use stable device ID
      perf/arm_cspmu: Improve APMT-based PMU naming
      perf/arm_cspmu: Improve sub-module error reporting
      perf/arm_cspmu: Make IRQ more optional
      perf/arm_cspmu: Support 64-bit programmers' model
      perf/arm-cmn: Rename filter variables for clarity
      perf/arm-cmn: Refactor event filter programming
      perf/arm-cmn: Refactor event filter data
      perf/arm-cmn: Plumb in new filter types
      perf/arm-cmn: Support CMN S3 r2

Shanker Donthineni (2):
      arm64: errata: work around NVIDIA Olympus device store/load ordering
      arm_mpam: Apply T241-MPAM-6 to 63-bit counters

Uwe Kleine-König (The Capable Hub) (1):
      virt: arm-cca-guest: Drop unused assignment of platform_device_id driver data

Vladimir Murzin (5):
      arm64: smp: Fix IPI teardown for GICv5 flow
      arm64: ptrace: Remove INIT_PSTATE_EL2
      arm64: hibernate: Restore DAIF state on error
      arm64: suspend: Initialize PMR on resume
      arm64: entry: Avoid unnecessary local_irq_disable() on kernel exit

Will Deacon (23):
      tools: linux/types.h: Add 128-bit integer types for arm64 UAPI structures
      arm64: uapi: Use __u128 instead of __uint128_t in UAPI headers
      arm64: futex: Consolidate 'old == new' check in __lsui_cmpxchg32()
      arm64: mm: Treat all devices as dma-coherent when CLIDR_EL1.LoC == 0
      arm64: cpucaps: Remove stale comment about keeping capabilities sorted
      arm64: ptrace: Keep 'orig_x0' in-sync with x0 on syscall entry
      arm64: syscall: Pass 'orig_x0' as first argument to native system call
      MAINTAINERS: arm64: Add Mark Rutland as an official Reviewer
      iommu/arm-smmu-v3-sva: Use system_supports_bbml3() to detect CPU feature
      arm64/efi: Avoid voluntary preemption with efi_mm installed
      Merge branch 'for-next/acpi' into for-next/core
      Merge branch 'for-next/coco' into for-next/core
      Merge branch 'for-next/cpufeature' into for-next/core
      Merge branch 'for-next/errata' into for-next/core
      Merge branch 'for-next/misc' into for-next/core
      Merge branch 'for-next/mm' into for-next/core
      Merge branch 'for-next/mpam' into for-next/core
      Merge branch 'for-next/nmi' into for-next/core
      Merge branch 'for-next/perf' into for-next/core
      Merge branch 'for-next/ptrace' into for-next/core
      Merge branch 'for-next/sdei' into for-next/core
      Merge branch 'for-next/selftests' into for-next/core
      Merge branch 'for-next/uapi' into for-next/core

Yeoreum Yun (1):
      arm64: pgtable: convert pte_present() from macro to static inline

Yicong Yang (1):
      perf/dwc_pcie: Add support for Picoheart vendor devices

Yufan Dou (1):
      perf/dwc_pcie: Support narrowed time-based counter for long time monitoring

Yureka Lilian (1):
      arch: arm64: add early_param idle=<wfi|yield|nop>

liulhong617 (1):
      arm64: mm: fix accidental linear mapping of no-map reserved memory

 Documentation/admin-guide/kernel-parameters.txt    |  23 +
 Documentation/arch/arm64/cpu-feature-registers.rst | 567 +++++++++++--------
 Documentation/arch/arm64/mpam.rst                  |  22 +
 Documentation/arch/arm64/silicon-errata.rst        |   6 +
 .../bindings/perf/marvell-cn10k-ddr.yaml           |   8 +-
 MAINTAINERS                                        |   3 +-
 arch/arm/include/asm/arch_gicv3.h                  |   6 +-
 arch/arm64/Kconfig                                 |  60 +-
 arch/arm64/include/asm/arch_gicv3.h                |   7 +-
 arch/arm64/include/asm/assembler.h                 |   4 -
 arch/arm64/include/asm/cpucaps.h                   |   4 +-
 arch/arm64/include/asm/cpufeature.h                |   6 +-
 arch/arm64/include/asm/cputype.h                   |   4 +
 arch/arm64/include/asm/entry-common.h              |   2 +-
 arch/arm64/include/asm/futex.h                     |  61 +-
 arch/arm64/include/asm/hypervisor.h                |  13 +
 arch/arm64/include/asm/io.h                        |  16 +-
 arch/arm64/include/asm/mem_encrypt.h               |   3 +-
 arch/arm64/include/asm/nmi.h                       |  48 ++
 arch/arm64/include/asm/pgtable.h                   |  12 +-
 arch/arm64/include/asm/ptrace.h                    |   2 -
 arch/arm64/include/asm/rsi_cmds.h                  |  27 +-
 arch/arm64/include/asm/syscall_wrapper.h           |  13 +-
 arch/arm64/include/asm/tlbflush.h                  |   2 +-
 arch/arm64/include/uapi/asm/ptrace.h               |  12 +-
 arch/arm64/include/uapi/asm/sigcontext.h           |   6 +-
 arch/arm64/kernel/cpu_errata.c                     |  14 +-
 arch/arm64/kernel/cpufeature.c                     |  50 +-
 arch/arm64/kernel/debug-monitors.c                 |   3 -
 arch/arm64/kernel/efi.c                            |   4 +-
 arch/arm64/kernel/entry-common.c                   |  32 +-
 arch/arm64/kernel/entry.S                          |   4 -
 arch/arm64/kernel/ftrace.c                         |   5 +-
 arch/arm64/kernel/hibernate.c                      |  16 +-
 arch/arm64/kernel/idle.c                           |  32 +-
 arch/arm64/kernel/proton-pack.c                    |   9 +-
 arch/arm64/kernel/ptrace.c                         |  54 +-
 arch/arm64/kernel/rsi.c                            |  12 -
 arch/arm64/kernel/smp.c                            | 126 +++--
 arch/arm64/kernel/suspend.c                        |  12 +-
 arch/arm64/kernel/topology.c                       |  92 +++-
 arch/arm64/lib/Makefile                            |   4 +
 arch/arm64/mm/contpte.c                            |  21 +-
 arch/arm64/mm/dma-mapping.c                        |   5 +
 arch/arm64/mm/init.c                               |  25 +-
 arch/arm64/mm/mmu.c                                | 114 ++--
 arch/arm64/mm/proc.S                               |  11 +-
 arch/arm64/tools/cpucaps                           |   7 +-
 arch/arm64/tools/sysreg                            |   1 +
 drivers/acpi/arm64/apmt.c                          |   6 +-
 drivers/acpi/cppc_acpi.c                           |  50 +-
 drivers/firmware/Kconfig                           |  21 +
 drivers/firmware/Makefile                          |   1 +
 drivers/firmware/arm_sdei.c                        |  22 +
 drivers/firmware/arm_sdei_nmi.c                    | 246 +++++++++
 drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c    |   2 +-
 drivers/irqchip/irq-gic-v3.c                       |   5 +-
 drivers/perf/alibaba_uncore_drw_pmu.c              |   5 +-
 drivers/perf/arm-cmn.c                             | 613 +++++++++++++++------
 drivers/perf/arm_cspmu/arm_cspmu.c                 | 171 ++++--
 drivers/perf/arm_cspmu/arm_cspmu.h                 |  25 +-
 drivers/perf/arm_cspmu/nvidia_cspmu.c              |   2 +-
 drivers/perf/arm_pmu.c                             |   7 +-
 drivers/perf/arm_pmu_acpi.c                        |  13 +-
 drivers/perf/arm_pmuv3.c                           |  66 ++-
 drivers/perf/arm_spe_pmu.c                         |   2 +-
 drivers/perf/cxl_pmu.c                             | 119 +++-
 drivers/perf/dwc_pcie_pmu.c                        |  71 ++-
 drivers/perf/fsl_imx8_ddr_perf.c                   |   4 +-
 drivers/perf/fsl_imx9_ddr_perf.c                   |   4 +-
 drivers/perf/fujitsu_uncore_pmu.c                  |   2 +-
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c       |   3 +-
 drivers/perf/hisilicon/hisi_uncore_pmu.c           |   5 +-
 drivers/perf/marvell_cn10k_ddr_pmu.c               | 234 +++++++-
 drivers/perf/qcom_l2_pmu.c                         |   5 +-
 drivers/perf/qcom_l3_pmu.c                         |   5 +-
 drivers/perf/starfive_starlink_pmu.c               |   2 +-
 drivers/perf/xgene_pmu.c                           |   4 +-
 drivers/resctrl/mpam_devices.c                     |  10 +-
 drivers/resctrl/mpam_internal.h                    |   6 +-
 drivers/resctrl/mpam_resctrl.c                     | 318 ++++++++++-
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c    |  99 ++--
 drivers/virt/coco/pkvm-guest/arm-pkvm-guest.c      |   3 +
 include/acpi/cppc_acpi.h                           |   7 +
 include/linux/arm_sdei.h                           |   9 +
 include/linux/pci_ids.h                            |   2 +
 include/linux/pcie-dwc.h                           |   2 +
 include/linux/perf/arm_pmu.h                       |   2 +-
 include/uapi/linux/arm_sdei.h                      |   1 +
 tools/include/linux/filter.h                       |   1 +
 tools/include/linux/types.h                        |   5 +
 tools/testing/selftests/arm64/abi/.gitignore       |   2 +
 tools/testing/selftests/arm64/abi/Makefile         |   4 +-
 .../selftests/arm64/abi/seccomp_ptrace_x0_bypass.c | 192 +++++++
 .../arm64/abi/seccomp_ret_trace_x0_bypass.c        | 201 +++++++
 tools/testing/selftests/arm64/fp/fp-ptrace.c       |  47 +-
 tools/testing/selftests/arm64/fp/sve-test.S        |   7 +-
 97 files changed, 3321 insertions(+), 902 deletions(-)
 create mode 100644 arch/arm64/include/asm/nmi.h
 create mode 100644 drivers/firmware/arm_sdei_nmi.c
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ptrace_x0_bypass.c
 create mode 100644 tools/testing/selftests/arm64/abi/seccomp_ret_trace_x0_bypass.c

