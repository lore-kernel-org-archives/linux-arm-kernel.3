Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 16E28C4452D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 08:01:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=8fr9CdNLLI6F9qEcy88cckOJsZcetmPMoGFEMHCefOg=; b=QDzMB9rXlRm2z9
	M3c7OCze9GZDHN7zS2v0Z0+pSLxpfNt6r/geg3/D0nmCUIPcuqPtlcMR+AtVB7GYbH+lzGRnYR68U
	6k9oly2r7yfafy2S2Q53ZQVLBEMNYWGsLjD9dpN16EWQNvd0p3WFN99UQnguNYKm0g0gVD3WGCt2y
	QyhNnnrSdiU/ni4AUEnLXed1DXnyUURSzwtmu9JxhkezVEkNfCvmfc+WxBsEFSmx6hfHqEGDcEJMk
	lId7GqovUPzamJZVHdAxMNc9XR+S86iOHnfxdIoarryaQCT/R/JAGSzsYBa/JdJwzwrRJUiQhlU3s
	tijOGT6jqRbkUkYSJIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRst-0000000BCE1-2bSf;
	Wed, 22 Jul 2026 08:00:55 +0000
Received: from canpmsgout09.his.huawei.com ([113.46.200.224])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmRsq-0000000BCD7-2UGb
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 08:00:54 +0000
dkim-signature: v=1; a=rsa-sha256; d=huawei.com; s=dkim;
	c=relaxed/relaxed; q=dns/txt;
	h=From;
	bh=8fr9CdNLLI6F9qEcy88cckOJsZcetmPMoGFEMHCefOg=;
	b=upmWTa0ugmceZhP90CGnC+DsZavWGH83CoBWVGMhArnyq59t2YmJbH2eJRlDtz6V1szFjO8UI
	okZYsx2aEYvzoH2io4kI3XuybCZBfzypY0FzdXjFdqmC62ZhGgPS9KzN3ZSEDI782D7L6S47NEf
	EFQ4X71uq/NcpMiYW5fQbzI=
Received: from mail.maildlp.com (unknown [172.19.163.163])
	by canpmsgout09.his.huawei.com (SkyGuard) with ESMTPS id 4h4mfJ70RJz1cySC;
	Wed, 22 Jul 2026 15:51:20 +0800 (CST)
Received: from dggpemf500011.china.huawei.com (unknown [7.185.36.131])
	by mail.maildlp.com (Postfix) with ESMTPS id 340AA4048B;
	Wed, 22 Jul 2026 16:00:42 +0800 (CST)
Received: from [10.67.109.254] (10.67.109.254) by
 dggpemf500011.china.huawei.com (7.185.36.131) with Microsoft SMTP Server
 (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.2.1544.11; Wed, 22 Jul 2026 16:00:41 +0800
Message-ID: <0d58a4b5-52fa-4f75-8e0d-59a38f9f5046@huawei.com>
Date: Wed, 22 Jul 2026 16:00:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC PATCH 17/36] arm64: remove daifflags.h
To: Vladimir Murzin <vladimir.murzin@arm.com>,
	<linux-arm-kernel@lists.infradead.org>
References: <20260709121333.23507-1-vladimir.murzin@arm.com>
 <20260709121333.23507-18-vladimir.murzin@arm.com>
From: Jinjie Ruan <ruanjinjie@huawei.com>
In-Reply-To: <20260709121333.23507-18-vladimir.murzin@arm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-Originating-IP: [10.67.109.254]
X-ClientProxiedBy: kwepems100001.china.huawei.com (7.221.188.238) To
 dggpemf500011.china.huawei.com (7.185.36.131)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260722_010052_976960_5E4DCED8 
X-CRM114-Status: GOOD (  25.75  )
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
Cc: mark.rutland@arm.com, maz@kernel.org, will@kernel.org, catalin.marinas@arm.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org



On 7/9/2026 8:13 PM, Vladimir Murzin wrote:
> From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> 
> Interrupt masking is now split in different APIs and `local_daif_...`
> functions are not in use anymore.
> The `DAIF_...` masks defines are now in `asm/interrupts/common_flags.h`,
> so we can safely remove `daifflags.h` and all `#include`s referring to it.
> 
> Only kprobes.c and process.c use `DAIF_...` masks defines, so add the
> new header there.
> 
> Signed-off-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Signed-off-by: Vladimir Murzin <vladimir.murzin@arm.com>
> ---
>  arch/arm64/include/asm/daifflags.h    | 123 --------------------------
>  arch/arm64/include/asm/entry-common.h |   1 -
>  arch/arm64/include/asm/kvm_host.h     |   1 -
>  arch/arm64/include/asm/mmu_context.h  |   1 -
>  arch/arm64/kernel/debug-monitors.c    |   1 -
>  arch/arm64/kernel/probes/kprobes.c    |   2 +-
>  arch/arm64/kernel/signal.c            |   1 -
>  arch/arm64/kernel/traps.c             |   1 -
>  arch/arm64/mm/fault.c                 |   1 -
>  9 files changed, 1 insertion(+), 131 deletions(-)
>  delete mode 100644 arch/arm64/include/asm/daifflags.h

Reviewed-by: Jinjie Ruan <ruanjinjie@huawei.com>

> 
> diff --git a/arch/arm64/include/asm/daifflags.h b/arch/arm64/include/asm/daifflags.h
> deleted file mode 100644
> index 8f097a2d9099..000000000000
> --- a/arch/arm64/include/asm/daifflags.h
> +++ /dev/null
> @@ -1,123 +0,0 @@
> -/* SPDX-License-Identifier: GPL-2.0-only */
> -/*
> - * Copyright (C) 2017 ARM Ltd.
> - */
> -#ifndef __ASM_DAIFFLAGS_H
> -#define __ASM_DAIFFLAGS_H
> -
> -#include <linux/irqflags.h>
> -
> -#include <asm/arch_gicv3.h>
> -#include <asm/barrier.h>
> -#include <asm/cpufeature.h>
> -#include <asm/ptrace.h>
> -
> -#define DAIF_PROCCTX		0
> -#define DAIF_PROCCTX_NOIRQ	(PSR_I_BIT | PSR_F_BIT)
> -#define DAIF_ERRCTX		(PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
> -#define DAIF_MASK		(PSR_D_BIT | PSR_A_BIT | PSR_I_BIT | PSR_F_BIT)
> -
> -
> -/* mask/save/unmask/restore all exceptions, including interrupts. */
> -static __always_inline void local_daif_mask(void)
> -{
> -	WARN_ON(system_has_prio_mask_debugging() &&
> -		(read_sysreg_s(SYS_ICC_PMR_EL1) == (GIC_PRIO_IRQOFF |
> -						    GIC_PRIO_PSR_I_SET)));
> -
> -	asm volatile(
> -		"msr	daifset, #0xf		// local_daif_mask\n"
> -		:
> -		:
> -		: "memory");
> -
> -	/* Don't really care for a dsb here, we don't intend to enable IRQs */
> -	if (system_uses_irq_prio_masking())
> -		gic_write_pmr(GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET);
> -
> -	trace_hardirqs_off();
> -}
> -
> -static __always_inline unsigned long local_daif_save_flags(void)
> -{
> -	unsigned long flags;
> -
> -	flags = read_sysreg(daif);
> -
> -	if (system_uses_irq_prio_masking()) {
> -		/* If IRQs are masked with PMR, reflect it in the flags */
> -		if (read_sysreg_s(SYS_ICC_PMR_EL1) != GIC_PRIO_IRQON)
> -			flags |= PSR_I_BIT | PSR_F_BIT;
> -	}
> -
> -	return flags;
> -}
> -
> -static __always_inline unsigned long local_daif_save(void)
> -{
> -	unsigned long flags;
> -
> -	flags = local_daif_save_flags();
> -
> -	local_daif_mask();
> -
> -	return flags;
> -}
> -
> -static __always_inline void local_daif_restore(unsigned long flags)
> -{
> -	bool irq_disabled = flags & PSR_I_BIT;
> -
> -	WARN_ON(system_has_prio_mask_debugging() &&
> -		(read_sysreg(daif) & (PSR_I_BIT | PSR_F_BIT)) != (PSR_I_BIT | PSR_F_BIT));
> -
> -	if (!irq_disabled) {
> -		trace_hardirqs_on();
> -
> -		if (system_uses_irq_prio_masking()) {
> -			gic_write_pmr(GIC_PRIO_IRQON);
> -			pmr_sync();
> -		}
> -	} else if (system_uses_irq_prio_masking()) {
> -		u64 pmr;
> -
> -		if (!(flags & PSR_A_BIT)) {
> -			/*
> -			 * If interrupts are disabled but we can take
> -			 * asynchronous errors, we can take NMIs
> -			 */
> -			flags &= ~(PSR_I_BIT | PSR_F_BIT);
> -			pmr = GIC_PRIO_IRQOFF;
> -		} else {
> -			pmr = GIC_PRIO_IRQON | GIC_PRIO_PSR_I_SET;
> -		}
> -
> -		/*
> -		 * There has been concern that the write to daif
> -		 * might be reordered before this write to PMR.
> -		 * From the ARM ARM DDI 0487D.a, section D1.7.1
> -		 * "Accessing PSTATE fields":
> -		 *   Writes to the PSTATE fields have side-effects on
> -		 *   various aspects of the PE operation. All of these
> -		 *   side-effects are guaranteed:
> -		 *     - Not to be visible to earlier instructions in
> -		 *       the execution stream.
> -		 *     - To be visible to later instructions in the
> -		 *       execution stream
> -		 *
> -		 * Also, writes to PMR are self-synchronizing, so no
> -		 * interrupts with a lower priority than PMR is signaled
> -		 * to the PE after the write.
> -		 *
> -		 * So we don't need additional synchronization here.
> -		 */
> -		gic_write_pmr(pmr);
> -	}
> -
> -	write_sysreg(flags, daif);
> -
> -	if (irq_disabled)
> -		trace_hardirqs_off();
> -}
> -
> -#endif
> diff --git a/arch/arm64/include/asm/entry-common.h b/arch/arm64/include/asm/entry-common.h
> index 1905765159aa..73d82a8d8e95 100644
> --- a/arch/arm64/include/asm/entry-common.h
> +++ b/arch/arm64/include/asm/entry-common.h
> @@ -6,7 +6,6 @@
>  #include <linux/thread_info.h>
>  
>  #include <asm/cpufeature.h>
> -#include <asm/daifflags.h>
>  #include <asm/fpsimd.h>
>  #include <asm/mte.h>
>  #include <asm/stacktrace.h>
> diff --git a/arch/arm64/include/asm/kvm_host.h b/arch/arm64/include/asm/kvm_host.h
> index bae2c4f92ef5..74358e93f1bb 100644
> --- a/arch/arm64/include/asm/kvm_host.h
> +++ b/arch/arm64/include/asm/kvm_host.h
> @@ -23,7 +23,6 @@
>  #include <asm/barrier.h>
>  #include <asm/cpufeature.h>
>  #include <asm/cputype.h>
> -#include <asm/daifflags.h>
>  #include <asm/fpsimd.h>
>  #include <asm/kvm.h>
>  #include <asm/kvm_asm.h>
> diff --git a/arch/arm64/include/asm/mmu_context.h b/arch/arm64/include/asm/mmu_context.h
> index 803b68758152..b3354a1350cf 100644
> --- a/arch/arm64/include/asm/mmu_context.h
> +++ b/arch/arm64/include/asm/mmu_context.h
> @@ -19,7 +19,6 @@
>  
>  #include <asm/cacheflush.h>
>  #include <asm/cpufeature.h>
> -#include <asm/daifflags.h>
>  #include <asm/gcs.h>
>  #include <asm/proc-fns.h>
>  #include <asm/cputype.h>
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index e271fbac5f82..5db27c7e86bb 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -19,7 +19,6 @@
>  
>  #include <asm/cpufeature.h>
>  #include <asm/cputype.h>
> -#include <asm/daifflags.h>
>  #include <asm/debug-monitors.h>
>  #include <asm/exception.h>
>  #include <asm/kgdb.h>
> diff --git a/arch/arm64/kernel/probes/kprobes.c b/arch/arm64/kernel/probes/kprobes.c
> index 43a0361a8bf0..d9d25d184309 100644
> --- a/arch/arm64/kernel/probes/kprobes.c
> +++ b/arch/arm64/kernel/probes/kprobes.c
> @@ -24,9 +24,9 @@
>  #include <linux/vmalloc.h>
>  
>  #include <asm/cacheflush.h>
> -#include <asm/daifflags.h>
>  #include <asm/debug-monitors.h>
>  #include <asm/insn.h>
> +#include <asm/interrupts/common_flags.h>
>  #include <asm/irq.h>
>  #include <asm/text-patching.h>
>  #include <asm/ptrace.h>
> diff --git a/arch/arm64/kernel/signal.c b/arch/arm64/kernel/signal.c
> index 38e6fa204c17..2276d316cc9e 100644
> --- a/arch/arm64/kernel/signal.c
> +++ b/arch/arm64/kernel/signal.c
> @@ -22,7 +22,6 @@
>  #include <linux/syscalls.h>
>  #include <linux/pkeys.h>
>  
> -#include <asm/daifflags.h>
>  #include <asm/debug-monitors.h>
>  #include <asm/elf.h>
>  #include <asm/exception.h>
> diff --git a/arch/arm64/kernel/traps.c b/arch/arm64/kernel/traps.c
> index 914282016069..77b6be6fc4c1 100644
> --- a/arch/arm64/kernel/traps.c
> +++ b/arch/arm64/kernel/traps.c
> @@ -33,7 +33,6 @@
>  #include <asm/atomic.h>
>  #include <asm/bug.h>
>  #include <asm/cpufeature.h>
> -#include <asm/daifflags.h>
>  #include <asm/debug-monitors.h>
>  #include <asm/efi.h>
>  #include <asm/esr.h>
> diff --git a/arch/arm64/mm/fault.c b/arch/arm64/mm/fault.c
> index 85e23388f9bb..83aca64745f0 100644
> --- a/arch/arm64/mm/fault.c
> +++ b/arch/arm64/mm/fault.c
> @@ -34,7 +34,6 @@
>  #include <asm/cpufeature.h>
>  #include <asm/efi.h>
>  #include <asm/exception.h>
> -#include <asm/daifflags.h>
>  #include <asm/debug-monitors.h>
>  #include <asm/esr.h>
>  #include <asm/kprobes.h>


