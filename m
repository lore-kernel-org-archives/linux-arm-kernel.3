Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A694BC61DD3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:17:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gf5UfaqraRajzUlSqAbExhi7YqgCg+VWMqoQKEm7Za4=; b=wMVHI/kh4gHjuwBMVsS2EPFwoh
	QuP+5+dg4ByUtd6b4pcCUq0FHbNGiBieNOjL5nbwB3G7MfDB6Z1PxHrd9CijjPkiK+NQgMVMpsCkN
	ALQGo5EigYWLtzoU6ZPtrIIBoArRUPE4iQexU2jnK7Ux7bsGeace/Q7TTvRbE2x7BccqqWnty2qkV
	OwqOQMPl9mo/uDHEsiH/9XjFcSA5aXQ4LONk+6JjaR4xTTj75x4C6x0k4PXScKws6TYiz3vjIiqlW
	kL35CjuW/z3ltnERADVyaJIJ0BwUeGZvZKtVZf1V/FvFu9z+02H7D9rAH7QXg2Tf7kh9OTSGINtUq
	e/2qbB2A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19NY-0000000AWHL-2zzI;
	Mon, 31 Aug 2026 21:17:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19NK-0000000AWBx-2dsX
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:17:06 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 13F0F402C5;
	Mon, 31 Aug 2026 21:17:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 93E4A1F000E9;
	Mon, 31 Aug 2026 21:17:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211026;
	bh=Gf5UfaqraRajzUlSqAbExhi7YqgCg+VWMqoQKEm7Za4=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=eGCEE2RkxAWzElnprzbSiS3AjtuxX6BqSVep+Y1nes+FzY2VHHCHh98jhfeP9juKi
	 HZuQkUqF8vhU/XxguwTd7UHvowB7Aqe4HSQeGC7sFSV31mG/rlLLkpD3NS1AXjyVDH
	 NDX/0AxXslSrMTsC566hYNrzaf/c1UTGlhiKvhgR+1bVWHIJSitRfLecpkKn8wWygQ
	 zIy7FlszZNGuplKd9lcN43JjYnVgIDFW5P/GtXn8SIs9c+TsSfUCiYa4L5LjhueX3H
	 s8OJFaRpd8dvjTdrAdhln9kazvcRImdBtjfcyA5QGD8kYoMtTp5lL3qckgMVGkAWQg
	 Fy3h5CV1kVPBg==
Content-Type: multipart/mixed; boundary="===============8970126971584631980=="
MIME-Version: 1.0
Message-Id: <d98e7c48eb83be367357f40747d9489ac50c85c184979866a37359998548dbc2@mail.kernel.org>
In-Reply-To: <20260831202251.305046-7-ankur.a.arora@oracle.com>
References: <20260831202251.305046-7-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v15 06/16] asm-generic: barrier: Add smp_cond_load_acquire_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 31 Aug 2026 21:17:04 +0000 (UTC)
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

--===============8970126971584631980==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index 8c37de192944..8b166acfba12 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -379,6 +379,54 @@ do {									\
>  })
>  #endif
>
> +/**
> + * smp_cond_load_acquire_timeout() - (Spin) wait for cond with ACQUIRE ordering
> + * until a timeout expires.
> + * @ptr: pointer to the variable to wait on.
> + * @cond_expr: boolean expression to wait for.
> + * @time_expr_ns: monotonic expression that evaluates to time in ns or,
> + *  on failure, returns a negative value.

The documentation says @time_expr_ns "on failure, returns a negative value",
but the implementation in __smp_cond_load_relaxed_timeout() exits when
__scl_time_now <= 0, treating zero as a failure too. Should the
documentation say "zero or a negative value" to match what
smp_cond_load_relaxed_timeout() documents (barrier.h:317-318)?

> + * @timeout_ns: timeout value in ns
> + * (Both of the above are assumed to be compatible with s64.)
> + *
> + * Equivalent to using smp_cond_load_acquire() on the condition variable with
> + * a timeout.
> + */
> +#ifndef smp_cond_load_acquire_timeout
> +#define smp_cond_load_acquire_timeout(ptr, cond_expr,			\
> +				      time_expr_ns, timeout_ns)		\
> +({									\
> +	__unqual_scalar_typeof(*(ptr)) VAL;				\
> +	VAL = smp_cond_load_relaxed_timeout(ptr, cond_expr,		\
> +					     time_expr_ns,		\
> +					     timeout_ns);		\
> +	/*								\
> +	 * We arrive here once the loop condition is hit, on timeout,	\
> +	 * or, if we hit both the timeout and the loop condition.	\
> +	 *								\
> +	 * For the first case, we come here having already evaluated	\
> +	 * the control dependency.					\
> +	 * In the last case -- low probability, possible in the last	\
> +	 * iteration, especially on architectures with waiting		\
> +	 * cpu_poll_relax() -- the control dependency has not been	\
> +	 * evaluated.							\
> +	 *								\
> +	 * So, force it to be re-evaluated before			\
> +	 * smp_acquire__after_ctrl_dep() to provide ACQUIRE ordering	\
> +	 * for both.							\
> +	 *								\
> +	 * The other case is of pure timeout, where again we don't have \
> +	 * the advantage of having the control dependency. Given that	\
> +	 * this is the slowpath, we go with a full smp_load_acquire().	\
> +	 */								\
> +	if (cond_expr)							\
> +		smp_acquire__after_ctrl_dep();				\
> +	else								\
> +		VAL = smp_load_acquire(ptr);				\

The macro evaluates cond_expr one extra time here, after the
smp_cond_load_relaxed_timeout() call has already returned. This means
cond_expr is silently required to be side-effect free and a pure function
of VAL.

The kernel-doc says the macro is "Equivalent to using
smp_cond_load_acquire() on the condition variable with a timeout"
(barrier.h:392-393), but in smp_cond_load_acquire() cond_expr is only
evaluated immediately after a fresh READ_ONCE inside the loop. If cond_expr
also depends on state other than VAL, or has side effects, the two
evaluations can disagree:

  VAL = smp_cond_load_relaxed_timeout(ptr, cond_expr, ...);  /* succeeded, cond was true */
  if (cond_expr)                                             /* now false */
          smp_acquire__after_ctrl_dep();
  else
          VAL = smp_load_acquire(ptr);                       /* successful result discarded */

When that happens the successful wait's value is thrown away and replaced
by a fresh read, and any side effects inside cond_expr run one extra time.

This pattern is not hypothetical for the smp_cond_load_acquire() family.
In-tree conditions that are not pure functions of VAL include:

  arch/arm64/mm/mmu.c:
    smp_cond_load_acquire(&idmap_kpti_bbml3_flag, VAL == num_online_cpus());

  include/asm-generic/ticket_spinlock.h:
    atomic_cond_read_acquire(&lock->val, ticket == (u16)VAL);

  kernel/bpf/rqspinlock.c:
    res_smp_cond_load_acquire(&lock->locked, !VAL || RES_CHECK_TIMEOUT(ts, ret, _Q_LOCKED_MASK));

No current caller in the series is broken by this - every new user passes
a condition that is a pure function of VAL. But should the requirement be
documented, or should the equivalence claim in the kernel-doc be weakened?

> +	(typeof(*(ptr)))VAL;						\
> +})
> +#endif
> +
>  /*
>   * pmem_wmb() ensures that all stores for which the modification
>   * are written to persistent storage by preceding instructions have


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33438155296
--===============8970126971584631980==--

