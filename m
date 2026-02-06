Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 946E0EB28FA
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 09:09:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	References:In-Reply-To:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=81Nfnr+VgGFh1r1KxdRZ/fW91tng+mO/I9oWaPLw1M8=; b=vOdptzltQ0YsiUEX5YVEY6HfCa
	OVQs6+P0eEZozlavqVsCQZgn1T6wwBhyW3mMfLoF0dCma737TEyuLz3barQRJC6xGLJCUwha8aIXx
	0rsGMtssUZVdofX9hInnBUx1ZXDU5+x6doF6T0bTEidHUKWgL1nsZOCz6jfHbYnvU0GaifvpxzfOj
	VcHaZKtAqDGH2NqlafiA5fdbdjri6cY26L7U+5IFGCOdltPCLMu01PRI6eqHhzKKdmIb+wma8Iq59
	exd8W+cuWZ/uS2pEoKl4Kx70kEySPfbnwXgZyAlRP5YYeVpUwMRPQ6M4s2kjjD65eSflwg8Q9lmsX
	5xnCiLJg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHpx-0000000B51M-0KPh;
	Fri, 06 Feb 2026 09:09:13 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voHpu-0000000B50v-2MAe;
	Fri, 06 Feb 2026 09:09:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1770368947;
	bh=81Nfnr+VgGFh1r1KxdRZ/fW91tng+mO/I9oWaPLw1M8=;
	h=Date:From:To:Cc:Subject:In-Reply-To:References:From;
	b=Zeq14iJASuWMiCVaPM0Pq1VwmwDFxdyiFG+ZAxgtEY75PnbG9du504E8hcTbBT7aR
	 ERjhnQPjndIHwksoMMDmEVPT4xW0SG4yU7b9Kt2wML+uSK8XwTpJY7aGhnf1sYREb4
	 aDsdsN4D/aBFWNr3SY5PprTvRMKcznkaf6l/0g3muSFrXZ+KE6zHHYnFDChVkz8IWT
	 kP8Udb2kwJm9E071SiJ9sA44iumwg8wIBoawYmxQpER9Y5fQ0COzRQWrFUYMw3iSjt
	 UqkKrN0uGXhlsox06qmdQeKLADO8ehDkXDUOQXflk8w4xRcBdm+XjU7kGwMJkb6DbR
	 YpdPjUXTBWUpg==
Received: from eldfell (unknown [194.136.85.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange ECDHE (prime256v1) server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: pq)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 837A117E1352;
	Fri,  6 Feb 2026 10:09:06 +0100 (CET)
Date: Fri, 6 Feb 2026 11:09:01 +0200
From: Pekka Paalanen <pekka.paalanen@collabora.com>
To: Harry Wentland <harry.wentland@amd.com>
Cc: Shengyu Qu <wiagn233@outlook.com>, "=?UTF-8?B?TsOtY29sYXM=?= F. R. A.
 Prado" <nfraprado@collabora.com>, Maarten Lankhorst
 <maarten.lankhorst@linux.intel.com>, Maxime Ripard <mripard@kernel.org>,
 Thomas Zimmermann <tzimmermann@suse.de>, David Airlie <airlied@gmail.com>,
 Simona Vetter <simona@ffwll.ch>, Chun-Kuang Hu <chunkuang.hu@kernel.org>,
 Philipp Zabel <p.zabel@pengutronix.de>, Matthias Brugger
 <matthias.bgg@gmail.com>, AngeloGioacchino Del Regno
 <angelogioacchino.delregno@collabora.com>, dri-devel@lists.freedesktop.org,
 linux-kernel@vger.kernel.org, linux-mediatek@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, daniels@collabora.com,
 ariel.dalessandro@collabora.com, kernel@collabora.com, xaver.hugl@gmail.com
Subject: Re: [PATCH 00/11] Plane Color Pipeline support for MediaTek
Message-ID: <20260206110901.660cf712@eldfell>
In-Reply-To: <cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
References: <20251223-mtk-ovl-pre-blend-colorops-v1-0-0cb99bd0ab33@collabora.com>
	<TY4PR01MB144323B0DDC18B05EE1472B5298BFA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
	<TY4PR01MB14432E7601C0BE848D25E80C398BAA@TY4PR01MB14432.jpnprd01.prod.outlook.com>
	<cdf6a704-88f8-414a-adf1-65ea7237337f@amd.com>
X-Mailer: Claws Mail 4.3.1 (GTK 3.24.49; x86_64-pc-linux-gnu)
MIME-Version: 1.0
Content-Type: multipart/signed; boundary="Sig_/hCOlWIbx7XSjDW26hBp0SP7";
 protocol="application/pgp-signature"; micalg=pgp-sha256
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_010910_785245_E2B3F64D 
X-CRM114-Status: GOOD (  22.64  )
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

--Sig_/hCOlWIbx7XSjDW26hBp0SP7
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On Fri, 2 Jan 2026 13:40:21 -0500
Harry Wentland <harry.wentland@amd.com> wrote:

> On 2026-01-01 07:37, Shengyu Qu wrote:
> >=20
> >=20
> > =E5=9C=A8 2025/12/30 02:53, Shengyu Qu =E5=86=99=E9=81=93: =20
> >>
> >>
> >> =E5=9C=A8 2025/12/24 3:44, N=C3=83 colas F. R. A. Prado =E5=86=99=E9=
=81=93: =20

> >>> Given the lack of support for writeback connectors on the
> >>> MediaTek KMS driver, combined with limited hardware
> >>> documentation, I haven't been able to verify the correctness of
> >>> each curve, only that they were visually sane (gamma curves made
> >>> the image on the display brighter, while inverse gamma made it
> >>> darker). =20
> >>
> >> Hmmm I don't think this is acceptable. sRGB/scRGB has two transfer
> >> functions mentioned in original specification[1]. To keep color
> >> accuracy, we need someone from mediatek confirm whether this is
> >> piece- wise or pure power 2.2 transfer function, this is already
> >> done in original amdgpu color pipeline series, sRGB means
> >> piece-wise while also dedicated power 2.2 function exists. =20
>=20
> Not sure what you mean with this not being acceptable. This is about
> enabling HW support for this functionality. Not every HW has
> writeback for testing. At some point you'll have to trust the driver
> devs if you're going to use functionality of the driver. We're not
> always going to get everything perfect, but if that's really such a
> worry you can always use shaders to do precisely what you want.
>=20

Hi Harry,

yes, but I understood that in this case, the hardware documentation
available is so vague that it's impossible to say what it will actually
do. There are no formulas given or referenced in the documentation, are
there, N=C3=ADcolas?

The "HLG EOTF" is probably a good example of that, referring to the
reply I just sent on the patch adding "HLG" as a curve.


Thanks,
pq

--Sig_/hCOlWIbx7XSjDW26hBp0SP7
Content-Type: application/pgp-signature
Content-Description: OpenPGP digital signature

-----BEGIN PGP SIGNATURE-----

iQIzBAEBCAAdFiEEJQjwWQChkWOYOIONI1/ltBGqqqcFAmmFr60ACgkQI1/ltBGq
qqfVuBAAhRSCzEHvBUtrOp91RdRbG2YPSFu9qQcoCw3vhnQVW16yyqFIhyLIYYvh
Wz+xqAHzjRwSlAQkt0tWCvLfQyOagIHc16qKV0ILgMhe9WS3L54kzGL8pusw+MFS
e7N+hU/eTPG0ceOOBKvTB9iuWoMIMJFglSj3EX2B6NRoVeo1JxptRUoRrA4p3nh2
IRGTOlqzOj75VbQkJRJZynwxiLiNoCj1qJzKzYsZpEx0mPUr283LiVujio0Awl/B
iIfUbgczUS/hkENMjixJBEWkVX1V4iys6GLraJbLWqrdF5EgWEFkIOOO/iEg9rJv
JKJZixdCs4TppDcs0lvBya5D/0gvMKJMFeZQGcqD6jNTZBuwdeoAXGcQcbuz0ljE
R8K3V9nTHf10Mhwk2Qwp0zWAedcGM1rEIgZnlFZlTCizqcO0YCfc6iwNvat2jTUT
oNuVbGQWXzWGb8cpGKlQ57ftrUEPdt2KCceJ+Cn3R5NAYTV2K4H1wN4aK+VGtXU0
Wvq1Psx2H9VlualOEBWDuTCmH1EFz+UPaMXpFWnKDOhK8qgA0r0yUffyfJP7kXvh
15d6L/2XOzbB0XnckisC/fAPX0usTGEOoNqaZVoJRGnIuYvWx26haI8R1gbmDz1G
tdgfsmYrIdytlgiSFWzIF/9VlsBP8kOro+za0/Qt7w7surapmBA=
=QU4T
-----END PGP SIGNATURE-----

--Sig_/hCOlWIbx7XSjDW26hBp0SP7--

