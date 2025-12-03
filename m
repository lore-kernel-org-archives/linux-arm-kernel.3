Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BCE90D116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 08:47:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OhwJNdhLL4BGhngmppgYhTIgwJrnpcqsget1VLEkzqE=; b=wgVWFB1CudiN6FvJpDtO+biwq6
	g43uOjDgAl0weisCs/1A8cae/ruAemPvcKBL41NfUpNgrxSPKufQbBPmxzV9qsvzjxIQgDvSFXp6g
	TmE2wcOBnDMQm8m2aMj76c0zzWSplVE0zgOqoiguW55r8cv9kPAlsyxO3eEBPFgDTCvhXa7ODxvvF
	7JOCZI1XORsIIicxqSHhSQS4Zn5Ga3xHp0lfBMdQfzs6qAO02HgxhftJyMMWAs6sZelkcB7lG19Ua
	r3NFEhVFBovTIeaRMCeZiT4zIgj6wtvg0aAzFsHzCgx4yHnvfDhk6eLf8sZgvjIc10KLUi8xZbZX9
	57B0iKzQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiWc-00000006Kba-1pHh;
	Wed, 03 Dec 2025 08:47:50 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQiWa-00000006KbT-1jnv
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 08:47:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 736276019B;
	Wed,  3 Dec 2025 08:47:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BCF6BC19422;
	Wed,  3 Dec 2025 08:47:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764751667;
	bh=zZggOqyqpCFVEMcM9cHwsXefF4PRk8oAmhf5XqTg3nE=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=Hl5QYGaYXkUGRQCpvqRKGGxwk72j/uZIW+2KInS5UiITtjd7fhh0KOWuqZkkqC0ch
	 RPOI7nYQr7R9cfdzxPZhjEoRat5tGEzxjZwv/RzOG9NLmbm2dtmtU6XNak89b59mqv
	 5TP7FnB8Z7P5GdMIMNghZcum0ZXDHrcnAUpMNboZR7sejeYjK+X8wWh9IncPmV7Mg9
	 nvbUgWWNnuleBsyBvknXHohHCAtLX0+IFgeQhnf0oJ9k+XZDmlIDhJfVvdxcG2PTfq
	 Pz96eqw+7b+h5fgUsAZyut+31r9AmaG2/I6KYhfJmLZLQLY5x4rpA8QnmBwqSkqmvL
	 xhdX17i0JyZQA==
Content-Type: multipart/mixed; boundary="===============9160476271581551712=="
MIME-Version: 1.0
Message-Id: <d0d8e0d78f614eb8b443772b50fb36093d48c7f43374316246ad3ad836b5c9ce@mail.kernel.org>
In-Reply-To: <20251203082402.78816-5-jolsa@kernel.org>
References: <20251203082402.78816-5-jolsa@kernel.org>
Subject: Re: [PATCHv4 bpf-next 4/9] ftrace: Add update_ftrace_direct_add function
From: bot+bpf-ci@kernel.org
To: jolsa@kernel.org,rostedt@kernel.org,revest@google.com,mark.rutland@arm.com
Cc: bpf@vger.kernel.org,linux-kernel@vger.kernel.org,linux-trace-kernel@vger.kernel.org,linux-arm-kernel@lists.infradead.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,menglong8.dong@gmail.com,song@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Wed,  3 Dec 2025 08:47:45 +0000 (UTC)
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

--===============9160476271581551712==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> index 8c034b028..eb60d971e 100644
> --- a/include/linux/ftrace.h
> +++ b/include/linux/ftrace.h

[ ... ]

> diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> index 84aee9096..1660a8754 100644
> --- a/kernel/trace/ftrace.c
> +++ b/kernel/trace/ftrace.c

[ ... ]

> +int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
> +{
> +	struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions = NULL;
> +	struct ftrace_hash *old_filter_hash = NULL, *new_filter_hash = NULL;
> +	struct ftrace_func_entry *entry;
> +	int i, size, err = -EINVAL;
> +	bool reg;
> +
> +	if (!hash_count(hash))
> +		return -EINVAL;
> +
> +	mutex_lock(&direct_mutex);
> +
> +	/* Make sure requested entries are not already registered. */
> +	size = 1 << hash->size_bits;
> +	for (i = 0; i < size; i++) {
> +		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
> +			if (__ftrace_lookup_ip(direct_functions, entry->ip))
> +				goto out_unlock;
> +		}
> +	}
> +
> +	old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
> +	old_direct_functions = direct_functions;
> +
> +	/* If there's nothing in filter_hash we need to register the ops. */
> +	reg = hash_count(old_filter_hash) == 0;
> +	if (reg) {
> +		if (ops->func || ops->trampoline)
> +			goto out_unlock;
> +		if (ops->flags & FTRACE_OPS_FL_ENABLED)
> +			goto out_unlock;
> +	}
> +
> +	err = -ENOMEM;
> +	new_filter_hash = hash_add(old_filter_hash, hash);
> +	if (!new_filter_hash)
> +		goto out_unlock;
> +
> +	new_direct_functions = hash_add(old_direct_functions, hash);
> +	if (!new_direct_functions)
> +		goto out_unlock;

Can new_filter_hash leak here?  If the second hash_add() fails but the
first one succeeds, update_ftrace_direct_add() will goto out_unlock
with new_filter_hash pointing to allocated memory.  At out_unlock, only
old_filter_hash gets freed, not new_filter_hash.

register_ftrace_direct() handles this by freeing new_hash on error:

    out_unlock:
        mutex_unlock(&direct_mutex);

        if (free_hash && free_hash != EMPTY_HASH)
            call_rcu_tasks(&free_hash->rcu, register_ftrace_direct_cb);

        if (new_hash)
            free_ftrace_hash(new_hash);

        return err;

> +
> +	rcu_assign_pointer(direct_functions, new_direct_functions);
> +
> +	if (reg) {
> +		ops->func = call_direct_funcs;
> +		ops->flags |= MULTI_FLAGS;
> +		ops->trampoline = FTRACE_REGS_ADDR;
> +		ops->local_hash.filter_hash = new_filter_hash;
> +
> +		err = register_ftrace_function_nolock(ops);
> +		if (err) {
> +			/* restore old filter on error */
> +			ops->local_hash.filter_hash = old_filter_hash;
> +			old_filter_hash = new_filter_hash;
> +
> +			/* cleanup for possible another register call */
> +			ops->func = NULL;
> +			ops->trampoline = 0;
> +		}
> +	} else {
> +		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> +		/*
> +		 * new_filter_hash is dup-ed, so we need to release it anyway,
> +		 * old_filter_hash either stays on error or is released already
> +		 */
> +		old_filter_hash = new_filter_hash;
> +	}
> +
> +	if (err) {
> +		/* reset direct_functions and free the new one */
> +		rcu_assign_pointer(direct_functions, old_direct_functions);
> +		old_direct_functions = new_direct_functions;
> +	}
> +
> + out_unlock:
> +	mutex_unlock(&direct_mutex);
> +
> +	if (old_direct_functions && old_direct_functions != EMPTY_HASH)
> +		call_rcu_tasks(&old_direct_functions->rcu, register_ftrace_direct_cb);
> +	if (old_filter_hash)
> +		free_ftrace_hash(old_filter_hash);
> +
> +	return err;
> +}


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19887401362

--===============9160476271581551712==--

