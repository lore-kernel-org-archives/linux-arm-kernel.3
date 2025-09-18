Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C8DCACA1013
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 18 Sep 2025 18:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=1kopJUYQDkU8ZwT3Pw52jOeZ/55xWnLcRkSfLDm+law=; b=btkLoBBBfSls1RpyW/t68i8fJo
	lsYImmlmUInRyXPAZhqCJ05XnxKJU9aN2+Rs4S6RveE0r1UTls3asoqn4UKNqKXCcxs132aPUDFoq
	9vBgvmNsT2IqGLNM2gjmk5nrK+MGyollDAveDTsW+8dWuWE7m5YxXWEMeljipy42YktgLu6C/aM7l
	huHHUCztA1q+slMhijeqBPP/teaf3RMFWVaZaNgUaO4mIlJ2LtTKZoLD4g032NxlBTLmsQxSl1Xbb
	J9r/7rXvBYZMChgl4RVhNoydAbIduB9j3XfjBMlKwheIhWalUtEwaa3bjFw481W7QTm3BtUS4fXb3
	QAPPYLFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJhp-00000000ums-25xI;
	Thu, 18 Sep 2025 18:50:09 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uzJhf-00000000ufI-31U6;
	Thu, 18 Sep 2025 18:49:59 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 0789D60248;
	Thu, 18 Sep 2025 18:49:59 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 800EFC19421;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1758221398;
	bh=65t1RPp0ka+Y5SQw4gZNb7wOM4Xg/4h5FQ+MMy0If5o=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=cPYRYtUxsRVr9TyEYjCtAQTqYPvJrV1iY9MI6vrjRkwS/ofN48fRnHmKGT2MPRLOX
	 8+G8kJGwfWV4aaqZnUoR79jTLrXH9wC3uNTdABh5TW2aLaa1hdcmPX2502qAaqlz1y
	 KOZ4/9SR648YUuTRIkWyrCHqwwTKxIs/64TmBhMQOZfJx9NcvHvvuxZjNYdeaumcc9
	 RRm9kTWVHnUIwBEbKBQ07vlUQTmpUSg4+1i7RBP8RWQ15G2U/9Ho+8wToWa+iTo9Yj
	 7yYZbXR7dGaRGMHGVEcAa21cE7q7XAzRSdVvHWnUXimqBTPu8bz1v9tJLeBjYUnJO1
	 bOCeMGi+vT0aA==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 76D83CA1013;
	Thu, 18 Sep 2025 18:49:58 +0000 (UTC)
From: Dang Huynh via B4 Relay <devnull+dang.huynh.mainlining.org@kernel.org>
Date: Fri, 19 Sep 2025 01:48:50 +0700
Subject: [PATCH 10/10] ARM: dts: unisoc: rda8810pl: Add SDMMC controllers
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250919-rda8810pl-mmc-v1-10-d4f08a05ba4d@mainlining.org>
References: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
In-Reply-To: <20250919-rda8810pl-mmc-v1-0-d4f08a05ba4d@mainlining.org>
To: Manivannan Sadhasivam <mani@kernel.org>, 
 Linus Walleij <linus.walleij@linaro.org>, 
 Bartosz Golaszewski <brgl@bgdev.pl>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Michael Turquette <mturquette@baylibre.com>, 
 Stephen Boyd <sboyd@kernel.org>, Vinod Koul <vkoul@kernel.org>, 
 Ulf Hansson <ulf.hansson@linaro.org>, 
 Philipp Zabel <p.zabel@pengutronix.de>, Kees Cook <kees@kernel.org>, 
 "Gustavo A. R. Silva" <gustavoars@kernel.org>
Cc: linux-arm-kernel@lists.infradead.org, linux-unisoc@lists.infradead.org, 
 linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, 
 dmaengine@vger.kernel.org, linux-mmc@vger.kernel.org, 
 linux-hardening@vger.kernel.org, Dang Huynh <dang.huynh@mainlining.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1758221395; l=5720;
 i=dang.huynh@mainlining.org; s=20250917; h=from:subject:message-id;
 bh=zi1lBIjsLiJ+MvStlhu52N5g0U+YipGaIL9gPvgvEPE=;
 b=l77vToHDcYswIc8WztAJWYO/+3IYOVrmTQlZnFRvjc0lKarYC0h4XR0hoxgA2q3ZB98uFJham
 quoNd+aQB2RCTuhZ8oSMEutdqzVeCxtTOtcZpguuNT9Z4JHuV24Oxly
X-Developer-Key: i=dang.huynh@mainlining.org; a=ed25519;
 pk=RyzH4CL4YU/ItXYUurA51EVBidfx4lIy8/E4EKRJCUk=
X-Endpoint-Received: by B4 Relay for dang.huynh@mainlining.org/20250917
 with auth_id=526
X-Original-From: Dang Huynh <dang.huynh@mainlining.org>
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
Reply-To: dang.huynh@mainlining.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Dang Huynh <dang.huynh@mainlining.org>

Add SDMMC1 and 2 controllers for the RDA8810PL platform and enable it
on the Orange Pi i96 and 2G-IOT.

Signed-off-by: Dang Huynh <dang.huynh@mainlining.org>
---
 .../boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts  | 20 +++++++++
 .../arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts | 20 +++++++++
 arch/arm/boot/dts/unisoc/rda8810pl.dtsi            | 47 ++++++++++++++++++++--
 3 files changed, 83 insertions(+), 4 deletions(-)

diff --git a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
index 98e34248ae80b1fcd673ff01fe045db412d5bcc9..b462057ec0d1eb1877eb770afa6aced99efd84b7 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
+++ b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-2g-iot.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "rda8810pl.dtsi"
 
 / {
@@ -27,6 +28,13 @@ memory@80000000 {
 		reg = <0x80000000 0x10000000>;
 	};
 
+	vdd_sdmmc: regulator-fixed {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_sdmmc";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	uart_clk: uart-clk {
 		compatible = "fixed-clock";
 		clock-frequency = <921600>;
@@ -34,6 +42,18 @@ uart_clk: uart-clk {
 	};
 };
 
+&mmc1 {
+	status = "okay";
+	no-sdio;
+	no-mmc;
+	bus-width = <4>;
+	max-frequency = <30000000>;
+	cd-gpios = <&gpiob 4 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vdd_sdmmc>;
+	rda,mclk-adj = /bits/ 8 <1>;
+	rda,mclk-inv;
+};
+
 &uart1 {
 	status = "okay";
 	clocks = <&uart_clk>;
diff --git a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts
index 728f76931b995fdfc036b586f899b15a7f07528b..cf4b75f114b33b27fad0ead4951b15abb1f5cabd 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts
+++ b/arch/arm/boot/dts/unisoc/rda8810pl-orangepi-i96.dts
@@ -6,6 +6,7 @@
 
 /dts-v1/;
 
+#include <dt-bindings/gpio/gpio.h>
 #include "rda8810pl.dtsi"
 
 / {
@@ -27,6 +28,13 @@ memory@80000000 {
 		reg = <0x80000000 0x10000000>;
 	};
 
+	vdd_sdmmc: regulator-fixed {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_sdmmc";
+		regulator-min-microvolt = <2800000>;
+		regulator-max-microvolt = <2800000>;
+	};
+
 	uart_clk: uart-clk {
 		compatible = "fixed-clock";
 		clock-frequency = <921600>;
@@ -34,6 +42,18 @@ uart_clk: uart-clk {
 	};
 };
 
+&mmc1 {
+	status = "okay";
+	no-sdio;
+	no-mmc;
+	bus-width = <4>;
+	max-frequency = <30000000>;
+	cd-gpios = <&gpiob 4 GPIO_ACTIVE_LOW>;
+	vmmc-supply = <&vdd_sdmmc>;
+	rda,mclk-adj = /bits/ 8 <1>;
+	rda,mclk-inv;
+};
+
 &uart1 {
 	status = "okay";
 	clocks = <&uart_clk>;
diff --git a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
index f30d6ece49fb33d9c5c3ad9522c83bb8e4f8b488..438be79a89060655e4a12edc6d3c42574748108b 100644
--- a/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
+++ b/arch/arm/boot/dts/unisoc/rda8810pl.dtsi
@@ -7,6 +7,8 @@
  */
 
 #include <dt-bindings/interrupt-controller/irq.h>
+#include <dt-bindings/clock/rda,8810pl-apclk.h>
+#include <dt-bindings/dma/rda-ifc.h>
 
 / {
 	compatible = "rda,8810pl";
@@ -39,7 +41,7 @@ modem@10000000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x10000000 0xfffffff>;
 
-		gpioc@1a08000 {
+		gpioc: gpioc@1a08000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x1a08000 0x1000>;
 			gpio-controller;
@@ -68,6 +70,13 @@ apb@20900000 {
 		#size-cells = <1>;
 		ranges = <0x0 0x20900000 0x100000>;
 
+		ap_syscon: syscon@0 {
+			compatible = "rda,8810pl-apsyscon", "syscon";
+			reg = <0x0 0x1000>;
+			#clock-cells = <1>;
+			#reset-cells = <1>;
+		};
+
 		timer@10000 {
 			compatible = "rda,8810pl-timer";
 			reg = <0x10000 0x1000>;
@@ -76,7 +85,7 @@ timer@10000 {
 			interrupt-names = "hwtimer", "ostimer";
 		};
 
-		gpioa@30000 {
+		gpioa: gpioa@30000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x30000 0x1000>;
 			gpio-controller;
@@ -87,7 +96,7 @@ gpioa@30000 {
 			interrupts = <12 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		gpiob@31000 {
+		gpiob: gpiob@31000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x31000 0x1000>;
 			gpio-controller;
@@ -98,7 +107,7 @@ gpiob@31000 {
 			interrupts = <13 IRQ_TYPE_LEVEL_HIGH>;
 		};
 
-		gpiod@32000 {
+		gpiod: gpiod@32000 {
 			compatible = "rda,8810pl-gpio";
 			reg = <0x32000 0x1000>;
 			gpio-controller;
@@ -123,6 +132,30 @@ uart1: serial@0 {
 			status = "disabled";
 		};
 
+		mmc1: mmc@50000 {
+			compatible = "rda,8810pl-mmc", "rda,mmc";
+			reg = <0x50000 0x1000>;
+			interrupts = <3 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ap_syscon CLK_APB2>;
+			clock-names = "mclk";
+			resets = <&ap_syscon RST_APB2_SDMMC1>;
+			dmas = <&ifc IFC_SDMMC1_TX>, <&ifc IFC_SDMMC1_RX>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
+		mmc2: mmc@60000 {
+			compatible = "rda,8810pl-mmc", "rda,mmc";
+			reg = <0x60000 0x1000>;
+			interrupts = <4 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&ap_syscon CLK_APB2>;
+			clock-names = "mclk";
+			resets = <&ap_syscon RST_APB2_SDMMC2>;
+			dmas = <&ifc IFC_SDMMC2_TX>, <&ifc IFC_SDMMC2_RX>;
+			dma-names = "tx", "rx";
+			status = "disabled";
+		};
+
 		uart2: serial@10000 {
 			compatible = "rda,8810pl-uart";
 			reg = <0x10000 0x1000>;
@@ -136,6 +169,12 @@ uart3: serial@90000 {
 			interrupts = <11 IRQ_TYPE_LEVEL_HIGH>;
 			status = "disabled";
 		};
+
+		ifc: dma-controller@f0000 {
+			compatible = "rda,8810pl-ifc", "rda,ifc";
+			reg = <0xf0000 0x1000>;
+			#dma-cells = <1>;
+		};
 	};
 
 	l2: cache-controller@21100000 {

-- 
2.51.0



