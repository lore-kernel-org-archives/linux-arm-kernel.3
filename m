Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 87CE5C5AC67
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 02:33:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zQGvWQ5TRbVVKxsZlAj66qIKemxnG9gNluuYJ93cgG8=; b=KD9EsnkmuwjgvADgdR+vPqtj43
	wkd/NUhgTabYCUGc2/5B6nS1bM07RkvRbUUO760AvubikYCCx/qfsZrYedQyltvRMT0+lfY81e3sY
	2O9WfRR1KT6W4FwjUrlAe4BPEBAmJsjaX3ApsFSyybZzEW/8udCIapgwFB+N/rPg0kN9mnqHSI82H
	VSwHri5RKMwZu1lKO0pVcJzuUBZG7vNj9a4SoerjpmtVSQqMXy2JkG3mDhklGs/X/4iQTTz+Oo/H+
	GtR3G2y3xCMOVhHIeZXZkZXDY54QR+sZjEQb3QAxoNpX5mV4OPjB9iUd3AC7XIIy3MwPPBAf2e59X
	EixYYDyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAOV-00000006zFh-2Lpz;
	Fri, 07 Aug 2026 02:33:11 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsAOR-00000006zEs-3Z3w
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 02:33:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 3E8491516;
	Thu,  6 Aug 2026 19:32:59 -0700 (PDT)
Received: from localhost (a079125.arm.com [10.164.21.43])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E1A63F86F;
	Thu,  6 Aug 2026 19:33:02 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1786069983; bh=nIPDTxjn/1kodMshR1RB9qez/nOwD4zxCqadVKTuclU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=qNB3ZsKDiC6SNn5JmIewmGh/ymFQjqDK4rCffEeaCTqmy9hd2IQNERNiihCRWIj9f
	 ToV9ROvD5FkHRK5WH2pC0TNWn9y0R5rWRfUQ5TV0yzO7deHkMPIQOoKo6o+kUGrDUz
	 unrr0HdH2dF1Dzp3hSJolJ68SnV2jY7eMn12DwVA=
Date: Fri, 7 Aug 2026 08:02:59 +0530
From: Linu Cherian <linu.cherian@arm.com>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 5/6] arm64: cpufeature: Rename BBML2_NOABORT as BBML3
Message-ID: <anVD26jl4Ve63FqA@a079125.arm.com>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
 <20260723044034.2983651-6-linu.cherian@arm.com>
 <anTARBCJZ6N-ppaO@willie-the-truck>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <anTARBCJZ6N-ppaO@willie-the-truck>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260806_193308_020481_9F50D196 
X-CRM114-Status: GOOD (  18.20  )
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

On Thu, Aug 06, 2026 at 06:11:32PM +0100, Will Deacon wrote:
> On Thu, Jul 23, 2026 at 10:10:32AM +0530, Linu Cherian wrote:
> > - As bbml2_noabort is functionally equivalent to bbml3,
> >   rename cpu/system_supports_bbml2_noabort to
> >   cpu/system_supports_bbml3.
> >   The ARM64 capability name is also renamed accordingly.
> > 
> > - As BBML2_NOABORT or the equivalent BBML3 is the
> >   kernel requirement for setting up linear map with
> >   block/contpte mappings and not BBML2, replace all
> >   bbml2 references with bbml3.
> > 
> > FEAT_BBML3, is introduced as part of 2025 Architecture Extensions.
> > https://developer.arm.com/documentation/109697/2026_03/2025-Architecture-Extensions
> > 
> > No functional changes are introduced with this patch.
> > 
> > Reviewed-by: Gavin Shan <gshan@redhat.com>
> > Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> > Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> > ---
> >  arch/arm64/include/asm/cpufeature.h |  6 ++--
> >  arch/arm64/kernel/cpufeature.c      | 30 +++++-----------
> >  arch/arm64/mm/contpte.c             | 21 +++++------
> >  arch/arm64/mm/mmu.c                 | 54 ++++++++++++++---------------
> >  arch/arm64/mm/proc.S                |  4 +--
> >  arch/arm64/tools/cpucaps            |  2 +-
> >  6 files changed, 50 insertions(+), 67 deletions(-)
> 
> This breaks the build because you haven't updated the caller in the SMMUv3
> SVA code.
> 
> I'll push a fix on top...

Yeah, i missed that. Thanks for pointing out and the fix.

> 
> Will

