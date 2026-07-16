Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 500A3C44501
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 16 Jul 2026 10:04:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UnvgCkE4mBYDRZ7z+YuqACcvUD7Snjn08DDTANATk6M=; b=2o197GkqU0OReYx/8Dd3NYr3EI
	d2XueYIj/KmICdXs4PFsnC8mWFJX2swrQ1x8fEhn0D4Y79yytsOTKdtv9dc8UU0SDL8TKW1oXQbv8
	iY9U+V1kAJHsMftcOoyOPd3toqr3VFm6xKlMJAm29SIU+mcy2rD0VBh8G8CZFeter6AHTIj4Z4zBw
	4MaQ+hExrLoL1KoEfMm1AeIt6G63CLZdruH36qzpafGUlLSWTPn7xrWw3vpmBjmHM2eXX+CHpSIzJ
	GmaMWsDL5OYGe8XeP9DGm/TQSt4al/1wyk5ZkKli6Uu9ZUYFYuw0wD3KhVvs74v5qdlzXwKEI/NOs
	DmyoeqsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIwe-0000000GxPW-43xJ;
	Thu, 16 Jul 2026 10:03:56 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkIwe-0000000GxOm-0etG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 16 Jul 2026 10:03:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 9A54A600AB;
	Thu, 16 Jul 2026 10:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 05BBA1F00AC4;
	Thu, 16 Jul 2026 10:03:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v7.3
Date: Thu, 16 Jul 2026 12:03:43 +0200
Message-ID: <cover.1784194406.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1784194401.git.geert+renesas@glider.be>
References: <cover.1784194401.git.geert+renesas@glider.be>
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

The following changes since commit 6fa6ee724d8dadf392139e242ac936b5da730c4b:

  arm64: dts: renesas: ironhide: Describe inline ECC carveouts (2026-07-14 10:34:32 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git renesas-dts-for-v7.3-tag1

for you to fetch changes up to 24afcb87e6aca1ff3face276223eeea0012f8e2b:

  arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code (2026-07-14 10:36:37 +0200)

----------------------------------------------------------------
Renesas DTS updates for v7.3

  - Add sound support for the RZ/G3E SoC and the RZ/G3E SMARC EVK board,
  - Add more serial and SPI support for the RZ/G3L SoC and the RZ/G3L
    SMARC EVK board,
  - Add SMP support (32x Cortex-A720AE) for the R-Car X5H SoC,
  - Add hwspinlock and mailbox (MFIS) support for the R-Car V4H SoC,
  - Add GPU support for R-Car M3-N-based Salvator-X(S) and ULCB
    development boards,
  - Add SPI and FRAM support for the RZ/N1D SoC and the RZN1D Expansion
    Board,
  - Add PCIe support for the RZ/V2H SoC and the RZ/V2H EVK development
    board,
  - Miscellaneous fixes and improvements.

Note that this PR is based on renesas-fixes-for-v7.2-tag1, for which I
have just sent a PR.

Thanks for pulling!

----------------------------------------------------------------
Biju Das (5):
      arm64: dts: renesas: r9a08g046l48-smarc: Enable rsci{1,2,3} nodes
      arm64: dts: renesas: r9a08g046: Add RSPI{0..2} nodes
      arm64: dts: renesas: r9a08g046l48-smarc: Enable RSPI2
      arm64: dts: renesas: r9a09g047e57-smarc: Drop SW_SER0_PMOD condition for rsci4
      arm64: dts: renesas: r9a09g047: Add max-frequency to SDHI nodes

John Madieu (6):
      arm64: dts: renesas: rzv2h: Add audio clock inputs
      arm64: dts: renesas: rzg3e-smarc-som: Add I2C1 support
      arm64: dts: renesas: r9a09g047: Add RZ/G3E Sound support
      arm64: dts: renesas: rzg3e-smarc-som: Add Versa3 clock generator
      arm64: dts: renesas: rzg3e-smarc-som: Add audio pinmux definitions
      arm64: dts: renesas: r9a09g047e57-smarc: Add DA7212 audio codec support

Lad Prabhakar (8):
      arm64: dts: renesas: rzt2h-n2h-evk: Remove unused MII/GMII pins
      arm64: dts: renesas: rzt2h-n2h-evk: Configure ETH pins
      arm64: dts: renesas: rzt2h-n2h-evk: Configure SCI0 pins
      arm64: dts: renesas: rzt2h-n2h-evk-common: Add memory nodes
      arm64: dts: renesas: r9a09g057: Add PCIe nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable PCIe
      arm64: dts: renesas: r9a09g056: Fix PCIe dma-ranges memory space code
      arm64: dts: renesas: r9a09g047: Fix PCIe dma-ranges memory space code

Marek Vasut (5):
      arm64: dts: renesas: r8a78000: Enable application CPU cores via PSCI
      arm64: dts: renesas: r8a77965-salvator-x: Enable GPU support
      arm64: dts: renesas: r8a77965-salvator-xs: Enable GPU support
      arm64: dts: renesas: r8a77965-ulcb: Enable GPU support
      arm64: dts: renesas: Add soc: labels to soc nodes

Wolfram Sang (3):
      arm64: dts: renesas: r8a779g0: Add MFIS node
      ARM: dts: renesas: r9a06g032: Describe SPI controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Enable SPI-FRAM

bui duc phuc (1):
      ARM: dts: renesas: r8a7740: Add FSI clocks

 arch/arm/boot/dts/renesas/r8a7740.dtsi             |  12 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts |  25 +
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  84 ++++
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |   2 +-
 .../arm64/boot/dts/renesas/r8a77965-salvator-x.dts |   4 +
 .../boot/dts/renesas/r8a77965-salvator-xs.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a77965-ulcb.dts      |   4 +
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          |  32 ++
 arch/arm64/boot/dts/renesas/r9a08g046.dtsi         |  69 +++
 arch/arm64/boot/dts/renesas/r9a08g046l48-smarc.dts |  78 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 525 ++++++++++++++++++++-
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts | 114 ++++-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  22 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 160 ++++++-
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    |  18 +
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 144 ++++--
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 144 ++++--
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  44 ++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  14 +
 28 files changed, 1420 insertions(+), 112 deletions(-)

