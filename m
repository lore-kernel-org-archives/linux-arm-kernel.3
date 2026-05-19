Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1BD41CD4F54
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=09HWpVI2mADhsjiWt/ePjYOF+A7rmQaZq45OxzEPgtA=; b=IxSdOb0kcVLkDYIbWd/1RR1dkq
	N2g0DfrGwRLxx2lVqZfXguUc//rt0lKravZyN2+xf2vxYW447ApGMGGxvOMx1yjpfmYSNS8CLMm25
	FE7ezXGBhTQRrViFupf74jfdClpz99/6f4iOL6MpfRd4bvb1nuTN3rZFarCJrHTdt3/9Sz4ykmp5R
	6iSsHjjh2g4rAYMhdHy1CX3zHl6IKBcWd1JypdurnkyOV4MMAC1qGBsnWJ0qt/vdDEwqHy9Na7u/+
	tJhpKremaHQDXRcNYinkC4L1CfzuW1sIvVrchHibmzv1bhXE3Td/uTicVF0+E+c+zNKLB1BwD23rz
	Qb9lD/Vg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8n-00000002jBE-49PY;
	Tue, 19 May 2026 20:34:13 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPR8j-00000002j8G-30cZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:34:12 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id F206A1F8005A
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 20:34:04 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 0130CB40845; Tue, 19 May 2026 20:34:02 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 974A7B40839;
	Tue, 19 May 2026 20:34:01 +0000 (UTC)
Date: Tue, 19 May 2026 22:33:59 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Nicolas Dufresne <nicolas.dufresne@collabora.com>
Cc: linux-media@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	linux-staging@lists.linux.dev,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Arash Golgol <arash.golgol@gmail.com>,
	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Subject: Re: [PATCH 05/16] media: v4l2-common: Fix NV15_4L4 format info block
 height
Message-ID: <agzJNy_IR1HaPkm6@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-6-paulk@sys-base.io>
 <d2c20b4cac22f04bf864534edf27993236ac9e09.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="v1H1B5yuXqBZF6e6"
Content-Disposition: inline
In-Reply-To: <d2c20b4cac22f04bf864534edf27993236ac9e09.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133410_087809_82FEB258 
X-CRM114-Status: GOOD (  26.00  )
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


--v1H1B5yuXqBZF6e6
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Nicolas,

Thanks for the review!

Le Tue 19 May 26, 11:16, Nicolas Dufresne a =C3=A9crit :
> Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > The NV15_4L4 format is specified as a 4x4 format, not 4x1.
> > In addition the block size should not take subsampling in account,
> > so specify it as 4x4 for both luma and chroma.
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> > =C2=A0drivers/media/v4l2-core/v4l2-common.c | 2 +-
> > =C2=A01 file changed, 1 insertion(+), 1 deletion(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index 554c591e1113..77a0daa92c2b 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -309,7 +309,7 @@ const struct v4l2_format_info *v4l2_format_info(u32=
 format)
> > =C2=A0		/* Tiled YUV formats */
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .b=
pp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .=
bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > -		=C2=A0 .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 1, 1, 0, 0 }},
> > +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> Only the block_h is broken. The block_w is in "pixels" which for the UV p=
lane is
> component pairs. So both set of tiles have 5bytes stride. But since the s=
econd
> set, the UV tiles, are interleaved, they only have 2 pairs of UV per row.=
 So to
> me the correct fix is:
>=20
> +		  .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> If its not the case for the camera pipeline, then a new format is needed,=
 since
> this format should perfectly match NV15 + VIVANTE_TILED in the DRM world.

Ah yes I think you're right, I lost sight that these are semi-planar
formats with two components per chroma memory plane.

Good catch, thanks!

All the best,

Paul

> regards,
> Nicolas
>=20
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .b=
pp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > =C2=A0
> > =C2=A0		/* YUV planar formats, non contiguous variant */



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--v1H1B5yuXqBZF6e6
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoMyTcACgkQhP3B6o/u
lQw+XBAAh6LR+jAVOs8ZXJJqb+lYenbNR9A2g3xCPOjo3adHpfiHAQcXqj63ZOnc
a8gIPoK93exsnpVb42T/TXTmle7jWfimUZRXS00xSUH43BzZjb9mWak4N6zF7ySn
Qy3HKmfhX406S3O/a8VzIrmLGhMO/zEpfe6U7ci24KbKU36A2x9GmAdthYZemEXh
NNZG2sIuchlDvIPvw613wS1UzmYuANgeNZzWbZXDhF8DL5fqXvu2GXNpdou6/nmh
/ctnj06gU1OMQib2F/QIezK9m3n+NeVsNa8FfN5IOIY/iLLg6qDsN+ciiB2NIYrc
TNy4329mteseTg57EGcEx4vK5M7KYWft2FWRb5Iw/Y002ovmfQtbs0EcvqRwJEa+
t6jvo1eLHhHwmOowzWeqGVJGOVE4RLrZd1YuTxx4AUgfoNRqMKBvrJfyy13GiK4Z
+JxQYXQKlNSVY4hPr2DzOD8gO0pv90JOGbfV/vXaUmBrr4U2Os0VWaxLHTemV25Y
Sk3dBCNO7uthp+3hX2UAuKlVwJyXQeAUjzbMjpk2fAp8EriCjatDjEDyXymM5MXk
MAI2VZZcTm3Al+RWWR7AL+JrQd/MkKAMXqWlFzN5RaqvBj+3FecKE25779Ttt0BQ
yLE3MNkcVrYj2N0GXcRz8ItAVbwNDvelppOKro/0/DTpPQkuugw=
=z6to
-----END PGP SIGNATURE-----

--v1H1B5yuXqBZF6e6--

