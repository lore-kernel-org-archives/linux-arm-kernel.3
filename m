Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 96E9BFD4F2A
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Mar 2026 19:48:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=arqE5nIedaIgQQAYQ6WoGUMj2z5mXl+d7Gd85oQ1gl4=; b=R0J1WFrXCKv+iwKvzESAhW1Bit
	dgQ/QaaIYa9yTbEn2BzyXrvsbKQw636qVJX07rqmG49m7qeJSQDuyZBPIf+cmFPvVPUDbOaXjE6Le
	g0FTfw0B+nNiZLLXvLPTqCVGh8upitYAlMHWc9l77j+x+to/1xJqcSzz8Bgw2e3sju8+Q5WgFhLCd
	qNhuQqYaq7bRxJ5CaK7weuO4twAy3CgQpqq6mLOanaevoYJSIQpbqS8Md52s8tqD849GkmCLO/4f4
	hw2BRSLMthcA/+6XyOXKGSD+Gky9i8hPAyYjvHgpU6Cj2DTEOKBrM16d5aKnZGtuyS135nn4wSjTo
	zG/dgSIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w033l-0000000ACHg-3w9v;
	Tue, 10 Mar 2026 19:48:05 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w033j-0000000ACHY-3kpn
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Mar 2026 19:48:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id DEBF86012A;
	Tue, 10 Mar 2026 19:48:02 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4CA35C2BC87;
	Tue, 10 Mar 2026 19:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773172082;
	bh=VI6ZvLC6UF3rgOFQkIgQV+oj3OlilD/SmhASpV5TwOs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UeHQ3U4v/6LhbapgAlvooAzANS1wi/NvslUd/X9P9rYduDrKU9yTrMrWgDPouc7Sy
	 WHVINVdZcnnOLlGlNhDRBzo2Tg8DS+NgNRs7EsRgB717BqsI33dnpJhbTekHdaq10I
	 ZQh1LVoEVzgQAnFGlzLEW6V4HsC5n8He3X1lJIPQBmefUwBKMcMZQTRGYibObCpyH/
	 dfcd5zoKCE5JrZVYxSzrCy0oywgYOdWbZncFlv+vLU0DU1RTGOOAfxoBTCUYDy4KAX
	 KnIqDoYh3nlmI2O6Cc25x5TB0/72PSnNiGUJAPsWami6+xgxNJBnGV50azjYxm1mhh
	 d2cF2z5gHuzfA==
Date: Tue, 10 Mar 2026 19:47:57 +0000
From: Mark Brown <broonie@kernel.org>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, linux-sunxi@lists.linux.dev,
	devicetree@vger.kernel.org, linux-spi@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 0/3] arm64: allwinner: sun55i-t527: avaota-a1: Add SPI
 NAND
Message-ID: <33204e68-5e65-4486-a473-79d09def88a8@sirena.org.uk>
References: <20260302153559.3199783-1-wens@kernel.org>
 <177317166704.379398.1719490251066452420.b4-ty@kernel.org>
 <f3ed7b81-4e43-4baa-8a56-b18fa7f56436@sirena.org.uk>
 <CAGb2v65TyEkirWpfynKnSCiuOAyTW1FZQyXncnTFEHGGOQr_Fw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="GZBDzLwXazKSzeVm"
Content-Disposition: inline
In-Reply-To: <CAGb2v65TyEkirWpfynKnSCiuOAyTW1FZQyXncnTFEHGGOQr_Fw@mail.gmail.com>
X-Cookie: A fool and his honey are soon parted.
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


--GZBDzLwXazKSzeVm
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Mar 11, 2026 at 03:44:01AM +0800, Chen-Yu Tsai wrote:
> On Wed, Mar 11, 2026 at 3:42=E2=80=AFAM Mark Brown <broonie@kernel.org> w=
rote:
> > On Wed, Mar 11, 2026 at 03:41:07AM +0800, Chen-Yu Tsai wrote:

> > > [1/3] spi: dt-bindings: sun6i: Allow Dual SPI and Quad SPI for newer =
SoCs
> > >       commit: e2f93f45d38f7b6dacb44203cfc7bb5d7e287b8e

> > I'd have expected to take this one?

> Normally you merge patches pretty quickly, so I thought maybe you weren't
> going to take this one.

I tend to leave a week or two if I think it's likely someone's going to
review.

> I can back it out if you want to take it through the SPI tree.

Probably safer for conflicts.

--GZBDzLwXazKSzeVm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmwdWwACgkQJNaLcl1U
h9Cdfgf/UDOhiKrvijiKCzfW0PzBsGr8Wz9vAwv63v1Pd/hZIXE6abGOgKe2c4Np
/45Z4ibLYbPGy8qUaUmeh62TF/7vUWF5OAAqUrRO3WmyDxhI1jHdWYYjMnnQQGdt
20vOp/Jq8MUTXEOmY1Yb/keztk1BBE+o6BZqug7AsNHlugs3Ah/ClEiE6YAqtyte
VnkLvct4xlV7RHyMB+sEsVmghFXqJRU7Yn3x+DKBbe0Bzr5td2EqH0UHVairEsnJ
KnP1U47KOO4QywBq9zwu2YUDsk8ulI8t8cbv7g7yvzwpDywQGapo78wriOaN3a4X
Z5jdwfUdQzoqJlu17h4GXp42udNCgw==
=w4Y8
-----END PGP SIGNATURE-----

--GZBDzLwXazKSzeVm--

