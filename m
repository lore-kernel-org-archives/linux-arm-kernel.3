Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90DD2E77170
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Dec 2024 16:16:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UOan4p3pxGBvWe7rufrYnVPjC6OPh8sgdtbo8kwwfBI=; b=Bn97MxYEQ6OY5veaDQKxgY4RPh
	F6xw5Wngqm3Ip07HuTAuFyV/O08dVrty9QVKeLW2C+1Cs5oZfL/t+eK2SXmENfV6FT2pqeo2tqua7
	WeQHt9S/IsoP08Bub7/MRflosdTXyG8OYplQvPF/prP24ugihqiv03amnzB0QwekdIQeQ9NyPp5X4
	1FW21y1UJCqV086rZwBj9e9v2qF8vGbcjJGqCxLpjNl4wbuYerW/fRVw+gFbvaHkEwxJXsdqVsksq
	6VWp4vSsRwUq3ZF4JAIA5D/fZZ0ebT9yBgHnqu9m4wElmCSFmpLOcnCSDfNO4PvgzL5qztJw9H6Q0
	PgFsorYA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tIs31-0000000D9Tk-0shY;
	Wed, 04 Dec 2024 16:16:19 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tIrtb-0000000D6pC-1poD
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Dec 2024 16:06:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 58AD4A41A39;
	Wed,  4 Dec 2024 16:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 041FBC4CEFF;
	Wed,  4 Dec 2024 16:06:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733328394;
	bh=FCW4SgvtqPTNSow9RQnWY100WjVms/kddftkWHfkEMM=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=L2C3oG9G5zZMSYDDOyrFu6wQe7+u+TIQMiae8aMiLN8Zgcu2VIrK5qK/JaMXGQzS0
	 1nLtyWYLu9tXNHqOpXUZN0d5wrRiezG90Qn9tVq6/tRCrt9vQq1dOY1h6ViWOaeawv
	 57+MPXpKa1G6ArqcvEmGXG+gneCPeUn9eviN6ambXbgkKVlJ7EJoWUUsh21Ws64jtM
	 Y25XWwIf47KgXRz3ECI2aHM7RuvtgTLFw1Fc9P0tRYjy/QIlB25cZZ2EJ4d/xmAp+B
	 7Ik4fqghlb0uUZJCuLDTFxIDycixUWyRPtvH1sXpPGg0+c4bWeN7audt/d9t6yvS+5
	 16RUpRgZfE44Q==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id EF7A8E77173;
	Wed,  4 Dec 2024 16:06:33 +0000 (UTC)
From: Nikolaos Pasaloukos via B4 Relay <devnull+nikolaos.pasaloukos.blaize.com@kernel.org>
Date: Wed, 04 Dec 2024 16:05:27 +0000
Subject: [PATCH v5 4/6] arm64: dts: Add initial support for Blaize BLZP1600
 CB2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20241204-blaize-blzp1600_init_board_support-v5-4-b642bcc49307@blaize.com>
References: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
In-Reply-To: <20241204-blaize-blzp1600_init_board_support-v5-0-b642bcc49307@blaize.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 James Cowgill <james.cowgill@blaize.com>, 
 Matt Redfearn <matt.redfearn@blaize.com>, 
 Neil Jones <neil.jones@blaize.com>, 
 Niko Pasaloukos <nikolaos.pasaloukos@blaize.com>, 
 Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
 Arnd Bergmann <arnd@arndb.de>, Olof Johansson <olof@lixom.net>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev, 
 Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1733328392; l=10584;
 i=nikolaos.pasaloukos@blaize.com; s=20241111; h=from:subject:message-id;
 bh=6lzlBswFiOwlEF4vgaE0qTkuZdK3yyZ0e7+ltOtkqIU=;
 b=mlK9PcIrKFLZ8MKCLSoT4YyrjVovNKeRVG70z3DYDFbqYXHkR6W0cY5k1LQJkv2TD8CwmfHT7
 EUScaxcohDjAE1jC5Ar6oxDJ1L6HSI6hyJxZQXAL3wfDnyJs/3NxxqN
X-Developer-Key: i=nikolaos.pasaloukos@blaize.com; a=ed25519;
 pk=gGEjGCXdSuvCJPIiu0p0UeiPcW5LC710Z6KGN/dzo3g=
X-Endpoint-Received: by B4 Relay for
 nikolaos.pasaloukos@blaize.com/20241111 with auth_id=274
X-Original-From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241204_080635_647770_44F23182 
X-CRM114-Status: GOOD (  16.97  )
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
Reply-To: nikolaos.pasaloukos@blaize.com
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>

Add support for the Blaize CB2 development board based on
the BLZP1600 SoC. This consists of a Carrier-Board-2 and a
System-on-Module.

Both BLZP1600 SoM and CB2 are available as products.
CB2 (Pathfinder) has multiple peripherals like UART, I2C,
SPI, GPIO, CSI (camera), DSI (display), USB-3.0 and Ethernet.

Enable support for the Cryptocell, UART and I2C which are
already fully supported by the drivers.

The blaize-blzp1600.dtsi is the common part for the SoC,
blaize-blzp1600-som.dtsi is the common part for the SoM and
blaize-blzp1600-cb2.dts is the board specific file.

Co-developed-by: James Cowgill <james.cowgill@blaize.com>
Signed-off-by: James Cowgill <james.cowgill@blaize.com>
Co-developed-by: Matt Redfearn <matt.redfearn@blaize.com>
Signed-off-by: Matt Redfearn <matt.redfearn@blaize.com>
Co-developed-by: Neil Jones <neil.jones@blaize.com>
Signed-off-by: Neil Jones <neil.jones@blaize.com>
Signed-off-by: Nikolaos Pasaloukos <nikolaos.pasaloukos@blaize.com>
Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
---
 arch/arm64/boot/dts/Makefile                       |   1 +
 arch/arm64/boot/dts/blaize/Makefile                |   2 +
 arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts |  83 +++++++++
 .../arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi |  23 +++
 arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi    | 205 +++++++++++++++++++++
 5 files changed, 314 insertions(+)

diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
index 21cd3a87f385309c3a655a67a3bee5f0abed7545..79b73a21ddc22b17308554e502f8207392935b45 100644
--- a/arch/arm64/boot/dts/Makefile
+++ b/arch/arm64/boot/dts/Makefile
@@ -10,6 +10,7 @@ subdir-y += apm
 subdir-y += apple
 subdir-y += arm
 subdir-y += bitmain
+subdir-y += blaize
 subdir-y += broadcom
 subdir-y += cavium
 subdir-y += exynos
diff --git a/arch/arm64/boot/dts/blaize/Makefile b/arch/arm64/boot/dts/blaize/Makefile
new file mode 100644
index 0000000000000000000000000000000000000000..7e10b3199e6c73b64c826fef1aa4058c7b3e898b
--- /dev/null
+++ b/arch/arm64/boot/dts/blaize/Makefile
@@ -0,0 +1,2 @@
+# SPDX-License-Identifier: GPL-2.0+
+dtb-$(CONFIG_ARCH_BLAIZE) += blaize-blzp1600-cb2.dtb
diff --git a/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts b/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
new file mode 100644
index 0000000000000000000000000000000000000000..7e3cef2ed3522e202487e799b2021cd45398e006
--- /dev/null
+++ b/arch/arm64/boot/dts/blaize/blaize-blzp1600-cb2.dts
@@ -0,0 +1,83 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2024 Blaize, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include "blaize-blzp1600-som.dtsi"
+
+/ {
+	model = "Blaize BLZP1600 SoM1600P CB2 Development Board";
+
+	compatible = "blaize,blzp1600-cb2", "blaize,blzp1600";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200";
+	};
+};
+
+&i2c0 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&i2c1 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&i2c3 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	gpio_expander: gpio@74 {
+		compatible = "ti,tca9539";
+		reg = <0x74>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "RSP_PIN_7",	/* GPIO_0 */
+				  "RSP_PIN_11",	/* GPIO_1 */
+				  "RSP_PIN_13",	/* GPIO_2 */
+				  "RSP_PIN_15",	/* GPIO_3 */
+				  "RSP_PIN_27",	/* GPIO_4 */
+				  "RSP_PIN_29",	/* GPIO_5 */
+				  "RSP_PIN_31",	/* GPIO_6 */
+				  "RSP_PIN_33",	/* GPIO_7 */
+				  "RSP_PIN_37",	/* GPIO_8 */
+				  "RSP_PIN_16",	/* GPIO_9 */
+				  "RSP_PIN_18",	/* GPIO_10 */
+				  "RSP_PIN_22",	/* GPIO_11 */
+				  "RSP_PIN_28",	/* GPIO_12 */
+				  "RSP_PIN_32",	/* GPIO_13 */
+				  "RSP_PIN_36",	/* GPIO_14 */
+				  "TP31";	/* GPIO_15 */
+	};
+
+	gpio_expander_m2: gpio@75 {
+		compatible = "ti,tca9539";
+		reg = <0x75>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		gpio-line-names = "M2_W_DIS1_N",	/* GPIO_0 */
+				  "M2_W_DIS2_N",	/* GPIO_1 */
+				  "M2_UART_WAKE_N",	/* GPIO_2 */
+				  "M2_COEX3",		/* GPIO_3 */
+				  "M2_COEX_RXD",	/* GPIO_4 */
+				  "M2_COEX_TXD",	/* GPIO_5 */
+				  "M2_VENDOR_PIN40",	/* GPIO_6 */
+				  "M2_VENDOR_PIN42",	/* GPIO_7 */
+				  "M2_VENDOR_PIN38",	/* GPIO_8 */
+				  "M2_SDIO_RST_N",	/* GPIO_9 */
+				  "M2_SDIO_WAKE_N",	/* GPIO_10 */
+				  "M2_PETN1",		/* GPIO_11 */
+				  "M2_PERP1",		/* GPIO_12 */
+				  "M2_PERN1",		/* GPIO_13 */
+				  "UIM_SWP",		/* GPIO_14 */
+				  "UART1_TO_RSP";	/* GPIO_15 */
+	};
+};
diff --git a/arch/arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi b/arch/arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..bfdff5953edd95341440aa98569a019adcc0425d
--- /dev/null
+++ b/arch/arm64/boot/dts/blaize/blaize-blzp1600-som.dtsi
@@ -0,0 +1,23 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2024 Blaize, Inc. All rights reserved.
+ */
+
+#include "blaize-blzp1600.dtsi"
+
+/ {
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x1 0x0>;
+	};
+};
+
+/* i2c4 bus is available only on the SoM, not on the board */
+&i2c4 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&uart0 {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi b/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..7d399e6a532f5b24385dd837be965be771c7d24c
--- /dev/null
+++ b/arch/arm64/boot/dts/blaize/blaize-blzp1600.dtsi
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: GPL-2.0+
+/*
+ * Copyright (c) 2024 Blaize, Inc. All rights reserved.
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+/ {
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	cpus {
+		#address-cells = <2>;
+		#size-cells = <0>;
+
+		cpu0: cpu@0 {
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x0>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		cpu1: cpu@1 {
+			compatible = "arm,cortex-a53";
+			reg = <0x0 0x1>;
+			device_type = "cpu";
+			enable-method = "psci";
+			next-level-cache = <&l2>;
+		};
+
+		l2: l2-cache0 {
+			compatible = "cache";
+			cache-level = <2>;
+			cache-unified;
+		};
+	};
+
+	firmware {
+		scmi {
+			compatible = "arm,scmi-smc";
+			arm,smc-id = <0x82002000>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			shmem = <&scmi0_shm>;
+
+			scmi_clk: protocol@14 {
+				reg = <0x14>;
+				#clock-cells = <1>;
+			};
+
+			scmi_rst: protocol@16 {
+				reg = <0x16>;
+				#reset-cells = <1>;
+			};
+		};
+	};
+
+	pmu {
+		compatible = "arm,cortex-a53-pmu";
+		interrupts = <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>,
+			     <GIC_SPI 77 IRQ_TYPE_LEVEL_HIGH>;
+		interrupt-affinity = <&cpu0>, <&cpu1>;
+	};
+
+	psci {
+		compatible = "arm,psci-1.0", "arm,psci-0.2";
+		method = "smc";
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* SCMI reserved buffer space on DDR space */
+		scmi0_shm: scmi-shmem@800 {
+			compatible = "arm,scmi-shmem";
+			reg = <0x0 0x800 0x0 0x80>;
+		};
+	};
+
+	timer {
+		compatible = "arm,armv8-timer";
+		interrupts = /* Physical Secure PPI */
+			     <GIC_PPI 13 (GIC_CPU_MASK_RAW(0x3) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     /* Physical Non-Secure PPI */
+			     <GIC_PPI 14 (GIC_CPU_MASK_RAW(0x3) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     /* Hypervisor PPI */
+			     <GIC_PPI 10 (GIC_CPU_MASK_RAW(0x3) |
+					  IRQ_TYPE_LEVEL_LOW)>,
+			     /* Virtual PPI */
+			     <GIC_PPI 11 (GIC_CPU_MASK_RAW(0x3) |
+					  IRQ_TYPE_LEVEL_LOW)>;
+	};
+
+	soc@200000000 {
+		compatible = "simple-bus";
+		#address-cells = <1>;
+		#size-cells = <1>;
+		ranges = <0x0 0x2 0x0 0x850000>;
+
+		gic: interrupt-controller@410000 {
+			compatible = "arm,gic-400";
+			reg = <0x410000 0x20000>,
+			      <0x420000 0x20000>,
+			      <0x440000 0x20000>,
+			      <0x460000 0x20000>;
+			#interrupt-cells = <3>;
+			#address-cells = <0>;
+			interrupt-controller;
+			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_RAW(0x3) |
+						 IRQ_TYPE_LEVEL_LOW)>;
+		};
+
+		uart0: serial@4d0000 {
+			compatible = "ns16550a";
+			reg = <0x4d0000 0x1000>;
+			clocks = <&scmi_clk 59>;
+			resets = <&scmi_rst 59>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 4 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		uart1: serial@4e0000 {
+			compatible = "ns16550a";
+			reg = <0x4e0000 0x1000>;
+			clocks = <&scmi_clk 60>;
+			resets = <&scmi_rst 60>;
+			reg-shift = <2>;
+			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
+			status = "disabled";
+		};
+
+		i2c0: i2c@4f0000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x4f0000 0x1000>;
+			interrupts = <GIC_SPI 6 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk 54>;
+			resets = <&scmi_rst 54>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c1: i2c@500000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x500000 0x1000>;
+			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk 55>;
+			resets = <&scmi_rst 55>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c2: i2c@510000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x510000 0x1000>;
+			interrupts = <GIC_SPI 8 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk 56>;
+			resets = <&scmi_rst 56>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c3: i2c@520000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x520000 0x1000>;
+			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk 57>;
+			resets = <&scmi_rst 57>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		i2c4: i2c@530000 {
+			compatible = "snps,designware-i2c";
+			reg = <0x530000 0x1000>;
+			interrupts = <GIC_SPI 10 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk 58>;
+			resets = <&scmi_rst 58>;
+			#address-cells = <1>;
+			#size-cells = <0>;
+			status = "disabled";
+		};
+
+		arm_cc712: crypto@550000 {
+			compatible = "arm,cryptocell-712-ree";
+			reg = <0x550000 0x1000>;
+			interrupts = <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
+			clocks = <&scmi_clk 7>;
+		};
+	};
+};

-- 
2.43.0



