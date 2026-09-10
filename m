Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7606BC79FB9
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Sep 2026 13:04:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OqcFvD1oHRf3CUmqeRwBVe/Vdci4v9WF/u/pqTn5yLY=; b=3mBxvjQ9s9+vLQtlKA7DU+XWQ9
	ZthU0/wCZAtPtJ3gTTpwgiRc8FTnZ/HtsvYzwjZ3Uq46SVNUid35yuuRWHUUT/2tUJ2Qk7eX2xIdw
	8Z8Pd3QUuZIg/c9TFzSv2YZPIszyfWHnU4hhNu3DNw0GVVTTmxHcECLj+qJ92v2+p8oprmbWDKnkQ
	gqMndsUz3gw3j9233zcn3y6gzg0s+aFtKVwRn6mbClBSVYXjha5H7Fqi2A+ib6BlBDMTQBC6AfU6o
	v6YJ1peHxq2PSb1Z4ONdLPOafaPvN/OLJ+K++xww0Z6C7QvFvtyxIxIF6uXh5BsJXKM0+9NIlWOmx
	Nm01wD1g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eRZ-0000000EQF7-14Gy;
	Thu, 10 Sep 2026 13:03:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4eRX-0000000EQEl-1fBx
	for linux-arm-kernel@lists.infradead.org;
	Thu, 10 Sep 2026 13:03:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91092600E2;
	Thu, 10 Sep 2026 13:03:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 230771F000FF;
	Thu, 10 Sep 2026 13:03:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789045434;
	bh=OqcFvD1oHRf3CUmqeRwBVe/Vdci4v9WF/u/pqTn5yLY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=L4RxqsBUHTVxjSuPWc45IGy/B74umFjvmOW9asWW3od5itQxQtL7xMlZovDPny9Fb
	 KEdGDtmIL7pdE/LoHU1DskTR32BIH5cPHgB81uBvyVaJUsnNLiATeoxK8n+i75skXs
	 NrSVKSubGuhlWmW3Lb2DmqI814P00DbQH6S57flQ2a41cA/7M4iOBHzPLBvkdfWEd2
	 ZChSiTirWrzp2QviAqgv30HntCUPbM44od62Z8JwOLn8HVnjM41nzr0oz9VheKbSVd
	 ln+h8yja8EWIdLvs5UjAFDabadqV1mvvy+kcYqqcOpjcsJ5fQXdc48gkTGTG5ArPnZ
	 /kmoeljNtnaag==
Date: Thu, 10 Sep 2026 14:03:48 +0100
From: Will Deacon <will@kernel.org>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: Nicolin Chen <nicolinc@nvidia.com>, Robin Murphy <robin.murphy@arm.com>,
	joro@8bytes.org, Kevin Tian <kevin.tian@intel.com>,
	David Woodhouse <dwmw2@infradead.org>,
	Lu Baolu <baolu.lu@linux.intel.com>,
	linux-arm-kernel@lists.infradead.org, iommu@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Pranjal Shrivastava <praan@google.com>
Subject: Re: [PATCH v6 0/5] iommufd: Iterate the cache invalidation array in
 the core
Message-ID: <aqKqtJguAfzDSiZE@willie-the-truck>
References: <cover.1788127877.git.nicolinc@nvidia.com>
 <20260909164107.GA4147563@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260909164107.GA4147563@nvidia.com>
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

On Wed, Sep 09, 2026 at 01:41:07PM -0300, Jason Gunthorpe wrote:
> On Sun, Aug 30, 2026 at 03:26:37PM -0700, Nicolin Chen wrote:
> > The vIOMMU cache_invalidate() and the nested-HWPT cache_invalidate_user()
> > ops are each handed the full user invalidation array and must report, via
> > array->entry_num, how many of its entries they handled. That makes every
> > driver open-code the same array walk, with real downsides:
> [..]
> > Nicolin Chen (5):
> >   iommu/arm-smmu-v3-iommufd: Reject unsupported bits in invalidation
> >     commands
> >   iommufd: Iterate the cache invalidation array in the core
> >   iommufd/selftest: Convert cache invalidation mocks to the core array
> >     loop
> >   iommu/arm-smmu-v3-iommufd: Convert cache invalidation to the core
> >     array loop
> >   iommu/vt-d: Convert nested cache invalidation to the core array loop
> > 
> >  include/linux/iommu.h                         |   6 +-
> >  include/linux/iommufd.h                       |   2 +
> >  include/uapi/linux/iommufd.h                  |   4 +-
> >  .../arm/arm-smmu-v3/arm-smmu-v3-iommufd.c     | 197 ++++++++++++++----
> >  drivers/iommu/intel/nested.c                  |  54 ++---
> >  drivers/iommu/iommufd/hw_pagetable.c          |  25 ++-
> >  drivers/iommu/iommufd/selftest.c              | 147 +++++++------
> >  7 files changed, 282 insertions(+), 153 deletions(-)
> 
> Will, can I pick this up, or did you want a branch or something?

All yours!

Will

