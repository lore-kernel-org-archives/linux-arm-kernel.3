Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 44730D2ED0F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 09:25:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uuEG4K4aEp06ZWXqrpGNkirdOtUwihs79u9rznJ/NTA=; b=liCvs+GdmNZ4JQifnLke/1gM/D
	lIxulYGeiVdtYOyFENkgIxoUhPGpCVpO1mMDL2lm5M0kS0KTHgcHi9DwdSWUqWyiwPI0uDkDg9GuU
	36UMrot+xXLu7eob5ExMutvxr//b5+gyGOYhpJ6IyUorWTSYTxPNK+KxKQqRlmek9pSBeLNjWsEEH
	8HzLj5EivEyzxWBtEhg7E6EIxdEturaLTdg1bi4j2F+PdIpgWVRp4dDrFS6sgPaXGlPU4PszLT7x/
	oLwAbwhc2R/0W8AhF/rriswJcAf9+INsGVbX90ZLoDHcEASMwcicDtrC1VmrZt1ZUw0Y5Ze//18gT
	BFOiKMqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7zB-00000003WuI-25yL;
	Tue, 20 Jan 2026 09:25:17 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vi7z8-00000003Wte-32uZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 09:25:15 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 67EF11476;
	Tue, 20 Jan 2026 01:25:04 -0800 (PST)
Received: from [10.163.163.250] (unknown [10.163.163.250])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 180A13F740;
	Tue, 20 Jan 2026 01:25:07 -0800 (PST)
Message-ID: <79a50bba-2805-4901-a258-817c584fff96@arm.com>
Date: Tue, 20 Jan 2026 14:55:05 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gYXJtNjQ6IHN3aW90bGI6IERvbuKAmXQgc2hyaW5r?=
 =?UTF-8?Q?_default_buffer_when_bounce_is_forced?=
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>,
 Robin Murphy <robin.murphy@arm.com>, suzuki.poulose@arm.com,
 steven.price@arm.com
References: <20260120070102.182977-1-aneesh.kumar@kernel.org>
Content-Language: en-US
From: Anshuman Khandual <anshuman.khandual@arm.com>
In-Reply-To: <20260120070102.182977-1-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_012514_831381_4335F7BD 
X-CRM114-Status: GOOD (  20.37  )
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

On 20/01/26 12:31 PM, Aneesh Kumar K.V (Arm) wrote:
> arm64 reduces the default swiotlb size (for unaligned kmalloc()
> bouncing) when it detects that no swiotlb bouncing is needed.
> 
> If swiotlb bouncing is explicitly forced via the command line
> (swiotlb=force), this heuristic must not apply. Add a swiotlb helper to
> query the forced-bounce state and use it to skip the resize when
> bouncing is forced.

Makes sense not to reduce the SWIOTLB buffer size when being
forced by the administrator.

> 
> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>  arch/arm64/mm/init.c    | 3 ++-
>  include/linux/swiotlb.h | 7 +++++++
>  kernel/dma/swiotlb.c    | 5 +++++
>  3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 524d34a0e921..7046241b47b8 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -345,7 +345,8 @@ void __init arch_mm_preinit(void)
>  		flags |= SWIOTLB_FORCE;
>  	}
>  
> -	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
> +	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
> +	    !(swiotlb || force_swiotlb_bounce())) {
>  		/*
>  		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
>  		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.

Should the comment here be updated as well ?

> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3dae0f592063..513a93dcbdbc 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -185,6 +185,7 @@ bool is_swiotlb_active(struct device *dev);
>  void __init swiotlb_adjust_size(unsigned long size);
>  phys_addr_t default_swiotlb_base(void);
>  phys_addr_t default_swiotlb_limit(void);
> +bool force_swiotlb_bounce(void);
>  #else
>  static inline void swiotlb_init(bool addressing_limited, unsigned int flags)
>  {
> @@ -234,6 +235,12 @@ static inline phys_addr_t default_swiotlb_limit(void)
>  {
>  	return 0;
>  }
> +
> +static inline bool force_swiotlb_bounce(void)
> +{
> +	return false;
> +}
> +
>  #endif /* CONFIG_SWIOTLB */
>  
>  phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 0d37da3d95b6..85e31f228cc9 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1646,6 +1646,11 @@ phys_addr_t default_swiotlb_base(void)
>  	return io_tlb_default_mem.defpool.start;
>  }
>  
> +bool force_swiotlb_bounce(void)
> +{
> +	return swiotlb_force_bounce;
> +}
> +
>  /**
>   * default_swiotlb_limit() - get the address limit of the default SWIOTLB
>   *


