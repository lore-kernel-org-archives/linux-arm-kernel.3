Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DDC1DC71136
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 11 Jun 2025 19:55:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=n8VN7KS5iGSvBwzdJdE/AaBiH44qZJzVl4sIq9CD4MQ=; b=CSXHYD1wq3TN1UTxg2LGhVxvIC
	VD/ZULrO1Va8Vr/OzPegFbgqQ7T4JbIhsd7hUIJ8ZX7+rtHyLFRgcg6Eqhngi5lnXV1wZkgt4tKOf
	dULgl+2+6UgE3ojX81GsH2diTeZAzYKevY7mPixm8j+2XWUMH9datKLrtbag0zmxZH9683Ar5xiCt
	EPCS21rvqPG951oRFSO0gFHJpWxrQHB5Yfs+jbISxoQMx9hvVWF78SOA0PVrLxrGA3Hb4ebYOTD1r
	WAFjI8IhxNkcPF+gS225b0/7XUOdTucOsBc8KlDfQvn4tGXVgc7EmUR5eneNVGZEJRqam+xcWR4dY
	oQKZjIHQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPRXc-0000000B31c-1nSI;
	Wed, 11 Jun 2025 19:55:20 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPNOW-0000000AP60-340A
	for linux-arm-kernel@lists.infradead.org;
	Wed, 11 Jun 2025 15:29:40 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2ECD86154E;
	Wed, 11 Jun 2025 15:29:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 030F0C4CEE3;
	Wed, 11 Jun 2025 15:29:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749655779;
	bh=n8VN7KS5iGSvBwzdJdE/AaBiH44qZJzVl4sIq9CD4MQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=gz1O+OKOkBNhiT66HRpiwpzAnv0/E2cRN0kSYC+fuGrpmuafe5hz/0VNewitFUd8o
	 fDmwpZ7iZUa7SCUp59NqamhiDON4pS1gQeIFEdC5wQWcdiGev6ZkJgE8+LTDdd8FoX
	 5Jv3kdNU44YtzuHWrfOYFCjEikM1d1hye0nwtg3pzn8dF7/4KCD1kc7M7em4gyBoLU
	 nycc9h2Ls1Q1kr8alF2X+0qVSZxXc4nEUNqMJ1gbXtdYDui3gGTN0GaNuPJeYEt77T
	 DYhDtUYOMsTFWZQfKMHcaNvtLqxtqc2jNUh2xcVcLR2vAfUVzW3XwQTy6PH1x46f2D
	 2cXLFTk9VRcVQ==
Date: Wed, 11 Jun 2025 16:29:34 +0100
From: Mark Brown <broonie@kernel.org>
To: Yeoreum Yun <yeoreum.yun@arm.com>
Cc: catalin.marinas@arm.com, pcc@google.com, will@kernel.org,
	anshuman.khandual@arm.com, joey.gouly@arm.com,
	yury.khrustalev@arm.com, maz@kernel.org, oliver.upton@linux.dev,
	frederic@kernel.org, akpm@linux-foundation.org, surenb@google.com,
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
	linux-doc@vger.kernel.org
Subject: Re: [PATCH v7 9/9] kselftest/arm64/mte: add mtefar tests on
 check_mmap_options
Message-ID: <22c43b81-9e7b-4e49-96bf-ff242ea0cb6e@sirena.org.uk>
References: <20250611135818.31070-1-yeoreum.yun@arm.com>
 <20250611135818.31070-10-yeoreum.yun@arm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="Qyujq2+uQI7uLhxI"
Content-Disposition: inline
In-Reply-To: <20250611135818.31070-10-yeoreum.yun@arm.com>
X-Cookie: No skis take rocks like rental skis!
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


--Qyujq2+uQI7uLhxI
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Wed, Jun 11, 2025 at 02:58:18PM +0100, Yeoreum Yun wrote:
> If FEAT_MTE_TAGGED_FAR (Armv8.9) is supported, bits 63:60 of the fault ad=
dress
> are preserved in response to synchronous tag check faults (SEGV_MTESERR).
>=20
> This patch adds new test cases using address tags (bits 63:60),
> corresponding to each existing test in check_mmap_option.

Reviewed-by: Mark Brown <broonie@kernel.org>

--Qyujq2+uQI7uLhxI
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEreZoqmdXGLWf4p/qJNaLcl1Uh9AFAmhJoN0ACgkQJNaLcl1U
h9AFUgf9FX/DvUnHGLW/uorzyHhr+bDqnu4nGYEZpT00NYUHOVAorHI+6MjbgKll
GnAugE2VFVKxWDy4+s2qIJDuOXGcJQmn96SwAv1vrHSzQdGXS39uDhS2UH64AuvR
XCEvjFuATQ6ijpE5ynuhHLdVex+Ra0dxzLazfWukXMtNuHoIENKd+JMsr4dAw8Lp
rYyU/k+OUML9huovKbjloW8joyelbNYtePbIq/rcOWVFpVfHcIAi7jL4a/NZSQhi
fK87bl2zOzalNiW4ENPW3VFMEPiXOCkp/WQ6sZhJKVI4h+USDF/ymwfYa6gnWy1K
D8ENSzMrMq1Uafw5IgvHtIp1W70YHA==
=dcR8
-----END PGP SIGNATURE-----

--Qyujq2+uQI7uLhxI--

