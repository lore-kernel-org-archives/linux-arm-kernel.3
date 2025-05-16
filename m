Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 63DF1C2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 16 May 2025 02:13:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=GQMAoQ+79Zk1K97aGKcYzoW7cXOLtIbukbQzGlOIQZE=; b=ORRBGjA47xd+gYLxvgjLTf3tfg
	EuF2OtVx7OgbVZGfKNi6gdKwTPKRAmyI2pe1puF4lhnHE3pCMnGsZ9F1mz1NG+deoRZ3DteucmbHN
	W/oXz8D10clbfgP3hFkz+a1A1l7bapECc/G7iLoMiqnhyJGRawy3Dt4oKRwM1O7CNKBzeB20IOXed
	ECKKf0c0jOzg8pmZ7UlJ9gtsNZB38adfaHK53K5Om0rGZAleKzdPbsFyqgwnubPezVPvOCgi9TqUJ
	V7dv4emHt2atHzfZ3t+/24jL4L1Ozlz+uuSKJJcSC8c2ZOxHcfZhKiWjvyzPcfEzQjuIjRjCht+vp
	dWNTXU0w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFkZq-00000002G9r-05CK;
	Fri, 16 May 2025 02:13:34 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uFkW7-00000002FsF-3QpN
	for linux-arm-kernel@lists.infradead.org;
	Fri, 16 May 2025 02:09:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id BFD9DA4E4FF;
	Fri, 16 May 2025 02:09:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 22DAAC4CEE7;
	Fri, 16 May 2025 02:09:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1747361382;
	bh=2QMpH+1tYcp+bIDmafH4ExXh1FN987xDfFaUiG51mQ0=;
	h=Date:From:To:Cc:Subject:From;
	b=AbLQmgO+7HMAyKDj3t+9iI9R2yXdg8ZtaDTDVI+bc2P5agcsyHpi/bLoA5lbCoSgZ
	 rFtcImXD2Db+lGkufZbLW5LjU7HK35SeAwtMaBG/jeJYWa0NkcLBYHz1rgrTihHAIR
	 Sugss5H0Oh76tRiB4coIALuCS2XvB+cVl26J4wDJBX1Ekx2LIQh+jw0xqBNOCZENkG
	 AAdWCG3mOTYB7FTRTJdGSXK0fW24ZonUqCib33FGMdTWnJJnc3KqLrRy5tGFEMNftI
	 Uyjg49EvRdW/VADre0y/OrzbmeLU8MU6KD5T74neoue93T8Lk3PlHKwwyCqsEmcTW4
	 J3kRqWkQoCo6A==
Received: by wens.tw (Postfix, from userid 1000)
	id 6A9E15FEC5; Fri, 16 May 2025 10:09:40 +0800 (CST)
Date: Fri, 16 May 2025 10:09:40 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.16
Message-ID: <aCaeZJ2t4S_xhgjp@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="n4QPW7IGwpuGyd62"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250515_190943_996490_55BACE79 
X-CRM114-Status: GOOD (  16.44  )
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


--n4QPW7IGwpuGyd62
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.16

for you to fetch changes up to a3cd12acb7b74d9b243cd893209972fc657d0bd3:

  arm64: dts: allwinner: a100: add Liontron H-A133L board support (2025-05-14 22:14:07 +0800)

----------------------------------------------------------------
Allwinner device tree changes for 6.16

Introduce Allwinner A523 / A527 / T527 SoC family w/ three new devices:
- Radxa Cubie A5E
- X96Q-Pro+
- Avaota-A1

Also enable EMAC0 ethernet MAC on A523 family for Cubie A5E & Avaota-A1.
Note: the SoC has two different ethernet controllers.

Changes to existing SoCs:
- Enable GPU on H616 with all boards enabled
- Set maximum MMC frequency for the A100

Changes to existing boards:
- Add WiFi/BT header on PINE64 A64 boards
- Add hp-det-gpios for Anbernic RG35XX
- Add support for PHY LEDs on Bananapi (the original one)

Add new devices for existing SoCs:
- YuzukiHD Chameleon based on H6
- Liontron H-A133L based on A133 (compatible with A100)

Tree wide cleanups:
- Use preferred node names for cooling maps
- Align wifi node name with bindings
- Drop spurious 'clock-latency-ns' properties for H5 & H6

----------------------------------------------------------------
Andre Przywara (14):
      arm64: dts: allwinner: Add Allwinner A523 .dtsi file
      dt-bindings: vendor-prefixes: Add YuzukiHD name
      dt-bindings: arm: sunxi: Add new board names for A523 generation
      arm64: dts: allwinner: a523: add Avaota-A1 router support
      arm64: dts: allwinner: a523: add X96Q-Pro+ support
      arm64: dts: allwinner: a523: add Radxa A5E support
      dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
      arm64: dts: allwinner: h616: add YuzukiHD Chameleon support
      arm64: dts: allwinner: h616: Add Mali GPU node
      arm64: dts: allwinner: h616: enable Mali GPU for all boards
      arm64: dts: allwinner: a100: set maximum MMC frequency
      dt-bindings: vendor-prefixes: Add Liontron name
      dt-bindings: arm: sunxi: Add Liontron H-A133L board name
      arm64: dts: allwinner: a100: add Liontron H-A133L board support

Chris Morgan (1):
      arm64: dts: allwinner: h700: Add hp-det-gpios for Anbernic RG35XX

Chukun Pan (1):
      arm64: dts: allwinner: correct the model name for Radxa Cubie A5E

Krzysztof Kozlowski (2):
      arm64: dts: allwinner: Align wifi node name with bindings
      ARM: dts: allwinner: Align wifi node name with bindings

Michael Klein (1):
      ARM: dts: bananapi: add support for PHY LEDs

Peter Robinson (2):
      arm64: dts: allwinner: a64: Add WiFi/BT header on PINE A64
      arm64: dts: allwinner: a64: Add WiFi/BT header on SOPINE Baseboard

Rob Herring (Arm) (2):
      arm/arm64: dts: allwinner: Use preferred node names for cooling maps
      arm64: dts: allwinner: h5/h6: Drop spurious 'clock-latency-ns' properties

Yixun Lan (4):
      dt-bindings: sram: sunxi-sram: Add A523 compatible
      arm64: dts: allwinner: a523: Add EMAC0 ethernet MAC
      arm64: dts: allwinner: a527: add EMAC0 to Radxa A5E board
      arm64: dts: allwinner: t527: add EMAC0 to Avaota-A1 board

 Documentation/devicetree/bindings/arm/sunxi.yaml   |  25 +
 .../sram/allwinner,sun4i-a10-system-control.yaml   |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   4 +
 arch/arm/boot/dts/allwinner/sun7i-a20-bananapi.dts |  27 +
 arch/arm/boot/dts/allwinner/sun8i-a83t.dtsi        |   4 +-
 .../boot/dts/allwinner/sun8i-h3-nanopi-neo-air.dts |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-h3.dtsi          |   2 +-
 arch/arm/boot/dts/allwinner/sun8i-r40.dtsi         |   2 +-
 arch/arm64/boot/dts/allwinner/Makefile             |   5 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |   3 +
 .../dts/allwinner/sun50i-a133-liontron-h-a133l.dts | 211 +++++++
 .../arm64/boot/dts/allwinner/sun50i-a64-pine64.dts |  12 +
 .../dts/allwinner/sun50i-a64-sopine-baseboard.dts  |  19 +
 .../boot/dts/allwinner/sun50i-h313-tanix-tx1.dts   |   5 +
 arch/arm64/boot/dts/allwinner/sun50i-h5.dtsi       |   6 +-
 .../boot/dts/allwinner/sun50i-h6-orangepi-3.dts    |   2 +-
 .../dts/allwinner/sun50i-h6-orangepi-lite2.dts     |   2 +-
 arch/arm64/boot/dts/allwinner/sun50i-h6.dtsi       |   4 -
 .../dts/allwinner/sun50i-h616-bigtreetech-cb1.dtsi |   5 +
 .../dts/allwinner/sun50i-h616-orangepi-zero.dtsi   |   4 +
 .../dts/allwinner/sun50i-h616-orangepi-zero2.dts   |   4 +
 .../boot/dts/allwinner/sun50i-h616-x96-mate.dts    |   5 +
 arch/arm64/boot/dts/allwinner/sun50i-h616.dtsi     |  21 +
 .../allwinner/sun50i-h618-longan-module-3h.dtsi    |   5 +
 .../dts/allwinner/sun50i-h618-orangepi-zero2w.dts  |   5 +
 .../dts/allwinner/sun50i-h618-orangepi-zero3.dts   |   4 +
 .../allwinner/sun50i-h618-transpeed-8k618-t.dts    |   5 +
 .../allwinner/sun50i-h618-yuzukihd-chameleon.dts   | 222 +++++++
 .../allwinner/sun50i-h700-anbernic-rg35xx-2024.dts |  10 +-
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 639 +++++++++++++++++++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   | 318 ++++++++++
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts    | 287 +++++++++
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   | 327 +++++++++++
 33 files changed, 2180 insertions(+), 17 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a527-cubie-a5e.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts

--n4QPW7IGwpuGyd62
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmgmnmQACgkQOJpUIZwP
JDA7jBAAiFt6qeQQnBcym4QPcGsMYtQYInq9iArr8TuPGHw3NjIHJvO9lAMOb03e
TkhLr5oHt/a+OkQVdR9m/tPbQqotSIgbUb77VvxHne9hTaeo51po4FAnHBjIEIcS
XphHdpFCdEd5g1gyMwpBFaa4Ukefzx6w49Jtg+GnOGNO5H5jIU4tyxsXFeGX9Lvm
tcdXCoagZhrJAuIZ+gYhZAfCthdgAr5zYDcJfdfgRax2JWDmHRip0PYdBj9XFdnq
PSQ/gz97DYVbGDtlVhETT22IAauJZDqLMmC+MMYmlRF+s2JYYgpE37MSwJQGXGp4
hTRKLw4sHn8jLzivQP89BN7T/QiEH08GYR8+EpKBSv/HnKsdwcfvBI/+W+/iCuof
jMHCN4ZepaWWF+3n+/gkIYdzvRElOMYkXB8dhZnBkIqshUNZ+jYrFdT3Ra2XfxPx
tFINWjAmkXVV9H3OI+ABDTNGnt3P1diQTyfRMKMkF04JNs3Ub+mTO5PoAZABFjqH
tSpdi2RJJagEB0+GbLGy9wz+N3j+IxI8GMQ7lStv4fjWSma2i5urYtl6oz4WcNK/
Wpvqh8t7t50R4NZ0kVOySK3YpqjXT0fVgFMmXOGPZMSx+Kws1CmX7+fLD5Lc3j+4
pG4avzKslKRv7CiIfMA6BqoqYXFeCXIIyFgUeln/v1kL8h+9Ot0=
=YBYw
-----END PGP SIGNATURE-----

--n4QPW7IGwpuGyd62--

