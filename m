Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 083AAFA374B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Jan 2026 15:29:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SG5oivluQ2KH8o5qnvzBYgxOEg7MQA1Nt9v4YsuWE9w=; b=BAzd80T0SnkRGIJdfxlgsgKEIS
	3v3Ng/bNuzvL4p187ej9Gs9d9hFpRe7UTH65dNEIutcRA5T1tIdBDaVgczGSBlpgcf4ffMws5pMVQ
	ITmHO5MOEgM/5bPj5jifu852FeMxXaUqfrGNl73unz0LBRKZs7yBCAoiCs86pV0lGKVTVBqFtI8Py
	27eZ45TvRbbkUe3ArztQvIQ6CESRcaagMrnCtUI8GRHMdghr3KNJZ7B52Bj1K+AJbNaDEvhzbMJd5
	V5PjdKXGJmdHn+Z7dPMcSXzU07FYlq3SpGXeVR/sj3gUTzdkooC2fe3xRE5SKm9YSQAqYA4ptxY8/
	Mdw2dOAg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbh5F-00000008Qzn-0pCv;
	Fri, 02 Jan 2026 15:28:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vbh5C-00000008QzN-4C6X
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Jan 2026 15:28:56 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 2145B497;
	Fri,  2 Jan 2026 07:28:47 -0800 (PST)
Received: from [10.57.94.221] (unknown [10.57.94.221])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D04B83F5A1;
	Fri,  2 Jan 2026 07:28:50 -0800 (PST)
Message-ID: <4a315d79-bf82-4a90-9c9c-8dd1bdc43d38@arm.com>
Date: Fri, 2 Jan 2026 15:28:49 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 1/3] arm64: mmu: introduce pgtable_alloc_t
Content-Language: en-GB
To: Yeoreum Yun <yeoreum.yun@arm.com>, catalin.marinas@arm.com,
 will@kernel.org, akpm@linux-foundation.org, david@kernel.org,
 kevin.brodsky@arm.com, quic_zhenhuah@quicinc.com, dev.jain@arm.com,
 yang@os.amperecomputing.com, chaitanyas.prakash@arm.com,
 bigeasy@linutronix.de, clrkwllms@kernel.org, rostedt@goodmis.org,
 lorenzo.stoakes@oracle.com, ardb@kernel.org, jackmanb@google.com,
 vbabka@suse.cz, mhocko@suse.com
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 linux-rt-devel@lists.linux.dev
References: <20260102150736.1378818-1-yeoreum.yun@arm.com>
 <20260102150736.1378818-2-yeoreum.yun@arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <20260102150736.1378818-2-yeoreum.yun@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260102_072855_187827_4DA68F64 
X-CRM114-Status: GOOD (  13.19  )
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

On 02/01/2026 15:07, Yeoreum Yun wrote:
> This is preparation patch to use preallocated page tables
> for linear_map_split_to_ptes().
> 
> Define pgtable_alloc_t type for callback used by create_XXX_mapping().
> 
> Signed-off-by: Yeoreum Yun <yeoreum.yun@arm.com>

Reviewed-by: Ryan Roberts <ryan.roberts@arm.com>

> ---
>  arch/arm64/mm/mmu.c | 18 ++++++++++--------
>  1 file changed, 10 insertions(+), 8 deletions(-)
> 
> diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> index 8e1d80a7033e..4b4908ae189b 100644
> --- a/arch/arm64/mm/mmu.c
> +++ b/arch/arm64/mm/mmu.c
> @@ -74,6 +74,8 @@ EXPORT_SYMBOL(empty_zero_page);
>  static DEFINE_SPINLOCK(swapper_pgdir_lock);
>  static DEFINE_MUTEX(fixmap_lock);
>  
> +typedef phys_addr_t (pgtable_alloc_t)(enum pgtable_type);
> +
>  void noinstr set_swapper_pgd(pgd_t *pgdp, pgd_t pgd)
>  {
>  	pgd_t *fixmap_pgdp;
> @@ -197,7 +199,7 @@ static void init_pte(pte_t *ptep, unsigned long addr, unsigned long end,
>  static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  			       unsigned long end, phys_addr_t phys,
>  			       pgprot_t prot,
> -			       phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> +			       pgtable_alloc_t pgtable_alloc,
>  			       int flags)
>  {
>  	unsigned long next;
> @@ -252,7 +254,7 @@ static int alloc_init_cont_pte(pmd_t *pmdp, unsigned long addr,
>  
>  static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  		    phys_addr_t phys, pgprot_t prot,
> -		    phys_addr_t (*pgtable_alloc)(enum pgtable_type), int flags)
> +		    pgtable_alloc_t pgtable_alloc, int flags)
>  {
>  	unsigned long next;
>  
> @@ -292,7 +294,7 @@ static int init_pmd(pmd_t *pmdp, unsigned long addr, unsigned long end,
>  static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  			       unsigned long end, phys_addr_t phys,
>  			       pgprot_t prot,
> -			       phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> +			       pgtable_alloc_t pgtable_alloc,
>  			       int flags)
>  {
>  	int ret;
> @@ -349,7 +351,7 @@ static int alloc_init_cont_pmd(pud_t *pudp, unsigned long addr,
>  
>  static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  			  phys_addr_t phys, pgprot_t prot,
> -			  phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> +			  pgtable_alloc_t pgtable_alloc,
>  			  int flags)
>  {
>  	int ret = 0;
> @@ -415,7 +417,7 @@ static int alloc_init_pud(p4d_t *p4dp, unsigned long addr, unsigned long end,
>  
>  static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  			  phys_addr_t phys, pgprot_t prot,
> -			  phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> +			  pgtable_alloc_t pgtable_alloc,
>  			  int flags)
>  {
>  	int ret;
> @@ -467,7 +469,7 @@ static int alloc_init_p4d(pgd_t *pgdp, unsigned long addr, unsigned long end,
>  static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>  				       unsigned long virt, phys_addr_t size,
>  				       pgprot_t prot,
> -				       phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> +				       pgtable_alloc_t pgtable_alloc,
>  				       int flags)
>  {
>  	int ret;
> @@ -500,7 +502,7 @@ static int __create_pgd_mapping_locked(pgd_t *pgdir, phys_addr_t phys,
>  static int __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>  				unsigned long virt, phys_addr_t size,
>  				pgprot_t prot,
> -				phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> +				pgtable_alloc_t pgtable_alloc,
>  				int flags)
>  {
>  	int ret;
> @@ -516,7 +518,7 @@ static int __create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>  static void early_create_pgd_mapping(pgd_t *pgdir, phys_addr_t phys,
>  				     unsigned long virt, phys_addr_t size,
>  				     pgprot_t prot,
> -				     phys_addr_t (*pgtable_alloc)(enum pgtable_type),
> +				     pgtable_alloc_t pgtable_alloc,
>  				     int flags)
>  {
>  	int ret;


