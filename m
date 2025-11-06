Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B75FCCFA03
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Nov 2025 14:22:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1v8nehBVOqzn8idG71tlPgwA4N+2QdISoIJzt2gPRGY=; b=bukmzGBiYQCkELf/Oo6QPsqn3A
	ivqL9xErYo/0UAirQSC5KE5bKqBD4PcBFd8t1y6sXUoAwAcLekS7ZXYtIrHM03uRs/AunWW2n7o07
	c32Qf0zFg+DB6TUizaZ1afpgs6DIeu2MTs9i9q0D31rvuEToY7qoQV/ZnW/HFi/NYtaeDhCVCBLFA
	1eYpcHhAZJtQMpA9xkvdfs1pRxPVDC5HThb58Vq/nGH6VRjW9j/Q9jjeWFgZWruGkZB0meNvV4qM9
	FB5zb24nkY+3PLNb1Y4HSbYSTVyIKeCGTc1YixaySN+f2CcYHvj/k5nhj0NZhV9F90phO5/xzXIWl
	e914XIxQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0sJ-0000000Fgpb-1Z0D;
	Thu, 06 Nov 2025 14:22:07 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vH0sG-0000000FgoK-3Ewv;
	Thu, 06 Nov 2025 14:22:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762438922;
	bh=6LTpQ06d4NRkE2ObR0JDxtr4dVIQE2cbJXlCr+9SGQo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=AvNHmc91KLAG8qg2YdrxcA23kBbT0V6pU8eF7ZDi5rzEosUUGyqVDj5OgFWp64ID6
	 bpFNatoHW27V4DLYZAcwOhygMkZVztAYKU1hg7Gmu6yrmI94QlWN6Sng9tsrdXAmyF
	 fjN+RZCVQh+cz/OqyTrYQE/ncAQj9DHLFe3aqhoMtvdvUqUaBQe5YNRXNTOgyoaEze
	 FVxoy/KJzFVuuURroCk5YqtzAOZPmd3bNCi8pbtrwk/GJHJ7/UhCTmxxcP5s/8jMOo
	 YiO/hzwHJEvBc0H7ss2lT4h4bPKgjRsmVFxfhVoATgEUXcXptMrOjt0pwILFK2Cc+/
	 pedulFEpLTLyA==
Received: from [IPv6:2606:6d00:11:ef24::c41] (unknown [IPv6:2606:6d00:11:ef24::c41])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 25B5717E0CA1;
	Thu,  6 Nov 2025 15:21:59 +0100 (CET)
Message-ID: <49d55e669473bef7b08882916095f10f409c85a0.camel@collabora.com>
Subject: Re: [PATCH v5 2/8] media: mediatek: vcodec: add decoder compatible
 to support MT8189
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
Date: Thu, 06 Nov 2025 09:21:58 -0500
In-Reply-To: <20251106061323.2193-3-kyrie.wu@mediatek.com>
References: <20251106061323.2193-1-kyrie.wu@mediatek.com>
	 <20251106061323.2193-3-kyrie.wu@mediatek.com>
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
	protocol="application/pgp-signature"; boundary="=-IdhGf+gEgY7bxzqJixSa"
User-Agent: Evolution 3.56.2 (3.56.2-2.fc42) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251106_062204_962389_B1B4D0D5 
X-CRM114-Status: GOOD (  17.28  )
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


--=-IdhGf+gEgY7bxzqJixSa
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Hi,

Le jeudi 06 novembre 2025 =C3=A0 14:13 +0800, Kyrie Wu a =C3=A9crit=C2=A0:
> MT8189 is pure single core architecture. Support its compatible and
> use `mtk_vdec_single_core_pdata` to initialize platform data.
>=20
> Signed-off-by: Kyrie Wu <kyrie.wu@mediatek.com>
> Reviewed-by: AngeloGioacchino Del Regno <angelogioacchino.delregno@collab=
ora.com>
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
> index 6fb05bb00641..fca60e81e3c7 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.c
> @@ -347,6 +347,8 @@ static void mtk_vcodec_dec_get_chip_name(struct mtk_v=
codec_dec_dev *vdec_dev)
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8188;
> =C2=A0	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8196-vc=
odec-dec"))
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_MT8196;
> +	else if (of_device_is_compatible(dev->of_node, "mediatek,mt8189-vcodec-=
dec"))
> +		vdec_dev->chip_name =3D MTK_VDEC_MT8189;
> =C2=A0	else
> =C2=A0		vdec_dev->chip_name =3D MTK_VDEC_INVAL;
> =C2=A0}
> @@ -574,6 +576,10 @@ static const struct of_device_id mtk_vcodec_match[] =
=3D {
> =C2=A0		.compatible =3D "mediatek,mt8196-vcodec-dec",
> =C2=A0		.data =3D &mtk_lat_sig_core_pdata,
> =C2=A0	},
> +	{
> +		.compatible =3D "mediatek,mt8189-vcodec-dec",
> +		.data =3D &mtk_vdec_single_core_pdata,
> +	},

Maybe its just me, but its annoying that you match the compatible twice. It=
 is
of course more work to add yet another indirection for the chip_name, but
considering you do 2 soc / year (and sometimes more) this will keep growing=
.

Opinions ? I'd don't want to block this forever, but I'd like to see some
cleanup of this driver happening in the long term.

Nicolas

> =C2=A0	{},
> =C2=A0};
> =C2=A0
> diff --git a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_de=
c_drv.h b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv=
.h
> index 429b32952194..9421fd4fda1d 100644
> --- a/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> +++ b/drivers/media/platform/mediatek/vcodec/decoder/mtk_vcodec_dec_drv.h
> @@ -25,6 +25,7 @@ enum mtk_vcodec_dec_chip_name {
> =C2=A0	MTK_VDEC_MT8183 =3D 8183,
> =C2=A0	MTK_VDEC_MT8186 =3D 8186,
> =C2=A0	MTK_VDEC_MT8188 =3D 8188,
> +	MTK_VDEC_MT8189 =3D 8189,
> =C2=A0	MTK_VDEC_MT8192 =3D 8192,
> =C2=A0	MTK_VDEC_MT8195 =3D 8195,
> =C2=A0	MTK_VDEC_MT8196 =3D 8196,

--=-IdhGf+gEgY7bxzqJixSa
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaQyvBgAKCRDZQZRRKWBy
9IPJAP9KEcQgbQ/1/dn3z4hh+pf9gIoQw7JY+DY9KFuzQSbuDgEAoYvS0YGR1n9V
ksidpcraN6RLZCAcUMnEhwYavCvi8wg=
=RRDe
-----END PGP SIGNATURE-----

--=-IdhGf+gEgY7bxzqJixSa--

