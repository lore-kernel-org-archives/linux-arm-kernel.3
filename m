Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D733FC982DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:22:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8HfsmWe18vqaIcsmBURthJcIj9m0ORvWdZMKM+oBDQU=; b=HxvG+lnCc21A2pfphrpSfyP7Jl
	xTXQO/wn/ykOWT8uWZHCxogNjWm3Zt2HhFqTx0VK5DxkY9hzlVtTx0LF7ezF4v7+hEBnqC2/h5efi
	c3BdfcadpueNYbQBR7QObue1S+FT6txL7/3sXIZoD/trh572aAv8qRuIGjhn10dhRNXTzf2vW4NRY
	621IncWiclsl9NMRoL/i1N+7uzWwPLlAJdAAIDosVvIqv4bz5qpPnBFjn1srWMJ7Rt8J2eXCO6Iea
	rbvva8lyWSyjjk5HsKvHwWLFLEi04oSeIWrrXmAVODMs5L27s619tIFRfsrA/EvvVwIslVr9JneD9
	cO8Y3R3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r5K-000000043xz-18v8;
	Tue, 22 Sep 2026 03:22:22 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8r5I-000000043xn-3f71
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:22:20 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0057B60210;
	Tue, 22 Sep 2026 03:22:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8D4EB1F000FF;
	Tue, 22 Sep 2026 03:22:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790047339;
	bh=8HfsmWe18vqaIcsmBURthJcIj9m0ORvWdZMKM+oBDQU=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=XyTfXxNihIPoDS6At5q0W54OiorJXa/2PrFWQ6EE1wm23IUj66LZAPhxJYu0pLS2G
	 1KQZjhatjx2ZifOfHqgECb6+whVG20CsWi8sSEudzSAQ3MdoUES5MLIf3NxVhd0ThN
	 5GzNifSNQouMiGetl2TsPuvpEgvtEEirDPMdSl9ghr2ywFcO8+224AjtCaqm4kJyJw
	 Fb9vTSZf+vZNSgjDb7B+tbnyljroqeBVLSISyr35f4625A5jq3aZ4wuPzP6UkDcK02
	 q+GV/JcbTmjgOs1wouNolcdp6urbu5pgLSJnlwVzoLnq+n5q8zPldDLTTwPELpjK1e
	 YMffkVBUqWQpg==
Content-Type: multipart/mixed; boundary="===============5613520125627611600=="
MIME-Version: 1.0
Message-Id: <ebf2ee78977b3aae08c12e4ba0a18f48463567e20fd282f25acf11f5af375030@mail.kernel.org>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-6-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-6-410f57770bad@toxicpanda.com>
Subject: Re: [PATCH v5 06/13] x86/kprobes: Take a Tasks Trace reader in the optprobe template
From: bot+bpf-ci@kernel.org
To: josef@toxicpanda.com,paulmck@kernel.org,frederic@kernel.org,ast@kernel.org,rostedt@goodmis.org
Cc: boqun@kernel.org,mhiramat@kernel.org,mark.rutland@arm.com,peterz@infradead.org,tglx@kernel.org,daniel@iogearbox.net,andrii@kernel.org,puranjay@kernel.org,rcu@vger.kernel.org,bpf@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,josef@toxicpanda.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Tue, 22 Sep 2026 03:22:17 +0000 (UTC)
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

--===============5613520125627611600==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> x86/kprobes: Take a Tasks Trace reader in the optprobe template
>
> The jump-optimized kprobe template calls optimized_callback() from a
> dynamically allocated slot with preemption enabled, and only Tasks RCU
> keeps that slot alive under a task preempted in the callback.  For
> HAVE_RCU_TRAMPOLINE_READERS that means the template must be a Tasks
> Trace reader across the call, so open-code rcu_read_lock_trace() and
> rcu_read_unlock_trace() around it as ftrace_64.S does.  The template
> lives in .rodata and is memcpy()d into each slot without relocation
> processing, so the references to current_task and
> rcu_tasks_trace_srcu_struct are absolute (R_X86_64_32S, relocated for
> KASLR like any other) rather than %rip-relative.  %rax and %rcx have
> already been saved by SAVE_REGS_STRING and are dead after the call.
>
> The slot itself is dynamically allocated text, so the instructions
> before the lock and after the unlock are covered by the irq-exit check.
> 64-bit only; 32-bit x86 does not take part.
>
> Assisted-by: LLM
> Signed-off-by: Josef Bacik <josef@toxicpanda.com>

This looks like a bug fix for the preemption issue introduced when commit
a19b2e3d7839 removed IRQ disabling from optimized kprobes. Should this
include:

  Fixes: a19b2e3d7839 ("kprobes/x86: Remove IRQ disabling from ftrace-based/optimized kprobes")


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/35680506278
--===============5613520125627611600==--

