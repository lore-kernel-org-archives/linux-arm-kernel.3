Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 88351CA1015
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Sep 2025 14:48:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=z/iJHAwqup1jimrIJd7Pc539FvMqXKAbdRBHlv8G210=; b=UwCqxua5ENkyD9zNMomJTv5N8w
	UwsrnQ2CWRB3po2DZwPm5nch3jsowVVGIp5LQbn8VDvpPmUbdZHTzwcRvXs28cKGwZ+13faj6hg3M
	cDUzCMAvGKFwgg2HVhZ7Z7GXp23owtfGwpnIl5jZb6HrBP2gU43S95RQU5JlJ/VH6Q52ZsfoFHKA5
	ZZ3RggKnDqQVTfw86aBGoQjrE+wkqi2vy1FXnAjeVUs2hyaX/3e9Fo9v7kPZ3vdJMom7GamDgRROW
	UYSqbCOVYxKCEiII+r+K08muf11ogXYdcVwB226eyMWJOHg/XKr0LbPRwytie/6yeisM1G89tkoXU
	fhrri49w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utomL-00000006lDp-2ATU;
	Wed, 03 Sep 2025 14:48:05 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1utmcZ-00000006O9z-2DPP;
	Wed, 03 Sep 2025 12:29:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=z/iJHAwqup1jimrIJd7Pc539FvMqXKAbdRBHlv8G210=; b=z3xbhbH6YfVaTYzqFKQ68s21fm
	YNxMReW+HBzD5ha0264GFI5M2fsc9gxjjiCDU/L7tcsNpO/3Ir/OA7Ttvg8mBpF/E6G9iGNlVK5Gf
	Oi4jUhx/6VcW/eORD5uRoDjwQa4Ok87g5qqGR64UwbYKFNFEMsM8PcWDm1NRFfsBX2DHmNo6ur02l
	m7WOFUDGzJvgAThCndaCdgSwGL4J1OuTyvDpaGU1D1QvePaVF9yiAxel+Tr36O73W6n+TS/UyFYI0
	A53CVj6nx8HIiH7VjABlnoKsJjFV8uUZEXxA5iQhzpScM6Tn2sxenovuSN3/W9TruUktIJpDgZZ2O
	V6lKYUYQ==;
Received: from [213.70.40.217] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1utmcY-0001kC-4c; Wed, 03 Sep 2025 14:29:50 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.17 #1
Date: Wed, 03 Sep 2025 14:29:49 +0200
Message-ID: <5909239.Y6S9NjorxK@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250903_052951_571681_7F234661 
X-CRM114-Status: GOOD (  13.93  )
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

please find a below some Rockchip fixes for the current 6.17 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 8f5ae30d69d7543eee0d70083daf4de8fe15d585:

  Linux 6.17-rc1 (2025-08-10 19:41:16 +0300)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.17-rockchip-dtsfixes1

for you to fetch changes up to dcc6785caffad27f2ea601fdd2f9782036e1faed:

  arm64: dts: rockchip: fix second M.2 slot on ROCK 5T (2025-09-02 08:31:50 +0200)

----------------------------------------------------------------
The newly added Rock 5T board needed slightly bigger fixes to make the
PCIe and USB actually work, because the PCIe does share its lanes between
two ports and the usb needs to toggle a gpio to supply power.

The other interesting fix is the headphone detection on the Orange Pi 5+.

The rest are some added supplies to make the boot log less scary and a
number of styling fixes.

----------------------------------------------------------------
Chen-Yu Tsai (1):
      arm64: dts: rockchip: Add supplies for eMMC on rk3588-orangepi-5

Chukun Pan (1):
      arm64: dts: rockchip: mark eeprom as read-only for Radxa E52C

Kaison Deng (1):
      arm64: dts: rockchip: fix es8388 address on rk3588s-roc-pc

Krzysztof Kozlowski (3):
      ARM: dts: rockchip: Minor whitespace cleanup
      arm64: dts: rockchip: Minor whitespace cleanup
      arm64: dts: rockchip: Fix Bluetooth interrupts flag on Neardi LBA3368

Maud Spierings (1):
      arm64: dts: rockchip: Fix the headphone detection on the orangepi 5 plus

Nicolas Frattaroli (2):
      arm64: dts: rockchip: fix USB on RADXA ROCK 5T
      arm64: dts: rockchip: fix second M.2 slot on ROCK 5T

Peter Robinson (2):
      arm64: dts: rockchip: Add vcc-supply to SPI flash on rk3399-pinebook-pro
      arm64: dts: rockchip: Add vcc-supply to SPI flash on Pinephone Pro

Sebastian Reichel (1):
      arm64: dts: rockchip: correct network description on Sige5

 arch/arm/boot/dts/rockchip/rk3128-xpi-3128.dts     |  2 +-
 arch/arm/boot/dts/rockchip/rv1109-relfor-saib.dts  |  6 ++--
 arch/arm64/boot/dts/rockchip/px30-pp1516.dtsi      |  8 ++---
 .../rockchip/px30-ringneck-haikou-video-demo.dtso  |  6 ++--
 .../boot/dts/rockchip/rk3308-sakurapi-rk3308b.dts  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3368-lba3368.dts    |  2 +-
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      |  1 +
 .../boot/dts/rockchip/rk3399-pinephone-pro.dts     |  1 +
 .../rockchip/rk3399-puma-haikou-video-demo.dtso    |  6 ++--
 .../boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi  |  4 +--
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      |  5 +---
 arch/arm64/boot/dts/rockchip/rk3582-radxa-e52c.dts |  1 +
 .../boot/dts/rockchip/rk3588-orangepi-5-plus.dts   |  2 +-
 .../arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi |  2 ++
 arch/arm64/boot/dts/rockchip/rk3588-rock-5t.dts    | 35 ++++++++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi          |  4 +--
 arch/arm64/boot/dts/rockchip/rk3588s-roc-pc.dts    |  4 +--
 17 files changed, 64 insertions(+), 27 deletions(-)




