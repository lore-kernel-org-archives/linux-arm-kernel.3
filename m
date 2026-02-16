Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9FC85E63F25
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 06:32:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OemK6HUyQdUBR5NgHboWB8t27mpwBCoDQSpnP0oXjZE=; b=TZeYuPvQ5bSid5OHZs0+zbkAX3
	9FcXKubIEjAIjplAUIdl7OzW7iw6AzdeypwSZfcT7AEms8ySb/yS7Rm8VXFOyiFVpjk/ygc/5kM9p
	ExJVLJ+7vijEBMGwysEsTyJ/ucjkvM5Vf9mqfXtu5yEMfr65GwOtSmevBGiczA45F7UWeJHs4qcr6
	wRK8QhzDxiIt9fYH7XVpKTYSGc0+p8OhYlQ4JCdz8iRcg/uPwAihE4q1OHDon3vvZOfmK+PKyuVUr
	kmZote5DuXik1DA5EfpnG6isC32O2WQl6sg86oZH5NKNUgyGbQESKZVtHVzTTAyJZc7deKFZRr7Kp
	LBX6PZxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrs9U-000000062Un-3Hco;
	Mon, 16 Feb 2026 06:32:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vrs9R-000000062U9-3CpL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 06:32:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5B730150C;
	Sun, 15 Feb 2026 22:31:58 -0800 (PST)
Received: from [10.164.19.71] (unknown [10.164.19.71])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id C685E3F73F;
	Sun, 15 Feb 2026 22:32:00 -0800 (PST)
Message-ID: <b7711ebd-02fb-4cab-ade3-f4ff2f738de9@arm.com>
Date: Mon, 16 Feb 2026 12:01:57 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] [v2] arm64: hugetlbpage: avoid unused-but-set-parameter
 warning (gcc-16)
To: Arnd Bergmann <arnd@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>
Cc: Arnd Bergmann <arnd@arndb.de>, Andrew Morton <akpm@linux-foundation.org>,
 Ryan Roberts <ryan.roberts@arm.com>,
 Anshuman Khandual <anshuman.khandual@arm.com>,
 Rohan McLure <rmclure@linux.ibm.com>, Kevin Brodsky <kevin.brodsky@arm.com>,
 Baolin Wang <baolin.wang@linux.alibaba.com>,
 Alistair Popple <apopple@nvidia.com>, Andrew Donnellan <ajd@linux.ibm.com>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260213162219.1042965-1-arnd@kernel.org>
Content-Language: en-US
From: Dev Jain <dev.jain@arm.com>
In-Reply-To: <20260213162219.1042965-1-arnd@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260215_223209_869458_24564ED7 
X-CRM114-Status: GOOD (  16.61  )
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


On 13/02/26 9:52 pm, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>
> gcc-16 warns about an instance that older compilers did not:
>
> arch/arm64/mm/hugetlbpage.c: In function 'huge_pte_clear':
> arch/arm64/mm/hugetlbpage.c:369:57: error: parameter 'addr' set but not used [-Werror=unused-but-set-parameter=]
>
> The issue here is that __pte_clear() does not actually use its second
> argument when CONFIG_ARM64_CONTPTE is disabled.

But that is true even when the config is on? __pte_clear has an unconditional definition.

>
> Replace the macro with an inline function to let the compiler see
> how the argument is used.
>
> Suggested-by: Catalin Marinas <catalin.marinas@arm.com>
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
> v2: replace my original patch with Catalin's suggestion
> ---
>  arch/arm64/include/asm/pgtable.h | 9 +++++++--
>  1 file changed, 7 insertions(+), 2 deletions(-)
>
> diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
> index a17eb8a76788..b3e58735c49b 100644
> --- a/arch/arm64/include/asm/pgtable.h
> +++ b/arch/arm64/include/asm/pgtable.h
> @@ -144,8 +144,6 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
>  	__pte(__phys_to_pte_val((phys_addr_t)(pfn) << PAGE_SHIFT) | pgprot_val(prot))
>  
>  #define pte_none(pte)		(!pte_val(pte))
> -#define __pte_clear(mm, addr, ptep) \
> -				__set_pte(ptep, __pte(0))
>  #define pte_page(pte)		(pfn_to_page(pte_pfn(pte)))
>  
>  /*
> @@ -1284,6 +1282,13 @@ static inline bool pud_user_accessible_page(pud_t pud, unsigned long addr)
>  /*
>   * Atomic pte/pmd modifications.
>   */
> +
> +static inline void __pte_clear(struct mm_struct *mm,
> +			       unsigned long addr, pte_t *ptep)
> +{
> +	__set_pte(ptep, __pte(0));
> +}
> +
>  static inline int __ptep_test_and_clear_young(struct vm_area_struct *vma,
>  					      unsigned long address,
>  					      pte_t *ptep)

