Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90C2ECCFA05
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:51:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vui8q4HaCi6tVBnL2yxZ+tr0ue024XeMZ+Nm5+3ZEoU=; b=SJIO/TAEgS9I6JCLVDeslhIJnM
	7+rYDPfM+pzgvTb3sRVoCC3imzf3Xe0sD2OOoEDC19/0a3FUyA7ligYGJ4e77/nruJI1X9r/1VsyT
	CQFDRFu0VF+5ewYc1eqoGTbYnYaB5MAq5tslhfFeuNOmpS4fQW8ViOC2ld1Tw7ifgA2duJ2pOjBHl
	sTDV7cYwsGwlNG9TJOcsB8/M93V8YHA+e/ufn+/OGbJJq6ioQKWe5KsslZUkFC/qxcOUe8cV5PG8/
	ylFw+KGV7WFt+58CUMF4bhfMppHO+VzvBIYPc+BqAFPpwXV38ny8Tyk9W1uAtQVjlTUE0hmSAuIwn
	fvQBIbXA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1KF-0000000FjZS-010y;
	Thu, 06 Nov 2025 14:50:59 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH1KB-0000000FjZ0-0Kfz;
	Thu, 06 Nov 2025 14:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762440651;
	bh=/SG/uHMsoaaVW3+7tXj7IiAdklogSCYak1q0Xfk61P0=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=Stdd40RacKZw2D0Fy/FjlcXcwk25KKymleVxtYJOCdyMfxKbcp73AX8F67dj17YlC
	 pHUMHHR7pZteAcofaqFrO8wCKp8uONFwA+Pj9k87pAaHosCb4I3P5RVOmgtY3S+Mw/
	 hWS47k66EaSNIpjOBLRAvI7MOYKkRKlT0HvK4+h0KNRlxekneKNCxtRSUg85jbfn7b
	 zAdwHWkb9OARETdi44ww05eCHH1rS+SDb2oxvMgk0ycPyMMp4TFpaRB3t5UTbgcnn+
	 Jj4E6AeKO8lqRjyjgNkTKAQYAhfOLkrZKht2CCdS70mPoiBakitrNAqDXc+SaTXrWO
	 sMx1KtXZ8W/xw==
Received: from [IPv6:2606:6d00:11:ef24::c41] (unknown [IPv6:2606:6d00:11:ef24::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 54A9917E1352;
	Thu,  6 Nov 2025 15:50:49 +0100 (CET)
Message-ID: <21be57561dbf7bd28367193e62296a43212e6030.camel@collabora.com>
Subject: Re: [PATCH v5 8/8] media: mediatek: encoder: Add MT8189 encoder
 compatible data
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
 linux-arm-kernel@lists.infradead.org, 	linux-mediatek@lists.infradead.org,
 Yilong Zhou <yilong.zhou@mediatek.com>
Cc: Neil Armstrong <neil.armstrong@linaro.org>, Andrzej Pietrasiewicz
	 <andrzejtp2010@gmail.com>
Date: Thu, 06 Nov 2025 09:50:47 -0500
In-Reply-To: <20251106061323.2193-9-kyrie.wu@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-9-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-bxeZ/yTsP3Z84TE9zFdJ"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_065056_180438_6DDF47E1 
X-CRM114-Status: GOOD (  13.26  )
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


--=-bxeZ/yTsP3Z84TE9zFdJ
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le jeudi 06 novembre 2025 =C3=A0 14:13 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> add compatible data to support MT8189 encoding.

Don't copy your subject, briefly describe the configuration instead.

Nicolas

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno
> <angelogioacchino.delregno@collabora.com>
> ---
> =C2=A0.../mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c=C2=A0=C2=A0 | 14 +=
+++++++++++++
> =C2=A01 file changed, 14 insertions(+)
>=20
> diff --git
> a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> index 6b3d2e72fad9..2cc92a8f7a0d 100644
> --- a/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/encoder/mtk_vcodec_enc_drv.c
> @@ -467,6 +467,19 @@ static const struct mtk_vcodec_enc_pdata mt8196_pdat=
a =3D {
> =C2=A0	.set_dma_bit_mask =3D true,
> =C2=A0};
> =C2=A0
> +static const struct mtk_vcodec_enc_pdata mt8189_pdata =3D {
> +	.venc_model_num =3D 8189,
> +	.capture_formats =3D mtk_video_formats_capture_h264,
> +	.num_capture_formats =3D ARRAY_SIZE(mtk_video_formats_capture_h264),
> +	.output_formats =3D mtk_video_formats_output,
> +	.num_output_formats =3D ARRAY_SIZE(mtk_video_formats_output),
> +	.min_bitrate =3D 64,
> +	.max_bitrate =3D 100000000,
> +	.core_id =3D VENC_SYS,
> +	.uses_common_fw_iface =3D true,
> +	.set_dma_bit_mask =3D true,
> +};
> +
> =C2=A0static const struct of_device_id mtk_vcodec_enc_match[] =3D {
> =C2=A0	{.compatible =3D "mediatek,mt8173-vcodec-enc",
> =C2=A0			.data =3D &mt8173_avc_pdata},
> @@ -477,6 +490,7 @@ static const struct of_device_id mtk_vcodec_enc_match=
[] =3D
> {
> =C2=A0	{.compatible =3D "mediatek,mt8192-vcodec-enc", .data =3D &mt8192_p=
data},
> =C2=A0	{.compatible =3D "mediatek,mt8195-vcodec-enc", .data =3D &mt8195_p=
data},
> =C2=A0	{.compatible =3D "mediatek,mt8196-vcodec-enc", .data =3D &mt8196_p=
data},
> +	{.compatible =3D "mediatek,mt8189-vcodec-enc", .data =3D &mt8189_pdata}=
,
> =C2=A0	{},
> =C2=A0};
> =C2=A0MODULE_DEVICE_TABLE(of, mtk_vcodec_enc_match);

--=-bxeZ/yTsP3Z84TE9zFdJ
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQy1xwAKCRDZQZRRKWBy
9Nw3AP46aJhDUk8PCHIbnonlNvXHPCIlwt4w3LWBJOBQeHlX8wD/cpB2lPrG4xJG
OyCOr3eXLc3FFA8/ZvNPBkKHgRQIpQs=
=nBUW
-----END PGP SIGNATURE-----

--=-bxeZ/yTsP3Z84TE9zFdJ--

