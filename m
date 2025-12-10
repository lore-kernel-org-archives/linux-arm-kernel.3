Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54CADD3E77B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Dec 2025 20:07:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sxi5+X6UOxcBXgWnzZQzFvcqDPuy5sT0a7hjBo1t5S4=; b=XRG2b9PlQ1KlCJRpiMhLVmsLz6
	3r3i3bsP7mbENCOcNG3lM0YTF4hK3jh79oylYMqaemd1Sbt5BmL+tpdn1EBnj5H+DhoFoCOVo8q7t
	Dr8LHuVNAp3onlzIKDA1FVSZkbfF/A8Afw3/V9jogKk/Frvgkte9Uh5/yJ6LxtXzBQZiegd2Dgd/n
	8ieIiCVc+VSXlhcfeSP6P9z3ymos7HQcPpRySxNzUgp9+8vM2sbEmu1PUQJfVrGUE3k6ZiLF9gsQQ
	KhVt7JhO9SWBSpbAtMeoMkMMv0IgDm3rqT9HUhj1ErmUgvsHJ9O8LP2ZC67+NwLjXFfm6FkuBbout
	UKvqREBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQSu-0000000FoLS-3nlT;
	Wed, 10 Dec 2025 20:07:12 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vTQSs-0000000FoL3-08v8;
	Wed, 10 Dec 2025 20:07:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1765397226;
	bh=ux4ZoJM9egGzzCnfJ8RpynElsXw1OrA0Z+kRmm+w54Y=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=avpP/jpcug8ZrsXXouvnM7uHtk6uwwhyk7Oup4yiR4dmaRworhxgvrkOxDUTAibpH
	 w7ChNU1sQ0zXkN1WbOvd1yRho/zeKLiAwGy3eXUJwcoFXMPOH0ldBzZ5pVNCRy3yCF
	 zJYssaHOr7l/k2H2ktsgim6WS/TN7WjQJ/N+aJYNZBRAWUNWGBD4N9tFQz7QH+67HW
	 vQThKHfQrjcFtZNJ4Rnal1htk4VOYUWPf/p6eEISNRt+yPKuDqCYTfVmG+a88pQYsh
	 D+9ph9OAY5+Vu3oB4DUDNwFEXWoI4Tn90H0y3u9MqTwQpMaOhyXfOaG7e/AMUJACgC
	 lP29ARI88cpRg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E02B17E137E;
	Wed, 10 Dec 2025 21:07:04 +0100 (CET)
Message-ID: <3ff3c7f76e24fdc92d86be3f92b6947ef86abc25.camel@collabora.com>
Subject: Re: [PATCH v3 02/15] media: v4l2-ctrls: Add hevc_ext_sps_[ls]t_rps
 controls
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Detlev Casanova <detlev.casanova@collabora.com>, 
	linux-kernel@vger.kernel.org
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Ezequiel Garcia	
 <ezequiel@vanguardiasur.com.ar>, Heiko Stuebner <heiko@sntech.de>, Ricardo
 Ribalda <ribalda@chromium.org>, Hans Verkuil <hverkuil@kernel.org>, Hans de
 Goede <hansg@kernel.org>,  Yunke Cao <yunkec@google.com>, Jonathan Corbet
 <corbet@lwn.net>, Laurent Pinchart	 <laurent.pinchart@ideasonboard.com>,
 Sakari Ailus <sakari.ailus@linux.intel.com>,  James Cowgill
 <james.cowgill@blaize.com>, linux-media@vger.kernel.org,
 linux-rockchip@lists.infradead.org, 	linux-arm-kernel@lists.infradead.org,
 kernel@collabora.com
Date: Wed, 10 Dec 2025 15:07:03 -0500
In-Reply-To: <20251022162459.271603-3-detlev.casanova@collabora.com>
References: <20251022162459.271603-1-detlev.casanova@collabora.com>
	 <20251022162459.271603-3-detlev.casanova@collabora.com>
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
	protocol="application/pgp-signature"; boundary="=-w3NJSzU7Eb7RpsKE92JN"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251210_120710_399765_5E76F38C 
X-CRM114-Status: GOOD (  24.60  )
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


--=-w3NJSzU7Eb7RpsKE92JN
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mercredi 22 octobre 2025 =C3=A0 12:22 -0400, Detlev Casanova a =C3=A9cri=
t=C2=A0:
> The vdpu381 decoder found on newer Rockchip SoC need the information
> from the long term and short term ref pic sets from the SPS.
>=20
> So far, it wasn't included in the v4l2 API, so add it with new dynamic
> sized controls.
>=20
> Each element of the hevc_ext_sps_lt_rps array contains the long term ref
> pic set at that index.
> Each element of the hevc_ext_sps_st_rps contains the short term ref pic
> set at that index, as the raw data.
> It is the role of the drivers to calculate the reference sets values.
>=20
> Signed-off-by: Detlev Casanova <detlev.casanova@collabora.com>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-core.c | 18 +++++++
> =C2=A0drivers/media/v4l2-core/v4l2-ctrls-defs.c | 10 ++++
> =C2=A0include/uapi/linux/v4l2-controls.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 61 +++++++++++++++++++++++
> =C2=A0include/uapi/linux/videodev2.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0 2 +
> =C2=A04 files changed, 91 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-core.c b/drivers/media/v4=
l2-core/v4l2-ctrls-core.c
> index 85d07ef44f62..779936727505 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-core.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-core.c
> @@ -418,6 +418,12 @@ void v4l2_ctrl_type_op_log(const struct v4l2_ctrl *c=
trl)
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> =C2=A0		pr_cont("HEVC_SLICE_PARAMS");
> =C2=A0		break;
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
> +		pr_cont("HEVC_EXT_SPS_ST_RPS");
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
> +		pr_cont("HEVC_EXT_SPS_LT_RPS");
> +		break;
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> =C2=A0		pr_cont("HEVC_SCALING_MATRIX");
> =C2=A0		break;
> @@ -1173,6 +1179,12 @@ static int std_validate_compound(const struct v4l2=
_ctrl *ctrl, u32 idx,
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> =C2=A0		break;
> =C2=A0
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
> +		break;
> +
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
> +		break;
> +
> =C2=A0	case V4L2_CTRL_TYPE_HDR10_CLL_INFO:
> =C2=A0		break;
> =C2=A0
> @@ -1925,6 +1937,12 @@ static struct v4l2_ctrl *v4l2_ctrl_new(struct v4l2=
_ctrl_handler *hdl,
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS:
> =C2=A0		elem_size =3D sizeof(struct v4l2_ctrl_hevc_slice_params);
> =C2=A0		break;
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS:
> +		elem_size =3D sizeof(struct v4l2_ctrl_hevc_ext_sps_st_rps);
> +		break;
> +	case V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS:
> +		elem_size =3D sizeof(struct v4l2_ctrl_hevc_ext_sps_lt_rps);
> +		break;
> =C2=A0	case V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX:
> =C2=A0		elem_size =3D sizeof(struct v4l2_ctrl_hevc_scaling_matrix);
> =C2=A0		break;
> diff --git a/drivers/media/v4l2-core/v4l2-ctrls-defs.c b/drivers/media/v4=
l2-core/v4l2-ctrls-defs.c
> index ad41f65374e2..167286c9e424 100644
> --- a/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> +++ b/drivers/media/v4l2-core/v4l2-ctrls-defs.c
> @@ -1233,6 +1233,8 @@ const char *v4l2_ctrl_get_name(u32 id)
> =C2=A0	case V4L2_CID_STATELESS_HEVC_DECODE_MODE:		return "HEVC Decode Mod=
e";
> =C2=A0	case V4L2_CID_STATELESS_HEVC_START_CODE:		return "HEVC Start Code"=
;
> =C2=A0	case V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS:	return "HEVC Ent=
ry Point Offsets";
> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:		return "HEVC Short Term R=
ef Sets";
> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:		return "HEVC Long Term Re=
f Sets";
> =C2=A0	case V4L2_CID_STATELESS_AV1_SEQUENCE:			return "AV1 Sequence Param=
eters";
> =C2=A0	case V4L2_CID_STATELESS_AV1_TILE_GROUP_ENTRY:		return "AV1 Tile Gr=
oup Entry";
> =C2=A0	case V4L2_CID_STATELESS_AV1_FRAME:			return "AV1 Frame Parameters"=
;
> @@ -1578,6 +1580,14 @@ void v4l2_ctrl_fill(u32 id, const char **name, enu=
m v4l2_ctrl_type *type,
> =C2=A0		*type =3D V4L2_CTRL_TYPE_U32;
> =C2=A0		*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> =C2=A0		break;
> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS:
> +		*type =3D V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS;
> +		*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> +	case V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS:
> +		*type =3D V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS;
> +		*flags |=3D V4L2_CTRL_FLAG_DYNAMIC_ARRAY;
> +		break;
> =C2=A0	case V4L2_CID_STATELESS_VP9_COMPRESSED_HDR:
> =C2=A0		*type =3D V4L2_CTRL_TYPE_VP9_COMPRESSED_HDR;
> =C2=A0		break;
> diff --git a/include/uapi/linux/v4l2-controls.h b/include/uapi/linux/v4l2=
-controls.h
> index 2d30107e047e..dd9e29afa155 100644
> --- a/include/uapi/linux/v4l2-controls.h
> +++ b/include/uapi/linux/v4l2-controls.h
> @@ -2093,6 +2093,8 @@ struct v4l2_ctrl_mpeg2_quantisation {
> =C2=A0#define V4L2_CID_STATELESS_HEVC_DECODE_MODE	(V4L2_CID_CODEC_STATELE=
SS_BASE + 405)
> =C2=A0#define V4L2_CID_STATELESS_HEVC_START_CODE	(V4L2_CID_CODEC_STATELES=
S_BASE + 406)
> =C2=A0#define V4L2_CID_STATELESS_HEVC_ENTRY_POINT_OFFSETS (V4L2_CID_CODEC=
_STATELESS_BASE + 407)
> +#define V4L2_CID_STATELESS_HEVC_EXT_SPS_ST_RPS=C2=A0 (V4L2_CID_CODEC_STA=
TELESS_BASE + 408)
> +#define V4L2_CID_STATELESS_HEVC_EXT_SPS_LT_RPS=C2=A0 (V4L2_CID_CODEC_STA=
TELESS_BASE + 409)
> =C2=A0
> =C2=A0enum v4l2_stateless_hevc_decode_mode {
> =C2=A0	V4L2_STATELESS_HEVC_DECODE_MODE_SLICE_BASED,
> @@ -2548,6 +2550,65 @@ struct v4l2_ctrl_hevc_scaling_matrix {
> =C2=A0	__u8	scaling_list_dc_coef_32x32[2];
> =C2=A0};
> =C2=A0
> +#define V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_INTER_REF_PIC_SET_PRED	0x1
> +
> +/*
> + * struct v4l2_ctrl_hevc_ext_sps_st_rps - HEVC short term RPS parameters
> + *
> + * Dynamic size 1-dimension array for short term RPS. The number of elem=
ents
> + * is v4l2_ctrl_hevc_sps::num_short_term_ref_pic_sets. It can contain up=
 to 65 elements.
> + *
> + * @delta_idx_minus1: Specifies the delta compare to the index. See deta=
ils in section 7.4.8
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 "Short-term reference picture=
 set semantics" of the specification.
> + * @delta_rps_sign: Sign of the delta as specified in section 7.4.8 "Sho=
rt-term reference picture
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 set semantics" of the specification.
> + * @abs_delta_rps_minus1: Absolute delta RPS as specified in section 7.4=
.8 "Short-term reference
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 pictu=
re set semantics" of the specification.
> + * @num_negative_pics: Number of short-term RPS entries that have pictur=
e order count values less
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 than the picture order =
count value of the current picture.
> + * @num_positive_pics: Number of short-term RPS entries that have pictur=
e order count values
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 greater than the pictur=
e order count value of the current picture.
> + * @used_by_curr_pic: Bit j specifies if short-term RPS j is used by the=
 current picture.
> + * @use_delta_flag: Bit j equals to 1 specifies that the j-th entry in t=
he source candidate
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 short-term RPS is included in this candid=
ate short-term RPS.
> + * @delta_poc_s0_minus1: Specifies the negative picture order count delt=
a for the i-th entry in
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the short-t=
erm RPS. See details in section 7.4.8 "Short-term reference
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture set=
 semantics" of the specification.
> + * @delta_poc_s1_minus1: Specifies the positive picture order count delt=
a for the i-th entry in
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 the short-t=
erm RPS. See details in section 7.4.8 "Short-term reference
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 picture set=
 semantics" of the specification.
> + * @flags: See V4L2_HEVC_EXT_SPS_ST_RPS_FLAG_{}
> + */
> +struct v4l2_ctrl_hevc_ext_sps_st_rps {
> +	__u8	delta_idx_minus1;
> +	__u8	delta_rps_sign;
> +	__u16	abs_delta_rps_minus1;
> +	__u8	num_negative_pics;
> +	__u8	num_positive_pics;
> +	__u32	used_by_curr_pic;

Did you run pahole ? This one does not seem to align, it starts with 16bit
offset. The remark is because 32bit and 64bit platform, and all compiler sh=
ould
have the same binary representation, otherwise it will break in some ways.

regards,
Nicolas

> +	__u32	use_delta_flag;
> +	__u16	delta_poc_s0_minus1[16];
> +	__u16	delta_poc_s1_minus1[16];
> +	__u8	flags;
> +};
> +
> +#define V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_USED_LT		0x1
> +
> +/*
> + * struct v4l2_ctrl_hevc_ext_sps_lt_rps - HEVC long term RPS parameters
> + *
> + * Dynamic size 1-dimension array for long term RPS. The number of eleme=
nts
> + * is v4l2_ctrl_hevc_sps::num_long_term_ref_pics_sps. It can contain up =
to 65 elements.
> + *
> + * @lt_ref_pic_poc_lsb_sps: picture order count modulo MaxPicOrderCntLsb=
 of the i-th candidate
> + *=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=
=C2=A0 long-term reference picture.
> + * @flags: See V4L2_HEVC_EXT_SPS_LT_RPS_FLAG_{}
> + */
> +struct v4l2_ctrl_hevc_ext_sps_lt_rps {
> +	__u16	lt_ref_pic_poc_lsb_sps;
> +	__u8	flags;
> +};
> +
> =C2=A0/* Stateless VP9 controls */
> =C2=A0
> =C2=A0#define V4L2_VP9_LOOP_FILTER_FLAG_DELTA_ENABLED	0x1
> diff --git a/include/uapi/linux/videodev2.h b/include/uapi/linux/videodev=
2.h
> index becd08fdbddb..ae1d33fd37b7 100644
> --- a/include/uapi/linux/videodev2.h
> +++ b/include/uapi/linux/videodev2.h
> @@ -1981,6 +1981,8 @@ enum v4l2_ctrl_type {
> =C2=A0	V4L2_CTRL_TYPE_HEVC_SLICE_PARAMS	=3D 0x0272,
> =C2=A0	V4L2_CTRL_TYPE_HEVC_SCALING_MATRIX	=3D 0x0273,
> =C2=A0	V4L2_CTRL_TYPE_HEVC_DECODE_PARAMS	=3D 0x0274,
> +	V4L2_CTRL_TYPE_HEVC_EXT_SPS_ST_RPS	=3D 0x0275,
> +	V4L2_CTRL_TYPE_HEVC_EXT_SPS_LT_RPS	=3D 0x0276,
> =C2=A0
> =C2=A0	V4L2_CTRL_TYPE_AV1_SEQUENCE	=C2=A0=C2=A0=C2=A0 =3D 0x280,
> =C2=A0	V4L2_CTRL_TYPE_AV1_TILE_GROUP_ENTRY =3D 0x281,

--=-w3NJSzU7Eb7RpsKE92JN
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaTnS5wAKCRDZQZRRKWBy
9AcLAP9y6rWRMXly9IG5jo/tqLHSXyreYY9f/eEVAOxBakBbEwD+K+jseFA0myzy
gZnGvnhgVazc/qoHa7lMfctwrNZj2w8=
=DiGP
-----END PGP SIGNATURE-----

--=-w3NJSzU7Eb7RpsKE92JN--

