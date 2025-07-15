Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26BFAC83F22
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 15 Jul 2025 19:19:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:MIME-Version:
	Message-ID:Subject:Cc:To:From:Date:Reply-To:Content-Transfer-Encoding:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=0+EQHAbjX+AqAiFRGqTtSUKlJpX7KpZbSgW8itu7TMU=; b=lbjKHSK1STSSL9Ibi3daQ8nqYZ
	95pdVQoB0aucI6cmr8+yGg4fMOihQspIEjBNzpYv48MZqo5NBKTRmFtWVqOxgbpkeEnNjGyOx/DFB
	x4IDuMXovk80ZyR5RC3e2jD5gZytHCorzW+VrqoSBDq9Zavq9QMEkvjcX/QepZeGlr/js8K9Brn8/
	weg4jZK5slibkxs8yOd3xR+8ftfOjvmEg+88NzOiBlCZIYeGOBeuFwGCGkXi15ZsLCEaDcqYXDHzW
	mg9OFEruYI7Z7BmokUBsl0+Vzbi17+GI8E4LVhgBYIFhofF4zXhGmpNGRz/2Zq32wO8elHXdV0fpQ
	D/IeNjiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ublBm-000000061xV-1hbM;
	Tue, 15 Jul 2025 19:19:42 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubjTe-00000005peT-00EQ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 15 Jul 2025 17:30:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 719624445C;
	Tue, 15 Jul 2025 17:30:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 155CAC4CEE3;
	Tue, 15 Jul 2025 17:30:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752600601;
	bh=egDpkwan0yRwQTU7Bdcisl/XZNEfoQQO6ZmJgDKyfLU=;
	h=Date:From:To:Cc:Subject:From;
	b=KlfPX2yvaSiDmPewW6esYFGNXxpcZayUpIaaqzIJ5y0+w85zrDpYoAXOzEVk3bL/J
	 fpLcCyyLTtsBOtzGz/fSDe0/PppyY9ZLMGlEmw/tjUVHucV0q/CoqmvIvM5ba5s1Ca
	 E36+LxYxdM6KJ73T1t2VXoeGmsOYS8rAzpQ4oBpY9IiNrzQvqqZc9AvKmOVyKjNQvv
	 Wg+kOxB7re75/xQUkxluoBDSk3ypxHxjUMZE0tS/nM+v2BK9y0ZwapvrFW5a6L2h53
	 jJjqQ/9WVRJOHU86xKKWDDCwueFW37q9BCSnRNwlbjaVDF5TmIbtyHPkCXhv+6TUxz
	 BKmLn0cJH70Pg==
Received: by wens.tw (Postfix, from userid 1000)
	id AF5205F7BF; Wed, 16 Jul 2025 01:29:57 +0800 (CST)
Date: Wed, 16 Jul 2025 01:29:57 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Allwinner device tree changes for 6.17
Message-ID: <aHaQFe3Lr8Qzyb1M@wens.tw>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="OdQKNRXCZTNdiNAU"
Content-Disposition: inline
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250715_103002_085565_9932F3EE 
X-CRM114-Status: GOOD (  19.09  )
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


--OdQKNRXCZTNdiNAU
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline

The following changes since commit e04c78d86a9699d136910cfc0bdcf01087e3267e:

  Linux 6.16-rc2 (2025-06-15 13:49:41 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.17

for you to fetch changes up to d96d9ac8d2f197f31ea3de931dde1a217950f4ad:

  arm64: dts: allwinner: a523: enable Mali GPU for all boards (2025-07-15 23:37:02 +0800)


I'm not sure I'm doing this right. The tag is based on v6.16-rc1,
but it merges in the immutable DT binding branch from the pmdomain
tree, which is based on v6.16-rc2.

I based the pull request on v6.16-rc2 so that the shortlog wouldn't
include too much stuff.

ChenYu

----------------------------------------------------------------
Allwinner device tree changes for 6.17

This branch includes a change shared with the clk tree for adding
the missing PPU0 reset on the A523.

The PM domain DT binding immutable branch is also included, which
brings in v6.16-rc2, as well as PM domain bindings for other platforms.

Other changes include:
- RGB666 LCD pin definitions for the V3s PE pins and V3 PD pins
- node order fixes for the A523 dtsi
- UART1 pin definitions for A523
- Allwinner board DT binding cleanup
- EMAC support on A100/A133
  - Enabled on the Liontron H-A133L board
- SID efuse, power controllers and GPU added for A523
- A523 GPU enabled on all existing boards

New boards:
- Xunlong OrangePi 4A with the Allwinner T527 SoC.

----------------------------------------------------------------
Chen-Yu Tsai (9):
      dt-bindings: reset: sun55i-a523-r-ccu: Add missing PPU0 reset
      dt-bindings: arm: sunxi: Add Xunlong OrangePi 4A board
      arm64: dts: allwinner: a523: Move mmc nodes to correct position
      arm64: dts: allwinner: a523: Move rgmii0 pins to correct location
      arm64: dts: allwinner: a523: Add UART1 pins
      arm64: dts: allwinner: t527: Add OrangePi 4A board
      dt-bindings: power: Add A523 PPU and PCK600 power controllers
      Merge branch 'dt' of git://git.kernel.org/pub/scm/linux/kernel/git/ulfh/linux-pm into sunxi/dt-for-6.17
      arm64: dts: allwinner: a523: Add power controller device nodes

Jonas Karlman (2):
      dt-bindings: power: rockchip: Add support for RK3528
      dt-bindings: rockchip: pmu: Add compatible for RK3528

Krzysztof Kozlowski (1):
      dt-bindings: arm: sunxi: Combine board variants into enums

Luca Weiss (1):
      dt-bindings: power: qcom,rpmpd: document the Milos RPMh Power Domains

Michal Wilczynski (1):
      dt-bindings: firmware: thead,th1520: Add resets for GPU clkgen

Mikhail Kalashnikov (3):
      arm64: dts: allwinner: A523: Add SID controller node
      arm64: dts: allwinner: a523: add Mali GPU node
      arm64: dts: allwinner: a523: enable Mali GPU for all boards

Paul Kocialkowski (5):
      ARM: dts: sun8i: v3s: Add RGB666 LCD PE pins definition
      ARM: dts: sun8i: v3: Add RGB666 LCD PD pins definition
      arm64: dts: allwinner: a100: Add pin definitions for RGMII/RMII
      arm64: dts: allwinner: a100: Add EMAC support
      arm64: dts: allwinner: a133-liontron-h-a133l: Add Ethernet support

 .../devicetree/bindings/arm/rockchip/pmu.yaml      |   2 +
 Documentation/devicetree/bindings/arm/sunxi.yaml   |  36 +-
 .../bindings/firmware/thead,th1520-aon.yaml        |   7 +
 .../bindings/power/allwinner,sun20i-d1-ppu.yaml    |   4 +-
 .../devicetree/bindings/power/qcom,rpmpd.yaml      |   1 +
 .../bindings/power/rockchip,power-controller.yaml  |   1 +
 arch/arm/boot/dts/allwinner/sun8i-v3.dtsi          |   9 +
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi         |   9 +
 arch/arm64/boot/dts/allwinner/Makefile             |   1 +
 arch/arm64/boot/dts/allwinner/sun50i-a100.dtsi     |  35 ++
 .../dts/allwinner/sun50i-a133-liontron-h-a133l.dts |  19 +
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     | 201 +++++++----
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   |   5 +
 .../boot/dts/allwinner/sun55i-h728-x96qpro+.dts    |   5 +
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |   5 +
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts | 390 +++++++++++++++++++++
 .../power/allwinner,sun55i-a523-pck-600.h          |  15 +
 .../dt-bindings/power/allwinner,sun55i-a523-ppu.h  |  12 +
 include/dt-bindings/power/rockchip,rk3528-power.h  |  19 +
 include/dt-bindings/reset/sun55i-a523-r-ccu.h      |   1 +
 20 files changed, 681 insertions(+), 96 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-pck-600.h
 create mode 100644 include/dt-bindings/power/allwinner,sun55i-a523-ppu.h
 create mode 100644 include/dt-bindings/power/rockchip,rk3528-power.h

--OdQKNRXCZTNdiNAU
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQIzBAABCgAdFiEE2nN1m/hhnkhOWjtHOJpUIZwPJDAFAmh2kBUACgkQOJpUIZwP
JDAFYBAA1s5CMxTgVZf27oSXIeI6vaCevUlt4SOdgjbJ+ZOAeHGT9JPTX8Mit+Fq
sVGb93NRJaVpS1jBb2de50fRWmh5XAiYvjP/CesHSDiWVhvvCriTAHbKOJHsKBA7
/1Eu86AYgGYYIOS95UzYKaw4wV4HzS/HspdZpDDoVrRi7G5TooBJwv2g82i5QB4K
zLIxyr37jHvspMbMTK5ZaDc1gQ/yCau2ciz3EKIJdNNu5yiwvKywHeXP/ZAUIOej
19SJgxnbvKAm2ijbYkiAwfs2Q3AMgAALZ+wx2ZwrOc5Dt/Sr98Tt2Z7Nx345jbds
u0V3kDtiskbyAz+uOHHp1A3ni0U8ChhjbDMNQrQ1RcYkBI4ymiLRSBynt7PLx9UX
r8kc6j8UkqHeAxFmM1xsbBxQAcZKd4VcpbMx1uX9tgcJEFB2sdJm4nauV4hINeZo
r8U2X+3HpVJvZQbgHKuF02zX87B3EIoHshfMjYMqH47eHE8v3WLWivQjqTyTfEP+
BDnyTOUUyO4OS9F0cRlkaiWggwehwK094gycN4iMKCrZfxcsoicZq8oYf/ydM18d
LoQmtotsQ7HOT089PzdTihGQJmAhC1LDRTGboLEWIiRvSgArORmCC3fvxgAMi77/
gmNFh7e1XyKl84rOtB5n/+q3yPSZLKX7gIsITrQ/YaaVfRgoAuQ=
=IzlY
-----END PGP SIGNATURE-----

--OdQKNRXCZTNdiNAU--

