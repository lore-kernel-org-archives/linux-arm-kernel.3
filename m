Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 667CBCD5BA4
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 21 May 2026 11:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VUJnhxSzF/JjiGI40PuXjiACHn4MaFrGkULPDFp60Zc=; b=Wxw6t+fQs1q1ungUNTjn+i6uyh
	wldDnU6eqpdQYh6be9hQMEjXuWigMpaDQqYLhxliucLojcc6QA47I92hyA9p2L7wckU2Up0HYuIvs
	6ZctH4uzGMl9bqW2I5iZOkQ9vCX+bzFxVGOgGovIrA1bltw/ajg9ugp2xNrQFmMW0ZUxKHL+0IUV7
	eNrr92pBGNmiqWPDgeq3/lfyx5FvtAal5KUnN/3lNyFhYHJKcLVg/OjcV5gl5DtgeIWAwBznhZ6+0
	7h8j8yo4nMJ5RW1d670ibZrUNynQALcNoMsv5Mau+SK/eFMXGRal4IjlWnVdazKfEoX9E04zspzsC
	Jop7aWkA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1U6-00000007aWL-0F3Y;
	Thu, 21 May 2026 11:22:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wQ1U3-00000007aVM-3cmI
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 May 2026 11:22:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEF8B4184D;
	Thu, 21 May 2026 11:22:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9D2C1F000E9;
	Thu, 21 May 2026 11:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779362554;
	bh=VUJnhxSzF/JjiGI40PuXjiACHn4MaFrGkULPDFp60Zc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=P/qNH1bMbeo7E7xYFTDiDBSadXT01q9ZrLrONJ29Vm2++HT++qtgkvdaUUCfjM3Ix
	 kWfIb0+MlIMOABVGXgpbeudrXfpSNvSTEBPvTdL9J1zCv1MLjLouw5KtNGXFM6g9f0
	 HAtnPr7vZIw66a6v0DPZSpTre2LuZPgW9RV/HMJy+Qti7mnKoIRdtSlbGZ5PAleG4f
	 TaNR6o6tCbLQwnvZFSZtlJjc0XdSgHkbWf6/BQCBJBc++3JJI+bNo9SWmD7J58VqiK
	 d/dJQksj+tjZScbDazJHyaPL3XZbVHN5LG8ULtX7qW0QA4nj+ghPQjwqoKs/jvWv9W
	 +TgMJPlDIEq7A==
Date: Thu, 21 May 2026 12:22:30 +0100
From: Mark Brown <broonie@kernel.org>
To: Kevin Brodsky <kevin.brodsky@arm.com>
Cc: linux-arm-kernel@lists.infradead.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, Shuah Khan <shuah@kernel.org>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH 2/2] kselftest/arm64: Add test for atomic futex uaccess
 with POE
Message-ID: <8fc7713d-6451-4f05-86cd-df833cedd94b@sirena.org.uk>
References: <20260521-poe_futex-v1-0-1da286b8f9b2@arm.com>
 <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8gHwo4h6itunB5YS"
Content-Disposition: inline
In-Reply-To: <20260521-poe_futex-v1-2-1da286b8f9b2@arm.com>
X-Cookie: No shirt, no shoes, no service.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260521_042235_919058_10A1D172 
X-CRM114-Status: GOOD (  11.82  )
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


--8gHwo4h6itunB5YS
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 10:42:31AM +0100, Kevin Brodsky wrote:

> Add a new test to ensure that atomic futex uaccess succeeds on
> memory mapped with a non-default POIndex/pkey.

> +	ptr = mmap(NULL, size, PROT_READ | PROT_WRITE,
> +		   MAP_PRIVATE | MAP_ANONYMOUS, -1, 0);
> +	ASSERT_NE(ptr, MAP_FAILED);

Doesn't matter while there's only one test but we should probably
munmap() this when we're done.

--8gHwo4h6itunB5YS
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoO6vUACgkQJNaLcl1U
h9BITAf/W5tXsBU0Xh1izfDnu9SsVFj3BAtEWDHZ6vzUNNcsELP8H0KaA5ocwt3v
rcby3YsdoKQuf7QBDyZlOdnSVS2Ih4QXr4bTGPPVaq3ksEob9VyI2f0gT8Yeiu97
xRVS1Kn3yCe3s4tnvkjcmlJ/BOSuAKL+AsRttUsTRft6CKrcZ1qR+0VY6S9XRu4o
2zydOkryzlr6LX2ulGks+SfoBVuTVMRaQ5lIL9Aa3MPBiYchsuSHhcHG3coB/y0u
4Fx0N/ZguVYCE9yyYY5pqieKuBcBMtzPu0AXcmrqrXIxHiBJj3ZJeVZSidokZdNl
a9gX56dETStqiF47IP4HjxXvv0qCog==
=ZQZV
-----END PGP SIGNATURE-----

--8gHwo4h6itunB5YS--

