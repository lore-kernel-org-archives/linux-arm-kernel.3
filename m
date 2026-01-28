Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40CE6D25B48
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 11:49:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2Wfwd4ogTgl4DnsM13zVZopRhXqibquoW/vrOHj/oIE=; b=Q5hVvXfhQzW3ZAZp7UArXpQe00
	K9w1Vv5Ys6n44PSdzWNCA36R6TP9UHe5R+xjy53O3K4ZJQaJkNNpD5YiUJWNIn4hxIVb8WW+CVLU2
	WZTtk5+M8vyXEevdK59woOtEyppv3B4JoQmWnUvCV3rJilDQGXKHRcr+OD8aqYj8Gp9jHvP+GAa2S
	gxLhGl7p2mAwDETr1tJDCo4IdS2Za8pMSrDLXOEc0rKwuYFGS1ME9oiqeRnzroGP2zs1u35fleksL
	JQbGdCqYSHehgfdvd6Ow/54hg3EBUwc6Yo9TIn7LMIxyly0RfYWgl6wO9hGmj1YqO2sRV9Mu2YSPF
	WRr2VB9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl43T-0000000FxLE-3hGw;
	Wed, 28 Jan 2026 11:49:51 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl43Q-0000000FxKr-1nZ9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 11:49:50 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id AE752C6F;
	Wed, 28 Jan 2026 12:49:05 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769600945;
	bh=J5GRkADBM7kHKN0psYa8w2c8cQmmZlbTkq09npe3U8Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Ji62OmoqFXpggqhKXPObU9raamBfIqFvqb8PaDcnivhIVJZqWBp7w5PVnbnYlkc3W
	 4NznQ3zv+AEP4DgFUva9+LXeYK8sZz1PahE875MELTQRFXhf0Mg5fIB0iOFxlay+sb
	 o6uNTEyS8Uv20bY4Gb1wJKovSTTRAKfP7w+9T++E=
Date: Wed, 28 Jan 2026 13:49:41 +0200
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
	Geert Uytterhoeven <geert@linux-m68k.org>,
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>,
	Pekka Paalanen <ppaalanen@gmail.com>,
	Pekka Paalanen <pekka.paalanen@collabora.com>,
	Dmitry Baryshkov <lumag@kernel.org>
Subject: Re: [PATCH v7 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20260128114941.GF2558360@killaraus>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
 <20251201-xilinx-formats-v7-3-1e1558adfefc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201-xilinx-formats-v7-3-1e1558adfefc@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_034948_946747_19D2D6E4 
X-CRM114-Status: GOOD (  18.38  )
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

On Mon, Dec 01, 2025 at 02:18:45PM +0200, Tomi Valkeinen wrote:
> Add greyscale Y8 format.

I would explain here why we need a new format and can't just use
DRM_FORMAT_R8. You don't need to convince me, but I think it's important
to summarize the rationale should someone later wonder why we introduced
this.

> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  |  1 +
>  include/uapi/drm/drm_fourcc.h | 10 ++++++++++
>  2 files changed, 11 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index b22ef86428a1..a39b9d7a5b62 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -275,6 +275,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
>  		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
>  		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
>  		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 6c786701238e..5cfc188c4e72 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -459,6 +459,16 @@ extern "C" {
>  #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
>  
> +/*
> + * Y-only (greyscale) formats
> + *
> + * The Y-only formats are handled similarly to the YCbCr formats in the display
> + * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
> + * also means that COLOR_RANGE property applies to the Y-only formats.
> + *

Extra blank line.

> + */
> +
> +#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */

I would have gone for 'Y', '8', ' ', ' '

>  
>  /*
>   * Format Modifiers:

-- 
Regards,

Laurent Pinchart

