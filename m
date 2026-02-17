Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9839BE68160
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 17 Feb 2026 10:04:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TUwPDbTunD5kmKcSfeNkBt7yJAJr8lZ1ams1gld7aVI=; b=fwj2qFUbp1dnEGM8T+VHxUDzos
	kRAkDdo/nT5CylxoRWnN/LnC/UeCWiSmaDbYeFp3gy5MDBY5UUgkmkHtVGCUzV+IvmT33VYu5KC2t
	TRcJ+PLkRsN9qA8/wgPK2Lydg2kI3tmhndt6n1Z/WgikdFvIyp0byEKgXvVlIbp66lY1WND6TEDSI
	UZb0CvMCNZCFfg73SP2PsufHNJzBlLXnO8F9Cqe60oto6XAajPntYo7wgPzxRlg3ZE37CP1d9W6s8
	luQp1MeKHnF15mp6+ZvW86Gn0bVbbjsxrTLdX3UOXZJ1GytsRjgPq2UA5VZh4t8qiYEIY7FTFHpYV
	Ru9/baZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHw0-00000007zg4-3MWP;
	Tue, 17 Feb 2026 10:04:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsHvy-00000007zfx-3L4D
	for linux-arm-kernel@lists.infradead.org;
	Tue, 17 Feb 2026 10:03:58 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D4A4360126;
	Tue, 17 Feb 2026 10:03:57 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3467FC4CEF7;
	Tue, 17 Feb 2026 10:03:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771322637;
	bh=TUwPDbTunD5kmKcSfeNkBt7yJAJr8lZ1ams1gld7aVI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=CqSeo6MiWIQ9gDbvBcz2DnsWVH4DWgD2X2QdAxnpADThg4FaPTcIQajqMMP1LLv4I
	 LIbNA+rhcnV1z8eH7q/PgBZdpGq2qTsNpVlOTo4+KP5wQ2k3F50Jl8xgcmhGXH+4yl
	 Yi+zDtLExYkgMLxUi+LjyctDpdwiEgw8Mmmg7j4Fx9AM6zUb8dn9fFfdlATqoG0gCs
	 aWpGq5qxi1IoRIXXzmIdAHqTMNQJBvDx6ssyb5F5csj8281O/4x7Aja4Ud19+H7pVC
	 Ksn1ZxdOTNEgSH0Vqg1zx9CQFRuzJlezFEQmRuVE4W24ArulzLeawp+9B9HP2Ish5+
	 Hw3mYxqwv2QAg==
Date: Tue, 17 Feb 2026 11:03:55 +0100
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Cc: Jonathan Hunter <jonathanh@nvidia.com>, 
	Russell King <linux@armlinux.org.uk>, linux-tegra@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, Linus Walleij <linusw@kernel.org>, 
	Drew Fustini <fustini@kernel.org>
Subject: Re: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
Message-ID: <aZQ8iBRKLfzrzJcm@orome>
References: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hwhpsufjpg3xf5w7"
Content-Disposition: inline
In-Reply-To: <20260217-soc-tegra-arch-kconfig-v1-0-81bf5674d032@oss.qualcomm.com>
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


--hwhpsufjpg3xf5w7
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 0/3] arm64: tegra: Make ARCH_TEGRA_SOC_FOO defaults for
 Nvidia Tegra
MIME-Version: 1.0

On Tue, Feb 17, 2026 at 10:16:35AM +0100, Krzysztof Kozlowski wrote:
> Renesas was fixed (thanks folks!), so let's fix this one myself.
>=20
> By convention, only one globally selectable ARCH_PLATFORM is expected
> for given SoC platform, defined in arch/arm64/Kconfig.platforms or
> arch/arm/mach-*/Kconfig, because we target a single multi-platform
> kernel image.

Sounds like a bit of a made-up convention to me. I don't have a strong
objection, though, so feel free to go ahead with this.

> Dependency
> =3D=3D=3D=3D=3D=3D=3D=3D=3D=3D
> Further (2 and 3) patches depend on the first one, so should be taken
> via one branch or some cross-branch-merges.

Maybe we should ask Arnd to pick up this series into ARM SoC for 7.0?
Most ARM SoC stuff should be merged at this point and since this is
essentially just a bit of cleanup merging this now would avoid any
potential conflicts for 7.1.

In any case, the series:

Acked-by: Thierry Reding <treding@nvidia.com>

--hwhpsufjpg3xf5w7
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmmUPQsACgkQ3SOs138+
s6GC1BAAvfy4h/23klguGd2eGNVTW+67XFmGmNer98k+vYN2BdEoIgUvrGbAmDb1
fTr9fwy8R/lDL559mbH//HDDJcF5CEDtF94VCJfO9cIAr6nJcHB7Hz6QGCo3FYBr
4mioICOtDuk/CEDLFzaE2jVX0qZdrKQYWVvLHVydTvQPqYjo2XLV2uCAaAToM1AZ
s2JEloKbSSGGPNWruArn7FsQFLH5b+WDBTOzwTRTc8xkXcocuwyy+joEt8qS6Xge
R+MAHRSOYGRISCCgIDMOoxvIs1vhX72UurWWb7C5nzhd50OnxgWDFJT9fy7/zKra
LdIMvcqslt4mfgcWg4ipkjGIIl7SzwZodEaitHP8XTRK5XG/STVP1hCgwJCJovEN
jzGEarK4T5XoXqwoEF/al+ErvHGgtDDX83/ur1KuAIpf82vZA5+UiaDPd6FB5+vJ
FGsdwE7JUmh0yNCHPeGAnA0xnrbDv8s62uUHExrtaftZROdJIClSAbKzQ3oUPzSE
7sRbJYlvkc2vRW8cURhLS1M/0RbWYtMbjkzxCvaOo14qLyDCzi+Hbd0Z/1YIhvxQ
DBjV9Ci0OMY4dd+kBSp0/RM4qE22+scXR07KB7kO5G+/GLv9Z0ukXZHkXvam5Ij3
XOcyo5eGhvPvhcg8X5q9ucffwOhWarA78/QRZhVPtkAyFCHHuAk=
=wNB3
-----END PGP SIGNATURE-----

--hwhpsufjpg3xf5w7--

