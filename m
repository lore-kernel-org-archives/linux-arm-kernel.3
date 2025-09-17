Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 86CC6CAC59A
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 17 Sep 2025 17:20:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=OGRQGxJHGvZWEzrmQ5Q4jkttOSdyaj67hPTU5/uQt/U=; b=QcPgicpXLEwZ3NwkbZt8Gf9PpI
	E8xIZUhbjTPWNECgGaR1FyYc5iW6Tm8OrRdcuHuu7wCLgSD/22zCkkKFljHlGDDPbey+pyzeTNurE
	YiAeCmOz1Fsng6eO+3/xL04IZYF0LY5s+vscHG+b8H9Bm0KcF4o7lx1lX5kCpXKoq1EHKoQkbMUdN
	YS9mdZFvBqna6qORmRO5eRTOvB7KZnn/u26sDf/4NuX15Xbwy3e32CEFt2tvLOotN8uhFOHaKTrne
	1xi7EcHE2xZTaSLQsY80UW6WXNIu9laYJU2ismCpRVYheaN53rGvc/nJe9SAqddNcXPITulzeGYYz
	hPahEmfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvp2-0000000DVhY-01IU;
	Wed, 17 Sep 2025 17:20:00 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uyvoy-0000000DVgi-2crs
	for linux-arm-kernel@lists.infradead.org;
	Wed, 17 Sep 2025 17:19:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 0B11B40C49;
	Wed, 17 Sep 2025 17:19:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BD8B5C4CEE7;
	Wed, 17 Sep 2025 17:19:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758129595;
	bh=PaQc8EUNl7CQtcyysbGlpZNQUgJZzBiTvE4agvsSPa8=;
	h=Date:From:To:Cc:Subject:From;
	b=R4kufLm3DABZvpjbm0zHczD0JiihXYiw4z07kFCIgX0wrm/yZ13NQcOc7ZOcwlQ9n
	 QOJxC5nD9L/yAnbtJWY/fkcoLbZ/mqotCWfKxP7gUumrj58/lgm5riTHGXI9Qejj9a
	 uWLzIY2U6noLvIRjSZpIrCof6+7sxvYuBaPQKb/3LDGZlRc22DGnVWiWpqrEgLTjhU
	 BUxN+z+if1W2BrB6JnBYiuDzNSPdbu1pJXcKT8o54zaO+A007t6U5bN7zDbR1UaTIN
	 18TTBCLKVOGw5bD10waxcHETpLOGLRXNJrzC8yS657QXwDK8NnEhskRA9Iiv187ZZi
	 xiW/v9ckPrERg==
Received: by wens.tw (Postfix, from userid 1000)
	id 9FF465FDA7; Thu, 18 Sep 2025 01:19:53 +0800 (CST)
Date: Thu, 18 Sep 2025 01:19:53 +0800
From: Chen-Yu Tsai <wens@kernel.org>
To: soc@kernel.org
Cc: Chen-Yu Tsai <wens@csie.org>, Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>, linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: [GIT PULL] Allwinner Device Tree changes for 6.18
Message-ID: <aMrtuZg8HlR--TAt@wens.tw>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250917_101956_704081_E25BC809 
X-CRM114-Status: GOOD (  15.75  )
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/sunxi/linux.git tags/sunxi-dt-for-6.18

for you to fetch changes up to cca07ac2b5f7838b8ff612b53b9f82ac8cb58312:

  arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions (2025-09-15 00:04:32 +0800)

----------------------------------------------------------------
Allwinner Device Tree changes for 6.18

This tag contains two DT binding header changes that are shared with
the clk tree.

In this cycle we gained support for the MCU PRCM clock and reset
controller on the A523/A527/T527 family of SoCs, the NPU which is a
Vivante GC9000 IP block, and the NPU clock that was missing. The other
PRCM clock controller gained default bus clock rate settings. These
were not configured in the upstream U-boot bootloader, leading to them
running at slower rates. The assigned rates are from the user manual.

There is also a new board, the NetCube Systems Nagami SoM and two of
its carrier boards.

The A523 family development boards now have their internal RTC clocks
configured correctly, so that the RTC does not drift wildly. The missing
functions for the AXP717 on these boards are added. Missing reset GPIOs
and delays for Ethernet PHYs are added. Last, the Cubie A5E now has its
LEDs described and usable.

An overlay for the Orange Pi Zero interface (addon) board was added.
This can be used with the Orange Pi Zero and Zero Plus 2. Default audio
routing for these two boards (to be used with the addon) were added to
complement the overlay.

----------------------------------------------------------------
Chen-Yu Tsai (13):
      arm64: dts: allwinner: a527: cubie-a5e: Add LEDs
      arm64: dts: allwinner: a527: cubie-a5e: Add ethernet PHY reset setting
      arm64: dts: allwinner: t527: avaota-a1: Add ethernet PHY reset setting
      dt-bindings: clock: sun55i-a523-ccu: Add missing NPU module clock
      dt-bindings: clock: sun55i-a523-ccu: Add A523 MCU CCU clock controller
      Merge branch 'sunxi/shared-dt-headers-for-6.18' into sunxi/dt-for-6.18
      arm64: dts: allwinner: a523: Add MCU PRCM CCU node
      arm64: dts: allwinner: a523: Add NPU device node
      arm64: dts: sun55i: a523: Assign standard clock rates to PRCM bus clocks
      arm64: dts: allwinner: a527: cubie-a5e: Drop external 32.768 KHz crystal
      arm64: dts: allwinner: t527: avaota-a1: hook up external 32k crystal
      arm64: dts: allwinner: t527: orangepi-4a: hook up external 32k crystal
      arm64: dts: allwinner: sun55i: Complete AXP717A sub-functions

J. Neuschäfer (3):
      ARM: dts: allwinner: orangepi-zero: Add default audio routing
      ARM: dts: allwinner: orangepi-zero-plus2: Add default audio routing
      ARM: dts: allwinner: Add Orange Pi Zero Interface Board overlay

Lukas Schmid (5):
      dt-bindings: arm: sunxi: Add NetCube Systems Nagami SoM and carrier board bindings
      riscv: dts: allwinner: d1s-t113: Add pinctrl's required by NetCube Systems Nagami SoM
      ARM: dts: sunxi: add support for NetCube Systems Nagami SoM
      ARM: dts: sunxi: add support for NetCube Systems Nagami Basic Carrier
      ARM: dts: sunxi: add support for NetCube Systems Nagami Keypad Carrier

 Documentation/devicetree/bindings/arm/sunxi.yaml   |   8 +
 .../bindings/clock/allwinner,sun55i-a523-ccu.yaml  |  37 ++-
 arch/arm/boot/dts/allwinner/Makefile               |  10 +
 .../dts/allwinner/sun8i-h2-plus-orangepi-zero.dts  |  14 ++
 .../dts/allwinner/sun8i-h3-orangepi-zero-plus2.dts |  14 ++
 .../sun8i-orangepi-zero-interface-board.dtso       |  46 ++++
 .../sun8i-t113s-netcube-nagami-basic-carrier.dts   |  67 ++++++
 .../sun8i-t113s-netcube-nagami-keypad-carrier.dts  | 129 +++++++++++
 .../dts/allwinner/sun8i-t113s-netcube-nagami.dtsi  | 250 +++++++++++++++++++++
 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi     |  41 ++++
 .../boot/dts/allwinner/sun55i-a527-cubie-a5e.dts   |  46 +++-
 .../boot/dts/allwinner/sun55i-t527-avaota-a1.dts   |  34 +++
 .../boot/dts/allwinner/sun55i-t527-orangepi-4a.dts |  31 +++
 arch/riscv/boot/dts/allwinner/sunxi-d1s-t113.dtsi  |  48 ++++
 include/dt-bindings/clock/sun55i-a523-ccu.h        |   1 +
 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h    |  54 +++++
 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h    |  30 +++
 17 files changed, 853 insertions(+), 7 deletions(-)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-orangepi-zero-interface-board.dtso
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-basic-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami-keypad-carrier.dts
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-t113s-netcube-nagami.dtsi
 create mode 100644 include/dt-bindings/clock/sun55i-a523-mcu-ccu.h
 create mode 100644 include/dt-bindings/reset/sun55i-a523-mcu-ccu.h

