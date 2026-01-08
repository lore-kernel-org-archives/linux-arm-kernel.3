Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 78286D0D17E
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 08:23:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:References:In-Reply-To:
	Message-Id:Date:Subject:Cc:To:From:Reply-To:MIME-Version:Content-Type:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=z7yNRH48oY2idJPsb2lbMxIpjx1glsQ5G0TkgclBeho=; b=FDUIX0fy0OTMoJ6eFor/K+gRzw
	XGJRXJKtPQjBzOKFAERUasBm6pCI1dJPhxaLfDuDwql81bUIjwGTp1eGzfoSwAPytJ82Iwiz3ruon
	wpW4Glsv0GlXaEHja1GHJWrqAlyqr+8IO2NxtM02ufh4oy43ExZq8slMp9KtC1nX/38L4Pj2pdvXw
	OUiS14Q7q4OkZFL1XWsHl+h7V2C8ZwREvV42tij2dshQrwIKkRgHA8dzuY5zFX4Lpe8h6MWrIxBbC
	47Ii1d7fj4QPndRjMbtAimD62V0sV9lbLgFGt80cw0m5v76TINHir75AvbZO+ylqzrF7TH5gxPVIg
	uruMp+Fg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlIP-0000000GGmz-2Q2Y;
	Thu, 08 Jan 2026 08:23:05 +0000
Received: from lgeamrelo12.lge.com ([156.147.23.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdlIM-0000000GGl5-1LK8
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 08:23:04 +0000
Received: from unknown (HELO lgeamrelo04.lge.com) (156.147.1.127)
	by 156.147.23.52 with ESMTP; 8 Jan 2026 17:22:59 +0900
X-Original-SENDERIP: 156.147.1.127
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO localhost.localdomain) (10.178.31.96)
	by 156.147.1.127 with ESMTP; 8 Jan 2026 17:22:59 +0900
X-Original-SENDERIP: 10.178.31.96
X-Original-MAILFROM: chanho.min@lge.com
From: Chanho Min <chanho.min@lge.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Heiko Stuebner <heiko@sntech.de>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kever Yang <kever.yang@rock-chips.com>,
	Kael D'Alcamo <dev@kael-k.io>,
	Manivannan Sadhasivam <mani@kernel.org>,
	Lad Prabhakar <prabhakar.mahadev-lad.rj@bp.renesas.com>
Cc: Chanho Min <chanho.min@lge.com>,
	Gunho Lee <gunho.lee@lge.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: lg: Initial support for LG1215 SoC and reference board
Date: Thu,  8 Jan 2026 17:22:13 +0900
Message-Id: <20260108082213.6545-4-chanho.min@lge.com>
X-Mailer: git-send-email 2.17.1
In-Reply-To: <20260108082213.6545-1-chanho.min@lge.com>
References: <20260108082213.6545-1-chanho.min@lge.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260108_002302_645962_83EB970C 
X-CRM114-Status: GOOD (  15.15  )
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

Add initial device tree support for LG Electronics LG1215 SoC
and its reference development board.

This patch introduces:
 - lg1215.dtsi : SoC level device tree include file
 - lg1215-ref.dts : Reference board specific file
 - Makefile update to build lg1215-ref.dtb

Currently supported minimal hardware description:
 - Quad ARM Cortex-A78 CPU
 - gic-400 interrupt controller
 - ARMv8 architected timer
 - pmu (Performance Monitoring Unit)
 - pl011 UARTs
 - pl080 DMA controller
 - sp804 timers, sp805 watchdog timers
 - Generic DWMAC ethernet controller

This is the minimal initial bring-up version. More peripherals (mmc, gpio,
pinctrl, etc.) will be added in follow-up patches.

Signed-off-by: Chanho Min <chanho.min@lge.com>
---
 arch/arm64/boot/dts/lg/Makefile       |   1 +
 arch/arm64/boot/dts/lg/lg1215-ref.dts |  34 +++
 arch/arm64/boot/dts/lg/lg1215.dtsi    | 304 ++++++++++++++++++++++++++
 3 files changed, 339 insertions(+)
 create mode 100644 arch/arm64/boot/dts/lg/lg1215-ref.dts
 create mode 100644 arch/arm64/boot/dts/lg/lg1215.dtsi

diff --git a/arch/arm64/boot/dts/lg/Makefile b/arch/arm64/boot/dts/lg/Makefile
index 4c3959e24e1b..e60a5bd35327 100644
--- a/arch/arm64/boot/dts/lg/Makefile
+++ b/arch/arm64/boot/dts/lg/Makefile
@@ -1,3 +1,4 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_ARCH_LG1K) += lg1312-ref.dtb
 dtb-$(CONFIG_ARCH_LG1K) += lg1313-ref.dtb
+dtb-$(CONFIG_ARCH_LG1K) += lg1215-ref.dtb
diff --git a/arch/arm64/boot/dts/lg/lg1215-ref.dts b/arch/arm64/boot/dts/lg/lg1215-ref.dts
new file mode 100644
index 000000000000..fd24ed450037
--- /dev/null
+++ b/arch/arm64/boot/dts/lg/lg1215-ref.dts
@@ -0,0 +1,34 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for lg1215 Reference Board.
+ *
+ * Copyright (C) 2026, LG Electronics
+ */
+
+/dts-v1/;
+
+#include "lg1215.dtsi"
+
+/ {
+	model = "LG Electronics, TV SoC LG1215 Reference Board";
+	compatible = "lge,lg1215-ref", "lge,lg1215";
+
+	aliases {
+		serial0 = &uart0;
+		serial1 = &uart1;
+		serial2 = &uart2;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x00000000 0x0 0xbc400000>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/lg/lg1215.dtsi b/arch/arm64/boot/dts/lg/lg1215.dtsi
new file mode 100644
index 000000000000..2f926395ae8a
--- /dev/null
+++ b/arch/arm64/boot/dts/lg/lg1215.dtsi
@@ -0,0 +1,304 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * dts file for lg1215 SoC
+ *
+ * Copyright (C) 2026, LG Electronics
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	interrupt-parent = <&gic>;
+
+	cpus {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x00000000>;
+			enable-method = "psci";
+			operating-points-v2 = <&cpu0_opp_table>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x00010000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x00010000>;
+			next-level-cache = <&L2_0>;
+			L2_0: l2-cache@0 {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <512>;
+				cache-size = <0x00040000>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+		cpu1: cpu@100 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x00000100>;
+			enable-method = "psci";
+			operating-points-v2 = <&cpu0_opp_table>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x00010000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x00010000>;
+			next-level-cache = <&L2_1>;
+			L2_1: l2-cache@100 {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <512>;
+				cache-size = <0x00040000>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+		cpu2: cpu@200 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x00000200>;
+			enable-method = "psci";
+			operating-points-v2 = <&cpu0_opp_table>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x00010000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x00010000>;
+			next-level-cache = <&L2_2>;
+			L2_2: l2-cache@200 {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <512>;
+				cache-size = <0x00040000>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+		cpu3: cpu@300 {
+			device_type = "cpu";
+			compatible = "arm,cortex-a78";
+			reg = <0x00000300>;
+			enable-method = "psci";
+			operating-points-v2 = <&cpu0_opp_table>;
+			d-cache-line-size = <64>;
+			d-cache-sets = <256>;
+			d-cache-size = <0x00010000>;
+			i-cache-line-size = <64>;
+			i-cache-sets = <256>;
+			i-cache-size = <0x00010000>;
+			next-level-cache = <&L2_3>;
+			L2_3: l2-cache@300 {
+				compatible = "cache";
+				cache-level = <2>;
+				cache-line-size = <64>;
+				cache-sets = <512>;
+				cache-size = <0x00040000>;
+				cache-unified;
+				next-level-cache = <&L3>;
+			};
+		};
+		L3: l3-cache {
+			compatible = "cache";
+			cache-level = <3>;
+			cache-line-size = <64>;
+			cache-sets = <512>;
+			cache-size = <0x00100000>;
+			cache-unified;
+		};
+	};
+
+	psci {
+		compatible = "arm,psci";
+		method = "smc";
+		cpu_suspend = <0xc4000001>;
+		cpu_off = <0xc4000002>;
+		cpu_on = <0xc4000003>;
+	};
+
+	cpu0_opp_table: opp_table@0 {
+		compatible = "operating-points-v2";
+		opp-shared;
+
+		opp-default {
+			opp-hz = /bits/ 64 <1600000000>;
+		};
+	};
+
+	gic: interrupt-controller@c0000000 {
+		compatible = "arm,gic-400";
+		reg = <0x0 0xc0001000 0x0 0x1000>, /* GICD */
+		      <0x0 0xc0002000 0x0 0x2000>, /* GICC */
+		      <0x0 0xc0004000 0x0 0x2000>, /* GICH */
+		      <0x0 0xc0006000 0x0 0x2000>; /* GICV */
+		#interrupt-cells = <3>;
+		#address-cells = <0>;
+		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x0f) |
+					IRQ_TYPE_LEVEL_LOW)>;
+
+		interrupt-controller;
+	};
+
+	pmu {
+		compatible = "arm,armv8-pmuv3";
+		interrupts = <GIC_SPI 184 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 185 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 186 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 187 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>,
+				     <&cpu1>,
+				     <&cpu2>,
+				     <&cpu3>;
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_RAW(0x0f) |
+			      IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0x0f) |
+			      IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0x0f) |
+			      IRQ_TYPE_LEVEL_LOW)>,
+			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0x0f) |
+			      IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	clks {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		clk_xtal: clk-xtal {
+			compatible = "fixed-clock";
+			clock-output-names = "xtal";
+			clock-frequency = <50000000>;
+
+			#clock-cells = <0>;
+		};
+
+		clk_bus: clk-bus {
+			compatible = "fixed-factor-clock";
+			clocks = <&clk_xtal>;
+			clock-names = "xtal";
+			clock-output-names = "busclk";
+			clock-div = <1>;
+			clock-mult = <4>;
+
+			#clock-cells = <0>;
+		};
+	};
+
+	soc {
+		compatible = "simple-bus";
+
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		interrupt-parent = <&gic>;
+
+		dwmac_axi_config: dwmac-axi-config {
+			snps,rd_osr_lmt = <0x07>;
+			snps,wr_osr_lmt = <0x07>;
+			snps,blen = <0 0 16 0 0 0 0>;
+		};
+		ethernet@ca370000 {
+			compatible = "snps,dwmac";
+			reg = <0x0 0xca370000 0x0 0x2000>;
+			interrupts = <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>;
+			interrupt-names = "macirq";
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "stmmaceth", "pclk";
+			max-frame-size = <1500>;
+			phy-mode = "mii";
+			snps,pbl = <2>;
+			snps,fixed-burst;
+			snps,multicast-filter-bins = <64>;
+			snps,perfect-filter-entries = <32>;
+			snps,axi-config = <&dwmac_axi_config>;
+			mac-address = [ 00 00 00 00 00 00 ];
+
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			ethernet-phy@1c {
+				compatible = "ethernet-phy-id001c.c800";
+				reg = <0x1c>;
+				interrupts = <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>;
+			};
+		};
+
+	};
+
+	amba {
+		#address-cells = <2>;
+		#size-cells = <2>;
+
+		compatible = "simple-bus";
+		interrupt-parent = <&gic>;
+		ranges;
+
+		timers0: timer@fd100000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x0 0xfd100000 0x0 0x1000>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>, <&clk_bus>;
+			clock-names = "timer0clk", "timer1clk", "apb_pclk";
+		};
+		timers1: timer@fd110000 {
+			compatible = "arm,sp804", "arm,primecell";
+			reg = <0x0 0xfd110000 0x0 0x1000>;
+			interrupts = <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>, <&clk_bus>;
+			clock-names = "timer0clk", "timer1clk", "apb_pclk";
+			status = "disabled";
+		};
+		wdog: watchdog@fd200000 {
+			compatible = "arm,sp805", "arm,primecell";
+			reg = <0x0 0xfd200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+		};
+		uart0: serial@fe000000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xfe000000 0x0 0x1000>;
+			interrupts = <GIC_SPI 0 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+		uart1: serial@fe100000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xfe100000 0x0 0x1000>;
+			interrupts = <GIC_SPI 1 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+		uart2: serial@fe200000 {
+			compatible = "arm,pl011", "arm,primecell";
+			reg = <0x0 0xfe200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 2 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "uartclk", "apb_pclk";
+		};
+		dma: dma@ff200000 {
+			compatible = "arm,pl080", "arm,primecell";
+			reg = <0x0 0xff200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+		};
+	};
+};

