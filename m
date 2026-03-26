Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2D625106F313
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 26 Mar 2026 09:27:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:CC:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=nsGrgC5O8p6/yE1+WUPk+Xn71T3f9+omE95rrSXXMzI=; b=2GwdfRv0hNF1sCYAzPHSleJHXF
	l19Ssnodp9qSGYxZEpzFHVKkWwlF5t5HzdffSaP82c9AKA+oE9bSW/ZIJof2coHlzQ56+knVmyvCb
	DEbe+LhldI250um7Hcnl2ThmmY4Aq1t+MU46M74XbBECS0MByrkvS+mjpIjjb6dJITJ/fL9KthEP3
	wovdBpxoZg8BO3K5zTnLhOouPZ6UWK6MOUi1eF25CrvzX7yCCkCUZ4Gd5lBiNnd8D4+JbWWibYV86
	MjAnCRLVUZ+Hqao0inve08mVWMleHgnOLmEHjkUh/f23132cFnbeznocsxsOppQv93Yp9D0eioW6V
	L9P5RaFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gzl-000000059Ai-3kbF;
	Thu, 26 Mar 2026 09:27:17 +0000
Received: from [64.106.246.77] (helo=mail-sc.amlogic.com)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w5gzg-00000005942-3SUl;
	Thu, 26 Mar 2026 09:27:13 +0000
Received: from rd03-sz.software.amlogic (10.28.11.121) by mailsc.amlogic.com
 (10.8.11.35) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.35; Thu, 26 Mar
 2026 02:26:11 -0700
From: Jian Hu <jian.hu@amlogic.com>
To: Jerome Brunet <jbrunet@baylibre.com>, Neil Armstrong
	<neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, "Martin
 Blumenstingl" <martin.blumenstingl@googlemail.com>, Stephen Boyd
	<sboyd@kernel.org>, Michael Turquette <mturquette@baylibre.com>, robh+dt
	<robh+dt@kernel.org>, Rob Herring <robh@kernel.org>, Krzysztof Kozlowski
	<krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>
CC: Jian Hu <jian.hu@amlogic.com>, Ronald Claveau <linux-kernel-dev@aliel.fr>,
	devicetree <devicetree@vger.kernel.org>, linux-clk
	<linux-clk@vger.kernel.org>, linux-amlogic
	<linux-amlogic@lists.infradead.org>, linux-kernel
	<linux-kernel@vger.kernel.org>, linux-arm-kernel
	<linux-arm-kernel@lists.infradead.org>, Ferass El Hafidi
	<funderscore@postmarketos.org>
Subject: [PATCH v3 3/3] arm64: dts: amlogic: t7: Add clock controller nodes
Date: Thu, 26 Mar 2026 17:26:45 +0800
Message-ID: <20260326092645.1053261-4-jian.hu@amlogic.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20260326092645.1053261-1-jian.hu@amlogic.com>
References: <20260326092645.1053261-1-jian.hu@amlogic.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain
X-Originating-IP: [10.28.11.121]
X-ClientProxiedBy: mailsh.amlogic.com (10.18.11.5) To mailsc.amlogic.com
 (10.8.11.35)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260326_022712_877042_B9E73F07 
X-CRM114-Status: UNSURE (   9.67  )
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

Add the required clock controller nodes for Amlogic T7 SoC family:
- SCMI clock controller
- PLL clock controller
- Peripheral clock controller

Signed-off-by: Ronald Claveau <linux-kernel-dev@aliel.fr>
Signed-off-by: Jian Hu <jian.hu@amlogic.com>
---
 arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi | 125 ++++++++++++++++++++
 1 file changed, 125 insertions(+)

diff --git a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
index 6510068bcff9..a610f642953d 100644
--- a/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
+++ b/arch/arm64/boot/dts/amlogic/amlogic-t7.dtsi
@@ -6,6 +6,9 @@
 #include <dt-bindings/interrupt-controller/arm-gic.h>
 #include <dt-bindings/power/amlogic,t7-pwrc.h>
 #include "amlogic-t7-reset.h"
+#include <dt-bindings/clock/amlogic,t7-scmi.h>
+#include <dt-bindings/clock/amlogic,t7-pll-clkc.h>
+#include <dt-bindings/clock/amlogic,t7-peripherals-clkc.h>
 
 / {
 	interrupt-parent = <&gic>;
@@ -201,6 +204,34 @@ pwrc: power-controller {
 		};
 	};
 
+	sram@f7042000 {
+		compatible = "mmio-sram";
+		reg = <0x0 0xf7042000 0x0 0x100>;
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0 0x0 0xf7042000 0x100>;
+
+		scmi_shmem: sram@0 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x100>;
+		};
+	};
+
+	firmware {
+		scmi: scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x820000c1>;
+			shmem = <&scmi_shmem>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+		};
+	};
+
 	soc {
 		compatible = "simple-bus";
 		#address-cells = <2>;
@@ -224,6 +255,42 @@ apb4: bus@fe000000 {
 			#size-cells = <2>;
 			ranges = <0x0 0x0 0x0 0xfe000000 0x0 0x480000>;
 
+			clkc_periphs: clock-controller@0 {
+				compatible = "amlogic,t7-peripherals-clkc";
+				reg = <0x0 0x0 0x0 0x1c8>;
+				#clock-cells = <1>;
+				clocks = <&xtal>,
+					 <&scmi_clk CLKID_SYS_CLK>,
+					 <&scmi_clk CLKID_FIXED_PLL>,
+					 <&scmi_clk CLKID_FCLK_DIV2>,
+					 <&scmi_clk CLKID_FCLK_DIV2P5>,
+					 <&scmi_clk CLKID_FCLK_DIV3>,
+					 <&scmi_clk CLKID_FCLK_DIV4>,
+					 <&scmi_clk CLKID_FCLK_DIV5>,
+					 <&scmi_clk CLKID_FCLK_DIV7>,
+					 <&hifi CLKID_HIFI_PLL>,
+					 <&gp0 CLKID_GP0_PLL>,
+					 <&gp1 CLKID_GP1_PLL>,
+					 <&mpll CLKID_MPLL1>,
+					 <&mpll CLKID_MPLL2>,
+					 <&mpll CLKID_MPLL3>;
+				clock-names = "xtal",
+					      "sys",
+					      "fix",
+					      "fdiv2",
+					      "fdiv2p5",
+					      "fdiv3",
+					      "fdiv4",
+					      "fdiv5",
+					      "fdiv7",
+					      "hifi",
+					      "gp0",
+					      "gp1",
+					      "mpll1",
+					      "mpll2",
+					      "mpll3";
+			};
+
 			reset: reset-controller@2000 {
 				compatible = "amlogic,t7-reset";
 				reg = <0x0 0x2000 0x0 0x98>;
@@ -269,6 +336,64 @@ uart_a: serial@78000 {
 				status = "disabled";
 			};
 
+			gp0: clock-controller@8080 {
+				compatible = "amlogic,t7-gp0-pll";
+				reg = <0x0 0x8080 0x0 0x20>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			gp1: clock-controller@80c0 {
+				compatible = "amlogic,t7-gp1-pll";
+				reg = <0x0 0x80c0 0x0 0x14>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			hifi: clock-controller@8100 {
+				compatible = "amlogic,t7-hifi-pll";
+				reg = <0x0 0x8100 0x0 0x20>;
+				clocks = <&scmi_clk CLKID_TOP_PLL_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			pcie: clock-controller@8140 {
+				compatible = "amlogic,t7-pcie-pll";
+				reg = <0x0 0x8140 0x0 0x1c>;
+				clocks = <&scmi_clk CLKID_PCIE_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			mpll: clock-controller@8180 {
+				compatible = "amlogic,t7-mpll";
+				reg = <0x0 0x8180 0x0 0x28>;
+				clocks = <&scmi_clk CLKID_FIXED_PLL_DCO>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			hdmi: clock-controller@81c0 {
+				compatible = "amlogic,t7-hdmi-pll";
+				reg = <0x0 0x81c0 0x0 0x20>;
+				clocks = <&scmi_clk CLKID_HDMI_PLL_OSC>;
+				clock-names = "in0";
+				#clock-cells = <1>;
+			};
+
+			mclk: clock-controller@8300 {
+				compatible = "amlogic,t7-mclk-pll";
+				reg = <0x0 0x8300 0x0 0x18>;
+				clocks = <&scmi_clk CLKID_MCLK_PLL_OSC>,
+					 <&xtal>,
+					 <&scmi_clk CLKID_FCLK_50M>;
+				clock-names = "in0", "in1", "in2";
+				#clock-cells = <1>;
+			};
+
 			sec_ao: ao-secure@10220 {
 				compatible = "amlogic,t7-ao-secure",
 					     "amlogic,meson-gx-ao-secure",
-- 
2.47.1


