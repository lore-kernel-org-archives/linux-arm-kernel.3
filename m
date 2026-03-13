Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B2A65105F782
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 09:32:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=beVc2KTJMzx85ImY7CM5SLMDdJ73ItjK/Owjxv5HS90=; b=joqlGFEgbaeNJaWjNhEYa1ekPY
	I++11nbkyYY34w17Gv3vulB4p1IFySsO/Rsx4M5oqyyRIXf8WjebRh0LhyTZOfi2g4gdRSQX2DoAz
	hwqD2H4qDrrhaGOY+IqK4yJSbn9WfRChwyUek9WS+pa94Mqr2BrKj2K/YBeIE0mLeyfv7zAqVJRoi
	RvoZU9u3xIiZcKljCWQ1OuKrNsN8lUEM0AHnhKOW+74dt1lE60KgpfQriinrgfzyYz6gbyHaN/JmE
	8GfucFH9CTdr2I9TSv2T2m19Uo2oQxLP4JGPLwSe/hzsqz3qRNchcp4Xug9soK4XOSpwoKtdWayZ+
	x6JdS2Yg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ysj-0000000HOb0-2zv4;
	Fri, 13 Mar 2026 09:32:33 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0ysi-0000000HOaY-3Xif
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 09:32:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E559E60130;
	Fri, 13 Mar 2026 09:32:31 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1F4DFC19421;
	Fri, 13 Mar 2026 09:32:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773394351;
	bh=+MT2bK5lK4b/U+CKVnI5iPZjRVFFSU1WWNQo7BSEpGs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=YsZ/zOSCWdZPU3Jciw6dOovFXjZi7JCTqvB4ZleCf9pN1Lc36FvPXKrL4tdL922dN
	 sRqJU99AhErIhg7m6B/SOxyT3V90rEgg9leEwg9eVgkRWQWYBMhlRiadFecyNDk0+4
	 AUJwEboXm7Wa2KN1udBilplTwMPfG6nsTEv1EHe2EEhw1yeB9n/3kZHI4Mkrfnf834
	 oq8qjvyBxiy0fyiepery/b1A8UkjvGUOKnEN7yQzlC0wV9qQSVxcuGDqBgDgi/a+E2
	 Fsr0D0hTrr3p3XwCCVY6JT8/Y6+eloYdDsCY8I6NyMzoqmSJMbCWwY6TsBLJXyg1Z5
	 gXshwXUd1oPCA==
Date: Fri, 13 Mar 2026 10:32:28 +0100
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <ukleinek@kernel.org>
To: "Viorel Suman (OSS)" <viorel.suman@oss.nxp.com>
Cc: Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, linux-pwm@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3] pwm: imx-tpm: count the number of enabled channels in
 probe
Message-ID: <abPZBUvzHi_yqkkU@monoceros>
References: <20260311123309.348904-1-viorel.suman@oss.nxp.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3x3zrpgo2kxgdoay"
Content-Disposition: inline
In-Reply-To: <20260311123309.348904-1-viorel.suman@oss.nxp.com>
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


--3x3zrpgo2kxgdoay
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH v3] pwm: imx-tpm: count the number of enabled channels in
 probe
MIME-Version: 1.0

Hello,

On Wed, Mar 11, 2026 at 02:33:09PM +0200, Viorel Suman (OSS) wrote:
> On a soft reset TPM PWM IP may preserve its internal state from
> previous runtime, therefore on a subsequent OS boot and driver
> probe "enable_count" value and TPM PWM IP internal channels
> "enabled" states may get unaligned. In consequence on a suspend/resume
> cycle the call "if (--tpm->enable_count =3D=3D 0)" may lead to
> "enable_count" overflow the system being blocked from entering
> suspend due to:
>=20
>    if (tpm->enable_count > 0)
>        return -EBUSY;
>=20
> Fix the problem by counting the enabled channels in probe function.
>=20
> Signed-off-by: Viorel Suman (OSS) <viorel.suman@oss.nxp.com>

Applied to
https://git.kernel.org/pub/scm/linux/kernel/git/ukleinek/linux.git pwm/for-=
next

with Cc: stable. Given that the issue is already old (May 2019 in
5.2-rc1) I tend to not send it for inclusion into v7.0, but if something
more urgent pops up I'll probably send it along.

Best regards
Uwe

--3x3zrpgo2kxgdoay
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmmz2akACgkQj4D7WH0S
/k5F4wgAr+r7n0wf0qQGC7PzYyABJ2R++TrHH11Mj3ayf4RwH12e/AZdB4BexERN
YXRiq7MFz/NjHQyvSaEBOSe0bzSLRCz+IEgq+5YtrJzA9niDlBWAKQtZus93TBWV
J75sVS/gh5rTf5ykCqm7GgZQ/3QWd6DfZ7GvNRnnTgtby4ePVgtax7xwjISMYh5O
5aOrRuHTacEBbC/7PFdwJ4hngibB4/mJBMVZSQcV5199q0zUzecUYPag4xCYpGM4
xe1Hj/waykSIvY8QMKjJSUYZXqBo+fFEpsoTvw08ZMiA+tp162x+walf8VAzGWuT
/oj2t6W5PtRfjVq7dwPFvD0+cMIKBg==
=vRAD
-----END PGP SIGNATURE-----

--3x3zrpgo2kxgdoay--

