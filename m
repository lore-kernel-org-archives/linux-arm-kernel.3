Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E61AD2ECE9
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 20 Jan 2026 13:20:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bp4+SFYmNI2O9e81b7U7uPqujKehD8dI3MzHmMjWYhk=; b=r+K7C18usMPwzJMsmTwmFxSlsY
	1LpRNyKT6+IVMl6Wcf3ljBiwGCugnLYJSrtHRDtBSmZ/lHCW/7bRXj6R2TCtbCxsXPSP5MR2Jqmju
	kOkz5p6YnU31pMJDgkB5hCf8RDLFg2rrjv+3bH+1Z0A1AkUm9A7viRYqqrWcrlS3+5SU0uUWZ61QV
	VuWoh48dboX0dtvo1y/9yPOq3kAB2GqQVPfCQ/0Hs1o7ZRuRaASWMUPyAuD8YeSWHAj8UXMdMI8tE
	OBE88i2G3fv13W906umZh4OA7r4wRFDcEb+NFX7LBelKIKe3mMzVxvH0s20hWtr9GmVsNQO8FPtid
	15jjIf2g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBf2-00000003uMD-3vfh;
	Tue, 20 Jan 2026 13:20:44 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1viBf0-00000003uLC-2ePs
	for linux-arm-kernel@lists.infradead.org;
	Tue, 20 Jan 2026 13:20:44 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 247A21476;
	Tue, 20 Jan 2026 05:20:31 -0800 (PST)
Received: from [10.57.49.114] (unknown [10.57.49.114])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 718CD3F740;
	Tue, 20 Jan 2026 05:20:36 -0800 (PST)
Message-ID: <028734f6-2a72-4509-81e0-7e69bda20253@arm.com>
Date: Tue, 20 Jan 2026 13:20:34 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: =?UTF-8?B?UmU6IFtQQVRDSF0gYXJtNjQ6IHN3aW90bGI6IERvbuKAmXQgc2hyaW5r?=
 =?UTF-8?Q?_default_buffer_when_bounce_is_forced?=
To: "Aneesh Kumar K.V (Arm)" <aneesh.kumar@kernel.org>,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 iommu@lists.linux.dev
Cc: Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Marek Szyprowski <m.szyprowski@samsung.com>, suzuki.poulose@arm.com,
 steven.price@arm.com
References: <20260120070102.182977-1-aneesh.kumar@kernel.org>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20260120070102.182977-1-aneesh.kumar@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260120_052042_788866_A0689219 
X-CRM114-Status: GOOD (  22.58  )
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

On 2026-01-20 7:01 am, Aneesh Kumar K.V (Arm) wrote:
> arm64 reduces the default swiotlb size (for unaligned kmalloc()
> bouncing) when it detects that no swiotlb bouncing is needed.
> 
> If swiotlb bouncing is explicitly forced via the command line
> (swiotlb=force), this heuristic must not apply. Add a swiotlb helper to
> query the forced-bounce state and use it to skip the resize when
> bouncing is forced.

This doesn't appear to be an arm64-specific concern though... Since 
swiotlb_adjust_size() already prevents resizing if the user requests a 
specific size on the command line, it seems logical enough to also not 
reduce the size (but I guess still allow it to be enlarged) there if 
force is requested.

(Although realistically, anyone requesting force is quite likely to want 
to request a larger default size anyway...)

Thanks,
Robin.

> Signed-off-by: Aneesh Kumar K.V (Arm) <aneesh.kumar@kernel.org>
> ---
>   arch/arm64/mm/init.c    | 3 ++-
>   include/linux/swiotlb.h | 7 +++++++
>   kernel/dma/swiotlb.c    | 5 +++++
>   3 files changed, 14 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm64/mm/init.c b/arch/arm64/mm/init.c
> index 524d34a0e921..7046241b47b8 100644
> --- a/arch/arm64/mm/init.c
> +++ b/arch/arm64/mm/init.c
> @@ -345,7 +345,8 @@ void __init arch_mm_preinit(void)
>   		flags |= SWIOTLB_FORCE;
>   	}
>   
> -	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) && !swiotlb) {
> +	if (IS_ENABLED(CONFIG_DMA_BOUNCE_UNALIGNED_KMALLOC) &&
> +	    !(swiotlb || force_swiotlb_bounce())) {
>   		/*
>   		 * If no bouncing needed for ZONE_DMA, reduce the swiotlb
>   		 * buffer for kmalloc() bouncing to 1MB per 1GB of RAM.
> diff --git a/include/linux/swiotlb.h b/include/linux/swiotlb.h
> index 3dae0f592063..513a93dcbdbc 100644
> --- a/include/linux/swiotlb.h
> +++ b/include/linux/swiotlb.h
> @@ -185,6 +185,7 @@ bool is_swiotlb_active(struct device *dev);
>   void __init swiotlb_adjust_size(unsigned long size);
>   phys_addr_t default_swiotlb_base(void);
>   phys_addr_t default_swiotlb_limit(void);
> +bool force_swiotlb_bounce(void);
>   #else
>   static inline void swiotlb_init(bool addressing_limited, unsigned int flags)
>   {
> @@ -234,6 +235,12 @@ static inline phys_addr_t default_swiotlb_limit(void)
>   {
>   	return 0;
>   }
> +
> +static inline bool force_swiotlb_bounce(void)
> +{
> +	return false;
> +}
> +
>   #endif /* CONFIG_SWIOTLB */
>   
>   phys_addr_t swiotlb_tbl_map_single(struct device *hwdev, phys_addr_t phys,
> diff --git a/kernel/dma/swiotlb.c b/kernel/dma/swiotlb.c
> index 0d37da3d95b6..85e31f228cc9 100644
> --- a/kernel/dma/swiotlb.c
> +++ b/kernel/dma/swiotlb.c
> @@ -1646,6 +1646,11 @@ phys_addr_t default_swiotlb_base(void)
>   	return io_tlb_default_mem.defpool.start;
>   }
>   
> +bool force_swiotlb_bounce(void)
> +{
> +	return swiotlb_force_bounce;
> +}
> +
>   /**
>    * default_swiotlb_limit() - get the address limit of the default SWIOTLB
>    *


