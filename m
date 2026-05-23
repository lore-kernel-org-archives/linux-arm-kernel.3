Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CA2CCD5BB8
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 23 May 2026 17:09:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fh3b7XSHHpyAk/EqJXtvp0N/MDMReridJC1c4TuGq2E=; b=ZlzLf545bOewRrk34vQtq8fNaa
	T5oAcG0kng0RfDCpGiDINUvoYaFoDHRWn0FitLffEwcD65f1e/EKt0RvuckuOSXM/R0ep+V8yuY2W
	LZi4DgjG6Bwsb5u75GEYx6DdEua9vvcknwnDA02ZMgiT3mTDI1+ZIjkyOCGyLRvbcg4rpOW939qCU
	61LzKAzD+Vk06VmURwuzxYj0MpgmBrn9/DDIt0xaVJECVI6rDGhoiqksgapodmlSEmQrF01qCKuZZ
	yvodOxGoyuyJfjJ/QDHT9abjrqlVLJ6RLCSKuZ5HtHzb8AJ68fp84vbNLqsXK3Ka+zlqj6svjsUw2
	zXAgVcSw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQpqp-0000000DcgL-2chR;
	Sat, 23 May 2026 17:09:27 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQpqo-0000000Dcg9-14xS
	for linux-arm-kernel@lists.infradead.org;
	Sat, 23 May 2026 17:09:26 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with UTF8SMTP id 2E32560055;
	Sat, 23 May 2026 17:09:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with UTF8SMTPSA id 2B1461F000E9;
	Sat, 23 May 2026 17:09:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779556164;
	bh=fh3b7XSHHpyAk/EqJXtvp0N/MDMReridJC1c4TuGq2E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DwqKXVQ7rGMQ8mXt3fOSY1b/2+w4qpGo539ceF62Q3VvmZRtAnJfrZb/WZSMs2CZZ
	 4SpjhdwYrZzSQ6aj1bkche2il0KOnnpVPm/TC9WC0ChY1SMEdlrWz2jqM1G5Cd1rlz
	 5m3G08Zr/8hB70zF9qbWQjGqDZg8aO5YRTZVza9OG6KiXhPT1F78A64q5k3jGaXTlw
	 gfYRyUJLywUhs/nBsU8bYAUkY1qhkn3hbc02IYY54R7qmgJ3AX3fVmeDONsCb73yA4
	 tt/dsJsi8PuiYsl7A6KmyyKLouAFYTKbz+LugjdnBVlLY2TmRy1wZ55atzE6WNj5Ki
	 idCroHzSv34Mw==
Date: Sat, 23 May 2026 19:09:21 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: Chen Ni <nichen@iscas.ac.cn>
Cc: nicolas.ferre@microchip.com, alexandre.belloni@bootlin.com, 
	claudiu.beznea@tuxon.dev, linux-pwm@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH] pwm: atmel-tcb: Remove unneeded semicolon
Message-ID: <ahHep1cKDjuvMuiS@monoceros>
References: <agnyKRxQk5WXSTHe@monoceros>
 <20260518022251.1625520-1-nichen@iscas.ac.cn>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="vvack7oqb3jt2kp6"
Content-Disposition: inline
In-Reply-To: <20260518022251.1625520-1-nichen@iscas.ac.cn>
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


--vvack7oqb3jt2kp6
Content-Type: text/plain; protected-headers=v1; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH] pwm: atmel-tcb: Remove unneeded semicolon
MIME-Version: 1.0

On Mon, May 18, 2026 at 10:21:25AM +0800, Chen Ni wrote:
> On Sun, May 17, 2026 at 06:52:48PM +0200, Uwe Kleine-K=F6nig wrote:
>=20
> > I'd like to pick up this commit, but don't want to modify the commit log
>=20
> > without your consent. For now this is blocked because of that.
>=20
> Hi Uwe,
>=20
> That is fine with me. Please go ahead and add the note to the commit log.

I did that and the patch is now part of

	https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/fix=
es

=2E Thanks for cleaning up after me :-)

(Actually I applied it already a while ago and failed to announce that.)

There are four patches now in pwm/fixes. I don't know yet if I send them
to Linus before v7.1. I'll wait for sure a few days to have them exposed
in next for a while at least.

Best regards
Uwe

--vvack7oqb3jt2kp6
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmoR3z8ACgkQj4D7WH0S
/k7W8Qf/UjiR839YUlUZoigYf5A2VZmwX8taPg1nLyJyT6tunnF0icBajYNYXAvA
Rz3D/sCeYsq1XHyZ/ReP5YNs5ZylXBgpjQ1qBeJ2CrPw2lTgCWeNTiN2WWuPsIli
vTglVmB2Caig+782l1jHJ+FkgDkUoTGjTwO4P+o/MqHzreDD70EH88sS5aG9ubHI
t7OfndJQfCQKLCaYb9KyohNdcf55Obe3iQyI2R3GU1hDtZC2enqTmpVDQiuQyRYZ
yujllq0oFXo6w+mxor3j6h7rGm3oFk0qstdAU0rSgknW4N8qF6Pjd2GWCQ4e4lnk
QHN/rDYfqJe/oJOFB4P3JbAXUpSK0A==
=knMV
-----END PGP SIGNATURE-----

--vvack7oqb3jt2kp6--

