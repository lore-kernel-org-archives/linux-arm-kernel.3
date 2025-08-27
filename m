Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4F98CA0FED
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Aug 2025 11:12:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/smPvszByZaAF/Ideu82BSZu3Ndn1PjZSF6bQpSGf54=; b=zXY43Go8R3JLR+c+2pZSobOupQ
	u8t2ET4qeTz7TnIvI3QZAn6CcCzzeg0Ic+NTwV5Ncr3So7naF/BOKFS2AAcmfRE0mGkNGdeAFygvA
	XpOxBxThag1+oF9m5Fy3VKGVEQyqBcVXiZCclGJlrId+H3KAm5wAw8QQSoXuSg9zV6ngxJvFDNeW9
	1i+QGiTvgNyNsIHAXCf2wj2FZferEVo89SwAoD2/pJmEVyfHS1wKafQXlfY3H/11kAiotAwSyCoUq
	kkq8U9ORUpgbSIJpZhj8I3NLYTacBT7nkKldz32kya/Ie2/sTVCvwmfwS6dmZSmr7E6wnYyCYS5gG
	eVEq6RKg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urE5D-0000000FDu2-3OX5;
	Wed, 27 Aug 2025 11:12:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1urDSF-0000000F57N-1rvG
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Aug 2025 10:32:36 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CEE6743F32;
	Wed, 27 Aug 2025 10:32:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9EF5C4CEEB;
	Wed, 27 Aug 2025 10:32:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1756290754;
	bh=/smPvszByZaAF/Ideu82BSZu3Ndn1PjZSF6bQpSGf54=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FXVfo9edvnfYDZY9oYOI1IjWhXElJtoKE/QXD0PNTUVuQ7jWQHsM6vpl8OWZxo97Y
	 5zK137hjg10dzubzqUD+AKjAgN1X3+M3o5ODhhLWrTy+b22LjYDTN+tvwGUuhaghBW
	 jBlFAeNQioSRejLwSAIgmX49dIlfTtx7vsp2uQzqffQHwK1KwIzJxeIezv1yqvfdH6
	 Y07U7w4H+LyMwfBI0hahRiuJmRwRMm52R6cZ4dLrZttolx64vbzoaou3/CRXC4dgvz
	 TIb6t8pPDFsfrBRQ9w7rbSRzeVGaTTaLytd3FaluUkdM73a4JKDNlmBLsNvHs1pg8y
	 rpESJfOoFihjw==
Date: Wed, 27 Aug 2025 11:32:29 +0100
From: Mark Brown <broonie@kernel.org>
To: "Nikola Z. Ivanov" <zlatistiv@gmail.com>
Cc: bagasdotme@gmail.com, Markus.Elfring@web.de, shuah@kernel.org,
	will@kernel.org, mark.rutland@arm.com, ebiggers@google.com,
	catalin.marinas@arm.com, martin.petersen@oracle.com,
	ardb@kernel.org, thiago.bauermann@linaro.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-kernel-mentees@lists.linux.dev
Subject: Re: [PATCH v2] selftests/arm64: Fix grammatical error in string
 literals
Message-ID: <d8bb28b7-7832-4c24-82bc-4663affcf57a@sirena.org.uk>
References: <20250826214913.866695-1-zlatistiv@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OQXy7X9uIo8z3XU8"
Content-Disposition: inline
In-Reply-To: <20250826214913.866695-1-zlatistiv@gmail.com>
X-Cookie: Most people prefer certainty to truth.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250827_033235_504438_13439EC2 
X-CRM114-Status: GOOD (  10.68  )
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


--OQXy7X9uIo8z3XU8
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Aug 27, 2025 at 12:49:13AM +0300, Nikola Z. Ivanov wrote:
> Fix grammatical error in <past tense verb> + <infinitive>
> construct related to memory allocation checks.
> In essence change "Failed to allocated" to "Failed to allocate".
>=20
> Signed-off-by: Nikola Z. Ivanov <zlatistiv@gmail.com>
> ---
> Changes in v2:
> - More descriptive commit message

Repeating my previous tag:

Reviewed-by: Mark Brown <broonie@kernel.org>

Please don't drop tags, it causes people to have to spend time repeating
review.

--OQXy7X9uIo8z3XU8
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiu3rwACgkQJNaLcl1U
h9CGvwf/WeftVyVodR4qHALiv4Av0QxqR+iExFnfNIAqKJLensYxmI59/oGQNKSR
2FxNc52TMWU8J2MaXnuTpZGnJSbSb+YMVDHO/FSZAtmp3JthRxtNwVdV67Pm02RS
xGGvYzGLDQDMivz2dgiGirxZHfxevZrFLDeGA3h4a7mkM/aKJxLLjbL+cPOGlcri
Zc0p0kHdhtzgK81Z1TaKe7DW8ygkXobECaeL1dwUbFIRBk2oB9Q0R/oHXCTue5Yr
mILQcxhhO4Y4RZarEARwv00rfz0qWMUf6QaCkiTeMuspAvIR5SnjxoQcX8fFcsSn
lBmAYNNzBpxc1gUqnsaj9M3bf4nWUQ==
=AcWK
-----END PGP SIGNATURE-----

--OQXy7X9uIo8z3XU8--

