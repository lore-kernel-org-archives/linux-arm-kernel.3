Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E0757F588E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Apr 2026 15:40:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M51VxdX8EOGNMZS/Z59lk+fNbIfNSz62XCzvdVnHyZw=; b=O4qZJ2+AwsfVlC0e4TN8IoEsrU
	f2EEnj345deuTr3vFts/LInAZH963iXXtuQktn/vz5i6Jef+zCTuZHCf5/OjovtjqpAerGNaCTz6O
	gQQ/vYrcCjFz/WMYJByihRLdhNVXr0+qARo+0sxTqgHIp6wj8SVtG2HxPrefupmY3hCxQ5FM7yfJU
	l/0yXJR20zpUkdn+lq4HgN0ZbRQx8tylZt37Y5BtrV82JenWEuOLiN8/Ae+a+e0fsTL8Wky/0famb
	fKZRZfHZVG5PsC8Bz6ElJsLXmXXkAHIkC3+JBnsGbWL+Qny3kq5rNRigMVX4A8qodfPXqC4UMp5UO
	nLfeJJgQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqjE-00000007KhZ-1EWK;
	Mon, 20 Apr 2026 15:40:04 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEqjB-00000007KgD-0gGh
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Apr 2026 15:40:02 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1776699597;
	bh=3a4Ypy1u/27PDujt5gseiPmQkXAZYng4hIbE0wEYSIo=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=foCCdtZZ/1xejNmuldd81+RADGJRtFhLL36zX5iKoOqelFoTXez78pbxFT3pBVv0g
	 Be2FFBv6Kras+cLdG+K+Cj5axodx61S+bMEm+5r4iw/gPSRaM9lE7TphN9nUWZadPp
	 b/QKOSHmG1HO23GPKMtDX4719enheLviE+SsOtE+udh0SAZqgoW7USfs/DecwSVYUZ
	 98Qy35orBPU0UAuFTMZ2JADqD6S1PS9qHMiT/x39ZH6bUYr4Py/+JTjJs++W7QJzex
	 aH3rMSHgSGlrKtomuZVFUGUttbi+WOJcL8X5eEtZHjcwNEXkkg99dNSyxUXxMAdTv5
	 G3AVGTaNoF31A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5B8CF17E0FFA;
	Mon, 20 Apr 2026 17:39:55 +0200 (CEST)
Message-ID: <90e206fad7bef6052fcf38314889e7ff525d3201.camel@collabora.com>
Subject: Re: [RFC PATCH v5 1/9] media: v4l2-common: Add YUV24 format info
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Nas Chung <nas.chung@chipsnmedia.com>, mchehab@kernel.org, 
	hverkuil@xs4all.nl, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, 	shawnguo@kernel.org, s.hauer@pengutronix.de
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-imx@nxp.com, 
	linux-arm-kernel@lists.infradead.org, marek.vasut@mailbox.org, 
	ming.qian@oss.nxp.com
Date: Mon, 20 Apr 2026 11:39:54 -0400
In-Reply-To: <20260415092529.577-2-nas.chung@chipsnmedia.com>
References: <20260415092529.577-1-nas.chung@chipsnmedia.com>
	 <20260415092529.577-2-nas.chung@chipsnmedia.com>
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
	protocol="application/pgp-signature"; boundary="=-2DWc7xt29sTqO4tsb6NB"
User-Agent: Evolution 3.58.3 (3.58.3-1.fc43) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260420_084001_378136_18D0997B 
X-CRM114-Status: GOOD (  13.02  )
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


--=-2DWc7xt29sTqO4tsb6NB
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le mercredi 15 avril 2026 =C3=A0 18:25 +0900, Nas Chung a =C3=A9crit=C2=A0:
> The YUV24 format is missing an entry in the v4l2_format_info().
> The YUV24 format is the packed YUV 4:4:4 formats with 8 bits
> per component.
>=20
> Fixes: 0376a51fbe5e ("media: v4l: Add packed YUV444 24bpp pixel format")
> Signed-off-by: Nas Chung <nas.chung@chipsnmedia.com>
> Reviewed-by: Nicolas Dufresne <nicolas.dufresne@collabora.com>

Unless you disagree, I might cherry-pick this one. Would it be ok with you =
?

Nicolas

> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 1 +
> =C2=A01 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index 554c591e1113..55bcd5975d9f 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -281,6 +281,7 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
> =C2=A0		{ .format =3D V4L2_PIX_FMT_Y212,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_Y216,=C2=A0=C2=A0=C2=A0 .pixel_enc =3D=
 V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 4, 0=
, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV48_12, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 6, 0, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> +		{ .format =3D V4L2_PIX_FMT_YUV24,=C2=A0=C2=A0 .pixel_enc =3D V4L2_PIXE=
L_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 3, 0, 0, 0 }, =
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> =C2=A0		{ .format =3D V4L2_PIX_FMT_MT2110T, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp=
_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> =C2=A0		=C2=A0 .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 32, 16, 0, 0 =
}},
> =C2=A0		{ .format =3D V4L2_PIX_FMT_MT2110R, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 2, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .bpp=
_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,

--=-2DWc7xt29sTqO4tsb6NB
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCaeZIygAKCRDZQZRRKWBy
9CfdAQCO+MAFLwej7ISQdlHPhX2fvSd7xBKCs0FZF4gVxogKnwD8Dc1yC+H87n/p
doPKag8f1pxYNb5/Tp1TSSVscskPSg4=
=uqzt
-----END PGP SIGNATURE-----

--=-2DWc7xt29sTqO4tsb6NB--

