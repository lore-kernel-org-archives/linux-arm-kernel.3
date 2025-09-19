Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88B9BCAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:03:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nYGhvaswrglufTThE8Ko8tVUeDykuaH4CIml5aGwjWI=; b=Rv8wf78lys8Y8vH7nshnIMqwjq
	GSTayqrHZGPhh3n/J6hayj35WpbBvHzLNTAt+Zg0rz510abxkdizChH2FjPM8eIo23bLpfl6Dv3Em
	HoSpWDub5jKZt92Nik4kNm7ndIpfT/kxIGLqN/LhNEki7gbLraYwGaB1YGFqDnllzyXvXUE8Ne5l9
	yb4J3AyKJ+rP52CQ6xmSljDcl7GQPkaxJhasrXP5DJ6/4jPaRrEjj5iRqgdcN/wgNhHO0r8/CmQZF
	rD6mHFuNArS+p+lCVAAYQqZMCjOC6k213+3oRzJJ/SACFgXAKJv5NUUEEsb1DkpSDGLF3dY7QhMvh
	7y5qMrFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdaK-00000003SY7-3kCC;
	Fri, 19 Sep 2025 16:03:44 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdaF-00000003SWM-35Dz
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:03:39 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2296360204;
	Fri, 19 Sep 2025 16:03:37 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67C56C4CEFB;
	Fri, 19 Sep 2025 16:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758297816;
	bh=nYGhvaswrglufTThE8Ko8tVUeDykuaH4CIml5aGwjWI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Q/Kaoaj7/JaKRP8O4fGkgim34hTc1efzdwxNkmTCalIwsPZuERsCotfZ+M3jBvKNT
	 bbWN+hhksHJb4J/UVlIbv4m5g1hJ9He2nlbDGH95Dpe1VXUUIxCv4Oti+JaPplDxjj
	 uDfc316Y6XPmZn76OhSbG5D8kY4ZWbRARqSeuBGHQ2sUhxuHPUPA5uyO/HEccQ3wGJ
	 n/iyboyl45ZIy/5B4WgGDS1cmg/D7c1ypIu4/3kLuvPHAfTqbfzqrvmzSERu8jnF05
	 irTEb38K0lPnapiS1T0rsArdGUhpc2HdseH7SbRGPOY4aYPqUwBCLb6QFO1M4gKh07
	 fw5M8rTp9y+MQ==
Date: Fri, 19 Sep 2025 17:03:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 3/5] crypto/arm64: sm4-ce-gcm - Avoid pointless yield of
 the NEON unit
Message-ID: <4eb3c865-75af-43e4-a760-46bbb7e34f9b@sirena.org.uk>
References: <20250918063539.2640512-7-ardb+git@google.com>
 <20250918063539.2640512-10-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="V1bFmzjAwqS0yQHR"
Content-Disposition: inline
In-Reply-To: <20250918063539.2640512-10-ardb+git@google.com>
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


--V1bFmzjAwqS0yQHR
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 08:35:43AM +0200, Ard Biesheuvel wrote:
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

--V1bFmzjAwqS0yQHR
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNftIACgkQJNaLcl1U
h9CYGgf/aqFUbV8ym698Sr7+ZwrCHLCSAI7rfHpPa0ePv1UBDBTHcd2TrMYdUHyw
nsXFJ8JNceHUvk2vT1wYR5Ao+7BxvKAXuC3qw1OR29DJUTLSkRJ9Y15I9Yk6DMH0
xHrfkGfjyZCpbt6vf7PxbactkGYlOrHlgYRM+53vT7dWecei47BcXWyGEQaDabEA
jJjJZ5qtCY/D1KWuYfbudHIwhgYfQHWR5L6AF5RSAph9SV4+UseqtW5xnZ6zJSOb
vU5VG9ojXUELVI7zXMLOTtZYhOcj8g2AHKyeDWwunjEho7MksVoCfNXMIUVUS6xk
s/1u+CKpHm5yMiN+kmk9YXq+xzw85A==
=KcOJ
-----END PGP SIGNATURE-----

--V1bFmzjAwqS0yQHR--

