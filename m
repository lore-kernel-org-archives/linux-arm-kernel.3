Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 319C6CD5BD5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 14:13:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=cJPJU4tbAYEX1ukh2P+hlLCnXB/TI8A9zswFtwRlV/Y=; b=IYwLf+Ge8xZ8bQlSmRwBM07+zv
	y5V+lbIpLPcROK/6LCM0F36QeHsygGrlPCKbozpFAnqHr5FOWhbpdF8VImAJdYCSDKczAXqkZTvuq
	JU5pEvQD+udYpN5wlzRsMIl/33nrB/8CeqE7wEJxb5AzdYXGuwGZIHJJyH6rCCMGX4T08mgvmea3Q
	WEYXCd7KHqORYfErpNi2FczIV9Pxf1aD513p/5uuwNAcj9TNBjpWqVunL6E5Nc5XT2vvrpWZBWLSw
	re3n5vGJ/DOoeGOu9aSwqMrknSnC0Y8XfHixugs9mKYdsaf2famWcQ2jZsfcZ0PGxXx5KBoCe9bE2
	Ze/QceyA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSF0R-00000004GjM-15zt;
	Wed, 27 May 2026 14:13:11 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSF0P-00000004Gid-1DBa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 14:13:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9EC35601E6;
	Wed, 27 May 2026 14:13:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 857B91F00A3D;
	Wed, 27 May 2026 14:13:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779891188;
	bh=cJPJU4tbAYEX1ukh2P+hlLCnXB/TI8A9zswFtwRlV/Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=aY21OfGrasXmEYj9vQYyvhDko6du7jdhVAjAr8Qo420sBhRgRDmU+HusuvFqczNMq
	 xPGCr/TrC5G9KgZPdj9xgDtThoWBg6RFMJDERsJLgf+kO7ehYxtGtsJxM2ZWzMiVeq
	 ebistdsym/hPqAerfJoZssQXZHSNOzvoqvTShYYNWz//p/4hjeQCb4N9RFAwKW5Fe1
	 ZmFXUa9r78Y5g9vMy8T5bESjhm9uQlqow9jdJiLj+AEXylSF++SSD2QPjQI2Z52vA4
	 yf1hhnNS/NkUYsCbnJrhchbEXBCSUTBATxfac+RHbhvEJ0dWtjaEcL0z/Wl8avz5xl
	 lBu1CtRHhmBRw==
Date: Wed, 27 May 2026 15:13:04 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 11/18] arm64: fpsimd: Split FPSR/FPCR from SVE
 save/restore
Message-ID: <4bcf4ec4-6c82-4dc2-b96a-a3a76340ecfe@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-12-mark.rutland@arm.com>
 <0b72df66-2914-4537-811e-2080e0a7ce6c@sirena.org.uk>
 <ahb20fXkdWI7SljE@J2N7QTR9R3.cambridge.arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="8ouGmEJHyeUZhv0D"
Content-Disposition: inline
In-Reply-To: <ahb20fXkdWI7SljE@J2N7QTR9R3.cambridge.arm.com>
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


--8ouGmEJHyeUZhv0D
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Wed, May 27, 2026 at 02:51:13PM +0100, Mark Rutland wrote:
> On Tue, May 26, 2026 at 05:28:21PM +0100, Mark Brown wrote:
> > On Thu, May 21, 2026 at 02:25:49PM +0100, Mark Rutland wrote:

> > > ... so I've assumed that this doesn't actually matter in practice, and
> > > implemented the C version matching the existing SVE assembly.

> > There is a possibility that it only matters for older, FPSIMD only CPUs
> > or just that nobody got round to benchmarking this on physical CPUs with
> > SVE and in fact a similar optimisation is also useful there.

> All of that might be true, but that doesn't change my assessment that
> this doesn't seem to matter in practice, and given that the overall goal
> of this series is to *simplify* things, I'd much rather err towards that
> than hypothetical performance concerns.

This could do with more clarification in the commit log, right now it
just points to us not having done this for SVE but that's running on a
rather shiner set of CPUs (and likely written without any physical
implementation available) so that's a rather large jump.

> > I'm a bit wary of dropping the optimisation without any verification
> > of the performance impact, but equally I'm not aware of a specific
> > benchmark that showed the impact or even if there was one in the first
> > place.  The changelog sounds like the optimisation might've been
> > written based on inspection alone, I don't know if anyone will
> > remember more than a decade later.

> From what I remember, the changes in commit 5959e25729a5 were made based
> on intuition, inspired by a contemporary retrospective change to the
> architecture that made FPCR self-synchronizing. Previously the
> architecture required a context synchronization event for the write to
> take effect, but implementations happened to be stronger.

> The conditional write isn't necessarily a win, because the cost of
> recovering from a branch mispredict can be much larger than the cost of
> micro-architectural mechanisms to ensure that FPCR is
> self-synchronizing.

That seems likely from my read of the commit log there, it smells like
something done from inspection rather than because there's an observed
performance change.  It'd be good to put something like the above in the
commit log since it's a much more relevant analysis than the comparison
with the SVE path.

--8ouGmEJHyeUZhv0D
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW++8ACgkQJNaLcl1U
h9DgHwf/URmveagI56O1UH0OmT2rDV24+jtw1D49QQ/kZxghFUzyrJw9gM8j0zfo
zj/LlzpJF8Xnuuyp7bh0BC3IieJn7L5etrlhVVsJfI52cYVF0YbU26EfUFEGmJzt
kVogO+l3ZUPJrxr9KnY3PpGwmLl7+4ldzOZMTuuyqFicp39hw+57L/rrJl850XwE
2C9lIafie6XpxoxwCFtDSrOIu7CVW6y8mWo4fPYMv77O1l5e+t5+PmBWBOzrPxnm
95WnMKl5XrYXxdu5bBiv2dnJibYoumtOpnKVBRldTbVa3aAEAaf4Pugd+v6949F1
ZGmuTVn7m0mnDdH87bdm9T6PdiBgLA==
=2zVn
-----END PGP SIGNATURE-----

--8ouGmEJHyeUZhv0D--

