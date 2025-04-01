Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7CD41C36014
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Apr 2025 10:24:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=K+gpiV3Oj0r8DyVqTi3Fg08ROBO54vsjc3Eoz/NmAz8=; b=MLzQDgKjoneW+fqIvURhd5j9az
	tN/BDkKxk7J9fGgIJz/jwsdxCSr48DTGof9Klba1vYbnHWBqvuQn/iwb+0f1slNEdYKdG0DtfqsH8
	J576Zo0B63WZA0L3cD1Vg9qes87IArcQ7kiLp3LkDgUTuaHUd34WAkepMSD8JdP4hmTWiyR9VTBpw
	1au1SjSFk2Ygoc85Lz0ztUGZkPmtNCd9++vvmrx4JTJ0hx1WcciNVISi0mfhnUAxOzP3etM9T+2Ps
	fnNk9O6RKrkcRIZnEBqG4L4Jhyuge+AoWA3KUBrLr5PaEUrDUm3k8ezDDuqoWsIoWCeKcziL08ANu
	OFxTguCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYnP-00000002cZl-0J2r;
	Tue, 01 Apr 2025 10:24:39 +0000
Received: from mail-m155101.qiye.163.com ([101.71.155.101])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1tzYQ6-00000002Y4c-1XxL;
	Tue, 01 Apr 2025 10:00:36 +0000
Received: from amadeus-Vostro-3710.lan (unknown [IPV6:240e:3b3:2c00:430:ae31:3177:4f09:da96])
	by smtp.qiye.163.com (Hmail) with ESMTP id 10501cb00;
	Tue, 1 Apr 2025 18:00:31 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org
Subject: [PATCH v2 3/3] arm64: dts: rockchip: Add UART DMA support for RK3528
Date: Tue,  1 Apr 2025 18:00:20 +0800
Message-Id: <20250401100020.944658-4-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250401100020.944658-1-amadeus@jmu.edu.cn>
References: <20250401100020.944658-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaTklNVkoZH0tPSUJNGU5JGFYeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlJT0seQUgZSEFJGEtLQU9IS0EaHkhKQUhKTExBTx1LQkEfGkJNWVdZFhoPEh
	UdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQktLWQY+
X-HM-Tid: 0a95f0cba06303a2kunm10501cb00
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6PSI6KTo6DzJRDwoaFS0IFEs4
	Hx1PCzxVSlVKTE9ITktKTUhJTk1MVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUlP
	Sx5BSBlIQUkYS0tBT0hLQRoeSEpBSEpMTEFPHUtCQR8aQk1ZV1kIAVlBSExDTDcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250401_030034_579549_D693A324 
X-CRM114-Status: UNSURE (   8.25  )
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

The UART ports on RK3528 have DMA capability, describe it.
Flow control is optional, so dma-names are not added.

Signed-off-by: Chukun Pan <amadeus@jmu.edu.cn>
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 8 ++++++++
 1 file changed, 8 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index c366766ee3f5..35704d0be37a 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -375,6 +375,7 @@ uart0: serial@ff9f0000 {
 			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac 8>, <&dmac 9>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -386,6 +387,7 @@ uart1: serial@ff9f8000 {
 			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac 10>, <&dmac 11>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -397,6 +399,7 @@ uart2: serial@ffa00000 {
 			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac 12>, <&dmac 13>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -408,6 +411,7 @@ uart3: serial@ffa08000 {
 			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac 14>, <&dmac 15>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -419,6 +423,7 @@ uart4: serial@ffa10000 {
 			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac 16>, <&dmac 17>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -430,6 +435,7 @@ uart5: serial@ffa18000 {
 			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac 18>, <&dmac 19>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -441,6 +447,7 @@ uart6: serial@ffa20000 {
 			clocks = <&cru SCLK_UART6>, <&cru PCLK_UART6>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac 20>, <&dmac 21>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -452,6 +459,7 @@ uart7: serial@ffa28000 {
 			clocks = <&cru SCLK_UART7>, <&cru PCLK_UART7>;
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
+			dmas = <&dmac 22>, <&dmac 23>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
-- 
2.25.1


