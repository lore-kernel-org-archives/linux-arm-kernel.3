Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6DA13CC6B2D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 21:56:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qmJA5oweHf7y7LUm/IEEoB8DMBJEwZzzWuhG/f1dqCA=; b=yTCyGbxejrvfN4AiympgufS+qT
	kYi/mJYMHyWWTMmPHahLC9cEdHwodkAdCwMbXzC5HFD76iAzeC7w89HNSDTBVcaV/TCGz3YtEEJgE
	MEs7kDrmrAZzUsR8c/Yj8uaIhPiqgjB/WHh3iYIvmG0958HYqh9zWuR/olybIoW4qRN3kbTMub02j
	WsjsxK8QQ9L9r+qeX2ek1hTbRU3y/mWX2H1hXOUCzpb4wrNwd/pAggXVY5X5Z4I0C7UYkdepwolUm
	ONz91KGBRHJi2viZ9k6VkG6O69OFdSRc78Z4Q2/som3WsxQLo1OXngrjScmWdP/tHMrE+O49kLb+j
	ZXGkVMBg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6xL-0000000GNxo-3vM6;
	Wed, 14 Oct 2026 21:56:15 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xH6xI-0000000GNws-38AX
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 21:56:14 +0000
Received: from killaraus.ideasonboard.com (unknown [80.155.15.37])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id C9315BC;
	Wed, 14 Oct 2026 23:54:04 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1792014844;
	bh=7uB7pWYKGkJ0kAF2Aw86BM8RV0dxWrCfnl6W2JEIN6U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=wTGgkj5PBvgb9lbmG/k+vWjnOOQZfx0fifY2n9Ijxa25iE3w+SRFGs9paNrdWdGFh
	 T0ygxjOr2Mr09vZ/EuS3/MfpXZcqeabDEWT4OV/P9HnjRzkr0R91b7hM/XwNZpU65R
	 nCmPkFuYzDSzuD5q4vkJrmD700UyWdrKBNEvD+io=
Date: Wed, 14 Oct 2026 23:56:06 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: guoniu.zhou@oss.nxp.com
Cc: Frank Li <Frank.Li@nxp.com>,
	Martin Kepplinger-Novakovic <martink@posteo.de>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Purism Kernel Team <kernel@puri.sm>,
	Bryan O'Donoghue <bod@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev,
	linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH] media: imx-mipi-csis: add support for
 MEDIA_BUS_FMT_YUYV8_1X16
Message-ID: <20261014215606.GB283442@killaraus.ideasonboard.com>
References: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261009-csis_sam-v1-1-81f2b0fb76ef@oss.nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20261014_145613_264824_B337105E 
X-CRM114-Status: GOOD (  17.91  )
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

Hello Guoniu,

Thank you for the patch.

On Fri, Oct 09, 2026 at 06:58:41PM +0800, guoniu.zhou@oss.nxp.com wrote:
> From: Alice Yuan <alice.yuan@nxp.com>
> 
> Add MEDIA_BUS_FMT_YUYV8_1X16 to the list of supported bus formats.
> 
> The format uses the same CSI-2 YUV422 8-bit data type and 16-bit
> parallel bus width as MEDIA_BUS_FMT_UYVY8_1X16, but with a different
> component ordering. Supporting YUYV allows sensors and bridge devices
> that output YUYV formatted YUV422 data to be used with the i.MX MIPI
> CSIS driver without requiring format conversion.

What sensor(s) do you have in mind ? CSI-2 does not support other
component orderings, the YUV4222_8B data type specifies the ordering on
the bus as [U1, Y1, V1, Y2], and V4L2 maps that to
MEDIA_BUS_FMT_UYVY8_1X16.

> Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
> ---
>  drivers/media/platform/nxp/imx-mipi-csis.c | 5 +++++
>  1 file changed, 5 insertions(+)
> 
> diff --git a/drivers/media/platform/nxp/imx-mipi-csis.c b/drivers/media/platform/nxp/imx-mipi-csis.c
> index 5f9691d76434..14a00b9fcedf 100644
> --- a/drivers/media/platform/nxp/imx-mipi-csis.c
> +++ b/drivers/media/platform/nxp/imx-mipi-csis.c
> @@ -382,6 +382,11 @@ static const struct csis_pix_format mipi_csis_formats[] = {
>  		.output = MEDIA_BUS_FMT_UYVY8_1X16,
>  		.data_type = MIPI_CSI2_DT_YUV422_8B,
>  		.width = 16,
> +	}, {
> +		.code = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.output = MEDIA_BUS_FMT_YUYV8_1X16,
> +		.data_type = MIPI_CSI2_DT_YUV422_8B,
> +		.width = 16,
>  	},
>  	/* RGB formats. */
>  	{
> 
> ---
> base-commit: b38d06ad1e13c32970d58039c154f009b81a3368
> change-id: 20261009-csis_sam-c5c10ed12322

-- 
Regards,

Laurent Pinchart

