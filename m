Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72EEFC02182
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Jan 2025 19:01:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=jbUzLvYct+Q3q8p52u/0I7k70W6cky67gUKpAkP5rNY=; b=Q0IbwzZiAsSwdYimP71Gndb7Hg
	HkeSfxX5EwS0FOx1CK3slAJlg0qsIos11xYs5Wtaxqj20cmZf41zqHcLlld5xJsfWkyB01S4dosZs
	FLthPIzO/GaXbYfhg4FExjQrF0V/zQphtHEwATYyF2SwOjp6GWfkzR9AnNSbdUkL+6tjrQh8AycG3
	LDd+YNh2KSUmN6k1som91aPx0zrXIu/E4uXcakViKb0dq3vLsVleOiTxb4ZHlQFzXnIGBSrx5alHk
	bR3PNbkOi+jzT+wXNX7ERM9+N6qqpj2UDrGImrLvjMum0AvHSiwAIFsYbOXfyoQpeSKGOaFn2yL+g
	WvCbOVXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tZx1S-00000006IAC-41Pr;
	Mon, 20 Jan 2025 19:01:18 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tZx09-00000006Hq9-36Yy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Jan 2025 18:59:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 96A665C062A;
	Mon, 20 Jan 2025 18:59:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C2918C4CEE5;
	Mon, 20 Jan 2025 18:59:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737399595;
	bh=iAkZKKpWubMSTuScI3FYxu+r0DGBwTxBUrbrQVlqlgA=;
	h=Date:From:To:Cc:Subject:From;
	b=T5BUe+fv4J3//JbiGkJXeRnjvS4R8ca4751Gkd7no7Qk0sYVFVEpiMJThJuDpMJrz
	 t7+BG4Ui4pcQHvTyfG8WhSgoP4DPo5g/qi3C6GLxFFf2EaJprXg155kF+ggPJUTmtW
	 rPUEwgHjQAv8lHXfUwBpjqjF5P9J5L0TomKt+Rkdejt6JjucNdWFy1b/+S/aGEKY0X
	 wHeEA0nFEX9KAklIhMOL3ioOeNzwHv9guhcXTyyUm4eo2FLmEFNOVGip7PH3BmvlAC
	 3zVPJfM9tYH7gVQPS2nhx02BiRm2C+UCiWR/6TPArPCFwmyGCJu4rn3kniHA7yOtow
	 hUGbWEfEb3TpA==
Date: Mon, 20 Jan 2025 18:59:51 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com
Subject: [GIT PULL] arm64 updates for 6.14
Message-ID: <20250120185950.GA20356@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250120_105957_871225_C56CCE54 
X-CRM114-Status: GOOD (  23.03  )
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

Please pull these arm64 updates for 6.14.

We've got a little less than normal thanks to the holidays in December,
but there's the usual summary in the tag. The highlight is probably the
52-bit physical addressing (LPA2) clean-up from Ard.

Please note that the cpufeature branch will also make an appearance
via the KVM tree.

Cheers,

Will

--->8


The following changes since commit fac04efc5c793dccbd07e2d59af9f90b7fc0dca4:

  Linux 6.13-rc2 (2024-12-08 14:03:39 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

for you to fetch changes up to 1dd3393696efba1598aa7692939bba99d0cffae3:

  Merge branch 'for-next/perf' into for-next/core (2025-01-17 13:52:37 +0000)

----------------------------------------------------------------
arm64 updates for 6.14

Confidential Computing:
* Register a platform device when running in CCA realm mode to enable
  automatic loading of dependent modules.

CPU Features:
* Update a bunch of system register definitions to pick up new field
  encodings from the architectural documentation.

* Add hwcaps and selftests for the new (2024) dpISA extensions.

Documentation:
* Update EL3 (firmware) requirements for booting Linux on modern arm64
  designs.

* Remove stale information about the kernel virtual memory map.

Miscellaneous:
* Minor cleanups and typo fixes.

Memory management:
* Fix vmemmap_check_pmd() to look at the PMD type bits

* LPA2 (52-bit physical addressing) cleanups and minor fixes.

* Adjust physical address space depending upon whether or not LPA2 is
  enabled.

Perf and PMUs:
* Add port filtering support for NVIDIA's NVLINK-C2C Coresight PMU

* Extend AXI filtering support for the DDR PMU on NXP IMX SoCs

* Fix Designware PCIe PMU event numbering.

* Add generic branch events for the Apple M1 CPU PMU.

* Add support for Marvell Odyssey DDR and LLC-TAD PMUs.

* Cleanups to the Hisilicon DDRC and Uncore PMU code.

* Advertise discard mode for the SPE PMU.

* Add the perf users mailing list to our MAINTAINERS entry.

----------------------------------------------------------------
Anshuman Khandual (8):
      arm64/mm: Drop INIT_MM_CONTEXT()
      arm64/mm: Replace open encodings with PXD_TABLE_BIT
      arm64/mm: Ensure adequate HUGE_MAX_HSTATE
      arm64/Kconfig: Drop EXECMEM dependency from ARCH_WANTS_EXECMEM_LATE
      docs: arm64: Document EL3 requirements for cpu debug architecture
      docs: arm64: Document EL3 requirements for FEAT_PMUv3
      arm64/mm: Rename pte_mkpresent() as pte_mkvalid()
      arm64/mm: Replace open encodings with PXD_TABLE_BIT

Ard Biesheuvel (5):
      arm64/mm: Reduce PA space to 48 bits when LPA2 is not enabled
      arm64/mm: Override PARange for !LPA2 and use it consistently
      arm64/kvm: Configure HYP TCR.PS/DS based on host stage1
      arm64/kvm: Avoid invalid physical addresses to signal owner updates
      arm64: Kconfig: force ARM64_PAN=y when enabling TTBR0 sw PAN

Besar Wicaksono (4):
      perf: arm_cspmu: nvidia: remove unsupported SCF events
      perf: arm_cspmu: nvidia: fix sysfs path in the kernel doc
      perf: arm_cspmu: nvidia: enable NVLINK-C2C port filtering
      perf: arm_cspmu: nvidia: monitor all ports by default

Bjorn Helgaas (1):
      perf/dwc_pcie: Qualify RAS DES VSEC Capability by Vendor, Revision

Gowthami Thiagarajan (5):
      perf/marvell: Refactor to extract platform data
      perf/marvell: Refactor to extract PMU operations
      perf/marvell: Odyssey DDR Performance monitor support
      perf/marvell: Refactor to extract platform data
      perf/marvell: Odyssey LLC-TAD performance monitor support

Hardevsinh Palaniya (1):
      arm64/cpufeature: Refactor conditional logic in init_cpu_ftr_reg()

Ilkka Koskinen (2):
      perf/dwc_pcie: Fix the event numbers
      Documentation: dwc_pcie_pmu: Fix the mnemonics and eventid

James Clark (2):
      perf: arm_spe: Add format option for discard mode
      perf docs: arm_spe: Document new discard mode

Jeremy Linton (1):
      arm64: rsi: Add automatic arm-cca-guest module loading

Junhao He (2):
      drivers/perf: hisi: Fix incorrect variable name "hha_pmu" in DDRC PMU driver
      drivers/perf: hisi: Delete redundant blank line of DDRC PMU

Marc Zyngier (5):
      arm64/sysreg: Allow a 'Mapping' descriptor for system registers
      arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
      arm64/sysreg: Convert *_EL12 accessors to Mapping
      arm64/sysreg: Get rid of CPACR_ELx SysregFields
      arm64: Filter out SVE hwcaps when FEAT_SVE isn't implemented

Mark Brown (10):
      arm64/sysreg: Update ID_AA64PFR2_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64FPFR0_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64ZFR0_EL1 to DDI0601 2024-09
      arm64/sysreg: Update ID_AA64ISAR2_EL1 to DDI0601 2024-09
      arm64/sme: Move storage of reg_smidr to __cpuinfo_store_cpu()
      arm64/sysreg: Update ID_AA64SMFR0_EL1 to DDI0601 2024-12
      arm64/hwcap: Describe 2024 dpISA extensions to userspace
      KVM: arm64: Allow control of dpISA extensions in ID_AA64ISAR3_EL1
      kselftest/arm64: Add 2024 dpISA extensions to hwcap test

Mark Rutland (1):
      arm64: cpufeature: Add HAFT to cpucap_is_possible()

Oliver Upton (1):
      drivers/perf: apple_m1: Map generic branch events

Rob Herring (Arm) (1):
      MAINTAINERS: Add perf list for drivers/perf/

Robin Murphy (1):
      perf/arm-cmn: Permit more exhaustive groups

Thorsten Blum (1):
      arm64: Remove duplicate included header

Will Deacon (7):
      Documentation: arm64: Remove stale and redundant virtual memory diagrams
      Merge branch 'for-next/cca' into for-next/core
      Merge branch 'for-next/cpufeature' into for-next/core
      Merge branch 'for-next/docs' into for-next/core
      Merge branch 'for-next/misc' into for-next/core
      Merge branch 'for-next/mm' into for-next/core
      Merge branch 'for-next/perf' into for-next/core

Xu Yang (1):
      perf: imx9_perf: Introduce AXI filter version to refactor the driver and better extension

Yicong Yang (9):
      drivers/perf: hisi: Define a symbol namespace for HiSilicon Uncore PMUs
      drivers/perf: hisi: Don't update the associated_cpus on CPU offline
      drivers/perf: hisi: Migrate to one online CPU if no associated one online
      drivers/perf: hisi: Refactor the detection of associated CPUs
      drivers/perf: hisi: Extract topology information to a separate structure
      drivers/perf: hisi: Add a common function to retrieve topology from firmware
      drivers/perf: hisi: Provide a generic implementation of cpumask/identifier
      drivers/perf: hisi: Export associated CPUs of each PMU through sysfs
      drivers/perf: hisi: Set correct IRQ affinity for PMUs with no association

Zhenhua Huang (1):
      arm64: mm: Test for pmd_sect() in vmemmap_check_pmd()

Zhu Jun (1):
      arm64: asm: Fix typo in pgtable.h

 Documentation/admin-guide/perf/dwc_pcie_pmu.rst    |   6 +-
 Documentation/admin-guide/perf/hisi-pmu.rst        |   5 +-
 Documentation/admin-guide/perf/index.rst           |   2 +
 .../admin-guide/perf/mrvl-odyssey-ddr-pmu.rst      |  80 ++++
 .../admin-guide/perf/mrvl-odyssey-tad-pmu.rst      |  37 ++
 Documentation/admin-guide/perf/nvidia-pmu.rst      |  52 +-
 Documentation/arch/arm64/booting.rst               |  12 +
 Documentation/arch/arm64/elf_hwcaps.rst            |  89 +++-
 Documentation/arch/arm64/memory.rst                |  65 ---
 MAINTAINERS                                        |   1 +
 arch/arm64/Kconfig                                 |   8 +-
 arch/arm64/include/asm/assembler.h                 |   5 +
 arch/arm64/include/asm/cpucaps.h                   |   2 +
 arch/arm64/include/asm/cpufeature.h                |   3 +-
 arch/arm64/include/asm/el2_setup.h                 |   6 +-
 arch/arm64/include/asm/hwcap.h                     |  15 +
 arch/arm64/include/asm/kvm_arm.h                   |   2 -
 arch/arm64/include/asm/kvm_emulate.h               |  40 +-
 arch/arm64/include/asm/kvm_nested.h                |   8 +-
 arch/arm64/include/asm/mmu.h                       |   3 -
 arch/arm64/include/asm/pgtable-hwdef.h             |   6 -
 arch/arm64/include/asm/pgtable-prot.h              |   7 +
 arch/arm64/include/asm/pgtable.h                   |   8 +-
 arch/arm64/include/asm/rsi.h                       |   2 +
 arch/arm64/include/asm/seccomp.h                   |   1 -
 arch/arm64/include/asm/sparsemem.h                 |   5 +-
 arch/arm64/include/uapi/asm/hwcap.h                |  15 +
 arch/arm64/kernel/cpufeature.c                     | 103 ++--
 arch/arm64/kernel/cpuinfo.c                        |  25 +
 arch/arm64/kernel/pi/idreg-override.c              |   9 +
 arch/arm64/kernel/pi/map_kernel.c                  |   6 +
 arch/arm64/kernel/rsi.c                            |  15 +
 arch/arm64/kvm/arm.c                               |   8 +-
 arch/arm64/kvm/at.c                                |   6 +-
 arch/arm64/kvm/emulate-nested.c                    |   2 +-
 arch/arm64/kvm/fpsimd.c                            |   2 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c                 |   4 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                     |   2 +-
 arch/arm64/kvm/hyp/nvhe/switch.c                   |   6 +-
 arch/arm64/kvm/hyp/pgtable.c                       |  33 +-
 arch/arm64/kvm/hyp/vhe/switch.c                    |  16 +-
 arch/arm64/kvm/sys_regs.c                          |   6 +-
 arch/arm64/mm/hugetlbpage.c                        |  12 +
 arch/arm64/mm/init.c                               |   7 +-
 arch/arm64/mm/mmu.c                                |   3 +-
 arch/arm64/mm/proc.S                               |   5 +-
 arch/arm64/mm/trans_pgd.c                          |   2 +-
 arch/arm64/tools/gen-sysreg.awk                    |   2 +-
 arch/arm64/tools/sysreg                            | 125 +++--
 drivers/perf/apple_m1_cpu_pmu.c                    |   2 +
 drivers/perf/arm-cmn.c                             |   4 +-
 drivers/perf/arm_cspmu/nvidia_cspmu.c              |  75 +--
 drivers/perf/arm_spe_pmu.c                         |  22 +
 drivers/perf/dwc_pcie_pmu.c                        |  72 +--
 drivers/perf/fsl_imx9_ddr_perf.c                   |  33 +-
 drivers/perf/hisilicon/hisi_uncore_cpa_pmu.c       |  42 +-
 drivers/perf/hisilicon/hisi_uncore_ddrc_pmu.c      |  61 +--
 drivers/perf/hisilicon/hisi_uncore_hha_pmu.c       |  48 +-
 drivers/perf/hisilicon/hisi_uncore_l3c_pmu.c       |  44 +-
 drivers/perf/hisilicon/hisi_uncore_pa_pmu.c        |  53 +--
 drivers/perf/hisilicon/hisi_uncore_pmu.c           | 160 +++++--
 drivers/perf/hisilicon/hisi_uncore_pmu.h           |  49 +-
 drivers/perf/hisilicon/hisi_uncore_sllc_pmu.c      |  43 +-
 drivers/perf/hisilicon/hisi_uncore_uc_pmu.c        |  45 +-
 drivers/perf/marvell_cn10k_ddr_pmu.c               | 528 ++++++++++++++++++---
 drivers/perf/marvell_cn10k_tad_pmu.c               |  66 ++-
 drivers/virt/coco/arm-cca-guest/arm-cca-guest.c    |   8 +
 tools/perf/Documentation/perf-arm-spe.txt          |  26 +
 tools/testing/selftests/arm64/abi/hwcap.c          | 235 ++++++++-
 70 files changed, 1754 insertions(+), 750 deletions(-)
 create mode 100644 Documentation/admin-guide/perf/mrvl-odyssey-ddr-pmu.rst
 create mode 100644 Documentation/admin-guide/perf/mrvl-odyssey-tad-pmu.rst


