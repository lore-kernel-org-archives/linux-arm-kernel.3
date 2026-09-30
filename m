Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1883CA5FC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Sep 2026 14:39:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8zIgRBEcUOotWURvolQ5JIFyn/MboxYU1izn9qFVjOk=; b=HuAAZM8fyLnqOFu5k/D3cmiay7
	ko40/M39w1WTfyttD3D44vA0b5C2ON1HKasQw25KbkrsY9Ykuhi57/QVw1XsPrR44SmiSRBSIJERx
	z9sHH7jF42zEpCtjWnQD/1SfQRcAe+chD76q25Q8bGSO0um90bXKW3JyUuwR1OiYtYzAlWfEjNFx7
	kwb95ZPxerpx1VaEwbgjOCjj8pOBvtI03IFJ2EJvGYdZRsKEzbXH7E8WulBRPdrtnyY0gPZ9cRkjf
	A9Xj5hqeVFToTDDrExrhINLNARF2Abx2Oco0tW/IgeXd7579Z1eKdHvE41bb/JnuA4UnUPC42mjnC
	/YOQBh7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvTD-00000006LSi-2nrw;
	Wed, 30 Sep 2026 14:39:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBvTC-00000006LSS-26nt
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 30 Sep 2026 14:39:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8zIgRBEcUOotWURvolQ5JIFyn/MboxYU1izn9qFVjOk=; b=fVCKPZ5lOsryAkGEzTA5eMDvIZ
	Tn6nIgl2uB7DPfpiCKibGwu75w5u+5fIMs9cmvYRYIQ4kURtm3c8Ialc6NhiEEtuB/Jfk51vlIbpz
	4mIIx5OqBo31zuwowg2fetuzK/MVcNU5KZu7LZy8iKduiUFr2F2+R+2hi9eZvxbZpVYpkoO0/2Z8c
	Co/i6OtiwWcUbQ8ZAsbXpdb6+UoLjji8TqhoiysVcL9vik2rFl0LWXz/nwvJ+BYFKcv9mAaDqGuIW
	kt0cL/hOCg3pS6/0G09sTaYLOXR/vUTpYF34Zb9YTxyJzefQOBTEkY7dM07FNrlr4r5E6cbq5fKQf
	i3fUf9Og==;
Received: from mail-ed2-x0d.google.com ([2a00:1450:4864:33::d])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1xBvT9-00000003vxQ-2rfq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Sep 2026 14:39:41 +0000
Received: by mail-ed2-x0d.google.com with SMTP id 4fb4d7f45d1cf-6abe19c4262so5384865a12.3
        for <linux-arm-kernel@lists.infradead.org>; Wed, 30 Sep 2026 07:39:38 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20251104; t=1790779177; x=1791383977; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=8zIgRBEcUOotWURvolQ5JIFyn/MboxYU1izn9qFVjOk=;
        b=Kg8DbiezzP1zKIfjA9lvyOVgyml2XhlgqkZ4OYAqcszzirHI+Fboz1tar+qTP0o7c6
         zkFDBwn4XH7X6kFSLq9XNxUbjD843AKvPgZVhrYJLAH8vfVRJCMudNA+R4TtDJMUJNo3
         MvWaXiWTYR/VZiKkZJ08qg7aoQz3OFptEsRyxU0tol0gAvnf80AIXIwzscF+Gf47iosL
         F+hGS8RbJpsWqmZlEOgZHnIF00qwSO+ives1PWFPzJritad0JxBJm6HM/BCbTnb/2kGF
         AmegWRqaqeSVJ9z8cz7IgEZyCvfJ70iXdRVE/HXUWXXnNKZ8u6rnd+O4b5L+76603crd
         apNg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1790779177; x=1791383977;
        h=in-reply-to:content-disposition:content-type:mime-version
         :references:message-id:subject:cc:to:date:from:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=8zIgRBEcUOotWURvolQ5JIFyn/MboxYU1izn9qFVjOk=;
        b=Ojg05TicqAzjSG+7ALUbn63KQV06IJw0/tm4QZOEFhko7TqVrFctGv26yYI12CTGnL
         pJ9xrvR+9ioDHMmhwGZxJ3pSvzL/fw2n4/rmViaGhBsOvuG+Nvdr4DZKE6B5BGgCIwTn
         Wrd3YV8ZLXSlQbJcgEcrg++Bsslm4giVvhHOl+WpjsccueMrOkQBD0Z6JaIGLIkkY/eC
         /fH0FRda8020FmvwjWXVsj0otDW0M+UaZif3rSH2hsLO8If1cqCyvhK+cRj39aHmCueM
         L14K19FX6yoT9lvO+8OqnRt/AMIAmBGua7atIK48Pv9LtIfpVTK7f2WavP4bp4BikNKU
         26fQ==
X-Forwarded-Encrypted: i=1; AKwUvBzfjAigIDUGTXmGVH5MM2S9FSOPjHIBTA1Ci7xkJAhPO6TO14NHH+X7gCdLi8gg6cLwDaWiCiaC9VJ0Q6qcpm0Q@lists.infradead.org
X-Gm-Message-State: AFuF++mdV/OUkEuvDcieVLu2I+bMp68EQurGhwW3x8+xseDzh2v+ZqUP
	MqBZ68TZfolRfvn9AQ4pL2c6vtuYAtOGh2qCfKKbjcNBCFQTYESoSw54
X-Gm-Gg: AYBFou0aycG8qBv/ERBT2eVFzJOlDJy3TOUzdvyoVDzHLjMOd3uNveYO8yL17d2gPx3
	a6pm9g3sqtnJZSgf+HJ0gwcVOlAiwYWTyem2n5v+pUfNlh9yiurywvfHlwnFLroWxEvCCiXYEdG
	xI6PuCXLH8NLC8s+cQ/8TGoyY/cp/259FKJoQCSQPjC6qtapE+0CoP3FCAAjUTLN+Fkinx3MlR+
	fnfdhabGfKCBdb4x8nLM0pkFcilhwxQyo5fK0rZ62fIQ8QP++ZfwZHE4eeRPQh8n788vWGJ8opJ
	l2+LdTHq5ygXK6XX53dPc1ihxWeAqu9iV817XTbfJzl+VngZR87ih7stsbVx045H5sNjpppDrAs
	m0hzly7dDl5Q9ZfNF9jXYkq0cgmrrVO7zeCG5QzwyFwHnTZwu/vRQWpajJs47vlGhgE+r1hgXNW
	PqdpVesSj06hXDNpN4FCEralLEmNV60j660+M=
X-Received: by 2002:a17:907:2d24:b0:c29:5172:6151 with SMTP id a640c23a62f3a-c2e23de355amr130161966b.45.1790779177087;
        Wed, 30 Sep 2026 07:39:37 -0700 (PDT)
Received: from milan ([2001:9b1:d5a0:a500::24b])
        by smtp.gmail.com with ESMTPSA id a640c23a62f3a-c2e31cf0d6esm13604766b.37.2026.09.30.07.39.35
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 30 Sep 2026 07:39:36 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@milan>
Date: Wed, 30 Sep 2026 16:39:33 +0200
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
Subject: Re: [PATCH v9 06/10] mm/vmalloc: extract vmap_set_ptes() to
 consolidate PTE mapping logic
Message-ID: <ar0fJcjNmGGV6uFu@milan>
References: <20260923062832.479455-1-jiangwen6@xiaomi.com>
 <20260923062832.479455-7-jiangwen6@xiaomi.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260923062832.479455-7-jiangwen6@xiaomi.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260930_153939_858148_99281503 
X-CRM114-Status: GOOD (  24.98  )
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

On Wed, Sep 23, 2026 at 02:28:28PM +0800, Wen Jiang wrote:
> Extract the common PTE mapping logic from vmap_pte_range() into a
> shared helper vmap_set_ptes(). This handles both CONT_PTE and regular
> PTE mappings in a single function, preparing for the next patch which
> will extend vmap_pages_pte_range() to also use this helper.
> 
> No functional change.
> 
> Signed-off-by: Wen Jiang <jiangwen6@xiaomi.com>
> Tested-by: Xueyuan Chen <xueyuan.chen21@gmail.com>
> Tested-by: Leo Yan <leo.yan@arm.com>
> ---
>  mm/vmalloc.c | 36 +++++++++++++++++++++++++++---------
>  1 file changed, 27 insertions(+), 9 deletions(-)
> 
> diff --git a/mm/vmalloc.c b/mm/vmalloc.c
> index fb757d95bde25..d475e52110e4a 100644
> --- a/mm/vmalloc.c
> +++ b/mm/vmalloc.c
> @@ -92,6 +92,29 @@ struct vfree_deferred {
>  static DEFINE_PER_CPU(struct vfree_deferred, vfree_deferred);
>  
>  /*** Page table manipulation functions ***/
> +
> +/*
> + * Try contiguous mappings at the PTE level for arches which support them, and if
> + * requested by the caller. Fall back to PAGE_SIZE mappings otherwise.
> + *
> + * Return: mapping size.
> + */
> +static __always_inline unsigned long vmap_set_ptes(pte_t *ptep,
> +		unsigned long addr, unsigned long end, u64 pfn,
> +		pgprot_t prot, unsigned int max_page_shift)
> +{
> +	unsigned long size;
> +
> +	size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> +	if (size != PAGE_SIZE) {
> +		pte_set_huge(ptep, addr, PFN_PHYS(pfn), prot, size);
> +		return size;
> +	}
> +
> +	set_pte_at(&init_mm, addr, ptep, pfn_pte(pfn, prot));
> +	return PAGE_SIZE;
> +}
> +
>  static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			phys_addr_t phys_addr, pgprot_t prot,
>  			unsigned int max_page_shift, pgtbl_mod_mask *mask)
> @@ -100,6 +123,7 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  	u64 pfn;
>  	struct page *page;
>  	unsigned long size;
> +	unsigned int steps;
>  
>  	if (WARN_ON_ONCE(!PAGE_ALIGNED(end - addr)))
>  		return -EINVAL;
> @@ -120,15 +144,9 @@ static int vmap_pte_range(pmd_t *pmd, unsigned long addr, unsigned long end,
>  			BUG();
>  		}
>  
> -		size = arch_vmap_pte_range_map_size(addr, end, pfn, max_page_shift);
> -		if (size != PAGE_SIZE) {
> -			pte_set_huge(pte, addr, PFN_PHYS(pfn), prot, size);
> -			pfn += PFN_DOWN(size);
> -			continue;
> -		}
> -		set_pte_at(&init_mm, addr, pte, pfn_pte(pfn, prot));
> -		pfn++;
> -	} while (pte += PFN_DOWN(size), addr += size, addr != end);
> +		size = vmap_set_ptes(pte, addr, end, pfn, prot, max_page_shift);
> +		steps = PFN_DOWN(size);
> +	} while (pte += steps, pfn += steps, addr += size, addr != end);
>
#define PFN_DOWN(x)	((x) >> PAGE_SHIFT) - how many pages covers the size.
Replace steps by nr_pages or nr_ptes?

--
Uladzislau Rezki

