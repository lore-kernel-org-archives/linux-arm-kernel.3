Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 69723E9A751
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c7eM2SJ9kVoOD5IFRfI28dWml91uI1gLjR8xj0U4LUg=; b=U7jK2egrbBmy4I7DW5YmyVW87Y
	3lsjxxQG144NT7qFqVjbIne5jWDfKBbpZ4oIFCwtgEhqSV55gQWzMRqUtupOFnXaBvcWOR/lGOwdH
	xOCT3O1ezuer3W9v5umm04VojZfsuAhlVmh1oL2uF18CkNNSQ4eulE196//aOGir9x0w439hLsCSf
	yxI2cLLFML2Tep8dMzGmbyKgEpQsvyZWkG4fehBoJJU4yBxIxwNETW5QTdpDJ+LV+7cpd+4yk2OmW
	e5oyGl+dyeNJKSMRqSDw6tM18nrNZoLSQ7T37rb/yPgrkuVzkLh9zKPtmaFT4VAVlQ3xaANePAwcx
	ztgREQCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCa-000000016bu-2uNl;
	Tue, 24 Mar 2026 09:37:32 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4yCO-000000016VZ-1rnR
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:37:22 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id ED995275C4;
	Tue, 24 Mar 2026 10:37:13 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1774345034;
	bh=c7eM2SJ9kVoOD5IFRfI28dWml91uI1gLjR8xj0U4LUg=; h=From:To:Subject;
	b=ImbO51RmvA6l59VzhnEFQn+wPulCC4OZckR84YlD7aslGfeOFWW7qDioKoFZH8/Qr
	 QyZyRr6zK7DPafshWuYazisjxs2dZ450u/R/5xYCeWUfNgacO01Fa1cv8mpYlbHWXy
	 fr7ft0/JyJcWFgtB90EXv01Zs2eQTovonEeyWhKmz4dIOXVUc5NMdzhZYLZlRCSwH2
	 6IP1SD3Z97/4wwa3HPCP4MozpXEqUy9EjRMiAt5FomAXXuFm19aQp3Ngo9WMg7D0ns
	 r9aef6U/6jMfolaJUwf2eag1qEuV7T7BardPmcmeTkf7tqjNmsHeCenybVVkL62oHf
	 asbXFA4ICd4DQ==
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
Subject: [PATCH v1 7/7] arm64: dts: ti: k3-am62p-verdin: Add Zinnia
Date: Tue, 24 Mar 2026 10:37:02 +0100
Message-ID: <20260324093705.26730-8-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260324093705.26730-1-francesco@dolcini.it>
References: <20260324093705.26730-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_023720_823847_AA80EC00 
X-CRM114-Status: GOOD (  13.19  )
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

Add Zinnia Carrier Board mated with Verdin AM62P.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
2 x 1GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 .../boot/dts/ti/k3-am62p-verdin-zinnia.dtsi   | 469 ++++++++++++++++++
 .../ti/k3-am62p5-verdin-nonwifi-zinnia.dts    |  22 +
 .../dts/ti/k3-am62p5-verdin-wifi-zinnia.dts   |  22 +
 3 files changed, 513 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts

diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
new file mode 100644
index 000000000000..84ae99dcdda3
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin-zinnia.dtsi
@@ -0,0 +1,469 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin AM62P SoM on Zinnia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/net/ti-dp83867.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
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
+		io-channels = <&som_adc 4>;
+		full-ohms = <39000>; /* 12K + 27K */
+		output-ohms = <27000>;
+	};
+
+	zinnia-3v3-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_3 */
+		io-channels = <&som_adc 5>;
+		full-ohms = <54000>; /* 27K + 27K */
+		output-ohms = <27000>;
+	};
+
+	zinnia-5v-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_2 */
+		io-channels = <&som_adc 6>;
+		full-ohms = <39000>; /* 27K + 12K */
+		output-ohms = <12000>;
+	};
+
+	/* Zinnia Power Supply Input Voltage */
+	zinnia-input-voltage {
+		compatible = "voltage-divider";
+		/* Verdin ADC_1 */
+		io-channels = <&som_adc 7>;
+		full-ohms = <204700>; /* 200K + 4.7K */
+		output-ohms = <4700>;
+	};
+};
+
+&main_pmx0 {
+	pinctrl_zinnia_leds: zinnia-leds-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_IOPAD(0x019c, PIN_INPUT, 7) /* (E24)  MCASP0_AXR1.GPIO1_9    */ /* SODIMM 36 */
+			AM62PX_IOPAD(0x01a0, PIN_INPUT, 7) /* (F23)  MCASP0_AXR0.GPIO1_10   */ /* SODIMM 34 */
+			AM62PX_IOPAD(0x01a4, PIN_INPUT, 7) /* (F24)  MCASP0_ACLKX.GPIO1_11  */ /* SODIMM 30 */
+			AM62PX_IOPAD(0x01a8, PIN_INPUT, 7) /* (F25)  MCASP0_AFSX.GPIO1_12   */ /* SODIMM 32 */
+			AM62PX_IOPAD(0x0088, PIN_INPUT, 7) /* (R24)  GPMC0_OEn_REn.GPIO0_33 */ /* SODIMM 48 */
+			AM62PX_IOPAD(0x0098, PIN_INPUT, 7) /* (AA24) GPMC0_WAIT0.GPIO0_37   */ /* SODIMM 44 */
+			AM62PX_IOPAD(0x008c, PIN_INPUT, 7) /* (T25)  GPMC0_WEn.GPIO0_34     */ /* SODIMM 46 */
+			AM62PX_IOPAD(0x002c, PIN_INPUT, 7) /* (M25)  OSPI0_CSn0.GPIO0_11    */ /* SODIMM 54 */
+		>;
+	};
+};
+
+&mcu_pmx0 {
+	pinctrl_zinnia_spi1_cs0_gpio: mcu-gpio0-11-default-pins {
+		pinctrl-single,pins = <
+			AM62PX_MCU_IOPAD(0x002c, PIN_INPUT,  7) /* (C7) WKUP_UART0_CTSn.GPIO0_11 */ /* SODIMM 143 */
+		>;
+	};
+};
+
+/* Verdin ETHs */
+&cpsw3g {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_rgmii1>, <&pinctrl_rgmii2>;
+
+	status = "okay";
+};
+
+/* MDIO, shared by Verdin ETH_1 (On-module PHY) and Verdin ETH_2_RGMII */
+&cpsw3g_mdio {
+	status = "okay";
+
+	carrier_eth_phy: ethernet-phy@2 {
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_eth2_rgmii_int>;
+		interrupt-parent = <&main_gpio0>;
+		interrupts = <42 IRQ_TYPE_EDGE_FALLING>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&cpsw_port1 {
+	status = "okay";
+};
+
+/* Verdin ETH_2_RGMII */
+&cpsw_port2 {
+	phy-handle = <&carrier_eth_phy>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+&main_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_1_reset>,
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
+		"DI2_RB", /* SODIMM 216 */
+		"DI2_EN", /* SODIMM 218 */ /* 50 */
+		"DO3_EN", /* SODIMM 220 */
+		"DI3_EN", /* SODIMM 222 */
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
+		"",
+		"",
+		"",
+		"", /* 90 */
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
+		"";
+};
+
+/* Verdin I2C_1 */
+&main_i2c0 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp1075";
+		reg = <0x4f>;
+	};
+
+	carrier_eeprom: eeprom@57 {
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
+	pinctrl-0 = <&pinctrl_main_spi1>,
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
+/* Verdin UART_3, used as the Linux console */
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
+		    <&pinctrl_gpio_4>,
+		    <&pinctrl_gpio_3>;
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
+	pinctrl-0 = <&pinctrl_wkup_uart0>,
+		    <&pinctrl_wkup_uart0_rts>;
+	rs485-rts-active-low;
+	rs485-rx-during-tx;
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts
new file mode 100644
index 000000000000..8abf4fe60e99
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-zinnia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-nonwifi.dtsi"
+#include "k3-am62p-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P on Zinnia Board";
+	compatible = "toradex,verdin-am62p-nonwifi-zinnia",
+		     "toradex,verdin-am62p-nonwifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts
new file mode 100644
index 000000000000..e1df7cffdf63
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-zinnia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-wifi.dtsi"
+#include "k3-am62p-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P WB on Zinnia Board";
+	compatible = "toradex,verdin-am62p-wifi-zinnia",
+		     "toradex,verdin-am62p-wifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
-- 
2.47.3


