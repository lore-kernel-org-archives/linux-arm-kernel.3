Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1EFD1C61DC2
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Aug 2026 09:08:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Subject:References:In-Reply-To:Message-Id:Cc:To:From:Date:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cll/WFN/7E9qDF6ICpZT672r/AfzHVpGqOePnO1PhfM=; b=Imw+7s7ZYWCnYBkEG1A99leoN2
	jfpn+aUJz9a3yWufwqKEaqLXqz9bh6657nRRBEfTvntZqyvcAZ5rPuzGiBQBk+tKezBIWOlVkmUwS
	YYTY1xFGjIhKCy6DCXOvxVKQt53QPkxjCSsKduNeicU5EeG6y10MChSeZm1PMD8o53fog2/MjMyEv
	YZzZ+QxgI6M6CHEwdElnL3RQBAYTE3Rk6WKXoBWxSuGIrU/YBl3rSB2dQodzPHzwXkjYJuIG+s8n3
	MVmksjmLg7kIejBuXPW/+dSfUiy9f/hmYtaL80wg8gZ4WI/lA/kS4W1QNjEqMikN3rD1wF4tU8MX5
	mCRGA9dA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9cF-000000029Ad-17Ft;
	Wed, 26 Aug 2026 09:08:15 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wz9cD-000000029AQ-3Rga
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Aug 2026 09:08:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id C24CD60A59;
	Wed, 26 Aug 2026 09:08:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B09271F00A3D;
	Wed, 26 Aug 2026 09:08:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1787735291;
	bh=cll/WFN/7E9qDF6ICpZT672r/AfzHVpGqOePnO1PhfM=;
	h=Date:From:To:Cc:In-Reply-To:References:Subject;
	b=jcJic4Whvt3FLSgHrSDQtmu0TwOZ59nzYR4BbM60q6qP8AAJVi4lWaIMQFmeU6Bec
	 z0ML1rvGR57u2TViN1QjWc3b81Texb4a9hFHDFzQeZpVWRGf9SaAiBf59jsTdJH6Ql
	 OnmeQv3oOXhpBajMYC28dJiLGCfGwfGp1+Y65JHuw8Ah6xqZam0M3bJhAlptK2wCPE
	 4pw6KIcwwXJnHYY8i3Jf8dRh+AccbCLhzSFk9K4wIaQMWyNZxB95wJmSJ3SLlWjRWa
	 2JKx4dAQPXMKKiM28ZwgYjrC6Beh6s5bb5ls+xAEAQlb+sXTcVj9gaOMVP3MheFZ8P
	 CnnmkDsdUqrsg==
Received: from ams-compute-02.internal (ams-compute-02.internal [10.64.2.62])
	by mailfauth.ams.internal (Postfix) with ESMTP id 399B81980047;
	Wed, 26 Aug 2026 05:08:09 -0400 (EDT)
Received: from ams-imap-11 ([10.64.2.31])
  by ams-compute-02.internal (MEProxy); Wed, 26 Aug 2026 05:08:09 -0400
X-ME-Sender: <xms:9qyOarCcLP-h67EAwI9zqpth7KaXoRTsZHgY3ssXQj9Yad1Bh9KZwA>
    <xme:9qyOasWqk6gnYIa1uTwiVlUBS5PFGr1fVJMHiBah5_kFmlF3hIAm_mm1FfnJLKF1z
    O_RWjCzcB5D04KiBPUeEnpwqehFvTjI-pXxXJgnW-ph37oarJwXfcY>
X-ME-Proxy-Cause: dmFkZTGelAVVBFLJenvV7GibnjezPCbsqdI//wanhv+UyW5azxM0FqugkyAmiVudUTwegW
    2c/fm2rxzGL8UQ0Z4dbTlTi3qIPp9roZ8br3lvGdEJK50Qpk/IniF7g5AbxlizvGSgex/a
    l6lDh1JyzNQcv2FKn8gdO6D01IGcmZyoyUMFUjWnYfIxCoTvbjpomczGe4np46HCXaIDOE
    uH+eenZNm+T135Lv87ujFAU7SsJloFXMsm/Il9E3fvhQ++zY/iQoYdNOMZ2429uhw4IBA4
    7HaaHM1HNqSZjmtEHfwvklnW2qBjq5LHkeurB+8noej5jHKGCJTlRI88ztbv8KJ/0J51ga
    AtfkDlhCV97uark32SnWh1YKZWD4KO2xv7jy6SzNvWcsQziTLvQ+BtolZz6p2RGfWUSGgV
    r4YR41IhYdWQ7KuDU9c0CxXo8X/y1PFff/leh5X6CfRXaPGXHQBJeq9lfIuafEBNU6DFNH
    N1/BHeb0wfGu1P9Dg3cuHG+/UZ3dgOVO0q1doydCxJfPJ3YmyW6vEJMTzZrzCrjVlVMdJ8
    OKzUtb/L5LIjJK+zzUODJAKoxG9SuG0/FkrpvjejObGl2wzFPxsLRHsyMQvEclqU3u4EC1
    zaxqpx+eV5n/JAxa1A28dluyIEeQrTVKtcBOgPWN5UCubBo4rThh6cahukCw
X-ME-Proxy: <xmx:-ayOar0tSTmyNHSfCd37WYo7wJou6DKkLDeYisT0nyjoJ9meJ4uBUg>
    <xmx:-ayOamyTJkGPCKwDTGap68eYDmqGyJuaHovBx4EW6lhW6wtglw9DTA>
    <xmx:-ayOavyvXW9M9R2Hh7HvfJIRsjDrbMLJ7c51XwRSL2-YXtceIt16qw>
    <xmx:-ayOaq9JFvkR5sCZDIMN_8OEAGhs-K62FQPAhpXXSAvIzMrMHA_Erg>
    <xmx:-ayOah_ne4u5HkATWO7Xq1s3ciMP-etEA_gBlD9BZNa6A3mNbweZ2kIK>
Feedback-ID: ice86485a:Fastmail
Received: by mailuser.ams.internal (Postfix, from userid 501)
	id DD497F8007A; Wed, 26 Aug 2026 05:08:06 -0400 (EDT)
X-Mailer: MessagingEngine.com Webmail Interface
MIME-Version: 1.0
Date: Wed, 26 Aug 2026 11:07:46 +0200
From: "Ard Biesheuvel" <ardb@kernel.org>
To: "Kevin Brodsky" <kevin.brodsky@arm.com>,
 "Ard Biesheuvel" <ardb+git@google.com>, linux-arm-kernel@lists.infradead.org
Cc: "Will Deacon" <will@kernel.org>,
 "Catalin Marinas" <catalin.marinas@arm.com>,
 "Mark Rutland" <mark.rutland@arm.com>, "Ryan Roberts" <ryan.roberts@arm.com>,
 "Anshuman Khandual" <anshuman.khandual@arm.com>,
 "Liz Prucka" <lizprucka@google.com>, "Seth Jenkins" <sethjenkins@google.com>,
 "Kees Cook" <kees@kernel.org>, "Jann Horn" <jannh@google.com>,
 linux-hardening@vger.kernel.org
Message-Id: <a277a83a-cc01-443d-be42-775ce0bc96dd@app.fastmail.com>
In-Reply-To: <5a3b89a6-bc42-42c3-82e8-25d6f1a2c5d2@arm.com>
References: <20260805104042.1107678-2-ardb+git@google.com>
 <5a3b89a6-bc42-42c3-82e8-25d6f1a2c5d2@arm.com>
Subject: Re: [RFC PATCH] arm64: mm: Map fixmap PTE tables r/o in the linear map
Content-Type: text/plain
Content-Transfer-Encoding: 7bit
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


On Fri, 21 Aug 2026, at 15:20, Kevin Brodsky wrote:
> On 05/08/2026 12:40, Ard Biesheuvel wrote:
>> From: Ard Biesheuvel <ardb@kernel.org>
>>
>> Without physical KASLR, the fixmap page tables will appear at an a
>> priori known offset in the physical address space, and due to the lack
>> of randomization, the linear map carries a writeable alias of the fixmap
>> PTE pages, which appears at an offset in the kernel VA space that is
>> also predictable.
>>
>> Given that the placement of the fixmap area is never randomized either,
>> a single store to this linear alias region is sufficient to map any
>> physical page with any permissions at a known offset in the kernel VA
>> space, including on top of the PTI trampoline.
>>
>> Avoid this, by remapping the fixmap PTE pages read-only in the linear
>> map.
>
> Sounds good, logical next step after unmapping the rest of data/BSS from
> the linear map :)
>

Indeed :-)

>> This is possible because all updates to bm_pte[] occur via the
>> mapping of the kernel image in the vmap area. A read-only mapping is
>> still needed for things like ptdump that walk the page tables.
>>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
>> Cc: Kevin Brodsky <kevin.brodsky@arm.com>
>> Cc: Liz Prucka <lizprucka@google.com>
>> Cc: Seth Jenkins <sethjenkins@google.com>
>> Cc: Kees Cook <kees@kernel.org>
>> Cc: Jann Horn <jannh@google.com>
>> Cc: linux-hardening@vger.kernel.org
>> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>
>> ---
>>  arch/arm64/include/asm/set_memory.h |  2 ++
>>  arch/arm64/mm/fixmap.c              |  7 +++++++
>>  arch/arm64/mm/pageattr.c            | 10 ++++++++++
>>  3 files changed, 19 insertions(+)
>>
>> diff --git a/arch/arm64/include/asm/set_memory.h b/arch/arm64/include/asm/set_memory.h
>> index 90f61b17275e..a685fb534c3e 100644
>> --- a/arch/arm64/include/asm/set_memory.h
>> +++ b/arch/arm64/include/asm/set_memory.h
>> @@ -11,6 +11,8 @@ bool can_set_direct_map(void);
>>  
>>  int set_memory_valid(unsigned long addr, int numpages, int enable);
>>  
>> +int set_direct_map_ro(unsigned long addr, int numpages);
>> +
>>  int set_direct_map_invalid_noflush(struct page *page);
>>  int set_direct_map_default_noflush(struct page *page);
>>  int set_direct_map_valid_noflush(struct page *page, unsigned nr, bool valid);
>> diff --git a/arch/arm64/mm/fixmap.c b/arch/arm64/mm/fixmap.c
>> index f66a0016dd02..fcb571dffe82 100644
>> --- a/arch/arm64/mm/fixmap.c
>> +++ b/arch/arm64/mm/fixmap.c
>> @@ -14,6 +14,7 @@
>>  #include <asm/fixmap.h>
>>  #include <asm/kernel-pgtable.h>
>>  #include <asm/pgalloc.h>
>> +#include <asm/set_memory.h>
>>  #include <asm/tlbflush.h>
>>  
>>  /* ensure that the fixmap region does not grow down into the PCI I/O region */
>> @@ -173,3 +174,9 @@ void *__init fixmap_remap_fdt(phys_addr_t dt_phys, int *size, pgprot_t prot)
>>  
>>  	return dt_virt;
>>  }
>> +
>> +static int __init fixmap_remap_ro(void)
>> +{
>> +	return set_direct_map_ro((unsigned long)lm_alias(&bm_pte), NR_BM_PTE_TABLES);
>
> Should we not also remap bm_pmd and bm_pud?
>
> For that matter, do we need RW access via the linear map for any page
> annotated with __bss_pgtbl? I suppose that might be the case for
> kasan_early_shadow_* but I don't know enough about KASAN to tell for sure.
>

bm_pte[] is special because it is only ever written via the kernel mapping,
and never via the linear map. This is why it is being singled out in this
patch.

Whether or not bm_pmd[] can be treated as a special case depends on the page
size: with 4k pages, the whole array covers a virtual region of 1G, which is
currently guaranteed to be shared only with the PCI I/O space (but we could
move that out). With 16k pages, it covers 64G, and so it is shared with the
vmemmap and other virtual mappings in the vmalloc region, and so the current
kernel mapping code expects to be able to write those entries.

What we might do is generalize the logic that uses the fixmap to modify
pgd level entries in swapper_pg_dir, and use it for all modifications
at PMD level or higher if those tables are in .rodata

But this is a bit more complicated than this change, so I decided to
present this as a separate change.

>> +}
>> +late_initcall(fixmap_remap_ro);
>
> Is mark_rodata_ro() definitely too early to remap these pages RO?
>

No, we might just call this from there, afaict.

