Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A286CC021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 20:54:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8VHHctxtqJDiAfENDzOCWpJ28xgZ3N9kkGyZ7EcS4JM=; b=P7xxsNMWOpwAhSHQsxDPD4mQD4
	UV75H6YUVMNkjm35CSgBe5ozH0yPBeEOn6EQ4iB5XzHBEjBQmgK2wx8AqBSiY72r/LEJ517q2nnCG
	XyGyQTIFeMHOXhzWovudK0hrWQPWK5QNS3036tvOibMKe43Uv9HrNQF1WgSafygcav7UR5YRrs55Q
	x4sylKaqO8JHysHdXd2mFrNeYgImmshb4c+HzarJwq6Uj30Dss7cqm1trxrJ3ybcg17a9ElfEjEBT
	LVB18XhpgAoVBnr+8aidcnXqoqp+edFQq4n0lzjti6YiSjlry20QHZSljjw4sBcOouTW5dCw2OcAN
	kBICW4Gg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tigEN-0000000CcP9-0LH3;
	Thu, 13 Feb 2025 20:54:43 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigCm-0000000CcCO-2JDg
	for linux-arm-kernel@bombadil.infradead.org;
	Thu, 13 Feb 2025 20:53:04 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=8VHHctxtqJDiAfENDzOCWpJ28xgZ3N9kkGyZ7EcS4JM=; b=PYEy1LD0ILwVhnGouDLbIVRXhk
	vvhAC9qKZoA7TFNbDrXl9VH9PZItGgWXBh8NrOnZCdua7lyf48h5iDHiwezeEzBWxIABRqwXXe15T
	e8FnYT/qP3DBpDH4I6qHE+mmzhOWcBkzm7DCKEzOJr9afgB99C1leuEYpxa0MghC8ee5YROkH9gsE
	WJr5+jcx5KBg9q2qrDXOshSBypE7vZgNsPZZnqcuPlUvyhjYVwN/8Qb7JKUPdZOldPd84ewmBdx67
	PG1buo9iZt3enF7A7UU25q2e05YQESxYeshbpM24IhOCmREXU8DS4wUs0LYrlvtfD5OcgRQd5fEPz
	m0u4qybg==;
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tigCj-000000016Iz-36y1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 20:53:03 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 06597166A;
	Thu, 13 Feb 2025 21:44:41 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1739479482;
	bh=OGxeZxl9MlwMBKkNj3NJO7s7b1UlFvhoi6keYgIvf9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ioaBjtSc7MDjGl3dQR4Kx1hSh/TmsnvJdmvkucmS7hSHcLNjqz6y9wJXSQNQp2RWW
	 EmEtkCGUsvGEvw8rIONwKz2DREMybjg7g5d/hB+VODfHp8ReodmB1ydGjGLuW/K3l1
	 yCpN7crRSLCe7EELvwuZMOAgOK1HLKawU20L2xCo=
Date: Thu, 13 Feb 2025 22:45:49 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
Cc: Vishal Sagar <vishal.sagar@amd.com>,
	Anatoliy Klymenko <anatoliy.klymenko@amd.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Maxime Ripard <mripard@kernel.org>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Michal Simek <michal.simek@amd.com>,
	dri-devel@lists.freedesktop.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	Geert Uytterhoeven <geert@linux-m68k.org>
Subject: Re: [PATCH v3 07/11] drm: xlnx: zynqmp: Use drm helpers when
 calculating buffer sizes
Message-ID: <20250213204549.GC22998@pendragon.ideasonboard.com>
References: <20250212-xilinx-formats-v3-0-90d0fe106995@ideasonboard.com>
 <20250212-xilinx-formats-v3-7-90d0fe106995@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250212-xilinx-formats-v3-7-90d0fe106995@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_205301_879468_8F43E289 
X-CRM114-Status: GOOD (  18.15  )
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

Hi Tomi,

Thank you for the patch.

On Wed, Feb 12, 2025 at 04:56:11PM +0200, Tomi Valkeinen wrote:
> Use drm helpers, drm_format_info_plane_width(),
> drm_format_info_plane_height() and drm_format_info_min_pitch() to
> calculate sizes for the DMA.
> 
> This cleans up the code, but also makes it possible to support more
> complex formats (like XV15, XV20).
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/xlnx/zynqmp_disp.c | 8 +++++---
>  1 file changed, 5 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/gpu/drm/xlnx/zynqmp_disp.c b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> index 80d1e499a18d..3d4ade571f0f 100644
> --- a/drivers/gpu/drm/xlnx/zynqmp_disp.c
> +++ b/drivers/gpu/drm/xlnx/zynqmp_disp.c
> @@ -1116,16 +1116,18 @@ int zynqmp_disp_layer_update(struct zynqmp_disp_layer *layer,
>  		return 0;
>  
>  	for (i = 0; i < info->num_planes; i++) {
> -		unsigned int width = state->crtc_w / (i ? info->hsub : 1);
> -		unsigned int height = state->crtc_h / (i ? info->vsub : 1);
>  		struct zynqmp_disp_layer_dma *dma = &layer->dmas[i];
>  		struct dma_async_tx_descriptor *desc;
> +		unsigned int width, height;

I'd got with one variable per line.

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  		dma_addr_t dma_addr;
>  
> +		width = drm_format_info_plane_width(info, state->crtc_w, i);
> +		height = drm_format_info_plane_height(info, state->crtc_h, i);
> +
>  		dma_addr = drm_fb_dma_get_gem_addr(state->fb, state, i);
>  
>  		dma->xt.numf = height;
> -		dma->sgl.size = width * info->cpp[i];
> +		dma->sgl.size = drm_format_info_min_pitch(info, i, width);
>  		dma->sgl.icg = state->fb->pitches[i] - dma->sgl.size;
>  		dma->xt.src_start = dma_addr;
>  		dma->xt.frame_size = 1;

-- 
Regards,

Laurent Pinchart

