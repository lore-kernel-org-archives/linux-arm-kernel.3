Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9ADECD4F24
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 May 2026 13:38:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X0K/Mr//olzYxdXG3Wy8BYdN2fTftbgvAW7RSEPad2I=; b=wXATAJZPlHZ5DqLu8N5PxUaBLT
	j/tNMZgMFlcTr6X1oNIKYq9GOpcR3wp1nopsUSAUHGoxcckCjUPkwkd2cb3NMe63Wo8CbOTtxwFyG
	NAgwUS34ddLqOsJsH1Sv+iiLSW1gt+z1F5zHX15RNjFCzm91IdIChox8VbWQYmImAttOkaKWfUVlD
	rM26ivykZO0K7GsRbvDViesAjXbGYQlw1OlgDjX9oGA3iZjJnf+nOmPZK7l2nQbkSGxCsIrFto5lZ
	PxRW3CVmk1OPCWLbBBTM8iENdVW8seHv/30z4QDL5SUHOYjizmxYk7f/FQJSg3RP02KXg9+Q0kryO
	N+w2i9kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnJ4-0000000GsTJ-2Wzp;
	Tue, 12 May 2026 13:37:54 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wMnJ2-0000000GsRe-0dIM
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 May 2026 13:37:53 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E34801655
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:37:42 -0700 (PDT)
Received: from [192.168.0.1] (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPA id E9D8D3FA1F
	for <linux-arm-kernel@lists.infradead.org>; Tue, 12 May 2026 06:37:47 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1778593068; bh=Gvl4cEd1ZiXBIpJHrKLmqu+T8vzwYIr7JhCY27iDUns=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SChCFyHykrVe3sL5BHjuhYE359KIDcWzJf0KJIhWb/46b/tDAGqQ41klFSiOZAPNX
	 O9L1lIWldaVfn/vxBfpcLrv175kPKvlaEIP6ZLOxQtTx+4XSTuSuZCOfzhTvLdaips
	 ATp13V3jhREnf9fFIF6gJ/4uv2PAgRNjRmb1SO6A=
Date: Tue, 12 May 2026 14:37:21 +0100
From: Liviu Dudau <liviu.dudau@arm.com>
To: Ketil Johnsen <ketil.johnsen@arm.com>
Cc: David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	Jonathan Corbet <corbet@lwn.net>,
	Shuah Khan <skhan@linuxfoundation.org>,
	Sumit Semwal <sumit.semwal@linaro.org>,
	Benjamin Gaignard <benjamin.gaignard@collabora.com>,
	Brian Starkey <Brian.Starkey@arm.com>,
	John Stultz <jstultz@google.com>,
	"T.J. Mercier" <tjmercier@google.com>,
	Christian =?utf-8?B?S8O2bmln?= <christian.koenig@amd.com>,
	Boris Brezillon <boris.brezillon@collabora.com>,
	Steven Price <steven.price@arm.com>,
	Daniel Almeida <daniel.almeida@collabora.com>,
	Alice Ryhl <aliceryhl@google.com>,
	Matthias Brugger <matthias.bgg@gmail.com>,
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>,
	dri-devel@lists.freedesktop.org, linux-doc@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-media@vger.kernel.org,
	linaro-mm-sig@lists.linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 3/8] drm/panthor: De-duplicate FW memory section sync
Message-ID: <agMtEXOqPGEwKuwt@e142607>
References: <20260505140516.1372388-1-ketil.johnsen@arm.com>
 <20260505140516.1372388-4-ketil.johnsen@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260505140516.1372388-4-ketil.johnsen@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260512_063752_480070_72BC4B6E 
X-CRM114-Status: GOOD (  22.35  )
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

On Tue, May 05, 2026 at 04:05:09PM +0200, Ketil Johnsen wrote:
> Handle the sync to device of FW memory sections inside
> panthor_fw_init_section_mem() so that the callers do not have to.
> 
> This small improvement is also critical for protected FW sections,
> so we avoid issuing memory transactions to protected memory from
> CPU running in normal mode.
> 
> Signed-off-by: Ketil Johnsen <ketil.johnsen@arm.com>

Reviewed-by: Liviu Dudau <liviu.dudau@arm.com>

Best regards,
Liviu

> ---
>  drivers/gpu/drm/panthor/panthor_fw.c | 22 ++++++----------------
>  1 file changed, 6 insertions(+), 16 deletions(-)
> 
> diff --git a/drivers/gpu/drm/panthor/panthor_fw.c b/drivers/gpu/drm/panthor/panthor_fw.c
> index be0da5b1f3abf..0d07a133dc3af 100644
> --- a/drivers/gpu/drm/panthor/panthor_fw.c
> +++ b/drivers/gpu/drm/panthor/panthor_fw.c
> @@ -446,6 +446,7 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
>  					struct panthor_fw_section *section)
>  {
>  	bool was_mapped = !!section->mem->kmap;
> +	struct sg_table *sgt;
>  	int ret;
>  
>  	if (!section->data.size &&
> @@ -464,6 +465,11 @@ static void panthor_fw_init_section_mem(struct panthor_device *ptdev,
>  
>  	if (!was_mapped)
>  		panthor_kernel_bo_vunmap(section->mem);
> +
> +	/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> +	sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
> +	if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
> +		dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>  }
>  
>  /**
> @@ -626,7 +632,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  	section_size = hdr.va.end - hdr.va.start;
>  	if (section_size) {
>  		u32 cache_mode = hdr.flags & CSF_FW_BINARY_IFACE_ENTRY_CACHE_MODE_MASK;
> -		struct panthor_gem_object *bo;
>  		u32 vm_map_flags = 0;
>  		u64 va = hdr.va.start;
>  
> @@ -663,14 +668,6 @@ static int panthor_fw_load_section_entry(struct panthor_device *ptdev,
>  		}
>  
>  		panthor_fw_init_section_mem(ptdev, section);
> -
> -		bo = to_panthor_bo(section->mem->obj);
> -
> -		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> -		if (drm_WARN_ON_ONCE(&ptdev->base, !bo->dmap.sgt))
> -			return -EINVAL;
> -
> -		dma_sync_sgtable_for_device(ptdev->base.dev, bo->dmap.sgt, DMA_TO_DEVICE);
>  	}
>  
>  	if (hdr.va.start == CSF_MCU_SHARED_REGION_START)
> @@ -724,17 +721,10 @@ panthor_reload_fw_sections(struct panthor_device *ptdev, bool full_reload)
>  	struct panthor_fw_section *section;
>  
>  	list_for_each_entry(section, &ptdev->fw->sections, node) {
> -		struct sg_table *sgt;
> -
>  		if (!full_reload && !(section->flags & CSF_FW_BINARY_IFACE_ENTRY_WR))
>  			continue;
>  
>  		panthor_fw_init_section_mem(ptdev, section);
> -
> -		/* An sgt should have been requested when the kernel BO was GPU-mapped. */
> -		sgt = to_panthor_bo(section->mem->obj)->dmap.sgt;
> -		if (!drm_WARN_ON_ONCE(&ptdev->base, !sgt))
> -			dma_sync_sgtable_for_device(ptdev->base.dev, sgt, DMA_TO_DEVICE);
>  	}
>  }
>  
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

