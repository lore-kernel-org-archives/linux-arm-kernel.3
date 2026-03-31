Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F03B5FF60E7
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 31 Mar 2026 08:25:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=rcqa3TnjaC/kK18HYVjulYXhIEuAroKOXV5TEXs03Qs=; b=NGewKU1HqBOoHwEE5ruyffaJDd
	zTi2M2ujZAeR2U9Rn4Nk5xcgVVGve+RtYrvlYK0IVJzFSCrNe+sGDXO6YE4xKsaT+eN7tg/359hi3
	2Gn+bOkbuJEBbKf+ykdHHoOiAvrUOHVpP4vL2Wj/0Pe4s5NKz7+9BDrZsr7nDFhEOzEB+QeWEnrLa
	cVtG/71SEfCUfbl8PM/riamcIvVLgEe7xpeBD/qDE5y6FavtknMZ1KoBhwXmBFx1ZDx8Sen2ixuXt
	QDJSFFFsZ2jCXMO71nwFp/wkigDU+6pW8R/icizPq0Mf0IHIBNlgk4aTLIL3GVsmCn2ABkOvyqOuZ
	SjR02jxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UPM-0000000CaJx-2QMC;
	Tue, 31 Mar 2026 08:25:08 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w7UPL-0000000CaJq-2HtS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 31 Mar 2026 08:25:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id F32E3600CB;
	Tue, 31 Mar 2026 08:25:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 31630C19423;
	Tue, 31 Mar 2026 08:25:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774945506;
	bh=xongS++fQIVRd1oxyW57pzR32Tw90tcNAn/M31bAT94=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jJRirDCq48fkM2xxMptBi2CLoUsPUbh+8Q7JThdmkemLdv5LrDpIVBKXqpWAoWSoE
	 Pytilttqrvk7xiToe7yQw5zGqm68hK6dbH2hDNbndC7JIODiUQqmazbyQeIkEUvZ9b
	 wEq+YUj/zEpsu0lalzRLkz7wejwpdQfJZV3mmHcLhs6oDeIEi5KhtS39GFxQO/8VJy
	 qOZ4Kz5Wb2Fn9o57D5kvrpsPaWfOAyZnl3d9tX/BWpGvCuSpzP0CXmsaicK3OO/nep
	 wqUxiqnDCul1EzGSptG87lZryhgPBH7bIIabTxHFu+yxyt9ur8nNrs2Xa40+i9FN06
	 0WnDn2AILbbIg==
Date: Tue, 31 Mar 2026 10:25:03 +0200
From: Thierry Reding <thierry.reding@kernel.org>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: arm@kernel.org, soc@kernel.org, 
	Thierry Reding <thierry.reding@gmail.com>, Jon Hunter <jonathanh@nvidia.com>, linux-tegra@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
Message-ID: <act9hqxjL6wZ25dP@orome>
References: <20260329151045.1443133-1-thierry.reding@kernel.org>
 <406ca5ed-4a3e-48ba-94ad-d88c53b09299@kernel.org>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="x2rr2fmu6jlvezcp"
Content-Disposition: inline
In-Reply-To: <406ca5ed-4a3e-48ba-94ad-d88c53b09299@kernel.org>
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


--x2rr2fmu6jlvezcp
Content-Type: text/plain; protected-headers=v1; charset=us-ascii
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [GIT PULL 1/7] dt-bindings: Changes for v7.1-rc1
MIME-Version: 1.0

On Mon, Mar 30, 2026 at 01:39:49PM +0200, Krzysztof Kozlowski wrote:
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
gra-for-7.1-dt-bindings
> >=20
> > for you to fetch changes up to bed2f5b4de6c6fd8f8928f6373ad92e8795c370f:
> >=20
> >   dt-bindings: arm: tegra: Document Jetson AGX Thor DevKit (2026-03-28 =
01:05:24 +0100)
> >=20
> > Thanks,
> > Thierry
> >=20
> > ----------------------------------------------------------------
> > dt-bindings: Changes for v7.1-rc1
> >=20
> > This contains a few conversions to DT schema along with various
> > additions and fixes to reduce the amount of validation warnings.
> >=20
> > Included are also a new binding for the PCIe controller found on
> > Tegra264 as well as compatible strings for the Jetson AGX Thor
> > Developer Kit.
> >=20
> > ----------------------------------------------------------------
> > Sumit Gupta (1):
> >       dt-bindings: arm: tegra: Add Tegra238 CBB compatible strings
> >=20
> > Svyatoslav Ryhel (1):
> >       dt-bindings: display: tegra: Document Tegra20 HDMI port
> >=20
> > Thierry Reding (9):
> >       dt-bindings: pci: Document the NVIDIA Tegra264 PCIe controller
>=20
> Why are you taking subsystem patches? This was posted on 26th of March
> and was not acked by PCI maintainers.
>=20
> How the bindings should go is already documented, so there is no
> question here.

We've discussed this in the past and I still think your rule about DT
bindings needing to go in through the driver tree is impractical. Yes,
it means you get around the checkpatch warning about undocumented
compatible strings, but at the expense of a new warning in the Tegra
tree because the bindings aren't there.

> The question was whether you can take them if subsystem maintainer is
> non-responsive and yes, you can. You gave PCI maintainers one day before
> applying it.

I did not get a response to my suggestion about creating a shared
branch, which was included in v1 already. So I went ahead and did what
I thought was best. PCI maintainers are free to not pull this if they
don't want to. I also offered to address any further review comments if
there were any.

> >       dt-bindings: phy: tegra-xusb: Document Type C support
>=20
> No acks, but that is waiting for one month so it is fine.

It's got a Reviewed-by from Rob and there were no corresponding driver
changes associated with it. There's literally no reason for this to go
in through a subsystem tree.

> >       dt-bindings: clock: tegra124-dfll: Convert to json-schema
> >       dt-bindings: interrupt-controller: tegra: Fix reg entries
> >       dt-bindings: arm: tegra: Add missing compatible strings
> >       dt-bindings: phy: tegra: Document Tegra210 USB PHY
> >       dt-bindings: memory: Add Tegra210 memory controller bindings
> >       dt-bindings: memory: tegra210: Mark EMC as cooling device
>=20
> That's even my subsystem and I did not ack it. You did not even sent it
> to me as requested by MAINTAINERS file (+dt is ignore alias), so
> obviously I did not even had a chance to ack it.

Ugh... really? I was Cc'ed to you as a DT maintainer as well as the
devicetree mailing list, so I'm sure you've seen it. This had also been
reviewed by Rob a long time ago, and honestly, it's also quite trivial.
It's been on the list for a month and there were no objections, so it
does pass all of the criteria you mentioned before.

> And we even had few days ago talk were I explained you how these
> bindings must go. Seeing pull request completely ignoring that
> discussion is just huge surprise.
>=20
> No, it cannot go in. Send patches to proper maintainers first.

Stop making these baseless accusations, Krzysztof. You were on Cc and
DT maintainers have seen and reviewed these patches. You're grasping at
straws to somehow try to make my life miserable and I don't know why.

Thierry

--x2rr2fmu6jlvezcp
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEEiOrDCAFJzPfAjcif3SOs138+s6EFAmnLhNwACgkQ3SOs138+
s6HOIhAAqdRI5jThGVEb4l0l+GYD5gSViQMZy2eh6KBPNB0GrLrpyaNKcea/tgRk
f9zmp9O368N/19GgKiHi4jjJxvtziAWxoZlGSTObYRioRh6Nu20XMpc84c8mhc05
CRufxMR/CCMbF6TAys39bB3iB9/l8DujxEhwzcp3KVuY7dghqTXxyv2w/feK37Kh
bZxLpZorgzQQ+yWEbaQJnBCAbxyjMKCkU0hQR23L3Mr0GmxmVyIdSW1yvYn4zP54
X5X9SyLPfy+cdWz49rqMFvH475gKfwgFQE9BQdo5cIxdYI3iglimam4VjMghecRn
IrnKpaKh0nMB/Bu5UqH/xoeBd/DI2Pfk3j0aeCLnik0FBt5Mrfrswxi5xkQaHQ+r
F5VUnWEghU0LRrYMmoxzCj/7WKo2XyPGi0Tby9fYdeZ2M9W7l+U2Bs8FUSjE4YKo
FAP9RpsV8s6eXSJr7vJOj3z6sQB3GJXOUOGBppSrVDxa6qRlLHyjTvHlFYfynpzx
VKtIoxbemqmbxVKPqmMa7zqkzy4t0K1U1KsdV2mpJTKfk16edI6B6OPnqjGwG2VL
yfIeFUQ0x5Z3zRilyLR0dilDPU5hNU9w7ikjrKFdAP9pVATBOJvulI6JPr1BpOuH
R63RQU15WE9yxYUvv+ZRtk8n6tvwQ6K7eq3ETEwvy154d6Rsh3U=
=eP2x
-----END PGP SIGNATURE-----

--x2rr2fmu6jlvezcp--

