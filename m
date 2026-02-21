Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 070BCC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 21 Feb 2026 13:43:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v6GR3oqYzvfOr2YecJKXRoYn33wFLOk55C03VlCt/gM=; b=fHiCSJr1xnRW7yLB6oyzcszmw4
	9IMoCDtbQQOXUnsmCxuAVVGGbMgZEKW4vBpxlfQ9SO4U772s8HtIrvwsvBg97X68be76xfaJL17O0
	5lj8F451uBhVldZfgkLEit3TL3U3PimxuX9YXYL52VR0lm5sUfUAZmvRYkMgg55FrEWa05UXuZfji
	EuM1aW9dRvtz26M0Oncwqw1+dMs9XQSWyIPrt7IW4g81G+xBGqex6f49bwFOWRRMIMf4Enpyi6Kb9
	oNnHEfhji/PJ/bwc6qZ6Y5sH1fXUwQHBc3PUntX4jAG8X31THx4JxxrDo+0RMPAmKcrjySjhpO9b7
	SYL1w3UA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtnG5-0000000G4eR-3aFL;
	Sat, 21 Feb 2026 13:42:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vtnG3-0000000G4e6-0vBR
	for linux-arm-kernel@lists.infradead.org;
	Sat, 21 Feb 2026 13:42:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 8848B431C3;
	Sat, 21 Feb 2026 13:42:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45A69C4CEF7;
	Sat, 21 Feb 2026 13:42:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771681374;
	bh=v6GR3oqYzvfOr2YecJKXRoYn33wFLOk55C03VlCt/gM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ha3UyzOW5Yxid/1siPoBgGy2my03xA0rTjZ2rmRhwTFKFG0AYvLhSEBbwQuTep2ba
	 E7GZyamfO9Oy5f6DzY4PpFy1fIRZVADMEDPBbypSX2YHxpKOP5Ph7/28mhV73aTWCn
	 Dspufk4nRKdR/Te1Fl47QYR2OJgTiAdRYlozDyrmHhxpEr0oPyaEzE7UoxuoCcRHNL
	 GOoTz/5jsK80AAuEU6lfq2ljAypiv2na7TWaZRIFVA5Q7d4oA77TvSR5C/88KkLwEF
	 m6BrCqVjix5ve7jPOpvqI/tbtDIi4yJO0f1JxH0XWt/XLDjv78pq1V7uZhVqDUlL7P
	 FvdggvH8JtTzQ==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 105BC1AC5849; Sat, 21 Feb 2026 13:42:52 +0000 (GMT)
Date: Sat, 21 Feb 2026 13:42:52 +0000
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
Message-ID: <aZm2XCZLYxgxL99d@sirena.co.uk>
References: <60916cb6-f460-4751-b910-f63c58700ad0@sirena.org.uk>
 <87bjhie67o.wl-maz@kernel.org>
 <87a4x2e60i.wl-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hQsWoqqfBdjsjULQ"
Content-Disposition: inline
In-Reply-To: <87a4x2e60i.wl-maz@kernel.org>
X-Cookie: Think big.  Pollute the Mississippi.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260221_054255_284079_CF65341A 
X-CRM114-Status: GOOD (  13.01  )
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


--hQsWoqqfBdjsjULQ
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Sat, Feb 21, 2026 at 10:38:05AM +0000, Marc Zyngier wrote:

> If that's vanilla 6.19, then there is post Feb 8th. Sorry for the
> unwarranted rant.

It won't be vanilla v6.19, that specific log will be tip of Linus' tree
=66rom yesterday morning UK time which should be 8bf22c33e7a1 ("Merge tag
'net-7.0-rc1' of git://git.kernel.org/pub/scm/linux/kernel/git/netdev/net"),
there were a few results for commits over the day prior to that showing
the same behaviour.

> Can you share the configuration for this kernel?

It should be an arm64 defconfig (I'm having trouble connecting to the
relevant systems right now to double check).

--hQsWoqqfBdjsjULQ
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmmZtlgACgkQJNaLcl1U
h9Chpwf+MGnnovVbLurNrKvyiMsVEn2Q2nWU7AGFk4i1H2xVJFxXRQbaIPACI2YR
+b6PG8V+N4gYKg6n4TXW6mv6IaoGzMlEiZfRc9M2TCf8/6GRfejivPaV6avZZ/PS
BxqFG2kVl55MBI112eCfiDEPYJbAyioLDWvOjvUXi81J+3HgAOTcPd9PxzIwj5Ye
IF3RV73EMQwfw8cpGViOSzEYmFIoNM+UPqXfxClgLDuw3fqSBIV1KLUSRuGw4Fvk
WmVm0bz9reUt91btv3NGtngrg2I+eMqej5ecL3b2fUu8BwAgX6cUn+6EUzIRHM5d
mjm1cr1GOMtYiaKny+rSJdWSo0993A==
=s/0e
-----END PGP SIGNATURE-----

--hQsWoqqfBdjsjULQ--

