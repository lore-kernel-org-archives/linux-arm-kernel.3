Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 41628D132B5
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  4 Nov 2024 11:37:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Vci3jQLEcdyljh9VMhnoM66iW3+JTExNH6kMXN4qkus=; b=s/8gYxz6mkx8qnP1k9w7jowTJ+
	+Maz1HP8EZGWm+HdrbNNu063fwXXPPx6HGNmuHulvsqf/iK1lVcNh240NvX3BNAe7IUA7MsIMfUOd
	C1gFkg2S3eI099SA+O9BYGDsuDZW1UO0AN9owtEUjzxkV+SoAYFvkhO28eCZiXCcEn70lA1EGk7pj
	Vf4e+yNV6fnONc9/ApqrcTbEMvTAUYGyrP6tcM0mBEI+m62K89djZeysFg4ZNBrpyGb/SyR3OI2Fn
	Tw0Rkbey18mBW+EXkrUEEcXONJI6XtNd4NBXyUw+bL1RU+ND4DPNSvjU6WB2R+CiTt31bSRjvvGED
	AtRjRAmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vOe-0000000DYkj-0177;
	Mon, 04 Nov 2024 11:37:24 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t7vEF-0000000DVos-23PC;
	Mon, 04 Nov 2024 11:26:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1730719597;
	bh=2M6vBjVHF1WnquR+ikjsHwhWCf3RjSuDSCRA4FhNpk0=;
	h=From:To:Cc:Subject:Date:From;
	b=Xzuyz0okuPMXLeP1nDovbTYi7o5v3zTuSmEj/UvzPY19Vt8+X3NCrLnvCFA2OA3ue
	 ACKJJzP+tNhhUbN/hs99iRYe5gc69APykvdgtVP2+hpW30utjvO1bGpxrY/2CTxDXx
	 1feX7i/eqEN7weVvXSiP/Ybdvc9NBD3XA7Jkoyjrt34HH1+5RlxOLfEdXGwpTSbLA1
	 GGgbJwifJJ7oRYa/qXL6c8mNUP3Be3wV37RDjY1pbkiD76WeVc/eoPfTpgu1bxsMCA
	 F9OCFdL8SAsmq2q/r5gZ8YLy3eB4A9ges1p5QLJsYlOF27objh8Ib+7zOgpfbpG8tJ
	 3ugmynkmtEL7w==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 7C41C17E35FC;
	Mon,  4 Nov 2024 12:26:37 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.13
Date: Mon,  4 Nov 2024 12:26:20 +0100
Message-ID: <20241104112625.161365-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.46.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241104_032639_723524_865DB61C 
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

The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.13

for you to fetch changes up to 436142058e5dec67df71c0a4b159338bdda24b6b:

  arm64: dts: mediatek: mt8183-kukui: Drop bogus fixed regulators (2024-11-04 11:12:35 +0100)

----------------------------------------------------------------
MediaTek ARM64 DeviceTree updates for v6.13

MT8195 (also called MT8395)
 - Enabled GPU support on Genio 1200 EVK
 - Added sound-dai-cells for audio codec on MT8195 Cherry Chromebooks

MT8192:
 - Added support Asurada Chromebook variants with Synaptics trackpad

MT8188 (also called MT8390):
 - Added support for CPU DVFS, IOMMU, PWM hardware, SPMI bus,
   Audio, socinfo, PCI-Express, DisplayPort, MIPI DSI, Ethernet,
   Video HW Encoders (Stateful) and HW Decoders (Stateless),
   JPEG HW Encoder/Decoder.
 - Enabled GPU support on Genio 700 EVK

MT8183:
 - Added support for Video HW Encoders (Stateful)
 - Added HDMI support on MT8183 Pumpkin board
 - Fixed some regulators to provide the actual description of the
   power rails in MT8183 Kukui Chromebooks
 - Disabled DPI display interface on MT8183 Kukui Chromebooks
   to fix internal display probing
 - Fixed address of EEPROM found on MT8183 Kakadu/Kodama Chromebooks
 - Added SCL internal delay on I2C2 bus for improved I2C-HID devices
   reliability on MT8183 Jacuzzi Chromebooks

MT7988:
 - Added support for eFuses and UART controllers

Plus, addition of OF Graph support in MediaTek MMSYS and some cleanups
and dtbs_check fixes for MT8195 and for all machines using the MT6358
PMIC.

----------------------------------------------------------------
Alper Nebi Yasak (1):
      arm64: dts: mediatek: mt8183-kukui: Disable DPI display interface

AngeloGioacchino Del Regno (1):
      dt-bindings: arm: mediatek: mmsys: Add OF graph support for board path

Chen-Yu Tsai (7):
      arm64: dts: mediatek: mt8186-corsola-voltorb: Merge speaker codec nodes
      arm64: dts: mediatek: mt8173-elm-hana: Add vdd-supply to second source trackpad
      arm64: dts: mediatek: mt8186-corsola: Fix GPU supply coupling max-spread
      arm64: dts: mediatek: mt8186-corsola: Fix IT6505 reset line polarity
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: Fix DP bridge supply names
      arm64: dts: mediatek: mt8183-kukui-jacuzzi: Add supplies for fixed regulators
      arm64: dts: mediatek: mt8183-kukui: Drop bogus fixed regulators

Daolong Zhu (4):
      arm64: dts: mt8183: fennel: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: burnet: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: cozmo: add i2c2's i2c-scl-internal-delay-ns
      arm64: dts: mt8183: Damu: add i2c2's i2c-scl-internal-delay-ns

Fabien Parent (1):
      arm64: dts: mediatek: mt8183-pumpkin: add HDMI support

Fei Shao (21):
      arm64: dts: mediatek: mt8188: Add missing dma-ranges to soc node
      arm64: dts: mediatek: mt8188: Update vppsys node names to syscon
      arm64: dts: mediatek: mt8188: Move vdec1 power domain under vdec0
      arm64: dts: mediatek: mt8188: Move SPI NOR *-cells properties
      arm64: dts: mediatek: mt8188: Add CPU performance controller for CPUFreq
      arm64: dts: mediatek: mt8188: Add SMI/LARB/IOMMU support
      arm64: dts: mediatek: mt8188: Add PWM nodes for display backlight
      arm64: dts: mediatek: mt8188: Add SPMI support for PMIC control
      arm64: dts: mediatek: mt8188: Add audio support
      arm64: dts: mediatek: mt8188: Add socinfo nodes
      arm64: dts: mediatek: mt8188: Assign GCE aliases
      arm64: dts: mediatek: mt8188: Add PCIe nodes
      arm64: dts: mediatek: mt8188: Add MIPI DSI nodes
      arm64: dts: mediatek: mt8188: Add video decoder and encoder nodes
      arm64: dts: mediatek: mt8188: Add JPEG decoder and encoder nodes
      arm64: dts: mediatek: mt8188: Add display nodes for vdosys0
      arm64: dts: mediatek: mt8188: Add display nodes for vdosys1
      arm64: dts: mediatek: mt8188: Add DP-INTF nodes
      arm64: dts: mediatek: mt8188: Add eDP and DP TX nodes
      arm64: dts: mediatek: mt8188: Fix USB3 PHY port default status
      arm64: dts: mediatek: mt8195-cherry: Use correct audio codec DAI

Hsin-Te Yuan (3):
      arm64: dts: mt8183: Add encoder node
      arm64: dts: mt8183: krane: Fix the address of eeprom at i2c4
      arm64: dts: mt8183: kukui: Fix the address of eeprom at i2c4

Macpaul Lin (7):
      arm64: dts: mediatek: mt8395-genio-1200-evk: Fix dtbs_check error for phy
      arm64: dts: mt8195: Fix dtbs_check error for mutex node
      arm64: dts: mt8195: Fix dtbs_check error for infracfg_ao node
      arm64: dts: mediatek: mt8390-genio-700-evk: enable pcie
      arm64: dts: mediatek: mt8390-genio-700-evk: update regulator names
      arm64: dts: mediatek: mt8390-genio-700-evk: add keys and USB HUB
      arm64: dts: mediatek: mt6358: fix dtbs_check error

Nícolas F. R. A. Prado (2):
      arm64: dts: mediatek: mt8188: Add ethernet node
      arm64: dts: mediatek: mt8390-genio-700-evk: Enable ethernet

Pablo Sun (3):
      arm64: dts: mediatek: mt8188: Fix wrong clock provider in MFG1 power domain
      arm64: dts: mediatek: mt8390-genio-700-evk: Enable Mali GPU
      arm64: dts: mediatek: mt8395-genio-1200-evk: Enable GPU

Pin-yen Lin (2):
      arm64: dts: mt8192-asurada-spherion: Add Synaptics trackpad support
      arm64: dts: mt8183: Add port node to dpi node

Rafał Miłecki (2):
      arm64: dts: mediatek: mt7988: add UART controllers
      arm64: dts: mediatek: mt7988: add efuse block

max_weng (1):
      arm64: dts: mediatek: mt8186: add FHCTL node

 Documentation/devicetree/bindings/arm/mediatek/mediatek,mmsys.yaml |   28 ++++
 arch/arm64/boot/dts/mediatek/mt6358.dtsi                           |    4 +-
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                          |   42 ++++-
 arch/arm64/boot/dts/mediatek/mt8173-elm-hana.dtsi                  |    8 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-burnet.dts       |    3 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-cozmo.dts        |    2 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts         |    3 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel.dtsi      |    3 +
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi.dtsi             |   30 ++--
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kakadu.dtsi              |    4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku32.dts          |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-katsu-sku38.dts          |    2 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-kodama.dtsi              |    4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-krane.dtsi               |    4 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui.dtsi                     |   30 +---
 arch/arm64/boot/dts/mediatek/mt8183-pumpkin.dts                    |  123 ++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                           |   21 +++
 arch/arm64/boot/dts/mediatek/mt8186-corsola-voltorb.dtsi           |   21 +--
 arch/arm64/boot/dts/mediatek/mt8186-corsola.dtsi                   |   14 +-
 arch/arm64/boot/dts/mediatek/mt8186.dtsi                           |    7 +
 arch/arm64/boot/dts/mediatek/mt8188-evb.dts                        |    2 -
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                           | 1124 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++--
 arch/arm64/boot/dts/mediatek/mt8192-asurada-spherion-r0.dts        |   11 ++
 arch/arm64/boot/dts/mediatek/mt8192-asurada.dtsi                   |    4 +-
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                    |    6 +-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                           |    4 +-
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts              |  192 +++++++++++++++++----
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts             |   21 ++-
 28 files changed, 1586 insertions(+), 133 deletions(-)


