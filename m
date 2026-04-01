Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 08B9110F6FDC
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  1 Apr 2026 16:33:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i38POLkOCg+yN9zpEbP1Avd2qL+0BuIaDgiB5Ed9P7g=; b=PR8P5yww9bve+c05sDTYy2i77U
	4RLXRSwg/RWIIEJA45XbOu5RR+xXdHefO35WAxpHu96ASBdsbBBijsWSFAjiT7FpsRHCou/EUgvuv
	0AxGEodNX30s7Oh95L06KcvmjN5zgeXc4dePO3433s+3QzQnhQgjpgW081+0SC68g4IRBIwsVniVK
	U1E+D9Tv2meFpdAMjZbxOrUmWnsSrQbEYCHjW5FxZ2RghPWBTM1CyaIsuMzOO33Qbi6EKrBj9SLLJ
	AStmOjs8HaxZQJvc9SflL5GfsncnF0e3Q2suLL9mV3cG/kOgXqfLUVGXTutdhqgSd9E9OSbo7BbNQ
	mb3GNJcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yVi-0000000FjnB-44Ea;
	Wed, 01 Apr 2026 16:33:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yVi-0000000Fjmy-1A8b;
	Wed, 01 Apr 2026 16:33:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=i38POLkOCg+yN9zpEbP1Avd2qL+0BuIaDgiB5Ed9P7g=; b=efc/XBUqN6NA4d0CfwPsLqqvIr
	mfpNW9UP3LyTqVaN7IFE+hfhw5sH6HIwo+8xN7pyuXpgnarOY5mvF9PEqsN9atA3Ry9lWLhV2t/bg
	VMa1Yq7iKVbgHC3P44rjYqwGrijn6iCdXlxU6bgfIwUxz9F89TWgjk/GCmVJQ0n0VJt9d8uKIaV+v
	AbmIVCgpenZUPA2kCySfgXyjb02HDYr6UJ7mnTVAQL0qFgRMujDtjo1qIKaEQsxWv+QlglwSaMwIK
	f18z3A7wA267v6zpSY1E9iST6qlF9fgARynN0TZCacKa6i/FTyBg5w8HoUah/EJWAH37AOcoE3mCW
	lKWyXhLQ==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7yVe-00000000trD-2KrO;
	Wed, 01 Apr 2026 16:33:40 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 66E2E1D6F;
	Wed,  1 Apr 2026 09:33:30 -0700 (PDT)
Received: from [10.57.77.192] (unknown [10.57.77.192])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id AD4483F7D8;
	Wed,  1 Apr 2026 09:33:30 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1775061216; bh=bbGQgXq3CFYt+VX0sV+aCx31FLqKgRb0Qy92VqwuNGQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=GwWe2F6BfmTxsuY29owznO9HTvvEW56dJwVfyzV+5uN0GBcLYF7hpaKkCZDOcPPBz
	 TEcBqhEj+P8QyYRv1a/8cQy7DGKWuggpAfXXgXY+enYSwr4zFfe3AYZpwJmO6CKo0b
	 fnsDhTf4cmHiD1S89CGVZJpbWm2Pb2eppj60v/Lw=
Message-ID: <ee2c2044-e329-4cdd-ac35-9365824d3677@arm.com>
Date: Wed, 1 Apr 2026 17:33:28 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu: Always fill in gather when unmapping
To: Jason Gunthorpe <jgg@nvidia.com>, Alexandre Ghiti <alex@ghiti.fr>,
 AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
 Albert Ou <aou@eecs.berkeley.edu>, asahi@lists.linux.dev,
 Baolin Wang <baolin.wang@linux.alibaba.com>, iommu@lists.linux.dev,
 Janne Grunau <j@jannau.net>, Jernej Skrabec <jernej.skrabec@gmail.com>,
 Joerg Roedel <joro@8bytes.org>, Jean-Philippe Brucker <jpb@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org,
 linux-riscv@lists.infradead.org, linux-sunxi@lists.linux.dev,
 Matthias Brugger <matthias.bgg@gmail.com>, Neal Gompa <neal@gompa.dev>,
 Orson Zhai <orsonzhai@gmail.com>, Palmer Dabbelt <palmer@dabbelt.com>,
 Paul Walmsley <pjw@kernel.org>, Samuel Holland <samuel@sholland.org>,
 Sven Peter <sven@kernel.org>, virtualization@lists.linux.dev,
 Chen-Yu Tsai <wens@kernel.org>, Will Deacon <will@kernel.org>,
 Yong Wu <yong.wu@mediatek.com>, Chunyan Zhang <zhang.lyra@gmail.com>
Cc: Lu Baolu <baolu.lu@linux.intel.com>,
 Janusz Krzysztofik <janusz.krzysztofik@linux.intel.com>,
 Joerg Roedel <joerg.roedel@amd.com>, Jon Hunter <jonathanh@nvidia.com>,
 patches@lists.linux.dev, Samiullah Khawaja <skhawaja@google.com>,
 stable@vger.kernel.org, Vasant Hegde <vasant.hegde@amd.com>
References: <0-v1-664d3acaabb9+78b-iommu_gather_always_jgg@nvidia.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <0-v1-664d3acaabb9+78b-iommu_gather_always_jgg@nvidia.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260401_173338_943637_FA0D6183 
X-CRM114-Status: GOOD (  22.32  )
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

On 2026-03-31 8:56 pm, Jason Gunthorpe wrote:
> The fixed commit assumed that the gather would always be populated if
> an iotlb_sync was required.
> 
> arm-smmu-v3, amd, VT-d, riscv, s390, mtk all use information from the
> gather during their iotlb_sync() and this approach works for them.
> 
> However, arm-smmu, qcom_iommu, ipmmu-vmsa, sun50i, sprd, virtio,
> apple-dart all ignore the gather during their iotlb_sync(). They
> mostly issue a full flush.
> 
> Unfortunately the latter set of drivers often don't bother to add
> anything to the gather since they don't intend on using it. Since the
> core code now blocks gathers that were never filled, this caused those
> drivers to stop getting their iotlb_sync() calls and breaks them.
> 
> Since it is impossible to tell the difference between gathers that are
> empty because there is nothing to do and gathers that are empty
> because they are not used, fill in the gathers for the missing cases.
> 
> io-pgtable might have intended to allow the driver to choose between
> gather or immediate flush because it passed gather to
> ops->tlb_add_page(), however no driver does anything with it.

Apart from arm-smmu-v3...

> mtk uses io-pgtable-arm-v7s but added the range to the gather in the
> unmap callback. Move this into the io-pgtable-arm unmap itself. That
> will fix all the armv7 using drivers (arm-smmu, qcom_iommu,
> ipmmu-vmsa).

io-pgtable-arm-v7s != io-pgtable-arm. You're *breaking* MTK (and failing
to fix the other v7s user, which is MSM).

> arm-smmu uses both ARM_V7S and ARM LPAE formats. The LPAE formats
> already have the gather population because SMMUv3 requires it, so it
> becomes consistent.

Huh? arm-smmu-v3 invokes iommu_iotlb_gather_add_page() itself, because
arm-smmu-v3 uses gathers; arm-smmu does not. io-pgtable-arm has nothing
to do with it. Invoking add range before add_page will end up defeating
the iommu_iotlb_gather_is_disjoint() check and making SMMUv3
overinvalidate between disjoint ranges.

I guess now I remember why we weren't validating gathers in core code
before :(

However, if it is for the sake of a core code check, why not just make
the core code robust itself?

Thanks,
Robin.

----->8-----
diff --git a/drivers/iommu/iommu.c b/drivers/iommu/iommu.c
index 35db51780954..9ca23f89a279 100644
--- a/drivers/iommu/iommu.c
+++ b/drivers/iommu/iommu.c
@@ -2714,6 +2714,10 @@ static size_t __iommu_unmap(struct iommu_domain *domain,
  		pr_debug("unmapped: iova 0x%lx size 0x%zx\n",
  			 iova, unmapped_page);
  
+		/* If the driver itself isn't using the gather, mark it used */
+		if (iotlb_gather->end <= iotlb_gather->start)
+			iommu_iotlb_gather_add_range(&iotlb_gather, iova, unmapped_page);
+
  		iova += unmapped_page;
  		unmapped += unmapped_page;
  	}


