Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 81537C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 23:29:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=PY9qEyZ/oEpVhh7Q83T+aXzwh5gGGaaNCJr1muo0Dw8=; b=N2Ge5QuHRBClHBz+9HivB6YlnJ
	VwMJHnerrcjixQNntDc2/iQ7KTmVNx33+McQqJz6hmQ4GEXec1jNY4oN7yPBCTnr03LRS4qcJWH0N
	w8kxkNiP+WBVEfS7Dent83ClAySy/koWxMw/y2EwPj948u6SeR6eaSXFqq5cJ9kzHKbQolnuJ3xCG
	q3Xiwy1JOLojoerq3SdWdzi00f8v2bDqA4oC+ZcMkRTRRe5RxzFr4dMVx8qRDqW2unJmNpM0Hh3Uv
	3KI3CDiW+oGK/r35u9n+r5AfKGvPQGuV09dLEUOgRWNPL5mb6aHuFHEJfBtUoTH6qj/SXnieFN1jb
	OYca5bbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaBe-0000000BVDT-0RVf;
	Thu, 30 Jul 2026 23:29:14 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpaBb-0000000BVD6-1ZEE
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 23:29:12 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 15AF82E9;
	Fri, 31 Jul 2026 01:28:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1785454082;
	bh=TLEybU8RbQkyzN0WI44ggs/PpkN9LN5f3L7RTIkDaCE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XPDvqptmjr2Vs3Mk9GJMVmgUOmiC1ccfBBdVutsxU42TDIh9rxHX/CZiI6ue0GgJ0
	 uwy0M/Li+lNwmJwDdtDe/DTZ72PoemcjvBKc8EWokkIvkrKYftWw0CA9BiXJHjxAa9
	 FIUWdBS8ByjtC7YJOp7Bmy/Trp0LdilrZHD6I0xc=
Date: Fri, 31 Jul 2026 02:29:06 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Christian Hemp <c.hemp@phytec.de>,
	Stefan Riedmueller <s.riedmueller@phytec.de>,
	Jacopo Mondi <jacopo@jmondi.org>,
	Loic Poulain <loic.poulain@oss.qualcomm.com>,
	Bryan O'Donoghue <bod@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Guoniu Zhou <guoniu.zhou@nxp.com>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Robert Chiras <robert.chiras@nxp.com>
Subject: Re: [PATCH v5 4/4] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Message-ID: <20260730232906.GD1600813@killaraus.ideasonboard.com>
References: <20260728-isi-v5-0-1d22ab91602a@oss.nxp.com>
 <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728-isi-v5-4-1d22ab91602a@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_162911_587421_11FD3B7A 
X-CRM114-Status: GOOD (  16.41  )
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

On Tue, Jul 28, 2026 at 02:58:59PM +0800, Guoniu Zhou wrote:
> Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
> BGRX32, RGBX32, ARGB2101010).
> 
> Formats with alpha channel (BGRA32, RGBA32) only support capture as
> ISI ignores alpha bits when reading from memory.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v3:
> - Drop M2M_OUT for ABGR32/BGRA32/RGBA32 as ISI ignores alpha bits (Laurent)
> - Remove Android requirements from commit message as alpha formats
>   cannot be used as M2M input (Laurent)
> - Add Tested-by tag from Laurent Pinchart
> 
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 51 ++++++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index a6e044056762..f45c2aae59ce 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -166,6 +166,57 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  		.color_planes	= 1,
>  		.depth		= { 32 },
>  		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_BGRA32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBA8888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_RGBA32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ABGR8888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_BGRX32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBX888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_RGBX32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_XBGR888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_ARGB2101010,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_A2RGB10,
> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_A2RGB10,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
>  	},
>  	/*
>  	 * RAW formats

-- 
Regards,

Laurent Pinchart

