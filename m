Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD581C43602
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 02:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22emMlIsPtDrhqmZ4A8+AHkM26C/CxzEvHf32koa6ZE=; b=X/AG/DX/jZq8ntMHf1gwd/1T3/
	eE46dd/76YdNA6RAeY30cn5C00qt5qawssBZwWRNhQ1+9CQ2DhdAGL2mue8U6LihzM90vXMK1VHFL
	BQWX2xJ7NJNceftlUUs3L+WPxpHgHhQqOG8vaef4yKH+CLh2ORwHymCvbehpcsdl0dKTT88zWr7qE
	5VfgwstXnkrRh6VxMtCQu05hUI+IGBMSadEDEPgGhL+D7EMHX7toyUYqIFD0Gvn7UtZHR/s6jfuof
	OOIMlyITYbc9FbvO8q5XxweGUCFi84seXJOtPWyyG94bdMPD/ad8j88ecRg1p1pHNboRzaKwfuvue
	eTJUZ0Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6uF-00000003P5l-1qnT;
	Thu, 02 Jul 2026 02:11:59 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6uE-00000003P5G-27LF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 02:11:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id DA6E1600E7;
	Thu,  2 Jul 2026 02:11:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 29F581F00A3A;
	Thu,  2 Jul 2026 02:11:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782958315;
	bh=22emMlIsPtDrhqmZ4A8+AHkM26C/CxzEvHf32koa6ZE=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=AnhhggMGcmGV9OElKHa7vlVrgQFcxDdyStdOySnJQe8g8PtnwExNxBsde62x5riKZ
	 CivR8hFUzCpLGfZ7WLs6NF9WmyLyZVbD0awEEmQlEELORxx/SVjAAA5JfVcO62Fvll
	 qUjmNu9SLSLuhXKGl57T1A5PBcBtq4/r+Ra20RI7z284AgQe+Px1wIq7N/mvPb3dhA
	 Dy2B7Bzu5aSAu6ohriAzsvGoei7VPPZBJ5XOHdyilsU1LITPaoDIzyJK8YABsB4HRF
	 XzNzrFlDOwYhPWaxbWiKr4qwuM0eZtnAj7n3ngaXICd2ZSSEPruMpMaqtVEgYsRCC+
	 R6Hnln1KH11Bw==
Content-Type: multipart/mixed; boundary="===============0253007402283867756=="
MIME-Version: 1.0
Message-Id: <457d2616d79d9e1a2a3fe06ab548cde2028a979433bd95bdc5859da4d7760e79@mail.kernel.org>
In-Reply-To: <20260702013334.140905-2-ankur.a.arora@oracle.com>
References: <20260702013334.140905-2-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v13 01/15] asm-generic: barrier: Add smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu,  2 Jul 2026 02:11:55 +0000 (UTC)
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

--===============0253007402283867756==
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

[ ... ]

> +#ifndef cpu_poll_relax
> +#define cpu_poll_relax(ptr, val, timeout_ns)	cpu_relax()
> +#endif

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

This same point came up during review of v11. David Laight noted that
__timeout here is a relative value, and that passing it straight to
cpu_poll_relax() is only safe when cpu_poll_relax() ignores its timeout
argument, as the generic cpu_relax() fallback does.

For an arm64 WFE/WFET style cpu_poll_relax() that actually waits on the
supplied timeout, would this spin roughly SMP_TIMEOUT_POLL_COUNT *
timeout_ns before the first time-check?

> +		if (++__count < __spin)					\
> +			continue;					\
> +		__time_now = (s64)(time_expr_ns);			\
> +		if (unlikely(__time_end == 0))				\
> +			__time_end = __time_now + __timeout;		\

__time_end is only initialized here, after the first cpu_poll_relax()
call has already run with the full relative __timeout, so the initial
wait is not counted against the timeout window.

Would it be worth converting the relative timeout to an absolute end-time
once up front, or at least documenting that the effective timeout can be
roughly doubled for such an implementation?

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
> +


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/28559763019
--===============0253007402283867756==--

