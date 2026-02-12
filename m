Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 74CA6EEA84C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Feb 2026 19:31:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+tanNjc4QIAKKG8H7yNuDsbO8ZoKAd9yWg6r/Xlmmqs=; b=0rU6gwFp0nYWPDM6tR/ObJhXH4
	uow0QngCQtVLaAM82GdZ3rPTmrL1UZCM0VMGUKGSpZrNeya98pWAroAkyY9AqfIe1VEoOjYiutY1Y
	zbX7bsbSXS7KxzNcFPZNHl+LSbe7ZAoRtpthfV63xd3/gG2Y2qvXaVd5Pl5aCsQwt4JH4IwQwzJ8d
	RAlRv18dgo+3zcwdW8uuOfT8NCxXLxU6fp05k9QSc4lkQqfz1w9qWHYxp34Gq9petgGsXQgGPsGv7
	ITs1FL36hdsXGj1ToiG/6Bz0uIRPmzt1NSsVulgtEVqgDxkEqQ+JCTExWCmGPsDNyVeiQs/w/cm8R
	BefMSKbA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcPT-00000002a1M-0Wuc;
	Thu, 12 Feb 2026 19:31:33 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vqcPR-00000002a0j-0MOH;
	Thu, 12 Feb 2026 19:31:30 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770924686;
	bh=+qNUr0UoriHOp1Z7R0j7T53LVOa64ZsApE4fd9vU1/I=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=d8nUvkAehy9yHTSm6VurTOk3PcmpaHehiHFDkoonwDV33kpogDUNL1ptxqo9LRK6A
	 qX1Y4Q1vs7t0xSxy2eeG8EP1SMUpaeHXJhmAlX+oQ6dxqsBta0V7+MAqbN1CBqZB3y
	 bhfFYEEO1X3YtJ3KoJP5L9aRWFnEiLlyRMoML0f0c3bGMFJGV3WIq+v4QmdwVue+SO
	 R/t2p0GEq6Vd2w6YU2UvNIl1iddu+puh4N77Krk0tSKgEuqP0qn7q+ojPmENkIfji5
	 8DKsE9YLxQK6tinu1KNyswU3YLRogAmtUsrI1ZMWdisHu8m1UD3F3AW+6zBjiL8khO
	 KcDuY0tc3sT7g==
Received: from [IPv6:2606:6d00:15:210e::5ac] (unknown [IPv6:2606:6d00:15:210e::5ac])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3DB0A17E1274;
	Thu, 12 Feb 2026 20:31:24 +0100 (CET)
Message-ID: <ce23bec1765032aad25e036b46cf45eb97764ea0.camel@collabora.com>
Subject: Re: [PATCH v3 02/14] media: mediatek: vcodec: add decoder
 compatible to support mt8196
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Nicolas Frattaroli <nicolas.frattaroli@collabora.com>, 
 =?ISO-8859-1?Q?N=EDcolas?= "F . R . A . Prado"	 <nfraprado@collabora.com>,
 Sebastian Fricke <sebastian.fricke@collabora.com>,  Hans Verkuil
 <hverkuil-cisco@xs4all.nl>, AngeloGioacchino Del Regno	
 <angelogioacchino.delregno@collabora.com>, Benjamin Gaignard	
 <benjamin.gaignard@collabora.com>, Nathan Hebert <nhebert@chromium.org>, 
 Daniel Almeida <daniel.almeida@collabora.com>,
 linux-mediatek@lists.infradead.org
Cc: Hsin-Yi Wang <hsinyi@chromium.org>, Fritz Koenig
 <frkoenig@chromium.org>,  Daniel Vetter <daniel@ffwll.ch>, Steve Cho
 <stevecho@chromium.org>, Yunfei Dong <yunfei.dong@mediatek.com>, 
	linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Project_Global_Chrome_Upstream_Group@mediatek.com
Date: Thu, 12 Feb 2026 14:31:21 -0500
In-Reply-To: <6176231.DvuYhMxLoT@workhorse>
References: <20260211054149.27249-1-yunfei.dong@mediatek.com>
	 <20260211054149.27249-3-yunfei.dong@mediatek.com>
	 <6176231.DvuYhMxLoT@workhorse>
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
	protocol="application/pgp-signature"; boundary="=-ExWRxj2PEKAcesDrVVPq"
User-Agent: Evolution 3.58.2 (3.58.2-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260212_113129_305986_8CF0910D 
X-CRM114-Status: GOOD (  21.95  )
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


--=-ExWRxj2PEKAcesDrVVPq
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 12 f=C3=A9vrier 2026 =C3=A0 17:48 +0100, Nicolas Frattaroli a =C3=
=A9crit=C2=A0:
> On Wednesday, 11 February 2026 06:41:29 Central European Standard Time Yu=
nfei
> Dong wrote:
> > MT8196 is lat single core architecture. Support its compatible and
> > use `mtk_lat_sig_core_pdata` to initialize platform data.
> >=20
> > Signed-off-by: Yunfei Dong <yunfei.dong@mediatek.com>
> > ---
> > =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c=C2=A0=
=C2=A0 | 6 ++++++
> > =C2=A0.../platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h=C2=A0=
=C2=A0 | 1 +
> > =C2=A02 files changed, 7 insertions(+)
> >=20
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> > index 3b81fae9f913..d9f722698198 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.c
> > @@ -347,6 +347,8 @@ static void mtk_vcodec_dec_get_chip_name(struct
> > mtk_vcodec_dec_dev *vdec_dev)
> > =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8186;
> > =C2=A0	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8188-
> > vcodec-dec"))
> > =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8188;
> > +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-
> > vcodec-dec"))
> > +		vdec_dev->chip_name =3D MTK_VDEC_MT8196;
>=20
> Why is this entire function written like this, and why does it exist
> at all? You can store the chip name in the platform data for a compatible=
,
> thereby avoiding a massive of_device_is_compatible if block because that'=
s
> what platform data is for.
>=20
> The only place where this function is even used is in probe.
>=20
> Just store it in your mtk_vcodec_match's .data struct and pull it from
> dev->vdec_pdata. No need for the function.

I have already asked this to the dev working on some other MTK codec patchs=
et,
and I think he already posted some proper refactoring (but had more changes=
 to
finish it up). Mind, Yunfei, coordinating the effort on removing all the if=
/else
please ? We are doing the same code review again and again with every singl=
e
individual working on this driver.

regards,
Nicolas

>=20
> > =C2=A0	else
> > =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_INVAL;
> > =C2=A0}
> > @@ -560,6 +562,10 @@ static const struct of_device_id mtk_vcodec_match[=
] =3D {
> > =C2=A0		.compatible =3D "mediatek,mt8188-vcodec-dec",
> > =C2=A0		.data =3D &mtk_lat_sig_core_pdata,
> > =C2=A0	},
> > +	{
> > +		.compatible =3D "mediatek,mt8196-vcodec-dec",
> > +		.data =3D &mtk_lat_sig_core_pdata,
> > +	},
> > =C2=A0	{},
> > =C2=A0};
> > =C2=A0
> > diff --git
> > a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> > index c9d27534c63e..f06dfc1a3455 100644
> > --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> > +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> > @@ -29,6 +29,7 @@ enum mtk_vcodec_dec_chip_name {
> > =C2=A0	MTK_VDEC_MT8188 =3D 8188,
> > =C2=A0	MTK_VDEC_MT8192 =3D 8192,
> > =C2=A0	MTK_VDEC_MT8195 =3D 8195,
> > +	MTK_VDEC_MT8196 =3D 8196,
> > =C2=A0};
> > =C2=A0
> > =C2=A0/*
> >=20
>=20
>=20
>=20

--=-ExWRxj2PEKAcesDrVVPq
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaY4qiQAKCRDZQZRRKWBy
9HeYAQCWhI9bf5Bxz3iHnJha5FN0WSgszG3muAHP/g8J/IEASQD+P/e/9t05GUPv
+FUC4Inp4Ry1nEoRPqRIjZMwr70F9g8=
=JVru
-----END PGP SIGNATURE-----

--=-ExWRxj2PEKAcesDrVVPq--

