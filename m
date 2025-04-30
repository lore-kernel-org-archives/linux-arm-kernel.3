Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 115DEC3ABAB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 07:33:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0uWhUtB07fuy+20OaSmbXkXnv/vhP67L+RCQmHanEtY=; b=qSJE3xi9331aOA74PX+ekJbHkC
	qMym+1BhUocvqd0xOuqcyFoHTYMEw/BrbCFBvyew7LaiotOxwjH/6LdzpkK0Hh6cSuQVB9OJRJwTg
	qgvdRwl/By4MKL6bB79Nb1GuY/tGQpJ+h1QilsX7gCW29GZRZxakDgDM0upbNbZfyOlAkUsvGwkyz
	ZVV3b+BwiEVLAGsPFulB4wWvLoVBpnL8zRQd3bkbmUYh/285bOVgQHwD83h1z6MYI/o5gozQ/j+Yn
	22QE7+GCsSAMYKS11of6kAZ2Cj9NKI+q/AxOwYwkDGjV+Nmgfgt2W4rBguL0TRL5FjOhjIiZcBCze
	Te5gShdQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1w5-0000000C07T-16us;
	Wed, 30 Apr 2025 07:32:53 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA1f3-0000000BxWg-0PVm;
	Wed, 30 Apr 2025 07:15:19 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id 52B511C01AA; Wed, 30 Apr 2025 09:15:08 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1745997308;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=0uWhUtB07fuy+20OaSmbXkXnv/vhP67L+RCQmHanEtY=;
	b=e28nt/lVW+XJbyWKMQHktS27mBX3qBE/5EeAl30/FlGEVNUc2OaCXyhF7sq4kn5mT435qz
	mAvgP9BJAL/CACX2+38yWS3M0okLMEpwve42TUFWG3jNK/B6/vwULbF1DxRtlHfz+omiWw
	eOmxtRcmWl1UOGZ3FqUoePo9R12vblc=
Date: Wed, 30 Apr 2025 09:15:07 +0200
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
Message-ID: <aBHN+395kaIdbBEm@duo.ucw.cz>
References: <aA/ineUBAM5IU79J@duo.ucw.cz>
 <20250429170220.8145-1-trannamatk@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="Y8wJvSsTAszRr9tX"
Content-Disposition: inline
In-Reply-To: <20250429170220.8145-1-trannamatk@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_001517_592431_10311DDC 
X-CRM114-Status: GOOD (  17.96  )
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


--Y8wJvSsTAszRr9tX
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

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

Well, IIRC it also supports automated animations, and that does not
make sense on LED indicators. So... what device do _you_ have and how
exactly is it used there?

Best regards,
								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, and Musk!

--Y8wJvSsTAszRr9tX
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaBHN+wAKCRAw5/Bqldv6
8vbsAJ4yWVOLyewaLjKCy5K42zX2pr7vhQCfRwpEm2TX7CnFns8+ygH5cB6Wa/I=
=tWxB
-----END PGP SIGNATURE-----

--Y8wJvSsTAszRr9tX--

