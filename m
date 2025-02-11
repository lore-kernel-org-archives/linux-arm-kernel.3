Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69B81C0219D
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:01:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SnnXynEmlnD9mw13jyduYJJjR4QpkYRf9mDUFXT/E+0=; b=jf8cFWLaazXWj6tlg0YezYLdS3
	HBpbnKWQ4mlJ9vpx4CVQLDlm0+QJ3SZIg5o4zSXeQ8kb+byXujAzJu0xto3DxriqW35AScg/DQPhL
	/1i6Yywd8rQH6e3drRX5U9KldBleACtK62Y5Bq+Wnvig6KVcHUOyYzIF96i+/KvrT2PLxXoUjrGC8
	GuHXwgB4/a/5mMO8p7ahirDEBTZfUqg19uIgUTUliHpgsW1zkcM54SBrxPYKbNKBMORLKYZKd33q/
	VlK7//a8t7TxjRbuU0/xRhMt3SjHe8TRgg5OLiFt4BjTPeg60zhPCXDxKM5rXxYSJkPL4iUdsA93a
	3w5atWmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tho1H-00000003SKJ-1A4d;
	Tue, 11 Feb 2025 11:01:35 +0000
Received: from casper.infradead.org ([2001:8b0:10b:1236::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnkJ-00000003P4j-0mYw
	for linux-arm-kernel@bombadil.infradead.org;
	Tue, 11 Feb 2025 10:44:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=casper.20170209; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=SnnXynEmlnD9mw13jyduYJJjR4QpkYRf9mDUFXT/E+0=; b=ZjG3clFisqwpnxOsPgGIRruXqx
	8QuCo21iTmNtA6L3oGAkWV8wwGF5SXmBQVm24dCPw/Xf0/socdwWDjeEiMdwY+bbrKN572w5+tSah
	3buRtHGBAkk5RdQacffe2t6pXXXck25ooq09TcpM3rzf8ogJppS5Hd2/qMJBxwz8/h78EHosEtqlw
	yh8As5a7NTXjWoLrjHYxIinA6GHVVfR5sLRFpfCyQIxo33TRbeCbfPgxsnJrsNgSxStnVZdg5FvB3
	jeydxQ/HdkUjgetGod4rv6ZGo48/aGfEkecisXfNyyqX/bmLWUsAN6Vxf9UgXi5wSftlyEjPKnuoZ
	SBy6Mdjw==;
Received: from 77-249-17-252.cable.dynamic.v4.ziggo.nl ([77.249.17.252] helo=noisy.programming.kicks-ass.net)
	by casper.infradead.org with esmtpsa (Exim 4.98 #2 (Red Hat Linux))
	id 1thnkG-00000000ydI-3HfM;
	Tue, 11 Feb 2025 10:44:00 +0000
Received: by noisy.programming.kicks-ass.net (Postfix, from userid 1000)
	id E50383004AF; Tue, 11 Feb 2025 11:43:52 +0100 (CET)
Date: Tue, 11 Feb 2025 11:43:52 +0100
From: Peter Zijlstra <peterz@infradead.org>
To: Alexei Starovoitov <alexei.starovoitov@gmail.com>
Cc: Kumar Kartikeya Dwivedi <memxor@gmail.com>, bpf <bpf@vger.kernel.org>,
	LKML <linux-kernel@vger.kernel.org>,
	Linus Torvalds <torvalds@linux-foundation.org>,
	Will Deacon <will@kernel.org>, Waiman Long <llong@redhat.com>,
	Alexei Starovoitov <ast@kernel.org>,
	Andrii Nakryiko <andrii@kernel.org>,
	Daniel Borkmann <daniel@iogearbox.net>,
	Martin KaFai Lau <martin.lau@kernel.org>,
	Eduard Zingerman <eddyz87@gmail.com>,
	"Paul E. McKenney" <paulmck@kernel.org>, Tejun Heo <tj@kernel.org>,
	Barret Rhoden <brho@google.com>, Josh Don <joshdon@google.com>,
	Dohyun Kim <dohyunkim@google.com>,
	linux-arm-kernel <linux-arm-kernel@lists.infradead.org>,
	Kernel Team <kernel-team@meta.com>
Subject: Re: [PATCH bpf-next v2 00/26] Resilient Queued Spin Lock
Message-ID: <20250211104352.GC29593@noisy.programming.kicks-ass.net>
References: <20250206105435.2159977-1-memxor@gmail.com>
 <20250210093840.GE10324@noisy.programming.kicks-ass.net>
 <20250210104931.GE31462@noisy.programming.kicks-ass.net>
 <CAADnVQ+3wu0WB2pXs4cccxfkbTb3TK8Z+act5egytiON+qN9tA@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CAADnVQ+3wu0WB2pXs4cccxfkbTb3TK8Z+act5egytiON+qN9tA@mail.gmail.com>
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

On Mon, Feb 10, 2025 at 08:37:06PM -0800, Alexei Starovoitov wrote:
> On Mon, Feb 10, 2025 at 2:49 AM Peter Zijlstra <peterz@infradead.org> wrote:
> > >
> > > Do you force unload the BPF program?
> 
> Not yet. As you can imagine, cancelling bpf program is much
> harder than sending sigkill to the user space process.

So you are killing the user program? Because it wasn't at all clear what
if anything is done when this failure case is tripped.

> The prog needs to safely free all the resources it holds.
> This work was ongoing for a couple years now with numerous discussions.

Well, for you maybe, I'm new here. This is only the second submission,
and really only the first one I got to mostly read.

> > Even the simple AB-BA case,
> >
> >   CPU0          CPU1
> >   lock-A        lock-B
> >   lock-B        lock-A <-
> >
> > just having a random lock op return -ETIMO doesn't actually solve
> > anything. Suppose CPU1's lock-A will time out; it will have to unwind
> > and release lock-B before CPU0 can make progress.
> >
> > Worse, if CPU1 isn't quick enough to unwind and release B, then CPU0's
> > lock-B will also time out.
> >
> > At which point they'll both try again and you're stuck in the same
> > place, no?
> 
> Not really. You're missing that deadlock is not a normal case.

Well, if this is unpriv user programs, you should most definitely
consider them the normal case. Must assume user space is malicious.

> As soon as we have cancellation logic working we will be "sigkilling"
> prog where deadlock was detected.

Ah, so that's the plan, but not yet included here? This means that every
BPF program invocation must be 'cancellable'? What if kernel thread is
hitting tracepoint or somesuch?

So much details not clear to me and not explained either :/

> In this patch the verifier guarantees that the prog must check
> the return value from bpf_res_spin_lock().

Yeah, but so what? It can check and still not do the right thing. Only
checking the return value is consumed somehow doesn't really help much.

> The prog cannot keep re-trying.
> The only thing it can do is to exit.

Right, but it might have already modified things, how are you going to
recover from that?

> Failing to grab res_spin_lock() is not a normal condition.

If you're going to be exposing this to unpriv, I really do think you
should assume it to be the normal case.

> The prog has to implement a fallback path for it,

But verifier must verify it is sane fallback, how can it do that?

> > Given you *have* to unwind to make progress; why not move the entire
> > thing to a wound-wait style lock? Then you also get rid of the whole
> > timeout mess.
> 
> We looked at things like ww_mutex_lock, but they don't fit.
> wound-wait is for databases where deadlock is normal and expected.
> The transaction has to be aborted and retried.

Right, which to me sounds exactly like what you want for unpriv.

Have the program structured such that it must acquire all locks before
it does a modification / store -- and have the verifier enforce this.
Then any lock failure can be handled by the bpf core, not the program
itself. Core can unlock all previously acquired locks, and core can
either re-attempt the program or 'skip' it after N failures.

It does mean the bpf core needs to track the acquired locks -- which you
already do, except it becomes mandatory, prog cannot acquire more than
~32 locks.

> res_spin_lock is different. It's kinda safe spin_lock that doesn't
> brick the kernel.

Well, 1/2 second is pretty much bricked imo.

> That was a conscious trade-off. Deadlocks are not normal.

I really do think you should assume they are normal, unpriv and all
that.


