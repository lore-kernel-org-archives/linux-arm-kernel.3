Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4633DE9A74F
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M1K4ZMj34CRgHl+07pdgwemU6ybHVORENjnWLu65mfY=; b=3xQRq0zIRSkGl2txQ2MjRaVFH2
	A/92hzCwj2F0DDu7EoAsGfnM6HYWzwpjvmT6tBY1KIam8+yG8RLGuFzC2wrPJHiD2vy6NOm4tYlxP
	fbfQxDoOHuWtJPzxI9B+DhCLoeFH68tAXhSeLcqYX5VYb37TQpt2y5F38vrNh0yg3ODr+A2L9R4sA
	CbS2k7kmLhTPh5RSlICHKTROFGAiX6/wYZkVtdedn8oA9wZ4mvgEqBpGH5/Ar0imxJAUEs/C/Gndg
	pEhrwSpVa9VrdxQIBetcnVA1I1hVy0dxGcZsGcdt/I8u5rN/gwjZ8Mo1x0l6wJORPLYuSo5Uys4V0
	eN87RfnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCZ-000000016aP-3Eao;
	Tue, 24 Mar 2026 09:37:31 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCL-000000016U3-09PZ
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:37:19 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id 4F9E7275BC;
	Tue, 24 Mar 2026 10:37:12 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345032;
	bh=M1K4ZMj34CRgHl+07pdgwemU6ybHVORENjnWLu65mfY=; h=From:To:Subject;
	b=ZXqbM+wYd9XmT4zYSOX3f8szDaF3UoxQ6thkB1z34e2kACV2+1OTJdeJPy3GqTBPO
	 gbdGo1w1OH0QLQtsy1v0MGVqwfSufMXIJG76G0UjxaIdjuhzWAiM/IUQB3Uy+oQZjP
	 GWDWUDs38xKcvg0Xoo9wUqgy+qOKIqIZ7p8FDmStyPRULFX9g4+IsAw8WwYlBsTrsn
	 n2sdMgoFRJXrNa91njOFNTa/jukSDekcUN3DOj3d24vZY1vsb1loYGXawoish5Knj+
	 4S8uFwxnvjiEJb8VLvbOOFQ6KVhvQM2ZcKj4uKTXfniN97r+Yr0fySJ/llFmtpNi2R
	 SDipAZzPF+AlA==
From: Francesco Dolcini <francesco@dolcini.it>
To: Nishanth Menon <nm@ti.com>,
	Vignesh Raghavendra <vigneshr@ti.com>,
	Tero Kristo <kristo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	linux-arm-kernel@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org
Subject: [PATCH v1 4/7] arm64: dts: ti: k3-am62-verdin: Add Zinnia
Date: Tue, 24 Mar 2026 10:36:59 +0100
Message-ID: <20260324093705.26730-5-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023717_396428_31FE01DB 
X-CRM114-Status: GOOD (  14.08  )
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

From: Francesco Dolcini <francesco.dolcini@toradex.com>

Add Zinnia Carrier Board mated with Verdin AM62.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
2 x 1GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   2 +
 .../boot/dts/ti/k3-am62-verdin-zinnia.dtsi    | 493 ++++++++++++++++++
 .../dts/ti/k3-am625-verdin-nonwifi-zinnia.dts |  22 +
 .../dts/ti/k3-am625-verdin-wifi-zinnia.dts    |  22 +
 4 files changed, 539 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 260e211ca277..08f325451038 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -19,11 +19,13 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-yavia.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-phyboard-lyra-gpio-fan.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62-lp-sk-nand.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi b/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
new file mode 100644
index 000000000000..0ce8357797ed
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62-verdin-zinnia.dtsi
@@ -0,0 +1,493 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin AM62 SoM on Zinnia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_zinnia_leds>;
+
+		/* LED1 Red - SODIMM 48 - LED1_R */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 33 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED1 Blue - SODIMM 46 - LED1_B */
+		led-1 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 34 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Red - SODIMM 44 - LED3_R */
+		led-2 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&main_gpio0 37 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Green - SODIMM 54 - LED3_G */
+		led-3 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&main_gpio0 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Blue - SODIMM 36 - LED3_B */
+		led-4 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&main_gpio1 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Red - SODIMM 34 - LED4_R */
+		led-5 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&main_gpio1 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Green - SODIMM 32 - LED4_G */
+		led-6 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&main_gpio1 12 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Blue - SODIMM 30 - LED4_B */
+		led-7 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&main_gpio1 11 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	zinnia-1v8-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_4 */
+		io-channels = <&verdin_som_adc 4>;
+		full-ohms = <39000>; /* 12K + 27K */
+		output-ohms = <27000>;
+	};
+
+	zinnia-3v3-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_3 */
+		io-channels = <&verdin_som_adc 5>;
+		full-ohms = <54000>; /* 27K + 27K */
+		output-ohms = <27000>;
+	};
+
+	zinnia-5v-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_2 */
+		io-channels = <&verdin_som_adc 6>;
+		full-ohms = <39000>; /* 27K + 12K */
+		output-ohms = <12000>;
+	};
+
+	/* Zinnia Power Supply Input Voltage */
+	zinnia-input-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_1 */
+		io-channels = <&verdin_som_adc 7>;
+		full-ohms = <204700>; /* 200K + 4.7K */
+		output-ohms = <4700>;
+	};
+};
+
+&main_pmx0 {
+	pinctrl_zinnia_leds: zinnia-leds-default-pins {
+		pinctrl-single,pins = <
+			AM62X_IOPAD(0x019c, PIN_INPUT, 7) /* (B18) MCASP0_AXR1.GPIO1_9    */ /* SODIMM 36 */
+			AM62X_IOPAD(0x01a0, PIN_INPUT, 7) /* (B20) MCASP0_AXR0.GPIO1_10   */ /* SODIMM 34 */
+			AM62X_IOPAD(0x01a4, PIN_INPUT, 7) /* (A19) MCASP0_ACLKX.GPIO1_11  */ /* SODIMM 30 */
+			AM62X_IOPAD(0x01a8, PIN_INPUT, 7) /* (A20) MCASP0_AFSX.GPIO1_12   */ /* SODIMM 32 */
+			AM62X_IOPAD(0x0088, PIN_INPUT, 7) /* (L17) GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+			AM62X_IOPAD(0x0098, PIN_INPUT, 7) /* (R18) GPMC0_WAIT0.GPIO0_37   */ /* SODIMM 44 */
+			AM62X_IOPAD(0x008c, PIN_INPUT, 7) /* (L25) GPMC0_WEn.GPIO0_34     */ /* SODIMM 46 */
+			AM62X_IOPAD(0x002c, PIN_INPUT, 7) /* (F23) OSPI0_CSn0.GPIO0_11    */ /* SODIMM 54 */
+		>;
+	};
+};
+
+&mcu_pmx0 {
+	pinctrl_zinnia_spi1_cs0_gpio: mcu-gpio0-11-default-pins {
+		pinctrl-single,pins = <
+			AM62X_MCU_IOPAD(0x002c, PIN_INPUT, 7) /* (C6) WKUP_UART0_CTSn.GPIO0_11 */ /* SODIMM 143 */
+		>;
+	};
+};
+
+/* Verdin ETH */
+&cpsw3g {
+	status = "okay";
+};
+
+/* MDIO, shared by Verdin ETH_1 (On-module PHY) and Verdin ETH_2_RGMII */
+&cpsw3g_mdio {
+	status = "okay";
+
+	cpsw3g_phy1: ethernet-phy@2 {
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_eth2_rgmii_int>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <38 IRQ_TYPE_EDGE_FALLING>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* Verdin ETH_1 */
+&cpsw_port1 {
+	status = "okay";
+};
+
+/* Verdin ETH_2_RGMII */
+&cpsw_port2 {
+	phy-handle = <&cpsw3g_phy1>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&main_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_ctrl_sleep_moci>,
+		    <&pinctrl_gpio_5>,
+		    <&pinctrl_gpio_6>,
+		    <&pinctrl_gpio_7>,
+		    <&pinctrl_gpio_8>,
+		    <&pinctrl_qspi1_io0_gpio>;
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"DI3_RB", /* SODIMM 56 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"DI2_EN", /* SODIMM 218 */
+		"",
+		"",
+		"",
+		"DI2_RB", /* SODIMM 216 */ /* 40 */
+		"DO3_EN", /* SODIMM 220 */
+		"DI3_EN", /* SODIMM 222 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 50 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 60 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 70 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 80 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&main_gpio1 {
+	gpio-line-names =
+		"", /* 0 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 40 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 50 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 60 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 70 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 80 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+/* Verdin I2C_1 */
+&main_i2c1 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	eeprom@57 {
+		compatible = "st,24c02", "atmel,24c02";
+		reg = <0x57>;
+		pagesize = <16>;
+	};
+};
+
+/* Verdin CAN_1 */
+&main_mcan0 {
+	status = "okay";
+};
+
+/* Verdin SPI_1 */
+&main_spi1 {
+	pinctrl-0 = <&pinctrl_spi1>,
+		    <&pinctrl_zinnia_spi1_cs0_gpio>,
+		    <&pinctrl_spi1_cs_gpio>;
+	cs-gpios = <&mcu_gpio0 11 GPIO_ACTIVE_LOW>,
+		   <&main_gpio0 7 GPIO_ACTIVE_LOW>;
+
+	status = "okay";
+
+	tpm@1 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <1>;
+		spi-max-frequency = <18500000>;
+	};
+};
+
+/* Verdin UART_3 */
+&main_uart0 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&main_uart1 {
+	status = "okay";
+};
+
+&mcu_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio_1>,
+		    <&pinctrl_gpio_2>,
+		    <&pinctrl_gpio_3>,
+		    <&pinctrl_gpio_4>,
+		    <&pinctrl_pcie_1_reset>;
+	gpio-line-names =
+		"",
+		"DO1_EN", /* SODIMM 206 */
+		"DI1_EN", /* SODIMM 208 */
+		"DI1_RB", /* SODIMM 210 */
+		"DO2_EN", /* SODIMM 212 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+/* Verdin SD_1 */
+&sdhci1 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usb0 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb1 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usbss0 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usbss1 {
+	status = "okay";
+};
+
+/* Verdin PCIE_1_RESET# */
+&verdin_pcie_1_reset_hog {
+	status = "okay";
+};
+
+/* Verdin UART_2 */
+&wkup_uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_wkup_uart0>, <&pinctrl_wkup_uart0_rts>;
+	rs485-rts-active-low;
+	rs485-rx-during-tx;
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dts
new file mode 100644
index 000000000000..eba8d7a5b1bf
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-nonwifi-zinnia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am625.dtsi"
+#include "k3-am62-verdin.dtsi"
+#include "k3-am62-verdin-nonwifi.dtsi"
+#include "k3-am62-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62 on Zinnia Board";
+	compatible = "toradex,verdin-am62-nonwifi-zinnia",
+		     "toradex,verdin-am62-nonwifi",
+		     "toradex,verdin-am62",
+		     "ti,am625";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.dts b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.dts
new file mode 100644
index 000000000000..6f3f8eb42ed6
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-wifi-zinnia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am625.dtsi"
+#include "k3-am62-verdin.dtsi"
+#include "k3-am62-verdin-wifi.dtsi"
+#include "k3-am62-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62 WB on Zinnia Board";
+	compatible = "toradex,verdin-am62-wifi-zinnia",
+		     "toradex,verdin-am62-wifi",
+		     "toradex,verdin-am62",
+		     "ti,am625";
+};
-- 
2.47.3


