Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A0906D116EA
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 20:07:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6YjRJ1UapMYExqrvVNj4sEhdm8ApYQLWzcmie+awXvo=; b=ZYiqyoJ2MHPmlqkLSW8mLSyZ6L
	sBX0vuJQLGz5f8X1irxpyeToHE2BXXyiObD8exsFNGb7EL8JDqAqMzymqh6cwIkN/4azaVOOWa4aY
	MLEnMvIi5OditwbF/32bbSHxhWKgYEu3ohtgvGZq9/Qdx0ksGBj/YzgV4AwfddPkxezd1b1wbtSKo
	NpUMCXvxu5mT9PV+zMnK/WmBL9HHL/D5KNicxwODbd+hl/hC3fuSIHtlhU5HlHsdcbWzv9WyFihQA
	5/ws6y6tqMA2GgDvlcgGMJ3tD0tR7zEU8JVfANPg8v/NmtMREOGz/C4cTGeTqW5urpH+SaNOqk8/W
	095WJCgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4kv-00000000s8c-0Oqb;
	Fri, 28 Nov 2025 20:07:49 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4ks-00000000s8A-2nNM;
	Fri, 28 Nov 2025 20:07:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764360464;
	bh=aIZDBdwp54CNnoDAgDO/k2Xw/XKEWEi/5x7WLygL880=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=MiKqXoyfwV0UjnMO8c7ZfVo3xWsUA8E3d5FMxGzHPs+BLGfeUUXHFzguhu+PL/ByA
	 PuZ+C9Y6E1sBKhQuAhwohCP8MdgqEmcMlPvnGUfo9Q2Dcn9kEsP6g7NkoHHcMadEt0
	 c3ddND+YXVT2PYFnOFtsQ//LoaktWP3u8vkEBefEPdm2bcRyjoUOrXD3PXS0Fjdj8c
	 SlM/cZWqWfkg9JgpwMHW5mWhxqnBnfGHvrRq6xU2CMpHLyMAlAGwdl/+efsHVrVSop
	 D/BiQWFAC2MEnB/77tkvHFmks5WMLjbIhdQRmIjXrLkBCusfPf4knyiu63QLAVQW8v
	 OO8N57rEpGFlA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 0860117E107C;
	Fri, 28 Nov 2025 21:07:41 +0100 (CET)
Message-ID: <a89a7288c8e68a93485ad5e2eb42ec02860eea30.camel@collabora.com>
Subject: Re: [PATCH v2 05/14] media: mediatek: vcodec: get different
 firmware ipi id
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Yunfei Dong <yunfei.dong@mediatek.com>, =?ISO-8859-1?Q?N=EDcolas?= "F .
 R . A . Prado" <nfraprado@collabora.com>, Sebastian Fricke
 <sebastian.fricke@collabora.com>, Hans Verkuil	 <hverkuil-cisco@xs4all.nl>,
 AngeloGioacchino Del Regno	 <angelogioacchino.delregno@collabora.com>,
 Benjamin Gaignard	 <benjamin.gaignard@collabora.com>, Nathan Hebert
 <nhebert@chromium.org>,  Daniel Almeida <daniel.almeida@collabora.com>
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Fri, 28 Nov 2025 15:07:41 -0500
In-Reply-To: <20250815085232.30240-6-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-6-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-agtb3hdFQL7Q1Coas2yl"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_120747_062471_2772E18B 
X-CRM114-Status: GOOD (  16.76  )
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


--=-agtb3hdFQL7Q1Coas2yl
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> Getting ipi(inter-processor interrupt) id according to firmware
> type and hardware index for different architecture.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw.c | 13 ++++++++++=
+++
> =C2=A0.../platform/mediatek/vcodec/common/mtk_vcodec_fw.h |=C2=A0 1 +
> =C2=A0.../vcodec/decoder/vdec/vdec_av1_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A0.../vcodec/decoder/vdec/vdec_h264_req_multi_if.c=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++--
> =C2=A0.../vcodec/decoder/vdec/vdec_hevc_req_multi_if.c=C2=A0=C2=A0=C2=A0 =
|=C2=A0 4 ++--
> =C2=A0.../mediatek/vcodec/decoder/vdec/vdec_vp8_req_if.c=C2=A0 |=C2=A0 4 =
++--
> =C2=A0.../vcodec/decoder/vdec/vdec_vp9_req_lat_if.c=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 4 ++--
> =C2=A07 files changed, 24 insertions(+), 10 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
c b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> index fc547afa4ebf..4ed7639dfa30 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.c
> @@ -5,6 +5,19 @@
> =C2=A0#include "mtk_vcodec_fw_priv.h"
> =C2=A0#include "mtk_vcodec_fw_vcp.h"
> =C2=A0
> +int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id)
> +{
> +	switch (type) {
> +	case SCP:
> +		return hw_id =3D=3D MTK_VDEC_LAT0 ? SCP_IPI_VDEC_LAT : SCP_IPI_VDEC_CO=
RE;
> +	case VCP:
> +		return hw_id =3D=3D MTK_VDEC_LAT0 ? VCP_IPI_LAT_DECODER : VCP_IPI_CORE=
_DECODER;
> +	default:
> +		return -EINVAL;
> +	}
> +}
> +EXPORT_SYMBOL_GPL(mtk_vcodec_fw_get_ipi);
> +
> =C2=A0struct mtk_vcodec_fw *mtk_vcodec_fw_select(void *priv, enum mtk_vco=
dec_fw_type type,
> =C2=A0					=C2=A0=C2=A0 enum mtk_vcodec_fw_use fw_use)
> =C2=A0{
> diff --git a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.=
h b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> index c1642fb09b42..142e2e87905c 100644
> --- a/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> +++ b/drivers/media/platform/mediatek/vcodec/common/mtk_vcodec_fw.h
> @@ -41,5 +41,6 @@ int mtk_vcodec_fw_ipi_register(struct mtk_vcodec_fw *fw=
, int id,
> =C2=A0int mtk_vcodec_fw_ipi_send(struct mtk_vcodec_fw *fw, int id,
> =C2=A0			=C2=A0=C2=A0 void *buf, unsigned int len, unsigned int wait);
> =C2=A0int mtk_vcodec_fw_get_type(struct mtk_vcodec_fw *fw);
> +int mtk_vcodec_fw_get_ipi(enum mtk_vcodec_fw_type type, int hw_id);
> =C2=A0
> =C2=A0#endif /* _MTK_VCODEC_FW_H_ */
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av=
1_req_lat_if.c
> index bf21f2467a0f..618064001883 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_av1_req_la=
t_if.c
> @@ -1886,8 +1886,8 @@ static int vdec_av1_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
> =C2=A0		return -ENOMEM;
> =C2=A0
> =C2=A0	instance->ctx =3D ctx;
> -	instance->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	instance->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	instance->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, =
MTK_VDEC_LAT0);
> +	instance->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->t=
ype, MTK_VDEC_CORE);

Now was a good time to use a local variable.

> =C2=A0	instance->vpu.ctx =3D ctx;
> =C2=A0	instance->vpu.codec_type =3D ctx->current_codec;
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h26=
4_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_h264_req_multi_if.c
> index 5b25e1679b51..50f81f1cb616 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_h264_req_m=
ulti_if.c
> @@ -1212,8 +1212,8 @@ static int vdec_h264_slice_init(struct mtk_vcodec_d=
ec_ctx *ctx)
> =C2=A0
> =C2=A0	inst->ctx =3D ctx;
> =C2=A0
> -	inst->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	inst->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	inst->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, MTK_=
VDEC_LAT0);
> +	inst->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type,=
 MTK_VDEC_CORE);

Same and below.

> =C2=A0	inst->vpu.ctx =3D ctx;
> =C2=A0	inst->vpu.codec_type =3D ctx->current_codec;
> =C2=A0	inst->vpu.capture_type =3D ctx->capture_fourcc;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hev=
c_req_multi_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec=
_hevc_req_multi_if.c
> index 2725db882e5b..80fbd0309b9e 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_hevc_req_m=
ulti_if.c
> @@ -863,8 +863,8 @@ static int vdec_hevc_slice_init(struct mtk_vcodec_dec=
_ctx *ctx)
> =C2=A0
> =C2=A0	inst->ctx =3D ctx;
> =C2=A0
> -	inst->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	inst->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	inst->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, MTK_=
VDEC_LAT0);
> +	inst->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type,=
 MTK_VDEC_CORE);
> =C2=A0	inst->vpu.ctx =3D ctx;
> =C2=A0	inst->vpu.codec_type =3D ctx->current_codec;
> =C2=A0	inst->vpu.capture_type =3D ctx->capture_fourcc;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8=
_req_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_re=
q_if.c
> index 232ef3bd246a..764f4d4054c0 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if=
.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp8_req_if=
.c
> @@ -281,8 +281,8 @@ static int vdec_vp8_slice_init(struct mtk_vcodec_dec_=
ctx *ctx)
> =C2=A0
> =C2=A0	inst->ctx =3D ctx;
> =C2=A0
> -	inst->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	inst->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	inst->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, MTK_=
VDEC_LAT0);
> +	inst->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type,=
 MTK_VDEC_CORE);
> =C2=A0	inst->vpu.ctx =3D ctx;
> =C2=A0	inst->vpu.codec_type =3D ctx->current_codec;
> =C2=A0	inst->vpu.capture_type =3D ctx->capture_fourcc;
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9=
_req_lat_if.c b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp=
9_req_lat_if.c
> index 47c302745c1d..0279f66efdf9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/vdec/vdec_vp9_req_la=
t_if.c
> @@ -1855,8 +1855,8 @@ static int vdec_vp9_slice_init(struct mtk_vcodec_de=
c_ctx *ctx)
> =C2=A0		return -ENOMEM;
> =C2=A0
> =C2=A0	instance->ctx =3D ctx;
> -	instance->vpu.id =3D SCP_IPI_VDEC_LAT;
> -	instance->vpu.core_id =3D SCP_IPI_VDEC_CORE;
> +	instance->vpu.id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->type, =
MTK_VDEC_LAT0);
> +	instance->vpu.core_id =3D mtk_vcodec_fw_get_ipi(ctx->dev->fw_handler->t=
ype, MTK_VDEC_CORE);
> =C2=A0	instance->vpu.ctx =3D ctx;
> =C2=A0	instance->vpu.codec_type =3D ctx->current_codec;

regards,
Nicolas

--=-agtb3hdFQL7Q1Coas2yl
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSoBDQAKCRDZQZRRKWBy
9DVkAQDnD0cIVBuy8fqqTjaFanvxBSDk2WhAWgPraJrW4TXi+gEA+yb4nxiNvPA3
rfTEo8s0CloszhQsKSrUVgAuRKlRGA0=
=RRvX
-----END PGP SIGNATURE-----

--=-agtb3hdFQL7Q1Coas2yl--

