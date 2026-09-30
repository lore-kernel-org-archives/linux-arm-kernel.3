Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3EDE1CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 15:05:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:Date:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jfRtojeauzUhQb4SePcX378h8gySuQTk235TQqLiiHA=; b=TLlaxyvBKNetkNQB02vNat0+BN
	Q34HUNyenPcQBO+7nt1DRWQUhfM0lp7CM/Er50Yo7j/JkQfN81kJPLqhf1rfDn8tcNA6l3bcTOpJ9
	Lr2elGl/1I3xUmwuoBgQxs3X3Ultv4PDkjgo8VzkyP+1gU5I6R5OJfv73KEnRp8x5nLn8ACWbZnP9
	zAtN7R6vChb8/lL1BkFXJgiAbMxjNc31++l2Zda2+KeNhyBQO35A6AatN9dri3VIMPYAwN7HTPcx3
	L8u27bTUlEzpO/7RmvpHnAc4V6L3TKsbUQqE4rAhFrxkx67fQYJFktcpqBHHIb7qawbmkFMB4W+5y
	Mq/vmxhQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvsC-00000006QIV-0Hri;
	Wed, 30 Sep 2026 15:05:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvsA-00000006QIB-3Y34
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 15:05:31 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=jfRtojeauzUhQb4SePcX378h8gySuQTk235TQqLiiHA=; b=HuSyy8n2hq/b0w+CrGwCiwv3gS
	ANsVIP5t6iREJjftg4d14YSiFWFw4u5/CA9n0dSyh30vTX0Xv1C8eYUn0upRktmh2Lj7IHxLzMpqI
	A5L5sN4vAWF5TJXiX/6AYhXq6YSFuofvrF7ijHLDF6N64LYy1EP1yd6WprnnjNov8bz1c50xoXE4N
	AUCI9laXV+X+U1+REKDvju7hfsMWRvyuZEAI1YA82ux+gv3N5+GLVqcrDOXAOwsOkcREJ8mlftK6C
	Sp6RK6bYwP5ZJ/PHSc2XBiBAEnW80f0w1E8VgGereQzRAFiLfmzBbso2fH9NfIXjRkH3/gzQ5E+kn
	913BuW7A==;
Received: from mail-ej2-x0f.google.com ([2a00:1450:4864:34::f])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBvs7-00000003xrM-2rq8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 15:05:29 +0000
Received: by mail-ej2-x0f.google.com with SMTP id a640c23a62f3a-c2af7721e4aso819263766b.1
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 08:05:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790780726; x=1791385526; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:from:to:cc:subject:date:message-id:reply-to:content-type;
        bh=jfRtojeauzUhQb4SePcX378h8gySuQTk235TQqLiiHA=;
        b=rZ0Ct96KUYE7apgLwQYN0fCIZdCFYPN+h4nXLFlLPHLPJaKL//+jCRtkqMmiAW78+1
         yA6v5oywpmYwDdUKdjizOhuN7zPw4D1ngSSq3/sg13d6aatvOGhGohJYGeHeaUm+0R0K
         D6PF7oO3GT/iKpH1HwjwjP4LpKnT2rCnrDw6oZmu1C30MnihzlSelphCrJoU+tKkNlsH
         yUUFaQHsrkblyDYLjqhQ14X/oIV8UrCaH0gv7ET31zgUn3nea8n8uIoFgb0Njklf1K21
         PA0DCuBOfUJ6yeyRo+sjWhfYo6vEZf3YlF27dFS6qnrfmor2n+MFfdCMV4Wov70yQ7uY
         Vd3g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790780726; x=1791385526;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :content-type:mime-version:references:message-id:subject:cc:to:date
         :from:x-gm-gg:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to:content-type;
        bh=jfRtojeauzUhQb4SePcX378h8gySuQTk235TQqLiiHA=;
        b=OtbwRl+NHsaKlJjVAGMWePdlvuTS2tPhhHUy320hdrXIdG2QZd8AaT2NwhkQWH6ug9
         odbg0EhypbW9ZhBtdQ9e0fh1wRlZswFU0gckMY8ViqvVC03NZkap2AK65DWBeCDeGdj3
         Dus3MhGCY6M5ZiGM5pGsP/LLmBPiT62ChjNlsDSIMMKhWYMa8o5OD3AVjamvMxi3LStQ
         KLaorEmtxS8vWPzfnotaHyjHNU6UXueN0b+WL5AoSBq76bvIfPoZfRJE6ZdnK0inxcA3
         DAGi48Ku40LvrG88c7nEkVgVJ5ROsz47KXU/hUB/N9LXVcySrdZKzgaG9a0X0VWN3SaN
         GefQ==
X-Forwarded-Encrypted: i=1; AKwUvBy4bmF2f91Ir0QlXn/x2eRffTvOJjZvaU+LsRfW/17jHoMGcYl10VTjdnJb1w6FQ8gvULc0vFYr2dYz60u10P4d@lists.infradead.org
X-Gm-Message-State: AFq9FYITx/KRSbzHEi/saXk80KvhAQlsgMH9qMmgstoNY2fuiJGYehhC
	vj+yClerrXVs0cJ2Lb+MfQV6kpkJINudVa5G8q4KBTzswxfRunDnqLBO
X-Gm-Gg: AYBFou2FkNiniYfDhQHE7vZHumBt34jDrjfC9JeNhZ18EBa289U2V3bGFAD1VDgH1BD
	sJzNCswbOesIampcp1HNoUoa6749/9SFMj7kSwQj4/eU1gLYfwF7Wcjv36lWcqPWu+x4c+1+n96
	4plkfzcsfKikCDCcx164kaCroPm4BuKEBUg1BLVsihpwTfS6raE97MLOJgC3AFNOvt09oi6zpbU
	gmKStuO8/Eq+vSB6mZ18Uo0+VUGhwYajzgANyA8jZFb4Gq1tvJn4pbfR+6F0ZVt1JnuSR8Tjq+j
	MXWYjNOXcPwvudjaeFySpnOW3dEvmSUO6lOydE89UGY368j21JeUYjQziaxRjVQ/H843c022HUp
	vxMTs1e3l4VfP0UWD7crrzpEthEznFRmE7U4xuBN2RPlU9AX+8LJyn9S1w2S4P/7J0Vh3i1AVlP
	exgYo0JLOukzz2/LLMyymb
X-Received: by 2002:a17:906:ba89:b0:c2d:a4ef:64ca with SMTP id a640c23a62f3a-c2e23e39566mr171362866b.42.1790780725514;
        Wed, 30 Sep 2026 08:05:25 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31a3cc87sm20827866b.6.2026.09.30.08.05.23
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 08:05:24 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 17:05:22 +0200
To: Wen Jiang <jiangwenxiaomi@gmail.com>
Cc: akpm@linux-foundation.org, catalin.marinas@arm.com, linux-mm@kvack.org,
	urezki@gmail.com, will@kernel.org, Xueyuan.chen21@gmail.com,
	ajd@linux.ibm.com, anshuman.khandual@arm.com, baohua@kernel.org,
	chleroy@kernel.org, david@kernel.org, dev.jain@arm.com,
	jiangwen6@xiaomi.com, leo.yan@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linuxppc-dev@lists.ozlabs.org, maddy@linux.ibm.com,
	mpe@ellerman.id.au, npiggin@gmail.com, rppt@kernel.org,
	ryan.roberts@arm.com
Subject: Re: [PATCH v9 09/10] mm/vmalloc: map contiguous pages in batches for
 vmap() if possible
Message-ID: <ar0lMkKxugZV7xyw@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-10-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260923062832.479455-10-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_160527_996203_0A65B1FA 
X-CRM114-Status: GOOD (  31.22  )
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

On Wed, Sep 23, 2026 at 02:28:31PM +0800, Wen Jiang wrote:
> From: "Barry Song (Xiaomi)" <baohua@kernel.org>
> 
> In many cases, the pages passed to vmap() may include high-order
> pages. For example, the systemheap often allocates pages in descending
> order: order 8, then 4, then 0. Currently, vmap() iterates over every
> page individually—even pages inside a high-order block are handled
> one by one.
> 
> This patch detects physically contiguous pages (regardless of whether
> they are compound or non-compound) by scanning with
> num_pages_contiguous(), and maps them as a single contiguous block
> whenever possible. The mapping order is determined by taking the
> minimum of the contiguous page count and the pfn alignment, allowing
> graceful degradation when pfn alignment is less than the contiguous
> range.
> 
> Pages with the same page_shift are coalesced and mapped via
> vmap_pages_range_noflush_walk() to avoid page table rewalk.
> 
> As users typically allocate memory in descending orders (e.g.
> 8 → 4 → 0), once an order-0 page is encountered, we stop scanning
> for contiguous pages since subsequent pages are likely order-0 as well.
> 
> Signed-off-by: Barry Song (Xiaomi) <baohua@kernel.org>
> Co-developed-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  mm/vmalloc.c | 82 ++++++++++++++++++++++++++++++++++++++++++++++++++--
>  1 file changed, 80 insertions(+), 2 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index a43965016eb4d..37cddb7f45a4f 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -3576,6 +3576,85 @@ static inline unsigned int vm_shift(pgprot_t prot, unsigned long size)
>  	return arch_vmap_pte_supported_shift(size);
>  }
>  
> +static inline int get_vmap_batch_order(struct page **pages,
> +		pgprot_t prot, unsigned int nr_pages)
>
get_vmap_mapping_order()?

> +{
> +	unsigned long pfn;
> +	unsigned int nr_contig;
> +	int order;
> +
> +	if (!IS_ENABLED(CONFIG_HAVE_ARCH_HUGE_VMAP))
> +		return 0;
> +
> +	/* Limit nr_pages by pfn alignment */
> +	pfn = page_to_pfn(*pages);
> +	if (pfn > 0)
> +		nr_pages = min_t(size_t, nr_pages, 1UL << __ffs(pfn));
> +
> +	nr_contig = num_pages_contiguous(pages, nr_pages);
> +	if (nr_contig < 2)
> +		return 0;
> +
> +	order = ilog2(nr_contig);
> +
> +	if (vm_shift(prot, PAGE_SIZE << order) == PAGE_SHIFT)
> +		return 0;
> +
> +	return order;
> +}
> +
> +static int vmap_pages_range_batched(unsigned long addr, unsigned long end,
> +		pgprot_t prot, struct page **pages)
> +{
> +	const unsigned int nr_pages = (end - addr) >> PAGE_SHIFT;
> +	unsigned int prev_shift = 0, batch_idx = 0;
> +	unsigned long batch_start = addr, batch_end = addr;
> +	int err;
> +
> +	err = kmsan_vmap_pages_range_noflush(addr, end, prot, pages,
> +					     PAGE_SHIFT, GFP_KERNEL);
> +
> +	if (err)
> +		goto out;
> +
> +	for (unsigned int i = 0; i < nr_pages; ) {
> +		unsigned int shift = PAGE_SHIFT +
> +			get_vmap_batch_order(pages + i, prot, nr_pages - i);
> +
> +		if (!i)
> +			prev_shift = shift;
> +
> +		if (shift != prev_shift) {
> +			err = vmap_pages_range_noflush_walk(batch_start, batch_end,
> +					prot, pages + batch_idx, prev_shift);
> +			if (err)
> +				goto out;
> +			prev_shift = shift;
> +			batch_start = batch_end;
> +			batch_idx = i;
> +		}
> +
> +		/*
> +		 * Once we fail to batch pages, we expect to fail batching
> +		 * for all remaining pages, so just give up.
> +		 */
> +		if (shift == PAGE_SHIFT)
> +			break;
> +
> +		batch_end += 1UL << shift;
> +		i += 1U << (shift - PAGE_SHIFT);
> +	}
> +
> +	/* Remaining */
> +	if (batch_start < end)
> +		err = vmap_pages_range_noflush_walk(batch_start, end, prot,
> +				pages + batch_idx, prev_shift);
> +
> +out:
> +	flush_cache_vmap(addr, end);
> +	return err;
>
On error, if kmsan_vmap_pages_range_noflush() succeed you do not do a
proper cleanup?

i.e. to cleanup KMSAN metadata: kmsan_vunmap_range_noflush(addr, end);

> +}
> +
>  /**
>   * vmap - map an array of pages into virtually contiguous space
>   * @pages: array of page pointers
> @@ -3619,8 +3698,7 @@ void *vmap(struct page **pages, unsigned int count,
>  		return NULL;
>  
>  	addr = (unsigned long)area->addr;
> -	if (vmap_pages_range(addr, addr + size, pgprot_nx(prot),
> -				pages, PAGE_SHIFT) < 0) {
> +	if (vmap_pages_range_batched(addr, addr + size, pgprot_nx(prot), pages) < 0) {
>  		vunmap(area->addr);
>  		return NULL;
>  	}
> -- 
> 2.34.1
> 

