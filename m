Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 332B3CD6E56
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 10:43:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w+Nusdc80UxxlxkRbJQVlsMrz4yOsTaBzGC7whbZUGQ=; b=uDZR9C4Zb3pyCVrCqImn9D2R8k
	xILeyNa8Nhyj0ninL0GNoxwvvBq0FhQAaudJVCmJohvUFv2d/WBOTzMerzrnlmiBAyiuNj9hclzmg
	uDpjyD17ongvhHG+meRgU1mfUj3niA2zV+9PBTHduJsTvC905/2dgNYK/RcEbmdMePwKu+/DuEQTt
	Ue+T2rqctDe14T3kCd7OSbJuI6DNkzDxCmKqij9yupKeGrDkfqNQBNBBjoFV3HPkaqpn80OvxzuIC
	/rU4nvayYA0hrysTZeVgVgNqqePMHS/7Y2BKVDkmaspInxmgnz3Pksmi8CH9LQyjJT75MgzC4lYSg
	/dPD0+5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU06t-0000000Ae1H-0fcE;
	Mon, 01 Jun 2026 10:43:07 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU06r-0000000Ae16-37gn
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 01 Jun 2026 10:43:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=w+Nusdc80UxxlxkRbJQVlsMrz4yOsTaBzGC7whbZUGQ=; b=Len09Ek9yCFpvluP0dDpZyKm5U
	xv9pipNlzyNjlP5KILqVBqSUoIianEzzwRztOSa+EKlOLPcXQMkFlKMyfOy1JNA0sApC31kPHGetU
	DLW70xhVicua8lY7tOR/YlxSRKjz4wIgehKUTQzrNgXX3qVMYwaXNISAsT8EgpBq1ld1Ic9oAnNbn
	IJv6C94ZLaGwQMAKFzuxbq6wrdiutIHNJy5eZvL23IX/uxfbxB5Bo2ui4UwUs3YByUS2DELADdDtQ
	JLLnEAT04urA9t7RD8GQMEvEPTQ8+mwoPanxJByd1pmmgfebtHWPoIN0cDX61TR2FAw539lhnYOuC
	EmPeO5qw==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU06o-00000006RGl-1aVM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 10:43:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2DF0B1516;
	Mon,  1 Jun 2026 03:42:55 -0700 (PDT)
Received: from [10.57.94.8] (unknown [10.57.94.8])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id CE8AB3F905;
	Mon,  1 Jun 2026 03:42:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1780310580; bh=Surtzdfsfons0Igc45K6QS/muGPLmDhB31E+s1aspA8=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=L7vvyWyP5yYoDEKRDyQEcn+KUcyIZLm2/zPqf2mFWbJd8f5vtwRD9mJ+gjQLemSmG
	 61GJ7fElvuDmqzB0boUzsETOcCIg+LT5X96dfHbuAGeuIYJbp6tPCru3g6Uz1zZTsM
	 dtan6SzPh6XJ40fqoV65vNcSw4ucQjj+39rNxGKw=
Message-ID: <502eadae-089f-41cb-a871-9ad6b8169e0d@arm.com>
Date: Mon, 1 Jun 2026 12:42:52 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v7 07/15] arm64: kfence: Avoid NOMAP tricks when mapping
 the early pool
To: Ard Biesheuvel <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org, will@kernel.org, catalin.marinas@arm.com,
 mark.rutland@arm.com, Ard Biesheuvel <ardb@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Liz Prucka <lizprucka@google.com>, Seth Jenkins <sethjenkins@google.com>,
 Kees Cook <kees@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 David Hildenbrand <david@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>, Jann Horn <jannh@google.com>,
 linux-mm@kvack.org, linux-hardening@vger.kernel.org,
 linuxppc-dev@lists.ozlabs.org, linux-sh@vger.kernel.org
References: <20260529150150.1670604-17-ardb+git@google.com>
 <20260529150150.1670604-24-ardb+git@google.com>
From: Kevin Brodsky <kevin.brodsky@arm.com>
Content-Language: en-GB
In-Reply-To: <20260529150150.1670604-24-ardb+git@google.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_114303_033394_A152E774 
X-CRM114-Status: GOOD (  24.15  )
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

On 29/05/2026 17:01, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>
> Now that the map_mem() routines respect existing page mappings and
> contiguous granule sized blocks with the contiguous bit cleared, there
> is no longer a reason to play tricks with the memblock NOMAP attribute.
>
> Instead, the kfence pool can be allocated and mapped with page
> granularity first, and this granularity will be respected when the rest
> of DRAM is mapped later, even if block and contiguous mappings are
> allowed for the remainder of those mappings.
>
> Add the NO_EXEC_MAPPINGS flag to ensure that hierarchical XN attributes
> are set on the intermediate page tables that are allocated when mapping
> the pool.
>
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>

> ---
>  arch/arm64/mm/mmu.c | 27 +++++---------------
>  1 file changed, 6 insertions(+), 21 deletions(-)
>
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index d7a6991e1844..cdf8b3510229 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -1083,36 +1083,24 @@ static int __init parse_kfence_early_init(char *arg)
>  }
>  early_param("kfence.sample_interval", parse_kfence_early_init);
>  
> -static phys_addr_t __init arm64_kfence_alloc_pool(void)
> +static void __init arm64_kfence_map_pool(void)
>  {
>  	phys_addr_t kfence_pool;
>  
>  	if (!kfence_early_init)
> -		return 0;
> +		return;
>  
>  	kfence_pool = memblock_phys_alloc(KFENCE_POOL_SIZE, PAGE_SIZE);
>  	if (!kfence_pool) {
>  		pr_err("failed to allocate kfence pool\n");
>  		kfence_early_init = false;
> -		return 0;
> -	}
> -
> -	/* Temporarily mark as NOMAP. */
> -	memblock_mark_nomap(kfence_pool, KFENCE_POOL_SIZE);
> -
> -	return kfence_pool;
> -}
> -
> -static void __init arm64_kfence_map_pool(phys_addr_t kfence_pool)
> -{
> -	if (!kfence_pool)
>  		return;
> +	}
>  
>  	/* KFENCE pool needs page-level mapping. */
>  	__map_memblock(kfence_pool, kfence_pool + KFENCE_POOL_SIZE,
>  			pgprot_tagged(PAGE_KERNEL),
> -			NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS);
> -	memblock_clear_nomap(kfence_pool, KFENCE_POOL_SIZE);
> +			NO_BLOCK_MAPPINGS | NO_CONT_MAPPINGS | NO_EXEC_MAPPINGS);
>  	__kfence_pool = phys_to_virt(kfence_pool);
>  }
>  
> @@ -1144,8 +1132,7 @@ bool arch_kfence_init_pool(void)
>  }
>  #else /* CONFIG_KFENCE */
>  
> -static inline phys_addr_t arm64_kfence_alloc_pool(void) { return 0; }
> -static inline void arm64_kfence_map_pool(phys_addr_t kfence_pool) { }
> +static inline void arm64_kfence_map_pool(void) { }
>  
>  #endif /* CONFIG_KFENCE */
>  
> @@ -1155,7 +1142,6 @@ static void __init map_mem(void)
>  	phys_addr_t kernel_start = __pa_symbol(_text);
>  	phys_addr_t kernel_end = __pa_symbol(__init_begin);
>  	phys_addr_t start, end;
> -	phys_addr_t early_kfence_pool;
>  	int flags = NO_EXEC_MAPPINGS;
>  	u64 i;
>  
> @@ -1172,7 +1158,7 @@ static void __init map_mem(void)
>  	BUILD_BUG_ON(pgd_index(direct_map_end - 1) == pgd_index(direct_map_end) &&
>  		     pgd_index(_PAGE_OFFSET(VA_BITS_MIN)) != PTRS_PER_PGD - 1);
>  
> -	early_kfence_pool = arm64_kfence_alloc_pool();
> +	arm64_kfence_map_pool();
>  
>  	linear_map_requires_bbml2 = !force_pte_mapping() && can_set_direct_map();
>  
> @@ -1210,7 +1196,6 @@ static void __init map_mem(void)
>  	 */
>  	__map_memblock(kernel_start, kernel_end, PAGE_KERNEL, NO_CONT_MAPPINGS);
>  	memblock_clear_nomap(kernel_start, kernel_end - kernel_start);
> -	arm64_kfence_map_pool(early_kfence_pool);
>  }
>  
>  void mark_rodata_ro(void)

