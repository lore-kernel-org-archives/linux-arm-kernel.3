Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD63CCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 16:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=gZ72TgsJrRv/vGY/p+18ZB9GO9DQ5TW6tac2G606Edg=; b=4iAZQKaZyuvSH7ZfTd4p3Vuqaj
	169VzraRtVphs2OKcvn/ByDZ3fFd/2pMXpZDrRTumcc6DMVncjc9NKMQmMhGVff2lHI9rn95XXcMr
	nb/b/RM1ypMWyl9I1mKBSz11DJEvnAVhdoVuuRwJ8/Ji2TY/jW6Sl84JP0w/DL1Q/Yqejp2cOyQ20
	h1RKTkCC/OqZf/YGu0HzwoMo4oT1O/TqbbM3UXRoDGe9JlZzCUQamIAFdxte8dmHNxg/ZKjG7PLPV
	BGTzEC1Zps6DfbITLDWuQWpwA00Yek10whQlzz1ITbPdPi/m9ph4AXTdQ/LMBUPCIvEOEeoVQdeWe
	bQYEa7CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5P3-0000000BTSt-30cD;
	Mon, 01 Jun 2026 16:22:13 +0000
Received: from smtp-out2.suse.de ([2a07:de40:b251:101:10:150:64:2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU5P0-0000000BTOU-40zf
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 16:22:12 +0000
Received: from imap1.dmz-prg2.suse.org (unknown [10.150.64.97])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by smtp-out2.suse.de (Postfix) with ESMTPS id 6CD78686BF;
	Mon,  1 Jun 2026 16:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1780330927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ72TgsJrRv/vGY/p+18ZB9GO9DQ5TW6tac2G606Edg=;
	b=DPm/IEwlGpkf8NfyX+80UyDZbZ2hucyaoC16feayRVX7XSuuWtIqBDRm5Om34HWmnazyZl
	L6rMA++cI7goHDO5iLaBApGIYXhSv/ssJyTq4x+YJNT4h2mOqQJCmlyFNHIKaytsmbGj3I
	VQ7lqCXTOTJXHiq+kNAOMZFCjg2ixe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1780330927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ72TgsJrRv/vGY/p+18ZB9GO9DQ5TW6tac2G606Edg=;
	b=T3+UC3CaTyEWfE5yipWF50DW+yQJdmohfKIaRY+q46sfLFXgCL8qJj6KcxxWxbv6JL7o2B
	IyCdMbhbiL1n1cBg==
Authentication-Results: smtp-out2.suse.de;
	none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=suse.cz; s=susede2_rsa;
	t=1780330927; h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ72TgsJrRv/vGY/p+18ZB9GO9DQ5TW6tac2G606Edg=;
	b=DPm/IEwlGpkf8NfyX+80UyDZbZ2hucyaoC16feayRVX7XSuuWtIqBDRm5Om34HWmnazyZl
	L6rMA++cI7goHDO5iLaBApGIYXhSv/ssJyTq4x+YJNT4h2mOqQJCmlyFNHIKaytsmbGj3I
	VQ7lqCXTOTJXHiq+kNAOMZFCjg2ixe0=
DKIM-Signature: v=1; a=ed25519-sha256; c=relaxed/relaxed; d=suse.cz;
	s=susede2_ed25519; t=1780330927;
	h=from:from:reply-to:date:date:message-id:message-id:to:to:cc:cc:
	 mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=gZ72TgsJrRv/vGY/p+18ZB9GO9DQ5TW6tac2G606Edg=;
	b=T3+UC3CaTyEWfE5yipWF50DW+yQJdmohfKIaRY+q46sfLFXgCL8qJj6KcxxWxbv6JL7o2B
	IyCdMbhbiL1n1cBg==
Received: from imap1.dmz-prg2.suse.org (localhost [127.0.0.1])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	by imap1.dmz-prg2.suse.org (Postfix) with ESMTPS id 5A802779A7;
	Mon,  1 Jun 2026 16:22:07 +0000 (UTC)
Received: from dovecot-director2.suse.de ([2a07:de40:b281:106:10:150:64:167])
	by imap1.dmz-prg2.suse.org with ESMTPSA
	id hFxsFa+xHWqYdQAAD6G6ig
	(envelope-from <jack@suse.cz>); Mon, 01 Jun 2026 16:22:07 +0000
Received: by quack3.suse.cz (Postfix, from userid 1000)
	id F171AA0EC0; Mon, 01 Jun 2026 18:22:02 +0200 (CEST)
Date: Mon, 1 Jun 2026 18:22:02 +0200
From: Jan Kara <jack@suse.cz>
To: Usama Arif <usama.arif@linux.dev>
Cc: Andrew Morton <akpm@linux-foundation.org>, david@kernel.org, 
	willy@infradead.org, ryan.roberts@arm.com, linux-mm@kvack.org, pfalcato@suse.de, 
	r@hev.cc, jack@suse.cz, Andrew Donnellan <andrew+kernel@donnellan.id.au>, 
	apopple@nvidia.com, baohua@kernel.org, baolin.wang@linux.alibaba.com, 
	brauner@kernel.org, catalin.marinas@arm.com, dev.jain@arm.com, kees@kernel.org, 
	kevin.brodsky@arm.com, lance.yang@linux.dev, "Liam R. Howlett" <liam@infradead.org>, 
	linux-arm-kernel@lists.infradead.org, linux-fsdevel@vger.kernel.org, linux-kernel@vger.kernel.org, 
	ljs@kernel.org, mhocko@suse.com, npache@redhat.com, pasha.tatashin@soleen.com, 
	rmclure@linux.ibm.com, rppt@kernel.org, surenb@google.com, vbabka@kernel.org, 
	Al Viro <viro@zeniv.linux.org.uk>, ziy@nvidia.com, hannes@cmpxchg.org, kas@kernel.org, 
	shakeel.butt@linux.dev, kernel-team@meta.com
Subject: Re: [PATCH v7 2/2] mm: use mapping_max_folio_order() for
 force_thp_readahead order
Message-ID: <yoma5mzdqkkcgjnq3qawaeytjx6cjmk7etzxnmkk53mov46sub@ldzkwojakaxs>
References: <20260601102205.3985788-1-usama.arif@linux.dev>
 <20260601102205.3985788-3-usama.arif@linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260601102205.3985788-3-usama.arif@linux.dev>
X-Spamd-Result: default: False [-2.30 / 50.00];
	BAYES_HAM(-3.00)[100.00%];
	SUSPICIOUS_RECIPS(1.50)[];
	NEURAL_HAM_LONG(-1.00)[-1.000];
	MID_RHS_NOT_FQDN(0.50)[];
	NEURAL_HAM_SHORT(-0.20)[-1.000];
	MIME_GOOD(-0.10)[text/plain];
	MISSING_XM_UA(0.00)[];
	FROM_HAS_DN(0.00)[];
	MIME_TRACE(0.00)[0:+];
	RCPT_COUNT_TWELVE(0.00)[37];
	ARC_NA(0.00)[];
	TO_DN_SOME(0.00)[];
	RCVD_VIA_SMTP_AUTH(0.00)[];
	RCVD_COUNT_THREE(0.00)[3];
	TAGGED_RCPT(0.00)[kernel];
	TO_MATCH_ENVRCPT_ALL(0.00)[];
	FROM_EQ_ENVFROM(0.00)[];
	FUZZY_RATELIMITED(0.00)[rspamd.com];
	RCVD_TLS_LAST(0.00)[];
	R_RATELIMIT(0.00)[to_ip_from(RLx3ed8f7q4e9s3nf3mrauhj48)];
	DKIM_SIGNED(0.00)[suse.cz:s=susede2_rsa,suse.cz:s=susede2_ed25519];
	DBL_BLOCKED_OPENRESOLVER(0.00)[imap1.dmz-prg2.suse.org:helo,linux.dev:email,suse.com:email,suse.cz:email]
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_092211_148617_9AFD9F21 
X-CRM114-Status: GOOD (  32.37  )
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

On Mon 01-06-26 03:21:18, Usama Arif wrote:
> The force_thp_readahead path in do_sync_mmap_readahead() is gated on
> HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER and always requests
> HPAGE_PMD_ORDER / HPAGE_PMD_NR. On configurations where HPAGE_PMD_ORDER
> exceeds MAX_PAGECACHE_ORDER, notably arm64 with a 64K base page size,
> VM_HUGEPAGE mappings cannot use this path and fall back to the non-forced
> mmap readahead path even when the mapping supports useful large folios.
> 
> Enable forced readahead for mappings that support large folios and request
> the max folio order supported by the mapping, capped at 2M.
> 2MB is chosen as the cap because it matches the PMD size on x86_64
> and on arm64 with 4K base pages, so the size/memory-pressure tradeoff
> for folios of that size is already well understood. On arm64 with 16K
> and 64K base page sizes, 2MB is also the contiguous-PTE (contpte)
> block size, so the resulting folios coalesce into a single TLB entry
> and reduce TLB pressure on the readahead path. This will result
> in 32M folios not being faulted in with 16K base page size for arm64,
> but with contpte, the performance difference should be negligible.
> 
> The final allocation order may still be clamped by page_cache_ra_order()
> to the mapping and request geometry, but this gives VM_HUGEPAGE mappings
> on such configurations a large-folio readahead request instead of
> dropping back to base-page readahead.
> 
> Signed-off-by: Usama Arif <usama.arif@linux.dev>

Looks good to me. Feel free to add:

Reviewed-by: Jan Kara <jack@suse.cz>

								Honza

> ---
>  mm/filemap.c | 30 ++++++++++++++++++++++--------
>  1 file changed, 22 insertions(+), 8 deletions(-)
> 
> diff --git a/mm/filemap.c b/mm/filemap.c
> index a16b33e0fc71..9cf89efaf3f1 100644
> --- a/mm/filemap.c
> +++ b/mm/filemap.c
> @@ -3312,14 +3312,26 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  	struct file *fpin = NULL;
>  	vm_flags_t vm_flags = vmf->vma->vm_flags;
>  	bool force_thp_readahead = false;
> +	unsigned int thp_order = 0;
>  	unsigned short mmap_miss;
>  
>  	ractl._max_index = vmf->vma->vm_pgoff + vma_pages(vmf->vma) - 1;
>  
>  	/* Use the readahead code, even if readahead is disabled */
> -	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) &&
> -	    (vm_flags & VM_HUGEPAGE) && HPAGE_PMD_ORDER <= MAX_PAGECACHE_ORDER)
> -		force_thp_readahead = true;
> +	if (IS_ENABLED(CONFIG_TRANSPARENT_HUGEPAGE) && (vm_flags & VM_HUGEPAGE)) {
> +		/*
> +		 * Cap max THP order at 2MB: this is the common PMD-sized
> +		 * hugepage size, and it avoids memory pressure from very
> +		 * large forced readahead when mapping_max_folio_order() is
> +		 * high (for example, 128MB with 64K base pages on arm64).
> +		 */
> +		if (mapping_large_folio_support(mapping)) {
> +			force_thp_readahead = true;
> +			thp_order = min_t(unsigned int,
> +					  mapping_max_folio_order(mapping),
> +					  get_order(SZ_2M));
> +		}
> +	}
>  
>  	if (!force_thp_readahead) {
>  		/*
> @@ -3354,17 +3366,19 @@ static struct file *do_sync_mmap_readahead(struct vm_fault *vmf)
>  	}
>  
>  	if (force_thp_readahead) {
> +		unsigned long folio_nr_pages = 1UL << thp_order;
> +
>  		fpin = maybe_unlock_mmap_for_io(vmf, fpin);
> -		ractl._index &= ~((unsigned long)HPAGE_PMD_NR - 1);
> -		ra->size = HPAGE_PMD_NR;
> +		ractl._index &= ~(folio_nr_pages - 1);
> +		ra->size = folio_nr_pages;
>  		/*
> -		 * Fetch two PMD folios, so we get the chance to actually
> +		 * Fetch two folios so we get the chance to actually
>  		 * readahead, unless we've been told not to.
>  		 */
>  		if (!(vm_flags & VM_RAND_READ))
>  			ra->size *= 2;
> -		ra->async_size = HPAGE_PMD_NR;
> -		ra->order = HPAGE_PMD_ORDER;
> +		ra->async_size = folio_nr_pages;
> +		ra->order = thp_order;
>  		page_cache_ra_order(&ractl, ra);
>  		return fpin;
>  	}
> -- 
> 2.52.0
> 
-- 
Jan Kara <jack@suse.com>
SUSE Labs, CR

