Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1BF5CE8D6B
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 17 Nov 2025 22:18:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XiZiGkVbdwxVtmjL5kAkat9pwJdn+ImV6RiVmdUZKRM=; b=hOjhL83BQ0NEls9zRIpicK2cja
	coo+vxl+T3cKKKsRAceufJZVE/ntVZOlonGuza3GfWjZmuIyAcqzx5jSaRXZ/33oQYezLExhqC9kK
	7mYNG5M8FXr1+u40N4oUclex12bp3Xc6pAM74G6Fyw/ILW1XPFiPgPKzDR7ajJbV+C8TyKhooU6tc
	q/qwvcwCx3vtYJOdUfztp/Tl9sS5rN5YQOe4GQk0KgdGjIMU37dTSAzufeVmCPGy8aunKiyGb6Wkq
	iw23kigaI8OsYMSby/DyFlGzs/8W2hXgdiBhu5rDyY3hiAgiktdSteAfYHsWYklACWYwtmNO+UeY2
	EUp8SkwA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7YU-0000000GwOu-2l2L;
	Mon, 17 Nov 2025 22:18:38 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vL7YR-0000000GwOG-34cJ;
	Mon, 17 Nov 2025 22:18:36 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Reply-To:In-Reply-To:References;
	bh=XiZiGkVbdwxVtmjL5kAkat9pwJdn+ImV6RiVmdUZKRM=; b=09MTnJr3HJJistsIGUge7eYPUs
	uNcDwLQaxEykrCSLBgcIMm1u9TPRUpKMHaIyqxoac6VRqEpI5uQTEUvFn4UGDpXLEtTmJCwGfVcK+
	GEiWzWh/9ekVdfs2jE4I6151B0eYzDsFAT26AM6Ym41/VAwcfTQPwAaJuZuGXVuZnCrGnZct5mDLr
	PR001IexrT/XM5TaSG9wm7lXaP4CMnoh24/nFO8KZwQQshzUqTtoF7VGYqo9CBoDKMoXAzsKT/gGg
	iGG3C2SIfo/pU8R0zjFbN/kYdp7McMiNzGUYd09iBDxgY0gaFZECnjK+urywQvQTgLK4z426ZULHN
	fm6QZ0dw==;
Received: from [31.12.4.86] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1vL7YP-0001OR-Qq; Mon, 17 Nov 2025 23:18:33 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.18 #1
Date: Mon, 17 Nov 2025 23:18:32 +0100
Message-ID: <1901272.VLH7GnMWUR@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251117_141835_778361_F25246DF 
X-CRM114-Status: GOOD (  11.28  )
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

please find a below some Rockchip fixes for the current 6.18 release-cycle.

Please pull

Thanks
Heiko


The following changes since commit 3a8660878839faadb4f1a6dd72c3179c1df56787:

  Linux 6.18-rc1 (2025-10-12 13:42:36 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.18-rockchip-dtsfixes1

for you to fetch changes up to b5414520793e68d266fdd97a84989d9831156aad:

  arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on orangepi-5 (2025-11-14 00:15:33 +0100)

----------------------------------------------------------------
Regulator/supply fixes for a number of boards, removed too fast
cpu OPPs from rk3576 (not supported in newer vendor TF-A and never
supported in upstream TF-A). As well as some DTS validation fixes
and one pinctrl fix for the odroid-m1.

----------------------------------------------------------------
Alexey Charkov (1):
      arm64: dts: rockchip: Remove non-functioning CPU OPPs from RK3576

Anand Moon (1):
      arm64: dts: rockchip: Set correct pinctrl for I2S1 8ch TX on odroid-m1

Andrey Leonchikov (2):
      arm64: dts: rockchip: Fix PCIe power enable pin for BigTreeTech CB2 and Pi2
      arm64: dts: rockchip: Fix USB power enable pin for BTT CB2 and Pi2

Chukun Pan (1):
      arm64: dts: rockchip: drop reset from rk3576 i2c9 node

Diederik de Haas (2):
      arm64: dts: rockchip: Drop 'rockchip,grf' prop from tsadc on rk3328
      arm64: dts: rockchip: Fix vccio4-supply on rk3566-pinetab2

Dragan Simic (1):
      arm64: dts: rockchip: Make RK3588 GPU OPP table naming less generic

Heiko Stuebner (1):
      arm64: dts: rockchip: Fix indentation on rk3399 haikou demo dtso

Mykola Kvach (1):
      arm64: dts: rockchip: fix PCIe 3.3V regulator voltage on orangepi-5

Quentin Schulz (2):
      arm64: dts: rockchip: include rk3399-base instead of rk3399 in rk3399-op1
      arm64: dts: rockchip: disable HS400 on RK3588 Tiger

 arch/arm64/boot/dts/rockchip/rk3328.dtsi                   |  1 -
 arch/arm64/boot/dts/rockchip/rk3399-op1.dtsi               |  2 +-
 .../boot/dts/rockchip/rk3399-puma-haikou-video-demo.dtso   | 10 +++++-----
 arch/arm64/boot/dts/rockchip/rk3566-bigtreetech-cb2.dtsi   |  6 +++---
 arch/arm64/boot/dts/rockchip/rk3566-pinetab2.dtsi          |  2 +-
 arch/arm64/boot/dts/rockchip/rk3568-odroid-m1.dts          |  2 ++
 arch/arm64/boot/dts/rockchip/rk3576.dtsi                   | 14 --------------
 arch/arm64/boot/dts/rockchip/rk3588-opp.dtsi               |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi             |  4 +---
 arch/arm64/boot/dts/rockchip/rk3588j.dtsi                  |  2 +-
 arch/arm64/boot/dts/rockchip/rk3588s-orangepi-5.dts        |  4 ++--
 11 files changed, 17 insertions(+), 32 deletions(-)




