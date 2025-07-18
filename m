Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84D56C83F34
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Jul 2025 21:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p0AQ/pfCwCFwh7DZjPjtzQLjW1PeoXmZB6t7fDajNAI=; b=wGPo61C1Didnve/pD89wa9ueW9
	lJTCWECPj+KCuWE6ToJZXW/+BTxFduZUAuiBWIh3cWi7a7Wu0xNiG4hteHFlj1k9ENbKLk1HXFD1T
	dduSsB2LyKAY9H4jxqIF7aC6NHuWdi5/Wo93V+zQvjFNC3w24Cjj36BQ4W3zNFqlcQ3yiGxV8h+Sk
	z1LNpKeN0tEHlOdSX1FIJ+mz4y4VTSwYUrpsRy6hQHRJmM5aqJjuVLQuCvSRgRlz3xetjK9a9WTmh
	gjds7+EXNr5aCt5/hlmnN6Mpa07FoD+fpMfFR7TG3GS10HvNbR0/ZkYva+PCfOVh7cF1/WUmBFdga
	ZuQZiF9Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsM1-0000000DSRX-1HxZ;
	Fri, 18 Jul 2025 21:10:53 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ucsGU-0000000DS42-36X3;
	Fri, 18 Jul 2025 21:05:11 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=p0AQ/pfCwCFwh7DZjPjtzQLjW1PeoXmZB6t7fDajNAI=; b=CDct+Af1Mv3r59/nKIRFbz2Q/b
	ki0sFoOhX06FEnQ0HGrd0viEnh2epIWmv28HaRdpav2DY/cma8yN5EjZxesB2SWLpAMSUfGoQeMug
	tt8/tXpIRZp/GsL8Go8X7eoLLAjq8A4p1rljbiY+DLQlbbaPPquGO3QKE1qqjVeeHEbNCfR8Zl8yJ
	Gzknghi3YOqcFwfKo1nTAYfT/RKDaSv+NEPkiQYmHwUzRK+GXC5brXi5TDzyHyQyYezIK5Y2BCl9F
	qRZVhNX8xeUyHX0vs5w5exCBO/3X0NAIxUefQxDfR/PtIt0mIVcTx4J9Wxbz3gYGm48jt2Soq9EMS
	JX6K98kQ==;
Received: from cst-prg-35-241.cust.vodafone.cz ([46.135.35.241] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1ucsGT-0007G6-CH; Fri, 18 Jul 2025 23:05:09 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.17 #2
Date: Fri, 18 Jul 2025 23:05:08 +0200
Message-ID: <11552292.NyiUUSuA9g@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250718_140510_792060_7A022B29 
X-CRM114-Status: GOOD (  16.32  )
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

please find below some more Rockchip 64bit dt changes for for 6.17 .
To go on top of the first set.


Please pull.
Thanks
Heiko


The following changes since commit 6e3071f4e03997ca0e4388ca61aa06df2802dcd1:

  arm64: dts: rockchip: Enable eMMC HS200 mode on Radxa E20C (2025-06-30 11:44:12 +0200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-dts64-2

for you to fetch changes up to 07e04c071a35abe12957b575cd1453ccafc02eb6:

  arm64: dts: rockchip: Add maskrom button to NanoPi R5S + R5C (2025-07-17 10:52:16 +0200)

----------------------------------------------------------------
New board: FriendlyElec NanoPi M5
Camera support for the PinePhone Pro.
A bunch of cleanups to make DTC happier, fix ordering of DMA uart
channels on rk3528 and some video output enablement as well as some
button definitions.
An interesting tidbit is the reset behaviour addition in that some
boards have specific requirements as to how the PMIC needs to do the
restart. DT-maintainers did not consider the header with helper-constants
as part of the binding, so that header ended up in the Rockchip directory

----------------------------------------------------------------
Andy Yan (1):
      arm64: dts: rockchip: Enable mipi dsi on rk3568-evb1-v10

Detlev Casanova (1):
      arm64: dts: rockchip: Add UFS support on the ROCK 4D

Diederik de Haas (12):
      arm64: dts: rockchip: Add rtc0 alias for NanoPi R5S + R5C
      arm64: dts: rockchip: Add reset button to NanoPi R5S
      arm64: dts: rockchip: Move dsi address+size-cells from SoC to px30 boards
      arm64: dts: rockchip: Move dsi address+size-cells from SoC to rk3399 boards
      arm64: dts: rockchip: Simplify VOP port definition on rk3328
      arm64: dts: rockchip: Simplify edp endpoints on several rk3399 boards
      arm64: dts: rockchip: Simplify mipi_out endpoint on rk3399 RP64 dtso
      arm64: dts: rockchip: Move mipi_out node on rk3399 haikou demo dtso
      arm64: dts: rockchip: Fix LCD panel port on rk3566-pinetab2
      arm64: dts: rockchip: Drop unneeded address+size-cells on px30
      arm64: dts: rockchip: Drop regulator-compatible property on rk3399
      arm64: dts: rockchip: Add maskrom button to NanoPi R5S + R5C

John Clark (2):
      dt-bindings: arm: rockchip: add FriendlyElec NanoPi M5 board
      arm64: dts: rockchip: Add FriendlyElec NanoPi M5 support

Jonas Karlman (2):
      arm64: dts: rockchip: Fix pinctrl node names for RK3528
      arm64: dts: rockchip: Fix UART DMA support for RK3528

Nicolas Frattaroli (4):
      arm64: dts: rockchip: adjust dcin regulator on ROCK 4D
      arm64: dts: rockchip: complete USB nodes on ROCK 4D
      arm64: dts: rockchip: theoretically enable Wi-Fi on ROCK 4D
      arm64: dts: rockchip: add HDMI audio on ROCK 4D

Olivier Benjamin (2):
      arm64: dts: rockchip: describe I2c Bus 1 and IMX258 world camera on PinePhone Pro
      arm64: dts: rockchip: describe the OV8858 user camera on PinePhone Pro

Quentin Schulz (3):
      arm64: dts: rockchip: add header for RK8XX PMIC constants
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Jaguar
      arm64: dts: rockchip: force PMIC reset behavior to restart PMU on RK3588 Tiger

Sebastian Reichel (2):
      arm64: dts: rockchip: fix PHY handling for ROCK 4D
      arm64: dts: rockchip: Enable HDMI receiver on RK3588 EVB1

 .../devicetree/bindings/arm/rockchip.yaml          |   6 +
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../dts/rockchip/px30-cobra-ltk050h3146w-a2.dts    |   2 +
 .../boot/dts/rockchip/px30-cobra-ltk050h3146w.dts  |   2 +
 .../boot/dts/rockchip/px30-cobra-ltk050h3148w.dts  |   2 +
 .../boot/dts/rockchip/px30-cobra-ltk500hd1829.dts  |   2 +
 arch/arm64/boot/dts/rockchip/px30-evb.dts          |   2 +
 .../dts/rockchip/px30-pp1516-ltk050h3146w-a2.dts   |   2 +
 .../boot/dts/rockchip/px30-pp1516-ltk050h3148w.dts |   2 +
 arch/arm64/boot/dts/rockchip/px30.dtsi             |   6 -
 .../boot/dts/rockchip/rk3326-anbernic-rg351m.dtsi  |   2 +
 .../boot/dts/rockchip/rk3326-gameforce-chi.dts     |   2 +
 arch/arm64/boot/dts/rockchip/rk3326-odroid-go.dtsi |   2 +
 arch/arm64/boot/dts/rockchip/rk3328.dtsi           |   6 +-
 arch/arm64/boot/dts/rockchip/rk3399-base.dtsi      |   4 -
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |  15 +-
 .../boot/dts/rockchip/rk3399-gru-scarlet.dtsi      |   4 +-
 arch/arm64/boot/dts/rockchip/rk3399-hugsun-x99.dts |   2 -
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  15 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     | 141 +++
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    |  12 +-
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |   2 -
 .../boot/dts/rockchip/rk3399-rockpro64-screen.dtso |  22 +-
 .../dts/rockchip/rk3399-sapphire-excavator.dts     |  16 +-
 arch/arm64/boot/dts/rockchip/rk3528-pinctrl.dtsi   |  20 +-
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |  16 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi  |   6 +-
 arch/arm64/boot/dts/rockchip/rk3568-evb1-v10.dts   |  66 +-
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |  19 +
 .../arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dtsi |  15 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  | 941 +++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    | 101 ++-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |  17 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |   2 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |   2 +
 arch/arm64/boot/dts/rockchip/rk8xx.h               |  18 +
 36 files changed, 1387 insertions(+), 108 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk8xx.h




