Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4CE7BCAC592
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:03:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/JrXP+Er95XRyZ504JanEx3HoJ/rZisZt2Q5h92w2jU=; b=dT2+H/zVGuDNs6GNhMPocr00u1
	xcZrFTgXZer/afb0LzjLenwi2rLUFK7HNqHGhN61wjAUcW/IqMvttvTVZvnHWfHp07GfRkBMt52K1
	ykKTLfln2klPAdvTS4CUC5nIhRnaWkN56iaono4wN9Ew3YBEAchFEk9inCE2dJwWeU//rew0DJDhv
	jKZ5i8VwwHftUlgOFsoPLe5ks1M4uqDtcYgbKCkWgZCZ3C6TiRevf3nvz5WHob4M/3uvj+yGzR6+R
	OPYiLCLPL1wUZr2JNP9fvJFhcBa9u0auhKJs/i5g7Iv61zYV5+J/mDLkJ/5txqvodP+rXjgTBWViz
	vHyddVIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdZl-00000003SPI-0iJU;
	Fri, 19 Sep 2025 16:03:09 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdZk-00000003SOx-0ahG
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:03:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 49D9A60142;
	Fri, 19 Sep 2025 16:03:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9EA38C4CEF1;
	Fri, 19 Sep 2025 16:03:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758297787;
	bh=/JrXP+Er95XRyZ504JanEx3HoJ/rZisZt2Q5h92w2jU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jjkTQ8JtJs0Xyy+aQM3zsH1Awb/CfBlumwAxr7MEWVPJ4QY2thL1HmfKTtXMedq3W
	 cgisJV4p6tw7EE4XA7kooz5pcWhNawHYrfMfyGnlr52yPLeieHEMHpVCTqsbFdFzn8
	 kvMkdkeL6Hd28sXV6ptjv8ZS2oJXPfLlEvldKmmtCvUiD9cU7WyHzMLfEsKCOkHY+h
	 Jp3jqPhcyct4WE0nldynGAXaRFSMjaoDvSM0Hqx2d/JrToEcoiRoOORNFCUkfEYGSs
	 VstG1EbpRqJ7KmLOqpWo0DOdEuTXsLQTjU6mDnsYwT349Ic6rA3hUPqNKiFKCPQqKN
	 UjVrkXdwt4RHw==
Date: Fri, 19 Sep 2025 17:03:00 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 2/5] crypto/arm64: sm4-ce-ccm - Avoid pointless yield of
 the NEON unit
Message-ID: <eaf4c342-5ba0-4f05-b641-937d24d2a352@sirena.org.uk>
References: <20250918063539.2640512-7-ardb+git@google.com>
 <20250918063539.2640512-9-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tbed4sQ6qHeiGdFl"
Content-Disposition: inline
In-Reply-To: <20250918063539.2640512-9-ardb+git@google.com>
X-Cookie: Don't read everything you believe.
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


--tbed4sQ6qHeiGdFl
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 08:35:42AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>=20
> Kernel mode NEON sections are now preemptible on arm64, and so there is
> no need to yield it when calling APIs that may sleep.
>=20
> Also, move the calls to kernel_neon_end() to the same scope as
> kernel_neon_begin(). This is needed for a subsequent change where a
> stack buffer is allocated transparently and passed to
> kernel_neon_begin().

Reviewed-by: Mark Brown <broonie@kernel.org>

--tbed4sQ6qHeiGdFl
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNfrMACgkQJNaLcl1U
h9Ceowf/Z3UzSwYIObGf9baV5ZQ75yhm3OUJTsQyFR2rSe2VG+cSKPV0rER22deq
v09d6cECoYrSVHh1sAGAtEBPbMUkyviQmHupfGBysyGunMcxJKiwh6Vf1HRXSesz
MXgnRuskEfvgWlBKcfJ3CL8PGe7oWxc/5OlC3E18Ld1RYB+i8p5yHc9z01FrF3om
d1R/e3Nwg9Y1hApSzMW+WGmoh7OrIbO+UcrnO6QsFDu9W4Xo4sCCs4ASGMcpen8W
c9CqyzYZqLpsLYVH0AjFs8f0Zi0GxAXSUsm9sZZRsY3F4aAMcLYm+GwcPa10EyPL
Dujr4lWrw8NpWMqmt0yoRMZZCOOmcA==
=qk93
-----END PGP SIGNATURE-----

--tbed4sQ6qHeiGdFl--

