Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A6D79C43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Jul 2026 08:11:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OkAYUluhr6YaET7SYNVUxr0Dp4O9CKoxwBGmYn1WFVQ=; b=bbhLSaB0PImSBfqZQlrPaJH92b
	DZPTTGAg6bL4v4gP4llTEXh6+M+zeHXV8CwbliNnjHh3mm9APa22iMXGd/4Lp/CvwhTc4bIqDcKHL
	z/vpbo2VeKot9NbxAMJuphHdrxJETv1hlX1KKzGoGJ+VRSGPrZofg/N9lxIv5S9MKkN2grV6WyaRy
	qWbBhf/lQIXHPNgogGQ2sAMjl0kY1bsZ7OXFJXtN3umgQ1gjjqZ+T19D7rPgeYcp9Wjd2GxdbF6Tv
	4OwwKrmaBt3IUR1DzUZq+YFRluvtIrOpYGLefA2rYVuit8IpUOZ02TyRq52lbe0tC+EZIHDMUhkcV
	f4e8DClw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYEu-0000000BGId-1168;
	Tue, 14 Jul 2026 08:11:40 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjYEt-0000000BGIS-1t4G
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Jul 2026 08:11:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 1374640383;
	Tue, 14 Jul 2026 08:11:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8B55C1F000E9;
	Tue, 14 Jul 2026 08:11:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784016699;
	bh=OkAYUluhr6YaET7SYNVUxr0Dp4O9CKoxwBGmYn1WFVQ=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=QMrRiQbSUJTKi269vkwvfFF8p4vJHa/WTG0TKyGdgwRFAqacT1WprLOQXpFgItCfZ
	 hgPmDXd0DTFRkENvaxWTUeOFxWLf9oFwb0rcrKmMGRuYGeJlc2OrpeYdk8iWTCOI5U
	 MlC4gjRsiejoAak2ncKtGyhk6duqixQDHqNntuQp+pfl5Vrm4k06xxV4N2I/8zM7be
	 PEO8rzNoYsnnHB7olATpQbYcZttDnSYXZc6hZqiWVEdbsAKvWylfpEqkGWaAinSzxf
	 PPUP1+lA/ht9YHKbNxXoiAIpdkeawyDFnzCkL7UqLS2XY5Kygpu0reqk4xaTQANps9
	 QBjOeFVEL9gJw==
Content-Type: multipart/mixed; boundary="===============9025402234174642696=="
MIME-Version: 1.0
Message-Id: <13456576e105a6f6c9c4c26c2dda990659ac74afb4474c04cfa4d768c0f86e46@mail.kernel.org>
In-Reply-To: <20260714073041.40250-15-ankur.a.arora@oracle.com>
References: <20260714073041.40250-15-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v14 14/15] barrier: add tests for smp_cond_load_*_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,julianbraha@gmail.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 14 Jul 2026 08:11:38 +0000 (UTC)
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

--===============9025402234174642696==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/lib/Kconfig.debug b/lib/Kconfig.debug
> index 1244dcac2294..07a06cfd820a 100644
> --- a/lib/Kconfig.debug
> +++ b/lib/Kconfig.debug
> @@ -2551,6 +2551,16 @@ config FFS_KUNIT_TEST
>  	  For more information on KUnit and unit tests in general,
>  	  please refer to Documentation/dev-tools/kunit/.
>
> +config BARRIER_TIMEOUT_KUNIT_TEST
> +	tristate "KUnit tests for smp_cond_load_relaxed_timeout()" if !KUNIT_ALL_TESTS
> +	depends on KUNIT
> +	default KUNIT_ALL_TESTS
> +	help
> +	  Builds KUnit tests that validate wake-up and timeout handling paths
> +	  in smp_cond_load_relaxed_timeout().
> +
> +	  If unusure, say N.

This isn't a bug, but there's a small typo here: should this be 'unsure'
instead of 'unusure' to match the standard phrasing used by the neighboring
config entries?

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/29315652884
--===============9025402234174642696==--

