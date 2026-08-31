Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D0F8FC61DFD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 21:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sgGJaUb4R+xJg+MMxTj0+TmMU4rJr/qTBBhHZsUa1cE=; b=A5Oe3pI02mHiVFlsDaO180Z9zc
	sYWdt+WPxFYKxTez2zEnhObpxYvOFkllev50xpXGXkLnvw7vQUaNMRpgz4COsfvZqm9y8y85Xn+nW
	JsLdHlSKWB6Ev+69VHLG2x5GTO7/JdQ1sMMRcalWlSgvcpE2/kFPN6kVYJxsd/zE5WNjQSWrpKNDk
	JXSHf52bNHSA4pH1oE9pT871rMbcxSkgUU9CKand+UQnu5570T2BYqug5wZEBvamtzIY7Gq7b/6Lc
	V3kwPWdeilcNkUlHiZa1XgJbXV7JVeu2pv5DkVtMfqJQV6GVkm3M9lokACNZ5lZqveI+ALnfH/XDG
	P463p0aA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19NY-0000000AWH0-29fZ;
	Mon, 31 Aug 2026 21:17:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x19NF-0000000AWA3-0cwS
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 21:17:05 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 954B060534;
	Mon, 31 Aug 2026 21:17:00 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B178D1F000E9;
	Mon, 31 Aug 2026 21:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788211020;
	bh=sgGJaUb4R+xJg+MMxTj0+TmMU4rJr/qTBBhHZsUa1cE=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=TqIibbFC5uAZ5mj/s3rM8OUWL7vzYPOXwenGkRH5taeITWsXJ7h0bTzddY9F7EW8o
	 ry/sQC9tHrlfC1Tji2J+SEt6wsd+Wj6MJh4X0oD+KYAe4Ugeho5oN8b/WnayhKtPYB
	 u1LOzrqeMsbLtIa5hkbQu7EiZaB5Z23v6vdMNU1tFKSWfCLgMH8yUP44Gtb62TKDJc
	 wtZPeMpHvdwPctVTYWb88mqKZn+CRiQP1xhtifD+qtV+ZFCsihezBRubA8rhpyALKL
	 nez5zV4rBu2mGMCAUK0uWQMWw1krMeYu7JWePGLfXLT7+uSmnhwP+446mp6Mnl0gD+
	 gBtQOCPSSD2Lw==
Content-Type: multipart/mixed; boundary="===============4990838912714265687=="
MIME-Version: 1.0
Message-Id: <f47a36669d06226dec908ca89ff9d04bdfd594844394b09ef45c4291283532ea@mail.kernel.org>
In-Reply-To: <20260831202251.305046-5-ankur.a.arora@oracle.com>
References: <20260831202251.305046-5-ankur.a.arora@oracle.com>
Subject: Re: [PATCH v15 04/16] arm64: support WFET in smp_cond_load_relaxed_timeout()
From: bot+bpf-ci@kernel.org
To: ankur.a.arora@oracle.com,linux-kernel@vger.kernel.org,linux-arch@vger.kernel.org,linux-arm-kernel@lists.infradead.org,linux-pm@vger.kernel.org,bpf@vger.kernel.org
Cc: arnd@arndb.de,catalin.marinas@arm.com,will@kernel.org,peterz@infradead.org,akpm@linux-foundation.org,mark.rutland@arm.com,harisokn@amazon.com,cl@gentwo.org,ast@kernel.org,rafael@kernel.org,daniel.lezcano@linaro.org,memxor@gmail.com,zhenglifeng1@huawei.com,xueshuai@linux.alibaba.com,rdunlap@infradead.org,david.laight.linux@gmail.com,broonie@kernel.org,joao.m.martins@oracle.com,boris.ostrovsky@oracle.com,konrad.wilk@oracle.com,ashok.bhat@arm.com,ankur.a.arora@oracle.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,mason@kernel.org,ihor.solodrai@linux.dev
Date: Mon, 31 Aug 2026 21:16:58 +0000 (UTC)
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

--===============4990838912714265687==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> arm64: support WFET in smp_cond_load_relaxed_timeout()
>
> To handle WFET use __cmpwait_timeout() similarly to __cmpwait(). These
> call out to the respective __cmpwait_case_timeout_##sz(),
> __cmpwait_case_##sz() functions.

This isn't a bug, but could the changelog say why the WFET path is
preferred over the event-stream path, and note how the deadline is
derived (and on which counter base), rather than describing which macros
call which?

> diff --git a/arch/arm64/include/asm/barrier.h b/arch/arm64/include/asm/barrier.h
> index d186a4558776..d1f4f571adaa 100644
> --- a/arch/arm64/include/asm/barrier.h
> +++ b/arch/arm64/include/asm/barrier.h

[ ... ]

> diff --git a/arch/arm64/include/asm/cmpxchg.h b/arch/arm64/include/asm/cmpxchg.h
> index 6cf3cd6873f5..7985ae5ceb0f 100644
> --- a/arch/arm64/include/asm/cmpxchg.h
> +++ b/arch/arm64/include/asm/cmpxchg.h

[ ... ]

> @@ -235,20 +237,52 @@ __CMPWAIT_CASE( ,  , 64);
>
>  #undef __CMPWAIT_CASE
>
> +#define __CMPWAIT_TIMEOUT_CASE(w, sfx, sz)				\
> +static inline void __cmpwait_case_timeout_##sz(volatile void *ptr,	\
> +					       unsigned long val,	\
> +					       u64 timeout_ns)		\
> +{									\
> +	unsigned long tmp;						\
> +	u64 ecycles = __delay_cycles() +				\
> +			nsecs_to_cycles(timeout_ns);			\
> +	asm volatile(							\
> +	"	sevl\n"							\
> +	"	wfe\n"							\
> +	"	ldxr" #sfx "\t%" #w "[tmp], %[v]\n"			\
> +	"	eor	%" #w "[tmp], %" #w "[tmp], %" #w "[val]\n"	\
> +	"	cbnz	%" #w "[tmp], 2f\n"				\
> +	"	msr s0_3_c1_c0_0, %[ecycles]\n"				\
> +	"2:"								\
> +	: [tmp] "=&r" (tmp), [v] "+Q" (*(u##sz *)ptr)			\
> +	: [val] "r" (val), [ecycles] "r" (ecycles));			\
> +}

This isn't a bug, but since only the final wait instruction differs
from __CMPWAIT_CASE (the sevl/wfe/ldxr/eor/cbnz prologue and the
operand lists are identical), would folding the two into one macro that
takes the wait instruction (and the optional deadline operand) read
better, in the style of __XCHG_CASE()? And is the 1f -> 2f label
renumbering needed?

> +
> +__CMPWAIT_TIMEOUT_CASE(w, b, 8);
> +__CMPWAIT_TIMEOUT_CASE(w, h, 16);
> +__CMPWAIT_TIMEOUT_CASE(w,  , 32);
> +__CMPWAIT_TIMEOUT_CASE( ,  , 64);
> +
> +#undef __CMPWAIT_TIMEOUT_CASE

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/33438155296
--===============4990838912714265687==--

