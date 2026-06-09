Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B76E2CD8CA7
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Jun 2026 08:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/Jjdrb+kgVEYIfQnPOp2qRyaJ8Kx6xqpsnvwmfWl6tg=; b=ugybF+sH8ZTbZqjyRW4RdiRp8+
	sqt6wKSehODI1cFJT20/CLQSwHpDCZnBO1rLdl4hWUgI7e6CMeWYF4hIjB+zdr9f1XTS0MaEuMNVS
	UnwKHjeD4jSGvm9jW7O/KGToK1Qa6d/BoQFBnVa3hlLskYejeLWWInRwtTIt1PXU2Xclf3x1rJYuC
	5VJemKy6NHPkBlCZxKPU5gRuiW1MTtFCA5OswhmcA9yNJ2PBkbhkxXmQ4a9ahmfWKwHItPaxFdwzF
	kOVi8Kr+iK4+QIqYJNB9VVmEZ8Z2RnA4qC6Dx3Pu/Xnrnxf31A/Ql20jBlrtgFXNQRAUNtpBW20Uh
	8G3yDXog==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrwf-000000054nt-1A8h;
	Tue, 09 Jun 2026 08:36:25 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wWrwd-000000054nm-2zf2
	for linux-arm-kernel@lists.infradead.org;
	Tue, 09 Jun 2026 08:36:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 0D05E601DC;
	Tue,  9 Jun 2026 08:36:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9243F1F00898;
	Tue,  9 Jun 2026 08:36:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780994182;
	bh=/Jjdrb+kgVEYIfQnPOp2qRyaJ8Kx6xqpsnvwmfWl6tg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GaNXM/KkIZ8XA4DKI0W4zGvC9O/yk7afB69edva3ptTMXTOOMU88k+7xN4EQTFfsS
	 goMePBt+H/B5p7zkayyWL655rVJ8ha8BpmioOlmynPnaUorr0MxOmU+VygLjQZguAK
	 EG1wQdCUqBdGBIjJ4vynTGRqXCcZg+UM9HlFvlUvT6xLN2ziBxEV/snnuVp7RYqxg2
	 nn4QHRX/1BsLZXgdqianTOrwhad1xyeZYGiFdumrcUgXk6uLd6rRwc36kqBjVyLVeu
	 gcfGNXZNoCLumYTS1DRN6QmYyroyAZSX7xt2apYfCTI30LQKKNOxskzcdatJF49ey0
	 AGuVIyefAg3eg==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id BD02D1AC56AC; Tue, 09 Jun 2026 09:36:18 +0100 (BST)
Date: Tue, 9 Jun 2026 09:36:18 +0100
From: Mark Brown <broonie@kernel.org>
To: Nathan Chancellor <nathan@kernel.org>
Cc: Ard Biesheuvel <ardb@kernel.org>, Marc Zyngier <maz@kernel.org>,
	Will Deacon <will@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Oliver Upton <oupton@kernel.org>, Aishwarya.TCV@arm.com,
	linux-arm-kernel@lists.infradead.org
Subject: Re: -next boot failures during KVM setup
Message-ID: <aifQgvnDaGiTXN8a@sirena.co.uk>
References: <aicVyebkEMs6w6UV@sirena.co.uk>
 <87tsrc946i.wl-maz@kernel.org>
 <8eac5e73-282d-4c72-b726-0c5c82fc81f0@app.fastmail.com>
 <20260608232753.GA2993766@ax162>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="K+4Hl4eKWGC3+kq+"
Content-Disposition: inline
In-Reply-To: <20260608232753.GA2993766@ax162>
X-Cookie: Leave no stone unturned.
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


--K+4Hl4eKWGC3+kq+
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Mon, Jun 08, 2026 at 04:27:53PM -0700, Nathan Chancellor wrote:
> On Mon, Jun 08, 2026 at 10:56:12PM +0200, Ard Biesheuvel wrote:

> > Given we're at -rc7, I'd lean towards dropping the whole branch for now=
, or
> > alternatively, only drop/revert "arm64: mm: Unmap kernel data/bss entir=
ely from the=20
> > linear map" (and its followup fix "arm64: mm: Defer remap of linear ali=
as of
> > data/bss") so that the region always remains readable via the linear ma=
p.

> FWIW, I can confirm that "arm64: mm: Unmap kernel data/bss entirely from
> the linear map" is the culprit for this particular issue based on my
> bisect. Reverting those two changes on top of next-20260608 avoids the
> issue.

Yes, same result here.

--K+4Hl4eKWGC3+kq+
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmon0H0ACgkQJNaLcl1U
h9Aj8Qf+NMsECg6ZpCCVCmZAgSm9jurIC2xhNCdH1zI985ZToB3m13mWVKHQfzNk
c3UeJ2TYCZL/VFqAOY7GKqVnP7dQCaOAH9APchLj/x866bL3cI8BqrZdaU31Y5R8
oTwbcYHRYiWAb//q8U50rRXm0iGhB5mfS7eS3GNdYvWg21y0THbquU4pi0I1NKj9
kMYmwVu0RwZZp2R1CR79Y34KGixFeJx6kBmySW9hQlOP+aFXT+IN5RRyrIgBIWZJ
5g4nXLTEYJvcOjOlFVWaGQxkm7wyjKjlrqTOY+SQ0mBEoFaQVUPmrYhufn7Vzd3Y
nfaaltwsAjD8ANseajyHLW17C3Smag==
=HyQv
-----END PGP SIGNATURE-----

--K+4Hl4eKWGC3+kq+--

