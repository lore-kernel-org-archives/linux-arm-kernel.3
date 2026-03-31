Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8D50AFF60DC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:38:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ah4aYsTQqd/mw+M+m3VmuYEWsGiyWr9G4IIk4YxqP6E=; b=imcFbqE2Srg2ZsSiHttllnnjCU
	9xw/IanI1nXcWHW1NDkbn15CFyGW7sJrDAuHyH2aoF8z+equr0csRV5x14l39EKg1NsCiRceEtgbF
	Ye3JEL8LPteXy4/9BCd+P02IB10qWenGsrfZ7EUxmSabHG4YwBnn8Jf+j1hT+s8Z3BihZj/cNWLj/
	cclSKsVdaR6IyAZSMCkAA4blQ6KtJ8J8Vzia+jlc/L8yr01VyPs16dxe/EeVpQQ4DR5mr6s9LVwUu
	5HvO1LoPwo3uBPy7N+s3/L8y0j60IleaclWIbTu7XF1hF/ZKKXwjskfvGNML92OJqINhhCnjdKaKQ
	TOKQthFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TgD-0000000CVcS-2Huq;
	Tue, 31 Mar 2026 07:38:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7TgB-0000000CVbW-1iV3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:38:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 319FC40BC0;
	Tue, 31 Mar 2026 07:38:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id AF8DDC19423;
	Tue, 31 Mar 2026 07:38:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774942706;
	bh=G9HJmQU8SgdtwfrY1W2nRepzj5FuKeUXX3qsWHsDCvk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=esOVEi9Q1nK07gXwMY08B8PsSZHCRWRw0S/fnTeEowEFPwThZBIAtm4W7K1RZuaC1
	 wiPgTml9x+uIEgGEc3TQAKkIVjNjSpHoelM1q5bETCLZLEo9wsQJlU4A/+R8EmTqRd
	 8K0LnIJASz+rYrIqLI/BZUyPxJwFVWkTeNCqFC8zv5/S6Q6a7Oui+xlRIeyrLujemw
	 jj3gzElrEHw0R7D1HH1HdDzD72sVl3sunK5JvzXMMWwaXoPjVAVrmkfAthyojba9bb
	 zDrKhwRlSwz/i2vGBO08JIcSv+ysQ2yi1RC68j0Sn09o9aEL12f9s26upHDQbhLwMs
	 cxSQiQXn0HAcQ==
Date: Tue, 31 Mar 2026 09:38:23 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
Message-ID: <act5kGG-4mZl0j3p@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-4-thierry.reding@kernel.org>
 <058d79b7-3d4c-4f0a-a95f-b2e3582a4fa7@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="u64yt5slajlaoiug"
Content-Disposition: inline
In-Reply-To: <058d79b7-3d4c-4f0a-a95f-b2e3582a4fa7@kernel.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260331_003827_485583_66A7A0D5 
X-CRM114-Status: GOOD (  16.22  )
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


--u64yt5slajlaoiug
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 4/7] ARM: tegra: Device tree changes for v7.1-rc1
MIME-Version: 1.0

On Mon, Mar 30, 2026 at 01:46:32PM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2026 17:10, Thierry Reding wrote:
> > ----------------------------------------------------------------
> > ARM: tegra: Device tree changes for v7.1-rc1
> >=20
> > Various improvements for Tegra114 boards, as well as some legacy cleanup
> > for PAZ00 and Transformers devices.
> >=20
> > ----------------------------------------------------------------
> > Dmitry Torokhov (1):
> >       ARM: tegra: paz00: Configure WiFi rfkill switch through device tr=
ee
> >=20
> > Svyatoslav Ryhel (8):
> >       ARM: tegra: Add SOCTHERM support on Tegra114
> >       ARM: tn7: Adjust panel node
> >       ARM: tegra: lg-x3: Add panel and bridge nodes
> >       ARM: tegra: lg-x3: Add USB and power related nodes
> >       ARM: tegra: lg-x3: Add node for capacitive buttons
> >       ARM: tegra: Add ACTMON node to Tegra114 device tree
> >       ARM: tegra: Add External Memory Controller node on Tegra114
> >       ARM: tegra: transformers: Add connector node
> >=20
> >  arch/arm/boot/dts/nvidia/tegra114-tn7.dts        |  13 +-
> >  arch/arm/boot/dts/nvidia/tegra114.dtsi           | 221 +++++++++++++++=
++++++++
> >  arch/arm/boot/dts/nvidia/tegra20-paz00.dts       |   8 +
> >  arch/arm/boot/dts/nvidia/tegra30-asus-tf600t.dts |  21 ++-
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p880.dts     |  23 +++
> >  arch/arm/boot/dts/nvidia/tegra30-lg-p895.dts     |  33 ++++
> >  arch/arm/boot/dts/nvidia/tegra30-lg-x3.dtsi      | 174 +++++++++++++++=
++-
> >  arch/arm/mach-tegra/Makefile                     |   2 -
> >  arch/arm/mach-tegra/board-paz00.c                |  56 ------
> >  arch/arm/mach-tegra/board.h                      |   2 -
> >  arch/arm/mach-tegra/tegra.c                      |   4 -
>=20
> Why does the DTS branch has mach code? Tag message mentions legacy
> cleanup only and such cleanup should not cause mixing independent
> hardware description (DTS) with drivers.

The DT additions for PAZ00 replace the legacy code, so it makes sense to
replace it in one patch, otherwise we'd be introducing a bisectability
problem.

Thierry

--u64yt5slajlaoiug
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLee8ACgkQ3SOs138+
s6GasBAAqfoYj2h+7y52qfWeJW22QsUTtH9yfVzleXtd59ZqOEw2GR4p6LrZ6Uy+
n4zg/h9yxRstb3K323jMfBhTDYLtotMPPnoeLzy5nb46PubAJD8AOTeN/aWoJWwx
39E7lrbXEdlwJPC857AHAbVtoPTKIh46PoCO7vCQcDqBHemo7umd1CNnJ+0GfY04
4YgCZRkGI9AMdPWzGJbzodfBd+TZvw9SfD4hl2Ey8QmAmp0E2Axs13p/4uqVIbFE
p3HdMVyhXecVuSWGozVeViahyqZPnWNarQHBcC+xiku6QWeZF7UfjFWi2E2XiWFc
STOrIZ7hB2Hy7BpzbVygvTVoSWD2/Rt9Duelp8glKmt+Q9t1Vn8e+dL0yLdeZPzh
QRK8rbE9RPQfKuPYeeS8OFtsOiZPaw7+So4DxkZmauhd3VzAwoBxkrXs7WKqFkdW
Y5m+xpsr9MFvkTlbnTPnZU0AOjFqkC1jlynKmjkbND+jzTvOnMWFdR+W4Yv2zmTV
QMcczdXYG1CyTXkII9Rz/ZCM5TsQ5twa5Kdemk4jf+TMgS9oepr4Xr2yjfvKwoXE
SnrnmTlTqjz10fsVsIWzC0005eG1cCKqHAX9fFByMVyYdpsMbLWydEoKvZ2Raadw
NUP2OtA124XEqquTBxxXYrpDfyekys7qEg0ZG9DBCJWhQGZ3k0o=
=ZBTf
-----END PGP SIGNATURE-----

--u64yt5slajlaoiug--

