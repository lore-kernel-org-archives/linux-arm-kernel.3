Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B3727CF5385
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 12:38:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eSnGHnHThZw91op6p4UHa6hyohU/lM4yD3AtkoWfYlE=; b=tmm6r84+KLPYeaL9QP9N7Qn3kq
	2oLGCHRcxVNZnvQWrcH2jvvJ1198geHOESqth5xN+hzrNXyelLxM3P4ZZFHq2UhdV5dTBQuDbUqUK
	7UvE4p2IW6xb8Cnk6nJpH1aVd2MRHoJ490yBLpV72nNsE8Xd2J5wTn9WnN2ll0vcJCe3ar/omkUV0
	eL/Nn3m2yPJhGB7NedpmOexE6qEuFWyVq7EV9evTtSEgwDmfou752hjbBHxZ/kCJbcILV+EOusXfC
	ONEz9ThgJs2fgo9Gc+NOAJ1Hs3S5ZJmIUKKPBleUriHJUGmOMmkMqeOL33BxHG7Rc1NzEzzxrTbs7
	c1dXEWNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3adP-0000000ELeG-3wSg;
	Wed, 23 Oct 2024 12:38:43 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3abq-0000000ELPo-0NiP
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 12:37:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id C9366A44E3A;
	Wed, 23 Oct 2024 12:36:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 10FF1C4CEC6;
	Wed, 23 Oct 2024 12:37:01 +0000 (UTC)
Date: Wed, 23 Oct 2024 13:36:59 +0100
From: Catalin Marinas <catalin.marinas@arm.com>
To: Yicong Yang <yangyicong@huawei.com>
Cc: will@kernel.org, yangyicong@hisilicon.com, maz@kernel.org,
	mark.rutland@arm.com, broonie@kernel.org,
	linux-arm-kernel@lists.infradead.org, oliver.upton@linux.dev,
	ryan.roberts@arm.com, linuxarm@huawei.com,
	jonathan.cameron@huawei.com, shameerali.kolothum.thodi@huawei.com,
	prime.zeng@hisilicon.com, xuwei5@huawei.com,
	wangkefeng.wang@huawei.com
Subject: Re: [PATCH v3 3/5] arm64: Add support for FEAT_HAFT
Message-ID: <Zxjt62hKsNu06OrD@arm.com>
References: <20241022092734.59984-1-yangyicong@huawei.com>
 <20241022092734.59984-4-yangyicong@huawei.com>
 <ZxfvVO75Mob_FWF7@arm.com>
 <3ad59e2d-957d-e704-4a4c-ee0af2bd8dd4@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <3ad59e2d-957d-e704-4a4c-ee0af2bd8dd4@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_053706_277289_BA751027 
X-CRM114-Status: GOOD (  38.77  )
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

On Wed, Oct 23, 2024 at 06:30:18PM +0800, Yicong Yang wrote:
> On 2024/10/23 2:30, Catalin Marinas wrote:
> > On Tue, Oct 22, 2024 at 05:27:32PM +0800, Yicong Yang wrote:
> >> diff --git a/arch/arm64/include/asm/pgalloc.h b/arch/arm64/include/asm/pgalloc.h
> >> index 8ff5f2a2579e..bc1051d65125 100644
> >> --- a/arch/arm64/include/asm/pgalloc.h
> >> +++ b/arch/arm64/include/asm/pgalloc.h
> >> @@ -30,7 +30,7 @@ static inline void pud_populate(struct mm_struct *mm, pud_t *pudp, pmd_t *pmdp)
> >>  {
> >>  	pudval_t pudval = PUD_TYPE_TABLE;
> >>  
> >> -	pudval |= (mm == &init_mm) ? PUD_TABLE_UXN : PUD_TABLE_PXN;
> >> +	pudval |= (mm == &init_mm) ? PUD_TABLE_AF | PUD_TABLE_UXN : PUD_TABLE_PXN;
> >>  	__pud_populate(pudp, __pa(pmdp), pudval);
> >>  }
> > 
> > Why not set the table AF for the task entries? I haven't checked the
> > core code but normally when we map a pte it's mapped as young. While for
> > table AF we wouldn't get a fault, I would have thought the core code
> > follows the same logic.
> 
> I may need to check. If I understand it correctly, for most case (e.g.
> a read fault) we should make pte young if the hardware AF update is
> not supported. Otherwsie hardware will help to update.

On arm64 at least, _PROT_DEFAULT has PTE_AF set. So all accessible
entries in protection_map[] will have it set. I'm not sure how the core
code clears PTE_AF in the table entries. I'd have thought it goes
together with some pte_mkold().

> >> +#ifdef CONFIG_ARM64_HAFT
> >> +	{
> >> +		.desc = "Hardware managed Access Flag for Table Descriptor",
> >> +		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
> > 
> > I'd actually use ARM64_CPUCAP_SYSTEM_FEATURE here. We use something
> > similar for HW DBM but there we get a fault and set the pte dirty. You
> > combined it with a system_support_haft() that checks the sanitised regs
> > but I'd rather have a static branch check via cpus_have_cap(). Even with
> > your approach we can have a race with a late CPU hot-plugged that
> > doesn't have the feature in the middle of some core code walking the
> > page tables.
> > 
> > With a system feature type, late CPUs not having the feature won't be
> > brought online (if feature enabled) but in general I don't have much
> > sympathy for SoC vendors combining CPUs with incompatible features ;).
> 
> ok. If we make it a system feature, we can using cpus_have_cap() then and
> drop the system_support_haft() which is checking with the sanitised registers.
> It's fine for me.
> 
> Will ask to not refuse online a CPU due to mismatch of this feature in [1],
> hope we have an agreement :)
> 
> [1] https://lore.kernel.org/linux-arm-kernel/20240820161822.GC28750@willie-the-truck/

I initially thought this would work but I don't feel easy about having
should_clear_pmd_young() change its polarity at runtime while user space
is running. If that's not a problem, we can go with your current
approach.

> >> diff --git a/arch/arm64/mm/proc.S b/arch/arm64/mm/proc.S
> >> index ccbae4525891..4a58b9b36eb6 100644
> >> --- a/arch/arm64/mm/proc.S
> >> +++ b/arch/arm64/mm/proc.S
> >> @@ -495,9 +495,15 @@ alternative_else_nop_endif
> >>  	 * via capabilities.
> >>  	 */
> >>  	mrs	x9, ID_AA64MMFR1_EL1
> >> -	and	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_MASK
> >> +	ubfx	x9, x9, ID_AA64MMFR1_EL1_HAFDBS_SHIFT, #4
> >>  	cbz	x9, 1f
> >>  	orr	tcr, tcr, #TCR_HA		// hardware Access flag update
> >> +
> >> +#ifdef CONFIG_ARM64_HAFT
> >> +	cmp	x9, ID_AA64MMFR1_EL1_HAFDBS_HAFT
> >> +	b.lt	1f
> >> +	orr	tcr2, tcr2, TCR2_EL1x_HAFT
> >> +#endif /* CONFIG_ARM64_HAFT */
> > 
> > I think we can skip the ID check here and always set the HAFT bit. We do
> > something similar with MTE (not for TCR_HA though, don't remember why).
> 
> Thanks for the reference to MTE. Will see and have a test. But a check
> here may seem more reasonable as we usually detect a feature first
> then enable it?

The behaviour of these RES0 bits is that we can write them and if the
feature is present, it will be enabled, otherwise it won't have any
effect, so it's not necessary to check the ID bits, the result would be
the same. We do this in other places as well.

Of course, we need to check the presence of TCR2_EL1, otherwise it would
undef. Just a bit less code since we want the feature on anyway.

-- 
Catalin

