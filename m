Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9ADA91073C95
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Apr 2026 10:53:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vUNrqRez1mI7xtLuIZsNGGc0rl8SPMNPJLOT62oVBX4=; b=iKBe2ZPZLwIczOI6v8xP2fodcx
	BWW58uQuJmmgC4toyjtVAEK+NRmT4TAmltu9LyGf9BtqX7TwYduF+TDtYiEY+eVnKmlF1icMKsbsC
	dd1o+DXyhOQlsEGOeYaIud4sKxjcbL2OJNJK7bOjIbcAPy/0u4Kle/nwteNSn4WFVSFh5ZvlQA0ZX
	4RvYC54Rja6LhePNtFeZh7W6ccHtgEWUojNk+k2rgASyeeJk8A28vb2roFobOVl7sWOlye8/0L+gf
	6OzJhrc4ZatvsrTI5Aui4ZCvH7KcX/KJXbAE+vbzcxOlKa4sOiyym6br/vmRktvEz9GrSeJY+KPTL
	7yQRt5Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQXS-00000008iAU-0anR;
	Wed, 08 Apr 2026 10:53:38 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAQXP-00000008i9p-2s26
	for linux-arm-kernel@lists.infradead.org;
	Wed, 08 Apr 2026 10:53:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 5ADEF3161;
	Wed,  8 Apr 2026 03:53:26 -0700 (PDT)
Received: from [10.163.180.198] (unknown [10.163.180.198])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 3DA693F632;
	Wed,  8 Apr 2026 03:53:27 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775645612; bh=MPK0uYb/EHnrGdeWKTK12aNHXPiot59i8+gKdz4eK5E=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=YAzqbbD6rwBcRRfg260pPT5lpSpovV2NVf9BEx8C84Wg8nzCbk6ChXUm88R+CX/4R
	 0F/1adsXW46SjtD+FRaBG1UjN9+Q2dQhSbIZIv3hkTe4ZeGxMWkrZPZUkRiof5QbsB
	 Vu9+UyLcd/BvjSq//RRJ/N7UmKXhIpkVAWXTwL5s=
Message-ID: <8d2c9ecb-ae33-42f2-a8ed-66b3286b9286@arm.com>
Date: Wed, 8 Apr 2026 16:23:25 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [RFC V1 00/16] arm64/mm: Enable 128 bit page table entries
To: "David Hildenbrand (Arm)" <david@kernel.org>,
 linux-arm-kernel@lists.infradead.org
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Ryan Roberts <ryan.roberts@arm.com>, Mark Rutland <mark.rutland@arm.com>,
 Lorenzo Stoakes <lorenzo.stoakes@oracle.com>,
 Andrew Morton <akpm@linux-foundation.org>, Mike Rapoport <rppt@kernel.org>,
 Linu Cherian <linu.cherian@arm.com>, linux-kernel@vger.kernel.org,
 linux-mm@kvack.org
References: <20260224051153.3150613-1-anshuman.khandual@arm.com>
 <a77b39a4-c6dd-4a8a-8ea4-2bdc31bd3601@kernel.org>
Content-Language: en-US
In-Reply-To: <a77b39a4-c6dd-4a8a-8ea4-2bdc31bd3601@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_035335_851108_CDE76A06 
X-CRM114-Status: GOOD (  20.94  )
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

On 07/04/26 8:14 PM, David Hildenbrand (Arm) wrote:
> On 2/24/26 06:11, Anshuman Khandual wrote:
>> FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
>> translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
>> So with this feature arm64 platforms could have two different translation
>> systems, VMSAv8-64 and VMSAv9-128 could selectively be enabled.
>>
>> FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
>> and virtual address range while also expanding available room for more MMU
>> management feature bits both for HW and SW. 
>>
>> This series has been split into two parts. Generic MM changes followed by
>> arm64 platform changes, finally enabling D128 with a new config ARM64_D128.
>>
>> READ_ONCE() on page table entries get routed via level specific pxdp_get()
>> helpers which platforms could then override when required. These accessors
>> on arm64 platform help in ensuring page table accesses are performed in an
>> atomic manner while reading 128 bit page table entries.
>>
>> All ARM64_VA_BITS and ARM64_PA_BITS combinations for all page sizes are now
>> supported both on D64 and D128 translation regimes. Although new 56 bits VA
>> space is not yet supported. Similarly FEAT_D128 skip level is not supported
>> currently.
>>
>> Basic page table geometry has been changed with D128 as there are now fewer
>> entries per level. Please refer to the following table for leaf entry sizes
>>
>>                     D64              D128
>> ------------------------------------------------
>> | PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
>> -----------------------------|-----------------|
>> |     4K    |    2M  |  1G   |    1M  |  256M  |
>> |    16K    |   32M  | 64G   |   16M  |   16G  |
>> |    64K    |  512M  |  4T   |  256M  |    1T  |
>> ------------------------------------------------
>>
> 
> Interesting. That means user space will have it even harder to optimize
> for THP sizes.
> 
> What's the effect on cont-pte? Do they still span the same number of
> entries and there is effectively no change?

The numbers are the same for 4K base page size but will need
some changes for 16K and 64K base page sizes. Something that
git missed in this series, will fix it.

> 
>> From arm64 kernel features perspective KVM, KASAN and UNMAP_KERNEL_AT_EL0
>> are currently not supported as well.
>>
>> Open Questions:
>>
>> - Do we need to support UNMAP_KERNEL_AT_EL0 with D128
>> - Do we need to emulate traditional D64 sizes at PUD, PMD level with D128
> 
> It would certainly make user space interaction easier. But then, user
> space already has to consider various PMD sizes (and is better of
> querying /sys/kernel/mm/transparent_hugepage/hpage_pmd_size instead of
> hardcoding it). s390x, for example, also has 1M PMD size.
> > I guess with "emulating" you mean something simple like always
> allocating order-1 page tables that effectively have the same number of
> page table entries?

Yeah - thought something similar.

> 
> The would be an option, but I recall that the pte_map_* infrastructure
> currently expects that leaf page tables only ever span a single page.
> > So it wouldn't really give us a lot of easy benefit I guess.

Right. So probably need to figure all other benefits this might
add besides just the user space facing interactions as you have
mentioned earlier.

