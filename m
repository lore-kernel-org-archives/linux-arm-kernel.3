Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 478B0C021A1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 13:52:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=m4AD7l25AQkFx45miPWzhVwRxJcr7K3gU5TBHvJZg1g=; b=D5n71yPJ8EnOsHplLobRzTQN0f
	Ggn/GVySHMltJipYDlq3kRUzDyGDA5DHIuUC3EMP6YW2NAn0EQtpdzRywKJbrRx22IJyKT97c94Dy
	iqRibQcWyqY4Ge91rxpm0oBTd41NQ3QyMQWgh7uruyNDMF6XcyxugIkSFoXFSQ9bQ0lqvYfMCi4AL
	/MgFdG4FXN2BqeBRp+IQ3HBn8aZBsYl1Ofg6xrbD3Vzicqd2HC7tSeVfgRQZXcVgplTDdXxrRCGN5
	kRrhu0Oes0NUfEU3b6EMAYYBiHXdT3K0RJh5SEimKp6c4c2UsLSZZtdT1UUbULRIIJEK+AxVC1Qk7
	3v1zQcDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1thqg7-00000004124-1gET;
	Tue, 11 Feb 2025 13:51:55 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thqcr-000000040cA-3Xyb;
	Tue, 11 Feb 2025 13:48:34 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7ACF65C177A;
	Tue, 11 Feb 2025 13:47:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A55D5C4CEDD;
	Tue, 11 Feb 2025 13:48:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739281712;
	bh=m4AD7l25AQkFx45miPWzhVwRxJcr7K3gU5TBHvJZg1g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=mcVQPflKFMGoFzsFfHOsGL1PwQhEKzlleh8Z7aEpchFrTuDQWFtAEziZt/fYy546n
	 nkK+3UAReOzjD1YMoeLjznwqK+e7DDZ+6lW9lq5yAhkG7vMloOP2UnFThpMo6kh0lB
	 spnwOSgNPjHjnPxvTW7gzxLcU026tU/JychinezqD9mhQrevMGDezrweJsX99g0nHp
	 PomcPn7yA4YRn3VBUoNgyAV7IZbR8GbLwIUlLK+6npQJvBObyzBReoxMNAI3Amh+vZ
	 wc0nqLLs07OcGqhabSAMNURKk27r6PgeT4nXy51ARGH0Ndu3CifTgtPY/TL5BaLCSR
	 jB0i3eDhRpoFw==
Date: Tue, 11 Feb 2025 13:48:26 +0000
From: Conor Dooley <conor@kernel.org>
To: Alexander Sverdlin <alexander.sverdlin@gmail.com>
Cc: soc@lists.linux.dev, Chen Wang <unicorn_wang@outlook.com>,
	Inochi Amaoto <inochiama@outlook.com>, Lee Jones <lee@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>,
	Paul Walmsley <paul.walmsley@sifive.com>,
	Palmer Dabbelt <palmer@dabbelt.com>,
	Albert Ou <aou@eecs.berkeley.edu>,
	Sebastian Reichel <sre@kernel.org>, devicetree@vger.kernel.org,
	Haylen Chu <heylenay@outlook.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-riscv@lists.infradead.org, linux-pm@vger.kernel.org,
	Jisheng Zhang <jszhang@kernel.org>, Chao Wei <chao.wei@sophgo.com>
Subject: Re: [PATCH v2 0/7] arm64 support for Milk-V Duo Module 01 EVB
Message-ID: <20250211-stubble-senate-0bbb0b04a989@spud>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
 <20250211-backwash-jester-2fdd6740000e@spud>
 <b1f05bff1d6c3f0cb1b381c15dcf222ec4c7f1b1.camel@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="MwDx1V044X6pY5Zr"
Content-Disposition: inline
In-Reply-To: <b1f05bff1d6c3f0cb1b381c15dcf222ec4c7f1b1.camel@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_054833_973625_517C8EC0 
X-CRM114-Status: GOOD (  18.21  )
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


--MwDx1V044X6pY5Zr
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

On Tue, Feb 11, 2025 at 01:43:31PM +0100, Alexander Sverdlin wrote:
> Hi Conor!
>=20
> On Tue, 2025-02-11 at 10:50 +0000, Conor Dooley wrote:
> > On Mon, Feb 10, 2025 at 11:09:40PM +0100, Alexander Sverdlin wrote:
> > > This series adds very basic support for Milk-V Duo Module 01 EVB [1] =
in
> > > arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latte=
r has
> > > been chosen because the upstream toolchain can be utilized.
> >=20
> > > =A0 .../{riscv =3D> soc/sophgo}/sophgo.yaml=A0=A0=A0=A0=A0=A0=A0=A0 |=
=A0 7 +-
> > > =A0 arch/arm64/Kconfig.platforms=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 6 ++
> > > =A0 arch/arm64/boot/dts/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 1 +
> > > =A0 arch/arm64/boot/dts/sophgo/Makefile=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
 |=A0 2 +
> >=20
> > I'd expect this to be maintained alongside the riscv support, how come
> > there's no maintainers entry change here?
>=20
> MAINTAINERS file has "K: sophgo" entry already, I suppose new files will
> fall into this category? That's why I've ignored this specific checkpatch=
 warning
> in all patches. Am I wrong?

Ah, I didn't realise.

>=20
> > > =A0 .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
> > > =A0 .../sophgo/sg2000-milkv-duo-module-01.dtsi=A0=A0=A0 | 85 ++++++++=
+++++++++
> > > =A0 arch/arm64/boot/dts/sophgo/sg2000.dtsi=A0=A0=A0=A0=A0=A0=A0 | 75 =
+++++++++++++++
> > > =A0 arch/arm64/configs/defconfig=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=A0=
=A0=A0=A0=A0=A0 |=A0 5 +
> > > =A0 arch/riscv/boot/dts/sophgo/cv1800b.dtsi=A0=A0=A0=A0=A0=A0 | 64 ++=
++++++++---
> > > =A0 arch/riscv/boot/dts/sophgo/cv1812h.dtsi=A0=A0=A0=A0=A0=A0 | 64 ++=
++++++++---
> > > =A0 arch/riscv/boot/dts/sophgo/cv181x.dtsi=A0=A0=A0=A0=A0=A0=A0 |=A0 =
2 +-
> > > =A0 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi=A0=A0=A0 | 57 ++++++++=
++++
> > > =A0 arch/riscv/boot/dts/sophgo/cv18xx.dtsi=A0=A0=A0=A0=A0=A0=A0 | 91 =
+++++--------------
> > > =A0 arch/riscv/boot/dts/sophgo/sg2002.dtsi=A0=A0=A0=A0=A0=A0=A0 | 64 =
++++++++++---
> > > =A0 14 files changed, 451 insertions(+), 103 deletions(-)
> > > =A0 rename Documentation/devicetree/bindings/{riscv =3D> soc/sophgo}/=
sophgo.yaml (80%)
> > > =A0 create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
> > > =A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-mo=
dule-01-evb.dts
> > > =A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-mo=
dule-01.dtsi
> > > =A0 create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
> > > =A0 create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi
>=20
> --=20
> Alexander Sverdlin.
>=20

--MwDx1V044X6pY5Zr
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6tVKgAKCRB4tDGHoIJi
0ryCAQCUpDB6cCAXqj3ZVyMpBboraj1VJvvnCB34OKgyUALr6AEAqOw2FC6cSonT
W2P4mgYpwfIsREbExnYGXzdSKPmwnAU=
=5MES
-----END PGP SIGNATURE-----

--MwDx1V044X6pY5Zr--

