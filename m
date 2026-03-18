Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DCDAC10706ED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Mar 2026 16:02:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=B9PuRNE1Xc+V1EaosmyPpiwYEzGxmqvXERCvSkawegA=; b=QwrNN2f3bFg/chbjRVKUE2I8YZ
	0FfgS/Jz+gTo5jKwLPtA0yfIV61M4xJf4GX8g2bpOG5UsoV8nqTNC/MVPTThTXykHzaOFhQYHJ7Vz
	6K9NWaU/GSgMqWJDzMXvI21i1YF6ZdX+/Wuxe/nISRQty2eKwSMd8+V1VAmyAjTQijFgHLMROlAZ9
	NOCiyeco8uugcSn2mL8IqZ9VvU6qxnKMA6fUOQWBylYFmUsVgG5YDF5gGqfgdIQn9B+cEAJ3LFFSF
	Q+rxbFyM3XaI7fMCLAO3uYq+xyCA5D+G8+5hh+kWU8QjuyW5LQBK+ecVIMG4pH0jQSG6GuNwaoLbz
	IoZ8boTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tM8-00000008sa5-3SdL;
	Wed, 18 Mar 2026 16:02:48 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tM8-00000008sZj-08VD
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 18 Mar 2026 16:02:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=B9PuRNE1Xc+V1EaosmyPpiwYEzGxmqvXERCvSkawegA=; b=n2rq9PCDik/H6FkgECXoJGkjr/
	b1BqJslR+ohqPpv3CIroQPQbIteaJjft1SY7CFdQWSwbO131cNsEiwa91A94UMGdY9sc84cDNS4nm
	iQp969o9vec/SqxiP8g6iDy3vd6b1ClTLE5l5a9qVIRSjhuiQXS9QV0zlrcWiiKvPSDVG/90jmdTy
	CvfpIgbLOPB+EFVzK8KA/VEgGzvyvwI6DGPJTkqWAXhHx3nT7y26Na7w2HiZ4OWjQgX5oa43Q0cFY
	9z50fJPyv2r3pE6l3RpE/2ym8qAdiopALJoKcxE8kRtATFGpUyZ3yEqvmjysHBAw4YyAqRAdOTOCG
	FgFdQgNw==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w2tM4-0000000Bf6d-0VLS
	for linux-arm-kernel@lists.infradead.org;
	Wed, 18 Mar 2026 16:02:45 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 45B43308;
	Wed, 18 Mar 2026 17:01:28 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1773849688;
	bh=F6T7WgQFzL9ZsxQ2e0wKCFuwA3qMfjikGbQKgaO6svc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PkXCphOIbFqGyMnwvp8YfTYTjZ072oxSDQnICaXV6Wv0m6bY7bqMYina6aSOaQLDe
	 UxGi6W4PPPoEAawz518le518dPSuTHketU43ICcLzppG0dTKftMKrsI7R31kyJv3DN
	 DjVH10XqTJLgxsE0jCZdv/oS3eyaQAQ1vP/Mktqc=
Date: Wed, 18 Mar 2026 18:02:39 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Chen-Yu Tsai <wenst@chromium.org>
Cc: Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Rob Herring <robh@kernel.org>, dri-devel@lists.freedesktop.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	asahi@lists.linux.dev
Subject: Re: [PATCH v2 1/4] drm/rcar-du: Use drm_gem_dma_get_sg_table()
 helper to get scatter gather table
Message-ID: <20260318160239.GB633439@killaraus.ideasonboard.com>
References: <20260317064049.696795-1-wenst@chromium.org>
 <20260317064049.696795-2-wenst@chromium.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260317064049.696795-2-wenst@chromium.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260318_160244_274714_A6D8B581 
X-CRM114-Status: GOOD (  27.40  )
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

Hi Chen-Yu,

Thank you for the patch.

On Tue, Mar 17, 2026 at 02:40:43PM +0800, Chen-Yu Tsai wrote:
> The rcar-du driver is directly calling dma_get_sgtable() on a
> drm_gem_dma_object. Not passing the dma_attrs field in may cause
> problems when DMA_ATTR_NO_KERNEL_MAPPING is added to the GEM DMA
> helpers gain support later.
> 
> Instead, use the drm_gem_dma_get_sg_table() helper to get the scatter
> gather table.
> 
> Signed-off-by: Chen-Yu Tsai <wenst@chromium.org>
> ---
> Changes since v1:
> - new patch
> 
> Not sure if we should add a helper like drm_fb_dma_get_gem_addr(). This
> seems to be the only driver that is using a scatter gather table to pass
> DMA addresses.

The DU can't access memory directly (at least on Gen3 and newer), and
goes through a separate device called VSP that acts as an external DMA
engine (*) and compositor. This is why buffers need to be mapped
manually to the VSP, the GEM helpers would otherwise use the DU struct
device, which isn't correct. I can't use drm_device.dma_dev as the DMA
initiator can be different per CRTC.

I don't think a separate helper with a single user would be very useful
here, especially given that part of the logic in
drm_fb_dma_get_gem_addr() is in the separate vsp1 driver. Refactoring
may get messy, for little benefit.

* And in some cases the VSP further delegates memory access to the FCP,
which is yet another DMA initiator from an IOMMU point of view.

> ---
>  drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c | 12 +++++++++---
>  1 file changed, 9 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> index 94c22d2db197..6a62608ee3a9 100644
> --- a/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> +++ b/drivers/gpu/drm/renesas/rcar-du/rcar_du_vsp.c
> @@ -291,10 +291,16 @@ int rcar_du_vsp_map_fb(struct rcar_du_vsp *vsp, struct drm_framebuffer *fb,
>  				dst = sg_next(dst);
>  			}
>  		} else {
> -			ret = dma_get_sgtable(rcdu->dev, sgt, gem->vaddr,
> -					      gem->dma_addr, gem->base.size);

Did you compile the patch ? The rcdu variable is now unused. Apart from
that, it compiles fine and seems to operate as expected.

> -			if (ret)
> +			struct sg_table *ret_sgt;
> +
> +			ret_sgt = drm_gem_dma_get_sg_table(gem);
> +			if (IS_ERR(ret_sgt)) {
> +				ret = PTR_ERR(ret_sgt);
>  				goto fail;
> +			}
> +
> +			memcpy(sgt, ret_sgt, sizeof(*sgt));
> +			kfree(ret_sgt);

It's a bit of a shame to kmalloc() a new sg_table and free it right
after :-/ Would it be that bad to switch to dma_get_sgtable_attrs()
here, and pass gem->dma_attrs to the function ?

>  		}
>  
>  		ret = vsp1_du_map_sg(vsp->vsp, sgt);

-- 
Regards,

Laurent Pinchart

