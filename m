Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6179C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 22:37:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/Je1rmKj+gVceKWBgE8QTFhjSBJmV/KG1VI1qSaRf4=; b=D7z3sA8xshyNqMPv1ysMPvAyly
	6tLaljrBqP1qspgRc3JjCqolTEr2bXU31D0rn2XfnWm5mcjxjh7o2fJe0+xh/JLnBSxiSvJF6OAmj
	tyvx+l/xh38nI5/cTxNcp2R9jGBNHeYruqbJBmgddd9rl4a0aqfjQyaGzwjjG67CI3FywZeZ4WFbV
	Q8OCvZCr0SXuTgOmEEhCb/Tx/vIWlFgt3/vuv22SSeFXvJg7sDcUY/JujtR/lJ0JPSKcZxuF8eoEk
	3jXXrrBHdt+Bw1w5eOeDWBsBNJoE/B9VKJtp54KvvxFK54727vShHRrfXxVYX/gwu4Vfhy005j4Yf
	4VsjocEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvqS-0000000C9wg-1AAm;
	Thu, 27 Mar 2025 22:37:04 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txvoi-0000000C9oG-0f03
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 22:35:17 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 77CF9446;
	Thu, 27 Mar 2025 23:33:23 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743114803;
	bh=SaJOk6M4y4yQuYGOGvlYpvYsC/4YT1F7z+qnV1nCrQs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RSByoPiOsIOgZeWaXOPH8jRhYyw712i8uC2SHV03xtZefNxXYg9irW9s70kPYDDbl
	 RV3qkz2EECH8+QysvoGNn6LovnTOZNzwtdlJ4qdgd/2368kb2WJKFjwz7YsYOF1p2e
	 iOe/FUKru50IZUoECNnLSyKXDyDmczuME5UX8YW0=
Date: Fri, 28 Mar 2025 00:34:49 +0200
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
	Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
Subject: Re: [PATCH v4 02/11] drm/fourcc: Add DRM_FORMAT_XV15/XV20
Message-ID: <20250327223449.GA16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-2-322a300c6d72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-2-322a300c6d72@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_153516_337698_F8750B19 
X-CRM114-Status: GOOD (  21.55  )
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

On Wed, Mar 26, 2025 at 03:22:45PM +0200, Tomi Valkeinen wrote:
> Add two new pixel formats:
> 
> DRM_FORMAT_XV15 ("XV15")
> DRM_FORMAT_XV20 ("XV20")
> 
> The formats are 2 plane 10 bit per component YCbCr, with the XV15 2x2
> subsampled whereas XV20 is 2x1 subsampled.
> 
> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@linaro.org>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>
> ---
>  drivers/gpu/drm/drm_fourcc.c  | 6 ++++++
>  include/uapi/drm/drm_fourcc.h | 8 ++++++++
>  2 files changed, 14 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 2f5781f5dcda..e101d1b99aeb 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -346,6 +346,12 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_P030,            .depth = 0,  .num_planes = 2,
>  		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>  		  .hsub = 2, .vsub = 2, .is_yuv = true},
> +		{ .format = DRM_FORMAT_XV15,		.depth = 0,  .num_planes = 2,
> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> +		  .hsub = 2, .vsub = 2, .is_yuv = true },
> +		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
> +		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
> +		  .hsub = 2, .vsub = 1, .is_yuv = true },

It appears we can never have too much (or enough) documentation, as
reading the format info documentation leaves me with unanswered
questions.

Looking at drm_format_info_min_pitch():

uint64_t drm_format_info_min_pitch(const struct drm_format_info *info,
				   int plane, unsigned int buffer_width)
{
	if (!info || plane < 0 || plane >= info->num_planes)
		return 0;

	return DIV_ROUND_UP_ULL((u64)buffer_width * info->char_per_block[plane],
			    drm_format_info_block_width(info, plane) *
			    drm_format_info_block_height(info, plane));
}

For the first plane, the function will return `buffer_width * 4 / 3`
(rouding up), which I think is right. For the second plane, it will
return `buffer_width * 8 / 3`, which I believe is wrong as the format is
subsampled by a factor 2 horizontally. It seems that either
char_per_block and block_w need to take horizontal subsampling into
account (and therefore be 8 and 6 for the second plane), or
drm_format_info_min_pitch() should consider .hsub. Or there's something
else I'm missing :-)

>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 81202a50dc9e..1247b814bd66 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -304,6 +304,14 @@ extern "C" {
>  #define DRM_FORMAT_RGB565_A8	fourcc_code('R', '5', 'A', '8')
>  #define DRM_FORMAT_BGR565_A8	fourcc_code('B', '5', 'A', '8')
>  
> +/*
> + * 2 plane 10 bit per component YCrCb
> + * index 0 = Y plane, [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian
> + * index 1 = Cb:Cr plane, [63:0] x:Cr2:Cb2:Cr1:x:Cb1:Cr0:Cb0 2:10:10:10:2:10:10:10 little endian

I believe this is right, but I have a hard time validating it, as I
think the corresponding figures in UG1085 are incorrect (they show a
8bpp format as far as I can tell). Do I assume correctly that you've
tested the formats ?

> + */
> +#define DRM_FORMAT_XV15		fourcc_code('X', 'V', '1', '5') /* 2x2 subsampled Cr:Cb plane 2:10:10:10 */
> +#define DRM_FORMAT_XV20		fourcc_code('X', 'V', '2', '0') /* 2x1 subsampled Cr:Cb plane 2:10:10:10 */
> +
>  /*
>   * 2 plane YCbCr
>   * index 0 = Y plane, [7:0] Y

-- 
Regards,

Laurent Pinchart

