Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 582371091903
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 18:08:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=l9IqX/iHSIPxOzOm7P4PfxVq+Zc4aqzUyEtGWrJGn3w=; b=TYdq5Ki9OOpJ79FkdMc5ykQDqh
	E3JE6Pliy5oAKehk/9FRU+1gIYNHyoKNL63chvMP0HsaTYA/X6eirKO0IGApTAioDZMEJB6dpGrX9
	BdyAUgTjhifASrQJY+QiFD9l3eo2PVJneqaZZlzPUsq8B0RLMbG80aFQGqD4BqvFJW8SbaZUsRluW
	+mOFMJU1DXLDIfGV97ocfCNGT5cDgFKm/12jx3l+Fic3aQbt8rxMVxm+vnONiDwfOfxq8GY84g1nX
	d+k/ehvXbvCBMiWSCz8wxNjxCfa+qjozRoaoxbMdcEnLoW7brVvPA1CNDlFZ5PrpaokHTAC9P5cnB
	P2gcs6Xg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HnY-0000000BGWS-12Pe;
	Thu, 19 Mar 2026 18:08:44 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3HnW-0000000BGW2-02Kw;
	Thu, 19 Mar 2026 18:08:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773943719;
	bh=CyVBrdlwbt7DQU43THi/VI2dRqZPYg7NHLiRkbNCHA4=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=FW2rYClw1MYxUezmzvZeFgF3KZ8ZtXaNh7cU21bYdITjo50zSZIx+T31h4ZDI3LTX
	 us0KsSUqRi9YdM3z3cReZINNTvC6RzkDZGcFwlT8qiKT5DMRCoGOP0pMkWGxGYPAum
	 hTABeUfJD0eBwPbp2EqHQUbtg3so81PLaB4rbSfWSCahp0sOwrwTuD2jbO71S36OBT
	 pGBFh7Ajszjzhj0uI9y4EIeyGszmRwPm1AxVeoheWwoRmYFZs+8l9Eazw1LG4781nT
	 iwYUalrPwBli9WxHxXGJ4ACC5BjhEDU8x0o+P9zat7BI49nNkfsra6odalvmgpCBm3
	 A84zB9OzqWb4g==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id D811D17E127A;
	Thu, 19 Mar 2026 19:08:36 +0100 (CET)
Message-ID: <f5856dea6aa27d9be0abec8d27a2ffe79fb7cccf.camel@collabora.com>
Subject: Re: [PATCH v7 06/10] media: mediatek: vcodec: Add VP9 Probability
 Size Configuration
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
Date: Thu, 19 Mar 2026 14:08:35 -0400
In-Reply-To: <20260127024248.18406-7-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-7-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-M5Ch18Kp01gKBrDsnD66"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_110842_243930_3FB91477 
X-CRM114-Status: GOOD (  18.12  )
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


--=-M5Ch18Kp01gKBrDsnD66
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> This commit introduces support for configuring the VP9 decoder
> probability buffer size. It removes hard-coded values and ensures
> chipset-specific buffer sizes are handled dynamically, improving
> maintainability and alignment.

Similar to my previous request, add the prob_size before any MT8189 changes=
, and
then make one patch that adds MT8189 pdata.

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 |=C2=A0 2 ++
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 |=C2=A0=
 1 +
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c | 10 +++++++=
+++
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp9_req_lat_if.c |=C2=A0 4 ++=
--
> =C2=A04 files changed, 15 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index f38b5dc4bb74..08cc65054de5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -80,10 +80,12 @@ struct vdec_pic_info {
> =C2=A0 * struct mtk_vcodec_dec_params - decoder supported parameters
> =C2=A0 * @level: decoder supported vcodec level
> =C2=A0 * @profile: decoder supported vcodec profile
> + * @prob_size: vp9 decoder probability size
> =C2=A0 */
> =C2=A0struct mtk_vcodec_dec_params {
> =C2=A0	s64 level;
> =C2=A0	s64 profile;
> +	size_t prob_size;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateful.c
> index a47906b9d717..99c252e0a2e1 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -630,5 +630,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D 2560,
> =C2=A0	},
> =C2=A0};
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index b571c4ed3f79..ca39ae3571a3 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -10,6 +10,9 @@
> =C2=A0#include "mtk_vcodec_dec_pm.h"
> =C2=A0#include "vdec_drv_if.h"
> =C2=A0
> +#define VP9_PROB_BUF_SIZE 2560
> +#define VP9_4K_PROB_BUF_SIZE 3840
> +
> =C2=A0/**
> =C2=A0 * struct mtk_stateless_control=C2=A0 - CID control type
> =C2=A0 * @cfg: control configuration
> @@ -841,6 +844,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_0,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -892,6 +896,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -910,6 +915,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -928,6 +934,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -946,6 +953,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D VP9_4K_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -981,6 +989,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata=
 =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_1,
> +		.prob_size =3D VP9_PROB_BUF_SIZE,
> =C2=A0	},
> =C2=A0};
> =C2=A0
> @@ -1011,5 +1020,6 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8189_pda=
ta =3D {
> =C2=A0	.vp9_params =3D {
> =C2=A0		.level =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2,
> =C2=A0		.profile =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2,
> +		.prob_size =3D VP9_4K_PROB_BUF_SIZE,
> =C2=A0	},

So hunk change will be squashed, everything else is refactoring.

Nicolas

> =C2=A0};
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 82e257bd059f..e8ba99d31e74 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -22,7 +22,6 @@
> =C2=A0#define VP9_RESET_FRAME_CONTEXT_ALL 3
> =C2=A0
> =C2=A0#define VP9_TILE_BUF_SIZE 4096
> -#define VP9_PROB_BUF_SIZE 2560
> =C2=A0#define VP9_COUNTS_BUF_SIZE 16384
> =C2=A0
> =C2=A0#define HDR_FLAG(x) (!!((hdr)->flags & V4L2_VP9_FRAME_FLAG_##x))
> @@ -546,6 +545,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct=
 vdec_vp9_slice_instance *i
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 struct vdec_vp9_slice_vsi=
 *vsi)
> =C2=A0{
> =C2=A0	struct mtk_vcodec_dec_ctx *ctx =3D instance->ctx;
> +	struct mtk_vcodec_dec_dev *pdev =3D ctx->dev;
> =C2=A0	enum vdec_vp9_slice_resolution_level level;
> =C2=A0	/* super blocks */
> =C2=A0	unsigned int max_sb_w;
> @@ -616,7 +616,7 @@ static int vdec_vp9_slice_alloc_working_buffer(struct=
 vdec_vp9_slice_instance *i
> =C2=A0	}
> =C2=A0
> =C2=A0	if (!instance->prob.va) {
> -		instance->prob.size =3D VP9_PROB_BUF_SIZE;
> +		instance->prob.size =3D pdev->vdec_pdata->vp9_params.prob_size;
> =C2=A0		if (mtk_vcodec_mem_alloc(ctx, &instance->prob))
> =C2=A0			goto err;
> =C2=A0	}

--=-M5Ch18Kp01gKBrDsnD66
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw7owAKCRDZQZRRKWBy
9EtJAP4ucvSpKzFChMvsvfUz6Zgheb9UmpvxWHw+l6XgSANY4QEAt+65lyCV5UBk
8W4qN9FOR/NhoUgVt1bCAim9nxyzCQw=
=VY97
-----END PGP SIGNATURE-----

--=-M5Ch18Kp01gKBrDsnD66--

