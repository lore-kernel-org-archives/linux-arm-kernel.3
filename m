Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D20FBC28B28
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 12 Mar 2025 07:43:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=DAYHvdmLkVkVHFR2UpbQej7iz26Lgnp2vGaJ5K7rQKc=; b=s6wh4r4p8+ud6WaugMrj8GfOq2
	VfBnmMrQJ7qssOLR+6GiTL2CYlxIUtZ5VSE3+jpbJ1YDnbaTvI4FJceMqndx287Ga2F7Gy8Kksxu8
	GCz9nXuevbVCc7/mHBHZROhj6pU2vcM9dN45lutMgtWQqVdawTyKN8ROAW/WZ0+RSQsfK0YsGrDxn
	24xuwm6vlfRJodgz9uG6BgNQU/TcDrtimKXXVxMZDdperhsYZCE/33dYXSFHjVYpT7oT8dAyJ55sD
	soE0DrxxmGuTEMniLrhmhjeIF9x9e5qqM4+2YOB5CkMSaR2n+EoKlSUcwjLHotKRdLoUuzq+8Gs2d
	fLma+OJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGk3-00000007jSs-3Juz;
	Wed, 12 Mar 2025 07:43:03 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tsGht-00000007j3R-11gq
	for linux-arm-kernel@lists.infradead.org;
	Wed, 12 Mar 2025 07:40:50 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=From:Subject:Date:Message-Id:MIME-Version; bh=DAYHv
	dmLkVkVHFR2UpbQej7iz26Lgnp2vGaJ5K7rQKc=; b=MlnCyVV9d/I6FHHZuSxdt
	H6vtuWbvojg8LRyh4XzIIJRCuDpfy6HD0DwK/MfbebzOQj69CS47dexgTsa0w63v
	33nvJq8dXADb60gRLJfr3Az6WD6EoGMXZyuYtEipck5ABQiblekdjxX/JGwrQU7N
	3xkzhqFwR9MJjR4S02KbgY=
Received: from localhost.localdomain (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAnwdRtOtFnQ6_FAA--.2767S6;
	Wed, 12 Mar 2025 15:40:32 +0800 (CST)
From: Shawn Guo <shawnguo2@yeah.net>
To: soc@kernel.org,
	arm@kernel.org
Cc: Shawn Guo <shawnguo@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	kernel@pengutronix.de,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL 5/5] i.MX arm64 device tree changes for 6.15
Date: Wed, 12 Mar 2025 15:40:05 +0800
Message-Id: <20250312074005.663165-5-shawnguo2@yeah.net>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20250312074005.663165-1-shawnguo2@yeah.net>
References: <20250312074005.663165-1-shawnguo2@yeah.net>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CM-TRANSID: Ms8vCgAnwdRtOtFnQ6_FAA--.2767S6
X-Coremail-Antispam: 1Uf129KBjvAXoW3ur13GFWxuw1kZr1UAF1xAFb_yoW8Jr45Xo
	WfZFWrAw40kr47WF4jyr9Ykw1Yq3WkWr1IqFWUZryrGw4rZF13A34xur45WrWrJrW5AF95
	W3W7Cr1Yyw45Wryxn29KB7ZKAUJUUUU8529EdanIXcx71UUUUU7v73VFW2AGmfu7bjvjm3
	AaLaJ3UbIYCTnIWIevJa73UjIFyTuYvjxU4puAUUUUU
X-Originating-IP: [117.81.240.4]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgAOZWfRL8cyVAAAsB
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250312_004049_644403_063CE006 
X-CRM114-Status: GOOD (  15.96  )
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

From: Shawn Guo <shawnguo@kernel.org>

The following changes since commit 2014c95afecee3e76ca4a56956a936e23283f05b:

  Linux 6.14-rc1 (2025-02-02 15:39:26 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/shawnguo/linux.git tags/imx-dt64-6.15

for you to fetch changes up to 5a690619426fc4b09c7fd3f40d3a69264ef3db0f:

  arm64: dts: imx8qm-apalis: Remove compatible from SoM dtsi (2025-03-11 11:16:30 +0800)

----------------------------------------------------------------
i.MX arm64 device tree changes for 6.15:

- New board support: S32G-EVB/RDB, i.MX95 15x15 EVK, i.MX8MP Skov
  revC BD500 and new 7" panel board, i.MX8MM phyboard polis PEB-AV-10
- A series from Ahmad Fatoum and Oleksij Rempel to flesh out
  imx8mp-skov device trees, correcting PMIC board limits, adding display
  pipeline, configuring uart1 for RS485, etc.
- A bunch of changes from Alexander Stein, adding PCIe support for
  mba8xx, enabling jpeg encode and decode for tqma8xx, adding vcc-supply
  for spi-nor, etc.
- A series from Chancel Liu to complete WM8960 power supplies for NXP
  i.MX8 based boards
- A dozen of changes from Frank Li, enabling audio codec for imx8qm-mek,
  adding PCIe EP for i.MX8Q, improving i.MX93 and i.MX95 support, etc.
- A number of changes from Frieder Schrempf to support reading SD_VSEL
  signal for imx8m-kontron devices, fix SD card IO voltage control for
  imx93-kontron
- A series from Teresa Remmet to improve imx8mm-phycore support, keeping
  LDO3 on in suspend, adding overlays for devices without Ethernet PHY,
  SPI NOR Flash, etc.
- A couple of changes from Xu Yang to enable usb3 support for
  imx95-19x19-evk board
- Other random improvements and cleanups on various boards

----------------------------------------------------------------
Ahmad Fatoum (12):
      arm64: dts: imx8mp-skov: correct PMIC board limits
      arm64: dts: imx8mp-skov: operate CPU at 850 mV by default
      arm64: dts: imx8mp-skov: use I2C5 for DDC
      arm64: dts: imx8mp-skov: configure uart1 for RS485
      arm64: dts: imx8mp: Add optional nominal drive mode DTSI
      arm64: dts: imx8mp: add fsl,nominal-mode property into nominal.dtsi
      arm64: dts: freescale: imx8mp-skov: configure LDB clock automatically
      arm64: dts: freescale: imx8mp-skov: operate SoC in nominal mode
      arm64: dts: imx8mp-skov: move I2C2 pin control group into DTSI
      arm64: dts: imx8mp-skov: describe I2C bus recovery for all controllers
      arm64: dts: imx8mp-skov: add revC BD500 board
      arm64: dts: imx8mp-skov: support new 7" panel board

Alexander Stein (14):
      arm64: dts: imx8-ss-hsio: Wire up DMA IRQ for PCIe
      arm64: dts: tqma8xx: Add vcc-supply for spi-nor
      arm64: dts: tqma8xx: enable jpeg encode and decode
      arm64: dts: tqma8xx: Remove GPU TODO
      arm64: dts: mba8xx: Add PCIe support
      arm64: dts: freescale: imx93-tqma9352-mba93xxca: sort pinctrl nodes
      arm64: dts: mba93xxca: Do not assert power-down pins
      arm64: dts: tqma9352-mba93xx[cl]a: swap ethernet aliases
      arm64: dts: freescale: tqma8mpql: Add vcc-supply for spi-nor
      arm64: dts: freescale: tqma8mq: Add vcc-supply for spi-nor
      arm64: dts: freescale: tqma8mqml: Add vcc-supply for spi-nor
      arm64: dts: freescale: tqma8mqnl: Add vcc-supply for spi-nor
      arm64: dts: imx8qm-ss-hsio: Wire up DMA IRQ for PCIe
      arm64: dts: mba8xx: Remove invalid property disable-gpio

Andrej Picej (3):
      arm64: dts: imx8mm-phycore-som: Fix bluetooth wakeup source
      arm64: dts: imx8mm-phyboard-polis: Set RTC as wakeup-source
      arm64: dts: imx8mm-phygate-tauri-l: Set RTC as wakeup-source

Chancel Liu (4):
      arm64: dts: imx8mp-evk: Complete WM8960 power supplies
      arm64: dts: imx8dxl-evk: Complete WM8960 power supplies
      arm64: dts: imx8qm-mek: Complete WM8960 power supplies
      arm64: dts: imx8qxp-mek: Complete WM8960 power supplies

Ciprian Marian Costea (4):
      arm64: dts: s32g: add I2C[0..2] support for s32g2 and s32g3
      arm64: dts: s32g: add common 'S32G-EVB' and 'S32G-RDB' board support
      arm64: dts: s32g399a-rdb3: Add INA231 sensor entry over I2C4
      arm64: dts: s32g: add FlexCAN[0..3] support for s32g2 and s32g3

Dominik Haller (1):
      arm64: dts: imx8mm-phycore-som: Add overlay for rproc

Fabio Estevam (1):
      arm64: dts: imx8mn-bsh-smm-s2pro: Remove invalid audio codec clock

Francesco Dolcini (2):
      arm64: dts: freescale: imx8mm-verdin: Remove LVDS panel and backlight
      arm64: dts: imx8qm-apalis: Remove compatible from SoM dtsi

Frank Li (12):
      arm64: dts: imx8mq-librem5: remove undocument property 'extcon' for usb-pd@3f
      arm64: dts: imx8qm-mek: add audio-codec cs42888 and related nodes
      arm64: dts: imx8-ss-hsio: fix indentation in pcie node
      arm64: dts: imx8q: add PCIe EP for i.MX8QM and i.MX8QXP
      arm64: dts: imx8q: add PCIe EP overlay file for i.MX8QXP mek board
      arm64: dts: imx95: add PCIe's msi-map and iommu-map property
      arm64: dts: imx95: Add #io-channel-cells = <1> for adc node
      arm64: dts: imx95: Add i3c1 and i3c2
      arm64: dts: imx95: Add imx95-15x15-evk support
      arm64: dts: im8mq-librem5: move dwc3 usb port under ports
      arm64: dts: imx95: add ref clock for pcie nodes
      arm64: dts: imx93: add ddr edac support

Frieder Schrempf (3):
      arm64: dts: imx8mm-kontron: Add support for reading SD_VSEL signal
      arm64: dts: imx93-kontron: Fix SD card IO voltage control
      arm64: dts: imx8mp-kontron: Add support for reading SD_VSEL signal

Janine Hagemann (1):
      arm64: dts: imx8mm-phyboard-polis: Add overlay for PEB-EVAL-01

Larisa Grigore (1):
      arm64: dts: s32g: add the eDMA nodes

Laurentiu Mihalcea (2):
      arm64: dts: imx8mp: add AUDIO_AXI_CLK_ROOT to AUDIOMIX block
      arm64: dts: imx8mp: change AUDIO_AXI_CLK_ROOT freq. to 800MHz

Lucas Stach (1):
      arm64: dts: imx8mp: configure GPU and NPU clocks to overdrive rate

Markus Niebel (2):
      arm64: dts: imx8mp-tqma8mpql-mba8mpxl: change sound card model name
      arm64: dts: mba8mx: change sound card model name

Mathew McBride (1):
      arm64: dts: freescale: ten64: add usb hub definition

Oleksij Rempel (6):
      arm64: dts: imx8mp-skov: describe HDMI display pipeline
      arm64: dts: imx8mp-skov: describe LVDS display pipeline
      arm64: dts: imx8mp-skov: describe mains fail detection
      arm64: dts: imx8mp-skov: fix phy-mode
      arm64: dts: imx8mp-skov: increase I2C clock frequency for RTC
      arm64: dts: imx8mp-skov: add basic board as fallback

Rafael Beims (1):
      arm64: dts: colibri-imx8x: Add missing gpio-line-names

Stefan Eichenberger (1):
      arm64: dts: imx8-apalis: add clock configuration for 44.1 kHz hdmi audio

Teresa Remmet (5):
      arm64: dts: imx8mm-phycore-som: Keep LDO3 on in suspend
      arm64: dts: imx8mm-phycore-som: Remove magic-packet property
      arm64: dts: imx8mm-phyboard-polis: Add support for PEB-AV-10
      arm64: dts: imx8mm-phycore-som: Add no-eth phy overlay
      arm64: dts: imx8mm-phycore-som: Add overlay to disable SPI NOR flash

Xu Yang (2):
      arm64: dts: imx95: add usb3 related nodes
      arm64: dts: imx95-19x19-evk: add typec nodes and enable usb3 node

Yannic Moog (3):
      arm64: dts: imx8mm-phycore-som: add descriptions to nodes
      arm64: dts: imx8mm-phyboard-polis: add RTC description
      arm64: dts: imx8mm: move bulk of rtc properties to carrierboards

Yashwanth Varakala (2):
      arm64: dts: imx8mm-phycore-som: Assign regulator for dsi to lvds bridge
      arm64: dts: imx8mm-phyboard-polis: Assign missing regulator for bluetooth

 arch/arm64/boot/dts/freescale/Makefile             |   21 +
 .../arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts |   44 +
 .../arm64/boot/dts/freescale/imx8-apalis-v1.1.dtsi |   16 +
 arch/arm64/boot/dts/freescale/imx8-ss-hsio.dtsi    |   30 +-
 arch/arm64/boot/dts/freescale/imx8dxl-evk.dts      |   42 +
 .../arm64/boot/dts/freescale/imx8mm-kontron-bl.dts |   10 +-
 .../boot/dts/freescale/imx8mm-kontron-osm-s.dtsi   |    7 +-
 .../freescale/imx8mm-phyboard-polis-peb-av-10.dtso |  237 ++++
 .../imx8mm-phyboard-polis-peb-eval-01.dtso         |   72 ++
 .../dts/freescale/imx8mm-phyboard-polis-rdk.dts    |   17 +-
 .../boot/dts/freescale/imx8mm-phycore-no-eth.dtso  |   12 +
 .../dts/freescale/imx8mm-phycore-no-spiflash.dtso  |   16 +
 .../boot/dts/freescale/imx8mm-phycore-rpmsg.dtso   |   58 +
 .../boot/dts/freescale/imx8mm-phycore-som.dtsi     |   22 +-
 .../boot/dts/freescale/imx8mm-phygate-tauri-l.dts  |   11 +
 .../arm64/boot/dts/freescale/imx8mm-tqma8mqml.dtsi |    1 +
 arch/arm64/boot/dts/freescale/imx8mm-verdin.dtsi   |   21 -
 .../boot/dts/freescale/imx8mn-bsh-smm-s2pro.dts    |    1 -
 .../arm64/boot/dts/freescale/imx8mn-tqma8mqnl.dtsi |    1 +
 arch/arm64/boot/dts/freescale/imx8mp-evk.dts       |   22 +
 .../boot/dts/freescale/imx8mp-kontron-osm-s.dtsi   |    7 +-
 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi  |   64 ++
 .../arm64/boot/dts/freescale/imx8mp-skov-basic.dts |   10 +
 .../arm64/boot/dts/freescale/imx8mp-skov-reva.dtsi |  126 ++-
 .../boot/dts/freescale/imx8mp-skov-revb-hdmi.dts   |   45 +-
 .../boot/dts/freescale/imx8mp-skov-revb-lt6.dts    |   60 ++
 .../freescale/imx8mp-skov-revb-mi1010ait-1cp1.dts  |   30 +-
 .../boot/dts/freescale/imx8mp-skov-revc-bd500.dts  |   91 ++
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts |   81 ++
 .../dts/freescale/imx8mp-tqma8mpql-mba8mpxl.dts    |    2 +-
 .../arm64/boot/dts/freescale/imx8mp-tqma8mpql.dtsi |    1 +
 arch/arm64/boot/dts/freescale/imx8mp.dtsi          |   23 +-
 .../boot/dts/freescale/imx8mq-librem5-devkit.dts   |   25 +-
 arch/arm64/boot/dts/freescale/imx8mq-librem5.dtsi  |   26 +-
 arch/arm64/boot/dts/freescale/imx8mq-tqma8mq.dtsi  |    1 +
 .../boot/dts/freescale/imx8qm-apalis-v1.1.dtsi     |    2 -
 arch/arm64/boot/dts/freescale/imx8qm-apalis.dtsi   |    2 -
 arch/arm64/boot/dts/freescale/imx8qm-mek.dts       |  112 ++
 arch/arm64/boot/dts/freescale/imx8qm-ss-hsio.dtsi  |   24 +-
 .../boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso    |   22 +
 arch/arm64/boot/dts/freescale/imx8qxp-mek.dts      |   32 +
 arch/arm64/boot/dts/freescale/imx8x-colibri.dtsi   |    4 +-
 .../boot/dts/freescale/imx93-kontron-osm-s.dtsi    |    5 +-
 .../dts/freescale/imx93-tqma9352-mba93xxca.dts     |   54 +-
 .../dts/freescale/imx93-tqma9352-mba93xxla.dts     |    6 +-
 arch/arm64/boot/dts/freescale/imx93.dtsi           |    8 +
 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts  | 1130 ++++++++++++++++++++
 arch/arm64/boot/dts/freescale/imx95-19x19-evk.dts  |   83 ++
 arch/arm64/boot/dts/freescale/imx95.dtsi           |  108 +-
 arch/arm64/boot/dts/freescale/mba8mx.dtsi          |    2 +-
 arch/arm64/boot/dts/freescale/mba8xx.dtsi          |   31 +-
 arch/arm64/boot/dts/freescale/s32g2.dtsi           |  141 +++
 arch/arm64/boot/dts/freescale/s32g274a-evb.dts     |    1 +
 arch/arm64/boot/dts/freescale/s32g274a-rdb2.dts    |    1 +
 arch/arm64/boot/dts/freescale/s32g3.dtsi           |  150 +++
 arch/arm64/boot/dts/freescale/s32g399a-rdb3.dts    |    9 +
 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi    |  222 ++++
 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi    |  170 +++
 arch/arm64/boot/dts/freescale/tqma8xx.dtsi         |   12 +-
 59 files changed, 3397 insertions(+), 187 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-av-10.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phyboard-polis-peb-eval-01.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-no-eth.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-no-spiflash.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-phycore-rpmsg.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nominal.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-basic.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx8qxp-mek-pcie-ep.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-15x15-evk.dts
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-evb.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/s32gxxxa-rdb.dtsi


