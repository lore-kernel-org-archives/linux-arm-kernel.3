Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CE42CCAC5A7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 20 Sep 2025 15:00:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Mime-Version:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ijOJzmdzRDKd9dcL3XghcGraqozcSVhpfrfjEqKGU1w=; b=uy7nl1aqxIgZrE3KnKgvTAq42h
	377SDtNguEf6DOHRPH70haiT5EWRgruLfPFcqbL+/xR2k7CkORgK/D95ULe4rHK071m9Rt2oVnIP2
	iFgekG7UAkywOWMjma/5ZbHxwoQj9q6tSO3XPa7gIx71QKV0pbgZ+k/uQpzZyg7b0Cl4LxYUxH4+3
	F57o54rn8MaqiZWZoxS3xwlkvbFRfDflrxir71j2Dd7jUi3bH9xa1crQBVgc+d/dfyj0kakKce/Jc
	B/UNMZjfJJitILtF6rZsGiGINVLs+BsOjrFT7h37ome/MwW7VhGdzP9VOQRyVn/Ukq2v2OgB63nVO
	nphkJFxw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzz4l-00000005V9s-0GGb;
	Sat, 20 Sep 2025 15:00:35 +0000
Received: from out-189.mta1.migadu.com ([95.215.58.189])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzz4i-00000005V8t-2mbD
	for linux-arm-kernel@lists.infradead.org;
	Sat, 20 Sep 2025 15:00:34 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow.org; s=key1;
	t=1758380426;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ijOJzmdzRDKd9dcL3XghcGraqozcSVhpfrfjEqKGU1w=;
	b=zCtmgdrmEsYTM0cuSGcVI8mxDkJGlqh6Eh2X0sslv5WLy3al2Hb4vbc8LGnpC4Ej4QJnfh
	Z+lNaoIYxcqQ/9JxPcYszt+Vz22qeimwbPGlIWZ9KfvRGuxSh9h4qvH/3eM3dHNUOa6ubZ
	DSzlm5c+ZkclAcyfrIhU1QKUXPReeGyjKvBugGR/ZXYXt4YP1uSljgXgtcPtL4sJP5iWsq
	pYCwGwegCV8rCD/kFVivcGHw7zRhVx2hjFpWg3uWC45T9jVl0beRYiahFU4jQSYfOAO8Lw
	O0ztuybJecCAz12ByrbxNjeqE93PDMKHuv1YazmpBQHxBy8uN5Ha3n11KjAM0Q==
Content-Type: multipart/signed;
 boundary=b9fa74363659b670e23c1dce98bffde2f9949cfa8c820d422a3b42c86d81;
 micalg=pgp-sha512; protocol="application/pgp-signature"
Date: Sat, 20 Sep 2025 17:00:07 +0200
Message-Id: <DCXPTZRNNTDY.1773L2181HWF@cknow.org>
Cc: "Mauro Carvalho Chehab" <mchehab@kernel.org>, "Heiko Stuebner"
 <heiko@sntech.de>, <linux-media@vger.kernel.org>,
 <linux-rockchip@lists.infradead.org>,
 <linux-arm-kernel@lists.infradead.org>, <kernel@collabora.com>
Subject: Re: [PATCH v2 09/12] media: rkvdec: Add H264 support for the
 VDPU381 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <didi.debian@cknow.org>
To: "Detlev Casanova" <detlev.casanova@collabora.com>,
 <linux-kernel@vger.kernel.org>
References: <20250808200340.156393-1-detlev.casanova@collabora.com>
 <20250808200340.156393-10-detlev.casanova@collabora.com>
In-Reply-To: <20250808200340.156393-10-detlev.casanova@collabora.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250920_080033_445639_63F0AD84 
X-CRM114-Status: GOOD (  33.37  )
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

--b9fa74363659b670e23c1dce98bffde2f9949cfa8c820d422a3b42c86d81
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8

Hi Detlev,

Thanks a LOT for this patch set!
As already reported the results were quite impressive :-D

To figure out how to make VDPU346 for rk3568 work, I had a close look at
the TRM and compared that to rk3588's TRM and compared it to your code.
I think I may have found a few potential issue, but I may also not
understand things correctly.

On Fri Aug 8, 2025 at 10:03 PM CEST, Detlev Casanova wrote:
> This decoder variant is found in Rockchip RK3588 SoC family.
>
> Like for rkvdec on rk3399, it supports the NV12, NV15, NV16 and NV20
> output formats and level up to 5.1.
>
> The maximum width and height have been significantly increased
> supporting up to 65520 pixels for both.
>
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/Makefile   |   1 +
>  .../rockchip/rkvdec/rkvdec-h264-common.h      |   2 +
>  .../platform/rockchip/rkvdec/rkvdec-h264.c    |  36 --
>  .../rockchip/rkvdec/rkvdec-vdpu381-h264.c     | 469 ++++++++++++++++++
>  .../rockchip/rkvdec/rkvdec-vdpu381-regs.h     | 427 ++++++++++++++++
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 164 +++++-
>  .../media/platform/rockchip/rkvdec/rkvdec.h   |   6 +
>  7 files changed, 1067 insertions(+), 38 deletions(-)
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381=
-h264.c
>  create mode 100644 drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381=
-regs.h
>
> ...
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h=
 b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> new file mode 100644
> index 0000000000000..11b545e9ee7ea
> --- /dev/null
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec-vdpu381-regs.h
> @@ -0,0 +1,427 @@
> +/* SPDX-License-Identifier: GPL-2.0 */
> +/*
> + * Rockchip VDPU381 Video Decoder driver registers description
> + *
> + * Copyright (C) 2024 Collabora, Ltd.
> + *  Detlev Casanova <detlev.casanova@collabora.com>
> + */
> +
> +#include <linux/types.h>
> +
> +#ifndef _RKVDEC_REGS_H_
> +#define _RKVDEC_REGS_H_
> +
> +#define OFFSET_COMMON_REGS		(8 * sizeof(u32))
> +#define OFFSET_CODEC_PARAMS_REGS	(64 * sizeof(u32))
> +#define OFFSET_COMMON_ADDR_REGS		(128 * sizeof(u32))
> +#define OFFSET_CODEC_ADDR_REGS		(160 * sizeof(u32))
> +#define OFFSET_POC_HIGHBIT_REGS		(200 * sizeof(u32))
> +
> +#define VDPU381_MODE_HEVC	0
> +#define VDPU381_MODE_H264	1
> +#define VDPU381_MODE_VP9	2
> +#define VDPU381_MODE_AVS2	3
> +
> +#define MAX_SLICE_NUMBER	0x3fff
> +
> +#define RKVDEC_1080P_PIXELS		(1920 * 1080)
> +#define RKVDEC_4K_PIXELS		(4096 * 2304)
> +#define RKVDEC_8K_PIXELS		(7680 * 4320)

In the RK3588 TRM Part 1 paragraph 5.4.3 I can find the values for 4K
and 8K, but the 1080P resolution seems to be 1920x1088 (not 1080).

> +#define RKVDEC_TIMEOUT_1080p		(0xefffff)
> +#define RKVDEC_TIMEOUT_4K		(0x2cfffff)
> +#define RKVDEC_TIMEOUT_8K		(0x4ffffff)
> +#define RKVDEC_TIMEOUT_MAX		(0xffffffff)
> +
> +#define VDPU381_REG_DEC_E		0x028
> +#define VDPU381_DEC_E_BIT		1
> +
> +#define VDPU381_REG_IMPORTANT_EN	0x02c
> +#define VDPU381_DEC_IRQ_DISABLE	BIT(4)
> +
> +#define VDPU381_REG_STA_INT		0x380
> +#define VDPU381_STA_INT_DEC_RDY_STA	BIT(2)
> +#define VDPU381_STA_INT_ERROR		BIT(4)
> +#define VDPU381_STA_INT_TIMEOUT		BIT(5)
> +#define VDPU381_STA_INT_SOFTRESET_RDY	BIT(9)
> +
> +/* base: OFFSET_COMMON_REGS */
>
> ...
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index 0ccf1ba81958a..1b55fe4ff2baf 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -28,6 +28,7 @@
> =20
>  #include "rkvdec.h"
>  #include "rkvdec-regs.h"
> +#include "rkvdec-vdpu381-regs.h"
>  #include "rkvdec-rcb.h"
> =20
>  static bool rkvdec_image_fmt_match(enum rkvdec_image_fmt fmt1,
> @@ -84,11 +85,50 @@ static bool rkvdec_is_valid_fmt(struct rkvdec_ctx *ct=
x, u32 fourcc,
>  	return false;
>  }
> =20
> +#define VDPU38X_STRIDE_ALIGN	16
> +
> +/**
> + * The default v4l2_fill_pixfmt_mp() function doesn't allow for specific=
 alignment values.
> + * As the VDPU381 and VDPU383 need lines to be aligned on 16, use our ow=
n implementation here.
> + */
> +static int vdpu38x_fill_pixfmt_mp(struct v4l2_pix_format_mplane *pix_mp,=
 u32 pixelformat,
> +				  u32 width, u32 height)
> +{
> +	const struct v4l2_format_info *info =3D v4l2_format_info(pix_mp->pixelf=
ormat);
> +	struct v4l2_plane_pix_format *plane =3D &pix_mp->plane_fmt[0];
> +
> +	if (!info)
> +		return -EINVAL;
> +
> +	pix_mp->num_planes =3D 1;
> +
> +	memset(plane, 0, sizeof(*plane));
> +
> +	plane->bytesperline =3D pix_mp->width * info->bpp[0] / info->bpp_div[0]=
;
> +	plane->bytesperline =3D ALIGN(plane->bytesperline, VDPU38X_STRIDE_ALIGN=
);
> +
> +	for (int i =3D 0; i < info->comp_planes; i++) {
> +		unsigned int vdiv =3D i ? info->vdiv : 1;
> +		unsigned int hdiv =3D i ? info->hdiv : 1;
> +		unsigned int stride =3D DIV_ROUND_UP(pix_mp->width, hdiv)
> +				    * info->bpp[i] / info->bpp_div[i];
> +		unsigned int height =3D DIV_ROUND_UP(pix_mp->height, vdiv);
> +
> +		plane->sizeimage +=3D ALIGN(stride, VDPU38X_STRIDE_ALIGN) * height;
> +	}
> +
> +	return 0;
> +}
> +
>  static void rkvdec_fill_decoded_pixfmt(struct rkvdec_ctx *ctx,
>  				       struct v4l2_pix_format_mplane *pix_mp)
>  {
> -	v4l2_fill_pixfmt_mp(pix_mp, pix_mp->pixelformat,
> -			    pix_mp->width, pix_mp->height);
> +	struct rkvdec_config *cfg =3D ctx->dev->config;
> +
> +	cfg->fill_pixfmt_mp(pix_mp, pix_mp->pixelformat, pix_mp->width, pix_mp-=
>height);
> +
> +	ctx->colmv_offset =3D pix_mp->plane_fmt[0].sizeimage;
> +
>  	pix_mp->plane_fmt[0].sizeimage +=3D 128 *
>  		DIV_ROUND_UP(pix_mp->width, 16) *
>  		DIV_ROUND_UP(pix_mp->height, 16);
> @@ -287,6 +327,25 @@ static const struct rkvdec_coded_fmt_desc rkvdec_cod=
ed_fmts[] =3D {
>  	}
>  };
> =20
> +static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D  65520,
> +			.step_width =3D 64,
> +			.min_height =3D 16,
> +			.max_height =3D  65520,
> +			.step_height =3D 16,
> +		},

Also in the RK3588 TRM Part 1 paragraph 5.4.3, I see "Supported image size"=
 :
16x16 to 65520x65520; step size 16 pixels

I interpret that that .min_width and .step_width should both be 16.
(.min_height and .step_height are correct at 16; if I read the TRM right)

> +		.ctrls =3D &rkvdec_h264_ctrls,
> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +};
> +
>  static const struct rkvdec_coded_fmt_desc *
>  rkvdec_find_coded_fmt_desc(struct rkvdec_ctx *ctx, u32 fourcc)
>  {
> @@ -1125,6 +1184,35 @@ static irqreturn_t rk3399_irq_handler(struct rkvde=
c_ctx *ctx)

Cheers,
  Diederik

--b9fa74363659b670e23c1dce98bffde2f9949cfa8c820d422a3b42c86d81
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQT1sUPBYsyGmi4usy/XblvOeH7bbgUCaM7BggAKCRDXblvOeH7b
bpgmAQCFDGMgDVQ1jCwy/pQMoyeJggzfPDXfxF075j1Mf44bpQD6A3aEPqu/IG3M
dq8uGQQ/2TiBUsOPasKNSUPOOQwsdAc=
=Wwg0
-----END PGP SIGNATURE-----

--b9fa74363659b670e23c1dce98bffde2f9949cfa8c820d422a3b42c86d81--

