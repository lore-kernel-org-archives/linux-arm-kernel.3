Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5771CCD5BC8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 15:45:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ng5tVAf/Y9+5wzN0yP6ogMfsFxqAJF42Imb3+FGMJWA=; b=OKistZ908KqLcCagrxtfoScfcV
	Utb6P0yrade6Jj94pAKQDRVPQJTTPTpE2ARlouWl+K7lcAebRF/dE7sH720FLeTabRxzwxhpRj8Ii
	0KBL2I/OFLTOuv5lo3U1imENth7nNsLIPbYfp6y9OgwXvHVJ0wWyfw6gBLZQ25b32jPXlPSgvgY2X
	8AORx/guUz+GagVnU+rhKuQ+nvX/Fm/me5+tc3k0vi3C5potnsTSqOMV9nguENx4PQQIW7E4Hs9c6
	yrv3D3gS/jzgIsD8nawm2KUypo/W3mSB1IYTyu49DFHoI1M1eCWbV8UI2D1hU72hygOT5bJujXsmz
	lWz0V3Vw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtyG-00000002Q6C-1OEH;
	Tue, 26 May 2026 15:45:32 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRtyF-00000002Q5t-0zGq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 15:45:31 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7426F60018;
	Tue, 26 May 2026 15:45:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 580B51F000E9;
	Tue, 26 May 2026 15:45:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779810330;
	bh=ng5tVAf/Y9+5wzN0yP6ogMfsFxqAJF42Imb3+FGMJWA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=GVWBQDRp4XIaWfBddG8ecFA49ZakCGR832YOdwFJpq7Z+vug5y1r6yARQ3i7wAK1b
	 T8cPF0vd4Z05vghzwRSzqLKHEH5/Yn422G1TSl2sbDdDie0VD/fRPfc7plhbE2/1F5
	 y7u6TjbUB0aCQ68l/J/wWLl8qqFJuhVbpvbwC9cuw11rL7/X7ieDjRexuA7XQaBph6
	 LmNPt2Ov5rPqKKN+oqI83yWadRh6yuHFPojhhWdJwtEeL3oinVcRtk5vqAZbuQJFXl
	 fl2MEPtslwS7dX7HzRxwfe63vd9NZ6KuVB/Sm603gGYL79r74oVFWGhB0oq2JG4ADM
	 XNgzUsy8k2utg==
Date: Tue, 26 May 2026 16:45:25 +0100
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	catalin.marinas@arm.com, james.morse@arm.com, maz@kernel.org,
	oupton@kernel.org, tabba@google.com, will@kernel.org
Subject: Re: [PATCH 08/18] arm64: fpsimd: Use assembler for baseline SME
 instructions
Message-ID: <e3544477-c7e3-4732-b671-e19488555b98@sirena.org.uk>
References: <20260521132556.584676-1-mark.rutland@arm.com>
 <20260521132556.584676-9-mark.rutland@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="tJKC2+pbRzUnN+C1"
Content-Disposition: inline
In-Reply-To: <20260521132556.584676-9-mark.rutland@arm.com>
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


--tJKC2+pbRzUnN+C1
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, May 21, 2026 at 02:25:46PM +0100, Mark Rutland wrote:
> We currently support assemblers which do not support SME instructions,
> and have macros to manually encode SME instructions. This was
> necessary historically as SME support was developed before assembler
> support was widely available, but things have changed:

Reviewed-by: Mark Brown <broonie@kernel.org>

--tJKC2+pbRzUnN+C1
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmoVwBQACgkQJNaLcl1U
h9BHKQf/XKETxo4uu2TkYw3D8d2MmXbwgMh5F1puR3pxuDJw1t0YzjQ358cYcp3y
zkApc8WbI3iT0myH3nXv8aIEanMr+1eDk54jPfzHm1IhxtbOfJWbrgjggB83WTFA
QOrflsgO5/GP+FzNXvPRYkHwdxj7BIa+GKKGDAXVLZSD2IYzW6DZ6SeFVeq753yt
sUH3Y1mvT5j1M2ceBfaz4aNo2HBRo4aA0WjReKod6bwgI7BJSLNvqvxHh5boI0g4
NsU6ILtIXxqp5+JEhpPnkB0quweSNpgIQksCjcEbbvLarS8kR9DiSiY9AsvtNuah
fA8/1zqWoLD1XPo64ddWtvI+tTyRCg==
=kIcV
-----END PGP SIGNATURE-----

--tJKC2+pbRzUnN+C1--

