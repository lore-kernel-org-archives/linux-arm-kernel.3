Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A10E2C43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jul 2026 02:12:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xd6c0bAtnDC1jjI/+BRH1ouYM9ZqgJCsh0Ij+BLlITo=; b=svYc6plMfCsFdEGtf8uZmkACxQ
	j0L7Z+y864feP9NlvHBKyNUsY5WGdAI0o6iCoObpu/qjawXEFilQ1oVbyzb0bwsg0yfRwgJGRCo5l
	S8RVmDtXnPTPQVYzMChPwZVIf46yCHgjZYdGjlfGlmYMCrFQr2Wa1LbAncgE0awTMzeL4iP4Ijyrp
	Hlh0hSwbytzGscQtgyZGR7OgM83WzQsbrGP+JMWKA6r5sTZwNqutAFZPCU4s8TGmpXuw7vUxFCmJI
	DEztUq2+c6g76rkr9G+DoWhB9uu/FiLUKzCWmL0XeFqtEEkBOmkHynB2sAvCSJmu7tnQ6X2NVSiyA
	UXn2oh/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6uD-00000003P5A-1U19;
	Thu, 02 Jul 2026 02:11:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wf6uC-00000003P4w-0ACk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jul 2026 02:11:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2909A40065;
	Thu,  2 Jul 2026 02:11:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 990FC1F000E9;
	Thu,  2 Jul 2026 02:11:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782958314;
	bh=Xd6c0bAtnDC1jjI/+BRH1ouYM9ZqgJCsh0Ij+BLlITo=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=kJ2APbjgjo3kIcdbXWZLU9i4Jy7JX7fIVJ98tZh21ByFZiFIZmGTjMt2YjOt4xqDY
	 L1/xj3jL4IIrJqKFSW4Rsc/OhBCMiXJ5+TeQnerxvDEcB2F/b6IyRvGmrhrfr33iEZ
	 17hxcp++bMvCffzco3LiIvltFl//A5gAzqNTGO/hNTMUUHnPSPbRivYG0bPRx6cAYN
	 abiV7QkyVYVwBsmoZ3Bxqog/NycG/Um3goXhWEsZYeXPZIcodFXo1ECVndZjkhsXz7
	 qTxVpLtbUUrO4uBw9XrJqtgj4odhFZb2ndZEqlhVm2U7vTjfiY7cyoqZK/EZN64rnk
	 U3Qv+xPpGyUtA==
Content-Type: multipart/mixed; boundary="===============1924622309690578587=="
MIME-Version: 1.0
Message-Id: <127be9fcbdb5b68bef8de1a918c3eaabb302f363788f96b5dca0cedfb583ef4d@mail.kernel.org>
In-Reply-To: <20260702013334.140905-16-ankur.a.arora@oracle.com>
References: <20260702013334.140905-16-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v13 15/15] barrier: add clock tests for smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu,  2 Jul 2026 02:11:53 +0000 (UTC)
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

--===============1924622309690578587==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/lib/tests/barrier-timeout-test.c b/lib/tests/barrier-timeout-test.c
> index 4226fb6456b3..ec78f8533006 100644
> --- a/lib/tests/barrier-timeout-test.c
> +++ b/lib/tests/barrier-timeout-test.c

[ ... ]

> @@ -112,8 +114,64 @@ static void test_smp_cond_timeout(struct kunit *test)
>  		KUNIT_EXPECT_GE(test, runtime, timeout_ns);
>  }
>
> +static s64 synthetic_clock(struct clock_state *clk)
> +{
> +	clk->end_time += clk->extra;
> +	clk->niters++;
> +
> +	return clk->end_time;
> +}
> +
> +
> +struct smp_cond_expiry_params {
> +	char	*desc;
> +	s64	timeout;
> +	s64	clk_inc;
> +	u32	niters;
> +};
> +
> +static const struct smp_cond_expiry_params expiry_params_list[] = {
> +	{ .clk_inc = (0x1ULL << 28), .timeout = 0,		.niters = 1,			.desc = "0",    },
> +	{ .clk_inc = (0x1ULL << 28), .timeout = 1,		.niters = 2,			.desc = "1",    },
> +	{ .clk_inc = (0x1ULL << 28), .timeout = (0x1ULL << 30), .niters = 1 + (1 << (30-28)),	.desc = "1<<30",   },
> +	{ .clk_inc = (0x1ULL << 28), .timeout = S32_MAX,	.niters = 1 + (1 << (31-28)),	.desc = "S32_MAX", },
> +	{ .clk_inc = (0x1ULL << 28), .timeout = U32_MAX,	.niters = 1 + (1 << (32-28)),	.desc = "U32_MAX", },
> +	{ .clk_inc = (0x1ULL << 28), .timeout = (0x1ULL << 33), .niters = 1 + (1 << (33-28)),	.desc = "1<<33",   },
> +};
> +
> +static void expiry_param_to_desc(const struct smp_cond_expiry_params *p, char *desc)
> +{
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE, "smp_cond_%s_timeout: clock-%s, timeout=%s, iterations=%u",
> +		"relaxed", "synthetic", p->desc, p->niters);
> +}

This isn't a bug, but since "relaxed" and "synthetic" never vary here,
could they be written directly into the format string rather than passed
through %s?

> +
> +static void test_smp_cond_expiry(struct kunit *test)
> +{
> +	const struct smp_cond_expiry_params *p = test->param_value;
> +	struct clock_state clk = {
> +		.start_time = 0,
> +		.end_time = 0,
> +		.extra = p->clk_inc,
> +		.niters = 0,
> +	};
> +	s64 runtime;
> +
> +	flag = 0;
> +	smp_cond_load_relaxed_timeout(&flag,
> +				      0,
> +				      synthetic_clock(&clk),
> +				      p->timeout);
> +
> +	runtime = (u64)clk.end_time - (u64)clk.start_time;
> +	KUNIT_EXPECT_EQ(test, clk.niters, p->niters);
> +	KUNIT_EXPECT_GE(test, runtime, p->timeout);
> +}
> +
> +
> +KUNIT_ARRAY_PARAM(smp_cond_expiry_params, expiry_params_list, expiry_param_to_desc);
>  static struct kunit_case barrier_timeout_test_cases[] = {
>  	KUNIT_CASE_PARAM(test_smp_cond_timeout, smp_cond_update_params_gen_params),
> +	KUNIT_CASE_PARAM(test_smp_cond_expiry, smp_cond_expiry_params_gen_params),
>  	{}
>  };


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/28559763019
--===============1924622309690578587==--

