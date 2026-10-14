Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 65F47CC6B1D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 14 Oct 2026 09:45:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o25ndurGSbIBeL+Pc3I9l5VHIz5sHmwgR3rpEHo0U9U=; b=ss00ypLRCOj/k+fLVe4CETSqUl
	YZqf9fY/9PzY1FjOgV6E648Lgl5OquGL8OQloSx16sk0sG3YpcsqxgW/4BwhLWxXJvxpBDZVLPTl/
	p39CswVhoikW6G6CIQ/CeWTFZvusILxO9o2xk/ZL7G6/Bd9dDoHr6cGQvfXVWe0BPYm+jstPrJF0X
	3KU7XQ9CMI+PW4XLxlWI2QoDzekZacygBac2qXPcpPGGqlvcFrkmL7MfrBKBm30w/TVJrafMrWxaN
	EeihWU/oCZPdzgIHJ3EY7VJWoClvjIVcPgq9EhBOt0M8ZsiUZ668j2CenWqud7DVZ5TXzz9PRuYYd
	w/61OcAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvYB-0000000F6a8-0MBL;
	Wed, 14 Oct 2026 09:45:31 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xGvY6-0000000F6Yb-13kl
	for linux-arm-kernel@lists.infradead.org;
	Wed, 14 Oct 2026 09:45:29 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with UTF8SMTP id E1ED2401A4;
	Wed, 14 Oct 2026 09:45:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 435731F008A4;
	Wed, 14 Oct 2026 09:45:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791971125;
	bh=o25ndurGSbIBeL+Pc3I9l5VHIz5sHmwgR3rpEHo0U9U=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VtOpkpub0uYuGgM+jv9mQxo0GDRFNl7ErtDjUIOwnAYplkvGYBEZ7euz+IFyJuWFS
	 YJbrJTtVv2csOyZwYwRSaiJ9/CySnHuPit+1GNMLskuMlND29zmL5zZEk2KNGzQAYn
	 G0QSG4X7bbobGwyydRK6aIZC4WO0nR/u2zzMqmGhGkK+NMQNMSoGn2B7qLAazs8vX3
	 oC9z1RZ8xNsPy55DqLm/VC3Nf38vmU0sLQ+MtV9arCjsRgbpaqrHQa1JeuH+65+Ar0
	 B+j4FjiDzR0Hm5feMC/m6RQ7qF9HzkryHzZ+BBE46q2LTyesfwjvMvpmdsMo0c2PAc
	 WNnXpxjTFWmqg==
Date: Wed, 14 Oct 2026 11:45:23 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Karl Mehltretter <kmehltretter@gmail.com>
Cc: Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Nicolas Ferre <nicolas.ferre@microchip.com>, Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] pwm: atmel: Fix prescaler for periods of 2^32 clock
 cycles or more
Message-ID: <as9NusRrYjMO388-@monoceros>
References: <20261003083036.21584-1-kmehltretter@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qf4c2coehtxmfrl5"
Content-Disposition: inline
In-Reply-To: <20261003083036.21584-1-kmehltretter@gmail.com>
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


--qf4c2coehtxmfrl5
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: atmel: Fix prescaler for periods of 2^32 clock
 cycles or more
MIME-Version: 1.0

hello Karl,

On Sat, Oct 03, 2026 at 10:30:35AM +0200, Karl Mehltretter wrote:
> [...] Some out-of-range requests of 2^32 clock cycles or more were
> accepted and programmed with truncated values. They now fail with
> -EINVAL.

This is wrong, a too big request is supposed to pick the maximal
possible configuration without an error. But that is a preexisting issue
and converting to the waveform API is more sensible than fixing that.
For the scope of this patch, the implemented behaviour is ok.

> The truncation was not reachable when it was introduced. The period
> was an unsigned int in nanoseconds then, which limits it to about
> 4.29 s. Commit a9d887dc1c60 ("pwm: Convert period and duty cycle to
> u64") made longer periods possible.
>=20
> Fixes: 2101c878f767 ("pwm: atmel: Replace loop in prescale calculation by=
 ad-hoc calculation")
> Fixes: a9d887dc1c60 ("pwm: Convert period and duty cycle to u64")

Why are here two fixes lines? Given that 2101c878f767 is an ancestor of
a9d887dc1c60, this cannot be right.

Best regards
Uwe

--qf4c2coehtxmfrl5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmrPTzAACgkQj4D7WH0S
/k7ljgf/aIZ6f/aMMdY/TL4aaCYVhzSwMf8ksvYW0d8CVu4IQC5GMHG5bvYms8r0
RRd1sftYJSs1SiGt4vbdwnEZ/ZjsA/jiFtG9aoDyyH9ArkrSPtHGdmOTjQS1kXgw
r9VUMtlBMbzohUzrnTHA3aKIAj9T3F6etkz8fbnjrkaOtxxiGqh9BvqW1eNbiB7d
l8eIQRA2NdgFostcUsQlfgd4pYC42p7i4aFtkhsonrt2GiihtsDhDuiDB9lf6myX
/LxOFFGuwo8qxm/CGiHQgFgqEWs5/8La8kwhg659b2kHXioOHo1pvNVm6tZw1bL5
IBdlfGW2ch4FNLD/ceSlsqHFf1IbjQ==
=JxkX
-----END PGP SIGNATURE-----

--qf4c2coehtxmfrl5--

