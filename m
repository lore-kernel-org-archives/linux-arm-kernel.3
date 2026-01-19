Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 62B2CD29C2A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 Jan 2026 13:37:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lJb3R19nkiYopQmNx5R8476OrkmBP08hMcFQKv47fKY=; b=VseKwkb0YND8KlsPkdeJWmLGub
	WTw28/P626799LM6APXlPT0NGp8jJ1QREjhdiL5082hqfsUPwibIw3q5zVICCLowlaFGYgGFydviF
	eVJjuutyvhze44NVXkVpuiL40RnPeq0IC+UnKDUO9K6b2VaJ2T6gd86zEiJTZ2MOOcvTJnC6gAUHz
	uGQNpoPDz0XeC2Vtpor7ooXogY5GZSws67pXC9h8Jrm57JYhMSRG5Zo4/k5csM9jUmb+mOT3RRF8T
	P7eJtDeRq9i6itSmyDLZKkGQot3ZaWKzyPjBrALgBiHlJkdpHSROdQQCozfdU+yTXnoz2BzlLphPB
	9L2CBxHA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpRa-00000002Asy-1HFM;
	Mon, 19 Jan 2026 13:37:22 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpRY-00000002Asr-3lC6
	for linux-arm-kernel@bombadil.infradead.org;
	Mon, 19 Jan 2026 13:37:20 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=In-Reply-To:Content-Type:MIME-Version:
	References:Message-ID:Subject:Cc:To:From:Date:Sender:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description;
	bh=lJb3R19nkiYopQmNx5R8476OrkmBP08hMcFQKv47fKY=; b=SXxHormaFyd3raMUg6aDAc2BCX
	WV4Z+6JDSjlXAF1A8rlO9JJ/47adjQU3mAbIRd7m3nw8eCMpngzBzTJTzOkyF8budMm8xCnVk9AA0
	rFdbQKpDFJbKU716w9TXy6ILljksP8t+PoJXlCoLJMbIfcD1pseoY3cy1Dth7oNShA+SdlOZNYk+Q
	KI2rwtUDvryIKk1HGDwUJh4h70SOLBG7tHull2DnTzPwXjtay/a+wkhLSlnl9fmZhxmXmxZfnv6KZ
	9Dcswc5dzW8VGsyPqelXa0yJU03SzHclL1MsDhJlyax4ZI04+gHG6nW9Ja8z30zzH25dhwbac80/J
	OqW7Kfkg==;
Received: from sea.source.kernel.org ([172.234.252.31])
	by desiato.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vhpRV-0000000CBDH-19yY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 Jan 2026 13:37:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 677F543C4C;
	Mon, 19 Jan 2026 13:37:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 09E63C116C6;
	Mon, 19 Jan 2026 13:37:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1768829833;
	bh=NQhlNmakp9XzCvOKm+K/DiXWdOuvD8Ykc7UWybaRfrA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=A0Yy+O9m3bpEWejSb8AZVey2Vkiwx0Eax1Yq7MFX+zQfpIW9vXJjBQavwlH/TErRH
	 qW66JhnYseJiJfY2MKbXCI54CthEcjVWyI6bb/ms2w53GHTvZLz6J3jazd5/uSl2Ps
	 FTn7n87f/C1RBrwV1i6bt5ETR8tzAWb0QlnyYbPPk0g6AQe4B1dYCGNXRpxzsRjpvG
	 O/O1cX7wCx42r0asHpVNvtwg9Az048pE37WW7oOey/+uBFiI33P8bnOHzVHf9i0y12
	 XwB/K0dlvP1LZpCmhHgmmT6v5qbWg3jaahCpW3/N9FB90ik68JPzCM7hNszYr4JJ4q
	 hXVNgNbeGbjXQ==
Date: Mon, 19 Jan 2026 13:37:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Paul Menzel <pmenzel@molgen.mpg.de>
Cc: Chin-Ting Kuo <chin-ting_kuo@aspeedtech.com>, clg@kaod.org,
	boris.brezillon@bootlin.com, joel@jms.id.au,
	andrew@codeconstruct.com.au, linux-aspeed@lists.ozlabs.org,
	openbmc@lists.ozlabs.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	BMC-SW@aspeedtech.com
Subject: Re: [PATCH v2 2/2] spi: aspeed: Add support for non-spi-mem devices
Message-ID: <e4f133db-928e-49ae-9ee8-99e119d14708@sirena.org.uk>
References: <20260117134216.595436-1-chin-ting_kuo@aspeedtech.com>
 <20260117134216.595436-3-chin-ting_kuo@aspeedtech.com>
 <3153512e-8325-4d0b-a869-a2a5062abefd@molgen.mpg.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="gk42q0GFzUogNGdb"
Content-Disposition: inline
In-Reply-To: <3153512e-8325-4d0b-a869-a2a5062abefd@molgen.mpg.de>
X-Cookie: Does not include installation.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260119_133717_596712_F670DE77 
X-CRM114-Status: GOOD (  14.97  )
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


--gk42q0GFzUogNGdb
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sun, Jan 18, 2026 at 12:48:37AM +0100, Paul Menzel wrote:
> Am 17.01.26 um 14:42 schrieb Chin-Ting Kuo:
> > The ASPEED FMC/SPI controller may be shared by spi-mem devices and
> > other SPI peripherals that do not use the spi-mem framework.
> >=20
> > The driver currently assumes spi-mem semantics for all devices,
> > while the controller also supports direct user mode access commonly
> > used by non-spi-mem devices. This mismatch can result in incorrect
> > behavior when different types of devices share the same controller.

Please delete unneeded context from mails when replying.  Doing this
makes it much easier to find your reply in the message, helping ensure
it won't be missed by people scrolling through the irrelevant quoted
material.

--gk42q0GFzUogNGdb
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmluM4MACgkQJNaLcl1U
h9AOpAf+KY6H92cdg3gOoQqgQu7crH6a+7XIW9D8d4DUyutJ3AVxvUSJHgxNAl3c
V4ilv0msLOJJ6HpX/r5PQwBxtXyJ8B+4awixyqucFxMc5rOTbOhTUfSQs5CEk0Ye
ZA0i4zbi0ugsYRl329wp62zOsYNbdZu0zDZmaAwIGUnZhuyarMsk3xfSkg8i7oor
/uQhG8Z+bw1Y9rW5+WBFPLHsEiOhsf/o7pIIKUtTkaJkrE8hvfvszgIzObDQwKPM
EXIlzMbd2tlKgIHfwIRcRK+NzbpvC/BIHEBZmiYPR/Ura1meOTlsrD9UR0rpd5Gg
RrZG1vxcsH4KwCDJfTCUxBBlMfcFlg==
=Arfl
-----END PGP SIGNATURE-----

--gk42q0GFzUogNGdb--

