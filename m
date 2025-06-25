Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2F9C5C7EE2A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 14:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gj51cTkdtVCvEEjOlkEXFEweDA+pGJwJ9Da0qmJyqZA=; b=nGWWzTyD6NQNsPJV3bySLCXHLw
	Hb5GQmpGbDBazLYaP8rMgCbgIpnIrrzdrpYSIFGhUaePzSM9VSwn2vR5EZzMdmjWtnTOiWEmib6ZZ
	JSgvZwRf1XFrnSPHrDKoXrtMofWo9uZNzEVo3DQl5abfUhMMOkjaam93zBes6MrYDwqHSBUjhY+zt
	JbC+K0JKChdikfBMmQ1xMsOl40Fs6qBEYc2O5xASvNs/gubHpzboX+hguRGrgY/tkIgLQSBukpIhL
	IhKTVPgOgUSf73cCzcWBGVRTOp0D4NdJz6NyJ8Bm1cg47fSS90AHdB2ncUb0Lx806wLI64T/hDvJz
	VGbMrK9A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uURGW-00000008zVA-0hGK;
	Wed, 25 Jun 2025 14:38:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUO0G-00000008QnY-0nj0
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 11:09:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 23FB8106F;
	Wed, 25 Jun 2025 04:09:01 -0700 (PDT)
Received: from [10.57.84.221] (unknown [10.57.84.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 043DD3F58B;
	Wed, 25 Jun 2025 04:09:09 -0700 (PDT)
Message-ID: <400b6d4e-bf10-4b89-bcbe-2375b1972220@arm.com>
Date: Wed, 25 Jun 2025 12:08:59 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/2] arm64: pageattr: Enable huge-vmalloc permission
 change
Content-Language: en-GB
To: Dev Jain <dev.jain@arm.com>, akpm@linux-foundation.org, david@redhat.com,
 catalin.marinas@arm.com, will@kernel.org
Cc: lorenzo.stoakes@oracle.com, Liam.Howlett@oracle.com, vbabka@suse.cz,
 rppt@kernel.org, surenb@google.com, mhocko@suse.com, linux-mm@kvack.org,
 linux-kernel@vger.kernel.org, suzuki.poulose@arm.com, steven.price@arm.com,
 gshan@redhat.com, linux-arm-kernel@lists.infradead.org,
 yang@os.amperecomputing.com, anshuman.khandual@arm.com
References: <20250613134352.65994-1-dev.jain@arm.com>
 <20250613134352.65994-3-dev.jain@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20250613134352.65994-3-dev.jain@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250625_040920_283270_F2A00C69 
X-CRM114-Status: GOOD (  22.01  )
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

On 13/06/2025 14:43, Dev Jain wrote:
> Commit fcf8dda8cc48 ("arm64: pageattr: Explicitly bail out when changing
> permissions for vmalloc_huge mappings") disallowed changing permissions
> for vmalloc-huge mappings. The motivation of this was to enforce an API
> requirement and explicitly tell the caller that it is unsafe to change
> permissions for block mappings since splitting may be required, which
> cannot be handled safely on an arm64 system in absence of BBML2.
> 
> This patch effectively partially reverts this commit, since patch 1
> will now enable permission changes on kernel block mappings, thus,
> through change_memory_common(), enable permission changes for vmalloc-huge
> mappings. Any caller "misusing" the API, in the sense, calling it for
> a partial block mapping, will receive an error code of -EINVAL via
> the pagewalk callbacks, thus reverting to the behaviour of the API
> itself returning -EINVAL, through apply_to_page_range returning -EINVAL
> in case of block mappings, the difference now being, the -EINVAL is
> restricted to playing permission games on partial block mappings
> courtesy of patch 1.
> 
> Signed-off-by: Dev Jain <dev.jain@arm.com>
> ---
>  arch/arm64/mm/pageattr.c | 4 +---
>  1 file changed, 1 insertion(+), 3 deletions(-)
> 
> diff --git a/arch/arm64/mm/pageattr.c b/arch/arm64/mm/pageattr.c
> index cfc5279f27a2..66676f7f432a 100644
> --- a/arch/arm64/mm/pageattr.c
> +++ b/arch/arm64/mm/pageattr.c
> @@ -195,8 +195,6 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	 * we are operating on does not result in such splitting.
>  	 *
>  	 * Let's restrict ourselves to mappings created by vmalloc (or vmap).
> -	 * Disallow VM_ALLOW_HUGE_VMAP mappings to guarantee that only page
> -	 * mappings are updated and splitting is never needed.
>  	 *
>  	 * So check whether the [addr, addr + size) interval is entirely
>  	 * covered by precisely one VM area that has the VM_ALLOC flag set.
> @@ -204,7 +202,7 @@ static int change_memory_common(unsigned long addr, int numpages,
>  	area = find_vm_area((void *)addr);
>  	if (!area ||
>  	    end > (unsigned long)kasan_reset_tag(area->addr) + area->size ||
> -	    ((area->flags & (VM_ALLOC | VM_ALLOW_HUGE_VMAP)) != VM_ALLOC))
> +	    !(area->flags & VM_ALLOC))
>  		return -EINVAL;
>  
>  	if (!numpages)

I'd be inclined to leave this restriction in place for now. It is not useful
until we have context of the full vmalloc-huge-by-default series, I don't think?

