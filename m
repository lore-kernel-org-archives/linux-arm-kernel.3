Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0A63CC87FCF
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Aug 2025 12:16:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ti6x8EpGqyahCD+Y3Mih/DY0CCuqQoST2D+YWQjTsq0=; b=cJ7zwjmd/NDio8z4O4z3Tska29
	WQnCI5nTq7TkaCLaTM+xzXABw5/G6OsaKuB8NdZkgxJ24JcE2b15fNW97Tkw6PkdwqU329Ap9NNLC
	c4hM09nafzwKcrGt7PoRMs6vCA/QnG0c65uajGWpjmpaF0juGuAi4Sj6317Yi05+0eZ1eJZb0Vdbd
	SzaUXpwDL1Q4t4Afh/6XgqPhEblE1aMXgnJ08mmrcUIjKaJovhj5Mlu4fCG8EJBrDJDwS7WcY61LD
	u+Te2MXl7GKwTqlHIiutVcAdbMdPHGRETgaYzCjCL27xJP7n240UpkYPHYVZ6T2foYwk99qkzX9mR
	PhAOZzjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzYC-00000000VZq-3X4F;
	Thu, 07 Aug 2025 12:16:52 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ujzPS-00000000TXE-3dae
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Aug 2025 12:07:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C473601DB;
	Thu,  7 Aug 2025 12:07:50 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 243A1C4CEF1;
	Thu,  7 Aug 2025 12:07:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1754568470;
	bh=ti6x8EpGqyahCD+Y3Mih/DY0CCuqQoST2D+YWQjTsq0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iAkok6Dqgk+74pz/Hwby/2HFzHr3w8rBkiC2KCgO6KRbqmr6ioxzHTbOoTb/byURW
	 J+irFprCwTtl6ENUGKa1MJY1suoq/Rk+4ndfNj2HyjkzLdywuFSBxADG4w60N/ijYo
	 gbqYGBJPeLyW9++948pB3sT9Qw18Z0DM8PUEXlB3WNhLnke0RQzu1dCJg68AS+3Eph
	 IgHuAw1gutqNm+3UzGGCX1smiQZaWPhohTxssJ+XISk7ABLvrr2UtSikMryqkC4hXr
	 1HiyJqL5oPCD6pla2vrxYE8PmWsrMJfSNeVwhVR/R5aAjpIHyYAtxqi2wBeCtClOqf
	 H4sbCYxcD5U/w==
Date: Thu, 7 Aug 2025 13:07:45 +0100
From: Mark Brown <broonie@kernel.org>
To: Bala-Vignesh-Reddy <reddybalavignesh9979@gmail.com>
Cc: anshuman.khandual@arm.com, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org,
	catalin.marinas@arm.com, will@kernel.org, shuah@kernel.org,
	yeoreum.yun@arm.com
Subject: Re: [PATCH v2] selftests: arm64: Fix -Waddress warning in tpidr2 test
Message-ID: <be484cf9-6f29-4102-9f4e-81fde0b752c4@sirena.org.uk>
References: <005af416-66fa-4222-964d-e20bd2eccb7f@arm.com>
 <20250807114247.5915-1-reddybalavignesh9979@gmail.com>
 <20250807114247.5915-2-reddybalavignesh9979@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="1FKV4TcAe1AUa26M"
Content-Disposition: inline
In-Reply-To: <20250807114247.5915-2-reddybalavignesh9979@gmail.com>
X-Cookie: Real Users hate Real Programmers.
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


--1FKV4TcAe1AUa26M
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Thu, Aug 07, 2025 at 05:12:29PM +0530, Bala-Vignesh-Reddy wrote:
> Resolve compiler warning about always true condition in ksft_test_result
> in tpidr2, passing actual function.
>=20
> This silences -Waddress warning while maintaining test functionality.

Not just maintaining, it fixes it.

Reviewed-by: Mark Brown <broonie@kernel.org>

--1FKV4TcAe1AUa26M
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmiUlxAACgkQJNaLcl1U
h9AKWwf/dZAkEEAu46CJ1Sa8y3a7MXpx6X7UAuRiB31klZ2zW9tH4Wo8HBfI2+a1
eVGbKUqf2N9n+J2cQ5YHkIeMDsWsl4gMq0QjXoA6nBcrMf8jSs80ADn/EXBi20ND
HoxcWz3XKmwNkQAkOg2F1QW0W4UQvWoKPPdIuN9sWIV8lq2EknEjwz/ln22r7Ny/
/N4QLDKh5Wnv1lNoyjkM7YA+UgiLT3acNTuwzjcAXiLovCP0Dimd3PMMpbZ2/UA5
KgcUS0fAwYkQsMgETs7Ruqbrkkynd4+sK554mvYLBNZExcpcKSADfa4dE8hEQM6o
hS6rJPP7iTOhAjZlMhcdq7bBswi7Tw==
=nkHy
-----END PGP SIGNATURE-----

--1FKV4TcAe1AUa26M--

