Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 480A0D185F0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 12:52:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/dOxR+6lkNgPMCZhtRPABno91NMnVFRXsM6ccysQjdA=; b=yzAK78Pj/sFOIHafqMRJZUrhQC
	+rM9Hkc21ZRppkCbBkKGWazKsNdrOgc7x/yKrza++rE3Ot3JDNoikQ4lw3LIuJR6Ibuul8oBCtNRL
	MQHko6FAc08LS0To/lkz0ySQmPyboRh5dX7D0SwCYwyIyROy4a/xQELEkFEESo9dHiVhx9Ki1dxUC
	AtrRumsBoAkbQAgcxUTT2LrOV24iTYGns5zSGu14LGkDLZg9fWPJX3PFihT+RWZd5H7Iq1mSvmHfN
	ynLsmxaVFZ6omrPPUbG7Nji+OqY1dCsuqWOnuaxGKQVzn7Yob0TDUBdKuU6Um2g+Uqv97Z0QU9AQG
	wOtUr3Ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpV0-0000000H4Gw-3nbA;
	Thu, 08 Jan 2026 12:52:23 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpV0-0000000H4GF-1SNC
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 08 Jan 2026 12:52:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Transfer-Encoding:Content-Type
	:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:Message-ID:
	Sender:Reply-To:Content-ID:Content-Description;
	bh=/dOxR+6lkNgPMCZhtRPABno91NMnVFRXsM6ccysQjdA=; b=T5wV3PBWS1Hiov7g/CqabRqBd+
	OE1i7msiLF14DePdQYf1p12Q/jcrQ4xzdXzwPNXQ+oXK/jyEHxvbGpz0NR9zyOkPdJVelDlNJoe6l
	noVSpDAXilRYc60grwX/rLEFbqR53FOYCBVpY3as078sxyE7DXTPr954jax3KI0QecoLBIC32+F45
	X2e3L97pGTokPMk0OVn61r0IMcO8Kg5hPsek539w84XYzUimR7jOaRqwiV+Z0Of1Kz19O3Yv6o+vt
	ovYfMUiJ8NSiFTQvdRnm5z+12ect7bEO30FhAtAMfrcgSpZ8yahpqDiMKORTsw8LeaTPKaIjpwM14
	0bf/wcNA==;
Received: from foss.arm.com ([217.140.110.172])
	by desiato.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdpUw-0000000DBRr-475q
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 12:52:21 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8E126497;
	Thu,  8 Jan 2026 04:52:09 -0800 (PST)
Received: from [10.57.47.193] (unknown [10.57.47.193])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 550CC3F6A8;
	Thu,  8 Jan 2026 04:52:15 -0800 (PST)
Message-ID: <56c39e62-0417-495d-a40e-99180a107777@arm.com>
Date: Thu, 8 Jan 2026 12:52:13 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] iommu/io-pgtable-arm: Drop DMA API usage for CMOs
To: Mostafa Saleh <smostafa@google.com>, iommu@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Cc: will@kernel.org, joro@8bytes.org, Jason Gunthorpe <jgg@ziepe.ca>
References: <20260108113846.56179-1-smostafa@google.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260108113846.56179-1-smostafa@google.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_125219_381038_34A1DF32 
X-CRM114-Status: GOOD (  36.06  )
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

On 2026-01-08 11:38 am, Mostafa Saleh wrote:
> As part of the KVM SMMUv3 series[1], we are trying to factor out
> the kernel specific code from io-pgtable-arm so it can also compile
> for the hypervisor.
> 
> Jason pointed out that the DMA-API calls are not really needed [2].
> 
> Looking more into this. Initially, the io-pgtable API let drivers
> do the CMOs using tlb::flush_pgtable() where drivers were using the
> DMA API (map/unmap_single) only to do CMOs as the low-level cache
> functions won’t be available for modules.
> 
> This was later moved to the core code [3], with possibility to
> convert it to full blown DMA-API code if there was a use case.

I don't understand that sentence at all.

> However, no such use case appeared, and we can simplify the code
> slightly by doing CMO directly instead of going through the DMA-API
> functions just for CMOs.
> 
> Although HTTU is not used at the moment, leave the
> arch_sync_dma_for_cpu() in __arm_lpae_free_pages() as this is not a
> hot path.
> 
> Removing the DMA-API will also remove some extra checks ensuring that
> the IOMMU can deal with physical addrs. we can add those check at
> page table creation time (Something as use_dma_iommu/is_swiotlb_active
> However, that seemed a little too much as Linux doesn't support such
> topologies anyways.

NAK - io-pgtable is regular driver code doing what is absolutely a DMA 
mapping operation. How would Panfrost calling arch_sync_* signal to hyp 
that the page is now being used for DMA so needs mapping/pinning at 
stage 2? We can't even say that that doesn't apply to "real" IOMMU 
drivers, since there do unfortunately exist cases where an entire "stage 
1" SMMUv3 is upstream of a "stage 2" SMMUv3 such that it's only workable 
if the former is assigned to EL1 as just another black-box device, while 
only EL2 knows about the latter.

If "pagetable creation time" means alloc_io_pgtable_ops() as I've taken 
it to, how do you specifically propose to check that pages which haven't 
been allocated yet will definitely be valid for DMA in future? Also note 
that the only reason for the virt_to_phys() check (which *has* often 
caught genuine driver/platform configuration issues to a degree that I 
would be very uncomfortable removing it) is basically laziness, in that 
nobody's got round to doing the work to be able to keep track of kernel 
addresses separately from the DMA addresses in the tables themselves, 
and thus allow visibly-remapped pagetables - every now and then there 
arises a situation where that would be really useful, so it is still on 
my wishlist.

Frankly if KVM is going to have increasingly divergent requirements and 
assumptions about pagetables, then it should have its own pagetable code 
like it does for the CPU.

Thanks,
Robin.

> [1] https://lore.kernel.org/linux-iommu/20251117184815.1027271-1-smostafa@google.com/
> [2] https://lore.kernel.org/linux-iommu/20251216005834.GC31492@ziepe.ca/
> [3] https://lore.kernel.org/linux-iommu/7c5584d3efa61ee6b0b87efb72f24f32852aafb7.1438195011.git.robin.murphy@arm.com/
> 
> Suggested-by: Jason Gunthorpe <jgg@ziepe.ca>
> Signed-off-by: Mostafa Saleh <smostafa@google.com>
> ---
>   drivers/iommu/io-pgtable-arm.c | 39 +++++++---------------------------
>   1 file changed, 8 insertions(+), 31 deletions(-)
> 
> diff --git a/drivers/iommu/io-pgtable-arm.c b/drivers/iommu/io-pgtable-arm.c
> index e6626004b323..0da9195155ec 100644
> --- a/drivers/iommu/io-pgtable-arm.c
> +++ b/drivers/iommu/io-pgtable-arm.c
> @@ -15,7 +15,7 @@
>   #include <linux/sizes.h>
>   #include <linux/slab.h>
>   #include <linux/types.h>
> -#include <linux/dma-mapping.h>
> +#include <linux/dma-map-ops.h>
>   
>   #include <asm/barrier.h>
>   
> @@ -254,7 +254,6 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>   {
>   	struct device *dev = cfg->iommu_dev;
>   	size_t alloc_size;
> -	dma_addr_t dma;
>   	void *pages;
>   
>   	/*
> @@ -271,32 +270,10 @@ static void *__arm_lpae_alloc_pages(size_t size, gfp_t gfp,
>   	if (!pages)
>   		return NULL;
>   
> -	if (!cfg->coherent_walk) {
> -		dma = dma_map_single(dev, pages, size, DMA_TO_DEVICE);
> -		if (dma_mapping_error(dev, dma))
> -			goto out_free;
> -		/*
> -		 * We depend on the IOMMU being able to work with any physical
> -		 * address directly, so if the DMA layer suggests otherwise by
> -		 * translating or truncating them, that bodes very badly...
> -		 */
> -		if (dma != virt_to_phys(pages))
> -			goto out_unmap;
> -	}
> -
> +	if (!cfg->coherent_walk)
> +		arch_sync_dma_for_device(__arm_lpae_dma_addr(pages), size,
> +					 DMA_TO_DEVICE);
>   	return pages;
> -
> -out_unmap:
> -	dev_err(dev, "Cannot accommodate DMA translation for IOMMU page tables\n");
> -	dma_unmap_single(dev, dma, size, DMA_TO_DEVICE);
> -
> -out_free:
> -	if (cfg->free)
> -		cfg->free(cookie, pages, size);
> -	else
> -		iommu_free_pages(pages);
> -
> -	return NULL;
>   }
>   
>   static void __arm_lpae_free_pages(void *pages, size_t size,
> @@ -304,8 +281,8 @@ static void __arm_lpae_free_pages(void *pages, size_t size,
>   				  void *cookie)
>   {
>   	if (!cfg->coherent_walk)
> -		dma_unmap_single(cfg->iommu_dev, __arm_lpae_dma_addr(pages),
> -				 size, DMA_TO_DEVICE);
> +		arch_sync_dma_for_cpu(__arm_lpae_dma_addr(pages),
> +				      size, DMA_TO_DEVICE);
>   
>   	if (cfg->free)
>   		cfg->free(cookie, pages, size);
> @@ -316,8 +293,8 @@ static void __arm_lpae_free_pages(void *pages, size_t size,
>   static void __arm_lpae_sync_pte(arm_lpae_iopte *ptep, int num_entries,
>   				struct io_pgtable_cfg *cfg)
>   {
> -	dma_sync_single_for_device(cfg->iommu_dev, __arm_lpae_dma_addr(ptep),
> -				   sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
> +	arch_sync_dma_for_device(__arm_lpae_dma_addr(ptep),
> +				 sizeof(*ptep) * num_entries, DMA_TO_DEVICE);
>   }
>   
>   static void __arm_lpae_clear_pte(arm_lpae_iopte *ptep, struct io_pgtable_cfg *cfg, int num_entries)


