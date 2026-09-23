Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 03EBCC98302
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Sep 2026 16:49:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6D/6Lx4FeaW18dd0db0e2+PErxS3iDoNCWBjzge9c2Y=; b=bxX82IYfo6vSgZne5vTba3IwLe
	FBmRNKCJNgA5CoxyrPnycVBVxqa1NsPHq8x0uxHaANzM0DtmzaOk383Qj7t/EsWovsa5k1KIAl2sW
	uaQfDWCEGpTmE1hHl0N2HiI+Kt6k1LpdK9qyRDV3VAbHQ7QGwDNJEH1pTyDghNgf3UpFWXj59GopS
	J8iI97Y3FEp+FLTW9I8nvBiuHrWTHbblhV9PYGD8rG/+zPHBusYBz+xrEYZ+2JR7THXqbWehtsNFL
	VjkfJWq5YdfK7GxcxWvNjvnvu8ATTEOgKpS0uIbGZE6LGMODFa+SrO2qlR6tTwZ7ODg23kApxL3ju
	DSZBFzVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q9u-00000008vSy-2kro;
	Wed, 23 Sep 2026 16:49:26 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x9Q9r-00000008vSM-2Rat;
	Wed, 23 Sep 2026 16:49:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id B73D0600AA;
	Wed, 23 Sep 2026 16:49:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 24DD81F000FF;
	Wed, 23 Sep 2026 16:49:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790182162;
	bh=6D/6Lx4FeaW18dd0db0e2+PErxS3iDoNCWBjzge9c2Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=YKGxQ1XS4j7gZoZTtFLH5kga2VvDvNwjXm7rrNXt46YC2lkj6CB1aBWRgFHKCkxOz
	 fcInmSVY2i0+txgxs9delFDiM6vKGw/5gzUuFK3pzVdT64Frb1FuWTCn0+Cd/IIRKO
	 qvB4NU3JxNoTy562fyiYcC1LanTa8y3kLJH5lSL/VmjrBbPgPxoqyAfG7WxHZYzmGs
	 mSbeKmJd947ct09YEcBsLzcEyJeW//pwH2ysdH/wrt3ZH+POfhreL50UF6qlRc7Dxi
	 O6Azp7S97hm2W7972ekP424jbrbYReAAo+9qmT0cqG2VCIZ/RhlCJy1LWyoiGihtyp
	 EF30dVepjZWDQ==
Date: Wed, 23 Sep 2026 17:49:18 +0100
From: Conor Dooley <conor@kernel.org>
To: Sander Speetjens <sander.speetjens@gmail.com>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	Jonathan Bell <jonathan@raspberrypi.com>,
	Stefan Wahren <wahrenst@gmx.net>, linux-rtc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v4 1/2] dt-bindings: rtc: Add property for Raspberry Pi 5
 RTC
Message-ID: <20260923-basically-slider-df357b773907@spud>
References: <20260923131323.1099979-1-sander.speetjens@gmail.com>
 <20260923131323.1099979-2-sander.speetjens@gmail.com>
 <20260923-browbeat-judgingly-b047721f5cb3@spud>
 <6de301bd-0bb6-4704-8c3f-8da09c5f6830@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Az4NTJrw4JBvlQp3"
Content-Disposition: inline
In-Reply-To: <6de301bd-0bb6-4704-8c3f-8da09c5f6830@gmail.com>
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

--Az4NTJrw4JBvlQp3
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Sep 23, 2026 at 06:46:00PM +0200, Sander Speetjens wrote:
> > Is this actually needed? Shouldn't the type of uint32 come from the same
> > source that the type in rtc.yaml does? Or is this missing in dt-schema?
>=20
> The rtc.yaml does only provide the description not the type, I also expec=
ted
> the type to be there.
>=20

I think this should be dropped and the type added to
property-units.yaml, I don't know where the one in rtc.yaml is getting a
type from.

--Az4NTJrw4JBvlQp3
Content-Type: application/pgp-signature; name=signature.asc

-----BEGIN PGP SIGNATURE-----

iHUEABYKAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCarQDDgAKCRB4tDGHoIJi
0q4jAP0fxrVwhLTgoZaPeHOSKgAl8IZFnecnfjyEXRCM5zpNRAD/dAch7qPLWnJ3
xJYXTouIBYrbyM4DV+ecAeL4NwMJRg4=
=RW4s
-----END PGP SIGNATURE-----

--Az4NTJrw4JBvlQp3--

