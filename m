Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF358CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 11 Nov 2025 09:56:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=X100/5XOY4cSNdMadcdXUD3LzvWX4DhcTTWBkZYLvOw=; b=yb/AACrjmRaebx1VwImE6fRK2y
	WV9FflZw9XZ2yrDWXuwHHFsMPDRVsELDzCTP0XDAScjNNEt0kyVVzQys7PbTNvORkKTiup4ZMD50w
	5Smu3D2pydo16E5pi53mCQb/jPSux8WKH+1AhB6oojj4yPFj+AkmqvkhBrMhAJLrtaqRDsmDF1Tlj
	CmoazcE9P6rrcCvEo+HIEm6PiOwK5TibRkdZ7DP5LKQStluSBWXKaWzJUjDrcn+kjPDu79my2Ah6K
	cmYjmaDl7JyogZePFFLNsmumU4WKcCP2NnAvUH3pH02JobGDdYgr/USDKdgjjqeIhEwtEUcYxsspS
	mwqlLI/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6V-00000006t7G-2dTh;
	Tue, 11 Nov 2025 09:55:59 +0000
Received: from bali.collaboradmins.com ([148.251.105.195])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIl6P-00000006szw-0SPB;
	Tue, 11 Nov 2025 09:55:55 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1762854950;
	bh=JCOei6q9Jk44FOZF9ApEJscOe2ntZSYA8j4Q2mT2pJM=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=chtmt7slzxx6ci5rKvEpfdMFTK0184WsPqYwxu5+vPgiRde9vseveWg5nLAJ23Rbz
	 lsl9vxgHJJvbHqA+yP8+ung/C1a++D3Nz6Mqzxcf+av06uGfgEn0xE/9QN7ujUcj4a
	 80DhWAoMkw2pUWbdDYH9UK5BlimX84fVcLEzR+LQJZ+BMGtMOtERMc0puHzYARK83y
	 l6KgrTbI6KPNU/bLK8rnLUdIFSei3vMFbnOyIc8TH21lc66vp3aSINzWhwAlmj25Hi
	 Waivt+u5jFGfLITHD2ACXzyDclB2e6vc8JTbO55BKtJ0AUhF2ECVzpG2dcXw0zpXDp
	 glJRfUQDXWRFQ==
Received: from IcarusMOD.eternityproject.eu (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id DB77F17E13B5;
	Tue, 11 Nov 2025 10:55:49 +0100 (CET)
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: arm-soc <arm@kernel.org>,
	soc <soc@kernel.org>
Cc: matthias.bgg@kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-mediatek@lists.infradead.org
Subject: [GIT,PULL,3/5] MediaTek ARM64 DTS updates for v6.19
Date: Tue, 11 Nov 2025 10:55:38 +0100
Message-ID: <20251111095542.13958-3-angelogioacchino.delregno@collabora.com>
X-Mailer: git-send-email 2.51.1
In-Reply-To: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
References: <20251111095542.13958-1-angelogioacchino.delregno@collabora.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251111_015553_299568_43844FD7 
X-CRM114-Status: GOOD (  14.04  )
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

The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mediatek/linux.git tags/mtk-dts64-for-v6.19

for you to fetch changes up to 9b2d2beaefcfa17259fdbce16d59d660894147cb:

  arm64: dts: mediatek: mt7981b-openwrt-one: Enable software leds (2025-11-06 10:06:52 +0100)

----------------------------------------------------------------
MediaTek ARM64 Device Tree updates

This adds support for new boards and variants based on different
already supported MediaTek SoCs, and improves support for current
boards.

In particular:
 - New machines:
    - MT7988 BananaPi R4 Pro eMMC and SD router board with support
      for both Key-M and Key-E M.2 slots through DTB Overlays
    - MT8370 Grinn GenioSBC-510 (GenioSOM-510 + GenioBoard Edge AI)
    - MT8390 Grinn GenioSBC-700 (GenioSOM-700 + GenioBoard Edge AI)
 - New variant: MT8395 MediaTek Genio 1200 EVK with UFS

...preparation for new SoCs (MT8196 Kompanio Ultra, a clone of the
   MT6991 Dimensity 9400, and MT6878 Dimensity 7300) with the
   addition of GCE/PIO definitions

...improvements for already supported SoCs and machines:
 - MT7622/7981b/7986a/7988a gain support for reading SoC UUID from
   eFuse, used to generate a persistent MAC address on boards that
   don't have any factory-assigned addresses.
 - MT7986 BananaPi R3 gets changes to its default fan PWM speed to
   improve compatibility with cheaper fans (usually coming with the
   heatsink+fan combos)
 - The MT7981b OpenWRT One router sees general support improvements
   with the enablement of its UART-0 console and correct pinmuxing
   for the same, addition of reserved memory for Trusted Firmware A,
   its SPI NOR Flash (for recovery system, WiFi eeprom data and ETH
   MAC address from factory), and board LEDs.
 - MT8365 gets support for its Mali G52 MC1 GPU, which gets enabled
   in the MediaTek Genio 350 EVK board

...and a dt-bindings warning fix for MT8183 machines through trivial
changes to rename the audiosys and afe nodes to reflect bindings.

----------------------------------------------------------------
Bartosz Bilas (1):
      arm64: dts: mediatek: mt8370-grinn-genio-510-sbc: Add Grinn GenioSBC-510

Bryan Hinton (2):
      arm64: dts: mediatek: mt7981b: add labels for UART0/1/2 nodes
      arm64: dts: mediatek: mt7981b: OpenWrt One: set console UART to 115200

Daniel Golle (4):
      arm64: dts: mediatek: mt7622: add 'soc-uuid' cell to efuse
      arm64: dts: mediatek: mt7986a: add 'soc-uuid' cell to efuse
      arm64: dts: mediatek: mt7981b: add 'soc-uuid' cell to efuse
      arm64: dts: mediatek: mt7988a: add 'soc-uuid' cell to efuse

Frank Wunderlich (5):
      dt-bindings: arm: mediatek: add BPI-R4 Pro board
      arm64: dts: mediatek: mt7988: Disable 2.5G phy and enable at board layer
      arm64: dts: mediatek: mt7988: Add devicetree for BananaPi R4 Pro
      arm64: dts: mediatek: mt7988a-bpi-r4-pro: Add PCIe overlays
      arm64: dts: mediatek: mt7988a-bpi-r4pro: Add mmc overlays

Igor Belwon (1):
      arm64: dts: mediatek: Add MT6878 pinmux macro header file

Jason-JH Lin (1):
      arm64: dts: mediatek: Add GCE header for MT8196

Julien Massot (1):
      arm64: dts: mt8183: Rename nodes to match audiosys DT schema

Louis-Alexis Eyraud (2):
      arm64: dts: mediatek: mt8365: Add GPU support
      arm64: dts: mediatek: mt8365-evk: Enable GPU support

Macpaul Lin (3):
      dt-bindings: arm64: mediatek: add mt8395-evk-ufs board
      arm64: dts: mediatek: mt8395-genio-1200-evk: Move common parts to dtsi
      arm64: dts: mediatek: add device-tree for Genio 1200 EVK UFS board

Mateusz Koza (1):
      arm64: dts: mediatek: mt8390-genio-700-evk: Add Grinn GenioSBC-700

Mikhail Kshevetskiy (1):
      arm64: dts: mediatek: mt7986-bpi-r3: Change fan PWM value for mid speed

Nícolas F. R. A. Prado (1):
      arm64: dts: mediatek: mt8395-genio-1200-evk: Describe CPU supplies

Sjoerd Simons (4):
      arm64: dts: mediatek: mt7981b: Configure UART0 pinmux
      arm64: dts: mediatek: mt7981b: Add reserved memory for TF-A
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable SPI NOR
      arm64: dts: mediatek: mt7981b-openwrt-one: Enable software leds

 Documentation/devicetree/bindings/arm/mediatek.yaml                |    7 +
 arch/arm64/boot/dts/mediatek/Makefile                              |   11 +
 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h                      | 1201 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7622.dtsi                           |    4 +
 arch/arm64/boot/dts/mediatek/mt7981b-openwrt-one.dts               |  150 ++++++++
 arch/arm64/boot/dts/mediatek/mt7981b.dtsi                          |   35 +-
 arch/arm64/boot/dts/mediatek/mt7986a-bananapi-bpi-r3.dts           |    2 +-
 arch/arm64/boot/dts/mediatek/mt7986a.dtsi                          |    4 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-2g5.dts       |    1 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts    |   16 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts    |   16 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso |   20 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso |   20 +
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso |   33 ++
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso   |   31 ++
 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi      |  534 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt7988a.dtsi                          |    7 +-
 arch/arm64/boot/dts/mediatek/mt8183.dtsi                           |    4 +-
 arch/arm64/boot/dts/mediatek/mt8196-gce.h                          |  612 ++++++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8365-evk.dts                        |    9 +
 arch/arm64/boot/dts/mediatek/mt8365.dtsi                           |   43 ++-
 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts        |   20 +
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts        |   20 +
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi           |  538 +++++++++++++++++++++++++++
 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi           |  210 +++++++++++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts         |   29 ++
 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk.dts             | 1189 +----------------------------------------------------------
 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi              | 1230 +++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 28 files changed, 4798 insertions(+), 1198 deletions(-)
 create mode 100644 arch/arm64/boot/dts/mediatek/mt6878-pinfunc.h
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-4e.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-8x.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn15.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-cn18.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-emmc.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro-sd.dtso
 create mode 100644 arch/arm64/boot/dts/mediatek/mt7988a-bananapi-bpi-r4-pro.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8196-gce.h
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8370-grinn-genio-510-sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-700-sbc.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-sbc.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8390-grinn-genio-som.dtsi
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-1200-evk-ufs.dts
 create mode 100644 arch/arm64/boot/dts/mediatek/mt8395-genio-common.dtsi


