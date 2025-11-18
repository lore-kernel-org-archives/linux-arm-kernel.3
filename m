Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3989ACE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Nov 2025 01:19:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hKtVMwvvgiohZHRulH7tZGTrXbAttUAFGH34HtgyCEc=; b=xdGGJxLFtAB5Kr6LjcYuL2SqMZ
	Fbo3O0R+49h6qAuf5Z8w1H/NBpiD/5iNZN0R3wHaVLerpjd9laASA2ZQWXqN3Cl9ZBc27YP+mCzSd
	nAiXa0Yzbn2GsdnhCOrj8YNZetvMRNj41leeZ7KwqxvB4ybMZOWCh+bgTi4RRv1PPHHR70oh6k5r7
	gwGYXzohZvNU3KUk+MJpmst9XkeZkWbsDEarSlUIPz62JuMVAU08Dp7v6eOznx6NhmvJiy47lYkvs
	x4eQQ/oi7ITJhd1ircSmdH/HRNbC41dFU3kGY2eof801MkOuiy2lv6CDFZb2bFB3DMJXBL8bx9CFM
	8h+UckOA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLANg-0000000H7V0-1RGY;
	Tue, 18 Nov 2025 01:19:40 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vLANd-0000000H7UN-0nIk
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Nov 2025 01:19:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 98DBB41995;
	Tue, 18 Nov 2025 01:19:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28A45C116B1;
	Tue, 18 Nov 2025 01:19:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763428774;
	bh=2xPAQ8vTmRss1HS6NiJylWsPP0y8vQsGritlWJFOQTE=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date:From;
	b=iQE6w355xmiBHO4GN13T/2EgmI08XBqKVPINMZBasaH4rjWYI7AKIw13N+UlKSbr2
	 9WNWnRAhug1XBUhaf/VwF3VWUdWp7pe2NcVNOshffgNA+uNSJw/D7nsdGsQdjRSJxt
	 YrsOYoKrGITPvlkCaqB4aL3V5M+N+j/Yg48vDglItj8Ab0K7jael16tmOfAnB4qval
	 //wfNVBXdYOIqFsN4UBez+3V3dnicXgkKKkdtailCMjd11MHcxMGGa0H8/1mdj/856
	 Bi1NZ8ivsf34HyROZ8IfZlhjMQOXgysBebJbUzVy6AsBBSAsQNMiXzbWOXClFz+cov
	 YC8Cv53SOCnRg==
Content-Type: multipart/mixed; boundary="===============8582021740552472443=="
MIME-Version: 1.0
Message-Id: <47cb75777a482c283798d055c22c0a8c536abe74e9877bb8d01fbccaef840a2e@mail.kernel.org>
In-Reply-To: <20251118005305.27058-4-jordan@jrife.io>
References: <20251118005305.27058-4-jordan@jrife.io>
Subject: Re: [RFC PATCH bpf-next 3/7] bpf: Enable BPF_LINK_UPDATE for fentry/fexit/fmod_ret links
From: bot+bpf-ci@kernel.org
To: jordan@jrife.io,bpf@vger.kernel.org
Cc: jordan@jrife.io,linux-arm-kernel@lists.infradead.org,linux-s390@vger.kernel.org,x86@kernel.org,ast@kernel.org,daniel@iogearbox.net,andrii@kernel.org,martin.lau@linux.dev,puranjay@kernel.org,iii@linux.ibm.com,mingo@redhat.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Tue, 18 Nov 2025 01:19:33 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_171937_273102_04C3BC03 
X-CRM114-Status: GOOD (  21.34  )
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

--===============8582021740552472443==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/bpf.h b/include/linux/bpf.h
> index 23fcbcd26..7daf40cbd 100644
> --- a/include/linux/bpf.h
> +++ b/include/linux/bpf.h
> @@ -1215,6 +1215,8 @@ enum {
>
>  struct bpf_tramp_links {
>  	struct bpf_tramp_link *links[BPF_MAX_TRAMP_LINKS];
> +	struct bpf_tramp_link *update_link;
> +	struct bpf_prog *update_prog;
>  	int nr_links;
>  };

[ ... ]

> @@ -1840,6 +1843,13 @@ struct bpf_tramp_link {
>  	u64 cookie;
>  };
>
> +static inline struct bpf_prog *
> +bpf_tramp_links_prog(struct bpf_tramp_links *tl, int i)
> +{
> +	return tl->links[i] == tl->update_link ? tl->update_prog :
> +						 tl->links[i]->link.prog;
> +}

This helper is added but the architecture-specific code in
arch/x86/net/bpf_jit_comp.c, arch/arm64/net/bpf_jit_comp.c, and
arch/s390/net/bpf_jit_comp.c continues to access tl->links[i]->link.prog
directly. When __bpf_trampoline_update() passes tlinks with update_link
and update_prog set, won't arch_prepare_bpf_trampoline() and
arch_bpf_trampoline_size() use the old program instead of the new one?

For example, in arch/x86/net/bpf_jit_comp.c around line 2966:
    struct bpf_prog *p = l->link.prog;

This should probably use bpf_tramp_links_prog() to get the correct
program during updates. The same pattern appears in the other arch
implementations.

> diff --git a/kernel/bpf/trampoline.c b/kernel/bpf/trampoline.c
> index 171440f37..486f945f6 100644
> --- a/kernel/bpf/trampoline.c
> +++ b/kernel/bpf/trampoline.c
> @@ -232,7 +232,10 @@ static int register_fentry(struct bpf_trampoline *tr, void *new_addr)
>  }
>
>  static struct bpf_tramp_links *
> -bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_arg)
> +bpf_trampoline_get_progs(const struct bpf_trampoline *tr,
> +			 struct bpf_tramp_link *update_link,
> +			 struct bpf_prog *update_prog,
> +			 int *total, bool *ip_arg)
>  {
>  	struct bpf_tramp_link *link;
>  	struct bpf_tramp_links *tlinks;
> @@ -252,6 +255,11 @@ bpf_trampoline_get_progs(const struct bpf_trampoline *tr, int *total, bool *ip_a
>  		hlist_for_each_entry(link, &tr->progs_hlist[kind], tramp_hlist) {
>  			*ip_arg |= link->link.prog->call_get_func_ip;
>  			*links++ = link;
> +			if (link == update_link) {
> +				*ip_arg |= update_prog->call_get_func_ip;
> +				tlinks[kind].update_link = update_link;
> +				tlinks[kind].update_prog = update_prog;
> +			}
>  		}
>  	}
>  	return tlinks;

[ ... ]

> @@ -397,7 +405,10 @@ static struct bpf_tramp_image *bpf_tramp_image_alloc(u64 key, int size)
>  	return ERR_PTR(err);
>  }
>
> -static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
> +static int __bpf_trampoline_update(struct bpf_trampoline *tr,
> +				   struct bpf_tramp_link *update_link,
> +				   struct bpf_prog *update_prog,
> +				   bool lock_direct_mutex)
>  {
>  	struct bpf_tramp_image *im;
>  	struct bpf_tramp_links *tlinks;
> @@ -405,7 +416,11 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
>  	bool ip_arg = false;
>  	int err, total, size;
>
> -	tlinks = bpf_trampoline_get_progs(tr, &total, &ip_arg);
> +	if (update_link && !bpf_trampoline_supports_update_prog())
> +		return -ENOTSUPP;
> +
> +	tlinks = bpf_trampoline_get_progs(tr, update_link, update_prog,
> +					  &total, &ip_arg);

[ ... ]

> @@ -503,6 +518,11 @@ static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mut
>  	goto out;
>  }
>
> +static int bpf_trampoline_update(struct bpf_trampoline *tr, bool lock_direct_mutex)
> +{
> +	return __bpf_trampoline_update(tr, NULL, NULL, lock_direct_mutex);
> +}
> +
>  static enum bpf_tramp_prog_type bpf_attach_type_to_tramp(struct bpf_prog *prog)
>  {
>  	switch (prog->expected_attach_type) {
> @@ -626,7 +646,7 @@ static int __bpf_trampoline_update_prog(struct bpf_tramp_link *link,
>  		return 0;
>  	}
>
> -	return -ENOTSUPP;
> +	return __bpf_trampoline_update(tr, link, new_prog, true);
>  }

[ ... ]

> @@ -1136,6 +1156,11 @@ arch_prepare_bpf_trampoline(struct bpf_tramp_image *im, void *image, void *image
>  	return -ENOTSUPP;
>  }
>
> +bool __weak bpf_trampoline_supports_update_prog(void)
> +{
> +	return false;
> +}

The commit message says "For now, only x86, arm64, and s390 are
implemented" but none of these architectures appear to be updated in
this patch or in the visible preceding commits (627b0f207, b0184022d).
Without overriding bpf_trampoline_supports_update_prog() to return true
and updating the arch code to use bpf_tramp_links_prog(), the feature
will always return -ENOTSUPP on all architectures. Was this patch meant
to include the arch-specific implementations, or are they in a separate
series?


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/19450205468

--===============8582021740552472443==--

