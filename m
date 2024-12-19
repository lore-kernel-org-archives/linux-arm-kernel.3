Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D64EE77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 16:58:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wp0oaqsXF/iBOoZvz9+PuRRYfUJuPOenMeX0zhejQi0=; b=qAR54gB1lb4LifRbc4Q0JEwndH
	fuWmR4f4Yd2T2N/sBo3AL1FbVHlGFZa8zOUHtHNy7W9eCxi4/L6gvpKxAN982Pnjzt4hwzHoNlLpl
	ndz5xCsnqDXlymygfyUW6AK6kpcxxiKu8LjwXLr9rmR6QkY6Kc5Q5FU+53+xm1VbJTEVbdR4MlUbA
	Okbya23GaHRSTbhbcmN/XsZ35LDk5BgGsC0CzbQ8wdLiu478xljFiCBfgtTwhkv5+uW6GZ7S0ENJ6
	Z7XudTxjfPipK6O2TeqnLnz1UAWV5wtfSMdr3W428lyJ0L/cAiJjzP2CB3vsdi+j2A+CYubW/iW2b
	N/kR243Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJqz-00000002SP7-2vwi;
	Thu, 19 Dec 2024 16:58:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOJi4-00000002QJm-08VU
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 16:49:13 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 751E95C5820;
	Thu, 19 Dec 2024 16:48:29 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF3D1C4CED7;
	Thu, 19 Dec 2024 16:49:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734626951;
	bh=Xm84D3l3NpU5NKUTVyT8w/ufo2rcyj5nHyqMIUT7JTk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gReFUXPTQhLSY/INzkO5P1595KEEU3wS+8Jxztwm7clFveUxNhylRJPxjR+jv8TDJ
	 Lf4rHs1RE/DpdsKSYWr8/aYvtXFFl+KTOPjxFW3D0OIZlTP3KELzhr2aSvkhhAzMif
	 ClvvXbNS2jeUub0gidzktAKrb4Lu58CmJ8fXeSO7PnD4W6VjF/Mlj/7DyZxj+oIWjg
	 5qy7XMtTHfTNbWpEg3VE4qEVbLACsaGjJi9uHwGv7DxupfDX32+jyX8R1tib5/1XFx
	 PpOx1RUr6BBWGZfuC9p4Fq/nq6FducIfsW13WOqCfTC9GHdzm+KNUK8AqROVW8B7uR
	 u+pzIgoGQM7Kg==
Date: Thu, 19 Dec 2024 16:49:05 +0000
From: Mark Brown <broonie@kernel.org>
To: Will Deacon <will@kernel.org>
Cc: Catalin Marinas <catalin.marinas@arm.com>,
	Jonathan Corbet <corbet@lwn.net>, Marc Zyngier <maz@kernel.org>,
	Oliver Upton <oliver.upton@linux.dev>,
	Joey Gouly <joey.gouly@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Shuah Khan <shuah@kernel.org>, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, linux-doc@vger.kernel.org,
	kvmarm@lists.linux.dev, linux-kselftest@vger.kernel.org
Subject: Re: [PATCH v3 2/9] arm64/sysreg: Update ID_AA64ISAR3_EL1 to DDI0601
 2024-09
Message-ID: <317e06e8-6e85-48cb-902b-4b3c7748bd8f@sirena.org.uk>
References: <20241203-arm64-2024-dpisa-v3-0-a6c78b1aa297@kernel.org>
 <20241203-arm64-2024-dpisa-v3-2-a6c78b1aa297@kernel.org>
 <20241210170953.GB16075@willie-the-truck>
 <b859bdcd-7343-4d53-9f3a-f374deca725a@sirena.org.uk>
 <20241211224015.GB17836@willie-the-truck>
 <248dea18-bfad-4ec9-9a7d-5c87c7f48c84@sirena.org.uk>
 <20241219155547.GC24724@willie-the-truck>
 <51632b4e-19a0-487f-878d-f03abeea2553@sirena.org.uk>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="NY5bhLdnipifDOsr"
Content-Disposition: inline
In-Reply-To: <51632b4e-19a0-487f-878d-f03abeea2553@sirena.org.uk>
X-Cookie: You have taken yourself too seriously.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_084912_112679_3B5E0FC3 
X-CRM114-Status: GOOD (  15.84  )
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


--NY5bhLdnipifDOsr
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 19, 2024 at 04:39:11PM +0000, Mark Brown wrote:
> On Thu, Dec 19, 2024 at 03:55:48PM +0000, Will Deacon wrote:
> > On Thu, Dec 12, 2024 at 11:33:05AM +0000, Mark Brown wrote:

> > > That'd be useful, yes - unfortunately I think that's still something I
> > > can't work on myself at the moment for the above mentioned non-technical
> > > reasons.

> > Is anybody able to work on it? Without insight into the "non-technical
> > reasons", I don't know what I'm supposed to do other than write the tool
> > myself (which means finding some spare cycles...) or refusing to take
> > wholesale sysreg definitions until it's been ironed out :/

> Similar issues will apply to anyone at Arm as things currently stand.

Oh, actually - shortly after I sent this mail I got a notification that
there's now an "Open Source Machine Readable Data" package at:

  https://developer.arm.com/Architectures/A-Profile%20Architecture#Downloads

as part of the 2024-12 which should unblock this, just in time for
Christmas.  There's just the small matter of free time to resolve!

--NY5bhLdnipifDOsr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdkToEACgkQJNaLcl1U
h9C2Fgf+JZ+qKMeiKATn1vrhbEFer8uBWjfv5s3Mvjk3inPB8EqptcDPjvRi1iCV
jt2bnBCvCS+xxyIh9jBTA0haLLsU0NQAWx0Xo9cj7NzlSmwgTANMS2IoONiAPNkq
vMVr4w05tASvh1x1zdFnGlzrL5MVi7HdlzqQDy0OadoHgoaGyEczPEragmsHVk/c
o63AwA9mastQ96ekaYBPYKA+Atl1N4LuneAJpWUYS3CWyNL6M0XRmmUt27AfwzEx
AYN0eWKqDbU+hgXw88AMTJCyvzaV1UEfd2uYUGQJbnlgzWhfY3UKkN3M300ELC4X
YWjZSRImDrolSzFOQPADzXjyMd+3RQ==
=ywW0
-----END PGP SIGNATURE-----

--NY5bhLdnipifDOsr--

