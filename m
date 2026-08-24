Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FFFEC5DF9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Aug 2026 17:02:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWo8y5s7j9MJICjDRJikNnWcZwvVCVhZEXRYA5uAtSw=; b=HXOQ7ddByTgixEBR0iYBKhDrY+
	D5gTAdpl83nxJudNATk3JT+xZknIW+rKmb79R+cNUbl7UUYE8e692yaMjHre3iKnTivqfE3oopuzn
	ZSF4oM7oJazFYcZubnuNTa6ZHyFDt6XNxoOBAdtBXu7mcudfndoHlvorxnJdJwoyy2/CU8SbWZLJk
	XHGeGAX0W+YnreV1GWt86mcYqsWORFvM6HhES+yVapOK61YFrMErFoouhqgx+0fziDM/Tq3SUXZNv
	O9sNdDe5msYsyiGPsKtoi/w/o1c2nb76jzZuh/fQahlgTarVJ/6C9YRytvkLZ2K+qLCFzSuhmvIWq
	TrAlFVbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY4E-0000000H6Nw-1HBP;
	Mon, 24 Aug 2026 17:02:38 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wyY47-0000000H6KW-3dBm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Aug 2026 17:02:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 4260E4114A;
	Mon, 24 Aug 2026 17:02:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A0C3D1F000E9;
	Mon, 24 Aug 2026 17:02:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787590951;
	bh=eWo8y5s7j9MJICjDRJikNnWcZwvVCVhZEXRYA5uAtSw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=SN4thJ/WJQM9Zykv4pJZWKcuQx2Qo/cbzcTyvouFW/nTHLWzigGAKH1RsJRnp3tHI
	 kQX2/6D/cGd3zZ6gA+fYkHP1Tn/0ZzcosNZVPCeMg7bi95lnSfGTbuNsFOPsBkpYXu
	 /DKXz0kiwbft+9t0xjrLsSQRsHp4q5++9eRQjTeMyzqMaEvc169B7sccC/YorWElHW
	 U6bGVf3Fzpapea9YJUQiluDyvaZmSYr/3fJ7gFYuqerIP5z6GEet1hCx82/J9v16BK
	 t1SPJ4d8qwxcS+2WDRPlPl1iqEcDLptbNOHcEsQZOU3CDWKtFMbgnhKasKYwcAn+iU
	 slzdbeycy5hkg==
Content-Type: multipart/mixed; boundary="===============4795484880704545916=="
MIME-Version: 1.0
Message-Id: <9d40f172903042acd1692be0fecf4fbafbdd2c627051f38faf962015d745884d@mail.kernel.org>
In-Reply-To: <20260824160523.3907021-7-usama.anjum@arm.com>
References: <20260824160523.3907021-7-usama.anjum@arm.com>
Subject: Re: [PATCH 5/7] maccess: Batch TCO handling in kernel nofault loops
From: bot+bpf-ci@kernel.org
To: usama.anjum@arm.com,catalin.marinas@arm.com,will@kernel.org,mark.rutland@arm.com,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,eddyz87@gmail.com,memxor@gmail.com,martin.lau@linux.dev,song@kernel.org,yonghong.song@linux.dev,jolsa@kernel.org,emil@etsalapatis.com,ihor.solodrai@linux.dev,akpm@linux-foundation.org,david@kernel.org,ljs@kernel.org,liam@infradead.org,vbabka@kernel.org,rppt@kernel.org,surenb@google.com,mhocko@suse.com,linux-arm-kernel@lists.infradead.org,linux-kernel@vger.kernel.org,bpf@vger.kernel.org,linux-mm@kvack.org
Cc: usama.anjum@arm.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 24 Aug 2026 17:02:30 +0000 (UTC)
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

--===============4795484880704545916==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> The number of dynamic MSR TCO executions therefore changes as follows:
>
>     Work                         Before    After
>     N nofault accesses          2N        2
>     4 KiB nofault copy          1,024     2
>     N-byte strncpy              2N        2
>
> The 4 KiB case assumes 512 64-bit accesses. These figures come from the
> control flow rather than a runtime measurement, so the time saved depends
> on the CPU and workload.

This isn't a bug, but would it be worth either dropping the table in favour
of one sentence (one TCO pair per operation instead of one per access) or
backing it with a measurement on a real HW-tag-KASAN async config? Also,
could the "N nofault accesses" row say whether N accesses are within a
single batched operation?

> diff --git a/mm/maccess.c b/mm/maccess.c
> index f695ceefe6fc..87486bf98d15 100644
> --- a/mm/maccess.c
> +++ b/mm/maccess.c
> @@ -19,7 +19,7 @@ bool __weak copy_from_kernel_nofault_allowed(const void *unsafe_src,
>   */
>  #define copy_from_kernel_nofault_loop(dst, src, len, type, err_label)	\
>  	while (len >= sizeof(type)) {					\
> -		__get_kernel_nofault(dst, src, type, err_label);	\
> +		__get_kernel_nofault_bare(dst, src, type, err_label);	\
>  		kmsan_check_memory(src, sizeof(type));			\
>  		dst += sizeof(type);					\
>  		src += sizeof(type);					\
> @@ -39,13 +39,15 @@ long copy_from_kernel_nofault(void *dst, const void *src, size_t size)
>  		return 0;
>
>  	scoped_guard(pagefault) {
> -		if (!(align & 7))
> -			copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
> -		if (!(align & 3))
> -			copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
> -		if (!(align & 1))
> -			copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
> -		copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
> +		scoped_guard(__kernel_nofault_bare) {
> +			if (!(align & 7))
> +				copy_from_kernel_nofault_loop(dst, src, size, u64, Efault);
> +			if (!(align & 3))
> +				copy_from_kernel_nofault_loop(dst, src, size, u32, Efault);
> +			if (!(align & 1))
> +				copy_from_kernel_nofault_loop(dst, src, size, u16, Efault);
> +			copy_from_kernel_nofault_loop(dst, src, size, u8, Efault);
> +		}
>  	}
>  	return 0;
>  Efault:

A subsystem pattern flags this as potentially concerning: the nested
scoped_guard(__kernel_nofault_bare) introduces a second cleanup scope
inside an existing goto-based error path. include/linux/cleanup.h states
"the expectation is that usage of 'goto' and cleanup helpers is never
mixed in the same function. I.e. for a given routine, convert all
resources that need a 'goto' cleanup to scope-based cleanup, or convert
none of them." Every goto Efault now escapes two nested __cleanup()
scopes (the inner __kernel_nofault_bare and outer pagefault), relying on
the compiler to run both destructors in the correct order. The same
pattern also appears in copy_to_kernel_nofault and
strncpy_from_kernel_nofault below.

Tracing through the implementation suggests the unwind is correct in
practice: GCC and Clang run __attribute__((cleanup)) destructors when
leaving a scope via goto, in reverse order of declaration, so goto Efault
runs __end_kernel_nofault_bare() followed by pagefault_enable() in the
expected order. include/linux/uaccess.h's scoped-access documentation also
explicitly blesses leaving these scopes "with 'return', 'break' and 'goto'
at any point".

Is this an acceptable deepening of the goto-plus-guard mixing to two
levels, or should this be restructured to avoid the nested cleanup scopes?

This isn't a bug, but could this use guard(__kernel_nofault_bare)() as the
first statement of the existing pagefault scope instead of a nested
scoped_guard(), to keep the reindentation out of the diff and match the
form used in the BPF patch later in the series?

> @@ -55,7 +57,7 @@ EXPORT_SYMBOL_GPL(copy_from_kernel_nofault);
>
>  #define copy_to_kernel_nofault_loop(dst, src, len, type, err_label)	\
>  	while (len >= sizeof(type)) {					\
> -		__put_kernel_nofault(dst, src, type, err_label);	\
> +		__put_kernel_nofault_bare(dst, src, type, err_label);	\
>  		instrument_write(dst, sizeof(type));			\
>  		dst += sizeof(type);					\
>  		src += sizeof(type);					\

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/32751368606
--===============4795484880704545916==--

