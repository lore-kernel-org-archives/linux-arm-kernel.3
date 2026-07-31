Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4B0E4C55173
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 31 Jul 2026 22:12:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=Fn9fvAwbHBdoZnU5Z3GXU92H9WGoBp0GZQN96d0z5ZU=; b=ARv81j0KPoQYhXi13AU7HSm0AY
	XqysGjbqg9C3P6tvdKA179elei7QoIOKv7CRoN0GEC/mtcvpaGFXIuvTI9Hlw2aqkXAy7oXKn70sm
	qVm01ErjbBqXlwIBD3/fulifK8WAra01E+4LXjpozsx8KqF9Dlt4ya2oBiWnB0IuSLPX7/s0MPquE
	KFc2NonsezAA2KY9ZvRhjmTgUJUeWXEMjr5xReV643rK0cECjCXiTPBMozGdimDgV/CigIOiWVVqK
	C2nlHeucGu+VYW8gxrbxPxJjzsOSuMR59xnFISliJ5unrfP3NvRUz7SWLDw82eDapkksp+cLr+1Dt
	Tq6b7L6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvSe-0000000DfQX-4Aid;
	Fri, 31 Jul 2026 22:12:12 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpvSc-0000000DfPf-2cAX;
	Fri, 31 Jul 2026 22:12:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=Fn9fvAwbHBdoZnU5Z3GXU92H9WGoBp0GZQN96d0z5ZU=; b=w5HR/1LZw6TbXw/7ZQXQf7yrZj
	AEVABoOBZE4N4DEIIk4hIr1WvG0y5nmp1Fv+hiReZz0vddTQ5oOSVpF55gqiANvCpwV/pnagYzfXN
	gsWbnN5zVL3bnxSKY5iOEWVih5rqCBg1wEeqXeHNCa8awS7yztXUaGAW2s5Nolrci89NQPZVEGg0Q
	09fehZChDG+ZAIIaoSm/gLm1MV3/Ag27qs4k9ROAP72ySaO9OLN9nS2b0u0YdicXmtyMShafSWARg
	FnxzbFhGAHxfE/OmKQQ25dbQQVMm9tBZIPf/4NUHloWc2bIZQ85L9gZy2pFYo9JFVnWjXRmHrWoAU
	TLgkev9A==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.3 #1
Date: Sat, 01 Aug 2026 00:12:03 +0200
Message-ID: <2742274.XQYqjrCR6X@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260731_151210_732636_91DAB78F 
X-CRM114-Status: GOOD (  17.04  )
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

please find below Rockchip DT changes for the merge-window for 7.3 .


Not sure if it matters, but my pgp key got an update in the kernel keyring.
The existing keys themself did not change, just the SHA1 signatures from
the main key to the subkeys got refresh by better ones.

And I added a second signing key that I plan to use in the future.


Please pull.
Thanks
Heiko


The following changes since commit dc59e4fea9d83f03bad6bddf3fa2e52491777482:

  Linux 7.2-rc1 (2026-06-28 12:01:31 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.3-rockchip-dts64-1

for you to fetch changes up to 7707e4555cf1d52689621e3206df8ad2debaa0dd:

  arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property (2026-07-24 21:30:31 +0200)

----------------------------------------------------------------
New boards: Graperain G3568, HINLINK H28K, LCKFB Taishan Pi 3M,
Orange Pi 5 Pro, Vicharak Axon, Vicharak Vaaman2, Youyeetoo YY3588

New peripherals: eDP support on RK3576

And of course a number of board-fixes, style-fixes and some newly
enabled board-components.

----------------------------------------------------------------
Brian Mayer (1):
      arm64: dts: rockchip: add HYM8563 RTC to Radxa CM5 IO board

Chukun Pan (2):
      dt-bindings: arm: rockchip: Add HINLINK H28K
      arm64: dts: rockchip: Add HINLINK H28K

Coia Prant (6):
      arm64: dts: rockchip: Replace deprecated 'gpio' property with 'gpios' for 9Tripod X3568 v4
      arm64: dts: rockchip: Add AP6275S support for 9Tripod X3568 v4
      arm64: dts: rockchip: Fix incorrect interrupt for the 9Tripod X3568 v4
      dt-bindings: vendor-prefixes: Add graperain
      dt-bindings: arm: rockchip: Add Graperain G3568 series
      arm64: dts: rockchip: Add devicetree for the Graperain G3568 v2

Damon Ding (3):
      arm64: dts: rockchip: Add missing hclk for RK3588 eDP0
      arm64: dts: rockchip: Add missing hclk for RK3588 eDP1
      arm64: dts: rockchip: Add eDP node for RK3576

Daniele Briguglio (4):
      dt-bindings: vendor-prefixes: Add youyeetoo
      dt-bindings: arm: rockchip: Add Youyeetoo YY3588
      arm64: dts: rockchip: Add Youyeetoo YY3588
      arm64: dts: rockchip: fix HDMI-RX signal detect GPIO on yy3588

Dennis Gilmore (4):
      dt-bindings: arm: rockchip: Add Orange Pi 5 Pro
      arm64: dts: rockchip: rename PLDO regulator labels to match schematic on rk3588s-orangepi-5
      arm64: dts: rockchip: refactor items from Orange Pi 5/b to prep for Pro
      arm64: dts: rockchip: Add Orange Pi 5 Pro board support

Fabio Estevam (5):
      arm64: dts: rockchip: Fix rk3588s-roc-pc audio description
      arm64: dts: rockchip: Enable USB device mode on rk3588s-roc-pc
      arm64: dts: rockchip: Fix Gru WLAN sideband interrupt
      arm64: dts: rockchip: Fix the rk3566-radxa-cm3 Wifi compatible
      arm64: dts: rockchip: Fix rk3566-bigtreetech-cb2 touchscreen property

Hrushiraj Gandhi (4):
      dt-bindings: arm: rockchip: add Vicharak Axon board
      arm64: dts: rockchip: add Vicharak Axon board
      dt-bindings: arm: rockchip: Add Vicharak Vaaman2
      arm64: dts: rockchip: Add Vicharak Vaaman2 board

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: fix emmc reset polarity on px30-cobra

Krzysztof Kozlowski (1):
      arm64: dts: rockchip: Correct indentation

Liu Changjie (2):
      dt-bindings: arm: rockchip: Add LCKFB Taishan Pi 3M
      arm64: dts: rockchip: Add LCKFB Taishan Pi 3M

Oren Klopfer (1):
      Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinephone Pro"

Quentin Schulz (2):
      arm64: dts: rockchip: fix eMMC reset polarity on PP-1516
      arm64: dts: rockchip: fix eMMC reset polarity on PX30 Ringneck

Ricardo Pardini (1):
      arm64: dts: rockchip: fix regulator names on NanoPC-T6

Vic B (1):
      arm64: dts: rockchip: fix label of sys_led for nanopi-r4s

Vsevolod Kozlov (1):
      arm64: dts: rockchip: fan speed control for FriendlyELEC CM3588 NAS

 .../devicetree/bindings/arm/rockchip.yaml          |   32 +
 .../devicetree/bindings/vendor-prefixes.yaml       |    4 +
 arch/arm64/boot/dts/rockchip/Makefile              |    7 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi       |    2 +-
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |    2 +-
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  |   10 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |    2 +-
 .../boot/dts/rockchip/rk3399-gru-chromebook.dtsi   |    3 +-
 .../arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi |   10 +-
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |   18 -
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi   |    2 +-
 .../boot/dts/rockchip/rk3528-hinlink-h28k.dts      |  318 ++++++
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |    2 +-
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi |    2 +-
 .../boot/dts/rockchip/rk3568-9tripod-x3568-v4.dts  |   60 +-
 .../dts/rockchip/rk3568-graperain-g3568-v2.dts     |  940 ++++++++++++++++
 .../boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts     |  997 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   28 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |    4 +-
 arch/arm64/boot/dts/rockchip/rk3588-extra.dtsi     |    4 +-
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |   31 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |   14 +-
 .../boot/dts/rockchip/rk3588-vicharak-axon.dts     |  842 ++++++++++++++
 .../boot/dts/rockchip/rk3588-vicharak-vaaman2.dts  |  535 +++++++++
 .../boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts  | 1180 ++++++++++++++++++++
 .../boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi   |  256 +++++
 .../boot/dts/rockchip/rk3588s-orangepi-5-pro.dts   |  358 ++++++
 .../arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts |    6 +-
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |  263 +----
 .../boot/dts/rockchip/rk3588s-orangepi-5b.dts      |    2 +-
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     |   19 +
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts    |   29 +-
 32 files changed, 5674 insertions(+), 308 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-hinlink-h28k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-graperain-g3568-v2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3576-lckfb-tspi-3m.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-vaaman2.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-youyeetoo-yy3588.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-5b.dtsi
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5-pro.dts




