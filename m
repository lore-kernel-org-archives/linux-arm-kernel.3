Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DE68D25B59
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 13:10:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zsLu2aqAREwaP4asuydtaWtPUbn09OM8ueQLK5j9i1s=; b=UV5lZ9dKF1y26/3qmUarxXNtg4
	TBgHjGvRJUI/v/m9nVeGs7fmVCcNsTpTZRazEB3D0sK1nL9d8aTZmenyqJITCCUBzOkih0uG6chDg
	LWSymDdzUbOuFdHff3z0Mv8Ua2WJ6sLT1aaCWVK+4qDGZzlvN3ZjCSNiu/HLkuQhpWH+7kUVH3EDD
	yQvqSE69JJrChwNvfmnGDm8nTieZsww8KjtfDN7Yl9gcvxh4bJr9kmpnyP4LqhYza7rcAOO3HpE28
	1n/Cy1PVYkLuXULR5zMpDrcDQiPcQAFj6j1q5YLAf3a6J4fj71CtbWZbxC/hIu6E5eA9HlCA8ikcx
	42Jk7PtA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Iw-0000000G2UZ-28Gx;
	Wed, 28 Jan 2026 13:09:54 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl5Iu-0000000G2UE-2c1t
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 13:09:53 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id BC45F3A2;
	Wed, 28 Jan 2026 14:09:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769605752;
	bh=eoWm0ODiCGoFxKKdpMxGg0dhmOyGV9mLi7ccTk7hYhI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=d0JE3igs1aAkx8tTKYunUcwa5HGRUqwAaegZobA8/4BagIN//NM+JKH9b33RrPVW7
	 rhHcGFUSMesbBA/XaYoXFoeYsSHV1NeokLyZnK6WtzOV/2kmZshRhZp0p1NLNloOyy
	 OtGCMGgxXwEivE0yu+soTAVK7M+SkWfFHZNkbaCw=
Date: Wed, 28 Jan 2026 15:09:48 +0200
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
Message-ID: <20260128130948.GA3210848@killaraus>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
 <20251201-xilinx-formats-v7-3-1e1558adfefc@ideasonboard.com>
 <20260128114941.GF2558360@killaraus>
 <6bf4347b-ce70-4325-965f-40f81b24a0d1@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <6bf4347b-ce70-4325-965f-40f81b24a0d1@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_050952_802697_74D0CB04 
X-CRM114-Status: GOOD (  31.17  )
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

On Wed, Jan 28, 2026 at 02:31:57PM +0200, Tomi Valkeinen wrote:
> On 28/01/2026 13:49, Laurent Pinchart wrote:
> > On Mon, Dec 01, 2025 at 02:18:45PM +0200, Tomi Valkeinen wrote:
> >> Add greyscale Y8 format.
> > 
> > I would explain here why we need a new format and can't just use
> > DRM_FORMAT_R8. You don't need to convince me, but I think it's important
> > to summarize the rationale should someone later wonder why we introduced
> > this.
> 
> Good point. I can take the text from the cover letter to this commit's
> description.
> 
> Would this be fine:
> 
> ==
> 
> Add greyscale Y8 format.
> 
> The 8-bit greyscale format has been discussed before, and the
> earlier guidance was to use DRM_FORMAT_R8, as a single-channel 8-bit pixel.
> 
> However, adding DRM_FORMAT_Y8 makes sense, as:
> 
> 1) We can mark it as 'is_yuv' in the drm_format_info, and this can help
>    the drivers handle e.g. full/limited range. Probably some hardware
>    handles grayscale as a value used for all RGB components, in which case
>    R8 makes sense, but when the hardware handles the Y-only pixels as YCbCr,
>    where Cb and Cr are "neutral", it makes more sense to consider the
>    format as an YUV format rather than RGB.
> 
> 2) We can have the same fourcc as in v4l2. While not strictly necessary,
>    it's a constant source of confusion when the fourccs differ.

I wouldn't consider that as a goal (see my comment below about the 4CC
value). V4L2 and DRM 4CCs differ, and applications must handle them
separately. Implying we can take shortcuts for a subset of formats will
in my opinion generate more harm than good.

> 3) It (possibly) makes more sense for the user to use Y8/GREY format
>    instead of R8, as, in my experience, the documentation usually refers
>    to gray(scale) format or Y-only format.
> 
> 4) We have other Y-only formats, like the Y10_P32 added in the following
>    patches, with "Y" in the fourcc name.

If those two were the only reasons, I'd tell you to use R8 :-) I would
drop 2-4 and only document 1, that's the real reason.

> >> Acked-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> >> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> >> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> >> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> >> ---
> >>  drivers/gpu/drm/drm_fourcc.c  |  1 +
> >>  include/uapi/drm/drm_fourcc.h | 10 ++++++++++
> >>  2 files changed, 11 insertions(+)
> >>
> >> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> >> index b22ef86428a1..a39b9d7a5b62 100644
> >> --- a/drivers/gpu/drm/drm_fourcc.c
> >> +++ b/drivers/gpu/drm/drm_fourcc.c
> >> @@ -275,6 +275,7 @@ const struct drm_format_info *__drm_format_info(u32 format)
> >>  		{ .format = DRM_FORMAT_YVU422,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_YUV444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_YVU444,		.depth = 0,  .num_planes = 3, .cpp = { 1, 1, 1 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> >> +		{ .format = DRM_FORMAT_Y8,		.depth = 8,  .num_planes = 1, .cpp = { 1, 0, 0 }, .hsub = 1, .vsub = 1, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_NV12,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_NV21,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 2, .is_yuv = true },
> >>  		{ .format = DRM_FORMAT_NV16,		.depth = 0,  .num_planes = 2, .cpp = { 1, 2, 0 }, .hsub = 2, .vsub = 1, .is_yuv = true },
> >> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> >> index 6c786701238e..5cfc188c4e72 100644
> >> --- a/include/uapi/drm/drm_fourcc.h
> >> +++ b/include/uapi/drm/drm_fourcc.h
> >> @@ -459,6 +459,16 @@ extern "C" {
> >>  #define DRM_FORMAT_YUV444	fourcc_code('Y', 'U', '2', '4') /* non-subsampled Cb (1) and Cr (2) planes */
> >>  #define DRM_FORMAT_YVU444	fourcc_code('Y', 'V', '2', '4') /* non-subsampled Cr (1) and Cb (2) planes */
> >>  
> >> +/*
> >> + * Y-only (greyscale) formats
> >> + *
> >> + * The Y-only formats are handled similarly to the YCbCr formats in the display
> >> + * pipeline, with the Cb and Cr implicitly neutral (0.0 in nominal values). This
> >> + * also means that COLOR_RANGE property applies to the Y-only formats.
> >> + *
> > 
> > Extra blank line.
> > 
> >> + */
> >> +
> >> +#define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> > 
> > I would have gone for 'Y', '8', ' ', ' '
> > 
> >>  
> >>  /*
> >>   * Format Modifiers:

-- 
Regards,

Laurent Pinchart

