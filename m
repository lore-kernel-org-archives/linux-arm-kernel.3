Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE3C1FF60D8
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 07:53:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OGc0JP4z8HBvs6yYM1Znmg7X4E80vEIrGgsWSucwD+0=; b=zISIXEJc4+XlXQ48FznFEnezXx
	3pdxigLwlraUJjyQKbSgXN3+zXf5WJiEh9kTCsD1wPdqUUPxVTYHnNOq3cnSGMni1Siyg63dWvVpp
	LPDMWehYpajxxDRRmqqozDeMu7PGHWTsrS/ABG1/KfPmCgyRy2jlsnmvgTip+CyEDT2I/ZIX4akqp
	j+T5GCH2A9gJgWP44Rw4dhDgVGzSaVV6v12C9WxHaOSD/XoInZiJNAfA/yPFGFxeu9PnlH6q+hKmd
	4rmkt85UXwd4zH5WejOr4x6q34t4M61/FOljZ63rXALLPxtq1kGD6suja5rebuI8DeperQLX+fJNH
	g2SBi2Eg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Tud-0000000CXBK-3IPU;
	Tue, 31 Mar 2026 07:53:23 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7Tuc-0000000CXBE-3DWN
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 07:53:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id D387960120;
	Tue, 31 Mar 2026 07:53:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 079DCC19423;
	Tue, 31 Mar 2026 07:53:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774943601;
	bh=boYlb4YvS37g0Ecx4Rh1sBQ8wiPdxAaggsMqCIxsMZQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=glg1QJvjej3bqtlG2qlwmCjpGQJetuLUCx77GvoFhCvh0RWEnh4ztVghiHZV7sQan
	 Ltwe71vDLS6AbSLXsmFf3kJwEVOpqhn4kRnR7o9ck8VBz/UG2OjbDkNv441NY+7zq7
	 3Bt0ND5TRIFbGb7ahJ325UU2Lp6ElV92+LTm5EAGIOpH/qReddaTZk3QcZYMQNL//1
	 OTiU/CrllwfywQJe6oLFEWfmB3Yp1XeHBivTjVvr54XohYObho94XrRO+7795w7I6/
	 ocjOQ/SDILa4POfU3ZAFOhh4AVsjqd6XJ05Z8UUxnDisMXnfxaIbOvkbQR26rJ9s7X
	 WLG/Omt25OA0Q==
Date: Tue, 31 Mar 2026 09:53:18 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
Message-ID: <act77WcvwYedN0Q8@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <20260329151045.1443133-6-thierry.reding@kernel.org>
 <7b9bc5d1-7a1d-456c-b280-5f4dc969609d@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="hho3lmqpafndqu6h"
Content-Disposition: inline
In-Reply-To: <7b9bc5d1-7a1d-456c-b280-5f4dc969609d@kernel.org>
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


--hho3lmqpafndqu6h
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 6/7] arm64: tegra: Device tree changes for v7.1-rc1
MIME-Version: 1.0

On Mon, Mar 30, 2026 at 01:45:24PM +0200, Krzysztof Kozlowski wrote:
> On 29/03/2026 17:10, Thierry Reding wrote:
> > From: Thierry Reding <thierry.reding@gmail.com>
> >=20
> > Hi ARM SoC maintainers,
> >=20
> > The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5=
f27f:
> >=20
> >   Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)
> >=20
> > are available in the Git repository at:
> >=20
> >   git://git.kernel.org/pub/scm/linux/kernel/git/tegra/linux.git tags/te=
gra-for-7.1-arm64-dt
> >=20
> > for you to fetch changes up to c70e6bc11d2008fbb19695394b69fd941ab39030:
> >=20
> >   arm64: tegra: Add Tegra264 GPIO controllers (2026-03-28 01:36:46 +010=
0)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > arm64: tegra: Device tree changes for v7.1-rc1
> >=20
> > Various fixes and new additions across a number of devices. GPIO and PCI
> > are enabled on Tegra264 and the Jetson AGX Thor Developer Kit, allowing
> > it to boot via network and mass storage.
> >=20
> > ----------------------------------------------------------------
> > Diogo Ivo (1):
> >       arm64: tegra: smaug: Enable SPI-NOR flash
> >=20
> > Jon Hunter (1):
> >       arm64: tegra: Fix RTC aliases
> >=20
> > Prathamesh Shete (1):
> >       arm64: tegra: Add Tegra264 GPIO controllers
> >=20
> > Thierry Reding (6):
> >       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
>=20
>=20
> This is unreviewed/unacked binding where PCI maintainers had 1 day to
> react to your v3.

Rob gave a reviewed-by on this about a week ago:

  https://lore.kernel.org/linux-tegra/177440189257.2451552.1819610183023562=
6115.robh@kernel.org/

In my experience the PCI maintainers typically defer review of the DT
bindings to DT maintainers, so I considered Rob's R-b sufficient.

>                   Maybe they had more time for previous versions, but
> nevertheless it is also part of other patchset, so it will get into the
> kernel other tree and nothing on v3 posting:
> https://lore.kernel.org/all/20260326135855.2795149-4-thierry.reding@kerne=
l.org/
> gives hints that there will be cross tree merge.

Maybe look at the cover letter:

  https://lore.kernel.org/all/20260326135855.2795149-1-thierry.reding@kerne=
l.org/

I clearly pointed out the build dependencies and suggested a shared
branch to resolve them in both trees. Given that the bindings were
reviewed by Rob and they are needed in both the subsystem tree
(according to your own rules) as well as the DT tree (for validation),
I included the bindings in the shared branch as well.

Thierry

--hho3lmqpafndqu6h
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLfWsACgkQ3SOs138+
s6E8uhAAt9gLx6VJcH9q2Fa1SnnedHdWurpe+EEVfgkI2JvjY4BFkT7sWpTbfDWv
MYEdL66aySIaKoHO/ZpJBQRhzIyVabsvjF3Kid8vAVJiZOSSYgsh28dI4cpqRwNw
kxDo1jqCBmoGMYmhJWAugKf42nOeHHhDGNnZNFCC8qD5ToHMiKRQMDIuPU62bn2N
whRGYpgxnoc8JnMrv0U7mM2UD14rNP3RmOltfP/IqTCUhND16bpPRsdLeGljSg4d
xAJJhKT1Z/n9tMAfu4CqYOh6a+iZNM3Dd16+SBaaU1r2kKcLDyxDcUMq1aAE4DvU
R9BddbvKVsT2HcpjIAM9y0f/AbV1zimNSvjJ7ajzoiK6ws4aFcbznwDGJ7tcncAc
INK4/I/blKowDJmB2HW+wFvJO55WNJU+w0asvYGuy/lorS0D1ZZq9ezDE3LE7dzw
fUU9YboeRd6lm2hI89+50+XkI1eii8gqIY1gI6wSYJR167N+8pmW3Oi272Fj3/RL
4KuLkvdQl9mI0fJBOGPj88AwvsawlH1twmmWPkBwlEK7B8sRpKA6CWrMM2ZjaA45
YAgn54SfQqV1UC5XlNuh5kypmUakUrSpuIC8o7yoFhAqgQ1Py1wOT0d4Om1c6074
jrEFijI61iBv2P6iABbv33Y4aN7bqNYyW4LAsqOgOy8MRI75UI0=
=W8iV
-----END PGP SIGNATURE-----

--hho3lmqpafndqu6h--

