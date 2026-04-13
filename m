Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D8633EBFD37
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Apr 2026 11:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OKom4Ao6OSpx8ZWFxXp7HYD56EZJcXGOGoUZJUQvHzA=; b=hI9W8O4mlqBn+LWLMwZQ9QiBnu
	Y+sZHA7s6B4MWdvmmeppfmplVUcmdFgWuaB/HsQndiqSmswZqSAD2t/JReUv/jsLe/noViWm7yu8g
	u2EhDrIR97qraXPUaNHx4wUyQAWrgRZIfK6m8oCmbe6LLPuB4B2gR7EnHCXtJdCMNMj2xOnDjVj1+
	/SSGN5evW2Pcq/QBOZRha6CRct+q66y6pOt/k+XtARIhEkLU2XUEd77FbbXvP/2/Q2G0NNufPh5jV
	mOfSxkHnh37lWHcUFRbFit2au0DrSXdx9Yl/+M9uZFvss7lSBubvCp/lTkdBIKxoxogStfO3oNTYt
	jcFm2ihQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCF4Z-0000000FXu7-0Xzj;
	Mon, 13 Apr 2026 11:03:19 +0000
Received: from smtp-out2.suse.de ([195.135.223.131])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wCF4V-0000000FXtY-1MEQ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 13 Apr 2026 11:03:17 +0000
Received: from imap1.dmz-prg2.suse.org (imap1.dmz-prg2.suse.org [IPv6:2a07:de40:b281:104:10:150:64:97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 86A5A5BD1F;
	Mon, 13 Apr 2026 11:03:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1776078191; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKom4Ao6OSpx8ZWFxXp7HYD56EZJcXGOGoUZJUQvHzA=;
	b=ts5Qb/CXQpj9U2bDEPxAD2iDngVXtffWhoqpVWKt6bs+afMwA6X179wjgYi3qP5mPpqKvR
	a4N5iYNy7juOvI4kLW3dSD4S/3dBjzhKrkEIRIYxx/SVevy+iieM4vikjPZEydEiw159wP
	6x1dYEtlM4GBEwcWMuY6meD6Z3R3dbQ=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1776078191;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKom4Ao6OSpx8ZWFxXp7HYD56EZJcXGOGoUZJUQvHzA=;
	b=EQIpMZj4b3dg3WwpBEJIJSaaELW9/Sc2LNktMvTBfsgxlWkgsi16uw6dg8xGIWMiftYs5z
	l9U4zffdNCp9ZXAg==
Authentication-Results: smtp-out2.suse.de;
	dkim=pass header.d=suse.cz header.s=susede2_rsa header.b=VFXvi+ZK;
	dkim=pass header.d=suse.cz header.s=susede2_ed25519 header.b=W6ki7Kpo
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1776078190; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKom4Ao6OSpx8ZWFxXp7HYD56EZJcXGOGoUZJUQvHzA=;
	b=VFXvi+ZKh1hfCZ5d7y8Xgw+baQvRd8u8LNt9pPYwpdSEfEqIFD4+VB/fWfkyo3VpaS6BT2
	oPJn9E+hzeuBRqEsRnL4y26dT79QP+liK/xMRHSFDzAd8KH3n0NFQvY/UL3OZH/BiC9Qio
	M2ZRJ7TlsJz1FV9JCmV3crX08BpMytU=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1776078190;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=OKom4Ao6OSpx8ZWFxXp7HYD56EZJcXGOGoUZJUQvHzA=;
	b=W6ki7KpoiIChzmco1HG7v97Z5Ryi6vfxeIF2CIKe2s3zYgcgKaJe1PPbIq+UTMZPpbLhuj
	elCxuixeyqYySeDw==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 755174AE54;
	Mon, 13 Apr 2026 11:03:10 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id V1GcHG7N3GkOMAAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 13 Apr 2026 11:03:10 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id 34B90A0AFF; Mon, 13 Apr 2026 13:03:06 +0200 (CEST)
Date: Mon, 13 Apr 2026 13:03:06 +0200
From: Jan Kara <jack@suse.cz>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, r@hev.cc, jack@suse.cz, 
	ajd@linux.ibm.com, apopple@nvidia.com, baohua@kernel.org, 
	baolin.wang@linux.alibaba.com, brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com, 
	kees@kernel.org, kevin.brodsky@arm.com, lance.yang@linux.dev, 
	Liam.Howlett@oracle.com, linux-arm-kernel@lists.infradead.org, 
	linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, Lorenzo Stoakes <ljs@kernel.org>, 
	mhocko@suse.com, npache@redhat.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, wilts.infradead.org@quack3, ziy@nvidia.com, hannes@cmpxchg.org, 
	kas@kernel.org, shakeel.butt@linux.dev, leitao@debian.org, kernel-team@meta.com
Subject: Re: [PATCH v3 2/4] mm: use tiered folio allocation for VM_EXEC
 readahead
Message-ID: <aji7zs42th272khtxesk6dfcrgf7ddr5r5n62wgzeqooyexgxf@5ns3i47f5nlg>
References: <20260402181326.3107102-1-usama.arif@linux.dev>
 <20260402181326.3107102-3-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260402181326.3107102-3-usama.arif@linux.dev>
X-Rspamd-Action: no action
X-Rspamd-Server: rspamd2.dmz-prg2.suse.org
X-Spamd-Result: default: False [-4.01 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	R_DKIM_ALLOW(-0.20)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MX_GOOD(-0.01)[];
	MIME_TRACE(0.00)[0:+];
	ARC_NA(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	TO_DN_SOME(0.00)[];
	RCPT_COUNT_TWELVE(0.00)[38];
	MISSING_XM_UA(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,imap1.dmz-prg2.suse.org:rdns,suse.com:email,suse.cz:dkim];
	R_RATELIMIT(0.00)[to_ip_from(RL7pfqg7h1m44jupjp7nguhfec)];
	FROM_EQ_ENVFROM(0.00)[];
	FROM_HAS_DN(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	RCVD_TLS_LAST(0.00)[];
	DKIM_TRACE(0.00)[suse.cz:+]
X-Rspamd-Queue-Id: 86A5A5BD1F
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260413_040315_674168_FAE63448 
X-CRM114-Status: GOOD (  46.11  )
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

On Thu 02-04-26 11:08:23, Usama Arif wrote:
> When executable pages are faulted via do_sync_mmap_readahead(), request
> a folio order that enables the best hardware TLB coalescing available:
> 
> - If the VMA is large enough to contain a full PMD, request
>   HPAGE_PMD_ORDER so the folio can be PMD-mapped. This benefits
>   architectures where PMD_SIZE is reasonable (e.g. 2M on x86-64
>   and arm64 with 4K pages). VM_EXEC VMAs are very unlikely to be
>   large enough for 512M pages on ARM to take into affect.

I'm not sure relying on PMD_SIZE will be too much for a VMA is a great
strategy. With 16k PAGE_SIZE the PMD would be 32MB large which would fit in
the .text size but already looks a bit too much? Mapping with PMD sized
folios brings some benefits but at the same time it costs because now parts
of VMA that would be never paged in are pulled into memory and also LRU
tracking now happens with this very large granularity making it fairly
inefficient (big folios have much higher chances of getting accessed
similarly often making LRU order mostly random). We are already getting
reports of people with small machines (phones etc.) where the memory
overhead of large folios (in the page cache) is simply too much. So I'd
have a bigger peace of mind if we capped folio size at 2MB for now until we
come with a more sophisticated heuristic of picking sensible folio order
given the machine size. Now I'm not really an MM person so my feeling here
may be just wrong but I wanted to voice this concern from what I can see...

								Honza


> - Otherwise, fall back to exec_folio_order(), which returns the
>   minimum order for hardware PTE coalescing for arm64:
>   - arm64 4K:  order 4 (64K) for contpte (16 PTEs → 1 iTLB entry)
>   - arm64 16K: order 2 (64K) for HPA (4 pages → 1 TLB entry)
>   - arm64 64K: order 5 (2M) for contpte (32 PTEs → 1 iTLB entry)
>   - generic:   order 0 (no coalescing)
> 
> Update the arm64 exec_folio_order() to return ilog2(SZ_2M >>
> PAGE_SHIFT) on 64K page configurations, where the previous SZ_64K
> value collapsed to order 0 (a single page) and provided no coalescing
> benefit.
> 
> Use ~__GFP_RECLAIM so the allocation is opportunistic: if a large
> folio is readily available, use it, otherwise fall back to smaller
> folios without stalling on reclaim or compaction. The existing fallback
> in page_cache_ra_order() handles this naturally.
> 
> The readahead window is already clamped to the VMA boundaries, so
> ra->size naturally caps the folio order via ilog2(ra->size) in
> page_cache_ra_order().
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>
> ---
>  arch/arm64/include/asm/pgtable.h | 16 +++++++++----
>  mm/filemap.c                     | 40 +++++++++++++++++++++++---------
>  mm/internal.h                    |  3 ++-
>  mm/readahead.c                   |  7 +++---
>  4 files changed, 45 insertions(+), 21 deletions(-)
> 
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index 52bafe79c10a..9ce9f73a6f35 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -1591,12 +1591,18 @@ static inline void update_mmu_cache_range(struct vm_fault *vmf,
>  #define arch_wants_old_prefaulted_pte	cpu_has_hw_af
>  
>  /*
> - * Request exec memory is read into pagecache in at least 64K folios. This size
> - * can be contpte-mapped when 4K base pages are in use (16 pages into 1 iTLB
> - * entry), and HPA can coalesce it (4 pages into 1 TLB entry) when 16K base
> - * pages are in use.
> + * Request exec memory is read into pagecache in folios large enough for
> + * hardware TLB coalescing. On 4K and 16K page configs this is 64K, which
> + * enables contpte mapping (16 × 4K) and HPA coalescing (4 × 16K). On
> + * 64K page configs, contpte requires 2M (32 × 64K).
>   */
> -#define exec_folio_order() ilog2(SZ_64K >> PAGE_SHIFT)
> +#define exec_folio_order exec_folio_order
> +static inline unsigned int exec_folio_order(void)
> +{
> +	if (PAGE_SIZE == SZ_64K)
> +		return ilog2(SZ_2M >> PAGE_SHIFT);
> +	return ilog2(SZ_64K >> PAGE_SHIFT);
> +}
>  
>  static inline bool pud_sect_supported(void)
>  {
> diff --git a/mm/filemap.c b/mm/filemap.c
> index a4ea869b2ca1..7ffea986b3b4 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3311,6 +3311,7 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  	DEFINE_READAHEAD(ractl, file, ra, mapping, vmf->pgoff);
>  	struct file *fpin = NULL;
>  	vm_flags_t vm_flags = vmf->vma->vm_flags;
> +	gfp_t gfp = readahead_gfp_mask(mapping);
>  	bool force_thp_readahead = false;
>  	unsigned short mmap_miss;
>  
> @@ -3363,28 +3364,45 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  			ra->size *= 2;
>  		ra->async_size = HPAGE_PMD_NR;
>  		ra->order = HPAGE_PMD_ORDER;
> -		page_cache_ra_order(&ractl, ra);
> +		page_cache_ra_order(&ractl, ra, gfp);
>  		return fpin;
>  	}
>  
>  	if (vm_flags & VM_EXEC) {
>  		/*
> -		 * Allow arch to request a preferred minimum folio order for
> -		 * executable memory. This can often be beneficial to
> -		 * performance if (e.g.) arm64 can contpte-map the folio.
> -		 * Executable memory rarely benefits from readahead, due to its
> -		 * random access nature, so set async_size to 0.
> +		 * Request large folios for executable memory to enable
> +		 * hardware PTE coalescing and PMD mappings:
>  		 *
> -		 * Limit to the boundaries of the VMA to avoid reading in any
> -		 * pad that might exist between sections, which would be a waste
> -		 * of memory.
> +		 *  - If the VMA is large enough for a PMD, request
> +		 *    HPAGE_PMD_ORDER so the folio can be PMD-mapped.
> +		 *  - Otherwise, use exec_folio_order() which returns
> +		 *    the minimum order for hardware TLB coalescing
> +		 *    (e.g. arm64 contpte/HPA).
> +		 *
> +		 * Use ~__GFP_RECLAIM so large folio allocation is
> +		 * opportunistic — if memory isn't readily available,
> +		 * fall back to smaller folios rather than stalling on
> +		 * reclaim or compaction.
> +		 *
> +		 * Executable memory rarely benefits from speculative
> +		 * readahead due to its random access nature, so set
> +		 * async_size to 0.
> +		 *
> +		 * Limit to the boundaries of the VMA to avoid reading
> +		 * in any pad that might exist between sections, which
> +		 * would be a waste of memory.
>  		 */
> +		gfp &= ~__GFP_RECLAIM;
>  		struct vm_area_struct *vma = vmf->vma;
>  		unsigned long start = vma->vm_pgoff;
>  		unsigned long end = start + vma_pages(vma);
>  		unsigned long ra_end;
>  
> -		ra->order = exec_folio_order();
> +		if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
> +		    vma_pages(vma) >= HPAGE_PMD_NR)
> +			ra->order = HPAGE_PMD_ORDER;
> +		else
> +			ra->order = exec_folio_order();
>  		ra->start = round_down(vmf->pgoff, 1UL << ra->order);
>  		ra->start = max(ra->start, start);
>  		ra_end = round_up(ra->start + ra->ra_pages, 1UL << ra->order);
> @@ -3403,7 +3421,7 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  
>  	fpin = maybe_unlock_mmap_for_io(vmf, fpin);
>  	ractl._index = ra->start;
> -	page_cache_ra_order(&ractl, ra);
> +	page_cache_ra_order(&ractl, ra, gfp);
>  	return fpin;
>  }
>  
> diff --git a/mm/internal.h b/mm/internal.h
> index 475bd281a10d..e624cb619057 100644
> --- a/mm/internal.h
> +++ b/mm/internal.h
> @@ -545,7 +545,8 @@ int zap_vma_for_reaping(struct vm_area_struct *vma);
>  int folio_unmap_invalidate(struct address_space *mapping, struct folio *folio,
>  			   gfp_t gfp);
>  
> -void page_cache_ra_order(struct readahead_control *, struct file_ra_state *);
> +void page_cache_ra_order(struct readahead_control *, struct file_ra_state *,
> +			 gfp_t gfp);
>  void force_page_cache_ra(struct readahead_control *, unsigned long nr);
>  static inline void force_page_cache_readahead(struct address_space *mapping,
>  		struct file *file, pgoff_t index, unsigned long nr_to_read)
> diff --git a/mm/readahead.c b/mm/readahead.c
> index 7b05082c89ea..b3dc08cf180c 100644
> --- a/mm/readahead.c
> +++ b/mm/readahead.c
> @@ -465,7 +465,7 @@ static inline int ra_alloc_folio(struct readahead_control *ractl, pgoff_t index,
>  }
>  
>  void page_cache_ra_order(struct readahead_control *ractl,
> -		struct file_ra_state *ra)
> +		struct file_ra_state *ra, gfp_t gfp)
>  {
>  	struct address_space *mapping = ractl->mapping;
>  	pgoff_t start = readahead_index(ractl);
> @@ -475,7 +475,6 @@ void page_cache_ra_order(struct readahead_control *ractl,
>  	pgoff_t mark = index + ra->size - ra->async_size;
>  	unsigned int nofs;
>  	int err = 0;
> -	gfp_t gfp = readahead_gfp_mask(mapping);
>  	unsigned int new_order = ra->order;
>  
>  	trace_page_cache_ra_order(mapping->host, start, ra);
> @@ -626,7 +625,7 @@ void page_cache_sync_ra(struct readahead_control *ractl,
>  readit:
>  	ra->order = 0;
>  	ractl->_index = ra->start;
> -	page_cache_ra_order(ractl, ra);
> +	page_cache_ra_order(ractl, ra, readahead_gfp_mask(ractl->mapping));
>  }
>  EXPORT_SYMBOL_GPL(page_cache_sync_ra);
>  
> @@ -697,7 +696,7 @@ void page_cache_async_ra(struct readahead_control *ractl,
>  		ra->size -= end - aligned_end;
>  	ra->async_size = ra->size;
>  	ractl->_index = ra->start;
> -	page_cache_ra_order(ractl, ra);
> +	page_cache_ra_order(ractl, ra, readahead_gfp_mask(ractl->mapping));
>  }
>  EXPORT_SYMBOL_GPL(page_cache_async_ra);
>  
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

