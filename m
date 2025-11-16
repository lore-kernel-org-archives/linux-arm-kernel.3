Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A528CCCD19A
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 16 Nov 2025 13:53:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AzYUR3wlLAs1xzT0dkZCgXQj7EMTApyTHOUAbwaDpv0=; b=t+J0Xv9FOyJLMPUzVa2aOlY8Dk
	Y9TaatVhpCV0RRot5O9DYJDgv1CEWFPzaEbI3S53FzJPHVnqVSxVJX7QceHhTMMMXNgx2R5ztxgKw
	jgr41HCDkKNtEJBOiuTZ7WKT/wfSzUcG/tSYGLSLd54Nw3sBUCb0Qfo55Vt32/8ZXUNj+9WclbQa0
	lc+aX0iRPnk9MO/brizHr+9fove7PaKorRnLSVd/OiAuU6LmnR6VGRBRL5/usEOnvKBqkIR0fXRh9
	BDOG+sgYK7qJc35auQ8YOqvPsQ3xt+wRQabdfn9yQhHUGnzrGcCseK5cKxLYSaDRf6b6s6cOQiP5N
	hHTJloMA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdBb-0000000EiVV-33lw;
	Sun, 16 Nov 2025 13:52:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vKdBZ-0000000EiUu-05sK
	for linux-arm-kernel@lists.infradead.org;
	Sun, 16 Nov 2025 13:52:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9374C417A0;
	Sun, 16 Nov 2025 13:52:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 36B63C4CEFB;
	Sun, 16 Nov 2025 13:52:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1763301175;
	bh=q+OQBU+UJCTeB/iVrbsB1/HRKES2lLP9KA6Cka0Bmx0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=GFKxrmv85eN/Z6mmAvLa2aIcd/5UD47loiag63mFSX0x4541vH0efUVUrHv1wEJeH
	 rsqrDZk4CJErvIj8FBZEWer46y65gNhrpGAHnTYOlr8xtloK+WYQdT7krYKmNOmIFR
	 zOe1NkK1auRHaoh/RpB2YMGYnD4+VeLwrKPkMFiuBUWKslIXSHvzuc5IkgUBBKwsLa
	 egjpWUvTcPgyrNXdAaFvrWCRMNZbnggkHgFEnbcrdvqwLUVpotfytnpXQoWh6SUjyz
	 wO1Tmy0YrWUR6yGh1++5Xa10N13jMAmRKjOtOva+RP/Qb+vyRG2sCfoR29+vWXMeE4
	 Sdc39TEQglgQw==
Received: by finisterre.sirena.org.uk (Postfix, from userid 1000)
	id 1AC771ACCC98; Sun, 16 Nov 2025 13:52:51 +0000 (GMT)
Date: Sun, 16 Nov 2025 13:52:51 +0000
From: Mark Brown <broonie@kernel.org>
To: Stefan Wahren <wahrenst@gmx.net>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Florian Fainelli <florian.fainelli@broadcom.com>,
	bcm-kernel-feedback-list@broadcom.com, kernel-dev@igalia.com,
	Ulf Hansson <ulf.hansson@linaro.org>,
	Marek Szyprowski <m.szyprowski@samsung.com>,
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] arm64: defconfig: Fix V3D deferred probe timeout
Message-ID: <aRnXMzuxPXfmRf30@sirena.co.uk>
References: <20251104174518.11783-1-wahrenst@gmx.net>
 <cbb49407-5b66-409d-8a0b-260e50932156@gmx.net>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="e+HLEFCGL31KODtr"
Content-Disposition: inline
In-Reply-To: <cbb49407-5b66-409d-8a0b-260e50932156@gmx.net>
X-Cookie: marriage, n.:
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251116_055257_104961_629A51EB 
X-CRM114-Status: GOOD (  15.93  )
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


--e+HLEFCGL31KODtr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Nov 12, 2025 at 06:20:38PM +0100, Stefan Wahren wrote:
> Am 04.11.25 um 18:45 schrieb Stefan Wahren:

> > In case these kernel modules are provided via NFS this takes too long a=
nd
> > the PM domain core give up before the clock driver could be loaded:
> >=20
> >    v3d fec00000.gpu: deferred probe timeout, ignoring dependency
> >=20
> > So resolve this issue by making this critical driver builtin.

> can you confirm, that this fixes the problem in your case?

Yes, it seems to work.  Given that this patch was applied I had been
expecting it to show up in -next but that doesn't seem to be the case?

--e+HLEFCGL31KODtr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmkZ1zIACgkQJNaLcl1U
h9AVWgf9HqW6P1tgXjtAksFx9+4JlMABcGYNxNVuwlg4bs1Rv4lPyW/hBH52PqeL
u0tVrkznztUOqSS01h8+z2zCq3B0TtGXQvn4mRmJrAb4YmfBiRVJduaB6csMz8f/
QLWqqetBID1pm+2SF+0EJ+t6gqGVFWuqf5bUE2Q7BeDhbaxg2uwcYC9uj702GO71
plS+NZygwLn4uePu4KbHeMl9hud52kP5H3J6r3PmPP1b4VzgpFllh1IblvxfP3hW
uuIi2lL0S8RYjsqGp49YkjkXQoRsJn38asBG+Zg18lIPirJ95zlBSvhivO4BsZXp
EY/4ZgjzxWbwJY9Nwe7e/nuGqzBUZg==
=IUoY
-----END PGP SIGNATURE-----

--e+HLEFCGL31KODtr--

