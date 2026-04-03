Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EAF98E8536B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Apr 2026 13:25:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=NF4JDG9gLpkgwa9sSYPibHIAixK9qPvEipevanGie4c=; b=AE1q7ouRwFW6tCcg8O/w9ovB3U
	3VIA6WcSDmdJNkCZbO+sI76kxIYv9bWDglMLBzq943FMqFI4JwfBcVoBg7dgCydfdgS6G6h9NHz21
	1SWdsdA4f9qInjQIvg25uhvM0ciAByEgoCzUL5ASLSLm0B3JqQtbzuGB1Cdvg7Yd6vd5olAlzb94t
	oMXWVQvUOBe3swoPlGu/x4sU0eOtDFZGJ3ZgYSWdGXMopY8iaooNi4whkEc4y+tCmmRdfd6wWNklG
	bKrFi5SBdDSFBvkkmvm63bgSGYlo3Ff9RCrz7Nhjtkn2iaXAq3Yj/ilNDtAhmSz1Z1GjH1o1pL4kj
	yYFI3qwQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8eWu-00000002492-2Xie;
	Fri, 03 Apr 2026 13:25:44 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w8eWr-0000000248W-38YD;
	Fri, 03 Apr 2026 13:25:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=NF4JDG9gLpkgwa9sSYPibHIAixK9qPvEipevanGie4c=; b=plb+/0EYqxQ+ZWruLdGpjcZs63
	F/Qry1QoQpyR2ruHVovbtvdcU0KkG7PjDd/AdhiuSurFwmcmKezUo8sRh/uMKNXxeqL1j+XzZ6GjV
	S5E3o7hAVIAwE2/zXy6Zol1t7fc2wZXXzpO+aLdQvwNdfcmddasc5Mkb+V71J+8o9vXpgqw6lqjDn
	q20BV2VqWAiFOoUcV8KXcdCzbJyrAzBPzT9RSO8hmoLOOUgTfrI6WpbmM1vxebQpNKg7y/NEQlH94
	p8RETiUXkyFULd3OZvFF3Gg8ILGyXlE4D/3xVMQpNdHIozItXmfJUj77IFL+PsKUWj+aR+QeHwwwP
	W51lbgHw==;
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 7.1 #1
Date: Fri, 03 Apr 2026 15:25:36 +0200
Message-ID: <2771700.BddDVKsqQX@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260403_062541_815568_DC2E703B 
X-CRM114-Status: GOOD (  10.26  )
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

please find below Rockchip ARM32 DT changes for the merge-window for 7.1 .


Please pull.
Thanks
Heiko


The following changes since commit 6de23f81a5e08be8fbf5e8d7e9febc72a5b5f27f:

  Linux 7.0-rc1 (2026-02-22 13:18:59 -0800)

are available in the Git repository at:

  https://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v7.1-rockchip-dts32-1

for you to fetch changes up to 94c8dc1fa8e1ad4037084204152bca1e799d7d1c:

  ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky (2026-03-24 17:06:35 +0100)

----------------------------------------------------------------
A number of dt-schema cleanups that are log standing, so not suitable
as fix for the current release.

----------------------------------------------------------------
Fabio Estevam (12):
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
      ARM: dts: rockchip: Pass linux,code to the power key on rk3288-veyron-pinky

 arch/arm/boot/dts/rockchip/rk3036-evb.dts            |  4 ++--
 arch/arm/boot/dts/rockchip/rk3036-kylin.dts          |  4 ++--
 arch/arm/boot/dts/rockchip/rk3188-bqedison2qc.dts    |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-firefly-reload.dts |  3 +--
 arch/arm/boot/dts/rockchip/rk3288-phycore-rdk.dts    | 16 ++++++++++------
 arch/arm/boot/dts/rockchip/rk3288-phycore-som.dtsi   |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-brain.dts   |  2 --
 arch/arm/boot/dts/rockchip/rk3288-veyron-fievel.dts  |  5 ++---
 arch/arm/boot/dts/rockchip/rk3288-veyron-jaq.dts     |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-jerry.dts   |  2 +-
 arch/arm/boot/dts/rockchip/rk3288-veyron-mickey.dts  |  2 --
 arch/arm/boot/dts/rockchip/rk3288-veyron-pinky.dts   |  1 +
 arch/arm/boot/dts/rockchip/rk3288.dtsi               |  1 -
 13 files changed, 22 insertions(+), 24 deletions(-)




