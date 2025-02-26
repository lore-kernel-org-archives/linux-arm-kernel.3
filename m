Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 68860C021B8
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Feb 2025 13:27:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1aH8B/bXvWE7EMW1eaCVpXDy4HFAZsdxgXtn8FEsRWU=; b=aLjzvdzP/PPQ2sebwcfDOPsxU0
	6GZo2fmv/gTxmwq3BcPzVU7EhSkmH7y1r0OunYI17qesY0RFHQ5T9TdVoy9L0wGaUSlO7YkCyU84F
	usLSWbBMk42QdHKxZ5+Ea/YFousW6CyCP6K+3lZaeICN5glPOzOQeByFpfjjwTTK7dpnJTFKj7mda
	jLbBZf6dpF4nnCJljgY1oOhRxNVHwiaIs7fXTYYPK1bqbwSqbtB4V2biNEG+ZYuHDRA0z6HnNrV5B
	zrmGgyZuPnnx6UpOuNg2kJ2l2KCf7Mymd+2yAoVls/bTBtkE+hdXsNIFaVeDU3oj1hPobD4KrLzzV
	pkhzRq6g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnHRJ-00000003saF-1V4F;
	Wed, 26 Feb 2025 13:27:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tnGO5-00000003eQy-07lc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Feb 2025 12:19:42 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8399113D5;
	Wed, 26 Feb 2025 04:19:56 -0800 (PST)
Received: from [10.57.84.229] (unknown [10.57.84.229])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 85E6C3F5A1;
	Wed, 26 Feb 2025 04:19:39 -0800 (PST)
Message-ID: <795a1d11-b47f-4ea1-aeab-484a434ea905@arm.com>
Date: Wed, 26 Feb 2025 12:19:37 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] arm64/mm: Explicit cast conversions to correct data type
Content-Language: en-GB
To: Mark Rutland <mark.rutland@arm.com>
Cc: Anshuman Khandual <anshuman.khandual@arm.com>,
 linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20250219035646.536707-1-anshuman.khandual@arm.com>
 <Z724Q1ofM1GvKquV@J2N7QTR9R3> <9e1721a1-54a4-4007-a0f5-d651f5f21ae2@arm.com>
 <Z73LEkHklpjvIlmZ@J2N7QTR9R3.cambridge.arm.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <Z73LEkHklpjvIlmZ@J2N7QTR9R3.cambridge.arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250226_041941_115631_70D939D1 
X-CRM114-Status: GOOD (  16.29  )
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

On 25/02/2025 13:52, Mark Rutland wrote:
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

Yes that's what the prototype is doing for now.

> 
> From a quick scan of ARM DDI 0487 L.a, the VMSAv9-128 translation table
> descriptor format always contains a 56-bit PA (though PARange could be
> smaller than that). Bits [51:49] are packed differently than in
> VMSAv8-64 descriptors, and bits [55:52] are obviously new.

Indeed. But given we are running on a platform with 48 bit PA, the prototype
always treating [55:52] as 0 is not getting in the way of anything.

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
> 
> Mark.


