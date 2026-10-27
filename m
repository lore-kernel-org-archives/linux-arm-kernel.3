Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A30F606A31B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Oct 2026 06:40:01 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=3gh5Wi3/;
	dkim=pass (1024-bit key, unprotected) header.d=huawei.com header.i=@huawei.com header.a=rsa-sha256 header.s=dkim header.b=SZ6Lv6Ch
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Unsubscribe-Post:
	List-Owner; bh=ubV9T/p3p09v1aW9m2UTH9RT+mpGP1q+J2qSPL1yDAc=; b=3gh5Wi3/PgIaPB
	/DoZEpc/tmNqiW9pzFuBF8fiSdNo/BRWwRjQ5o28gn22DUx8ThRjdKnWqzYnuEqcnhQ0au2LbRhIQ
	GRvh0shIqmzMYqGcO+sZ0K3FKic8fTLt5OG1rgrxTIY9yDf/7CGCbVW2yXGyljct4YlNVqygkpvoh
	gzKEF8doDqPUSSVyUPdw7i92n4LsQZrB/z2EFN0RcGBUsBX5qpOH8GRN+9Z5WdixOOxusqtHr2RYj
	RqjXvXSSZl6R1uu1OTuce27cRBffXrRxzP4OFhB244XEurvdNtLvAeff/n17eDCfDrh+1W2Gy3tjp
	5cDVhMAZhihd8qYTFkZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLaqf-00000003r8p-2vJe;
	Tue, 27 Oct 2026 06:39:53 +0000
Received: from canpmsgout05.his.huawei.com ([113.46.200.220])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xLaqb-00000003r8R-0iaf
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Oct 2026 06:39:51 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=ubV9T/p3p09v1aW9m2UTH9RT+mpGP1q+J2qSPL1yDAc=;
	b=SZ6Lv6ChdC6JutMf4geZWBrDMWpzR1ZlzRxZ9+UCJgaK2FC/2lgnvnXGTXd8grSzqDibKUyU5
	JFCE89xrfQY+JLbZbNpWyKLRZu9L1og/wJmt10f1IFHwQgRz1rZujmgFctHhyABw6ofZsTxLI5s
	3iyEyCKg27LqoyuHJ319Q5A=
Received: from mail.maildlp.com (unknown [172.19.162.140])
	by canpmsgout05.his.huawei.com (SkyGuard) with ESMTPS id 4jDLSx30s6z12LGd;
	Tue, 27 Oct 2026 14:39:45 +0800 (CST)
Received: from kwepemk200008.china.huawei.com (unknown [7.202.194.74])
	by mail.maildlp.com (Postfix) with ESMTPS id D87C3202E6;
	Tue, 27 Oct 2026 14:39:40 +0800 (CST)
Received: from [10.67.110.68] (10.67.110.68) by kwepemk200008.china.huawei.com
 (7.202.194.74) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.45; Tue, 27 Oct
 2026 14:39:40 +0800
Message-ID: <2cac69ba-bab1-4c23-9b5c-46f98b5c1df8@huawei.com>
Date: Tue, 27 Oct 2026 14:39:39 +0800
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 00/38] arm64: Add support for FEAT_NMI
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
CC: <catalin.marinas@arm.com>, <will@kernel.org>, <mark.rutland@arm.com>,
	<maz@kernel.org>, <lpieralisi@kernel.org>, <liaochang1@huawei.com>
References: <20260914102102.68597-1-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260914102102.68597-1-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 8bit
X-ClientProxiedBy: kwepems500002.china.huawei.com (7.221.188.17) To
 kwepemk200008.china.huawei.com (7.202.194.74)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261026_233949_839285_67194F6F 
X-CRM114-Status: GOOD (  31.98  )
X-Spam-Score: -2.1 (--)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-22.7 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,MENTIONS_GIT_HOSTING,SPF_HELO_NONE,SPF_PASS,
	USER_AGENT_SANE_1 autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1



在 2026/9/14 18:20, Vladimir Murzin 写道:
> FEAT_NMI provides an architected mechanism for supporting non-maskable
> interrupts (NMIs) and less-masked interrupts (LMIs).
> 
> Since we already support pseudo-NMIs via priority masking, introducing
> another flavour of NMI on top of the existing infrastructure could
> easily become messy, making the code harder to follow and reason
> about.
> 
> To avoid that, this series first makes room for the new NMI "tenant"
> by restructuring the existing exception masking logic (patches 01/38 -
> 15/38)
> 
> The main idea is to separate the logical view of exception state from
> its hardware representation. To achieve this, we introduce logical
> exception contexts that can be mapped onto the corresponding hardware
> state. This naturally consolidates the hardware-specific handling into
> a small number of places, while allowing the rest of the code to
> operate purely in terms of logical exception contexts.
> 
> Since this restructuring is non-trivial and carries a risk of subtle
> behavioural changes, the series adds extensive debug checks to verify
> that the hardware state always matches the expected logical state.
> 
> With this restructuring in place, wiring FEAT_NMI into the new
> framework becomes much more manageable (pathes 16/38 - 32/38). GIC
> support for NMI is build on top (pathes 33/38 - 38/38)
> 
> This work would not have been possible without the contributions of
> Ada Couprie Diaz, Mark Brown, and Lorenzo Pieralisi - please credit
> them for everything that works well. Any remaining bugs or issues are
> entirely my own.
> 
> Although I droped RFC tag, I'd still appreciate feedback on the
> overall approach.
> 
> Most of the testing has been done on QEMU, Fast Model and pre-silicon
> environment, so the series definitely benefit from extensive testing
> on real hardware (without NMI, with pseudo-NMI, and with FEAT_NMI).

Hi Vladimir,

I used my LLM to generate some testcases and tested it
on QEMU 11.1.50 (arm64 virt, TCG) and all pass, no warnings:

1. Three modes: no NMI, pseudo-NMI and FEAT_NMI on GICv2/v3/v4/v5

2. CPU/GIC support mismatches: NMI falls back to a normal IRQ, or is
ignored.

3. NMI delivered while IRQs are off; broadcast, perf and hardlockup stress.

4. ALLINT masking, kprobe rejection of ALLINT instructions, hotplug,
suspend, ACPI/EFI runtime.

5. Panic stop via IPI_CPU_STOP_NMI;

6. ARM64_NMI=n and PSEUDO_NMI=n builds.

The testcase is avalible at:
	https://github.com/ruanjinjie-eng/feat_nmi_tests

I will find a real hardware to test them later.

Tested-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> Changelog
>   RFC v2 -> v1
> 
>     - Rebased on v7.3-rc3.
>     - Dropped RFC tag, have not received objections, at the same time
>       got support from Jinjie
>     - Dropped prerequisite patches already present in the newer base
>     - Added logic to reject probing/stepping over ALLINT
>     - Moved addition of arm64_debug_exc_context() in separate patch
>     - Reworked debug logic for validating direction of exception
>       transition
>     - Split support for NMI in GICv5 in 3 separate patches
>     - Added review tags
> 
>   RFC v1 -> RFC v2
> 
>     - Rebased on v7.2-rc5.
>     - Improved commit descriptions.
>     - Split some patches into smaller ones.
>     - Added a graceful fallback for IPI requests when FEAT_NMI is
>       supported by the CPU but unsupported by the interrupt
>       controller.
>     - Split the GICv3 preparation from the FEAT_GICv3_NMI
>       implementation.
>     - Added NMI support to GICv5, primarily as an illustration of the
>       implementation, although it also happens to work on Fast Model.
>     - Added review tags only to unchanged patches. Review tags were
>       intentionally dropped from modified patches to reflect those
>       changes and encourage re-review.
> 
> RFC v1:
>   https://lore.kernel.org/linux-arm-kernel/20260709121333.23507-1-vladimir.murzin@arm.com/
> 
> RFC v2:
>   https://lore.kernel.org/linux-arm-kernel/20260727163453.7969-1-vladimir.murzin@arm.com/
> 
> Thanks!
> Vladimir
> 
> Ada Couprie Diaz (15):
>   arm64: irqflags: Introduce arm64-specific irqflags type
>   arm64: irqflags: save and use both DAIF and PMR
>   arm64: interrupts: Add common exception state helpers
>   arm64: entry: Introduce entry specific exception masking helpers
>   arm64: entry: replace DAIF helpers with entry helpers
>   arm64: interrupts: Introduce exception masking save/restore helpers
>   arm64: interrupts: introduce a helper for GIC priority initialization
>   arm64: replace local_daif helpers
>   arm64: cpuidle: use new helpers to bypass interrupt priority masking
>   arm64: remove daifflags.h
>   arm64: gicv3: remove GIC_PRIO_PSR_I_SET
>   arm64: ptrace: Add PSR_ALLINT_BIT
>   arm64: cpufeature: Detect PE support for FEAT_NMI
>   arm64: nmi: Manage masking for superpriority interrupts
>   arm64: irq: Report FEAT_NMI masking local IRQs
> 
> Lorenzo Pieralisi (2):
>   irqchip/gic-v3: Rename nmi to pseudo_nmi
>   irqchip/gic-v3: Implement FEAT_GICv3_NMI support
> 
> Mark Brown (5):
>   arm64: booting: Document boot requirements for FEAT_NMI
>   arm64: sysreg: Add definitions for immediate versions of MSR ALLINT
>   arm64: idreg: Add an override for FEAT_NMI
>   arm64: nmi: Add handling of superpriority interrupts as NMIs
>   arm64: nmi: Add Kconfig for NMI
> 
> Vladimir Murzin (16):
>   arm64: process: Lift check for exception state to generic
>     infrastructure
>   arm64: cpufeature: Remove system_has_prio_mask_debugging()
>   arm64: irqflags: Switch to CONFIG_DEBUG_IRQFLAGS
>   arm64: Kconfig: Remove CONFIG_ARM64_DEBUG_PRIORITY_MASKING
>   efi/runtime-wrappers: Permit architectures to override IRQ flags
>     checks
>   arm64/efi: Implement override for IRQ flags checks
>   arm64: probes: Reject stepping over ALLINT
>   arm64: suspend: Always initialise PSTATE.ALLINT
>   arm64/efi: Add ALLINT to IRQ flags checks
>   arm64: kprobes: Disable NMIs
>   arm64: smp: Abstract SGI and LPI operations
>   arm64: smp: Fall back to IRQ when IPI NMI request fails
>   arm64: smp: Add NMI support for LPI-backed IPIs
>   genirq: Trust local irqchip when considering IRQ for NMI
>   genirq: Do not call add_interrupt_randomness() in NMI context
>   irqchip/gic-v5: Add NMI support
> 
>  Documentation/arch/arm64/booting.rst          |   6 +
>  arch/arm64/Kconfig                            |  29 +-
>  arch/arm64/include/asm/assembler.h            |  20 +-
>  arch/arm64/include/asm/cpucaps.h              |   2 +
>  arch/arm64/include/asm/cpufeature.h           |  14 +-
>  arch/arm64/include/asm/cpuidle.h              |  18 +-
>  arch/arm64/include/asm/daifflags.h            | 144 --------
>  arch/arm64/include/asm/efi.h                  |  42 ++-
>  arch/arm64/include/asm/entry-common.h         |   8 +-
>  arch/arm64/include/asm/insn.h                 |   1 +
>  .../include/asm/interrupts/common_flags.h     | 256 +++++++++++++
>  arch/arm64/include/asm/interrupts/entry.h     | 102 ++++++
>  arch/arm64/include/asm/interrupts/masking.h   | 166 +++++++++
>  arch/arm64/include/asm/irqflags.h             | 150 ++++----
>  arch/arm64/include/asm/kvm_host.h             |   1 -
>  arch/arm64/include/asm/mmu_context.h          |   1 -
>  arch/arm64/include/asm/ptrace.h               |  25 +-
>  arch/arm64/include/asm/sysreg.h               |   2 +
>  arch/arm64/include/uapi/asm/ptrace.h          |   1 +
>  arch/arm64/kernel/acpi.c                      |  15 +-
>  arch/arm64/kernel/cpufeature.c                |  68 +++-
>  arch/arm64/kernel/debug-monitors.c            |   1 -
>  arch/arm64/kernel/entry-common.c              | 335 +++++++++++++-----
>  arch/arm64/kernel/entry.S                     |  14 +-
>  arch/arm64/kernel/hibernate.c                 |  14 +-
>  arch/arm64/kernel/irq.c                       |  45 ++-
>  arch/arm64/kernel/machine_kexec.c             |   4 +-
>  arch/arm64/kernel/pi/idreg-override.c         |   1 +
>  arch/arm64/kernel/probes/decode-insn.c        |  11 +-
>  arch/arm64/kernel/probes/kprobes.c            |  24 +-
>  arch/arm64/kernel/process.c                   |  24 +-
>  arch/arm64/kernel/setup.c                     |   4 +-
>  arch/arm64/kernel/signal.c                    |   1 -
>  arch/arm64/kernel/smp.c                       | 216 +++++++----
>  arch/arm64/kernel/suspend.c                   |  14 +-
>  arch/arm64/kernel/traps.c                     |   1 -
>  arch/arm64/kvm/hyp/nvhe/switch.c              |   2 +-
>  arch/arm64/kvm/hyp/vgic-v3-sr.c               |   7 +-
>  arch/arm64/kvm/hyp/vhe/switch.c               |  14 +-
>  arch/arm64/mm/fault.c                         |   1 -
>  arch/arm64/mm/mmu.c                           |   7 +-
>  arch/arm64/tools/cpucaps                      |   2 +
>  drivers/firmware/efi/runtime-wrappers.c       |  32 +-
>  drivers/irqchip/irq-gic-v3.c                  | 132 ++++++-
>  drivers/irqchip/irq-gic-v5.c                  | 244 ++++++++++++-
>  include/linux/irq.h                           |   2 +-
>  include/linux/irqchip/arm-gic-v3-prio.h       |   8 -
>  include/linux/irqchip/arm-gic-v3.h            |   4 +
>  kernel/irq/handle.c                           |   3 +-
>  kernel/irq/manage.c                           |   5 -
>  50 files changed, 1661 insertions(+), 582 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/daifflags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/common_flags.h
>  create mode 100644 arch/arm64/include/asm/interrupts/entry.h
>  create mode 100644 arch/arm64/include/asm/interrupts/masking.h
> 

-- 
Best regards,
Jinjie


