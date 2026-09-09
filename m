Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2FC02C79FB7
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Sep 2026 15:47:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+2jg2ESPMMGY2dLnVmlBMJSk4zf6hyXqLuJROhsLZFs=; b=PDk0OGYl4qFDZTJ8vhrHUqKWdh
	rjry6ohrhmHVW4AyZ4zVo/JkJYjUDet+VLbPbg/R3eA3d2FOzBkwW8gxrjki4+dKQpmQ7cBFRtfkS
	GOpRtVXKtcWVmvhqtBgbesfG4kMMgL2xdf5aXxIsn959JQTE8bOg0rKRrz9no5J4Jg2XXE5B0oNzn
	UOr1qWazFNBegwF3dJULEXmtcbk1gb+P14TvcbwYQaZl1VQnZGMJ0NUhvIknVEPGRTDGtcL4wzs02
	kS4MTJkotE9COLzK9mad2uzrhvnnoZIPZmMFI1NO+dGampprPaD2MOA09YpMc4Y7HTPyn+WhmhHYS
	08JsD8SQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KVo-0000000CDfr-29UZ;
	Wed, 09 Sep 2026 15:47:00 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x4KVn-0000000CDfj-1ONC
	for linux-arm-kernel@bombadil.infradead.org;
	Wed, 09 Sep 2026 15:46:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=+2jg2ESPMMGY2dLnVmlBMJSk4zf6hyXqLuJROhsLZFs=; b=XEpOY7YMlVTBg+2SmQjzxuldR0
	7n8bnzaXzZ/BzNcjko2HJuIjIOr6qlDMolZ0sm3Ild61JzGyj9pq8HjLXNTzAMyRwKIhyuN8vEO0t
	1AR1XKJAiVZLsM9zpIlL+si4i8xAJPLvR62fmtgWpSCRhC8I+gIGrSlcdOUcpdWwGLCmVownj80Z5
	En5xsd70CtHvhO11ykY/GYaXhpfXO+MsPIIrYM0v/dSjAYI10v+QsY368bCatEAAG9Vbpz1DOafv/
	GaB3DzJz+mriE0YEjcJ4cJ5roaK94WBArVWBJC/739m6Jk5/Ic75L3ROk4h8qxFmq4M5pu02Fmrbs
	5NNiISRg==;
Received: from sender4-op-o11.zoho.com ([136.143.188.11])
	by desiato.infradead.org with esmtps (Exim 4.99.2 #2 (Red Hat Linux))
	id 1x4KVk-00000001O4y-2Apq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Sep 2026 15:46:58 +0000
ARC-Seal: i=1; a=rsa-sha256; t=1788968791; cv=none; 
	d=zohomail.com; s=zohoarc; 
	b=bIP7FxCUP7PHjxh/nM4jKTnSi4O3I6PRlfBOfFxAVACnPdkG1o4ROdKc9mHAKRk9dawZAajHbag1i0Dtm5oZk73POFNeyTsIoMQdqnIex15/DdocxTTJLcvNzHv+8W2Brfrmzqd5aG+ycRGI3Kd6X4Q83AZV8i/HAccJDK0A7uQ=
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=zohomail.com; s=zohoarc; 
	t=1788968791; h=Content-Type:Cc:Cc:Date:Date:From:From:In-Reply-To:MIME-Version:Message-ID:Subject:Subject:To:To:Message-Id:Reply-To; 
	bh=+2jg2ESPMMGY2dLnVmlBMJSk4zf6hyXqLuJROhsLZFs=; 
	b=fHK0xZYkJa0EQ8iscGhXs3nCz+azjAIWs6h68cT2ql692DXJDd4uXiAI5yoxp5+3TWpg0puF6aimsbN7lur+FafMxu8awciKl9BP+tkdlvpc/mFm22kHkLG3ENAuLoHnilj1qqzm/Fi5AAKKvOLxax8bDHgaJF7386Ys1Wsq9ck=
ARC-Authentication-Results: i=1; mx.zohomail.com;
	dkim=pass  header.i=collabora.com;
	spf=pass  smtp.mailfrom=sebastian.reichel@collabora.com;
	dmarc=pass header.from=<sebastian.reichel@collabora.com>
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; t=1788968791;
	s=zohomail; d=collabora.com; i=sebastian.reichel@collabora.com;
	h=Date:Date:From:From:To:To:Cc:Cc:Subject:Subject:Message-ID:MIME-Version:Content-Type:In-Reply-To:Message-Id:Reply-To;
	bh=+2jg2ESPMMGY2dLnVmlBMJSk4zf6hyXqLuJROhsLZFs=;
	b=RrRxL6K+fJgetX/zevzIf8shNUQZ64sHRap9E0npkCTqOSQIKdGw7QGQsmmT/nEh
	MDEWBwP3A3JSNrYY6AU5UVrxINL1kX0CeJRhDr083WK6iOkhdTlz+KNgeB67XQeShiX
	D9sDnGwGS2S6atyJx9cWGAcEY8UQgBcy05nf5uW0=
Received: by mx.zohomail.com with SMTPS id 1788968790593167.81978655910598;
	Wed, 9 Sep 2026 08:46:30 -0700 (PDT)
Received: by venus (Postfix, from userid 1000)
	id 24C93183377; Wed, 09 Sep 2026 17:46:21 +0200 (CEST)
Date: Wed, 9 Sep 2026 17:46:21 +0200
From: Sebastian Reichel <sebastian.reichel@collabora.com>
To: Arnd Bergmann <arnd@kernel.org>
Cc: Lee Jones <lee@kernel.org>, mfd@lists.linux.dev, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	Arnd Bergmann <arnd@arndb.de>, Daniel Thompson <danielt@kernel.org>, 
	Jingoo Han <jingoohan1@gmail.com>, Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Guenter Roeck <linux@roeck-us.net>, Linus Walleij <linusw@kernel.org>, 
	Bartosz Golaszewski <brgl@kernel.org>, Jonathan Cameron <jic23@kernel.org>, 
	Dmitry Torokhov <dmitry.torokhov@gmail.com>, Pavel Machek <pavel@kernel.org>, 
	Michael Hennerich <michael.hennerich@analog.com>, Support Opensource <support.opensource@diasemi.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Helge Deller <deller@gmx.de>, dri-devel@lists.freedesktop.org, 
	linux-doc@vger.kernel.org, linux-media@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-hwmon@vger.kernel.org, patches@opensource.cirrus.com, linux-watchdog@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-iio@vger.kernel.org, linux-input@vger.kernel.org, 
	linux-leds@vger.kernel.org, linux-pm@vger.kernel.org, linux-rtc@vger.kernel.org, 
	linux-fbdev@vger.kernel.org, linux-sound@vger.kernel.org, linuxppc-dev@lists.ozlabs.org, 
	llvm@lists.linux.dev
Subject: Re: [PATCH 06/14] mfd: remove unused da903x driver
Message-ID: <aqF_GZq1C4Tv1JB9@venus>
References: <20260909132153.1596191-1-arnd@kernel.org>
 <20260909132153.1596191-7-arnd@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="jrej5ylckfdda26t"
Content-Disposition: inline
In-Reply-To: <20260909132153.1596191-7-arnd@kernel.org>
X-Zoho-Virus-Status: 1
X-Zoho-AV-Stamp: zmail-av-0.2.13.1.5.4/288.959.6
X-ZohoMailClient: External
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260909_164656_797012_889D4F44 
X-CRM114-Status: GOOD (  16.00  )
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


--jrej5ylckfdda26t
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 06/14] mfd: remove unused da903x driver
MIME-Version: 1.0

Hi,

On Wed, Sep 09, 2026 at 03:21:43PM +0200, Arnd Bergmann wrote:
> From: Arnd Bergmann <arnd@arndb.de>
>=20
> This driver was used on a handful of ARM/PXA boards until those
> got removed a few years ago. Without devicetree support, there is
> no way to use them upstream.
>=20
> Signed-off-by: Arnd Bergmann <arnd@arndb.de>
> ---
>  MAINTAINERS                           |   1 -
>  drivers/input/touchscreen/Kconfig     |  13 -
>  drivers/input/touchscreen/Makefile    |   1 -
>  drivers/input/touchscreen/da9034-ts.c | 365 ----------------
>  drivers/leds/Kconfig                  |   8 -
>  drivers/leds/Makefile                 |   1 -
>  drivers/leds/leds-da903x.c            | 145 -------
>  drivers/mfd/Kconfig                   |  11 -
>  drivers/mfd/Makefile                  |   2 -
>  drivers/mfd/da903x.c                  | 565 -------------------------
>  drivers/power/supply/Kconfig          |   7 -
>  drivers/power/supply/Makefile         |   1 -
>  drivers/power/supply/da9030_battery.c | 581 --------------------------
>  drivers/regulator/Kconfig             |   8 -
>  drivers/regulator/Makefile            |   1 -
>  drivers/regulator/da903x-regulator.c  | 495 ----------------------
>  drivers/video/backlight/Kconfig       |   7 -
>  drivers/video/backlight/Makefile      |   1 -
>  drivers/video/backlight/da903x_bl.c   | 160 -------
>  19 files changed, 2373 deletions(-)
>  delete mode 100644 drivers/input/touchscreen/da9034-ts.c
>  delete mode 100644 drivers/leds/leds-da903x.c
>  delete mode 100644 drivers/mfd/da903x.c
>  delete mode 100644 drivers/power/supply/da9030_battery.c
>  delete mode 100644 drivers/regulator/da903x-regulator.c
>  delete mode 100644 drivers/video/backlight/da903x_bl.c

Acked-by: Sebastian Reichel <sebastian.reichel@collabora.com>

-- Sebastian

--jrej5ylckfdda26t
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE72YNB0Y/i3JqeVQT2O7X88g7+poFAmqhf0gACgkQ2O7X88g7
+ppaAhAAjamgA9v7fn8KcrThl75UZh6bOUT/5XiVqaq9zEwVJoY2fygDVmYao95K
QhI39+RMyWRuGdnDCBrpw0eVA53PbFPc1VTm+Iw4FWehLC1skbbSwDpPLFSIZaLe
DJlLr11UbevMyqcmNKw8yeRolbQfUbAA4leflpjAbhhEvAzotNSeIxLY3yFHNXoV
hJsWKIRE4cFFb5bsx3qTlJFQMop9WidRYq3vdPeoGVCUW2zjROm5drG9e8Hb2dvd
I1KgIIFgyn2WJYDlD3u0eLwYZk/YabwYv3PUfxRXIXRS3+JMzwA3ubQyoMit/SHv
MMH4/sJdjtgUjUcnWKA9Ktle3BQgYFr80H6HHHaBoFQveCC2B/98B85Ev0wwi9Xa
60t+RHmELFKX9TnD6o797ZxnsXxErlDhjl+UZhEKQpsQjKwBQHnV1RzX3QLFWYkv
i16c5MyNzgDusXB4zpTBiAy/kVNKUysPwY13R8BBvr2NsQcBf9uYDTRHr/g+3Xd4
wquTx7yb8tYLUn6cJr9jXHrSseS5TpMUu+8scdSVZBC9KSuaeRYigm5dLM0X6Zj5
vmXaD9vlAGtPL7fv+zomhwt4Ufe51v2YGxWa8IQSEsyOG1eUO6zdfFIiajXpgBTR
mZ6OWJdhnZ9sRSQVANNafU85fqkka6x1/ZAQvqaKPBGVE7bXzhc=
=3btz
-----END PGP SIGNATURE-----

--jrej5ylckfdda26t--

