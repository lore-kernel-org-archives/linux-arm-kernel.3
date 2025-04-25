Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4DF22C369C2
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 25 Apr 2025 13:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=F8HOv7AoGYvraFDx3RiExDQ/PVvWgRf938aLhn2oLVA=; b=N051Z6DQDsa1G/QiuodzOmJ0OG
	GSGY0bJX4daMRb5id4gwIjZ6TVUvywOhVf3javkp50Diyoo2m+sUKHGRNodXiFMpVAAnxOubQKocw
	YiEY9fUNldfx12GyVzClW4QFM1wGt7tXzH5e3OQPHv5JCd4PWrZAH2NsqsjnzpGVh5pkLhSGm0SaS
	pDjpqHuPOOAe9iWF6Yk1tC8spezG7w1qfZL45y/rqzhMoNH38AQpD6r8Z5D92/tNLN/vjFxf+GpCJ
	UXcQfLgXY8Juf/Dm0iG/kYvksnWC/dbE7xsWDXb/Q0zzTy2gAayBJx3c6wOtwxYjtbHWLxQiQdA3H
	V1XsGN4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8J7U-0000000HHXk-0j7P;
	Fri, 25 Apr 2025 13:29:32 +0000
Received: from andre.telenet-ops.be ([2a02:1800:120:4::f00:15])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u8IGs-0000000H8ff-1BbW
	for linux-arm-kernel@lists.infradead.org;
	Fri, 25 Apr 2025 12:35:12 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:3329:b4bc:d565:c72])
	by andre.telenet-ops.be with cmsmtp
	id hQb42E00G16PE0201Qb4q4; Fri, 25 Apr 2025 14:35:05 +0200
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGc-00000001gJm-3R8t;
	Fri, 25 Apr 2025 14:35:04 +0200
Received: from geert by rox.of.borg with local (Exim 4.97)
	(envelope-from <geert@linux-m68k.org>)
	id 1u8IGm-0000000CKjB-0KLe;
	Fri, 25 Apr 2025 14:35:04 +0200
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 4/4] Renesas DTS updates for v6.16
Date: Fri, 25 Apr 2025 14:34:59 +0200
Message-ID: <cover.1745582596.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1745582587.git.geert+renesas@glider.be>
References: <cover.1745582587.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250425_053510_485619_EDBDF7D4 
X-CRM114-Status: GOOD (  13.64  )
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.16-tag1

for you to fetch changes up to 9f78a29caacef6df5d6a43e85d1112e39cfa3b34:

  arm64: dts: renesas: r8a779h0: Add ISP core function block (2025-04-24 11:29:11 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.16

  - Add SDHI, ICU, I2C, PMIC, and GPU support on the RZ/G3E SoC and the
    RZ/G3E SoM and SMARC Carrier-II EVK development board,
  - Add internal SDHI regulator support on the RZ/V2H(P) SoC,
  - Add UFS tuning parameters in E-FUSE on the R-Car S4-8 ES1.2 SoC,
  - Add support for Ethernet ports C and D, I2C, keys, and SDHI on the
    RZ/N1D SoC and the RZN1D-DB and RZN1D-EB development and expansion
    boards,
  - Add initial support for the RZ/V2N (R9A09G056) and the RZ/V2N EVK
    board,
  - Add support for the Retronix Sparrow Hawk board, which is based on
    R-Car V4H ES3.0,
  - Add ISP core support on R-Car V3U, V4H, and V4M,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (7):
      arm64: dts: renesas: r9a09g047: Add SDHI0-SDHI2 nodes
      arm64: dts: renesas: r9a09g057: Add support for enabling SDHI internal regulator
      arm64: dts: renesas: rzg3e-smarc-som: Enable SDHI{0,2}
      arm64: dts: renesas: rzg3e-smarc-som: Add support to enable SD on SDHI0
      arm64: dts: renesas: r9a09g047e57-smarc: Enable SDHI1
      arm64: dts: renesas: r9a09g047: Add ICU node
      arm64: dts: renesas: Remove undocumented compatible micron,mt25qu512a

Clément Léger (1):
      ARM: dts: renesas: Add r9a06g032-rzn1d400-eb board device-tree

Geert Uytterhoeven (2):
      arm64: dts: renesas: r8a779f4: Add UFS tuning parameters in E-FUSE
      Merge tag 'renesas-r9a09g056-dt-binding-defs-tag1' into renesas-dts-for-v6.16

John Madieu (2):
      arm64: dts: renesas: rzg3e-smarc-som: Add I2C2 device pincontrol
      arm64: dts: renesas: rzg3e-smarc-som: Add RAA215300 pmic support

Lad Prabhakar (6):
      dt-bindings: soc: renesas: Document Renesas RZ/V2N SoC variants and EVK
      dt-bindings: soc: renesas: Document SYS for RZ/V2N SoC
      dt-bindings: clock: renesas: Document RZ/V2N SoC CPG
      dt-bindings: pinctrl: renesas: Document RZ/V2N SoC
      arm64: dts: renesas: Add initial SoC DTSI for RZ/V2N
      arm64: dts: renesas: Add initial device tree for RZ/V2N EVK

Marek Vasut (1):
      arm64: dts: renesas: r8a779g3: Add Retronix R-Car V4H Sparrow Hawk board support

Niklas Söderlund (3):
      arm64: dts: renesas: r8a779a0: Add ISP core function block
      arm64: dts: renesas: r8a779g0: Add ISP core function block
      arm64: dts: renesas: r8a779h0: Add ISP core function block

Tommaso Merciai (2):
      arm64: dts: renesas: r9a09g047: Add Mali-G52 GPU node
      arm64: dts: renesas: rzg3e-smarc-som: Enable Mali-G52

Wolfram Sang (6):
      ARM: dts: renesas: r9a06g032: Describe I2C controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Describe I2C bus
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: Describe I2C bus
      ARM: dts: renesas: r9a06g032-rzn1d400-db: Describe keys
      ARM: dts: renesas: r9a06g032: Describe SDHCI controllers
      ARM: dts: renesas: r9a06g032-rzn1d400-eb: describe SD card port

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |   5 +-
 .../bindings/pinctrl/renesas,rzg2l-pinctrl.yaml    |   2 +
 .../soc/renesas/renesas,r9a09g057-sys.yaml         |   1 +
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  15 +
 arch/arm/boot/dts/renesas/Makefile                 |   1 +
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-db.dts | 110 +++-
 .../arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts | 160 +++++
 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |  46 ++
 arch/arm64/boot/dts/renesas/Makefile               |   6 +
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  60 +-
 arch/arm64/boot/dts/renesas/r8a779f4.dtsi          |  17 +
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |  30 +-
 .../dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso |  43 ++
 .../boot/dts/renesas/r8a779g3-sparrow-hawk.dts     | 666 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  21 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 199 ++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  49 ++
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         | 282 +++++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    | 114 ++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  21 +
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  18 +
 arch/arm64/boot/dts/renesas/rzg2l-smarc-som.dtsi   |   2 +-
 arch/arm64/boot/dts/renesas/rzg2lc-smarc-som.dtsi  |   2 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   | 207 +++++++
 include/dt-bindings/clock/renesas,r9a09g056-cpg.h  |  24 +
 25 files changed, 2067 insertions(+), 34 deletions(-)
 create mode 100644 arch/arm/boot/dts/renesas/r9a06g032-rzn1d400-eb.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g056-cpg.h

