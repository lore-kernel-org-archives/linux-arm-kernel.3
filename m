Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 187AAC43458
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 04:39:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GqE1CEiGgpU+trmcSURnTaS6g4d3WDOqgr49E1lNftY=; b=gvMRGFiXJ5EEmafpNn5u+kSWy+
	q7uOa5rbCim1URryGRkgu61Y/e8jO6CYSwHRhdgMXqjGIE9Zdd36uG2V2pQWOq3ogh03POSDlB/J0
	kECXS5VcjMSdrYCR/xyW4TZTK4CC+eZS2uWmvW+AlFNepG/Y6qcPfqKTJuS0oWIFxXARRehUMweXr
	NErUhe36fVGJGO6ctdyFmOgiJe1Nmr/LawwJXgGFtnCQJDbUJa93W1axG+jkVyhYk6ooAeNvO8OhK
	FC7joLWrDDn6B9gpBBVq7ctSa/xT9D7e1ER8IdKFbmSO7toj5ZXMfHRwPqDg77KB7DNLL1GHPTxOx
	EWD0ufsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDsH-0000000GQ93-2FRr;
	Thu, 16 Jul 2026 04:39:05 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkDsE-0000000GQ8W-3wUq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 04:39:04 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id CB7E61477;
	Wed, 15 Jul 2026 21:38:55 -0700 (PDT)
Received: from [10.163.164.156] (unknown [10.163.164.156])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 304753F7D8;
	Wed, 15 Jul 2026 21:38:57 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1784176740; bh=uOFRvUWPyKzTO568yVm0wl9rFu1kQ1eDz2t8kl6laR4=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To:From;
	b=V4t1218YkDa4AYANzvOkHJyzNxhpBXmSTOgLr0ED+OKdtJT11bACGeU5tPUsehqkZ
	 1u8geeIq4KA0EtFS/hMtMTJb6D+dKGxf3wUo86nsfsr5Dt6+KAaz2z2oNT1beRiMFd
	 VDQrWIUOj61gQA4dEV2Q3QOkNNGhC/hX+rJD3C5k=
Message-ID: <257fddcd-54f5-41b9-9b0e-9e3db5df74fb@arm.com>
Date: Thu, 16 Jul 2026 10:08:55 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Anshuman Khandual <anshuman.khandual@arm.com>
Subject: Re: [PATCH] arm64/mm: Rename PGD_SIZE as PGD_TABLE_SIZE
To: Will Deacon <will@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
 Catalin Marinas <catalin.marinas@arm.com>,
 Ryan Roberts <ryan.roberts@arm.com>, David Hildenbrand <david@kernel.org>,
 linux-kernel@vger.kernel.org
References: <20260714043050.2984188-1-anshuman.khandual@arm.com>
 <aleDbfbBpFmXVZJH@willie-the-truck>
Content-Language: en-US
In-Reply-To: <aleDbfbBpFmXVZJH@willie-the-truck>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260715_213903_125314_6E4EAF5D 
X-CRM114-Status: GOOD (  19.49  )
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



On 15/07/26 6:26 PM, Will Deacon wrote:
> On Tue, Jul 14, 2026 at 10:00:50AM +0530, Anshuman Khandual wrote:
>> PXD_SIZE represents the virtual address range size covered by a single page
>> table entry on a given page table level. On arm64 PGD entry address span is
>> represented with PGDIR_XXX macros instead while PGD_SIZE has been referring
>> to size of the PGD table itself. So PGD_SIZE has been some what confusing.
>>
>> Rename PGD_SIZE as PGD_TABLE_SIZE making it explicit that it represents PGD
>> table size rather than virtual address range covered by a single PGD entry.
>> While here, also move PGD_TABLE_SIZE inside pgtable-hwdef.h header.
>>
>> No functional change.
>>
>> Cc: Catalin Marinas <catalin.marinas@arm.com>
>> Cc: Will Deacon <will@kernel.org>
>> Cc: Ryan Roberts <ryan.roberts@arm.com>
>> Cc: David Hildenbrand (Arm) <david@kernel.org>
>> Cc: linux-arm-kernel@lists.infradead.org
>> Cc: linux-kernel@vger.kernel.org
>> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
>> ---
>>  arch/arm64/include/asm/pgalloc.h       | 2 --
>>  arch/arm64/include/asm/pgtable-hwdef.h | 1 +
>>  arch/arm64/mm/mmu.c                    | 2 +-
>>  arch/arm64/mm/pgd.c                    | 6 +++---
>>  4 files changed, 5 insertions(+), 6 deletions(-)
> 
> I'm not disagreeing that we have an inconsistency here, but does this
> patch series help in any meaningful way? Firstly, folks are probably
> pretty used to the current (inconsistent) terminology by now and,
> secondly, I think the main problem is that we have both PGDIR* and PGD*
> based constants, so adding a PGD_TABLE_SIZE just makes things more
> confusing. Worse, this exists even in core code:
> 
>   include/linux/pgtable.h:
> 	#define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))
> 
> so I would argue that, if you wanted to repaint all of this, that would
> be the place to start, not by making the arm64 even weirder.
> 
> Personally, though, I'd leave it all alone because I not a big fan of
> this sort of churn in isolation.

Agreed that PGDIR_SHIFT/SIZE is the true source of this inconsistency
deviating from all other pgtable level's macros expressing an address
range. But this above PGD_SIZE based confusion is specific (but then
well contained) inside arm and arm64 platforms.

Changing PGDIR_[SHIFT|SIZE] on all platforms to PGD_[SHIFT|SIZE] and
then converting arm and arm64 platform's PGD_SIZE as PGDIR_SIZE might
be a better solution. But as suggested will just drop this for now.

