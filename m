Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2784AD116E2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 28 Nov 2025 19:34:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CMkIzbjxxzv4ONWvWDSYuX3VJSVJO4KSzcdpqT3N/zs=; b=e2TLD1EB5s+nnukX0hCCqj98Yo
	c4OKQL4fw2DvhJjRZ/SThdLoZItC2FTlsCKUpe/HfUiOq+4vQeoMpIk/bI/LnO4b4W/XkjORV2OWM
	Pzv/LECM7RzFiR7dWk1MKQlHR77//mVl1r8mxgXvF/o1/Fj2VCymZgXJINWfObV6TfsjchwoXg74z
	keXm/lEf0sxfywOrqUDuszZ0xR+wEeUJMEqNjHmzVIF3rtvsYT20lGrZzhaPM2kmF9ynb8Ems7acX
	hH8Cz1/xrCoW0RgK25sh8UGdW/oPSlb1FmfudwEMWhCO7Ls2C6rOssC5+GJh+GCyOzLVHWEyEJEeY
	9RZKzMFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4EZ-00000000qEK-245n;
	Fri, 28 Nov 2025 19:34:23 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vP4EX-00000000qDt-26i8;
	Fri, 28 Nov 2025 19:34:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764358459;
	bh=Yhe1DDond4S8P8IlENCBXoPbGHM6ErCN8GAHfZ5J2yY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=gbAtKdot4AoliteXaFQ9DjrBD/TvuNnXF4j0MmlhOhj64136GH8+cqzPpGl/taWqM
	 BSk11bIMYBEIYNf8zwsCoUqBdeId8gqdVEGcH7AolIAq+hchQ57bqNWuXRxQjJGWyp
	 awbgh0aODJ6GJHK5+GPgSQ9roG/h7s1x6/A1RedozfLqT46L9+8Mxn/57VvugoQfv7
	 w/o6QlBiQRmRRYLRO/GnZ3ypDgOxfoXdfkiMXCyS4pi4tvCxiHXywgeTxP3dd1d7GY
	 1wu1I5+M7ed4s4F36YcxJlDFqgT7+B+kPwKIMexvZVtMET45pdbHQaB6n/47l0vNm1
	 S0UVkXrJWnlAA==
Received: from [IPv6:2606:6d00:17:7b4b::c41] (unknown [IPv6:2606:6d00:17:7b4b::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id BA02417E10F6;
	Fri, 28 Nov 2025 20:34:16 +0100 (CET)
Message-ID: <8f9cd96ccd5de050e43a4c64b6a7937ed86413ea.camel@collabora.com>
Subject: Re: [PATCH v2 02/14] media: mediatek: vcodec: add decoder
 compatible to support mt8196
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
Date: Fri, 28 Nov 2025 14:34:15 -0500
In-Reply-To: <20250815085232.30240-3-yunfei.dong@mediatek.com>
References: <20250815085232.30240-1-yunfei.dong@mediatek.com>
	 <20250815085232.30240-3-yunfei.dong@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-69FgDND25HA5QoZ6f/KT"
User-Agent: Evolution 3.58.1 (3.58.1-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251128_113421_712407_B484E9B9 
X-CRM114-Status: GOOD (  15.82  )
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


--=-69FgDND25HA5QoZ6f/KT
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le vendredi 15 ao=C3=BBt 2025 =C3=A0 16:52 +0800, Yunfei Dong a =C3=A9crit=
=C2=A0:
> MT8196 is lat single core architecture. Support its compatible and
> use `mtk_lat_sig_core_pdata` to initialize platform data.
>=20
> Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> ---
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=
=A0 | 6 ++++++
> =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=
=A0 | 1 +
> =C2=A02 files changed, 7 insertions(+)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.c b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> index 9247d92d431d..fa609343c168 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -346,6 +346,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_v=
codec_dec_dev *vdec_dev)
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8186;
> =C2=A0	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-vc=
odec-dec"))
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8188;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vcodec-=
dec"))
> +		vdec_dev->chip_name =3D MTK_VDEC_MT8196;

I'm pretty sure some other series is moving this into the match data. I don=
't
care who do that first, but I'd like to see that fixed.

Nicolas

> =C2=A0	else
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_INVAL;
> =C2=A0}
> @@ -559,6 +561,10 @@ static const struct of_device_id mtk_vcodec_match[] =
=3D {
> =C2=A0		.compatible =3D "mediatek,mt8188-vcodec-dec",
> =C2=A0		.data =3D &mtk_lat_sig_core_pdata,
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8196-vcodec-dec",
> +		.data =3D &mtk_lat_sig_core_pdata,
> +	},
> =C2=A0	{},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index aececca7ecf8..6bdde600a167 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -27,6 +27,7 @@ enum mtk_vcodec_dec_chip_name {
> =C2=A0	MTK_VDEC_MT8188 =3D 8188,
> =C2=A0	MTK_VDEC_MT8192 =3D 8192,
> =C2=A0	MTK_VDEC_MT8195 =3D 8195,
> +	MTK_VDEC_MT8196 =3D 8196,
> =C2=A0};
> =C2=A0
> =C2=A0/*

--=-69FgDND25HA5QoZ6f/KT
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaSn5NwAKCRDZQZRRKWBy
9LF3AP9+KNgp4W2BFMNJfo+xfzd957a4H3g9z0q/QcSfIOx6zQD8DKdO+YDnTLrL
CYMTZ6/o8lg7ThOhMYxvsTSFV49T/A0=
=hetT
-----END PGP SIGNATURE-----

--=-69FgDND25HA5QoZ6f/KT--

