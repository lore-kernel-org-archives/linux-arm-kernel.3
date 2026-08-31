Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 00DA3C61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:31:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oMQj1CO7FeLw5Q/x4SXoEK72/eOkUjphrW+XFi+9DSo=; b=hhmbr4rg1oy2mimIIPwzO3XeTi
	SIoKQXcBZqcnYcOMk2LTbhwGQ0LktYC3kREq4JoUXiqvFiF70stDbnNHsKM8NrtPxG2h1yMmowrDV
	spH/IVmU7GIgYEjVVbl3m/6SWHGNy0LBtT4ALZv6I2h8k6maFDLI70XqldBgIOy4nQzcZUcwUlMhC
	ObvpE5gj05t5xExRmShEbY42pV7aZtbd/Nk1GmigvWCW0ZH4Q138BDFmtzmvneEfBjgB1hzkTPulw
	TKBhpXnf4fRDQ19O9GnuXWmzmJM8jahGSYNjpiy5P0IyaIdgLOYlDbSQxLOSRcexaAnwVQlCG3I0K
	Ou7BRq4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19bX-0000000AXmH-0p2a;
	Mon, 31 Aug 2026 21:31:47 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19bW-0000000AXmA-3N6K
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:31:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 8A2BC40259;
	Mon, 31 Aug 2026 21:31:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0E2851F000E9;
	Mon, 31 Aug 2026 21:31:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211906;
	bh=oMQj1CO7FeLw5Q/x4SXoEK72/eOkUjphrW+XFi+9DSo=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=EK7N2jzCrtLimig81ZkOt9TOso8+dgSC8Jo2f1XZdJs3mOsKmqnAGtOAJ9ExpWYfC
	 Lq6YCVhVJ0iOXApkzPVqDuOYp81AZsoziox5jbT0U/mSsnLoc7e5x/PPJ++FjyJyec
	 vj78sOBp1JoyOdERiIebGytxXPmkMwndGrQ/yWaJRoD9QqYzU0gKf0Qvvs7SaTpDZs
	 1fqkQjjkWIwM9sjkwLehB1QHJJ1zsFOf39rRX26Uh9Sp71kPZsgbgHZkTCAZyMvvgv
	 EseCEwjVpUnYVeXEcpD8W3F91ukdGV2+cozl7sGqTR03gXL+EkjYKAEql5aiayVvb5
	 oKLCRrNRiDbUQ==
Content-Type: multipart/mixed; boundary="===============4967962990189229906=="
MIME-Version: 1.0
Message-Id: <c09ae02e72c39f6b963a9a2e6f28597abecf5e9a57a7cdf4c8a531843e9503e6@mail.kernel.org>
In-Reply-To: <20260831202251.305046-11-ankur.a.arora@oracle.com>
References: <20260831202251.305046-11-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v15 10/16] bpf/rqspinlock: Use smp_cond_load_acquire_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 31 Aug 2026 21:31:45 +0000 (UTC)
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

--===============4967962990189229906==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 1b249c6f0674..9e8f19afd7b0 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c

[ ... ]

> @@ -269,6 +267,18 @@ static noinline s64 clock_deadlock(rqspinlock_t *lock, u32 mask,
>   */
>  #define RES_RESET_TIMEOUT(ts, _duration) ({ (ts).timeout_end = 0; (ts).duration = _duration; })
>
> +/*
> + * Limit how often we invoke clock_deadlock() while spin-waiting in
> + * smp_cond_load_acquire_timeout() or atomic_cond_read_acquire_timeout().
> + *
> + * We only override the default value for architectures without a waiting
> + * implementation.
> + */
> +#ifndef CPU_POLL_RELAX_WAITS
> +#undef SMP_TIMEOUT_POLL_COUNT
> +#define SMP_TIMEOUT_POLL_COUNT	(16*1024)
> +#endif
> +

Does this CPU_POLL_RELAX_WAITS check correctly detect the waiting
implementation at runtime for arm64?

On arm64, CPU_POLL_RELAX_WAITS is defined unconditionally at
arch/arm64/include/asm/barrier.h:233, but cpu_poll_relax() picks its
implementation at runtime:

  #define cpu_poll_relax(ptr, val, timeout_ns) do {                  \
          if (alternative_has_cap_unlikely(ARM64_HAS_WFXT))          \
                  __cmpwait_relaxed_timeout(ptr, val, timeout_ns);   \
          else if (arch_timer_evtstrm_available())                   \
                  __cmpwait_relaxed(ptr, val);                       \
          else                                                       \
                  cpu_relax();                                       \
  } while (0)

So on every arm64 build SMP_TIMEOUT_POLL_COUNT stays at 1 ('Wait mode. No
need to poll.' per include/asm-generic/barrier.h:280-281) and the 16k
override is skipped. On arm64 hardware that has neither FEAT_WFXT nor an
available arch-timer event stream, cpu_poll_relax() degrades to a bare
cpu_relax(), and __smp_cond_load_relaxed_timeout() then evaluates
time_expr_ns on every loop iteration:

    cpu_poll_relax(__PTR, VAL, (u64)__scl_timeout);      /* == cpu_relax() */
    if (++__scl_count < __scl_spin)                      /* __scl_spin == 1 */
            continue;
    __scl_time_now = (s64)(time_expr_ns);                /* clock_deadlock() */

That means one noinline clock_deadlock() call with ktime_get_mono_fast_ns()
per cpu_relax() for the whole 250 ms / 500 ms wait, in both rqspinlock wait
loops (rqspinlock.c:427 and :590). Before this patch the same platform
amortized the clock read 1-in-65536 (the u16 'spin' wrap in the amortized
RES_CHECK_TIMEOUT), and the arm64 private copy removed earlier in the
series (f90a6cd43b71) amortized it 1-in-200 with a dedicated
non-event-stream path, whose comment called this case out explicitly: 'it
will not happen when event stream support is unavailable, time_expr check
is amortized.'

The commit message asserts 'We only do this for architectures lacking a
waiting implementation of cpu_poll_relax()', which is true at compile time
but not at run time for arm64 without WFXT/evtstrm. Gating on something
that reflects the runtime choice (or clamping __scl_spin when the waiting
path is not taken) would restore the amortization.

[ ... ]

>      Acked-by: Kumar Kartikeya Dwivedi <memxor@gmail.com>
>      Signed-off-by: Ankur Arora <ankur.a.arora@oracle.com>
>
>      Note:
>        - when overriding the SMP_TIMEOUT_POLL_COUNT value check for
>          CPU_POLL_RELAX_WAITS instead of directly checking for CONFIG_ARM64.

The commit message states:

>      Finally, redefine SMP_TIMEOUT_POLL_COUNT to be 16k to be similar to
>      the spin-count used in the amortized version.

Is the 16k value correct? The amortized version's spin count is 64k, not
16k. RES_CHECK_TIMEOUT_AMORTIZED gates on 'if (!(ts).spin++)'
(kernel/bpf/rqspinlock.c:244) and 'spin' is 'u16' (struct
rqspinlock_timeout, rqspinlock.c:80-85), so clock_deadlock() ran once per
65536 evaluations. The new SMP_TIMEOUT_POLL_COUNT of 16*1024 therefore
samples the clock 4x more often than the code it is said to match.

The direction is harmless, but the stated justification for the constant is
off by 4x, and it is the only rationale a reviewer has for the value.

Also, the macro excerpt quoted in the changelog does not match the tree:

        __time_now = (time_expr_ns);
        if (__time_now <= 0 || __time_now >= __time_end) {

The actual code (include/asm-generic/barrier.h:351-357) uses
__scl_-prefixed names and tests '__scl_timeout <= 0' after recomputing
'__scl_timeout = __scl_time_end - __scl_time_now'. It is equivalent, but
quoting code that is not in the tree makes the equality argument harder to
check.


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33438155296
--===============4967962990189229906==--

