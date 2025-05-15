Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 54635C3DA4A
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 15 May 2025 11:39:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=QvQvM4P2kv3S7IfEhXSovc8h9RG0ylwZ/SMTZHhGt4o=; b=x5LV489BnjQ0/AvirFUYujUu88
	ot4nfZcYYo4ZQhUyVArUgqAOKziLsWyP1KdGb2j+RnOakwl/F9SFV3+UPx8Cl59OBri9DCQovNZ/R
	ahrg+JHWJUsl+9uNkjFp/y/7g/TmOqVFJTzxC/XO8FoxMxcaWHHvTfsnlppXyx27J1j9xScYLK6sW
	yVxYaaYMjBHX0eJNt4vn73neTra8qYGCE6YDfjO9B+qgyZJ0J+0GiEyZX6u8ARYgBBXBZbWA0SA6B
	w5m9HBXTfF5UMoN47VZIgYiIgPMM2Tl3FiQrBTcGmVLdJOwTTkjxllRtsaiF0ct2Zj1TOmxEgU7LG
	ipXV/lCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWvk-00000000QlT-0bO0;
	Thu, 15 May 2025 11:39:16 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFWtQ-00000000QRj-45Ae;
	Thu, 15 May 2025 11:36:54 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 1102F5C06C1;
	Thu, 15 May 2025 11:34:35 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4C199C4CEE7;
	Thu, 15 May 2025 11:36:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747309012;
	bh=d0iYPHhQnVy87MCQwRN3B7QhsFl6v508aPjz5n96844=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=diy+xgGXws2so7XTt0geI45NZbeDB9FeFQQkr59mpDDi6FlTulL64KOnf3BrGm5EN
	 SuEY+xu42reIjAkEoH6QUmfrqzCnQxzgdJ5CokVhiZEvT/nIpr3wjpiwDao2LEuqNQ
	 txbJ7M3wjM4Y38Q57pIFOi0Gl0BWMAfc9M8kf5+O9x2FVdc0radAzY2pbPC+Xogb/d
	 aiWBe/DmL4zim3RVsWfn+HOryuI4douSBP5Imcou9bAxwgc3jcGqwTUoLk+rKP+IJv
	 xghHwYcgdmQ24UFMcIbptW/gPugz8bVqS9bPQ7m86+77tmC+Wtnqmn3sCrfe9c7PCr
	 x9Ki1RzreVVvQ==
Date: Thu, 15 May 2025 13:36:47 +0200
From: Mark Brown <broonie@kernel.org>
To: Jerome Brunet <jbrunet@baylibre.com>
Cc: Kevin Hilman <khilman@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: Devices not instantiating on Alta
Message-ID: <aCXRzzCM1Wp-cV7a@finisterre.sirena.org.uk>
References: <aCRQqRucgWMOjUPj@finisterre.sirena.org.uk>
 <1jikm3y4zb.fsf@starbuckisacylon.baylibre.com>
 <aCRY5_LOGKxO4pVz@finisterre.sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="QPa03CCj7lGwQrIp"
Content-Disposition: inline
In-Reply-To: <aCRY5_LOGKxO4pVz@finisterre.sirena.org.uk>
X-Cookie: Well begun is half done.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_043653_066750_5E26E715 
X-CRM114-Status: GOOD (  19.30  )
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


--QPa03CCj7lGwQrIp
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, May 14, 2025 at 10:48:45AM +0200, Mark Brown wrote:
> On Wed, May 14, 2025 at 10:24:40AM +0200, Jerome Brunet wrote:
> > On Wed 14 May 2025 at 10:13, Mark Brown <broonie@kernel.org> wrote:
>=20
> > > For the past few days in -next I've been seeing the reset controller =
and
> > > audio subsystem failing to probe on Alta, I *think* the audio is a kn=
ock
> > > on effect of the reset controller.  I didn't spot a smoking gun in the
> > > log:
>=20
> > >      https://lava.sirena.org.uk/scheduler/job/1388164#L4875
>=20
> > Maybe I missed it but where can I get the -next sha1 used and associated
> > config used for this test ? I'd like to give it a try.
>=20
> The SHA is in the job title at the top of the link (IIRC that log is for
> yesterday's -next since today's isn't out yet but it's been at least
> since Monday), the config is just a plain arm64 defconfig.

Whatever was going on appears to have resolved itself in today's -next -
everything is regstering OK and all my tests are passing again.

--QPa03CCj7lGwQrIp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmgl0c4ACgkQJNaLcl1U
h9DsgAf/TIKAXEqdahx+I8Ad/aN2JdESTlAS/bEvB6gX+eQpOlur2y/5q3/UxTYZ
xiIOaA2udTknPFAhruuH1uQ+ahW0fGRfzImUCvNEri4Z/J3uT6Yfdjm3sWnGg4uc
2th93gfSMgNW6EjI65jf+Wq4e46s7DzqrfxDHdYKrfWNARsMx2WgSCbkI06BUL6f
NOlYuC0rKIskquj9pjjCMOEGJKg0se7KCmEO5pj9i2XxOXfpuGouCd74U2ubnJBE
yUDG1RmqEhPQnoKyvOnDymrg7borSIWzSXOX0dn49ByV3Po1aUM3Jk3x+eRZclye
3uxoAHxMGZQo1SkcD6g/sLoiTeFQPg==
=ZGPK
-----END PGP SIGNATURE-----

--QPa03CCj7lGwQrIp--

