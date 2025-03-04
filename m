Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4FB6EC021B8
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Mar 2025 23:44:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2IOIxxPFP4GDDTx7VcfaGmRQ3L/x2sl/idlvIEr9qMo=; b=rf8bSIja0bpslpYk571XpOmzyB
	UGVYjp99y0MAiRm1B9IZvDdKZOGirqwiKTtmIvlNTTQ3RJHh+XKh5d6A0B0VFTbQwu4YQ9EvtS06n
	IDMSZXgPRAgzWPgqnnQ87r5XImhNqqdo4xcdSWUKcB3g1iICdk3NTcqNf3V5B48aMY6v7e6U3VZPB
	RB5d2lM55uOAsYJgpyJ1XaR+UIGXxq3DlY+2pOrG82G0H5F6ne+sYEvaFtS9b0B2xMobb+ATK2gi/
	1eT2fMN8XpwUfC+7QkFxbEb4183Z6QpKyZXjRhY4pZ4TFfmOip8JPUxEb8yoFfcePhbeOpZhnPip3
	Ypdq6bJQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpbwO-00000006YMF-3Ttg;
	Tue, 04 Mar 2025 23:44:48 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tpahq-00000006P7R-0J28;
	Tue, 04 Mar 2025 22:25:43 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A4AEB2F;
	Tue,  4 Mar 2025 14:25:52 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 6FEDF3F5A1;
	Tue,  4 Mar 2025 14:25:36 -0800 (PST)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org,
	Ulf Hansson <ulf.hansson@linaro.org>,
	linux-mmc@vger.kernel.org,
	Wim Van Sebroeck <wim@linux-watchdog.org>,
	Guenter Roeck <linux@roeck-us.net>,
	linux-watchdog@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org
Subject: [PATCH v2 00/15] arm64: dts: allwinner: Add basic Allwinner A523 support
Date: Tue,  4 Mar 2025 22:22:54 +0000
Message-ID: <20250304222309.29385-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250304_142542_200374_F4AFAA6A 
X-CRM114-Status: GOOD (  23.68  )
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

Hi,

this in an update to the series introducing the basic DT support for the
Allwinner A523 SoC. It now comes with DTs for three boards, using
slightly different packages of that SoC.[1]
Functionality-wise it relies on the pinctrl[2] and clock[3] support
series, though there are no direct code dependency series between the
series. Three binding patches from there are required to pass dtbs_check,
git put their patch IDs in the footer below.
Compared to v1 this drops the patches that have already been merged
(I2C, USB, RTC), changes the proposed NMI controller binding, extends 
the SoC .dtsi to include more device instances, also the secondary cores,
and adds DTs for two new boards. On top of this I added v2 of the DT patch
for an H616 board, since it shares the newly introduced YuzukiHD vendor
name patch. Also it adds the tags from the diligent reviewers, many thanks
for that! More detailed changelog below.

The first patches add DT binding documentation for the most basic
peripherals, most of them actually being already supported, courtesy of
identical IP being used. This includes MMC and USB 2.0, so with the above
mentioned clock and pinctrl support this gives an already somewhat usable
mainline support for this new SoC family.
The watchdog is not completely compatible, but is an easy addition, so
this bit is included in here as well, the same is true for the NMI
controller, required for delivering PMIC interrupts.

The A523 features 8 Arm Cortex-A55 cores, organised in two clusters,
clocked separately, with different OPP limits, in some kind of
little/LITTLE configuration. The GPU is a Arm Mali G57 MC01, and the chip
also features a single PCIe 2.1 lane, sharing a PHY with some USB 3.1
controller - which means only one of the two can be used.
The rest of the SoC is the usual soup of multimedia SoC IP, with eDP
support and two Gigabit Ethernet MACs among the highlights.

The main feature is patch 08/15, which adds the SoC .dtsi. This for now
is limited to the parts that are supported and could be tested. Compared
to v1 we now have some basic TF-A support, so the PSCI nodes are in now.

The final patches add basic support for the Avaota-A1 router board, the
X96QPro+ TV box, and the Radxa A5E development board.

The mainline firmware side in general is coming together now: we have
basic U-Boot support working (including MMC and USB), most importantly
with proper DRAM support, so no more binary blobs, and some basic TF-A
support.

Please have a look at those DT bits here, ideally compare them to the
available user manual, and test them if you have access to hardware.

Based on v6.14-rc1.
I pushed a branch with all the three series combined here:
https://github.com/apritzel/linux/commits/a523-v2/

Cheers,
Andre

Changelog v1 .. v2:
- drop USB, I2C, RTC binding patches: already merged
- add tags from reviewers (with thanks!)
- drop unrelated deprecation comment from MMC binding patch
- drop fallback compatible for NMI controller, stands on its own now
- adjust PHY binding to merged A100 binding (dropping tag)
- .dtsi: add secondary cores
- .dtsi: enable PSCI
- .dtsi: move 32K oscillator to board .dts files
- .dtsi: adjust CCU source clocks
- .dtsi: add MMC1 node (typcially for SDIO WiFi)
- .dtsi: add remaining UARTs
- .dtsi: add remaing I2C devices
- add two new board .dts files
- add DT bindings for those two new board names
- avaota.dts: drop reserved memory from (TF-A now in SRAM)
- avaota.dts: drop SD card dummy supply node
- avaota.dts: add eMMC node (shipped on most boards)
- avaota.dts: fix OTG mode, explain situation
- add Chameleon .dts file (depends on YuzukiHD vendor name patch)

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3
[2] https://lore.kernel.org/linux-sunxi/20250227231447.20161-1-andre.przywara@arm.com/T/#u
[3] https://lore.kernel.org/linux-sunxi/20250304012805.28594-1-andre.przywara@arm.com/T/#u

Andre Przywara (15):
  dt-bindings: mmc: sunxi: Simplify compatible string listing
  dt-bindings: mmc: sunxi: add compatible strings for Allwinner A523
  dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
  watchdog: sunxi_wdt: Add support for Allwinner A523
  dt-bindings: irq: sun7i-nmi: document the Allwinner A523 NMI
    controller
  irqchip/sunxi-nmi: Support Allwinner A523 NMI controller
  dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
  arm64: dts: allwinner: Add Allwinner A523 .dtsi file
  dt-bindings: vendor-prefixes: Add YuzukiHD name
  dt-bindings: arm: sunxi: Add new board names for A523 generation
  arm64: dts: allwinner: a523: add Avaota-A1 router support
  arm64: dts: allwinner: a523: add X96Q-Pro+ support
  arm64: dts: allwinner: a523: add Radxa A5E support
  dt-bindings: arm: sunxi: Add YuzukiHD Chameleon board name
  arm64: dts: allwinner: h616: add YuzukiHD Chameleon support

 .../devicetree/bindings/arm/sunxi.yaml        |  20 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  38 +-
 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |   4 +-
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   4 +
 .../sun50i-h618-yuzukihd-chameleon.dts        | 222 +++++++
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 598 ++++++++++++++++++
 .../dts/allwinner/sun55i-a527-radxa-a5e.dts   | 299 +++++++++
 .../dts/allwinner/sun55i-h728-x96qpro+.dts    | 287 +++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 308 +++++++++
 drivers/irqchip/irq-sunxi-nmi.c               |  50 +-
 drivers/watchdog/sunxi_wdt.c                  |  11 +
 14 files changed, 1807 insertions(+), 39 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-h618-yuzukihd-chameleon.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a527-radxa-a5e.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-h728-x96qpro+.dts
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts


base-commit: 2014c95afecee3e76ca4a56956a936e23283f05b
prerequisite-patch-id: 5b8a883819d2f3dfc975735a855291cb8b02dd39
prerequisite-patch-id: ff4d42c2dcb0c3b4be45a4b0b8e22027207979ee
prerequisite-patch-id: 4596fa402b501a9406821a9535f8329d30bf1ca4
-- 
2.46.3


