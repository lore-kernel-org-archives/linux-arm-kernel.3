Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CC6D0C3ABD8
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 18 May 2025 09:16:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=BNXyBGuoJC4ONR3bPoLfKKuzOJ3jcXvPaWtk/2/Z8mU=; b=odyr8PMyo3l+Dg3Rw8cxYmoDx6
	k6YolmwzNO3DCWvlMIgPF2u22sgjn0baW/9XiT8aPPtApB476oZrARCpc8j545oT8VHfVbPPXLKgp
	S31aqH4nLStPVjjpJL2RkyJii5p5CmFqQT4RNcnXHf1vT1nAb9NfyQUMqawHzigIfTubVrab2w6kz
	wK8PrkHIJIy7rLf6icuA0T0csgrd/tkcg2VmeN2sJCb8LuFUTJDhSx3S18vrEwsAnO+VrS8qwoB9a
	rH4/dQx4YshP3uNHOpSp6UZuvVFCHdygVKXY1XrLEPE8OqA0InzMLMAk87aP8yrhUB2Uf62uhunYu
	ckwtJZAQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGa7x-00000006wGa-40Up;
	Sun, 18 May 2025 09:16:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uGa5x-00000006w9p-22bl;
	Sun, 18 May 2025 09:14:10 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=BNXyBGuoJC4ONR3bPoLfKKuzOJ3jcXvPaWtk/2/Z8mU=; b=crynOXSZ3VXIllU58NSl5JJUDr
	zrclRfp1E4xkqk+UYx4bt2psKRH9Gcik8IHVq5jMasoB7ZgflfAC+P1tOd+VqA/mQwR69RCgKBhST
	PdgeWks/wVtoPVARTbFwMzOPUqdaxKH4NvSOK0usRkI7FwdS43DPZs8IdbdZEZe3Geajwl1Y4rqRN
	Wce3AcFOeHxE7YFQMkN8rhS7+fiXZPc/N01bKv5Oa5uOBKc9j4mLph3jIJRdoljZ0bUmVt5W0Ijo7
	QduP42dBqV7AvbQllaKAvqObnxqm+nDeOCgj+EnVlOZY+aCzcK3+WnExDMQ9/PzaLcfjrJulRkJEH
	QpJqPvYA==;
Received: from i53875a50.versanet.de ([83.135.90.80] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uGa5w-0002GA-8d; Sun, 18 May 2025 11:14:08 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.16 #2
Date: Sun, 18 May 2025 11:14:07 +0200
Message-ID: <3998939.iIbC2pHGDl@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250518_021409_681986_788294BB 
X-CRM114-Status: GOOD (  15.35  )
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

please find below and in the next PR some more
Rockchip changes aimed at 6.16 .

Please pull.

Thanks
Heiko


The following changes since commit a706a593cb19796f31d3a888423ef1a71885ae72:

  arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3566-rock3c (2025-05-07 08:31:09 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dts64-2

for you to fetch changes up to 1631cbdb808963354ef6b6454bc617cd15f90718:

  arm64: dts: rockchip: Improve LED config for NanoPi R5S (2025-05-15 14:57:44 +0200)

----------------------------------------------------------------
New SoC the RK3562 (4xA53, Mali-G52) with one evaluation board.
New boards:
 - Cobra and PP1516 from Theobroma-Systems (build around the PX30)
 - Radxa Rock 5B+ (rk3588)
 - Rockchip RK3399 industrial eval board
New peripherals:
 - GMAC + SDMMC/SDIO on rk3528
 - SAI + HDMI-audio on rk3576
Interesting general updates:
 - move rk3528 i2c + uart aliases as requested
 - rk3568 PCIe3 MSI to use GIC ITS
 - update deprecated dwmac reset properties on some px30 boards
 - updates for cypress usb hubs on some Theobroma boards
   Binding taken with Greg's blessing
   https://lore.kernel.org/all/2025051550-polish-prude-ed56@gregkh/

----------------------------------------------------------------
Chaoyi Chen (2):
      dt-bindings: arm: rockchip: Add rk3399 industry evaluation board
      arm64: dts: rockchip: Add rk3399-evb-ind board

Chukun Pan (1):
      arm64: dts: rockchip: Move rk3568 PCIe3 MSI to use GIC ITS

Diederik de Haas (1):
      arm64: dts: rockchip: Improve LED config for NanoPi R5S

FUKAUMI Naoki (1):
      dt-bindings: arm: rockchip: Add Radxa ROCK 5B+

Finley Xiao (2):
      arm64: dts: rockchip: add core dtsi for RK3562 SoC
      arm64: dts: rockchip: Add RK3562 evb2 devicetree

Heiko Stuebner (9):
      Merge branch 'v6.16-shared/clkids' into v6.16-armsoc/dts64
      arm64: dts: rockchip: drop wrong spdif clock from edp1 on rk3588
      arm64: dts: rockchip: move rk3528 i2c+uart aliases to board files
      arm64: dts: rockchip: add basic mdio node to px30
      arm64: dts: rockchip: move reset to dedicated eth-phy node on ringneck
      dt-bindings: arm: rockchip: add PX30-Cobra boards from Theobroma Systems
      arm64: dts: rockchip: add px30-cobra base dtsi and board variants
      dt-bindings: arm: rockchip: add PX30-PP1516 boards from Theobroma Systems
      arm64: dts: rockchip: add px30-pp1516 base dtsi and board variants

Jonas Karlman (2):
      arm64: dts: rockchip: Add GMAC nodes for RK3528
      arm64: dts: rockchip: Enable Ethernet controller on Radxa E20C

Kever Yang (3):
      dt-bindings: rockchip: pmu: Add rk3562 compatible
      dt-bindings: soc: rockchip: Add rk3562 syscon compatibles
      dt-bindings: arm: rockchip: Add rk3562 evb2 board

Lukasz Czechowski (2):
      dt-bindings: usb: cypress,hx3: Add support for all variants
      arm64: dts: rockchip: fix internal USB hub instability on RK3399 Puma

Nicolas Frattaroli (5):
      dt-bindings: clock: rk3576: add IOC gated clocks
      arm64: dts: rockchip: Add RK3576 SAI nodes
      arm64: dts: rockchip: Add RK3576 HDMI audio
      arm64: dts: rockchip: Add analog audio on RK3576 Sige5
      arm64: dts: rockchip: Enable HDMI audio on Sige5

Peter Robinson (1):
      arm64: dts: rockchip: Update eMMC for NanoPi R5 series

Quentin Schulz (2):
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma
      arm64: dts: rockchip: disable unrouted USB controllers and PHY on RK3399 Puma with Haikou

Sebastian Reichel (2):
      arm64: dts: rockchip: move rock 5b to include file
      arm64: dts: rockchip: add Rock 5B+

Yao Zi (3):
      dt-bindings: clock: Add GRF clock definition for RK3528
      arm64: dts: rockchip: Add SDMMC/SDIO controllers for RK3528
      arm64: dts: rockchip: Enable SD-card interface on Radxa E20C

 .../devicetree/bindings/arm/rockchip.yaml          |   33 +
 .../devicetree/bindings/arm/rockchip/pmu.yaml      |    2 +
 .../devicetree/bindings/soc/rockchip/grf.yaml      |    7 +
 .../devicetree/bindings/usb/cypress,hx3.yaml       |   19 +-
 arch/arm64/boot/dts/rockchip/Makefile              |    9 +
 .../dts/rockchip/px30-cobra-ltk050h3146w-a2.dts    |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk050h3146w.dts  |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk050h3148w.dts  |   39 +
 .../boot/dts/rockchip/px30-cobra-ltk500hd1829.dts  |   73 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi       |  566 +++++
 .../dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts   |   39 +
 .../boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts |   39 +
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |  602 +++++
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |   22 +-
 arch/arm64/boot/dts/rockchip/px30.dtsi             |    6 +
 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts    |  494 ++++
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    8 -
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   48 +-
 arch/arm64/boot/dts/rockchip/rk3528-radxa-e20c.dts |   62 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  190 +-
 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts   |  456 ++++
 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi   | 2352 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3562.dtsi           | 1185 ++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |   18 +-
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |    5 +-
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    8 +-
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |   64 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  217 ++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    4 +-
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  113 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts    |  953 +-------
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi   |  945 ++++++++
 include/dt-bindings/clock/rockchip,rk3528-cru.h    |    6 +
 include/dt-bindings/clock/rockchip,rk3576-cru.h    |   10 +
 34 files changed, 7664 insertions(+), 1008 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3146w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra-ltk500hd1829.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-evb2-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562-pinctrl.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3562.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b-plus.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dtsi




