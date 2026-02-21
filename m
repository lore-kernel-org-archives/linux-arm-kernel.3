Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B152DC61DE7
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 13:16:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p4Sih2o2uS+eQEm1ZwddwPFwD+9KmWDEGjNhjDo1e0k=; b=mRNq53uAAsJ78elvm9r/I6REC1
	MnBaVAIMNWvGbcmxskKNiLhj51duP82Io8YTfgv/eQenvUOiYVRk9jUbVr5cD9MdYPfL9fBw1UyYO
	gKNQ/lcABvA1t7UDffQEBJTOKnTY1aGZBgE6RQJRhsgcaLRL7OnSsQ+kKuPpc1sm3HbgJ9JpjYZgy
	93GADdsrLM3F/SJDEDkGi5pjLSHp9C18zPyo54GfP2pMUfR4mhM32GaZxEvNZWkjLpJFmz6R4+Nhx
	oXWSklJi3yDdo7w7iAXi9QHOSAku4cCjLQ1BaY/Rm3iOteM9SALvP0uVbanDnOfZ8QZHio5d46S3Q
	s8eds0DA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtmqI-0000000G3qV-3p52;
	Sat, 21 Feb 2026 13:16:19 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtmqD-0000000G3q9-209K
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 13:16:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 2B3AB43F12;
	Sat, 21 Feb 2026 13:16:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D2418C4CEF7;
	Sat, 21 Feb 2026 13:16:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771679771;
	bh=jE+jSIPFl9zhbWCmJ1qOB1BmOqnJgZSd7hQtLem7r6Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=SV8s+plriRy1ZuQ6LM0N5vavFSgU5TiWcY7SSIwMNPPoF1Qmu1apip8TSzrKSXyT9
	 a0xXRAAA8Z3aRn9wFuQl2cTrMPtYpOb9adte6bg+ZpE3ZkwHfLO97U1mpjyl6tJTaf
	 /pnUEKFfRPJPlf9F3FPLrYIlCex9DTDpAg7THy716oWar88zAyqBifV4/QkDx1uBFn
	 5jkKodX+UsDqVQf9xfzReR+qAXzX7RWZhSkDU2tA4n7LJTlPkb5QsyNu/O+s6HPJNe
	 xyLHCDeedp7C14TdsO1anBflOXyms7apEHQ9BsIJQK/r3vjwzKAfPDRIMDmCYIYGXP
	 s95CtW17e6j7w==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1B3E11AC5849; Sat, 21 Feb 2026 13:16:08 +0000 (GMT)
Date: Sat, 21 Feb 2026 13:16:08 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: Fuad Tabba <tabba@google.com>, Oliver Upton <oupton@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Joey Gouly <joey.gouly@arm.com>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Mark Rutland <mark.rutland@arm.com>
Subject: Re: pKVM breakage in mainline on n1sdp
Message-ID: <aZmwGK_j3YXZmcp1@sirena.co.uk>
References: <60916cb6-f460-4751-b910-f63c58700ad0@sirena.org.uk>
 <87bjhie67o.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Ccxbe4iCmwL0gVpk"
Content-Disposition: inline
In-Reply-To: <87bjhie67o.wl-maz@kernel.org>
X-Cookie: Think big.  Pollute the Mississippi.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_051613_568865_7762AAEB 
X-CRM114-Status: GOOD (  22.89  )
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


--Ccxbe4iCmwL0gVpk
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 10:33:47AM +0000, Marc Zyngier wrote:
> On Fri, 20 Feb 2026 19:08:59 +0000,
> Mark Brown <broonie@kernel.org> wrote:

> > At some point since the 30th of January we have started seeing issues=
=20
> > in mainline when running kvm-unit-tests on N1SDP in pKVM mode:

> The absence of any versioning information is really unhelpful. What
> kernel version is that? Upstream? Next? A date really doesn't help
> much, specially given how vague it is. Same thing for KUT.

As mentioned above this is with mainline, that is to say with Linus'
tree.

kvm-unit-tests should be at commit 0ed2cdf3c8 ("arm64: Fix sve_vl() for
build errors"), though it doesn't announce a version at runtime (and we
should really update from there, especially once the next release
happens which will hopefully be soon).

> > The same tests running on N1SDP in VHE mode seem happy, and I've not
> > seen any other platforms showing issues.  Unfortunately due to various
> > infrastructure issues I don't have more detail on when this started
> > happening or anything, I'll update if I get more.

> I've ran that test on an Altra (Neoverse-N1, same as N1SDP), with both
> v6.19 and linux/master as of d79526b89571 together with KUT as of
> 86e53277 and nothing caught fire in protected mode, including a
> 32-parallel VM test.

Indeed, one of the other machines that wasn't showing these issues for
me was an Altra.

> Most of KUT's PMU tests fail in protected mode though, probably due
> some issue with the routing of PMU exceptions (see below), but that
> doesn't seem new. Fuad, could you please have a look and see if
> something catches your eye?

Yes, there are a bunch of other long standing failures in protected
mode, like can be seen with this run on i.MX8MP for Linus' tip of tree:

   https://lava.sirena.org.uk/scheduler/job/2478171#L1365

which is a lot less happy than the non-pKVM run for the same commit on
the same board:

   https://lava.sirena.org.uk/scheduler/job/2478178#L1360

(those runs will have a more recent kvm-unit-tests version, it's
separate infrastructure).  I don't recall those tests ever working with
pKVM.

--Ccxbe4iCmwL0gVpk
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmZsBcACgkQJNaLcl1U
h9BGmQf/SvOZp5An2iuc3Gp/of1ewSqWUC3YTerTTiwrzFE7DaB+HfODvS8ZgEuN
Zy/wsPEXzZCm6vD88HkUN0NZqra+XWd/vM417NSltatCcAWemaLUwBU9x5/FkECa
V8i9DinKxwxB2RxRrRaJ2wC+/CwZeDIloM9OtBeReeKvp+KAbNPPQVXaNvPxOqqh
Q4HjnpQJFXUvfWBO4F+qYp2FxMifJzRU8EGVUCwjOj8Xf3hj21D3NAIg0b26RGiA
OYMvWsCXYaAg4ex1PMnzREQap4bpKZgXdXYApDRgNgOwyK9uzTkOTtDH4xujKRmU
GmAERPfn6vrvaa2gImHL4KLs/zHqdw==
=BFzs
-----END PGP SIGNATURE-----

--Ccxbe4iCmwL0gVpk--

