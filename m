Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A748DCCA462
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 Oct 2026 07:55:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KCKGc1h3JuJ4XsRCss0FTfTKjcZRv6QTRQ+XtcBdPNA=; b=f8Gsnf4Ni0TgWBsd12dadZCXCG
	eprrGOZY/ISd+g1sREGaGOZiseAS6afsb54ZFdnfOHQ3APSwyqZ74F/HLPvFgLETXUhJ98vWPBxE8
	K0ppkUoeC6TZSITtbadiiQysIUd/qxCAOdOegylsDGF+iGS4EhmIj+pMNyUR6fqzS7oJ+S4qOZ3B7
	qfSGh9yVhWVtzkMoxMeZ355We4wJ4Covhbr/uQwsEux3i5GbbU3t1WoM7VYADGW1RPEZYUBPmUTo3
	6619pXkjkBzhD+l/UrOzc3Azuosp+MsYVWZ+CtI7WdOYfZdXvMDh6lDyHByy4u+2BW2AdbQgArCeT
	jKmiSQ1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcnA-00000002HAr-01xO;
	Fri, 16 Oct 2026 07:55:52 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xHcn8-00000002H9x-24Al
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 Oct 2026 07:55:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id E868360A8C;
	Fri, 16 Oct 2026 07:55:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 092881F000C5;
	Fri, 16 Oct 2026 07:55:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1792137349;
	bh=KCKGc1h3JuJ4XsRCss0FTfTKjcZRv6QTRQ+XtcBdPNA=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=NwrH0AcTPiVX5vUvCVczRIw4WfrsxvozuDI0Gn5OuBTjM6wESPqJg50kAL5Gz41w1
	 VFzhaNnMpy6zfPMqtjQv0s9oRcC3XMJb6dNMOz0DD8ANIHkHo5PNJsS+iuScc3WXip
	 5OqkowMfjyzWwYnPtstJGHF2wizwg70s/TxL4/PmlhCPwsn5JTY7P5JMuGTmfq1UUc
	 dqg/iXoubZlla1oO8/wXpWKPv6FRMjVnqKAGaxDcs2/i16m6RWbd5tzvdx1is5n/Hr
	 K8OAqkjkjtNG6epXDHiEgYcTfas0jtMxseJF1J1v7+Wdb1oJTzgMs4wKlmcLinWuis
	 Ny869A5cn941w==
Content-Type: multipart/mixed; boundary="===============8960242286083874251=="
MIME-Version: 1.0
Message-Id: <1b0e8ca62af5ba9b15ad83c3f4a2e78f0c50e17adf28cb7979a4c8f8ad6294a8@mail.kernel.org>
In-Reply-To: <20261016070837.440748-2-ankur.a.arora@oracle.com>
References: <20261016070837.440748-2-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v16 01/16] asm-generic: barrier: Add smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@kernel.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,boris.ostrovsky@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Fri, 16 Oct 2026 07:55:46 +0000 (UTC)
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

--===============8960242286083874251==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> asm-generic: barrier: Add smp_cond_load_relaxed_timeout()

TL;DR: Nit only: the kernel-doc comment in asm-generic/barrier.h binds to the
internal __smp_cond_load_relaxed_timeout() helper, causing a new kernel-doc
warning; it should move above the public macro.

> diff --git a/include/asm-generic/barrier.h b/include/asm-generic/barrier.h
> index b99cb57dfccc..ac0a8b5e0ffe 100644
> --- a/include/asm-generic/barrier.h
> +++ b/include/asm-generic/barrier.h

[ ... ]

> @@ -273,6 +274,115 @@ do {									\
>  })
>  #endif
>

[ ... ]

> +/**
> + * smp_cond_load_relaxed_timeout() - (Spin) wait for cond with no ordering
> + * guarantees until a timeout expires.
> + * @ptr: pointer to the variable to wait on.
> + * @cond_expr: boolean expression to wait for.

[ ... ]

> + * dependent ways.
> + */
> +#ifndef smp_cond_load_relaxed_timeout
> +#define __smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
> +				      time_expr_ns, timeout_ns)		\
> +({									\

[ ... ]

> +#define smp_cond_load_relaxed_timeout(ptr, cond_expr,			\
> +				      time_expr_ns, timeout_ns)		\
> +({									\

[ ... ]

Does the kernel-doc comment above attach to the right macro?  It sits
directly above "#ifndef smp_cond_load_relaxed_timeout" followed by the
"#define __smp_cond_load_relaxed_timeout(" helper, so kernel-doc skips the
#ifndef and binds the comment to the internal helper:

  $ tools/docs/kernel-doc -none include/asm-generic/barrier.h
  Warning: include/asm-generic/barrier.h expecting prototype for
  smp_cond_load_relaxed_timeout(). Prototype was for
  __smp_cond_load_relaxed_timeout() instead

The parent commit produces no kernel-doc warnings for this header, and the
warning is still present at the end of the series, so no later patch
addresses it.  The public smp_cond_load_relaxed_timeout() macro ends up
with no kernel-doc.

Could the /** block be moved down so it sits directly above
"#define smp_cond_load_relaxed_timeout(", with the
__smp_cond_load_relaxed_timeout() helper getting a plain /* comment?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/38867477666
--===============8960242286083874251==--

