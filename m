Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C1AD3606D80C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  3 Nov 2026 14:32:37 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=jdgbcJrW;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=DKVEd4PM
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=7YeBUoduV9i0criXGTf+9dmDhZBep0XJ70xJrOAzPD0=; b=jdgbcJrWi8mQxNLiFYjAHpApCh
	7Kl7gUf/Yo7Gzf5EgY5qz4oGHU9V2SYnvbzbrUU3tXPXQXV008fUopunLnI6p1/LiD6/cGbZ3wBkJ
	qRd6hs3usY/z40LdUrGapCdLmXo9syfyyWoUf3N5s38ocRxMwCsmwarcCR257e4rnR9VxdVySoYjl
	n83Jd17tnsIY9yxky5Ots5lziNsYK1FrrHBPZ8D30zdPb88y+tRMAVk8aWPJDCHsrBQWcQfNGrY5I
	ZRi38KbXkohi8qkr6WMX+UBpO0+GuzEfvwf4ctOcYRJxC953VSNU0NfR7s0oLa10dN17p84GtO/9u
	3SVAgREA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFYt-00000002jE2-3APD;
	Tue, 03 Nov 2026 14:32:31 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOFYs-00000002jCs-17A2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 03 Nov 2026 14:32:30 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 4C57D60008;
	Tue,  3 Nov 2026 14:32:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E7C081F000C1;
	Tue,  3 Nov 2026 14:32:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793716349;
	bh=7YeBUoduV9i0criXGTf+9dmDhZBep0XJ70xJrOAzPD0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DKVEd4PMfoRhizRZ4VS3HcjuNH3u1m2VdxIx6DkdCRuAWTZhNj0SZv/KDdK/Toj70
	 NJHKXeBKFu8zSe0gYcUZ6QmTbXqrSZJcEzVmbDeu/62UeMOjn4tS2gL+Ag8oN7RqX6
	 ENj/cIXha8aQsB4rWkjyJnhOKbfR7OmWJv5v0DHM58HcU2MszMW2pReeh0Eavqby/t
	 QXAvrm74+cwvGES5lzbJXz9WrKA0zXeiMDfsfwG7sGx9+gag5Kfu3rTaVyOZR1BNYN
	 g8ZQJ122fkqJZczITWUx4avwlYCzHpIehKL0KJDfL2JqIyJzs+q4i1jdk1rw043Z+M
	 9WLTZUTCkWkPg==
Date: Tue, 3 Nov 2026 14:32:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, catalin.marinas@arm.com,
	will@kernel.org
Subject: Re: [PATCH 0/3] arm64: fpsimd: Misc cleanups
Message-ID: <a86359bf-719a-4990-a7e9-23e1545eeb37@sirena.org.uk>
References: <20261103121346.1858305-1-mark.rutland@arm.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="r9o4O3gds9Vp7O9Z"
Content-Disposition: inline
In-Reply-To: <20261103121346.1858305-1-mark.rutland@arm.com>
X-Cookie: Small is beautiful.
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-10.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,MAILING_LIST_MULTI,
	SPF_HELO_NONE,SPF_PASS autolearn=ham autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1


--r9o4O3gds9Vp7O9Z
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Nov 03, 2026 at 12:13:43PM +0000, Mark Rutland wrote:
> This series (based on v7.4-rc1) is a collection of simple cleanups for
> the fpsimd code. I've split these out from some larger rework that I'm
> working on.

> None of these should have any functional impact, but they make the code
> a bit easier to follow.

These are all nice cleanups, with or without the one commit log nit:

Reviewed-by: Mark Brown <broonie@kernel.org>

--r9o4O3gds9Vp7O9Z
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmrp8HgACgkQJNaLcl1U
h9B67QgAgIChU9P+qvjTnFLGQCmGUsdQ+8i6fvC8MEkgdtobZOWmAgJtlpDefI2Y
ehxIhxeQv1DKA9xaaHWPLGnxu6OGD0DJseMB2NOcR4k5tZX6tiRh261RQ4VUBHU7
2sBDv3SaeliELr8HWxQloZHpb455NE+OVwfDDjmY6gE3EUKVRTnwdgbdR5LtjLej
2Qz4uVjnt2iGpSuV3uhIKFMTxX4tYpxZqccXYzH5AYgIaIqowTFlIBriWY0qWezw
2ds/ik9ChFIgezHk+bGyv0X/fquIVcYnJz9VCnjr2ZvDIX3ClXEtF0ubCSIggSmP
2e+TmjLax2Wu1mYGi5ccbIBSdRAzZA==
=a/3j
-----END PGP SIGNATURE-----

--r9o4O3gds9Vp7O9Z--

