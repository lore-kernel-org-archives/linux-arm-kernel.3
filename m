Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5A7ABCD342C
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 May 2026 06:36:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:Content-Type:
	Content-Transfer-Encoding:In-Reply-To:From:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UAOX7g+36grI83zuNghQw07p7liRfgICgVlYKc3Nluo=; b=3GSJgxInCW6qBPn0PB4uBEobMo
	z1UKf6iiEV/HQBcNT7f3bL3ag2D88q/wwSfhu3lv4RlDGiZ8VXtroe271C4QhIQaG6EHgSakB8tZ+
	FdHJYXSla9d1yxsdrnlWPAYxoUlBB824wbw+o6WtHVTBVe2u7RuMRLPlQ+3bNlHNqJYyfTZ5tN02a
	mMvPGSnvLgPDwxx6+0OmS0rnQdvJxe6gRuFcHU98NkmXfJAXByFl3IQn6MoephatAyTHhaIDO4z5S
	6ZiPzb3AkqiFhtJitXCRa20Rai05BqKGdZWWaMr3Hu0Tkne83crRL/tCgW0kIWZmP1f+YapuyhsGR
	ZEu7k4PQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVrm-00000000uW3-0jYh;
	Wed, 06 May 2026 06:36:18 +0000
Received: from mailout2.w1.samsung.com ([210.118.77.12])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wKVrj-00000000uVA-2X2S
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 May 2026 06:36:17 +0000
Received: from eucas1p2.samsung.com (unknown [182.198.249.207])
	by mailout2.w1.samsung.com (KnoxPortal) with ESMTP id 20260506063613euoutp0200eb304f1ef90d81152d58094cda657b~s5nwxAAzV1135111351euoutp02Y
	for <linux-arm-kernel@lists.infradead.org>; Wed,  6 May 2026 06:36:13 +0000 (GMT)
DKIM-Filter: OpenDKIM Filter v2.11.0 mailout2.w1.samsung.com 20260506063613euoutp0200eb304f1ef90d81152d58094cda657b~s5nwxAAzV1135111351euoutp02Y
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=samsung.com;
	s=mail20170921; t=1778049374;
	bh=UAOX7g+36grI83zuNghQw07p7liRfgICgVlYKc3Nluo=;
	h=Date:Subject:To:Cc:From:In-Reply-To:References:From;
	b=tBkFY0KnbNbL7mqrZZLt4TmLURhgSco8cBjnYwUNKXSJRjsDoYHn4VKvY5cyIQ/kj
	 +RTc7unxuyTPktcbg4qCNKvS8EaO0MSNy1vaenPrBI6nYZh0bouh4l6bdaNJpeYxe2
	 Xt7o54cnUqRoGkMxha75sPFuNX746qzb4QHENLYw=
Received: from eusmtip2.samsung.com (unknown [203.254.199.222]) by
	eucas1p2.samsung.com (KnoxPortal) with ESMTPA id
	20260506063613eucas1p22e2010cea14e69222bfde5d3504571a1~s5nwfFy_d1876018760eucas1p2X;
	Wed,  6 May 2026 06:36:13 +0000 (GMT)
Received: from [106.210.134.192] (unknown [106.210.134.192]) by
	eusmtip2.samsung.com (KnoxPortal) with ESMTPA id
	20260506063612eusmtip2ba00c35a881fca512a095dc19595a723~s5nvKmbT_2580225802eusmtip2w;
	Wed,  6 May 2026 06:36:12 +0000 (GMT)
Message-ID: <19fbdfbd-71f5-4e92-8525-aaeddcbf4467@samsung.com>
Date: Wed, 6 May 2026 08:36:11 +0200
MIME-Version: 1.0
User-Agent: Betterbird (Windows)
Subject: Re: [PATCH] drm/exynos/gem: Fix printk specifier for
 gem_object.size and dma_addr
To: Chen-Yu Tsai <wenst@chromium.org>, Inki Dae <inki.dae@samsung.com>,
	Seung-Woo Kim <sw0312.kim@samsung.com>, Kyungmin Park
	<kyungmin.park@samsung.com>, Krzysztof Kozlowski <krzk@kernel.org>, Alim
	Akhtar <alim.akhtar@samsung.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	dri-devel@lists.freedesktop.org, linux-samsung-soc@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, kernel
	test robot <lkp@intel.com>
Content-Language: en-US
From: Marek Szyprowski <m.szyprowski@samsung.com>
In-Reply-To: <20260408064936.1342321-1-wenst@chromium.org>
Content-Transfer-Encoding: 7bit
X-CMS-MailID: 20260506063613eucas1p22e2010cea14e69222bfde5d3504571a1
X-Msg-Generator: CA
Content-Type: text/plain; charset="utf-8"
X-RootMTR: 20260408064951eucas1p14200e8d85d270f16435e38af36dbcae0
X-EPHeader: CA
X-CMS-RootMailID: 20260408064951eucas1p14200e8d85d270f16435e38af36dbcae0
References: <CGME20260408064951eucas1p14200e8d85d270f16435e38af36dbcae0@eucas1p1.samsung.com>
	<20260408064936.1342321-1-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_233615_911531_86E60457 
X-CRM114-Status: GOOD (  22.17  )
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

On 08.04.2026 08:49, Chen-Yu Tsai wrote:
> In the recent change to use the GEM base object's size field instead of
> the exynos_gem object's additional field, the printk format was not
> adjusted for the change to size_t type. This causes a new warning on
> platforms on which size_t is not unsigned long.
>
> Fix this by using the correct "%zx" type.
>
> While at it, fix the specifier for dma_addr so that the cast to unsigned
> long is not longer needed.
>
> Reported-by: kernel test robot <lkp@intel.com>
> Closes: https://lore.kernel.org/oe-kbuild-all/202604081331.jSJQSVmg-lkp@intel.com/
> Fixes: 11e898373fba ("drm/exynos: Drop exynos_drm_gem.size field")
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>

Acked-by: Marek Szyprowski <m.szyprowski@samsung.com>


> ---
> This is only compile tested. Build for ARM 32-bit confirms the warning
> is fixed. Sorry for the noise.
>
> The commit hash used in the Fixes tag is the current one seen in
> exynos-drm-next.
> ---
>  drivers/gpu/drm/exynos/exynos_drm_gem.c | 8 ++++----
>  1 file changed, 4 insertions(+), 4 deletions(-)
>
> diff --git a/drivers/gpu/drm/exynos/exynos_drm_gem.c b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> index d9d42809a1a9..f264e170bc26 100644
> --- a/drivers/gpu/drm/exynos/exynos_drm_gem.c
> +++ b/drivers/gpu/drm/exynos/exynos_drm_gem.c
> @@ -66,8 +66,8 @@ static int exynos_drm_alloc_buf(struct exynos_drm_gem *exynos_gem, bool kvmap)
>  	if (kvmap)
>  		exynos_gem->kvaddr = exynos_gem->cookie;
>  
> -	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(0x%lx), size(0x%lx)\n",
> -			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> +	DRM_DEV_DEBUG_KMS(drm_dev_dma_dev(dev), "dma_addr(%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);
>  	return 0;
>  }
>  
> @@ -80,8 +80,8 @@ static void exynos_drm_free_buf(struct exynos_drm_gem *exynos_gem)
>  		return;
>  	}
>  
> -	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(0x%lx), size(0x%lx)\n",
> -			(unsigned long)exynos_gem->dma_addr, exynos_gem->base.size);
> +	DRM_DEV_DEBUG_KMS(dev->dev, "dma_addr(%pad), size(0x%zx)\n",
> +			  &exynos_gem->dma_addr, exynos_gem->base.size);
>  
>  	dma_free_attrs(drm_dev_dma_dev(dev), exynos_gem->base.size, exynos_gem->cookie,
>  			(dma_addr_t)exynos_gem->dma_addr,

Best regards
-- 
Marek Szyprowski, PhD
Samsung R&D Institute Poland


