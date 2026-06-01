Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D476CCD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 20:15:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Date:Cc:To:From:Subject:
	References:In-Reply-To:Message-Id:MIME-Version:Content-Type:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=syeJCfN05uDjUd4svPq4RNjDQXcDyKa61aaj7lQd5U4=; b=RQd0cD6cNffgazmmUNmBPXmcR3
	qlxpvkIobA43SNYGEQ17VZlmbkqwJI7afR7H+H/VLbRH5G0Yt4hsOuUiM2cgDAKTRC41ggaJDlItJ
	Ra3jQV39o86DC+egkFqQdrIGqG7S54Rp8zL/7o3mmTSo+wu5xbPtXBcHFC74sGmxFG7Mi+4Bzj+nz
	6LnxzgAxUyEFeUy69cyqWQIACoCyjq1hGkfbjzWucUeuiID5tsBXRPaaBG6/NOiu1NHcsyvNnpCi3
	3/lGzEfG2IBiNyDLcOK/7+Emlvwl896CP5nxrx9XGSWM94R41q3Co4/Fw/XHHB2G/jlSNgtxWZ1Kb
	MQJ6D9LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU92v-0000000BlMV-3eTG;
	Mon, 01 Jun 2026 20:15:37 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU92t-0000000BlLL-1NVA
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 20:15:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id B55E643588;
	Mon,  1 Jun 2026 20:15:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 33A761F0089A;
	Mon,  1 Jun 2026 20:15:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780344934;
	bh=syeJCfN05uDjUd4svPq4RNjDQXcDyKa61aaj7lQd5U4=;
	h=In-Reply-To:References:Subject:From:To:Cc:Date;
	b=JuZ8bT9dSGV4klPf9XsbtbDDHSt7f4OvQDGLa29dKTvxYBAVCMhiPPsZ8B0deX9nE
	 slfEcP1rtXhoFaa6OcBHWn+Y4+FyCVuhgYcgYn5EWc2aFOOTL1LRqvtTJEe6+/3O44
	 2JJmRLVlOthnh0F8g0Gc1mgHJjuVQunCxqYaKbmde+DdLEffE96ADOa2SA54rNjGjv
	 4nXV6yxRWCTFs8LfQGE9sWIcKtyGzzRvvlzXd8FTHPcFGL732wtYT4rFxzHvlgsyje
	 L7Vd8y+HRceRgaTuZIRRQt5Gknk+HehCaEofmiJ/ckJj553zEBe+lqbMLnn69hFImc
	 I/e/577Zby1Qg==
Content-Type: multipart/mixed; boundary="===============8340823664292074246=="
MIME-Version: 1.0
Message-Id: <f45f02410d23c99d14f3577da9b27a327816b5a0904bdeefc8e229eac760d1cf@mail.kernel.org>
In-Reply-To: <20260601183728.1800490-1-tj@kernel.org>
References: <20260601183728.1800490-1-tj@kernel.org>
Subject: Re: [PATCH bpf-next] bpf: Replace scratch PTE atomically when allocating arena pages
From: bot+bpf-ci@kernel.org
To: tj@kernel.org,void@manifault.com,arighi@nvidia.com,changwoo@igalia.com,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@linux.dev,memxor@gmail.com
Cc: peterz@infradead.org,catalin.marinas@arm.com,will@kernel.org,tglx@kernel.org,mingo@redhat.com,bp@alien8.de,dave.hansen@linux.intel.com,akpm@linux-foundation.org,david@kernel.org,rppt@kernel.org,emil@etsalapatis.com,sched-ext@lists.linux.dev,bpf@vger.kernel.org,x86@kernel.org,linux-arm-kernel@lists.infradead.org,linux-mm@kvack.org,linux-kernel@vger.kernel.org,tj@kernel.org,ast@kernel.org,andrii@kernel.org,daniel@iogearbox.net,martin.lau@kernel.org,eddyz87@gmail.com,yonghong.song@linux.dev,clm@meta.com,ihor.solodrai@linux.dev
Date: Mon,  1 Jun 2026 20:15:34 +0000 (UTC)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_131535_411909_24F942BE 
X-CRM114-Status: GOOD (  29.37  )
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

--===============8340823664292074246==
Content-Type: text/plain; charset="us-ascii"
MIME-Version: 1.0
Content-Transfer-Encoding: 7bit

> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
> index b5739bb99fc1..4c6c4081ef71 100644
> --- a/include/linux/pgtable.h
> +++ b/include/linux/pgtable.h
> @@ -1061,6 +1061,24 @@ static inline bool ptep_try_set(pte_t *ptep, pte_t new_pte)
>  }
>  #endif
>
> +#ifndef flush_tlb_before_set
> +/**
> + * flush_tlb_before_set - invalidate a kernel PTE's TLB before re-setting it
> + * @addr: kernel virtual address whose PTE was just cleared
> + *
> + * Some architectures (e.g. arm64) do not allow a live page-table entry to be
> + * repointed at a different page in one step. The old entry must first be made
> + * invalid and its translation flushed from every TLB, and only then may the new
> + * entry be written.
> + *
> + * This is only for the lockless atomic kernel-PTE installers (ptep_try_set()).
> + * It must be callable with interrupts disabled.
> + */
> +static inline void flush_tlb_before_set(unsigned long addr)
> +{
> +}
> +#endif

A subsystem pattern flags the empty generic stub as potentially
concerning, so I wanted to ask about the TLB behaviour on arches that
define ptep_try_set() but use this no-op flush_tlb_before_set().

> diff --git a/kernel/bpf/arena.c b/kernel/bpf/arena.c
> index 1727503b25d8..b6ac5a91a296 100644
> --- a/kernel/bpf/arena.c
> +++ b/kernel/bpf/arena.c

[ ... ]

> @@ -154,19 +155,44 @@ static int apply_range_set_cb(pte_t *pte, unsigned long addr, void *data)
>  {
>  	struct apply_range_data *d = data;
>  	struct page *page;
> +	pte_t pteval;
>
>  	if (!data)
>  		return 0;
> -	/* sanity check */
> -	if (unlikely(!pte_none(ptep_get(pte))))
> -		return -EBUSY;
>
>  	page = d->pages[d->i];
>  	/* paranoia, similar to vmap_pages_pte_range() */
>  	if (WARN_ON_ONCE(!pfn_valid(page_to_pfn(page))))
>  		return -EINVAL;
>
> -	set_pte_at(&init_mm, addr, pte, mk_pte(page, PAGE_KERNEL));
> +	pteval = mk_pte(page, PAGE_KERNEL);
> +#ifdef ptep_try_set
> +	/*
> +	 * Kernel-fault recovery may have installed the scratch page here, and
> +	 * some architectures (arm64) prohibit valid->valid PTE transitions.
> +	 * Install atomically into a none slot. If scratch is present, clear it
> +	 * and flush_tlb_before_set() (break-before-make) before retrying.
> +	 */
> +	while (!ptep_try_set(pte, pteval)) {
> +		pte_t old = ptep_get(pte);
> +
> +		if (pte_none(old))
> +			continue;
> +		if (WARN_ON_ONCE(pte_page(old) != d->scratch_page))
> +			return -EBUSY;
> +		ptep_get_and_clear(&init_mm, addr, pte);
> +		flush_tlb_before_set(addr);

On x86, ptep_try_set() is defined, so this branch is taken, and
bpf_arena_handle_page_fault() is wired into the x86 fault path, so the
scratch page can really be installed here.

x86 does not override flush_tlb_before_set(), so it resolves to the empty
generic stub above. The scratch slot is then changed scratch_page ->
none -> real_page with no TLB invalidation:

	ptep_get_and_clear(&init_mm, addr, pte);
	flush_tlb_before_set(addr);   /* no-op on x86 */
	... ptep_try_set(pte, pteval);

I could not find a flush of the kernel range on the allocation path.
arena_alloc_pages() only calls flush_vmap_cache() (flush_cache_vmap(),
a no-op on x86) and never flush_tlb_kernel_range(), whereas
arena_free_pages() does call flush_tlb_kernel_range() before the range is
reused.

The CPU that took the original kernel fault restarts the faulting
instruction and accesses kaddr through the scratch page, populating its
TLB with kaddr -> scratch_page. After the real page is installed without
a flush, can that stale kaddr -> scratch_page translation persist, so
that later kernel-side accesses at kaddr reach the shared per-arena
scratch page instead of the freshly allocated page?

The arm64 path looks fine here, since flush_tlb_before_set() expands to
flush_tlb_kernel_range() and performs the break-before-make invalidate.

The commit message says:

> The new flush_tlb_before_set() is a no-op except on arches like arm64
> that need the break-before-make TLB invalidate.

so x86 is intended to need no flush after this scratch -> real transition.
Is there an x86-specific reason the stale scratch translation cannot be
observed, or should the allocation path flush the TLB for the affected
range on these arches too?

> +	}
> +#else
> +	/*
> +	 * Without ptep_try_set() there is no atomic installer, but such arches
> +	 * also do not wire up bpf_arena_handle_page_fault(), so no scratch page
> +	 * is ever installed and the slot is always none here.
> +	 */
> +	if (unlikely(!pte_none(ptep_get(pte))))
> +		return -EBUSY;
> +	set_pte_at(&init_mm, addr, pte, pteval);
> +#endif
>  	d->i++;
>  	return 0;
>  }


---
AI reviewed your patch. Please fix the bug or email reply why it's not a bug.
See: https://github.com/kernel-patches/vmtest/blob/master/ci/claude/README.md

CI run summary: https://github.com/kernel-patches/bpf/actions/runs/26775626381
--===============8340823664292074246==--

