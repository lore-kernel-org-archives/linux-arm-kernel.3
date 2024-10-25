Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3D18FD0C619
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Oct 2024 14:31:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d05EtVRQxx1j1QGus7MhBn24p5WvvqR84+dI/Hp8RnU=; b=vt2Jpehv1I5kSwc2fMXKXDyBWA
	PHbH+wrnLWskmANZrLCvFXPOF9GeiL71TlqTVfFEkVl6debaYz2ANrXnFq+sxbdaAGDlq2XZ7dvMW
	fpaqATa1unP7M7z+Wi2Hj9vZKyAe4B4d93CDsSi7Qha1igWHyf68/ZQit1o4exy/XGeldVJaPqGQy
	TNZOvG2RjscH1Emq3eiGTgs2Tu+HskD3VFYyt45NJ46mKSE66BiN+YsOH4PpcCjdP39Gqan6bzRnB
	4ljzb3g/qeKuCOzakA5X76mYTnVcoKzF5d6Q1zrx7YmL+Ozdz8xm74g4OUywGe5yx/Cd0+Q5c4uAa
	FTd8fQNA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t4LLS-000000041UV-2ehL;
	Fri, 25 Oct 2024 14:31:18 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t4JuR-00000003k9j-2u4y
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Oct 2024 12:59:21 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 715E3A42EDF;
	Fri, 25 Oct 2024 12:57:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 99498C4CEC3;
	Fri, 25 Oct 2024 12:59:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729861158;
	bh=aAqbBGyjPWgCK55GdUA5PUTQzhfpub6cqpcDphWFA+c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=baqk3DIE5L8wdmTLARGGkTSnE1Eof9cFR5gHTOuFk2m4SHOyOjPwQK8jFmA5jvcdC
	 +zDj3uwxB82JTkDFuzGBxxtbcfZgn/HFnHLjdNjYBKWbLemTXh5TDmt8lnFiR2aA3X
	 9Hj+rPFuJZzCLQX13d7uMzu6iJYp1L0J/DGxK0rZIaHKvLS5w42U8BFp0+EeSZVGR3
	 M3UfJn4QWiVQtqu/JC8jd7tIdnd51d8veXgc1VARXstESVXz3LroiTnSrmGvwMXjE7
	 18+tl8zDV/4IUlVRfx29azRk/FAUxGUrkjLljRt71dgCCxduypj7Vnsn7nI2DgH3aT
	 MVKtmldtiGuew==
Date: Fri, 25 Oct 2024 13:59:13 +0100
From: Mark Brown <broonie@kernel.org>
To: Eric Auger <eauger@redhat.com>
Cc: Marc Zyngier <maz@kernel.org>, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Oliver Upton <oliver.upton@linux.dev>, stable@vger.kernel.org,
	Alexander Potapenko <glider@google.com>
Subject: Re: [PATCH] KVM: arm64: Don't eagerly teardown the vgic on init error
Message-ID: <ZxuWIXFJignbcX1m@finisterre.sirena.org.uk>
References: <20241009183603.3221824-1-maz@kernel.org>
 <3f0918bf-0265-4714-9660-89b75da49859@sirena.org.uk>
 <86ldyd2x7t.wl-maz@kernel.org>
 <eb6e7e29-b0a8-47b1-94c4-f01569aa55cb@sirena.org.uk>
 <92d755af-e19b-49a5-b4df-a8ed0fb7aece@redhat.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="StHetKYo+xBy+vjm"
Content-Disposition: inline
In-Reply-To: <92d755af-e19b-49a5-b4df-a8ed0fb7aece@redhat.com>
X-Cookie: Editing is a rewording activity.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241025_055919_820613_B92005E3 
X-CRM114-Status: GOOD (  19.09  )
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


--StHetKYo+xBy+vjm
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Oct 25, 2024 at 02:18:02PM +0200, Eric Auger wrote:
> On 10/25/24 12:54, Mark Brown wrote:

> > I'm not even sure that's a terrible fix, looking at the changelog I get
> > the impression the test is deliberately looking to do problematic things
> > with the goal of making sure that the kernel handles them appropriately.
> > That's not interacting well with the KVM selftest framework's general
> > assert early assert often approach but it's a reasonable thing to want

> Can you elaborate on the "assert early assert often approach". What
> shall this test rather do according to you?

In general the KVM selftests are filled with asserts which just
immediately cause the test to exit with a backtrace.  That's certainly
an approach that can be taken with testsuites, but it does make things
very fagile.  This means that if the test is deliberately doing
something which is liable to cause errors and put the VM in a bad state
then it seems relatively likely that some part of a partial cleanup will
run into a spurious error caused by the earlier testing putting the VM
in an error state.

> I am OoO next week but I can have a look afterwards. On which machine is
> it failing?

It was failing on a wide range of arm64 machines, I think every one I
test (which would track with the change being very generic).

--StHetKYo+xBy+vjm
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmcbliAACgkQJNaLcl1U
h9AvQwf+PLqULPjWApldlDAjSS6Ydf3qKRr2wnzfn3GoYm2LQKpherEM6Br54G4F
6LGp6HkvVOA4i7vxRmzviXidU30Pg0DkJSUXkFlVcfbT5eW+YbvnZmDKvNC50p50
MExLjhmzwlA8M9jCqICqUim0nD23AtQZZLeTIVrqCtM2OiwQyg7+LY2KM+T/7aMT
AltD1XVQkPMVtsQ0wHrUMWJR7mCW0N8RY9RKuoswNJadle0n2yU8OK3SwyMO4kIw
ucyzQGoP27ckeeNQ2y072gZPDq6xg3O7yNFOzWwl9E+uDQs6GICu4LzIWFVsGFwe
pzdYascg4iXeDbwmnQGaxdvHXk0NEg==
=1fHJ
-----END PGP SIGNATURE-----

--StHetKYo+xBy+vjm--

