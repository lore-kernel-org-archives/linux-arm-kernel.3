Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3A6D51091904
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 17:56:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ICWTK7FJse1sY299nyKvkZkaWeEY0o/8mJskRhSMOV0=; b=a+BSYwo4ppJ8bns9w8tb6/EbBv
	myhUjdszwGSDzgYa7HXCZEgOnBryZpXyDVPGN0rTFHathwX6vDhx437RAf22W1zFJiI8pq5LYiVMi
	uafUVcuA/ZYvFkOPSRDuws4UlUbGdRdi21FrFknfoXJnFuDcqcLHzr9sriA1XnEVcOdm5vPR1KBTM
	fCOo3q+PtrWlj/GuVvUQswr/Q/KYz1nvBDufQ3V6/o7ERXxvzyXJJC/AYOGElx1eYSTmbaXe8cM+p
	eiM1qTNRHJMc+crtadiTvC9TicwSERkDEEFXJJ8GygJzZHai2lHLvwOuhEI7tIsQSWJqrNZlZvVBm
	ays4gbyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hbu-0000000BFKQ-3lWV;
	Thu, 19 Mar 2026 17:56:42 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hbt-0000000BFKE-1kXz;
	Thu, 19 Mar 2026 17:56:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=MIME-Version:Content-Type:References:
	In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=ICWTK7FJse1sY299nyKvkZkaWeEY0o/8mJskRhSMOV0=; b=ToQHbobsFMIcieI2YXNdN5C1JE
	GBJlEdrTByXWWZdUWkJu2EYMpz5SMyCncvyLLp1XpuT8j7uwso2SdZayLpPPdegTHjZf5043fmNBp
	uLH8JNZ66kuREmN8dh/V+29vKw5sUTdBfz9k6ppr+xxFhNLngrq1nm3K8OFNXC/pIwDOF8f4HFy6/
	bR/Uafe7XkToufW8GZAzEqp/qHlCeIoipX+edccZqKBk8ihyJ6Olfa4Fj52rp/mjoAMEDLxwgB4l8
	jjhATIZ4Oc9/N5g7yoj72nZQRxnTl4ghQNdU2L30wvPfhnLhS3uRYyIgbBrji7bEtHhf6jtLC9y/c
	yv58gV5w==;
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Hbq-0000000EAZ2-0BND;
	Thu, 19 Mar 2026 17:56:40 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1773942991;
	bh=RJpWpm/CplTKFsDNI30hEXaKX3SwM/3GwDjlmHCdrzQ=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=RI6lD9x/rJ7AoU9LegyBKmzRa814FIy9jVXbeZzIBHESD+3Uk1lqbg4uHkPlgt6R+
	 9ipVB9ys2y9G/ufodPViuHlZPGujdNTMqMsYSzoirOifB+3yb5CVqAveGPw0aS2LBd
	 k1BhTjjbtl27sVKTJ5qOkIx4QDZBflcq3xEJlYkHToK0shicVBFXLGtrq3TLbVnnSy
	 lQf2EP1ejcFwpD3VTHuunjQfTE5d4b4zkcvtRXjRxrl8Upug6P9oGhDqLe+DN4TxGV
	 606Vxj7N1txEGCNpdfxHtd3oKOJRHar5cTWZ3Cs1ss2ma36cK5koxXqtuOak7VDhcU
	 cD8XmO4S0VN6A==
Received: from [IPv6:2606:6d00:11:b76d::5ac] (unknown [IPv6:2606:6d00:11:b76d::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 724BA17E127A;
	Thu, 19 Mar 2026 18:56:28 +0100 (CET)
Message-ID: <c582afedfb7059d9993c764ce9b8c7209541b7a7.camel@collabora.com>
Subject: Re: [PATCH v7 02/10] media: mediatek: decoder: Add a new platform
 data member
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
Date: Thu, 19 Mar 2026 13:56:26 -0400
In-Reply-To: <20260127024248.18406-3-kyrie.wu@mediatek.com>
References: <20260127024248.18406-1-kyrie.wu@mediatek.com>
	 <20260127024248.18406-3-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-EwVqE+hTjD+CI8Iz34xh"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260319_175638_179196_306C28CF 
X-CRM114-Status: GOOD (  19.89  )
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


--=-EwVqE+hTjD+CI8Iz34xh
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le mardi 27 janvier 2026 =C3=A0 10:42 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> Add a new platform data member to indicate each decoder IC
> to avoid the chip name definition keep growing.

I like Angelo's suggestion for chip model. In v8, can you also rephrase thi=
s
message, perhaps:
  =20
  =20
   Move the chip model information into the codec match data and remove the
   second compatible matching code.
  =20
You can add to v8:

Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

cheers,
Nicolas

>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> ---
> =C2=A0.../mediatek/vcodec/decoder/mtk_vcodec_dec.h=C2=A0 |=C2=A0 5 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 35 ++-----
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0 | 15 +--
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_hw.c=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0 |=C2=A0 2 +-
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateful.c=C2=A0 |=C2=A0 1 +
> =C2=A0.../vcodec/decoder/mtk_vcodec_dec_stateless.c | 92 ++++++++++++++--=
---
> =C2=A06 files changed, 86 insertions(+), 64 deletions(-)
>=20
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c.h
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> index 1af075fc0194..80cb46f1cded 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec.h
> @@ -69,6 +69,11 @@ extern const struct v4l2_m2m_ops mtk_vdec_m2m_ops;
> =C2=A0extern const struct media_device_ops mtk_vcodec_media_ops;
> =C2=A0extern const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata;
> =C2=A0extern const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata;
> +extern const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata;
> =C2=A0extern const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_pdata;
> =C2=A0extern const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata=
;
> =C2=A0
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> index 7ed40936a0e8..c7af48f684c5 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -333,24 +333,7 @@ static const struct v4l2_file_operations mtk_vcodec_=
fops
> =3D {
> =C2=A0
> =C2=A0static void mtk_vcodec_dec_get_chip_name(struct mtk_vcodec_dec_dev =
*vdec_dev)
> =C2=A0{
> -	struct device *dev =3D &vdec_dev->plat_dev->dev;
> -
> -	if (of_device_is_compatible(dev->of_node, "mediatek,mt8173-vcodec-
> dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8173;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8183-
> vcodec-dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8183;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8192-
> vcodec-dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8192;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8195-
> vcodec-dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8195;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8186-
> vcodec-dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8186;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-
> vcodec-dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8188;
> -	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-
> vcodec-dec"))
> -		vdec_dev->chip_name =3D MTK_VDEC_MT8196;
> -	else
> -		vdec_dev->chip_name =3D MTK_VDEC_INVAL;
> +	vdec_dev->chip_name =3D vdec_dev->vdec_pdata->chip_name;
> =C2=A0}
> =C2=A0
> =C2=A0static int mtk_vcodec_probe(struct platform_device *pdev)
> @@ -369,10 +352,6 @@ static int mtk_vcodec_probe(struct platform_device *=
pdev)
> =C2=A0	dev->plat_dev =3D pdev;
> =C2=A0
> =C2=A0	mtk_vcodec_dec_get_chip_name(dev);
> -	if (dev->chip_name =3D=3D MTK_VDEC_INVAL) {
> -		dev_err(&pdev->dev, "Failed to get decoder chip name");
> -		return -EINVAL;
> -	}
> =C2=A0
> =C2=A0	dev->vdec_pdata =3D of_device_get_match_data(&pdev->dev);
> =C2=A0	if (!of_property_read_u32(pdev->dev.of_node, "mediatek,vpu",
> @@ -389,7 +368,7 @@ static int mtk_vcodec_probe(struct platform_device *p=
dev)
> =C2=A0		return -ENODEV;
> =C2=A0	}
> =C2=A0	dma_set_max_seg_size(&pdev->dev, UINT_MAX);
> -	if (dev->chip_name =3D=3D MTK_VDEC_MT8196) {
> +	if (dev->chip_name =3D=3D 8196) {
> =C2=A0		ret =3D dma_set_mask_and_coherent(&pdev->dev,
> DMA_BIT_MASK(36));
> =C2=A0		if (ret) {
> =C2=A0			dev_err(&pdev->dev, "Failed to enable 36-bit DMA:
> %d\n", ret);
> @@ -558,23 +537,23 @@ static const struct of_device_id mtk_vcodec_match[]=
 =3D {
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8192-vcodec-dec",
> -		.data =3D &mtk_lat_sig_core_pdata,
> +		.data =3D &mtk_vdec_8192_pdata,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8186-vcodec-dec",
> -		.data =3D &mtk_vdec_single_core_pdata,
> +		.data =3D &mtk_vdec_8186_pdata,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8195-vcodec-dec",
> -		.data =3D &mtk_lat_sig_core_pdata,
> +		.data =3D &mtk_vdec_8195_pdata,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8188-vcodec-dec",
> -		.data =3D &mtk_lat_sig_core_pdata,
> +		.data =3D &mtk_vdec_8188_pdata,
> =C2=A0	},
> =C2=A0	{
> =C2=A0		.compatible =3D "mediatek,mt8196-vcodec-dec",
> -		.data =3D &mtk_lat_sig_core_pdata,
> +		.data =3D &mtk_vdec_8196_pdata,
> =C2=A0	},
> =C2=A0	{},
> =C2=A0};
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> index 1cb77619add9..bb293ada6fb2 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -19,17 +19,6 @@
> =C2=A0#define IS_VDEC_INNER_RACING(capability) ((capability) &
> MTK_VCODEC_INNER_RACING)
> =C2=A0#define IS_VDEC_SUPPORT_EXT(capability) ((capability) &
> MTK_VDEC_IS_SUPPORT_EXT)
> =C2=A0
> -enum mtk_vcodec_dec_chip_name {
> -	MTK_VDEC_INVAL =3D 0,
> -	MTK_VDEC_MT8173 =3D 8173,
> -	MTK_VDEC_MT8183 =3D 8183,
> -	MTK_VDEC_MT8186 =3D 8186,
> -	MTK_VDEC_MT8188 =3D 8188,
> -	MTK_VDEC_MT8192 =3D 8192,
> -	MTK_VDEC_MT8195 =3D 8195,
> -	MTK_VDEC_MT8196 =3D 8196,
> -};
> -
> =C2=A0/*
> =C2=A0 * enum mtk_vdec_format_types - Structure used to get supported
> =C2=A0 *		=C2=A0 format types according to decoder capability
> @@ -106,6 +95,7 @@ struct vdec_pic_info {
> =C2=A0 *
> =C2=A0 * @is_subdev_supported: whether support parent-node architecture(s=
ubdev)
> =C2=A0 * @uses_stateless_api: whether the decoder uses the stateless API =
with
> requests
> + * @chip_name: platforms configuration values
> =C2=A0 */
> =C2=A0struct mtk_vcodec_dec_pdata {
> =C2=A0	void (*init_vdec_params)(struct mtk_vcodec_dec_ctx *ctx);
> @@ -127,6 +117,7 @@ struct mtk_vcodec_dec_pdata {
> =C2=A0
> =C2=A0	bool is_subdev_supported;
> =C2=A0	bool uses_stateless_api;
> +	unsigned int chip_name;
> =C2=A0};
> =C2=A0
> =C2=A0/**
> @@ -307,7 +298,7 @@ struct mtk_vcodec_dec_dev {
> =C2=A0	struct mutex dec_racing_info_mutex;
> =C2=A0	struct mtk_vcodec_dbgfs dbgfs;
> =C2=A0
> -	enum mtk_vcodec_dec_chip_name chip_name;
> +	unsigned int chip_name;
> =C2=A0};
> =C2=A0
> =C2=A0static inline struct mtk_vcodec_dec_ctx *fh_to_dec_ctx(struct v4l2_=
fh *fh)
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> index e4e527fe54dc..a926dc14d39d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_hw.c
> @@ -76,7 +76,7 @@ static void mtk_vdec_hw_clean_xpc(struct mtk_vdec_hw_de=
v
> *dev)
> =C2=A0{
> =C2=A0	u32 val, mask, addr =3D VDEC_XPC_CLEAN_ADDR;
> =C2=A0
> -	if (dev->main_dev->chip_name !=3D MTK_VDEC_MT8196)
> +	if (dev->main_dev->chip_name !=3D 8196)
> =C2=A0		return;
> =C2=A0
> =C2=A0	val =3D dev->hw_idx =3D=3D MTK_VDEC_LAT0 ? VDEC_XPC_LAT_VAL :
> VDEC_XPC_CORE_VAL;
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateful.=
c
> index aa9bdee7a96c..8ddb61670dc6 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_state=
ful.c
> @@ -618,4 +618,5 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8173_pdata=
 =3D {
> =C2=A0	.flush_decoder =3D mtk_vdec_flush_decoder,
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> +	.chip_name =3D 8173,
> =C2=A0};
> diff --git
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> index c1cef78471a9..0745bc3ee490 100644
> ---
> a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> +++
> b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_stateless=
.c
> @@ -550,16 +550,16 @@ static void mtk_vcodec_dec_fill_h264_level(struct
> v4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8192:
> -	case MTK_VDEC_MT8188:
> +	case 8192:
> +	case 8188:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_5_2;
> =C2=A0		break;
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_6_0;
> =C2=A0		break;
> -	case MTK_VDEC_MT8183:
> -	case MTK_VDEC_MT8186:
> +	case 8183:
> +	case 8186:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_LEVEL_4_2;
> =C2=A0		break;
> =C2=A0	default:
> @@ -572,9 +572,9 @@ static void mtk_vcodec_dec_fill_h264_profile(struct
> v4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8188:
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8188:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_H264_PROFILE_HIGH_10;
> =C2=A0		break;
> =C2=A0	default:
> @@ -587,11 +587,11 @@ static void mtk_vcodec_dec_fill_h265_level(struct
> v4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8188:
> +	case 8188:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_1;
> =C2=A0		break;
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_LEVEL_5_2;
> =C2=A0		break;
> =C2=A0	default:
> @@ -604,9 +604,9 @@ static void mtk_vcodec_dec_fill_h265_profile(struct
> v4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8188:
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8188:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_HEVC_PROFILE_MAIN_10;
> =C2=A0		break;
> =C2=A0	default:
> @@ -619,15 +619,15 @@ static void mtk_vcodec_dec_fill_vp9_level(struct
> v4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8192:
> -	case MTK_VDEC_MT8188:
> +	case 8192:
> +	case 8188:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_1;
> =C2=A0		break;
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_5_2;
> =C2=A0		break;
> -	case MTK_VDEC_MT8186:
> +	case 8186:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_LEVEL_4_1;
> =C2=A0		break;
> =C2=A0	default:
> @@ -640,9 +640,9 @@ static void mtk_vcodec_dec_fill_vp9_profile(struct
> v4l2_ctrl_config *cfg,
> =C2=A0					=C2=A0=C2=A0=C2=A0 struct mtk_vcodec_dec_ctx *ctx)
> =C2=A0{
> =C2=A0	switch (ctx->dev->chip_name) {
> -	case MTK_VDEC_MT8188:
> -	case MTK_VDEC_MT8195:
> -	case MTK_VDEC_MT8196:
> +	case 8188:
> +	case 8195:
> +	case 8196:
> =C2=A0		cfg->max =3D V4L2_MPEG_VIDEO_VP9_PROFILE_2;
> =C2=A0		break;
> =C2=A0	default:
> @@ -886,6 +886,7 @@ const struct mtk_vcodec_dec_pdata mtk_vdec_8183_pdata=
 =3D {
> =C2=A0	.get_cap_buffer =3D vdec_get_cap_buffer,
> =C2=A0	.is_subdev_supported =3D false,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> +	.chip_name =3D 8183,
> =C2=A0};
> =C2=A0
> =C2=A0/* This platform data is used for one lat and one core architecture=
. */
> @@ -906,6 +907,45 @@ const struct mtk_vcodec_dec_pdata mtk_lat_sig_core_p=
data
> =3D {
> =C2=A0	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> =C2=A0};
> =C2=A0
> +#define MTK_STATELESS_DEC_DATA \
> +	.init_vdec_params =3D mtk_init_vdec_params, \
> +	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup, \
> +	.vdec_vb2_ops =3D &mtk_vdec_request_vb2_ops, \
> +	.vdec_formats =3D mtk_video_formats, \
> +	.num_formats =3D &num_formats, \
> +	.default_out_fmt =3D &default_out_format, \
> +	.default_cap_fmt =3D &default_cap_format, \
> +	.uses_stateless_api =3D true, \
> +	.worker =3D mtk_vdec_worker, \
> +	.flush_decoder =3D mtk_vdec_flush_decoder, \
> +	.cap_to_disp =3D mtk_vdec_stateless_cap_to_disp, \
> +	.get_cap_buffer =3D vdec_get_cap_buffer, \
> +	.is_subdev_supported =3D true
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8188_pdata =3D {
> +	MTK_STATELESS_DEC_DATA,
> +	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> +	.chip_name =3D 8188,
> +};
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8192_pdata =3D {
> +	MTK_STATELESS_DEC_DATA,
> +	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> +	.chip_name =3D 8192,
> +};
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8195_pdata =3D {
> +	MTK_STATELESS_DEC_DATA,
> +	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> +	.chip_name =3D 8195,
> +};
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8196_pdata =3D {
> +	MTK_STATELESS_DEC_DATA,
> +	.hw_arch =3D MTK_VDEC_LAT_SINGLE_CORE,
> +	.chip_name =3D 8196,
> +};
> +
> =C2=A0const struct mtk_vcodec_dec_pdata mtk_vdec_single_core_pdata =3D {
> =C2=A0	.init_vdec_params =3D mtk_init_vdec_params,
> =C2=A0	.ctrls_setup =3D mtk_vcodec_dec_ctrls_setup,
> @@ -922,3 +962,9 @@ const struct mtk_vcodec_dec_pdata
> mtk_vdec_single_core_pdata =3D {
> =C2=A0	.is_subdev_supported =3D true,
> =C2=A0	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> =C2=A0};
> +
> +const struct mtk_vcodec_dec_pdata mtk_vdec_8186_pdata =3D {
> +	MTK_STATELESS_DEC_DATA,
> +	.hw_arch =3D MTK_VDEC_PURE_SINGLE_CORE,
> +	.chip_name =3D 8186,
> +};

--=-EwVqE+hTjD+CI8Iz34xh
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCabw4ygAKCRDZQZRRKWBy
9JehAQC5tA8FH8O5xX+ybgcWsy02+307x18Xoism/BCECG8BlgEArBU4hO/oYn9d
nLIoQ4tHhvWR0MdEfm09rcu2arUThgI=
=R0Hp
-----END PGP SIGNATURE-----

--=-EwVqE+hTjD+CI8Iz34xh--

