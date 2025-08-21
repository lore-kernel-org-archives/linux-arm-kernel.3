Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 836ACCA0EED
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 22 Aug 2025 04:34:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FisHcql+V+/m643js1MdbE6gdMnibSHHvbfcAxNA4Z8=; b=hAVGJTDfD4DMv3t9h+7JjEEOE2
	3msyqUZJTSLAVRhKALQYqViZfQ6ipK4hVYNE+Dn6jebkzXB41FXK8G/VSNeePtMTNqqE+fDt1AEcG
	9t6T8v3TO2Db7mXs80fl/zM3SVrDzfn097RT9XgqTV7Xv8S+N+ENreZej3VwSpOS9V7XNQsU15rdE
	DrCYcUgtQoJ0LqwKCHNNKlcq1iLRE5vZlZLH9ldhRUkCo/v+AqDiKjYVzRJJXUH/Cc8zrSg+2MEwG
	0a/zuIDiomBlrsfRq1P26PFxNVnZbddX7f2TrIR8A3t/K/75elzpwzk3Y71hzmNChjbRS3g42IQH+
	yvEiSZoQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upJTc-00000001Vlw-2KzX;
	Fri, 22 Aug 2025 04:34:09 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1upCgU-00000000eBl-05M1
	for linux-arm-kernel@lists.infradead.org;
	Thu, 21 Aug 2025 21:18:59 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1755811137; bh=FisHcql+V+/m643js1MdbE6gdMnibSHHvbfcAxNA4Z8=;
 b=wAAlHnGiJW4aMCK2k9GDw8gVW6avIuacMFk1BFg/XK9ijAqG8T/8UGdf804c3CQq59yU9dhf1
 bbHapiJ0nFXgcRG1/lmocMBnyHW30yor2pNQiLZNxniE0xsJEdgviKFdgQUL4cVb1Y2t1ZV6pYT
 eSHifLOaE9foXyJJEm/nt4wXzxWo70iiDuPungbk6T8h759C3JJUSFO9YFflbGSIhBEXW5WzkIN
 MAeNotsKg4mcM0zFE8ApeiCDm3FZ1ZfB9nTgoBL9OXFVkJhx5hw6kZBe8Nn3WAvFHePrzXefdsc
 VZ1gLpDpfnrBT5z0VS0AkXIVsBR96VMsCxtaZoY7kVvA==
X-Forward-Email-ID: 68a78d3e1990298b555d6906
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.2.9
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH v3 1/1] arm64: dts: rockchip: Enable more power domains for RK3528
Date: Thu, 21 Aug 2025 21:18:41 +0000
Message-ID: <20250821211843.3051349-2-jonas@kwiboo.se>
X-Mailer: git-send-email 2.51.0
In-Reply-To: <20250821211843.3051349-1-jonas@kwiboo.se>
References: <20250821211843.3051349-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250821_141858_119153_5FEBFC05 
X-CRM114-Status: GOOD (  12.07  )
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

Describe device power-domains and enable the PD_RKVENC, PD_VO and PD_VPU
power-domains on RK3528.

The PD_RKVDEC is used by RKVDEC and DDRPHY CRU, and is kept disabled to
prevent a full system reset trying to read the rate of the SCMI_CLK_DDR
clock.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Changes in v3:
- No change
- Rebased on top of next-20250821

Changes in v2:
- Add power-domains for spi nodes
- Rebased on top of next-20250722
---
 arch/arm64/boot/dts/rockchip/rk3528.dtsi | 30 +++++++++++++++++++++---
 1 file changed, 27 insertions(+), 3 deletions(-)

diff --git a/arch/arm64/boot/dts/rockchip/rk3528.dtsi b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
index 54fa8089c4d3..85bc3f5aa2c7 100644
--- a/arch/arm64/boot/dts/rockchip/rk3528.dtsi
+++ b/arch/arm64/boot/dts/rockchip/rk3528.dtsi
@@ -155,6 +155,7 @@ gpio1: gpio@ffaf0000 {
 			gpio-ranges = <&pinctrl 0 32 32>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			power-domains = <&power RK3528_PD_VPU>;
 		};
 
 		gpio2: gpio@ffb00000 {
@@ -167,6 +168,7 @@ gpio2: gpio@ffb00000 {
 			gpio-ranges = <&pinctrl 0 64 32>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			power-domains = <&power RK3528_PD_VO>;
 		};
 
 		gpio3: gpio@ffb10000 {
@@ -179,6 +181,7 @@ gpio3: gpio@ffb10000 {
 			gpio-ranges = <&pinctrl 0 96 32>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			power-domains = <&power RK3528_PD_VPU>;
 		};
 
 		gpio4: gpio@ffb20000 {
@@ -191,6 +194,7 @@ gpio4: gpio@ffb20000 {
 			gpio-ranges = <&pinctrl 0 128 32>;
 			interrupt-controller;
 			#interrupt-cells = <2>;
+			power-domains = <&power RK3528_PD_RKVENC>;
 		};
 	};
 
@@ -501,7 +505,6 @@ power-domain@RK3528_PD_RKVENC {
 					reg = <RK3528_PD_RKVENC>;
 					pm_qos = <&qos_rkvenc>;
 					#power-domain-cells = <0>;
-					status = "disabled";
 				};
 				power-domain@RK3528_PD_VO {
 					reg = <RK3528_PD_VO>;
@@ -515,7 +518,6 @@ power-domain@RK3528_PD_VO {
 						 <&qos_vdpp>,
 						 <&qos_vop>;
 					#power-domain-cells = <0>;
-					status = "disabled";
 				};
 				power-domain@RK3528_PD_VPU {
 					reg = <RK3528_PD_VPU>;
@@ -529,7 +531,6 @@ power-domain@RK3528_PD_VPU {
 						 <&qos_usb3otg>,
 						 <&qos_vpu>;
 					#power-domain-cells = <0>;
-					status = "disabled";
 				};
 			};
 		};
@@ -571,6 +572,7 @@ spi0: spi@ff9c0000 {
 			interrupts = <GIC_SPI 131 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 25>, <&dmac 24>;
 			dma-names = "tx", "rx";
+			power-domains = <&power RK3528_PD_RKVENC>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -585,6 +587,7 @@ spi1: spi@ff9d0000 {
 			interrupts = <GIC_SPI 132 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 31>, <&dmac 30>;
 			dma-names = "tx", "rx";
+			power-domains = <&power RK3528_PD_VPU>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -609,6 +612,7 @@ uart1: serial@ff9f8000 {
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 11>, <&dmac 10>;
+			power-domains = <&power RK3528_PD_RKVENC>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -621,6 +625,7 @@ uart2: serial@ffa00000 {
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 13>, <&dmac 12>;
+			power-domains = <&power RK3528_PD_VPU>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -633,6 +638,7 @@ uart3: serial@ffa08000 {
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 15>, <&dmac 14>;
+			power-domains = <&power RK3528_PD_RKVENC>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -645,6 +651,7 @@ uart4: serial@ffa10000 {
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 17>, <&dmac 16>;
+			power-domains = <&power RK3528_PD_VO>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -657,6 +664,7 @@ uart5: serial@ffa18000 {
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 19>, <&dmac 18>;
+			power-domains = <&power RK3528_PD_VPU>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -669,6 +677,7 @@ uart6: serial@ffa20000 {
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 21>, <&dmac 20>;
+			power-domains = <&power RK3528_PD_VPU>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -681,6 +690,7 @@ uart7: serial@ffa28000 {
 			clock-names = "baudclk", "apb_pclk";
 			interrupts = <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>;
 			dmas = <&dmac 23>, <&dmac 22>;
+			power-domains = <&power RK3528_PD_VPU>;
 			reg-io-width = <4>;
 			reg-shift = <2>;
 			status = "disabled";
@@ -693,6 +703,7 @@ i2c0: i2c@ffa50000 {
 			clocks = <&cru CLK_I2C0>, <&cru PCLK_I2C0>;
 			clock-names = "i2c", "pclk";
 			interrupts = <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3528_PD_RKVENC>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -705,6 +716,7 @@ i2c1: i2c@ffa58000 {
 			clocks = <&cru CLK_I2C1>, <&cru PCLK_I2C1>;
 			clock-names = "i2c", "pclk";
 			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3528_PD_RKVENC>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -731,6 +743,7 @@ i2c3: i2c@ffa68000 {
 			clocks = <&cru CLK_I2C3>, <&cru PCLK_I2C3>;
 			clock-names = "i2c", "pclk";
 			interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3528_PD_VPU>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -745,6 +758,7 @@ i2c4: i2c@ffa70000 {
 			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c4_xfer>;
+			power-domains = <&power RK3528_PD_VO>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -757,6 +771,7 @@ i2c5: i2c@ffa78000 {
 			clocks = <&cru CLK_I2C5>, <&cru PCLK_I2C5>;
 			clock-names = "i2c", "pclk";
 			interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3528_PD_VPU>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -769,6 +784,7 @@ i2c6: i2c@ffa80000 {
 			clocks = <&cru CLK_I2C6>, <&cru PCLK_I2C6>;
 			clock-names = "i2c", "pclk";
 			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3528_PD_VPU>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -783,6 +799,7 @@ i2c7: i2c@ffa88000 {
 			interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&i2c7_xfer>;
+			power-domains = <&power RK3528_PD_VO>;
 			#address-cells = <1>;
 			#size-cells = <0>;
 			status = "disabled";
@@ -874,6 +891,7 @@ saradc: adc@ffae0000 {
 			clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
 			clock-names = "saradc", "apb_pclk";
 			interrupts = <GIC_SPI 140 IRQ_TYPE_LEVEL_HIGH>;
+			power-domains = <&power RK3528_PD_VPU>;
 			resets = <&cru SRST_P_SARADC>;
 			reset-names = "saradc-apb";
 			#io-channel-cells = <1>;
@@ -894,6 +912,7 @@ gmac0: ethernet@ffbd0000 {
 			interrupt-names = "macirq", "eth_wake_irq";
 			phy-handle = <&rmii0_phy>;
 			phy-mode = "rmii";
+			power-domains = <&power RK3528_PD_VO>;
 			resets = <&cru SRST_A_MAC_VO>;
 			reset-names = "stmmaceth";
 			rockchip,grf = <&vo_grf>;
@@ -952,6 +971,7 @@ gmac1: ethernet@ffbe0000 {
 			interrupts = <GIC_SPI 121 IRQ_TYPE_LEVEL_HIGH>,
 				     <GIC_SPI 124 IRQ_TYPE_LEVEL_HIGH>;
 			interrupt-names = "macirq", "eth_wake_irq";
+			power-domains = <&power RK3528_PD_VPU>;
 			resets = <&cru SRST_A_MAC>;
 			reset-names = "stmmaceth";
 			rockchip,grf = <&vpu_grf>;
@@ -1002,6 +1022,7 @@ sdhci: mmc@ffbf0000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&emmc_bus8>, <&emmc_clk>, <&emmc_cmd>,
 				    <&emmc_strb>;
+			power-domains = <&power RK3528_PD_VPU>;
 			resets = <&cru SRST_C_EMMC>, <&cru SRST_H_EMMC>,
 				 <&cru SRST_A_EMMC>, <&cru SRST_B_EMMC>,
 				 <&cru SRST_T_EMMC>;
@@ -1023,6 +1044,7 @@ sdio0: mmc@ffc10000 {
 			max-frequency = <200000000>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>;
+			power-domains = <&power RK3528_PD_VPU>;
 			resets = <&cru SRST_H_SDIO0>;
 			reset-names = "reset";
 			status = "disabled";
@@ -1042,6 +1064,7 @@ sdio1: mmc@ffc20000 {
 			max-frequency = <200000000>;
 			pinctrl-names = "default";
 			pinctrl-0 = <&sdio1_bus4>, <&sdio1_clk>, <&sdio1_cmd>;
+			power-domains = <&power RK3528_PD_VPU>;
 			resets = <&cru SRST_H_SDIO1>;
 			reset-names = "reset";
 			status = "disabled";
@@ -1062,6 +1085,7 @@ sdmmc: mmc@ffc30000 {
 			pinctrl-names = "default";
 			pinctrl-0 = <&sdmmc_bus4>, <&sdmmc_clk>, <&sdmmc_cmd>,
 				    <&sdmmc_det>;
+			power-domains = <&power RK3528_PD_VO>;
 			resets = <&cru SRST_H_SDMMC0>;
 			reset-names = "reset";
 			rockchip,default-sample-phase = <90>;
-- 
2.51.0


