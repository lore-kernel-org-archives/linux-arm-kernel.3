Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 72C09C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  6 Mar 2025 12:21:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=F/L+RRxLwgh0dEYpJxUZjS3x+KfBkwJXyP1HxNij8yA=; b=DHTDB1aWm8PbCffC+ckPKFSPGp
	KBBwty4XujdDX2krC8sOiqJrEou210rv3bkkBjVhAWJDVE7mUszT8TZH1qJ2//tXur6kckda7tYAl
	dyzu1fgihN6AHjhMm/9518GpeqqYqXann6LHSJgM0QjVSepw0ZsAj6h3ibPoRCMrBrj7PGDpxM+rD
	g5dnDdw2p+zgpf4wiHoSgPPKJOJKjWsezCBExrJmG2kk1WwXFDdVZdrKIjoEhRJNTer7fDEjbyWWA
	YBWHJ5hc2on9wpdJzI8diVP+nuI9UmzdedlKVW8olFySdJGDwvsm9dKMybaq+/OtFN/wB+/O8IMJ+
	MMr0yr+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqAEK-0000000Atzo-43LW;
	Thu, 06 Mar 2025 12:21:36 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tq9W1-0000000Any4-3PDy;
	Thu, 06 Mar 2025 11:35:51 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1741260948;
	bh=rKDNbvpRbRo31mPlwFN0GzLQBxytG0a+UvjZcL3yDdk=;
	h=From:To:Cc:Subject:Date:From;
	b=Tsa4/NcivS40dSdQreSG1Eb59F37D1Ghsbu5spIDUnDtPq71HjWmhuLiGRXx4otQh
	 HOVxk8WSUJrW/ewnhm3cyrwy7wyfWfUnnqLNJxlvDrQRfD5DLtJ8Kf2oc0SIyU58hh
	 ngSy2qJDsdJbRouSx5V7PIY6Wr1E+UyrGVF1ZihAl++XnLTmg82GcWUkg/IzfeV8HM
	 lQ2mGlUtz4QymdoJ089OyxdtYnIVsyalmEYrSH1uWtJIAVFZ48CYH2l5YTknaXCYnB
	 G1P8KUFW7abGtN9UrohvtdlOPjl2WE3Po4f1iSaRUZYcEWYtbMLjbI9Ou0IWQ/CkbW
	 QAWC+l3VEt9RA==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id AD1C517E05E7;
	Thu,  6 Mar 2025 12:35:47 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,1/2] MediaTek ARM64 DTS updates for v6.15
Date: Thu,  6 Mar 2025 12:34:52 +0100
Message-ID: <20250306113540.148342-1-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.48.1
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250306_033550_005703_5ABDEBE3 
X-CRM114-Status: GOOD (  16.81  )
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

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.15

for you to fetch changes up to 4c8ff61199a70e73e6c4d5e8a03f02d32730821c:

  arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel (2025-03-06 10:53:07 +0100)

----------------------------------------------------------------
MediaTek ARM64 DTS updates for v6.15

This adds new SoCs and new machines, other than improving support for
currently supported ones.

In particular, for SoCs:
 - Airoha EN7581 gets support for its SCU clock controller, SPI NAND,
   hardware RNG, pinctrl, and i2c controllers;
 - MediaTek MT8365 SoC gets support for all of its Display Controller
   components;
 - MediaTek Genio 510 MT8370 - a lower binned variant of Genio 700
   MT8390 (which, in turn, is the same as MT8188) - is introduced;
 - MT8188 gets support for more Display Controller components (DSC
   and MERGE), for the tertiary MSDC (eMMC/SD/SDIO) controller, and
   for the MTU3 USB DRD controllers;
 - MT8195 and MT8188 both get migrated to the new OF Graph used for
   defining a pipeline for the Display Controller components (as
   this was previously hardcoded per-board in the drm driver, ugh!);

..and for boards:
 - Google Kukui (MT8183) is switched to Elan touchscreen driver
   instead of hid-over-i2c to fix probe failures in some cases;
 - Google Cherry (MT8195) and Geralt (MT8188) Chromebooks get
   migrated to using OF Graph for defining their board specific
   part of the display pipeline;
 - MediaTek Genio 350 (mt8365) EVK board adds support for HDMI output
   through the iTE IT66121 chip, and for DSI output to the Startek
   KD070FHFID015 display;
 - MediaTek Genio 510 EVK board is introduced with a common devicetree
   between mt8390 and mt8370 (Genio 700 and Genio 510) EVKs;
 - MediaTek Genio 700 (and 510) EVKs get support for their integrated
   dual Digital Microphones, for their RichTek RT1715 USB Type-C
   Controller with USB-PD capability, the iTE IT5205 Alternate Mode
   Passive MUX (USB3.1/DP1.4), and for USB Gadget/Host switching
   through the MTU3 DRD Controller, other than for USB in general;
 - MediaTek Genio 1200 EVK gets support for its MediaTek MT6360 PMIC
   integrated Type-C Controller, and the IT5205 MUX;
 - Radxa NIO-12L gets its DSI display pipeline preconfigured and also
   the introduction of a devicetree overlay for the official Radxa
   8HD DSI panel, enabling display output over DSI.

And fixes/cleanups:
 - MT8173 gets fixes for bindings validation: PMIC node drops the
   unnecessary address/size cells, disp-pwm gets its compatibles
   list fixed (as mt6595 was not expected there), and some nodes
   got the right name (clock controllers were disguides as power
   controllers, and intpol was changed to interrupt-controller);
 - MT8188-based (MT8390) Genio boards get a fix for duplicated
   regulator name;
 - MT6359 PMIC gets fixes for audio-codec node validation.

----------------------------------------------------------------
Alexandre Mergnat (2):
      arm64: dts: mediatek: add display blocks support for the MT8365 SoC
      arm64: dts: mediatek: add display support for mt8365-evk

AngeloGioacchino Del Regno (11):
      arm64: dts: mediatek: mt8188: Add VDO0's DSC and MERGE block nodes
      arm64: dts: mediatek: mt8188: Add tertiary eMMC/SD/SDIO controller
      dt-bindings: usb: mediatek,mtk-xhci: Add port for SuperSpeed EP
      arm64: dts: mediatek: mt8188: Add MTU3 nodes and correctly describe USB
      arm64: dts: mediatek: mt8390-genio-700: Add USB, TypeC Controller, MUX
      arm64: dts: mediatek: mt8188: Add base display controller graph
      arm64: dts: mediatek: mt8188-geralt: Add graph for DSI and DP displays
      arm64: dts: mediatek: mt8390-genio-common: Configure touch vreg pins
      arm64: dts: mediatek: mt8195: Add base display controller graph
      arm64: mediatek: mt8195-cherry: Add graph for eDP and DP displays
      arm64: dts: mediatek: mt8395-nio-12l: Preconfigure DSI0 pipeline

Chen-Yu Tsai (3):
      arm64: dts: mediatek: mt8173-elm: Drop pmic's #address-cells and #size-cells
      arm64: dts: mediatek: mt8173: Fix disp-pwm compatible string
      arm64: dts: mediatek: mt8173: Fix some node names

Christian Marangi (3):
      arm64: dts: airoha: en7581: Add Clock Controller node
      arm64: dts: airoha: en7581: Add SNAND node
      arm64: dts: airoha: en7581: Add default partition table for EVB board

Fabien Parent (1):
      arm64: dts: mediatek: mt8395-genio-1200-evk: add support for TCPC port

Hsin-Te Yuan (1):
      arm64: dts: mediatek: mt8183: Switch to Elan touchscreen driver

Julien Massot (2):
      arm64: dts: mediatek: mt8395-nio-12l: Prepare MIPI DSI port
      arm64: dts: mediatek: mt8395-radxa-nio-12l: Add Radxa 8 HD panel

Lorenzo Bianconi (2):
      arm64: dts: airoha: en7581: Add more nodes to EN7581 SoC evaluation board
      arm64: dts: airoha: en7581: Fix clock-controller address

Louis-Alexis Eyraud (5):
      dt-bindings: arm: mediatek: add mt8370-evk board
      arm64: dts: mediatek: add support for MT8370 SoC
      arm64: dts: mediatek: mt8390-genio-700-evk: Move common parts to dtsi
      arm64: dts: mediatek: add device-tree for Genio 510 EVK board
      arm64: dts: mediatek: mt8390-genio-common: Fix duplicated regulator name

Macpaul Lin (2):
      arm64: dts: mediatek: mt6359: fix dtbs_check error for audio-codec
      dt-bindings: usb: mtu3: Add ports property

Nícolas F. R. A. Prado (3):
      arm64: dts: mediatek: mt8188: Assign apll1 clock as parent to avoid hang
      arm64: dts: mediatek: mt8390-genio-common: Add routes for DMIC
      arm64: dts: mediatek: mt8390-genio-common: Add delay codec for DMIC

 Documentation/devicetree/bindings/arm/mediatek.yaml               |    5 +
 Documentation/devicetree/bindings/usb/mediatek,mtk-xhci.yaml      |    4 +
 Documentation/devicetree/bindings/usb/mediatek,mtu3.yaml          |   12 +
 arch/arm64/boot/dts/airoha/en7581-evb.dts                         |   44 +++
 arch/arm64/boot/dts/airoha/en7581.dtsi                            |   91 ++++++
 arch/arm64/boot/dts/mediatek/Makefile                             |    3 +
 arch/arm64/boot/dts/mediatek/mt6359.dtsi                          |    3 +-
 arch/arm64/boot/dts/mediatek/mt8173-elm.dtsi                      |    2 -
 arch/arm64/boot/dts/mediatek/mt8173.dtsi                          |   12 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-damu.dts        |    9 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku1.dts |    8 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku6.dts |    8 +-
 arch/arm64/boot/dts/mediatek/mt8183-kukui-jacuzzi-fennel-sku7.dts |    8 +-
 arch/arm64/boot/dts/mediatek/mt8188-geralt.dtsi                   |  173 +++++++++-
 arch/arm64/boot/dts/mediatek/mt8188.dtsi                          |  307 +++++++++++++++---
 arch/arm64/boot/dts/mediatek/mt8195-cherry.dtsi                   |  184 ++++++++++-
 arch/arm64/boot/dts/mediatek/mt8195.dtsi                          |  129 ++++++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts                       |  245 +++++++++++++-
 arch/arm64/boot/dts/mediatek/mt8365.dtsi                          |  336 +++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts             |   19 ++
 arch/arm64/boot/dts/mediatek/mt8370.dtsi                          |   64 ++++
 arch/arm64/boot/dts/mediatek/mt8390-genio-700-evk.dts             | 1033 +----------------------------------------------------------
 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi             | 1223 ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts            |  102 ++++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso |   84 +++++
 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l.dts             |   71 +++++
 26 files changed, 3051 insertions(+), 1128 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-genio-510-evk.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-genio-common.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-radxa-nio-12l-8-hd-panel.dtso

