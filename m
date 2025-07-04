Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1ECB5C8303D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  4 Jul 2025 12:05:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=u+k6bMjAL4rIXFt5BmGC49BdS1P28RQjtO+vxfiwiJ4=; b=k52AbQniZP1bd/0Cu4TmC4wuUB
	rA43QkVpEJEUraoM6hic83KEzlUasRHgogFry35GhohWvWgcBXWOUVJzSY3MpsWDTgMXxpieMnBNS
	/0alX73kLD37BA7jFhGaSUZ+FpCFcHqN3WxwQuI4rIWZs8Pzj/Ly/l4feIHIYQfAJZFHsgCBG6wjS
	TbEHjSH6Ranu6GTyHbsRo6/nzFpgJUHNCIE8p3CIfPNeCUZt28/dd+qb7DsBYykPVFhSilszsoLwe
	h95DFZ0tKBLJjWjzvVg7Ka17hQy++XsW9AWgE8nFlF/DWcii7c9jKaQm9u0OyS+u1xa+BN+Hx6HEQ
	pWJTvdkQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXfA3-0000000EMRC-4BO6;
	Fri, 04 Jul 2025 12:05:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uXf7h-0000000ELii-1S40
	for linux-arm-kernel@lists.infradead.org;
	Fri, 04 Jul 2025 12:02:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id B7F6C468FF;
	Fri,  4 Jul 2025 12:02:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id C3F13C19422;
	Fri,  4 Jul 2025 12:02:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1751630549;
	bh=U1w4n/gNczm3CXe+WuY5bn1+RGT4rey/pqulyOcbhbU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Am+oe5XudarJ8J6rflUIS3GkIcr+vL37yVMCwUuWWTvh88tHdR9EzvvcCKJsmLc8J
	 zAl9yZXWy0XwmWB1NDrguJ21Ub5Yn54JrdnuQFvn58WldVwr9glHwwDjeE+1l9fQMj
	 d8UISBXtGp204qUY0/xAE5qDS1oz/dSvriUeO61WpDZi4UOHNXuklT5SyveEdMG2fe
	 d2uB+svcag+bG9NOYWNVL3K5K25OM+FU1cxtvk7muBSZJgSPKVix8jQXCwV5zew1ST
	 D1O80+PiYAXfj5QBy+9YbBVcjaA2/IoQQuz6j067aaERphVMxzufC4SIK24SlXFBUL
	 l5PRZ3u1ELbCQ==
Date: Fri, 4 Jul 2025 13:02:24 +0100
From: Mark Brown <broonie@kernel.org>
To: Thomas =?iso-8859-1?Q?Wei=DFschuh?= <linux@weissschuh.net>
Cc: Willy Tarreau <w@1wt.eu>, Christian Brauner <brauner@kernel.org>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Shuah Khan <shuah@kernel.org>,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 0/4] kselftest/arm64: Add coverage for the interaction
 of vfork() and GCS
Message-ID: <33d51f33-3597-4a5b-b54e-0292f12aac69@sirena.org.uk>
References: <20250703-arm64-gcs-vfork-exit-v3-0-1e9a9d2ddbbe@kernel.org>
 <f438fc60-e602-4301-a7dd-bee43c020720@t-8ch.de>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="oP7U7slU7zFgf7pc"
Content-Disposition: inline
In-Reply-To: <f438fc60-e602-4301-a7dd-bee43c020720@t-8ch.de>
X-Cookie: VMS must die!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250704_050233_405082_D0B7BB98 
X-CRM114-Status: GOOD (  11.67  )
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


--oP7U7slU7zFgf7pc
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Jul 04, 2025 at 01:27:28PM +0200, Thomas Wei=DFschuh wrote:

> FYI nolibc now has a proper prctl() implementation you might want to use.

That's open coded because we absolutely cannot tolerate the prctl() to
enable GCS being anything other than inlined, returning from an actual
function call would crash.  Probably for nolibc that'd mostly work out
but it seems better to be very clear about the inlining.

> Also your vfork() selftest uncovered a bug in the brandnew SuperH support.

Ah, doing good work already!

--oP7U7slU7zFgf7pc
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhnwtAACgkQJNaLcl1U
h9AJ/Qf9Era5xFOINBfLAUYT6xEchOrgAvL27i4SBKII/qTPPYq/fwUg80tdJhHp
69FDLh6r06bTjM/BBoZJy5vg1+Ay3TY0U3Z6PxPi+aJ1rbvjgnon/Us4ArL93iR/
lUSCNMWsDl6jUUHEEnCaAojywpRsVJlYedQg1pCty+CJ9vU9kod6CfqCNoN2AVM6
kYEan/gefBnhVMs/dxXaz39vTTSlLzJnwPUiYq2Gp6SErq5QuoTX2X18yIfTOrhj
p/vXn5K6VkDP93EeHOkBZ0c8gF6b79p9mVrKoRgPtDO8ZFmpefITt93MCLkq54Pk
KykUBHtIF6WqlFzbkAk03BJRFevcWQ==
=mjkI
-----END PGP SIGNATURE-----

--oP7U7slU7zFgf7pc--

