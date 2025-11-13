Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8D87CD6E52
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Nov 2025 13:02:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a4bOtlaEKjp7aP0efBjDvfVIDhVAY0nUTOxhke6kEDw=; b=yNJmyv/iKtoLONEJUm7i4i8Ic+
	7Jsd+Y8LeRWEdy/Vm88f3C8KRE7a5FfhO1uZi3DMppW31UIetmoD8LNcHUXimWhBEs6lF/DMzBked
	e+GtlJNOJ3Lhi2UuRKsF4k75Jdpm/nVvm4vV2n6K61PM+QhwCZhDCMNbLrPr/7yCMblGndog7KDkJ
	ESupc6a0Hj6JGxZuxqGnnYlI8YTCDGvCdngUQ5wM5j3BLCWRxPxm/6FgovuKH5Z09UcKaeqxeClJn
	+y0NtEbnSqAYLGnxb3BHk510eo3/7QQHcaVRN/vCL/dHcNaUi+IZzJTg6mU0pB/UDUtB+d0/X7Lqo
	jQkGxCnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWy1-0000000AVdY-0LKG;
	Thu, 13 Nov 2025 13:02:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vJWxx-0000000AVbW-30Vk
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Nov 2025 13:02:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6F4E243E97;
	Thu, 13 Nov 2025 13:02:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0AB07C4CEF8;
	Thu, 13 Nov 2025 13:02:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763038941;
	bh=DAkhzIUlG7glLtApG0JL3Nzp/VCQH1OHCGnfSmY2w+A=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=Lvk+IzY+lB1vXAiV3KiK/Dl+SooaiijPPGGZX7BqCq5K/P6OhksFdbSdOhWHl5Jby
	 Cxk9xl9C2WaNalvHvFdPt9cQKgHflLxl5xFQ507KNhLAFLDIQSZN9KhwryG07WM4uk
	 C/ObKhgdZFKgSMdPKHLif6IOYcdWY8YHOlW9aNSozldLaOoN1DjzXNU5wfo27lDzCR
	 w8U7r4/EpeYxGXBMuWMeUl7X6xVabSWoz1Eofc20iBbz//jBB4vy1hG9yzv8PqxFKf
	 w962dj6qYhXTQhb3iMg+WL/iV0ErG8t1OfR7C+Txk/JbA0BWOvKnfmJIS+S019Fbtj
	 M+cyXHOjQGlog==
Content-Type: multipart/mixed; boundary="===============2663991294437569515=="
MIME-Version: 1.0
Message-Id: <367c6cc9ffa12937ce18f37fc1271e3d17a3f7aa6ea6d1152cc8a41539994865@mail.kernel.org>
In-Reply-To: <20251113123750.2507435-5-jolsa@kernel.org>
References: <20251113123750.2507435-5-jolsa@kernel.org>
Subject: Re: [PATCHv2 bpf-next 4/8] ftrace: Add update_ftrace_direct_del function
From: bot+bpf-ci@kernel.org
To: jolsa@kernel.org,rostedt@kernel.org,revest@google.com,mark.rutland@arm.com
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,menglong8.dong@gmail.com,song@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Thu, 13 Nov 2025 13:02:21 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251113_050221_814906_FD741246 
X-CRM114-Status: GOOD (  17.95  )
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

--===============2663991294437569515==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index ded3a306a..433c36c3a 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h
> @@ -543,6 +543,7 @@ int modify_ftrace_direct(struct ftrace_ops *ops, unsigned long addr);
>  int modify_ftrace_direct_nolock(struct ftrace_ops *ops, unsigned long addr);
>
>  int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash);
> +int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash);
>
>  void ftrace_stub_direct_tramp(void);

[ ... ]

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 311ce6406..345f3fdd2 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c

[ ... ]

> +int update_ftrace_direct_del(struct ftrace_ops *ops, struct ftrace_hash *hash)
> +{
> +	struct ftrace_hash *new_hash = NULL, *filter_hash = NULL, *free_hash = NULL;
> +	struct ftrace_func_entry *del, *entry;
> +	unsigned long size, i;
> +	int err = -EINVAL;
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
> +	mutex_lock(&direct_mutex);
> +
> +	/* Make sure requested entries are already registered. */
> +	size = 1 << hash->size_bits;
> +	for (i = 0; i < size; i++) {
> +		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
> +			del = __ftrace_lookup_ip(direct_functions, entry->ip);
> +			if (!del || del->direct != entry->direct)
> +				goto out_unlock;
> +		}
> +	}
> +
> +	err = -ENOMEM;
> +	filter_hash = hash_sub(ops->func_hash->filter_hash, hash);
> +	if (!filter_hash)
> +		goto out_unlock;
> +
> +	new_hash = hash_sub(direct_functions, hash);
> +	if (!new_hash)
> +		goto out_unlock;

Can this leak new_hash?  If hash_sub() succeeds for both filter_hash
and new_hash, but then either unregister_ftrace_function() or
ftrace_update_ops() fails below, we goto out_unlock without freeing
new_hash.  The cleanup code only frees filter_hash:

> +
> +	/* If there's nothing left, we need to unregister the ops. */
> +	if (ftrace_hash_empty(filter_hash)) {
> +		err = unregister_ftrace_function(ops);
> +		/* cleanup for possible another register call */
> +		ops->func = NULL;
> +		ops->trampoline = 0;
> +		ftrace_free_filter(ops);
> +		ops->func_hash->filter_hash = NULL;
> +	} else {
> +		err = ftrace_update_ops(ops, filter_hash, EMPTY_HASH);
> +	}
> +
> +	if (!err) {
> +		free_hash = direct_functions;
> +		rcu_assign_pointer(direct_functions, new_hash);
> +	}
> +
> + out_unlock:
> +	mutex_unlock(&direct_mutex);
> +
> +	if (free_hash && free_hash != EMPTY_HASH)
> +		call_rcu_tasks(&free_hash->rcu, register_ftrace_direct_cb);
> +	if (filter_hash)
> +		free_ftrace_hash(filter_hash);
> +
> +	return err;
> +}

If err != 0, new_hash remains allocated but is never freed.  Should the
cleanup code add free_ftrace_hash(new_hash) when it's non-NULL?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19332026793

--===============2663991294437569515==--

