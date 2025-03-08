Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B4D52C282EC
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  8 Mar 2025 17:45:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender
	:Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=nvOCa8TUyygxpNletdqlPdP/z6YHwnTBk1630GsnLOE=; b=GQIeiZsKqxesioBhv3UixlxcKg
	npTshYu3Sh30E7my3siYYbauDOFiaT1uyRs2iHbx8j2krql1IPPHEjV2evip3YmkWc8zsGJTky/12
	uhrCgYBduZQ4mhe0PxzYUmv4Tl74l+2YcFs58/3MPoB+Br8y1Q8GtUFa41uYn0UbKvvbpvAXiqykS
	bqP571B5jyezGYjipz+1XPG2gNBFk4DIMN/vWvYivvSymm9qGzrD3Z4QudaZRn1pRRmLMl3wXsgQH
	VfRorlOaXp8tAROnfQKkYpHcbiT96SQKmSSTx1q0zZAMRXcuJ6WdtOZdyJ+2q7uHHRRVNDAhCifnz
	OK8yafMg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tqyEr-0000000GxC7-2zC5;
	Sat, 08 Mar 2025 17:45:29 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tqy9L-0000000GwYX-3c9b;
	Sat, 08 Mar 2025 17:39:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:Content-ID:
	Content-Description:Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc
	:Resent-Message-ID:In-Reply-To:References:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=nvOCa8TUyygxpNletdqlPdP/z6YHwnTBk1630GsnLOE=; b=glu/xNwZRkdSMG24w3s68Hzdcp
	/v/OW1lmXWMMD3XiDE2yGV15hWunopjVarggcOlr7Mylb1gHfCoDBB9ys4p3RELwzIHA4dg/ajj1H
	Gza2Y/YxnZyHPmig0ILUsRg9irZJQxfCtzSs6Gzpj8m2X+LMWUPLzu+a+2LPD1Lb7Us5MvlFP+15m
	G4Ly8wXqwuBDzHCHHp9Uga9vKWK6hl/cAM9qy5qSn9TVGnrM7xeha5eVCO8ZRp0DJ7Ha+dp48zcV3
	cv9jUDziFmqqLAXvhayxporqMqr/j/vlXI5J+hwEpf9Y/I4jfHdmRy59MClhkPa5T7paq9KBRh4hu
	0LKwnKJA==;
Received: from [194.95.143.137] (helo=phil.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1tqy9K-0004cY-FI; Sat, 08 Mar 2025 18:39:46 +0100
From: Heiko Stuebner <heiko@sntech.de>
To: arm@kernel.org
Cc: soc@kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org
Subject: [GIT PULL] Rockchip dts fixes for 6.14 #2
Date: Sat, 08 Mar 2025 18:39:45 +0100
Message-ID: <1990830.tdWV9SEqCh@phil>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="utf-8"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250308_093947_906463_4F7DFBC5 
X-CRM114-Status: GOOD (  10.39  )
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

please find a below some additional fixes for the current
release 6.14 cycle.


Please pull

Thanks
Heiko


The following changes since commit 8546cfd08aa4b982acd2357403a1f15495d622ec:

  arm64: dts: rockchip: adjust SMMU interrupt type on rk3588 (2025-02-11 21:28:13 +0100)

are available in the Git repository at:

  git://git.kernel.org/pub/scm/linux/kernel/git/mmind/linux-rockchip.git tags/v6.14-rockchip-dtsfixes2

for you to fetch changes up to b36402e4a0772d1b3da06a4f5fbd1cfe4d6f1cc0:

  arm64: dts: rockchip: slow down emmc freq for rock 5 itx (2025-03-08 18:21:11 +0100)

----------------------------------------------------------------
A number of emmc fixes (removing CQE from Theobroma boards and slower
freq on Rock-5-ITX) as well as some pinmux fixes and missing supplies.

----------------------------------------------------------------
Dragan Simic (2):
      arm64: dts: rockchip: Add avdd HDMI supplies to RockPro64 board dtsi
      arm64: dts: rockchip: Add missing PCIe supplies to RockPro64 board dtsi

Heiko Stuebner (2):
      arm64: dts: rockchip: remove supports-cqe from rk3588 jaguar
      arm64: dts: rockchip: remove supports-cqe from rk3588 tiger

Jianfeng Liu (1):
      arm64: dts: rockchip: slow down emmc freq for rock 5 itx

Justin Klaassen (1):
      arm64: dts: rockchip: fix u2phy1_host status for NanoPi R4S

Quentin Schulz (2):
      arm64: dts: rockchip: fix pinmux of UART0 for PX30 Ringneck on Haikou
      arm64: dts: rockchip: fix pinmux of UART5 for PX30 Ringneck on Haikou

Yao Zi (1):
      arm64: dts: rockchip: Remove undocumented sdmmc property from lubancat-1

 arch/arm64/boot/dts/rockchip/px30-ringneck-haikou.dts | 12 ++++++++++++
 arch/arm64/boot/dts/rockchip/rk3399-nanopi-r4s.dtsi   |  2 +-
 arch/arm64/boot/dts/rockchip/rk3399-rockpro64.dtsi    | 14 ++++++++++++++
 arch/arm64/boot/dts/rockchip/rk3566-lubancat-1.dts    |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-jaguar.dts        |  1 -
 arch/arm64/boot/dts/rockchip/rk3588-rock-5-itx.dts    |  3 +--
 arch/arm64/boot/dts/rockchip/rk3588-tiger.dtsi        |  1 -
 7 files changed, 28 insertions(+), 6 deletions(-)




