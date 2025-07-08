Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8340CC83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:25:24 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=uygCH21KbdcGkN1lZ0Sna3b75q2CK0gWLRBqeJYnhYo=; b=P7sRsbsBkqH3kJzuaBYQimkdw4
	ZSf78LWdXO+KMfjOY/L+1OrgYG32wiwrqkGQwvc1aMXUxBhU1zxJAgrptssID9OmEBmaB75nk54ug
	c/11vZp9vWEEv1KqA3+tm1tyqPiv3BiIjbkDJkdY6xWm2MtRoP1VK0cjWlqfN8roNQWJj594WwWIq
	L8TBAUyJgo3H5U6D/+UyuZFpkRM0QcBylTDfKBYH+VbVXMapebXb5kKPZNxhZFm12PUW+HnTnI/um
	jBf7b3qgm/G+PA0iPNMKhGNxC1JtOnpGnItUIdRLwNOG9zBZBwkIvlPJqlNF2QW2fxVPItwthk0QS
	1u9Eip6w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFoU-00000006eip-23tK;
	Tue, 08 Jul 2025 21:25:18 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZF7w-00000006Xs5-3Xih;
	Tue, 08 Jul 2025 20:41:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=uygCH21KbdcGkN1lZ0Sna3b75q2CK0gWLRBqeJYnhYo=; b=u+yrMRrgBJXNuN+2fBDeMtSzP1
	zLsNSX3U50MzpnP+b4t1egPndg9OII9v9nXNjn5KDLv6SE+Tppp53b6/jonupNaSnCcpoUUyLrUEe
	Cf6NCv2MfHzx+9iRIdhI0wpc+s24JmAirSueEczSwCHuaDG/zXoXgdTjAY0LVY2uqoJF8TuYboRGP
	K+P6C3kT1CzO7kKju7bWyH8OVAbrrwmNIfOFdMOLzdwlGX7NK3XLsqnEKmglEghgYLWtIYEtUsmV1
	X0Bp3UKqA8NzcHEQBydRjPdcCtaPIink7ShHOdyYXqDtuApImXcmH5DA5fRFhBpoo/dXAqD/2gbBx
	wUxR8Yfw==;
Received: from i53875a8d.versanet.de ([83.135.90.141] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uZF7u-0006dd-Lo; Tue, 08 Jul 2025 22:41:18 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.16 #1
Date: Tue, 08 Jul 2025 22:41:18 +0200
Message-ID: <5108768.AiC22s8V5E@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_134120_907442_F80E0F24 
X-CRM114-Status: GOOD (  12.34  )
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

please find a below some fixes for the current 6.16 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 19272b37aa4f83ca52bdf9c16d5d81bdd1354494:

  Linux 6.16-rc1 (2025-06-08 13:44:43 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dtsfixes1

for you to fetch changes up to 9037532ab893635a46afe88542cd747a4a846497:

  arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a (2025-06-30 11:08:36 +0200)

----------------------------------------------------------------
Switch to the gpio variant for spi-cs and mmc-detect for some boards
as the in-controller functionality does not work as intended for them.
HDMI drive strength adjustment for better ddc communication and some
missing supplies.

----------------------------------------------------------------
Alexey Charkov (1):
      arm64: dts: rockchip: list all CPU supplies on ArmSoM Sige5

Andy Yan (3):
      arm64: dts: rockchip: Adjust the HDMI DDC IO driver strength for rk3588
      arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi CM5
      arm64: dts: rockchip: Add cd-gpios for sdcard detect on Cool Pi 4B

Diederik de Haas (1):
      arm64: dts: rockchip: Add missing fan-supply to rk3566-quartz64-a

Jakob Unterwurzacher (1):
      arm64: dts: rockchip: use cs-gpios for spi1 on ringneck

Shawn Lin (1):
      arm64: dts: rockchip: fix rk3576 pcie1 linux,pci-domain

 arch/arm64/boot/dts/rockchip/px30-ringneck.dtsi    | 23 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-quartz64-a.dts |  1 +
 .../boot/dts/rockchip/rk3576-armsom-sige5.dts      | 28 +++++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi           |  2 +-
 .../boot/dts/rockchip/rk3588-base-pinctrl.dtsi     | 20 ++++++-------
 .../arm64/boot/dts/rockchip/rk3588-coolpi-cm5.dtsi |  1 +
 .../boot/dts/rockchip/rk3588-extra-pinctrl.dtsi    |  5 ++--
 arch/arm64/boot/dts/rockchip/rk3588s-coolpi-4b.dts |  1 +
 arch/arm64/boot/dts/rockchip/rockchip-pinconf.dtsi | 35 ++++++++++++++++++++++
 9 files changed, 103 insertions(+), 13 deletions(-)




