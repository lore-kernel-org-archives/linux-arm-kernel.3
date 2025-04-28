Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66184C36005
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:39:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sK1vyzZ1/+Jz3BVDrNB5HsQaiId/G9OE1+QZi7+pUo4=; b=a/24M51ESjfuy9eGJFc1zkyPMd
	JfAqpjjrY1kFSvdMxjUXtOgetXmKkg/vzikBBRJEa6AjCTZwPQ2EAB0cVCvUOsxKjUMUZ/y0oWZxY
	x4kpqiNFpA0NgtZ08AOk4vLfX4RXBeKLlP3AOW9qPQO0/ZzmERUNfcZRr/flCXKJNXBx8YsOKm/92
	kbsBv6fR5obaEHQiqSqs9v9ZM6U57BdrSb6GwcAGc+qogtI7fLwi2ich3LcVZ4YpSpppFI5aHgqFI
	D+1Q2x/REn8mV2MVC1d4zRwcNFQGuq/dpaO/U4YMKElkic1JED/v03OtnYOk0xa4yAuhT9emLizcI
	VwfNekQA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LtH-00000005ooh-31xZ;
	Mon, 28 Apr 2025 10:39:11 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LrI-00000005oWP-2cQ3;
	Mon, 28 Apr 2025 10:37:10 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 803651C00B2; Mon, 28 Apr 2025 12:37:02 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745836622;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=sK1vyzZ1/+Jz3BVDrNB5HsQaiId/G9OE1+QZi7+pUo4=;
	b=NovZaOQrOnYyuz4h8MTpMapCl+bGF0gUM27+yMWiDTxs4K56P/UTaF4wfkDUFWS+kjPZil
	7fPVRr+WvxX++Xxt/1j0WMsCDMdJcvb6Za5AiE6qz4VPlng+0vsZFR2nWCw8ljivMhaGKO
	1RYtOP22T4/eItT4cLkXKQJw1grdt+0=
Date: Mon, 28 Apr 2025 12:37:02 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Andy Shevchenko <andy.shevchenko@gmail.com>
Cc: Nam Tran <trannamatk@gmail.com>, andy@kernel.org, geert@linux-m68k.org,
	robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <aA9aTjhXHb3gddd9@duo.ucw.cz>
References: <20250427082447.138359-1-trannamatk@gmail.com>
 <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Ag0ctD1RJcTfntuY"
Content-Disposition: inline
In-Reply-To: <CAHp75Vch8i50stVO6nH0Tnn=g4xSMji_iPj6q-CE1tLnvesqcQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_033709_107835_25E473A4 
X-CRM114-Status: GOOD (  17.73  )
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


--Ag0ctD1RJcTfntuY
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > This patch series adds support for the TI/National Semiconductor LP5812
> > 4x3 matrix RGB LED driver. The driver supports features such as autonom=
ous
> > animation and time-cross-multiplexing (TCM) for dynamic LED effects.
> >
> > Signed-off-by: Nam Tran <trannamatk@gmail.com>
> > ---
> > Changes in v8:
> > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> >   and update the title and $id to match new path.
> > - No functional changes to the binding itself (keep Reviewed-by).
> > - Update commit messages and patch titles to reflect the move.
> > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.46839-1=
-trannamatk@gmail.com/
>=20
> Out of sudden without discussing with auxdisplay maintainers/reviewers?
> Thanks, no.
> Please, put into the cover letter the meaningful summary of what's
> going on and why this becomes an auxdisplay issue. Brief review of the
> bindings sounds more likely like LEDS or PWM subsystems.

It is 4x3 matrix. That means it is not suitable for LEDs. I don't
believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
but...

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--Ag0ctD1RJcTfntuY
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaA9aTgAKCRAw5/Bqldv6
8u5oAKCw7eoZkIX/nBIa7XNYs4+P55FOvwCfaRsaqwJ7S1BjMxnZd5ElzqJ4liY=
=6Zmi
-----END PGP SIGNATURE-----

--Ag0ctD1RJcTfntuY--

