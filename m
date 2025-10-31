Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78FD9CCF9FF
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Oct 2025 10:44:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=65dyEA4RUYUNpCoI9pyaTvnNZm5LJ+V1BgHZanIfaU8=; b=iYTc0CaCsh6Ua35vtWZ92vGJhS
	KcUCDmBY1n+Vbsple8lyVsng/bmbm3IRkv/HoVJjEzP7e5dtRJwwodgga9a9N51XFz3UmJ8libo6X
	Wwu8bx3F+eksIbdn4hCM6U0tKD9d/pM5D1foV8h+heKTNfcrUEI/1q7wIHQgVLrhETGdyAWioYVcL
	WQqM1Fs3zB5b7o3iYLYQcnmjnCkYmXaMFngxss7gzgIIaB15+32bVpnMxCDuF9200/QPAu1GFjdwZ
	W8qBdmgP95Mi7gaeRD1fwI4I96gsk9gXOllHYp3MfEnyoXPOoNYE1KEVglLuidXknNMzgS3jJsWTV
	5esoQeFQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmbt-00000005x3i-1n1R;
	Fri, 31 Oct 2025 10:43:57 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vEmbh-00000005x0N-24o1
	for linux-arm-kernel@lists.infradead.org;
	Fri, 31 Oct 2025 10:43:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id C1C5A44D31;
	Fri, 31 Oct 2025 10:43:44 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5C24EC116C6;
	Fri, 31 Oct 2025 10:43:43 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.19
Date: Fri, 31 Oct 2025 11:43:32 +0100
Message-ID: <cover.1761905416.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1761905410.git.geert+renesas@glider.be>
References: <cover.1761905410.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251031_034346_998231_D278AD48 
X-CRM114-Status: GOOD (  13.89  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.19-tag1

for you to fetch changes up to 9d22a34a016313137b9e534a918f1f9aa790aa69:

  arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels (2025-10-31 10:16:03 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.19

  - Add thermal support for the RZ/G3S and RZ/G3E SoCs,
  - Add DT overlay support for the Raspberry Pi Display 2 and Argon40
    fan hats on the Retronix Sparrow Hawk board,
  - Add eMMC support for the Eagle Function expansion board,
  - Add initial support for the R-Car X5H (R8A78000) SoC and the
    Ironhide development board,
  - Move interrupt-parent properties to root nodes,
  - Add system watchdog timer support for R-Car Gen3 and Gen4 SoCs,
    which is reserved for secure firmware on R-Car Gen3 boards,
  - Add ADC support for the RZ/T2H and RZ/N2H SoCs and their evaluation
    boards,
  - Add watchdog timer support on the R-Car V3M Starter Kit board,
  - Add Cortex-A55 PMU support on the RZ/V2H, RZ/V2N, RZ/T2H, and RZ/N2H
    SoCs,
  - Add Imagination Technologies PowerVR Series 6XT GX6250 GPU support
    on the R-Car M3-W and M3-W+ SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Claudiu Beznea (1):
      arm64: dts: renesas: r9a08g045: Add TSU node

Cosmin Tanislav (3):
      arm64: dts: renesas: r9a09g077: Add ADCs support
      arm64: dts: renesas: r9a09g087: Add ADCs support
      arm64: dts: renesas: rzt2h/rzn2h-evk: Enable ADCs

Geert Uytterhoeven (14):
      ARM: dts: renesas: r7s72100: Move interrupt-parent to root node
      ARM: dts: renesas: r7s9210: Remove duplicate interrupt-parent
      ARM: dts: renesas: r8a7742: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7743: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7744: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7745: Move interrupt-parent to root node
      ARM: dts: renesas: r8a77470: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7790: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7791: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7792: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7793: Move interrupt-parent to root node
      ARM: dts: renesas: r8a7794: Move interrupt-parent to root node
      ARM: dts: renesas: r9a06g032: Move interrupt-parent to root node
      arm64: dts: renesas: v3msk: Enable watchdog timer

Hai Pham (2):
      arm64: dts: renesas: Add R8A78000 SoC support
      arm64: dts: renesas: r8a78000: Add initial Ironhide board support

John Madieu (1):
      arm64: dts: renesas: r9a09g047: Add TSU node

Kuninori Morimoto (26):
      arm64: dts: renesas: r8a774a1: Move interrupt-parent to root node
      arm64: dts: renesas: r8a774b1: Move interrupt-parent to root node
      arm64: dts: renesas: r8a774c0: Move interrupt-parent to root node
      arm64: dts: renesas: r8a774e1: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77951: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77960: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77961: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77965: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77970: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77980: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77990: Move interrupt-parent to root node
      arm64: dts: renesas: r8a77995: Move interrupt-parent to root node
      arm64: dts: renesas: r8a779a0: Move interrupt-parent to root node
      arm64: dts: renesas: r8a779f0: Move interrupt-parent to root node
      arm64: dts: renesas: r8a779g0: Move interrupt-parent to root node
      arm64: dts: renesas: r8a779h0: Move interrupt-parent to root node
      arm64: dts: renesas: r9a07g043u: Move interrupt-parent to root node
      arm64: dts: renesas: r9a07g044: Move interrupt-parent to root node
      arm64: dts: renesas: r9a07g054: Move interrupt-parent to root node
      arm64: dts: renesas: r9a08g045: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g011: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g047: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g056: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g057: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g077: Move interrupt-parent to root node
      arm64: dts: renesas: r9a09g087: Move interrupt-parent to root node

Lad Prabhakar (4):
      arm64: dts: renesas: r9a09g057: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a09g056: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a09g077: Add Cortex-A55 PMU node
      arm64: dts: renesas: r9a09g087: Add Cortex-A55 PMU node

Laurent Pinchart (2):
      arm64: dts: renesas: aistarvision-mipi-adapter-2.1: Drop clock-frequency from camera sensor node
      arm64: dts: renesas: rzg2l-smarc: Drop clock-frequency from camera sensor node

Marek Vasut (5):
      arm64: dts: renesas: sparrow-hawk: Add overlay for RPi Display 2
      arm64: dts: renesas: sparrow-hawk: Add overlay for Argon40 fan HAT
      arm64: dts: renesas: r8a77960: Add GX6250 GPU node
      arm64: dts: renesas: r8a77961: Add GX6250 GPU node
      arm64: dts: renesas: sparrow-hawk: Fix full-size DP connector node name and labels

Niklas Söderlund (1):
      ARM: dts: renesas: koelsch: Update ADV7180 binding

Wolfram Sang (21):
      arm64: dts: renesas: v3[mh]sk: Remove wrong sound property in HDMI encoder node
      arm64: dts: renesas: eagle-function-expansion: Add eMMC support
      arm64: dts: renesas: r8a77951: Add SWDT node
      arm64: dts: renesas: r8a77960: Add SWDT node
      arm64: dts: renesas: r8a77961: Add SWDT node
      arm64: dts: renesas: r8a77965: Add SWDT node
      arm64: dts: renesas: r8a77970: Add SWDT node
      arm64: dts: renesas: r8a77990: Add SWDT node
      arm64: dts: renesas: r8a77995: Add SWDT node
      arm64: dts: renesas: salvator-common: Mark SWDT as reserved
      arm64: dts: renesas: ulcb: Mark SWDT as reserved
      arm64: dts: renesas: draak: Mark SWDT as reserved
      arm64: dts: renesas: ebisu: Mark SWDT as reserved
      arm64: dts: renesas: eagle/v3msk: Mark SWDT as reserved
      ARM: dts: renesas: gose: Remove superfluous port property
      arm64: dts: renesas: r8a779a0: Add SWDT node
      arm64: dts: renesas: r8a779f0: Add SWDT node
      arm64: dts: renesas: r8a779g0: Add SWDT node
      arm64: dts: renesas: r8a779h0: Add SWDT node
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Drop invalid #cells properties
      ARM: dts: renesas: kzm9g: Name interrupts for accelerometer

 arch/arm/boot/dts/renesas/r7s72100.dtsi            |   4 +-
 arch/arm/boot/dts/renesas/r7s9210.dtsi             |   1 -
 arch/arm/boot/dts/renesas/r8a7742.dtsi             |  26 +-
 arch/arm/boot/dts/renesas/r8a7743.dtsi             |  14 +-
 arch/arm/boot/dts/renesas/r8a7744.dtsi             |  14 +-
 arch/arm/boot/dts/renesas/r8a7745.dtsi             |  14 +-
 arch/arm/boot/dts/renesas/r8a77470.dtsi            |  14 +-
 arch/arm/boot/dts/renesas/r8a7790.dtsi             |  26 +-
 arch/arm/boot/dts/renesas/r8a7791-koelsch.dts      |  34 +-
 arch/arm/boot/dts/renesas/r8a7791.dtsi             |  14 +-
 arch/arm/boot/dts/renesas/r8a7792.dtsi             |  14 +-
 arch/arm/boot/dts/renesas/r8a7793-gose.dts         |   1 -
 arch/arm/boot/dts/renesas/r8a7793.dtsi             |  14 +-
 arch/arm/boot/dts/renesas/r8a7794.dtsi             |  14 +-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts |   2 -
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   3 +-
 arch/arm/boot/dts/renesas/sh73a0-kzm9g.dts         |   1 +
 arch/arm64/boot/dts/renesas/Makefile               |  11 +
 .../dts/renesas/aistarvision-mipi-adapter-2.1.dtsi |   1 -
 arch/arm64/boot/dts/renesas/draak.dtsi             |   5 +
 arch/arm64/boot/dts/renesas/ebisu.dtsi             |   5 +
 arch/arm64/boot/dts/renesas/r8a774a1.dtsi          |  22 +-
 arch/arm64/boot/dts/renesas/r8a774b1.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a774c0.dtsi          |  14 +-
 arch/arm64/boot/dts/renesas/r8a774e1.dtsi          |  26 +-
 arch/arm64/boot/dts/renesas/r8a77951.dtsi          |  36 +-
 arch/arm64/boot/dts/renesas/r8a77960.dtsi          |  49 +-
 arch/arm64/boot/dts/renesas/r8a77961.dtsi          |  49 +-
 arch/arm64/boot/dts/renesas/r8a77965.dtsi          |  24 +-
 .../renesas/r8a77970-eagle-function-expansion.dtso |  17 +
 arch/arm64/boot/dts/renesas/r8a77970-eagle.dts     |   5 +
 arch/arm64/boot/dts/renesas/r8a77970-v3msk.dts     |  11 +-
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  24 +-
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   1 -
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  22 +-
 arch/arm64/boot/dts/renesas/r8a77990.dtsi          |  24 +-
 arch/arm64/boot/dts/renesas/r8a77995.dtsi          |  22 +-
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  24 +-
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          |  24 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  24 +-
 .../renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso |  51 ++
 .../r8a779g3-sparrow-hawk-rpi-display-2-5in.dtso   |  13 +
 .../r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso   |  13 +
 .../r8a779g3-sparrow-hawk-rpi-display-2.dtsi       |  90 +++
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     |   6 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  24 +-
 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts  |  85 +++
 arch/arm64/boot/dts/renesas/r8a78000.dtsi          | 787 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a07g043u.dtsi        |  16 +-
 arch/arm64/boot/dts/renesas/r9a07g044.dtsi         |  14 +-
 arch/arm64/boot/dts/renesas/r9a07g054.dtsi         |  14 +-
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  61 +-
 arch/arm64/boot/dts/renesas/r9a09g011.dtsi         |  10 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  60 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  17 +-
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  17 +-
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         |  83 ++-
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |  28 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         |  83 ++-
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |  64 ++
 .../boot/dts/renesas/rz-smarc-cru-csi-ov5645.dtsi  |   1 -
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   4 -
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     |  79 +++
 arch/arm64/boot/dts/renesas/salvator-common.dtsi   |   5 +
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   5 +
 65 files changed, 1982 insertions(+), 312 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-argon40.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-5in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2-7in.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-rpi-display-2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000-ironhide.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a78000.dtsi

