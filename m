Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3508ED46BEB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 18:10:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=22737vEqJIo0+l4bZ1S/hk/JFp5B/wycNWGrVq0NO+s=; b=SAmaCW1jURkLlxjOWevlppfS4O
	zhyzM5mlG//UAMBNi0X5wXd12S92JldTeTlzHTYBXtdckKD6loePg2uyMyoySmAPdDNW6EEXDkm19
	9ZOry2nkMzYX7nAfekk0mdn11kcMCl2SMCL+y7Ys/7P25EB4NgShfX7p3j6+8eFzXXYHj1krJVK2H
	zLRFTQb1bTL4mS4YQ/xLfpTQzYcZV6m/LIXYrzTUl3etfUn86Utb0cGq3XkOnVWOJW1v1yBIeRB8S
	C0+GbAdyikmUBLCTjVzS9PjsMSilODdkEkMwLX5fMs5zqL0Cwpu+O4KRaH2G99/T9j847CR8W4bQb
	4hhi7pVA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vlA03-0000000GbDl-37u7;
	Wed, 28 Jan 2026 18:10:43 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl9zz-0000000GbD3-2MAA
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 18:10:43 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 64752581;
	Wed, 28 Jan 2026 19:10:00 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769623800;
	bh=DJDOdIFvJ35ng6Ss7jpNp+I4hfOTBmI0yhLVXDrDUf0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tmLPDZoivpwL2F0XqQHJRCtr8n4D1+fGg86jSBoMivWlq19+STaTEKZdQGJbYhc2F
	 gDYdHbPUgZ2wj/C9YZeKYZba44cbDMt07v88KUd6yzUG22f+VnK9AOEa1L+Sdg/en4
	 CRBcGy0btV1ewfO5neFeai+bprFxdIHpIAt7oNik=
Date: Wed, 28 Jan 2026 20:10:35 +0200
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
Subject: Re: [PATCH v8 03/11] drm/fourcc: Add DRM_FORMAT_Y8
Message-ID: <20260128181035.GD3225981@killaraus>
References: <20260128-xilinx-formats-v8-0-9ea8adb70269@ideasonboard.com>
 <20260128-xilinx-formats-v8-3-9ea8adb70269@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260128-xilinx-formats-v8-3-9ea8adb70269@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_101039_736856_F188672D 
X-CRM114-Status: GOOD (  19.17  )
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

On Wed, Jan 28, 2026 at 07:25:28PM +0200, Tomi Valkeinen wrote:
> Add greyscale Y8 format.
> 
> The 8-bit greyscale format has been discussed before, and the earlier
> guidance was to use DRM_FORMAT_R8, as a single-channel 8-bit pixel.
> 
> However, adding DRM_FORMAT_Y8 makes sense, we can mark it as 'is_yuv' in
> the drm_format_info, and this can help the drivers handle e.g.
> full/limited range. This will distinguish two single-channel formats:
> R8, which is a RGB format with the same value for all components, and
> Y8, which is a Y-only YCbCr format, with Cb and Cr being neutral.
> 
> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_fourcc.c  | 1 +
>  include/uapi/drm/drm_fourcc.h | 9 +++++++++
>  2 files changed, 10 insertions(+)
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
> index 6c786701238e..e4451668499a 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -459,6 +459,15 @@ extern "C" {
>  #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
>  
> +/*
> + * Y-only (greyscale) formats
> + *
> + * The Y-only formats are handled similarly to the YCbCr formats in the display
> + * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
> + * also means that COLOR_RANGE property applies to the Y-only formats.
> + */
> +
> +#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
>  
>  /*
>   * Format Modifiers:

-- 
Regards,

Laurent Pinchart

