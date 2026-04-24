Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46801FED3F2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 17:09:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Jf5eRC+3hkPXLe9spFMB3uryYrD4+VVs7GGxsuqeMj4=; b=SnT5f0qj9ppTPfOUOjNrLx1Gr2
	J7Pu7leBBNAsuBcOl3RbCVSf8etLx6YQyIzUnRT7LBxY5Y1U4O+0s6aq7RnZjs2+eM5p+1nR79r+8
	yhv0271J3DLe7VbLOCyG7ts84DFMinD0qQ6EomkGhX8YFGrVGMRX+SfElTDwwzmPWa8Y919h+QCap
	t8ilUG15Yy/ta0ReV5cPghgN7ZBay3/YaD/s7JKDGGl0c8loAZKKue71D0nCDjneqo1hH6pFxTl2X
	gR8L7MgXenr334P521Ty75xhwn64rd+LCUrjPFxVUYui6MThlKmg+hs4sFTmUv43VGvR8tj3XOSvE
	VzvEYkuQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGK1d-0000000DZoP-0npA;
	Fri, 24 Apr 2026 17:09:09 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGK1a-0000000DZo1-3BwP
	for linux-arm-kernel@lists.infradead.org;
	Fri, 24 Apr 2026 17:09:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 6417340716;
	Fri, 24 Apr 2026 17:09:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D475C19425;
	Fri, 24 Apr 2026 17:09:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777050546;
	bh=Jf5eRC+3hkPXLe9spFMB3uryYrD4+VVs7GGxsuqeMj4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tfb1S2958mVyEkFt1mafWUZ0kVRVwKN7mJKUQLl6vJbmyK4oQRSrK12fXqEHePOIq
	 8K6JArXVW2Zj3O3UP+YoVtW45pZID3HXQSlXnHXY5tPyKn2RV/98MmjIOlO8LERJZ0
	 rO/BNxRgtrki1SwfVald0GZ9h7TkvT+/ShqmWZ9uUkdkAQxNH51bFx0ex2iXTznyF3
	 H1TlVKEYZZahL0BW0evQG0JEczsyIULn7pDLg5VCTxdjNKMWgus4GFcFY9MRx4JH3i
	 ETCL97Wi47BJj4/pOv7juf+BlfqDura2fSCZEww8nNG3Pt7Wwuz1Mgly9+1gJWU5no
	 hhIxjioDgrAsw==
Date: Fri, 24 Apr 2026 18:09:01 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>
Cc: Leo Yan <leo.yan@arm.com>, Will Deacon <will@kernel.org>,
	Shuah Khan <shuah@kernel.org>,
	Thiago Jung Bauermann <thiago.bauermann@linaro.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-kselftest@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] kselftest/arm64: Fix build failure with GCC-15
Message-ID: <b94bce09-69d5-4454-b4a0-81612f286f0a@sirena.org.uk>
References: <20260422-selftests_arm64_gcc15-v2-1-c0134de8838a@arm.com>
 <aeuRfEeOUWEHzPix@arm.com>
 <63409143-f4eb-48c3-89de-1aef4fb57381@sirena.org.uk>
 <aeud4Hqxq4PNitMc@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="VjQb+OJ8kMEE1O8V"
Content-Disposition: inline
In-Reply-To: <aeud4Hqxq4PNitMc@arm.com>
X-Cookie: 1 bulls, 3 cows.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_100906_816822_51ACDB09 
X-CRM114-Status: GOOD (  12.82  )
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


--VjQb+OJ8kMEE1O8V
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Fri, Apr 24, 2026 at 05:44:16PM +0100, Catalin Marinas wrote:

> OK, so it does look like it picks the kernel uapi/asm/ptrace.h. It
> builds fine on Debian stable (no GCS anywhere) with including
> asm/ptrace.h and removing struct user_gcs.

> But I think we should include asm/ptrace.h in libc-gcs.h and not the
> gcs-util.h header (for NT_ARM_GCS it's fine to keep in gcs-util.h).

It's not glibc specific so it seems reasonable to keep it in gcs-util.h,
even though we don't currently have any nolibc stuff that uses ptrace.
That said this isn't particularly strongly held opinion so I don't
*really* mind either way.

--VjQb+OJ8kMEE1O8V
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmnro60ACgkQJNaLcl1U
h9DvmQf9Hl6f4XgZtvRirHt/yJ8iddnSzTd4OQv+Zs3n2ozcevp7y3izjmDagx/K
czNCAe0Halgs1SEIbgXSyvXYQQ4GcgcMNVohwP3tZYQka9YmKCqxgEOttLXe2yzh
Rbb3NDYLtdMdDMu02NGmD3jl7WvZojy5V8+McZyMqdHkUwHewLeQH3H6t7JaMPe9
r5mVnyCz3k/3ifer/jcvOneHlltIXPWzdhVOxYLP/Vvu4SkmTMCbXWuYNRUeKy8C
U3OHUi4CHvRVXtanIBQgeWhDxGkSk9GWtABiZxQrXs/nJ+WzrkH0TWpTnQbOaU07
AClEmEae7Aty1eX3k6gmaydJIPYhdQ==
=6Uel
-----END PGP SIGNATURE-----

--VjQb+OJ8kMEE1O8V--

