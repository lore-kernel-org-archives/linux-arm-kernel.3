Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 356EDC624C6
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:17:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IdM1XWvxdz+i+Rsaxc9nZdXh9vkCMN0AcdrsPyDFCUM=; b=KhEkx+hciiv2IMpD4yn9ogxVGl
	eQL8gZqp06od+iPwxF05ozR4uNAQl9E/MrV0NDAPHOfyT2Td4wSZBDFIYGdJdjj/DRXy9KULDJyH0
	UlYR6EBEHAj++E6jkwYTPedPhU7NfL2onidWOEvDLKomBrxXPFKqZiESB2hvtfjxcKDNJyxF2QFSY
	h58P98akJ34LIH2XJ8LhW4KvnBciYXEy12AUEaWMQzKuac5dBYLwI5NzfLvZXrnk1/msZnqoaWS2o
	vPRs3aj/y7Y/jhk5UqonD0NRkfnrIf2GXy6sDtHcPx5GTFVwBj+V9fYGRGY4J/dMdt/YWLqZJCjr8
	cmshvC3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19NE-0000000AW8W-02yy;
	Mon, 31 Aug 2026 21:17:00 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19N6-0000000AW6c-2yzI
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:16:52 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id EA905402C5;
	Mon, 31 Aug 2026 21:16:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 737E01F00A3D;
	Mon, 31 Aug 2026 21:16:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211011;
	bh=IdM1XWvxdz+i+Rsaxc9nZdXh9vkCMN0AcdrsPyDFCUM=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=itq7NxD7qwmq1xmxdpookRc81QBC5kaIq8xQaBqCGgKusKyX2UJgkoUdS86Ea5Y1Y
	 svlYC+us9vhfKNusMI8tEE3IHtPuS2yu7yiQJQ+1z4bPAKz4w2cl+5qJCtkHHReQl5
	 RtppBRcJHxPRciXfV+EFnfPp/ukpJ2oYu8+Zh75I2UWhNTJELVBg5dYzrzz9ve5smt
	 bSYu9lE1pod27Ip0LVB4IzQdAWgUt3xW2xCTyD8TgbiYGbLALVoe5IxNIZLe7Qbh1o
	 2uv63aw8LMQL8EJ6BRhxM3WOOmzgl1QZtjQFXr7fRaDq/+IEEFKlAv7fqclKqsiDdV
	 EEbV/VwFFaBvQ==
Content-Type: multipart/mixed; boundary="===============5519600281003427931=="
MIME-Version: 1.0
Message-Id: <dff2cd4bf7142cbeeb7030ffda447910f42a67c49ac91021c09c0c3a24a80553@mail.kernel.org>
In-Reply-To: <20260831202251.305046-10-ankur.a.arora@oracle.com>
References: <20260831202251.305046-10-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v15 09/16] bpf/rqspinlock: switch check_timeout() to a clock interface
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 31 Aug 2026 21:16:50 +0000 (UTC)
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

--===============5519600281003427931==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/kernel/bpf/rqspinlock.c b/kernel/bpf/rqspinlock.c
> index 111ec80ea958..1b249c6f0674 100644
> --- a/kernel/bpf/rqspinlock.c
> +++ b/kernel/bpf/rqspinlock.c

[ ... ]

> @@ -196,8 +196,12 @@ static noinline int check_deadlock_ABBA(rqspinlock_t *lock, u32 mask)
>  	return 0;
>  }
>
> -static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
> -				  struct rqspinlock_timeout *ts)
> +/*
> + * Returns current monotonic time in ns on success or, negative errno
> + * value on failure due to timeout expiration or detection of deadlock.
> + */
> +static noinline s64 clock_deadlock(rqspinlock_t *lock, u32 mask,
> +				   struct rqspinlock_timeout *ts)
>  {

This isn't a bug, but could the commit message mention that
check_timeout() is renamed to clock_deadlock()? The subject and body
still refer to check_timeout(), but readers of the patch will see
clock_deadlock() in the diff.

Also, the changelog describes what the new interface does but not why
it's needed. Could it note that the clock return value is what the
following patch feeds to smp_cond_load_acquire_timeout()?

[ ... ]

> @@ -231,15 +239,22 @@ static noinline int check_timeout(rqspinlock_t *lock, u32 mask,
>   * as the macro does internal amortization for us.
>   */
>  #ifndef res_smp_cond_load_acquire
> -#define RES_CHECK_TIMEOUT(ts, ret, mask)                              \
> -	({                                                            \
> -		if (!(ts).spin++)                                     \
> -			(ret) = check_timeout((lock), (mask), &(ts)); \
> -		(ret);                                                \
> +#define RES_CHECK_TIMEOUT(ts, ret, mask)					\
> +	({									\
> +		s64 __timeval_err = 0;						\
> +		if (!(ts).spin++)						\
> +			__timeval_err = clock_deadlock((lock), (mask), &(ts));	\
> +		(ret) = __timeval_err < 0 ? __timeval_err : 0;			\
> +		__timeval_err;							\
>  	})
>  #else
> -#define RES_CHECK_TIMEOUT(ts, ret, mask)			      \
> -	({ (ret) = check_timeout((lock), (mask), &(ts)); })
> +#define RES_CHECK_TIMEOUT(ts, ret, mask)					\
> +	({									\
> +		s64 __timeval_err;						\
> +		__timeval_err = clock_deadlock((lock), (mask), &(ts));		\
> +		(ret) = __timeval_err < 0 ? __timeval_err : 0;			\
> +		__timeval_err;							\
> +	})
>  #endif

This isn't a bug, but since the previous patch removed the last
definition of res_smp_cond_load_acquire, is the #else arm still
reachable, or could it be dropped here rather than updated?

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33438155296
--===============5519600281003427931==--

