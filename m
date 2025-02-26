Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 171BAC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:26:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Rj7LAk1+jqXQpwUIouuCRIB1wfAX0ry+9wJPbCAUvz0=; b=bpmknxNWgJxtqeJjZmeeX6guw2
	asNzlF+nah9gupABEV2MrswdCChIYBu09e2WJjTHW6oq15leoLRhSUKlcUjljRXxsDokbIbO293vB
	HWxbxJz95GQst1dpAkLCTDOW1Po6icX1FlSZksKhPBHEWUoSPPk8ogbho3nehWuUYqhcYnnhc8+C6
	AYhpx0ceI+OdYcR6vG0OG4CxNxEUfEIi74thSdCUjErEHdke8H35rEo/VvuqnKiSRwUdyPeI1dJHh
	ld1GaaitOVlF4hVNuYaFWXrSQK3Mya1o5H+rqW38wx2C2ujYMkTYpfVvRd6rZGyxZ1O20cZXvtoa8
	a7uOMpQg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHQE-00000003rBf-2Fbs;
	Wed, 26 Feb 2025 13:25:58 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnFr0-00000003WXa-3CZJ
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 11:45:31 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4BA681516;
	Wed, 26 Feb 2025 03:45:43 -0800 (PST)
Received: from [10.163.40.69] (unknown [10.163.40.69])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 744B83F673;
	Wed, 26 Feb 2025 03:45:25 -0800 (PST)
Message-ID: <fc357e47-a727-4ba3-9019-877ce8bc443f@arm.com>
Date: Wed, 26 Feb 2025 17:15:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Explicit cast conversions to correct data type
To: Mark Rutland <mark.rutland@arm.com>, Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250219035646.536707-1-anshuman.khandual@arm.com>
 <Z724Q1ofM1GvKquV@J2N7QTR9R3> <9e1721a1-54a4-4007-a0f5-d651f5f21ae2@arm.com>
 <Z73LEkHklpjvIlmZ@J2N7QTR9R3.cambridge.arm.com>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <Z73LEkHklpjvIlmZ@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_034530_893467_8D8B53CF 
X-CRM114-Status: GOOD (  16.96  )
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



On 2/25/25 19:22, Mark Rutland wrote:
> On Tue, Feb 25, 2025 at 01:00:40PM +0000, Ryan Roberts wrote:
>> On 25/02/2025 12:32, Mark Rutland wrote:
>>> On Wed, Feb 19, 2025 at 09:26:46AM +0530, Anshuman Khandual wrote:
>>>> From: Ryan Roberts <ryan.roberts@arm.com>
>>>>
>>>> When CONFIG_ARM64_PA_BITS_52 is enabled, page table helpers __pte_to_phys()
>>>> and __phys_to_pte_val() are functions which return phys_addr_t and pteval_t
>>>> respectively as expected. But otherwise without this config being enabled,
>>>> they are defined as macros and their return types are implicit.
>>>>
>>>> Until now this has worked out correctly as both pte_t and phys_addr_t data
>>>> types have been 64 bits. But with the introduction of 128 bit page tables,
>>>> pte_t becomes 128 bits. Hence this ends up with incorrect widths after the
>>>> conversions, which leads to compiler warnings.
>>>
>>> Does 128-bit page table not imply 52-bit PAs?
>>
>> Not to my knowledge. For now the prototype code base is explicitly sticking to
>> 48-bit PA and 44-bit VA (for initial simplicitly because that's the limit for 4
>> levels).
> 
> Fair enough; info dump below, but hopefully nothing of consequence.
> 
> I assume that you're relying on the VMSAv9-128 PA bits [48:12] being in the
> same place as in the VMSAv8-64 descriptors, and being handled by the same
> PTE_ADDR_LOW mask that we use for CONFIG_ARM64_PA_BITS_52=n.
> 
>>From a quick scan of ARM DDI 0487 L.a, the VMSAv9-128 translation table
> descriptor format always contains a 56-bit PA (though PARange could be
> smaller than that). Bits [51:49] are packed differently than in
> VMSAv8-64 descriptors, and bits [55:52] are obviously new.
> 
>>>> Fix the warnings by explicitly casting to the correct type after doing the
>>>> conversion.
>>>
>>> I think it would be simpler and clearer if we replaced the macros with
>>> functions, such that __pte_to_phys() and __phys_to_pte_val() are
>>> *always* functions.
>>
>> Yeah, agreed. This was initially just a hack I did to get things working.
> 
> Cool; sounds like we're aligned.

Planning for the following respin instead.

diff --git a/arch/arm64/include/asm/pgtable.h b/arch/arm64/include/asm/pgtable.h
index 0b2a2ad1b9e8..4ebfa60ea5c6 100644
--- a/arch/arm64/include/asm/pgtable.h
+++ b/arch/arm64/include/asm/pgtable.h
@@ -68,10 +68,6 @@ extern unsigned long empty_zero_page[PAGE_SIZE / sizeof(unsigned long)];
 #define pte_ERROR(e)	\
 	pr_err("%s:%d: bad pte %016llx.\n", __FILE__, __LINE__, pte_val(e))
 
-/*
- * Macros to convert between a physical address and its placement in a
- * page table entry, taking care of 52-bit addresses.
- */
 #ifdef CONFIG_ARM64_PA_BITS_52
 static inline phys_addr_t __pte_to_phys(pte_t pte)
 {
@@ -84,8 +80,15 @@ static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
 	return (phys | (phys >> PTE_ADDR_HIGH_SHIFT)) & PHYS_TO_PTE_ADDR_MASK;
 }
 #else
-#define __pte_to_phys(pte)	(pte_val(pte) & PTE_ADDR_LOW)
-#define __phys_to_pte_val(phys)	(phys)
+static inline phys_addr_t __pte_to_phys(pte_t pte)
+{
+	return pte_val(pte) & PTE_ADDR_LOW;
+}
+
+static inline pteval_t __phys_to_pte_val(phys_addr_t phys)
+{
+	return phys;
+}
 #endif
 
 #define pte_pfn(pte)		(__pte_to_phys(pte) >> PAGE_SHIFT)
-- 
2.30.2



