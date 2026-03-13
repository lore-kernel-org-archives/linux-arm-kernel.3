Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A9D78105F79A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 11:13:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8EZt07vNfoho+e6ZXPCC/0P3tAp94CeZmnpxNG64X8Y=; b=ujO47OR9sJjWX5K4trzRT7rezv
	0j8VYV2/bqrSPacfXV+YDS9wR9HZEQCshCWZYU8riPeLKGkCgLFSEZLedVuoeG45XruSdDTAz4Nib
	v6xqcncvf8B4cldVXcBRW0aWOVMIqPiuX7PRz2tzPQyhbGV+GDPoz/C6/VNZBmsc84Ks4c0lmZMTW
	ICQulKVwltoDY8p+1XrjPkshglj3E7KdhTbWezTGgw6QgqkL4Skbu1y0gdurHaar7jaSnqBGVMl8x
	OAbokSQQ3yTrWfcsax/7+klibIU/+1ECx4hHA2JaryNhN3PAnGK32hHYzpSfF67ZjZhLyoloOVcZP
	+fvd56qg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10SD-0000000Happ-3BLM;
	Fri, 13 Mar 2026 11:13:17 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w10S7-0000000Han7-3786
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Mar 2026 11:13:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2C9DC60138;
	Fri, 13 Mar 2026 11:13:11 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2BEFC2BC87;
	Fri, 13 Mar 2026 11:13:09 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v7.1
Date: Fri, 13 Mar 2026 12:13:00 +0100
Message-ID: <cover.1773399675.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1773399669.git.geert+renesas@glider.be>
References: <cover.1773399669.git.geert+renesas@glider.be>
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

The following changes since commit 85c2601e2c2feb60980c7ca23de28c49472f61f1:

  arm64: dts: renesas: r8a78000: Fix out-of-range SPI interrupt numbers (2026-03-06 13:15:21 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v7.1-tag1

for you to fetch changes up to 0928a28daf017504e14920f4131bb99e3bc39dba:

  ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232 (2026-03-13 11:00:48 +0100)

----------------------------------------------------------------
Renesas DTS updates for v7.1

  - Add CPU frequency scaling and QSPI NOR FLASH support on the RZ/N1
    SoC and the RZN1D-DB development board,
  - Add PCIe slot power control on the R-Car H3, M3-W(+), M3-N, and E3
    SoCs,
  - Add USB3.0 PHY support on the R-Car E3 SoC and the Ebisu development
    board,
  - Add PCIe/USB3.0 clock generator support on the Salvator-X(S), ULCB
    King Fisher extension, and Ebisu development boards,
  - Add RTC support on the RZ/V2N SoC and its EVK board,
  - Add SPI DMA support on the RZ/T2H, RZ/N2H, RZ/V2H(P), and RZ/V2N
    SoCs,
  - Add support for the second SDHI channel on the Atmark Techno
    Armadillo-800-EVA board,
  - Miscellaneous fixes and improvements.

Note that this PR is based on "[GIT PULL] Renesas SoC fixes for v7.0".

----------------------------------------------------------------
Cosmin Tanislav (2):
      arm64: dts: renesas: r9a09g077: Wire up DMA support for SPI
      arm64: dts: renesas: r9a09g087: Wire up DMA support for SPI

Geert Uytterhoeven (1):
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Do not use underscores in node names

Herve Codina (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Add support for CPU frequency scaling

Lad Prabhakar (2):
      arm64: dts: renesas: r9a09g056: Add DMA support for RSPI channels
      arm64: dts: renesas: r9a09g057: Add DMA support for RSPI channels

Marek Vasut (10):
      arm64: dts: renesas: sparrow-hawk: Mark OTP and HSCIF0 pins as bootph-all
      arm64: dts: renesas: r8a77951: Describe PCIe root ports
      arm64: dts: renesas: r8a77960: Describe PCIe root ports
      arm64: dts: renesas: r8a77961: Describe PCIe root ports
      arm64: dts: renesas: r8a77965: Describe PCIe root ports
      arm64: dts: renesas: r8a77990: Describe PCIe root port
      arm64: dts: renesas: r8a77990: Add USB 3.0 PHY and USB3S0 clock nodes
      arm64: dts: renesas: salvator-common: Describe PCIe/USB3.0 clock generator
      arm64: dts: renesas: ulcb: ulcb-kf: Describe PCIe/USB3.0 clock generator
      arm64: dts: renesas: ebisu: Describe PCIe/USB3.0 clock generator

Miquel Raynal (Schneider Electric) (1):
      ARM: dts: renesas: r9a06g032: Describe the QSPI controller

Ovidiu Panait (2):
      arm64: dts: renesas: r9a09g056: Add RTC node
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable RTC

Wolfram Sang (2):
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Add QSPI node including NOR flash
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Use interrupts for Micrel PHYs

bui duc phuc (2):
      ARM: dts: renesas: armadillo800eva: Enable SDHI1
      ARM: dts: renesas: armadillo800eva: Add wakeup-source to st1232

 .../boot/dts/renesas/r8a7740-armadillo800eva.dts   |  32 ++++++
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 111 +++++++++++++++++++--
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  47 +++++++++
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |  43 +++++++-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  20 ++++
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  20 ++++
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  20 ++++
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  20 ++++
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  27 +++++
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |   5 +
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  36 +++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |   4 +
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  21 ++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  16 +++
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  16 +++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |  28 +++++-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  21 +++-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |  13 +++
 18 files changed, 490 insertions(+), 10 deletions(-)

