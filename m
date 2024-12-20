Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 32EC9E7718A
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 20 Dec 2024 11:12:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=fHLTTWClHijSsdQJrJqbFnjxnYSY544s9n/aeS4DxTM=; b=fS/73VIlJGf5Yy8kE6nQQosw+c
	CXf2+fVifAw8rN72XTLOtITXJ1eG+QcNQ2Hy1KxeYyBXSookFW6r37ro8mnMCyX5ju4ykW1B0mB6l
	Axl4AAoLydTDpDqUTwAfj+jLSEoPsa3YvceKS6jJM2VOM3CMiAZdUqwWLBDDWGYKjckYFFmWV0S9B
	Q4vk1whW+F9aAiXASsT6ifxh8h9pcRpd+fJoiZh74gQr2u36AgxZitmkPrEstjHjv3oznnyPBQ7bv
	lJzgxRPAbeU8n+jYPpd/OavEymmxu/N72n1nh40cSfIrgoY1Qf0hywKw33V4qQhFHcCY8xR7a3BsR
	aveW40uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tOavh-00000004gCd-2Cfi;
	Fri, 20 Dec 2024 11:12:25 +0000
Received: from laurent.telenet-ops.be ([2a02:1800:110:4::f00:19])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tOaHc-00000004bJk-0JWK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 20 Dec 2024 10:31:02 +0000
Received: from ramsan.of.borg ([IPv6:2a02:1810:ac12:ed80:7a4e:e361:29f2:181c])
	by laurent.telenet-ops.be with cmsmtp
	id qyWq2D00G5V3mYk01yWq5g; Fri, 20 Dec 2024 11:30:52 +0100
Received: from rox.of.borg ([192.168.97.57])
	by ramsan.of.borg with esmtp (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaHN-001s3g-Ax;
	Fri, 20 Dec 2024 11:30:50 +0100
Received: from geert by rox.of.borg with local (Exim 4.95)
	(envelope-from <geert@linux-m68k.org>)
	id 1tOaFY-000gNL-H9;
	Fri, 20 Dec 2024 11:28:52 +0100
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.14
Date: Fri, 20 Dec 2024 11:28:47 +0100
Message-Id: <cover.1734689803.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <cover.1734689797.git.geert+renesas@glider.be>
References: <cover.1734689797.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241220_023100_274164_9C4FEF36 
X-CRM114-Status: GOOD (  13.46  )
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

The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.14-tag1

for you to fetch changes up to acb247afab5bc2b4462f4dfc17a9d930e1153e52:

  arm64: dts: renesas: r9a09g047: Add I2C nodes (2024-12-17 09:42:52 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.14

  - Add more serial (SCIF), power monitor, ADC, and sound support for
    the RZ/G3S SoC and the RZ/G3S SMARC SoM and development board,
  - Add support for the R-Car V4H ES3.0 (R8A779G3) SoC on the White Hawk
    Single development board,
  - Add display support for the R-Car V4M SoC and the Gray Hawk Single
    development board,
  - Add video capture support for the Gray Hawk Single development
    board,
  - Add initial support for the RZ/G3E (R9A09G047) SoC and the RZ/G3E
    SMARC SoM and Carrier-II EVK development board,
  - Add support for 5-port MATEnet on the Falcon Ethernet sub-board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (8):
      dt-bindings: soc: renesas: Document Renesas RZ/G3E SoC variants
      dt-bindings: soc: renesas: Document RZ/G3E SMARC SoM and Carrier-II EVK
      dt-bindings: clock: renesas: Document RZ/G3E SoC CPG
      arm64: dts: renesas: Add initial DTSI for RZ/G3E SoC
      arm64: dts: renesas: r9a09g047: Add OPP table
      arm64: dts: renesas: Add initial support for RZ/G3E SMARC SoM
      arm64: dts: renesas: Add initial device tree for RZ/G3E SMARC EVK board
      arm64: dts: renesas: r9a09g047: Add I2C nodes

Claudiu Beznea (9):
      arm64: dts: renesas: r9a08g045: Add the remaining SCIF interfaces
      arm64: dts: renesas: rzg3s-smarc: Fix the debug serial alias
      arm64: dts: renesas: r9a08g045: Add ADC node
      arm64: dts: renesas: rzg3s-smarc-som: Enable ADC
      arm64: dts: renesas: r9a08g045: Add SSI nodes
      arm64: dts: renesas: rzg3s-smarc-som: Add versa3 clock generator node
      arm64: dts: renesas: Add da7212 audio codec node
      arm64: dts: renesas: rzg3s-smarc: Enable SSI3
      arm64: dts: renesas: rzg3s-smarc: Add sound card

Geert Uytterhoeven (9):
      dt-bindings: soc: renesas: Move R8A779G0 White Hawk up
      dt-bindings: soc: renesas: Document R8A779G3 White Hawk Single
      arm64: dts: renesas: Factor out White Hawk Single board support
      arm64: dts: renesas: Add R8A779G3 SoC support
      arm64: dts: renesas: r8a779g3: Add White Hawk Single support
      arm64: dts: renesas: white-hawk-ard-audio: Drop SoC part
      arm64: dts: renesas: white-hawk-single: Add R-Car Sound support
      ARM: dts: renesas: r7s72100: Add DMA support to RSPI
      Merge tag 'renesas-r9a09g047-dt-binding-defs-tag1' into renesas-dts-for-v6.14

Kuninori Morimoto (1):
      arm64: dts: renesas: ulcb: Add sample Audio Codec settings

Niklas Söderlund (3):
      arm64: dts: renesas: gray-hawk-single: Add video capture support
      arm64: dts: renesas: r8a779a0: Remove address- and size-cells from AVB[1-5]
      arm64: dts: renesas: falcon-ethernet: Describe PHYs connected on the breakout board

Tomi Valkeinen (3):
      arm64: dts: renesas: gray-hawk-single: Fix indentation
      arm64: dts: renesas: r8a779h0: Add display support
      arm64: dts: renesas: gray-hawk-single: Add DisplayPort support

Wolfram Sang (1):
      arm64: dts: renesas: rzg3s-smarc: Enable I2C1 and connected power monitor

 .../bindings/clock/renesas,rzv2h-cpg.yaml          |  15 +-
 .../devicetree/bindings/soc/renesas/renesas.yaml   |  33 +-
 arch/arm/boot/dts/renesas/r7s72100.dtsi            |  10 +
 arch/arm64/boot/dts/renesas/Makefile               |  12 +-
 .../boot/dts/renesas/r8a779a0-falcon-ethernet.dtsi | 242 +++++++++++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |  10 -
 .../dts/renesas/r8a779g2-white-hawk-single.dts     |  62 +---
 .../dts/renesas/r8a779g3-white-hawk-single.dts     |  16 +
 arch/arm64/boot/dts/renesas/r8a779g3.dtsi          |  12 +
 .../boot/dts/renesas/r8a779h0-gray-hawk-single.dts | 298 +++++++++++++++-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |  73 ++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         | 237 +++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 374 +++++++++++++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi      |  18 +
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  18 +
 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi      |  13 +
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  24 ++
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |  28 ++
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |  56 ++-
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |  83 ++++-
 arch/arm64/boot/dts/renesas/ulcb-kf.dtsi           |  18 +-
 arch/arm64/boot/dts/renesas/ulcb.dtsi              |   5 +
 ...a7212.dtso => white-hawk-ard-audio-da7212.dtso} |   6 +-
 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi |  73 ++++
 include/dt-bindings/clock/renesas,r9a09g047-cpg.h  |  21 ++
 25 files changed, 1644 insertions(+), 113 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-white-hawk-single.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e37.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts
 create mode 100644 arch/arm64/boot/dts/renesas/r9a09g047e57.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi
 create mode 100644 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi
 rename arch/arm64/boot/dts/renesas/{r8a779g0-white-hawk-ard-audio-da7212.dtso => white-hawk-ard-audio-da7212.dtso} (96%)
 create mode 100644 arch/arm64/boot/dts/renesas/white-hawk-single.dtsi
 create mode 100644 include/dt-bindings/clock/renesas,r9a09g047-cpg.h

