Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88607E7717F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Dec 2024 21:04:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F1GGXFKM2vPoBAMUY2f+aZJfQU5i2+Rz7sxAkluP1WE=; b=nP9FZv/dffhll5EkEqqhqe7WVJ
	VAobWFy6FuCEfPYoVjTl9IvkHMf50EDJeXHv25MhjSgzQPJDRggtJXzb6atD2ReVmejqHt04Cdl0A
	k+GhV2lW/B7zuExWRnnYtKvsNXtrZ+fKrCiLTHM7LjgfJ4E+LT7BYV3bQ+WvDOAYKCVKjOOxMRv+N
	FaGNCC7x8hCMvbxgu8RJMdsXD5HmP8G18jDYsKXzCr44PHutePtPE01YauhQxR/Z4M/J/dshpQXz8
	VJfD12hy3BVppEiepB6seCH3jCG+O59H9gnfH+zeqBgIiQhOYbJ1wyiCgSTrXSzHkjsyBoeSKJY15
	2+fgay7g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIGb-0000000BMxh-41Bg;
	Mon, 16 Dec 2024 21:04:37 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tNIFW-0000000BMl7-2hgW
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Dec 2024 21:03:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 2504CA41A44;
	Mon, 16 Dec 2024 21:01:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 60541C4CED0;
	Mon, 16 Dec 2024 21:03:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734383009;
	bh=F1GGXFKM2vPoBAMUY2f+aZJfQU5i2+Rz7sxAkluP1WE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=c/xbPaZcdNjZ9OIc+YLMwcwx6dC1yrtNJJ2i/EBm5Nqs2+xptnf6UXTcNCH7b4lmm
	 DHw3zP+c1a46yc62cnfnOrXLeuIK0WoA+pOTzjXytub1/GCV9jb+DHmRNSgII5Pp/c
	 LQCuOPYMmwYnq9pQKIuqn1XHRoIML7h1SGTWpaaz1cXb7+Onp4untwC3E+JNiG9oFM
	 UF14Ri/Sg7Fcib5qfL79bai1M2YYBY+5LbDKbieIqurZ2FZKLNvmaLH5IImw3vSQWJ
	 8A3M7t2CkIQ2CBHITdYjh1ublI3jUU+Lfvl8kFArXXImqLuGn59ipC/LuKzM3/+LeM
	 yrR0YKHwU/LnQ==
Date: Mon, 16 Dec 2024 21:03:24 +0000
From: Mark Brown <broonie@kernel.org>
To: Anshuman Khandual <anshuman.khandual@arm.com>
Cc: linux-kernel@vger.kernel.org, kvmarm@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, maz@kernel.org,
	ryan.roberts@arm.com, Oliver Upton <oliver.upton@linux.dev>,
	James Morse <james.morse@arm.com>,
	Suzuki K Poulose <suzuki.poulose@arm.com>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>
Subject: Re: [PATCH V2 11/46] arm64/sysreg: Add register fields for PMSIDR_EL1
Message-ID: <ae09e8bd-271a-4942-ab59-f257a67b991b@sirena.org.uk>
References: <20241210055311.780688-1-anshuman.khandual@arm.com>
 <20241210055311.780688-12-anshuman.khandual@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="d+2E/ZEnkGK2vKyL"
Content-Disposition: inline
In-Reply-To: <20241210055311.780688-12-anshuman.khandual@arm.com>
X-Cookie: Be different: conform.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241216_130330_743077_4D06FEF7 
X-CRM114-Status: UNSURE (   7.70  )
X-CRM114-Notice: Please train this message.
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


--d+2E/ZEnkGK2vKyL
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Dec 10, 2024 at 11:22:36AM +0530, Anshuman Khandual wrote:
> This adds register fields for PMSIDR_EL1 as per the definitions based
> on DDI0601 2024-09.

Reviewed-by: Mark Brown <broonie@kernel.org>

--d+2E/ZEnkGK2vKyL
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdglZsACgkQJNaLcl1U
h9DjrAf/YmSAgJm0a5DqQgM6gTVYp0uHGDnVkImVfPXXd7Rz1jRCENLVQmBN9rUD
qVAi3jy7NcSP5SIKpEYNGotp1A2EUdUG5xH4rCzlzEOGyuf9tFd1PHTPsvZZN8XY
HhkZMQC6hW1MTw+sMm612Sbc9VLgzG6RuC1lSOUOVuEd4k/3d2oaLFIPawV49TZm
Kw4U05rq0TpAE6D5RDgWGWJXeliq8RqFrGPnWi9Pr5r98/VqDOyz/5sqjznoUvDo
SxnBVTahAbUlA0KaRHg57EW+jVxI0yzB9YT8hRuZHXHia8xMGQiPPNycDMO71rJV
tikpTZzBnYMW0yid/LmKVozwScpN9Q==
=kQw8
-----END PGP SIGNATURE-----

--d+2E/ZEnkGK2vKyL--

