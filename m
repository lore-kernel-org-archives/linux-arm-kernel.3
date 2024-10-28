Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AEC0CD3E2A0
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Oct 2024 18:35:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DUkcZkztcKYtSayxBSAaJQSQcIpRZkRxOYaxJkc6BbQ=; b=f1krjTrQCGdJ+3JLLrG1kihX6b
	FM4sPopjiJiAcYqu8gI6kb2pT6I+LEsNgcLkQWLzYcn2WfMgg5574rZm1UTxMvztZVyBUvNtHwvwL
	nx4ZT/CQH1FZ8LRprvT1/eBUziw4M1JFEpba4wkJh9ar69RHDokj6F9Ezr4dRta+S+KtLoCvKE29a
	yMUz7qTPl5wt1fVveWoFN8N3rmUTQA8mZv+6s4tP5NsmY15EBnXtObS8lrITDieV/5W9GLHgtLbn0
	T+3fRvVCU5m8CqtQySmF1R4kWiDf846FXNo7dY39ufXTXI1CsuaWCkDk2W4LgFu+S/zCLZ0ihRF46
	E/DfDUEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t5Uak-0000000BqX8-0Ck4;
	Mon, 28 Oct 2024 18:35:50 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t5UZ3-0000000BqJz-3gku
	for linux-arm-kernel@lists.infradead.org;
	Mon, 28 Oct 2024 18:34:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 9C0AB5C4B9A;
	Mon, 28 Oct 2024 18:33:19 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BC067C4CEC3;
	Mon, 28 Oct 2024 18:34:01 +0000 (UTC)
Date: Mon, 28 Oct 2024 18:33:59 +0000
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
Message-ID: <Zx_ZFwbDUtuDtfmc@arm.com>
References: <20241022092734.59984-1-yangyicong@huawei.com>
 <20241022092734.59984-4-yangyicong@huawei.com>
 <ZxfvVO75Mob_FWF7@arm.com>
 <3ad59e2d-957d-e704-4a4c-ee0af2bd8dd4@huawei.com>
 <Zxjt62hKsNu06OrD@arm.com>
 <5b31a644-1eac-46de-6212-d2733234814b@huawei.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <5b31a644-1eac-46de-6212-d2733234814b@huawei.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241028_113406_037028_0DAB97E3 
X-CRM114-Status: GOOD (  26.25  )
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

On Thu, Oct 24, 2024 at 10:45:51PM +0800, Yicong Yang wrote:
> On 2024/10/23 20:36, Catalin Marinas wrote:
> > On Wed, Oct 23, 2024 at 06:30:18PM +0800, Yicong Yang wrote:
> >> On 2024/10/23 2:30, Catalin Marinas wrote:
> >>> On Tue, Oct 22, 2024 at 05:27:32PM +0800, Yicong Yang wrote:
> >>>> +#ifdef CONFIG_ARM64_HAFT
> >>>> +	{
> >>>> +		.desc = "Hardware managed Access Flag for Table Descriptor",
> >>>> +		.type = ARM64_CPUCAP_WEAK_LOCAL_CPU_FEATURE,
> >>>
> >>> I'd actually use ARM64_CPUCAP_SYSTEM_FEATURE here. We use something
> >>> similar for HW DBM but there we get a fault and set the pte dirty. You
> >>> combined it with a system_support_haft() that checks the sanitised regs
> >>> but I'd rather have a static branch check via cpus_have_cap(). Even with
> >>> your approach we can have a race with a late CPU hot-plugged that
> >>> doesn't have the feature in the middle of some core code walking the
> >>> page tables.
> >>>
> >>> With a system feature type, late CPUs not having the feature won't be
> >>> brought online (if feature enabled) but in general I don't have much
> >>> sympathy for SoC vendors combining CPUs with incompatible features ;).
> >>
> >> ok. If we make it a system feature, we can using cpus_have_cap() then and
> >> drop the system_support_haft() which is checking with the sanitised registers.
> >> It's fine for me.
> >>
> >> Will ask to not refuse online a CPU due to mismatch of this feature in [1],
> >> hope we have an agreement :)
> >>
> >> [1] https://lore.kernel.org/linux-arm-kernel/20240820161822.GC28750@willie-the-truck/
> > 
> > I initially thought this would work but I don't feel easy about having
> > should_clear_pmd_young() change its polarity at runtime while user space
> > is running. If that's not a problem, we can go with your current
> > approach.
> 
> this should be ok as I image. after online a CPU without HAFT the system won't
> advertise HAFT support but we don't disable the HAFT update on the supported
> CPUs, the ongoing page aging process can still use the updated table AF information
> and later process will fallback to use the PTE's AF bit. efficiency maybe reduced
> but the function should be correct.

It's more of a theoretical case - walk_pmd_range() for example checks
should_clear_pmd_young() followed by !pmd_young(). Between these two
checks, should_clear_pmd_young() becomes false but the pmd may have been
accessed by a CPU without HAFT. We'd miss this. However, such race is
benign I think, only used for page aging so it shouldn't matter.

The other thing with your approach is the cost of checking (load, mask,
compare) vs just a static branch. Given that it's only done for pmds,
it's probably lost in the noise but you could check it to be sure.

-- 
Catalin

