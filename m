Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E3B19CD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 15:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:Content-Type:
	References:In-Reply-To:Date:Cc:To:From:Subject:Message-ID:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wg2Lrup6O+yYlrsohm5/5oPyrPJp3ye8TWSmHs86r9Y=; b=rUBx+pGX4rpKgszhoAQ0ENo5aN
	jENcwNeETeag0MmewUdrU7Hhyz4U1lwHTP9cvx3hi5Zrtmn/sag17eU7c3bn4yDoCK3BCoXQdSb1Z
	yZuIPEQbU5FM012IbSwMeKvXXH1N4fw1rvidGuawZtpWTxaByecNEbuDb0deWpbrsadeQAcdbKDpL
	6R7ZgNygTyZQTVTQ1zW/dFvwxI8ys4x9ZcUmjUICUv+hD+gKWqhq6QnRlefKel3kqClMgAptUzYde
	5Ayq4ZksExBq0BgWpOvi7xeYwmL9KuW2NqOgykbC8kfDTj7pzeApbATVv2uWNxFgZ0AZlAm8AE7ry
	pTAR6NHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMHh-000000020Nq-3Lij;
	Tue, 19 May 2026 15:23:05 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPMHf-000000020Mz-3UNn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 15:23:05 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1779204180;
	bh=BwzlO1jv0/xoa5/nDtcFzfIYRReMTjtaUSLG2NPq+pA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References:From;
	b=jxIzF2JARvKB9MMdsdYEdIFzITAzDfQ0zAb2TYEm3noqEGS+q8FnO3Rb2W3N0ZGoe
	 A5cqNO9r5DQw7zM1B6//sf0AY9KrTqjDYR7mMNZORrWa08DZZ9FvDzBsLfhpc7yzeX
	 sSxsCozglLsnvuZ4lrNOZZel0IrAMZgc415wQ2qm1ClX8Dl/2TzyMXFGXENq+/u4xN
	 ub95GPHlGtk85j7HrKQmr4VOm5xeEDAeW7lr3AK2guhyAGd4GQkg1fiOYaVGaxFphx
	 3cu9RN2tQI1EF96G8oFFxLgF6CZSh9dlwXlH71qxaHARdtEqyCK6WMAIvhs6mUIg5d
	 l/tE8yJII349A==
Received: from [100.64.0.214] (unknown [100.64.0.214])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: nicolas)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 3579317E0234;
	Tue, 19 May 2026 17:22:59 +0200 (CEST)
Message-ID: <77a0553dc48c270768525a53854b3d32abcbf642.camel@collabora.com>
Subject: Re: [PATCH 07/16] media: v4l2-common: Add NV12_16L16 pixel format
 to v4l2 format info
From: Nicolas Dufresne <nicolas.dufresne@collabora.com>
To: Paul Kocialkowski <paulk@sys-base.io>, linux-media@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-staging@lists.linux.dev
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, Chen-Yu Tsai
 <wens@kernel.org>,  Jernej Skrabec <jernej.skrabec@gmail.com>, Samuel
 Holland <samuel@sholland.org>, Greg Kroah-Hartman	
 <gregkh@linuxfoundation.org>, Arash Golgol <arash.golgol@gmail.com>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Date: Tue, 19 May 2026 11:22:58 -0400
In-Reply-To: <20260518102451.417971-8-paulk@sys-base.io>
References: <20260518102451.417971-1-paulk@sys-base.io>
	 <20260518102451.417971-8-paulk@sys-base.io>
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
	protocol="application/pgp-signature"; boundary="=-3jaEoSmnM5AxWGabWN4z"
User-Agent: Evolution 3.60.1 (3.60.1-1.fc44) 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260519_082304_019126_F0BA26EB 
X-CRM114-Status: GOOD (  15.80  )
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


--=-3jaEoSmnM5AxWGabWN4z
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

Le lundi 18 mai 2026 =C3=A0 12:24 +0200, Paul Kocialkowski a =C3=A9crit=C2=
=A0:
> Represent the NV12_16L16 pixel format in the v4l2 format info table.
> This is a 16x16 tiled version of NV12.
>=20
> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
> =C2=A0drivers/media/v4l2-core/v4l2-common.c | 2 ++
> =C2=A01 file changed, 2 insertions(+)
>=20
> diff --git a/drivers/media/v4l2-core/v4l2-common.c b/drivers/media/v4l2-c=
ore/v4l2-common.c
> index e142d40c71b9..6194d6eb9c56 100644
> --- a/drivers/media/v4l2-core/v4l2-common.c
> +++ b/drivers/media/v4l2-core/v4l2-common.c
> @@ -313,6 +313,8 @@ const struct v4l2_format_info *v4l2_format_info(u32 f=
ormat)
> =C2=A0		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
> =C2=A0		{ .format =3D V4L2_PIX_FMT_P010_4L4, .pixel_enc =3D V4L2_PIXEL_EN=
C_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 2, 4, 0, 0 }, .bpp=
_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> =C2=A0		=C2=A0 .block_w =3D { 4, 4, 0, 0 }, .block_h =3D { 4, 4, 0, 0 }},
> +		{ .format =3D V4L2_PIX_FMT_NV12_16L16,	.pixel_enc =3D V4L2_PIXEL_ENC_Y=
UV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2, 0, 0 }, .bpp_di=
v =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
> +		=C2=A0 .block_w =3D { 16, 16, 0, 0 }, .block_h =3D { 16, 16, 0, 0 }},

I suspect this is:

+		{ .format =3D V4L2_PIX_FMT_NV12_16L16,	.pixel_enc =3D
V4L2_PIXEL_ENC_YUV, .mem_planes =3D 1, .comp_planes =3D 2, .bpp =3D { 1, 2,=
 0, 0 },
.bpp_div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2,
+		  .block_w =3D { 16, 8, 0, 0 }, .block_h =3D { 16, 16, 0, 0 }},


This was introduced for the Samsung MFC decoders on Exynos 5, has been matc=
hed
to V4L2_PIX_FMT_HM12, but I don't how it was tested though. But in this err=
a,
all the tiling was fixes dimensions in bytes, where your definition would m=
ake
the UV tiles twice the size of Y tiles.

Nicolas


> =C2=A0
> =C2=A0		/* YUV planar formats, non contiguous variant */
> =C2=A0		{ .format =3D V4L2_PIX_FMT_YUV420M, .pixel_enc =3D V4L2_PIXEL_ENC=
_YUV, .mem_planes =3D 3, .comp_planes =3D 3, .bpp =3D { 1, 1, 1, 0 }, .bpp_=
div =3D { 1, 1, 1, 1 }, .hdiv =3D 2, .vdiv =3D 2 },

--=-3jaEoSmnM5AxWGabWN4z
Content-Type: application/pgp-signature; name="signature.asc"
Content-Description: This is a digitally signed message part
Content-Transfer-Encoding: 7bit

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQTvDVKBFcTDwhoEbxLZQZRRKWBy9AUCagyAUgAKCRDZQZRRKWBy
9IajAP9qTPEgo5Hv9psPbr8R5uHkMx1r0b+TgKSHeDmgfQrILwEAuZsp1gb44Xug
Jx13TfSlNfWxumQomxxNJE9qwF6d2gI=
=3jLk
-----END PGP SIGNATURE-----

--=-3jaEoSmnM5AxWGabWN4z--

