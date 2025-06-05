Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1CD34C5B543
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Jun 2025 08:31:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ug7gEa2R3esefLP7gjOPEAzjsf6mnHh5//m0xCRIs7w=; b=cohXcpWQTJY9W3n8Wbf0VaFex5
	v+iwgM7vYELIf5ik+MKGIVcPN+sq8Zl4i58pbfl5t/NhKM6Qyqtzz+Il96S1gmv6rJWnPSFs1YDfX
	v36NnRvCIx2s+rHpZHKiXwmHm9TlQ9F0YiR2rpoKoE7TxuJ0afgm2ThBIibq+7PsMDNMBPBLGEstF
	sOl++bECAPzDiarErwwFT29F8HBB82ejOb2s2uv45FvNS+ni5sziVQlyAopGY+Tc9uV93wEQS5QFC
	2d8r3DyBZ+eaIzcvw1zCsgy1X573s0kR1j/jgBPV0qDRXSQJvO55fKUSWeY0kqqLyvjmw89f26QwB
	N1XWIMkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN605-0000000F4D5-2R7U;
	Thu, 05 Jun 2025 08:31:01 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uN5xr-0000000F3uj-1EBR;
	Thu, 05 Jun 2025 08:28:46 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 307831838;
	Thu,  5 Jun 2025 10:28:36 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1749112116;
	bh=Pe4KOyg59O5dYC8Q9siCzSuz/vlV6XZT/S0hkjn+kPo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=j+euAddtyqSBzXRWy4B3jiDEzpRfKF19CYFdux+vhhkTwza6z3fHAnGbv6Hz7F+S7
	 GyjbnhIMt9E+1f3Ddmz+aO6KYUIKP8xTH41jQ9JgMBvREYqZmbCl9VfwALjo7peT0I
	 b5wkRUhwXUMgXffiM/LcAlK0ExBJ8wVpWh04wxbY=
Date: Thu, 5 Jun 2025 11:28:29 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Stefan Klug <stefan.klug@ideasonboard.com>
Cc: Dafna Hirschfeld <dafna@fastmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
	linux-rockchip@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Paul Elder <paul.elder@ideasonboard.com>
Subject: Re: [PATCH v3 2/3] media: rkisp1: Add
 RKISP1_CID_SUPPORTED_PARAMS_BLOCKS control
Message-ID: <20250605082829.GI3755@pendragon.ideasonboard.com>
References: <20250523-supported-params-and-wdr-v3-0-7283b8536694@ideasonboard.com>
 <20250523-supported-params-and-wdr-v3-2-7283b8536694@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250523-supported-params-and-wdr-v3-2-7283b8536694@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250605_012843_477406_08E92A86 
X-CRM114-Status: GOOD (  36.08  )
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

Hi Stefan,

Thank you for the patch.

On Fri, May 23, 2025 at 05:14:31PM +0200, Stefan Klug wrote:
> Add a RKISP1_CID_SUPPORTED_PARAMS_BLOCKS V4L2 control to be able to
> query the parameters blocks supported by the current kernel on the
> current hardware from user space.
> 
> Signed-off-by: Stefan Klug <stefan.klug@ideasonboard.com>
> Reviewed-by: Paul Elder <paul.elder@ideasonboard.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
> Changes in v3:
> - Moved the rkisp1_params_init_vb2_queue() return check back into
>   separate patch
> - Renamed rkisp1_ctrl_init to rkisp1_params_ctrl_init
> - Applied missed review comment in docs
> 
> Changes in v2:
> - Added docs improvements from review
> - Moved ctrl_config declaration to top
> - Moved rkisp1_params_init_vb2_queue() return check into this patch as
>   the previous patch got dropped
> - Call rkisp1_ctrl_init() after media_entity_pads_init() for easier
>   error handling
> ---
>  .../media/platform/rockchip/rkisp1/rkisp1-common.h |  2 +
>  .../media/platform/rockchip/rkisp1/rkisp1-params.c | 49 +++++++++++++++++++++-
>  include/uapi/linux/rkisp1-config.h                 | 11 +++++
>  include/uapi/linux/v4l2-controls.h                 |  6 +++
>  4 files changed, 67 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> index ca952fd0829b..5f187f9efc7b 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-common.h
> @@ -415,6 +415,8 @@ struct rkisp1_params {
>  	spinlock_t config_lock; /* locks the buffers list 'params' */
>  	struct list_head params;
>  
> +	struct v4l2_ctrl_handler ctrls;
> +
>  	const struct v4l2_meta_format *metafmt;
>  
>  	enum v4l2_quantization quantization;
> diff --git a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> index 24a8de697f2b..4db0ca8d86db 100644
> --- a/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> +++ b/drivers/media/platform/rockchip/rkisp1/rkisp1-params.c
> @@ -2736,6 +2736,44 @@ static int rkisp1_params_init_vb2_queue(struct vb2_queue *q,
>  	return vb2_queue_init(q);
>  }
>  
> +static int rkisp1_params_ctrl_init(struct rkisp1_params *params)
> +{
> +	struct v4l2_ctrl_config ctrl_config = {
> +		.id = RKISP1_CID_SUPPORTED_PARAMS_BLOCKS,
> +		.name = "Supported Params Blocks",
> +		.type = V4L2_CTRL_TYPE_BITMASK,
> +		.flags = V4L2_CTRL_FLAG_READ_ONLY,
> +	};
> +	int ret;
> +
> +	v4l2_ctrl_handler_init(&params->ctrls, 1);
> +
> +	for (unsigned int i = 0; i < ARRAY_SIZE(rkisp1_ext_params_handlers); i++) {
> +		const struct rkisp1_ext_params_handler *block_handler;
> +
> +		block_handler = &rkisp1_ext_params_handlers[i];
> +		ctrl_config.max |= BIT(i);
> +
> +		if ((params->rkisp1->info->features & block_handler->features) !=
> +		    block_handler->features)
> +			continue;
> +
> +		ctrl_config.def |= BIT(i);
> +	}
> +
> +	v4l2_ctrl_new_custom(&params->ctrls, &ctrl_config, NULL);
> +
> +	params->vnode.vdev.ctrl_handler = &params->ctrls;
> +
> +	if (params->ctrls.error) {
> +		ret = params->ctrls.error;
> +		v4l2_ctrl_handler_free(&params->ctrls);
> +		return ret;
> +	}
> +
> +	return 0;
> +}
> +
>  int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  {
>  	struct rkisp1_params *params = &rkisp1->params;
> @@ -2781,15 +2819,23 @@ int rkisp1_params_register(struct rkisp1_device *rkisp1)
>  	if (ret)
>  		goto err_media;
>  
> +	ret = rkisp1_params_ctrl_init(params);
> +	if (ret) {
> +		dev_err(rkisp1->dev, "Control initialization error %d\n", ret);
> +		goto err_media;
> +	}
> +
>  	ret = video_register_device(vdev, VFL_TYPE_VIDEO, -1);
>  	if (ret) {
>  		dev_err(rkisp1->dev,
>  			"failed to register %s, ret=%d\n", vdev->name, ret);
> -		goto err_media;
> +		goto err_ctrl;
>  	}
>  
>  	return 0;
>  
> +err_ctrl:
> +	v4l2_ctrl_handler_free(&params->ctrls);
>  err_media:
>  	media_entity_cleanup(&vdev->entity);
>  	mutex_destroy(&node->vlock);
> @@ -2806,6 +2852,7 @@ void rkisp1_params_unregister(struct rkisp1_device *rkisp1)
>  		return;
>  
>  	vb2_video_unregister_device(vdev);
> +	v4l2_ctrl_handler_free(&params->ctrls);
>  	media_entity_cleanup(&vdev->entity);
>  	mutex_destroy(&node->vlock);
>  }
> diff --git a/include/uapi/linux/rkisp1-config.h b/include/uapi/linux/rkisp1-config.h
> index 2d995f3c1ca3..5ca4d5961c5b 100644
> --- a/include/uapi/linux/rkisp1-config.h
> +++ b/include/uapi/linux/rkisp1-config.h
> @@ -1086,6 +1086,9 @@ enum rkisp1_ext_params_block_type {
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_DISABLE	(1U << 0)
>  #define RKISP1_EXT_PARAMS_FL_BLOCK_ENABLE	(1U << 1)
>  
> +/* A bitmask of parameters blocks supported on the current hardware. */
> +#define RKISP1_CID_SUPPORTED_PARAMS_BLOCKS	(V4L2_CID_USER_RKISP1_BASE + 0x01)
> +
>  /**
>   * struct rkisp1_ext_params_block_header - RkISP1 extensible parameters block
>   *					   header
> @@ -1520,6 +1523,14 @@ enum rksip1_ext_param_buffer_version {
>   * V4L2 control. If such control is not available, userspace should assume only
>   * RKISP1_EXT_PARAM_BUFFER_V1 is supported by the driver.
>   *
> + * The read-only V4L2 control ``RKISP1_CID_SUPPORTED_PARAMS_BLOCKS`` can be used
> + * to query the blocks supported by the device. It contains a bitmask where each
> + * bit represents the availability of the corresponding entry from the
> + * :c:type:`rkisp1_ext_params_block_type` enum. The current and default values
> + * of the control represents the blocks supported by the device instance, while
> + * the maximum value represents the blocks supported by the kernel driver,
> + * independently of the device instance.
> + *
>   * For each ISP block that userspace wants to configure, a block-specific
>   * structure is appended to the @data buffer, one after the other without gaps
>   * in between nor overlaps. Userspace shall populate the @data_size field with
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2-controls.h
> index 72e32814ea83..f836512e9deb 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -222,6 +222,12 @@ enum v4l2_colorfx {
>   */
>  #define V4L2_CID_USER_UVC_BASE			(V4L2_CID_USER_BASE + 0x11e0)
>  
> +/*
> + * The base for Rockchip ISP1 driver controls.
> + * We reserve 16 controls for this driver.
> + */
> +#define V4L2_CID_USER_RKISP1_BASE		(V4L2_CID_USER_BASE + 0x1220)
> +
>  /* MPEG-class control IDs */
>  /* The MPEG controls are applicable to all codec controls
>   * and the 'MPEG' part of the define is historical */

-- 
Regards,

Laurent Pinchart

