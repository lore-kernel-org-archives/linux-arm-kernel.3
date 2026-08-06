Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD4A6C56208
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Aug 2026 17:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2ZJNaxiLoFLLLlvpXUa9ISTVWHOVV3+JPP0C+H9BqLg=; b=EWK3eYaJGnZ4jZVvaCmPiaAG5D
	PHpZLuHeoNE3ThDnCXb6RRC3al+cPZkpyHRpyaaGot26zE4h9DwVzX/pkGBpuWQlPXfg71Gcc0hR9
	qicBIuQAJQvw9BbIKzgiH4EEm4/peYTO1fWWsdxyEZ73uSJ7UAhT8RiMXGA6M5DYJ1LzKwKrnGbQh
	7B/Mcaj6/BlAZxmyhpZunWXmDicCPi+4g1jDenpy/wssshxZNZMRhSZ8XsAhIeegxloYuJZFzXU0W
	WPybhQsEoUIjjglqZcJEESGKI7mmzL0V7+ccBS1UiWc1bpa9MVZje9TH6IN3hSId6yve6h3LCdLX3
	t4V2ZEUQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1d5-00000006KM6-1rPj;
	Thu, 06 Aug 2026 17:11:39 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1ws1d4-00000006KL2-3r37
	for linux-arm-kernel@lists.infradead.org;
	Thu, 06 Aug 2026 17:11:38 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 3C4F840E55;
	Thu,  6 Aug 2026 17:11:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2DB2B1F000E9;
	Thu,  6 Aug 2026 17:11:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786036298;
	bh=2ZJNaxiLoFLLLlvpXUa9ISTVWHOVV3+JPP0C+H9BqLg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GpgGEd3tJRREW0dfx8tXVYguO1t4HgkI0/DLPlEImGRC0nQTljP9J/5a15ptYw588
	 YsZD1WzeNxDq2O/encG8MxStRH3IPWTxji7BxuskSya8o+DDfxt1A7alngEnXq+ppH
	 Fq2tS4xdDlC7qi5nH8vDWHeQ6RLliHcm2IOkvVTGNxCa4Gn4UFHBjUGcQumOuLptF1
	 ktzLZdZk+xIFdTphx4Kr8qqXm9p6JokD+ITJc5l4ly0s7rxT0JfsrYcfiZaS16pKyM
	 tU/RO0EZ0EyuIpOgr+En+LuQ/9MTGvh86XWMYyHOGMcUFVe2QlTKjnuomDIHMMLmFl
	 Z63bRelVXgHpg==
Date: Thu, 6 Aug 2026 18:11:32 +0100
From: Will Deacon <will@kernel.org>
To: Linu Cherian <linu.cherian@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Ryan Roberts <ryan.roberts@arm.com>,
	Kevin Brodsky <kevin.brodsky@arm.com>,
	Anshuman Khandual <anshuman.khandual@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Mark Rutland <mark.rutland@arm.com>,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Gavin Shan <gshan@redhat.com>
Subject: Re: [PATCH v4 5/6] arm64: cpufeature: Rename BBML2_NOABORT as BBML3
Message-ID: <anTARBCJZ6N-ppaO@willie-the-truck>
References: <20260723044034.2983651-1-linu.cherian@arm.com>
 <20260723044034.2983651-6-linu.cherian@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260723044034.2983651-6-linu.cherian@arm.com>
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

On Thu, Jul 23, 2026 at 10:10:32AM +0530, Linu Cherian wrote:
> - As bbml2_noabort is functionally equivalent to bbml3,
>   rename cpu/system_supports_bbml2_noabort to
>   cpu/system_supports_bbml3.
>   The ARM64 capability name is also renamed accordingly.
> 
> - As BBML2_NOABORT or the equivalent BBML3 is the
>   kernel requirement for setting up linear map with
>   block/contpte mappings and not BBML2, replace all
>   bbml2 references with bbml3.
> 
> FEAT_BBML3, is introduced as part of 2025 Architecture Extensions.
> https://developer.arm.com/documentation/109697/2026_03/2025-Architecture-Extensions
> 
> No functional changes are introduced with this patch.
> 
> Reviewed-by: Gavin Shan <gshan@redhat.com>
> Reviewed-by: Anshuman Khandual <anshuman.khandual@arm.com>
> Signed-off-by: Linu Cherian <linu.cherian@arm.com>
> ---
>  arch/arm64/include/asm/cpufeature.h |  6 ++--
>  arch/arm64/kernel/cpufeature.c      | 30 +++++-----------
>  arch/arm64/mm/contpte.c             | 21 +++++------
>  arch/arm64/mm/mmu.c                 | 54 ++++++++++++++---------------
>  arch/arm64/mm/proc.S                |  4 +--
>  arch/arm64/tools/cpucaps            |  2 +-
>  6 files changed, 50 insertions(+), 67 deletions(-)

This breaks the build because you haven't updated the caller in the SMMUv3
SVA code.

I'll push a fix on top...

Will

