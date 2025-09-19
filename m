Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42825CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 19 Sep 2025 16:02:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w73svW2MCHh+dM/RM9nKKSF7/QBMrZkqdV86ek1OZ1I=; b=Zmt3XaacUwqlVVDtQ4DBqVQEhD
	2B2ca+otZWrs38NsnGmJYv7u1xp05F9kgxWID2ZSA6JyzOIFUtSxokuTDK9XvqUEAGZHLM1s06jd0
	5CY/s7jJnI9AefP5aMLIbIMDgdVqcHOaJrdc3bGJ70IGandTNuGGg3atH4HGfMhyzp8HacI2rRx6g
	UzTqzSXZuMFsJkuMPVr0CLSacbnqFu6sK9YQWK6NLGnD8WTfBNFu3/N8wLT1h5yJ1QFurmUNYDacV
	IBmenvdYR0y3rit6ozmob1SePPhbGAJfubpdcvhgfV9c2DaAjVmlpuKyGMRf3BSCFNVjbBK8M/v+3
	0is6TcxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdYe-00000003SGx-3PJP;
	Fri, 19 Sep 2025 16:02:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzdYd-00000003SFz-0Dvg
	for linux-arm-kernel@lists.infradead.org;
	Fri, 19 Sep 2025 16:02:00 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 79DD7432AF;
	Fri, 19 Sep 2025 16:01:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 2FF34C4CEF0;
	Fri, 19 Sep 2025 16:01:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758297718;
	bh=w73svW2MCHh+dM/RM9nKKSF7/QBMrZkqdV86ek1OZ1I=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=HjT0HZ/Sgh6IGLK7OHg8G7bMNIvL2ZhONBPeN5WO9nb/JMqQ3yW5YoBL8npqRSTa7
	 2zh/8Ue7K4of89smCAsFGdJd9iHMDv69B5IqSY8lXsW6BdaZiWNy3xqC4m04C0tKII
	 rEWIqn/rrlJJLzh/q5AQNZnu8tE5kTld3+AzxfzZXZ500neHksVKQwAfo4YO/onXFL
	 ntr8Fblmm5vSeruLByepg7xnqBNoVBpHyQarVL2L3MWHsmM0yFzqz4Y/JXigzK568O
	 sQuBQipyQ7wl4+/opaPs8ts1azmufDJTMJ1+Gb64IDxZp4SOFAZ1dsLRipl5BzbzNf
	 9PDp0AmnKMu4A==
Date: Fri, 19 Sep 2025 17:01:52 +0100
From: Mark Brown <broonie@kernel.org>
To: Ard Biesheuvel <ardb+git@google.com>
Cc: linux-arm-kernel@lists.infradead.org, linux-crypto@vger.kernel.org,
	linux-kernel@vger.kernel.org, herbert@gondor.apana.org.au,
	ebiggers@kernel.org, Ard Biesheuvel <ardb@kernel.org>,
	Marc Zyngier <maz@kernel.org>, Will Deacon <will@kernel.org>,
	Mark Rutland <mark.rutland@arm.com>,
	Kees Cook <keescook@chromium.org>,
	Catalin Marinas <catalin.marinas@arm.com>
Subject: Re: [PATCH 1/5] crypto/arm64: aes-ce-ccm - Avoid pointless yield of
 the NEON unit
Message-ID: <cbd5247e-5c57-43cf-93a3-ec3a6631a509@sirena.org.uk>
References: <20250918063539.2640512-7-ardb+git@google.com>
 <20250918063539.2640512-8-ardb+git@google.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="wKXztv/NdWB6IIby"
Content-Disposition: inline
In-Reply-To: <20250918063539.2640512-8-ardb+git@google.com>
X-Cookie: Don't read everything you believe.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250919_090159_111115_B8BC3BA2 
X-CRM114-Status: GOOD (  12.01  )
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


--wKXztv/NdWB6IIby
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Sep 18, 2025 at 08:35:41AM +0200, Ard Biesheuvel wrote:
> From: Ard Biesheuvel <ardb@kernel.org>
>=20
> Kernel mode NEON sections are now preemptible on arm64, and so there is
> no need to yield it explicitly in order to prevent scheduling latency
> spikes.
>=20
> Signed-off-by: Ard Biesheuvel <ardb@kernel.org>

Reviewed-by: Mark Brown <broonie@kernel.org>

--wKXztv/NdWB6IIby
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmjNfm8ACgkQJNaLcl1U
h9DIOwf/RW889nrpAPtx2QplJTo+RH/40Ch5TIVuvSF+yWtsPuoEyDbHp/5LDfNF
EBtMLQ08UICuOq7NVxKqcsBt/c5j9aBPwhovm1THuPXzIPd/KwXK5dNBWCaJlixh
W9OXRW2xR8DYu4O0MEE11AOzTySYPpwaVGav/YmoVoqRQuDituYaSg593ztQUpqd
8cCmTbf5+i4J41vFJ9PGokeGSDxTILTe4lW7Ix6Z+SMOhveQZfGL/kqnlefLjiW/
1VXsMleQf5/MDZ93Ueac9ia9WiOC6h0/TLz7t3Vh9KeUNqhvLmKRVcyxizLID5b7
eDscvtf2T5KlrfYEpeY/5uzv+gWnfA==
=o8Xv
-----END PGP SIGNATURE-----

--wKXztv/NdWB6IIby--

