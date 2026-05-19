Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3B8ABCD4851
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 May 2026 10:36:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XA+T2AYLuY+wS/vEaiKUM+MGMILNCSr/Nor4MXreXVA=; b=ezwmxcv2/Tpq5L2oqZRFtITuMr
	TYjwZb9HmDbzXnqjDdsrhcSRWGlr8t+GCkcQOHTRcklyoYgwBquQQjn9PRIZ1r01VoTqL5d6cVAzl
	ClXCxjLJ8STiFKNbcWT9wLGypxUgWFXTFk7pEbbDmR1ImbUosFf+I+ghXz6ID5pUSjX6CroSZfrik
	nkfgN7EsKjzxTGh1rkyXOjJmsA56ZnI2Ai1ETbnPAxOfk1NeYP8v+3YX1gy+WOv4cGX3z+gvs7frp
	9tibsTa6c7aGcLWvOFPe3KsxPe3PvCP6NPSRRRCTfy0inr8goVjWQoOZnwzeyulwWrzl87oBvS8Ks
	dp0OSF1Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHo8-000000016ZW-2o1m;
	Tue, 19 May 2026 10:36:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wPHo6-000000016YF-0JL3
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 May 2026 10:36:14 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 867A860126;
	Tue, 19 May 2026 10:36:13 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D82DAC2BCB3;
	Tue, 19 May 2026 10:36:11 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v7.2
Date: Tue, 19 May 2026 12:35:59 +0200
Message-ID: <cover.1779185462.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1779185457.git.geert+renesas@glider.be>
References: <cover.1779185457.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
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

The following changes since commit 5d6919055dec134de3c40167a490f33c74c12581:

  Linux 7.1-rc3 (2026-05-10 14:08:09 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.2-tag1

for you to fetch changes up to 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7:

  ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6 (2026-05-15 11:35:25 +0200)

----------------------------------------------------------------
Renesas DTS updates for v7.2

  - Add GPU support for R-Car M3-W(+)-based ULCB and Salvator-X(S)
    development boards,
  - Add Ethernet, OPP table, interrupt, pin control, and watchdog
    support for the RZ/G3L SoC and the RZ/G3L SMARC SoM board,
  - Add Coresight support for the R-Mobile A1 and APE6 SoCs, and the
    Armadillo-800 EVA and APE6EVM development boards,
  - Miscellaneous fixes and improvements.

Note that this (1) is based on v7.1-rc3, as PowerVR GPU enablement has a
dependency on commit 26735dfdd8930d9e ("pmdomain: core: Fix detach
procedure for virtual devices in genpd"), and (2) includes:
  - Renesas SoC fixes for v7.1, which are already present in
    soc/for-next, but not yet in v7.1-rc4,
  - DT binding definition updates for the R-Mobile A1 and APE6 SoCs,
    which are shared by the clock subsystem and DT source files,
  - DT binding definitions for the RZ/G3L SoC, which are shared by the
    pin control subsystem and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (13):
      dt-bindings: pinctrl: renesas,rzg2l-pinctrl: Document reset-names
      dt-bindings: pinctrl: renesas: Document RZ/G3L SoC
      arm64: dts: renesas: r9a08g046: Add GBETH nodes
      arm64: dts: renesas: rzg3l-smarc-som: Enable eth0 (GBETH0) interface
      arm64: dts: renesas: Add pinctrl reset-names for RZ/G2L and RZ/V2H family SoCs
      arm64: dts: renesas: r9a08g046: Add OPP table
      arm64: dts: renesas: r9a08g046: Add ICU node
      arm64: dts: renesas: r9a08g046: Add pincontrol node
      arm64: dts: renesas: r9a08g046l48-smarc: Add SCIF0 pincontrol
      arm64: dts: renesas: rzg3l-smarc-som: Add pinctrl configuration for ETH0
      arm64: dts: renesas: rzg3l-smarc-som: Enable eth1 (GBETH1) interface
      arm64: dts: renesas: r9a08g046: Add wdt device node
      arm64: dts: renesas: rzg3l-smarc-som: Enable watchdog

Geert Uytterhoeven (5):
      arm64: dts: renesas: r8a78000: Fix SCIF brg_int clocks
      Merge tag 'renesas-fixes-for-v7.1-tag1' into renesas-dts-for-v7.2
      Merge tag 'renesas-r8a7740-dt-binding-defs-tag1' into renesas-dts-for-v7.2
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag2' into renesas-dts-for-v7.2
      Merge tag 'renesas-r8a73a4-dt-binding-defs-tag1' into renesas-dts-for-v7.2

Marek Vasut (24):
      arm64: dts: renesas: draak/ebisu-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: salvator-panel: Fix missing cells and reg in DTO
      arm64: dts: renesas: rz-smarc-cru-csi-ov5645: Fix missing cells and reg in CSI2 subnode
      arm64: dts: renesas: rz-smarc-du-adv7513-smarc: Fix missing cells and reg in DU subnode
      ARM: dts: renesas: r8a7778: Add missing unit address to bus node
      ARM: dts: renesas: r8a7779: Add missing unit address to bus node
      ARM: dts: renesas: r8a7792: Add missing unit address to bus node
      ARM: dts: renesas: r7s72100: Add missing unit address to bus node
      ARM: dts: renesas: genmai: Drop superfluous cells
      ARM: dts: renesas: rskrza1: Drop superfluous cells
      dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile A1
      arm64: dts: renesas: r8a77960-ulcb: Enable GPU support
      arm64: dts: renesas: r8a77960-salvator-x: Enable GPU support
      arm64: dts: renesas: r8a77960-salvator-xs: Enable GPU support
      arm64: dts: renesas: r8a77961-ulcb: Enable GPU support
      arm64: dts: renesas: r8a77961-salvator-xs: Enable GPU support
      ARM: dts: renesas: r8a7740: Add ZT/ZTR trace clocks
      ARM: dts: renesas: r8a7740: Describe coresight
      arm64: dts: renesas: gray-hawk-single: Fix AVB0 PHY node alignment
      arm64: dts: renesas: ebisu: Sort sound node
      arm64: dts: renesas: salvator-common: Sort sound node
      dt-bindings: clock: renesas,cpg-clocks: Document ZT/ZTR trace clock on R-Mobile APE6
      ARM: dts: renesas: r8a73a4: Add ZT/ZTR trace clock on R-Mobile APE6
      ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g057: Add #mux-state-cells to usb2{0,1}phyrst
      arm64: dts: renesas: r9a09g056: Add #mux-state-cells to usb20phyrst

 .../bindings/clock/renesas,cpg-clocks.yaml         |   8 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |  35 ++
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts      |   3 -
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts     |   2 -
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   2 +-
 arch/arm/boot/dts/renesas/r8a73a4.dtsi             | 114 +++++-
 arch/arm/boot/dts/renesas/r8a7740.dtsi             | 116 +++++-
 arch/arm/boot/dts/renesas/r8a7778.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7779.dtsi             |   2 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |   2 +-
 .../dts/renesas/draak-ebisu-panel-aa104xd12.dtso   |   5 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  34 +-
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  |  10 +-
 .../arm64/boot/dts/renesas/r8a77960-salvator-x.dts |   4 +
 .../boot/dts/renesas/r8a77960-salvator-xs.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a77960-ulcb.dts      |   4 +
 .../boot/dts/renesas/r8a77961-salvator-xs.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a77961-ulcb.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |   8 +-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 402 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  13 +
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |   1 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |   2 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |   3 +
 .../boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |   5 +
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi      |   5 +
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   | 132 +++++++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  26 +-
 .../boot/dts/renesas/salvator-panel-aa104xd12.dtso |   5 +
 include/dt-bindings/clock/r8a73a4-clock.h          |   2 +
 include/dt-bindings/clock/r8a7740-clock.h          |   2 +
 .../pinctrl/renesas,r9a08g046-pinctrl.h            |  38 ++
 36 files changed, 945 insertions(+), 58 deletions(-)
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a08g046-pinctrl.h

