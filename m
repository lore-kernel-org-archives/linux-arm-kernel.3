Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC66310FC465
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 02:08:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UaytnJ6ZCFlO4gD8gW+Y2+bllQtwZ5ZchyRx+p3OVfA=; b=tc5udhDjAIRK7+RKLmSqkS4EWc
	FvWkLBhqfOOCUjV2P8/0z99YxxfIzYn5V0gOL89255WzhL8Ap/Olr+414m56bQ43SeH2k5EiSN/a2
	yqvxbw8ozYN5LtakQ39jnBiK7CWH67gPAZR2rGNiFKdhuSyoPBjF8LuFDjEBjFTrQ5H7Je5o2gjC5
	V+5YjsZ3cR0I1aL2glDLLHzeSQZ2QLZO/jvSmuLwJTF5ZnUN38xxXdkyljHaC2RVO7E+siWWXI+/u
	liaCbxgg7Db0zDkKGNG2llzpAz/kxhJp+oNDMH/tiaHJj6cTpoZecEE0z6pzosAOrm7VbLKl2YrtX
	oVCMpSyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAeou-00000009bW0-1Ll1;
	Thu, 09 Apr 2026 02:08:36 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAeor-00000009bVf-0gca
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 02:08:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8C34B35C7;
	Wed,  8 Apr 2026 19:08:24 -0700 (PDT)
Received: from [10.164.18.48] (unknown [10.164.18.48])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B712B3F7D8;
	Wed,  8 Apr 2026 19:08:26 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775700510; bh=nb/Ldn1rG04kuyp/Gu2fW/d/DdD/8muloilUcAfi43U=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=q4o7vSn0CL3AE34IYW0A28ObmyC0/AovqMKiX8ETjREHWSV3hA/69vGjO4TEGCuXl
	 uxgKPmx5HpNKOENAA6d1klBtQOq5eCKj7Z/LFS6EYS4RU/mRRFjEfNhxoUYDreWYJ7
	 NnDQYFf/oHSxnHRrbb6eQa5wWiF9uyl5KKVRtj3c=
Message-ID: <1d3df806-fdf5-4cd8-960a-9ebb707de575@arm.com>
Date: Thu, 9 Apr 2026 07:38:23 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
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
 <8d2c9ecb-ae33-42f2-a8ed-66b3286b9286@arm.com>
 <c664368c-fe2c-42d8-b488-e9e30b342491@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <c664368c-fe2c-42d8-b488-e9e30b342491@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260408_190833_363521_3FAABF23 
X-CRM114-Status: GOOD (  14.22  )
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



On 08/04/26 5:43 PM, David Hildenbrand (Arm) wrote:
> On 4/8/26 12:53, Anshuman Khandual wrote:
>> On 07/04/26 8:14 PM, David Hildenbrand (Arm) wrote:
>>> On 2/24/26 06:11, Anshuman Khandual wrote:
>>>> FEAT_D128 is a new arm architecture feature adding support for VMSAv9-128
>>>> translation system. FEAT_D128 is an optional feature from ARMV9.3 onwards.
>>>> So with this feature arm64 platforms could have two different translation
>>>> systems, VMSAv8-64 and VMSAv9-128 could selectively be enabled.
>>>>
>>>> FEAT_D128 adds 128 bit page table entries, thus supporting larger physical
>>>> and virtual address range while also expanding available room for more MMU
>>>> management feature bits both for HW and SW. 
>>>>
>>>> This series has been split into two parts. Generic MM changes followed by
>>>> arm64 platform changes, finally enabling D128 with a new config ARM64_D128.
>>>>
>>>> READ_ONCE() on page table entries get routed via level specific pxdp_get()
>>>> helpers which platforms could then override when required. These accessors
>>>> on arm64 platform help in ensuring page table accesses are performed in an
>>>> atomic manner while reading 128 bit page table entries.
>>>>
>>>> All ARM64_VA_BITS and ARM64_PA_BITS combinations for all page sizes are now
>>>> supported both on D64 and D128 translation regimes. Although new 56 bits VA
>>>> space is not yet supported. Similarly FEAT_D128 skip level is not supported
>>>> currently.
>>>>
>>>> Basic page table geometry has been changed with D128 as there are now fewer
>>>> entries per level. Please refer to the following table for leaf entry sizes
>>>>
>>>>                     D64              D128
>>>> ------------------------------------------------
>>>> | PAGE_SIZE |   PMD  |  PUD  |   PMD  |   PUD  |
>>>> -----------------------------|-----------------|
>>>> |     4K    |    2M  |  1G   |    1M  |  256M  |
>>>> |    16K    |   32M  | 64G   |   16M  |   16G  |
>>>> |    64K    |  512M  |  4T   |  256M  |    1T  |
>>>> ------------------------------------------------
>>>>
>>>
>>> Interesting. That means user space will have it even harder to optimize
>>> for THP sizes.
>>>
>>> What's the effect on cont-pte? Do they still span the same number of
>>> entries and there is effectively no change?
>>
>> The numbers are the same for 4K base page size but will need
>> some changes for 16K and 64K base page sizes. Something that
>> git missed in this series, will fix it.
> 
> Oh, and it would be great to also clearly spell out the effect on
> hugetlb as well. I assume the available hugetlb sizes will change as well.

Sure will update the required information in the commit message as well as in
file arch/arm64/mm/hugetlb.c, where HugeTLB sizes support matrix is enlisted.

