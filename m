Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4962CD6E51
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 13:02:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PagQjMyzKhVhDqqVGh4jcqJsE/7rBVptKLhIbufZc30=; b=nWpP/fqxWLynyPou7eQgfDlOn1
	x/F4/wSeQQA0bzBXg5+YwvXS+/at+IlvfmhmmMAr+kIFO/D+hy2qrIDGx0mfC0I/15eUmx1XWa1NL
	PG3BL8bAmIJNeESrO0hJTGJsSJ2C7Cdn1AcFruO4yjgkbVWyiJIfjay6wn60hjwviSFYMlKnWkilm
	L+V8ieyP2Ym0y+q8gokXm0vAsiyFjholcbEtm39gXBXvoKIXeEilgUAqRz8uH19dEnccthjVX3waG
	SJvOPU9D/EN5kI3IyBuIEcB9yVvga+K9ZcMzYKFJ/ZfK/KmTmN2EGlvyHUfrqkMDjR5eXNWasM4JF
	ILZ2efRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWxx-0000000AVbm-44VH;
	Thu, 13 Nov 2025 13:02:21 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWxv-0000000AVaq-1E5O
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 13:02:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C9C2F4077A;
	Thu, 13 Nov 2025 13:02:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 57F68C16AAE;
	Thu, 13 Nov 2025 13:02:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763038937;
	bh=bUt+qNmjwdJ7gVejc5aNxtgCj7fJkFVLsF+93X0SgNw=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=LiqKhseE0ZjpKS3SHSmWzPRqgP937v6AY4LeZnP+KIPvP+UZ2rOH1rws/j6FxkNkb
	 EtIprRU7GTxCbIvwhETrdRO0FXpwgmLXL5cbx5y1dJllSYEQKDK8Q7vt1Krud9Vn3E
	 EgXPVlWeOfRyP4x9DElh4/lUP26erBP0mqdpoSE1w6EH/TRjpTZ8ad5aWjyfdh+HM+
	 Z60F55ydiIe0KHPUq7Zzjl+u9TJqitqalySBBfykuNTEIa7X3UQLjpG8Wg7p2k6471
	 CmOEtx8T4t/IaV/ZlwElGm+NwprmW4PKcdcLoqopYXqgLL8Q5tpXdYMdsngkPUumbe
	 GR2SYNl2UBvoQ==
Content-Type: multipart/mixed; boundary="===============0521505570487395101=="
MIME-Version: 1.0
Message-Id: <c3260fe9e3d8ad79c75a6e8281f9fae5580beb3fcdd08e2015f417e11ec0a1b2@mail.kernel.org>
In-Reply-To: <20251113123750.2507435-6-jolsa@kernel.org>
References: <20251113123750.2507435-6-jolsa@kernel.org>
Subject: Re: [PATCHv2 bpf-next 5/8] ftrace: Add update_ftrace_direct_mod function
From: bot+bpf-ci@kernel.org
To: jolsa@kernel.org,rostedt@kernel.org,revest@google.com,mark.rutland@arm.com
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,menglong8.dong@gmail.com,song@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 13 Nov 2025 13:02:17 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_050219_370907_B7BFB3CA 
X-CRM114-Status: GOOD (  18.95  )
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

--===============0521505570487395101==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 433c36c3a..bacb6d9ab 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -544,6 +544,7 @@ int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
>
>  int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
>  int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash);
> +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock);
>
>  void ftrace_stub_direct_tramp(void);
>
> @@ -581,6 +582,11 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
>  	return -ENODEV;
>  }
>
> +int modify_ftrace_direct_hash(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
                ^^^^^^^^^^^^^^^^^^^^^^^^^^
The stub function name doesn't match the declaration. Should this be
update_ftrace_direct_mod() instead of modify_ftrace_direct_hash()?

> +{
> +	return -ENODEV;
> +}
> +

[ ... ]

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 345f3fdd2..627d05b57 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c
> @@ -6445,6 +6445,74 @@ int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
>  	return err;
>  }
>
> +int update_ftrace_direct_mod(struct ftrace_ops *ops, struct ftrace_hash *hash, bool do_direct_lock)
> +{
> +	struct ftrace_hash *orig_hash = ops->func_hash->filter_hash;
> +	struct ftrace_func_entry *entry, *tmp;
> +	static struct ftrace_ops tmp_ops = {
> +		.func		= ftrace_stub,
> +		.flags		= FTRACE_OPS_FL_STUB,
> +	};
> +	unsigned long size, i;
> +	int err;
> +
> +	if (!hash_count(hash))
> +		return 0;
> +	if (check_direct_multi(ops))
> +		return -EINVAL;
> +	if (!(ops->flags & FTRACE_OPS_FL_ENABLED))
> +		return -EINVAL;
> +	if (direct_functions == EMPTY_HASH)
> +		return -EINVAL;
> +
> +	if (do_direct_lock)
> +		mutex_lock(&direct_mutex);
> +
> +	/* Enable the tmp_ops to have the same functions as the direct ops */
> +	ftrace_ops_init(&tmp_ops);
> +	tmp_ops.func_hash = ops->func_hash;
> +
> +	err = register_ftrace_function_nolock(&tmp_ops);
> +	if (err)
> +		goto unlock;
> +
> +	/*
> +	 * Call __ftrace_hash_update_ipmodify() here, so that we can call
> +	 * ops->ops_func for the ops. This is needed because the above
> +	 * register_ftrace_function_nolock() worked on tmp_ops.
> +	 */
> +	err = __ftrace_hash_update_ipmodify(ops, orig_hash, orig_hash, true);
                                                                        ^^^^
Does __ftrace_hash_update_ipmodify() accept a fourth argument? The
function signature shows it only takes three parameters (ops, old_hash,
new_hash). This looks like a compilation error.

> +	if (err)
> +		goto out;

[ ... ]

> +
> +out:
> +	/* Removing the tmp_ops will add the updated direct callers to the functions */
> +	unregister_ftrace_function(&tmp_ops);
         ^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^^
Can this deadlock when do_direct_lock is true? Looking at the code:

  update_ftrace_direct_mod() with do_direct_lock=true
    -> mutex_lock(&direct_mutex)
    -> register_ftrace_function_nolock(&tmp_ops) succeeds
    -> __ftrace_hash_update_ipmodify() fails
    -> goto out (still holding direct_mutex)
    -> unregister_ftrace_function(&tmp_ops)
       -> cleanup_direct_functions_after_ipmodify()
          -> mutex_lock(&direct_mutex) /* deadlock */

The unregister path tries to reacquire direct_mutex that we're already
holding.

> +
> +unlock:
> +	if (do_direct_lock)
> +		mutex_unlock(&direct_mutex);
> +	return err;
> +}
> +
>  #endif /* CONFIG_DYNAMIC_FTRACE_WITH_DIRECT_CALLS */


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19332026793

--===============0521505570487395101==--

