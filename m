Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D3EFE81BCB
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  9 Feb 2026 14:35:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Q5BGe1QKkGW+wkjp/ivrGyP3WXkTm5b3RXj8Td0vt2E=; b=jmHbUhmeEJkMw98zpu62qLDlZQ
	AUlViD/m6cyuJ3ENzXollhF6mFVyW+WRwZuwKSiOVhtnLvR18TfsMfEix0D6DpEMfRjXNRv0A9ROe
	nWokhr7YCks7z9Xk463yeqeKAhNZfpN5Bk5aI6eP8afp8psll8Hsqd35Uec8Fj7yzEo4p7geT/e0h
	BB6ud/FcDGr695cILyD9Cds8/HE86aQb0DqU/RjrGHdSy6XGMl00e9VyC9NFwXPkHp1ZthyIbQgh6
	7IVHdVMXePDdjAXF+Pmjj7mjmr4LMN5V4YdyG3Y4VQhcUHtYTHzk94ZlQLX0jLjVDhj5pAHoAl7P9
	StxiksAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSMK-0000000FW36-1WR5;
	Mon, 09 Feb 2026 14:35:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpSMG-0000000FW2i-3gHi
	for linux-arm-kernel@lists.infradead.org;
	Mon, 09 Feb 2026 14:35:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 17994409F6;
	Mon,  9 Feb 2026 14:35:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0725C16AAE;
	Mon,  9 Feb 2026 14:35:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1770647724;
	bh=+AEEw990sP9QJCIPuMXlE7BOSOh+LdxGmnNq1v3DSeY=;
	h=Date:From:To:Cc:Subject:From;
	b=s4TeNJNN20+7i0RTOg972jqP4MpS5w1a06D238tEuDYP4xc/6BoaX9lOJStLw4Sco
	 UOnL7KUszJt4SErHHpHMYuvET1JGWtPM19yq2Whey8HIAqJFBUQiKp317CWdWaHxCz
	 Fo6DsTGMSIDda6Jp+a5o+PhrOuOZfOPRqP5kEfyKIfu+JGRD0sCFMjMr0bEvcRaU08
	 5Q2N9y0eR3jTvYlFwbjyCdz5COF90Un9oYw1pkc4Eogil1YVq+alqWL4/ZA0rGHUWn
	 LlhIM2YjBR4XKIBcV3j9K6LBUsXfJBQwa463UAMakxHNk1Gh70NfdoQOaSBfS1BrYi
	 XH+ilH1aMm+Tg==
Date: Mon, 9 Feb 2026 14:35:19 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	maz@kernel.org
Subject: [GIT PULL] arm64 updates for 7.0
Message-ID: <aYnwpy4umKY4A5wQ@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260209_063524_963094_0A4E1D46 
X-CRM114-Status: GOOD (  26.68  )
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

Please pull these arm64 changes for 7.0. There's a little less than
normal, probably due to LPC & Christmas/New Year meaning that a few
series weren't quite ready or reviewed in time. It's still useful across
the board, despite the only real feature being support for the LS64
feature enabling 64-byte atomic accesses to endpoints that support it.
There's the usual summary in the tag.

Logistics-wise, we ran into a couple of small conflicts in -next. The
first one [1] is against a KVM/ARM fix in your tree (86364832ba6f ("KVM:
arm64: Don't blindly set set PSTATE.PAN on guest exit") which clashes
with the removal of CONFIG_ARM64_PAN in arch/arm64/kvm/hyp/entry.S. The
right fix is to take what we have here so that the line becomes:

	ALTERNATIVE(nop, SET_PSTATE_PAN(1), ARM64_HAS_PAN)

kvm_pan_patch_el2_entry() is then unused but is removed by the kvmarm
tree (who share the for-next/cpufeature branch). Marc and I will do a
sweep at -rc1 to remove anything left over.

The second conflict [2] is a trivial MAINTAINERS conflict where Catalin
and I have been added to the "ACPI FOR ARM64 (ACPI/arm64)" entry but
Sudeep has changed his email address in the context.

The only unusual part of the diffstat is the single-line removal of the
unused 'SYSCALL_MAX_ARGS' definition from arch/xtensa, which was part of
a series cleaning up our syscall_get_arguments() implementation and the
maintainers were on cc.

Please pull,

Will

[1] https://lore.kernel.org/r/86h5s8bca4.wl-maz@kernel.org
[2] https://lore.kernel.org/r/aXtqo7r3bSDMNBek@sirena.org.uk

--->8

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

for you to fetch changes up to 36c0de02575ce59dfd879eb4ef63d53a68bbf9ce:

  perf/arm-cmn: Reject unsupported hardware configurations (2026-02-03 19:43:52 +0000)

----------------------------------------------------------------
arm64 updates for 7.0

ACPI:
 - Add interrupt signalling support to the AGDI handler.
 - Add Catalin and myself to the arm64 ACPI MAINTAINERS entry.

CPU features:
- Drop Kconfig options for PAN and LSE (these are detected at runtime).
- Add support for 64-byte single-copy atomic instructions (LS64/LS64V).
- Reduce MTE overhead when executing in the kernel on Ampere CPUs.
- Ensure POR_EL0 value exposed via ptrace is up-to-date.
- Fix error handling on GCS allocation failure.

CPU frequency:
- Add CPU hotplug support to the FIE setup in the AMU driver.

Entry code:
- Minor optimisations and cleanups to the syscall entry path.
- Preparatory rework for moving to the generic syscall entry code.

Hardware errata:
- Work around Spectre-BHB on TSV110 processors.
- Work around broken CMO propagation on some systems with the SI-L1
  interconnect.

Miscellaneous:
- Disable branch profiling for arch/arm64/ to avoid issues with noinstr.
- Minor fixes and cleanups (kexec + ubsan, WARN_ONCE() instead of
  WARN_ON(), reduction of boolean expression).
- Fix custom __READ_ONCE() implementation for LTO builds when operating
  on non-atomic types.

Perf and PMUs:
- Support for CMN-600AE.
- Be stricter about supported hardware in the CMN driver.
- Support for DSU-110 and DSU-120.
- Support for the cycles event in the DSU driver (alongside the
  dedicated cycles counter).
- Use IRQF_NO_THREAD instead of IRQF_ONESHOT in the cxlpmu driver.
- Use !bitmap_empty() as a faster alternative to bitmap_weight().
- Fix SPE error handling when failing to resume profiling.

Selftests:
- Add support for the FORCE_TARGETS option to the arm64 kselftests.
- Avoid nolibc-specific my_syscall() function.
- Add basic test for the LS64 HWCAP.
- Extend fp-pidbench to cover additional workload patterns.

----------------------------------------------------------------
Breno Leitao (3):
      arm64: Disable branch profiling for all arm64 code
      arm64: mm: warn once for ioremap attempts on RAM mappings
      arm64/gcs: Fix error handling in arch_set_shadow_stack_status()

Carl Worth (1):
      arm64: mte: Set TCMA1 whenever MTE is present in the kernel

Geert Uytterhoeven (1):
      arm64: topology: Do not warn on missing AMU in cpuhp_topology_online()

Hanjun Guo (1):
      MAINTAINERS: Update the maintainers for ARM64 ACPI

I-Hsin Cheng (1):
      kselftest/arm64: Add missing file in .gitignore

Jinjie Ruan (5):
      syscall.h: Remove unused SYSCALL_MAX_ARGS
      arm64: Avoid memcpy() for syscall_get_arguments()
      arm64: Remove unused _TIF_WORK_MASK
      arm64/ptrace: Split report_syscall()
      arm64/ptrace: Return early for ptrace_report_syscall_entry() error

Jinqian Yang (1):
      arm64: Add support for TSV110 Spectre-BHB mitigation

Joey Gouly (1):
      arm64: poe: fix stale POR_EL0 values for ptrace

Kazuhiro Abe (1):
      ACPI: AGDI: Add interrupt signaling mode support

Leo Yan (1):
      perf: arm_spe: Properly set hw.state on failures

Lifeng Zheng (3):
      arm64: topology: Skip already covered CPUs when setting freq source
      cpufreq: Add new helper function returning cpufreq policy
      arm64: topology: Handle AMU FIE setup on CPU hotplug

Lucas Wei (1):
      arm64: errata: Workaround for SI L1 downstream coherency issue

Marc Zyngier (4):
      arm64: Unconditionally enable LSE support
      arm64: Unconditionally enable PAN support
      KVM: arm64: Add exit to userspace on {LD,ST}64B* outside of memslots
      KVM: arm64: Add documentation for KVM_EXIT_ARM_LDST64B

Marco Elver (1):
      arm64: Fix non-atomic __READ_ONCE() with CONFIG_LTO=y

Mark Brown (3):
      kselftest/arm64: Support FORCE_TARGETS
      kselftest/arm64: Add a no-SVE loop after SVE in fp-pidbench
      kselftest/arm64: Raise default number of loops in fp-pidbench

Osama Abdelkader (1):
      arm64: simplify arch_uprobe_xol_was_trapped return

Robin Murphy (5):
      perf/arm-cmn: Support CMN-600AE
      perf/arm_dsu: Support DSU-110
      perf/arm_dsu: Support DSU-120
      perf/arm_dsu: Allow standard cycles events
      perf/arm-cmn: Reject unsupported hardware configurations

Sebastian Andrzej Siewior (1):
      perf/cxlpmu: Replace IRQF_ONESHOT with IRQF_NO_THREAD

Thomas Weißschuh (1):
      kselftest/arm64: Use syscall() macro over nolibc my_syscall()

Will Deacon (8):
      Merge branch 'for-next/acpi' into for-next/core
      Merge branch 'for-next/cpufeature' into for-next/core
      Merge branch 'for-next/cpufreq' into for-next/core
      Merge branch 'for-next/entry' into for-next/core
      Merge branch 'for-next/errata' into for-next/core
      Merge branch 'for-next/misc' into for-next/core
      Merge branch 'for-next/perf' into for-next/core
      Merge branch 'for-next/selftests' into for-next/core

Yeoreum Yun (1):
      arm64: kernel: initialize missing kexec_buf->random field

Yicong Yang (5):
      KVM: arm64: Handle DABT caused by LS64* instructions on unsupported memory
      arm64: Provide basic EL2 setup for FEAT_{LS64, LS64_V} usage at EL0/1
      KVM: arm64: Enable FEAT_{LS64, LS64_V} in the supported guest
      arm64: Add support for FEAT_{LS64, LS64_V}
      kselftest/arm64: Add HWCAP test for FEAT_LS64

Yury Norov (NVIDIA) (1):
      drivers: perf: use bitmap_empty() where appropriate

 Documentation/arch/arm64/booting.rst           |  12 +++
 Documentation/arch/arm64/elf_hwcaps.rst        |   7 ++
 Documentation/arch/arm64/silicon-errata.rst    |   1 +
 Documentation/virt/kvm/api.rst                 |  43 +++++++++--
 MAINTAINERS                                    |   2 +
 arch/arm/include/asm/syscall.h                 |   2 -
 arch/arm64/Kbuild                              |   4 +
 arch/arm64/Kconfig                             |  52 +++++--------
 arch/arm64/include/asm/assembler.h             |  10 +++
 arch/arm64/include/asm/cpucaps.h               |   2 -
 arch/arm64/include/asm/el2_setup.h             |  12 ++-
 arch/arm64/include/asm/esr.h                   |   8 ++
 arch/arm64/include/asm/hwcap.h                 |   1 +
 arch/arm64/include/asm/insn.h                  |  23 ------
 arch/arm64/include/asm/kvm_emulate.h           |   7 ++
 arch/arm64/include/asm/lse.h                   |   9 ---
 arch/arm64/include/asm/rwonce.h                |   2 +-
 arch/arm64/include/asm/syscall.h               |  18 +++--
 arch/arm64/include/asm/thread_info.h           |   6 --
 arch/arm64/include/asm/uaccess.h               |   6 +-
 arch/arm64/include/uapi/asm/hwcap.h            |   1 +
 arch/arm64/kernel/cpu_errata.c                 |  31 ++++++++
 arch/arm64/kernel/cpufeature.c                 |  34 +++++++--
 arch/arm64/kernel/cpuinfo.c                    |   1 +
 arch/arm64/kernel/kexec_image.c                |   2 +-
 arch/arm64/kernel/probes/uprobes.c             |   5 +-
 arch/arm64/kernel/proton-pack.c                |   1 +
 arch/arm64/kernel/ptrace.c                     |  50 ++++++++----
 arch/arm64/kernel/topology.c                   |  66 +++++++++++++++-
 arch/arm64/kvm/at.c                            |   7 --
 arch/arm64/kvm/hyp/entry.S                     |   2 +-
 arch/arm64/kvm/inject_fault.c                  |  34 +++++++++
 arch/arm64/kvm/mmio.c                          |  27 ++++++-
 arch/arm64/kvm/mmu.c                           |  14 +++-
 arch/arm64/lib/insn.c                          |   2 -
 arch/arm64/mm/gcs.c                            |   4 +-
 arch/arm64/mm/ioremap.c                        |   3 +-
 arch/arm64/mm/proc.S                           |  10 +--
 arch/arm64/net/bpf_jit_comp.c                  |   7 --
 arch/arm64/tools/cpucaps                       |   3 +
 arch/xtensa/include/asm/syscall.h              |   1 -
 drivers/acpi/arm64/agdi.c                      | 101 ++++++++++++++++++++++---
 drivers/base/arch_topology.c                   |   9 ++-
 drivers/cpufreq/cpufreq.c                      |   6 ++
 drivers/perf/arm-cmn.c                         |  19 ++++-
 drivers/perf/arm_dsu_pmu.c                     |  37 +++++----
 drivers/perf/arm_spe_pmu.c                     |  18 +++--
 drivers/perf/cxl_pmu.c                         |   2 +-
 drivers/perf/riscv_pmu_sbi.c                   |   2 +-
 drivers/perf/starfive_starlink_pmu.c           |   3 +-
 include/linux/cpufreq.h                        |   5 ++
 include/uapi/linux/kvm.h                       |   3 +-
 tools/testing/selftests/arm64/Makefile         |   6 +-
 tools/testing/selftests/arm64/abi/hwcap.c      |  49 ++++++++++++
 tools/testing/selftests/arm64/abi/tpidr2.c     |   3 +-
 tools/testing/selftests/arm64/fp/fp-pidbench.S |   6 +-
 tools/testing/selftests/arm64/gcs/basic-gcs.c  |  40 ++++------
 tools/testing/selftests/arm64/mte/.gitignore   |   1 +
 58 files changed, 628 insertions(+), 214 deletions(-)

