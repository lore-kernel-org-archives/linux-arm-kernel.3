Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 48946D2D101
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 13 Jan 2026 13:47:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=VFTd/C2Z5MvJBKQW6h/RscakGWTOH0gXF2pJtQ3h0Es=; b=CDQMDAvOKrUG2+af+tSuFHvXgp
	fYnSVgu6K+nk9uP9JcxqEjQhP8QSQbLMWZ6eQnKnLN67CJU/dMzpo075c7p6dZFNaYPBgy0SL9l4R
	m38m70taabcBEl/pcNM6DwL6xOQNRBs1uMrcwp15FUQOVAkfacZHC62ojfhDvMbGdzF1W4sJPLzCX
	VXYpJOZ3arzt7x9cSruet0odbAJ5t2d1065pXnaqjLuzTaJQ8qteZX0WDxMnvGIxj1FEmhXcvJtf7
	j2su3Sk+VVo42ZQTM49Ik7+bBrBkEtPjGupr2JIt0LFcY3w3FODTpOHs0Ff3A3j4AVZZApwZsQf1M
	Xd7d7Lng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfekI-00000007B1i-1IGq;
	Tue, 13 Jan 2026 13:47:42 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfekE-00000007B0t-1Zz1;
	Tue, 13 Jan 2026 13:47:39 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=VFTd/C2Z5MvJBKQW6h/RscakGWTOH0gXF2pJtQ3h0Es=; b=SY7o0b9ZD142OVuatf+T8VGOPT
	6As0O5vPxmOvtE8HG8XhyjjA1iKQZLaM1AEhTW4SulPqeiL+1CJjXh172FZP8B0xcsKaTs5e03gGe
	STuixA6QEkJM77umEOxEsgM/ZodCO+J4oe3vlRxKKmsgVha0jMpWQ00WtHCpiFsslxq4bFo2T21P+
	akK9t/SzLI72sVTNflE3ggEMd7y1qglCHp16aLjFh+ex8JgMmasC1w/Lj41Oba0vRK7N3rKP0Rlss
	fdjsODLmELl/kBXe4eigT3fm/gKTtKmksx2/OcaGboQodLvEnl6VrrP82cpxDuljDfYCEPMnFi4OS
	qa2JDQYg==;
Received: from i53875b63.versanet.de ([83.135.91.99] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vfekC-00278i-1U; Tue, 13 Jan 2026 14:47:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.19 #1
Date: Tue, 13 Jan 2026 14:47:36 +0100
Message-ID: <3166289.xgJ6IN8ObU@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260113_054738_564908_16CFCEF0 
X-CRM114-Status: GOOD (  15.83  )
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

please find below and in the next mails Rockchip changes for for 6.20 .

Please pull.
Thanks
Heiko


The following changes since commit 8f0b4cce4481fb22653697cced8d0d04027cb1e8:

  Linux 6.19-rc1 (2025-12-14 16:05:07 +1200)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git ta=
gs/v6.20-rockchip-dts64-1

for you to fetch changes up to da0de806d8b46238ac3891a894806da4d1c26cdf:

  arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576 (2026-01-09=
 20:58:40 +0100)

=2D---------------------------------------------------------------
New boards: Orange Pi CM5 module + Baseboard, Radxa CM5 module + IO-board.
PCIe-slot-overlay for rk3576-evb1

New peripherals: some of the video decoders on rk3576 and rk3588

Enabled peripherals: many RK3588-NPUs and a lot of other peripherals on
a plethora of boards.

=2D---------------------------------------------------------------
Alexey Charkov (7):
      arm64: dts: rockchip: Add overlay for the PCIe slot on RK3576 EVB1
      arm64: dts: rockchip: enable UFS controller on FriendlyElec NanoPi M5
      arm64: dts: rockchip: Use a readable audio card name on NanoPi M5
      arm64: dts: rockchip: Enable HDMI sound on FriendlyElec NanoPi M5
      arm64: dts: rockchip: Enable HDMI sound on Luckfox Core3576
      arm64: dts: rockchip: Enable HDMI sound on RK3576 EVB1
      arm64: dts: rockchip: Enable analog sound on RK3576 EVB1

Chris Morgan (1):
      arm64: dts: rockchip: Add HDMI to Gameforce Ace

Chukun Pan (4):
      arm64: dts: rockchip: remove rtc regulator for ArmSoM Sige5
      arm64: dts: rockchip: fix hp-det pin for ArmSoM Sige5
      arm64: dts: rockchip: enable saradc for ArmSoM Sige5
      arm64: dts: rockchip: Enable PCIe for ArmSoM Sige1

David Petry (1):
      arm64: dts: rockchip: Enable second HDMI output on CM3588

Detlev Casanova (2):
      arm64: dts: rockchip: Add the vdpu381 Video Decoders on RK3588
      arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576

=46UKAUMI Naoki (4):
      arm64: dts: rockchip: Add EEPROMs for Radxa ROCK 4 boards
      arm64: dts: rockchip: Add EEPROMs for Radxa rk35xx boards
      dt-bindings: arm: rockchip: fix description for Radxa CM3I
      dt-bindings: arm: rockchip: fix description for Radxa CM5

Heiko Stuebner (5):
      arm64: dts: rockchip: add gmac reset property to rk3368
      arm64: dts: rockchip: add mdio subnode to gmac on rk3368
      arm64: dts: rockchip: Correctly describe the ethernet phy on rk3368-l=
ion
      arm64: dts: rockchip: enable NPU on rk3588-tiger
      arm64: dts: rockchip: enable NPU on rk3588-jaguar

Joseph Kogut (3):
      dt-bindings: arm: rockchip: Add Radxa CM5 IO board
      arm64: dts: rockchip: Add rk3588 based Radxa CM5
      arm64: dts: rockchip: Add support for CM5 IO carrier

Laurent Pinchart (2):
      dt-bindings: arm: rockchip: Add Orange Pi CM5 Base
      arm64: dts: rockchip: Add rk3588s-orangepi-cm5-base device tree

Ondrej Jirman (3):
      arm64: dts: rockchip: Add accelerometer sensor to Pinephone Pro
      arm64: dts: rockchip: Add magnetometer sensor to Pinephone Pro
      arm64: dts: rockchip: Add light/proximity sensor to Pinephone Pro

Rapha=C3=ABl Jakse (1):
      arm64: dts: rockchip: Fix Bluetooth on the RockPro64 board

Ricardo Pardini (3):
      arm64: dts: rockchip: Enable the NPU on NanoPC T6/T6-LTS
      arm64: dts: rockchip: Enable the NPU on FriendlyElec CM3588
      arm64: dts: rockchip: Enable the NPU on Turing RK1

Rob Herring (Arm) (1):
      arm64: dts: rockchip: Add missing everest,es8388 supplies to rk3399-r=
oc-pc-plus

Shawn Lin (2):
      arm64: dts: rockchip: Add PCIe clkreq stuff for RK3588 EVB1
      arm64: dts: rockchip: add dma-coherent for pcie and gmac of RK3576

Torsten Duwe (1):
      arm64: dts: rockchip: Enable SPDIF audio on Rock 5 ITX

 .../devicetree/bindings/arm/rockchip.yaml          |  15 +-
 arch/arm64/boot/dts/rockchip/Makefile              |   7 +
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |  22 +-
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   8 +
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  45 ++
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |   4 +
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc.dtsi    |   1 -
 .../boot/dts/rockchip/rk3399-rock-4c-plus.dts      |   8 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-4se.dts   |  12 +
 arch/arm64/boot/dts/rockchip/rk3399-rock-pi-4.dtsi |   8 +
 .../boot/dts/rockchip/rk3399-rockpro64-v2.dts      |   7 +
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dts  |   7 +
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts      |  18 +
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3i.dtsi |  10 +-
 arch/arm64/boot/dts/rockchip/rk3568-rock-3a.dts    |   8 +
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |   8 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  19 +-
 .../boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso   |  31 ++
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   | 107 +++++
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi |   8 +
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |  34 +-
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |  14 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  40 ++
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  74 ++++
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |   7 +-
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |  38 ++
 .../dts/rockchip/rk3588-friendlyelec-cm3588.dtsi   |  35 +-
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  35 +-
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |  36 +-
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |  23 +
 .../boot/dts/rockchip/rk3588-rock-5b-plus.dts      |  10 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    |  10 +
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  35 +-
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |  35 +-
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |  63 +++
 .../dts/rockchip/rk3588s-orangepi-cm5-base.dts     | 355 ++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi    | 472 +++++++++++++++++=
++++
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     | 339 +++++++++++++++
 .../arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi | 280 ++++++++++++
 39 files changed, 2262 insertions(+), 26 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10-pcie1.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5-base.=
dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-radxa-cm5.dtsi




