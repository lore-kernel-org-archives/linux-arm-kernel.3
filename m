Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D3C4C44539
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Jul 2026 13:24:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6aDhpdQaHijSq9esch5+WU8dacA002S+0r+30kHtios=; b=fOCoYUvFYoB0FLbBogefHlh9MF
	HXZCWQj5kwjOUtYyLsdfHoKqW0q66w1Road1W2prawIDnAZxSubL7FqO0Rf0xcPk5ub1qfrHT5678
	l97aSAOSirdZl6rUEzGu2kEFiPE1vqSIPB/v6c+Q+KfRUiekEzUwJdWek+BInRN1HB4VyBwHaVcKS
	CwI86bVZa18wnW8f0bLpdbVqLHG75MhDxRWipmrVPWbl+2Jdk7xhmHez92mflGZS0jS3nIIVRQtbC
	UjRP/I8ZV6CQvNmEwgIr8D+EGZWQ+2Znh/3O8zM8f2sbKKivhLxkblnakAu52auwZbA/ooVFhPRVK
	+mKyGVug==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWwN-0000000BtoN-0nfc;
	Wed, 22 Jul 2026 13:24:51 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wmWwL-0000000Bto3-1BpW
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Jul 2026 13:24:49 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 616B7600B0;
	Wed, 22 Jul 2026 13:24:48 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6FF6C1F000E9;
	Wed, 22 Jul 2026 13:24:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784726688;
	bh=6aDhpdQaHijSq9esch5+WU8dacA002S+0r+30kHtios=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PpB1ajNaE2DYHXFwM/2M8Offi2IW09ORNIXaMj9ZoAp3j2id7U7RQcvGBnJrs/Yjq
	 /r9pCis9WWRf22Y34q74VZ/2Ui0+ScMMOP2J4zVgMtsqSCiGJ7/WotWKZ0np/iDpTk
	 OrCh6Y3kvc7bFRmezmnv1MEfGIm5gcpKV3MZdjqstHZ6r6OpALxlxJ3iwjdLrDpwbk
	 XFf9coYywFWr0KOleLs5xLmaglD4DVDqU9TGwySzfQKC+MDtmokyGqBorLIOHYEKFl
	 54SF+8VI1U5NscpU+rq+wvh6cWFiCa/0uH/ZByDvwRy5tJNyJxGLi/zGMsEDcc7B7O
	 3IVsac2M8Muhw==
Date: Wed, 22 Jul 2026 14:24:42 +0100
From: Will Deacon <will@kernel.org>
To: Robin Murphy <robin.murphy@arm.com>
Cc: joro@8bytes.org, jpb@kernel.org, catalin.marinas@arm.com,
	yangyicong@hisilicon.com, linux-arm-kernel@lists.infradead.org,
	iommu@lists.linux.dev, stable@vger.kernel.org
Subject: Re: [PATCH] iommu/arm-smmu-v3: Add HAFT support for SVA
Message-ID: <amDEmlcyC3Tfmkel@willie-the-truck>
References: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com>
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

On Wed, Jul 01, 2026 at 06:45:17PM +0100, Robin Murphy wrote:
> Since table access flags cannot be software-managed, if process
> pagetables are using HAFT then SVA must require the SMMU to support and
> enable it too, otherwise page aging is liable to get out of whack.
> 
> Cc: <stable@vger.kernel.org>
> Fixes: 62df5870ebf7 ("arm64: Enable ARCH_HAS_NONLEAF_PMD_YOUNG")
> Signed-off-by: Robin Murphy <robin.murphy@arm.com>
> ---
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3-sva.c | 5 +++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.c     | 6 ++++++
>  drivers/iommu/arm/arm-smmu-v3/arm-smmu-v3.h     | 3 +++
>  3 files changed, 14 insertions(+)

This looks ok to *me*, but Sashiko raises two interesting points:

https://sashiko.dev/#/patchset/878cd6bcbbe2d5677d2f63da13294c148268552c.1782927917.git.robin.murphy@arm.com

1. This may break hitless updates when transitioning to a faulting entry.
2. IORT has HTTU overrides for HA/HD. Does it (will it?) have anything
   for HAFT? At the moment, it looks like you'll trigger a warning
   message.

Given Jason's comments, it's probably worth sending the idreg override
patch as well...

Will

