Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4D85DCD6E57
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 13:18:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/hGlmcsCdLZLCc4orI5sQhoYqEb9Qu2Ye7shpr3Getg=; b=SiUoRGfgv5AVyzMlx6BSCpnrXN
	vyujoYXFtqxThELECRmqJZhxqKaiBSZNULjIe/iGvS92qD1le7Ai+1Szubk7Ba3nl0KfjorFXCKa9
	9Lx+NqDoeSKiccbEwZkRTX5ikvnv5FVPbeiboN7MNcWUgHfTnjulgVhIn1bSdOUVoUUSGC02SJG+Y
	y/74hS4AhvoyMbX4wCe8dvawZRbEzPcMfL55agRbg4HzHrOcI+IFJ5tuBBVWciq0qdWzsyKKHzkye
	8n8pVKqj9eGoAw0dvco0WcfZPFJZO46dnop3p2qJfvXIljFepEMjtry84P4KVSCZ9LmWiruyMYLap
	gmQpXWqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2XF-0000000BCHZ-0YFn;
	Mon, 01 Jun 2026 13:18:29 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU2XD-0000000BCG9-0kXc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 13:18:28 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id DFAF7405B0;
	Mon,  1 Jun 2026 13:18:26 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF6E1F00893;
	Mon,  1 Jun 2026 13:18:25 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 2/2] Renesas DTS updates for v7.2 (take two)
Date: Mon,  1 Jun 2026 15:18:19 +0200
Message-ID: <cover.1780319122.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.178031911driver8.git.geert+renesas@glider.be>
References: <cover.178031911driver8.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_061827_276022_A89FA97B 
X-CRM114-Status: GOOD (  15.03  )
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

The following changes since commit 44f1ef06ceec55b7704c7d773d6136ca8b90f8b7:

  ARM: dts: renesas: r8a73a4: Describe coresight on R-Mobile APE6 (2026-05-15 11:35:25 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.2-tag2

for you to fetch changes up to 0d4ed954061efc3e47fa889d3de0675f933f438f:

  arm64: dts: renesas: r9a08g046l48-smarc: Enable audio (2026-05-31 10:52:23 +0200)

----------------------------------------------------------------
Renesas DTS updates for v7.2 (take two)

  - Add timer (MTU3) and xSPI FLASH support for the RZ/T2H and RZ/N2H
    SoCs and their EVK boards,
  - Add PCIe support for the RZ/V2N SoC and the RZ/V2N EVK board,
  - Add support for the R-Car M3Le SoC and the Geist development board,
  - Specify ethernet PHY reset timings on various R-Car boards,
  - Add (more) serial, I2C, DMA, and sound support for the RZ/G3L SoC,
  - Add PSCI, Multifunctional Interface (MFIS), and SCMI support for the
    R-Car X5H SoC and Ironhide development board,
  - Add serial DMA support for the RZ/G2L SoC,
  - Add keyboard, I2C, Versa clock, and audio support for the RZ/G3L
    SMARC SoM and EVK boards,
  - Miscellaneous fixes and improvements.

Note that this includes DT binding definitions for R-Car X5H, which are
shared by driver and DT source files.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (14):
      arm64: dts: renesas: r9a08g046: Add scif{1..5} device nodes
      arm64: dts: renesas: r9a08g046: Add i2c{0..3} device nodes
      arm64: dts: renesas: r9a08g046: Add DMAC node
      arm64: dts: renesas: r9a08g046: Add SSI support
      arm64: dts: renesas: r9a08g046: Add audio clock nodes
      arm64: dts: renesas: r9a08g046: Add rsci{0..3} device nodes
      arm64: dts: renesas: r9a07g043: Add max-frequency to SDHI nodes
      arm64: dts: renesas: r9a07g044: Add max-frequency to SDHI nodes
      arm64: dts: renesas: r9a07g054: Add max-frequency to SDHI nodes
      arm64: dts: renesas: rzg3e-smarc-som: Sort GMAC pinmux entries
      arm64: dts: renesas: r9a08g046l48-smarc: Add gpio keys
      arm64: dts: renesas: r9a08g046l48-smarc: Enable I2C{2,3} devices
      arm64: dts: renesas: rzg3l-smarc-som: Enable Versa clock generator
      arm64: dts: renesas: r9a08g046l48-smarc: Enable audio

Claudiu Beznea (1):
      arm64: dts: renesas: r9a07g044: Add DMA properties to serial nodes

Cosmin Tanislav (3):
      arm64: dts: renesas: r9a07g0{43,44,54}: Remove TCIU8 interrupt from MTU3
      arm64: dts: renesas: r9a09g077: Add MTU3 support
      arm64: dts: renesas: r9a09g087: Add MTU3 support

Fabrizio Castro (1):
      arm64: dts: renesas: rzt2h-n2h-evk: Configure eMMC/SDHI pins

Geert Uytterhoeven (1):
      Merge tag 'renesas-r8a78000-dt-binding-defs-tag1' into renesas-dts-for-v7.2

Kuninori Morimoto (2):
      arm64: dts: renesas: r8a78000: Add MFIS, MFIS-SCP, and transport nodes
      arm64: dts: renesas: ironhide: Enable to use SCMI

Lad Prabhakar (8):
      arm64: dts: renesas: rz-smarc-du-adv7513: Simplify DU port configuration
      arm64: dts: renesas: r9a09g056: Add PCIe node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable PCIe
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add alias for on-SoC RTC
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add alias for on-SoC RTC
      arm64: dts: renesas: r9a09g077: Add xSPI nodes
      arm64: dts: renesas: r9a09g087: Add xSPI nodes
      arm64: dts: renesas: rzt2h-n2h-evk: Enable xSPI nodes

Marek Vasut (22):
      arm64: dts: renesas: Simplify AA1024XD12 display DTO
      dt-bindings: clock: cirrus,cs2000-cp: Document CS2500
      dt-bindings: soc: renesas: Document R-Car R8A779MD Geist
      arm64: dts: renesas: draak: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: ebisu: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: hihope: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: salvator-common: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: ulcb: Rename clk-multiplier to clock-controller
      arm64: dts: renesas: salvator-common: Specify ethernet PHY reset timings
      arm64: dts: renesas: ulcb: Specify ethernet PHY reset timings
      arm64: dts: renesas: eagle: Specify ethernet PHY reset timings
      arm64: dts: renesas: v3msk: Specify ethernet PHY reset timings
      arm64: dts: renesas: condor-common: Specify ethernet PHY reset timings
      arm64: dts: renesas: v3hsk: Specify ethernet PHY reset timings
      arm64: dts: renesas: ebisu: Specify ethernet PHY reset timings
      arm64: dts: renesas: draak: Specify ethernet PHY reset timings
      arm64: dts: renesas: falcon: Specify ethernet PHY reset timings
      arm64: dts: renesas: white-hawk: Specify ethernet PHY reset timings
      arm64: dts: renesas: gray-hawk: Specify ethernet PHY reset timings
      arm64: dts: renesas: r8a78000: Add PSCI node
      arm64: dts: renesas: r8a78000: Fix GIC-720AE View 1 Redistributor description
      arm64: dts: renesas: ironhide: Describe all reserved memory

Nguyen Tran (2):
      arm64: dts: renesas: r8a779md: Add Renesas R-Car R8A779MD M3Le DTs
      arm64: dts: renesas: r8a779md: Add support for R-Car M3Le R8A779MD Geist

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add fcpvd{0,1} nodes
      arm64: dts: renesas: r9a09g047: Add vspd{0,1} nodes

Wolfram Sang (1):
      dt-bindings: soc: renesas: Document MFIS IP core

 .../bindings/clock/cirrus,cs2000-cp.yaml           |  11 +-
 .../soc/renesas/renesas,r8a78000-mfis.yaml         | 187 ++++++
 .../devicetree/bindings/soc/renesas/renesas.yaml   |   6 +
 arch/arm64/boot/dts/renesas/Makefile               |   1 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   2 +
 .../dts/renesas/draak-ebisu-panel-aa104xd12.dtso   |  33 +-
 arch/arm64/boot/dts/renesas/draak.dtsi             |   4 +-
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   4 +-
 arch/arm64/boot/dts/renesas/gray-hawk-single.dtsi  |   2 +
 arch/arm64/boot/dts/renesas/hihope-rev4.dtsi       |   2 +-
 arch/arm64/boot/dts/renesas/panel-aa104xd12.dtsi   |  64 +-
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   2 +
 arch/arm64/boot/dts/renesas/r8a779a0-falcon.dts    |   2 +
 arch/arm64/boot/dts/renesas/r8a779md-geist.dts     | 720 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779md.dtsi          |  59 ++
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts  |  65 +-
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          | 170 ++++-
 arch/arm64/boot/dts/renesas/r9a07g043.dtsi         |   7 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  17 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |   7 +-
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 384 ++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts | 127 +++-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  52 ++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  69 ++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  24 +
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   1 +
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 108 ++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  15 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 108 ++++
 .../boot/dts/renesas/rz-smarc-du-adv7513.dtsi      |  15 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  49 +-
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  72 +++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     | 274 +++++++-
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   4 +-
 .../boot/dts/renesas/salvator-panel-aa104xd12.dtso |  33 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   4 +-
 .../boot/dts/renesas/white-hawk-cpu-common.dtsi    |   2 +
 include/dt-bindings/soc/renesas,r8a78000-mfis.h    |  28 +
 40 files changed, 2575 insertions(+), 163 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/soc/renesas/renesas,r8a78000-mfis.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md-geist.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779md.dtsi
 create mode 100644 include/dt-bindings/soc/renesas,r8a78000-mfis.h

