Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53057CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 12 Sep 2025 11:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3MokQ8/fORGSbLvoCF2Aakgd78JgR85GiTPVQoZsWOg=; b=j9xuuIUzmM0yW2MvZmi3fNPX69
	UgVvvGbk43daxZdGhoFBzaNR5Ro/mM8VtUlWES4RJIlN0yjYefIxq5obL838J0YOzpF4e+jLHjWOC
	SuMLXPcotObsPaLFl6l1wrbSN+Mqlq/xQ7PMz3GL702IhZW+8hDOeJod2r7GksoKvibRdTdvCCx4U
	ZhFhVcm05at2lbFMGgMLlEvvtmihsC+ukWHD7+qrW6SAWp+qkmVPnh4eBMssZfoOxcLUqBgB+NW1q
	xAU+PxfkOTvkVvtYEudrKs6I/8n5S2sewfhDhMWJftGmNvnRHtkPD0JAEnoi8I54N0pat1a2WyVUn
	MJiATnjw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jL-00000008oT8-1ISP;
	Fri, 12 Sep 2025 11:14:15 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ux1jF-00000008oNT-1iuK
	for linux-arm-kernel@lists.infradead.org;
	Fri, 12 Sep 2025 11:14:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id AEA4D40C14;
	Fri, 12 Sep 2025 11:14:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 5570FC4CEF7;
	Fri, 12 Sep 2025 11:14:05 +0000 (UTC)
From: Geert Uytterhoeven <geert+renesas@glider.be>
To: soc@lists.linux.dev,
	soc <soc@kernel.org>
Cc: Magnus Damm <magnus.damm@gmail.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-renesas-soc@vger.kernel.org,
	Geert Uytterhoeven <geert+renesas@glider.be>
Subject: [GIT PULL 3/3] Renesas DTS updates for v6.18 (take two)
Date: Fri, 12 Sep 2025 13:13:53 +0200
Message-ID: <cover.1757669917.git.geert+renesas@glider.be>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <cover.1757669912.git.geert+renesas@glider.be>
References: <cover.1757669912.git.geert+renesas@glider.be>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250912_041409_489589_2C23DDB9 
X-CRM114-Status: GOOD (  11.83  )
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

The following changes since commit 115b557b6f61ca279a4754b20b8686039fdb5234:

  arm64: dts: renesas: Minor whitespace cleanup (2025-08-20 09:07:05 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/geert/renesas-devel.git tags/renesas-dts-for-v6.18-tag2

for you to fetch changes up to 5bf682d9747277a0190e82e5ae6f9e201ce002d9:

  arm64: dts: renesas: sparrow-hawk-fan-pwm: Rework hwmon comment (2025-09-12 11:15:00 +0200)

----------------------------------------------------------------
Renesas DTS updates for v6.18 (take two)

  - Add pin control and I2C support for the RZ/N2H SoC and its
    evaluation board,
  - Add LED, EEPROM, eMMC, SD card, watchdog, and USB2.0 support for the
    RZ/T2H and RZ/N2H SoCs and their evaluation boards,
  - Add I3C support for the RZ/V2H and RZ/V2N SoCs,
  - Add IMX219 and IMX462 camera overlay support for the Sparrow Hawk
    board,
  - Miscellaneous fixes and improvements.

----------------------------------------------------------------
Biju Das (2):
      arm64: dts: renesas: r9a09g047e57-smarc: Fix gpio key's pin control node
      arm64: dts: renesas: r9a09g047e57-smarc: Use Schmitt input for NMI function

John Madieu (1):
      arm64: dts: renesas: r9a09g047: Enable Tx coe support

Lad Prabhakar (17):
      arm64: dts: renesas: r9a09g087: Add pinctrl node
      arm64: dts: renesas: r9a09g077m44-rzt2h-evk: Add user LEDs
      arm64: dts: renesas: r9a09g087m44-rzn2h-evk: Add user LEDs
      arm64: dts: renesas: rzt2h-n2h-evk-common: Add pinctrl for SCI0 node
      arm64: dts: renesas: r9a09g087m44-rzt2h-evk: Enable I2C0 and I2C1 support
      arm64: dts: renesas: rzt2h-n2h-evk-common: Enable EEPROM on I2C0
      arm64: dts: renesas: rzt2h-rzn2h-evk: Enable eMMC
      arm64: dts: renesas: rzt2h-rzn2h-evk: Enable MicroSD card slot
      arm64: dts: renesas: rzt2h-rzn2h-evk: Enable SD card slot
      arm64: dts: renesas: r9a09g077: Add WDT nodes
      arm64: dts: renesas: r9a09g087: Add WDT nodes
      arm64: dts: renesas: rzt2h-n2h-evk-common: Enable WDT2
      arm64: dts: renesas: r9a09g077: Add USB2.0 support
      arm64: dts: renesas: r9a09g087: Add USB2.0 support
      arm64: dts: renesas: rzt2h-n2h-evk: Enable USB2.0 support
      arm64: dts: renesas: r9a09g057: Add I3C node
      arm64: dts: renesas: r9a09g056: Add I3C node

Marek Vasut (2):
      arm64: dts: renesas: rcar: Rename dsi-encoder to dsi
      arm64: dts: renesas: sparrow-hawk-fan-pwm: Rework hwmon comment

Niklas Söderlund (4):
      arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J1
      arm64: dts: renesas: sparrow-hawk: Add overlay for IMX219 on J2
      arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J1
      arm64: dts: renesas: sparrow-hawk: Add overlay for IMX462 on J2

 arch/arm64/boot/dts/renesas/Makefile               |  12 ++
 arch/arm64/boot/dts/renesas/r8a779a0.dtsi          |   4 +-
 arch/arm64/boot/dts/renesas/r8a779g0.dtsi          |   4 +-
 .../r8a779g3-sparrow-hawk-camera-j1-imx219.dtso    | 116 +++++++++++
 .../r8a779g3-sparrow-hawk-camera-j1-imx462.dtso    | 117 +++++++++++
 .../r8a779g3-sparrow-hawk-camera-j2-imx219.dtso    | 116 +++++++++++
 .../r8a779g3-sparrow-hawk-camera-j2-imx462.dtso    | 117 +++++++++++
 .../dts/renesas/r8a779g3-sparrow-hawk-fan-pwm.dtso |  15 +-
 arch/arm64/boot/dts/renesas/r8a779h0.dtsi          |   2 +-
 arch/arm64/boot/dts/renesas/r9a09g047.dtsi         |  10 +-
 arch/arm64/boot/dts/renesas/r9a09g047e57-smarc.dts |   7 +-
 arch/arm64/boot/dts/renesas/r9a09g056.dtsi         |  33 ++++
 arch/arm64/boot/dts/renesas/r9a09g057.dtsi         |  33 ++++
 arch/arm64/boot/dts/renesas/r9a09g077.dtsi         | 107 ++++++++++
 .../boot/dts/renesas/r9a09g077m44-rzt2h-evk.dts    | 136 ++++++++++++-
 arch/arm64/boot/dts/renesas/r9a09g087.dtsi         | 120 +++++++++++
 .../boot/dts/renesas/r9a09g087m44-rzn2h-evk.dts    | 213 ++++++++++++++++++++
 .../boot/dts/renesas/rzt2h-n2h-evk-common.dtsi     | 220 +++++++++++++++++++++
 18 files changed, 1356 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j1-imx462.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx219.dtso
 create mode 100644 arch/arm64/boot/dts/renesas/r8a779g3-sparrow-hawk-camera-j2-imx462.dtso

