Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50664C44501
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 15 Jul 2026 12:56:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=npllxTSDPhN8u8JHODRx/oYWxEuT+9yo3tZqm14tFCE=; b=Gi7AHs3bi0ECvwt2woiu2+m7a3
	xgChdPvqnWAcl0m8LQIX/VGB7GAtIYWdMez3ptilFm0WQL/Kcsoh7Cc7zspwDuAM6d7ICxZN7AqMD
	eTrDkh4R1DWqPBugq1FQYAur/vv8Lop7qEogOnckw5ytcV+LFAQqH7nbfhCaBxIjZW/Jna57Y9I69
	ODc9HKlV3fkAr3c3/eRd3l+6Ak36pe2Ky0RhtL4+oSGjeqyQiiExqZk+iTgFAtXsGJvbjY0lnmVsN
	Wom66D6Te+KI12WbEAhXvV19dRiluUztGsozVvSMMwvP/XEKbDuLzyD0OdQxLJ8bbuZrFbCEueagG
	yVmFm65w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz9w-0000000Es8c-0Dcp;
	Wed, 15 Jul 2026 12:56:20 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjz9u-0000000Es8M-3KtU
	for linux-arm-kernel@lists.infradead.org;
	Wed, 15 Jul 2026 12:56:18 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3BBF1411B5;
	Wed, 15 Jul 2026 12:56:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CCA3B1F000E9;
	Wed, 15 Jul 2026 12:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784120178;
	bh=npllxTSDPhN8u8JHODRx/oYWxEuT+9yo3tZqm14tFCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C5KlnDS2/U1kbvvz4Utj0h4xO8hPMPu2UdwHwgYYCXL/BEU2ozgqf1ntoRNAkWEbp
	 WcRqeFSsp0VbQTmfuZ0V4oySjQwhklect1nqWD62gUuMRmXJxfXE4tby6KERObAP39
	 dCO2o2febFQZ+MvtMH92ZgdRhe6YPMsjUKBmkTo9xrsw4IUDLH4KHbwearxBaAhd26
	 6/uxcOF3x4b7kHyeJk5NuKB+ZWa38Eq8UBKQrlfrVDAb6//IaoY3S9h4lS/fUqWFbH
	 voKAVPXHpf5CpqQd6WF9+obIbSoryN0CsqfNUKHnxPQmH3WNHmsjR3/FdUPO5hM+j3
	 CfCDtL/35qToA==
Date: Wed, 15 Jul 2026 13:56:13 +0100
From: Will Deacon <will@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	David Hildenbrand <david@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64/mm: Rename PGD_SIZE as PGD_TABLE_SIZE
Message-ID: <aleDbfbBpFmXVZJH@willie-the-truck>
References: <20260714043050.2984188-1-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260714043050.2984188-1-anshuman.khandual@arm.com>
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

On Tue, Jul 14, 2026 at 10:00:50AM +0530, Anshuman Khandual wrote:
> PXD_SIZE represents the virtual address range size covered by a single page
> table entry on a given page table level. On arm64 PGD entry address span is
> represented with PGDIR_XXX macros instead while PGD_SIZE has been referring
> to size of the PGD table itself. So PGD_SIZE has been some what confusing.
> 
> Rename PGD_SIZE as PGD_TABLE_SIZE making it explicit that it represents PGD
> table size rather than virtual address range covered by a single PGD entry.
> While here, also move PGD_TABLE_SIZE inside pgtable-hwdef.h header.
> 
> No functional change.
> 
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: David Hildenbrand (Arm) <david@kernel.org>
> Cc: linux-arm-kernel@lists.infradead.org
> Cc: linux-kernel@vger.kernel.org
> Signed-off-by: Anshuman Khandual <anshuman.khandual@arm.com>
> ---
>  arch/arm64/include/asm/pgalloc.h       | 2 --
>  arch/arm64/include/asm/pgtable-hwdef.h | 1 +
>  arch/arm64/mm/mmu.c                    | 2 +-
>  arch/arm64/mm/pgd.c                    | 6 +++---
>  4 files changed, 5 insertions(+), 6 deletions(-)

I'm not disagreeing that we have an inconsistency here, but does this
patch series help in any meaningful way? Firstly, folks are probably
pretty used to the current (inconsistent) terminology by now and,
secondly, I think the main problem is that we have both PGDIR* and PGD*
based constants, so adding a PGD_TABLE_SIZE just makes things more
confusing. Worse, this exists even in core code:

  include/linux/pgtable.h:
	#define pgd_index(a)  (((a) >> PGDIR_SHIFT) & (PTRS_PER_PGD - 1))

so I would argue that, if you wanted to repaint all of this, that would
be the place to start, not by making the arm64 even weirder.

Personally, though, I'd leave it all alone because I not a big fan of
this sort of churn in isolation.

Will

