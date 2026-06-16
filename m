Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7C78CCD98DA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Jun 2026 16:00:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RIse3iwtT2+Os5evlGt3yi2fypjT2QT8SgerPML2hCA=; b=K2q8x95GTp9M0TO71BBgwSAjBx
	55PjzkzLSeKORI+PuEKOe/aCMSEYaCsETxsli0hgLwhPYZ22dXyKqP61KJ+G/MEBsTJdE7PJMQZJJ
	8aHdnPBoPU5EAGIAFcR8dg8xH+blMazWp1PmXwoKs8W0a6N7IsDFVX6C69ep0kLwQ/pcE9ECiW+aq
	gS/v1VSd2UYBru8gkTFYFXKlme3pFcWv6OtafZkoB7UpIZ1+PStkhY/Rf0chjs1u7V/TbcwYRgW/l
	viTSW5Z1wXjFmq4L82uINJMPryN3Z0rkvl0SSXdbfxH51yAg/xcpJPi7vkvbkCfM5TZ5dgXftbpFK
	V7BaHHWw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWCn-0000000G4B6-0ulu;
	Tue, 16 Jun 2026 16:00:01 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wZWCk-0000000G4Af-3MBp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Jun 2026 15:59:58 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 880ED42B6C;
	Tue, 16 Jun 2026 15:59:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id F00A31F00A3A;
	Tue, 16 Jun 2026 15:59:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781625598;
	bh=RIse3iwtT2+Os5evlGt3yi2fypjT2QT8SgerPML2hCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZVIlwhd6oD9IM9hhq5ifVe+dQbWEypsk7MvrPoQ2DIj+CRLFkMXl+uddZ/IeXoUXw
	 Ds3gOZI6riFQezdvBQmcNg+WuPytgkqRr1OULzZqCDqHBYvdtCGQglpJI2rTDNn0ot
	 AQDV030F2Ul9tFkcYm86ptat4zuo/XbkBo1ZuvO3iJwwgyv6V65xaGLv56N7F7fRd/
	 GR9wT6b0BkcRKW6NDH0yz3chjaWNV4h7KAC4xQoJN84gvASWUe+wYx4F2U2pOIZGBN
	 DFGckWFG17boMCTZdPEDRFotpe1siIgTvppyMACFl/J6znVoICieUGDYbCCq1IZI2F
	 iK7zZ7fJOZ86w==
Date: Tue, 16 Jun 2026 16:59:53 +0100
From: Conor Dooley <conor@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Andrew Jeffery <andrew@codeconstruct.com.au>,
	Linus Walleij <linusw@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	linux-aspeed@lists.ozlabs.org, openbmc@lists.ozlabs.org,
	linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: pinctrl: aspeed,ast2700-soc1: Add
 JTAGM1TRST group
Message-ID: <20260616-surgery-fritter-8583b091fd6b@spud>
References: <20260616-pinctrl-fix-v1-0-621036e45c7c@aspeedtech.com>
 <20260616-pinctrl-fix-v1-1-621036e45c7c@aspeedtech.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="sLe+DVJgetvs8zz8"
Content-Disposition: inline
In-Reply-To: <20260616-pinctrl-fix-v1-1-621036e45c7c@aspeedtech.com>
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


--sLe+DVJgetvs8zz8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

Acked-by: Conor Dooley <conor.dooley@microchip.com>
pw-bot: not-applicable

--sLe+DVJgetvs8zz8
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCajFy+QAKCRB4tDGHoIJi
0nyzAQD/cfSEv7EyKRM044BXBjhasA9Yr52g/vKaTKlxcUnd+gD/dLz2G4ZVL2LX
+vn4OonXgVtVBt+atEzn1pOoaRvRjAk=
=uh/e
-----END PGP SIGNATURE-----

--sLe+DVJgetvs8zz8--

