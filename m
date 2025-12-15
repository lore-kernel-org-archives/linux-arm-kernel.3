Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A19D3D5B86E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 15 Dec 2025 21:31:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KDYY3/cjcHfgAessIlDJwuu5yT/HKJ6HNKkn22hzp1s=; b=LILwUK54g1Ce4S7gbjn9DFPvc9
	SrTxWN4PN/mfFcOKi1C/eWF01FHcYVm69w0BdyVU8VPv3wVkrkK333YhBj6rcNVlsOySyaFEWQui5
	8J8tIxyTN6LHzecTIagnRf79iqzqymIGRM1oJM5RUbgSlY8Z5KAJ+MJ+Ime7LDFHuWv1Za1IVbons
	hjpy+l4BBppzvmZgQvPLlzngpd2ThgColz30JdptSKEOCrgXsMBDeG9q8bxHwCJNHs0PNXavHsqJI
	noenJI8eL3aOHyuyTh8DURCKxk+rkWtN1ZVVz/y5o+85534gIxmyyagk/r7FYrAHU/wBrEgnySApE
	JAiG/R8w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGAc-00000004Iei-0hOV;
	Mon, 15 Dec 2025 21:31:54 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVGAa-00000004IeF-3jY8
	for linux-arm-kernel@lists.infradead.org;
	Mon, 15 Dec 2025 21:31:53 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0945960183;
	Mon, 15 Dec 2025 21:31:52 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6ECE9C4CEF5;
	Mon, 15 Dec 2025 21:31:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1765834311;
	bh=94yh35skFQRhjv5U7XWUf6dBriC1tan73BbLvp3rfis=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=tOwpuTQj02P4K7WTE9UmP4XWblTmcWF+wyJkkjCwTLgOkXCE9CzLXcpJ8bUWeth/n
	 nCEp5vlIR8qsS0w/vBhKII6NkYhjlTZnVNcdAfNFZDO6UkQ87cl+X9z0FFDcBj1rLR
	 ofZxrIWJQjk34mx8Ozh2mBD54m9iB7jBuCgxAOSQphMWbsWJ2Y5wPe/Td5K0ZuSp2A
	 SMg1w3zuV6bRMe0++QbtMIQfFgE1OZ37xjIzUcC3W8HGNQxgU6kCDPRbMeI5C3ldar
	 uDxC9Fxl96fg+DhWpElevoFPAnujIZIw+x+/j7CVZ2EZrbf9Ib9UhRQ/3jyON2/mpp
	 oQMY3lqAQG+aQ==
Content-Type: multipart/mixed; boundary="===============1830485644968437842=="
MIME-Version: 1.0
Message-Id: <95c13c0b793604796037ca67c191e1bfce22770dd020107c7179a698c5d49b91@mail.kernel.org>
In-Reply-To: <20251215211402.353056-2-jolsa@kernel.org>
References: <20251215211402.353056-2-jolsa@kernel.org>
Subject: Re: [PATCHv5 bpf-next 1/9] ftrace,bpf: Remove FTRACE_OPS_FL_JMP ftrace_ops flag
From: bot+bpf-ci@kernel.org
To: jolsa@kernel.org,rostedt@kernel.org,revest@google.com,mark.rutland@arm.com
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,menglong8.dong@gmail.com,song@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon, 15 Dec 2025 21:31:51 +0000 (UTC)
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

--===============1830485644968437842==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 015dd1049bea..505b7d3f5641 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h

[ ... ]

> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index 976d89011b15..b9a358d7a78f 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -214,10 +214,15 @@ static int modify_fentry(struct bpf_trampoline *tr, u32 orig_flags,
>  	int ret;
>
>  	if (tr->func.ftrace_managed) {
> +		unsigned long addr = (unsigned long) new_addr;
> +
> +		if (bpf_trampoline_use_jmp(tr->flags))
> +			addr = ftrace_jmp_set(addr);
> +
>  		if (lock_direct_mutex)
> -			ret = modify_ftrace_direct(tr->fops, (long)new_addr);
> +			ret = modify_ftrace_direct(tr->fops, addr);
>  		else
> -			ret = modify_ftrace_direct_nolock(tr->fops, (long)new_addr);
> +			ret = modify_ftrace_direct_nolock(tr->fops, addr);
>  	} else {
>  		ret = bpf_trampoline_update_fentry(tr, orig_flags, old_addr,
>  						   new_addr);
> @@ -240,10 +245,15 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
>  	}
>
>  	if (tr->func.ftrace_managed) {
> +		unsigned long addr = (unsigned long) new_addr;
> +
> +		if (bpf_trampoline_use_jmp(tr->flags))
> +			addr = ftrace_jmp_set(addr);
> +
>  		ret = ftrace_set_filter_ip(tr->fops, (unsigned long)ip, 0, 1);
>  		if (ret)
>  			return ret;
> -		ret = register_ftrace_direct(tr->fops, (long)new_addr);
> +		ret = register_ftrace_direct(tr->fops, addr);
>  	} else {
>  		ret = bpf_trampoline_update_fentry(tr, 0, NULL, new_addr);
>  	}

After this change, register_ftrace_direct() receives an address with
the LSB bit already set (via ftrace_jmp_set) and stores it as-is in
entry->direct. This address then flows through to ftrace_find_rec_direct()
which returns entry->direct unchanged.

In available_filter_functions_show():

    direct = ftrace_find_rec_direct(rec->ip);
    if (direct)
        seq_printf(m, "\n\tdirect-->%pS", (void *)direct);

Can the debug output show misleading symbol offsets? When the LSB is
set, %pS will resolve addresses like "function+0x1" instead of just
"function". This makes ftrace debug output harder to read for users
trying to understand direct call attachments.

The fix would be to strip the LSB bit before printing:
    seq_printf(m, "\n\tdirect-->%pS", (void *)ftrace_jmp_get(direct));

[ ... ]

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index bbb37c0f8c6c..b0dc911411f1 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6017,15 +6017,8 @@ int register_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
>  	if (ftrace_hash_empty(hash))
>  		return -EINVAL;
>
> -	/* This is a "raw" address, and this should never happen. */
> -	if (WARN_ON_ONCE(ftrace_is_jmp(addr)))
> -		return -EINVAL;
> -
>  	mutex_lock(&direct_mutex);
>
> -	if (ops->flags & FTRACE_OPS_FL_JMP)
> -		addr = ftrace_jmp_set(addr);
> -
>  	/* Make sure requested entries are not already registered.. */
>  	size = 1 << hash->size_bits;
>  	for (i = 0; i < size; i++) {

[ ... ]

> @@ -6146,13 +6139,6 @@ __modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr)
>
>  	lockdep_assert_held_once(&direct_mutex);
>
> -	/* This is a "raw" address, and this should never happen. */
> -	if (WARN_ON_ONCE(ftrace_is_jmp(addr)))
> -		return -EINVAL;
> -
> -	if (ops->flags & FTRACE_OPS_FL_JMP)
> -		addr = ftrace_jmp_set(addr);
> -
>  	/* Enable the tmp_ops to have the same functions as the direct ops */
>  	ftrace_ops_init(&tmp_ops);
>  	tmp_ops.func_hash = ops->func_hash;

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/20247816064

--===============1830485644968437842==--

