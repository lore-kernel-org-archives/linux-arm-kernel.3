Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 55A7FCFA446
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Nov 2025 22:23:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bCPWmWtlb+YnxLE/KVN/JWxajfkHG28vVdO4+hOJ2t4=; b=vrhxyXz5KSn0PNSK112Rp1qwUh
	ide+4K5m/rysB5dIDc2uLlgfdS0r1n0v42kw3FuMUr9Qn65gQI3ohg7cjjiMcWBWxF/r3IsZO9l/G
	2BdF1lMBfoP5hVOEGKNZIroIrOIYAhyqkotSqPMY8cwdYSJ8fKz2WSXH5Rjet04Ui04Sn/5Q53MXk
	+w9TyH83+Voxsy5+09azCmcU7pEltFKLsUlaB86vobE2idUMlj+Vpkr1JCcCZJIQEJDPAY172xvOV
	wHo+lHxj8ha5MAdc+AST7zFv30fZvURPfhYjQ/MpH4f8bG7zTkIkuxnl2uVsZiiC/akxuATvzst2C
	QJuMEwBA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD4F-00000007Wb8-01iz;
	Thu, 20 Nov 2025 22:23:55 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vMD49-00000007WWy-1na8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Nov 2025 22:23:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6F67460214;
	Thu, 20 Nov 2025 22:23:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2369C4CEF1;
	Thu, 20 Nov 2025 22:23:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763677428;
	bh=RfmZ0q3dpeM9+27uKN9f18dW33MgVedYGjvrAMkwrSg=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=GwAPoNFyP6d2be4hxlHSIwrE/pEwofx3MPNIqaAZmPlKX5rSMZ66kmg+l8VunbIXf
	 AtpkULDNEgj9C6El/6GtczMVlcVkRkEV8S4+ZgFZLWYv9+pQjAx8vs0IMLJrLYvpOj
	 I48LcFUeC/uHmBI9yhAMqL4KuBJiUll9x1s00O17Nx1EgjFQe4BXToczZdZUop3j/V
	 vNl2wBf0fLchc1pC4yT3wlP0FI55pHphMfW6wcnPBD1PXRpqqM1pqLFGgrDt9mIqsU
	 a8uOxlzpIuyp3Qvfhr6bhg8Oh6xgEhLkmSoh4+lymm2GsdLGYEHmHqNrwbcRt07niE
	 JqfliggfbRXvQ==
Content-Type: multipart/mixed; boundary="===============8823332936014851221=="
MIME-Version: 1.0
Message-Id: <a302c70bc1914835ea69c8b30105741b1d1d06d549ef95b9650d0827e0ca276a@mail.kernel.org>
In-Reply-To: <20251120212402.466524-6-jolsa@kernel.org>
References: <20251120212402.466524-6-jolsa@kernel.org>
Subject: Re: [PATCHv3 bpf-next 5/8] ftrace: Add update_ftrace_direct_mod function
From: bot+bpf-ci@kernel.org
To: jolsa@kernel.org,rostedt@kernel.org,revest@google.com,mark.rutland@arm.com
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,menglong8.dong@gmail.com,song@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 20 Nov 2025 22:23:47 +0000 (UTC)
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

--===============8823332936014851221==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index c571deeff..4e2c0ed76 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h

[ ... ]

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index cc730a8fd..5243aefb6 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c

[ ... ]

> @@ -6486,6 +6486,74 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
>  	return err;
>  }
>
> +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
> +{
> +	struct ftrace_hash *orig_hash = ops->func_hash->filter_hash;
                                             ^^^^^^^^^^^^^^^^

Can this crash if ops->func_hash is NULL?  In update_ftrace_direct_add()
and update_ftrace_direct_del(), there's a defensive check:

    old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;

But update_ftrace_direct_mod() dereferences ops->func_hash before any
validation checks occur. The check_direct_multi(ops) validation happens
later, but the dereference occurs first at function entry.

> +	struct ftrace_func_entry *entry, *tmp;
> +	static struct ftrace_ops tmp_ops = {
> +		.func		= ftrace_stub,
> +		.flags		= FTRACE_OPS_FL_STUB,
> +	};
> +	unsigned long size, i;
> +	int err;
> +
> +	if (!hash_count(hash))
> +		return -EINVAL;
> +	if (check_direct_multi(ops))
> +		return -EINVAL;

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19552032346

--===============8823332936014851221==--

