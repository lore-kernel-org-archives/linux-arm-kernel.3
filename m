Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E8C44E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Dec 2024 17:43:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0z1Y3h5XL89tNKd2sQylW5h1jD3tSQmoCReUrgwdM+M=; b=GcytW/2Px7MWPqA7T1EzU1Yz+D
	8MOazFIWWGFeIDiabmXdLVwy4PUSacsLDQ15KcEjN0RtU1r70GnkzSPtU3rJg4o4TQwIgpxZ2ZLtl
	QxLsmdPBE+CDmH+YQiHLKJjzj1Lrdev75fyoWWfoBIl9cr7uzBf2NyoSD44Eq8WgaiFuKZewFPdLy
	bqy7SvUkWyF4Bl/JhyXKv3mw1b3BZYbFTpanDQGmjTXkxKcAmltNJRQpJTbKZR98RrEmBdWTBB049
	6XWGMDvnqKB03mXH+BD0w0kQFp9JbAwBzbOZewEUpCpvIpnlv5VPIeIrjit8L6WHDiEk5rJL5hPDr
	AOEB/c3Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tLnDN-00000001Ej9-2n3S;
	Thu, 12 Dec 2024 17:43:05 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tLmxg-00000001B7o-3nFU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Dec 2024 17:26:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 083C35C58E9;
	Thu, 12 Dec 2024 17:26:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E8FBEC4CED0;
	Thu, 12 Dec 2024 17:26:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734024412;
	bh=8fpxD1j1JPT6cZVOHyJ+HXmMZtSjV9Io9Hv2yi6gEgc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RefttnSWi/NSlqbcastuSexp4QiOid1TRmo2GMk+9DxtxatUQn/KY04Lul1MMncxQ
	 clLYzqaiT7f/1OX5urM0DMfhdceCtsH+kg3du1w4eUj02TBGb8PS3i1cmpql8Ntqmd
	 aIE9myvZsSibgAd6RX7A4UHAJQx8ahbr+mQ+dds3wGi83azWRS5IxP0JoFaWoPkF88
	 YnKBSGDFV3w9R108TWrD1DaWDnyGwQDT4tKy7nbe3U1CZb05XL+NyrmlRKsyR1Bspi
	 xGyCfh0oLJ2zB1Vf94P2o3BUtiMG7QFMsZE+QTS9wtBdx577wycpgk+B4vK5pTrZN8
	 6netTJuBoMVHg==
Date: Thu, 12 Dec 2024 17:26:47 +0000
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Kevin Brodsky <kevin.brodsky@arm.com>,
	linux-arm-kernel@lists.infradead.org, Dave.Martin@arm.com,
	will@kernel.org
Subject: Re: [PATCH v2] arm64: signal: Ensure signal delivery failure is
 recoverable
Message-ID: <a70cd007-a2c8-477f-972e-fa1e9c362604@sirena.org.uk>
References: <20241210160940.2031997-1-kevin.brodsky@arm.com>
 <5db7f7a0-1d3c-4bbd-ad2b-124bf54f49ef@sirena.org.uk>
 <Z1sY9tIsAZ84W93-@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="I1NVJMaTG8Fg4abm"
Content-Disposition: inline
In-Reply-To: <Z1sY9tIsAZ84W93-@arm.com>
X-Cookie: All is fear in love and war.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241212_092652_979466_C4DBC298 
X-CRM114-Status: GOOD (  12.50  )
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


--I1NVJMaTG8Fg4abm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 12, 2024 at 05:10:14PM +0000, Catalin Marinas wrote:
> On Thu, Dec 12, 2024 at 04:47:46PM +0000, Mark Brown wrote:

> > > Fixes: eaf62ce1563b ("arm64/signal: Set up and restore the GCS context for signal handlers")

> > Presumably we also need a Fixes for whatever introduced the above copy.

> Hmm, it was like this from the beginning. If we are to do a cc stable to
> the oldest maintained LTS, I'd rather have a separate patch for
> copy_siginfo_to_user(), it doesn't make much sense to backport a GCS
> patch to early kernels.

Hrm, good point about it triggering backports.  I'm not sure it's worth
doing that TBH.

--I1NVJMaTG8Fg4abm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdbHNcACgkQJNaLcl1U
h9DiTwf/TMLy9tiAuVFhbU13TcswCaBnMJ2VsLNii1+P3k/QQ+c0/ixqYl/RPiie
n6Jrc1PhHd9XKgISOwjgJDcKqa8xUpjse03/9g6+GHIOcsNorLv5MSZAYCCuzkgo
2lBe8E1Wrynp1YbkVqGWP9DTYa0i8p7pvpyRzIb/2hhYuPfKcjWmn76x9GK2pkou
/Lb8qlaFEmo0q+rLK6AmcKuh81hR6N2NbTOYQf2+0ebXEw37FbkcMlM+ylJZ8ITk
8rzfhnK3yDpJO2xLAVYoRnYfeO5/Uh24MGZbd070smJD0b6Ihse25pjS/92o+SfT
QfnLyQoOjXZjs+XDAyVwgJ9Iw9L0RA==
=G+dX
-----END PGP SIGNATURE-----

--I1NVJMaTG8Fg4abm--

