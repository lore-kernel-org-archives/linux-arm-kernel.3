Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A3D6E9D418
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Feb 2026 17:05:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5U76WFJa4aJl6uKB7i3VfwbBmMItemRM9wT4/dhs2U=; b=oIeCNWP79UzxZ7CAxMUc6y/xrU
	t/F1FSR1SwcfEwTjDkF3HTmJwiok9HSgXUXN/qwG4swu6EPH/WuXqTpIcTYU5yW4hnb13o/qEcnsi
	DZOMeBHpvOoYb8P1Q5C88+EZM2jyLYbKi7vC4prGVRd9VSEf7koeqoBekAdYhHT5iBDWe8RG0OD+w
	YyGk/vygDHSJ7QIQilK47XWjNuKiJVjCG6bMK/7GYs+UZz8vRK4WEQpE+4q/CuZZrtBFhLoRXcyub
	v4K1kwD8tNCnHajkUNZCaogMdT6Asg9JtI22UhIoVUUEJynBfjcyGwTuwuFifu/vgMiT9gHX4FxmF
	DblbJVFw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngJJ-00000008ow1-0ahl;
	Wed, 04 Feb 2026 17:05:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vngJG-00000008ovI-1sU7;
	Wed, 04 Feb 2026 17:04:59 +0000
Received: from killaraus.ideasonboard.com (2001-14ba-703d-e500--ff4.rev.dnainternet.fi [IPv6:2001:14ba:703d:e500::ff4])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 22D545B2;
	Wed,  4 Feb 2026 18:04:14 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1770224654;
	bh=b4FHxE4k6c9u5owRl/0A1kf9dqtDLXPF6jx78vI4wa0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=VUrNrcSaUZ8WVpjhC6pBBWWabssL/xgdyAyuC2PwRYRa9xwCRIgpfmOLlBeeHKXx8
	 dGY0zKRaiU6L9CoBTN9hUS6UdrWKNE/DLb1SSeBieHWelw+KaMxJm7bU4eDnvmFVGH
	 cwQ3gwMBPuNCc+cZ8M0OWwSFa0dMp/EnruwBH6KQ=
Date: Wed, 4 Feb 2026 19:04:54 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Isaac Scott <isaac.scott@ideasonboard.com>
Cc: linux-media@vger.kernel.org, dafna@fastmail.com, mchehab@kernel.org,
	heiko@sntech.de, linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v1 2/6] media: rkisp1-isp: Add in_bypass flag for YUV
 bypass
Message-ID: <20260204170454.GD170964@killaraus>
References: <20260204112506.3706049-1-isaac.scott@ideasonboard.com>
 <20260204112506.3706049-3-isaac.scott@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260204112506.3706049-3-isaac.scott@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260204_090458_628277_2E4321D9 
X-CRM114-Status: GOOD (  20.83  )
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

Hi Isaac,

Thank you for the patch.

On Wed, Feb 04, 2026 at 11:25:02AM +0000, Isaac Scott wrote:
> The rkisp1 features a 'bypass' mode for RAW and YUV formats. This
> disables all ISP blocks, and makes the rkisp1 display input data from
> the mipi csi receiver at the output, unmodified.
> 
> To determine whether we can activate bypass, we can detect whether both
> the source and sink formats are YUV. If they are, we can set a new
> in_bypass flag.
> 
> For YUV bypass, we should configure the ISP input to interpret incoming
> H/VSYNC signals as data enable / disable. Add this.
> 
> Signed-off-by: Isaac Scott <isaac.scott@ideasonboard.com>
> ---
>  drivers/media/platform/rockchip/rkisp1/rkisp1-common.h | 1 +
>  drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c    | 7 ++++++-
>  2 files changed, 7 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index 5e6a4d5f6fd1..d90233e31ad3 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -532,6 +532,7 @@ struct rkisp1_device {
>  	struct rkisp1_debug debug;
>  	const struct rkisp1_info *info;
>  	int irqs[RKISP1_NUM_IRQS];
> +	bool in_bypass;
>  	bool irqs_enabled;
>  };
>  
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> index 2311672cedb1..f636d738b7e8 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-isp.c
> @@ -212,6 +212,8 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  	const struct v4l2_mbus_framefmt *sink_frm;
>  	const struct v4l2_rect *sink_crop;
>  
> +	rkisp1->in_bypass = false;
> +
>  	sink_frm = v4l2_subdev_state_get_format(sd_state,
>  						RKISP1_ISP_PAD_SINK_VIDEO);
>  	sink_crop = v4l2_subdev_state_get_crop(sd_state,
> @@ -240,7 +242,10 @@ static int rkisp1_config_isp(struct rkisp1_isp *isp,
>  		}
>  	} else if (sink_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
>  		acq_mult = 2;
> -		if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
> +		if (src_fmt->pixel_enc == V4L2_PIXEL_ENC_YUV) {
> +			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_DATA_MODE;
> +			rkisp1->in_bypass = true;

Based on the review of patches 3/6 and 5/6 I think this flag will
become unused, so you can probably drop this patch too.

> +		} else if (mbus_type == V4L2_MBUS_CSI2_DPHY) {
>  			isp_ctrl = RKISP1_CIF_ISP_CTRL_ISP_MODE_ITU601;
>  		} else {
>  			if (mbus_type == V4L2_MBUS_BT656)

-- 
Regards,

Laurent Pinchart

