Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 1B34DC55174
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Aug 2026 17:57:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=aCudNrsThIpmS08OkACwr0UiJe6LKKY9XXTu59xP2MY=; b=X3VklUBIXU/n/W5Vo6wD4iAySM
	aIN67W/N71IAHPGFoaOiONUETvWEI3+1iClJBUYpCOkiFOfad0X4OVxj/nfp8RzC5B60uj3OFCRiw
	kDaId7+iDN1VOj/dw2oFoZ9glSjVYGZuADNcy5SOJuQjfj5MNv5pEhCAJDhmbPsfAdjXVC0scBp/H
	PsNh+a4SN8OYEKGLojh2cE9yxjfMcFTY2S/WgNUTNDLi34myEtaZPDIKwdwYh0evX5cYES1LmXehr
	rKxfDvYNwgVjYIAcFYlnepyJsn5FJY3elzLhooTXerhHYojfdCnyioHCjYBM2YoGzvRD4s9nwlkL4
	TjmTlEsQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfrz-00000004MsJ-2hAV;
	Wed, 05 Aug 2026 17:57:35 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrfrx-00000004Mrp-2GE4;
	Wed, 05 Aug 2026 17:57:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=aCudNrsThIpmS08OkACwr0UiJe6LKKY9XXTu59xP2MY=; b=qE053dCWVMU1fedRFkRnyTnmom
	dvY5CEQ0RvwahOTJypZSNRRLHUI4G+tyBzoVIV6gPE31/TJscpjBE8RzjBQg6oYv//ezwIUi4ugab
	vyfJuyFaxgHn14MZ+IDXl6ur3kRic6+5M2nsh0VoOz6snICx6w2ZTcPznagYfiVKgJim1iRq/cIcn
	LqRgmcoZVHD+yHOSHwP4xZSPPEfYSYbzV5clvXq8fjrILPReAVZyg9EXHW8l9gsWAkskeeX8k7lTj
	TUYk0XPCXfOhjIEXMYWl+HpMaFH+w1FC0g6nxruvCZtQQRMT5ia66wYB9YHKFn7teTGTNGWcMoBqt
	LRTwOdFA==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.3 #2
Date: Wed, 05 Aug 2026 19:57:31 +0200
Message-ID: <5318464.usQuhbGJ8B@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260805_105733_589047_A47DDF78 
X-CRM114-Status: GOOD (  11.60  )
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

please find below some more Rockchip DT64 changes for the merge-window
for 7.3 .

My personal highlight is of course the Anbernic handheld - mostly because
I own (and like) that device and am looking forward to getting rid of the
vendor-BSP-based firmware on it.


Please pull.
Thanks
Heiko


The following changes since commit 7707e4555cf1d52689621e3206df8ad2debaa0dd:

  arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property (2026-07-24 21:30:31 +0200)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-dts64-2

for you to fetch changes up to 0f4c49bb3e538d01bdec403052ba6c35858aa0cf:

  arm64: dts: rockchip: Add LincStation E1 (2026-08-02 21:05:51 +0200)

----------------------------------------------------------------
More new boards: LincStation E1, Vicharak Vaaman, EmbedFire LubanCat 4,
ArmSoM CM5 + IO-board and the Anbernic RG Vita-Pro handheld

Apart from that some board-level changes and style fixes.

----------------------------------------------------------------
Chris Morgan (3):
      dt-bindings: arm: rockchip: Add Anbernic RG Vita-Pro
      arm64: dts: rockchip: Add Anbernic RG Vita-Pro
      arm64: dts: rockchip: Add icm42607p IMU for RG-DS

Fabio Estevam (5):
      arm64: dts: rockchip: Drop data-mapping from Engicam PX30 Core
      arm64: dts: rockchip: Add CSI-2 bus type to ROCK 5B+ camera overlays
      arm64: dts: rockchip: Fix rk3399-roc-pc-plus analog audio
      arm64: dts: rockchip: Enable wireless on rk3399-roc-pc-plus
      arm64: dts: rockchip: Keep rk3399-roc-pc-plus work LED on

Hrushiraj Gandhi (2):
      dt-bindings: arm: rockchip: Add Vicharak Vaaman board
      arm64: dts: rockchip: Add Vicharak Vaaman board

Jiaxing Hu (2):
      dt-bindings: arm: rockchip: Add ArmSoM CM5 and CM5-IO
      arm64: dts: rockchip: Add ArmSoM CM5 and CM5-IO

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Correct white-space style

Pufan Jin (2):
      dt-bindings: arm: rockchip: Add EmbedFire LubanCat 4 board
      arm64: dts: rockchip: Add EmbedFire LubanCat 4 board

Samuel Holland (2):
      dt-bindings: arm: rockchip: Add LincStation E1
      arm64: dts: rockchip: Add LincStation E1

 .../devicetree/bindings/arm/rockchip.yaml          |   28 +
 arch/arm64/boot/dts/rockchip/Makefile              |    5 +
 .../px30-engicam-px30-core-ctouch2-of10.dts        |    1 -
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts     |    2 +-
 .../arm64/boot/dts/rockchip/rk3399-puma-haikou.dts |    2 +-
 .../arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts |   67 +
 .../boot/dts/rockchip/rk3399-vicharak-vaaman.dts   |  458 +++++++
 .../dts/rockchip/rk3566-onething-edge-cube.dts     |    2 +-
 .../boot/dts/rockchip/rk3568-anbernic-rg-ds.dts    |    8 +-
 .../boot/dts/rockchip/rk3568-lincstation-e1.dts    | 1000 +++++++++++++++
 .../dts/rockchip/rk3576-anbernic-rg-vita-pro.dts   | 1283 ++++++++++++++++++++
 .../boot/dts/rockchip/rk3576-armsom-cm5-io.dts     |  384 ++++++
 .../arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi |  566 +++++++++
 .../rk3588-rock-5b-plus-radxa-cam4k-cam0.dtso      |    2 +
 .../rk3588-rock-5b-plus-radxa-cam4k-cam1.dtso      |    2 +
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |    2 +-
 .../arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts |  785 ++++++++++++
 17 files changed, 4591 insertions(+), 6 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-lincstation-e1.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-anbernic-rg-vita-pro.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5-io.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-armsom-cm5.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-lubancat-4.dts




