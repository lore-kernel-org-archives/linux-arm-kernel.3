Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD3F1C982ED
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 21 Sep 2026 12:42:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5pK4pXIJRmKPUjKpkdsb4t/uRH+AebunEcLl0SfF61Y=; b=ChGVQg8NaXiyenp/uzzxPYHP+E
	cD7EjLfZtL5OLy/WR3a+E8g3ki4fWy6hpmaibbSl4fjff6fEsp8pxlj2RKP8hGn1/3IjrD9fHFEo1
	IQsUdo6tbp/n/D9RrWhCxgBXbVchASQzRf1IHWvPwewYcHTl7l5Qezcj7Q5/11a3H8E9f7ybR/GAx
	ifTDfBuIwtHtC6t65L0uKhw1tB2AQFInu9O7iwdfOlmn1b5rTB64qherFMzuJJe7cl3VQ59uyPCXI
	gd2joG9Myx3Nhgd8gthXgfyoiwbQZiicjyKXUaqhX92ZTuiqSOd42Uwg0evvLi4fnZIkhBCMmyXi1
	77YUTFrg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dLs-0000000275b-3uKJ;
	Mon, 21 Sep 2026 12:42:32 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x8dLg-0000000270r-2Fzt
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 21 Sep 2026 12:42:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=5pK4pXIJRmKPUjKpkdsb4t/uRH+AebunEcLl0SfF61Y=; b=a/CqL+6HBulo5eszrLC8zosuyA
	tAXXxpFk2e9jZYyx3DteZFaR7Ev5tRl15zScwdV0cMr2XR+X9+vf9J9IxRzCk42iZhkWuaZaAVkuf
	S/W1j4anwWHoaHB+tNkO0h2ARpbSBQZhgQTlbU5qNBzhLFPVoh6zvwJ3Wm1PsZHfTQSkYq8UFMs0s
	wg8/X1vXSVECzlPuD9cmMfVpxcq8qzfG6ukeyFZ/KRSto4qv5qYbsqXcbyuhJLq+Z5e81oqvJ+zWa
	5TITI63WXQzmDJzW1Pu5pzFdjmI2riK9C+/umCZ+SwQPUEUEYhQ+GX/1mX9mVlALhab4hHclSYzKO
	6UBzkRwA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x8dLO-0000000CI1Z-3kGJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 21 Sep 2026 12:42:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id C956F1595;
	Mon, 21 Sep 2026 05:41:56 -0700 (PDT)
Received: from localhost (a085714.arm.com [10.164.19.28])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 94EAC3F86C;
	Mon, 21 Sep 2026 05:41:59 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789994520; bh=bI7w8gHGdhxh4VEARjnqWWbdnU1VuH+Od9f4EvEeVjw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ttcXOmh61SrOvoEOAPQ4GmU+Vn2kvt7wLlypDdYben4eNFpMKlX1kcQgIxYV6GTy/
	 se1zPGzMTveLaG5RWM9n6A9/lXq6GcG3cwCrNI9upyNip918OfA4DpZpyTTodfXvvu
	 tgI49nhw7/M9X/o3ScuCj0iBtTNzLWXay6LNgYNA=
Date: Mon, 21 Sep 2026 18:11:56 +0530
From: Anshuman Khandual <anshuman.khandual@arm.com>
To: Ryan Roberts <ryan.roberts@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Mark Rutland <mark.rutland@arm.com>, Lorenzo Stoakes <ljs@kernel.org>, 
	Andrew Morton <akpm@linux-foundation.org>, David Hildenbrand <david@kernel.org>, 
	Mike Rapoport <rppt@kernel.org>, Linu Cherian <linu.cherian@arm.com>, 
	linux-kernel@vger.kernel.org, linux-mm@kvack.org
Subject: Re: [PATCH 0/4] arm64/mm: Convert pgtable READ_ONCE() as pxdp_get()
Message-ID: <etkbm3mjzsrogpizjwutsqajslkjymjldpyf6robitdot4e23w@mqcikehwbqzv>
References: <20260903060657.2717457-1-anshuman.khandual@arm.com>
 <9aed35be-a411-4d9d-805c-03c836e9e56a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <9aed35be-a411-4d9d-805c-03c836e9e56a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260921_134212_268329_B3CC0A79 
X-CRM114-Status: GOOD (  31.16  )
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

On Mon, Sep 21, 2026 at 11:55:02AM +0100, Ryan Roberts wrote:
> On 03/09/2026 07:06, Anshuman Khandual wrote:
> > Route READ_ONCE() accesses on pgtable entries via level specific generic MM
> > pxdp_get() helpers which platforms could then override when required. These
> > accessors on arm64, will help in ensuring page table accesses are performed
> > in an atomic manner while reading 128 bit page table entries later. But for
> > now they just default to READ_ONCE(), thus preserving existing behaviour on
> > current D64 translation.
> > 
> > This is similar to generic MM, where all atomic accesses have already been
> > converted from READ_ONCE() into pgtable level specific accessors.
> > 
> > These are preparatory patches for D128 enablement, although standing their
> > own for D64 translation as well. These patches are split from earlier D128
> > V1 series. There are no functional changes here, and besides mm kselftests
> > do not show any regression.
> > 
> > https://lore.kernel.org/linux-mm/20260729122452.3797443-1-anshuman.khandual@arm.com/
> > 
> > This series applies on v3.7-rc1 but after applying the following patches
> 
> I assume you meant v7.3-rc1 here?

Oops ! that's correct.

> 
> > related to pgtable entry print standardization posted earlier.
> > 
> > https://lore.kernel.org/linux-mm/20260831054331.625505-1-anshuman.khandual@arm.com/
> 
> This applies.
> 
> > 
> > https://lore.kernel.org/linux-mm/20260901065454.1906343-1-anshuman.khandual@arm.com/
> 
> This fails:
> ---8<---
> $ b4 shazam 20260901065454.1906343-1-anshuman.khandual@arm.com
> Grabbing thread from
> lore.kernel.org/all/20260901065454.1906343-1-anshuman.khandual@arm.com/t.mbox.gz
> Checking for newer revisions
> Grabbing search results from lore.kernel.org
>   Added from v3: 3 patches
>   Added from v2: 3 patches
> Analyzing 14 messages in the thread
> Looking for additional code-review trailers on lore.kernel.org
> Will use the latest revision: v3
> You can pick other revisions using the -vN flag
> Checking attestation on all messages, may take a moment...
> ---
>   ✓ [PATCH v3 1/2] arm64/mm: Move __check_safe_pte_update()
>   ✓ [PATCH v3 2/2] arm64/mm: Standardize printing for pgtable entries
>   ---
>   ✓ Signed: DKIM/arm.com
> ---
> Total patches: 2
> ---
> Applying: arm64/mm: Move __check_safe_pte_update()
> Applying: arm64/mm: Standardize printing for pgtable entries
> Patch failed at 0002 arm64/mm: Standardize printing for pgtable entries
> When you have resolved this problem, run "git am --continue".
> If you prefer to skip this patch, run "git am --skip" instead.
> To restore the original branch and stop patching, run "git am --abort".
> error: patch failed: arch/arm64/mm/fault.c:160
> error: arch/arm64/mm/fault.c: patch does not apply
> hint: Use 'git am --show-current-patch=diff' to see the failed patch
> ---8<---
> 
> And as a result I can't apply this series. Any tips?

May be this is based on older dependant patches.

The latest V3 does apply - although this series does not any more. 

https://lore.kernel.org/linux-mm/20260916044933.2689426-1-anshuman.khandual@arm.com/

I will respin the series updating the commit message as suggested on
the other thread but probably with a hosted git branch for better
access - should have just done that earlier given multiple moving
pieces here.

> 
> Thanks,
> Ryan
> 
> 
> > 
> > Cc: Catalin Marinas <catalin.marinas@arm.com>
> > Cc: Will Deacon <will@kernel.org>
> > Cc: Ryan Roberts <ryan.roberts@arm.com>
> > Cc: Mark Rutland <mark.rutland@arm.com>
> > Cc: Lorenzo Stoakes <ljs@kernel.org>
> > Cc: Andrew Morton <akpm@linux-foundation.org>
> > Cc: David Hildenbrand <david@kernel.org>
> > Cc: Mike Rapoport <rppt@kernel.org>
> > Cc: Linu Cherian <linu.cherian@arm.com>
> > Cc: linux-arm-kernel@lists.infradead.org
> > Cc: linux-kernel@vger.kernel.org
> > Cc: linux-mm@kvack.org
> > 
> > Anshuman Khandual (4):
> >   arm64/mm: Convert READ_ONCE() as pmdp_get() while accessing PMD
> >   arm64/mm: Convert READ_ONCE() as pudp_get() while accessing PUD
> >   arm64/mm: Convert READ_ONCE() as p4dp_get() while accessing P4D
> >   arm64/mm: Convert READ_ONCE() as pgdp_get() while accessing PGD
> > 
> >  arch/arm64/include/asm/pgtable.h |  6 ++--
> >  arch/arm64/mm/fault.c            |  8 ++---
> >  arch/arm64/mm/fixmap.c           |  6 ++--
> >  arch/arm64/mm/hugetlbpage.c      | 10 +++---
> >  arch/arm64/mm/kasan_init.c       | 18 +++++-----
> >  arch/arm64/mm/mmu.c              | 60 ++++++++++++++++----------------
> >  arch/arm64/mm/pageattr.c         |  8 ++---
> >  arch/arm64/mm/trans_pgd.c        | 14 ++++----
> >  8 files changed, 66 insertions(+), 64 deletions(-)
> > 
> 

