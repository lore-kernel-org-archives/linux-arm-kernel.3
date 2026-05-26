Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26503CD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 16:54:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2IIlpLx0gVxMf1NX1FfVzjs2W/yK8aRs/Ll1LDgBL2k=; b=hL5yHF16eSrTEtoeytcTrF1Y0a
	djJSxoYJdwMiKje6TCnflT4Ad1KC72WWqMiWfKKWMQm0NO4GvlOhSMJGgb8fhqUSizrITWPt2QAxB
	1nsdv+ueKhMx+pK87Y2Xqe7L/eV12BcEqhjVko7T8vlPSlVDikL5ZzaIqwR8wgKjYQYYt8Fs57gmt
	qGIwVrlhwxnaUB0qkU376uPJeLRafUjBgwqxj8VX9s4WtBU57MHRxAcbq5b/WziNKvn6SRq5bUWdn
	uFU8Kdrx2eqkV52zPWDOkztRScz21GX62642e5L88DrnkpZHu1LNPyEEK4CKtPypdc1EkXmORIwXS
	LQ8AOaLA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv2h-00000002c0E-418l;
	Tue, 26 May 2026 16:54:12 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRv2g-00000002bzl-0K5n
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 16:54:10 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 85B86600AB;
	Tue, 26 May 2026 16:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 802721F000E9;
	Tue, 26 May 2026 16:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779814449;
	bh=2IIlpLx0gVxMf1NX1FfVzjs2W/yK8aRs/Ll1LDgBL2k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=C1/TG0EDeggoAqtI2uQdIQ66PF4Rn5aFdPojqDn6eD1yqtrYN1Ou+8Zd3bLftyXbh
	 88fNbWbnDfpyoN6WdL9yNiyB0VzqmtwY4uqpUIiqNMpjByeFkzBxgo50FQavPObmfU
	 AuVycqk7LXr6aB1lw+MsEXbwjujjsRNBOfZ732STmtxjIaimXf9Z5HmnA5Gj5dlf2j
	 cBQ9SlOVA6UGCWesn/FvaNbTGvFnmUN2wi+3NBeyPGnrSNwnyJxWZ3idMDZfZFJNi1
	 7KRTCJwUzhOXjHCMU4GaH6R1xXyxXed5B+/BitTBRiU8AK3oBvyCo0DkJ794L1+mTM
	 CANxyZiwlCvBA==
Date: Tue, 26 May 2026 17:54:05 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 10/18] arm64: sysreg: Add FPCR and FPSR
Message-ID: <ab133439-fbe6-43aa-915b-3c86903dadfd@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-11-mark.rutland@arm.com>
 <458fcb4c-46a9-49db-a179-9081d7d50dbf@sirena.org.uk>
 <ahXPqSPB5CEUbRdz@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="qOEWLsYDc6kbwQtt"
Content-Disposition: inline
In-Reply-To: <ahXPqSPB5CEUbRdz@J2N7QTR9R3>
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


--qOEWLsYDc6kbwQtt
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, May 26, 2026 at 05:51:53PM +0100, Mark Rutland wrote:
> On Tue, May 26, 2026 at 04:55:44PM +0100, Mark Brown wrote:

> > > +Field	30	Q

> > DDI0487 M.b and DDI0601 2026-03 both call this field Z.

> Sorry about that; fixed locally now, and I've double-checked the rest.

Yes, I'd also checked everything else - sorry, should've mentioned that
it was only that field.

--qOEWLsYDc6kbwQtt
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoV0CwACgkQJNaLcl1U
h9COlgf0CGry2Yvb0LukONvwzgnJ8onH91aYm0sqTr9N0i70Yj58xnyEoKc5CkZU
4vRvoOYL+lVJSb5gGfSuBOkUjvH3ixcEZPr75PLo1vjsS6tNGnUBhVPwI4jc2J68
1qbuP0UIhfk75E368Ydm0Zqn0tyBlqtrfORmlNCG2s1cL9xCpewf9ck1WhE4wLwx
wy0+TQzSu8ZtrxY9IVZx5ARcgeHyYr4AQlPMHD3T3JaUxzgxvmfmGu6Yy+P7sf0v
WiI1XeOWlYGZH5+emnwHMFq+0gdUuOIPl8nWYUD56pMrlOVevetZgLRu0E0N29wH
zoDzFkwTTgHGcnHPBD+DgvZiUtFd
=KwTI
-----END PGP SIGNATURE-----

--qOEWLsYDc6kbwQtt--

