Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5F3C7CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 01:28:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0EFnRyIIewBsF1qa/LcoAdGsrqh7sImFPTSHGGtYo0w=; b=qxUw/uC8d+34dT+DZM1VXmKg1P
	IjYuMi/v5cbFqQBiW0uX6ccH7U9qnv2qh1v2y12+Eik8unW5uaKkdNhcPipG2fJPLpLVbh4l5Y4NO
	WAPvSWXva2hfqaWOYfmOJ1Ul9WK3rekJNpyZ+c/SshDEJbODJrPI7ePd+LY6Hq9Aq3OnwPOsAW71o
	vKxHlPccZYTBvtJd6N84fnKRsVKNm+g3KFchEOasDtHyDLAYKw6+RFjDxv9NRNzO/deGuo2VHKnb8
	sxcLqgXYmr3p4afAPKuZTbUY45jx1R+eYU6oEIFhQJr7kfmonCWkbi9jdXTbWQoE+EV+Lu/oZMRMl
	XhHUt9Sg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAVb-0000000H86l-2GK5;
	Tue, 18 Nov 2025 01:27:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLAVY-0000000H86K-0Vhp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 01:27:49 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 675904168E;
	Tue, 18 Nov 2025 01:27:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CAB32C2BC9E;
	Tue, 18 Nov 2025 01:27:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763429267;
	bh=0oteIb+X1fJCyo+Zxr4nkUcxMjcvmBQGKU7OiOe0rpY=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=G8n8wVUbDy9xMoxpRV8pACQkfp9whBlQYQ78z1mHVC+Tv+BDltUo0t5oda21AUDCY
	 T5DNkpifz6tSITK5L4rpTl211NX7Bj1hexmjiJ4XK6DOHTZ4Q+KFKt+tcEofcurJwv
	 i1LLbAZI4MmVtRlBIkWPeNo1GRfaPm60Cv8CmoDYEtU279u8RhX81DoCg4ZuTZv92n
	 vMWp9X9lpd5LH1IKOrDg4ULRstBc2OAZ7vKF54PSE29eCRV33uUQsyGHtdO5h5GsxU
	 Um54PFFFXeSQdvMIWVq5baqALXlJuFHx6nOngKATHyhNX2SsBXUgnlMvWYiYf8Kc84
	 hLa4GMK9a05rA==
Content-Type: multipart/mixed; boundary="===============1479139858118383586=="
MIME-Version: 1.0
Message-Id: <ad3ea8d7ccb10a7972db01b58d2596b425d60718ec09450a1ed6d7839488af51@mail.kernel.org>
In-Reply-To: <20251118005305.27058-2-jordan@jrife.io>
References: <20251118005305.27058-2-jordan@jrife.io>
Subject: Re: [RFC PATCH bpf-next 1/7] bpf: Set up update_prog scaffolding for bpf_tracing_link_lops
From: bot+bpf-ci@kernel.org
To: jordan@jrife.io,bpf@vger.kernel.org
Cc: jordan@jrife.io,linux-arm-kernel@lists.infradead.org,linux-s390@vger.kernel.org,x86@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,puranjay@kernel.org,iii@linux.ibm.com,mingo@redhat.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 18 Nov 2025 01:27:45 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_172748_204034_0B7C8046 
X-CRM114-Status: GOOD (  17.12  )
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

--===============1479139858118383586==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 09d5dc541..23fcbcd26 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h

[ ... ]

> diff --git a/kernel/bpf/syscall.c b/kernel/bpf/syscall.c
> index a2a441185..14dd8be7b 100644
> --- a/kernel/bpf/syscall.c
> +++ b/kernel/bpf/syscall.c

[ ... ]

> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index 04104397c..d2fd02e10 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -607,6 +607,35 @@ int bpf_trampoline_link_prog(struct bpf_tramp_link *link,
>  	return err;
>  }
>
> +static int __bpf_trampoline_update_prog(struct bpf_tramp_link *link,
> +					struct bpf_prog *new_prog,
> +					struct bpf_trampoline *tr)
> +{
> +	return -ENOTSUPP;
> +}
> +
> +int bpf_trampoline_update_prog(struct bpf_tramp_link *link,
> +			       struct bpf_prog *new_prog,
> +			       struct bpf_trampoline *tr)
> +{
> +	struct bpf_prog *old_prog;
> +	int err;
> +
> +	mutex_lock(&tr->mutex);
> +	err = __bpf_trampoline_update_prog(link, new_prog, tr);
> +	if (!err) {
> +		/* If a program update was successful, switch the program
> +		 * in the link before releasing tr->mutex; otherwise, another
> +		 * operation could come along and update the trampoline with
> +		 * the link still pointing at the old program.
> +		 */
> +		old_prog = xchg(&link->link.prog, new_prog);
> +		bpf_prog_put(old_prog);
> +	}
> +	mutex_unlock(&tr->mutex);
> +	return err;
> +}
> +

Can bpf_prog_put() be called while holding tr->mutex?

When bpf_prog_put()->__bpf_prog_put() drops the program's refcount to
zero and we're not in IRQ context (which we aren't when holding a regular
mutex), it directly calls bpf_prog_put_deferred(). This eventually calls
bpf_trampoline_put(), which takes trampoline_mutex.

The existing code in bpf_trampoline_link_cgroup_shim() carefully unlocks
tr->mutex before calling bpf_trampoline_put() (see the comment "have to
release tr while _not_ holding its mutex"). Additionally,
bpf_trampoline_put() has WARN_ON_ONCE(mutex_is_locked(&tr->mutex)) to
catch this pattern.

Should bpf_prog_put() be moved after mutex_unlock(&tr->mutex)?

>  static int __bpf_trampoline_unlink_prog(struct bpf_tramp_link *link,
>  					struct bpf_trampoline *tr,
>  					struct bpf_prog *tgt_prog)

[ ... ]


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19450205468

--===============1479139858118383586==--

