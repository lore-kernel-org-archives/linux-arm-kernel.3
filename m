Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 903BDC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:17:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sZPchOHRA3BF9VMtsD8xf19l/B0VgamniMnRwg1tnIc=; b=H0Pr+P5eBaMXGZz1oIOXr3jmG+
	VB9fHA0XqtCpCUD/VhZ4OSCMP2CfH/VuLJyToinTYeWSYimjpa+EBKzdI4D2R6YJSTnlF1IZ5ZFE/
	Y9OQghgH6z1CS8xTzq0yWGl6q0wEKKk26DgHAVijrDvT9r3FATMyLOQtdRRwkGGg8t6LI5m7JVq9o
	kqxNxX2g1+RtqV24QWIZvOyGxhyOo/TYx+uFf19iuj9KzJHirzDMKLYU9b7G8r2S+USqf3jqgqwEV
	cGLgNRcltkUiJcdeasTf/r3WB2LG1T7qWNtoKPjf1IRt7favFwkNWx4fS213DbVGa0h4qTuoszYl/
	5clGEmPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19NE-0000000AW8r-0TMC;
	Mon, 31 Aug 2026 21:17:00 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19N9-0000000AW7O-3NLR
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:16:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id CE666602D3;
	Mon, 31 Aug 2026 21:16:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23D881F000E9;
	Mon, 31 Aug 2026 21:16:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211014;
	bh=sZPchOHRA3BF9VMtsD8xf19l/B0VgamniMnRwg1tnIc=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=aTUIIFUuSZg/wIcP1OoHmTyO7DLJAioPNSdsM50MvAX0VgmzYzU7jPDcOL6saZdKM
	 vMzQwqx7YQlbm5kivk/X4FUXpn0xHaYJtXOeuCaCYJaZtL4oV1ISaCflykSMV1cM1k
	 1UiINnCbDH0WFnGL8YhFc4G/VGgRxKVUOKqu62LOvG1PWdULhq2GK7yUF+SLTIQeMn
	 mTv70n5/Del0DDYs2A2KMzaHwAcl0uCgAKRoVK5Jor8cGRaqPOFBiOvE4lio6nHQou
	 SDjlZWIfjtYaEIFXK1U3h0Q/Pz91Tlq1+aTxSwX3/03HrbULZEjhbfpTDgASPq1Ftn
	 SRyfGWxVI6vHw==
Content-Type: multipart/mixed; boundary="===============2706226096995356969=="
MIME-Version: 1.0
Message-Id: <e142ed0cf28a0bf221e04841e070eb7249ed50a2c68707f191cf19bd73f326bd@mail.kernel.org>
In-Reply-To: <20260831202251.305046-16-ankur.a.arora@oracle.com>
References: <20260831202251.305046-16-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v15 15/16] barrier: timeout validity checks for smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 31 Aug 2026 21:16:53 +0000 (UTC)
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

--===============2706226096995356969==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/lib/tests/barrier-timeout-test.c b/lib/tests/barrier-timeout-test.c
> index 60f121fe5472..16a39f1076e2 100644
> --- a/lib/tests/barrier-timeout-test.c
> +++ b/lib/tests/barrier-timeout-test.c

[ ... ]

> +static const struct smp_cond_expiry_params expiry_params_list[] = {
> +	/* timeout_ns is invalid/out-of-range */
> +	{ .clk_unit = 0, .timeout_ns = -1LL,	.miniters = -1, .maxiters = 0, .desc = "invalid (-1LL)", },
> +	{ .clk_unit = 0, .timeout_ns = ~0ULL,	.miniters = -1, .maxiters = 0, .desc = "invalid (~0ULL)", },
> +	{ .clk_unit = 0, .timeout_ns = S64_MAX+1ULL, .miniters = -1, .maxiters = 0, .desc = "out-of-range (S64_MAX+1)", },
> +	{ .clk_unit = 0, .timeout_ns = U64_MAX,	.miniters = -1, .maxiters = 0, .desc = "out-of-range (U64_MAX)", },
> +	{ .clk_unit = 0, .timeout_ns = 0,	.miniters = -1, .maxiters = 1, .desc = "degenerate (0)",    },
> +
> +	/* timeout_ns is valid */
> +	{ .clk_unit = (0x1ULL << 28), .timeout_ns = 1,		    .miniters = 1,	      .maxiters = -1, .desc = "1",    },
> +	{ .clk_unit = (0x1ULL << 28), .timeout_ns = (0x1ULL << 30), .miniters = 1 << (30-28), .maxiters = -1, .desc = "1<<30",   },
> +	{ .clk_unit = (0x1ULL << 28), .timeout_ns = S32_MAX,	    .miniters = 1 << (31-28), .maxiters = -1, .desc = "S32_MAX", },
> +	{ .clk_unit = (0x1ULL << 28), .timeout_ns = U32_MAX,	    .miniters = 1 << (32-28), .maxiters = -1, .desc = "U32_MAX", },
> +	{ .clk_unit = (0x1ULL << 28), .timeout_ns = (0x1ULL << 33), .miniters = 1 << (33-28), .maxiters = -1, .desc = "1<<33",   },
> +	{ .clk_unit = (0x1ULL << 58), .timeout_ns = S64_MAX,	    .miniters = 1 << (63-58), .maxiters = -1, .desc = "S64_MAX", },
                                                                                                                  ^^^^^^^^^^^^
> +};

Can the last row actually test timeout expiry? The synthetic clock overflows
before the deadline can be reached.

synthetic_clock() advances by clk_unit per evaluation:

	clk->end_time += clk->extra;
	clk->niters++;
	return clk->end_time;

With clk_unit = 1<<58 and timeout_ns = S64_MAX, the deadline computed in
include/asm-generic/barrier.h becomes __scl_time_end = 2^58 + S64_MAX, which
needs the clock to reach 33 * 2^58 to expire. But the 32nd evaluation already
yields 32 * 2^58 == 2^63, which is S64_MIN as an s64, so the very next check
in __smp_cond_load_relaxed_timeout() breaks on the failure arm:

	if (__scl_time_now <= 0 || __scl_timeout <= 0) {
		VAL = READ_ONCE(*__PTR);
		break;
	}

So niters == 32 exactly and the break is 'time_expr_ns returned a negative
value' rather than 'timeout expired'. .miniters = 1 << (63-58) == 32 makes
KUNIT_EXPECT_GE(test, clk.niters, 32) pass by exactly zero margin, but this
doesn't distinguish an implementation that honours the timeout from one that
bails out early on clock failure.

> +static void test_smp_cond_relaxed(struct kunit *test)
> +{
> +	const struct smp_cond_expiry_params *p = test->param_value;
> +	struct clock_state clk = {
> +		.start_time = 0,
> +		.end_time = 0,
> +		.extra = p->clk_unit,
> +		.niters = 0,
> +	};
> +	s64 runtime;
         ^^^^^^^^^^^

> +
> +	flag = 0;
> +	smp_cond_load_relaxed_timeout(&flag,
> +				      0,
> +				      synthetic_clock(&clk),
> +				      p->timeout_ns);
> +
> +	runtime = (u64)clk.end_time - (u64)clk.start_time;
                  ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^

runtime is declared s64 but assigned an unsigned expression. For the S64_MAX
row this stores 2^63, which is a negative s64. The following check only passes
because typeof(right) is u64, which converts runtime back to unsigned:

	if (p->maxiters != 0)
		KUNIT_EXPECT_GE(test, runtime, p->timeout_ns);

Would declaring runtime as u64 (matching the casts on both operands) be
clearer?

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33438155296
--===============2706226096995356969==--

