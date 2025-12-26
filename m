Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48166E8FDA6
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 26 Dec 2025 12:00:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:To:
	From:Subject:Cc:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wCiL6anloSONHQhizAmFuKQ0YGBjJQpCdmeKlo3h5+c=; b=blzqulsdZcvAOc3VLEGiCsoF8Q
	jgUrrxxcuuDT+QsvlmmedNDm4k6ZRhrC/Zmd+3cay+YZFZ9Mng7+HWrirE8p0NBMK9YYReTWERs8h
	eeJvYH7C78PnyNUEtOM7CHOhG+Jx7ALlxUJEsa3FXlElPSjr4i4f07dunH5JxKXbXDJ1NEnYtmb5w
	FDMeYDsUjkx5jCMPt5HJBYePrhg3+8UtI4p8V/LQ5jf7/alWm83igddQ8A+/G3+GDRUcR7+XQ6ZwC
	4caTEYf7dRXnK9fsVt5IPHjXMZyu/xcYdEPvo1/2QkM+oGrSW1dMFVJGytvw4qVtx7EGrZIBDTk68
	zVncMIzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ6Ui-00000001A5s-1rI7;
	Fri, 26 Dec 2025 12:00:32 +0000
Received: from out-183.mta1.migadu.com ([2001:41d0:203:375::b7])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vZ6Uf-00000001A4I-30m0
	for linux-arm-kernel@lists.infradead.org;
	Fri, 26 Dec 2025 12:00:31 +0000
Mime-Version: 1.0
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cknow-tech.com;
	s=key1; t=1766750416;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wCiL6anloSONHQhizAmFuKQ0YGBjJQpCdmeKlo3h5+c=;
	b=C/A58Ho4/0sxbYSWfMUTH0Dn3ZTEdNlS+amKjOJwQgtW0WijR6aMTbEgs8+ow+efHXNXJk
	e8IyUzq1rkJODc4YW5pWPXoSoqUoq2wREEtgN4Sm3nBPI+ihNxkokdRrxbnPmcXceC4Q2R
	pHI0PFJSUTHacoVOZSTGeBd2f6U5Bbe6FXpHZ0yjzIK5e7VeobjBLvNZaBVGE5wqqxCM6P
	+PwIKWoBDW+bqRjlnUC3mBoM4CtknZfAn73uLmEgHIzQFdrU4e30gtY1amRAranKbsORcP
	xB2ybKxexps+otWuQJ0H8DNhCa3iA3cRXNEykNuNi/AfZD0eiQkTsStu/dpnlA==
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Fri, 26 Dec 2025 13:00:04 +0100
Message-Id: <DF84QZ0YBLY8.2DYCSM2EQIF5@cknow-tech.com>
Cc: =?utf-8?q?Olivier_Cr=C3=AAte?= <olivier.crete@collabora.com>, "Ezequiel
 Garcia" <ezequiel@vanguardiasur.com.ar>, "Mauro Carvalho Chehab"
 <mchehab@kernel.org>, "Rob Herring" <robh@kernel.org>, "Krzysztof
 Kozlowski" <krzk+dt@kernel.org>, "Conor Dooley" <conor+dt@kernel.org>,
 "Heiko Stuebner" <heiko@sntech.de>, "Diederik de Haas"
 <diederik@cknow-tech.com>, "Dmitry Osipenko"
 <dmitry.osipenko@collabora.com>, "Thomas Gleixner" <tglx@linutronix.de>,
 "Dragan Simic" <dsimic@manjaro.org>, "Chukun Pan" <amadeus@jmu.edu.cn>,
 <linux-media@vger.kernel.org>, <linux-rockchip@lists.infradead.org>,
 <devicetree@vger.kernel.org>, <linux-arm-kernel@lists.infradead.org>,
 <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH v2 2/3] media: rkvdec: Add support for the VDPU346
 variant
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: "Diederik de Haas" <diederik@cknow-tech.com>
To: "Christian Hewitt" <christianshewitt@gmail.com>, "Detlev Casanova"
 <detlev.casanova@collabora.com>, "Nicolas Dufresne"
 <nicolas.collabora@collabora.com>
References: <20251226113140.573759-1-christianshewitt@gmail.com>
 <20251226113140.573759-3-christianshewitt@gmail.com>
In-Reply-To: <20251226113140.573759-3-christianshewitt@gmail.com>
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251226_040029_895964_7195BDB6 
X-CRM114-Status: GOOD (  19.87  )
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

Hi Christian,

On Fri Dec 26, 2025 at 12:31 PM CET, Christian Hewitt wrote:
> VDPU346 is similar to VDPU381 but with a single core and limited
> to 4K60 media. It is also limited to H264 L5.1 and omits AV1 and
> AVS2 capabilities. VDPU346 is used with RK3566 and RK3568.
>
> Signed-off-by: Christian Hewitt <christianshewitt@gmail.com>
> Reviewed-by: Nicolas Dufresne <nicolas.collabora@collabora.com>
> ---
>  .../media/platform/rockchip/rkvdec/rkvdec.c   | 103 ++++++++++++++++++
>  1 file changed, 103 insertions(+)
>
> diff --git a/drivers/media/platform/rockchip/rkvdec/rkvdec.c b/drivers/me=
dia/platform/rockchip/rkvdec/rkvdec.c
> index e547057dc75f..6b39e99d8a8b 100644
> --- a/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> +++ b/drivers/media/platform/rockchip/rkvdec/rkvdec.c
> @@ -236,6 +236,62 @@ static const struct rkvdec_ctrls rkvdec_hevc_ctrls =
=3D {
>  	.num_ctrls =3D ARRAY_SIZE(rkvdec_hevc_ctrl_descs),
>  };
> =20
> +static const struct rkvdec_ctrl_desc vdpu346_hevc_ctrl_descs[] =3D {
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_PPS,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_SCALING_MATRIX,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_MODE,
> +		.cfg.min =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +		.cfg.max =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +		.cfg.def =3D V4L2_STATELESS_HEVC_DECODE_MODE_FRAME_BASED,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_START_CODE,
> +		.cfg.min =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +		.cfg.def =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +		.cfg.max =3D V4L2_STATELESS_HEVC_START_CODE_ANNEX_B,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_PROFILE,
> +		.cfg.min =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +		.cfg.max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +		.cfg.menu_skip_mask =3D
> +			BIT(V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE),
> +		.cfg.def =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_MPEG_VIDEO_HEVC_LEVEL,
> +		.cfg.min =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_1,
> +		.cfg.max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +		.cfg.dims =3D { 65 },
> +	},
> +	{
> +		.cfg.id =3D V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS,
> +		.cfg.ops =3D &rkvdec_ctrl_ops,
> +		.cfg.dims =3D { 65 },
> +	},
> +};
> +
> +static const struct rkvdec_ctrls vdpu346_hevc_ctrls =3D {
> +	.ctrls =3D vdpu346_hevc_ctrl_descs,
> +	.num_ctrls =3D ARRAY_SIZE(vdpu346_hevc_ctrl_descs),
> +};
> +
>  static const struct rkvdec_ctrl_desc vdpu38x_hevc_ctrl_descs[] =3D {
>  	{
>  		.cfg.id =3D V4L2_CID_STATELESS_HEVC_DECODE_PARAMS,
> @@ -463,6 +519,41 @@ static const struct rkvdec_coded_fmt_desc rk3288_cod=
ed_fmts[] =3D {
>  	}
>  };
> =20
> +static const struct rkvdec_coded_fmt_desc vdpu346_coded_fmts[] =3D {
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D 65472,

This should be 4096 according to page 469 of RK3568 TRM Part 2 ...

> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D 65472,

... and this 2304.

> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &vdpu346_hevc_ctrls,
> +		.ops =3D &rkvdec_vdpu381_hevc_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_hevc_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_hevc_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},
> +	{
> +		.fourcc =3D V4L2_PIX_FMT_H264_SLICE,
> +		.frmsize =3D {
> +			.min_width =3D 64,
> +			.max_width =3D  65520,

This too should be 4096 according to page 469 of RK3568 TRM Part 2 ...

> +			.step_width =3D 64,
> +			.min_height =3D 64,
> +			.max_height =3D  65520,

... and this 2304.

I guess this also explains the 'green images' Nicolas noticed.

> +			.step_height =3D 16,
> +		},
> +		.ctrls =3D &rkvdec_h264_ctrls,
> +		.ops =3D &rkvdec_vdpu381_h264_fmt_ops,
> +		.num_decoded_fmts =3D ARRAY_SIZE(rkvdec_h264_decoded_fmts),
> +		.decoded_fmts =3D rkvdec_h264_decoded_fmts,
> +		.subsystem_flags =3D VB2_V4L2_FL_SUPPORTS_M2M_HOLD_CAPTURE_BUF,
> +	},

I see you've reversed the order of the blocks so that HEVC now comes
before the H264 block. While that makes it consistent with what Detlev
has in their v7 and with the existing code in the driver ... I actually
prefer having H264 before HEVC as the alphabetical sorting order is
H264 before HEVC.
In the existing code the VP9 'stuff' is listed below H264 and HEVC.

But then Detlev should do that too in their patch set ... and 'ideally'
the order of the existing code be updated to be alphabetically too.

OTOH, a consistent order works for me too.

Cheers,
  Diederik

> +};
> +
>  static const struct rkvdec_coded_fmt_desc vdpu381_coded_fmts[] =3D {
>  	{
>  		.fourcc =3D V4L2_PIX_FMT_HEVC_SLICE,
> @@ -1643,6 +1734,14 @@ static const struct rkvdec_variant_ops vdpu381_var=
iant_ops =3D {
>  	.flatten_matrices =3D transpose_and_flatten_matrices,
>  };
> =20
> +static const struct rkvdec_variant vdpu346_variant =3D {
> +	.coded_fmts =3D vdpu346_coded_fmts,
> +	.num_coded_fmts =3D ARRAY_SIZE(vdpu346_coded_fmts),
> +	.rcb_sizes =3D vdpu381_rcb_sizes,
> +	.num_rcb_sizes =3D ARRAY_SIZE(vdpu381_rcb_sizes),
> +	.ops =3D &vdpu381_variant_ops,
> +};
> +
>  static const struct rkvdec_variant vdpu381_variant =3D {
>  	.coded_fmts =3D vdpu381_coded_fmts,
>  	.num_coded_fmts =3D ARRAY_SIZE(vdpu381_coded_fmts),
> @@ -1691,6 +1790,10 @@ static const struct of_device_id of_rkvdec_match[]=
 =3D {
>  		.compatible =3D "rockchip,rk3399-vdec",
>  		.data =3D &rk3399_rkvdec_variant,
>  	},
> +	{
> +		.compatible =3D "rockchip,rk3568-vdec",
> +		.data =3D &vdpu346_variant,
> +	},
>  	{
>  		.compatible =3D "rockchip,rk3588-vdec",
>  		.data =3D &vdpu381_variant,


