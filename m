Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBE9DC3ABC0
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 22:09:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=XOOW2EUAAkzOiMNrI7nZRykfkfumE4ulNre1oUwjw0k=; b=o9/9HapXyxlGLhBxAL+SZNN6hU
	06GnK0q5UN9++UzVMLYJG7Yh/h+O28K4Fuc0K4wxChCNd6aNGGfxVzhm2ZXBxTEzVEzj/lW5Esxpq
	zjAPWXj0D/KNJKtWIRT2DKoK3DXK+4X5L0HzYLG2450qyiFLKymPzPzGpfsg2ITrfQJ3gO4gKe7Ll
	B43AeFgrBaTUYOutgVOGLB3+rx1GSGV0Fyf6TnZfpEyEYG0zX8eMeCBkFR5HibuWUhqnylwULkLFB
	l4YSBUq6bhpn41unOxQQvIPt0Cs1K4Vtbji1PM3c0Xu4xrVZUoftr2m4JWY61qa6rcFnMFKFkznaf
	+Xz4Sa4w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmwn-0000000Gr62-1Mjm;
	Wed, 07 May 2025 22:09:01 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCmtR-0000000Gqmx-1EPw;
	Wed, 07 May 2025 22:05:34 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References;
	bh=XOOW2EUAAkzOiMNrI7nZRykfkfumE4ulNre1oUwjw0k=; b=srsu48tEVyFTb/Ww1u/Fsaqklb
	FiffOd40xuLFHK5taN+NUczbm4B/RorVqeYpyXa6uFBK2Dvn+jg9kkOcoK+F3IBoAv1+dBQCqcgAl
	YUfrtEtrZuzff27EfxNBN1sWBQR6J3hZPzGUmrMxOmZHbSLDcyUlU0KIThbvKwdfU0hyW2pHPpUcI
	ffI5TmqUg6YjyZYks97r1+myjNybzl0rTd2oPZLv/uttWL2WpJQ2qreLXJMqF0thrE9XGZTn1QVeA
	JTMWlzCC2Tm358GfqL1X/ZArmyPYvskK9evEFe7uR1Z+g9WSIucQ55MD7ph+9FkjWY6VskTt1yh7u
	LA1qkblA==;
Received: from i53875a1d.versanet.de ([83.135.90.29] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1uCmtQ-0001z2-33; Thu, 08 May 2025 00:05:32 +0200
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts32 changes for 6.16 #1
Date: Thu, 08 May 2025 00:05:31 +0200
Message-ID: <22686731.EfDdHjke4D@diego>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_150533_334625_EA277CC2 
X-CRM114-Status: UNSURE (   9.70  )
X-CRM114-Notice: Please train this message.
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

The following changes since commit 0af2f6be1b4281385b618cb86ad946eded089ac8:

  Linux 6.15-rc1 (2025-04-06 13:11:33 -0700)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.16-rockchip-dts32-1

for you to fetch changes up to c895c32bf1ce90839fc525c5d23cbf867ebe519a:

  ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard (2025-05-05 10:20:11 +0200)

----------------------------------------------------------------
Graphics support for the old rk3066-marsboard (hdmi + Mali400 gpu),
rk3036 improvements (mmc asliases, hdmi refclk), dropping of
redundant clock-latency props.

----------------------------------------------------------------
Andy Yan (3):
      ARM: dts: rockchip: Add aliases for rk3036-kylin MMC devices
      ARM: dts: rockchip: Add ref clk for hdmi
      Revert "ARM: dts: rockchip: drop grf reference from rk3036 hdmi"

Heiko Stuebner (2):
      ARM: dts: rockchip: enable hdmi on rk3066 marsboard
      ARM: dts: rockchip: enable Mali gpu on rk3066 marsboard

Rob Herring (Arm) (1):
      ARM: dts: rockchip: Drop redundant CPU "clock-latency"

 arch/arm/boot/dts/rockchip/rk3036-kylin.dts      |  6 ++++
 arch/arm/boot/dts/rockchip/rk3036.dtsi           |  5 ++--
 arch/arm/boot/dts/rockchip/rk3066a-marsboard.dts | 37 ++++++++++++++++++++++++
 arch/arm/boot/dts/rockchip/rk3128.dtsi           |  8 ++++-
 arch/arm/boot/dts/rockchip/rk3188.dtsi           |  1 -
 arch/arm/boot/dts/rockchip/rk322x.dtsi           |  1 -
 arch/arm/boot/dts/rockchip/rk3288.dtsi           |  5 +---
 arch/arm/boot/dts/rockchip/rv1108.dtsi           |  1 -
 8 files changed, 54 insertions(+), 10 deletions(-)




