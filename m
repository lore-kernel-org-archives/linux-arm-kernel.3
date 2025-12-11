Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F9CD43341
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 11 Dec 2025 20:19:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wLmTNLY9jltwCBDOjms4cVz7/2EoiAZBOrzmGnpwCVQ=; b=2k0Ym0piUgoBieudc/O6LStAcb
	CdjVjw5dLkdRj4awcdHMTmmzSFtAklB30suegMIRqFyg6Tu9nyMOFyP0SODW9M/ygVfXU5/QsRDTy
	vgMJmbmQl+E7G5uivL5YEYjhMn/Un1MDveKO+kEGi5ejpkJv7SSecGv3pfcwJpAl06MNkZZXCn6Fi
	bJqw30O8U0XS3NPX0BZzkmIMFbfFyc+TAteuNK2lrtJ5ai8CQzUz/h0d0c+g211a9yOcmjlO3akAl
	4NrlpUTGXdufkTTqb3ILxECiPEJxud2/RHamgjCVuXtYlYxl2VcEiV6iNY8+COnIVKnkapIp2smDC
	v4coNjLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTn88-0000000HDHP-0vPJ;
	Thu, 11 Dec 2025 20:19:16 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTn85-0000000HDGr-0OxO;
	Thu, 11 Dec 2025 20:19:14 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765484348;
	bh=XQ7NjUCQ+NG0vu6PPkPvlyCWjhQd7NVea8EeMR4GNjw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=cf2rWLzBUcvs10L0K79b3rrCOBZEia5Ft5mkQ0QZq50zpRg1cLPytDUm18fZX5UHO
	 i18xK6iBJbAWoAhVPVbHYV+cAculuYk9utaWYJkxOBy2lULIAnQqwPF4iM3w1ilLHQ
	 ffbv0r0TiSzrMs3q63NSc5zeMVOeHMk8wjjxKvFC/asNbBTjHChhh7BjtENjXqu68k
	 TjlK6hzUaE8fn3c2AOU1lFOHdGwKyA6OjDZYnTV8NPeqm1F4SJmt8qzir1I/hxq626
	 B1v5iVhnT1uEkApWK8+C1WH+QnDid5e+3oN1bu5MwpPLGz+1vysGZ8pV5jAlJvzTSe
	 X40jRkqZA5qiQ==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0DBA117E00A8;
	Thu, 11 Dec 2025 21:19:05 +0100 (CET)
Message-ID: <370389b51412209ae6aa6d8c388f29af7ed456a5.camel@collabora.com>
Subject: Re: [PATCH v6 04/10] media: mediatek: vcodec: add profile and level
 supporting for MT8189
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Kyrie Wu <kyrie.wu@mediatek.com>, Tiffany Lin
 <tiffany.lin@mediatek.com>,  Andrew-CT Chen <andrew-ct.chen@mediatek.com>,
 Yunfei Dong <yunfei.dong@mediatek.com>, Mauro Carvalho Chehab	
 <mchehab@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski	
 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Matthias Brugger	
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Hans Verkuil
 <hverkuil@xs4all.nl>,  Nathan Hebert <nhebert@chromium.org>, Arnd Bergmann
 <arnd@arndb.de>, Irui Wang <irui.wang@mediatek.com>,  George Sun
 <george.sun@mediatek.com>, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, 	linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>, Yilong Zhou <yilong.zhou@mediatek.com>
Date: Thu, 11 Dec 2025 15:19:04 -0500
In-Reply-To: <20251202074038.3173-5-kyrie.wu@mediatek.com>
References: <20251202074038.3173-1-kyrie.wu@mediatek.com>
	 <20251202074038.3173-5-kyrie.wu@mediatek.com>
Autocrypt: addr=nicolas.dufresne@collabora.com; prefer-encrypt=mutual;
 keydata=mDMEaCN2ixYJKwYBBAHaRw8BAQdAM0EHepTful3JOIzcPv6ekHOenE1u0vDG1gdHFrChD
 /e0J05pY29sYXMgRHVmcmVzbmUgPG5pY29sYXNAbmR1ZnJlc25lLmNhPoicBBMWCgBEAhsDBQsJCA
 cCAiICBhUKCQgLAgQWAgMBAh4HAheABQkJZfd1FiEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrjo
 CGQEACgkQ2UGUUSlgcvQlQwD/RjpU1SZYcKG6pnfnQ8ivgtTkGDRUJ8gP3fK7+XUjRNIA/iXfhXMN
 abIWxO2oCXKf3TdD7aQ4070KO6zSxIcxgNQFtDFOaWNvbGFzIER1ZnJlc25lIDxuaWNvbGFzLmR1Z
 nJlc25lQGNvbGxhYm9yYS5jb20+iJkEExYKAEECGwMFCwkIBwICIgIGFQoJCAsCBBYCAwECHgcCF4
 AWIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaCyyxgUJCWX3dQAKCRDZQZRRKWBy9ARJAP96pFmLffZ
 smBUpkyVBfFAf+zq6BJt769R0al3kHvUKdgD9G7KAHuioxD2v6SX7idpIazjzx8b8rfzwTWyOQWHC
 AAS0LU5pY29sYXMgRHVmcmVzbmUgPG5pY29sYXMuZHVmcmVzbmVAZ21haWwuY29tPoiZBBMWCgBBF
 iEE7w1SgRXEw8IaBG8S2UGUUSlgcvQFAmibrGYCGwMFCQll93UFCwkIBwICIgIGFQoJCAsCBBYCAw
 ECHgcCF4AACgkQ2UGUUSlgcvRObgD/YnQjfi4+L8f4fI7p1pPMTwRTcaRdy6aqkKEmKsCArzQBAK8
 bRLv9QjuqsE6oQZra/RB4widZPvphs78H0P6NmpIJ
Organization: Collabora Canada
Content-Type: multipart/signed; micalg="pgp-sha512";
	protocol="application/pgp-signature"; boundary="=-+eslNUY9ruhNLkvyalK4"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251211_121913_439792_0751585D 
X-CRM114-Status: GOOD (  17.46  )
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


--=-+eslNUY9ruhNLkvyalK4
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

in the subject, supporting -> suppport.

Le mardi 02 d=C3=A9cembre 2025 =C3=A0 15:40 +0800, Kyrie Wu a =C3=A9crit=C2=
=A0:
> add profile and level supporting for H264 and vp9 of MT8189

You already said that, perhaps say:


   The MT8189 SoC support H.264 up to high-10 at level 5.2, HEVC up to prof=
ile
   main-still at level 4 and VP9 profile 2 up to level 5.2.=20

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> ---
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 |=C2=A0 16 ++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 |=C2=A0 12 ++
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 177 ++++++++++-----=
---
> =C2=A03 files changed, 130 insertions(+), 75 deletions(-)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index 2dbde8d00e6f..a8baeab98477 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -76,6 +76,16 @@ struct vdec_pic_info {
> =C2=A0	unsigned int reserved;
> =C2=A0};
> =C2=A0
> +/**
> + * struct mtk_vcodec_dec_params - decoder supported parameters
> + * @level: decoder supported vcodec level
> + * @profile: decoder supported vcodec profile
> + */
> +struct mtk_vcodec_dec_params {
> +	s64 level;
> +	s64 profile;
> +};
> +
> =C2=A0/**
> =C2=A0 * struct mtk_vcodec_dec_pdata - compatible data for each IC
> =C2=A0 * @init_vdec_params: init vdec params
> @@ -96,6 +106,9 @@ struct vdec_pic_info {
> =C2=A0 * @is_subdev_supported: whether support parent-node architecture(s=
ubdev)
> =C2=A0 * @uses_stateless_api: whether the decoder uses the stateless API =
with
> requests
> =C2=A0 * @chip_name: platforms configuration values
> + * @h264_params: H264 decoder default supported params
> + * @h265_params: H265 decoder default supported params
> + * @vp9_params: VP9 decoder default supported params
> =C2=A0 */
> =C2=A0struct mtk_vcodec_dec_pdata {
> =C2=A0	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
> @@ -118,6 +131,9 @@ struct mtk_vcodec_dec_pdata {
> =C2=A0	bool is_subdev_supported;
> =C2=A0	bool uses_stateless_api;
> =C2=A0	unsigned int chip_name;
> +	struct mtk_vcodec_dec_params h264_params;
> +	struct mtk_vcodec_dec_params h265_params;
> +	struct mtk_vcodec_dec_params vp9_params;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> index 8ddb61670dc6..a47906b9d717 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -619,4 +619,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8173,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> index 9e43c54f8c4d..dc3e9a2ccc2c 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> @@ -549,106 +549,49 @@ static const struct v4l2_ctrl_ops
> mtk_vcodec_dec_ctrl_ops =3D {
> =C2=A0static void mtk_vcodec_dec_fill_h264_level(struct v4l2_ctrl_config =
*cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8192:
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
> -		break;
> -	case 8183:
> -	case 8186:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_1;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h264_params.level;
> =C2=A0}

Only remaining issue is that this is two changes. Please refactor first, an=
d add
the configuration after. This is a nice cleanup.

regards,
Nicolas

> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h264_profile(struct v4l2_ctrl_confi=
g *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h264_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h265_level(struct v4l2_ctrl_config =
*cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h265_params.level;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_h265_profile(struct v4l2_ctrl_confi=
g *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->h265_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_vp9_level(struct v4l2_ctrl_config *=
cfg,
> =C2=A0					=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8192:
> -	case 8188:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
> -		break;
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
> -		break;
> -	case 8186:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->vp9_params.level;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_fill_vp9_profile(struct v4l2_ctrl_config=
 *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> -	switch (ctx->dev->chip_name) {
> -	case 8188:
> -	case 8195:
> -	case 8196:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2;
> -		break;
> -	default:
> -		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1;
> -		break;
> -	}
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> +
> +	cfg->max =3D pdev->vdec_pdata->vp9_params.profile;
> =C2=A0}
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_reset_controls(struct v4l2_ctrl_config *=
cfg,
> @@ -887,6 +830,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8183,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0/* This platform data is used for one lat and one core architecture=
. */
> @@ -923,6 +878,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8188,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
> @@ -941,6 +908,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8192,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata =3D {
> @@ -959,6 +938,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8195,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata =3D {
> @@ -977,6 +968,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdat=
a =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8196,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata =3D {
> @@ -1012,6 +1015,18 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pd=
ata =3D
> {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8186,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +	},
> =C2=A0};
> =C2=A0
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pdata =3D {
> @@ -1030,4 +1045,16 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pd=
ata =3D
> {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0	.chip_name =3D 8189,
> +	.h264_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10,
> +	},
> +	.h265_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_4,
> +		.profile =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_STILL_PICTURE,
> +	},
> +	.vp9_params =3D {
> +		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> +		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +	},
> =C2=A0};

--=-+eslNUY9ruhNLkvyalK4
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTsnOAAKCRDZQZRRKWBy
9F6xAP0cn4qiXi09cNHJcNVeyZ9YfLVJFP7GZiLYXfeaWpKSjAD/Q0VIncVxeShn
r8dpg/dPdsTl49aAFvzwg/7Y44LcQQ4=
=GJ5l
-----END PGP SIGNATURE-----

--=-+eslNUY9ruhNLkvyalK4--

