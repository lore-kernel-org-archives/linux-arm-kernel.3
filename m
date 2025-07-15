Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6130BC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 12:08:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A4j7G1vC0T8/33ktGJXnWr5nfBS1gbpvgbnn1MDL8Ng=; b=0LHGmPNGpGxwrWgEKhgZuX9/wN
	dw2+EhrEPtCIBczFuKwDbXJEbM7mzsYJJv9XSL2WSW+O6RWMfX+3zhfMwC53Fyoqx1v/N1aRNieCl
	SrEUqsoY1OiIH0Dc5BxJl9XughSU/Dqs/m3wYdPAXepA0wH5YL2igZJOmKjSY6cKzZAhTCo4y72UK
	RrppYPg9VDwzEspOdWVIcFIEKwzGjZThYDGNqBpn96162kzIgTdnTVtIfdkUO5gcMX0+Y/tP5x+it
	f8pQzrShMJtv4MsBCmqbYQ5l86wSWST/FrNV2QTwCY0YijG24hKZmE6Lp4Gvp6OqPhA0z21mS7xbQ
	Pf1B+bjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubeRu-000000051zJ-0DJq;
	Tue, 15 Jul 2025 12:07:54 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ube8M-00000004ypa-3n80
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 11:47:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A0060A56F81;
	Tue, 15 Jul 2025 11:47:41 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E418EC4CEE3;
	Tue, 15 Jul 2025 11:47:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752580061;
	bh=A4j7G1vC0T8/33ktGJXnWr5nfBS1gbpvgbnn1MDL8Ng=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=OIUi0YtcSwAFb1E9tiev/sD+ZEIF1refmS1KTCmXo7+LSWhR+To3EGy8HO/D0iLMA
	 9wbQ/i3cQcHFi5/N8BGhuT9NmjWUXogymvLBj52JhhDwr+vPd7mio9vcoqvDOmnFxR
	 E0JywS+bjA5iqm0YMcWWOdNCUWbVDswIa5vVgbsGdmWNro99T817XXEl8ybGvXfsMU
	 tJfjIEICMA7pbypXmuWEXcukWijbt1rGD05lp5AOsL5ytbCm79GFJlNjfvKcS57F18
	 j/QrmEogwCB/1cuPTdkghLxj7KA28MgFMohZm9sthg+bJwTduTmDTr15P/37QC+f2Z
	 dYYtcyDkZ5KQA==
Date: Tue, 15 Jul 2025 12:47:36 +0100
From: Mark Brown <broonie@kernel.org>
To: Naresh Kamboju <naresh.kamboju@linaro.org>
Cc: open list <linux-kernel@vger.kernel.org>,
	Linux ARM <linux-arm-kernel@lists.infradead.org>,
	lkft-triage@lists.linaro.org,
	Linux Regressions <regressions@lists.linux.dev>,
	Yeoreum Yun <yeoreum.yun@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Arnd Bergmann <arnd@arndb.de>,
	Dan Carpenter <dan.carpenter@linaro.org>,
	Anders Roxell <anders.roxell@linaro.org>,
	Shuah Khan <shuah@kernel.org>,
	Benjamin Copeland <ben.copeland@linaro.org>
Subject: Re: selftests: arm64: mte: check_prctl.c:72:17: error: use of
 undeclared identifier 'AT_HWCAP3'
Message-ID: <45be60ff-385d-43ab-9b08-1c13477a4a01@sirena.org.uk>
References: <CA+G9fYusqGejrepNPCR-7ZZDPeQQfZgf2z=_aUz_03QHm7Ccaw@mail.gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="uQSmwzk/K9D/NaCi"
Content-Disposition: inline
In-Reply-To: <CA+G9fYusqGejrepNPCR-7ZZDPeQQfZgf2z=_aUz_03QHm7Ccaw@mail.gmail.com>
X-Cookie: Your own mileage may vary.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_044743_009094_0942D45F 
X-CRM114-Status: GOOD (  10.71  )
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


--uQSmwzk/K9D/NaCi
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 15, 2025 at 04:53:04PM +0530, Naresh Kamboju wrote:
> The selftests arm64 mte build failed on the Linux next-20250703 onwards
> with clang-20 toolchain. still seen on today's tag next-20250714.

I have a bodge for this which I see I didn't get round to sending out
last week while I was at an internal conference.

--uQSmwzk/K9D/NaCi
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh2P9QACgkQJNaLcl1U
h9CtpQf+J0uScZs5pqd4ZVDV42gg4cfx+vl09VSsEQLZrkYXlQJbJm/Oz/olZhaM
UaCJGFoGsMnNGEvkUf6VOxr4f4QjtXOPEoGv467A8Vl67x84ViSLAcbYlhcwPkNn
/Gn4s/bHNaM3vWnCEqkhxU3AiGKNiUJa5FbRdaVmnQavlvyThLsC0TvyEmjhQ/Pa
F/D6nmmxbmW53sZYcYk1vdq7sQ1fWd3TrOrHqJV8FHFUWtoJs5cD9lDgTFp2ulOq
1a6Tlz1UcR9giue5r+ewT6O/gFeqTrHYZWnsc5sYPWFA2xgezMYaIqZUgYsMhZXJ
fqANbbA3gU8uwhYXKiMJW7Bu1kNUfQ==
=7/J9
-----END PGP SIGNATURE-----

--uQSmwzk/K9D/NaCi--

