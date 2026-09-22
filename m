Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5690C982DF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 22 Sep 2026 03:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WtEJJnI23HMrvJ1nLmsa7kWdStULy778TOJcpNKSbbw=; b=ifBo4W5bWRKg3p1DWocZ+pNYTO
	Nl+PbOtIIeU+qP6ai1+rNvaTANq1sIDT3CVMziIbmpuJGbvXBPv/KQUvWyukP4K7a0/xpoMeep6D4
	V4xzEfcyxxURp2PCbvUK7SIX1dtUmDvAXBMeNV1cJbtFNnPDsHBh5Si2mSVyoPjNecnnC9NjgosY9
	ptvBWBVNDVzBEsQEnGJyXN9LR9EFSrdUMeXYo2IOVlv9RvZdjH8lODxApwCWaEqKvHoQmqS2lju5j
	Zn/Po/QdQ4MC5TKTnA2PTvSzaSl27RX9j3eZsmiVtAyHMSWdEM+x5pXSzbZ0TH9gp9dpiYZtxCWM6
	Yo/2wHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rI6-000000045dn-3dgg;
	Tue, 22 Sep 2026 03:35:34 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8rI5-000000045dV-3fOA
	for linux-arm-kernel@lists.infradead.org;
	Tue, 22 Sep 2026 03:35:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 53387410C0;
	Tue, 22 Sep 2026 03:35:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C52DA1F000FF;
	Tue, 22 Sep 2026 03:35:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790048133;
	bh=WtEJJnI23HMrvJ1nLmsa7kWdStULy778TOJcpNKSbbw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=fUKNa/hdOHyAYp1daoHBAx94b+RvDrx0R9Hp5CTaq6b60oFQ59lV4J8Okxeofqpao
	 kgTZ6GQcYMEXK5UK6Dnu19icDYfUBIr9McTHB3xfjciF5SroVP9m4AIXHYE0ToFc9Y
	 m/650gxZ5ZnaJTCtGxDfgYCe16zZ7XRLMzT1bqFmSY/a8LOeY3MZfqckQ39jbwVcdt
	 SeG0xq89Q33ndu0hMf2e3vXGUc6HzoaBSyZVi1gzjMAH1q9KLW7Hk3q/JcAbqIIN8P
	 lOUJpEaHYN9pqK+VweionZyb+PRU6EDSdmLX7zNglw5+wahlPcbyVdQcuzinDzvvnn
	 RH9ocCGbXPjOg==
Content-Type: multipart/mixed; boundary="===============6597116511644733316=="
MIME-Version: 1.0
Message-Id: <5de177edfbaed1c26e91a222f2636a56b48a96001cba1d4dab7e37b57e312a0b@mail.kernel.org>
In-Reply-To: <20260922-b4-rcu-tasks-preempt-qs-v5-10-410f57770bad@toxicpanda.com>
References: <20260922-b4-rcu-tasks-preempt-qs-v5-10-410f57770bad@toxicpanda.com>
Subject: Re: [PATCH v5 10/13] samples: ftrace: Make the direct-call trampolines Tasks Trace readers
From: bot+bpf-ci@kernel.org
To: josef@toxicpanda.com,paulmck@kernel.org,frederic@kernel.org,ast@kernel.org,rostedt@goodmis.org
Cc: boqun@kernel.org,mhiramat@kernel.org,mark.rutland@arm.com,peterz@infradead.org,tglx@kernel.org,daniel@iogearbox.net,andrii@kernel.org,puranjay@kernel.org,rcu@vger.kernel.org,bpf@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,josef@toxicpanda.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Tue, 22 Sep 2026 03:35:30 +0000 (UTC)
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

--===============6597116511644733316==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> commit 1deb3b548a13555ffd63d9373f054d6da02ad75e
> Author: Josef Bacik <josef@toxicpanda.com>
> Date:   Tue Sep 22 02:23:29 2026 +0000
>
>     samples: ftrace: Make the direct-call trampolines Tasks Trace readers
>
>     The sample direct trampolines are exactly the kind of out-of-line
>     register_ftrace_direct() user whose lifetime depends on Tasks RCU
>     waiting for a task inside them: nothing else stops rmmod while a task is
>     preempted in my_direct_func().  On HAVE_RCU_TRAMPOLINE_READERS
>     architectures that wait only covers Tasks Trace RCU readers, so give the
>     samples a small shared header with rcu_read_lock_trace() and
>     rcu_read_unlock_trace() open-coded as instruction strings for x86-64 and
>     arm64 -- the same sequences as ftrace_64.S and entry-ftrace.S, using
>     caller-saved non-argument scratch registers -- and bracket every
>     call-out with them.  The instructions outside the bracket are module
>     text, covered by ftrace_direct_mark_module().  Other architectures get
>     empty definitions.
>
>     Assisted-by: LLM
>     Signed-off-by: Josef Bacik <josef@toxicpanda.com>

This looks like a bug fix for the direct trampoline lifetime issue.
Should this include:

  Fixes: 32999f49426a ("rcu-tasks: Add a Tasks RCU implementation for reader-marked trampolines")


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/35680506278
--===============6597116511644733316==--

