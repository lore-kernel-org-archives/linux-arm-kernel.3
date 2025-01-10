Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D6196E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 10 Jan 2025 23:59:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=IdVGNC9ihRyCEJa28AxTFiJgmP1qaIyuSvobrf5SOtY=; b=zBy4tcp0f9BGAToS5e6xkzWou4
	trCu1t7gPE9FMBADcx2bviBJsFf3Zr4uFdxC0JJkDNO+nuPL5ZNih3x3juZZx+4xfrJYzxO3eBmx9
	qiuLIsdIpht2pExDzYMjGC7PvT7V/fEzenwi8xqJaYDQOOOfDUOBMVzXxGTcgErTlFAXok9SjaRrM
	+7m4+UGHutv7Zt74IC4jm0RrhQCrmIUskJ2zNYWTPvsKr+e5HeXUxnF6A8d72RngoeAwnufsfxf1y
	8yjQRzH2y3uU+9KzerrxA7jBSvuzAx0XNqixV+7NkeGu6EeQOYuI87JHmrAO8sjlQEdZTD/VAIXEM
	U/lYpNIQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOuU-0000000HKDz-0gVw;
	Fri, 10 Jan 2025 23:59:26 +0000
Received: from desiato.infradead.org ([2001:8b0:10b:1:d65d:64ff:fe57:4e05])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOrH-0000000HJy4-3enX;
	Fri, 10 Jan 2025 23:56:08 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=infradead.org; s=desiato.20200630; h=Content-Type:Content-Transfer-Encoding
	:MIME-Version:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:In-Reply-To:References;
	bh=IdVGNC9ihRyCEJa28AxTFiJgmP1qaIyuSvobrf5SOtY=; b=SGQ7uBBOiv7KspwRiMLEJW3ULQ
	5D7dKER3EoqdcK4ICWMRsg110cz5DUrE1PpyoLmIaZ86/S7ENf/mwAqZToRezL6aOS1t4dJ29A4vI
	feddJ7U2LPizNDyje5aCA8zjyjw730xgbIzRBflS0qBCVJaw6SCv9R4QM3s//9HemWz6T5O87UGFI
	QPvArJqF9oFSMxodKli1OECVhqhKt3B3vXmg+Q5t+pJn/DLK9i+uDhYAQF9/cZs+dzhUNJZvVE2Xn
	krsXBJ7Z5PyD7oly1E0pvURsM5VE6PcdSo2W3631TSQDb5gReo3PGbDX520B8CwlxPuGQrWFW58+z
	6vnDqYUQ==;
Received: from gloria.sntech.de ([185.11.138.130])
	by desiato.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWOrD-00000009wU0-3wzC;
	Fri, 10 Jan 2025 23:56:06 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=IdVGNC9ihRyCEJa28AxTFiJgmP1qaIyuSvobrf5SOtY=; b=ZFsX2dVi/Crk59eyAJ8h9G3L6A
	pRTax6S+InGDCsxYa1c5yy9k/HTWVTW5CqKusH2z+re5OIGVXusgFj1GSbnb1OgcON+MVUdbQ6Oju
	J7Dmp8LpddnVRWc80FzF24CSqiyGf/3SZy33W/jXD/m/x3gupY5ou5WFlE7pNWi8JzNUIivFEwxv/
	5qOfYMnAoHgU0Dn3H8bKqYF6Ct+6q8rJz6aJ6dAEqYB0NXGBhnwr4v5amdkADUPrHjui3i6wvDtkh
	yFiDBZ17yJHBMziGAVwtBRTIvWXqI3DbJM0JpSzUGjKyIBBYGI76ZzYsbxNIJhnHJFOqwTPQCv1ma
	Npp3smqg==;
Received: from i5e860d05.versanet.de ([94.134.13.5] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tWOr9-0000zZ-Dq; Sat, 11 Jan 2025 00:55:59 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.14 #1
Date: Sat, 11 Jan 2025 00:55:54 +0100
Message-ID: <2193001.3Lj2Plt8kZ@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250110_235604_146645_49B15157 
X-CRM114-Status: GOOD (  18.67  )
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

please find below and in a subsequent pull-requests
Rockchip changes for for 6.14 .

Some new boards, two newly supported peripherals and a bunch
of small things happened over the christmas period :-)

So far there haven't been arm32 changes this time around.


Please pull.
Thanks
Heiko


The following changes since commit 40384c840ea1944d7c5a392e8975ed088ecf0b37:

  Linux 6.13-rc1 (2024-12-01 14:28:56 -0800)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.14-rockchip-dts64-1

for you to fetch changes up to ebe82df46fba0f0fe45d7e03ddf5ca0f6e758a06:

  arm64: dts: rockchip: add DTs for Firefly ITX-3588J and its Core-3588J SoM (2025-01-10 00:13:16 +0100)

----------------------------------------------------------------
New boards rk3576-evb1, H96 Max V58 TV Box (rk3588), BigTreeTech CB2
(SoM + baseboard) and Pi2 (SBC), Firefly ITX-3588J (Core-3588J SoM),
Orange Pi 5 Max.

A interesting case is the Radxa E52C using a soc called rk3582. This is
rk3588-variant where some cpu cores are disabled during production and
the bootloader needs to read the available cores from efuses and adapt
the DT it hands over to the kernel.

New supported peripherals are just the naneng combophy + the usb
controllers using them on the rk3576 as well as the arm,smmu attached
to the PCI controller on rk3588.

And finally there are of course a number of board-specific enablements
and refinements (MCU on Qnap-TS433, USB3 on NanoPi R6C/R6S and Orange Pi
5+ etc.

----------------------------------------------------------------
Alexey Charkov (2):
      dt-bindings: arm: rockchip: Add H96 Max V58 TV box
      arm64: dts: rockchip: Add H96 Max V58 TV Box based on RK3588 SoC

Andy Yan (1):
      dt-bindings: soc: rockchip: add rk3576 hdptxphy grf syscon

Anton Kirilov (1):
      arm64: dts: rockchip: Enable the USB 3.0 port on NanoPi R6C/R6S

Chen-Yu Tsai (1):
      arm64: dts: rockchip: Enable USB 3.0 ports on orangepi-5-plus

David Jander (2):
      arm64: dts: rockchip: Remove unused i2c2 node from rk3568-mecsbc
      arm64: dts: rockchip: Add FRAM MB85RS128TY to rk3568-mecsbc

Dragan Simic (1):
      arm64: dts: rockchip: Delete redundant RK3328 GMAC stability fixes

FUKAUMI Naoki (2):
      dt-bindings: arm: rockchip: Add Radxa E52C
      arm64: dts: rockchip: Add Radxa E52C

Frank Wang (1):
      arm64: dts: rockchip: add usb related nodes for rk3576

Heiko Stuebner (2):
      arm64: dts: rockchip: hook up the MCU on the QNAP TS433
      arm64: dts: rockchip: set hdd led labels on QNAP-TS433

Ivan Sergeev (2):
      dt-bindings: arm: rockchip: Add BigTreeTech CB2 and Pi2
      arm64: dts: rockchip: Add BigTreeTech CB2 and Pi2

Jagan Teki (1):
      arm64: dts: rockchip: Fix PCIe3 handling for Edgeble-6TOPS Modules

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: increase gmac rx_delay on rk3399-puma

Jimmy Hon (3):
      arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
      dt-bindings: arm: rockchip: Add Xunlong Orange Pi 5 Max
      arm64: dts: rockchip: Add Orange Pi 5 Max board

Jonas Karlman (1):
      arm64: dts: rockchip: Fix sdmmc access on rk3308-rock-s0 v1.1 boards

Kever Yang (4):
      arm64: dts: rockchip: Add rk3576 naneng combphy nodes
      dt-bindings: arm: rockchip: Sort for boards not in correct order
      dt-bindings: arm: rockchip: Add rk3576 evb1 board
      arm64: dts: rockchip: Add rk3576 evb1 board

Michael Riesch (2):
      arm64: dts: rockchip: fix num-channels property of wolfvision pf5 mic
      arm64: dts: rockchip: enable hdmi out audio on wolfvision pf5

Niklas Cassel (1):
      arm64: dts: rockchip: enable the mmu600_pcie IOMMU on the rk3588 SoC

Sebastian Reichel (1):
      arm64: dts: rockchip: add WLAN to rk3588-evb1 controller

Shimrra Shai (2):
      dt-bindings: arm: rockchip: Add Firefly ITX-3588J board
      arm64: dts: rockchip: add DTs for Firefly ITX-3588J and its Core-3588J SoM

 .../devicetree/bindings/arm/rockchip.yaml          |  94 ++-
 .../devicetree/bindings/soc/rockchip/grf.yaml      |   1 +
 arch/arm64/boot/dts/rockchip/Makefile              |   7 +
 arch/arm64/boot/dts/rockchip/rk3308-rock-s0.dts    |  25 +-
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         |   1 -
 arch/arm64/boot/dts/rockchip/rk3328-nanopi-r2.dtsi |   1 -
 .../boot/dts/rockchip/rk3328-orangepi-r1-plus.dtsi |   1 -
 arch/arm64/boot/dts/rockchip/rk3328-rock-pi-e.dts  |   3 -
 arch/arm64/boot/dts/rockchip/rk3328-rock64.dts     |   1 -
 arch/arm64/boot/dts/rockchip/rk3399-puma.dtsi      |   2 +-
 .../dts/rockchip/rk3566-bigtreetech-cb2-manta.dts  |  10 +
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  | 904 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3566-bigtreetech-pi2.dts   |  10 +
 arch/arm64/boot/dts/rockchip/rk3568-mecsbc.dts     |  19 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |  61 ++
 .../boot/dts/rockchip/rk3568-wolfvision-pf5.dts    |  10 +-
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 731 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           | 169 ++++
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts | 743 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |   3 +-
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |  81 +-
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |  82 ++
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |   4 +
 .../dts/rockchip/rk3588-firefly-core-3588j.dtsi    | 443 ++++++++++
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts | 702 ++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 802 ++++++++++++++++++
 .../dts/rockchip/rk3588-orangepi-5-compact.dtsi    | 151 ++++
 .../boot/dts/rockchip/rk3588-orangepi-5-max.dts    |  60 ++
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   | 894 ++++----------------
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi | 805 ++++++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  18 +
 31 files changed, 6027 insertions(+), 811 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2-manta.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-pi2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-core-3588j.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-firefly-itx-3588j.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-compact.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi




