Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48BB5CA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 15:13:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=EBO9hRElv9wXeqmRoBExVMWjj1R0p5q0Oq5nzcBJb3M=; b=L0pc8eQD21ilnojjmoCvQ5khky
	n3wqcHjPONFckJBa3zV0fPOTfiJZVvspkwvjaWrkSybBe+c/pkWFI/hZwsO570SWKDNGZJm8cx8Ym
	izMREigSiY16XA8nqplKdltkS4vmOZm449hS6C/Rlq1Ix2T8S6G5r2Sx2jH+iEsa0y/tbDPBfE7hA
	yFW43srG8UxbVsjz+m66ugtAPJI0Ho++gGu4CqXCAxj8GYnGOxl/RGbwlBgt7BhxA4IePQgwF7VO5
	PVi7ZLEtcsgSNEj6SeiZyLkP1iviJquecdQvFxcrWqGXWtaN8/5IvkepFJtiezvgQcQk7e9QMrInz
	nUbzBUEA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upTRl-00000002y3A-20uP;
	Fri, 22 Aug 2025 15:12:53 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upOwT-00000002BdJ-0xv5
	for linux-arm-kernel@lists.infradead.org;
	Fri, 22 Aug 2025 10:24:19 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 7D5231F00064
	for <linux-arm-kernel@lists.infradead.org>; Fri, 22 Aug 2025 10:24:03 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 9C220B01C5E; Fri, 22 Aug 2025 10:24:01 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id C43A7B01C52;
	Fri, 22 Aug 2025 10:23:59 +0000 (UTC)
Date: Fri, 22 Aug 2025 12:23:57 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: dri-devel@lists.freedesktop.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Cc: Maxime Ripard <mripard@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Maarten Lankhorst <maarten.lankhorst@linux.intel.com>,
	Thomas Zimmermann <tzimmermann@suse.de>,
	David Airlie <airlied@gmail.com>, Simona Vetter <simona@ffwll.ch>,
	Samuel Holland <samuel@sholland.org>
Subject: Re: [PATCH] drm/sun4i: Cleanup v3s mixer config fields ordering and
 indentation
Message-ID: <aKhFPRP8ILNkKAvy@shepard>
References: <20250704154149.3464461-1-paulk@sys-base.io>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="MlV5q36HRY4ckIBP"
Content-Disposition: inline
In-Reply-To: <20250704154149.3464461-1-paulk@sys-base.io>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250822_032417_460128_1F33E2F9 
X-CRM114-Status: GOOD (  21.88  )
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


--MlV5q36HRY4ckIBP
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Fri 04 Jul 25, 17:41, Paul Kocialkowski wrote:
> The v3s mixer config definition is a bit messy. Tidy it up.
> No function change is intended.

This patch didn't make it in the previous cycle.
Would it be possible to pick it up this time?

Thanks!

Paul

> Signed-off-by: Paul Kocialkowski <paulk@sys-base.io>
> ---
>  drivers/gpu/drm/sun4i/sun8i_mixer.c | 12 ++++++------
>  1 file changed, 6 insertions(+), 6 deletions(-)
>=20
> diff --git a/drivers/gpu/drm/sun4i/sun8i_mixer.c b/drivers/gpu/drm/sun4i/=
sun8i_mixer.c
> index 8b41d33baa30..674b55f218fc 100644
> --- a/drivers/gpu/drm/sun4i/sun8i_mixer.c
> +++ b/drivers/gpu/drm/sun4i/sun8i_mixer.c
> @@ -670,12 +670,12 @@ static const struct sun8i_mixer_cfg sun8i_r40_mixer=
1_cfg =3D {
>  };
> =20
>  static const struct sun8i_mixer_cfg sun8i_v3s_mixer_cfg =3D {
> -	.vi_num =3D 2,
> -	.ui_num =3D 1,
> -	.scaler_mask =3D 0x3,
> -	.scanline_yuv =3D 2048,
> -	.ccsc =3D CCSC_MIXER0_LAYOUT,
> -	.mod_rate =3D 150000000,
> +	.ccsc		=3D CCSC_MIXER0_LAYOUT,
> +	.mod_rate	=3D 150000000,
> +	.scaler_mask	=3D 0x3,
> +	.scanline_yuv	=3D 2048,
> +	.ui_num		=3D 1,
> +	.vi_num		=3D 2,
>  };
> =20
>  static const struct sun8i_mixer_cfg sun20i_d1_mixer0_cfg =3D {
> --=20
> 2.49.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--MlV5q36HRY4ckIBP
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmioRT0ACgkQhP3B6o/u
lQzkTg//WFiyxqhfUY6FczVWL/ImHTtICZrkvrBZX0dJV2uHqYzypnnyT6NxmMxk
SDXCSLmVFsSMoND1aiqS5dc4eYOPlSmo/hpJib1+nfo+1VTrB7dgafngaUpgcEXh
JBfaN92tUfhO+Aw/XSDY3Bh1vdYJt4LH/IfSpN7OFnULBw6/VVwVkOYUm/UvSFzf
RUGZ3WCqf/N9pVUDCTV8uRU104hhbZk8l6N4afTKcR3X6ol399SLZzZz+7y0UJWl
fU9229JlB9ndl1Pg5LsQz/eclJA0KFNAe6+EN1lHxDqReaiAtziTtIVzgdQLtpga
AUYSqY9oVinh0Bl2ENP5MmFFCBTduNN6/HK6IXH6wPIdMUpmU24w/Rw+MtUl/c4+
xkZ5L6U5idcFfEW/R+Tv8fyOVeCLXxDGg0gAhyo6wcf9k2HKDI1IV/FVeCaCs5wD
ztKSieqm6mr6xBIvdL9vKeLEAik1AmlNkpYQo4HFirxRCr+M/UlUeFf3NSlWhfx4
9WyDwMcctDD8ESW3V2Q3oYAPmQPh84oX2uMDyd19djNwcy+rxwvWmQc4X4ESFZDe
nE7BYg6g1UvJlLBIpWxEACNoX+oBJ/AIVtReJmmWB2wXFpTTZo5jOobrDnYHxOe1
ck45AXtCLJVrvt+LfBPR3XxAYalBQfW6zYsLjXUh+OlC7yq9Giw=
=aSaL
-----END PGP SIGNATURE-----

--MlV5q36HRY4ckIBP--

