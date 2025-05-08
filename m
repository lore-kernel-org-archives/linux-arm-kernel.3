Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 961E3C3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 May 2025 08:54:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ckLCaz9JTwf1JWFkvqfAI949tTAoo5JbgEelAt8RQvk=; b=vcuw3YTZVXR13br9Pit3jW+5TN
	wS/L8EcpfDzi9gI1/1MHlu2ceJbs/kfk24aqFIhz/0LLiE9ebpBDRs9V90wQlae86k6txkW+YM51T
	iKUArPS8qklThaXXIcreBdkiwty7vKiodk+ADIBuYA2NTdxJ6eD7zmyH5qX4zX9T/cU2A/WONCoJ2
	AW9PO5EudnZvxThYS4xM8eF/fpSLu6GFVOjJA/hhqifmCqVyp4CTQ7XRRXUKQv6ocvbdp1pEj2muk
	Jlab8WuI+fT7scnkjCXtt4D76YgAWa0gaHg/RLKhaM9d8Uea//Ki2WFvCyxRbKpsvbCE/EfDwrpgg
	b9BxLdIg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCx0m-00000000B2A-381R;
	Thu, 08 May 2025 08:53:48 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCwm1-000000008n3-1t5A;
	Thu, 08 May 2025 08:38:35 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 119011C00AB; Thu,  8 May 2025 10:38:26 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1746693506;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=ckLCaz9JTwf1JWFkvqfAI949tTAoo5JbgEelAt8RQvk=;
	b=PrNROnZxCeea0Jho3SCM2w2/XQ838ikowGDgqD5QtqDpcbs2e38VTtLBxxZMMMgBH106hN
	ElEgO86ZtWA95vGDx4pxSfOv1o9I+6k7QtMEG7l7O3C1NTem1cc1t5S4b7wJXNH5bXaSdM
	eWoeYLiJhf2uUsYUbdE6G4bbk2b6sMs=
Date: Thu, 8 May 2025 10:38:25 +0200
From: Pavel Machek <pavel@ucw.cz>
To: Nam Tran <trannamatk@gmail.com>
Cc: andy@kernel.org, geert@linux-m68k.org, robh@kernel.org,
	krzk+dt@kernel.org, conor+dt@kernel.org,
	christophe.jaillet@wanadoo.fr, corbet@lwn.net,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org, florian.fainelli@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com,
	linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v8 0/5] auxdisplay: add support for TI LP5812 4x3 Matrix
 LED driver
Message-ID: <aBxtgZw6+BM36Rru@duo.ucw.cz>
References: <aA/ineUBAM5IU79J@duo.ucw.cz>
 <20250429170220.8145-1-trannamatk@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="DXdxuze0uvDm4WRw"
Content-Disposition: inline
In-Reply-To: <20250429170220.8145-1-trannamatk@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250508_013833_926983_CB1CA727 
X-CRM114-Status: GOOD (  30.16  )
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


--DXdxuze0uvDm4WRw
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > Thank you, Pavel, for the confirmation.
> > > Thank you, Geert, for the review and the question.
> > >=20
> > > I would like to make it clearer.
> > >=20
> > > On Mon, 28 Apr 2025 Geert Uytterhoeven wrote:
> > >=20
> >=20
> > > > > > > - Move driver to drivers/auxdisplay/ instead of drivers/leds/.
> > > > > > > - Rename files from leds-lp5812.c/.h to lp5812.c/.h.
> > > > > > > - Move ti,lp5812.yaml binding to auxdisplay/ directory,
> > > > > > >   and update the title and $id to match new path.
> > > > > > > - No functional changes to the binding itself (keep Reviewed-=
by).
> > > > > > > - Update commit messages and patch titles to reflect the move.
> > > > > > > - Link to v7: https://lore.kernel.org/linux-leds/202504221901=
21.46839-1-trannamatk@gmail.com/
> > > > > >
> > > > > > Out of sudden without discussing with auxdisplay maintainers/re=
viewers?
> > > > > > Thanks, no.
> > > > > > Please, put into the cover letter the meaningful summary of wha=
t's
> > > > > > going on and why this becomes an auxdisplay issue. Brief review=
 of the
> > > > > > bindings sounds more likely like LEDS or PWM subsystems.
> > > > >
> > > > > It is 4x3 matrix. That means it is not suitable for LEDs. I don't
> > > > > believe it is suitable for PWM, either -- yes, it is 36 PWM outpu=
ts,
> > > > > but...
> > > >=20
> > > > Is it intended to be used as a 4x3 matrix, or is this just an inter=
nal
> > > > wiring detail, and should it be exposed as 12 individual LEDs inste=
ad?
> > >=20
> > > The 4=C3=973 matrix is a real and fundamental aspect of the LP5812=E2=
=80=99s operation.
> > > It is not just an internal wiring detail.
> > > The device adopts a Time-Cross-Multiplexing (TCM) structure, where 4 =
output
> > > pins control 12 LED dots individually through scanning. Each pin incl=
udes
> > > both high-side and low-side drive circuits, meaning matrix multiplexi=
ng is
> > > required for proper operation =E2=80=94 it cannot be treated as 12 co=
mpletely
> > > independent LEDs.
> >=20
> > Scanning is really a detail.
> >=20
> > If this is used as rectangular 4x3 display, then it goes to auxdisplay.
> >=20
> > If this is used as a power LED, SD activity LED, capslock and numlock
> > ... placed randomly all around the device, then it goes LED subsystem.
>=20
> The LP5812 is used for LED status indication in devices like smart speake=
rs,
> wearables, and routers, not as a structured rectangular display.

Show us one device where it is used, photo would be best. I suspect
that the router use might indeed qualify for LED subsystem.

You described is at 4x3 display, but it is really used as 4xRGB?

> Given that, it seems to match the LED subsystem better than auxdisplay, d=
oesn't it?

Seems so, yes. From description, I assumed it was 4x3xRGB, not 4xRGB.

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--DXdxuze0uvDm4WRw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaBxtgQAKCRAw5/Bqldv6
8mN6AJwN7zf8tTTp+bxWAqTTF1AoTBaggQCbBSUYvVJF5PV+ahfMfUjtZcxAwkw=
=EZPf
-----END PGP SIGNATURE-----

--DXdxuze0uvDm4WRw--

