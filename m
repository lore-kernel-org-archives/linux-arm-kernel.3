Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3CFFD25B49
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Jan 2026 12:02:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XlbXizwhVaP358vV8JC2bHgWyrek0AH68jcxjmmKu3A=; b=Ni0F7eGyO9Yd/3jHWz/NmYumLk
	lwCXO7ENCrPkfTK+42+cZ4SK4SrQnCbK83mBw9GxMom1E1DjWnLW1z/LBTifovmTXY3RUkiuvf7lK
	RE06JtLKfQFWRlfKKLzCM0ZlBq1uvl/LOpGCJIDPMCzwL2+jlFzPorLPpQZm++fEXhhY1XaGanZTp
	yg1OOo2SOg754E9m1qfRBOzojiDxz1ssAIJ48F3gk9IgAHhOEN6vBaYG80j2bF1ivHgQnWt6QDxHh
	fg7NTKSbN5bR/a7B5jboo6z8j71Qe5EZJ5Dl4S6wNlv8/azlaxs8IL6WdmZyEKbzI4JMg3286TDe5
	gDaXDwyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4Fc-0000000Fxzc-2GtK;
	Wed, 28 Jan 2026 12:02:24 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vl4Fa-0000000FxzG-1Dvj
	for linux-arm-kernel@lists.infradead.org;
	Wed, 28 Jan 2026 12:02:23 +0000
Received: from pendragon.ideasonboard.com (2001-14ba-703d-e500--2a1.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::2a1])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 2B5E8581;
	Wed, 28 Jan 2026 13:01:43 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1769601703;
	bh=jcpAdFW8m2DWGJ4WfifcR7DYUonhKwmr4xe7E6D6YHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=X8cv1/nq70IPREvnbg4dc+s7r2XTBANiSLpC4GBcr1k21qqIW5mUSVtamI6Dwo14Y
	 zMOxw/0rEwUWOTPhv67kM8uMD7yDF7RjVCwUCYzuCnQE5mb/3BZZ4gF8XpZ8adeKEa
	 fiUsohguM1pPIHuyDKNC8VCProOF1au9HQ6GZHb4=
Date: Wed, 28 Jan 2026 14:02:18 +0200
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
	Pekka Paalanen <pekka.paalanen@collabora.com>
Subject: Re: [PATCH v7 04/11] drm/fourcc: Add DRM_FORMAT_Y10_P32
Message-ID: <20260128120218.GG2558360@killaraus>
References: <20251201-xilinx-formats-v7-0-1e1558adfefc@ideasonboard.com>
 <20251201-xilinx-formats-v7-4-1e1558adfefc@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251201-xilinx-formats-v7-4-1e1558adfefc@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260128_040222_494402_9A03DDE0 
X-CRM114-Status: GOOD (  15.22  )
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

On Mon, Dec 01, 2025 at 02:18:46PM +0200, Tomi Valkeinen wrote:
> Add Y10_P32, a 10 bit greyscale format, with 3 pixels packed into
> 32-bit container.
> 
> The fourcc for the format is 'YPA4', which comes from Y - Y only, P -
> packed, A - 10 (as in 0xA), 4 - 4 bytes.
> 
> Reviewed-by: Vishal Sagar <vishal.sagar@amd.com>
> Reviewed-by: Pekka Paalanen <pekka.paalanen@collabora.com>
> Signed-off-by: Tomi Valkeinen <tomi.valkeinen@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  drivers/gpu/drm/drm_fourcc.c  | 3 +++
>  include/uapi/drm/drm_fourcc.h | 1 +
>  2 files changed, 4 insertions(+)
> 
> diff --git a/drivers/gpu/drm/drm_fourcc.c b/drivers/gpu/drm/drm_fourcc.c
> index a39b9d7a5b62..0d222f6c1a30 100644
> --- a/drivers/gpu/drm/drm_fourcc.c
> +++ b/drivers/gpu/drm/drm_fourcc.c
> @@ -388,6 +388,9 @@ const struct drm_format_info *__drm_format_info(u32 format)
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
> index 5cfc188c4e72..0fd99ae32a06 100644
> --- a/include/uapi/drm/drm_fourcc.h
> +++ b/include/uapi/drm/drm_fourcc.h
> @@ -469,6 +469,7 @@ extern "C" {
>   */
>  
>  #define DRM_FORMAT_Y8		fourcc_code('G', 'R', 'E', 'Y')  /* 8-bit Y-only */
> +#define DRM_FORMAT_Y10_P32	fourcc_code('Y', 'P', 'A', '4')  /* [31:0] x:Y2:Y1:Y0 2:10:10:10 little endian */
>  
>  /*
>   * Format Modifiers:

-- 
Regards,

Laurent Pinchart

