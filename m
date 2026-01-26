Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BDF6D19502
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 26 Jan 2026 17:11:12 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=p8c5GPt01bTNMOC5DjO2w06JVmC999dNYOtnMc3NBuU=; b=wDmzbMJtJHDdWNWtZb/aRvQu0D
	oPTAVcQKkHiWAn5rgMRDcHIqg/EoGv4UVHFedavCD45Uwhpf3yPyXuw58ZTcUbZ2t5Fe4RDvFvHD7
	N2YLQ0HUlC7thDyowUuPFTdW31XeaCmQ8y7e4nz7SGeY1iz17GNdnfcPTAWRFz4VO7eakv5x8+NeF
	fbBu8KaPcFQDCgGDETu/vI2zga/4uxkwzm9oHodaSFBDwTRUhDZQ82OrWqH545LjGXvoYXzUzJXyl
	n+Z23anjIMQwQnzyt3Q+ftqABv29nolB49z1sqcROVrXtP/9PU6+6BZirG506oCi4+gc4jA8FV7Xr
	MJr+q7bQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ7E-0000000CwF5-2pm1;
	Mon, 26 Jan 2026 17:11:04 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkQ7B-0000000CwEE-3MhR;
	Mon, 26 Jan 2026 17:11:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=p8c5GPt01bTNMOC5DjO2w06JVmC999dNYOtnMc3NBuU=; b=VPjTc+hoob86dWZgFKUXtulmtM
	gZPitaktD/hEw9QpqQCeoVBUAxcbUblyvAai8WUJNcrhSWQQ513Z8fC89AvzpfB8c0wVm8KsCH3XM
	yA6yAHEQLUacGLiE9HYmja+QTB56JPREyffVv1EQS1TZzFoX/TQoSTdWzCYKkYa914m9mpaDYpheK
	t3U7zyvIVS2wnpybvIefeVfFCXqGEnssEXFWvNTvmQBf4dRVy9+82nilmojoRiQHmWvTUveFUrI/3
	1KVcrjSrHex/Nln8wLnISRspUVfovJC3haSjPJAVgZRDHFG4Fhf+WIee05vP5uix6rRCiToZamBjR
	3tcuI6Xg==;
Received: from i53875a0f.versanet.de ([83.135.90.15] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vkQ79-004eRa-D0; Mon, 26 Jan 2026 18:10:59 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 6.20 #2
Date: Mon, 26 Jan 2026 18:10:59 +0100
Message-ID: <4851923.QJadu78ljV@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260126_091101_867284_62B1CA74 
X-CRM114-Status: GOOD (  16.71  )
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

please find below and in the next mails some more Rockchip changes
for 6.20 .

Please pull.
Thanks
Heiko


The following changes since commit da0de806d8b46238ac3891a894806da4d1c26cdf:

  arm64: dts: rockchip: Add the vdpu383 Video Decoder on rk3576 (2026-01-09 20:58:40 +0100)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.20-rockchip-dts64-2

for you to fetch changes up to 46c56b737161060dfa468f25ae699749047902a2:

  arm64: dts: rockchip: Fix rk3588 PCIe range mappings (2026-01-22 19:41:40 +0100)

----------------------------------------------------------------
New boards: Anberic RG-DS game console, Radxa CM3J module + baseboard
for the Rpi CM4 IO board, QNAP TS133 from the RK3568 NAS series.

2 display outputs for the Lion board (old RK3368), TPS65185 pmic for the
PineNote and fixes for the PCIe ranges on both RK356x and RK3588.
These came quite late, so I wanted to give them the time till 6.20-rc1
and have them migrate to stable-kernels afterwards.

The rest is small stuff on a number of boards wrt gpios and compatibles.

----------------------------------------------------------------
Alexey Charkov (1):
      arm64: dts: rockchip: Explicitly request UFS reset pin on RK3576

Andreas Kemnade (1):
      arm64: dts: rockchip: Add TPS65185 for PineNote

Chris Morgan (3):
      dt-bindings: arm: rockchip: Add Anbernic RG-DS
      dt-bindings: input: touchscreen: goodix: Add "panel" property
      arm64: dts: rockchip: Add Anbernic RG-DS

FUKAUMI Naoki (4):
      arm64: dts: rockchip: Make eeprom read-only for Radxa ROCK 3C/5A/5C
      dt-bindings: arm: rockchip: Add Radxa CM3J on RPi CM4 IO Board
      arm64: dts: rockchip: Add Radxa CM3J
      arm64: dts: rockchip: Add Radxa CM3J on RPi CM4 IO Board

Heiko Stuebner (10):
      arm64: dts: rockchip: Move SoC include to individual QNAP TSx33 boards
      arm64: dts: rockchip: Fix the common combophy + SATA on QNAP TSx33 devices
      arm64: dts: rockchip: Move copy-key to TSx33 board files
      dt-bindings: arm: rockchip: add TS133 to RK356x-based QNAP NAS devices
      arm64: dts: rockchip: Add TS133 variant of the QNAP NAS series
      arm64: dts: rockchip: Use phandle for i2c_lvds_blc on rk3368-lion haikou
      arm64: dts: rockchip: Add HDMI node to RK3368
      arm64: dts: rockchip: Enable HDMI output on RK3368-Lion-Haikou
      arm64: dts: rockchip: Enable pwm1 on rk3368-lion-haikou
      arm64: dts: rockchip: Add the Video-Demo overlay for Lion Haikou

Jun Yan (1):
      arm64: dts: rockchip: Do not enable hdmi_sound node on Pinebook Pro

Luis Garcia (1):
      arm64: dts: rockchip: Fix imx258 variant on pinephone pro

Shawn Lin (4):
      arm64: dts: rockchip: Fix SD card support for RK3576 EVB1
      arm64: dts: rockchip: Fix SD card support for RK3576 Nanopi R76s
      arm64: dts: rockchip: Fix rk356x PCIe range mappings
      arm64: dts: rockchip: Fix rk3588 PCIe range mappings

 .../devicetree/bindings/arm/rockchip.yaml          |   27 +-
 .../bindings/input/touchscreen/goodix.yaml         |    2 +
 arch/arm64/boot/dts/rockchip/Makefile              |    8 +
 .../rockchip/rk3368-lion-haikou-video-demo.dtso    |  170 +++
 .../arm64/boot/dts/rockchip/rk3368-lion-haikou.dts |   38 +-
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi      |    5 +
 arch/arm64/boot/dts/rockchip/rk3368.dtsi           |   43 +
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |    4 -
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi  |   49 +
 arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133.dts |   71 ++
 arch/arm64/boot/dts/rockchip/rk3566-rock-3c.dts    |    1 +
 .../boot/dts/rockchip/rk3568-anbernic-rg-ds.dts    | 1237 ++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts233.dts |   18 +-
 arch/arm64/boot/dts/rockchip/rk3568-qnap-ts433.dts |   18 +-
 .../arm64/boot/dts/rockchip/rk3568-qnap-tsx33.dtsi |   21 +-
 .../dts/rockchip/rk3568-radxa-cm3j-rpi-cm4.dts     |  204 ++++
 .../arm64/boot/dts/rockchip/rk3568-radxa-cm3j.dtsi |  558 +++++++++
 arch/arm64/boot/dts/rockchip/rk3568.dtsi           |    4 +-
 arch/arm64/boot/dts/rockchip/rk356x-base.dtsi      |    2 +-
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   22 +
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |   23 +-
 arch/arm64/boot/dts/rockchip/rk3576-pinctrl.dtsi   |    7 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |    2 +-
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |    4 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    6 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |    1 +
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |    1 +
 28 files changed, 2498 insertions(+), 50 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3368-lion-haikou-video-demo.dtso
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-qnap-ts133.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-anbernic-rg-ds.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3j-rpi-cm4.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-radxa-cm3j.dtsi




