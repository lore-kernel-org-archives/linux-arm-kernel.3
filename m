Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5056C982F1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:22:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GHcrmWBbamtMM40zGOq2ru89k4AwG4f3HlOwSmuke7Q=; b=UNpN3wpLXZvv1Sut5b9u/HbKhs
	sQxwr22jMDZ84iQqGFSPdoig3OcASB7sghHWe3SNSL6Eb96XfFQUg8DKuaQbLGfWq31+wzZtoI8Gn
	BPYNavQOUBd/b4nTUFqGFgAz9cMMFRtKSUrVsgdb39acgzyOjdI8WbPLIY0Xi1/0XN09U6RKplAJj
	MuZyIvvcAt0yGm/NKxg+U+XXoasMeciBzG6hcVZhfWaGKUpEs23Tt0/X9B9VJ7dwl823dy2dxhKzF
	JRz3sGYK3O9jfjaNOQES+MeAa0L1SVNwSK4eGCNHhQ42of1ePEKp/hn9C8iD17rwpjHAhzr8IdFt5
	nm0OBkIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r5S-0000000440h-2VSA;
	Tue, 22 Sep 2026 03:22:30 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r5Q-000000043zA-0C0p
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:22:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 78DC343F36;
	Tue, 22 Sep 2026 03:22:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 38D2B1F00898;
	Tue, 22 Sep 2026 03:22:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790047347;
	bh=GHcrmWBbamtMM40zGOq2ru89k4AwG4f3HlOwSmuke7Q=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=VU09n4gntRUY5Qnyj5Ppo98GZZVHMTByBzKM7F85C91tIVcW/QYHilwjwVG1+/wei
	 eim87yjXp7eNYYNEs3igBS//pxis1/j817CndDnXAvKJKE+kGf2JdxefXIjTyyx837
	 FOpqKO1E3+x4q6U5/d7jtPY2zkIxfNgQVwEqQagTNNW53SUhn+wdIF08lbYWd8PWRi
	 +D3SCrijVlhfeRH4rsYha0ED7KjOdjbk8Ub77KofqdxGCBDVSewaUoCu8YspzlZGCu
	 6Z3MIfq7cSd3iJjls38cOSM6JCXHwovZxCn89Ey1JS2usitKwJPk+m9uM1ARSKU4Lf
	 5ev97SE9J3esg==
Content-Type: multipart/mixed; boundary="===============6129579292215528045=="
MIME-Version: 1.0
Message-Id: <7095e52a0212058681c54a929368a018f1c64d8d2650f32310c488483d1fc593@mail.kernel.org>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-7-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-7-410f57770bad@toxicpanda.com>
Subject: Re: [PATCH v5 07/13] bpf, x86: Take a Tasks Trace reader in the trampoline around its call-outs
From: bot+bpf-ci@kernel.org
To: josef@toxicpanda.com,paulmck@kernel.org,frederic@kernel.org,ast@kernel.org,rostedt@goodmis.org
Cc: boqun@kernel.org,mhiramat@kernel.org,mark.rutland@arm.com,peterz@infradead.org,tglx@kernel.org,daniel@iogearbox.net,andrii@kernel.org,puranjay@kernel.org,rcu@vger.kernel.org,bpf@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,josef@toxicpanda.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Tue, 22 Sep 2026 03:22:25 +0000 (UTC)
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

--===============6129579292215528045==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/arch/x86/net/bpf_jit_comp.c b/arch/x86/net/bpf_jit_comp.c
> index d4a980140b48..93743628b0fa 100644
> --- a/arch/x86/net/bpf_jit_comp.c
> +++ b/arch/x86/net/bpf_jit_comp.c

[ ... ]

> @@ -3881,6 +3967,16 @@ static int __arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *rw_im
>  	/* mov QWORD PTR [rbp - rbx_off], rbx */
>  	emit_stx(&prog, BPF_REG_FP, BPF_REG_6, -rbx_off);
>
> +	/*
> +	 * Tasks RCU keeps this image alive only while we are a Tasks Trace
> +	 * reader; the instructions before this point (and after the final
> +	 * unlock) are covered by the irq-exit IP check.  One reader spans
> +	 * __bpf_tramp_enter() and the fentry/fmod_ret progs, a second one
> +	 * the fexit progs and __bpf_tramp_exit(); the original function runs
> +	 * outside both, with the image pinned by im->pcref instead.
> +	 */
> +	emit_trace_rcu_reader(&prog, true);
> +

Does this take the Tasks Trace reader too late for BPF_TRAMP_F_INDIRECT
trampolines with FineIBT+BHI mitigation?

Looking back at the code around line 3943 (before this reader lock):

    if (flags & BPF_TRAMP_F_INDIRECT) {
        /*
         * Indirect call for bpf_struct_ops
         */
        emit_cfi(&prog, image,
                 cfi_get_func_hash(func_addr),
                 cfi_get_func_arity(func_addr));
    } else {
        x86_call_depth_emit_accounting(&prog, NULL, image);
    }

When CONFIG_FINEIBT_BHI is enabled, emit_cfi() dispatches to
emit_fineibt(), which emits:

    EMIT_ENDBR();
    EMIT1_off32(0x2d, hash);            /* sub $hash, %eax */
    if (cfi_bhi) {
        EMIT2(0x2e, 0x2e);              /* cs cs */
        emit_call(&prog, __bhi_args[arity], ip + 11);
    }

So the very first instructions in the trampoline (around offset 9,
before the reader is taken at line 3978) include a call out of the
image into __bhi_args[arity].

__bhi_args lives in .noinstr.text (arch/x86/lib/bhi.S), which is core
kernel text. It's not covered by arch_rcu_tasks_trampoline_text()
(arch/x86/kernel/ftrace.c covers only ftrace_caller ranges,
__return_thunk ranges, and __rethunk_safe ranges).

If a task is preempted (irq-exit reschedule) inside __bhi_args while its
return address points back into the trampoline image, it is neither
holding the Tasks Trace reader nor recognized by the IP check. Can
bpf_struct_ops_map_free() then complete its synchronize_rcu_tasks() and
free the image via arch_free_bpf_trampoline() before the task resumes
and returns into freed memory?

Would moving emit_trace_rcu_reader() before the emit_cfi() call close
this window, or would adding the __bhi_args range to
arch_rcu_tasks_trampoline_text() be safer?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/35680506278
--===============6129579292215528045==--

