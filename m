Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D9ADCD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 May 2026 12:54:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=YuKRZliHAqjx6BUMVNCWGaJCofdb60yHGpb2RM+7j7Y=; b=V6E2nXREzyjNxr5l3ArxVMHrJ1
	MuIIuCKSFR4TcHRFz88EszpCKZz/0+fryvYJ2TNHWL0P1twIYjWnLY9RKg4JFko7Kq+j3m+Oc3gfH
	EN+1w9SpMohnr0d5PXdwG/ZpQAyu93MOxlq4nblUk10Pr8ysxLUOtd1ylsS+AD93ZRjgY3n5A0fBw
	hzWyt5a7rqgctGao9WD2P9wxPKJn67kJS8txQJyQosxKUkjeTcW9FrW1qghy5vaX5IKVpsfGMVfAt
	TPRfXcRlLpxC828CnPpse+AUwLdUzVXlLJGhn6r7052n8EXcwkLuMV7XREKJLA9nCOFLoQt6s5ma6
	xoPlk9Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDmc-000000048VF-1lQM;
	Wed, 27 May 2026 12:54:50 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wSDmZ-000000048Uj-2a0s
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 May 2026 12:54:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id C453E444B7;
	Wed, 27 May 2026 12:54:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D14A81F000E9;
	Wed, 27 May 2026 12:54:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779886486;
	bh=YuKRZliHAqjx6BUMVNCWGaJCofdb60yHGpb2RM+7j7Y=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fFJV5b+TWrN3RNrwSxDnyQY7OaE4GfOtu1Ds9oCqBzzwHSjJJI9BS0rSNJjGL9+Qu
	 Us7Q4ZBMO6WijdXPhWzIPOqK+Fh5T+S16kP1tSUf8W1uPIjgKOW0iujsDc5pqv044t
	 jSiIqaGxdVioVQ42tuOBxM0sAgAqetFQZEhJj/Mh8D4hABUHhEvQ78qekdYv0J/7mq
	 CO/+frZTI3aUulhQv4tvE/sHRfQvxnxi0QIc8jAVzdVgjlJ/u8msDb0lhWVO1s75nr
	 cz6VLy455LOhQVJ8kk4fs9PJ+X/6ABDK6YoD4YMZSwMcid1bSdgsY3aldXP2/LC0mE
	 sd/Y3WnAq+mBg==
Date: Wed, 27 May 2026 13:54:42 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 16/18] arm64: fpsimd: Move sve_flush_live() inline
Message-ID: <0f34443d-222e-42d3-b6c2-d15bb656e1d2@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-17-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="4+ysNe/tZm5mxePQ"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-17-mark.rutland@arm.com>
X-Cookie: You are fairminded, just and loving.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260527_055447_677052_EF7A38E2 
X-CRM114-Status: GOOD (  11.80  )
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


--4+ysNe/tZm5mxePQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:54PM +0100, Mark Rutland wrote:
> Currently sve_flush_live() is written in out-of-line assembly. It would
> be nice if we could move it inline such that control flow can be written
> more clearly in C, and to permit the removal of otherwise unused
> assembly macros.

> +static inline void sve_flush_live(void)
> +{
> +	unsigned long vl = sve_get_vl();
> +
> +	if (vl > sizeof(__uint128_t)) {

It feels odd to use sizeof(__unit128_t) here rather than u128.  Whatever
colour the bikeshed is:

Reviewed-by: Mark Brown <broonie@kernel.org>

--4+ysNe/tZm5mxePQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoW6ZEACgkQJNaLcl1U
h9B/tAf/Sz+I/JD1zptA+eebS3b+2KUNdmhU9v1tYQv1ybjUgTZDI1e28ZOlBN5i
m2uZ+JWuQf5tjj65PsrZilL31VwJZ8otZHMsW1SuaJM/9Ldmf4gBaWIXbWvBmma5
Stb+tqx1f9A14uFnFE4l7DzGo45lncF3vmNmY/P18834G2jyxSikQWZ8S4L8Y2YY
W3se6X++e6LuLiQVvqN/3rZ7kM2ULC7R/D7kESnTBdVDsDtTV/KRm+CazdmkA7tB
Fe9cjRYZJP4PFJxf5zmk4VgZTl+o/Egx7R2Sh2DeQgkKpybSimlXuRTMAIk79M+Q
JE9Ar7145yRHZXXikh6svKALtk5Wxw==
=vuzK
-----END PGP SIGNATURE-----

--4+ysNe/tZm5mxePQ--

