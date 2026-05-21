Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 28233CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 13:44:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xim5NR10+7BZBfykxOD4Uf3SgtY+xyZHzJ3cjnn/k3g=; b=eH0CrrhudsUooGPUvdQh4Q5Bxb
	Ju5U3VWlkFJyYuKlrCisi/OdekHOrhYqhKZ9K6Wj4AgpdtJ+CTcO9kADh5Xx5e/ODilg3yICWxuRp
	hSsriZtOzAeiqhZKXzR2IayRSqIfibQG9nyaPUrxEyUdM4lPgfqSiBLLgALD2vUe/pallDZjCioP/
	sg4vibWUrxIhAARBum2qC/+EaqBhVCTTUkHMyeRS7fQ9+IqCzTlG0T4RO5B+e6CCfoZ3267Kn7z5C
	xnqmsG1RUOl4VFEpvRYNt5Aka17luRYtqma7WEZ3e0QP2jHwYStvKCgjH8vA1DnDxtzY+viD2lyiQ
	5ypUXvyQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3hC-00000007vqZ-0NXm;
	Thu, 21 May 2026 13:44:18 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ3h9-00000007vow-0Gel
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 13:44:17 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ3h0-0001JK-60; Thu, 21 May 2026 15:44:06 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ3gy-00174N-2S;
	Thu, 21 May 2026 15:44:05 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ3gz-00000004WQz-0oP0;
	Thu, 21 May 2026 15:44:05 +0200
Date: Thu, 21 May 2026 15:44:05 +0200
From: Michael Tretter <m.tretter@pengutronix.de>
To: Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>
Cc: Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
Subject: Re: [PATCH v7 10/28] media: rockchip: rga: announce and sync
 colorimetry
Message-ID: <ag8MJaSIVt4Q_y_U@pengutronix.de>
Mail-Followup-To: Michael Tretter <m.tretter@pengutronix.de>,
	Sven =?utf-8?Q?P=C3=BCschel?= <s.pueschel@pengutronix.de>,
	Jacob Chen <jacob-chen@iotwrt.com>,
	Ezequiel Garcia <ezequiel@vanguardiasur.com.ar>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org, kernel@pengutronix.de,
	nicolas@ndufresne.ca, sebastian.reichel@collabora.com,
	p.zabel@pengutronix.de,
	Nicolas Dufresne <nicolas.dufresne@collabora.com>
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
 <20260521-spu-rga3-v7-10-3f33e8c7145f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-10-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_064415_102136_9DF50A96 
X-CRM114-Status: GOOD (  28.07  )
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

"announce colorimetry" in the subject is a bit strange. Maybe rephrase
the subject to

	media: rockchip: rga: announce CSC and sync colorimetry

On Thu, 21 May 2026 00:44:15 +0200, Sven Püschel wrote:
> Announce the capability to adjust the quantization and ycbcr_enc on the
> capture side and check if the SET_CSC flag is set when the colorimetry
> is changed. Furthermore copy the colorimetry from the output to the
> capture side to fix the currently failing v4l2-compliance tests, which
> expect exactly this behavior.
> 
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> ---
>  drivers/media/platform/rockchip/rga/rga.c | 37 +++++++++++++++++++++++++++++++
>  1 file changed, 37 insertions(+)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index ca8d8a53dc251..8c34f73d69764 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -437,6 +437,15 @@ static int vidioc_enum_fmt(struct file *file, void *priv, struct v4l2_fmtdesc *f
>  	fmt = &formats[f->index];
>  	f->pixelformat = fmt->fourcc;
>  
> +	if (f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE &&
> +	    f->type != V4L2_BUF_TYPE_VIDEO_CAPTURE_MPLANE)

Is there a reason for not using V4L2_TYPE_IS_CAPTURE(f->type)? I'd also
invert the condition, set the flags in the branch and have a single exit
point of this function.

> +		return 0;
> +
> +	/* allow changing the quantization and xfer func for YUV formats */
> +	if (v4l2_is_format_yuv(v4l2_format_info(f->pixelformat)))
> +		f->flags |= V4L2_FMT_FLAG_CSC_QUANTIZATION |
> +			    V4L2_FMT_FLAG_CSC_YCBCR_ENC;
> +
>  	return 0;
>  }
>  
> @@ -459,8 +468,25 @@ static int vidioc_g_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  static int vidioc_try_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  {
>  	struct v4l2_pix_format_mplane *pix_fmt = &f->fmt.pix_mp;
> +	struct rga_ctx *ctx = file_to_rga_ctx(file);
>  	struct rga_fmt *fmt;
>  
> +	if (V4L2_TYPE_IS_CAPTURE(f->type)) {
> +		const struct rga_frame *frm;
> +
> +		frm = rga_get_frame(ctx, f->type);
> +		if (IS_ERR(frm))
> +			return PTR_ERR(frm);
> +
> +		if (!(pix_fmt->flags & V4L2_PIX_FMT_FLAG_SET_CSC)) {
> +			pix_fmt->quantization = frm->pix.quantization;
> +			pix_fmt->ycbcr_enc = frm->pix.ycbcr_enc;
> +		}

Are there any limits on the colorspace conversion that the RGA can do?
If I understand correctly, user space may set an arbitrary
v4l2_ycbcr_encoding (for example V4L2_YCBCR_ENC_BT2020) and the driver
will happily accept it.

> +		/* disallow values not announced in vidioc_enum_fmt */

"disallow values" sounds strange. Maybe:

		/* The RGA cannot convert colorspace and xfer_func */

> +		pix_fmt->colorspace = frm->pix.colorspace;
> +		pix_fmt->xfer_func = frm->pix.xfer_func;
> +	}
> +
>  	fmt = rga_fmt_find(pix_fmt->pixelformat);
>  	if (!fmt)
>  		fmt = &formats[0];
> @@ -506,6 +532,17 @@ static int vidioc_s_fmt(struct file *file, void *priv, struct v4l2_format *f)
>  	frm->fmt = rga_fmt_find(pix_fmt->pixelformat);
>  	frm->stride = pix_fmt->plane_fmt[0].bytesperline;
>  
> +	/*
> +	 * Copy colorimetry from output to capture as required by the
> +	 * v4l2-compliance tests
> +	 */
> +	if (V4L2_TYPE_IS_OUTPUT(f->type)) {
> +		ctx->out.pix.colorspace = pix_fmt->colorspace;
> +		ctx->out.pix.ycbcr_enc = pix_fmt->ycbcr_enc;
> +		ctx->out.pix.quantization = pix_fmt->quantization;
> +		ctx->out.pix.xfer_func = pix_fmt->xfer_func;

I was very confused, because ctx->out is actually the format for
CAPTURE. The comment kind of helps to mark this trap. Not sure, if there
is anything that can be done about this.

Michael

> +	}
> +
>  	/* Reset crop settings */
>  	frm->crop.left = 0;
>  	frm->crop.top = 0;
> 
> -- 
> 2.54.0
> 
> 

