Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 690D3C44520
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jul 2026 00:21:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MUv4d6nTrngEkqt6Q97Q9K+18CiueXmDwGzKqsrvwL8=; b=QtnT8tGeDoj0ixAy1M2NpxieH6
	ot7rFh+5rdVcTxfu1MzsJPbxUHp580L7DhxdB8awCMEWevUYU+6UVxR6vmOD4Tc3YSXxS4Tse5ypB
	TJniqHGpfA6lxF9s2uPQKFj70e5Q6gU5Y9hUl5uUQOY6W6bWICzDKdq01mzI1cC/mI0gvTA7XWsVf
	FISskwXspJas4eXPYCqkTBbgqNdQxnPIlhMASKaaNicf2+gF7M800CGzqi0pQ2y6XHwC1L149DwuR
	qIqTFG+0rQRFSSi0uMSV6FcvciK7plUUeYubXPfJF8wKB6HbvBoLXWEpYmIpG75kfCEdtTN9W/k4w
	fGc9gGOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyF2-00000008876-3vjw;
	Tue, 21 Jul 2026 00:21:48 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlyEz-0000000886a-23eR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jul 2026 00:21:46 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-70f3-e800--a06.rev.dnainternet.fi [IPv6:2001:14ba:70f3:e800::a06])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 66956517;
	Tue, 21 Jul 2026 02:20:43 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1784593243;
	bh=jJrpOSbeTf34j9iiFEHrzsvZoGTsWVLoBLS5eWxjPqw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wRH/NrkkbXTQKpCZr5joGqIY/jc1bbUUolWjSU06RWrOQFhhgjkqvxOoxVtq53mUs
	 OAkrPlxZK9EID9WZ/d0VCiVQKx/OGV2L2/wqfqUxwPLRbfz6JiTQTMhDF3e5cpUZI8
	 UE1H+hz66YJp6EQMPIqE43ESQAOxty8nvgQxIgts=
Date: Tue, 21 Jul 2026 03:21:41 +0300
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
Subject: Re: [PATCH v2 6/6] media: nxp: imx8-isi: Add additional 32-bit RGB
 format support
Message-ID: <20260721002141.GF50424@killaraus.ideasonboard.com>
References: <20260720-isi-v2-0-45845bc5d4fa@oss.nxp.com>
 <20260720-isi-v2-6-45845bc5d4fa@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260720-isi-v2-6-45845bc5d4fa@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260720_172145_682435_0DAB8E72 
X-CRM114-Status: GOOD (  21.06  )
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

Hi Guoniu, Robert,

Thank you for the patch.

On Mon, Jul 20, 2026 at 11:34:08AM +0800, Guoniu Zhou wrote:
> Add support for additional 32-bit RGB pixel formats (BGRA32, RGBA32,
> BGRX32, RGBX32, ARGB2101010) and extend existing ABGR32 format with
> full memory-to-memory capabilities to meet Android requirements.

What are those Android requirements ?

> All formats support capture, M2M input, and M2M output operations,
> enabling complete format conversion pipelines.
> 
> Signed-off-by: Robert Chiras <robert.chiras@nxp.com>
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
> Changes in v2:
> - Add Reviewed-by tag from Frank Li
> ---
>  .../media/platform/nxp/imx8-isi/imx8-isi-video.c   | 59 +++++++++++++++++++++-
>  1 file changed, 58 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> index 05b51b98344b..ef638af350fe 100644
> --- a/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> +++ b/drivers/media/platform/nxp/imx8-isi/imx8-isi-video.c
> @@ -160,12 +160,69 @@ static const struct mxc_isi_format_info mxc_isi_formats[] = {
>  	}, {
>  		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
>  		.fourcc		= V4L2_PIX_FMT_ABGR32,
> -		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_CAP,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XRGB8,

This doesn't seem right. The value is the same as for
V4L2_PIX_FMT_XBGR32. As far as I understand, the ISI will ignore the
alpha bits (MSBs in the 32-bit data).

This is why the V4L2_PIX_FMT_ABGR32 format doesn't set
MXC_ISI_VIDEO_M2M_OUT: to be supported as an output format (input to the
ISI), we would need a hardware mode where the alpha bits are read from
memory and used by the ISI. I recommend dropping this part of the patch.

>  		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_ARGB8888,
>  		.mem_planes	= 1,
>  		.color_planes	= 1,
>  		.depth		= { 32 },
>  		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_BGRA32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_RGBX8,

Same comment here, this format should not have MXC_ISI_VIDEO_M2M_OUT
set.

> +		.isi_out_format	= CHNL_IMG_CTRL_FORMAT_RGBA8888,
> +		.mem_planes	= 1,
> +		.color_planes	= 1,
> +		.depth		= { 32 },
> +		.encoding	= MXC_ISI_ENC_RGB,
> +	}, {
> +		.mbus_code	= MEDIA_BUS_FMT_RGB888_1X24,
> +		.fourcc		= V4L2_PIX_FMT_RGBA32,
> +		.type		= MXC_ISI_VIDEO_CAP | MXC_ISI_VIDEO_M2M_OUT
> +				| MXC_ISI_VIDEO_M2M_CAP,
> +		.isi_in_format	= CHNL_MEM_RD_CTRL_IMG_TYPE_XBGR8,

Same here too.

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

The rest looks good. I have tested all the new formats, both on the
input and output side, and have not noticed any issue.

Tested-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

>  	},
>  	/*
>  	 * RAW formats

-- 
Regards,

Laurent Pinchart

