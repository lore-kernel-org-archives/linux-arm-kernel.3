Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B25E1CD5BB1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 21:18:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=AtB/jCcsJlvPcS8WpG3eCTkX1kQ2fw9TxddSV41Qpok=; b=2qwVgflj2vJU/Lvf/DUM0uaWf7
	vGBXJzrkIl6J/k+3d8sJCMN4vp2QCQMckPY0wbyeJJSjkly7Djz4VO2Fip90EZz/c3+qEaYRCkYzZ
	tadfAJwyxYS9kNHx1V05TMHlVhUihGzUuhB74v0m/uSKzFuPY1O2Tr+P8Mfi6JUC85NimOVA8EdJH
	1xeYs3Y2M9tbGFWd5YW3vihJBRXqhC6MDquLVJZmBLWXbzUoRJv14+XlRyx+9mbT2zYJhb5cKdfoS
	ZidQnU+7Wl5FAMzvOGKI2pk0bQ0kXnUvTxiqYDvxFFGEO0Nbjxb9lq8vsCDi34jxmc1ErgCjT6gqR
	qWmEkCxg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRzAD-00000002yVO-2vGd;
	Tue, 26 May 2026 21:18:13 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRzAA-00000002yUP-2gVr;
	Tue, 26 May 2026 21:18:12 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=AtB/jCcsJlvPcS8WpG3eCTkX1kQ2fw9TxddSV41Qpok=; b=c64PNbbS5UpbUsQRjP9lR0qhTB
	wyktpFJo4GB8kvj0upRf6sMkLEIo0bUjavG3pm9tD+cZzqV/8x+XbeD3vaGsqui+B/pzxAJG3uf0r
	Q9wXC+9bC3YrqM9basx9W3Ka7BZs8VjvY07ruGsZG9g4TCzWLXhG+mCcjNQrJKq4HZp1HJliOmGOD
	L1RoCmhuSur5l+pDTDIzpFWVMLhy9EEJa3+F4Zj7OR/sKTSQjfWB5ouqi3ttmoy2TbGifNeOD7rvA
	ChpeZgD21LdwFoVzljdxIBEweP0jHksEMS6HU/hgn4UeZMOFFmTZ2MZeD02sQ333ogdfKkayCRIfq
	dYPZmb5w==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts64 changes for 7.2 #1
Date: Tue, 26 May 2026 23:18:08 +0200
Message-ID: <3616130.jNaZZp9DzI@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_141810_684908_6E1169FE 
X-CRM114-Status: GOOD (  12.91  )
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

please find below Rockchip DT changes for the merge-window for 7.2 .

Please pull.
Thanks
Heiko


The following changes since commit 254f49634ee16a731174d2ae34bc50bd5f45e731:

  Linux 7.1-rc1 (2026-04-26 14:19:00 -0700)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.2-rockchip-dts64-1

for you to fetch changes up to eb24b60553e0692cbbec2863ca31d2a56bff098d:

  arm64: dts: rockchip: Add watchdog node for RK3528 (2026-05-07 13:27:53 +0200)

----------------------------------------------------------------
New peripherals: Watchdog on RK3528, MIPI CSI-2 receiver on RK3588.
Adding frl-enable-gpios to a number of boards for HDMI 2.0 support.
And a bunch of fixes and new peripherals for a number of boards.

----------------------------------------------------------------
Brian Norris (1):
      arm64: dts: rockchip: Add #{address,size}-cells to Chromium-based /firmware

Cristian Ciocaltea (15):
      arm64: dts: rockchip: Fix vdec register blocks order on RK3576
      arm64: dts: rockchip: Update vdec register blocks order on RK3588
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576 boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-luckfox-core3576
      arm64: dts: rockchip: Add frl-enable-gpios to rk3576-nanopi-r76s
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588 boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s boards
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-gameforce-ace
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-khadas-edge2
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-orangepi-cm5-base
      arm64: dts: rockchip: Add frl-enable-gpios to rk3588s-roc-pc
      arm64: dts: rockchip: Drop unnecessary #{address,size}-cells from rk3588-jaguar
      arm64: dts: rockchip: Add missing pinctrl-names to rk3576 boards
      arm64: dts: rockchip: Add missing pinctrl-names to rk3588 boards
      arm64: dts: rockchip: Add missing pinctrl-names to rk3588s boards

Diederik de Haas (1):
      arm64: dts: rockchip: Fix gmac0 reset pin for NanoPi R5S

Gray Huang (5):
      arm64: dts: rockchip: Add PMIC support for Khadas Edge 2L
      arm64: dts: rockchip: Enable GPU for Khadas Edge 2L
      arm64: dts: rockchip: Add HDMI and VOP support for Khadas Edge 2L
      arm64: dts: rockchip: Add HYM8563 RTC for Khadas Edge 2L
      arm64: dts: rockchip: Add AP6275P wireless support for Khadas Edge 2L

Jonas Karlman (1):
      arm64: dts: rockchip: Add watchdog node for RK3528

Michael Riesch (1):
      arm64: dts: rockchip: add mipi csi-2 receiver nodes to rk3588

Midgy BALON (1):
      arm64: dts: rockchip: rock-3b: Model PI6C20100 as gated-fixed-clock

Quentin Schulz (2):
      arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Cobra
      arm64: dts: rockchip: fix Ethernet PHY not found on PX30 Ringneck

Sebastian Reichel (1):
      MAINTAINERS: Add Rockchip keyword matching

Sten-Silver Ots (1):
      arm64: dts: rockchip: Enable the NPU on rk3588-rock-5-itx

Weixin Guo (1):
      arm64: dts: rockchip: fix rk809 interrupt pin on rk3566-roc-pc

 MAINTAINERS                                        |   2 +
 arch/arm64/boot/dts/rockchip/px30-cobra.dtsi       |   2 +-
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    |   2 +-
 arch/arm64/boot/dts/rockchip/rk3399-gru.dtsi       |   5 +
 arch/arm64/boot/dts/rockchip/rk3528.dtsi           |   8 +
 arch/arm64/boot/dts/rockchip/rk3566-roc-pc.dts     |   2 +-
 arch/arm64/boot/dts/rockchip/rk3568-nanopi-r5s.dts |   6 +-
 arch/arm64/boot/dts/rockchip/rk3568-rock-3b.dts    |  20 +-
 .../boot/dts/rockchip/rk3576-100ask-dshanpi-a1.dts |  10 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  10 +
 arch/arm64/boot/dts/rockchip/rk3576-evb1-v10.dts   |   9 +
 arch/arm64/boot/dts/rockchip/rk3576-evb2-v10.dts   |   9 +
 .../boot/dts/rockchip/rk3576-khadas-edge-2l.dts    | 538 +++++++++++++++++++++
 .../boot/dts/rockchip/rk3576-luckfox-core3576.dtsi |  22 +-
 arch/arm64/boot/dts/rockchip/rk3576-nanopi-m5.dts  |   9 +
 .../arm64/boot/dts/rockchip/rk3576-nanopi-r76s.dts |  16 +-
 arch/arm64/boot/dts/rockchip/rk3576-roc-pc.dts     |  10 +
 arch/arm64/boot/dts/rockchip/rk3576-rock-4d.dts    |  10 +
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |   6 +-
 .../boot/dts/rockchip/rk3588-armsom-sige7.dts      |  11 +
 arch/arm64/boot/dts/rockchip/rk3588-armsom-w3.dts  |  19 +
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi      |  64 ++-
 .../boot/dts/rockchip/rk3588-coolpi-cm5-evb.dts    |  18 +-
 .../dts/rockchip/rk3588-coolpi-cm5-genbook.dts     |  12 +-
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |   4 +
 .../boot/dts/rockchip/rk3588-edgeble-neu6a-io.dtsi |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-evb1-v10.dts   |  20 +
 arch/arm64/boot/dts/rockchip/rk3588-evb2-v10.dts   |  11 +
 arch/arm64/boot/dts/rockchip/rk3588-fet3588-c.dtsi |   1 +
 .../dts/rockchip/rk3588-firefly-core-3588j.dtsi    |   1 +
 .../dts/rockchip/rk3588-firefly-icore-3588q.dtsi   |   1 +
 .../boot/dts/rockchip/rk3588-firefly-itx-3588j.dts |  12 +
 .../rockchip/rk3588-friendlyelec-cm3588-nas.dts    |  18 +
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts |  11 +
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts     |  24 +-
 .../arm64/boot/dts/rockchip/rk3588-mnt-reform2.dts |  12 +
 arch/arm64/boot/dts/rockchip/rk3588-nanopc-t6.dtsi |  21 +
 .../boot/dts/rockchip/rk3588-orangepi-5-max.dts    |  18 +-
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |  20 +
 .../boot/dts/rockchip/rk3588-orangepi-5-ultra.dts  |  11 +-
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |   1 +
 arch/arm64/boot/dts/rockchip/rk3588-roc-rt.dts     |  19 +
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts |  47 +-
 .../boot/dts/rockchip/rk3588-rock-5b-5bp-5t.dtsi   |  19 +-
 .../boot/dts/rockchip/rk3588-tiger-haikou.dts      |   4 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi     |  20 +-
 .../arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts |   1 +
 .../arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi |   2 +
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |  16 +
 arch/arm64/boot/dts/rockchip/rk3588s-evb1-v10.dts  |   1 +
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    |  15 +-
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts  |  13 +-
 .../boot/dts/rockchip/rk3588s-khadas-edge2.dts     |  15 +-
 .../arm64/boot/dts/rockchip/rk3588s-nanopi-r6.dtsi |  11 +
 arch/arm64/boot/dts/rockchip/rk3588s-odroid-m2.dts |  10 +
 .../boot/dts/rockchip/rk3588s-orangepi-5.dtsi      |  11 +
 .../dts/rockchip/rk3588s-orangepi-cm5-base.dts     |  12 +-
 .../boot/dts/rockchip/rk3588s-orangepi-cm5.dtsi    |   3 +
 .../boot/dts/rockchip/rk3588s-radxa-cm5-io.dts     |  10 +
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts    |  17 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5a.dts   |  13 +-
 arch/arm64/boot/dts/rockchip/rk3588s-rock-5c.dts   |  13 +-
 62 files changed, 1190 insertions(+), 89 deletions(-)




