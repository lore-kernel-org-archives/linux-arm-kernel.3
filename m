Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 611F5CAC5A5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 16:16:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yo3TRWqd/f2gI3b91RC3TrXuz17cR69Z0ilP2DQxqXM=; b=ghPYzMC9+rzVBob1pcrPaP11F/
	k6k8TUHJd9zTJkrPduGIWYMumaDcTeD+2gAb33ih1nNJS6MppzYN5nmRZJ4+aHmkWEGIfUsWVgz1S
	tTzXVNxjbVySvbDArYm6dDu0hDkHNeGasVg0LHtMPtd/EfY9HGqHa3dGXIP1SOBRZY+ssO8nDpTlY
	w5VVKuPvJFld9yVea97Z2HHWeX9Dpf3ybnpKadt5kFXxhOk+zwuhBotbDgI6SQyqPz0FG6cYGzcRM
	vR7/iIG1D24n1FnuWCq3gUpLwHXYa0vSxKf4StJEMQkTY2K+Rf1nCWO0NhR/pSRuEtt5O9Go5nbYk
	84hJ56ew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00Fz-00000005b1t-0fjg;
	Sat, 20 Sep 2025 16:16:15 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v00Fw-00000005b0n-25KP
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 16:16:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1758384972;
 bh=Yo3TRWqd/f2gI3b91RC3TrXuz17cR69Z0ilP2DQxqXM=;
 b=MjlMt6h67LyWVa5UYtQhok/n1wFQkX4xsXe0P+Y9eZPZfzCR9UkxYE30MRBYog/TfogfIRRtc
 zkbgoy7jjGj7b5761luLRtqvf6zRbk/fMvBqJLeHdrdbnGo0F4TtBmF1V0EgZ2oDuNCfaQyNnCK
 l+IFXdJzFpvNwvlmLsSTF4xMgtzcJBgRVZbC4kmh69TTTQ95I7DCGXzWLN760Z1aIv0sxKiaRMz
 fgFdz39sQCsDWwsIE7LYZBD//sLuSBRKPI94zoP02pfw48IE/pGr8DIYH5yD3WGgWqWikuI3Hde
 yMK38spMSYPbeKsVZdfvXQV/LPToXMxY592GQdOqp9DA==
X-Forward-Email-ID: 68ced33e9c5715b3f5ddfb7c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 1.2.14
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <ea0914d9-bd12-4bdc-b465-3ae82571118a@kwiboo.se>
Date: Sat, 20 Sep 2025 18:15:53 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 09/12] media: rkvdec: Add H264 support for the VDPU381
 variant
To: Diederik de Haas <didi.debian@cknow.org>,
 Detlev Casanova <detlev.casanova@collabora.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
 Heiko Stuebner <heiko@sntech.de>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com, linux-kernel@vger.kernel.org
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-10-detlev.casanova@collabora.com>
 <DCXPTZRNNTDY.1773L2181HWF@cknow.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <DCXPTZRNNTDY.1773L2181HWF@cknow.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_091612_575048_8A24716B 
X-CRM114-Status: GOOD (  31.47  )
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

Hi Diederik,

On 9/20/2025 5:00 PM, Diederik de Haas wrote:
> Hi Detlev,
> 
> Thanks a LOT for this patch set!
> As already reported the results were quite impressive :-D
> 
> To figure out how to make VDPU346 for rk3568 work, I had a close look at
> the TRM and compared that to rk3588's TRM and compared it to your code.
> I think I may have found a few potential issue, but I may also not
> understand things correctly.
> 
> On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
>> This decoder variant is found in Rockchip RK3588 SoC family.
>>
>> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
>> output formats and level up to 5.1.
>>
>> The maximum width and height have been significantly increased
>> supporting up to 65520 pixels for both.
>>
>> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
>> ---
>>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>>  .../platform/rockchip/rkvdec/rkvdec-h264.c    |  36 --
>>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 ++++++++++++++++++
>>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 427 ++++++++++++++++
>>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 164 +++++-
>>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   6 +
>>  7 files changed, 1067 insertions(+), 38 deletions(-)
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-h264.c
>>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
>>
>> ...
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
>> new file mode 100644
>> index 0000000000000..11b545e9ee7ea
>> --- /dev/null
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
>> @@ -0,0 +1,427 @@
>> +/* SPDX-License-Identifier: GPL-2.0 */
>> +/*
>> + * Rockchip VDPU381 Video Decoder driver registers description
>> + *
>> + * Copyright (C) 2024 Collabora, Ltd.
>> + *  Detlev Casanova <detlev.casanova@collabora.com>
>> + */
>> +
>> +#include <linux/types.h>
>> +
>> +#ifndef _RKVDEC_REGS_H_
>> +#define _RKVDEC_REGS_H_
>> +
>> +#define OFFSET_COMMON_REGS		(8 * sizeof(u32))
>> +#define OFFSET_CODEC_PARAMS_REGS	(64 * sizeof(u32))
>> +#define OFFSET_COMMON_ADDR_REGS		(128 * sizeof(u32))
>> +#define OFFSET_CODEC_ADDR_REGS		(160 * sizeof(u32))
>> +#define OFFSET_POC_HIGHBIT_REGS		(200 * sizeof(u32))
>> +
>> +#define VDPU381_MODE_HEVC	0
>> +#define VDPU381_MODE_H264	1
>> +#define VDPU381_MODE_VP9	2
>> +#define VDPU381_MODE_AVS2	3
>> +
>> +#define MAX_SLICE_NUMBER	0x3fff
>> +
>> +#define RKVDEC_1080P_PIXELS		(1920 * 1080)
>> +#define RKVDEC_4K_PIXELS		(4096 * 2304)
>> +#define RKVDEC_8K_PIXELS		(7680 * 4320)
> 
> In the RK3588 TRM Part 1 paragraph 5.4.3 I can find the values for 4K
> and 8K, but the 1080P resolution seems to be 1920x1088 (not 1080).
> 
>> +#define RKVDEC_TIMEOUT_1080p		(0xefffff)
>> +#define RKVDEC_TIMEOUT_4K		(0x2cfffff)
>> +#define RKVDEC_TIMEOUT_8K		(0x4ffffff)
>> +#define RKVDEC_TIMEOUT_MAX		(0xffffffff)
>> +
>> +#define VDPU381_REG_DEC_E		0x028
>> +#define VDPU381_DEC_E_BIT		1
>> +
>> +#define VDPU381_REG_IMPORTANT_EN	0x02c
>> +#define VDPU381_DEC_IRQ_DISABLE	BIT(4)
>> +
>> +#define VDPU381_REG_STA_INT		0x380
>> +#define VDPU381_STA_INT_DEC_RDY_STA	BIT(2)
>> +#define VDPU381_STA_INT_ERROR		BIT(4)
>> +#define VDPU381_STA_INT_TIMEOUT		BIT(5)
>> +#define VDPU381_STA_INT_SOFTRESET_RDY	BIT(9)
>> +
>> +/* base: OFFSET_COMMON_REGS */
>>
>> ...
>>
>> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> index 0ccf1ba81958a..1b55fe4ff2baf 100644
>> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
>> @@ -28,6 +28,7 @@
>>  
>>  #include "rkvdec.h"
>>  #include "rkvdec-regs.h"
>> +#include "rkvdec-vdpu381-regs.h"
>>  #include "rkvdec-rcb.h"
>>  
>>  static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
>> @@ -84,11 +85,50 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ctx, u32 fourcc,
>>  	return false;
>>  }
>>  
>> +#define VDPU38X_STRIDE_ALIGN	16
>> +
>> +/**
>> + * The default v4l2_fill_pixfmt_mp() function doesn't allow for specific alignment values.
>> + * As the VDPU381 and VDPU383 need lines to be aligned on 16, use our own implementation here.
>> + */
>> +static int vdpu38x_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pix_mp, u32 pixelformat,
>> +				  u32 width, u32 height)
>> +{
>> +	const struct v4l2_format_info *info = v4l2_format_info(pix_mp->pixelformat);
>> +	struct v4l2_plane_pix_format *plane = &pix_mp->plane_fmt[0];
>> +
>> +	if (!info)
>> +		return -EINVAL;
>> +
>> +	pix_mp->num_planes = 1;
>> +
>> +	memset(plane, 0, sizeof(*plane));
>> +
>> +	plane->bytesperline = pix_mp->width * info->bpp[0] / info->bpp_div[0];
>> +	plane->bytesperline = ALIGN(plane->bytesperline, VDPU38X_STRIDE_ALIGN);
>> +
>> +	for (int i = 0; i < info->comp_planes; i++) {
>> +		unsigned int vdiv = i ? info->vdiv : 1;
>> +		unsigned int hdiv = i ? info->hdiv : 1;
>> +		unsigned int stride = DIV_ROUND_UP(pix_mp->width, hdiv)
>> +				    * info->bpp[i] / info->bpp_div[i];
>> +		unsigned int height = DIV_ROUND_UP(pix_mp->height, vdiv);
>> +
>> +		plane->sizeimage += ALIGN(stride, VDPU38X_STRIDE_ALIGN) * height;
>> +	}
>> +
>> +	return 0;
>> +}
>> +
>>  static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>>  				       struct v4l2_pix_format_mplane *pix_mp)
>>  {
>> -	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
>> -			    pix_mp->width, pix_mp->height);
>> +	struct rkvdec_config *cfg = ctx->dev->config;
>> +
>> +	cfg->fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width, pix_mp->height);
>> +
>> +	ctx->colmv_offset = pix_mp->plane_fmt[0].sizeimage;
>> +
>>  	pix_mp->plane_fmt[0].sizeimage += 128 *
>>  		DIV_ROUND_UP(pix_mp->width, 16) *
>>  		DIV_ROUND_UP(pix_mp->height, 16);
>> @@ -287,6 +327,25 @@ static const struct rkvdec_coded_fmt_desc rkvdec_coded_fmts[] = {
>>  	}
>>  };
>>  
>> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] = {
>> +	{
>> +		.fourcc = V4L2_PIX_FMT_H264_SLICE,
>> +		.frmsize = {
>> +			.min_width = 64,
>> +			.max_width =  65520,
>> +			.step_width = 64,
>> +			.min_height = 16,
>> +			.max_height =  65520,
>> +			.step_height = 16,
>> +		},
> 
> Also in the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image size" :
> 16x16 to 65520x65520; step size 16 pixels
> 
> I interpret that that .min_width and .step_width should both be 16.
> (.min_height and .step_height are correct at 16; if I read the TRM right)

The frmsize used internally for rkvdec is only meant to restrict/align
the frame buffer use while decoding, It does not reflect sizes the HW
can decode.

frmsize should typically be min 64x64 with step_height 16 and step_width
64 to ensure stride is 16 byte aligned for both 8-bit and 10-bit video.

Only max_width and max_height is used from here to signal userspace what
max res is supported, together with min/max res and step of 1.

Regards,
Jonas

> 
>> +		.ctrls = &rkvdec_h264_ctrls,
>> +		.ops = &rkvdec_vdpu381_h264_fmt_ops,
>> +		.num_decoded_fmts = ARRAY_SIZE(rkvdec_h264_decoded_fmts),
>> +		.decoded_fmts = rkvdec_h264_decoded_fmts,
>> +		.subsystem_flags = VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
>> +	},
>> +};
>> +
>>  static const struct rkvdec_coded_fmt_desc *
>>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>>  {
>> @@ -1125,6 +1184,35 @@ static irqreturn_t rk3399_irq_handler(struct rkvdec_ctx *ctx)
> 
> Cheers,
>   Diederik


