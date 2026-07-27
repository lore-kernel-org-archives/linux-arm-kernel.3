Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 58574C53209
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 19:53:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=i2qx/v+PJ5mvW66QZN99UPyEJ0gQWpu2Dvh4O4ZB+y4=; b=sJkMoe33m+1tnIN46RgmvZqjLL
	HliqwEQaCkAT6oYLpTBts4zRl8prd0UKc/vn2hzxC87k7hWtlVS3fUn6FxxjrUg4GbOEyRvPCdSFm
	hh8szdn07W8lYASnasPA+8gF9khry5ALTKvx7/qTwjBfyCcdwRePt80t+5Y7cy5Ej4dxz7YeUjLdt
	BeGygVri29MKtlIF+ivzKuz+3DKU7DHriWAKtDOfc2571hiQHxtb06NcLEYVOExdsI5yPdIIJVZgX
	Lbf6pWY88kMh4//XaV1dq9qj3xmmbcUkGf1K8GN/0ciW/sx4K3aMylpb7xlTpKgsz78AMG71+cauS
	19+Jwt0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woROP-00000003n6l-2FWC;
	Mon, 27 Jul 2026 19:53:41 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woROF-00000003n06-1O67
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 19:53:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1413A1190A5;
	Mon, 27 Jul 2026 21:53:25 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785182005; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=i2qx/v+PJ5mvW66QZN99UPyEJ0gQWpu2Dvh4O4ZB+y4=;
	b=eHuepWJVtVfO43PY+Es8wUoUf6otDCcSr0ZsjjN+dtlBkwksd3lo4gAd3Loveitx6gFkOa
	fWJXD++YEVesUZm4lC+vpRr8h2lwxTGH+bcq/J4p67kyJtV6RR1u7gB9+71zJpipy0vnhD
	nMDGJ2zTzfYRSIdeR965l/MzOTe8Lwc7AU9XZeaKh6aL9cYssoQszaB4FLxj4CEZBJylJ8
	h4agZbTIsXaUbf7o7p5lWe3Tk44yU9i7OTQAeSSaRKBoBtkBJ9Goa4K1SuWh9bddnZx9gP
	hdRaC4SRlf/FjMi1Wvv/IeIMwCDD74uFrRd/7iCH0qiR/kGgo4WmxRqCgT7Ehg==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH v6 7/7] arm64: dts: imx8mm: imx8mp: Add FIO1-Audio DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Mon, 27 Jul 2026 21:52:22 +0200
Message-ID: <20260727195244.78199-7-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260727195244.78199-1-marex@nabladev.com>
References: <20260727195244.78199-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_125331_653928_1BC6D8A4 
X-CRM114-Status: GOOD (  15.78  )
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

Add DT overlay for feature connector expansion module eDM-MOD-iMX8Mm-FIO1-Audio
providing additional UARTs, CAN, PWM Beeper, I2C, SPI, GPIO breakout and
SGTL5000 codec. This adapter can be optionally populated onto the eDM SBC.

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
V2: Deduplicate the DTOs further
V3: New patch split from the original megapatch
V4: Rebase on next-20260703, drop dependency links which have all landed now
V5: No change
V6: Move compatible and reg properties to the beginning of sgtl5000_fio: codec@a {} node
---
 arch/arm64/boot/dts/freescale/Makefile        |  12 +++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi | 101 ++++++++++++++++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |  74 +++++++++++++
 ...sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso |  62 +++++++++++
 4 files changed, 249 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 3b3c73a430ed1..b4c769ae1937f 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -128,6 +128,10 @@ imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
 
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo
+
 imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
@@ -169,6 +173,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-cm4.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
@@ -322,6 +328,10 @@ imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo
 
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo
+
 imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
@@ -405,6 +415,8 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-cm7.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
new file mode 100644
index 0000000000000..01cf5c89dbff4
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi
@@ -0,0 +1,101 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	can_osc: can-osc {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <20000000>;
+	};
+
+	sound-fio {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "SGTL5000-FIO1";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&codec_dai_fio>;
+		simple-audio-card,frame-master = <&codec_dai_fio>;
+		simple-audio-card,widgets = "Headphone", "Headphone Jack";
+		simple-audio-card,routing = "Headphone Jack", "HP_OUT";
+
+		simple-audio-card,cpu {
+			sound-dai = <&sai2>;
+		};
+
+		codec_dai_fio: simple-audio-card,codec {
+			sound-dai = <&sgtl5000_fio>;
+		};
+	};
+};
+
+&ecspi2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	status = "okay";
+
+	can_fio: can@0 {
+		compatible = "microchip,mcp2518fd";
+		reg = <0>;
+		clocks = <&can_osc>;
+		spi-max-frequency = <10000000>;
+	};
+};
+
+&i2c_feature {	/* Feature connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	sgtl5000_fio: codec@a {
+		compatible = "fsl,sgtl5000";
+		reg = <0x0a>;
+		#sound-dai-cells = <0>;
+		clocks = <&sai5clk 1>;
+		VDDA-supply = <&buck4_reg>;
+		VDDD-supply = <&buck5_reg>;
+		VDDIO-supply = <&buck4_reg>;
+	};
+
+	gpio_feature: io-expander@20 {
+		compatible = "nxp,pca9554";
+		reg = <0x20>;
+		#gpio-cells = <2>;
+		gpio-controller;
+		#interrupt-cells = <2>;
+		interrupt-controller;
+		interrupt-parent = <&gpio5>;
+		interrupts = <4 IRQ_TYPE_LEVEL_LOW>;
+		gpio-line-names =
+			"GPI0", "GPI1", "GPI2", "GPI3",
+			"GPO0", "GPO1", "GPO2", "GPO3";
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c32";
+		reg = <0x50>;
+		pagesize = <32>;
+	};
+};
+
+&sai2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pinctrl_sai2>;
+	assigned-clock-rates = <24576000>;
+	fsl,sai-asynchronous;
+	fsl,sai-mclk-direction-output;
+	status = "okay";
+};
+
+&uart2 {	/* RS422 J12 */
+	linux,rs485-enabled-at-boot-time;
+	uart-has-rtscts;
+	status = "okay";
+};
+
+/* UART4 is blocked by RDC and used as CM4 console UART */
+&uart4 {	/* UART to 1-Wire J5 */
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
new file mode 100644
index 0000000000000..4a02bd026ac16
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
@@ -0,0 +1,74 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mm-clock.h>
+
+#include "imx8mm-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi"
+
+&can_fio {
+	interrupts-extended = <&gpio4 25 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_codec_mclk: codec-mclk_feature-grp {
+		fsl,pins = <
+			/* GPIO4_IO27 */
+			MX8MM_IOMUXC_SAI2_MCLK_SAI5_MCLK		0x2
+		>;
+	};
+
+	pinctrl_sai2: sai2_feature-grp {
+		fsl,pins = <
+			MX8MM_IOMUXC_SAI2_RXC_SAI2_RX_BCLK		0x90
+			MX8MM_IOMUXC_SAI2_TXD0_SAI2_TX_DATA0		0x96
+			MX8MM_IOMUXC_SAI2_RXD0_SAI2_RX_DATA0		0x90
+			MX8MM_IOMUXC_SAI2_TXFS_SAI2_TX_SYNC		0x96
+		>;
+	};
+};
+
+&pinctrl_hog_feature {
+	fsl,pins = <
+		/* GPIO5_IO03 */
+		MX8MM_IOMUXC_SPDIF_TX_GPIO5_IO3				0x40000006
+		/* GPIO5_IO04 */
+		MX8MM_IOMUXC_SPDIF_RX_GPIO5_IO4				0x40000006
+
+		/* CAN_INT# */
+		MX8MM_IOMUXC_SAI2_TXC_GPIO4_IO25			0x40000090
+	>;
+};
+
+&sai2 {
+	assigned-clocks = <&clk IMX8MM_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MM_AUDIO_PLL1_OUT>;
+	fsl,sai-bit-clock-swap;
+};
+
+&spba2 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	sai5clk: clock-controller@30050000 {	/* SAI5 */
+		compatible = "fsl,imx8mm-sai-clock", "fsl,imx8mq-sai-clock";
+		reg = <0x30050000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&clk IMX8MM_CLK_SAI5_IPG>,
+			 <&clk IMX8MM_CLK_SAI5_ROOT>;
+		clock-names = "bus", "mclk1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_codec_mclk>;
+		assigned-clocks = <&clk IMX8MM_CLK_SAI5>,
+				  <&clk IMX8MM_CLK_CLKOUT1_SEL>,
+				  <&clk IMX8MM_CLK_CLKOUT2_SEL>;
+		assigned-clock-parents = <&clk IMX8MM_CLK_24M>,
+					 <&clk IMX8MM_CLK_24M>,
+					 <&clk IMX8MM_CLK_24M>;
+		assigned-clock-rates = <24000000>;
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
new file mode 100644
index 0000000000000..90c2dd1e67248
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtso
@@ -0,0 +1,62 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/clock/imx8mp-clock.h>
+
+#include "imx8mp-pinfunc.h"
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-fio1-audio.dtsi"
+
+&can_fio {
+	interrupts-extended = <&gpio2 10 IRQ_TYPE_LEVEL_LOW>;
+};
+
+&iomuxc {
+	pinctrl_codec_mclk: codec-mclk_feature-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_MCLK__AUDIOMIX_SAI5_MCLK	0xd6
+		>;
+	};
+
+	sai2-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI2_TXFS__AUDIOMIX_SAI2_TX_SYNC	0xd6
+			MX8MP_IOMUXC_SAI2_TXD0__AUDIOMIX_SAI2_TX_DATA00	0xd6
+			MX8MP_IOMUXC_SAI2_TXC__AUDIOMIX_SAI2_TX_BCLK	0xd6
+			MX8MP_IOMUXC_SAI2_RXD0__AUDIOMIX_SAI2_RX_DATA00	0xd6
+		>;
+	};
+
+	uart1-grp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SD1_CLK__UART1_DCE_TX		0x49
+			MX8MP_IOMUXC_SD1_CMD__UART1_DCE_RX		0x49
+			MX8MP_IOMUXC_SD1_DATA1__UART1_DCE_CTS		0x49
+		>;
+	};
+};
+
+&sai2 {
+	assigned-clocks = <&clk IMX8MP_CLK_SAI2>;
+	assigned-clock-parents = <&clk IMX8MP_AUDIO_PLL2_OUT>;
+};
+
+&spba5 {
+	#address-cells = <1>;
+	#size-cells = <1>;
+
+	sai5clk: clock-controller@30c50000 {
+		compatible = "fsl,imx8mp-sai-clock", "fsl,imx8mq-sai-clock";
+		reg = <0x30c50000 0x10000>;
+		#clock-cells = <1>;
+		clocks = <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_IPG>,
+			 <&audio_blk_ctrl IMX8MP_CLK_AUDIOMIX_SAI5_MCLK1>;
+		clock-names = "bus", "mclk1";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_codec_mclk>;
+		status = "okay";
+	};
+};
-- 
2.53.0


