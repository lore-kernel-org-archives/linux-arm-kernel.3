Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2E7E5C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 11:05:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5XsaBFqhPY2vKoLBmdbLXcfXaOqRM92NgpJ6ZPR/1bg=; b=WABO689KZHjtsLiV9pzS8APr66
	/+M3vDenIpKjulPFjoacfxZBiJNsx3pW3E/g2w3OntRZ91p1Dos86xW7GqUNLqmg+buSD9YgOyrRG
	pDznOmoLqrhNcqudJcZe5bDVAA2Nt5yNuEhZmCylewcw8fIgp6nv5MB90PdsvzwRfWkruKHmp0+5W
	2Hc2dV75vtb6s5we4sRP7XqnHGCrckdaQmwZat+LQmCKz10j4+1kSdGQ3dYUume8rznYj14qUR2yy
	UDArErNFZQvh5wpDV1bWHYrI6T81fll26ST/ug4TRucH8kVDDJ8h9n8+BR4te+XFS9Kg8Sa9sieKB
	0wquYiSA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA5G1-0000000CclN-2Yhk;
	Wed, 30 Apr 2025 11:05:41 +0000
Received: from mail11.truemail.it ([217.194.8.81])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4g7-0000000CWjn-25SR
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:28:37 +0000
Received: from francesco-nb.pivistrello.it (93-49-2-63.ip317.fastwebnet.it [93.49.2.63])
	by mail11.truemail.it (Postfix) with ESMTPA id 5C10F1FA23;
	Wed, 30 Apr 2025 12:28:33 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1746008913;
	bh=5XsaBFqhPY2vKoLBmdbLXcfXaOqRM92NgpJ6ZPR/1bg=; h=From:To:Subject;
	b=Vs2p7jy/uicWAVPKqMTzxYdKGFB3RWQ3ZQ50XA+X9JFuEJ3RZpxnCC1EQidUpmgi5
	 gWw78gegrECuljFZ4He6PFyCctSvsRg8V1L8KVvr3ZUo7JT+slwPDGXYObQnJY+t7A
	 TWCHSZeeupTLbaYqTOdVlyix7SC3l1+zcN0b+T3nyASzPKE07zSqE7k4LM0YBaWiRv
	 0I7+un4sE64/er1VmlwjZn+osTrQ4WYM2qn0agMgZuy88ikoUcjqIlToSreABOA0fN
	 8G6zh3cHF75x9MP1J7wtL+EP7wP2suu7RXKIyNJCjF5MRV3twSB4GIS2/1+4smtjqz
	 v+iZYJzz5eITw==
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
Subject: [PATCH v1 5/6] arm64: dts: ti: am62p-verdin: add yavia
Date: Wed, 30 Apr 2025 12:28:14 +0200
Message-Id: <20250430102815.149162-6-francesco@dolcini.it>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250430102815.149162-1-francesco@dolcini.it>
References: <20250430102815.149162-1-francesco@dolcini.it>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032835_849603_0B0DCCA7 
X-CRM114-Status: GOOD (  12.10  )
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

Add support for Verdin AM62P mated with Verdin Yavia carrier board.

Link: https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
Link: https://www.toradex.com/products/carrier-board/yavia
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   2 +
 .../boot/dts/ti/k3-am62p-verdin-yavia.dtsi    | 219 ++++++++++++++++++
 .../dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts |  22 ++
 .../dts/ti/k3-am62p5-verdin-wifi-yavia.dts    |  22 ++
 4 files changed, 265 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts
 create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dts

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 52e24a31793a..d719d5f57877 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -38,9 +38,11 @@ dtb-$(CONFIG_ARCH_K3) += k3-am62p5-sk.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-mallow.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-nonwifi-yavia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dahlia.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-dev.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-mallow.dtb
+dtb-$(CONFIG_ARCH_K3) += k3-am62p5-verdin-wifi-yavia.dtb
 
 # Common overlays for SK-AM62* family of boards
 dtb-$(CONFIG_ARCH_K3) += k3-am62x-sk-csi2-ov5640.dtbo
diff --git a/arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi b/arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi
new file mode 100644
index 000000000000..b7423a774dc5
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p-verdin-yavia.dtsi
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * Common dtsi for Verdin AM62P SoM on Yavia carrier board
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+#include <dt-bindings/leds/common.h>
+
+/ {
+	aliases {
+		eeprom1 = &carrier_eeprom;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_qspi1_clk_gpio>,
+			    <&pinctrl_qspi1_cs_gpio>,
+			    <&pinctrl_qspi1_io0_gpio>,
+			    <&pinctrl_qspi1_io1_gpio>,
+			    <&pinctrl_qspi1_io2_gpio>,
+			    <&pinctrl_qspi1_io3_gpio>;
+
+		/* SODIMM 52 - LD1_RED */
+		led-0 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 54 - LD1_GREEN */
+		led-1 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 11 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 56 - LD1_BLUE */
+		led-2 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <1>;
+			gpios = <&main_gpio0 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 58 - LD2_RED */
+		led-3 {
+			color = <LED_COLOR_ID_RED>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&main_gpio0 4 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 60 - LD2_GREEN */
+		led-4 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&main_gpio0 5 GPIO_ACTIVE_HIGH>;
+		};
+
+		/* SODIMM 62 - LD2_BLUE */
+		led-5 {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_DEBUG;
+			function-enumerator = <2>;
+			gpios = <&main_gpio0 6 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+/* Verdin ETHs */
+&cpsw3g {
+	status = "okay";
+};
+
+/* MDIO, shared by Verdin ETH_1 (On-module PHY) and Verdin ETH_2_RGMII */
+&cpsw3g_mdio {
+	status = "okay";
+};
+
+/* Verdin ETH_1 (On-module PHY) */
+&cpsw_port1 {
+	status = "okay";
+};
+
+/* Verdin PWM_3_DSI */
+&epwm0 {
+	status = "okay";
+};
+
+/* Verdin PWM_1, PWM_2 */
+&epwm2 {
+	status = "okay";
+};
+
+&main_gpio0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_pcie_1_reset>,
+		    <&pinctrl_qspi1_cs2_gpio>,
+		    <&pinctrl_qspi1_dqs_gpio>,
+		    <&pinctrl_gpio_5>,
+		    <&pinctrl_gpio_6>,
+		    <&pinctrl_gpio_7>,
+		    <&pinctrl_gpio_8>;
+};
+
+/* Verdin I2C_1 */
+&main_i2c0 {
+	status = "okay";
+
+	temperature-sensor@4f {
+		compatible = "ti,tmp75c";
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
+/* Verdin I2C_2_DSI */
+&main_i2c1 {
+	status = "okay";
+};
+
+/* Verdin I2C_4_CSI */
+&main_i2c3 {
+	status = "okay";
+};
+
+/* Verdin CAN_1 */
+&main_mcan0 {
+	status = "okay";
+};
+
+/* Verdin SPI_1 */
+&main_spi1 {
+	status = "okay";
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
+		    <&pinctrl_gpio_3>,
+		    <&pinctrl_gpio_4>;
+};
+
+/* Verdin I2C_3_HDMI */
+&mcu_i2c0 {
+	status = "okay";
+};
+
+/* Verdin CAN_2 */
+&mcu_mcan0 {
+	status = "okay";
+};
+
+/* Verdin UART_4 */
+&mcu_uart0 {
+	status = "okay";
+};
+
+/* Verdin SD_1 */
+&sdhci1 {
+	status = "okay";
+};
+
+/* Verdin USB_1 */
+&usbss0 {
+	status = "okay";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+/* Verdin USB_2 */
+&usbss1 {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+};
+
+/* Verdin CTRL_WAKE1_MICO# */
+&verdin_gpio_keys {
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
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts
new file mode 100644
index 000000000000..c27bda794b51
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-nonwifi-yavia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-nonwifi.dtsi"
+#include "k3-am62p-verdin-yavia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P on Yavia Board";
+	compatible = "toradex,verdin-am62p-nonwifi-yavia",
+		     "toradex,verdin-am62p-nonwifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dts b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dts
new file mode 100644
index 000000000000..25e0842bc905
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am62p5-verdin-wifi-yavia.dts
@@ -0,0 +1,22 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025 Toradex
+ *
+ * https://www.toradex.com/computer-on-modules/verdin-arm-family/ti-am62p
+ * https://www.toradex.com/products/carrier-board/yavia
+ */
+
+/dts-v1/;
+
+#include "k3-am62p5.dtsi"
+#include "k3-am62p-verdin.dtsi"
+#include "k3-am62p-verdin-wifi.dtsi"
+#include "k3-am62p-verdin-yavia.dtsi"
+
+/ {
+	model = "Toradex Verdin AM62P WB on Yavia Board";
+	compatible = "toradex,verdin-am62p-wifi-yavia",
+		     "toradex,verdin-am62p-wifi",
+		     "toradex,verdin-am62p",
+		     "ti,am62p5";
+};
-- 
2.39.5


