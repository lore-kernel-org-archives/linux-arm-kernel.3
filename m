Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E809CC0219B
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:40:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eWp3/7u/YGZGIa4esPL/qdeKIFhCL8Y51K+5X7MdHlg=; b=dMTvnKFlv8gELXB1F+SY2c/gnq
	hYTbwp8WpeozTJoMlnDa9DzY6abI6/UUYjxsr9VYFX6CVEaXy7nKIZ43xcmnPA+EoY/mhHYuOzQQm
	DtBD2o5hatVx18DihWzRgpa4Yadmahbdvj86Tumh+lLleK4bNHEAjj4wm4wWkqrswryg0MX0jGYSJ
	muChLUiUVmwTT3bA3ve9HH1AAq8bTJq+T9REaWNCArK1Hs8KdBtjO4lqJTSqUiiqPPcaefdmiCBED
	lCVSV7K+AFo7nMqQjyptl9dlXcZAek8ZCoIwpS+oboRroZlCUZfHmrH01i1TGIrJeGZBV/ID1Gn0V
	mYixm7EA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqUX-00000003z4w-0znB;
	Tue, 11 Feb 2025 13:39:57 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqLO-00000003xGD-17u6
	for linux-arm-kernel@lists.infradead.org;
	Tue, 11 Feb 2025 13:30:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id E316D5C177A;
	Tue, 11 Feb 2025 13:29:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0EB85C4CEDD;
	Tue, 11 Feb 2025 13:30:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739280629;
	bh=eWp3/7u/YGZGIa4esPL/qdeKIFhCL8Y51K+5X7MdHlg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n9gqu24NHccx3CJwhPeIbz+oIvdMFCOC9QlPIZv22uUw4yW754WoHr3i6ZRQ7Pb6m
	 q50KRyWph+Zz2w6RHWGtNDzciBzuqtax11vFLj6waBLqD8yq4LVF2Zg8H3zoSuKj73
	 ao0nLUmWKSRMLXkHzCeA5skOaDs1bGgrR8JYmMbEv4kVAvfqnfJWhznOnIhRVmvXSp
	 1xzy0pFEEduTAyGLg6AJshCNI6viDs7iGFCqQMBziUTRAwlqe3Jsa2STefG4nl1Qor
	 NZJy94G1QGS0EdxV04rl8su7yf3Kv5hQfsw0OPsqdN2lJ4VFwuCltqr72HYz81pNDZ
	 HZXe21VwM2xzQ==
Date: Tue, 11 Feb 2025 13:30:25 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH] arm64: Add missing registrations of SF8MMx hwcaps
Message-ID: <1be1b5e9-9aa9-4f1c-9cdc-c4bf94f2dbc8@sirena.org.uk>
References: <20250210-arm64-fix-2024-dpisa-v1-1-d77f43c7b253@kernel.org>
 <Z6pHPKXXnQ1whg57@J2N7QTR9R3>
 <dae7f7b2-f066-4adc-974b-54649ba69306@sirena.org.uk>
 <Z6s2iMP1LbdsYX12@J2N7QTR9R3>
 <bec2a37a-1797-41d2-a44a-a34a54a96f89@sirena.org.uk>
 <Z6tNiIMIhN5fPSJM@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="FpVZgrr+qSAHu3wx"
Content-Disposition: inline
In-Reply-To: <Z6tNiIMIhN5fPSJM@J2N7QTR9R3>
X-Cookie: Printed on recycled paper.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_053030_347471_5E120E17 
X-CRM114-Status: GOOD (  18.50  )
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


--FpVZgrr+qSAHu3wx
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Feb 11, 2025 at 01:15:52PM +0000, Mark Rutland wrote:
> On Tue, Feb 11, 2025 at 12:58:10PM +0000, Mark Brown wrote:

> > Well, I was actually intending to send a separate patch given that
> > otherwise it ends up looking like two different changelogs in the same
> > patch and the diffs shouldn't overlap.

> It would be simpler for others if you sent a single patch that handled
> the three hwcaps that we failed to wire up in commit 819935464cb2. That
> way they only have one thing to track.

> I don't understand what you mean by "two different changelogs"; surely the
> commit message is a trivial variation of the one for this v1 patch:

My first scan through had made it look like there was more stuff missing
for FPRCVT but now that I go to write the change that's not actually the
case, it's different handling of the different ID registers.

--FpVZgrr+qSAHu3wx
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEyBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmerUPAACgkQJNaLcl1U
h9Canwf2PMWht5FD5jL70uPgRegmvsxuqGuFL+om4rJ29M7MvxSFKsMWR3t7DEAN
sCxfPXEz6vW4+pS1w2nadqCMnyfn6dINYQwDeolVIn6apD8lf2SlzeY+XrZT8YiH
tJxBHYnjOz3Rk0HG8vLtp9eeIDsQ+NlUXXzr2658POQ3FLR3qI6Ekp7jzd+KEpbi
OjgkUWf7zyvciwMwpzXmgN15fTedVixZRYNt/cwC5d286vVcBOi8M5PGzYR2Sh0i
CevmEdOi22rMmTlR3ObkXMlp7DEK3tZ1VunkBFPn6h94i+A4ZVwPRf2vbzQNGROJ
Q7NRWHwGCb4dDpkR2GBbcDULF8tm
=qyk9
-----END PGP SIGNATURE-----

--FpVZgrr+qSAHu3wx--

