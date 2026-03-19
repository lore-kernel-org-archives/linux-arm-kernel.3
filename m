Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7223109024C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Mar 2026 16:10:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To:Cc:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1dZYoeSj7mNH1G/4/04rqhVLZ7jxvGU1UEcMS9o0Rxc=; b=3J+0viWXtz3EdVXLHpCrnDVEA0
	oNF3QtUPIn0AoGKQBx8szcJJ651WvlUud0Bo4d5prB4fx8caET+RGAlILoZy8ii9uzJqKd6ao2uc1
	V5Nu5NorQLgKSVfCcvdBU22iyBbNn5KRDBV8k7qgjUdo1xhiF+yHBLchgqffMiEzH8AJO6jSCupbg
	xgq2++u2ciy/s1bR3VQ2fGaX3j6jR5zHewm6d4YZZr0oMCK4b55yN5MRxTm7ikhvjPyYPx7jr6gMA
	IQtAWDbmJHjYpkOaZolL8tsouHpcTT2viCJHg/k/sVwnMJo7pM6N2RhI2xjFxPMHR6XzzqZq/IIYG
	hxsIeW9w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fwb-0000000B2Ay-2Snm;
	Thu, 19 Mar 2026 16:09:57 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w3Fwa-0000000B2Ar-21qT
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Mar 2026 16:09:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 87FF960097;
	Thu, 19 Mar 2026 16:09:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D9C87C19424;
	Thu, 19 Mar 2026 16:09:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1773936595;
	bh=Vm2RXvDdQvy8W+GSK8JzkxylVhZ9BxfcKJfddBrAzd0=;
	h=Date:From:To:Subject:References:In-Reply-To:From;
	b=cbJBCvyzcCEJovPDR66IWn0++v3e8jW5tk6B65tsLEQop/ICx15fABemTFkaLeICG
	 RWb/ymxDdT0bIxO/i4t0F0uBr1tVDS6u7RSxtZHvsDqaUZWufmWPuyH1u+Jo3MfHGv
	 lOkGIQqW/SRqRjRerum+17dSakQ7eRUhn0+v2n87XR2840EVAxGUEubXk3LBKHBiad
	 nZmFtvkn2Ufdi6Wb4u97OetE8KMiPb3eC7a4qCwSA+gZBlYnu4UXF7wKw0ts74+aH4
	 e+EpDylXakXGFpzDKRhg/pgaqpwFPZg9WGGUpWvayWy0yRclOZ5BxlMIFywfn0Xg7G
	 tt01XcPFl9J3A==
Date: Thu, 19 Mar 2026 17:09:52 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
Message-ID: <abwfvqfw4CYIUAoX@orome>
References: <20260226150933.4067324-1-thierry.reding@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="ggvqexil74n6ufhr"
Content-Disposition: inline
In-Reply-To: <20260226150933.4067324-1-thierry.reding@kernel.org>
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


--ggvqexil74n6ufhr
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 1/2] soc/tegra: Add Tegra238 Kconfig symbol
MIME-Version: 1.0

On Thu, Feb 26, 2026 at 04:09:32PM +0100, Thierry Reding wrote:
> From: Thierry Reding <treding@nvidia.com>
>=20
> The NVIDIA Tegra238 SoC is an upcoming new chip. Add a Kconfig symbol to
> allow fine-grained selection of support code for this chip.
>=20
> Signed-off-by: Thierry Reding <treding@nvidia.com>
> ---
>  drivers/soc/tegra/Kconfig | 9 +++++++++
>  1 file changed, 9 insertions(+)

Both patches applied, thanks.

Thierry

--ggvqexil74n6ufhr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmm8H9AACgkQ3SOs138+
s6GLZg//QL1EF61CA85bLrtZfmGSU/eUqsHpHelresQYGH7LFwk0nc7PNgUxfGCT
z7f9XtWa9dtsdDDeo+RZjnEYMGJ3UdFY7rguPgnL6VolWt22MFNAIrYBsl/d6kMK
zbaDF4xsX7BYPYN7IXbW1Wk1ZMb4wWDgWcC2udCqohdtpyhooCVED7XO3qLCCV9Z
Q96LBTF2GQrkUeo4jy07RIfEuqyYIW6hffrJT9qJGnpY4Qxd+RD5J272cCixpPfo
1U8uS4TZyQBwPfaGudduOg6Aqnjzd0XPJ5lcIJJCtuZdDwkMD5Il0jEEKdGrLqks
0SmxbnC164wd5PVmi6bcY08GclmNAHiuWl+UwMTQinALG/HChgJZ7aT7H7i0US9M
gIqSi3bcXO1I0wGWfKOvQCCU2U/mUcvUqpltMpF+0dUqw61OuozyDdOyhpfBMRea
1gPQ/i+XJMJ05ubWIhqqAUqohEaRCr67mGEVdyMh6gJbL9AADRY8Cu+nQ8jAkJn3
oW/UDvpAdlCGPGFAJXLwoeYtMNbL5TNVJJCFY9DREv6jecp4jlMYS9Hk7vDloqhT
7yg0cF/no8pTKRKHhEfzO6wHjV2vDDC5kHsNULnDgKRadGgMDHqU4qErwFwWM/K8
XdsQ3mzUGjcJnn+Lwq5Ao1N1dIoKWws8/sYTLBEm6Y6BL/x3Uow=
=mboK
-----END PGP SIGNATURE-----

--ggvqexil74n6ufhr--

