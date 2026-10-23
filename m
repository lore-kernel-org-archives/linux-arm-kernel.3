Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 75E6C606A31A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Oct 2026 13:25:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=GPVw+iGy;
	dkim=fail reason="signature verification failed" (2048-bit key, unprotected) header.d=infradead.org header.i=@infradead.org header.a=rsa-sha256 header.s=desiato.20200630 header.b=ltJ77d0S;
	dkim=pass (1024-bit key, unprotected) header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NrN162d0;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NrN162d0;
	dkim=neutral header.d=redhat.com header.i=@redhat.com header.a=rsa-sha256 header.s=mimecast20190719 header.b=NrN162d0
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:In-Reply-To:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=9Nv2cVwW/OKu3NQl5AdnfBAI1iL/npttcokjjp7Sh3k=; b=GPVw+iGy6bjoybFXdk9kQTN73m
	EfJJyMlfrKqQb8tF4NV8gYkq8MbcT5IjSUKDg5zLF8xZyknbb7CvXuyD9cFcir5m0q9fyJuA/DUjC
	94Y3dm5falPPISzK//8vhxKSHUwT3+NwENUwkI3+PiLDzLEJoeJcH5vgySPf+zS/FbLqthwKZfgd4
	qMVNwV0TCHz2/EG8+b+RQcvBlj5WBRiZMR1o6JSLBlc7pZfGCTDBdek0tU/WFQFqSnddQrP357vxY
	fyzW/sKUU9RKTbgoEnm2oR1XZXqKgtGpLyVe7YFNkpxVmsTN45XVKtIedneXAiVFIkKN6XSciTpuP
	GHqLVfbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFGG-0000000GN1E-1pTn;
	Fri, 23 Oct 2026 13:24:44 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFGC-0000000GN0r-0k7w
	for linux-arm-kernel@bombadil.infradead.org;
	Fri, 23 Oct 2026 13:24:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:In-Reply-To:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=9Nv2cVwW/OKu3NQl5AdnfBAI1iL/npttcokjjp7Sh3k=; b=ltJ77d0SXEZfSzgIxqv5R/0Aoi
	P249PX3Z7aE9rAxo5iHVmkfa+grj7AX6vYcm0W6Ml57NPES12zm/4S/S17TObalix3orCmGMTLRLo
	AdTAfm+1d8IwATG6HM0JCT2Wzeah2CUvqr7rATgKoHQQVSYbXE28xv1hY99SqCMMN7uGbBmuPCstS
	hf9UBSqoFj5JkfOO7QPAP85iRX/BX9eE9uzmpFV0kaX1SCXY8igyVJk93hkJMRq/mHxeexGgv61i1
	Wepi4hTjoEVAltn3Z+iMUhiYaKshrhND7Q9tnVZLtxjZ/hZV4hyKjUMlKvye4D/XglA9j1/7ekpOH
	UaMzHAgQ==;
Received: from us-smtp-delivery-124.mimecast.com ([170.10.129.124])
	by desiato.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xKFFx-00000009gmd-1eDS
	for linux-arm-kernel@lists.infradead.org;
	Fri, 23 Oct 2026 13:24:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792761861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Nv2cVwW/OKu3NQl5AdnfBAI1iL/npttcokjjp7Sh3k=;
	b=NrN162d04CF6jwpfvQN+5mECo3OlE/WNYNoWRLi5iOE7XoWKfWMdFw+XjGw7BK24USx1VI
	j4r/9dY3iRPp3rmWpbjms4t1md8KGdRG7+KWaB0XE+tr7foNTTMP+AEF89xQ75SkETbQ+/
	UGT3WzNHF3ML6P0Q6ADKcnyVbRQjeMs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792761861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Nv2cVwW/OKu3NQl5AdnfBAI1iL/npttcokjjp7Sh3k=;
	b=NrN162d04CF6jwpfvQN+5mECo3OlE/WNYNoWRLi5iOE7XoWKfWMdFw+XjGw7BK24USx1VI
	j4r/9dY3iRPp3rmWpbjms4t1md8KGdRG7+KWaB0XE+tr7foNTTMP+AEF89xQ75SkETbQ+/
	UGT3WzNHF3ML6P0Q6ADKcnyVbRQjeMs=
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1792761861;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=9Nv2cVwW/OKu3NQl5AdnfBAI1iL/npttcokjjp7Sh3k=;
	b=NrN162d04CF6jwpfvQN+5mECo3OlE/WNYNoWRLi5iOE7XoWKfWMdFw+XjGw7BK24USx1VI
	j4r/9dY3iRPp3rmWpbjms4t1md8KGdRG7+KWaB0XE+tr7foNTTMP+AEF89xQ75SkETbQ+/
	UGT3WzNHF3ML6P0Q6ADKcnyVbRQjeMs=
Received: from mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-497-6qAtnANiPbmUVI0GZIl8pw-1; Fri,
 23 Oct 2026 09:24:11 -0400
X-MC-Unique: 6qAtnANiPbmUVI0GZIl8pw-1
X-Mimecast-MFC-AGG-ID: 6qAtnANiPbmUVI0GZIl8pw_1792761849
Received: from mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.17])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 20446195394D;
	Fri, 23 Oct 2026 13:24:08 +0000 (UTC)
Received: from onestero-thinkpadp1gen7.tpbc.csb (headnet04.pony-001.prod.iad2.dc.redhat.com [10.2.32.116])
	by mx-prod-int-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with SMTP id BB84D195608C;
	Fri, 23 Oct 2026 13:24:05 +0000 (UTC)
Received: by onestero-thinkpadp1gen7.tpbc.csb (nbSMTP-1.00) for uid 13628
	oleg@redhat.com; Fri, 23 Oct 2026 15:24:07 +0200 (CEST)
Date: Fri, 23 Oct 2026 15:24:04 +0200
From: Oleg Nesterov <oleg@redhat.com>
To: Zhao Gongyi <zhaogongyi@bytedance.com>
Cc: catalin.marinas@arm.com, will@kernel.org, mark.rutland@arm.com,
	ruanjinjie@huawei.com, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] arm64: ptrace: don't warn on missing siginfo in a
 group-stop
Message-ID: <attf9KALBQyOGyco@redhat.com>
References: <20261023110710.10145-1-zhaogongyi@bytedance.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
In-Reply-To: <20261023110710.10145-1-zhaogongyi@bytedance.com>
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.17
X-Mimecast-MFC-PROC-ID: 0zNY-ENe-lwA-ZiAyZ5AEv6mR0mnyBTX_SUq2vkzwnU_1792761849
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261023_142425_589861_C070E04B 
X-CRM114-Status: GOOD (  16.33  )
X-Spam-Score: 2.7 (++)
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-11.2 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_PATCH,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On 10/23, Zhao Gongyi wrote:
>
> --- a/arch/arm64/kernel/ptrace.c
> +++ b/arch/arm64/kernel/ptrace.c
> @@ -573,10 +573,6 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	if (regs->syscallno == NO_SYSCALL)
>  		return;
>
> -	/* We should only be called when target is in a ptrace stop */
> -	if (WARN_ON_ONCE(!info))
> -		return;
> -
>  	/*
>  	 * For compat tasks, orig_r0 is provided directly through GPR index
>  	 * 17.
> @@ -588,7 +584,7 @@ static void update_syscall_orig_x0_after_ptrace(struct task_struct *target)
>  	 * Don't update orig_x0 for a syscall-exit-stop, as x0 now contains the
>  	 * return value of the system call.
>  	 */
> -	if ((info->si_code & ~0x80) == SIGTRAP &&
> +	if (info && (info->si_code & ~0x80) == SIGTRAP &&
>  	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT) {
>  		return;

LGTM, but I don't understand this arm-specific code.

And... Do we need to check target->last_siginfo at all?

ptrace_signal() -> ptrace_stop() path sets ->ptrace_message = 0.

In all other cases: if info != NULL, then .si_code == target->exit_code.
ptrace_event(event) users always use event != 0 and != 0x80.

So it seems that we can just do

	if ((target->exit_code & ~0x80) == SIGTRAP &&
	    target->ptrace_message == PTRACE_EVENTMSG_SYSCALL_EXIT)

?

I'll recheck... If I am right, perhaps it makes sense to simplify
ptrace_get_syscall_info_op().

Anyway, up to you.

Oleg.


