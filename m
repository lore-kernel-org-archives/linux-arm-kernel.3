Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8A19FD2B931
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  5 Nov 2024 14:32:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CvID57YmT4JMAq1iUTs3WtirP/sKV5Z6AefJvN/SSYM=; b=b6JWMcze+QwvGn4layf+fd5A6D
	vzjaDfyfYT4yuZjag049yx+7bHHPKqTLX7BvF3tJduNyt7ctuqWAgeg6vf/jL+qDJHHX3EPh79huV
	DsSmu7npdL+2X6ZYV4o5x8rXGzZ9WwxuedBpFgaeY2OpUQq63ainr6diDy+1CbKHoAF9S1mMH9N4h
	qnXykSU+oBv7i1D/fDCGH0ovQdV3X6ONaJwZwSC7ny5MhJAw8sByE9ZfrJOzd+ZS3tDEIqHtzC/cd
	CGwrMa7xYm6Zkri35Af9wK06FY+TR+pIdVLyDqMWjokTihYED4uGs8wOTlm4oMEg638nb7S0sS9TE
	ohuuEsRA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8KbK-0000000HH8a-01bz;
	Tue, 05 Nov 2024 14:32:10 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8K5L-0000000HC7Z-0iDB
	for linux-arm-kernel@lists.infradead.org;
	Tue, 05 Nov 2024 13:59:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06DEEA43218;
	Tue,  5 Nov 2024 13:57:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DB48CC4CECF;
	Tue,  5 Nov 2024 13:59:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730815145;
	bh=CvID57YmT4JMAq1iUTs3WtirP/sKV5Z6AefJvN/SSYM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SSc7j3I52dEaIwkDTn4ibAs0yL+sm1AUrdjsS5Foqi9CmitafJ0rmhkf8jgCLxDXv
	 JLp2feUIvpp46K7GRII8y6DO1tvcztO0PFZdYUO5QMD3JD+SLVUz8OV0x0Z9jVBf+f
	 dmc3hj4qkNab24foZVua9aC+kSzagud5ic/jNuGnRdZoG7bdTbZcIf8P4Z3GRHHPmX
	 XfakUYr4UNG+yHNjgD6pu0ezdfKWFokPuu9x/Ww3WifZ6ghk4OhXiM7HuHM1BsulUx
	 w8a8iXOrjgTucQAuuy+8372ySxPYNQ7IvnRIDd4kLjMwMmySgyIhaa/qX+/TgU8PbQ
	 KYmLvcj2Zt7WQ==
Date: Tue, 5 Nov 2024 13:59:00 +0000
From: Mark Brown <broonie@kernel.org>
To: Janne Grunau <j@jannau.net>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>,
	Alyssa Rosenzweig <alyssa@rosenzweig.io>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, asahi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-spi@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	Nick Chan <towinchenmi@gmail.com>,
	Conor Dooley <conor.dooley@microchip.com>
Subject: Re: [PATCH v4 1/3] dt-bindings: spi: apple,spi: Add binding for
 Apple SPI controllers
Message-ID: <722dbc29-3d37-4043-a0c1-f99ac1ceaa80@sirena.org.uk>
References: <20241105-asahi-spi-v4-0-d9734f089fc9@jannau.net>
 <20241105-asahi-spi-v4-1-d9734f089fc9@jannau.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="D7mzdCilsziPoams"
Content-Disposition: inline
In-Reply-To: <20241105-asahi-spi-v4-1-d9734f089fc9@jannau.net>
X-Cookie: I'll be Grateful when they're Dead.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241105_055907_297590_B271C276 
X-CRM114-Status: GOOD (  12.13  )
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


--D7mzdCilsziPoams
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Nov 05, 2024 at 09:08:29AM +0100, Janne Grunau wrote:
> From: Hector Martin <marcan@marcan.st>
>=20
> The Apple SPI controller is present in SoCs such as the M1 (t8103) and
> M1 Pro/Max (t600x). This controller uses one IRQ and one clock, and
> doesn't need any special properties, so the binding is trivial.

Please submit patches using subject lines reflecting the style for the
subsystem, this makes it easier for people to identify relevant patches.
Look at what existing commits in the area you're changing are doing and
make sure your subject lines visually resemble what they're doing.
There's no need to resubmit to fix this alone.

--D7mzdCilsziPoams
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcqJKMACgkQJNaLcl1U
h9Clfgf+Pd2KCID4TdGn0iOZF2Js93e/8eeKynPSfYIathQZJzS1VgjiVV/2A4ed
Pu2SpxxqQG93EebMnNm6MA+c9kR2ser/EC5Ty/9erPPkdFXPwiXIo260oxsdqmXz
oJXob3jksOe5Zr+1jCksNjlpviRHrhToRqcJPPoLV5wWbmW20Uz9FAPKH/aMje7U
QgLKNoIAISZGl2eKjjARFFIKmjtHxUQgbgmUTAncnGulmjlqFm3TWenZCFx7Scpf
Ep5+910xQiNSfnQNmNGBPO+O6/VHRicXGUm7nWrCSAaghmOwdVDT231ELjxfY+Fm
EXjZTcdv82Xqb6t4/J3wrJsgTBSqQw==
=iEeU
-----END PGP SIGNATURE-----

--D7mzdCilsziPoams--

