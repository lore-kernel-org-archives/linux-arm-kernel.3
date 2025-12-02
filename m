Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0F862D12675
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  2 Dec 2025 22:14:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=td4zCRfT57+g0xmdtBp34YZgvdl6Eh6Vecq9FAfQC68=; b=ZiwUWDOgNAZKub7MLBTnTH8I9S
	CSt5rtOs/PVuIghJP8xBGoyqWqa0ajjxYSZhgylG7cFKDC2RuRq2x+nYagoukVklhz4d9N1mFZUsu
	I/8ekxhCcEohbWm2YYe0kIx1VUOI7hMYrEAF3NndiHHnojJLJuhm2nevbaFg1mQkCT3yXc603Pc48
	2r1yyR1VKEc+LCTIuL858qZlvALy5aBVste/7tyNmPCvoaXsENq/FjyBPDs2FG+UdcEZydmQLiTn8
	TcEDmo3W7Nqrcj2/dCJ+AghPXtdYPtaIAvgo8/e8siuokf51D4HFWVL/ojfTSjhrxi2hrqDM7inmF
	A2z0o92A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYdS-00000005tPf-03Cg;
	Tue, 02 Dec 2025 22:14:14 +0000
Received: from jabberwock.ucw.cz ([46.255.230.98])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQYdN-00000005tOf-3R1c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 02 Dec 2025 22:14:13 +0000
Received: by jabberwock.ucw.cz (Postfix, from userid 1017)
	id E35EB1C00AB; Tue,  2 Dec 2025 23:14:01 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ucw.cz; s=gen1;
	t=1764713641;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 in-reply-to:in-reply-to:references:references;
	bh=td4zCRfT57+g0xmdtBp34YZgvdl6Eh6Vecq9FAfQC68=;
	b=N+RN9xMRtKT5+KNJu6lSKFFPerVub7ZeJC+MMqfzoaLTer5xiqSSa2VQNkcVj/Y2P5KxUj
	HWkNRfsm1uG5EuuqnsREMRz09crqOD26ppHLOYf8u01iUtV/sxkotL4BZFGL7S0o09PP+9
	Q3M5i2ZCjswJyhMovvnLrS8hEUfE7d8=
Date: Tue, 2 Dec 2025 23:14:01 +0100
From: Pavel Machek <pavel@ucw.cz>
To: Doug Anderson <dianders@chromium.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Peter Griffin <peter.griffin@linaro.org>,
	=?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	linux-samsung-soc@vger.kernel.org, Roy Luo <royluo@google.com>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	Chen-Yu Tsai <wenst@chromium.org>,
	Julius Werner <jwerner@chromium.org>,
	William McVicker <willmcvicker@google.com>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Drew Fustini <fustini@kernel.org>,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>,
	Krzysztof Kozlowski <krzk@kernel.org>,
	Linus Walleij <linus.walleij@linaro.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	linux-serial@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH 0/4] arm64: google: Introduce frankel, blazer, and
 mustang boards
Message-ID: <aS9kqTTiH2keDL5G@duo.ucw.cz>
References: <20251111192422.4180216-1-dianders@chromium.org>
 <aSOKS35/huSWd/RW@duo.ucw.cz>
 <CAD=FV=WVeiGa6YkRmce4McnePEV9X_n79YA0bywPdNZcZCV=ZQ@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha1;
	protocol="application/pgp-signature"; boundary="xQRsnIWYvuS50k0p"
Content-Disposition: inline
In-Reply-To: <CAD=FV=WVeiGa6YkRmce4McnePEV9X_n79YA0bywPdNZcZCV=ZQ@mail.gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_141410_299089_08BF6DEE 
X-CRM114-Status: GOOD (  19.64  )
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


--xQRsnIWYvuS50k0p
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hi!

> > > This series adds barebones device trees for Pixel 10 (frankel), Pixel
> > > 10 Pro (blazer), and Pixel 10 Pro XL (mustang). With a yet-unreleased
> > > bootloader these can boot to a UART command prompt from an initramfs.
> >
> > Well, booting to full system with working cameras would be nicer,
>=20
> For sure!
>=20
>=20
> > but
> > this is good start. Do you plan / do you have resources for full
> > support in some reasonable timeframe?
>=20
> As you can probably guess, I can't really make any promises. :-) Of
> course, "full support" of Pixel 10 by an upstream kernel in a
> "reasonable" timeframe could arguably be impossible no matter how many
> resources were thrown at it. There are just some drivers / subsystems
> where getting upstream working as well as downstream is working
> doesn't feel likely as a short term goal.
>=20
> That all being said, interest / support from the community helps.
> Knowing that people are interested in this work helps motivate folks
> at Google and (hopefully) upstream maintainers.

Motivation is certainly there, and race for usable, supported phone is
still continuing. Check https://wiki.postmarketos.org/wiki/Devices for
small glimpse into "mainline on phones" effort.

Best regards,

								Pavel
--=20
I don't work for Nazis and criminals, and neither should you.
Boycott Putin, Trump, Netanyahu and Musk!

--xQRsnIWYvuS50k0p
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iF0EABECAB0WIQRPfPO7r0eAhk010v0w5/Bqldv68gUCaS9kqQAKCRAw5/Bqldv6
8mIkAJwP7vo5DWx3gJx063WMFClmFIgZTgCeM5zJ3LlBnfgJpHpOAQSx21vz1aA=
=n9MH
-----END PGP SIGNATURE-----

--xQRsnIWYvuS50k0p--

