Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6A1CAEDA68D
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Mar 2026 16:33:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:References:
	Content-Type:Content-Transfer-Encoding:In-Reply-To:From:To:Subject:
	MIME-Version:Date:Message-ID:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=JvN6j8wU9zM77atlq+FD8qGOACA5TsD/SoRj5ZTahzg=; b=4+yriGdmw2YkFz
	0lSQFQM1ejAQ9Pu6jiNzp/ZIlhivd8HkydwE1ly5Ku0wRXMwegoSblXShKz13qMxxj2AfFTetCAsW
	njnosGmeUXCG/+8RZJ+dTmc/AogJRUGmvRBkoVKKn+a7743pcgp2zzi3a5fl8YdI/r+NsEl/Yr7P/
	/sur1oGpHzUPmr7+eqYpqzJUsTCa0rwDJ3nMOClK5aadNx904oz0aHl49Q8tPP867zCyRpEQKUCVa
	DMnFbNS8G92AhL/tT/DT6jywHi5kk88BD7WBpZ5UBptCsLizUDr/x79o6LgRfDReYQ2GTA6e4w5Wi
	aUNGEHjZtmEbCfvzwPkw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSgv-0000000FZzc-24Jk;
	Tue, 03 Mar 2026 16:33:49 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxSgs-0000000FZxG-0yeF
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Mar 2026 16:33:48 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260303163340euoutp02c4635f7ed5f19d02d4a03bc0894b3068~ZYfIXP3_J3106731067euoutp02P
	for <linux-arm-kernel@lists.infradead.org>; Tue,  3 Mar 2026 16:33:40 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260303163340euoutp02c4635f7ed5f19d02d4a03bc0894b3068~ZYfIXP3_J3106731067euoutp02P
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1772555620;
	bh=JvN6j8wU9zM77atlq+FD8qGOACA5TsD/SoRj5ZTahzg=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=YUe+Za49ig+DGc1U0Fb2742N3pNwHgR+kQozsfTPu6ds6K4p4TNzjKQ6thGpoOcZ6
	 Tbqspbs3cmIXNcgU1mZf/q1SjpPj9q35zhS0pzx0QXptI2B5VGk0YX4+e3Nx9pL3Hy
	 mEq6adR56QF2Q2EnQl5fd7H2AYoQHuIs6es6YtpM=
Received: from eusmtip1.samsung.com (unknown [203.254.199.221]) by
	eucas1p1.samsung.com (KnoxPortal) with ESMTPA id
	20260303163340eucas1p198411742f93caae84e07182e4c58ee55~ZYfH5vbBl1139311393eucas1p1W;
	Tue,  3 Mar 2026 16:33:40 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip1.samsung.com (KnoxPortal) with ESMTPA id
	20260303163338eusmtip1e4021c2cdb48747497661a6110830024~ZYfF5s5260803808038eusmtip1R;
	Tue,  3 Mar 2026 16:33:38 +0000 (GMT)
Message-ID: <3ece80c7-697e-4d46-a6f8-49c07b0117a1@samsung.com>
Date: Tue, 3 Mar 2026 17:33:37 +0100
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH v3 0/5] dma-mapping: arm64: support batched cache sync
To: Barry Song <21cnbao@gmail.com>, catalin.marinas@arm.com,
	robin.murphy@arm.com, will@kernel.org, iommu@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260228221125.59863-1-21cnbao@gmail.com>
Content-Transfer-Encoding: 8bit
X-CMS-MailID: 20260303163340eucas1p198411742f93caae84e07182e4c58ee55
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260228221143eucas1p12a276d4216b6ce0f3c374b093f73acd5
X-EPHeader: CA
X-CMS-RootMailID: 20260228221143eucas1p12a276d4216b6ce0f3c374b093f73acd5
References: <CGME20260228221143eucas1p12a276d4216b6ce0f3c374b093f73acd5@eucas1p1.samsung.com>
	<20260228221125.59863-1-21cnbao@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260303_083346_817541_AA32AA7A 
X-CRM114-Status: GOOD (  24.32  )
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
Cc: Juergen Gross <jgross@suse.com>, Barry Song <baohua@kernel.org>, Stefano Stabellini <sstabellini@kernel.org>, Ryan Roberts <ryan.roberts@arm.com>, Leon Romanovsky <leon@kernel.org>, Anshuman Khandual <anshuman.khandual@arm.com>, Marc Zyngier <maz@kernel.org>, Joerg Roedel <joro@8bytes.org>, linux-kernel@vger.kernel.org, Tangquan Zheng <zhengtangquan@oppo.com>, Xueyuan Chen <xueyuan.chen21@gmail.com>, Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>, Suren Baghdasaryan <surenb@google.com>, Ard Biesheuvel <ardb@kernel.org>, Huacai Zhou <zhouhuacai@oppo.com>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On 28.02.2026 23:11, Barry Song wrote:
> From: Barry Song <baohua@kernel.org>
>
> Many embedded ARM64 SoCs still lack hardware cache coherency support, which
> causes DMA mapping operations to appear as hotspots in on-CPU flame graphs.
>
> For an SG list with *nents* entries, the current dma_map/unmap_sg() and DMA
> sync APIs perform cache maintenance one entry at a time. After each entry,
> the implementation synchronously waits for the corresponding region’s
> D-cache operations to complete. On architectures like arm64, efficiency can
> be improved by issuing all entries’ operations first and then performing a
> single batched wait for completion.
>
> Tangquan's results show that batched synchronization can reduce
> dma_map_sg() time by 64.61% and dma_unmap_sg() time by 66.60% on an MTK
> phone platform (MediaTek Dimensity 9500). The tests were performed by
> pinning the task to CPU7 and fixing the CPU frequency at 2.6 GHz,
> running dma_map_sg() and dma_unmap_sg() on 10 MB buffers (10 MB / 4 KB
> sg entries per buffer) for 200 iterations and then averaging the
> results.
>
> Thanks to Xueyuan for volunteering to take on the testing tasks. He
> put significant effort into validating paths such as IOVA link/unlink
> and SWIOTLB on RK3588 boards with NVMe.

Catalin, Will, I would like to merge this to dma-mapping tree, give Your 
ack or comment if You are okay with ARM64 related parts.


> v3:
>   * Fold patches 5/8, 7/8, and 8/8 into patch 4/8 as suggested by Leon,
>     reducing the series from 8 patches to 5;
>   * Fix the SWIOTLB path by ensuring a sync is issued before memcpy;
>   * Add ARCH_HAS_BATCHED_DMA_SYNC Kconfig as suggested by Leon;
>   * Collect Reviewed-by tags from Leon and Juergen. Leon's tag is not
>     added to patch 4 since it has changed significantly since v2 and
>     requires re-review;
>   * Rename some asm macros and functions as suggested by Will;
>   * Add Xueyuan's Tested-by. His help is greatly appreciated!
>   v2 link:
>   https://lore.kernel.org/lkml/20251226225254.46197-1-21cnbao@gmail.com/
>
> v2:
>   * Refine a large amount of arm64 asm code based on feedback from
>     Robin, thanks!
>   * Drop batch_add APIs and always use arch_sync_dma_for_* + flush,
>     even for a single buffer, based on Leon’s suggestion, thanks!
>   * Refine a large amount of code based on feedback from Leon, thanks!
>   * Also add batch support for iommu_dma_sync_sg_for_{cpu,device}
> v1 link:
>   https://lore.kernel.org/lkml/20251219053658.84978-1-21cnbao@gmail.com/
>
> v1, diff with RFC:
>   * Drop a large number of #ifdef/#else/#endif blocks based on feedback
>     from Catalin and Marek, thanks!
>   * Also add batched iova link/unlink support, marked as RFC since I lack
>     the required hardware. This was suggested by Marek, thanks!
> RFC link:
>   https://lore.kernel.org/lkml/20251029023115.22809-1-21cnbao@gmail.com/
>
> Barry Song (5):
>    arm64: Provide dcache_by_myline_op_nosync helper
>    arm64: Provide dcache_clean_poc_nosync helper
>    arm64: Provide dcache_inval_poc_nosync helper
>    dma-mapping: Separate DMA sync issuing and completion waiting
>    dma-mapping: Support batch mode for dma_direct_{map,unmap}_sg
>
>   arch/arm64/Kconfig                  |  1 +
>   arch/arm64/include/asm/assembler.h  | 25 ++++++++++---
>   arch/arm64/include/asm/cache.h      |  5 +++
>   arch/arm64/include/asm/cacheflush.h |  2 +
>   arch/arm64/kernel/relocate_kernel.S |  3 +-
>   arch/arm64/mm/cache.S               | 57 +++++++++++++++++++++++------
>   arch/arm64/mm/dma-mapping.c         |  4 +-
>   drivers/iommu/dma-iommu.c           | 35 ++++++++++++++----
>   drivers/xen/swiotlb-xen.c           | 24 ++++++++----
>   include/linux/dma-map-ops.h         |  6 +++
>   kernel/dma/Kconfig                  |  3 ++
>   kernel/dma/direct.c                 | 23 +++++++++---
>   kernel/dma/direct.h                 | 21 ++++++++---
>   kernel/dma/mapping.c                |  6 +--
>   kernel/dma/swiotlb.c                |  7 +++-
>   15 files changed, 171 insertions(+), 51 deletions(-)
>
> Cc: Leon Romanovsky <leon@kernel.org>
> Cc: Marek Szyprowski <m.szyprowski@samsung.com>
> Cc: Catalin Marinas <catalin.marinas@arm.com>
> Cc: Will Deacon <will@kernel.org>
> Cc: Ada Couprie Diaz <ada.coupriediaz@arm.com>
> Cc: Ard Biesheuvel <ardb@kernel.org>
> Cc: Marc Zyngier <maz@kernel.org>
> Cc: Anshuman Khandual <anshuman.khandual@arm.com>
> Cc: Ryan Roberts <ryan.roberts@arm.com>
> Cc: Suren Baghdasaryan <surenb@google.com>
> Cc: Robin Murphy <robin.murphy@arm.com>
> Cc: Joerg Roedel <joro@8bytes.org>
> Cc: Juergen Gross <jgross@suse.com>
> Cc: Stefano Stabellini <sstabellini@kernel.org>
> Cc: Oleksandr Tyshchenko <oleksandr_tyshchenko@epam.com>
> Cc: Tangquan Zheng <zhengtangquan@oppo.com>
> Cc: Huacai Zhou <zhouhuacai@oppo.com>
> Cc: Xueyuan Chen <xueyuan.chen21@gmail.com>

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


