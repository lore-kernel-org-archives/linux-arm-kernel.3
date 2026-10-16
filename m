Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A42A9CCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:55:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1G3X/wKLWQ8BtSB601M3ucPdAke4dgZzTbZ/O9Bh7aA=; b=WTu105f2iZEQn2Mvka1gwVFKQl
	QooufnuxhwyhtrN24ZS2JZLIkSTJjh/CD+M3DpzuCDngfdH7uSggoTdYpWmYTEuHDjQcBOJKJ3DsR
	NjPNYv9QQZIjqLQD66n0z6Rf6af8wQyqh5q6YlwCC3q8zaKF4/htmdVYhPjcnsi9Qj2uhBfamlZxg
	pYrbZ6kWOluexGTgJhNj0dc1h5w0QCr6WJ0jnVdu1ZNdkv0aQ+JU5N5wtTrSa6LinzY+spCrI+PSJ
	HdCE1VvDh/DRFTfREJzw5INHOrtj5kjtCs/WXVe0FVEFvYeq9GDgwQpsSOp8dBIuJZM3199EgRs3o
	iTg31dRw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcms-00000002H2e-22zO;
	Fri, 16 Oct 2026 07:55:34 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcmq-00000002H2O-3eFi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:55:32 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0DBCE60008;
	Fri, 16 Oct 2026 07:55:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DD101F000C4;
	Fri, 16 Oct 2026 07:55:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792137331;
	bh=1G3X/wKLWQ8BtSB601M3ucPdAke4dgZzTbZ/O9Bh7aA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=d79fYZ1l/3iad7+p0OOm0c4iu1ttaMzqjl5q6/IAYOjO5oyKyDkxbXjMp2exDnFi8
	 ErcZPHJFK4lX7BbYenXGuGDmuiqS9oOWTdUgwyAwx6ulkRr/pjuMWvBLkAuqkMq4ii
	 Hf1lQJtKyzbdDvcFwfa8Jwce5iuXBk1uXnDl9xhH2RakAMVgdY8cGlJL6kPClo9ugg
	 Yv4R9CnT1A42bVkf71OFoVdjGEg56v89XoIds+2J1t4PPpP0gHIBBxZXq4DFqu/dXr
	 qSjmiX+ArNBuP/NDcWJ99efsQ+WyUDdWCkjqaQi7U2WF5Io3Huxda+4pe5vrBelwOn
	 bMeNRPIYTK4Vw==
Content-Type: multipart/mixed; boundary="===============7152762966294616627=="
MIME-Version: 1.0
Message-Id: <e8d14ff76206a79ef0d97847df7802345cf747603e554bb2c015c155113fd3f3@mail.kernel.org>
In-Reply-To: <20261016070837.440748-16-ankur.a.arora@oracle.com>
References: <20261016070837.440748-16-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v16 15/16] barrier: timeout validity checks for smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@kernel.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,boris.ostrovsky@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Fri, 16 Oct 2026 07:55:29 +0000 (UTC)
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

--===============7152762966294616627==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> barrier: timeout validity checks for smp_cond_load_relaxed_timeout()

TL;DR: Nits only, in the new KUnit test: iteration bounds print as unprefixed
hex ("10" for 16), which is confusing in test names, and a format string has a
stray double space.

> diff --git a/lib/tests/barrier-timeout-test.c b/lib/tests/barrier-timeout-test.c
> index 9c12cd36e7d2..88b374ceb78b 100644
> --- a/lib/tests/barrier-timeout-test.c
> +++ b/lib/tests/barrier-timeout-test.c

[ ... ]

> +static void expiry_param_to_desc(const struct smp_cond_expiry_params *p, char *desc)
> +{
> +	char iters[32] = "";
> +
> +	if (p->miniters != -1)
> +		snprintf(iters, 32, ">= %llx", (u64)p->miniters);
> +	else if (p->maxiters != -1)
> +		snprintf(iters, 32, "%s %llx", p->maxiters == 0 ? "==" : "<=", (u64)p->maxiters);
> +
> +	snprintf(desc, KUNIT_PARAM_DESC_SIZE,
> +		 "smp_cond_*_timeout: clock=%s,  timeout=%s, iterations %s",
> +		 "synthetic", p->desc, iters);
> +}

This isn't a bug, but would printing the iteration bound in decimal (%lld)
or with a 0x prefix make the test names easier to match against the checks?

With "%llx" and no prefix, the U32_MAX row (miniters = 1 << (32-28)) is
reported as "iterations >= 10" and the 1<<33 row (miniters = 1 << (33-28))
as "iterations >= 20", while test_smp_cond_relaxed() actually checks for
>= 16 and >= 32.  The timeout labels in the same table use the "1<<33"
style, so the hex counts read inconsistently in the KTAP output.

Also, is the double space after "clock=%s," in the format string intended?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/38867477666
--===============7152762966294616627==--

