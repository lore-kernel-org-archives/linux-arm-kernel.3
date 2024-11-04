Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 22B19D1BDE0
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 18:44:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=P6vdTJTv2GPTzAlaLSlCoxA7coilRs6RWCFZznipfcw=; b=Gugcu7LM77WD+x3IBB9ndCyWt4
	pElHRgEpokScg5AlxLtrqHLGukXbnuWr7istosJyc028pURTFfxbUOx2//OstZXPlM4dWAwApKjaw
	qDN03suPqNv8eAaZUMPgwWgFvsgIGScSwVmTsV4kET2XekVE9CeYRAXGaxseRJknhrRv2bAQ6EMrH
	yfw1C/Nf8JB+wJVau99p5KoRHTQ0wn8Gm6kSuX3EKitNJiyb2wySAmZqGNmOF30tWiAwUXs61o06a
	Opkk8JguHlZruqgqpfrjDdU9N0RBTG+xbImGR2GiAQN9Y1L/yXbubzwMyU491ZXboWTgkd1TTbFWm
	0dPtGRGg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t823n-0000000EntP-2fXT;
	Mon, 04 Nov 2024 18:44:19 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8226-0000000Engr-27yo
	for linux-arm-kernel@lists.infradead.org;
	Mon, 04 Nov 2024 18:42:36 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 1A23415A1
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 10:43:03 -0800 (PST)
Received: from e110455-lin.cambridge.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id 1229A3F528
	for <linux-arm-kernel@lists.infradead.org>; Mon,  4 Nov 2024 10:42:32 -0800 (PST)
Date: Mon, 4 Nov 2024 18:42:28 +0000
From: Liviu Dudau <liviu.dudau@arm.com>
To: Jason Gunthorpe <jgg@nvidia.com>
Cc: iommu@lists.linux.dev, Joerg Roedel <joro@8bytes.org>,
	linux-arm-kernel@lists.infradead.org,
	Robin Murphy <robin.murphy@arm.com>, Will Deacon <will@kernel.org>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	dri-devel@lists.freedesktop.org, patches@lists.linux.dev,
	Steven Price <steven.price@arm.com>
Subject: Re: [PATCH v2 3/3] iommu: Add a kdoc to iommu_unmap()
Message-ID: <ZykVlIae4uXDX07s@e110455-lin.cambridge.arm.com>
References: <0-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
 <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <3-v2-fd55d00a60b2+c69-arm_no_split_jgg@nvidia.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_104234_608112_4C25DE33 
X-CRM114-Status: GOOD (  22.71  )
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

On Mon, Nov 04, 2024 at 01:41:31PM -0400, Jason Gunthorpe wrote:
> Describe the most conservative version of the driver implementations.
> All drivers should support this.
> 
> Many drivers support extending the range if a large page is hit, but
> let's not make that officially approved API. The main point is to
> document explicitly that split is not supported.
> 
> Signed-off-by: Jason Gunthorpe <jgg@nvidia.com>
> ---
>  drivers/iommu/iommu.c | 14 ++++++++++++++
>  1 file changed, 14 insertions(+)
> 
> diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
> index 83c8e617a2c588..d3cf7cc69c797c 100644
> --- a/drivers/iommu/iommu.c
> +++ b/drivers/iommu/iommu.c
> @@ -2586,6 +2586,20 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
>  	return unmapped;
>  }
>  
> +/**
> + * iommu_unmap() - Remove mappings from a range of IOVA
> + * @domain: Domain to manipulate
> + * @iova: IO virtual address to start
> + * @len: Length of the range starting from @iova
> + *
> + * iommu_unmap() will remove a translation created by iommu_map(). It cannot
> + * subdivide a mapping created by iommu_map(), so it should be called with IOVA
> + * ranges that match what was passed to iommu_map(). The range can aggregate
> + * contiguous iommu_map() calls so long as no individual range is split.
> + *
> + * Returns: Number of bytes of IOVA unmapped. iova + res will be the point
> + * unmapping stopped.

I guess 'res' is the return value here. Not my default name for the variable,
worth replacing it with "return value" ?

Regardless of the acceptance of this nit:

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> + */
>  size_t iommu_unmap(struct iommu_domain *domain,
>  		   unsigned long iova, size_t size)
>  {
> -- 
> 2.43.0
> 

-- 
====================
| I would like to |
| fix the world,  |
| but they're not |
| giving me the   |
 \ source code!  /
  ---------------
    ¯\_(ツ)_/¯

