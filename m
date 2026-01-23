Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC3E8D72371
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 23 Jan 2026 11:17:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=JXOTVj/iLHLq25NI326v1CX8QthD0cSS/D/sxyqn/oM=; b=WUX/UWENncfHnh8QEYkwaKYGU3
	l8pww8w0wIb/B7CreJ1GWTjj/DYrC+IInzH1nq6FOvMDBR3k7wqGtwPlS58gXQGJ4yY8UFi41kQoc
	MwCEjwQWZpDv8Y2zqf9/lHPQp4lWnPbMiOOedSfHvwuApj9wQr59F3AHI8aVO+RxQ5wS4BB9vs6hr
	xOCF4Vpw4lgaQ5xCtO6e/+OhwmdRNiUV14IQKbPKoGZunjdcBZ1QOa0Sjhy0BbGiaaNHOjQ42UdQ7
	wTvE+JRwcp3dFzzBmQofZG9Rp9KFl4kCqNXpXGUip+Wd7ZFSeCEbqLGC+pSnBY2YbcwNfoTXiPbuH
	ghc93ZeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFAU-00000008oyX-0LQL;
	Fri, 23 Jan 2026 11:17:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vjFAR-00000008owJ-1uYS;
	Fri, 23 Jan 2026 11:17:32 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1769167047;
	bh=Hjdy/bPOqa8HgLmDYLapL/0cxNE4GJDeliqFNgLEYVg=;
	h=From:To:Cc:Subject:Date:From;
	b=B4l6lMyjVKSTs6d8zVyyGAIRC2KGqgBMXJOjr2UVYf233qPERzW+iaxMxafFcV3JH
	 Q0UVAvfZYfueJSFgiMRSGhZsjyC2YRF3B+KVAsmOdetCF7q5ZmD6tU/apMPUwaRAGW
	 ngWNfRRssyGn4Mh0IiE6lkEPMLTBWagRK/OQZgAl7YyZi6ajEHgxbl/DL73pWsPFFi
	 mtBqvTYC8u1BTL5lJaQo5Wz+qoaeT/ysgYhrTgw84W9QYZeWUWUyuc++zjj/KOJ/oO
	 qW26YDTgZqFmTdaMq+RorJJgvs6FqDE2A/EMmH9MtYnOpwDw1fgce2hG7RzcRy/Lsy
	 m98yK/7eEvUlQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 2CBE717E0333;
	Fri, 23 Jan 2026 12:17:27 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.20
Date: Fri, 23 Jan 2026 12:17:20 +0100
Message-ID: <20260123111724.28631-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.52.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260123_031731_657893_CAF266C9 
X-CRM114-Status: GOOD (  13.72  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git/ mtk-dts64-for-v6.20

for you to fetch changes up to 25556c12f4d3edc2f614f752f204c3941697b30a:

  arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to audio-controller (2026-01-19 12:25:34 +0100)

----------------------------------------------------------------
MediaTek ARM64 Device Tree updates

This adds support for new boards and variants based on different
already supported MediaTek SoCs, and improves support for current
boards.

In particular:
 - New machines:
   - Ezurio Tungsten 510 (MediaTek Genio 510 SoC)
   - Ezurio Tungsten 700 (MediaTek Genio 700 SoC)

...improvements for already supported SoCs and machines:
 - MT7981b gains support for PCI-Express, USB, Ethernet and for
   the "GED" WiFi HW offload
   - OpenWRT One board gains support for the same
 - MT8188/8195/8390/8395 gains support for the DPI1 interface
   and HDMI output from the SoC's HDMI Tx controller along with
   its HDMI PHY and DDC IPs, usable on a selection of boards
   that expose a HDMI connector, namely:
   - All MT8390 Genio EVK based boards
   - All MT8395 Genio EVK based boards
   - Radxa NIO-12L (MT8395)

...and dtbs_check warning fixes for many of the MTK devicetrees,
including MT6795, MT7981, MT7986, MT7988, MT8173, MT8183, MT8186,
MT8188, MT8192, and a dts coding style fix for Airoha EN7581-EVB.

This also includes a fix for the new devicetree overlay warnings,
adding dtbs with applied overlays for all of the devices having
at least one overlay.

----------------------------------------------------------------
AngeloGioacchino Del Regno (24):
      arm64: dts: mediatek: mt8195: Add DPI1, HDMI, HDMI PHY/DDC nodes
      arm64: dts: mediatek: mt8188: Add DPI1, HDMI, HDMI PHY/DDC nodes
      arm64: dts: mediatek: mt8390-genio-common: Enable HDMI output
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Enable HDMI output
      arm64: dts: mediatek: mt8173: Fix pinctrl node names and cleanup
      arm64: dts: mediatek: mt8183-evb: Fix dtbs_check warnings
      arm64: dts: mediatek: mt7981b-openwrt-one: Remove useless cells from flash@0
      arm64: dts: mediatek: mt8183-jacuzzi-pico6: Fix typo in pinmux node
      arm64: dts: mediatek: mt8183-pumpkin: Fix pinmux node names
      arm64: dts: mediatek: mt8173-elm: Fix bluetooth node name and reorder
      arm64: dts: mediatek: mt8173-elm: Fix dsi0 ports warning
      arm64: dts: mediatek: mt8173-elm: Remove regulators from thermal node
      arm64: dts: mediatek: mt8192-asurada: Remove unused clock-stretch-ns
      arm64: dts: mediatek: mt6795-xperia-m5: Add UHS pins for MMC1 and 2
      arm64: dts: mediatek: mt6331: Fix VCAM IO regulator name
      arm64: dts: mediatek: mt6795: Fix issues in SCPSYS node
      arm64: dts: mediatek: mt6795-xperia-m5: Rename PMIC leds node
      arm64: dts: mediatek: mt8173-evb: Add interrupts to DA9211 regulator
      arm64: dts: mediatek: mt7986a: Change compatible for SafeXcel crypto
      arm64: dts: mediatek: mt7981b-openwrt-one: Add address/size cells to eth
      arm64: dts: mediatek: mt8186-evb: Add vproc fixed regulator
      arm64: dts: mediatek: mt7988a: Fix PCI-Express T-PHY node address
      dt-bindings: arm: mediatek: audsys: Support mt8192-audsys variant
      arm64: dts: mediatek: mt8192: Rename mt8192-afe-pcm to audio-controller

Chen-Yu Tsai (2):
      arm64: dts: mediatek: mt8188-geralt: drop firmware-name from first SCP core
      arm64: dts: mediatek: mt8183-kukui: Clean up IT6505 regulator supply

Frank Wunderlich (2):
      arm64: dts: mediatek: mt7986: add dtbs with applied overlays for bpi-r3
      arm64: dts: mediatek: mt7988: add dtbs with applied overlays for bpi-r4 (pro)

Gary Bisson (5):
      dt-bindings: vendor-prefixes: Add Ezurio LLC
      dt-bindings: arm: mediatek: Add Ezurio Tungsten entries
      arm64: dts: mediatek: mt8188: switch mmc nodes to interrupts-extended
      arm64: dts: mediatek: add device tree for Tungsten 510 board
      arm64: dts: mediatek: add device tree for Tungsten 700 board

Krzysztof Kozlowski (1):
      arm64: dts: airoha: Use hyphen in node names

Louis-Alexis Eyraud (4):
      arm64: dts: mediatek: mt8390-genio-common: Add HDMI sound output support
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add HDMI sound output support
      arm64: dts: mediatek: mt8395-genio-common: Enable HDMI output
      arm64: dts: mediatek: mt8395-genio-common: Add HDMI sound output support

Otto Pflüger (1):
      arm64: dts: mediatek: mt8183: Add missing endpoint IDs to display graph

Rob Herring (Arm) (1):
      arm64: dts: mediatek: Apply mt8395-radxa DT overlay at build time

Sjoerd Simons (7):
      arm64: dts: mediatek: mt7981b: Add PCIe and USB support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable PCIe and USB
      arm64: dts: mediatek: mt7981b: Add Ethernet and WiFi offload support
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable Ethernet
      arm64: dts: mediatek: mt7981b: Disable wifi by default
      arm64: dts: mediatek: mt7981b: Add wifi memory region
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable wifi

 .../devicetree/bindings/arm/mediatek.yaml          |    2 +
 .../bindings/arm/mediatek/mediatek,audsys.yaml     |   46 +-
 .../devicetree/bindings/vendor-prefixes.yaml       |    2 +
 arch/arm64/boot/dts/airoha/en7581-evb.dts          |    6 +-
 arch/arm64/boot/dts/mediatek/Makefile              |   57 +
 arch/arm64/boot/dts/mediatek/mt6331.dtsi           |    2 +-
 .../boot/dts/mediatek/mt6795-sony-xperia-m5.dts    |   50 +-
 arch/arm64/boot/dts/mediatek/mt6795.dtsi           |    3 +-
 .../boot/dts/mediatek/mt7981b-openwrt-one.dts      |  129 +-
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi          |  220 ++-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi          |    2 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi          |   28 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi  |   34 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |  167 ++-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   68 +-
 arch/arm64/boot/dts/mediatek/mt8173.dtsi           |   28 +-
 arch/arm64/boot/dts/mediatek/mt8183-evb.dts        |   36 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi-pico6.dts    |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |    6 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |   16 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |   37 +-
 arch/arm64/boot/dts/mediatek/mt8186-evb.dts        |   13 +
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi    |    1 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |   88 +-
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |    1 -
 arch/arm64/boot/dts/mediatek/mt8192.dtsi           |    2 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |   85 ++
 .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
 .../boot/dts/mediatek/mt8390-genio-common.dtsi     |  150 ++
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dts    |   22 +
 .../boot/dts/mediatek/mt8390-tungsten-smarc.dtsi   | 1489 ++++++++++++++++++++
 .../boot/dts/mediatek/mt8395-genio-common.dtsi     |  150 ++
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |  150 ++
 33 files changed, 2873 insertions(+), 233 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-tungsten-smarc.dtsi



