Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 36213C0218A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jan 2025 11:03:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=ZCYLt5QPZu/J5sgT5t/Y44A2C6OiQI1XEqoCj5r4Cz8=; b=FIZdbVD+8selGQmg7WHI/5lQNs
	59+b3r6C/XziFyNseH1dgoPWf0EWnyN/BW2bSj3hsgLQsMECj7LoKAlrh/XeUVf5Q0SGUDvnJ7Dyh
	nEsC8TqU/p9tatMQLQo81Jkdd+Fze1p3JWO9+t5AiAMOZXh7smvgElSnJmocDYZVbw0wExgOSXx98
	XysTytB40+Q31sG7H+DI+8reQFgRB36TIyAioingekaE7erlvCAXvX7FRACOLR7s1bCGrjxqeMvZ1
	rAZN7uBBjdJvLl7wYCCv1vNB8kER7u26CmJbIfUi3u2/FlSnlAcfr9+bKm4XxpAftcJXHLkzeAqU0
	5AjDi7cA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjNK-00000004ien-3LG7;
	Tue, 28 Jan 2025 11:03:22 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcjLz-00000004ibO-1GbZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jan 2025 11:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2E5C2A40C8B;
	Tue, 28 Jan 2025 11:00:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38EE3C4CED3;
	Tue, 28 Jan 2025 11:01:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738062117;
	bh=4pVISNlz73OSboBzCap102vBF7tI6SuvQtDCVQIHueI=;
	h=Date:From:To:Cc:Subject:From;
	b=PLscV3G2VQ9e9E5uIDGmrRoCfAVeR/ZSgQ5o/meIjYoNbI/YqVr6HK6XgAw87BxBV
	 kG2rbzAG+8o6zOLguCRc89m94dIBBs4vUhCyFP1W9YjKwDmyVHEXL/HABKHo3wvIfZ
	 Hn5SmkwqbKQw40NP61WEM0BDi/qI02NeHzgAI9oZXp4z9pZ4XiOPvR3jExSsXiYdx1
	 9iTvJQHniD+1jfVwJky2BNX/HMStnsVU8ixvd3roHhslYqqUoBktKqxKaAHWMsck03
	 XFp247BA/g7SMvAPJW53WgrLtON7GkSe8hEmqRGBjV1Z2vp3seO+p3980Sm+K6HcXU
	 8KQ5tbL5RLkhw==
Date: Tue, 28 Jan 2025 11:01:52 +0000
From: Will Deacon <will@kernel.org>
To: torvalds@linux-foundation.org
Cc: catalin.marinas@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, kernel-team@android.com,
	maz@kernel.org, oliver.upton@linux.dev, pbonzini@redhat.com
Subject: [GIT PULL] KVM/arm64 updates for 6.14
Message-ID: <20250128110151.GA26808@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
User-Agent: Mutt/1.10.1 (2018-07-13)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250128_030159_483441_E5D96700 
X-CRM114-Status: GOOD (  24.81  )
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

Hi Linus, [+Paolo, Marc and Oliver]

We've had a slight hiccup with the KVM/arm64 tree targetting 6.14 in
that Paolo mistakenly forgot to include it in his KVM pull request [1].
I understood Paolo was planning to send a follow-up pull request to you
yesterday but, as that didn't materialise, I thought I'd better send it
via arm64 given where we are in the merge window.

Paolo -- if you'd prefer this to go via your tree, then please feel free
to send a separate pull request to replace this one! I'm just making
sure that we don't miss the boat for 6.14 as there's a reasonable amount
of code here and we're already into the second week of the merge window.

Despite the rocky journey, the patches have all been in -next. All I've
done is sign the top commit of Marc's branch with a new tag using his
summary. On the dependency front, the branch merges for-next/cpufeature
from arm64 and kvmarm-fixes-6.13-3, both of which you have already
merged separately.

Marc's original pull request is available at [2] if you'd prefer to take
that directly (but please note that the diff stat is slightly different
from what I have here due to me using the "histogram" algorithm and Marc
using whatever is the default).

Cheers,

Will

[1] https://lore.kernel.org/all/87plkbt185.wl-maz@kernel.org/
[2] https://lore.kernel.org/all/20250117115208.1616503-1-maz@kernel.org/

--->8

The following changes since commit 78d4f34e2115b517bcbfe7ec0d018bbbb6f9b0b8:

  Linux 6.13-rc3 (2024-12-15 15:58:23 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/arm64/linux.git tags/arm64-upstream

for you to fetch changes up to 01009b06a6b52d8439c55b530633a971c13b6cb2:

  arm64/sysreg: Get rid of TRFCR_ELx SysregFields (2025-01-17 11:07:55 +0000)

----------------------------------------------------------------
KVM/arm64 updates for 6.14

* New features:

  - Support for non-protected guest in protected mode, achieving near
    feature parity with the non-protected mode

  - Support for the EL2 timers as part of the ongoing NV support

  - Allow control of hardware tracing for nVHE/hVHE

* Improvements, fixes and cleanups:

  - Massive cleanup of the debug infrastructure, making it a bit less
    awkward and definitely easier to maintain. This should pave the
    way for further optimisations

  - Complete rewrite of pKVM's fixed-feature infrastructure, aligning
    it with the rest of KVM and making the code easier to follow

  - Large simplification of pKVM's memory protection infrastructure

  - Better handling of RES0/RES1 fields for memory-backed system
    registers

  - Add a workaround for Qualcomm's Snapdragon X CPUs, which suffer
    from a pretty nasty timer bug

  - Small collection of cleanups and low-impact fixes

----------------------------------------------------------------
Fuad Tabba (16):
      KVM: arm64: Group setting traps for protected VMs by control register
      KVM: arm64: Move checking protected vcpu features to a separate function
      KVM: arm64: Remove KVM_ARM_VCPU_POWER_OFF from protected VMs allowed features in pKVM
      KVM: arm64: Use KVM extension checks for allowed protected VM capabilities
      KVM: arm64: Initialize feature id registers for protected VMs
      KVM: arm64: Fix RAS trapping in pKVM for protected VMs
      KVM: arm64: Set protected VM traps based on its view of feature registers
      KVM: arm64: Rework specifying restricted features for protected VMs
      KVM: arm64: Remove fixed_config.h header
      KVM: arm64: Remove redundant setting of HCR_EL2 trap bit
      KVM: arm64: Calculate cptr_el2 traps on activating traps
      KVM: arm64: Refactor kvm_reset_cptr_el2()
      KVM: arm64: Fix the value of the CPTR_EL2 RES1 bitmask for nVHE
      KVM: arm64: Remove PtrAuth guest vcpu flag
      KVM: arm64: Convert the SVE guest vcpu flag to a vm flag
      KVM: arm64: Use kvm_vcpu_has_feature() directly for struct kvm

Hardevsinh Palaniya (1):
      arm64/cpufeature: Refactor conditional logic in init_cpu_ftr_reg()

James Clark (6):
      tools: arm64: Update sysreg.h header files
      arm64/sysreg/tools: Move TRFCR definitions to sysreg
      coresight: trbe: Remove redundant disable call
      KVM: arm64: coresight: Give TRBE enabled state to KVM
      KVM: arm64: Support trace filtering for guests
      coresight: Pass guest TRFCR value to KVM

Kalesh Singh (1):
      arm64: kvm: Introduce nvhe stack size constants

Marc Zyngier (35):
      arm64/sysreg: Allow a 'Mapping' descriptor for system registers
      arm64/sysreg: Get rid of the TCR2_EL1x SysregFields
      arm64/sysreg: Convert *_EL12 accessors to Mapping
      arm64/sysreg: Get rid of CPACR_ELx SysregFields
      KVM: arm64: Manage software step state at load/put
      KVM: arm64: Introduce __pkvm_vcpu_{load,put}()
      KVM: arm64: Consolidate allowed and restricted VM feature checks
      KVM: arm64: nv: Advertise the lack of AArch32 EL0 support
      KVM: arm64: nv: Add handling of EL2-specific timer registers
      KVM: arm64: nv: Sync nested timer state with FEAT_NV2
      KVM: arm64: nv: Publish emulated timer interrupt state in the in-memory state
      KVM: arm64: nv: Use FEAT_ECV to trap access to EL0 timers
      KVM: arm64: nv: Accelerate EL0 timer read accesses when FEAT_ECV in use
      KVM: arm64: nv: Accelerate EL0 counter accesses from hypervisor context
      KVM: arm64: Handle counter access early in non-HYP context
      KVM: arm64: nv: Add trap routing for CNTHCTL_EL2.EL1{NVPCT,NVVCT,TVT,TVCT}
      KVM: arm64: nv: Propagate CNTHCTL_EL2.EL1NV{P,V}CT bits
      KVM: arm64: nv: Sanitise CNTHCTL_EL2
      KVM: arm64: Work around x1e's CNTVOFF_EL2 bogosity
      KVM: arm64: nv: Document EL2 timer API
      Merge remote-tracking branch 'arm64/for-next/cpufeature' into kvm-arm64/pkvm-fixed-features-6.14
      Merge branch kvm-arm64/debug-6.14 into kvmarm-master/next
      Merge branch kvm-arm64/pkvm-np-guest into kvmarm-master/next
      Merge branch kvm-arm64/pkvm-fixed-features-6.14 into kvmarm-master/next
      Merge branch 'kvmarm-fixes-6.13-3'
      KVM: arm64: Fix selftests after sysreg field name update
      KVM: arm64: nv: Always evaluate HCR_EL2 using sanitising accessors
      KVM: arm64: nv: Apply RESx settings to sysreg reset values
      KVM: arm64: nv: Fix doc header layout for timers
      Merge branch kvm-arm64/nv-timers into kvmarm-master/next
      Merge branch kvm-arm64/pkvm-memshare-declutter into kvmarm-master/next
      Merge branch kvm-arm64/coresight-6.14 into kvmarm-master/next
      Merge branch kvm-arm64/nv-resx-fixes-6.14 into kvmarm-master/next
      Merge branch kvm-arm64/misc-6.14 into kvmarm-master/next
      arm64/sysreg: Get rid of TRFCR_ELx SysregFields

Mark Brown (1):
      KVM: arm64: Fix set_id_regs selftest for ASIDBITS becoming unwritable

Mark Rutland (2):
      arm64: cpufeature: Add HAFT to cpucap_is_possible()
      KVM: arm64: Explicitly handle BRBE traps as UNDEFINED

Mostafa Saleh (1):
      Documentation: Update the behaviour of "kvm-arm.mode"

Oliver Upton (22):
      KVM: arm64: Add unified helper for reprogramming counters by mask
      KVM: arm64: Use KVM_REQ_RELOAD_PMU to handle PMCR_EL0.E change
      KVM: arm64: nv: Reload PMU events upon MDCR_EL2.HPME change
      KVM: arm64: Only apply PMCR_EL0.P to the guest range of counters
      KVM: arm64: Drop MDSCR_EL1_DEBUG_MASK
      KVM: arm64: Get rid of __kvm_get_mdcr_el2() and related warts
      KVM: arm64: Track presence of SPE/TRBE in kvm_host_data instead of vCPU
      KVM: arm64: Move host SME/SVE tracking flags to host data
      KVM: arm64: Write MDCR_EL2 directly from kvm_arm_setup_mdcr_el2()
      KVM: arm64: Evaluate debug owner at vcpu_load()
      KVM: arm64: Clean up KVM_SET_GUEST_DEBUG handler
      KVM: arm64: Select debug state to save/restore based on debug owner
      KVM: arm64: Remove debug tracepoints
      KVM: arm64: Remove vestiges of debug_ptr
      KVM: arm64: Use debug_owner to track if debug regs need save/restore
      KVM: arm64: Reload vCPU for accesses to OSLAR_EL1
      KVM: arm64: Compute MDCR_EL2 at vcpu_load()
      KVM: arm64: Don't hijack guest context MDSCR_EL1
      KVM: arm64: nv: Honor MDCR_EL2.TDE routing for debug exceptions
      KVM: arm64: Avoid reading ID_AA64DFR0_EL1 for debug save/restore
      KVM: arm64: Fold DBGxVR/DBGxCR accessors into common set
      KVM: arm64: Promote guest ownership for DBGxVR/DBGxCR reads

Quentin Perret (21):
      KVM: arm64: Always check the state from hyp_ack_unshare()
      KVM: arm64: Change the layout of enum pkvm_page_state
      KVM: arm64: Move enum pkvm_page_state to memory.h
      KVM: arm64: Make hyp_page::order a u8
      KVM: arm64: Move host page ownership tracking to the hyp vmemmap
      KVM: arm64: Pass walk flags to kvm_pgtable_stage2_mkyoung
      KVM: arm64: Pass walk flags to kvm_pgtable_stage2_relax_perms
      KVM: arm64: Make kvm_pgtable_stage2_init() a static inline function
      KVM: arm64: Add {get,put}_pkvm_hyp_vm() helpers
      KVM: arm64: Introduce __pkvm_host_share_guest()
      KVM: arm64: Introduce __pkvm_host_unshare_guest()
      KVM: arm64: Introduce __pkvm_host_relax_guest_perms()
      KVM: arm64: Introduce __pkvm_host_wrprotect_guest()
      KVM: arm64: Introduce __pkvm_host_test_clear_young_guest()
      KVM: arm64: Introduce __pkvm_host_mkyoung_guest()
      KVM: arm64: Introduce __pkvm_tlb_flush_vmid()
      KVM: arm64: Introduce the EL1 pKVM MMU
      KVM: arm64: Plumb the pKVM MMU in KVM
      KVM: arm64: Drop pkvm_mem_transition for FF-A
      KVM: arm64: Drop pkvm_mem_transition for host/hyp sharing
      KVM: arm64: Drop pkvm_mem_transition for host/hyp donations

Thorsten Blum (1):
      KVM: arm64: vgic: Use str_enabled_disabled() in vgic_v3_probe()

Vincent Donnefort (1):
      KVM: arm64: Fix nVHE stacktrace VA bits mask

Vladimir Murzin (1):
      KVM: arm64: Fix FEAT_MTE in pKVM

 Documentation/admin-guide/kernel-parameters.txt    |  16 +-
 Documentation/virt/kvm/devices/vcpu.rst            |  14 +-
 arch/arm64/include/asm/cpucaps.h                   |   2 +
 arch/arm64/include/asm/cpufeature.h                |   3 +-
 arch/arm64/include/asm/cputype.h                   |   2 +
 arch/arm64/include/asm/el2_setup.h                 |   6 +-
 arch/arm64/include/asm/kvm_arm.h                   |   4 +-
 arch/arm64/include/asm/kvm_asm.h                   |  14 +-
 arch/arm64/include/asm/kvm_emulate.h               | 107 ++-
 arch/arm64/include/asm/kvm_host.h                  | 134 +--
 arch/arm64/include/asm/kvm_mmu.h                   |  18 +
 arch/arm64/include/asm/kvm_nested.h                |  11 +-
 arch/arm64/include/asm/kvm_pgtable.h               |  36 +-
 arch/arm64/include/asm/kvm_pkvm.h                  |  51 ++
 arch/arm64/include/asm/memory.h                    |   5 +-
 arch/arm64/include/asm/stacktrace/nvhe.h           |   2 +-
 arch/arm64/include/asm/sysreg.h                    |  16 +-
 arch/arm64/kernel/cpu_errata.c                     |   8 +
 arch/arm64/kernel/cpufeature.c                     |  17 +-
 arch/arm64/kernel/image-vars.h                     |   3 +
 arch/arm64/kvm/arch_timer.c                        | 179 +++-
 arch/arm64/kvm/arm.c                               |  86 +-
 arch/arm64/kvm/at.c                                |   6 +-
 arch/arm64/kvm/debug.c                             | 476 +++++------
 arch/arm64/kvm/emulate-nested.c                    |  83 +-
 arch/arm64/kvm/fpsimd.c                            |  14 +-
 arch/arm64/kvm/guest.c                             |  31 +-
 arch/arm64/kvm/handle_exit.c                       |   5 +-
 arch/arm64/kvm/hyp/include/hyp/debug-sr.h          |  42 +-
 arch/arm64/kvm/hyp/include/hyp/switch.h            |  43 +-
 arch/arm64/kvm/hyp/include/hyp/sysreg-sr.h         |  43 +-
 arch/arm64/kvm/hyp/include/nvhe/fixed_config.h     | 223 -----
 arch/arm64/kvm/hyp/include/nvhe/gfp.h              |   6 +-
 arch/arm64/kvm/hyp/include/nvhe/mem_protect.h      |  39 +-
 arch/arm64/kvm/hyp/include/nvhe/memory.h           |  50 +-
 arch/arm64/kvm/hyp/include/nvhe/pkvm.h             |  23 +
 arch/arm64/kvm/hyp/nvhe/debug-sr.c                 |  74 +-
 arch/arm64/kvm/hyp/nvhe/host.S                     |   4 +-
 arch/arm64/kvm/hyp/nvhe/hyp-main.c                 | 213 ++++-
 arch/arm64/kvm/hyp/nvhe/mem_protect.c              | 943 ++++++++-------------
 arch/arm64/kvm/hyp/nvhe/mm.c                       |  12 +-
 arch/arm64/kvm/hyp/nvhe/page_alloc.c               |  14 +-
 arch/arm64/kvm/hyp/nvhe/pkvm.c                     | 436 +++++-----
 arch/arm64/kvm/hyp/nvhe/setup.c                    |   8 +-
 arch/arm64/kvm/hyp/nvhe/stacktrace.c               |   4 +-
 arch/arm64/kvm/hyp/nvhe/switch.c                   |  54 +-
 arch/arm64/kvm/hyp/nvhe/sys_regs.c                 | 450 +++++-----
 arch/arm64/kvm/hyp/nvhe/timer-sr.c                 |  16 +-
 arch/arm64/kvm/hyp/pgtable.c                       |  13 +-
 arch/arm64/kvm/hyp/vhe/debug-sr.c                  |   5 -
 arch/arm64/kvm/hyp/vhe/switch.c                    | 123 ++-
 arch/arm64/kvm/hyp/vhe/sysreg-sr.c                 |   4 +-
 arch/arm64/kvm/mmu.c                               | 108 ++-
 arch/arm64/kvm/nested.c                            |  38 +-
 arch/arm64/kvm/pkvm.c                              | 201 +++++
 arch/arm64/kvm/pmu-emul.c                          |  91 +-
 arch/arm64/kvm/reset.c                             |   6 +-
 arch/arm64/kvm/stacktrace.c                        |   9 +-
 arch/arm64/kvm/sys_regs.c                          | 457 +++++-----
 arch/arm64/kvm/trace_handle_exit.h                 |  75 --
 arch/arm64/kvm/vgic/vgic-v3.c                      |  11 +-
 arch/arm64/mm/proc.S                               |   5 +-
 arch/arm64/tools/cpucaps                           |   1 +
 arch/arm64/tools/gen-sysreg.awk                    |   2 +-
 arch/arm64/tools/sysreg                            |  76 +-
 drivers/hwtracing/coresight/coresight-etm4x-core.c |  55 +-
 .../hwtracing/coresight/coresight-etm4x-sysfs.c    |  10 +-
 drivers/hwtracing/coresight/coresight-etm4x.h      |   2 +-
 drivers/hwtracing/coresight/coresight-priv.h       |   3 +
 .../coresight/coresight-self-hosted-trace.h        |   9 -
 drivers/hwtracing/coresight/coresight-trbe.c       |  15 +-
 include/clocksource/arm_arch_timer.h               |   6 +
 include/kvm/arm_arch_timer.h                       |  23 +
 include/kvm/arm_pmu.h                              |   6 +-
 tools/arch/arm64/include/asm/sysreg.h              | 410 ++++++++-
 tools/include/linux/kasan-tags.h                   |  15 +
 .../selftests/kvm/aarch64/aarch32_id_regs.c        |   2 +-
 tools/testing/selftests/kvm/aarch64/set_id_regs.c  |   3 +-
 78 files changed, 3358 insertions(+), 2472 deletions(-)
 delete mode 100644 arch/arm64/kvm/hyp/include/nvhe/fixed_config.h
 create mode 100644 tools/include/linux/kasan-tags.h

