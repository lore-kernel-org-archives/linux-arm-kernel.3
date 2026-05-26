Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66955CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:53:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=jK9jcFq1vc07ukH7wHSulTaGgBefpAjVxgzyk1JHzbw=; b=sTA6N3NJaTIyuTC8u8ZZZm4yOq
	DQzW4skcAGqH/dc6DdPelkVVpwO+B/DXixMKANHrFY7dIw+6uP/eeHklhjo4mP/DwxUubkkW18W0+
	BlFOzMFFSnClmab8eJ8+4x19JCvKwobW6H78sY/fDp26G81QUwGhuG0CisSnyEkQbCwaKl3TAjVxi
	g0ACFbAF3qOd/iLpKX8y5irw2yTtr6Szcqu71pWtJsoPy/U+RqwuF7so2ueLfgrxgguWbQNK9VU10
	dv/Ym7rIG4LoRXJQGc3eXZatgYXmHUSdiWHEtw3WgLJMxsjJaxMIw8CyfHLzNMx4TZujsIycErYRV
	mJspN0Bg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv1q-00000002blT-3A8a;
	Tue, 26 May 2026 16:53:18 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv1p-00000002blC-2vFq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:53:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0010160018;
	Tue, 26 May 2026 16:53:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id DC7F71F000E9;
	Tue, 26 May 2026 16:53:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814396;
	bh=jK9jcFq1vc07ukH7wHSulTaGgBefpAjVxgzyk1JHzbw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=W6xB2+c7RYJyl40lpiS2IpzQY8q5QSb62k/MClm/j5R71ayZ1/45QmedNZeON1GtG
	 TUXkU1mrZQrY6IyvDUeqC/vUW05ALiyAV8Xk7S4AzoiUKGwNDk0hy6pKbxWq4RunJ1
	 C1bgGWkfNXgfMlql0YyjIPB6hYpitwMXZs448wlaZLNHDpVURg9qsqpufRruYs4ASS
	 Giv6/68wVItfOIp6SZDUnoxoJaty77KrkE3g2WKSfLltKlt58RjPd0LJYcyN+VwnuD
	 tx0wfspqBg/x3AUf8rAUtoskrq+pf8Vapjjhe/b0lPcqQ0CgF1TnyFGPtNWJ8Cq0PE
	 W+UktFjGYAE+Q==
Date: Tue, 26 May 2026 17:53:12 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 13/18] arm64: fpsimd: Use opaque type for SVE state
Message-ID: <5040107f-dd52-4021-a93c-1440325fe033@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-14-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qLyeM/IcLOyxcZsW"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-14-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
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


--qLyeM/IcLOyxcZsW
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:51PM +0100, Mark Rutland wrote:

> As the SVE state size can vary at runtime, we don't have a concrete type
> for the in-memory SVE state, and pass this around using a pointer to
> void. The functions which save/restore the SVE state have a very unusual
> calling convention, expecting a pointer to the FFR *in the middle of*
> the in-memory SVE state, which is also passed as a pointer to void.
> Passing a pointer to the FFR also requires that callers find the live VL
> and perform some arithmetic, which callers implement differently.

...

> Improve this by adding an opaque 'struct sve_state', and consistently
> passing a pointer to this, performing the necessary offsetting *within*
> the save/restore functions.

This is much more ergonomic:

Reviewed-by: Mark Brown <broonie@kernel.org>

--qLyeM/IcLOyxcZsW
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVz/cACgkQJNaLcl1U
h9D4tgf/XYMJ18LR7+UOUtuyLBF35gpK3kMYzRv8PyJ7gD/VV/VZpxES43FguMmz
2oVFV2Kzdl2pUo6tvqe9OV71SC5I07Mek0ZZy3JG89GnEGZd/a1kCuXCvahz8WMc
jx0bBCtqH3Y4rSTXyNtqtvHxghCxKcmyRpSQ2ohGsOcII1u2oq/m6GILNxuBl3Xh
g22UUTV8grDSENv6cA3YU7meK7P0j2yQbg+9Me6wgmCzVNne4nUSNbvmYl3ImOel
PoaUMhylg5+CjPP3vIShRYXPNMJVQ3/jRP2sHTTfcAHOy2CUe17EL32HX3LRg1yK
jQZi9jwxgxrZox8rl4Kd9dYxuEPeOw==
=vK/5
-----END PGP SIGNATURE-----

--qLyeM/IcLOyxcZsW--

