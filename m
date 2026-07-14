Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D267BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:11:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Tl4h+221L/w6NzOfKKil7MwlTgDffDNAmIy67lN545c=; b=VhYLOWi0mbWWUxNBGBb45x2ATU
	b5PvJMKwXfMgvLizVmfHA4uLAug1vBT7I38/EIGDBARJtOUOZWzcggVxuYQXD2xYaLHssR5GNZm7i
	08jJqv8k9zQIHXHhQ+o54UO5N2VrOWeMZIZKVVmoB1nsmpa6hGQIz+0Z4HEpsDmSXNygRvMk8W+bR
	fn0TXAb6sgjbNLKAEkl9A/jiOAoRDsnEHTU9DjStdMpXgLxD4y8vazSd88auiAyfVGluU91+h/4nO
	QipKo2OXlnmQWUU+dPo4sqtMzYv7mcZp4os4a3Crb5+hfGXYSH8UWD+uVLMGolWC4enPU4ltxOOfm
	XpKP2/lA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYEz-0000000BGL1-21Du;
	Tue, 14 Jul 2026 08:11:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYEx-0000000BGJW-0Wgr
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:11:43 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 759B86136E;
	Tue, 14 Jul 2026 08:11:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC2091F000E9;
	Tue, 14 Jul 2026 08:11:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784016702;
	bh=Tl4h+221L/w6NzOfKKil7MwlTgDffDNAmIy67lN545c=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=nKwuxLHGUNYZSrccadSo3REBtphiZsLibg7xJIuWEiGXolX0HG5rtmmL5eFrSu6A/
	 d8qeDobSrFiUHSBlcW1pU9YSoKlRyV75e7MKW7Hx5Oi7/O9cbnAl/+Y0vJdTYjqEDs
	 ZPZUhdWHkR4Hjd41raW9n8HUWvVCF/YlF0BW3G092Wlbnad3/dbyfdESHhM2pfyFZ+
	 WqNJkZf1etuhrvTrPGAD+hSI6qhD0CqQmyUIleGMse+4t8XTsNHqDynzMjkYPG3vKY
	 NpHmsX5euPQD0r7DAdmFiwmbiA6ThvQs5d/oQKLMLnYQo2dZvqciNjXZTY0938s7Fv
	 G80ftPN+eOSeA==
Content-Type: multipart/mixed; boundary="===============2756016215755141306=="
MIME-Version: 1.0
Message-Id: <4ef45450ea43d0a7932e003ca291e9ec4cc2642102b7d8116d4c8f241f67a9c0@mail.kernel.org>
In-Reply-To: <20260714073041.40250-2-ankur.a.arora@oracle.com>
References: <20260714073041.40250-2-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v14 01/15] asm-generic: barrier: Add smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 14 Jul 2026 08:11:41 +0000 (UTC)
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

--===============2756016215755141306==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index b99cb57dfccc..d1e9ed15bbfc 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h
> @@ -273,6 +273,85 @@ do {									\
>  })
>  #endif
>
> +/*
> + * Number of times we iterate in the loop before doing the time check.
> + * Note that the iteration count assumes that the loop condition is
> + * relatively cheap.
> + */
> +#ifndef SMP_TIMEOUT_POLL_COUNT
> +#define SMP_TIMEOUT_POLL_COUNT		200
> +#endif
> +
> +/*
> + * cpu_poll_relax() stitches up two kinds of primitives: ones that provide
> + * a momentary blip in the pipeline (ex. cpu_relax() on x86).
> + * The second support waiting for @ptr value to change, coupled with a
> + * with a precise (or imprecise) timeout.

This isn't a bug, but could this sentence be tightened?  The phrase
"with a" is repeated across the line wrap, and "The second support"
reads a little off, e.g. "The second kind supports waiting for @ptr to
change, coupled with a (precise or imprecise) timeout".

> + *
> + * cpu_poll_relax() keeps them together, because its utility is in minimizing
> + * expensive operations while polling on @ptr waiting for it to change.
> + * The arguments to cpu_poll_relax() are only needed for the waiting
> + * primitives.
> + *
> + * Also note that platforms with a suitable cpu_poll_relax() are expected
> + * to define ARCH_HAS_CPU_RELAX.
> + */
> +#ifndef cpu_poll_relax
> +#define cpu_poll_relax(ptr, val, timeout_ns)	cpu_relax()
> +#endif
> +

[ ... ]

> +#ifndef smp_cond_load_relaxed_timeout
> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
> +				      time_expr_ns, timeout_ns)		\
> +({									\
> +	typeof(ptr) __PTR = (ptr);					\
> +	__unqual_scalar_typeof(*(ptr)) VAL;				\
> +	u32 __count = 0, __spin = SMP_TIMEOUT_POLL_COUNT;		\
> +	s64 __timeout = (s64)timeout_ns;				\
> +	s64 __time_now, __time_end = 0;					\
> +									\
> +	for (;;) {							\
> +		VAL = READ_ONCE(*__PTR);				\
> +		if (cond_expr)						\
> +			break;						\
> +		cpu_poll_relax(__PTR, VAL, (u64)__timeout);		\
> +		if (++__count < __spin)					\
> +			continue;					\

The loop passes the full relative __timeout to cpu_poll_relax() on every
iteration and resets __count to 0 each cycle after the time-check.

For the asm-generic default this is harmless, since cpu_poll_relax()
expands to cpu_relax() and ignores its arguments.

But for an event-based wait that honours the timeout argument (for
example an arm64 WFE override), wouldn't each of the
SMP_TIMEOUT_POLL_COUNT iterations be allowed to block for up to the
entire remaining __timeout before the next time-check, delaying the
check and causing large overshoot?

This came up in review of an earlier version, where the suggestion was
to pass a bounded per-iteration timeout rather than the full remaining
value.  Would it be worth carrying that bound here so the arch overrides
land on a well-defined per-iteration wait?

> +		__time_now = (s64)(time_expr_ns);			\
> +		if (unlikely(__time_end == 0))				\
> +			__time_end = __time_now + __timeout;		\
> +		__timeout = __time_end - __time_now;			\
> +		if (__time_now <= 0 || __timeout <= 0) {		\
> +			VAL = READ_ONCE(*__PTR);			\
> +			break;						\
> +		}							\
> +		__count = 0;						\
> +	}								\
> +	(typeof(*(ptr)))VAL;						\
> +})
> +#endif


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/29315652884
--===============2756016215755141306==--

