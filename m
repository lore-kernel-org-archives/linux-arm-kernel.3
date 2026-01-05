Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1E968C79F9D
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 Jan 2026 15:58:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OwpQy5ZMRH4teLaRhVyIxckCnRSAI7vtScw3QS4g04I=; b=WBcMupqdh3MdLfNVEOj4lc+HfE
	G0LOIMgHhAyeJwY+tu7eD942jN8bkimBKvY9R00EWxbqfF9DiwrafRC/+Kh7PiUS7DAkR99bzZpew
	lDexNsyK7dQ4hTzhwOKo0EqbHhOp7fCkp/V2PlHrt34PRhIlHBWTdeSKg8gs+tURdBItlKO/6RTww
	dKbQkyFI/0EajDjN/Fm5opNyc1BOoC/d4KW9/QmvMI/AcPMW4AqQ50RBuZ/u3VTfFcW9MEWHtj2sb
	ReylQJ9v6YfuzqiMOBGlirl7QJZ+xslweMJaXK300EDh8qPWkHMhREUtl9pQQsTwx+9Jf7em0Wz27
	UJjo6/4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmxy-0000000BgVN-38f7;
	Mon, 05 Jan 2026 15:57:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcmxw-0000000BgTM-0wBn
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 Jan 2026 15:57:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 60F7142B7D;
	Mon,  5 Jan 2026 15:57:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id CEC73C19421;
	Mon,  5 Jan 2026 15:57:53 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.20
Date: Mon,  5 Jan 2026 16:57:40 +0100
Message-ID: <cover.1767628169.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1767628163.git.geert+renesas@glider.be>
References: <cover.1767628163.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_075756_301818_1BD86401 
X-CRM114-Status: GOOD (  11.00  )
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

The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.20-tag1

for you to fetch changes up to aca3bbde0fdb263081b5ff1e60f066704dd1a19e:

  arm64: dts: renesas: r8a779h0: Add WWDT nodes (2026-01-05 14:37:18 +0100)

----------------------------------------------------------------
Renesas DTS updates for v6.20

  - Add USB3.2 host and more RSCI serial support for the RZ/G3E SoC and
    the RZ/G3E SMARC EVK board,
  - Add display and USB3.0 host support for the RZ/V2H and RZ/V2N SoCs
    and their EVK boards,
  - Add SPI NOR Flash support for the Yuridenki-Shokai Kakip board,
  - Add PCIe support for the RZ/G3S SoC and the RZ/G3S SMARC EVK board,
  - Add SPI, interrupt controller, and DMAC support for the RZ/T2H,
    RZ/N2H, and RZ/V2N SoCs,
  - Add NMI wakeup button support for the RZ/V2N EVK board,
  - Add thermal support for the RZ/V2N SoC,
  - Add system watchdog timer support for R-Car V3H, which is reserved
    for secure firmware,
  - Add window watchdog timer support for R-Car V3M, V3H, and Gen4 SoCs,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (5):
      arm64: dts: renesas: r9a09g047: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g047e57-smarc: Enable USB3HOST
      arm64: dts: renesas: r9a09g047: Add RSCI nodes
      arm64: dts: renesas: renesas-smarc2: Move aliases to board DTS
      arm64: dts: renesas: r9a09g047e57-smarc: Enable rsci{2,4,9} nodes

Claudiu Beznea (3):
      arm64: dts: renesas: r9a08g045: Add PCIe node
      arm64: dts: renesas: rzg3s-smarc-som: Add PCIe reference clock
      arm64: dts: renesas: rzg3s-smarc: Enable PCIe

Cosmin Tanislav (7):
      arm64: dts: renesas: rzt2h-n2h-evk: Add note about SD1 1.8V modes
      arm64: dts: renesas: r9a09g077: Add SPI nodes
      arm64: dts: renesas: r9a09g087: Add SPI nodes
      arm64: dts: renesas: r9a09g077: Add ICU support
      arm64: dts: renesas: r9a09g087: Add ICU support
      arm64: dts: renesas: r9a09g077: Add DMAC support
      arm64: dts: renesas: r9a09g087: Add DMAC support

Geert Uytterhoeven (2):
      arm64: dts: renesas: r9a09g047e57-smarc: Remove duplicate SW_LCD_EN
      ARM: dts: renesas: r9a06g032: Add Ethernet switch interrupts

Lad Prabhakar (14):
      arm64: dts: renesas: r9a09g057: Add FCPV and VSPD nodes
      arm64: dts: renesas: r9a09g057: Add DU and DSI nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable DU and DSI
      arm64: dts: renesas: r9a09g056: Add FCPV and VSPD nodes
      arm64: dts: renesas: r9a09g056: Add DU and DSI nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable DU and DSI
      arm64: dts: renesas: r9a09g057: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g057h44-rzv2h-evk: Enable USB3.0 PHYs and xHCI controllers
      arm64: dts: renesas: r9a09g056: Add USB3 PHY/Host nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Enable USB3.0 PHY and xHCI controller
      arm64: dts: renesas: r9a09g056: Add ICU node
      arm64: dts: renesas: r9a09g056: Add DMAC nodes
      arm64: dts: renesas: r9a09g056: Add RSPI nodes
      arm64: dts: renesas: r9a09g056n48-rzv2n-evk: Add NMI wakeup button support

Nobuhiro Iwamatsu (1):
      arm64: dts: renesas: r9a09g057h48-kakip: Enable SPI NOR Flash

Ovidiu Panait (1):
      arm64: dts: renesas: r9a09g056: Add TSU nodes

Wolfram Sang (8):
      arm64: dts: renesas: r8a77980: Add SWDT node
      arm64: dts: renesas: condor/v3hsk: Mark SWDT as reserved
      arm64: dts: renesas: r8a77970: Add WWDT nodes
      arm64: dts: renesas: r8a77980: Add WWDT nodes
      arm64: dts: renesas: r8a779a0: Add WWDT nodes
      arm64: dts: renesas: r8a779f0: Add WWDT nodes
      arm64: dts: renesas: r8a779g0: Add WWDT nodes
      arm64: dts: renesas: r8a779h0: Add WWDT nodes

 arch/arm/boot/dts/renesas/r9a06g032.dtsi           |   6 +
 arch/arm64/boot/dts/renesas/condor-common.dtsi     |   5 +
 arch/arm64/boot/dts/renesas/r8a77970.dtsi          |  32 ++
 arch/arm64/boot/dts/renesas/r8a77980-v3hsk.dts     |   5 +
 arch/arm64/boot/dts/renesas/r8a77980.dtsi          |  89 ++++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          | 160 +++++++
 arch/arm64/boot/dts/renesas/r8a779f0.dtsi          | 160 +++++++
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          | 112 +++++
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          | 112 +++++
 arch/arm64/boot/dts/renesas/r9a08g045.dtsi         |  65 +++
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         | 250 ++++++++++
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |  75 ++-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         | 514 +++++++++++++++++++++
 .../boot/dts/renesas/r9a09g056n48-rzv2n-evk.dts    |  97 ++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         | 149 ++++++
 .../boot/dts/renesas/r9a09g057h44-rzv2h-evk.dts    | 101 ++++
 arch/arm64/boot/dts/renesas/r9a09g057h48-kakip.dts |  39 ++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 235 ++++++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    |   3 +
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 235 ++++++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    |   3 +
 arch/arm64/boot/dts/renesas/renesas-smarc2.dtsi    |  21 +-
 arch/arm64/boot/dts/renesas/rzg3e-smarc-som.dtsi   |   4 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc-som.dtsi   |   5 +
 arch/arm64/boot/dts/renesas/rzg3s-smarc.dtsi       |  11 +
 25 files changed, 2481 insertions(+), 7 deletions(-)

