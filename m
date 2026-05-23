Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D3C00CD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 16:55:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Q/gT+YsJzWyplKB1RZZSInjxfqO5+hC3r72glf2BYWg=; b=xguL6OqgpzqAnZjInn4B97wncU
	DBXboRYk3CRW3xY+YZdUuDjU/l5Lk+CIxD+ciqsbNQIu+ez/3BnQoWRPZIhevT2s3oE7rGUi9gNWG
	7LgO0HSysMQlD/JaEh0d5f08YMcbHnWaM/c5G9BuWDkmIxm59vB9/07Cd6ofYF3puSMAcxHN78CZL
	NQWy3XIVa1e0fy994rqyqtKIs8SCY7YUX7xGotUMhryEH/WUiDsI3Fjngv47xry6vLIbMTZ19zf/6
	lybLjW7Tu6wWIUQQz3NQdxgz+xjjlAud4IDERntl53OTKTDt+7hqI/ALZ5vqsZidv9h3l0aBnHrun
	mAjcl/ZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQpdc-0000000DbYR-0zOH;
	Sat, 23 May 2026 16:55:48 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQpdZ-0000000DbXn-0N1T
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 16:55:46 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id 2F5FE43CEA;
	Sat, 23 May 2026 16:55:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 63BF11F000E9;
	Sat, 23 May 2026 16:55:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779555343;
	bh=Q/gT+YsJzWyplKB1RZZSInjxfqO5+hC3r72glf2BYWg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HTVy7vRcXSz+roUzS1mOxYzquBSpIPb1CsfPhBY6xVHldUWGGT1OJH/jzf9/cfUki
	 ep0oaugIHYFiH7fiEJIEjxkyIUYLe6lPtDnBkbmbOwcwFkiuUVs62SQUaBtpsMNmWX
	 poRy6jfKLruZRuzaSAhulgUY9gp7Zi2M2pSgnnoUyMsjL/0Gu790WbAod3GjHvmVwV
	 tBs4b7thfoqamJWH/alR0aJT+34kQwlyfbo2EeJhk+nWF3z7mGZjjnS2sMeyOBfaPl
	 /dArJAtqcB5jOuQUl34hL5i7JDTkPHHNmbhVtzcmh04HDPFegpuGoijxulFaA29WOb
	 j/9jA0KhZJyUQ==
Date: Sat, 23 May 2026 18:55:40 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Ronaldo Nunez <rnunez@baylibre.com>
Cc: linux-pwm@vger.kernel.org, Frank Li <Frank.Li@nxp.com>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] pwm: imx27: Fix variable truncation in .apply()
Message-ID: <ahHV_GIwdWvTu-ms@monoceros>
References: <20260522191348.6227-1-rnunez@baylibre.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ph6z6kisszpxnay5"
Content-Disposition: inline
In-Reply-To: <20260522191348.6227-1-rnunez@baylibre.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260523_095545_151130_AC2D659D 
X-CRM114-Status: GOOD (  13.83  )
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


--ph6z6kisszpxnay5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v2] pwm: imx27: Fix variable truncation in .apply()
MIME-Version: 1.0

Hello Ronaldo,

On Fri, May 22, 2026 at 04:13:48PM -0300, Ronaldo Nunez wrote:
> Fix a variable truncation when calculating period in microseconds as
> part of the solution for the ERR051198 in .apply() callback.
>=20
> Example scenario:
>  - Period of 3us (PWMPR =3D 196 and prescaler =3D 1)
>  - Expected value in tmp: 198000000000 (NSEC_PER_SEC * (196 + 2) * 1)
>  - Actual value is 431504384 (truncation to u32)
>=20
> Signed-off-by: Ronaldo Nunez <rnunez@baylibre.com>

Thanks for your patch. I added

Fixes: a25351e4c774 ("pwm: imx27: Workaround of the pwm output bug when dec=
rease the duty cycle")

to the trailers and applied it to

https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fixes

=2E I haven't made up my mind if I create another pull request to get the
patches from the pwm/fixes branch into 7.1. If not, it will go into
7.2-rc1.

Sashiko found a few more issues in the imx27 driver, would you like to
address these, too?

Best regards
Uwe

--ph6z6kisszpxnay5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoR3AkACgkQj4D7WH0S
/k7D5gf/WdM3ZZEgTDtL5u4whmCMC9ht8ov24VkAyIcSW1arTUVCvj3+h1336tAU
kF/jUUgeWjBxXpScxX2A94GB6iv5tTzHI0lKFGqqOVSBL7EWKiJG8u+raDdk+S+R
sm4QZVqWMBulgGHlb+ZGQhEh7RSf0Shu3rHeGfb3Pfffp7lRlzuN4+ebPSvbzlC2
uKOJYa3FwVnu6KkNsj41tMLl+wgD7GYhr5h5vFwHYx3oBmNJQfjhmzXBqJFxkgIF
rC70EW6LkxHTxuxQPxzX2SR0bpH3ezjzbUS3pdE7B6nsRGW5FBW676bvPCJWoFKz
r6YFGGJX5XwZdGIrtPNzU1159pXtEg==
=eJk0
-----END PGP SIGNATURE-----

--ph6z6kisszpxnay5--

