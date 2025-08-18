Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4A133CA0EE4
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 Aug 2025 14:48:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-Id:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=14g16+de/odmmXtao8NFMoiKqAYnYCId2A163GZoowI=; b=s9+Kabk0eoavJrKKF1LPAAU60k
	PMAdR7pJL45lJRV2Nd+RCrpY0tjm+O4phpqfvcAm7k3h66J5vxYTHHxbpgVtSPigCIo2oNClTPxL3
	CDzdBjh4dqYVzZqFrO07rpaybl+xg6r9q2bjGjM2rx9b66ZrC1n5PO3yEt0bwaMLquF/tkAVXnaiS
	KBEgorvzz8ohZ1Bs+5pqABeqpHQHp2FRTRrSo/WcRY5jVanbQ3S84/buy5XAoCKaujLqYeaUCA6+0
	yYQOQmxorejTtAH+nzD47OyRtLoZ0ZrqftKJrapnRhNo2FOqGeR1MePFskYncbBG32kqWjs5a9yBh
	MCYSNI0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uo1AG-00000007oZa-0TyJ;
	Mon, 18 Aug 2025 14:48:48 +0000
Received: from mail-m49197.qiye.163.com ([45.254.49.197])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1unwfA-000000076zP-48no;
	Mon, 18 Aug 2025 10:00:26 +0000
Received: from localhost.localdomain (unknown [119.122.213.154])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1fbaa9cfa;
	Mon, 18 Aug 2025 18:00:14 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Chukun Pan <amadeus@jmu.edu.cn>,
	Rob Herring <robh@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH 0/4] arm64: dts: rockchip: Add HINLINK H66K/H68K
Date: Mon, 18 Aug 2025 18:00:05 +0800
Message-Id: <20250818100009.170202-1-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a98bc9f502103a2kunm3d9619f636a214
X-HM-MType: 10
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVlDTUlJVhlOSxhJQ0lNGhlJGVYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSkJVSklJVUlKSFVKTk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0tVSktLVU
	tZBg++
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250818_030025_194130_1EDAB835 
X-CRM114-Status: UNSURE (   9.64  )
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

The HINLINK H66K and H68K are development boards with the Rockchip
RK3568 SoC. These boards are all SoM plus expansion board structures.

Both boards can be booted from eMMC or SD-card using the
U-Boot 2025.07 generic-rk3568 target.

The SoM board has CPU, RAM, eMMC and RK809 PMIC.
There is no schematic for this part.

The rest of the schematic can be found here:
https://www.hinlink.cn/wp-content/uploads/2024/03/20250329151432672651.pdf
https://files.seeedstudio.com/wiki/LinkStar_V2/H68K_V2_Schematic.pdf

It should be noted that there is a version of SeeedStudio called
LinkStar H68K, which is different from HINLINK H68K only in the shell.

The HINLINK H68K has two versions distinguished by the shell, and there
is no actual difference. This series is tested on H68K and H68K-V2.

difference |      H66K/H68K    |  H66K/H68K-V2
           | 1x USB 3.0 Type-A | 1x USB 3.0 Type-A
    USB    | 2x USB 2.0 Type-A | 1x USB 2.0 Type-A
           |                   | 1x USB 2.0 (M.2 slot)

Chukun Pan (4):
  dt-bindings: vendor-prefixes: Add HINLINK
  dt-bindings: arm: rockchip: Add HINLINK H66K / H68K
  arm64: dts: rockchip: Add HINLINK H68K
  arm64: dts: rockchip: Add HINLINK H66K

 .../devicetree/bindings/arm/rockchip.yaml     |   7 +
 .../devicetree/bindings/vendor-prefixes.yaml  |   2 +
 arch/arm64/boot/dts/rockchip/Makefile         |   2 +
 .../boot/dts/rockchip/rk3568-hinlink-h66k.dts |  10 +
 .../boot/dts/rockchip/rk3568-hinlink-h68k.dts |  83 +++
 .../boot/dts/rockchip/rk3568-hinlink-opc.dtsi | 666 ++++++++++++++++++
 6 files changed, 770 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-hinlink-h66k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-hinlink-h68k.dts
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3568-hinlink-opc.dtsi

-- 
2.25.1


