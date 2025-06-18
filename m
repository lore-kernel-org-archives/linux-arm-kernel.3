Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDF92C71157
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Jun 2025 18:14:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:Date:From:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=WpR+OcTrcx45Fz6S03n2ctoKcqhnRovsqGceCO+AYd8=; b=WSEtSCdXpCBoIhx0mzEc0Djr7k
	LBINtGGciayofOzHDwwY+pMipUjoE+gzoLkpKv936yhNIrSza+HAXUp9A6cAtWWBmDES2x9wp+3t6
	qW+y71nKHKqPfOLp1jr+HUszQvfl452yatIn7hDGAL3YH4wteJntAKArIuHfcGQRzwPgpfRkEm3Lr
	MtRHOhxbD71WkTmcL0wV6kfbSLzsi4cg02mxn3nfV6P9Cc5vxZR0YcJjKW+ecBnprNi7Es7y1H6GS
	zfe9YOTK0vc8GMgiiYbpeNfypiVPqpyclFJvneZCwYijdNAQOmywV+RdV1/eGSVZBFxuhZ3U2ctS5
	WLBPO1bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRxJC-0000000B2jg-0GJh;
	Wed, 18 Jun 2025 18:14:50 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwRg-0000000Apdv-1y9F
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Jun 2025 17:19:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:Date:From:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=WpR+OcTrcx45Fz6S03n2ctoKcqhnRovsqGceCO+AYd8=; b=i55qJUCs8kTUkHrdcYi536Y2K+
	/8VP3qRvDPvGJl9EpEem0u/1ql5ByeZHMxRRejiKVN4bIjKNw+fescWSlsrNLmgublLn0nowUUfqV
	tBuqsZN1jdKzSKcB6jDnRLRSTacr61rYPvlb25tKrXs8gjBhCQSw/E95xlcjDud2EhXKTHk+KP3PM
	wtUNRmpRW15nrw00Z1b8O3zUVvcE6/Z4Rmo0+jgntOWtcyTPmELIlR4DcSImWcjSsuZUG7mBxl0ex
	dar77s6nn3pPJ4OoGtH8hrrv36Z2CFHARLZY3f7CnUSQHlAhWKvWYGhMSk6k9HheOx5gTB8/OdBPt
	cMNEdUFA==;
Received: from mail-lj1-x236.google.com ([2a00:1450:4864:20::236])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uRwRe-00000004DlW-0zVM
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Jun 2025 17:19:31 +0000
Received: by mail-lj1-x236.google.com with SMTP id 38308e7fff4ca-32b553e33e6so35795991fa.2
        for <linux-arm-kernel@lists.infradead.org>; Wed, 18 Jun 2025 10:19:28 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1750267167; x=1750871967; darn=lists.infradead.org;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:from:to:cc:subject:date:message-id:reply-to;
        bh=WpR+OcTrcx45Fz6S03n2ctoKcqhnRovsqGceCO+AYd8=;
        b=gORmlDZZlSEbl9g+z/afBKggq2PWiKl1IOoctiD14CdVINmz+G0F2uWkVkUkoijxMY
         ZXkZtmEloGecDViWLnCQlmsW/gwOEHBo4JnR9wMwzSAZ3odqdDeog3Pt82clXeCX2HIs
         ON9o5qoay4vzhLzx4pdGvyJQ/ioU9e4DTkxDauP0RBi+6e62rMIsHl6p5e4Ekl328XZy
         zqwshNIZRkC42pKp/xAYEXkTlOG/veQCqNJhzVn4lsj89Eo4mLPXpD24XeMhXrGYwbFo
         sFtNQciulFtcCwdfRebqd4mpmfzOsjzA3vRtTk+JY6hMEAMn7hmTi0TPy0S89EknUov+
         w1CQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1750267167; x=1750871967;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:date:from:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=WpR+OcTrcx45Fz6S03n2ctoKcqhnRovsqGceCO+AYd8=;
        b=BgnqnFHh/wJWOeImmjVlFX+46hHdhvgika1A6uvRAsF4l8VXwqY19vtImKO7mJIbIG
         BtXwZMxj/zPnofROHiQY6hHazFdeHLRDHx5QfUdZO5Fqagxj4KECh6Bko0pzmiqnD7SP
         0/E31N4Xc+S3beMHlfRKyLO+Peb1YavTkSoFMoVjApvgM/ajdj9/fJRQ8961xrh2foH1
         TXbyaVf1cxpKI1qLwMJgnYZKaLQHWrAoGhzST6yIsxGYS0IzZlYjmoCwpXSyDVGDM1M9
         Zndvt64MeVBmGKR+4HkG6i8g7eDFNVCRWhTXtcTiZnuSF0QDzTdSz97EvJgycQFYbVYS
         cHAA==
X-Forwarded-Encrypted: i=1; AJvYcCUBUsTmSwq/umdtD65SD8xlilx528Azs7ObIlA95R8SXSUtEUl/FvvEAZnsvWdRS5hHnZb704/8asZZIG7QDB3V@lists.infradead.org
X-Gm-Message-State: AOJu0Yyz2XwrEqM26h4mOQ9jOgLVHoLmDU+4fSSiESDEgic+TMHRL+vh
	IjTDnY9Sdvvj7aL1X3aZfcpJcstCTpeXALin95CQHSml0KB/Hh3hYmI0
X-Gm-Gg: ASbGnct4aUPBTo9TuNoJc+9DDHPDAeEltyBHAKYlLPkiSDwtNnqqsKapYJ6zv7YnMV0
	pHQDW2DlvJXvtfCdtx2OBUIYBk9oRkKFTS3hZYgwHdPglPw28KG3PybtxoPTC0pR+Jylau6Hjg2
	44MtgLfdsgX+q7ZsOPFwWwkAL3GSL8OOK2V0AvYesWjcFCEnXTnf/q1KMP6/HdzseXHNaj1/9gX
	HUsHgzJBO8rE7+Yo7mIXgp5N2vBrHUwUkjIMt8NK4m0gbNVhkwqDFeGg7kGlD66dSfM9SJeZx8g
	fu5A6wjyMoXhXSJ29NOaQ/JuSnAU+Azqi20BfN6xOGgxwSFatMo74R7jDOT6tUNaxJSInockc71
	i7BshdWuIdqM=
X-Google-Smtp-Source: AGHT+IExY1E59LPFVKc5mfbs10Pk0s2C7jJwO65JR1+JB9tmKwmJ0N0+EA/E0W1886bcGtXU24Ygvg==
X-Received: by 2002:a05:651c:2203:b0:32b:47be:e1bd with SMTP id 38308e7fff4ca-32b4a2d7388mr57877351fa.6.1750267166759;
        Wed, 18 Jun 2025 10:19:26 -0700 (PDT)
Received: from pc636 (host-95-203-1-180.mobileonline.telia.com. [95.203.1.180])
        by smtp.gmail.com with ESMTPSA id 38308e7fff4ca-32b3307aebcsm23376581fa.40.2025.06.18.10.19.25
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Wed, 18 Jun 2025 10:19:25 -0700 (PDT)
From: Uladzislau Rezki <urezki@gmail.com>
X-Google-Original-From: Uladzislau Rezki <urezki@pc636>
Date: Wed, 18 Jun 2025 19:19:23 +0200
To: Dev Jain <dev.jain@arm.com>
Cc: Uladzislau Rezki <urezki@gmail.com>,
	Ryan Roberts <ryan.roberts@arm.com>, catalin.marinas@arm.com,
	will@kernel.org, anshuman.khandual@arm.com,
	quic_zhenhuah@quicinc.com, kevin.brodsky@arm.com,
	yangyicong@hisilicon.com, joey.gouly@arm.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	david@redhat.com
Subject: Re: [PATCH v3] arm64: Enable vmalloc-huge with ptdump
Message-ID: <aFL1G91dDtDtMMon@pc636>
References: <20250616103310.17625-1-dev.jain@arm.com>
 <d0b17ac1-32e1-4086-97ec-1d70c1ac62e6@arm.com>
 <ed2df0cc-e02c-4376-af7a-7deac6efa9b4@arm.com>
 <aFFWw4O2PjOScWld@pc636>
 <910e8622-2755-4aca-b17e-0ec8a18a7f1a@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <910e8622-2755-4aca-b17e-0ec8a18a7f1a@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250618_181930_367043_B0A5D4CC 
X-CRM114-Status: GOOD (  61.49  )
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

On Wed, Jun 18, 2025 at 08:41:36AM +0530, Dev Jain wrote:
> 
> On 17/06/25 5:21 pm, Uladzislau Rezki wrote:
> > On Mon, Jun 16, 2025 at 10:20:29PM +0100, Ryan Roberts wrote:
> > > On 16/06/2025 19:07, Ryan Roberts wrote:
> > > > On 16/06/2025 11:33, Dev Jain wrote:
> > > > > arm64 disables vmalloc-huge when kernel page table dumping is enabled,
> > > > > because an intermediate table may be removed, potentially causing the
> > > > > ptdump code to dereference an invalid address. We want to be able to
> > > > > analyze block vs page mappings for kernel mappings with ptdump, so to
> > > > > enable vmalloc-huge with ptdump, synchronize between page table removal in
> > > > > pmd_free_pte_page()/pud_free_pmd_page() and ptdump pagetable walking. We
> > > > > use mmap_read_lock and not write lock because we don't need to synchronize
> > > > > between two different vm_structs; two vmalloc objects running this same
> > > > > code path will point to different page tables, hence there is no race.
> > > > > 
> > > > > For pud_free_pmd_page(), we isolate the PMD table to avoid taking the lock
> > > > > 512 times again via pmd_free_pte_page().
> > > > > 
> > > > > We implement the locking mechanism using static keys, since the chance
> > > > > of a race is very small. Observe that the synchronization is needed
> > > > > to avoid the following race:
> > > > > 
> > > > > CPU1							CPU2
> > > > > 						take reference of PMD table
> > > > > pud_clear()
> > > > > pte_free_kernel()
> > > > > 						walk freed PMD table
> > > > > 
> > > > > and similar race between pmd_free_pte_page and ptdump_walk_pgd.
> > > > > 
> > > > > Therefore, there are two cases: if ptdump sees the cleared PUD, then
> > > > > we are safe. If not, then the patched-in read and write locks help us
> > > > > avoid the race.
> > > > > 
> > > > > To implement the mechanism, we need the static key access from mmu.c and
> > > > > ptdump.c. Note that in case !CONFIG_PTDUMP_DEBUGFS, ptdump.o won't be a
> > > > > target in the Makefile, therefore we cannot initialize the key there, as
> > > > > is being done, for example, in the static key implementation of
> > > > > hugetlb-vmemmap. Therefore, include asm/cpufeature.h, which includes
> > > > > the jump_label mechanism. Declare the key there and define the key to false
> > > > > in mmu.c.
> > > > > 
> > > > > No issues were observed with mm-selftests. No issues were observed while
> > > > > parallelly running test_vmalloc.sh and dumping the kernel pagetable through
> > > > > sysfs in a loop.
> > > > > 
> > > > > v2->v3:
> > > > >   - Use static key mechanism
> > > > > 
> > > > > v1->v2:
> > > > >   - Take lock only when CONFIG_PTDUMP_DEBUGFS is on
> > > > >   - In case of pud_free_pmd_page(), isolate the PMD table to avoid taking
> > > > >     the lock 512 times again via pmd_free_pte_page()
> > > > > 
> > > > > Signed-off-by: Dev Jain <dev.jain@arm.com>
> > > > > ---
> > > > >   arch/arm64/include/asm/cpufeature.h |  1 +
> > > > >   arch/arm64/mm/mmu.c                 | 51 ++++++++++++++++++++++++++---
> > > > >   arch/arm64/mm/ptdump.c              |  5 +++
> > > > >   3 files changed, 53 insertions(+), 4 deletions(-)
> > > > > 
> > > > > diff --git a/arch/arm64/include/asm/cpufeature.h b/arch/arm64/include/asm/cpufeature.h
> > > > > index c4326f1cb917..3e386563b587 100644
> > > > > --- a/arch/arm64/include/asm/cpufeature.h
> > > > > +++ b/arch/arm64/include/asm/cpufeature.h
> > > > > @@ -26,6 +26,7 @@
> > > > >   #include <linux/kernel.h>
> > > > >   #include <linux/cpumask.h>
> > > > > +DECLARE_STATIC_KEY_FALSE(ptdump_lock_key);
> > > > >   /*
> > > > >    * CPU feature register tracking
> > > > >    *
> > > > > diff --git a/arch/arm64/mm/mmu.c b/arch/arm64/mm/mmu.c
> > > > > index 8fcf59ba39db..e242ba428820 100644
> > > > > --- a/arch/arm64/mm/mmu.c
> > > > > +++ b/arch/arm64/mm/mmu.c
> > > > > @@ -41,11 +41,14 @@
> > > > >   #include <asm/tlbflush.h>
> > > > >   #include <asm/pgalloc.h>
> > > > >   #include <asm/kfence.h>
> > > > > +#include <asm/cpufeature.h>
> > > > >   #define NO_BLOCK_MAPPINGS	BIT(0)
> > > > >   #define NO_CONT_MAPPINGS	BIT(1)
> > > > >   #define NO_EXEC_MAPPINGS	BIT(2)	/* assumes FEAT_HPDS is not used */
> > > > > +DEFINE_STATIC_KEY_FALSE(ptdump_lock_key);
> > > > > +
> > > > >   enum pgtable_type {
> > > > >   	TABLE_PTE,
> > > > >   	TABLE_PMD,
> > > > > @@ -1267,8 +1270,9 @@ int pmd_clear_huge(pmd_t *pmdp)
> > > > >   	return 1;
> > > > >   }
> > > > > -int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> > > > > +static int __pmd_free_pte_page(pmd_t *pmdp, unsigned long addr, bool lock)
> > > > >   {
> > > > > +	bool lock_taken = false;
> > > > >   	pte_t *table;
> > > > >   	pmd_t pmd;
> > > > > @@ -1279,15 +1283,29 @@ int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> > > > >   		return 1;
> > > > >   	}
> > > > > +	/* See comment in pud_free_pmd_page for static key logic */
> > > > >   	table = pte_offset_kernel(pmdp, addr);
> > > > >   	pmd_clear(pmdp);
> > > > >   	__flush_tlb_kernel_pgtable(addr);
> > > > > +	if (static_branch_unlikely(&ptdump_lock_key) && lock) {
> > > > > +		mmap_read_lock(&init_mm);
> > > > > +		lock_taken = true;
> > > > > +	}
> > > > > +	if (unlikely(lock_taken))
> > > > > +		mmap_read_unlock(&init_mm);
> > > > > +
> > > > >   	pte_free_kernel(NULL, table);
> > > > >   	return 1;
> > > > >   }
> > > > > +int pmd_free_pte_page(pmd_t *pmdp, unsigned long addr)
> > > > > +{
> > > > > +	return __pmd_free_pte_page(pmdp, addr, true);
> > > > > +}
> > > > > +
> > > > >   int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> > > > >   {
> > > > > +	bool lock_taken = false;
> > > > >   	pmd_t *table;
> > > > >   	pmd_t *pmdp;
> > > > >   	pud_t pud;
> > > > > @@ -1301,15 +1319,40 @@ int pud_free_pmd_page(pud_t *pudp, unsigned long addr)
> > > > >   	}
> > > > >   	table = pmd_offset(pudp, addr);
> > > > > +	/*
> > > > > +	 * Isolate the PMD table; in case of race with ptdump, this helps
> > > > > +	 * us to avoid taking the lock in __pmd_free_pte_page().
> > > > > +	 *
> > > > > +	 * Static key logic:
> > > > > +	 *
> > > > > +	 * Case 1: If ptdump does static_branch_enable(), and after that we
> > > > > +	 * execute the if block, then this patches in the read lock, ptdump has
> > > > > +	 * the write lock patched in, therefore ptdump will never read from
> > > > > +	 * a potentially freed PMD table.
> > > > > +	 *
> > > > > +	 * Case 2: If the if block starts executing before ptdump's
> > > > > +	 * static_branch_enable(), then no locking synchronization
> > > > > +	 * will be done. However, pud_clear() + the dsb() in
> > > > > +	 * __flush_tlb_kernel_pgtable will ensure that ptdump observes an
> > > > > +	 * empty PUD. Thus, it will never walk over a potentially freed
> > > > > +	 * PMD table.
> > > > > +	 */
> > > > > +	pud_clear(pudp);
> > > > How can this possibly be correct; you're clearing the pud without any
> > > > synchronisation. So you could have this situation:
> > > > 
> > > > CPU1 (vmalloc)			CPU2 (ptdump)
> > > > 
> > > > 				static_branch_enable()
> > > > 				  mmap_write_lock()
> > > > 				    pud = pudp_get()
> > > > pud_free_pmd_page()
> > > >    pud_clear()
> > > > 				    access the table pointed to by pud
> > > > 				    BANG!
> > > > 
> > > > Surely the logic needs to be:
> > > > 
> > > > 	if (static_branch_unlikely(&ptdump_lock_key)) {
> > > > 		mmap_read_lock(&init_mm);
> > > > 		lock_taken = true;
> > > > 	}
> > > > 	pud_clear(pudp);
> > > > 	if (unlikely(lock_taken))
> > > > 		mmap_read_unlock(&init_mm);
> > > > 
> > > > That fixes your first case, I think? But doesn't fix your second case. You could
> > > > still have:
> > > > 
> > > > CPU1 (vmalloc)			CPU2 (ptdump)
> > > > 
> > > > pud_free_pmd_page()
> > > >    <ptdump_lock_key=FALSE>
> > > > 				static_branch_enable()
> > > > 				  mmap_write_lock()
> > > > 				    pud = pudp_get()
> > > >    pud_clear()
> > > > 				    access the table pointed to by pud
> > > > 				    BANG!
> > > > 
> > > > I think what you need is some sort of RCU read-size critical section in the
> > > > vmalloc side that you can then synchonize on in the ptdump side. But you would
> > > > need to be in the read side critical section when you sample the static key, but
> > > > you can't sleep waiting for the mmap lock while in the critical section. This
> > > > feels solvable, and there is almost certainly a well-used pattern, but I'm not
> > > > quite sure what the answer is. Perhaps others can help...
> > > Just taking a step back here, I found the "percpu rw semaphore". From the
> > > documentation:
> > > 
> > > """
> > > Percpu rw semaphores is a new read-write semaphore design that is
> > > optimized for locking for reading.
> > > 
> > > The problem with traditional read-write semaphores is that when multiple
> > > cores take the lock for reading, the cache line containing the semaphore
> > > is bouncing between L1 caches of the cores, causing performance
> > > degradation.
> > > 
> > > Locking for reading is very fast, it uses RCU and it avoids any atomic
> > > instruction in the lock and unlock path. On the other hand, locking for
> > > writing is very expensive, it calls synchronize_rcu() that can take
> > > hundreds of milliseconds.
> > > """
> > > 
> > > Perhaps this provides the properties we are looking for? Could just define one
> > > of these and lock it in read mode around pXd_clear() on the vmalloc side. Then
> > > lock it in write mode around ptdump_walk_pgd() on the ptdump side. No need for
> > > static key or other hoops. Given its a dedicated lock, there is no risk of
> > > accidental contention because no other code is using it.
> > > 
> > Write-lock indeed is super expensive, as you noted it blocks on
> > synchronize_rcu(). If that write-lock interferes with a critical
> > vmalloc fast path, where a read-lock could be injected, then it
> > is definitely a problem.
> 
> I have a question - is this pmd_free_pte_page/pud_free_pmd_page part of
> a fast path?
>
<snip>
vmalloc()
__vmalloc_node_range_noprof()
  __vmalloc_area_node()
    vmap_pages_range();
      vmap_pages_range_noflush()
        __vmap_pages_range_noflush()
          vmap_range_noflush()
            vmap_p4d_range()
              vmap_try_huge_p4d()
	            if (p4d_present(*p4d) && !p4d_free_pud_page(p4d, addr))
<snip>

The point is, we would like to avoid any long-sleeping primitive or
introduce any new bottle-necks which makes the vmalloc less scalable
or slower.

I reacted on the synchronize_rcu() and rw-semaphores because it makes
the current context to enter into sleeping state, i.e. waiting on the
wait_for_completion(). Also, we would like to exclude any sleeping if
possible at all, for example GFP_ATOMIC and GFP_NOWAIT flags support,
where i look at currently.

--
Uladzislau Rezki

