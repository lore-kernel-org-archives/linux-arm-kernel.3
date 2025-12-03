Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E98C9D1BDD8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 20:25:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oizhgXioNHlMsxU7fpUazMHWzQeHiexW1qEA1YQTP5s=; b=02Nz+oi5tVItp0eGFIh/pY9qLe
	9UvTB4JKJAePrBP8dQAuzJyQs9lnTputMcMBKpeQ0dmNte6vZvu2X1W5fEtQUL/a+gRJfC7DjqRzp
	x5nQiMKDq0o7pf/yTR1DH2W2D78ZWePzLZmxMIiWRtosj8wjou9JSXsV231LoNuTZZLJtUniahco5
	XRzU/arLPUY/8NTsdkx6QlYiHen8Nxk1zG2rChfWJ6hkkc60QsC/JL0GjvgEBUdZyXEpQDEbg/iIh
	no+TV8LWV2K020zLn5PNV4sSaIuYE8S5FgUPhfpKIregQU1LJE5Y13aIq3Xxr9sXMeV82nRMhGdwc
	+ake4+GQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtPb-000000072Bc-1Qp7;
	Wed, 03 Dec 2025 20:25:19 +0000
Received: from mail-wr1-x42d.google.com ([2a00:1450:4864:20::42d])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQtPY-000000072B4-1cCX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 03 Dec 2025 20:25:17 +0000
Received: by mail-wr1-x42d.google.com with SMTP id ffacd0b85a97d-429ce7e79f8so160850f8f.0
        for <linux-arm-kernel@lists.infradead.org>; Wed, 03 Dec 2025 12:25:15 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1764793514; x=1765398314; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=oizhgXioNHlMsxU7fpUazMHWzQeHiexW1qEA1YQTP5s=;
        b=gwXmMvxOTFGOEtEtvr1qlBInMN/9F54Sdb+bHV4ZhrqF4/a3tKq6T8UiO1lJWOqkXo
         ufNPlvO4UUICNc4vD8Ax7zp6MjAFa/+/x1MEj5nyoVJ0gjXnVpwKdZb5+XEyOONmhtZp
         cBlBsWDrMaAhaOE+1XpcGNhYA3NjbBtJSxV1bplQSSnF3Yd/IkhBTwSsTG1GcD+m8F7w
         eIToiyQ2ktO3IrvsJvGMFRgH3AqwlxyXoQ87z/+zh6ulN0BJNDwIxtfimG5EFCx/u47h
         t+INkWMx7ssfHvGdFGD+JTZdP+l5SZJJOnY9AZsANXRFuSLGootGtygfOH7K4NUCcc9f
         7HBQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1764793514; x=1765398314;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-gg:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=oizhgXioNHlMsxU7fpUazMHWzQeHiexW1qEA1YQTP5s=;
        b=HeU1ESep1hmOTK2kpADItR3nmMswJhlIEAqDXh67Gri+jiDIELWdgpmOvYS0VVPbZ4
         jH2M3Css/iIuFmrAf55H/PSR176OSf7QhIWHvaWE5p++UOMJF0wqYsccbFDsGn+jk01X
         nmF8Du5bYpXBQGjySh6lmOb/4I3ERSqyeGQcuHLaBCkGbUqtdbFayUoZjRq9qBwXO7uk
         0MK1gtGMRb5aPFquzSUXFVXhcjIThyTOw0+pSEXTUFEvTpuxeqeATl0zpansV7qLMAWE
         7fudvmtCXEoUd3IeF8qY3SXBAC6OsjP/PdGGUI/e8ImF3FbGv+qNHHPpN6zVSLyg3sN3
         wnVQ==
X-Forwarded-Encrypted: i=1; AJvYcCVJmhU1VIpRzEnMJonPAYQn3ZdlnJMBaTLDLxNyOh+Q46SL2I7WrlIwDYkv1spE3XtRAAeHTFQtbLj88UvV0y5x@lists.infradead.org
X-Gm-Message-State: AOJu0YyxQv2CArnGD4HMDBL0EilMpL0Vc3/N/w8XZydJaDql3sg6uNL/
	/jyCE9AZyXKHgamMtJi1CxZcmaKf9+dvBafoZTphtujOnE3w5+OP8uhS
X-Gm-Gg: ASbGncuuGZZQJVq8aWpdWOX2vxPaOCOiv6io6YGuVP6QiGhIcyAs8t9wneDdWjMQxMe
	IUamXWq3fTsbCPXei0k4es6VXIKkeEOw9n1iE70MU6LS9zW3sIIC5I+m7WWfrR+cTISg6lVf2BP
	14kx5LQEcoh695k/vI5cHCiS/fXfwAjiFooJC68aeupyofc/1gy8k5eSufc+XAhnVn2noa7VdKj
	I+yu1vKdi91oPofZ2G7uYyOdOkc5aVLGxbNINhkXOQFwnv1iDRAa9jFKblJPAQmvIAeolmkLKKR
	JpWJkOTnXP3dPzu+eLIlH9QnUnooLGgY5DwRSjM5yyN5nPYreboJVxneylxng1gR3LYRoVxkukZ
	VObYcUXDANZui5bTreanO2LAIvPSnfYVeG7ZEXVQ2u4OChpe+iTAFXxddf8zYbThZ/3/NNkzNHw
	g=
X-Google-Smtp-Source: AGHT+IFB0dXhJUy1H3c/C1Xkph6gjV5AO8hAVflW07n8nwfxgbiBQcjbDHqUFViroxpKvd/enGc4Jg==
X-Received: by 2002:a05:6000:430e:b0:42b:2a41:f3d with SMTP id ffacd0b85a97d-42f797fdfe9mr305634f8f.19.1764793514432;
        Wed, 03 Dec 2025 12:25:14 -0800 (PST)
Received: from krava ([176.74.159.170])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-42e1c5d614asm40905162f8f.12.2025.12.03.12.25.13
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 03 Dec 2025 12:25:13 -0800 (PST)
From: Jiri Olsa <olsajiri@gmail.com>
X-Google-Original-From: Jiri Olsa <jolsa@kernel.org>
Date: Wed, 3 Dec 2025 21:25:12 +0100
To: bot+bpf-ci@kernel.org
Cc: rostedt@kernel.org, revest@google.com, mark.rutland@arm.com,
	bpf@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-trace-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, ast@kernel.org,
	daniel@iogearbox.net, andrii@kernel.org, menglong8.dong@gmail.com,
	song@kernel.org, martin.lau@kernel.org, eddyz87@gmail.com,
	yonghong.song@linux.dev, clm@meta.com, ihor.solodrai@linux.dev
Subject: Re: [PATCHv4 bpf-next 4/9] ftrace: Add update_ftrace_direct_add
 function
Message-ID: <aTCcqGiWnEmGGuRI@krava>
References: <20251203082402.78816-5-jolsa@kernel.org>
 <d0d8e0d78f614eb8b443772b50fb36093d48c7f43374316246ad3ad836b5c9ce@mail.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <d0d8e0d78f614eb8b443772b50fb36093d48c7f43374316246ad3ad836b5c9ce@mail.kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251203_122516_451248_C984EC7D 
X-CRM114-Status: GOOD (  24.93  )
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

On Wed, Dec 03, 2025 at 08:47:45AM +0000, bot+bpf-ci@kernel.org wrote:
> > diff --git a/include/linux/ftrace.h b/include/linux/ftrace.h
> > index 8c034b028..eb60d971e 100644
> > --- a/include/linux/ftrace.h
> > +++ b/include/linux/ftrace.h
> 
> [ ... ]
> 
> > diff --git a/kernel/trace/ftrace.c b/kernel/trace/ftrace.c
> > index 84aee9096..1660a8754 100644
> > --- a/kernel/trace/ftrace.c
> > +++ b/kernel/trace/ftrace.c
> 
> [ ... ]
> 
> > +int update_ftrace_direct_add(struct ftrace_ops *ops, struct ftrace_hash *hash)
> > +{
> > +	struct ftrace_hash *old_direct_functions = NULL, *new_direct_functions = NULL;
> > +	struct ftrace_hash *old_filter_hash = NULL, *new_filter_hash = NULL;
> > +	struct ftrace_func_entry *entry;
> > +	int i, size, err = -EINVAL;
> > +	bool reg;
> > +
> > +	if (!hash_count(hash))
> > +		return -EINVAL;
> > +
> > +	mutex_lock(&direct_mutex);
> > +
> > +	/* Make sure requested entries are not already registered. */
> > +	size = 1 << hash->size_bits;
> > +	for (i = 0; i < size; i++) {
> > +		hlist_for_each_entry(entry, &hash->buckets[i], hlist) {
> > +			if (__ftrace_lookup_ip(direct_functions, entry->ip))
> > +				goto out_unlock;
> > +		}
> > +	}
> > +
> > +	old_filter_hash = ops->func_hash ? ops->func_hash->filter_hash : NULL;
> > +	old_direct_functions = direct_functions;
> > +
> > +	/* If there's nothing in filter_hash we need to register the ops. */
> > +	reg = hash_count(old_filter_hash) == 0;
> > +	if (reg) {
> > +		if (ops->func || ops->trampoline)
> > +			goto out_unlock;
> > +		if (ops->flags & FTRACE_OPS_FL_ENABLED)
> > +			goto out_unlock;
> > +	}
> > +
> > +	err = -ENOMEM;
> > +	new_filter_hash = hash_add(old_filter_hash, hash);
> > +	if (!new_filter_hash)
> > +		goto out_unlock;
> > +
> > +	new_direct_functions = hash_add(old_direct_functions, hash);
> > +	if (!new_direct_functions)
> > +		goto out_unlock;
> 
> Can new_filter_hash leak here?  If the second hash_add() fails but the
> first one succeeds, update_ftrace_direct_add() will goto out_unlock
> with new_filter_hash pointing to allocated memory.  At out_unlock, only
> old_filter_hash gets freed, not new_filter_hash.

mamma mia, can't get this right apparently.. yea, will fix in next
version, thanks

jirka


> 
> register_ftrace_direct() handles this by freeing new_hash on error:
> 
>     out_unlock:
>         mutex_unlock(&direct_mutex);
> 
>         if (free_hash && free_hash != EMPTY_HASH)
>             call_rcu_tasks(&free_hash->rcu, register_ftrace_direct_cb);
> 
>         if (new_hash)
>             free_ftrace_hash(new_hash);
> 
>         return err;
> 
> > +
> > +	rcu_assign_pointer(direct_functions, new_direct_functions);
> > +
> > +	if (reg) {
> > +		ops->func = call_direct_funcs;
> > +		ops->flags |= MULTI_FLAGS;
> > +		ops->trampoline = FTRACE_REGS_ADDR;
> > +		ops->local_hash.filter_hash = new_filter_hash;
> > +
> > +		err = register_ftrace_function_nolock(ops);
> > +		if (err) {
> > +			/* restore old filter on error */
> > +			ops->local_hash.filter_hash = old_filter_hash;
> > +			old_filter_hash = new_filter_hash;
> > +
> > +			/* cleanup for possible another register call */
> > +			ops->func = NULL;
> > +			ops->trampoline = 0;
> > +		}
> > +	} else {
> > +		err = ftrace_update_ops(ops, new_filter_hash, EMPTY_HASH);
> > +		/*
> > +		 * new_filter_hash is dup-ed, so we need to release it anyway,
> > +		 * old_filter_hash either stays on error or is released already
> > +		 */
> > +		old_filter_hash = new_filter_hash;
> > +	}
> > +
> > +	if (err) {
> > +		/* reset direct_functions and free the new one */
> > +		rcu_assign_pointer(direct_functions, old_direct_functions);
> > +		old_direct_functions = new_direct_functions;
> > +	}
> > +
> > + out_unlock:
> > +	mutex_unlock(&direct_mutex);
> > +
> > +	if (old_direct_functions && old_direct_functions != EMPTY_HASH)
> > +		call_rcu_tasks(&old_direct_functions->rcu, register_ftrace_direct_cb);
> > +	if (old_filter_hash)
> > +		free_ftrace_hash(old_filter_hash);
> > +
> > +	return err;
> > +}
> 
> 
> ---
> AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
> See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md
> 
> CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19887401362


