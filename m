Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3CC7710F3DE2
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 28 Mar 2026 12:11:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=deZlngC+GTcezI0PivGtO/8LYJZafOnvzERZbOHR/Rs=; b=WL4t8opT+fetrYFjKl1URm3UcI
	KPaXpBjcukZcfOsj9ucsE880nAQ5EJ3aXB5/vemegch0AZCwteNaaFfkcjBgjOsosH0FZ5MHisldb
	FLPdM9Ml0VGjhsVwljap031o/r0ny4Pvtw2WRMgD7S0kPzmNotdCQWpa6tnET7liMkdGvwP8zpFjX
	a83PfFZfnnKvCt1uKFebcWVEysKhUEUrzqPHX5GdrlQNDEvDxUEdCuTpI3ZBf2R4sVoawzJIq0U2A
	LnHBaDFe5RrEvrb8kAXI3scfDiaMccv8zw97N3fPgKYQNb14yjBWRCpOa1QdS8jJoyPvPGy5yJRw1
	tyOoE/CQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVl-00000008uep-2wYD;
	Sat, 28 Mar 2026 12:11:29 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w6SVZ-00000008uZo-0rBQ
	for linux-arm-kernel@lists.infradead.org;
	Sat, 28 Mar 2026 12:11:18 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id CF1D943E23;
	Sat, 28 Mar 2026 12:11:16 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73435C19424;
	Sat, 28 Mar 2026 12:11:15 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v7.1 (take two)
Date: Sat, 28 Mar 2026 13:11:06 +0100
Message-ID: <cover.1774606542.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1774606536.git.geert+renesas@glider.be>
References: <cover.1774606536.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260328_051117_326652_845A6C42 
X-CRM114-Status: GOOD (  13.54  )
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

The following changes since commit 0928a28daf017504e14920f4131bb99e3bc39dba:

  ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag2

for you to fetch changes up to be3810a2ebc0c81303a15392097bac9ee0cd6297:

  ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible strings (2026-03-26 20:00:35 +0100)

----------------------------------------------------------------
Renesas DTS updates for v7.1 (take two)

  - Add DT overlay support for the MayQueen PixPaper display on the
    Yuridenki-Shokai Kakip board,
  - Add Ethernet PHY interrupt support for the RZ/T2H and RZ/N2H EVK
    boards,
  - Add SPI and PCIe support for the RZ/G3E SoC and the RZ/G3E SMARC EVK
    board,
  - Add DT overlay support for the WaveShare 13.3" 1920x1080 DSI
    Capacitive Touch Display and the Olimex MIPI-HDMI adapter on the
    Retronix Sparrow Hawk board,
  - Drop several superfluous C22 Ethernet PHY compatible strings,
  - Remove WDT nodes meant for other CPU cores on the RZ/V2N SoC,
  - Remove unavailable LVDS panel support for the Beacon ReneSoM base
    board,
  - Add initial support for the RZ/G3L (R9A08G046) SoC, and the RZ/G3L
    SMARC SoM and EVK boards,
  - Add Versa3 clock generator support for the RZ/V2H EVK development
    board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Adam Ford (1):
      arm64: dts: renesas: beacon-renesom: Remove LVDS Panel

Biju Das (5):
      dt-bindings: clock: renesas,rzg2l-cpg: Document RZ/G3L SoC
      arm64: dts: renesas: Add initial DTSI for RZ/G3L SoC
      arm64: dts: renesas: Add initial support for RZ/G3L SMARC SoM
      arm64: dts: renesas: renesas-smarc2: Move usb3 nodes to board DTS
      arm64: dts: renesas: Add initial device tree for RZ/G3L SMARC EVK board

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g056: Remove wdt{0,2,3} nodes

Geert Uytterhoeven (2):
      arm64: dts: renesas: rzt2h-rzn2h-evk: Fix GMAC pins sort order
      Merge tag 'renesas-r9a08g046-dt-binding-defs-tag1' into renesas-dts-for-v7.1

Herve Codina (Schneider Electric) (1):
      ARM: dts: r9a06g032: Add #address-cells to the GIC node

John Madieu (3):
      arm64: dts: renesas: r9a09g047: Add PCIe node
      arm64: dts: renesas: r9a09g047e57-smarc-som: Add PCIe reference clock
      arm64: dts: renesas: r9a09g047e57-smarc: Enable PCIe

Lad Prabhakar (4):
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Clarify SD0 power jumpers
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Clarify SD0 power jumper setup
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add PHY interrupt support
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add PHY interrupt support

Marek Vasut (8):
      arm64: dts: renesas: sparrow-hawk: Add overlay for WaveShare Display 13.3"
      arm64: dts: renesas: Drop RTL8211E PHY C22 compatible strings
      arm64: dts: renesas: Drop RTL8211F PHY C22 compatible strings
      arm64: dts: renesas: Drop KSZ9131 PHY C22 compatible strings
      arm64: dts: renesas: Fix KSZ9131 PHY bogus txdv-skew-psec properties
      ARM: dts: renesas: r8a7742-iwg21d-q7-dbcm-ca: Drop KSZ8081 PHY C22 compatible string
      ARM: dts: renesas: rza2mevb: Drop RTL8201F PHY C22 compatible string
      ARM: dts: renesas: Drop KSZ8041 PHY C22 compatible strings

Ovidiu Panait (1):
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add versa3 clock generator node

Scott Murray (1):
      arm64: dts: renesas: sparrow-hawk: Add overlay for Olimex MIPI-HDMI adapter

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add RSPI nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Enable RSPI0

Wig Cheng (1):
      arm64: dts: renesas: r9a09g057h48-kakip: Add pixpaper display overlay

 .../bindings/clock/renesas,rzg2l-cpg.yaml          |  40 ++-
 arch/arm/boot/dts/renesas/r7s9210-rza2mevb.dts     |   3 +-
 .../boot/dts/renesas/r8a7742-iwg21d-q7-dbcm-ca.dts |   3 +-
 arch/arm/boot/dts/renesas/r8a7743-sk-rzg1m.dts     |   3 +-
 arch/arm/boot/dts/renesas/r8a7745-sk-rzg1e.dts     |   3 +-
 arch/arm/boot/dts/renesas/r8a7790-lager.dts        |   3 +-
 arch/arm/boot/dts/renesas/r8a7790-stout.dts        |   3 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |   3 +-
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |   3 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |   3 +-
 arch/arm/boot/dts/renesas/r8a7794-alt.dts          |   3 +-
 arch/arm/boot/dts/renesas/r8a7794-silk.dts         |   3 +-
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   1 +
 arch/arm64/boot/dts/renesas/Makefile               |  11 +
 .../boot/dts/renesas/beacon-renesom-baseboard.dtsi |  74 -----
 .../arm64/boot/dts/renesas/beacon-renesom-som.dtsi |   3 +-
 arch/arm64/boot/dts/renesas/cat875.dtsi            |   3 +-
 arch/arm64/boot/dts/renesas/hihope-rzg2-ex.dtsi    |   3 +-
 .../r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso     |  92 ++++++
 .../r8a779g3-sparrow-hawk-ws-display-13in.dtso     |  88 ++++++
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         | 212 +++++++++++++
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  37 +++
 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi      |  13 +
 arch/arm64/boot/dts/renesas/r9a09g011-v2mevk2.dts  |   3 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 153 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  38 +++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  30 --
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   8 +-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  33 +-
 .../dts/renesas/r9a09g057h48-kakip-pixpaper.dtso   |  39 +++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  18 ++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  71 +++--
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  18 ++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  71 +++--
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  12 +-
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   6 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |   3 +-
 arch/arm64/boot/dts/renesas/rzg2ul-smarc-som.dtsi  |   6 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  21 +-
 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi   |  20 ++
 include/dt-bindings/clock/renesas,r9a08g046-cpg.h  | 342 +++++++++++++++++++++
 41 files changed, 1267 insertions(+), 235 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-olimex-dsi-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-ws-display-13in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a08g046l48.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip-pixpaper.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3l-smarc-som.dtsi
 create mode 100644 include/dt-bindings/clock/renesas,r9a08g046-cpg.h

