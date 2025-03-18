Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 299CBC282EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Mar 2025 10:07:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Pjkzx95YrIHu1im/ERsuV/sJCTyvMl2w3ogiWL8ueNg=; b=SymfvaVxCiDQA6ONpYzgzr1Yaj
	6c9fClN/by2H9I4D2IrtlX7L5nYoOZrHJhrcaKtiFAd6rbOORV1cgbzBd3idAxk5bqdkpwC6Y6yej
	UmfTE+oSbGfcxrhHS5w+m9uhveuX8HUrQwE8HBuxo8RXK9fGd/XlxK9Q6AoXEPr0hcnbiaTSpxPuF
	h7+2aLWYLehK7EMvDOAdyVyUaBbcdR62sz3P8tZQhdYkVb314bOknStwS8NQYe3OK+IquU110V0Bc
	GerxxE3xG/6iStwH3oL7YUhx+9fLEA7Cey2TKd6HWAfrGM+POqkvo7FhViSEhNfaIMuATyUI/8iuI
	+olv2Rkg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTr0-00000005QwZ-2SFO;
	Tue, 18 Mar 2025 10:07:22 +0000
Received: from mail-m49198.qiye.163.com ([45.254.49.198])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tuTkI-00000005Peb-2uHB;
	Tue, 18 Mar 2025 10:00:29 +0000
Received: from amadeus-Vostro-3710.lan (unknown [116.25.94.202])
	by smtp.qiye.163.com (Hmail) with ESMTP id eac37608;
	Tue, 18 Mar 2025 18:00:21 +0800 (GMT+08:00)
From: Chukun Pan <amadeus@jmu.edu.cn>
To: Yao Zi <ziyao@disroot.org>
Cc: Rob Herring <robh@kernel.org>,
	Jonas Karlman <jonas@kwiboo.se>,
	Heiko Stuebner <heiko@sntech.de>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	devicetree@vger.kernel.org,
	Chukun Pan <amadeus@jmu.edu.cn>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add UART DMA support for RK3528
Date: Tue, 18 Mar 2025 18:00:10 +0800
Message-Id: <20250318100010.2253408-4-amadeus@jmu.edu.cn>
X-Mailer: git-send-email 2.25.1
In-Reply-To: <20250318100010.2253408-1-amadeus@jmu.edu.cn>
References: <20250318100010.2253408-1-amadeus@jmu.edu.cn>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFITzdXWS1ZQUlXWQ8JGhUIEh9ZQVkaSU5KVkkeT0sdQ09PTh8fT1YeHw5VEwETFhoSFy
	QUDg9ZV1kYEgtZQVlKSk1VSU5VQk9VSUtJWVdZFhoPEhUdFFlBWU9LSFVKS0hKTkxOVUpLS1VKQk
	tLWQY+
X-HM-Tid: 0a95a8b26f5f03a2kunmeac37608
X-HM-MType: 10
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6MAg6HRw5TTJILksVKA4rGAgq
	MjEKFB5VSlVKTE9JSUJJS0lKQklIVTMWGhIXVRoWGh8eDgg7ERYOVR4fDlUYFUVZV1kSC1lBWUpK
	TVVJTlVCT1VJS0lZV1kIAVlBSUJKQzcG
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250318_030026_924287_011164AF 
X-CRM114-Status: UNSURE (   8.04  )
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
index ad77e0ef70f2..1af0d036cf32 100644
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


