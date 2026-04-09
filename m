Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C9E2EA3C5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eoicIB5AL1TH9DB4R0hDbkZPw9GfthP5tLII5ufZW0A=; b=FZl/YOFdIFpxQTIeQ9mM8ozQHV
	e75Sj+iuM1JuOi5h9q7AyRv3DRY+NL1lFYpYUMJgGTR8aKFYihR4xp8tAYjg+V1EU/+ZnZDnLtJB/
	xu3MEqtDa50IvIsCV7GKGJtQZCfjYXQcxbqXAfqgi88TTyfIZLjkxGrCYYq4So/vDgO7w71fv/IVd
	Q8soyTvWn6jViVon//+KMaE9bOdwx7bhZu/eJlAqejwwRjuqNexRmKShQJDHlhuz/ILz7lb6gk9yL
	19/a/6r50IBLAjDh1zSP8RVu63LCmWqPIGl0RwH6Ff1hg1wENB72537PYj0ZJl3kZ9Pjb2e8PuJjg
	1rOkCAjQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApAd-0000000ASHj-3hF0;
	Thu, 09 Apr 2026 13:11:52 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAp9v-0000000ASDq-1yC7
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:11:42 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 4D4701F8004A
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 13:10:47 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id 59536B401A4; Thu,  9 Apr 2026 13:10:46 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id 4DBC4B401A1;
	Thu,  9 Apr 2026 13:10:45 +0000 (UTC)
Date: Thu, 9 Apr 2026 15:10:42 +0200
From: Paul Kocialkowski <paulk@sys-base.io>
To: Andrey Skvortsov <andrej.skvortzov@gmail.com>
Cc: Dan Carpenter <error27@gmail.com>, Maxime Ripard <mripard@kernel.org>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Hans Verkuil <hverkuil@kernel.org>, linux-media@vger.kernel.org,
	linux-staging@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] media: cedrus: Fix failure to clean up hardware on
 probe failure
Message-ID: <adelUpXGbXH17VQ_@shepard>
References: <20260406221440.3721863-1-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Itf9xyoJaakxzDN8"
Content-Disposition: inline
In-Reply-To: <20260406221440.3721863-1-andrej.skvortzov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_061059_923613_9521BE8E 
X-CRM114-Status: GOOD (  27.21  )
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


--Itf9xyoJaakxzDN8
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 07 Apr 26, 01:14, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
>=20
> If V4L2 device fails to register, then SRAM still be claimed and as a
> result driver will not be able to probe again.
>=20
>  cedrus 1c0e000.video-codec: Failed to claim SRAM
>  cedrus 1c0e000.video-codec: Failed to probe hardware
>  cedrus 1c0e000.video-codec: probe with driver cedrus failed with error -=
16
>=20
> cedrus_hw_remove undoes everything that was previously done by
> cedrus_hw_probe, such as disabling runtime power management and
> releasing the claimed SRAM and reserved memory region.

Good catch, thanks for the patch!

Acked-by: Paul Kocialkowski <paulk@sys-base.io>

Note that I (still) plan to rework the architecture of this driver in the
future but such fixes are definitely welcome in the meantime.

All the best,

Paul

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> ---
>=20
> Changes in v2:
>  - remove duplicate 'in-body' From: record
>  - add more technical details to commit message
>=20
>  drivers/staging/media/sunxi/cedrus/cedrus.c | 4 +++-
>  1 file changed, 3 insertions(+), 1 deletion(-)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 1d2130f35fffc..ee0e286add67d 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -477,7 +477,7 @@ static int cedrus_probe(struct platform_device *pdev)
>  	ret =3D v4l2_device_register(&pdev->dev, &dev->v4l2_dev);
>  	if (ret) {
>  		dev_err(&pdev->dev, "Failed to register V4L2 device\n");
> -		return ret;
> +		goto err_hw;
>  	}
> =20
>  	vfd =3D &dev->vfd;
> @@ -538,6 +538,8 @@ static int cedrus_probe(struct platform_device *pdev)
>  	v4l2_m2m_release(dev->m2m_dev);
>  err_v4l2:
>  	v4l2_device_unregister(&dev->v4l2_dev);
> +err_hw:
> +	cedrus_hw_remove(dev);
> =20
>  	return ret;
>  }
> --=20
> 2.51.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--Itf9xyoJaakxzDN8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXpVIACgkQhP3B6o/u
lQxUvQ/+KnGDOZekoylgaxf6pnjfN26pBbZnr+cFKKJG68xgu6GWkXQzhOjkASXT
W3P46lFZ2yzEu+RSy2vFORvHTWxwXTzskwwNPGWhgQxMHrdD/7WQN/VGkaH+ghVQ
sih9knsZCokRVojSGcIhxUPaiKiNDocQGAZWTGIJeTbys8GANWU+jkAuxjihbsnO
qO28kp9EQsqzyFCgpu/xtxC0QewsUKj/4jr66kVeysZYBLKAYU52orfvEb3o4kOk
yZSDrzoNq5gCllSI4Odq0Hb7SSgnjOEnoUJNTdm492QhTrMAsABeqTvUFVUhW71b
KQNqJ7Yo025qvWYt0IP2+NMsqhMvSlevf/sXatiN6pwoIpD1bflAvF+C6PG8dBia
Qeu4AerVQmrM8wiokTAY9kaqA0VOdFTU/Bs+rzyLOOIzGFTC2Ykj8b8wQI7rtw/P
NB/0IvumoLxCST1pzYUits2OE7Klo39X61Ie5zzvlfC7cpCYseIUV9NIvTR2SuSP
TavZVrHW+aVrhPd0/fx/IMxp1L4Ut1cfx0C5pT4Ifi0vMwFt73g115PFm1gUBsrT
E1uCGJf+P643l/l/3FlaYJph5LZ87mcOHAPX6LWDw4WtsECvJk5m0YThk9RIowQm
naVGrtzZ3zISp7qAOFkJwpFFd1m8KGGe09FldmINLJ4n5W8jB4M=
=Smsv
-----END PGP SIGNATURE-----

--Itf9xyoJaakxzDN8--

