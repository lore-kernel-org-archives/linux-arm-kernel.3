Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1A09EA3C20
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  9 Apr 2026 09:59:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=mqWq07LFl/mhr/By3ScTj/IISSNJIGZ9UdL8vYvunvI=; b=nK5UN6UVP/igjX5mo6a3CLTcP5
	n8JbAFOH2wej5CwbaY5IUGMhGUGyeErJvCLNXNi5ML2w2IhR6Ui+U6cMQxhfJTEwRlY0M7iOA+uTw
	Uy6jWvUrnQCxixDMbKWE79QciKniCORN5QexTU2xsFxP/Gws+UVOKGf1EzoYkpGdj85mp7I1XaqmE
	mI1U8cRq+89jy2XOAl/nObG0lHVwhPJx/BTiOJdCtidEvRnX3Gj6VYTZ8hksBwlJdgOqJLKba2Qkc
	X4/EX0l5awlcDi1aQv5E8G/Z11Cr3a8V1GS5plf1jChI0BRH1Dy1VLooXKd89CMJZtCNfDUYB4Zb0
	G/jIT0HQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAU-0000000A6ZO-2U1R;
	Thu, 09 Apr 2026 09:59:23 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wAmAK-0000000A6QL-42yF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 09 Apr 2026 09:59:14 +0000
Received: from francesco-nb.. (xcpe-178-82-120-96.dyn.res.sunrise.net [178.82.120.96])
	by mail11.truemail.it (Postfix) with ESMTPA id C343420688;
	Thu,  9 Apr 2026 11:59:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1775728751;
	bh=mqWq07LFl/mhr/By3ScTj/IISSNJIGZ9UdL8vYvunvI=; h=From:To:Subject;
	b=Hpsbd/JmhiKsY+3u0Tbh6tolVfO6hm3B0bFRKgxleZ8LGv7mOooNy0SoKZAKr5FUK
	 gW3XKsTXrMiwKB0IP+Oun+TA+I4pYO09byXFIySISMV+oXfpYERP5GV7mhsij2Wvj4
	 /n2wFBT836xfHuO6bi/gJ+tTMDDP5W0F9A0xxpQROIjaQBY5vtvDSz1o0YKorpYzmP
	 X0A4z1AMW3Y6sw6A6O3zIFXE9PlII65fzRvSdC8IS4oaqw2m/uHKGYcXbUrXN35zfS
	 2RnlEEWcrr6Jh8O13G9DxcgymNGYZigxX2WEi8HP54vBYbqbiKXPrQVIoRUAqBGzrr
	 01/qx+I4kCNWg==
From: Francesco Dolcini <francesco@dolcini.it>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Frank Li <Frank.Li@nxp.com>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Francesco Dolcini <francesco.dolcini@toradex.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH v1 7/7] arm64: dts: freescale: imx95-verdin: Add Zinnia
Date: Thu,  9 Apr 2026 11:58:53 +0200
Message-ID: <20260409095855.61252-8-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
In-Reply-To: <20260409095855.61252-1-francesco@dolcini.it>
References: <20260409095855.61252-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260409_025913_340335_4D852CD4 
X-CRM114-Status: GOOD (  12.83  )
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

Add Zinnia Carrier Board mated with Verdin iMX95.

It features 1 x RS232, 1 x RS485, 1 x CAN, 3 x isolated digital I/O,
2 x GBit/s Ethernet, a mini PCIe slot with USB / SIM card connector
for a modem, USB and SD card interfaces.

Link: https://www.toradex.com/products/carrier-board/zinnia-carrier-board
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/freescale/Makefile        |   2 +
 .../freescale/imx95-verdin-nonwifi-zinnia.dts |  21 +
 .../freescale/imx95-verdin-wifi-zinnia.dts    |  21 +
 .../dts/freescale/imx95-verdin-zinnia.dtsi    | 429 ++++++++++++++++++
 4 files changed, 473 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dts
 create mode 100644 arch/arm64/boot/dts/freescale/imx95-verdin-zinnia.dtsi

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index c14ccf24210a..870b9c9b869f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -518,11 +518,13 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-yavia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-nonwifi-zinnia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-ivy.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-mallow.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-yavia.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx95-verdin-wifi-zinnia.dtb
 
 imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dts
new file mode 100644
index 000000000000..b9fa18f34e9a
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-nonwifi-zinnia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-nonwifi.dtsi"
+#include "imx95-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 on Zinnia Board";
+	compatible = "toradex,verdin-imx95-nonwifi-zinnia",
+		     "toradex,verdin-imx95-nonwifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dts b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dts
new file mode 100644
index 000000000000..789614796370
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-wifi-zinnia.dts
@@ -0,0 +1,21 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
+ * https://www.toradex.com/products/carrier-board/zinnia-carrier-board
+ */
+
+/dts-v1/;
+
+#include "imx95-verdin.dtsi"
+#include "imx95-verdin-wifi.dtsi"
+#include "imx95-verdin-zinnia.dtsi"
+
+/ {
+	model = "Toradex Verdin iMX95 WB on Zinnia Board";
+	compatible = "toradex,verdin-imx95-wifi-zinnia",
+		     "toradex,verdin-imx95-wifi",
+		     "toradex,verdin-imx95",
+		     "fsl,imx95";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx95-verdin-zinnia.dtsi b/arch/arm64/boot/dts/freescale/imx95-verdin-zinnia.dtsi
new file mode 100644
index 000000000000..6409a6ead713
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx95-verdin-zinnia.dtsi
@@ -0,0 +1,429 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Common dtsi for Verdin iMX95 SoM on Zinnia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/nxp-imx95
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
+		led-1 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio5 7 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED1 Blue - SODIMM 46 - LED1_B */
+		led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <1>;
+			gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Red - SODIMM 44 - LED3_R */
+		led-3 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio5 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Green - SODIMM 54 - LED3_G */
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio5 10 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED3 Blue - SODIMM 36 - LED3_B */
+		led-5 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <3>;
+			gpios = <&gpio2 20 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Red - SODIMM 34 - LED4_R */
+		led-6 {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio2 21 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Green - SODIMM 32 - LED4_G */
+		led-7 {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio2 26 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* LED4 Blue - SODIMM 30 - LED4_B */
+		led-8 {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			function-enumerator = <4>;
+			gpios = <&gpio2 16 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	/* Zinnia Power Supply Input Voltage */
+	zinnia-1v8-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 12k + 27k */
+		/* Verdin ADC_4 */
+		io-channels = <&adc1 3>;
+		output-ohms = <27000>;
+	};
+
+	zinnia-3v3-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <54000>; /* 27k + 27k */
+		/* Verdin ADC_3 */
+		io-channels = <&adc1 2>;
+		output-ohms = <27000>;
+	};
+
+	zinnia-5v-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <39000>; /* 27k + 12k */
+		/* Verdin ADC_2 */
+		io-channels = <&adc1 1>;
+		output-ohms = <12000>;
+	};
+
+	zinnia-input-voltage {
+		compatible = "voltage-divider";
+		full-ohms = <204700>; /* 200k + 4.7k */
+		/* Verdin ADC_1 */
+		io-channels = <&adc1 0>;
+		output-ohms = <4700>;
+	};
+};
+
+/* Verdin ADC_1, ADC_2, ADC_3 and ADC_4 */
+&adc1 {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&enetc_port0 {
+	status = "okay";
+};
+
+/* Verdin ETH_2_RGMII */
+&enetc_port1 {
+	phy-handle = <&ethphy2>;
+	phy-mode = "rgmii-id";
+
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&flexcan1 {
+	status = "okay";
+};
+
+&gpio1 {
+	gpio-line-names =
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
+		"", /* 10 */
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+&gpio2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio1>, <&pinctrl_gpio2>, <&pinctrl_gpio3>;
+	gpio-line-names =
+		"DO1_EN", /* SODIMM 206 */ /* 0 */
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
+		"DI1_EN", /* SODIMM 208 */
+		"",
+		"", /* 20 */
+		"",
+		"",
+		"",
+		"DI1_RB", /* SODIMM 210 */
+		"",
+		"",
+		"",
+		"",
+		"",
+		"", /* 30 */
+		"";
+};
+
+&gpio3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio6>;
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
+		"DI2_EN", /* SODIMM 218 */
+		"",
+		"",
+		"", /* 30 */
+		"";
+};
+
+&gpio4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio5>;
+	gpio-line-names =
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
+		"DI2_RB", /* SODIMM 216 */
+		"";
+};
+
+&gpio5 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_gpio4>, <&pinctrl_qspi1_io0_gpio>;
+	gpio-line-names =
+		"DI3_RB", /* SODIMM 56 */ /* 0 */
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
+		"DO2_EN", /* SODIMM 212 */
+		"",
+		"",
+		"",
+		"",
+		"";
+};
+
+/* Verdin I2C_1 */
+&lpi2c4 {
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
+/* Verdin SPI_1 */
+&lpspi6 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_lpspi6>,
+		    <&pinctrl_spi1_cs>,
+		    <&pinctrl_uart8_cts_gpio>;
+	cs-gpios = <&gpio2 14 GPIO_ACTIVE_LOW>,
+		   <&som_gpio_expander 13 GPIO_ACTIVE_LOW>,
+		   <&gpio4 29 GPIO_ACTIVE_LOW>;
+
+	tpm@2 {
+		compatible = "infineon,slb9670", "tcg,tpm_tis-spi";
+		reg = <2>;
+		spi-max-frequency = <18500000>;
+	};
+};
+
+/* Verdin UART_3, used as the Linux console */
+&lpuart1 {
+	status = "okay";
+};
+
+/* Verdin UART_1 */
+&lpuart7 {
+	status = "okay";
+};
+
+/* Verdin UART_2, through RS485 transceiver */
+&lpuart8 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_uart8>, <&pinctrl_uart8_rts>;
+	rs485-rx-during-tx;
+	linux,rs485-enabled-at-boot-time;
+
+	status = "okay";
+};
+
+&netc_emdio {
+	ethphy2: ethernet-phy@2 {
+		reg = <2>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_eth2_rgmii_int>;
+		interrupt-parent = <&gpio1>;
+		interrupts = <12 IRQ_TYPE_LEVEL_LOW>;
+		ti,rx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+		ti,tx-internal-delay = <DP83867_RGMIIDCTL_2_00_NS>;
+	};
+};
+
+&som_gpio_expander {
+	gpio-line-names =
+		"DO3_EN", /* SODIMM 220 */
+		"DI3_EN", /* SODIMM 222 */
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
+		"";
+};
+
+/* Verdin USB_1 */
+&usb2 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usb3 {
+	status = "okay";
+};
+
+&usb3_phy {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&usdhc2 {
+	status = "okay";
+};
+
+&scmi_iomuxc {
+	pinctrl_uart8_cts_gpio: uart8ctsgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO14__GPIO2_IO_BIT14	0x51e>; /* SODIMM 143 */
+	};
+
+	pinctrl_zinnia_leds: zinnialedsgrp {
+		fsl,pins = <IMX95_PAD_GPIO_IO16__GPIO2_IO_BIT16		0x11e>, /* SODIMM 30 */
+			   <IMX95_PAD_GPIO_IO26__GPIO2_IO_BIT26		0x11e>, /* SODIMM 32 */
+			   <IMX95_PAD_GPIO_IO21__GPIO2_IO_BIT21		0x11e>, /* SODIMM 34 */
+			   <IMX95_PAD_GPIO_IO20__GPIO2_IO_BIT20		0x11e>, /* SODIMM 36 */
+			   <IMX95_PAD_XSPI1_DATA5__GPIO5_IO_BIT5	0x11e>, /* SODIMM 44 */
+			   <IMX95_PAD_XSPI1_DATA4__GPIO5_IO_BIT4	0x11e>, /* SODIMM 46 */
+			   <IMX95_PAD_XSPI1_DATA7__GPIO5_IO_BIT7	0x11e>, /* SODIMM 48 */
+			   <IMX95_PAD_XSPI1_SS0_B__GPIO5_IO_BIT10	0x11e>; /* SODIMM 54 */
+	};
+};
-- 
2.47.3


