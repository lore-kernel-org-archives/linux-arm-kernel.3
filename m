Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE39CC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 21:27:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bg9v/G2dn/2s5d+LUoOvXyvA9Yb9yYQ7XkamQksyPFo=; b=oZ/MCYIiCJpVEIBcB62MT1bG4w
	SsJgI0cy93bV3d5sOO+KThOxoggf74WDKETLQAalU1rdLzF6VboMC65oecx0ELpUk9A+WtereC9u2
	xrKCjA55LTGfyy2y8drBD1VtvmezKx1WDJ8cMMnEqC+yuJfUFDCZmXBBaUxtBaFFoNJK2jV6nMRTM
	JSWtN4/NDMQN2vSPjcAchInRsBcXNXZFtOrRUGFDvOJ1NyZ7tM9EHCYKUCIXH91JyY/XsNQ+x4GUo
	fZTBe6Su27K1avBnYcez5hq/nA1yl07hALuj+Z2OECIZ5DmKigwBfch+70Latz3VX71o4kh6yFekI
	aEBwfWoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrj93-00000004ZgU-0wll;
	Wed, 05 Aug 2026 21:27:25 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrj92-00000004ZgL-1xR4
	for linux-arm-kernel@lists.infradead.org;
	Wed, 05 Aug 2026 21:27:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 5B74543CBB;
	Wed,  5 Aug 2026 21:27:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 382BC1F00A3A;
	Wed,  5 Aug 2026 21:27:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785965243;
	bh=bg9v/G2dn/2s5d+LUoOvXyvA9Yb9yYQ7XkamQksyPFo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HKgPYbPuKwiBQ6yG+tcofF9mQxMGVqQebLm/vIjp7Vhu1iOQB/U4GYf9LEFQMj92u
	 y+LRgVZVJ9C6LSxBKqii8s2lfuz6PQJq0Us+tUK3IKpM/UMF+r7tt/lYPDQobFbZSX
	 w1MgUXrmtmaQnPsomzuYaOv4vcjdYxr6HjjTYivz3kZ9r5IlJJwPGzEZw93MMZHpxJ
	 30NSvkmw9T+1KTnuqfEM+TFM3END8/CPNuR7GOCuWtPhlEdFGpnAHJRdiH2g3dMD78
	 RiFeHO867xz7cdngVdf7jejjjO/mlIpHiRhiuQsd6Wgj7HzdOencNsFRiKtSLZlqgS
	 a2PJzdMCaSz3Q==
Date: Wed, 5 Aug 2026 22:27:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Karl Mehltretter <kmehltretter@gmail.com>, kernel-team@android.com,
	Mark Rutland <mark.rutland@arm.com>,
	Oleg Nesterov <oleg@redhat.com>, Shuah Khan <shuah@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] arm64/fpsimd: ptrace: Fix inactive SVE and SSVE
 regsets
Message-ID: <21702e5c-2dcc-46ad-bffe-26cd76d844b9@sirena.org.uk>
References: <20260729004255.15630-1-kmehltretter@gmail.com>
 <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ScPQ0QnzpWtbhx23"
Content-Disposition: inline
In-Reply-To: <178566413306.4141663.7146790540592743319.b4-ty@kernel.org>
X-Cookie: Stop ahead.
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


--ScPQ0QnzpWtbhx23
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Sun, Aug 02, 2026 at 01:12:24PM +0100, Will Deacon wrote:
> On Wed, 29 Jul 2026 02:42:54 +0200, Karl Mehltretter wrote:
> > sve_init_header_from_task() takes header as a pointer, so for the
> > inactive mode

> Applied selftest update to arm64 (for-next/selftests), thanks!

> [2/2] kselftest/arm64: fp-ptrace: Fix checks for inactive SVE and SSVE regsets
>       https://git.kernel.org/arm64/c/bd290e7fc245

As noted in the changelog applying patch 1 as a fix and this only for
-next blows up the fp-ptrace test rather impressively in any
configuration which can generate headers only reports:

   https://lava.sirena.org.uk/scheduler/job/3075737#L3231

for the release.  Both patches really do need to go together.

--ScPQ0QnzpWtbhx23
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmpzqrUACgkQJNaLcl1U
h9CHvwf+JPxMnonETncM/dMoMV4Fnite0HOpnx90jSgLB+FXAJEAuZbLbD3gLMx1
1iZSxmDzd1b2XQVNHMNOe0lIaqDiAZus+56/uqzZa6o4ge96EPadpcb/VnqP9JVf
wtV4884afXz1mKtMlsUC7eHFGbcFx21MY2kXiOK0XxDcd0Pk7rNupFYZw3eSrXxw
4jNHz7FQhpEYIll3S89vrVZ9EbZ8c1r5p/b6VjoIl6LFynQVeKJPdBRNMWzfgdci
G2WjVywPRVsPNyPyJLvZ96ZASHByMUcgXwnz5Wajm8zKSnKOS8kuKn4UthYquTys
WKwq7EN4Y/CkgrGn8nyWHxW/ld43jg==
=IU1t
-----END PGP SIGNATURE-----

--ScPQ0QnzpWtbhx23--

