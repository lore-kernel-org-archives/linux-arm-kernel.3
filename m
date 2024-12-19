Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B88D2E77184
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Dec 2024 18:50:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/FLWDTPFbLG9DG5vzOMUOczrPmOEfAof7+piK4UuRCg=; b=ymT9lA5NYxjU2c1FzpPwvBTu0R
	LOFdfAbFVQllhQ9AF7Ujnp5aLizVp+vl/aKJp8D89bH6FNQ0Otk4XomI863laifEou5NwtvlnXdzB
	GAxUVy7MChm3lYz603WkgfDNbEkxMtoUquOGB5A/r7QTW3fv21MxbzO0yRwdK7/FSnReDUirQNWuD
	ubWS0/JGY+/kRWjj80a26NtjrGFbnGihlY60otziZHSmNItyGdQyVUYs4f+bkbgeW8sCFz9o+85Hk
	hiNMTu3nOLv4ovvOvoGbQSaqMbGQn1UYAzCmQduKL9GAA8Fm1uFW7GBCi5//hBoqg5WD0HpdGHYum
	h1FvSoEQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLbe-00000002mI1-1EBX;
	Thu, 19 Dec 2024 18:50:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOLaX-00000002mB7-3fva
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Dec 2024 18:49:35 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id A6A46A4123E;
	Thu, 19 Dec 2024 18:47:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D969C4CECE;
	Thu, 19 Dec 2024 18:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734634172;
	bh=/FLWDTPFbLG9DG5vzOMUOczrPmOEfAof7+piK4UuRCg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=TCzzr4TX35E/WB6YctHhMiH+VIJfPOGsEVrrnIIUz+m4ocaKkh57u4JuiNAfiCfa4
	 /pbe5jcnXJAmpWs0dlBZdDzF43U2KEAMFajh5S5QipBJEhZIXAbPSeH8ONlW3Hd8wu
	 Thpx3+mzPCjyg+BvF2ZEI4U77k5vVZ5jWlOkZ9h+Fic28C1bphU5KcfXn62kPdHKS6
	 VxvG+lLl7ZHntOGQgweR+6jxFYzfYHzRoHuPbmixq435nm5AMt5eipV54NBHr4o7Cr
	 jVSzLl3HNzyQGDq78RlwW+sSuDMqrWTkkZBl6ZdJMmEs7YMTHFk4UdCIrQkJ94Fopm
	 IIAks3/lx7kSA==
Date: Thu, 19 Dec 2024 18:49:28 +0000
From: Mark Brown <broonie@kernel.org>
To: Marc Zyngier <maz@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, kvmarm@lists.linux.dev,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Mark Rutland <mark.rutland@arm.com>,
	Joey Gouly <joey.gouly@arm.com>
Subject: Re: [PATCH v2 2/4] arm64/sysreg: Get rid of the TCR2_EL1x
 SysregFields
Message-ID: <53a95b37-0b46-4ec8-bad6-a431f81cdc44@sirena.org.uk>
References: <20241219173351.1123087-1-maz@kernel.org>
 <20241219173351.1123087-3-maz@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="a+0hFz7K0adwt5ZB"
Content-Disposition: inline
In-Reply-To: <20241219173351.1123087-3-maz@kernel.org>
X-Cookie: You have taken yourself too seriously.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241219_104933_979413_DC9A8B85 
X-CRM114-Status: GOOD (  11.71  )
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


--a+0hFz7K0adwt5ZB
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Thu, Dec 19, 2024 at 05:33:48PM +0000, Marc Zyngier wrote:
> TCR2_EL1x is a pretty bizarre construct, as it is shared between
> TCR2_EL1 and TCR2_EL12. But the latter is obviously only an
> accessor to the former.

Reviewed-by: Mark Brown <broonie@kernel.org>

Sorry, I thought I'd sent this on v1.

--a+0hFz7K0adwt5ZB
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmdkarcACgkQJNaLcl1U
h9Auugf9HdJD/xc50mrg+8pmJHd5i5jsUnscG2fMzBioJ6tkmETXISrPkaPiAmgv
OnJhO1CFYvP4eHa/OSBoh6+8SIDVyIxS20q6wNphB4TmkcEu4jDKa7zJzcYCanuj
0B/9kq0uuVOajjg/5Fsx0Gtw9u1a28YJAjt3GlP7tHQXLnGt1ao0D8jr00kG7bvn
12zTsJ2gSJ9+/3X82hM08l91I7LFICIH0MQuoE0cJJkqWg9RBEqZP5OjWPtQ3pF2
NxPgnyt2N1sJbksED6M8V/Bmt2WBcgslnSQ98Gf/9YB8MndEDO+hj4N+nK1xpnQA
f6pBzicIWev9whRTmkmhIVNloAHO7A==
=Wlkz
-----END PGP SIGNATURE-----

--a+0hFz7K0adwt5ZB--

