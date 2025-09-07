Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 51439CA101F
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Sep 2025 16:50:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=DxYdsQTsC+LiqXQrtNDt0Q7rxh0PmUohJegAYm8Teqs=; b=4NTwnzuQkWkYyWusmfHnoarlZS
	ybkilr6Ib5hx9BRNNaNjPiZvW9QJSdlnGF61gJrPWzSqlZSd86xLoPU3yPSw3m1JZopBG1wjrVHdn
	3R4nfehUcIHeodMqZWGv7kGimdyud3z6MmGw6SWvpBON4ZFDoSM4e8idZTwVIv207zaHSXtHL6ouO
	cbu4EmXPxy1Fuql8MpwKhNnulLVFxdE7FBUpTmWQQpLJp6b90OUopYWGAfCk3BiGIoCuVriY0oNrn
	4uTUMfA/0isyFBCmy1IEmeBobbA7BhbAi8qU4+pR6bxDKkVHPeOTz72o428jY7111/7ziYqhjk4Rl
	scrDfQDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvIav-0000000By9z-45lR;
	Sun, 07 Sep 2025 16:50:25 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvIY4-0000000Bx0B-2M6C;
	Sun, 07 Sep 2025 16:47:29 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=DxYdsQTsC+LiqXQrtNDt0Q7rxh0PmUohJegAYm8Teqs=; b=WHvMZsv+++xTLcr73nh/txzRb3
	uAzZXC2Eqc9UsJQSlJ86DgttW0ULEQrLoXSPQskPSqahECon8+KWnNd43DeSqj1OpJDgwbni2TIdy
	mvixihM9/XBfz6TCixsm+tqJS3zs1N6VL/rKFSoaTHYWZmEzNb/D1G80sSk3d7LXrRyAC3wXDqxuI
	uZHdQcQF628UtwMfUBN6Ep87TeE/Zy3CtQIunFubfbPMD2rEZYoehFuQp1tyi9N5HViu6/LgENtYC
	DWt17oVYGTNiQMK1pXbtFEEnRFUuodRzM8C5VPzlNj0brTwrzpQZAALOejIwjEmV6a7r63CYsc1t7
	nWKz8Emw==;
Received: from [61.8.147.163] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uvIY1-00049V-43; Sun, 07 Sep 2025 18:47:25 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.18 #1
Date: Sun, 07 Sep 2025 18:47:23 +0200
Message-ID: <5241735.C4sosBPzcN@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250907_094728_925539_F691A10A 
X-CRM114-Status: GOOD (  17.00  )
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

Hi soc maintainers,

please find below and in the next mail Rockchip changes for for 6.18 .


Please pull.
Thanks
Heiko


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-dts64-1

for you to fetch changes up to 07c53a9e970712b1a479dd0ec4adfe184482c22f:

  arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX (2025-09-02 08:32:26 +0200)

----------------------------------------------------------------
New boards: FriendlyElec NanoPi Zero2, ArmSoM Sige1, Radxa ROCK 2A/2F,
HINLINK H66K / H68K .

Interesting new peripherals: I guess the most interesting one is likely
the NPU on RK3588. The rocket driver has been merged into both the DRM
tree as well as mainline Mesa.
Other stll interesting ones are DW-Displayport on RK3588, DSI on RK3576
(missing soc pwm-support to be useful on most boards), thermal support
and watchdog on RK3576.

The rest peripheral additions on a number of boards (Beelink A1,
Pine{phone,book}, rk3576-evb1-v10, Rock 5*, ...)

----------------------------------------------------------------
Alex Bee (3):
      arm64: dts: rockchip: add IR receiver to rk3328-roc
      arm64: dts: rockchip: add SPDIF audio to Beelink A1
      arm64: dts: rockchip: add USB3 on Beelink A1

Alexey Charkov (3):
      arm64: dts: rockchip: Add RTC on rk3576-evb1-v10
      arm64: dts: rockchip: Add WiFi on rk3576-evb1-v10
      arm64: dts: rockchip: Add Bluetooth on rk3576-evb1-v10

Andy Yan (4):
      arm64: dts: rockchip: Add DP0 for rk3588
      arm64: dts: rockchip: Add DP1 for rk3588
      arm64: dts: rockchip: Enable DisplayPort for rk3588s Cool Pi 4B
      arm64: dts: rockchip: Enable DP2HDMI for ROCK 5 ITX

Anton Kirilov (2):
      arm64: dts: rockchip: Enable HDMI audio output for NanoPi R6C/R6S
      arm64: dts: rockchip: Enable the NPU on NanoPi R6C/R6S

Chaoyi Chen (1):
      arm64: dts: rockchip: Enable eMMC on rk3576-evb1-v10

Chukun Pan (5):
      arm64: dts: rockchip: set LAN LEDs to default-off on Radxa E52C
      dt-bindings: vendor-prefixes: Add HINLINK
      dt-bindings: arm: rockchip: Add HINLINK H66K / H68K
      arm64: dts: rockchip: Add HINLINK H68K
      arm64: dts: rockchip: Add HINLINK H66K

Heiko Stuebner (6):
      arm64: dts: rockchip: convert rk3528 power-domains to dt-binding constants
      dt-bindings: soc: rockchip: add rk3576 mipi dcphy syscon
      arm64: dts: rockchip: add mipi-dcphy to rk3576
      arm64: dts: rockchip: add the dsi controller to rk3576
      arm64: dts: rockchip: add vcc3v3-lcd-s0 regulator to roc-rk3576-pc
      dt-bindings: soc: rockchip: add missing clock reference for rk3576-dcphy syscon

Jimmy Hon (1):
      arm64: dts: rockchip: enable NPU on OPI5/5B

Jonas Karlman (7):
      arm64: dts: rockchip: Enable more power domains for RK3528
      dt-bindings: arm: rockchip: Add Radxa ROCK 2A/2F
      arm64: dts: rockchip: Add Radxa ROCK 2A/2F
      dt-bindings: arm: rockchip: Add ArmSoM Sige1
      arm64: dts: rockchip: Add ArmSoM Sige1
      dt-bindings: arm: rockchip: Add FriendlyElec NanoPi Zero2
      arm64: dts: rockchip: Add FriendlyElec NanoPi Zero2

Kyle Petryszak (1):
      arm64: dts: rockchip: Add green power LED to rk3588s-rock-5a

Maud Spierings (2):
      arm64: dts: rockchip: Enable HDMI receiver on orangepi 5 plus
      arm64: dts: rockchip: Enable the NPU on the orangepi 5 boards

Nicolas Frattaroli (4):
      arm64: dts: rockchip: Add thermal nodes to RK3576
      arm64: dts: rockchip: Add thermal trim OTP and tsadc nodes
      arm64: dts: rockchip: add pd_npu label for RK3588 power domains
      arm64: dts: rockchip: enable NPU on ROCK 5B

Peter Robinson (2):
      arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro
      arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro

Sebastian Reichel (2):
      arm64: dts: rockchip: add USB-C support for ROCK 5B/5B+/5T
      arm64: dts: rockchip: Enable RK3576 watchdog

Tomeu Vizoso (2):
      arm64: dts: rockchip: Add nodes for NPU and its MMU to rk3588-base
      arm64: dts: rockchip: Enable the NPU on quartzpro64

Yao Zi (1):
      arm64: dts: rockchip: Add naneng-combphy for RK3528

 .../devicetree/bindings/arm/rockchip.yaml          |  24 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |   2 +
 .../devicetree/bindings/vendor-prefixes.yaml       |   2 +
 arch/arm64/boot/dts/rockchip/Makefile              |   6 +
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |  28 +
 arch/arm64/boot/dts/rockchip/rk3328-roc.dtsi       |  13 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  18 +
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  18 +
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts      | 464 ++++++++++++++
 .../boot/dts/rockchip/rk3528-nanopi-zero2.dts      | 340 +++++++++++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi    | 293 +++++++++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts    |  82 +++
 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts    |  10 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  77 ++-
 .../boot/dts/rockchip/rk3568-hinlink-h66k.dts      |  10 +
 .../boot/dts/rockchip/rk3568-hinlink-h68k.dts      |  83 +++
 .../boot/dts/rockchip/rk3568-hinlink-opc.dtsi      | 666 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 127 ++++
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |  16 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 272 ++++++++-
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts |   4 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      | 123 +++-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |  30 +
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |  17 +
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |  56 ++
 .../arm64/boot/dts/rockchip/rk3588-quartzpro64.dts |  30 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |  61 ++
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   | 190 ++++++
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  12 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  12 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  14 +
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |  37 ++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  42 ++
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |  34 ++
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |   7 +
 35 files changed, 3200 insertions(+), 20 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-nanopi-zero2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2a.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-rock-2f.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-hinlink-h68k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi




