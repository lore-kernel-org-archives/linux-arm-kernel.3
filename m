Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D8F0F94CCA
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Apr 2026 05:57:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9ovs0MfObWMEAYCItMLX9P88HtOnHXJzwGjgwUQTUPk=; b=3L7M12Vu4qOKV4x2gd6lLUAWQW
	rmSEBhev9MoswQSS0PAS+3y6NnA42Yiqilev8UgVOIg64m18QFDe/zebV71+mrnZQSwLNBf+jC82J
	C17yhz6ugd7jYV5SeDzhcqp87PqTAhxTfHQsL5Hh6iMVBN0vjogxLfa8w1cAxZLrtzyBxKP3X27KK
	EoQJ7P63lHNhxRWkjrwN6F74XM9pGuRD4p62QtBEtJoJhp41AaI478faiODi0+JwQZgTiA9gAsGHT
	XvicSk+kWglSumbowF/OmgoQGjco46pumOi//vnZFyfzukoRH1CtNPkx9vZ9Lfqr4JtxN636KQbe3
	uvnmemvQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQaQ-00000009d87-3Ypx;
	Wed, 22 Apr 2026 05:57:22 +0000
Received: from galois.linutronix.de ([193.142.43.55])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wFQaO-00000009d6V-18QU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Apr 2026 05:57:21 +0000
Date: Wed, 22 Apr 2026 07:56:56 +0200
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020; t=1776837422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ovs0MfObWMEAYCItMLX9P88HtOnHXJzwGjgwUQTUPk=;
	b=z5IC0+haCM0qWEllygNCw1PQuTkzu27LqFvjZSvHBj4ZXX8x69qmRyLlv/UBe1hpavFlNM
	xWrYnJLe9NMEmiLbh/SuuT+WgMn4eXdsYUjWVKGKJMbVU7Bc80LB363PKX0p8lcu6Itoyq
	KUPRIvrKxB1ksVBwG5SWbrvbXoswGpYDpDt8rSHNugjBVSNo94gQHIA8T+gvRNoU710V6r
	0Hvlo41aHnxIHrv3R+lnIqBv70/1roeTC55p1mEzqOqMRFV/nYCzH6SAhAfCBAgcxj6l1h
	vdi1lFJmHN8sZvA3EG+GgJKDUNY1luwR7gzMXi18/KzGqpVkO1Xc6fZZh9zoJA==
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=linutronix.de;
	s=2020e; t=1776837422;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=9ovs0MfObWMEAYCItMLX9P88HtOnHXJzwGjgwUQTUPk=;
	b=+vmzERtyQwX568xh6yyuX1pXFpi4zySDDVo3wqpZxoaQv0bY7b4/qQbeMQimiVFIVKtEUr
	xm9FtjQQ5+pTkNAQ==
From: Thomas =?utf-8?Q?Wei=C3=9Fschuh?= <thomas.weissschuh@linutronix.de>
To: Ricardo Ribalda <ribalda@chromium.org>
Cc: linux-arm-kernel@lists.infradead.org, 
	Linux Kernel Mailing List <linux-kernel@vger.kernel.org>, linuxppc-dev@lists.ozlabs.org
Subject: Re: New warning in linus/master
Message-ID: <20260422071541-9a295128-d913-418f-a21c-1386fca30290@linutronix.de>
References: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <CANiDSCsOy0P1if-gJZqOM5pTJ0RDcwVfru1B7KFbTOEMqjPKJw@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260421_225720_474160_D425CD35 
X-CRM114-Status: GOOD (  20.89  )
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

Hi Ricardo,

On Wed, Apr 22, 2026 at 11:51:45AM +0800, Ricardo Ribalda wrote:
> Media-CI has found a couple of new warnings in the latest kernel
> version for aarch64 and powerpc. They get fixed with this patch and
> before moving I wanted to know if this was under your radar.

Thanks for the report. I was not aware of these so far.

> diff --git a/arch/arm64/kernel/vdso/Makefile b/arch/arm64/kernel/vdso/Makefile
> index 7dec05dd33b7..65914842fae0 100644
> --- a/arch/arm64/kernel/vdso/Makefile
> +++ b/arch/arm64/kernel/vdso/Makefile
> @@ -50,7 +50,7 @@ CFLAGS_vgettimeofday.o = $(CC_FLAGS_ADD_VDSO)
>  CFLAGS_vgetrandom.o = $(CC_FLAGS_ADD_VDSO)
> 
>  ifneq ($(c-gettimeofday-y),)
> -  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> +  CFLAGS_vgettimeofday.o += -include $(c-gettimeofday-y)
> -Wno-maybe-uninitialized
>  endif

(...)

I'd like to know exactly what is going on before suppressing the warning.
It is a non-standard warning, only enabled by *some* of the vDSO builds
for some reason.

> https://gitlab.freedesktop.org/linux-media/users/ribalda/-/pipelines/1649144/test_report?job_name=cross-gcc

While I was able to download a configuration from this job and also use the
same container image, I can not reproduce the issue. Is the configuration the
full one or only the template?

Could you provide full reproduction steps?

> CONFIG_CC_VERSION_TEXT="aarch64-linux-gnu-gcc (Debian 15.2.0-16) 15.2.0"

The linked test log shows GCC 14.2, not 15.2.
Not that I could reproduce it with either one...

>   SYNC    include/config/auto.conf
>   CC      arch/arm64/kernel/vdso/vgettimeofday.o
> In file included from <command-line>:
> In function ‘vdso_set_timespec’,
>     inlined from ‘do_aux’ at /workdir/lib/vdso/gettimeofday.c:266:2,
>     inlined from ‘__cvdso_clock_gettime_common’ at
> /workdir/lib/vdso/gettimeofday.c:293:10,
>     inlined from ‘__cvdso_clock_gettime_data.constprop’ at
> /workdir/lib/vdso/gettimeofday.c:306:7:
> /workdir/lib/vdso/gettimeofday.c:104:26: warning: ‘sec’ may be used
> uninitialized [-Wmaybe-uninitialized]
>   104 |         ts->tv_sec = sec + __iter_div_u64_rem(ns, NSEC_PER_SEC, &ns);
>       |                      ~~~~^~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~
> /workdir/lib/vdso/gettimeofday.c: In function
> ‘__cvdso_clock_gettime_data.constprop’:
> /workdir/lib/vdso/gettimeofday.c:242:13: note: ‘sec’ was declared here
>   242 |         u64 sec, ns;
>       |             ^~~

The same pattern is used in some other do_ handlers, which do not generate this
warning. I also can't immediately see what is wrong.

(...)


Thomas

