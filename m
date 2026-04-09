Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7B1AEA3C5D
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 13:16:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bUOy31fWbIj+28LZjNOqZeSCAv1XoaK21eAp13+g/FI=; b=mXaMnozr893AFq8+NH6g8zS4fV
	0anMkOHLrdVifO3TLFYn8Z5UoZSR0nEJubhXQvz4/EkQmmEkdN0TUFeLrm7sdYqkWFWjzLzida69n
	3TdbHS7auNx+W0Txc8fC9/MW8XHt7a9pQSJOrJ9xvyRIg7/wyfXjEShga6sSXmuzzywcFCDa8F6mQ
	uuhAh3w8M/SdXn64ONaiihLP6jfwIgz3iEYVpfi7SPYGwmQlhGGzj07cmKymzabBaMcqAfnHdDCRv
	gn0TMereqwfQiW+PkGxAzz8njpnbTFVf7sKkrNSq/Naj5tCIS5saKGG6A3BjMC/kwiqjXX55b8gjn
	Y4IFAUOw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApEd-0000000ASpi-0P9O;
	Thu, 09 Apr 2026 13:15:51 +0000
Received: from leonov.paulk.fr ([185.233.101.22])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wApEH-0000000ASml-12bn
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 13:15:49 +0000
Received: from laika.paulk.fr (12.234.24.109.rev.sfr.net [109.24.234.12])
	by leonov.paulk.fr (Postfix) with ESMTPS id 615EE1F8004F
	for <linux-arm-kernel@lists.infradead.org>; Thu,  9 Apr 2026 13:15:26 +0000 (UTC)
Received: by laika.paulk.fr (Postfix, from userid 65534)
	id DEF23B401A5; Thu,  9 Apr 2026 13:15:24 +0000 (UTC)
Received: from shepard (unknown [192.168.1.1])
	by laika.paulk.fr (Postfix) with ESMTPSA id E753AB401A1;
	Thu,  9 Apr 2026 13:15:23 +0000 (UTC)
Date: Thu, 9 Apr 2026 15:15:21 +0200
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
Subject: Re: [PATCH v2] media: cedrus: Fix missing cleanup in error path
Message-ID: <ademaXe-zmEbGIUV@shepard>
References: <20260406221402.3721777-1-andrej.skvortzov@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="5Z+h4H++cTowfJsu"
Content-Disposition: inline
In-Reply-To: <20260406221402.3721777-1-andrej.skvortzov@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_061536_617283_3FF8F400 
X-CRM114-Status: GOOD (  21.58  )
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


--5Z+h4H++cTowfJsu
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi,

On Tue 07 Apr 26, 01:14, Andrey Skvortsov wrote:
> From: Samuel Holland <samuel@sholland.org>
>=20
> According to the documentation struct v4l2_fh has to be cleaned up with
> v4l2_fh_exit() before being freed. [1]
> Currently there is no actual bug here, when v4l2_fh_exit() isn't called.
> v4l2_fh_exit() in this case only destroys internal mutex. But it may
> change in the future, when v4l2_fh_init/v4l2_fh_exit will be enhanced.
>=20
> 1. https://docs.kernel.org/driver-api/media/v4l2-fh.html

Good catch too, thanks!

Acked-by: Paul Kocialkowski <paulk@sys-base.io>

All the best,

Paul

> Signed-off-by: Samuel Holland <samuel@sholland.org>
> Signed-off-by: Andrey Skvortsov <andrej.skvortzov@gmail.com>
> Fixes: 50e761516f2b ("media: platform: Add Cedrus VPU decoder driver")
> ---
>=20
> Changes in v2:
>  - remove duplicate 'in-body' From: record
>  - add details to commit message
>=20
> drivers/staging/media/sunxi/cedrus/cedrus.c | 1 +
>  1 file changed, 1 insertion(+)
>=20
> diff --git a/drivers/staging/media/sunxi/cedrus/cedrus.c b/drivers/stagin=
g/media/sunxi/cedrus/cedrus.c
> index 6600245dff0e2..1d2130f35fffc 100644
> --- a/drivers/staging/media/sunxi/cedrus/cedrus.c
> +++ b/drivers/staging/media/sunxi/cedrus/cedrus.c
> @@ -391,6 +391,7 @@ static int cedrus_open(struct file *file)
>  err_m2m_release:
>  	v4l2_m2m_ctx_release(ctx->fh.m2m_ctx);
>  err_free:
> +	v4l2_fh_exit(&ctx->fh);
>  	kfree(ctx);
>  	mutex_unlock(&dev->dev_mutex);
> =20
> --=20
> 2.51.0
>=20

--=20
Paul Kocialkowski,

Independent contractor - sys-base - https://www.sys-base.io/
Free software developer - https://www.paulk.fr/

Expert in multimedia, graphics and embedded hardware support with Linux.

--5Z+h4H++cTowfJsu
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCgAdFiEEAbcMXZQMtj1fphLChP3B6o/ulQwFAmnXpmkACgkQhP3B6o/u
lQw6rQ/+JRyqAd6MzQ2xrzJl5ar/9l2WWPAtTawNPXkANjhkbbfG/+oxmwNk2QB2
PgJhtyvcwS+EyRCKZic7gjTTf670J9Iz9FhAW0XiZH4nmFpUSg42t9fUfbzAj1zo
anINhb1wgbSt0OJ+7u9nuF4q4KinRHlCVuqEWq3QX078b7oItJ3RY1j0MNUVVD9A
b3590HJ7XQ3fhT7bqwy4AGl4RPt3fA5UGn2J2fKfSQC/FAFcLmBBz0wfOwmNAAqC
mfAydT+ZI8zQnwb28PZw6PEx0SQnuBUm/NLWjl179DUgxyDR7F6VXjY2jmBZtLNG
Fzw8r6GyYeqCdaBt7mcT2vbIzCUMzV9u5iwQB+4bRHXiF3L8gbHJTtAvqVgL+tZt
qnj52uV8q3pdiQosqwR3bTxt8NT/wsbZbiMpBsjqe/UjHVuofjIxzqAHNexRBl2f
zRD7GV/EwnbNltbP1lu+fgZBRcJRz2t1jkvjwpZ7n/Ec66cyDXotMQ6mAy8ugSjV
MgURkiFhNrU8SPC3jpFB3ff9XpyDg3uPEEqtUd5IrXSbEfmQcag7t2GpLpGyW6lf
DEJqgz+CvDUknsCbqazLyfxt4yVyxkCe0bJw0tHIyLom1Muf8qFqR9okAq03VDD6
ikr5rF81u8+Y6vmVTaEYlWlgK1AOaSBP19JOPh32oEIdhb7DtAg=
=aZU3
-----END PGP SIGNATURE-----

--5Z+h4H++cTowfJsu--

