Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BD968D1357E
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 27 Oct 2024 20:00:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=4vv2BXbPx+tCbP2OdqHpMRdqwjXqHTq800xkqclIArs=; b=uTjjYvYCFLhOwxP3eD/mDpw+XE
	Ls4eeyCFNGKCtL6AFqNq3qwpBWWKjcnlrgfP/E95W1NnC3kqRqVG+R/scqUwCUYIrtval7jZi3Oqa
	aa1XEOGE3v5uvosJtumK8ontq6ArVJOISMQSsNd5YcCpz9DUPAwaZhyjoRmOSs0l2KDmC+AnKJDoX
	jM6r86P93dDZo6KJeAN4vNox6uliP1NhGH+W5dsQhQ3LrJbAqFGIrjYGtXfKTl9l/zYPVukiP0zut
	n8gxWnDAm/GPvpG1LWKKMNY1TAyB0p2Sr/tJKpF1WkgbTIk0O4SmXQQtoVLriUFo7ugfBgKCfr7Gg
	BsTB2gGQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t59RA-00000008maA-2Tmi;
	Sun, 27 Oct 2024 20:00:32 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t59NQ-00000008m8f-0FLd;
	Sun, 27 Oct 2024 19:56:42 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=4vv2BXbPx+tCbP2OdqHpMRdqwjXqHTq800xkqclIArs=; b=uHBl+u/W8KIqbqEz+0oLnQFPnX
	T9B7RCIzdcdcFJSVXUbI8sISd64pcL5nSRU4OoUuKaNraT2MgVJJVqeoeE8Xj3BdhnqYj6mwcU57I
	iBE5NJ8Bv+c8PfP3HF6eDILKXzl2MfBYr0O82ZXWUpUcjskLr803F3jEegx761pmFJM+G03fQHksZ
	1WjlRYDjhqRKTw7tssZz8BASovXqOXGEyMGmvM3rS3cstP+LXtbLl/oNfhjx4PqFeiDXN/Chw6np6
	BHhEoteHJ46Gwpa7Qm/xG8/JRrJicwmFuTpFJCbBNQfWCHp/VHxoQwakp4LuwNtIacWmzItP/RGYn
	+noZcy7Q==;
Received: from i53875b34.versanet.de ([83.135.91.52] helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t59NM-0004KY-Sd; Sun, 27 Oct 2024 20:56:36 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.12
Date: Sun, 27 Oct 2024 20:56:35 +0100
Message-ID: <2847150.mvXUDI8C0e@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241027_125640_160894_079E2CD1 
X-CRM114-Status: GOOD (  11.94  )
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

Hi Arnd, Kevin, Olof,

please find a below a collection of fixes for the current release 6.12
cycle.

Please pull

Thanks
Heiko


The following changes since commit 9852d85ec9d492ebef56dc5f229416c925758edc:

  Linux 6.12-rc1 (2024-09-29 15:06:19 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.12-rockchip-dtsfixes1

for you to fetch changes up to 08846522d9a7bccf18d4f97c3f39d03c7a193970:

  arm64: dts: rockchip: Correct GPIO polarity on brcm BT nodes (2024-10-25 08:41:15 +0200)

----------------------------------------------------------------
A number of DTS correctnes fixes, to bring down the amount of errors
reported by dtbscheck.

----------------------------------------------------------------
Cristian Ciocaltea (1):
      arm64: dts: rockchip: Drop invalid clock-names from es8388 codec nodes

Diederik de Haas (4):
      arm64: dts: rockchip: Remove hdmi's 2nd interrupt on rk3328
      arm64: dts: rockchip: Fix wakeup prop names on PineNote BT node
      arm64: dts: rockchip: Fix reset-gpios property on brcm BT nodes
      arm64: dts: rockchip: Correct GPIO polarity on brcm BT nodes

Dragan Simic (2):
      arm64: dts: rockchip: Move L3 cache outside CPUs in RK3588(S) SoC dtsi
      arm64: dts: rockchip: Start cooling maps numbering from zero on ROCK 5B

Geert Uytterhoeven (2):
      arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-eaidk-610
      arm64: dts: rockchip: Fix rt5651 compatible value on rk3399-sapphire-excavator

Heiko Stuebner (13):
      arm64: dts: rockchip: fix i2c2 pinctrl-names property on anbernic-rg353p/v
      arm64: dts: rockchip: Drop regulator-init-microvolt from two boards
      arm64: dts: rockchip: Fix bluetooth properties on rk3566 box demo
      arm64: dts: rockchip: Fix bluetooth properties on Rock960 boards
      arm64: dts: rockchip: Remove undocumented supports-emmc property
      arm64: dts: rockchip: Remove #cooling-cells from fan on Theobroma lion
      arm64: dts: rockchip: Fix LED triggers on rk3308-roc-cc
      arm64: dts: rockchip: remove num-slots property from rk3328-nanopi-r2s-plus
      arm64: dts: rockchip: remove orphaned pinctrl-names from pinephone pro
      ARM: dts: rockchip: fix rk3036 acodec node
      ARM: dts: rockchip: drop grf reference from rk3036 hdmi
      ARM: dts: rockchip: Fix the spi controller on rk3036
      ARM: dts: rockchip: Fix the realtek audio codec on rk3036-kylin

Sam Edwards (1):
      arm64: dts: rockchip: Designate Turing RK1's system power controller

 arch/arm/boot/dts/rockchip/rk3036-kylin.dts          |  4 ++--
 arch/arm/boot/dts/rockchip/rk3036.dtsi               | 14 +++++++-------
 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi      |  1 -
 arch/arm64/boot/dts/rockchip/rk3308-roc-cc.dts       |  4 ++--
 .../boot/dts/rockchip/rk3328-nanopi-r2s-plus.dts     |  2 --
 arch/arm64/boot/dts/rockchip/rk3328.dtsi             |  3 +--
 arch/arm64/boot/dts/rockchip/rk3368-lion.dtsi        |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-eaidk-610.dts    |  2 +-
 .../arm64/boot/dts/rockchip/rk3399-pinephone-pro.dts |  2 --
 arch/arm64/boot/dts/rockchip/rk3399-roc-pc-plus.dts  |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-rock960.dtsi     |  2 +-
 .../boot/dts/rockchip/rk3399-sapphire-excavator.dts  |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353p.dts     |  2 +-
 .../boot/dts/rockchip/rk3566-anbernic-rg353v.dts     |  2 +-
 arch/arm64/boot/dts/rockchip/rk3566-box-demo.dts     |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts   |  1 -
 arch/arm64/boot/dts/rockchip/rk3566-pinenote.dtsi    |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3566-radxa-cm3.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-lubancat-2.dts   |  1 -
 arch/arm64/boot/dts/rockchip/rk3568-roc-pc.dts       |  3 ---
 arch/arm64/boot/dts/rockchip/rk3588-base.dtsi        | 20 ++++++++++++--------
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts     |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-quartzpro64.dts  |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5b.dts      |  4 ++--
 arch/arm64/boot/dts/rockchip/rk3588-toybrick-x0.dts  |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-turing-rk1.dtsi  |  1 +
 .../boot/dts/rockchip/rk3588s-indiedroid-nova.dts    |  1 -
 27 files changed, 39 insertions(+), 51 deletions(-)




