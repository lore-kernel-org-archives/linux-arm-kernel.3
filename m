Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1AD16C83F21
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 14:17:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bOJ8SJUmwY1xIJRqQBze5bezXdl7AQhRGfQSUOpqANE=; b=wQkgjCvIaAluu9dbrKyJpALa/W
	X07mqIctRBgPWsIiLvhXier+mV6ZEVW0oy0jcdZpu3kGQ7md72C4AS5wK2p2orurXCt4wFguylBTH
	+dTvs4MuoE9Ug+0ayrsQNs5rtFiMeBfP8Du+kbxRtaZgPeAkR84rQUJFEzyhOVAyrXV82H+n/z0MH
	LNb2daLUBbTsCHE9XHYSXhWA7TT4846IAN+bVnvqBEyLHbRo5Y//YAJExgIIWEABvDlov7Tpmptg6
	fLLTGmCwx/+lwi9mO5pyWR93B3TAVNNnBOcxPmIU3DNEwh1INe9W34WRCifCzWGDLb+m5Dsy1Ab8F
	ePeRbC4Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubgSr-00000005Kp6-46Ef;
	Tue, 15 Jul 2025 14:17:01 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubfIT-0000000592T-3AgS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 13:02:15 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id E7CD5A5497F;
	Tue, 15 Jul 2025 13:02:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54820C4CEE3;
	Tue, 15 Jul 2025 13:02:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752584532;
	bh=bOJ8SJUmwY1xIJRqQBze5bezXdl7AQhRGfQSUOpqANE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Wa4lt46hR9M+XTqb16d4GClW13D8t4MOlHF6PRtU4lkV9lxJg4UJz5RXmx+HxJl3V
	 8K46nZJmPk+x3imGfk5hPBGmobGtu9CCb+NiQ2uQpUVgF2oRdFMRShjwpuR13Ge3eW
	 UbBBj2HJNu8ob4wQ6+wlQLQGEopVzZwgkpFWwdBdLvS5N0VWW2uZUoxiyY9FZa/urS
	 ymbVgNWPSPphkHmaYXhQybks1By5OfK+8LUmxMNbmB8jbxbIwrWf3JL9pfpFkicAc6
	 62BBTk6Qua+FrIQ1ohAWfo1d7mLyHfOusS8KrFQUChhA2GMRg7JvenidfcwG0SRY5B
	 If0dYrsAXXwmQ==
Date: Tue, 15 Jul 2025 14:02:08 +0100
From: Mark Brown <broonie@kernel.org>
To: Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, stable@vger.kernel.org
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	Yury Khrustalev <yury.khrustalev@arm.com>
Subject: Re: [PATCH 6.12.y] arm64: Filter out SME hwcaps when FEAT_SME isn't
 implemented
Message-ID: <c586f05c-a077-4865-8529-08aaf16b8bd6@sirena.org.uk>
References: <20250715-stable-6-12-sme-feat-filt-v1-1-4c1d9c0336f6@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="3fAbC77fD/JeM77s"
Content-Disposition: inline
In-Reply-To: <20250715-stable-6-12-sme-feat-filt-v1-1-4c1d9c0336f6@kernel.org>
X-Cookie: Your own mileage may vary.
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_060213_861653_444450B3 
X-CRM114-Status: GOOD (  10.22  )
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


--3fAbC77fD/JeM77s
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Tue, Jul 15, 2025 at 01:49:23PM +0100, Mark Brown wrote:

> Fixes: 5e64b862c482 ("arm64/sme: Basic enumeration support")
> Reported-by: Yury Khrustalev <yury.khrustalev@arm.com>
> Signed-off-by: Mark Brown <broonie@kernel.org>
> Cc: stable@vger.kernel.org
> Link: https://lore.kernel.org/r/20250620-arm64-sme-filter-hwcaps-v1-1-02b9d3c2d8ef@kernel.org
> Signed-off-by: Will Deacon <will@kernel.org>
> ---

This needs an additional signoff from me, sorry - I didn't register due
there being a signoff from me further up the chain.

--3fAbC77fD/JeM77s
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmh2UU8ACgkQJNaLcl1U
h9AkyAf8CTyXRFAOmA2UW5KB9lyNRiQUjIEy8ntNvLDc1wUCqr7h9VwSjNVeKEo5
i0SAWtzT04UMrFordXykPqRJ8ZC07MEDEnMTJ0JRG/wVVc+MwYm8OzGRSAh8EX3o
EymAqKldtvgc27fX/8btlgLLv5y7UNJBQKYEYNJvUBlo5Mpw7QerBrJGRVKK3XFO
/xGtPDGtutdnLqM62sM7kGHqVx9nusATF32e3Tp0TiExCS6IguGmAA20T61zU/Mc
NIGl7dEfQm71BZkHYACpzrOsjQvXT2nSrsslBzj5nDSp69hfxoZtXsjHDybWymw+
5eiwwbHDdXiE5kOhTHoV1nYPAwgs7w==
=ijxT
-----END PGP SIGNATURE-----

--3fAbC77fD/JeM77s--

