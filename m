Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C744DE77188
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  8 Jan 2025 10:16:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=lwYjWQA7z/YOXK+jSWZNQxTHUGUpIOICRCmvqyPmJRc=; b=a8kO/3604hHpxpN2Y/c1pA9UW+
	yqrNIc/UO39nFSMPRmnOwiuBm+ogHPeganXDoFAwpsQMaJYe9hmELrTh6XcqLWQmX7G0fFD9+Ae6T
	nLIAZHjvoRSdRau/DgnG2jbYpP4v8wInuxiWWnZwfuQ2VrgYaSwku//mCBbKEx8cwbIwy2T41nXa3
	HNAHNb5zpRuav+TSywhavi2+xX5lKHaUWEK94JhCmPcN3A8Kp3MgOMt7pcnyypBYGYed1KuXe3PXO
	2C8c2WCddVNeedULk7P9Z2cgaEJ4VJFxdS/OXExsI1sY3yKkqffpeqhtYOTQgkDPpXJ2/6vs77FWM
	n4SaXlVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tVT74-00000007wiN-3W9a;
	Wed, 08 Jan 2025 10:16:34 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tVSzO-00000007ukr-3PVF;
	Wed, 08 Jan 2025 10:08:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1736330916;
	bh=7LxRMofEbnDGQ1T7p668QnqUCQTGVsnP+D+EDWMb9+4=;
	h=From:To:Cc:Subject:Date:From;
	b=f1/oCe/7BGk8cg3Rbz6gqj5hFxeabzHwn/i9ULdyjBLANeWdYt9YGAxzTahUrEIsO
	 QaPJqN8tubdEca7ALpKDjyxITkJY51uZhbS02hgkX3VORwyavVbrWXrzMzYl/1ZkNM
	 WhtxQ4aJWXC/fmXMQa/ZqdSEDG/fjGkTIV4YK7/UIiePdoR5spcgftKQOOu2d43DvP
	 zkhk7VIT34cACfXlrfKTmY+wwN0Hr6NlxtsgVmFgSNkmXzPcy3lq7JfBmwCI7TzkhY
	 Lr2eUJX94h0ETbiXeDbnEvjEyH/zGwxfiTnLp4E6SdGkBUt+uJ4wae10AXOBq47jMP
	 buJr1rizR0E1w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 020AD17E1551;
	Wed,  8 Jan 2025 11:08:35 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/3] MediaTek ARM64 DTS updates for v6.14
Date: Wed,  8 Jan 2025 11:08:22 +0100
Message-ID: <20250108100826.32458-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.47.0
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250108_020839_148269_F5282B51 
X-CRM114-Status: GOOD (  20.08  )
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

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.14

for you to fetch changes up to 0fb0d360218129f00b76f13e30b86321b64e36f6:

  arm64: dts: mediatek: mt8516: add keypad node (2025-01-07 13:11:55 +0100)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates for v6.14

This adds a few cleanups, enhances support for upstreamed SoCs
and machines, other than adding new ones.

In particular, fixes and improvements:
 - MT8516 gets a few fixes for GICv2, Watchdog and I2C, and
   support for the Keypad controller;
 - MT8390 Genio 700 board gets basic audio support;
 - MT8365 gets an alias for its integrated ethernet controller;
 - MT8195 gets an important fix for system suspend: all of the
   machines based on this SoC and its IoT variant can now
   properly perform PM Suspend to RAM;
 - MT8188 gets support for its Mali GPU with DVFS and a fix for
   the OVL Hardware found in the Display Controller using the
   right compatible strings;
 - MT8186 Chromebooks can now suspend properly thanks to a fix
   moving the USB wakeups from XHCI to MTU3 (USB) controller;
 - MT8183 Chromebooks get a fix for their DMIC microphone and
   proper support for their second-source touchscreen;
 - MT7988 SoC and the BananaPi R4 board gets support for Pinctrl,
   eMMC/SD, Thermal, CPU DVFS, PCI-Express, and peripherals like
   the RT5190A PMIC, PCA9545 I2C mux, and others;
 - MT7986 BananaPi R3 board gets support for SATA power socket;

And cleanups:
 - Dropped regulator-compatible property from MediaTek DTs;
 - Aligned thermal node names with bindings on MT8183 Kukui;
 - MT6397 PMIC get proper sub-node names, fixing dt validation;
 - The property enabling Wake-On-Lan feature changed in all of
   the boards and driver to match the actual meaning of it
   (mediatek,mac-wol now enables wol on mac instead of phy);
 - Compatibles for MediaTek PMIC Keypad are added to bindings
   and can now pass dts validation;

...and the newly added machines are:
 - MT8188 (Ciri) Lenovo Chromebook Duet
 - MT8186 (Starmie) ASUS Chromebook Enterprise CM30
 - MT8186 (Chinchou) ASUS Chromebook CZ12 and CZ12 Flip

----------------------------------------------------------------
Chen-Yu Tsai (14):
      arm64: dts: mediatek: mt8183: Disable DPI display output by default
      arm64: dts: mediatek: mt8183: Disable DSI display output by default
      arm64: dts: mediatek: mt8173-evb: Drop regulator-compatible property
      arm64: dts: mediatek: mt8173-elm: Drop regulator-compatible property
      arm64: dts: mediatek: mt8192-asurada: Drop regulator-compatible property
      arm64: dts: mediatek: mt8195-cherry: Drop regulator-compatible property
      arm64: dts: mediatek: mt8195-demo: Drop regulator-compatible property
      arm64: dts: medaitek: mt8395-nio-12l: Drop regulator-compatible property
      arm64: dts: mediatek: mt8395-genio-1200-evk: Drop regulator-compatible property
      arm64: dts: mediatek: mt8173-elm: Fix MT6397 PMIC sub-node names
      arm64: dts: mediatek: mt8173-evb: Fix MT6397 PMIC sub-node names
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: Drop pp3300_panel voltage settings
      arm64: dts: mediatek: mt8192: Drop Chromebook variants that never shipped
      dt-bindings: arm: mediatek: Drop MT8192 Chromebook variants that never shipped

Fei Shao (2):
      dt-bindings: arm: mediatek: Add MT8188 Lenovo Chromebook Duet (11", 9)
      arm64: dts: mediatek: Introduce MT8188 Geralt platform based Ciri

Frank Wunderlich (27):
      arm64: dts: mt7986: add overlay for SATA power socket on BPI-R3
      arm64: dts: mediatek: mt7988: Add pinctrl support
      arm64: dts: mediatek: mt7988a-bpi-r4: Add pinctrl subnodes for bpi-r4
      arm64: dts: mediatek: mt7988: Add reserved memory
      arm64: dts: mediatek: mt7988: Add mmc support
      arm64: dts: mediatek: mt7988: Add lvts node
      arm64: dts: mediatek: mt7988: Add thermal-zone
      arm64: dts: mediatek: mt7988: Add missing clock-div property for i2c
      arm64: dts: mediatek: mt7988: Add mcu-sys node for cpu
      arm64: dts: mediatek: mt7988: Add CPU OPP table for clock scaling
      arm64: dts: mediatek: mt7988: Disable usb controllers by default
      arm64: dts: mediatek: mt7988: Add t-phy for ssusb1
      arm64: dts: mediatek: mt7988: Add pcie nodes
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable watchdog
      arm64: dts: mediatek: mt7988a-bpi-r4: Add fixed regulators for 1v8 and 3v3
      arm64: dts: mediatek: mt7988a-bpi-r4: Add dt overlays for sd + emmc
      arm64: dts: mediatek: mt7988a-bpi-r4: Add thermal configuration
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable serial0 debug uart
      arm64: dts: mediatek: mt7988a-bpi-r4: Add default UART stdout
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable I2C controllers
      arm64: dts: mediatek: mt7988a-bpi-r4: Add PCA9545 I2C Mux
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable t-phy for ssusb1
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable ssusb1 on bpi-r4
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable pwm
      arm64: dts: mediatek: mt7988a-bpi-r4: Enable pcie
      arm64: dts: mediatek: mt7988a-bpi-r4: Add MediaTek MT6682A/RT5190A PMIC
      arm64: dts: mediatek: mt7988a-bpi-r4: Add proc-supply for cpus

Hsiao Chien Sung (1):
      dt-bindings: display: mediatek: ovl: Modify rules for MT8195/MT8188

Hsin-Te Yuan (3):
      arm64: dts: mediatek: mt8183: kenzo: Support second source touchscreen
      arm64: dts: mediatek: mt8183: willow: Support second source touchscreen
      arm64: dts: mediatek: mt8188: Add GPU speed bin NVMEM cells

Hsin-Yi Wang (1):
      arm64: dts: mt8183: set DMIC one-wire mode on Damu

Jason-JH.Lin (3):
      dt-bindings: display: mediatek: ovl: Add compatible strings for MT8188 MDP3
      dts: arm64: mediatek: mt8188: Update OVL compatible from MT8183 to MT8195
      dts: arm64: mediatek: mt8195: Remove MT8183 compatible for OVL

Krzysztof Kozlowski (1):
      arm64: dts: mediatek: mt8183-kukui: align thermal node names with bindings

Nícolas F. R. A. Prado (5):
      arm64: dts: mediatek: mt8186: Move wakeup to MTU3 to get working suspend
      arm64: dts: mt6359: Add #sound-dai-cells property
      arm64: dts: mediatek: mt8390-genio-700-evk: Add sound output support
      arm64: dts: mediatek: mt8195: Remove suspend-breaking reset from pcie1
      arm64: dts: mediatek: Set mediatek,mac-wol on DWMAC node for all boards

Sjoerd Simons (1):
      arm64: dts: mediatek: mt8365-evk: Set ethernet alias

Val Packett (7):
      arm64: dts: mediatek: mt8516: fix GICv2 range
      arm64: dts: mediatek: mt8516: fix wdt irq type
      arm64: dts: mediatek: mt8516: add i2c clock-div property
      arm64: dts: mediatek: mt8516: reserve 192 KiB for TF-A
      dt-bindings: mediatek,mt6779-keypad: add more compatibles
      arm64: dts: mediatek: add per-SoC compatibles for keypad nodes
      arm64: dts: mediatek: mt8516: add keypad node

Wojciech Macek (2):
      dt-bindings: arm: mediatek: Add MT8186 Starmie Chromebooks
      arm64: dts: mediatek: mt8186: Add Starmie device

Zhengqiao Xia (4):
      dt-bindings: arm: mediatek: Add MT8186 Chinchou Chromebook
      arm64: dts: mediatek: Add MT8186 Chinchou Chromebooks
      arm64: dts: mediatek: Add extcon node for DP bridge
      arm64: dts: mediatek: Modify audio codec name for pmic

 .../devicetree/bindings/arm/mediatek.yaml          |   65 +-
 .../bindings/display/mediatek/mediatek,ovl.yaml    |   12 +-
 .../bindings/input/mediatek,mt6779-keypad.yaml     |    3 +
 arch/arm64/boot/dts/mediatek/Makefile              |   19 +-
 arch/arm64/boot/dts/mediatek/mt2712-evb.dts        |    1 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi           |    1 +
 .../dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso |   34 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso |   33 +
 .../dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso   |   31 +
 .../boot/dts/mediatek/mt7988a-bananapi-bpi-r4.dts  |  398 +++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi          |  365 +++++-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi       |   29 +-
 arch/arm64/boot/dts/mediatek/mt8173-evb.dts        |   25 +-
 .../dts/mediatek/mt8183-kukui-jacuzzi-damu.dts     |    4 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-kenzo.dts    |   15 +
 .../dts/mediatek/mt8183-kukui-jacuzzi-willow.dtsi  |   15 +
 .../boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi    |    2 -
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi     |    9 +-
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts    |    4 -
 arch/arm64/boot/dts/mediatek/mt8183.dtsi           |    5 +-
 .../dts/mediatek/mt8186-corsola-chinchou-sku0.dts  |   18 +
 .../dts/mediatek/mt8186-corsola-chinchou-sku1.dts  |   35 +
 .../dts/mediatek/mt8186-corsola-chinchou-sku16.dts |   29 +
 .../boot/dts/mediatek/mt8186-corsola-chinchou.dtsi |  321 ++++++
 .../dts/mediatek/mt8186-corsola-starmie-sku0.dts   |   31 +
 .../dts/mediatek/mt8186-corsola-starmie-sku1.dts   |   31 +
 .../boot/dts/mediatek/mt8186-corsola-starmie.dtsi  |  472 ++++++++
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi   |    8 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi           |    8 +-
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts  |   32 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts  |   59 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts  |   59 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts  |   32 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts  |   48 +
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts  |   72 ++
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts  |   72 ++
 .../boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts  |   48 +
 .../boot/dts/mediatek/mt8188-geralt-ciri.dtsi      |  316 ++++++
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi    | 1156 ++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8188.dtsi           |    9 +-
 .../dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts |   65 --
 .../dts/mediatek/mt8192-asurada-spherion-r4.dts    |   78 --
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi   |    3 -
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi    |    2 -
 arch/arm64/boot/dts/mediatek/mt8195-demo.dts       |   10 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi           |    5 +-
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts        |    1 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi           |    3 +-
 .../boot/dts/mediatek/mt8390-genio-700-evk.dts     |   48 +
 .../boot/dts/mediatek/mt8395-genio-1200-evk.dts    |    2 -
 .../dts/mediatek/mt8395-kontron-3-5-sbc-i1200.dts  |    1 +
 .../boot/dts/mediatek/mt8395-radxa-nio-12l.dts     |    2 -
 arch/arm64/boot/dts/mediatek/mt8516.dtsi           |   22 +-
 arch/arm64/boot/dts/mediatek/pumpkin-common.dtsi   |    2 -
 54 files changed, 3899 insertions(+), 271 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3-sata.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou-sku16.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-chinchou.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8186-corsola-starmie.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku0.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku1.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku2.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku3.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku4.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku5.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku6.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri-sku7.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt-ciri.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-hayato-r5-sku2.dts
 delete mode 100644 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r4.dts

