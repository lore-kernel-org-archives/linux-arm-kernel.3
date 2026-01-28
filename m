Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F1C8D25B49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:03:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=4nvc+pydWlG+ByU1K8wA2I0Rv4yvPCWceiLESRqeQZM=; b=fSC/eWsDvy3/Go49ldmNph2bOf
	nKAusrQsTi2/VEIO0oZG/6+xV5XpX1j0/jRNHSiMSYn39jfMjb7f9e06+lCACWNpFmefNA55g84Qp
	1X2S/uWa33XBD7Lr+YY22f042Y6O69jN1MkukffHXg0IQHzYwV4Qzzxlu4HtA8kJdA3BRPQlV7HSp
	A/Dqes0LsdQoqJhVJuK0waac51CtRuB1EqFTnAr3Sy5hDyQ+kjV9H6xPxPlq7qOBrZnjQPj9tZngL
	QxH5SfN+LFjGUDIFReGNhlm0SOhwKVcAqlrAbORxXOUJ2eeA94XZEqSmjG8I6oVUBUw0AvTi6QO+a
	2xciHTzg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4Gl-0000000Fy7D-1hCd;
	Wed, 28 Jan 2026 12:03:35 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4Gi-0000000Fy6a-2Bvd
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 12:03:33 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2F68C581;
	Wed, 28 Jan 2026 13:02:54 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769601774;
	bh=/GfavJ8zWUnbFDEBfOg9iYDhcUsNy+bGd1TdqvP1x/s=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=lAvNefmNlB46gPMR/YZL9wyF73LFutIaPvHfsr4g+hXaUuRY01vHaI/+4LKNZ0gO+
	 5oXnDLbd4JRkidnuyThhPsbZ9HNxQKTd4juOkBJIwwSj8XkBTsnWnxyC5Dwq8nFM7M
	 agdbjdgQ77uaxhtsJyS3wuhuPX6qXZiYRGa+dqXw=
Date: Wed, 28 Jan 2026 14:03:29 +0200
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
	Pekka Paalanen <ppaalanen@gmail.com>
Subject: Re: [PATCH v7 05/11] drm/fourcc: Add DRM_FORMAT_X403
Message-ID: <20260128120329.GH2558360@killaraus>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
 <20251201-xilinx-formats-v7-5-1e1558adfefc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201-xilinx-formats-v7-5-1e1558adfefc@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_040332_699551_B759E4C0 
X-CRM114-Status: GOOD (  15.64  )
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

On Mon, Dec 01, 2025 at 02:18:47PM +0200, Tomi Valkeinen wrote:
> Add X403, a 3 plane 10 bits per component non-subsampled YCbCr format.

This makes me wish for a X509 format, for maximum confusion :-)

> Reviewed-by: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 9 +++++++++
>  2 files changed, 12 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index 0d222f6c1a30..ab643dedd6d4 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -391,6 +391,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
>  		{ .format = DRM_FORMAT_Y10_P32,		.depth = 0,  .num_planes = 1,
>  		  .char_per_block = { 4, 0, 0 }, .block_w = { 3, 0, 0 }, .block_h = { 1, 0, 0 },
>  		  .hsub = 1, .vsub = 1, .is_yuv = true },
> +		{ .format = DRM_FORMAT_X403,		.depth = 0,  .num_planes = 3,
> +		  .char_per_block = { 4, 4, 4 }, .block_w = { 3, 3, 3 }, .block_h = { 1, 1, 1 },
> +		  .hsub = 1, .vsub = 1, .is_yuv = true },
>  	};
>  
>  	unsigned int i;
> diff --git a/include/uapi/drm/drm_fourcc.h b/include/uapi/drm/drm_fourcc.h
> index 0fd99ae32a06..abe6af8b5ac4 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -403,6 +403,15 @@ extern "C" {
>   */
>  #define DRM_FORMAT_Q401		fourcc_code('Q', '4', '0', '1')
>  
> +/*
> + * 3 plane non-subsampled (444) YCbCr
> + * 10 bpc, 30 bits per sample image data in a single contiguous buffer.
> + * index 0: Y plane,  [31:0] x:Y2:Y1:Y0    [2:10:10:10] little endian
> + * index 1: Cb plane, [31:0] x:Cb2:Cb1:Cb0 [2:10:10:10] little endian
> + * index 2: Cr plane, [31:0] x:Cr2:Cr1:Cr0 [2:10:10:10] little endian
> + */
> +#define DRM_FORMAT_X403		fourcc_code('X', '4', '0', '3')
> +
>  /*
>   * 3 plane YCbCr LSB aligned
>   * In order to use these formats in a similar fashion to MSB aligned ones
> 

-- 
Regards,

Laurent Pinchart

