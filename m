Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C21E0D2502F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 12 Jan 2026 05:35:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yvb/SOVw6UjM7HvpfbevV7P8VEIcXBrf8v6LpM++fTk=; b=Y1Rd+/t4TcghF+vsv4VEoOHlDv
	C8lIIO9jskyDK3gFUJdCzGD3GxaYRKklZmuEuF0KMGJC9AFiUgfQ8ZGA8zkOuq9yLZS5aLSx/4DEG
	sCd7jfJCTooHSi5etvkCzjizbE2c6AcUF+kGZBHBK45L6/RAMgF5vF+/DSb940KN4jE1IvEFsKNgI
	yEvtiB2Uy+iLVjdhZpcji3lN8NM39OifOSj52yyDomPC1wM2XcQ6475y3yzvBoPBE8iEtciVP1mWp
	93l8FJFYoP+Mc3ckYX44XxhjtyUJl25hP1pIQbIxGc3il37DtuABjLQdMOs4LyQakTXLOPGXDyOv6
	0OKBPXCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAZv-00000004mff-0wOB;
	Mon, 12 Jan 2026 05:34:59 +0000
Received: from lgeamrelo11.lge.com ([156.147.23.51])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vfAZn-00000004mdI-40mc
	for linux-arm-kernel@lists.infradead.org;
	Mon, 12 Jan 2026 05:34:55 +0000
Received: from unknown (HELO lgemrelse6q.lge.com) (156.147.1.121)
	by 156.147.23.51 with ESMTP; 12 Jan 2026 14:34:47 +0900
X-Original-SENDERIP: 156.147.1.121
X-Original-MAILFROM: chanho.min@lge.com
Received: from unknown (HELO localhost.localdomain) (10.178.31.97)
	by 156.147.1.121 with ESMTP; 12 Jan 2026 14:34:47 +0900
X-Original-SENDERIP: 10.178.31.97
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
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 2/2 v3] arm64: dts: lg: Initial support for LG1215 SoC and reference board
Date: Mon, 12 Jan 2026 14:34:21 +0900
Message-Id: <20260112053421.3185738-3-chanho.min@lge.com>
X-Mailer: git-send-email 2.34.1
In-Reply-To: <20260112053421.3185738-1-chanho.min@lge.com>
References: <20260112053421.3185738-1-chanho.min@lge.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260111_213452_305655_A8E6EBD1 
X-CRM114-Status: GOOD (  15.65  )
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
 arch/arm64/boot/dts/lg/lg1215.dtsi    | 288 ++++++++++++++++++++++++++
 3 files changed, 323 insertions(+)
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
index 000000000000..96b86a7060a8
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
+	compatible = "lg,lg1215-ref", "lg,lg1215";
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
index 000000000000..0be5010da147
--- /dev/null
+++ b/arch/arm64/boot/dts/lg/lg1215.dtsi
@@ -0,0 +1,288 @@
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
+			L2_0: l2-cache {
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
+			L2_1: l2-cache {
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
+			L2_2: l2-cache {
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
+			L2_3: l2-cache {
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
+
+		cpu0_opp_table: opp-table {
+			compatible = "operating-points-v2";
+
+			opp-1600000000 {
+				opp-hz = /bits/ 64 <1600000000>;
+			};
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
+	clk_xtal: clk-xtal {
+		compatible = "fixed-clock";
+		clock-output-names = "xtal";
+		clock-frequency = <50000000>;
+
+		#clock-cells = <0>;
+	};
+
+	clk_bus: clk-bus {
+		compatible = "fixed-factor-clock";
+		clocks = <&clk_xtal>;
+		clock-output-names = "busclk";
+		clock-div = <1>;
+		clock-mult = <4>;
+
+		#clock-cells = <0>;
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
+		gic: interrupt-controller@c0000000 {
+			compatible = "arm,gic-400";
+			reg = <0x0 0xc0001000 0x0 0x1000>, /* GICD */
+			      <0x0 0xc0002000 0x0 0x2000>, /* GICC */
+			      <0x0 0xc0004000 0x0 0x2000>, /* GICH */
+			      <0x0 0xc0006000 0x0 0x2000>; /* GICV */
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x0f) |
+					IRQ_TYPE_LEVEL_LOW)>;
+			interrupt-controller;
+		};
+
+		ethernet@ca370000 {
+
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
+			dwmac_axi_config: dwmac-axi-config {
+
+				snps,rd_osr_lmt = <0x07>;
+				snps,wr_osr_lmt = <0x07>;
+				snps,blen = <0 0 16 0 0 0 0>;
+			};
+		};
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
+			clocks = <&clk_bus>, <&clk_bus>;
+			clock-names = "wdog_clk", "apb_pclk";
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
+		dma: dma-controller@ff200000 {
+			#dma-cells = <1>;
+			compatible = "arm,pl080", "arm,primecell";
+			reg = <0x0 0xff200000 0x0 0x1000>;
+			interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&clk_bus>;
+			clock-names = "apb_pclk";
+		};
+	};
+};
-- 
2.34.1


