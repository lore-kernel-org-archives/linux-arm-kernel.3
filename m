Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCC4BCC6B38
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=LfnYK9wuqqNvQYXwL+C7ZhSJlmFE6g+Vm0Z+GDaNmYU=; b=Ma1oiVlzwrGQYoZx8FUd64y/g6
	AiGHZ0SIF1vQ1fEn+9sFX5tiyuDJTDqcDthHJJ1ppt1oCzmI1IJ8zxp4VNTd6NXZFm+2/TU/Bvnh+
	Q8FVUa5rvYbKZ/ZCv509YXvwE1oRH5iBTcOxwljmS/FxkN8uEpiqy+UyZkPud54fzTRJ+x1cTuj+F
	q2wb2oSFyn7TdMzZVxvyGPJl+mf7+PT63YP5MiEIj3Qk/esdqs13B2vXeDrEJH9XijICfbMs9n6Zz
	NiuInrFF/4dJD67JjcAQwRl8G9mfKd6pQdp513y6W34WLEzmPSg1n2QeaC9G32x3P473oJ9MxL9eo
	RaBF+1vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcn0-00000002H63-3MeF;
	Fri, 16 Oct 2026 07:55:42 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcmz-00000002H5d-3BFP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:55:41 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 38BB360A8B;
	Fri, 16 Oct 2026 07:55:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 331861F000C5;
	Fri, 16 Oct 2026 07:55:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792137340;
	bh=LfnYK9wuqqNvQYXwL+C7ZhSJlmFE6g+Vm0Z+GDaNmYU=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=YGJWk1NdE3s6iWwTJlsbjI8oPUGeiGVdn00Uf/zNNuJ8svicsxzQ+ax9qYK0SRNE7
	 WCYC3ZrfXH3HMnDUKcddXsqYngI/SP3Ni59N9Z/5Dc9DUoCnCE0bpWz1l54skdrHZE
	 xsEWL6iGX33jCZczTzYCqapqxESUaa988Fd81gkRkuuXFj5eKe+FQcnyvNtgjS2OLO
	 pQYiYhitTbZkshOjKDjhKdHbFWUylzCZXzv7WJwtCWcF6z++yrGD1zEAU0ffDGjU33
	 gXQfCwQhlYuDG0kFeHLOTZtrdAvccooO7gV2fmeg278SmH43w0ssfzP1BEFx6C4/lV
	 YonIDIlyEOXFA==
Content-Type: multipart/mixed; boundary="===============6623771970694444259=="
MIME-Version: 1.0
Message-Id: <afe82bcf3be90afbd548fc12aa07092f1216d45c90f5a6df7143c71657e566e4@mail.kernel.org>
In-Reply-To: <20261016070837.440748-15-ankur.a.arora@oracle.com>
References: <20261016070837.440748-15-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v16 14/16] barrier: add tests for smp_cond_load_*_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@kernel.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,boris.ostrovsky@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,julianbraha@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Fri, 16 Oct 2026 07:55:38 +0000 (UTC)
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

--===============6623771970694444259==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> barrier: add tests for smp_cond_load_*_timeout()

TL;DR: Nit only, in the KUnit test patch: the suite name
"smp-cond-load-*-timeout" and file name barrier-timeout-test.c may not follow
KUnit naming conventions (underscores, _kunit.c suffix).

> diff --git a/lib/tests/barrier-timeout-test.c b/lib/tests/barrier-timeout-test.c
> new file mode 100644
> index 000000000000..9c12cd36e7d2
> --- /dev/null
> +++ b/lib/tests/barrier-timeout-test.c
> @@ -0,0 +1,129 @@

[ ... ]

> +static struct kunit_suite barrier_timeout_test_suite = {
> +	.name = "smp-cond-load-*-timeout",
> +	.test_cases = barrier_timeout_test_cases,
> +};

this isn't a bug, but would a different suite name fit the KUnit naming
conventions better?

Documentation/dev-tools/kunit/style.rst asks for underscores rather than
dashes in suite names, and for the test file to be named
tests/<suite>_kunit.c.  The current name "smp-cond-load-*-timeout" uses
dashes and a literal '*', and the file is barrier-timeout-test.c.

Would something like smp_cond_load_timeout (with the file named
lib/tests/barrier_timeout_kunit.c or similar) work instead?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/38867477666
--===============6623771970694444259==--

