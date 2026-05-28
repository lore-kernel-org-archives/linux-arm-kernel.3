Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0BD6ACD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 28 May 2026 07:42:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0H9OQ2AgnOfV0xPcZCWcjw22GxnxCaFaIlykjEiPVCc=; b=X+WY2HY9oDMqW8xp69IS9CQrxP
	M3DmvfGgJx3McDXFnBjBZd9ddVrztSK1s9QMtO5eGamB5bvIjJ9OjxdEkFvH8Sx6/i8jqU08ouh3A
	IeurECwxNtXtt032dn+XCx2jhlEUlfwGH6Bgare/udtwXa6WuE9X16Sg4NhRsrdMOb4xeOus/Q9Dw
	O1NbuE9m8vhmCnDnRNQLPsq1NPIJZpqC+lz0kpygoY9ABHzXxbs7XwVO1RnVdHnCLCPRJoyUIOEaz
	P9qspPS2YhvFVHM/f8uah1mbmOMsD8pBEr3J2KC/sPn4fCPPzgCBLmpme4N6MxwX3MhwoqOsiQOEx
	KDd8KTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVNV-00000005HnM-20o0;
	Thu, 28 May 2026 07:42:05 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSVNO-00000005Hhi-0xkz
	for linux-arm-kernel@lists.infradead.org;
	Thu, 28 May 2026 07:42:00 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4E47B37002E1
	for <linux-arm-kernel@lists.infradead.org>; Thu, 28 May 2026 07:41:54 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 97D35B4093D; Thu, 28 May 2026 07:41:52 +0000 (UTC)
Received: from shepard (unknown [37.167.6.153])
	by laika.paulk.fr (Postfix) with ESMTPSA id 17379B40938;
	Thu, 28 May 2026 07:41:48 +0000 (UTC)
Date: Thu, 28 May 2026 09:41:38 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Arash Golgol <arash.golgol@gmail.com>
Cc: linux-media@vger.kernel.org, yong.deng@magewell.com, mchehab@kernel.org,
	wens@kernel.org, jernej.skrabec@gmail.com, samuel@sholland.org,
	laurent.pinchart@ideasonboard.com,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH] media: sun6i-csi: bridge: Remove duplicate mbus format
 entries
Message-ID: <ahfxskMC340jUtbQ@shepard>
References: <20260527124552.33815-1-arash.golgol@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1y4O8A5/17eWGJgn"
Content-Disposition: inline
In-Reply-To: <20260527124552.33815-1-arash.golgol@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260528_004158_458991_C3ED13A4 
X-CRM114-Status: GOOD (  17.61  )
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


--1y4O8A5/17eWGJgn
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi Arash,

On Wed 27 May 26, 16:15, Arash Golgol wrote:
> The driver reports MEDIA_BUS_FMT_UYVY8_2X8 and
> MEDIA_BUS_FMT_UYVY8_1X16 twice when enumerating supported media bus
> codes.
>=20
> Remove the duplicated entries from sun6i_csi_bridge_formats[].

Looks good to me, thanks for taking care of this!

> Signed-off-by: Arash Golgol <arash.golgol@gmail.com>

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> ---
>  .../platform/sunxi/sun6i-csi/sun6i_csi_bridge.c      | 12 ------------
>  1 file changed, 12 deletions(-)
>=20
> diff --git a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c b/=
drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> index d006d9dd0170..0bec0cd7620e 100644
> --- a/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> +++ b/drivers/media/platform/sunxi/sun6i-csi/sun6i_csi_bridge.c
> @@ -113,12 +113,6 @@ static const struct sun6i_csi_bridge_format sun6i_cs=
i_bridge_formats[] =3D {
>  		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
>  		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
>  	},
> -	{
> -		.mbus_code		=3D MEDIA_BUS_FMT_UYVY8_2X8,
> -		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> -		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> -		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> -	},
>  	{
>  		.mbus_code		=3D MEDIA_BUS_FMT_VYUY8_2X8,
>  		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> @@ -143,12 +137,6 @@ static const struct sun6i_csi_bridge_format sun6i_cs=
i_bridge_formats[] =3D {
>  		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_YVYU,
>  		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_YUYV,
>  	},
> -	{
> -		.mbus_code		=3D MEDIA_BUS_FMT_UYVY8_1X16,
> -		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> -		.input_yuv_seq		=3D SUN6I_CSI_INPUT_YUV_SEQ_UYVY,
> -		.input_yuv_seq_invert	=3D SUN6I_CSI_INPUT_YUV_SEQ_VYUY,
> -	},
>  	{
>  		.mbus_code		=3D MEDIA_BUS_FMT_VYUY8_1X16,
>  		.input_format		=3D SUN6I_CSI_INPUT_FMT_YUV422,
> --=20
> 2.34.1
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--1y4O8A5/17eWGJgn
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmoX8bIACgkQhP3B6o/u
lQzU2Q//f7QdVsQ1gypsibBCePiIiVDTE55KY5tR06XO8JzvYp2WUJML1pa1ui3J
b5hK2hHdAG1tyJpEk+1PUM0IUkCSO0JcrFN3eoSrveiIUQPQPW1W2wxqiiL3ObP/
ZA/Nos/uppyMmwy/8xNWOYU/vTqe4bcXhfVGsZGuQK2NhTl7xpBu94y3HfCIuYLZ
VCJwKqSuZlEmjj+TrAKf8beYKnIxKtnshcNTuPfg+HT9hKRZ8SAynzi2Cjes0sNX
byb/ugVmjCVHZkQ8frjSAO1OoTAJo3pEsUtjNSiZepBwHlyOrT45z2J7nIfJmf6n
F+lYRl3INteEVBxM2EBleo5Osj3Qx1dzixKx/F4KbTaALRVxFiBj+nPnnen2QBA4
HSU9YcSJ2oqKp5gw2c3z1xlG9w4nWmHOhHOcNEs2+6K5YrzOPgZ+bROfSvQKKOvV
eHGcWvauneSLhc5aXkMO3StdgiUDff4qySgIWu/ZC03DrJ33ydh3ISQKduA21Wao
tf7GbgpBePN0KxgEV4UePBDc9NHXxou9si1MEpl85Gfn8dI339t/XQTWePzNQTOE
6xdY2xXzBMcfmuCuk9vGdVdwfajxHGOk0WUbElDWHxPuYybA4/u3JOohdbk2AQ/9
i1c3+pCSHSTngKi9Jjn0avU+Ir/Oq6D/+gujAMkOgQCZy9jx3Ko=
=jm2v
-----END PGP SIGNATURE-----

--1y4O8A5/17eWGJgn--

