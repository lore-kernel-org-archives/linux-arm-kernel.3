Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7D66CD5BAF
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 14:55:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1yP2Am5e10sNeYEbKNGw2vl+euZGZyHF/crVn79WQng=; b=3sF2cHwebI0JWQMC/Vz1EQjKiG
	8ltb4IJz6+YxCgzD+gaWuV2YcKviSvEOML7Ss47dYSJQkpyI12Qa4L0qhT2An7h9nduxZYunws09H
	1u4aG2/3+VGgsc/gUFgwhrHLU9MXPpkwjPAcFRPgNqU49V1oP11oEaNjS/wYPx6lsX+uZtamkhj4E
	SJyLRWfoqIe+moqT9mOm4aeoaABPrWmV5Ys5MKUzunBh5Rzv4ozzDx1KEJQ7SmbRpaFjVkyf/bvUm
	6EjIGRsctYLtj27w1mQAsFmW1iIOvhghJHKkaQ/pB9bLuvgiYOeebMgX2Q3CJA1o+pMIhsqd7y5yo
	p+3BQ2ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4oJ-00000008Azk-3bi3;
	Thu, 21 May 2026 14:55:43 +0000
Received: from metis.whiteo.stw.pengutronix.de ([185.203.201.7])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ4oH-00000008AxS-0Glq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 14:55:42 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4o4-0007By-IH; Thu, 21 May 2026 16:55:28 +0200
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4o3-0017Wq-0P;
	Thu, 21 May 2026 16:55:27 +0200
Received: from mtr by pty.whiteo.stw.pengutronix.de with local (Exim 4.98.2)
	(envelope-from <m.tretter@pengutronix.de>)
	id 1wQ4o3-00000004XHD-2NNW;
	Thu, 21 May 2026 16:55:27 +0200
Date: Thu, 21 May 2026 16:55:27 +0200
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
	p.zabel@pengutronix.de
Subject: Re: [PATCH v7 17/28] media: rockchip: rga: check scaling factor
Message-ID: <ag8c3_pSJ2WqHqzC@pengutronix.de>
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
	p.zabel@pengutronix.de
References: <20260521-spu-rga3-v7-0-3f33e8c7145f@pengutronix.de>
 <20260521-spu-rga3-v7-17-3f33e8c7145f@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260521-spu-rga3-v7-17-3f33e8c7145f@pengutronix.de>
X-Sent-From: Pengutronix Hildesheim
X-URL: http://www.pengutronix.de/
X-Accept-Language: de,en
X-Accept-Content-Type: text/plain
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: m.tretter@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_075541_260289_D6CDA2ED 
X-CRM114-Status: GOOD (  40.47  )
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

On Thu, 21 May 2026 00:44:22 +0200, Sven Püschel wrote:
> Check the scaling factor to avoid potential problems. This is relevant
> for the upcoming RGA3 support, as it can hang when the scaling factor
> is exceeded.

Since you add a limit of 16 for the RGA2, this seems to be relevant for
the RGA2, too. Please add this to the commit message.

Michael

> 
> The check is done at streamon when the other side is already streaming
> to avoid incorrectly failing if the application configures the other
> side after calling streamon. As try_fmt shouldn't be state aware,
> it cannot be used to limit the format based on the scaling factor.
> Therefore the check is done just before the actual streaming would be
> started.
> 
> As the driver allows changing the rotation and selection while
> streaming, add additional checks to ensure these changes
> don't exceed the scaling factor.
> 
> Signed-off-by: Sven Püschel <s.pueschel@pengutronix.de>
> 
> ---
> Changes in v6:
> - Dropped scaling adjustment in s_fmt, as this didn't match the try_fmt
>   result (which shouldn't have it to avoid making it stateful)
> - Moved scaling check to the prepare_streaming callback instead of
>   overwriting the ioctl directly
> - Consider rotation when checking the scaling
> - Check scaling factor when adjusting rotation and selection while
>   streaming
> ---
>  drivers/media/platform/rockchip/rga/rga-buf.c | 28 ++++++++++++
>  drivers/media/platform/rockchip/rga/rga-hw.c  |  1 +
>  drivers/media/platform/rockchip/rga/rga-hw.h  |  1 +
>  drivers/media/platform/rockchip/rga/rga.c     | 63 +++++++++++++++++++++++++--
>  drivers/media/platform/rockchip/rga/rga.h     |  4 ++
>  5 files changed, 94 insertions(+), 3 deletions(-)
> 
> diff --git a/drivers/media/platform/rockchip/rga/rga-buf.c b/drivers/media/platform/rockchip/rga/rga-buf.c
> index ffc6162b2e681..dcaba66f5c1fc 100644
> --- a/drivers/media/platform/rockchip/rga/rga-buf.c
> +++ b/drivers/media/platform/rockchip/rga/rga-buf.c
> @@ -197,6 +197,33 @@ static void rga_buf_return_buffers(struct vb2_queue *q,
>  	}
>  }
>  
> +static int rga_buf_prepare_streaming(struct vb2_queue *q)
> +{
> +	struct rga_ctx *ctx = vb2_get_drv_priv(q);
> +	const struct rga_hw *hw = ctx->rga->hw;
> +	int ret;
> +
> +	/* It's safe to check the streaming state of the other queue,
> +	 * as the streamon ioctl's can't race due to the lock set in
> +	 * the queue_init function.
> +	 */
> +	if ((V4L2_TYPE_IS_OUTPUT(q->type) &&
> +	     vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx))) ||
> +	    (V4L2_TYPE_IS_CAPTURE(q->type) &&
> +	     vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx)))) {
> +		/*
> +		 * As the other side is already streaming,
> +		 * check that the max scaling factor isn't exceeded.
> +		 */
> +		ret = rga_check_scaling(hw, &ctx->in.crop, &ctx->out.crop,
> +					ctx->rotate);
> +		if (ret < 0)
> +			return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  static int rga_buf_start_streaming(struct vb2_queue *q, unsigned int count)
>  {
>  	struct rga_ctx *ctx = vb2_get_drv_priv(q);
> @@ -232,6 +259,7 @@ const struct vb2_ops rga_qops = {
>  	.buf_prepare = rga_buf_prepare,
>  	.buf_queue = rga_buf_queue,
>  	.buf_cleanup = rga_buf_cleanup,
> +	.prepare_streaming = rga_buf_prepare_streaming,
>  	.start_streaming = rga_buf_start_streaming,
>  	.stop_streaming = rga_buf_stop_streaming,
>  };
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.c b/drivers/media/platform/rockchip/rga/rga-hw.c
> index 567d39e58d33f..f2900812ba76f 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.c
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.c
> @@ -584,6 +584,7 @@ const struct rga_hw rga2_hw = {
>  	.max_width = MAX_WIDTH,
>  	.min_height = MIN_HEIGHT,
>  	.max_height = MAX_HEIGHT,
> +	.max_scaling_factor = MAX_SCALING_FACTOR,
>  	.stride_alignment = 4,
>  
>  	.setup_cmdbuf = rga_hw_setup_cmdbuf,
> diff --git a/drivers/media/platform/rockchip/rga/rga-hw.h b/drivers/media/platform/rockchip/rga/rga-hw.h
> index c2e34be751939..805ec23e5e3f4 100644
> --- a/drivers/media/platform/rockchip/rga/rga-hw.h
> +++ b/drivers/media/platform/rockchip/rga/rga-hw.h
> @@ -14,6 +14,7 @@
>  
>  #define MIN_WIDTH 34
>  #define MIN_HEIGHT 34
> +#define MAX_SCALING_FACTOR 16
>  
>  #define RGA_TIMEOUT 500
>  
> diff --git a/drivers/media/platform/rockchip/rga/rga.c b/drivers/media/platform/rockchip/rga/rga.c
> index 394b14b9469df..22954bbae55fc 100644
> --- a/drivers/media/platform/rockchip/rga/rga.c
> +++ b/drivers/media/platform/rockchip/rga/rga.c
> @@ -127,7 +127,9 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
>  {
>  	struct rga_ctx *ctx = container_of(ctrl->handler, struct rga_ctx,
>  					   ctrl_handler);
> +	const struct rga_hw *hw = ctx->rga->hw;
>  	unsigned long flags;
> +	int ret = 0;
>  
>  	spin_lock_irqsave(&ctx->rga->ctrl_lock, flags);
>  	switch (ctrl->id) {
> @@ -138,6 +140,13 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
>  		ctx->vflip = ctrl->val;
>  		break;
>  	case V4L2_CID_ROTATE:
> +		if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +		    vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx))) {
> +			ret = rga_check_scaling(hw, &ctx->in.crop,
> +						&ctx->out.crop, ctrl->val);
> +			if (ret < 0)
> +				goto s_ctrl_done;
> +		}
>  		ctx->rotate = ctrl->val;
>  		break;
>  	case V4L2_CID_BG_COLOR:
> @@ -145,8 +154,10 @@ static int rga_s_ctrl(struct v4l2_ctrl *ctrl)
>  		break;
>  	}
>  	ctx->cmdbuf_dirty = true;
> +
> +s_ctrl_done:
>  	spin_unlock_irqrestore(&ctx->rga->ctrl_lock, flags);
> -	return 0;
> +	return ret;
>  }
>  
>  static const struct v4l2_ctrl_ops rga_ctrl_ops = {
> @@ -182,6 +193,38 @@ static int rga_setup_ctrls(struct rga_ctx *ctx)
>  	return 0;
>  }
>  
> +static bool check_scaling_factor(const struct rga_hw *hw, u32 src_size,
> +				 u32 dst_size)
> +{
> +	if (src_size < dst_size)
> +		return src_size * hw->max_scaling_factor >= dst_size;
> +	else
> +		return dst_size * hw->max_scaling_factor >= src_size;
> +}
> +
> +int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *crop_in,
> +		      const struct v4l2_rect *crop_out, u32 rotate)
> +{
> +	u32 scaled_width;
> +	u32 scaled_height;
> +
> +	if (rotate == 90 || rotate == 270) {
> +		scaled_width = crop_out->height;
> +		scaled_height = crop_out->width;
> +	} else {
> +		scaled_width = crop_out->width;
> +		scaled_height = crop_out->height;
> +	}
> +
> +	if (!check_scaling_factor(hw, crop_in->width, scaled_width))
> +		return -EINVAL;
> +
> +	if (!check_scaling_factor(hw, crop_in->height, scaled_height))
> +		return -EINVAL;
> +
> +	return 0;
> +}
> +
>  static struct rga_fmt *rga_fmt_find(struct rockchip_rga *rga, u32 pixelformat)
>  {
>  	unsigned int i;
> @@ -525,7 +568,6 @@ static int vidioc_s_selection(struct file *file, void *priv,
>  	struct rga_ctx *ctx = file_to_rga_ctx(file);
>  	struct rockchip_rga *rga = ctx->rga;
>  	struct rga_frame *f;
> -	int ret = 0;
>  
>  	f = rga_get_frame(ctx, s->type);
>  	if (IS_ERR(f))
> @@ -569,10 +611,25 @@ static int vidioc_s_selection(struct file *file, void *priv,
>  		return -EINVAL;
>  	}
>  
> +	if (vb2_is_streaming(v4l2_m2m_get_dst_vq(ctx->fh.m2m_ctx)) &&
> +	    vb2_is_streaming(v4l2_m2m_get_src_vq(ctx->fh.m2m_ctx))) {
> +		int ret = 0;
> +
> +		if (V4L2_TYPE_IS_OUTPUT(s->type))
> +			ret = rga_check_scaling(rga->hw, &s->r, &ctx->out.crop,
> +						ctx->rotate);
> +		else
> +			ret = rga_check_scaling(rga->hw, &ctx->in.crop, &s->r,
> +						ctx->rotate);
> +
> +		if (ret < 0)
> +			return ret;
> +	}
> +
>  	f->crop = s->r;
>  	ctx->cmdbuf_dirty = true;
>  
> -	return ret;
> +	return 0;
>  }
>  
>  static const struct v4l2_ioctl_ops rga_ioctl_ops = {
> diff --git a/drivers/media/platform/rockchip/rga/rga.h b/drivers/media/platform/rockchip/rga/rga.h
> index 5360f092fecf0..df525c6aea8b6 100644
> --- a/drivers/media/platform/rockchip/rga/rga.h
> +++ b/drivers/media/platform/rockchip/rga/rga.h
> @@ -123,6 +123,9 @@ static inline struct rga_vb_buffer *vb_to_rga(struct vb2_v4l2_buffer *vb)
>  
>  struct rga_frame *rga_get_frame(struct rga_ctx *ctx, enum v4l2_buf_type type);
>  
> +int rga_check_scaling(const struct rga_hw *hw, const struct v4l2_rect *crop_in,
> +		      const struct v4l2_rect *crop_out, u32 rotate);
> +
>  /* RGA Buffers Manage */
>  extern const struct vb2_ops rga_qops;
>  
> @@ -151,6 +154,7 @@ struct rga_hw {
>  	size_t cmdbuf_size;
>  	u32 min_width, min_height;
>  	u32 max_width, max_height;
> +	u8 max_scaling_factor;
>  	u8 stride_alignment;
>  
>  	void (*setup_cmdbuf)(struct rga_ctx *ctx);
> 
> -- 
> 2.54.0
> 
> 

