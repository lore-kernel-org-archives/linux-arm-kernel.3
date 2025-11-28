Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90141D116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 19:37:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0wJCxNWNtCHxHweVdkABckoBn5nNLMQRP0Pyk6dZHQc=; b=qaqBFhRpwfTB1raoKeFwG0aAz8
	c7TNjuFGrz+GQgjSZD4BI6KgJiEfZSnK00m96/RRZHSEoF+WEeoEJfcH9Qs+ZHidw4/FEcwfrYzl6
	wKjfXzq0/HnIdjxhWcXjFnd+O7/3ONa5pSLBxiWOM5ZDHu/39cAGtkOqAUZt3nhO1lrhvQ2WvrbBI
	5Ad8+O5WoTMyaZES1agKV9L+//QBnKWIndAuc2QJY58RHhdv4/9akAbx758fRCnJFORiGwkaWdo3s
	R4CvpOsgP2n0zx8Spz2TEH8mLu/E777zyMChwJ2x8tyv9/WDfWx+aS3b+U8ELKZaD1zkIxVFTP99x
	larcSRFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4HH-00000000qSI-0CNr;
	Fri, 28 Nov 2025 19:37:11 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4HF-00000000qRn-0D5N;
	Fri, 28 Nov 2025 19:37:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764358626;
	bh=29W6ZIeHLPW/7jIaIT7iDOYPvYQApsGIf7wJHoduuVw=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=YI8HbVTRkeyUuIxu1Y6Q/8D7BHCHY+apWLA5MwT12EaRlS+AJmU0DPxOKYUXo0WeA
	 TsL9qI6iXMttsOT0oWr4JeND5XBC4HUug8qpOInBVAqjiIzKneY+9MuCYcRG6eQamk
	 9Vbp22GpsnfNd/9SsD2g9HEZtGCoWQjRiDxGiq4aHS/6gBjz7zQTEfL4H3QQ+uOL8t
	 vNZf0/jDgM4Iuz9WGs9LlNOUdi6+uPi757MxtnZS6rM3xJCMRRJC318WR6P0kGAFcJ
	 CaGTqvHlTuyjn2pxOr/37J8R/HgRIN2m/poaV9f4hXKiOys9mj1UgNBwXxOqhFs9fL
	 S/hJDvlbZo9qg==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CADE117E0A30;
	Fri, 28 Nov 2025 20:37:04 +0100 (CET)
Message-ID: <b7f925404bcfb75a15948e890ed097e96f9353ea.camel@collabora.com>
Subject: Re: [PATCH v2 07/14] media: mediatek: vcodec: define MT8196 vcodec
 levels.
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
Date: Fri, 28 Nov 2025 14:37:03 -0500
In-Reply-To: <20250815085232.30240-8-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-8-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-8uhTyl6v012TRyNuCN40"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_113709_251197_91CE9FFE 
X-CRM114-Status: GOOD (  12.91  )
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


--=-8uhTyl6v012TRyNuCN40
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> The supported level and profile are not the same for different
> codecs and architecture. Select the correct one.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>

Would be nicer inside the match data. Though, its a cheap switch here (not =
sure
why it was strcmp in previous patch. That one is at least acceptable, but w=
e can
do better.

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Nicolas

> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec_stateless.c=C2=A0=C2=A0=
=C2=A0=C2=A0=C2=A0 | 6 ++++++
> =C2=A01 file changed, 6 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_stateless.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_d=
ec_stateless.c
> index d873159b9b30..c1cef78471a9 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
less.c
> @@ -555,6 +555,7 @@ static void mtk_vcodec_dec_fill_h264_level(struct v4l=
2_ctrl_config *cfg,
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
> =C2=A0		break;
> =C2=A0	case MTK_VDEC_MT8195:
> +	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
> =C2=A0		break;
> =C2=A0	case MTK_VDEC_MT8183:
> @@ -573,6 +574,7 @@ static void mtk_vcodec_dec_fill_h264_profile(struct v=
4l2_ctrl_config *cfg,
> =C2=A0	switch (ctx->dev->chip_name) {
> =C2=A0	case MTK_VDEC_MT8188:
> =C2=A0	case MTK_VDEC_MT8195:
> +	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
> =C2=A0		break;
> =C2=A0	default:
> @@ -589,6 +591,7 @@ static void mtk_vcodec_dec_fill_h265_level(struct v4l=
2_ctrl_config *cfg,
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
> =C2=A0		break;
> =C2=A0	case MTK_VDEC_MT8195:
> +	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
> =C2=A0		break;
> =C2=A0	default:
> @@ -603,6 +606,7 @@ static void mtk_vcodec_dec_fill_h265_profile(struct v=
4l2_ctrl_config *cfg,
> =C2=A0	switch (ctx->dev->chip_name) {
> =C2=A0	case MTK_VDEC_MT8188:
> =C2=A0	case MTK_VDEC_MT8195:
> +	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
> =C2=A0		break;
> =C2=A0	default:
> @@ -620,6 +624,7 @@ static void mtk_vcodec_dec_fill_vp9_level(struct v4l2=
_ctrl_config *cfg,
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
> =C2=A0		break;
> =C2=A0	case MTK_VDEC_MT8195:
> +	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
> =C2=A0		break;
> =C2=A0	case MTK_VDEC_MT8186:
> @@ -637,6 +642,7 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct v4=
l2_ctrl_config *cfg,
> =C2=A0	switch (ctx->dev->chip_name) {
> =C2=A0	case MTK_VDEC_MT8188:
> =C2=A0	case MTK_VDEC_MT8195:
> +	case MTK_VDEC_MT8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2;
> =C2=A0		break;
> =C2=A0	default:

--=-8uhTyl6v012TRyNuCN40
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSn53wAKCRDZQZRRKWBy
9PtxAQCpn3r4qq5H2bjoAmnv0R7EeaqEnxVyEx9fjHJxtN9AOAEAxtK3of5abf2K
2KCmCFo606cdnnTNEe42n6hKVEFn+AU=
=4mzz
-----END PGP SIGNATURE-----

--=-8uhTyl6v012TRyNuCN40--

