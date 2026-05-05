Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AAB4CD3427
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 May 2026 13:09:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UddZamzvC1yg0ZBTUZu2OKA00w0YS6UygPeTDigZ9mY=; b=Iaj36NJbGT/JnMFxKpHeQBps65
	1/63xuaRpOhxZk7QJaPZR9bU7+9cqhSksD+fIA9lkwEIGdJSwU0f5tV3veyk9fYZVGjuiE5UW+ojy
	ckOhqWLJPXkT4jFrId+/J210Htu8dmWh3ftsLgabXiZpbfROKqpEFPVqk/1qxqyL2iN5D60ikLs8T
	pDzuHJbTdN9pBrZaL02BMZgjeXBA1AE3OUBcDvhcK4sfaW8iWRIHla+s46l20dQXuujDTuqyeyyCN
	uL2evon7yVGzEgcE1iQeSnbja6BSw/SHOnN/vCdA/vmCzdFQ8o0B7TZlQ/JKULN4cVzDZHPJs/piM
	WX7oZPCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFWw-0000000GHbs-2Wh3;
	Tue, 05 May 2026 13:09:44 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wKFWs-0000000GHaj-24Ae
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 May 2026 13:09:40 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 359461F8005A
	for <linux-arm-kernel@lists.infradead.org>; Tue,  5 May 2026 13:09:32 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id A6D90B4054B; Tue,  5 May 2026 13:09:30 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 72EE5B40540;
	Tue,  5 May 2026 13:09:29 +0000 (UTC)
Date: Tue, 5 May 2026 15:09:26 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: =?utf-8?B?67CV66qF7ZuI?= <mhun512@gmail.com>
Cc: Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org,
	stable@vger.kernel.org, Ijae Kim <ae878000@gmail.com>
Subject: Re: [PATCH v2] media: cedrus: clean up media device on probe failure
Message-ID: <afnsBu1nepWi8yy_@shepard>
References: <20260430142534.12928-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OKqRcrL7IoYtAh8b"
Content-Disposition: inline
In-Reply-To: <20260430142534.12928-1-pakmyeonghun@bagmyeonghun-ui-MacBookPro.local>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260505_060938_886411_FED0FA49 
X-CRM114-Status: GOOD (  24.02  )
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


--OKqRcrL7IoYtAh8b
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Thu 30 Apr 26, 23:25, =EB=B0=95=EB=AA=85=ED=9B=88 wrote:
> From: Myeonghun Pak <mhun512@gmail.com>
>=20
> cedrus_probe() initializes the media device before registering the video
> device, the media controller, and the media device. If any of those later
> steps fails, probe returns without calling media_device_cleanup(), so the
> media device internals initialized by media_device_init() are left behind.
>=20
> Add a media-device cleanup label to the probe unwind path and route video
> registration failures through it as well.

The label should be named "err_media" instead of "err_media_cleanup" to be
consistent with the other labels. With that fixed:

Reviewed-by: Paul Kocialkowski <paulk@sys-base.io>

Thanks for the fix!

Paul

> Fixes: 50e761516f2b8c ("media: platform: Add Cedrus VPU decoder driver")
> Cc: stable@vger.kernel.org
> Co-developed-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Ijae Kim <ae878000@gmail.com>
> Signed-off-by: Myeonghun Pak <mhun512@gmail.com>
> ---
> Changes in v2:
> - Drop the now-unused err_m2m label.
>=20
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 5 +++--
>  1 file changed, 3 insertions(+), 2 deletions(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff..2c25654640 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -507,7 +507,7 @@ static int cedrus_probe(struct platform_device *pdev)
>  	ret =3D video_register_device(vfd, VFL_TYPE_VIDEO, 0);
>  	if (ret) {
>  		v4l2_err(&dev->v4l2_dev, "Failed to register video device\n");
> -		goto err_m2m;
> +		goto err_media_cleanup;
>  	}
> =20
>  	v4l2_info(&dev->v4l2_dev,
> @@ -533,6 +533,7 @@ static int cedrus_probe(struct platform_device *pdev)
>  	v4l2_m2m_unregister_media_controller(dev->m2m_dev);
>  err_video:
>  	video_unregister_device(&dev->vfd);
> -err_m2m:
> +err_media_cleanup:
> +	media_device_cleanup(&dev->mdev);
>  	v4l2_m2m_release(dev->m2m_dev);
>  err_v4l2:
> --=20
> 2.50.1

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--OKqRcrL7IoYtAh8b
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmn57AYACgkQhP3B6o/u
lQxYTQ//Vg6dZ/FBGwVcZvEbR67CmVXDfwgz6zE8GeXVEXwu7GY40c3yev5F2pNn
0N2ec5Jj2a+nTeRv62lgSsUBy1K+YsRhcQ30RpCkrRGYXESPJ5WeFBU/+IYRJjmN
G6hW5bN7ZiOZN2jQ53swcwHOZq5cZcxdtpSG9OFDDB66E46fCs67UnfLuv6koUFH
wtGTgHJKOg5MkO4SjNpN2KEZmDcuPodnaHdvRo/BX1rkY+fS3GKIP5Dtd6W5xBVn
6ag9Wrwr24akqGWfjRTstDTFglqPIvUZtXJp1w4QVqYsik1o0d9UY+rLqe66DzQZ
KGNSe9DufKyB9WmeaaXlGFhCbMdLKqWr+LfiVKY0fmEkJlPJkjazs4eKm/c8VN2i
9TfeW8hlaWev8RrC/pLJxcnJOWNtJCo7pjp2d4zIXg629SAN2yIqn2hMi4cQtpOL
Ixc3c30xVlEAnSSVXXZgaMGCCgIoSY7JcuWq6JE4cxMmAnZe+zWZKNI8gyi7906r
mx/ZsKPA91CmsZn02R3/RnaAhHKRTxvRPI3oAnK4mLrzDkNy+1JurgxAr8IuKBQ8
BLzJr4XI0W1YIrXzo1vMn2PSdaLmroX8ok3TEXS/JAsoeCEjlTsBy2TS1Bliq/2t
+YNKoMFNF6OU34nh+74LO9nsvS/hlPFSixiBiIDOH8zl9AmemqU=
=PbbW
-----END PGP SIGNATURE-----

--OKqRcrL7IoYtAh8b--

