Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB61BD12D5C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 11 Nov 2024 01:32:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=V1MTq67LnU5y3g+pHY3F1JlRKkXc2lSU4ltQQvvdEiQ=; b=0/rxilmZHCwRb/V73C5i6krN3i
	hD42JelRfNPhLulh3nQHkrxLPbP/3UdR65a9LbscT5jGdWOrybB+CwNu0EK9dtbCAcIyOhTQOFXoQ
	+rZyqkpkFgP0a9J4LujHyB2JG1n9OLuuJOwG079hYkD2awVaDzEcBBdn53d+4NA8vo+A6IwLkdac5
	InTFa9xhUNXj3nH8zPFPa898wQmwrRcmsnVYPPXlXBp9Men5xrk0u40YJB60VPs85VnrzOQjICSeS
	8aCDECGuUrUXFbzv/vfMwT1iHiNMiSE+x2dwpLsnt3Z+nvQ9f3RmKbsoxGSBGqTYiqGw8WSqHHrwV
	BFoFqpAA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJIG-0000000G2I5-3S1U;
	Mon, 11 Nov 2024 01:32:40 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAJGQ-0000000G1oK-43M3;
	Mon, 11 Nov 2024 01:30:50 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 0E61113D5;
	Sun, 10 Nov 2024 17:31:16 -0800 (PST)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id DFB6E3F66E;
	Sun, 10 Nov 2024 17:30:42 -0800 (PST)
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
	Gregory CLEMENT <gregory.clement@bootlin.com>,
	Andi Shyti <andi.shyti@kernel.org>,
	linux-i2c@vger.kernel.org,
	Thomas Gleixner <tglx@linutronix.de>,
	Vinod Koul <vkoul@kernel.org>,
	Kishon Vijay Abraham I <kishon@kernel.org>,
	linux-phy@lists.infradead.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	linux-usb@vger.kernel.org,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-rtc@vger.kernel.org
Subject: [PATCH 00/14] arm64: dts: allwinner: Add basic Allwinner A523 support
Date: Mon, 11 Nov 2024 01:30:19 +0000
Message-ID: <20241111013033.22793-1-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.2
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241110_173047_119167_30FE8C27 
X-CRM114-Status: GOOD (  23.21  )
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

this series adds basic DT support for the Allwinner A523 SoC, plus the
Avaota-A1 router board using the T527 package variant of that SoC.[1]
Functionality-wise it relies on the pinctrl[2] and clock[3] support
series, though there is no direct code dependency series to this series
(apart from the respective binding patches in the two series').

Most of the patches add DT binding documentation for the most basic
peripherals, the vast majority of them actually being already supported,
courtesy of identical IP being used. This includes MMC and USB 2.0, so
with the above mentioned clock and pinctrl support this gives an already
somewhat usable mainline support for this new SoC family.
The watchdog is not completely compatible, but is an easy addition, so
this bit is included in here as well.

The A523 features 8 Arm Cortex-A55 cores, organised in two clusters,
clocked separately, with different OPP limits, in some kind of
little/LITTLE configuration. The GPU is a Arm Mali G57 MC01, and the chip
also features a single PCIe 2.1 lane, sharing a PHY with some USB 3.1
controller - which means only one of the two can be used.
The rest of the SoC is the usual soup of multimedia SoC IP, with eDP
support and two Gigabit Ethernet MACs among the highlights.

The main feature is patch 11/14, which adds the SoC .dtsi. This for now
is limited to the parts that are supported and could be tested. At the
moment there is no PSCI firmware, even the TF-A port from the BSP does
not seem to work for me. That's why the secondary cores have been omitted
for now, among other instances of some IP that I couldn't test yet.
I plan to add them in one of the next revisions.

The last patch adds basic support for the Avaota-A1 router board,
designed by YuzukiHD, with some boards now built by Pine64.

The mainline firmware side in general is somewhat lacking still: I have
basic U-Boot support working (including MMC and USB), although still
without DRAM support. This is for now covered by some binary blob found
in the (otherwise Open Source) Syterkit firmware, which also provides
the BSP versions of TF-A and the required (RISC-V) management core
firmware. Fortunately we have indications that DRAM support is not that
tricky, as the IP blocks are very similar to already supported, and dev
boards are on their way to the right people.

Meanwhile I would like people to have a look at those DT bits here. Please
compare them to the available user manual, and test them if you have access
to hardware.

Based on v6.12-rc1.
I pushed a branch with all the three series combined here:
https://github.com/apritzel/linux/commits/a523-v1/

Cheers,
Andre

[1] https://linux-sunxi.org/A523#Family_of_sun55iw3
[2] https://lore.kernel.org/linux-sunxi/20241111005750.13071-1-andre.przywara@arm.com/T/#t
[3] https://lore.kernel.org/linux-sunxi/20241111004722.10130-1-andre.przywara@arm.com/T/#t

Andre Przywara (14):
  dt-bindings: mmc: sunxi: Simplify compatible string listing
  dt-bindings: mmc: sunxi: add compatible strings for Allwinner A523
  dt-bindings: watchdog: sunxi: add Allwinner A523 compatible string
  watchdog: sunxi_wdt: Add support for Allwinner A523
  dt-bindings: i2c: mv64xxx: Add Allwinner A523 compatible string
  dt-bindings: irq: sun7i-nmi: document the Allwinner A523 NMI
    controller
  dt-bindings: phy: document Allwinner A523 USB-2.0 PHY
  dt-bindings: usb: sunxi-musb: add Allwinner A523 compatible string
  dt-bindings: usb: add A523 compatible string for EHCI and OCHI
  dt-bindings: rtc: sun6i: Add Allwinner A523 support
  arm64: dts: allwinner: Add Allwinner A523 .dtsi file
  dt-bindings: vendor-prefixes: Add YuzukiHD name
  dt-bindings: arm: sunxi: Add Avaota A1 board
  arm64: dts: allwinner: a523: add Avaota-A1 router support

 .../devicetree/bindings/arm/sunxi.yaml        |   5 +
 .../bindings/i2c/marvell,mv64xxx-i2c.yaml     |   1 +
 .../allwinner,sun7i-a20-sc-nmi.yaml           |   1 +
 .../bindings/mmc/allwinner,sun4i-a10-mmc.yaml |  40 +-
 .../phy/allwinner,sun50i-a64-usb-phy.yaml     |  10 +-
 .../bindings/rtc/allwinner,sun6i-a31-rtc.yaml |   4 +-
 .../usb/allwinner,sun4i-a10-musb.yaml         |   1 +
 .../devicetree/bindings/usb/generic-ehci.yaml |   1 +
 .../devicetree/bindings/usb/generic-ohci.yaml |   1 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 .../watchdog/allwinner,sun4i-a10-wdt.yaml     |   2 +
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../arm64/boot/dts/allwinner/sun55i-a523.dtsi | 386 ++++++++++++++++++
 .../dts/allwinner/sun55i-t527-avaota-a1.dts   | 311 ++++++++++++++
 drivers/watchdog/sunxi_wdt.c                  |  11 +
 15 files changed, 751 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-a523.dtsi
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-avaota-a1.dts

-- 
2.46.2


