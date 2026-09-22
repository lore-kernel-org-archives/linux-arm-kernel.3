Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9916AC982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=chwp6w9U3FXx9HLMVXQesUWvyCF8tGEQzW9vmTXezC4=; b=0jzgmidP7IsRqRJNTv/teT8cuJ
	WFXh0zQbrljZFmMQJqc2U4P0wLv5apM777CSJy1APOo/XEoP2v2Fw4sRfWn/3JBBoo0Kmkntn62Jy
	8htyyzLwUSPtBufC22AkjBLxOC+BtlSx1DO6vh9PuYMEL81l/ZIGUiS0aG2OuXdoDNYcHKR55FvsT
	bToAsePNYVpHh/aWg/FPM71ReOC7InyMsDst5sH1hxskk0MebWdh6ApWmH30LQu1VnGSdj2bFCgUr
	wgLE9FNq/xgZAOdqnmE/L4nZ2po1dxqTztn0kNp4WPPCC5ymAPdlRmMaRO/R64pK/wKVgm+bytyuJ
	8fVMT6pw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r5S-0000000440P-1rce;
	Tue, 22 Sep 2026 03:22:30 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r5M-000000043yM-1DdG
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:22:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AD2A543D53;
	Tue, 22 Sep 2026 03:22:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6B3971F000FF;
	Tue, 22 Sep 2026 03:22:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790047343;
	bh=chwp6w9U3FXx9HLMVXQesUWvyCF8tGEQzW9vmTXezC4=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=FaG01oy7Dp1NuIp3NAOKPXeN3uw8XNWovuKFxTeJs2szrVkgfj8DAu+/UoJIaPf8n
	 JvUu4k6T62ZfVfKVTecEneuDaR09v6aEksgw+khUW7dPISh7y4IM73FOSNGTdCLaKC
	 YwlVxhcD244lTyTYLoHPCBx4TX8CVf6O3BLRRktWXCg7ywuM+y8kL/t3WomZq1GzzP
	 dbUmMyLYiCTwIafSoU4MNbLVMWgp5adoCwWQUt2AyQ+pRHICuUX4+sjYMuZTC990V9
	 yjvIKuf0JrBQvC+ZgpywVyHJU9+cZNBUxXnxpKExgRbUV17hBYOYdPDcQZy4wErvxc
	 vE23KyR3tfhmw==
Content-Type: multipart/mixed; boundary="===============2423834593094065684=="
MIME-Version: 1.0
Message-Id: <592fd2894ad5ea9edd7bed019d13ebc0eb584faeaa456edd20fa638b636651da@mail.kernel.org>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-3-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-3-410f57770bad@toxicpanda.com>
Subject: Re: [PATCH v5 03/13] kprobes: Expose the optprobe jump window to Tasks RCU
From: bot+bpf-ci@kernel.org
To: josef@toxicpanda.com,paulmck@kernel.org,frederic@kernel.org,ast@kernel.org,rostedt@goodmis.org
Cc: boqun@kernel.org,mhiramat@kernel.org,mark.rutland@arm.com,peterz@infradead.org,tglx@kernel.org,daniel@iogearbox.net,andrii@kernel.org,puranjay@kernel.org,rcu@vger.kernel.org,bpf@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,josef@toxicpanda.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Tue, 22 Sep 2026 03:22:21 +0000 (UTC)
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

--===============2423834593094065684==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/kprobes.h b/include/linux/kprobes.h
> index e6de7ae55bda..74cc48c04417 100644
> --- a/include/linux/kprobes.h
> +++ b/include/linux/kprobes.h

[ ... ]

> diff --git a/kernel/kprobes.c b/kernel/kprobes.c
> index 6337da5cab9e..e460fba83e4a 100644
> --- a/kernel/kprobes.c
> +++ b/kernel/kprobes.c
> @@ -511,6 +511,48 @@ static struct kprobe *get_optimized_kprobe(kprobe_opcode_t *addr)
>  	return NULL;
>  }
>
> +/*
> + * True while kprobe_optimizer() is waiting for its Tasks RCU grace period.
> + * Only in that window can an interruption inside an optprobe's jump region
> + * matter to it, so kprobe_in_optimized_region() does no work otherwise.
> + */
> +static bool kprobe_optimizer_waiting;
> +
> +/**
> + * kprobe_in_optimized_region - Could @addr be inside bytes a jump-optimized
> + *	kprobe replaces?
> + * @addr: kernel text address, typically an interrupted instruction pointer
> + *
> + * kprobe_optimizer() relies on synchronize_rcu_tasks() to wait for tasks that
> + * were interrupted on an instruction boundary inside the region about to be
> + * overwritten by the optimized jump.  Where Tasks RCU is built on
> + * reader-marked trampolines that region has no reader, so the irq-exit
> + * quiescent-state check asks this instead (see rcu_tasks_trampoline_text()).
> + * This is the lockless, conservative form of get_optimized_kprobe(): it does
> + * not care whether the kprobe found is, or ever will be, optimized.  May be
> + * called from any context with preemption disabled; the kprobe hash is
> + * RCU-protected and every free path waits for a grace period after unhashing.
> + *
> + * The hash walk only runs while the optimizer is actually waiting.  A task
> + * that was preempted in such a region before the flag went up is invisible
> + * to that check, so the optimizer first waits those out by their recorded
> + * preemption IP (rcu_tasks_wait_irq_preempted(), whose leading
> + * synchronize_rcu() also publishes the flag to every check in flight).
> + */
> +bool kprobe_in_optimized_region(unsigned long addr)
> +{
> +	int i;
> +
> +	if (!READ_ONCE(kprobe_optimizer_waiting))
> +		return false;
> +
> +	for (i = 1; i < MAX_OPTIMIZED_LENGTH / sizeof(kprobe_opcode_t); i++)
> +		if (get_kprobe((kprobe_opcode_t *)addr - i))
> +			return true;
> +	return false;
> +}
> +NOKPROBE_SYMBOL(kprobe_in_optimized_region);

This isn't a bug, but could the explanation of the kprobe_optimizer_waiting
window live in one place? The flag comment (lines above), the
kprobe_in_optimized_region() kernel-doc, and the Step 2 comment in
kprobe_optimizer() (see below) each describe the same mechanism. A later
change has to keep three copies in sync.

This isn't a bug, but would a name tied to the pending-optimization window
read better at the rcu_tasks_trampoline_text() call site? As written,
'in_optimized_region' suggests an already-optimized probe and hides that
the answer is false whenever the optimizer is not waiting. Something like
kprobe_in_pending_jump_region() or kprobe_optimizer_pending_at() might be
clearer.

The kernel-doc has to explain what the name doesn't convey: "does not care
whether the kprobe found is, or ever will be, optimized" and "The hash walk
only runs while the optimizer is actually waiting."

> +
>  /* Optimization staging list, protected by 'kprobe_mutex' */
>  static LIST_HEAD(optimizing_list);
>  static LIST_HEAD(unoptimizing_list);
> @@ -644,8 +686,16 @@ static void kprobe_optimizer(void)
>  		 * to 2nd-Nth byte of jump instruction. This wait is for avoiding it.
>  		 * Note that on non-preemptive kernel, this is transparently converted
>  		 * to synchronoze_sched() to wait for all interrupts to have completed.
> +		 * kprobe_optimizer_waiting lets a reader-marked-trampoline Tasks RCU
> +		 * recognise tasks interrupted in such a region while we wait, and
> +		 * rcu_tasks_wait_irq_preempted() (a no-op elsewhere) first waits
> +		 * out any that were preempted there before we said so; see
> +		 * kprobe_in_optimized_region().
>  		 */
> +		WRITE_ONCE(kprobe_optimizer_waiting, true);
> +		rcu_tasks_wait_irq_preempted(kprobe_in_optimized_region);
>  		synchronize_rcu_tasks();
> +		WRITE_ONCE(kprobe_optimizer_waiting, false);

This third description of the same mechanism adds to the maintenance burden
mentioned above.

[ ... ]

> diff --git a/kernel/rcu/tasks.h b/kernel/rcu/tasks.h
> index f03be742be48..eb1388dd8a61 100644
> --- a/kernel/rcu/tasks.h
> +++ b/kernel/rcu/tasks.h
> @@ -1005,7 +1005,9 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
>   *    trampolines, kprobe slots and other dynamically allocated text; this
>   *    deliberately does not ask is_ftrace_trampoline() and friends, since
>   *    text being torn down may already be unregistered there);
> - *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text().
> + *  - whatever the architecture adds via arch_rcu_tasks_trampoline_text();
> + *  - the bytes after a kprobe that a pending jump optimization is about to
> + *    overwrite, the one synchronize_rcu_tasks() user with no trampoline.
>   *
>   * A false positive only makes the task a holdout until its next quiescent
>   * event.  Called with interrupts disabled from the irq-exit path.
> @@ -1013,8 +1015,11 @@ bool __weak arch_rcu_tasks_trampoline_text(unsigned long ip)
>  bool rcu_tasks_trampoline_text(unsigned long ip)
>  {
>  	if (core_kernel_text(ip))
> -		return arch_rcu_tasks_trampoline_text(ip);
> -	return !is_module_text_address(ip);
> +		return arch_rcu_tasks_trampoline_text(ip) ||
> +		       kprobe_in_optimized_region(ip);
> +	if (is_module_text_address(ip))
> +		return kprobe_in_optimized_region(ip);
> +	return true;
>  }
>  NOKPROBE_SYMBOL(rcu_tasks_trampoline_text);


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/35680506278
--===============2423834593094065684==--

