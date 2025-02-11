Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DF9BAC021A2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Feb 2025 11:03:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=w7aQj+gmxFGffDooAQXG5nA8FG9a9s0roNQSu0wN58o=; b=b4dByV3fJwvbgk6tBhHXYDePT+
	2a65dAM+6X/to3lhlX6SB6myJv61NVRn4Hm5c4PsIkalPxqPXHiojrg3W/N4UesXP2S52HL9RsZnj
	y7d9kZYvV7ZBONBbMkXTx2dqeWyt9JW2bxJrBWCZJZTT7928vsXfnkLO36FHQ1lRtdBO7LLOWiz0y
	YysvdT5VQCBla61Tk8bwoyEdK4CzEP0TqJ9M+wo1MhIYSthXpNt3eP3N8iaczlFx2hgOw9tzHTZ5i
	ePv9Kiqfns7mK4vfDSfjktyMx5Uf/K7pBvada6Q3sXzYjCnORuVi7DZGWgsa987VhsgkoKTvz/j98
	5BjumMNw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tho2f-00000003Sd7-1Ozw;
	Tue, 11 Feb 2025 11:03:01 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1thnqt-00000003QK6-2RYl;
	Tue, 11 Feb 2025 10:50:52 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 78EE75C10F3;
	Tue, 11 Feb 2025 10:50:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9D78EC4CEE4;
	Tue, 11 Feb 2025 10:50:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739271050;
	bh=013p6U9CkyzGbsFMDw5hD4LtqAl6uIDMuNEstJ38EU4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WY+6xnxVmSDxLNxTyv2FsAUgLaXUGS7FvHBvsBWLGeg6ohEEo/EnnCLl6QcwwctMZ
	 LzuoHFo4xJZTMmWSreF8xvpn8B5Y9JRiDYcvsRyFOqD/JnE9m2Cgvg/UblMxnXaf9h
	 qZTufFjmLAALumQ45jOmnsv2dig7BUpqT5dZmMNE/2vJMdCYH2x7BvsVS1cvMyTWJd
	 EVtX+8+fd2g7aZ/1rTN0QqqrKH8zmcGr20Z1byhEcnM4Txr2Xi18QjQUqkLYUrMUwi
	 p//l+oAdhcnxtNWFQ3JVEZEaUGWnthIUirtpLxYtxr2AXGzFO+sEej+nmE/bllDE4t
	 soBfwy0okj4OQ==
Date: Tue, 11 Feb 2025 10:50:44 +0000
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
Message-ID: <20250211-backwash-jester-2fdd6740000e@spud>
References: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha256;
	protocol="application/pgp-signature"; boundary="tVnH0HVkr/l99Dz5"
Content-Disposition: inline
In-Reply-To: <20250210220951.1248533-1-alexander.sverdlin@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250211_025051_703291_5D033B1E 
X-CRM114-Status: GOOD (  13.07  )
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


--tVnH0HVkr/l99Dz5
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

On Mon, Feb 10, 2025 at 11:09:40PM +0100, Alexander Sverdlin wrote:
> This series adds very basic support for Milk-V Duo Module 01 EVB [1] in
> arm64 mode. The SoC (SG2000) is dual-arch, RiscV and ARM64, the latter has
> been chosen because the upstream toolchain can be utilized.

>  .../{riscv => soc/sophgo}/sophgo.yaml         |  7 +-
>  arch/arm64/Kconfig.platforms                  |  6 ++
>  arch/arm64/boot/dts/Makefile                  |  1 +
>  arch/arm64/boot/dts/sophgo/Makefile           |  2 +

I'd expect this to be maintained alongside the riscv support, how come
there's no maintainers entry change here?

>  .../sophgo/sg2000-milkv-duo-module-01-evb.dts | 31 +++++++
>  .../sophgo/sg2000-milkv-duo-module-01.dtsi    | 85 +++++++++++++++++
>  arch/arm64/boot/dts/sophgo/sg2000.dtsi        | 75 +++++++++++++++
>  arch/arm64/configs/defconfig                  |  5 +
>  arch/riscv/boot/dts/sophgo/cv1800b.dtsi       | 64 ++++++++++---
>  arch/riscv/boot/dts/sophgo/cv1812h.dtsi       | 64 ++++++++++---
>  arch/riscv/boot/dts/sophgo/cv181x.dtsi        |  2 +-
>  arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi    | 57 ++++++++++++
>  arch/riscv/boot/dts/sophgo/cv18xx.dtsi        | 91 +++++--------------
>  arch/riscv/boot/dts/sophgo/sg2002.dtsi        | 64 ++++++++++---
>  14 files changed, 451 insertions(+), 103 deletions(-)
>  rename Documentation/devicetree/bindings/{riscv => soc/sophgo}/sophgo.yaml (80%)
>  create mode 100644 arch/arm64/boot/dts/sophgo/Makefile
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01-evb.dts
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000-milkv-duo-module-01.dtsi
>  create mode 100644 arch/arm64/boot/dts/sophgo/sg2000.dtsi
>  create mode 100644 arch/riscv/boot/dts/sophgo/cv18xx-cpu.dtsi


--tVnH0HVkr/l99Dz5
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iHUEABYIAB0WIQRh246EGq/8RLhDjO14tDGHoIJi0gUCZ6srgQAKCRB4tDGHoIJi
0puLAQCT0dLjiS8f39e7ltuZPdGjdh8a4aC4NpEw33b3OSuNugD/Z7NyHS2OtCHX
teoIJE271CYirlmdAMsth4TJLf2e/w4=
=lK/q
-----END PGP SIGNATURE-----

--tVnH0HVkr/l99Dz5--

