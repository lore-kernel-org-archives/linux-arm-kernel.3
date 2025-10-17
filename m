Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9EEC9CCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Oct 2025 10:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=k8uE5HV7lTZ9Viin4SbVtTZQCUCf2j3WzihHiGuSSBk=; b=g8kfHKS641jiVY+J4doos9eNsk
	gevayDRp86vzuIfdtav0DAM3HP3QaC4Uw0eIl0PVqdt9zGjkvhQGwmdHbhAG74rovSbotQ+YnlqoE
	5ySziQNHuqalnn5uQvZ09ZxdDSGl4XEHqLoac3mnbzhlYZ4lhe4wR9Um42p5Oum9jxFAn8quAIYQ6
	zc6m8SpquCCs9ChXJw6ra/P23HSZxh46U0l4kOIQDK0zYzte7CejEdTdxaiKDdlhJE5AaDK0s8kQc
	2jwYKzPRs/yxX8//6YFhwkJfunF62Vxe3gQu61q+EjH5jtq0SQzeaFvyUHzRh+wJWfRt/+EmjtzyJ
	ROcE+Z6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hTt-00000007V15-1iY7;
	Fri, 17 Oct 2025 10:14:41 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v9hTq-00000007Uze-2Qle
	for linux-arm-kernel@lists.infradead.org;
	Fri, 17 Oct 2025 10:14:39 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 023021595;
	Fri, 17 Oct 2025 03:14:30 -0700 (PDT)
Received: from [10.163.39.14] (unknown [10.163.39.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DAB8D3F59E;
	Fri, 17 Oct 2025 03:14:33 -0700 (PDT)
Message-ID: <8bb759bc-3fb4-4c15-869a-6cfc83752031@arm.com>
Date: Fri, 17 Oct 2025 15:44:30 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 2/2] arm64/mm: Rename try_pgd_pgtable_alloc_init_mm
To: Linu Cherian <linu.cherian@arm.com>,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>, linux-arm-kernel@lists.infradead.org,
 linux-kernel@vger.kernel.org
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
 Zhenhua Huang <quic_zhenhuah@quicinc.com>, Dev Jain <dev.jain@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Yang Shi <yang@os.amperecomputing.com>
References: <20251017051437.2836080-1-linu.cherian@arm.com>
 <20251017051437.2836080-3-linu.cherian@arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20251017051437.2836080-3-linu.cherian@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251017_031438_659414_C71CF50B 
X-CRM114-Status: GOOD (  13.25  )
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

On 17/10/25 10:44 AM, Linu Cherian wrote:
> With BUG_ON in pgd_pgtable_alloc_init_mm moved up to higher layer,
> gfp flags is the only difference between try_pgd_pgtable_alloc_init_mm
> and pgd_pgtable_alloc_init_mm. Hence rename the "try" version
> to pgd_pgtable_alloc_init_mm_gfp.
> 
> Reviewed-by: Dev Jain <dev.jain@arm.com>
> Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>
> Reviewed-by: Kevin Brodsky <kevin.brodsky@arm.com>
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>

Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>

> ---
> Changelog:
> v4:
> No changes.
> 
>  arch/arm64/mm/mmu.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 99555ebbab38..f604a7983de3 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -560,7 +560,7 @@ static phys_addr_t __pgd_pgtable_alloc(struct mm_struct *mm, gfp_t gfp,
>  }
>  
>  static phys_addr_t
> -try_pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type, gfp_t gfp)
> +pgd_pgtable_alloc_init_mm_gfp(enum pgtable_type pgtable_type, gfp_t gfp)
>  {
>  	return __pgd_pgtable_alloc(&init_mm, gfp, pgtable_type);
>  }
> @@ -568,7 +568,7 @@ try_pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type, gfp_t gfp)
>  static phys_addr_t __maybe_unused
>  pgd_pgtable_alloc_init_mm(enum pgtable_type pgtable_type)
>  {
> -	return __pgd_pgtable_alloc(&init_mm, GFP_PGTABLE_KERNEL, pgtable_type);
> +	return pgd_pgtable_alloc_init_mm_gfp(pgtable_type, GFP_PGTABLE_KERNEL);
>  }
>  
>  static phys_addr_t
> @@ -595,7 +595,7 @@ static int split_pmd(pmd_t *pmdp, pmd_t pmd, gfp_t gfp, bool to_cont)
>  	pte_t *ptep;
>  	int i;
>  
> -	pte_phys = try_pgd_pgtable_alloc_init_mm(TABLE_PTE, gfp);
> +	pte_phys = pgd_pgtable_alloc_init_mm_gfp(TABLE_PTE, gfp);
>  	if (pte_phys == INVALID_PHYS_ADDR)
>  		return -ENOMEM;
>  	ptep = (pte_t *)phys_to_virt(pte_phys);
> @@ -640,7 +640,7 @@ static int split_pud(pud_t *pudp, pud_t pud, gfp_t gfp, bool to_cont)
>  	pmd_t *pmdp;
>  	int i;
>  
> -	pmd_phys = try_pgd_pgtable_alloc_init_mm(TABLE_PMD, gfp);
> +	pmd_phys = pgd_pgtable_alloc_init_mm_gfp(TABLE_PMD, gfp);
>  	if (pmd_phys == INVALID_PHYS_ADDR)
>  		return -ENOMEM;
>  	pmdp = (pmd_t *)phys_to_virt(pmd_phys);


