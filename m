Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 258E3CEE33B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 17:13:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EdnW7+ooFm0Yd06buA1dn6HB9rFq8N3IUe23ZctX/Fo=; b=oiD1Nrnj1+GWozsHwdpk6OXu5M
	5GFTqxBSiCfIcHXo+kFQDdt8MK4rbztnvDFds6iiWy6A0c3f/vT5VQbICXB+plsUSVqNWnwNtOhXB
	vsu8mKt4POAfTaNn7FqgoHOM1X1EJG45qLnseY+V/pX6IjgSg2RyasZSpuF2QmGnxVanPwrCWDICF
	w2UUfBICtKZ8Pq6OEi1YbXzAIoLhCZSOS0d/muIgCr7v9shchPhhzcs8Gqg/9ctqMmrSuilMVoSxZ
	WbqRkkY7tDjrbTRFKqW3eKXJZ6Q0WFw6t2AzHwXTTj0o246wyiTS6v6+DtCBXrgF73m7FBpO08mM9
	oljD8aGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPGu-00000000peO-0hdW;
	Tue, 18 Nov 2025 17:13:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLPGr-00000000pdc-0jA6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 17:13:38 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A6AAD168F;
	Tue, 18 Nov 2025 09:13:28 -0800 (PST)
Received: from [10.57.39.196] (unknown [10.57.39.196])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id BAB0B3F66E;
	Tue, 18 Nov 2025 09:13:30 -0800 (PST)
Message-ID: <55e1345f-94d7-41a9-8f0a-694fd56f63ed@arm.com>
Date: Tue, 18 Nov 2025 18:13:27 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 08/11] entry: Add
 arch_ptrace_report_syscall_entry/exit()
To: Jinjie Ruan <ruanjinjie@huawei.com>, catalin.marinas@arm.com,
 will@kernel.org, oleg@redhat.com, tglx@linutronix.de, peterz@infradead.org,
 luto@kernel.org, shuah@kernel.org, kees@kernel.org, wad@chromium.org,
 akpm@linux-foundation.org, ldv@strace.io, macro@orcam.me.uk, deller@gmx.de,
 mark.rutland@arm.com, song@kernel.org, mbenes@suse.cz, ryan.roberts@arm.com,
 ada.coupriediaz@arm.com, anshuman.khandual@arm.com, broonie@kernel.org,
 pengcan@kylinos.cn, dvyukov@google.com, kmal@cock.li, lihongbo22@huawei.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-kselftest@vger.kernel.org
References: <20251117133048.53182-1-ruanjinjie@huawei.com>
 <20251117133048.53182-9-ruanjinjie@huawei.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20251117133048.53182-9-ruanjinjie@huawei.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251118_091337_292801_CC0FA9AC 
X-CRM114-Status: GOOD (  23.28  )
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

On 17/11/2025 14:30, Jinjie Ruan wrote:
> Differ from generic entry, due to historical reasons, ARM64 need to
> save/restore during syscall entry/exit because ARM64 use a scratch
> register (ip(r12) on AArch32, x7 on AArch64) to denote syscall entry/exit.
>
> In preparation for moving arm64 over to the generic entry code,
> add arch_ptrace_report_syscall_entry/exit() as the default
> ptrace_report_syscall_entry/exit() implementation. This allows
> arm64 to implement the architecture specific version.
>
> Suggested-by: Mark Rutland <mark.rutland@arm.com>
> Suggested-by: Kevin Brodsky <kevin.brodsky@arm.com>

I don't think I suggested this patch. I see that I suggested renaming
some functions on v3, but I don't think that justifies a Suggested-by tag.

> Suggested-by: Thomas Gleixner <tglx@linutronix.de>
> Signed-off-by: Jinjie Ruan <ruanjinjie@huawei.com>
> ---
>  kernel/entry/syscall-common.c | 43 +++++++++++++++++++++++++++++++++--
>  1 file changed, 41 insertions(+), 2 deletions(-)
>
> diff --git a/kernel/entry/syscall-common.c b/kernel/entry/syscall-common.c
> index 66e6ba7fa80c..27310e611567 100644
> --- a/kernel/entry/syscall-common.c
> +++ b/kernel/entry/syscall-common.c
> @@ -17,6 +17,25 @@ static inline void syscall_enter_audit(struct pt_regs *regs, long syscall)
>  	}
>  }
>  
> +/**
> + * arch_ptrace_report_syscall_entry - Architecture specific
> + *				      ptrace_report_syscall_entry().
> + *
> + * Invoked from syscall_trace_enter() to wrap ptrace_report_syscall_entry().
> + * Defaults to ptrace_report_syscall_entry.
> + *
> + * The main purpose is to support arch-specific ptrace_report_syscall_entry()
> + * implementation.
> + */
> +static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs);
> +
> +#ifndef arch_ptrace_report_syscall_entry
> +static __always_inline int arch_ptrace_report_syscall_entry(struct pt_regs *regs)
> +{
> +	return ptrace_report_syscall_entry(regs);

I saw that Thomas suggested this approach on v4, and it makes sense to
me, but I find the naming surprising. If an architecture does need extra
handling, then the generic function should never be called from generic
code. So it seems to me that the more logical change would be:

* Rename: ptrace_report_syscall_entry -> __ptrace_report_syscall_entry
* Introduce ptrace_report_syscall_entry(), defaults to
__ptrace_report_syscall_entry()

All this would be done in <linux/ptrace.h>, where it clearly belongs.
The __ prefix makes it clear that the generic function is not the main
interface. Even better, no need to change any caller with that approach.

- Kevin

> +}
> +#endif
> +
>  long syscall_trace_enter(struct pt_regs *regs, long syscall,
>  				unsigned long work)
>  {
> @@ -34,7 +53,7 @@ long syscall_trace_enter(struct pt_regs *regs, long syscall,
>  
>  	/* Handle ptrace */
>  	if (work & (SYSCALL_WORK_SYSCALL_TRACE | SYSCALL_WORK_SYSCALL_EMU)) {
> -		ret = ptrace_report_syscall_entry(regs);
> +		ret = arch_ptrace_report_syscall_entry(regs);
>  		if (ret || (work & SYSCALL_WORK_SYSCALL_EMU))
>  			return -1L;
>  	}
> @@ -84,6 +103,26 @@ static inline bool report_single_step(unsigned long work)
>  	return work & SYSCALL_WORK_SYSCALL_EXIT_TRAP;
>  }
>  
> +/**
> + * arch_ptrace_report_syscall_exit - Architecture specific
> + *				     ptrace_report_syscall_exit.
> + *
> + * Invoked from syscall_exit_work() to wrap ptrace_report_syscall_exit().
> + *
> + * The main purpose is to support arch-specific ptrace_report_syscall_exit
> + * implementation.
> + */
> +static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
> +							    int step);
> +
> +#ifndef arch_ptrace_report_syscall_exit
> +static __always_inline void arch_ptrace_report_syscall_exit(struct pt_regs *regs,
> +							    int step)
> +{
> +	ptrace_report_syscall_exit(regs, step);
> +}
> +#endif
> +
>  void syscall_exit_work(struct pt_regs *regs, unsigned long work)
>  {
>  	bool step;
> @@ -108,5 +147,5 @@ void syscall_exit_work(struct pt_regs *regs, unsigned long work)
>  
>  	step = report_single_step(work);
>  	if (step || work & SYSCALL_WORK_SYSCALL_TRACE)
> -		ptrace_report_syscall_exit(regs, step);
> +		arch_ptrace_report_syscall_exit(regs, step);
>  }

