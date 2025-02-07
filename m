Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B4C2C02194
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Feb 2025 18:53:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Ssy05xvxPbp4afWUPyH57cbfgTNeKeDMQmkgA5uSPyg=; b=Gy7kLxFNVpeeOdU4oTSBE6zkhU
	gVLPFacrzLMCfW7NvRvMY9rHK1Xp65ZfgOSHefVjxnJT3AR779QyxtISLNhaXrsMVEX/w7IireA3T
	NIwZZJnjjk4SoDL6fts/xghaoU2SSFrbs3pNtd+xzYbAzA8V+u9qdo/IP80GF+Kyh4jpF0EnE/bq5
	45Yqn6/Gzd3/gg58DWD3gthjz51i7bMFA70LG3cb94XKPlLvC/pSPSaWNWDKwQ7UnV3vG5AxNThr3
	PnqXtaE6GYZvxek/4ON6hOhz0ch96waMpX6lXHnuIZG0grOtTB8j4Mf/tGde1ugmdkZ9rGVloauLC
	dGRyF2eQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTTq-0000000AoB9-3rLS;
	Fri, 07 Feb 2025 18:53:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tgTSJ-0000000Ankf-2VSr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Feb 2025 18:52:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 06CC5A439F8;
	Fri,  7 Feb 2025 18:50:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D5328C4CED1;
	Fri,  7 Feb 2025 18:51:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738954318;
	bh=7onJfjbDtWHDRExNm8cu9hpXQKqGW01LciP/zaYYx9M=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AVJQKsBC7RMwQFymvjSHHCR2p0vwZLBFjHQLvvTRv/5cCZgPnMIV/DqIrN7B8ytIU
	 M69yzNOlrbcpvlh/p+1eU1orKpp3MwCp3WiyvdqkTnteIRb76e1l/mmTkJmaFDU8yY
	 LRBCZ6HNLoE9swbRVntg/VN2Kz4kkmunpQcnOLVTBeF37OfstugVNAl6GF2QBlzAJy
	 xKb7IfTVpN4YeJ6MEHz97vd5bjTvAOXP3C8wgNBiUmKk59Q0HNeD+6c2rGsq83nQNf
	 VnA1ep+dazqnA+VZYyLdJoCGKVNM5Dcbe4iUjkOtKttmaAR7Gs/yKW/MX1smWB6gEz
	 2F+t1Mqsjvirg==
Date: Fri, 7 Feb 2025 18:51:52 +0000
From: Mark Brown <broonie@kernel.org>
To: Mark Rutland <mark.rutland@arm.com>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Jonathan Corbet <corbet@lwn.net>,
	Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v5 3/5] arm64/hwcap: Describe 2024 dpISA extensions to
 userspace
Message-ID: <0b3777cc-b73b-4843-97cb-5fe3cb1b9774@sirena.org.uk>
References: <20250107-arm64-2024-dpisa-v5-0-7578da51fc3d@kernel.org>
 <20250107-arm64-2024-dpisa-v5-3-7578da51fc3d@kernel.org>
 <Z6ZS51BLkfFLl-5Y@J2N7QTR9R3>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="DJF/VSDq3N4d5oeh"
Content-Disposition: inline
In-Reply-To: <Z6ZS51BLkfFLl-5Y@J2N7QTR9R3>
X-Cookie: MMM-MM!!  So THIS is BIO-NEBULATION!
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250207_105200_198246_977A8190 
X-CRM114-Status: GOOD (  22.44  )
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


--DJF/VSDq3N4d5oeh
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Fri, Feb 07, 2025 at 06:37:27PM +0000, Mark Rutland wrote:
> On Tue, Jan 07, 2025 at 10:59:43PM +0000, Mark Brown wrote:
> > The 2024 dpISA introduces a number of architecture features all of which
> > only add new instructions so only require the addition of hwcaps and ID
> > register visibility.

> While working on SME fixes atop v6.14-rc1, I found this patch breaks the
> build spectacularly with CONFIG_ARM64_SME is enabled (splat at the end
> of this mail), due to some missing definitions.

Yes, I already sent a fix for that which Will has merged:

   https://lore.kernel.org/r/20250203-arm64-remove-sf8mmx-v1-1-6f1da3dbff82=
@kernel.org
=20
> From a quick scan, there are some other missing bits too. For example
> these two caps are defined in terms of ID_AA64FPFR0_EL1 fields:

> > +HWCAP_F8MM8
> > +    Functionality implied by ID_AA64FPFR0_EL1.F8MM8 =3D=3D 0b0001.
> > +
> > +HWCAP_F8MM4
> > +    Functionality implied by ID_AA64FPFR0_EL1.F8MM4 =3D=3D 0b0001.

> > +#define KERNEL_HWCAP_F8MM8		__khwcap_feature(F8MM8)
> > +#define KERNEL_HWCAP_F8MM4		__khwcap_feature(F8MM4)

> > +#define HWCAP_F8MM8		(1UL << 35)
> > +#define HWCAP_F8MM4		(1UL << 36)

> ... and we expose the ID register bits to userspace:

> ... but there's no corresponding arm64_elf_hwcaps additions to actually
> expose the hwcaps.

Right, indeed.  I'll send a fix for that.

> There are *SME* variants in arm64_elf_hwcaps:

=2E..

> ... but those KERNEL_HWCAP_SME_* values are never defined, and neither
> are the UAPI equivalents.

> We need to fix that quick, in case we need to shuffle values.

These were removed in the patch above, the relevant features were
removed from the architecture between the 2024-09 and 2024-12 XML
releases so were removed from the patch series by the time it got
applied but with CONFIG_SME being disabled the stray reference wasn't
caught by testing.

--DJF/VSDq3N4d5oeh
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmemVkcACgkQJNaLcl1U
h9ClRwf/WB2OvIr7lgQx020+QFzQCtNHusxsthqvrkbyHfN9xFDo0WGBzEhXht2t
SxrHeNhPqeSa1twGITVG+lAlOresDhJwX8aCNVw43dWkKCvOF8wh5eiDc7PZOLXj
Yj9HfFBUXWDVkQQ7gUSXRYBnRgvN2PoZlXgo2B2rEmsP7KU4UjkIPEN7kLKNBYK9
ZznUGbYZBHOF6MbJeS5IbogE25jjEfterOxJq+J71TfLys/uQO4tDPYZ444A0K00
ZnA8s2L/xJw0G6G1nH6ExTpbO6YcTy0j5E/OlTIjvQCZRNMWWDQF6P6kXyR9buh4
Jz2fUFFsDgRIozNSVv2icyfgc+3isQ==
=1zDI
-----END PGP SIGNATURE-----

--DJF/VSDq3N4d5oeh--

