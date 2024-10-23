Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 459E2CFA461
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Oct 2024 19:23:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=aBMyZL8pFvXZnvc5QhsclsxMb5bZ4WCzLDEiYkjOh48=; b=dlYzmjskA6AeZsT3N7JEOwtmOZ
	e7KE9Yc7sGO6xF720Ajl6FG9tiFEGH7eb3F7Bk+QrIESN3xpzUcU6/No634snPhmmIqpF7EUKhmJV
	G8bH0x9okD/q49W9u1lmV4MuAWedWES92Fy1Dzbr/xEi21ACVIbhBWeZTGz9HRlJOM0dm3YipT67w
	RugWwhsZJlf7SEsUlLX+QDeP7Rtfn4og9ytaX8Tz+P+TMYzDVz2T2MkT/1AwZ7uHKMOytD0xfvvLf
	oBAknqSfc8HMMtyOaNGe1bJ5K2D2vpeUgaGNlOAOhZbtSqtWShaToX2dkL9eWLV9nihZrnFKGzH6k
	sZtrvOQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3gx2-0000000FfXh-3JdQ;
	Wed, 23 Oct 2024 19:23:24 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3fl8-0000000FTJD-3yA9
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Oct 2024 18:07:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id ADE025C5947;
	Wed, 23 Oct 2024 18:06:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A779EC4CEC7;
	Wed, 23 Oct 2024 18:06:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729706821;
	bh=t0OsmiICNt3PxXJRiW8VMEDf2/PnwsW9vsZr+jws/Zo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UiouI9v9Pvi7W3bkD7Tqo9cyQz2D/bzL+ktiWg5kPpIOSpwmlHT7eStKkc4XNgAnS
	 LGrygm57mfWwm8wIVO4Qh192OagWGxpd3+kPh6BGTpwZhTs87KddblZ21BGpz/boS5
	 nmpUZ+6vnnNRTWFeMbRgqO3UZRikChuFGb6oo6LHIi2ZBMmlgDTObd5SRarUlYYVuN
	 PAelEwrHQnOcKEX2YL191HJDSgtvqYm+8r6KkMXG0p1sk953CUIPGJSMvr1vBzjCNp
	 g4x+EwlQa7QKOCM3XaYYpg6sTrN3a8XieKCBVaxhuzx9TKn1XTYVQTBEi6JFYpg1Jw
	 wEac8LYvCTfqQ==
Date: Wed, 23 Oct 2024 19:06:57 +0100
From: Conor Dooley <conor@kernel.org>
To: Mark Brown <broonie@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>, robh@kernel.org, krzk+dt@kernel.org,
	conor+dt@kernel.org, devicetree@vger.kernel.org,
	linux-spi@vger.kernel.org, shawnguo@kernel.org,
	linux-arm-kernel@lists.infradead.org, lukma@denx.de,
	Fabio Estevam <festevam@denx.de>
Subject: Re: [PATCH 1/3] dt-bindings: misc: lwn,bk4-spi: Add binding
Message-ID: <20241023-dares-december-d15da85e5799@spud>
References: <20241023120015.1049008-1-festevam@gmail.com>
 <20241023-irritate-veal-0423be9e4c45@spud>
 <94889e08-07b3-473c-9f52-bdeb5d1fd822@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="j7TgCwvpalwdyGNy"
Content-Disposition: inline
In-Reply-To: <94889e08-07b3-473c-9f52-bdeb5d1fd822@sirena.org.uk>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241023_110703_061021_AA8C2FE1 
X-CRM114-Status: GOOD (  12.99  )
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


--j7TgCwvpalwdyGNy
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 23, 2024 at 06:33:07PM +0100, Mark Brown wrote:
> On Wed, Oct 23, 2024 at 05:37:29PM +0100, Conor Dooley wrote:
> > On Wed, Oct 23, 2024 at 09:00:13AM -0300, Fabio Estevam wrote:
>=20
> > > +  fsl,spi-cs-sck-delay: true
>=20
> > > +  fsl,spi-sck-cs-delay: true
>=20
> > Why does this have fsl properties? I figure they're taken from the dts,
> > but spidev doesn't use them, right?
>=20
> These are controlling signal timing and implemented by the SPI
> controller rather than the device - they're the timing the device
> requires.

I see, thanks.

--j7TgCwvpalwdyGNy
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZxk7QQAKCRB4tDGHoIJi
0h0EAQD1+zRw8ot+iuFqLVv2zcnuAUM8wlHyYJ6GMSQncEgR0gD9HByTJCTh64tQ
YBm+SGM4Hx7Rpsv9M4RsHAlsAgT8VQg=
=iPz7
-----END PGP SIGNATURE-----

--j7TgCwvpalwdyGNy--

