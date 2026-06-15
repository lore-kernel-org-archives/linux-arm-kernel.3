Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3AC5CD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Jun 2026 10:08:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F5mhPLW4ZdNPvxUUikWDCohuS4wKK3L85IANCZH4ORI=; b=y8xCDLtoUMRYFTGx2HdX4FvAwF
	xpZG9OutOgM/hxsBygDoieT7jBkfQKvtF6uhxquq8P+fG8cc480eY0UGpRBzD9l14bvhmRukQqsIR
	ovH9TnF3XJulHTQWJRNN5E8jWvF2b7ESWId2GQEtrGwx8CymWcGUzvnsXssMGjF0ayxZJ60Pld7nb
	vBoMKuWvpRuW3E2g7Vx9VnvOmXvHkppLDFvK7ze7AT+SU8N3iLl7N6OKVPlvMU2JagBX6Nrarsl7q
	ISzVGlyJrfezgf9QPiUXeEznGPtUluKNTHXmVpktHev5BdsrNflgP3+Elfif15zw18BDnRjrSqe2+
	fK/doMDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4F4-0000000E1xh-20aB;
	Mon, 15 Jun 2026 10:08:30 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZ4F3-0000000E1xQ-4A1t
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Jun 2026 10:08:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 05BE96008A;
	Mon, 15 Jun 2026 10:08:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 612CA1F000E9;
	Mon, 15 Jun 2026 10:08:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781518108;
	bh=F5mhPLW4ZdNPvxUUikWDCohuS4wKK3L85IANCZH4ORI=;
	h=Date:From:To:Cc:Subject;
	b=brAZlogN6w8tgLFswqBYLEa6+AY8Hp337dA+REB8ZHngnm54P4r77cdl73LjYLgne
	 yMHa5tNItuXvk8aDaCP5v3KIRE12wqmVb79ENSdOc198XXaL04VWAPoq7FfALqbzV0
	 q7uk68fPuuecVBiry1RtiphO6kspHTCqPVSIqk2Kav/oxdhCGu6PskDeGennzLdzQ6
	 UooDevF2f1OnE9x9HxJBN8Fo+81hkXl024Hm1ttBL8vcAvSpnpo0DBs705+4nLlYj+
	 Z9f58DdU8jbOHOsmJ0hU9i3WkwgYZAshvbpLX2UzA0qyDVzyosyaSUBAKw/KGmz0X0
	 EwlJpwEWvqG8g==
Date: Mon, 15 Jun 2026 11:08:24 +0100
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	maz@kernel.org
Subject: [GIT PULL] arm64 updates for 7.2
Message-ID: <ai_PGPYpLyFr2Vyb@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
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

Please pull these arm64 updates for 7.2. The usual summary is in the
tag, although it feels like the new world of AI tooling has slowed us
down a little on the feature side when compared to the fixes side. The
extra rounds of Sashiko review have also pushed a few things out until
next time.

Still, there's some good foundational stuff here for the fpsimd code and
hardening work towards removing the predictable linear alias of the
kernel image.

There's a small conflict with an upstream fix that landed post -rc1 via
the KVM/arm64 tree (837263307489 ("KVM: arm64: Correctly cap ZCR_EL2
provided by a guest hypervisor")). My resolution is below.

Cheers,

Will

diff --cc arch/arm64/kvm/hyp/include/hyp/switch.h
index e9b36a3b27bb,1f12c4ba295a..000000000000
--- a/arch/arm64/kvm/hyp/include/hyp/switch.h
+++ b/arch/arm64/kvm/hyp/include/hyp/switch.h
@@@ -470,10 -466,9 +470,9 @@@ static inline void __hyp_sve_restore_gu
  	 * The vCPU's saved SVE state layout always matches the max VL of the
  	 * vCPU. Start off with the max VL so we can load the SVE state.
  	 */
 -	sve_cond_update_zcr_vq(vcpu_sve_max_vq(vcpu) - 1, SYS_ZCR_EL2);
 +	sve_cond_update_zcr_vq(zcr_el2, SYS_ZCR_EL2);
- 	__sve_restore_state(vcpu_sve_pffr(vcpu),
- 			    &vcpu->arch.ctxt.fp_regs.fpsr,
- 			    true);
+ 	sve_load_state(kern_hyp_va(vcpu->arch.sve_state), true);
+ 	fpsimd_load_common(&vcpu->arch.ctxt.fp_regs);
  
  	/*
  	 * The effective VL for a VM could differ from the max VL when running a

--->8

The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

for you to fetch changes up to 61c19a9feb1d87156e46e38d7759f3ad23710e24:

  Merge branch 'for-next/sysregs' into for-next/core (2026-06-14 12:18:27 +0100)

----------------------------------------------------------------
arm64 updates for 7.2

CPU errata handling:
- Extend CnP disabling workaround to HiSilicon HIP09 hardware.
- Work around eternally broken broadcast TLB invalidation on more CPUs.
- Documentation and code cleanups.

CPU features:
- Add new hwcaps for the 2025 dpISA extensions.

Floating point / SVE / SME:
- Significant cleanup to the low-level state management code in the core
  architecture code and KVM.
- Use correct register widths during SVE/SME save/restore assembly.
- Expose SVE/SME save/restore memory accesses to sanitisers.

Memory management:
- Preparatory work for unmapping the kernel data and bss sections from
  the linear map.

Miscellaneous:
- Inline DAIF manipulation helpers so they can be used safely from
  non-instrumentable code.
- Fix handling of the 'nosmp' cmdline option to avoid marking secondary
  cores as "possible".

MPAM:
- Add support for v0.1 of the MPAM architecture.

Perf:
- Update HiSilicon PMU MAINTAINERS entry.
- Fix event encodings for the DVM node in the CMN driver.

Selftests:
- Extend sigframe tests to cover POE context.
- Add coverage for the newly added 2025 dpISA hwcaps.

System registers:
- Add new registers and ESR encodings for the HDBSS feature.

Plus minor fixes and cleanups across the board.

----------------------------------------------------------------
Anshuman Khandual (2):
      arm64/mm: Replace BUG_ON() with VM_WARN_ON_ONCE()
      arm64/mm: Rename ptdesc_t

Ard Biesheuvel (20):
      arm64: mm: Remove bogus stop condition from map_mem() loop
      arm64: mm: Drop redundant pgd_t* argument from map_mem()
      arm64: mm: Check for pud_/pmd_set_huge() failures on kernel mappings
      arm64: mm: Preserve existing table mappings when mapping DRAM
      arm64: mm: Preserve non-contiguous descriptors when mapping DRAM
      arm64: mm: Permit contiguous descriptors to be manipulated
      arm64: kfence: Avoid NOMAP tricks when mapping the early pool
      arm64: mm: Permit contiguous attribute for preliminary mappings
      arm64: Move fixmap and kasan page tables to end of kernel image
      arm64: mm: Don't abuse memblock NOMAP to check for overlaps
      powerpc/code-patching: Avoid r/w mapping of the zero page
      sh: Drop cache flush of the zero page at boot
      mm: Make empty_zero_page[] const
      arm64: mm: Map the kernel data/bss read-only in the linear map
      arm64: mm: Unmap kernel data/bss entirely from the linear map
      arm64: Rename page table BSS section to .bss..pgtbl
      kasan: Move generic KASAN page tables out of BSS too
      arm64: Avoid double evaluation of __ptep_get()
      KVM: arm64: Omit tag sync on stage-2 mappings of the zero page
      arm64: mm: Defer remap of linear alias of data/bss

Breno Leitao (1):
      arm64: arch_timer: reuse arch_timer_read_cnt{p,v}ct_el0() helpers

Ethan Nelson-Moore (1):
      ARM64: remove unnecessary architecture-specific <asm/device.h>

Jonathan Cameron (1):
      MAINTAINERS: Update HiSilicon PMU driver maintainer to Yushan Wang

Kevin Brodsky (4):
      selftests/mm: Fix resv_sz when parsing arm64 signal frame
      kselftest/arm64: Add POE as a feature in the signal tests
      kselftest/arm64: Move/add POE helpers to test_signals_utils.h
      kselftest/arm64: Add tests for POR_EL0 save/reset/restore

Krzysztof Kozlowski (1):
      perf: qcom: Unify user-visible "Qualcomm" name

Leonardo Bras (1):
      arm64/daifflags: Make local_daif_*() helpers __always_inline

Marco Elver (1):
      arm64: Implement _THIS_IP_ using inline asm

Mark Brown (3):
      arm64/cpufeature: Define hwcaps for 2025 dpISA features
      kselftest/arm64: Add 2025 dpISA coverage to hwcaps
      arm64: Document SVE constraints on new hwcaps

Mark Rutland (23):
      arm64: fpsimd: Fix type mismatch in sve_{save,load}_state()
      arm64: fpsimd: Fix type mismatch in sme_{save,load}_state()
      KVM: arm64: Don't include <asm/fpsimdmacros.h>
      KVM: arm64: Don't override FFR save/restore argument
      KVM: arm64: pkvm: Save host FPMR in host cpu context
      KVM: arm64: pkvm: Remove struct cpu_sve_state
      arm64: fpsimd: Fold sve_init_regs() into do_sve_acc()
      arm64: fpsimd: Remove sve_set_vq() and sme_set_vq()
      arm64: fpsimd: Use assembler for SVE instructions
      arm64: fpsimd: Use assembler for baseline SME instructions
      arm64: fpsimd: Move sve_get_vl() and sme_get_vl() inline
      arm64: sysreg: Add FPCR and FPSR
      arm64: fpsimd: Split FPSR/FPCR from SVE save/restore
      arm64: fpsimd: Move fpsimd save/restore inline
      arm64: fpsimd: Use opaque type for SVE state
      arm64: fpsimd: Use opaque type for SME state
      arm64: fpsimd: Move SVE save/restore inline
      arm64: fpsimd: Move sve_flush_live() inline
      arm64: fpsimd: Move SME save/restore inline
      arm64: fpsimd: Remove <asm/fpsimdmacros.h>
      arm64: cputype: Add C1-Ultra definitions
      arm64: cputype: Add C1-Premium definitions
      arm64: errata: Mitigate TLBI errata on various Arm CPUs

Osama Abdelkader (1):
      arm64: panic from init_IRQ if IRQ handler stacks cannot be allocated

Pengjie Zhang (1):
      arm64: smp: Do not mark secondary CPUs possible under nosmp

Robin Murphy (2):
      arm64: errata: Reformat table for IDs
      perf/arm-cmn: Fix DVM node events

Shanker Donthineni (1):
      arm64: errata: Mitigate TLBI errata on NVIDIA Olympus CPU

Thorsten Blum (2):
      arm64: proton-pack: use sysfs_emit in sysfs show functions
      arm64: patching: replace min_t with min in __text_poke

Will Deacon (12):
      Revert "arm64: mm: Defer remap of linear alias of data/bss"
      Revert "arm64: mm: Unmap kernel data/bss entirely from the linear map"
      arm64: errata: Mitigate TLBI errata on Microsoft Azure Cobalt 100 CPU
      Merge branch 'for-next/cpufeature' into for-next/core
      Merge branch 'for-next/errata' into for-next/core
      Merge branch 'for-next/fpsimd-cleanups' into for-next/core
      Merge branch 'for-next/misc' into for-next/core
      Merge branch 'for-next/mm' into for-next/core
      Merge branch 'for-next/mpam' into for-next/core
      Merge branch 'for-next/perf' into for-next/core
      Merge branch 'for-next/selftests' into for-next/core
      Merge branch 'for-next/sysregs' into for-next/core

Zeng Heng (4):
      arm64: cpufeature: Add support for the MPAM v0.1 architecture version
      arm_mpam: Update architecture version check for MPAM MSC
      arm64: cpufeature: Add WORKAROUND_DISABLE_CNP capability
      arm64: kernel: Disable CNP on HiSilicon HIP09

eillon (1):
      arm64/sysreg: Add HDBSS related register information

 Documentation/arch/arm64/elf_hwcaps.rst            |  27 ++
 Documentation/arch/arm64/silicon-errata.rst        |  93 +++--
 MAINTAINERS                                        |   2 +-
 arch/arm64/Kconfig                                 |  63 ++++
 arch/arm64/include/asm/arch_timer.h                |  12 +-
 arch/arm64/include/asm/cpucaps.h                   |   4 +-
 arch/arm64/include/asm/cpufeature.h                |   7 +
 arch/arm64/include/asm/cputype.h                   |   4 +
 arch/arm64/include/asm/daifflags.h                 |  10 +-
 arch/arm64/include/asm/device.h                    |  14 -
 arch/arm64/include/asm/el2_setup.h                 |   4 +-
 arch/arm64/include/asm/esr.h                       |   2 +
 arch/arm64/include/asm/fpsimd.h                    | 386 +++++++++++++++++++--
 arch/arm64/include/asm/fpsimdmacros.h              | 357 -------------------
 arch/arm64/include/asm/io.h                        |   2 +-
 arch/arm64/include/asm/kvm_host.h                  |  27 +-
 arch/arm64/include/asm/kvm_hyp.h                   |   5 -
 arch/arm64/include/asm/kvm_pkvm.h                  |   3 +-
 arch/arm64/include/asm/linkage.h                   |   4 +
 arch/arm64/include/asm/pgtable-types.h             |  14 +-
 arch/arm64/include/asm/pgtable.h                   |   4 +-
 arch/arm64/include/asm/processor.h                 |   7 +-
 arch/arm64/include/asm/ptdump.h                    |   8 +-
 arch/arm64/include/asm/tlbflush.h                  |   4 +-
 arch/arm64/include/uapi/asm/hwcap.h                |   8 +
 arch/arm64/kernel/Makefile                         |   2 +-
 arch/arm64/kernel/cpu_errata.c                     |  55 ++-
 arch/arm64/kernel/cpufeature.c                     |  28 +-
 arch/arm64/kernel/cpuinfo.c                        |   8 +
 arch/arm64/kernel/efi.c                            |   4 +-
 arch/arm64/kernel/entry-common.c                   |   8 +-
 arch/arm64/kernel/entry-fpsimd.S                   | 134 -------
 arch/arm64/kernel/fpsimd.c                         |  90 +++--
 arch/arm64/kernel/irq.c                            |  29 +-
 arch/arm64/kernel/patching.c                       |   3 +-
 arch/arm64/kernel/pi/map_kernel.c                  |   2 +-
 arch/arm64/kernel/pi/map_range.c                   |   4 +-
 arch/arm64/kernel/pi/pi.h                          |   2 +-
 arch/arm64/kernel/proton-pack.c                    |  17 +-
 arch/arm64/kernel/smp.c                            |  14 +-
 arch/arm64/kernel/vmlinux.lds.S                    |   8 +-
 arch/arm64/kvm/arm.c                               |  16 +-
 arch/arm64/kvm/guest.c                             |   4 +-
 arch/arm64/kvm/hyp/entry.S                         |   1 -
 arch/arm64/kvm/hyp/fpsimd.S                        |  33 --
 arch/arm64/kvm/hyp/include/hyp/switch.h            |  23 +-
 arch/arm64/kvm/hyp/nvhe/Makefile                   |   2 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c                 |  20 +-
 arch/arm64/kvm/hyp/nvhe/setup.c                    |   4 +-
 arch/arm64/kvm/hyp/vhe/Makefile                    |   2 +-
 arch/arm64/kvm/mmu.c                               |   5 +
 arch/arm64/mm/fixmap.c                             |   6 +-
 arch/arm64/mm/kasan_init.c                         |   2 +-
 arch/arm64/mm/mmap.c                               |   4 +-
 arch/arm64/mm/mmu.c                                | 145 ++++----
 arch/arm64/mm/pageattr.c                           |   2 +-
 arch/arm64/mm/ptdump.c                             |   2 +-
 arch/arm64/tools/cpucaps                           |   2 +-
 arch/arm64/tools/sysreg                            |  74 ++++
 arch/powerpc/lib/code-patching.c                   |  52 +--
 arch/sh/mm/init.c                                  |   3 -
 drivers/perf/Kconfig                               |   4 +-
 drivers/perf/arm-cmn.c                             |  23 +-
 drivers/resctrl/mpam_devices.c                     |  23 +-
 include/linux/linkage.h                            |   4 +
 include/linux/pgtable.h                            |   2 +-
 mm/kasan/init.c                                    |  10 +-
 mm/mm_init.c                                       |   2 +-
 tools/testing/selftests/arm64/abi/hwcap.c          | 116 +++++++
 .../testing/selftests/arm64/signal/test_signals.h  |   2 +
 .../selftests/arm64/signal/test_signals_utils.c    |   3 +
 .../selftests/arm64/signal/test_signals_utils.h    |  16 +
 .../signal/testcases/poe_missing_poe_context.c     |  73 ++++
 .../selftests/arm64/signal/testcases/poe_restore.c |  64 ++++
 .../selftests/arm64/signal/testcases/poe_siginfo.c |  15 -
 tools/testing/selftests/mm/pkey-arm64.h            |   3 +-
 76 files changed, 1275 insertions(+), 966 deletions(-)
 delete mode 100644 arch/arm64/include/asm/device.h
 delete mode 100644 arch/arm64/include/asm/fpsimdmacros.h
 delete mode 100644 arch/arm64/kernel/entry-fpsimd.S
 delete mode 100644 arch/arm64/kvm/hyp/fpsimd.S
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_missing_poe_context.c
 create mode 100644 tools/testing/selftests/arm64/signal/testcases/poe_restore.c

