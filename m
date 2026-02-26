Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 656A7FCE06D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Feb 2026 12:50:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=BcQzBIoel8ouA37v+xJmTro0U9klZrqKYw4HmUnjPwY=; b=CHSjYroEnIFD0om2mnnUy7HP/F
	H/YjnFoP1JbUzJ5hgBlJnL3ZQFrooqpOp6/ojC9C57kXUpqFg2136vBhxmB9dRci6PyTxpQ3Xj4pJ
	D7uCSWLqKJqH5HDW/gxrHBVcGm/zjW5nmqzHqXlf6Fw99GNUVs+kYPQ4EfiofVu+O1S8EvWVqPcmO
	+pDL1tmpWWjL0VT9scuEcgHou8Tq05VUvKZCur8TPXCh9+BHCTfnZYmwPYA4Btq1d/WleH7vd2Rdj
	Br6Rbr3PMmP0syjsa5kfUvp0h3LvpX+ElD7sWn0nwy1BxqcYlvNagUdkxqP1qbSmTJUgygwRQ8jBt
	Cx2MPkmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaoX-000000069Co-0aqU;
	Thu, 26 Feb 2026 12:49:57 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvaoU-000000069CP-2SQe
	for linux-arm-kernel@lists.infradead.org;
	Thu, 26 Feb 2026 12:49:55 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0A9E91516;
	Thu, 26 Feb 2026 04:49:47 -0800 (PST)
Received: from [10.163.173.11] (unknown [10.163.173.11])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D99D43F73B;
	Thu, 26 Feb 2026 04:49:48 -0800 (PST)
Message-ID: <75c09e05-1b8a-4009-bbb3-07924b76b532@arm.com>
Date: Thu, 26 Feb 2026 18:19:45 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [RFC V1 01/16] mm: Abstract printing of pxd_val()
To: Usama Arif <usama.arif@linux.dev>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>,
 David Hildenbrand <david@kernel.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260226123442.759447-1-usama.arif@linux.dev>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260226123442.759447-1-usama.arif@linux.dev>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260226_044954_729611_AE1B5658 
X-CRM114-Status: GOOD (  18.08  )
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

On 26/02/26 6:04 PM, Usama Arif wrote:
> On Tue, 24 Feb 2026 10:41:38 +0530 Anshuman Khandual <anshuman.khandual@arm.com> wrote:
> 
>> Ahead of adding support for D128 pgtables, refactor places that print
>> PTE values to use the new __PRIpte format specifier and __PRIpte_args()
>> macro to prepare the argument(s). When using D128 pgtables in future,
>> we can simply redefine __PRIpte and __PTIpte_args().
>>
>> Besides there is also an assumption about pxd_val() being always capped
>> at 'unsigned long long' size but that will not work for D128 pgtables.
>> Just increase its size to u128 if the compiler supports via a separate
>> data type pxdval_t which also defaults to existing 'unsigned long long'.
>>
>> Cc: Andrew Morton <akpm@linux-foundation.org>
>> Cc: David Hildenbrand <david@kernel.org>
>> Cc: Lorenzo Stoakes <lorenzo.stoakes@oracle.com>
>> Cc: Mike Rapoport <rppt@kernel.org>
>> Cc: linux-mm@kvack.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  include/linux/pgtable.h |  5 +++++
>>  mm/memory.c             | 29 +++++++++++++++++++----------
>>  2 files changed, 24 insertions(+), 10 deletions(-)
>>
>> diff --git a/include/linux/pgtable.h b/include/linux/pgtable.h
>> index a50df42a893f..da17139a1279 100644
>> --- a/include/linux/pgtable.h
>> +++ b/include/linux/pgtable.h
>> @@ -17,6 +17,11 @@
>>  #include <asm-generic/pgtable_uffd.h>
>>  #include <linux/page_table_check.h>
>>  
>> +#ifndef __PRIpte
>> +#define __PRIpte		"016llx"
>> +#define __PRIpte_args(val)	((u64)val)
>> +#endif
>> +
>>  #if 5 - defined(__PAGETABLE_P4D_FOLDED) - defined(__PAGETABLE_PUD_FOLDED) - \
>>  	defined(__PAGETABLE_PMD_FOLDED) != CONFIG_PGTABLE_LEVELS
>>  #error CONFIG_PGTABLE_LEVELS is not consistent with __PAGETABLE_{P4D,PUD,PMD}_FOLDED
>> diff --git a/mm/memory.c b/mm/memory.c
>> index 07778814b4a8..cfc3077fc52f 100644
>> --- a/mm/memory.c
>> +++ b/mm/memory.c
>> @@ -532,9 +532,15 @@ static bool is_bad_page_map_ratelimited(void)
>>  	return false;
>>  }
>>  
>> +#ifdef __SIZEOF_INT128__
>> +	typedef u128 pxdval_t;
>> +#else
>> +	typedef unsigned long long pxdval_t;
>> +#endif
>> +
>>  static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long addr)
>>  {
>> -	unsigned long long pgdv, p4dv, pudv, pmdv;
>> +	pxdval_t pgdv, p4dv, pudv, pmdv;
>>  	p4d_t p4d, *p4dp;
>>  	pud_t pud, *pudp;
>>  	pmd_t pmd, *pmdp;
>> @@ -548,7 +554,7 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>>  	pgdv = pgd_val(*pgdp);
>>  
>>  	if (!pgd_present(*pgdp) || pgd_leaf(*pgdp)) {
>> -		pr_alert("pgd:%08llx\n", pgdv);
>> +		pr_alert("pgd:%" __PRIpte "\n", __PRIpte_args(pgdv));
>>  		return;
>>  	}
>>  
>> @@ -557,7 +563,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>>  	p4dv = p4d_val(p4d);
>>  
>>  	if (!p4d_present(p4d) || p4d_leaf(p4d)) {
>> -		pr_alert("pgd:%08llx p4d:%08llx\n", pgdv, p4dv);
>> +		pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "\n",
> 
> Hi Anshuman,
> 
> The original format had a space between values ("pgd:%08llx p4d:%08llx").
> The replacement loses the space separator producing output like
> "pgd:123p4d:456" instead of "pgd:123 p4d:456". The same issue exists
> in other places in this commit.

There needs to be a forward single space before p4d starts.

pr_alert("pgd:%" __PRIpte " p4d:%" __PRIpte "\n"

			  ^^^
Will fix all the instances.

> 
>> +			 __PRIpte_args(pgdv), __PRIpte_args(p4dv));
>>  		return;
>>  	}
>>  
>> @@ -566,7 +573,8 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>>  	pudv = pud_val(pud);
>>  
>>  	if (!pud_present(pud) || pud_leaf(pud)) {
>> -		pr_alert("pgd:%08llx p4d:%08llx pud:%08llx\n", pgdv, p4dv, pudv);
>> +		pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "pud:%" __PRIpte "\n",
>> +			 __PRIpte_args(pgdv), __PRIpte_args(p4dv), __PRIpte_args(pudv));
>>  		return;
>>  	}
>>  
>> @@ -580,8 +588,9 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>>  	 * doing another map would be bad. print_bad_page_map() should
>>  	 * already take care of printing the PTE.
>>  	 */
>> -	pr_alert("pgd:%08llx p4d:%08llx pud:%08llx pmd:%08llx\n", pgdv,
>> -		 p4dv, pudv, pmdv);
>> +	pr_alert("pgd:%" __PRIpte "p4d:%" __PRIpte "pud:%" __PRIpte "pmd:%" __PRIpte "\n",
>> +		 __PRIpte_args(pgdv), __PRIpte_args(p4dv),
>> +		 __PRIpte_args(pudv), __PRIpte_args(pmdv));
>>  }
>>  
>>  /*
>> @@ -597,7 +606,7 @@ static void __print_bad_page_map_pgtable(struct mm_struct *mm, unsigned long add
>>   * page table lock.
>>   */
>>  static void print_bad_page_map(struct vm_area_struct *vma,
>> -		unsigned long addr, unsigned long long entry, struct page *page,
>> +		unsigned long addr, pxdval_t entry, struct page *page,
>>  		enum pgtable_level level)
>>  {
>>  	struct address_space *mapping;
>> @@ -609,8 +618,8 @@ static void print_bad_page_map(struct vm_area_struct *vma,
>>  	mapping = vma->vm_file ? vma->vm_file->f_mapping : NULL;
>>  	index = linear_page_index(vma, addr);
>>  
>> -	pr_alert("BUG: Bad page map in process %s  %s:%08llx", current->comm,
>> -		 pgtable_level_to_str(level), entry);
>> +	pr_alert("BUG: Bad page map in process %s  %s:%" __PRIpte, current->comm,
>> +		 pgtable_level_to_str(level), __PRIpte_args(entry));
>>  	__print_bad_page_map_pgtable(vma->vm_mm, addr);
>>  	if (page)
>>  		dump_page(page, "bad page map");
>> @@ -695,7 +704,7 @@ static void print_bad_page_map(struct vm_area_struct *vma,
>>   */
>>  static inline struct page *__vm_normal_page(struct vm_area_struct *vma,
>>  		unsigned long addr, unsigned long pfn, bool special,
>> -		unsigned long long entry, enum pgtable_level level)
>> +		pxdval_t entry, enum pgtable_level level)
>>  {
>>  	if (IS_ENABLED(CONFIG_ARCH_HAS_PTE_SPECIAL)) {
>>  		if (unlikely(special)) {
>> -- 
>> 2.43.0
>>
>>


