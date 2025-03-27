Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CD0F2C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 22:56:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HoWfIZfePHN5e2dIOjgpN+HfXNANb2to+dC9uAiJe6I=; b=Hln3B6cLvTEF2z+80QZWq1KnWx
	Tpf//NufNaYXRk0QL2iWxW8GU5WOeLuxeJN5FzgZo6FPiQYzG8wxZmTcTNHjKJYhafnU+1rPzJQZp
	fDZXfRQDy4EZhNE6gqP6534SJzAYIgnr7xWGnCCSydkTRtGjpEftGzQV0B39n6tG6FpunkzcTl3FM
	ENO7piWGCf6LDDb4rOr9Oig8/+Q3anY/L92+YKAZzRY0AktbdFxjy1v8KpwOwSlOaZz1aIpLg2+Rb
	MxDTFd5yP2S2NbiaTM/vldMLRxtfKPnP44leKCmaZtySc7CuQOh1q1dIVo9uhKQ6FI4eOpTJUXt/r
	ELkq7MhA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txw8v-0000000CBZd-0NI3;
	Thu, 27 Mar 2025 22:56:09 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txw6q-0000000CBNQ-4BW1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 22:54:02 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 10D7E446;
	Thu, 27 Mar 2025 23:52:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743115931;
	bh=fiZK4FTkrTpRByJQSa2cqFJPbfgsTtrs1aKW2apm0Z8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pzYB38MXvQZ0EGPoQEEuRvTmoX4gRFHyy3p2dISb16n6o75DSfpz2z9l+JCvhAKrT
	 7JsbK56ZztyOjVqQSe82bEsSuS2V7XIvoEbH7jWH+0tmhi+d/mZtbByp8fvgSq2Te9
	 /blLq7eKaXSOp83Zuughytr1hGHvBdyEWMPqGbJQ=
Date: Fri, 28 Mar 2025 00:53:37 +0200
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
	Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
Subject: Re: [PATCH v4 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
Message-ID: <20250327225337.GC16629@pendragon.ideasonboard.com>
References: <20250326-xilinx-formats-v4-0-322a300c6d72@ideasonboard.com>
 <20250326-xilinx-formats-v4-4-322a300c6d72@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250326-xilinx-formats-v4-4-322a300c6d72@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_155401_173523_ED5169F8 
X-CRM114-Status: GOOD (  16.29  )
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

On Wed, Mar 26, 2025 at 03:22:47PM +0200, Tomi Valkeinen wrote:
> Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
> 32-bit container.
> 
> The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
> packed, A - 10 (as in 0xA), 4 - 4 bytes.
> 
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 355aaf7b5e9e..e5f04f7ec164 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -353,6 +353,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_XV20,		.depth = 0,  .num_planes = 2,
>  		  .char_per_block = { 4, 8, 0 }, .block_w = { 3, 3, 0 }, .block_h = { 1, 1, 0 },
>  		  .hsub = 2, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
> +		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true },
>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 751b8087b35f..f6316adbeb97 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -408,6 +408,7 @@ extern "C" {
>  /* Greyscale formats */
>  
>  #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> +#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
>  
>  /*
>   * Format Modifiers:

-- 
Regards,

Laurent Pinchart

