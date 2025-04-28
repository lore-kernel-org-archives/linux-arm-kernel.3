Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AFCC369D5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 20:20:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pL7e0c02mbv/0vwsIMwslL/GXK+LDR2a6ftGA055ovQ=; b=EnCCIbn+9gaNYHGplvUFh2IDdV
	5xVQeb2OPdUBm7wbX5l4XjinFoQfndZZtGDH4bkCBI3dekOsi3MQuKDyf5eIBOe5RoUk3yfaMi284
	MVnN2bWyU86AqSZSnlC/u1zN61KMenZ+SwKqanuXb8gqx+Esz39H9wW8K0TnK6PoMrWIUZ3uH05NV
	DoyYj7sij49e7MJkpqMIYC1GrcEIX9m0sVtSaLfBj0A2EF01HIn69krLdwQ8Gfai4MejHcZC1NGrx
	KR253KredPAMMqBzGwOjFa05AqyscFEjrpREABf7QgXRfNo8BNJuXKTWMqC2PsOxpWTq6ggMQLgM9
	LAvNl33w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Uy6-00000007RqX-0KXv;
	Mon, 28 Apr 2025 20:20:46 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9Uw5-00000007RXZ-42LA;
	Mon, 28 Apr 2025 20:18:43 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 6B5881C00B2; Mon, 28 Apr 2025 22:18:38 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745871518;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=pL7e0c02mbv/0vwsIMwslL/GXK+LDR2a6ftGA055ovQ=;
	b=X2sswUxgS8rseE954SAultNrk/gSe6kFPYI/ahGW0v6GaxxwGRyoJwzni0/XGns+i6V6Gu
	wegTZ0i5B0iAYmvz1ToPZrRese1ZzshF30N4j3q1qa/QuQ/siLpRc8Vsihus/YUYqiTfh9
	CO/zM40LI8WPDX4dyrAoj25hoelcEOw=
Date: Mon, 28 Apr 2025 22:18:37 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nam Tran <trannamatk@gmail.com>
Cc: geert@linux-m68k.org, andy@kernel.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <aA/ineUBAM5IU79J@duo.ucw.cz>
References: <CAMuHMdVJNPRd3GMRV3=W0vsNW+fm4up-mWPOZ_W1-wQigQj8vw@mail.gmail.com>
 <20250428172917.25405-1-trannamatk@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="MN9BK62TjYm6fNeb"
Content-Disposition: inline
In-Reply-To: <20250428172917.25405-1-trannamatk@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_131842_441283_AC807F7C 
X-CRM114-Status: GOOD (  24.46  )
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


--MN9BK62TjYm6fNeb
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> Thank you, Pavel, for the confirmation.
> Thank you, Geert, for the review and the question.
>=20
> I would like to make it clearer.
>=20
> On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
>=20

> > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > >   and update the title and $id to match new path.
> > > > > - No functional changes to the binding itself (keep Reviewed-by).
> > > > > - Update commit messages and patch titles to reflect the move.
> > > > > - Link to v7: https://lore.kernel.org/linux-leds/20250422190121.4=
6839-1-trannamatk@gmail.com/
> > > >
> > > > Out of sudden without discussing with auxdisplay maintainers/review=
ers?
> > > > Thanks, no.
> > > > Please, put into the cover letter the meaningful summary of what's
> > > > going on and why this becomes an auxdisplay issue. Brief review of =
the
> > > > bindings sounds more likely like LEDS or PWM subsystems.
> > >
> > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > believe it is suitable for PWM, either -- yes, it is 36 PWM outputs,
> > > but...
> >=20
> > Is it intended to be used as a 4x3 matrix, or is this just an internal
> > wiring detail, and should it be exposed as 12 individual LEDs instead?
>=20
> The 4=C3=973 matrix is a real and fundamental aspect of the LP5812=E2=80=
=99s operation.
> It is not just an internal wiring detail.
> The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 outp=
ut
> pins control 12 LED dots individually through scanning. Each pin includes
> both high-side and low-side drive circuits, meaning matrix multiplexing is
> required for proper operation =E2=80=94 it cannot be treated as 12 comple=
tely
> independent LEDs.

Scanning is really a detail.

If this is used as rectangular 4x3 display, then it goes to auxdisplay.

If this is used as a power LED, SD activity LED, capslock and numlock
=2E.. placed randomly all around the device, then it goes LED subsystem.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--MN9BK62TjYm6fNeb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaA/inQAKCRAw5/Bqldv6
8uIbAJ9b7Wxw9w0XNXTWOjMbMpolG2mURwCfZJERufyKV1fAXGFzbOZeb+pFo7g=
=PiIm
-----END PGP SIGNATURE-----

--MN9BK62TjYm6fNeb--

