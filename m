Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7496ACD3442
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 May 2026 09:40:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iO2qxGV2Dz72sotDpa6WZEWx9OFKl0tlRmAkWtejDhY=; b=BUfnDjG1hafPPLOSSA4jG1fjc1
	sFZ+7CVZS7yjkjyf3tDbW0CyvXXaSlWmB3D8nYr58+7BYL3LyMOg41xV5Iv+fN3QuGPg6mmGIyqPr
	SZsrh8PNtsUrZycPApMbkX5qMlmsqYq/uMi/RqzsYRfU/S6dDM08GVCxJ9OJ4vVvD5kEkDMMEbXDs
	W3teRmQ1w2Jwi85d/1xyoZMMNSPfnN6M2YNACEMKcx2C5ZwlN+MZLUqmuAYwf/WYwPpL6hFYvUeVk
	V0SosJVfJ9ggVLpbxgk6lWCYlqScAJQEG4dI4rl7aLqHki3RtdcJq6GsPGD8rh6NLOo98ygJ7dYLu
	4O3/BAbg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvDG-00000003NIU-48NC;
	Thu, 07 May 2026 09:40:10 +0000
Received: from mail-wm1-x333.google.com ([2a00:1450:4864:20::333])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKvDE-00000003NHp-2Nu0
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 May 2026 09:40:09 +0000
Received: by mail-wm1-x333.google.com with SMTP id 5b1f17b1804b1-48d1c670255so79325e9.0
        for <linux-arm-kernel@lists.infradead.org>; Thu, 07 May 2026 02:40:07 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1778146807; x=1778751607; darn=lists.infradead.org;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:from:to
         :cc:subject:date:message-id:reply-to;
        bh=iO2qxGV2Dz72sotDpa6WZEWx9OFKl0tlRmAkWtejDhY=;
        b=Cl8M3xRH83q26w6Pr7EJiXUpgtnrYmEnHTzYwFA5QIyCU4kcRm8PVvI1JzHeZO8isS
         wFe7SVoMrA7y6X3/KaUyKpOlTCwyQ84lySEzh6MTEtaz8b+X/WwM830oBFhLMepfI2zE
         RF6M81HxNSbNNKctXSpaSJmW5przuGLEZpAvwCEebv6dcIP0EI9sCl951EjagMc2iBBI
         EC6mlBhuVYva78KImtW7Hqo/zBB6RDyhfHCqJ7U5Sma5yt7DucDdu9CJWciV0y8KYJFu
         lHd2DQRQd09LiJTphlnM78h0Wwk6gNfWAzlyXbAB8ZUkHHGZ6X5Ma3qKcvaBfKdyh7uZ
         9i0g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1778146807; x=1778751607;
        h=in-reply-to:content-transfer-encoding:content-disposition
         :mime-version:references:message-id:subject:cc:to:from:date:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=iO2qxGV2Dz72sotDpa6WZEWx9OFKl0tlRmAkWtejDhY=;
        b=soOXc6iW31Wj3IvUIZqmOqULF2K1ztzvPHgd0tDUvbIadeNQc6JbKRK7Jxvpb/JtNc
         wBbmbkgL0ptC3+oSc7TylYfq8LnO4l+ophUgFosDMcgzGZL9ZnP8cR437eKDMDgf4u1x
         YSuyaWHs0l2RRbpCy50Rf8lF/9GqDuz7LgaV51L7HQb7VyXPqs+o3n9Nh5LyWaHU/Nh5
         xNzTqBf7vTi5ouGmWoPSD0tYieggcjH9SQqc3tttnXVw5hdNA2vDk2ZxmqRWNNeChg4T
         JiC8NoVMHylXt+Svu56mUvykrO73PEud6Nfu4nLhysvgzsLjgjPFCYyF6gGJzZsDDLGM
         EJvA==
X-Gm-Message-State: AOJu0Yxgj7XXeSLjNym11/PVacBJe8Kya3qlTnC8TMi/MeFBoSxbupWG
	GmW/X80kjFhBpuGeoyIlTtnIV40DBLwkzDeOUBhwoOF2Xn09mVJmMBiUSVZ0d0Sqaw==
X-Gm-Gg: AeBDieuTrb8k0Xr1JpSIBbP24Ecgls9L4r9vUuid/xbvopPE1R9HIfqhtt5vvwLPviy
	8pPJ/v+jUkGuBTTmTqzWqOh6DoCPv7kxUEDKW6Vb39EgQOuPTAKX4r7FfB/bLdPNO0fQHGxJnVx
	0itwNbn6AAmwi9SgnRd/N+85eYUa2S8PcX8r+/bQM7EWc0IfgIJpr25wgcG2j603BuiE+C4qzyQ
	FRU4106hQYZInbQn6jKHSm9Z6jkOPZ5PE2egIRNJnkGJjEGG0ENBO8H+8CNxpSAd8K//JfrsPpJ
	2gmeQt53+nbC9mHHxQFWluyjBVKzr4U8juonVfk9pGImRabuoAxv6sAagQzSvHSEORfTPvctnk+
	QybeyD3woPg2riygwFsXbsMbtral7lifHz+kAWHFDgbEUOpFpeeeHs+6eenSJLgkIh7LfRnX4uN
	hx+1bXbR7YcQMpSt0R3FjP6aSzWjqj5FO8xvBafB5RmKy/y9Zdn7s3dYqQ+iWoz2IAa3aDBNfQt
	VoykA==
X-Received: by 2002:a7b:c314:0:b0:48a:5f32:62d0 with SMTP id 5b1f17b1804b1-48e5d650751mr703025e9.12.1778146806189;
        Thu, 07 May 2026 02:40:06 -0700 (PDT)
Received: from google.com (8.181.38.34.bc.googleusercontent.com. [34.38.181.8])
        by smtp.gmail.com with ESMTPSA id 5b1f17b1804b1-48e531578c8sm38996315e9.34.2026.05.07.02.40.05
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 07 May 2026 02:40:05 -0700 (PDT)
Date: Thu, 7 May 2026 09:40:00 +0000
From: Mostafa Saleh <smostafa@google.com>
To: Jason Gunthorpe <jgg@ziepe.ca>
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	kvmarm@lists.linux.dev, iommu@lists.linux.dev,
	catalin.marinas@arm.com, will@kernel.org, maz@kernel.org,
	oliver.upton@linux.dev, joey.gouly@arm.com, suzuki.poulose@arm.com,
	yuzenghui@huawei.com, joro@8bytes.org, jean-philippe@linaro.org,
	mark.rutland@arm.com, qperret@google.com, tabba@google.com,
	vdonnefort@google.com, sebastianene@google.com, keirf@google.com
Subject: Re: [PATCH v6 04/25] iommu/arm-smmu-v3: Move TLB range invalidation
 into common code
Message-ID: <afxd8Km40A5ulZvd@google.com>
References: <20260501111928.259252-1-smostafa@google.com>
 <20260501111928.259252-5-smostafa@google.com>
 <20260501124143.GB6912@ziepe.ca>
 <afiN1UwS9q6F6A_v@google.com>
 <afoYBYIJOTClsdLS@ziepe.ca>
 <afoeIVIGE-JjYy22@google.com>
 <afsPfEzgGtAFrN5P@ziepe.ca>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <afsPfEzgGtAFrN5P@ziepe.ca>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260507_024008_659109_6456A2A3 
X-CRM114-Status: GOOD (  28.52  )
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

On Wed, May 06, 2026 at 06:53:00AM -0300, Jason Gunthorpe wrote:
> On Tue, May 05, 2026 at 04:43:13PM +0000, Mostafa Saleh wrote:
> > On Tue, May 05, 2026 at 01:17:09PM -0300, Jason Gunthorpe wrote:
> > > On Mon, May 04, 2026 at 12:15:17PM +0000, Mostafa Saleh wrote:
> > > 
> > > > I am not sure if it’s worth it, the hypervisor is much simpler, there
> > > > is a single page table, it’s locked (also identity mapped), it’s
> > > > updated on VM boot/teardown only, we don’t even use iotlb_gather at
> > > > the moment, although possible but I wanted to keep this series as
> > > > simple as I can then we can add more features later.
> > > > So this patch is the least intrusive change, as whatever the main SMMUv3
> > > > driver does, the range tlb invalidation logic is the same.
> > > > But I am happy to experiment with that when posted.
> > > 
> > > Okay, then maybe just always push a full invalidation?
> > 
> > Like full address space invalidation? that will not be optimal and
> > will affect every device on the system, why would we do that if we
> > know the address?
> 
> Not every device, just wipe the VMID. If you say it is rare then keep
> it simple. If you need to be narrow then use the proper infastructure
> with a gather. No reason to make something boutique for pkvm here.

But all devices share the same VMID, which impacts all devices on the
system, and is not that rare to ignore.

I can add gather support, it’s not that complicated, it is currently
supported in Android.
But that doesn’t solve the problem, which is: At some point, whether
eagerly from the page table code, through gather sync or a fancy
invalidation array, the driver will need to populate a range
invalidation command (tg, ttl, scale...) and this logic is better
shared with the main driver which is this patch does.

Thanks,
Mostafa

> 
> Jason

