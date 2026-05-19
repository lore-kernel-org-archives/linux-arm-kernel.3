Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1D90CD4F5B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 20:37:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=f5iOtGjIzdZgv4VAB8PhI81YZHs3VcAbtRogyzmgUoA=; b=ZikAUsVqowq82/9WIRWjAlXOa4
	Yy1WvTnV7c3ZKdZ9oejETCJODd9AmcAl6O9h2kvyC4cnSdQESHrl+fPSLgs0OvHu/fKLZnnip3psc
	Cms/HkWNjbtweA5ZIc2H/pD2LW4R8LiO7GpJopByIqhRlQc7+DIbw3tOG7f35jVsA48qgrW2NCw67
	NkKnPT8pdfWdrf1JLZaGHlwpjX2hA4cOeERl/gk8X+xnRG7M5Kv7zVqtQLvU22l1HMustqoxts35V
	6Mcp7gy1KkhD6w3lawAZES8zlAbc8MZ25/xAGwu57/7a9dSXQpmK7wHopeJlZ5dmOEuPP0HBfVryR
	XHsXa6ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRC2-00000002jk3-1cjF;
	Tue, 19 May 2026 20:37:34 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPRBy-00000002jjT-26ZY
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 20:37:32 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 64B581F8005C
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 May 2026 20:37:27 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 3EC14B40845; Tue, 19 May 2026 20:37:26 +0000 (UTC)
Received: from collins (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 11335B40839;
	Tue, 19 May 2026 20:37:25 +0000 (UTC)
Date: Tue, 19 May 2026 22:37:23 +0200
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
Subject: Re: [PATCH 06/16] media: v4l2-common: Add missing tiled format info
 block sizes
Message-ID: <agzKA11feGZExvEP@collins>
References: <20260518102451.417971-1-paulk@sys-base.io>
 <20260518102451.417971-7-paulk@sys-base.io>
 <689495bda73de063506d0a63de79b9e099747aa8.camel@collabora.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qDQIAplM8RyG3VNl"
Content-Disposition: inline
In-Reply-To: <689495bda73de063506d0a63de79b9e099747aa8.camel@collabora.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_133730_862602_C99DE7C9 
X-CRM114-Status: GOOD (  25.34  )
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


--qDQIAplM8RyG3VNl
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Le Tue 19 May 26, 11:18, Nicolas Dufresne a =C3=A9crit :
> Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=
=C2=A0:
> > Some YUV420 tiled format info definitions are missing block sizes.
> > Add the missing block sizes (they are all 4x4).
> >=20
> > Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> > ---
> > =C2=A0drivers/media/v4l2-core/v4l2-common.c | 6 ++++--
> > =C2=A01 file changed, 4 insertions(+), 2 deletions(-)
> >=20
> > diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2=
-core/v4l2-common.c
> > index 77a0daa92c2b..e142d40c71b9 100644
> > --- a/drivers/media/v4l2-core/v4l2-common.c
> > +++ b/drivers/media/v4l2-core/v4l2-common.c
> > @@ -307,10 +307,12 @@ const struct v4l2_format_info *v4l2_format_info(u=
32 format)
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_GREY,=C2=A0=C2=A0=C2=A0 .pixel_enc =
=3D V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 1, .bpp =3D { 1=
, 0, 0, 0 }, .bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 1, .vdiv =3D 1 },
> > =C2=A0
> > =C2=A0		/* Tiled YUV formats */
> > -		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > +		{ .format =3D V4L2_PIX_FMT_NV12_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_NV15_4L4, .pixel_enc =3D V4L2_PIXEL_=
ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 5, 10, 0, 0 }, .=
bpp_div =3D { 4, 4, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > =C2=A0		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }=
},
> > -		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },
> > +		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> > +		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> .block_w =3D { 4, 2, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
>=20
> This one is speecial, this format does not exists. I believe Jernej made =
that
> one based on assumptions, the actual HW should produce NV15 4L4, but I do=
n't own
> that hardware, and so I never managed remove that last "user" of it, whic=
h is I
> believe H6 VP9 decoder.

I don't think I've ever tried it but do I have some H6 hardware around,
so maybe I could test it eventually and figure out if it really uses
this format or not.

I guess it doesn't hurt to keep the definition either way.

All the best,

Paul

>=20
> Nicolas
>=20
> > =C2=A0
> > =C2=A0		/* YUV planar formats, non contiguous variant */
> > =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_E=
NC_YUV, .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bp=
p_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },



--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--qDQIAplM8RyG3VNl
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoMygMACgkQhP3B6o/u
lQyhfQ/+OihZP1pX+KtLZHb5PzSuHG0dNVPtJqPXxuifAq/+8LDU7nVA4PnCrecI
XgxCEuVL34zttetOPT6eEv3bS5ggk83M/Cc5rB4eQqvmJvEF9CtPH42w0oTphKY3
+0tdM1crZVVxMOZAWf0h0/vPcxU0u8k/9fiNhXGxZoHebaJKRYDsM/GRmdx00sRG
NZhyZda+siMNnD8U8GHh5BYC8jJaGXdNRfVbybTSy4gy6lfxHGjCNXyPUip2CuVl
aorL2mN5Tn6u2k2CeVsiNtFY88piEoKPNCj3qPrBwpfJus1shJT6KzG7hV0VkmWJ
q4X6AifqLw2xKTrXKr2bn8ZuoPTU+1NXRW2AAZSjJZ3UEULyc2FMPeyl63PRx5mu
5qFLO6oODog4myIXxRgX5I+348Woyk2fJlkiuQtwgropwM7IQsANfngK6NlJtK5+
SGIu6RpmqaRsok/80menkJHVbe9eVWY5s9dFE7hOtZDIuuJzit5Iaa1u6659MKcN
+2Q5z/EsdeMfSWtN58hhpCP+i/pv7K/tmswIjFl8/tFAMLld6dtQbUYDaDtnF26f
K0CBJjm6GCtl9JgcCUAgXgHsKbxe0tAYL89dciy4Gurl0tRbUfEDr5NgUHQ5UtON
EY4XD09tRKRV2RUt8y2S64q6kzTRZ999rAOoOveEj79GOO7AYNs=
=PJVw
-----END PGP SIGNATURE-----

--qDQIAplM8RyG3VNl--

