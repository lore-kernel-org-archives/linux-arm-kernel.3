Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 831F210706F6
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 14 Mar 2026 18:42:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=2YspHBaRj+3aRDhXBfHzng0fFhuBsYu6B5AO6SSeqWo=; b=ej8qrU8eJeECs5GdCP+zi/Hvd3
	X27qm+HfZgMtf4vA2OKJ5Cui5cj8oyhf++Qd5DfiHs89bSIsfaSw4EI3J9QdQQB5YsPSU+HIH50c0
	T3YXKlONTSalp+Fh0tLKwG2H83KRH6I7eYCcjUWqhoug6HnpO7Mxvm1K8iUXniy2N8ek9JnjqIG6p
	zzTdWNRj8sRacOD/ZEbbx81ZiZf82BrgfSNEeYVOpRSaqu+WGGV3pE2mt0D1TD20n4uc3cvYVQve5
	UhVrYeCltTkq4J0T7zG0K1jFk1ICvjCz8hctuClz1g3jR0668WjTPFqnYdT0+TAGqzJVDIjWyY0b+
	NhdCeHJw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Twh-0000000255j-44gs;
	Sat, 14 Mar 2026 18:42:43 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w1Twe-00000002554-2EKX;
	Sat, 14 Mar 2026 18:42:41 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=2YspHBaRj+3aRDhXBfHzng0fFhuBsYu6B5AO6SSeqWo=; b=NDdbkyR5GVN4YheBlRPtbLPQ0P
	pghFRNN7TJyD4gO2iOLit7dhnxmOJLdNCH1a9CIutuoqPsC7P5Vh8Vf3oJilc6yly6TomHAJYBOak
	UiD93/v4tjZ5Dig067BMVEKIM6+uLRVcH+UanTdNRGdLfEXakukMlz4lFA1yEUXxNVtVYfNMl0G/o
	iwAbj0CKOYDuQ1Vua6huS0hG3xw8LVYG68ENqmq/++965x4YjRoG9WQm6A8Cwxr7qqsSUIHj1ojta
	uWFWEJ+pEIwQJ1noknm38/XuAHBbILqFFWAAFvhn1MwzlUVbryNGgNj9Fwa643mNmLxo6d6mhZVQW
	MhyJ+VZg==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 7.0 #1
Date: Sat, 14 Mar 2026 19:42:38 +0100
Message-ID: <5055064.GXAFRqVoOG@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260314_114240_572296_8ACFBF53 
X-CRM114-Status: GOOD (  10.58  )
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

Hi SoC maintainers,

please find a below some Rockchip fixes for the current 7.0 release-cycle.
And in the next PR, even one driver-fix this time.

Please pull

Thanks
Heiko


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.0-rockchip-dtsfixes1

for you to fetch changes up to 2ed11ad1c2b4c191cb2ed6741be127eb99f8634f:

  arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace (2026-03-12 20:52:53 +0100)

----------------------------------------------------------------
A big number of changes fixing dt-schema issues on the ARM32 side,
fixes for the Gameforce-Ace to make the hardware work properly
(including thermals) as well as fixing issues both on Beelink A1 (spdif)
and Pinebook Pro (Wifi) by reverting the commits that created the issues

----------------------------------------------------------------
Chris Morgan (2):
      arm64: dts: rockchip: Correct Fan Supply for Gameforce Ace
      arm64: dts: rockchip: Correct Joystick Axes on Gameforce Ace

Fabio Estevam (11):
      ARM: dts: rockchip: Remove rockchip,grf from rk3288 tsadc
      ARM: dts: rockchip: Move PHY reset to ethernet-phy node on rk3036 boards
      ARM: dts: rockchip: Fix RTC compatible on rk3288-phycore-rdk
      ARM: dts: rockchip: Use mount-matrix on rk3188-bqedison2qc
      ARM: dts: rockchip: Remove invalid regulator-property from rk3288-veyron
      ARM: dts: rockchip: Fix the Bluetooth node name on rk3288-veyron
      ARM: dts: rockchip: Fix the trackpad supply on rk3288-veyron-jerry
      ARM: dts: rockchip: Add missing the touchscreen interrupt on rk3288-phycore-rdk
      ARM: dts: rockchip: Fix RTC description on rk3288-firefly-reload
      ARM: dts: rockchip: Fix GMAC description n RK3288 boards
      ARM: dts: rockchip: Fix LED node names on rk3288-phycore-rdk

Heiko Stuebner (1):
      Revert "arm64: dts: rockchip: Further describe the WiFi for the Pinebook Pro"

Ming Wang (1):
      arm64: dts: rockchip: Fix Bluetooth stability on LCKFB TaiShan Pi

Robin Murphy (1):
      Revert "arm64: dts: rockchip: add SPDIF audio to Beelink A1"

 arch/arm/boot/dts/rockchip/rk3036-evb.dts          |  4 ++--
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts        |  4 ++--
 arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts  |  2 +-
 .../boot/dts/rockchip/rk3288-firefly-reload.dts    |  3 +--
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts  | 16 +++++++++------
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts |  2 --
 .../arm/boot/dts/rockchip/rk3288-veyron-fievel.dts |  5 ++---
 arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts   |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts |  2 +-
 .../arm/boot/dts/rockchip/rk3288-veyron-mickey.dts |  2 --
 arch/arm/boot/dts/rockchip/rk3288.dtsi             |  1 -
 arch/arm64/boot/dts/rockchip/rk3328-a1.dts         | 23 ----------------------
 .../boot/dts/rockchip/rk3399-pinebook-pro.dts      | 18 -----------------
 arch/arm64/boot/dts/rockchip/rk3566-lckfb-tspi.dts |  4 ++--
 .../boot/dts/rockchip/rk3588s-gameforce-ace.dts    | 12 +++++------
 16 files changed, 29 insertions(+), 73 deletions(-)




