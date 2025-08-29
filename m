Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C418CA0FF0
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 29 Aug 2025 17:46:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z6zDx/UCLmLBiOaua8m1VN5KbfO74Jx1VEl8bQKh7w4=; b=ygwj4+mkEJKRUijLCE7euABIDA
	g23+cmHgp/35aQHWoZo8yRfocQjCvfjQ10X41nHfoi3a5gw8v50QXJB/D4Jt12AQdnsVA4OpeCSz/
	KZGCLMkxlfAbgM8FbQojub411tYWInrHB9ifSOIbbnUmNxKyirP2T7amxLFV9VxuekcbMm852JPj4
	Vfuf1QEmeBTJ2CkF/DwgigeABwqqGqTVrKIQ9fk4tE8nlLm1HBSsjZq34KpWRcH1NPgMZCh9yDdcu
	SMoMuVXizt7rtkL5xGHxdGfhvMpEXItAprwLSdkt7Snq46SCmAbSoffXjndhNtw1yVUCS1yygFQ+9
	rMUm/dvA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1us3BV-00000006ZPo-3XWT;
	Fri, 29 Aug 2025 17:46:45 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ury3q-00000005caR-38Vb
	for linux-arm-kernel@lists.infradead.org;
	Fri, 29 Aug 2025 12:18:30 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 317F960054;
	Fri, 29 Aug 2025 12:18:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B9B54C4CEF0;
	Fri, 29 Aug 2025 12:18:28 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.18
Date: Fri, 29 Aug 2025 14:18:15 +0200
Message-ID: <cover.1756468048.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1756468041.git.geert+renesas@glider.be>
References: <cover.1756468041.git.geert+renesas@glider.be>
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

The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.18-tag1

for you to fetch changes up to 115b557b6f61ca279a4754b20b8686039fdb5234:

  arm64: dts: renesas: Minor whitespace cleanup (2025-08-20 09:07:05 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.18

  - Add initial support for the RZ/T2H (R9A09G077) and RZ/N2H
    (R9A09G087) SoCs and their evaluation boards,
  - Add SPI support for the RZ/V2H SoC,
  - Add DMAC and I3C support for the RZ/G3E SoC,
  - Add I3C support for the RZ/G3S SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (1):
      arm64: dts: renesas: rzg2lc-smarc: Disable CAN-FD channel0

Fabrizio Castro (1):
      arm64: dts: renesas: r9a09g057: Add RSPI nodes

Geert Uytterhoeven (5):
      arm64: dts: renesas: r9a09g057h48-kakip: Fix misplaced article
      ARM: dts: renesas: porter: Fix CAN pin group
      arm64: dts: renesas: rcar-gen3: Increase CANFD clock rates
      arm64: dts: renesas: rzg2: Increase CANFD clock rates
      Merge tag 'renesas-r9a09g077-dt-binding-defs-tag3' into renesas-dts-for-v6.18

Krzysztof Kozlowski (1):
      arm64: dts: renesas: Minor whitespace cleanup

Lad Prabhakar (10):
      arm64: dts: renesas: Add initial SoC DTSI for the RZ/N2H SoC
      dt-bindings: clock: renesas,r9a09g077/87: Add USB_CLK clock ID
      dt-bindings: pinctrl: renesas: Document RZ/T2H and RZ/N2H SoCs
      arm64: dts: renesas: r9a09g077: Add I2C controller nodes
      arm64: dts: renesas: r9a09g087: Add I2C controller nodes
      arm64: dts: renesas: r9a09g077: Add SDHI nodes
      arm64: dts: renesas: r9a09g087: Add SDHI nodes
      arm64: dts: renesas: r9a09g077: Add DT nodes for SCI channels 1-5
      arm64: dts: renesas: r9a09g087: Add DT nodes for SCI channels 1-5
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Enable I2C0 and I2C1 support

Marek Vasut (5):
      arm64: dts: renesas: sparrow-hawk: Describe generic SPI NOR support
      ARM: dts: renesas: r7s72100: Add boot phase tags
      arm64: dts: renesas: sparrow-hawk: Update thermal trip points
      arm64: dts: renesas: sparrow-hawk: Invert microSD voltage selector on EVTB1
      arm64: dts: renesas: sparrow-hawk: Set VDDQ18_25_AVB voltage on EVTB1

Paul Barker (3):
      arm64: dts: renesas: Refactor RZ/T2H EVK device tree
      arm64: dts: renesas: Add DTSI for R9A09G087M44 variant of RZ/N2H
      arm64: dts: renesas: Add initial support for the RZ/N2H EVK

Quynh Nguyen (1):
      arm64: dts: renesas: r9a08g045: Add I3C node

Thierry Bultel (3):
      arm64: dts: renesas: Add initial support for the Renesas RZ/T2H SoC
      arm64: dts: renesas: Add initial support for the Renesas RZ/T2H eval board
      arm64: dts: renesas: r9a09g077: Add pinctrl node

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add DMAC nodes
      arm64: dts: renesas: r9a09g047: Add I3C node

 .../pinctrl/renesas,r9a09g077-pinctrl.yaml         | 172 ++++++++++++
 arch/arm/boot/dts/renesas/r7s72100-genmai.dts      |   4 +-
 arch/arm/boot/dts/renesas/r7s72100-gr-peach.dts    |   4 +-
 arch/arm/boot/dts/renesas/r7s72100-rskrza1.dts     |   3 +
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   3 +
 arch/arm/boot/dts/renesas/r8a7791-porter.dts       |   2 +-
 arch/arm64/boot/dts/renesas/Makefile               |   4 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |   2 +-
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     | 149 ++++++++++-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  36 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 205 +++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  16 +-
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  79 +++++-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts |   4 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 292 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  52 ++++
 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi      |  13 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 279 ++++++++++++++++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  16 ++
 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi      |  13 +
 arch/arm64/boot/dts/renesas/rzg2lc-smarc.dtsi      |   5 +-
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  26 ++
 .../dt-bindings/clock/renesas,r9a09g077-cpg-mssr.h |   1 +
 .../dt-bindings/clock/renesas,r9a09g087-cpg-mssr.h |   1 +
 .../pinctrl/renesas,r9a09g077-pinctrl.h            |  22 ++
 37 files changed, 1390 insertions(+), 37 deletions(-)
 create mode 100644 Documentation/devicetree/bindings/pinctrl/renesas,r9a09g077-pinctrl.yaml
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g077m44.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g087m44.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzt2h-n2h-evk-common.dtsi
 create mode 100644 include/dt-bindings/pinctrl/renesas,r9a09g077-pinctrl.h

