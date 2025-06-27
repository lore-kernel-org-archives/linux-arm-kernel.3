Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A521AC7EE31
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 27 Jun 2025 13:23:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VQKYiWNdkrgcmJMuTCKwVjGXjLkDJ1/KdA4fUCCIL4o=; b=cpgMhkqpdkXKzqyISZ7vO+QihY
	2BaJvuq+1xyn9/6X0HCcJXk/VMH1HkA7LDy/ntT3JDU1Geyy+pK7ddePCk56Ijsa/j54udpQP2eMV
	6QmQ8tLawiW9NqUqsWo6cgPs0IMpSvTjsEh97it3kFIZwStZ98f/JSHw/qbzy+MdMKgowtOagan97
	eXUQC4mhgdhuIr7/lRkvfPysarQBJ6oZJVRP8ZnwHaIAWvCuPjUPB7sjfz0onJNdGvLse3+FfIwcD
	iO3D2KUaVxVVACUox6Deq3wygGvTHoTO4gS6UbtxOQhrnEWkKVUrQyKS29Hu0xvSHSBU6KfaFDsGx
	58PwFQ9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV92v-0000000ElKX-0Dsa;
	Fri, 27 Jun 2025 13:23:13 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uV8Nb-0000000EfL6-2eij
	for linux-arm-kernel@lists.infradead.org;
	Fri, 27 Jun 2025 12:40:32 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id F2BE6A523A0;
	Fri, 27 Jun 2025 12:40:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6AD3AC4CEED;
	Fri, 27 Jun 2025 12:40:29 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.17
Date: Fri, 27 Jun 2025 14:40:19 +0200
Message-ID: <cover.1751026664.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1751026657.git.geert+renesas@glider.be>
References: <cover.1751026657.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250627_054031_810175_4CFB07E0 
X-CRM114-Status: GOOD (  11.32  )
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

The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.17-tag1

for you to fetch changes up to 41ffbb1c42d30a173cc43e931bbaf7bf29e92d1f:

  arm64: dts: renesas: r9a09g047: Add GBETH nodes (2025-06-26 16:37:21 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.17

  - Add SPI FLASH, camera, and Ethernet support on the RZ/G3E SoC and/or
    the RZ/G3E SoM and SMARC Carrier-II EVK development board,
  - Add Ethernet, USB2, and PMIC support on the RZ/V2H and RZ/V2N SoCs
    and EVK boards,
  - Add timer, I2C, watchdog, and GPU support on the RZ/V2N SoC and the
    RZ/V2N EVK board,
  - Add debug LED support for the RZN1D-DB development board,
  - Improve PCIe clock description on the Retronix Sparrow Hawk board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a09g047: Add XSPI node
      arm64: dts: renesas: rzg3e-smarc-som: Enable serial NOR FLASH

Geert Uytterhoeven (2):
      arm64: dts: renesas: ebisu: Add CAN0 support
      Merge branch 'pwrctrl' of git://git.kernel.org/pub/scm/linux/kernel/git/pci/pci into renesas-dts-for-v6.17

John Madieu (1):
      arm64: dts: renesas: r9a09g047: Add GBETH nodes

Lad Prabhakar (19):
      arm64: dts: renesas: r9a09g057: Add GBETH nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable GBETH
      arm64: dts: renesas: r9a09g056: Add GBETH nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable GBETH
      arm64: dts: renesas: r9a09g056: Add OSTM0-OSTM7 nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable OSTM timers on RZ/V2N EVK
      arm64: dts: renesas: r9a09g056: Add RIIC controllers
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RIIC controllers
      arm64: dts: renesas: r9a09g056: Add WDT0-WDT3 nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable WDT1
      arm64: dts: renesas: r9a09g056: Add Mali-G31 GPU node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable Mali-G31 GPU
      arm64: dts: renesas: r9a09g057: Add USB2.0 support
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB2.0 support
      arm64: dts: renesas: r9a09g056: Add USB2.0 support
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB2.0 support
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Add RAA215300 PMIC
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add RAA215300 PMIC
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Rename fixed regulator node names

Marek Vasut (5):
      PCI/pwrctrl: Add optional slot clock for PCI slots
      arm64: dts: renesas: r8a779g3-sparrow-hawk: Sort DTS
      arm64: dts: renesas: r8a779g0: Describe PCIe root ports
      arm64: dts: renesas: sparrow-hawk: Describe split PCIe clock
      arm64: dts: renesas: rcar-gen3: Add bootph-all to sysinfo EEPROMs

Tommaso Merciai (4):
      arm64: dts: renesas: r9a09g047: Add CRU, CSI2 nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Add I2C0 pincontrol
      arm64: dts: renesas: renesas-smarc2: Enable I2C0 node
      arm64: dts: renesas: r9a09g047e57-smarc: Enable CRU, CSI support

Wolfram Sang (2):
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Describe debug LEDs
      ARM: dts: renesas: r9a06g032: Add second clock input to RTC

 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |  64 +++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   4 +-
 arch/arm64/boot/dts/renesas/Makefile               |   3 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   2 +
 arch/arm64/boot/dts/renesas/draak.dtsi             |   2 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  16 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  20 +
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |  57 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 299 ++++++++++
 .../renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso |  21 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  10 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         | 635 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 262 +++++++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 322 +++++++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 150 ++++-
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |   6 +
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  46 ++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   2 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   2 +
 drivers/pci/pwrctrl/slot.c                         |   8 +
 20 files changed, 1912 insertions(+), 19 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc-cru-csi-ov5645.dtso

