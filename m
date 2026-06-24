Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E2341CDB479
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Jun 2026 15:32:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:
	Content-Transfer-Encoding:Content-Type:In-Reply-To:From:References:To:Subject
	:MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=+YWyNqd7eoUdHxKtRCWw0qLzn2eiVttU9Er4wyLAkYk=; b=YLhaB74TSsjr9A
	PbPWsyEZ6EaUv6igeT8Gu8059mOz1DVOWEnyEzswuz+XZCGS1Y7DH9CZCFZ4tofCZj1Ij0kfJS4Gs
	OimtYF87Qs7EXq//eAc9qQumq1l55An/OiSAfRYIOTArFu2xG+n9HxkvHRNhJCY01e3bmgJtqj8pY
	6Targ15PPHPU5WNrqat1hgCczBXjGxOJ+PVslbpI3WnTDzsmZvceC69y8BuYtbL8TAsnMSwWREOBu
	Lgcvypw1Cnq/xo4+XoA8JsrYvne2dW7I2Kdezu5I4TVDl2vQGAL88ffy+zVWCO4rv05V2mQWowFAi
	QByOjEiejfYZHnhPPmsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPaV-000000080JK-0K9n;
	Wed, 24 Jun 2026 15:32:27 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wcPaS-000000080If-2SuV
	for linux-arm-kernel@lists.infradead.org;
	Wed, 24 Jun 2026 15:32:26 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7AC7D2308;
	Wed, 24 Jun 2026 08:32:18 -0700 (PDT)
Received: from [10.2.213.11] (e137867.arm.com [10.2.213.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85DD13F905;
	Wed, 24 Jun 2026 08:32:19 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1782315143; bh=YYN8guqFW8bsQsH5XPf9FRtbfT6L6ouIddpKDYUN90A=;
	h=Date:Subject:To:References:From:Cc:In-Reply-To:From;
	b=WbpGQKIPfkGDQ9ehtwtCNruTMnKuHqy+zQBbB16T0LPXW0LDic1RZr/zwn+eySUuN
	 8i6V0U1keZC4gj/F/yZg0zJGBLzzrrVmxSCOrpCqh0QiBlT/DV+lsaMmqhrYYjYQ+Y
	 AjxlF/OPON+ZptGQp3KKdRIrMmJQABIyQK5ncTyg=
Message-ID: <cfa07466-225b-476f-adf9-346bd1377a4d@arm.com>
Date: Wed, 24 Jun 2026 16:32:17 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v15 10/11] arm64: entry: Convert to generic entry
To: Jinjie Ruan <ruanjinjie@huawei.com>
References: <20260511092103.1974980-1-ruanjinjie@huawei.com>
 <20260511092103.1974980-11-ruanjinjie@huawei.com>
From: Ada Couprie Diaz <ada.coupriediaz@arm.com>
Content-Language: en-US, en-GB, fr
Organization: Arm Ltd.
In-Reply-To: <20260511092103.1974980-11-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260624_083224_709756_437844AA 
X-CRM114-Status: GOOD (  31.31  )
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
Cc: mark.rutland@arm.com, peterz@infradead.org, catalin.marinas@arm.com, ldv@strace.io, song@kernel.org, will@kernel.org, kees@kernel.org, thuth@redhat.com, ryan.roberts@arm.com, anshuman.khandual@arm.com, kevin.brodsky@arm.com, pengcan@kylinos.cn, broonie@kernel.org, luto@kernel.org, linux-arm-kernel@lists.infradead.org, wad@chromium.org, yeoreum.yun@arm.com, oleg@redhat.com, linux-kernel@vger.kernel.org, james.morse@arm.com, tglx@kernel.org, liqiang01@kylinos.cn, linusw@kernel.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 11/05/2026 10:21, Jinjie Ruan wrote:
> Implement the generic entry framework for arm64 to handle system call
> entry and exit. This follows the migration of x86, RISC-V, and LoongArch,
> consolidating architecture-specific syscall tracing and auditing into
> the common kernel entry infrastructure.
If I understand correctly, as Syscall User Dispatch is gated being
`CONFIG_GENERIC_ENTRY` only and handled via ptrace, this patch
effectively enables Syscall User Dispatch for arm64.
I think it would be great to mention it here explicitly !
>
> [Background]
> Arm64 has already adopted generic IRQ entry. Completing the conversion
> to the generic syscall entry framework reduces architectural divergence,
> simplifies maintenance, and allows arm64 to automatically benefit from
> improvements in the common entry code.
>
> [Changes]
>
> 1. Kconfig and Infrastructure:
> - Select GENERIC_ENTRY and remove GENERIC_IRQ_ENTRY (now implied).
>
> - Migrate struct thread_info to use the syscall_work field instead
>    of TIF flags for syscall-related tasks.
>
> 2. Thread Info and Flags:
> - Remove definitions for TIF_SYSCALL_TRACE, TIF_SYSCALL_AUDIT,
>    TIF_SYSCALL_TRACEPOINT, TIF_SECCOMP, and TIF_SYSCALL_EMU.
>
> - Replace _TIF_SYSCALL_WORK and _TIF_SYSCALL_EXIT_WORK with the
>    generic SYSCALL_WORK bitmask.
>
> - Map single-step state to SYSCALL_EXIT_TRAP in debug-monitors.c.
>
> 3. Architecture-Specific Hooks (asm/entry-common.h):
> - Implement arch_ptrace_report_syscall_entry() and _exit() by
>    porting the existing arm64 logic to the generic interface.
>
> - Add arch_syscall_is_vdso_sigreturn() to asm/syscall.h to
>    support Syscall User Dispatch (SUD).
Related to the above : I feel this is missing an important information.
Given that SUD is only controlled by `CONFIG_GENERIC_ENTRY`,
converting to generic entry _requires_ supporting SUD, so we do it here.
I think this would be important to mention, as I otherwise felt like this
change did not belong in this patch.

General question that follows : does it make sense to require an arch
to support Syscall User Dispatch to be able to convert to generic entry ?
(I assume not really, given that only `arch_syscall_is_vdso_sigreturn()` is
required on the arch side, but I am curious)

>
> 4. Cleanup and Refactoring:
> - Remove redundant arm64-specific syscall tracing functions from
>    ptrace.c, including syscall_trace_enter(), syscall_exit_work(),
>    and related audit/step helpers.
>
> - Update el0_svc_common() in syscall.c to use the generic
>    syscall_work checks and entry/exit call sites.
>
> [Why this matters]
> - Unified Interface: Aligns arm64 with the modern kernel entry standard.
>
> - Improved Maintainability: Bug fixes in kernel/entry/common.c now
>    apply to arm64 automatically.
>
> - Feature Readiness: Simplifies the implementation of future
>    cross-architecture syscall features.
>
> [Compatibility]
> This conversion maintains full ABI compatibility with existing
> userspace. The ptrace register-saving behavior, seccomp filtering, and
> syscall tracing semantics remain identical to the previous implementation.
I agree, would it make sense to mention that there is no change related
to RSEQ as arm64 does not have `HAVE_GENERIC_TIF_BITS` ? As that is
part of generic entry, but is indeed a no-op for us.
>
> Cc: Mark Rutland <mark.rutland@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Thomas Gleixner <tglx@kernel.org>
> Cc: Peter Zijlstra <peterz@infradead.org>
> Reviewed-by: Linus Walleij <linusw@kernel.org>
> Acked-by: Peter Zijlstra (Intel) <peterz@infradead.org>
> Reviewed-by: Yeoreum Yun <yeoreum.yun@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
> [...]
> diff --git a/arch/arm64/kernel/debug-monitors.c b/arch/arm64/kernel/debug-monitors.c
> index 29307642f4c9..e67643a70405 100644
> --- a/arch/arm64/kernel/debug-monitors.c
> +++ b/arch/arm64/kernel/debug-monitors.c
> @@ -385,11 +385,18 @@ void user_enable_single_step(struct task_struct *task)
>   
>   	if (!test_and_set_ti_thread_flag(ti, TIF_SINGLESTEP))
>   		set_regs_spsr_ss(task_pt_regs(task));
> +
> +	/*
> +	 * Ensure that a trap is triggered once stepping out of a system
> +	 * call prior to executing any user instruction.
> +	 */
I was a bit confused by the comment in isolation at first : we already
have a signal that we are stepping and would need a trap, `TIF_SINGLESTEP`.
Would it make sense to mention here that this is for/handled by the generic
entry code ?
Something along the lines of "[...], as the generic entry code does not
check for `TIF_SINGLESTEP`.", or "Ensure that the generic entry code
triggers a trap [...]", if you think its useful ?
> +	set_task_syscall_work(task, SYSCALL_EXIT_TRAP);
>   }
>   NOKPROBE_SYMBOL(user_enable_single_step);
>   
>   void user_disable_single_step(struct task_struct *task)
>   {
>   	clear_ti_thread_flag(task_thread_info(task), TIF_SINGLESTEP);
> +	clear_task_syscall_work(task, SYSCALL_EXIT_TRAP);
>   }
>   NOKPROBE_SYMBOL(user_disable_single_step);

Apart from my minor nitpicks :

Reviewed-by: Ada Couprie Diaz <ada.coupriediaz@arm.com>

Thanks,
Ada


