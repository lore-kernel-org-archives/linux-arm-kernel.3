Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F359BC53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 13:49:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:Subject:From:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jVHZMOJIAI4rU+heyq7DS6MNz5r0XykWshamkVMDkkU=; b=T9ed7G/CGZB3GypYWmcLxDBk1i
	pw0itGRNjpteuxNS3AgWqu4e3/GsWvuNdw1cxZfB+cZ7w/ZuSl4fOIyX4wqy1hm90x44VoO5qyxGU
	5OJo17eu+ch8+G0bbcYfISrmMSle4ktCWsG+Go5x8Ul+fB/25zxB9nkDcEeET2zqAPUxlOsBCvtir
	6KkADlVedkkKY8jtGs4mZgJKLoqf/90dcnZ5bSYbhsjpa+5At2QavnIz0U1KlXjla6s/7y4+yymgZ
	sY0T2eMpGeE2eenLu0+vB0YexTi6nWmC3cTVdfTEPh+NQvsA/OC9YxpetoP0Cw6AmYTpTZ/bbAZtC
	0pjPmvEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLiC-00000002ttO-0DNB;
	Mon, 27 Jul 2026 13:49:44 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woLiA-00000002ttE-1NWL
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 13:49:42 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C662340807;
	Mon, 27 Jul 2026 13:49:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 053881F000E9;
	Mon, 27 Jul 2026 13:49:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785160181;
	bh=jVHZMOJIAI4rU+heyq7DS6MNz5r0XykWshamkVMDkkU=;
	h=Date:From:Subject:To:Cc:References:In-Reply-To;
	b=go6rpx1vdvqiE0MjTsgaWIkcy5NPPhRZrT68/sYDKepLhEPbRdnW+sVaLHAKTh3uk
	 rf1fIgoJ/XW0DW7A33g0ygBZ2dyvkgSJA7Uls9rVCoQbp8ZUCOLawUWsvIatxVAuj0
	 l9SrWXClu9hgxupvnXL+i82Iwz4RoxtipM3qxhDQdDfNJFx2KGWrqesgeiGfb93Au+
	 QguNz2NZionbSJ1Mv2TZmlfYjhZ7O3WEg4JysWoIN8MIhOI9zutqvCnjwJXkTkY+Op
	 oz4OZMDXQeRX+p3T71mr1A0VXpI/Stvgv7Klot+7pew+eYHc9+iwxmVNNBgeDg829a
	 gO/TzPdVv3YHw==
Message-ID: <23512cf4-1991-4ee8-96c5-a83e8ba197ca@kernel.org>
Date: Mon, 27 Jul 2026 15:49:38 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Hans Verkuil <hverkuil+cisco@kernel.org>
Subject: Re: [PATCH v3 10/13] media: stm32: dcmipp: pixelproc: addition of
 dcmipp-pixelproc subdev
To: Alain Volmat <alain.volmat@foss.st.com>,
 Hugues Fruchet <hugues.fruchet@foss.st.com>,
 Mauro Carvalho Chehab <mchehab@kernel.org>,
 Maxime Coquelin <mcoquelin.stm32@gmail.com>,
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: linux-media@vger.kernel.org, linux-stm32@st-md-mailman.stormreply.com,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260724-stm32-dcmipp-pixel-pipes-support-v3-0-f77fe7e723d9@foss.st.com>
 <20260724-stm32-dcmipp-pixel-pipes-support-v3-10-f77fe7e723d9@foss.st.com>
Content-Language: en-US, nl
In-Reply-To: <20260724-stm32-dcmipp-pixel-pipes-support-v3-10-f77fe7e723d9@foss.st.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

Hi Alain,

Some control-related comments:

On 24/07/2026 18:13, Alain Volmat wrote:
> Addition of the driver for dcmipp-pixelproc subdev.  This subdev is the
> last one before the capture device at the tail of both main and
> aux pipelines.
> 
> It is in charge of:
>   - framerate adjustment
>   - downscale
>   - gamma correction
>   - color conversion
>   - pixel packing
> 
> Signed-off-by: Alain Volmat <alain.volmat@foss.st.com>
> ---
>  .../media/platform/st/stm32/stm32-dcmipp/Makefile  |   2 +-
>  .../platform/st/stm32/stm32-dcmipp/dcmipp-common.h |   4 +
>  .../st/stm32/stm32-dcmipp/dcmipp-pixelproc.c       | 941 +++++++++++++++++++++
>  3 files changed, 946 insertions(+), 1 deletion(-)
> 
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> index a708534a51af4..7178934bb116b 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/Makefile
> @@ -1,5 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0
>  stm32-dcmipp-y := dcmipp-core.o dcmipp-common.o dcmipp-input.o dcmipp-byteproc.o dcmipp-bytecap.o
> -stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o
> +stm32-dcmipp-y += dcmipp-pixelcommon.o dcmipp-isp.o dcmipp-pixelproc.o
>  
>  obj-$(CONFIG_VIDEO_STM32_DCMIPP) += stm32-dcmipp.o
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> index e04fde86550a5..8f41473605aae 100644
> --- a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-common.h
> @@ -285,5 +285,9 @@ void dcmipp_bytecap_ent_release(struct dcmipp_ent_device *ved);
>  struct dcmipp_ent_device *dcmipp_isp_ent_init(const char *entity_name,
>  					      struct dcmipp_device *dcmipp);
>  void dcmipp_isp_ent_release(struct dcmipp_ent_device *ved);
> +struct dcmipp_ent_device *
> +dcmipp_pixelproc_ent_init(const char *entity_name,
> +			  struct dcmipp_device *dcmipp);
> +void dcmipp_pixelproc_ent_release(struct dcmipp_ent_device *ved);
>  
>  #endif
> diff --git a/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c
> new file mode 100644
> index 0000000000000..4372c75508725
> --- /dev/null
> +++ b/drivers/media/platform/st/stm32/stm32-dcmipp/dcmipp-pixelproc.c

<snip>

> +/*
> + * Functions handling controls
> + */
> +#define V4L2_CID_PIXELPROC_GAMMA_CORRECTION	(V4L2_CID_USER_BASE | 0x1001)

You need to reserve a range in include/uapi/linux/v4l2-controls.h for this
driver (search for V4L2_CID_USER_MALI_C55_BASE).

And the define should include the driver name. 'PIXELPROC' is much too generic.
It probably should be called DCMIPP_PIXELPROC.

Please document what this control does. Typically a new header is added to
include/linux/uapi for this driver containing the CID and the documentation.
See: include/uapi/linux/dw100.h

> +
> +static int dcmipp_pixelproc_s_ctrl(struct v4l2_ctrl *ctrl)
> +{
> +	struct dcmipp_pixelproc_device *pixelproc =
> +		container_of(ctrl->handler,
> +			     struct dcmipp_pixelproc_device, ctrls);
> +
> +	if (!pm_runtime_get_if_in_use(pixelproc->dev))
> +		return 0;
> +
> +	switch (ctrl->id) {
> +	case V4L2_CID_PIXELPROC_GAMMA_CORRECTION:
> +		reg_write(pixelproc, DCMIPP_PxGMCR(pixelproc->pipe_id),
> +			  (ctrl->val ? DCMIPP_PxGMCR_ENABLE : 0));
> +		break;
> +	}
> +
> +	pm_runtime_put(pixelproc->dev);
> +
> +	return 0;
> +};
> +
> +static const struct v4l2_ctrl_ops dcmipp_pixelproc_ctrl_ops = {
> +	.s_ctrl = dcmipp_pixelproc_s_ctrl,
> +};
> +
> +static const struct v4l2_ctrl_config dcmipp_pixelproc_ctrls[] = {
> +	{
> +		.ops		= &dcmipp_pixelproc_ctrl_ops,
> +		.id		= V4L2_CID_PIXELPROC_GAMMA_CORRECTION,
> +		.type		= V4L2_CTRL_TYPE_BOOLEAN,
> +		.name		= "Gamma correction",

"Gamma Correction". More likely, "Gamma Correction Enable" (and ENABLE should probably
be in the CID define as well).

> +		.min = 0,
> +		.max = 1,
> +		.step = 1,
> +		.def = 0,
> +	}
> +};
> +

<snip>

Regards,

	Hans

