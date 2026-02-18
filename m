Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 37991E9A03B
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 18 Feb 2026 11:21:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=RagyzuVa5Vl7iHkwZfGwyJBO6t6o4TbwKeVDfHaH+Xw=; b=xKRW+bnat3MsEVusKnmtLXHaJY
	Ead5vr90IruIO0TeFA7kWZNfqkvx3eZ6/0wsU5XanBUiwqFppx1jjVrJiocgNXQZHdg3ZTvmyOXRQ
	SdbChYbVvky9vm9Y8HTIw8mTHnYwaFMJkLKhZX7mw4YJM7gLInUQQF0tuq9Fts23LT2E18aXOdnE7
	dTkvBtWuBmSaHJV+TLx/+IYg7fx+eP/VU2ERNyt1lKEza4uvX1QcCzpe5GippEf4fBUFAE9Si2SYf
	v4q36LISonfm2qR6tfGPCjg9pGTihivy3b3mwnN2NEgAbMLpJWCtCOOICF0iXlJ5nuwl6VBAhbsxT
	0Ep/7rZw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfcC-00000009hvN-1pjp;
	Wed, 18 Feb 2026 11:21:08 +0000
Received: from pouet.aliel.fr ([65.21.61.41] helo=courrier.aliel.fr)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsfc9-00000009huO-0z9u;
	Wed, 18 Feb 2026 11:21:07 +0000
Received: from localhost.localdomain (2a02-842b-8136-0001-b865-661D-5641-e7C6.rev.sfr.net [IPv6:2a02:842b:8136:1:b865:661d:5641:e7c6])
	by courrier.aliel.fr (Postfix) with ESMTPSA id F3064426E9;
	Wed, 18 Feb 2026 11:20:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=aliel.fr;
	s=courrier-s1; t=1771413659;
	bh=0wJJibka0/8mDDFVXqfczE5X4qxrHNZ8Hjp5LOpquQQ=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=YeX37P5Zu7vg/xDH4vHqSQ2lu96VG5wIN74Ghp/i36YkzRxK43eZ3+f3SCWgM3oSp
	 5lNmsQXdDEfSt4VTfWeakMp5edk+ZduR7mRoCXN1L2wpLWuO0SDOKoQLZO5HVAE/K2
	 xKExIwJgG0Moo13AtvAj00QjTe+rHyH0mUo6Sr5k=
From: Ronald Claveau <linux-kernel-dev@aliel.fr>
To: linux-amlogic@lists.infradead.org
Cc: Ronald Claveau <linux-kernel-dev@aliel.fr>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH 6/7] arm64: dts: amlogic: Add clock and EMMC for T7
Date: Wed, 18 Feb 2026 12:20:33 +0100
Message-ID: <20260218112036.36905-1-linux-kernel-dev@aliel.fr>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
References: <20260218101709.35450-1-linux-kernel-dev@aliel.fr>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260218_032105_873199_ECD55F55 
X-CRM114-Status: UNSURE (   8.93  )
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

Add fixed clock and EMMC support for Amlogic T7 SoC family dtsi.

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 129 ++++++++++++++++++++
 1 file changed, 129 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6510068bcff9..b84281e5cdd8 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -3,6 +3,8 @@
  * Copyright (c) 2019 Amlogic, Inc. All rights reserved.
  */
 
+#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
+#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/amlogic,t7-pwrc.h>
 #include "amlogic-t7-reset.h"
@@ -224,6 +226,24 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc: clock-controller@0 {
+				compatible = "amlogic,t7-peripherals-clkc";
+				reg = <0x0 0x0 0x0 0x49c>;
+				#clock-cells = <1>;
+				clocks = <&xtal>,
+						 <&fpll CLKID_FDIV2>,
+						 <&fpll CLKID_FDIV2P5>,
+						 <&fpll CLKID_FDIV3>,
+						 <&fpll CLKID_FDIV4>,
+						 <&fpll CLKID_FDIV5>,
+						 <&hifi_pll CLKID_HIFI_PLL>,
+						 <&mpll CLKID_MPLL2>,
+						 <&mpll CLKID_MPLL3>,
+						 <&gp0_pll CLKID_GP0_PLL>;
+				clock-names = "xtal", "fdiv2", "fdiv2p5", "fdiv3", "fdiv4",
+							  "fdiv5", "hifi", "mpll2", "mpll3", "gp0";
+			};
+
 			reset: reset-controller@2000 {
 				compatible = "amlogic,t7-reset";
 				reg = <0x0 0x2000 0x0 0x98>;
@@ -250,6 +270,68 @@ gpio: bank@4000 {
 					#gpio-cells = <2>;
 					gpio-ranges = <&periphs_pinctrl 0 0 157>;
 				};
+
+				emmc_ctrl_pins: emmc-ctrl {
+					mux-0 {
+						groups = "emmc_cmd";
+						function = "emmc";
+						bias-pull-up;
+						drive-strength-microamp = <4000>;
+					};
+
+					mux-1 {
+						groups = "emmc_clk";
+						function = "emmc";
+						bias-disable;
+						drive-strength-microamp = <4000>;
+					};
+				};
+
+				emmc_data_4b_pins: emmc-data-4b {
+					mux-0 {
+						groups = "emmc_nand_d0",
+								 "emmc_nand_d1",
+								 "emmc_nand_d2",
+								 "emmc_nand_d3";
+						function = "emmc";
+						bias-pull-up;
+						drive-strength-microamp = <4000>;
+					};
+				};
+
+				emmc_data_8b_pins: emmc-data-8b {
+					mux-0 {
+						groups = "emmc_nand_d0",
+								 "emmc_nand_d1",
+								 "emmc_nand_d2",
+								 "emmc_nand_d3",
+								 "emmc_nand_d4",
+								 "emmc_nand_d5",
+								 "emmc_nand_d6",
+								 "emmc_nand_d7";
+						function = "emmc";
+						bias-pull-up;
+						drive-strength-microamp = <4000>;
+					};
+				};
+
+				emmc_ds_pins: emmc-ds {
+					mux {
+						groups = "emmc_nand_ds";
+						function = "emmc";
+						bias-pull-down;
+						drive-strength-microamp = <4000>;
+					};
+				};
+
+				emmc_clk_gate_pins: emmc_clk_gate {
+					mux {
+						groups = "GPIOB_8";
+						function = "gpio_periphs";
+						bias-pull-down;
+						drive-strength-microamp = <4000>;
+					};
+				};
 			};
 
 			gpio_intc: interrupt-controller@4080 {
@@ -262,6 +344,38 @@ gpio_intc: interrupt-controller@4080 {
 					<10 11 12 13 14 15 16 17 18 19 20 21>;
 			};
 
+			fpll: clock-controller@8040 {
+				compatible = "amlogic,t7-fpll";
+				reg = <0x0 0x8040 0x0 0x20>;
+				#clock-cells = <1>;
+				clocks = <&xtal>;
+				clock-names = "xtal";
+			};
+
+			gp0_pll: clock-controller@8080 {
+				compatible = "amlogic,t7-gp0-pll";
+				reg = <0x0 0x8080 0x0 0x20>;
+				#clock-cells = <1>;
+				clocks = <&xtal>;
+				clock-names = "in0";
+			};
+
+			hifi_pll: clock-controller@8100 {
+				compatible = "amlogic,t7-hifi-pll";
+				reg = <0x0 0x8100 0x0 0x20>;
+				#clock-cells = <1>;
+				clocks = <&xtal>;
+				clock-names = "in0";
+			};
+
+			mpll: clock-controller@8180 {
+				compatible = "amlogic,t7-mpll";
+				reg = <0x0 0x8180 0x0 0x20>;
+				#clock-cells = <1>;
+				clocks = <&fpll CLKID_FPLL_DCO>;
+				clock-names = "in0";
+			};
+
 			uart_a: serial@78000 {
 				compatible = "amlogic,t7-uart", "amlogic,meson-s4-uart";
 				reg = <0x0 0x78000 0x0 0x18>;
@@ -276,6 +390,21 @@ sec_ao: ao-secure@10220 {
 				reg = <0x0 0x10220 0x0 0x140>;
 				amlogic,has-chip-id;
 			};
+
+			sd_emmc_c: mmc@8c000{
+				compatible = "amlogic,meson-axg-mmc";
+				reg = <0x0 0x8c000 0x0 0x800>;
+				interrupts = <GIC_SPI 178 IRQ_TYPE_EDGE_RISING>;
+				status = "disabled";
+				clocks = <&clkc CLKID_SYS_SD_EMMC_C>,
+						 <&clkc CLKID_SD_EMMC_C>,
+						 <&gp0_pll CLKID_GP0_PLL>;
+				clock-names = "core", "clkin0", "clkin1";
+				assigned-clocks = <&clkc CLKID_SD_EMMC_C_SEL>;
+				assigned-clock-parents = <&xtal>;
+				no-sdio;
+				no-sd;
+			};
 		};
 
 	};
-- 
2.49.0


