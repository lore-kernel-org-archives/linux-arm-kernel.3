Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C4551C3600E
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 26 Mar 2025 17:38:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qJTpC5sAhsfwgi4VUrQhS89cZHgib6KieAtnayphjY8=; b=suPRzFppOO7NmMU6Q3RH0XdHlJ
	9Y2HvRYjSmP3Edz5m/8gc1pbE+bet7f/GXRXayeTRZBtv5aIMdJyEWZGChHmFoay7YFNmZRfq2RTu
	6cUIzCJd7fxwICrh43G2QATz4jSqr2SCLnClCSGMGzh170Lnn/MGCsp2kMFnSMnS1h7GMzg1N4iri
	ln3K7dm/NCIITRYm2I6/cXMRSAwgclC0+7+2u2+AvBTiMcMf3NDL2s5+xE1MSDU8U+6ntnL2/1Gtx
	GOdilLHxV05/YnJ86O0quvzElqiGqnHGTBRoASgVvoLaWLvL06q3eM91VbJ38lkXeedrGdK4wC5fC
	Tqy2+w8g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUha-00000009DXr-0IqJ;
	Wed, 26 Mar 2025 17:38:06 +0000
Received: from mx.denx.de ([2a03:4000:64:cc:545d:19ff:fe05:8172])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txUe4-00000009CiV-2dzB
	for linux-arm-kernel@lists.infradead.org;
	Wed, 26 Mar 2025 17:34:30 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 1CFCE101CA7F1;
	Wed, 26 Mar 2025 18:34:25 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=denx.de; s=mx-20241105;
	t=1743010466; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=qJTpC5sAhsfwgi4VUrQhS89cZHgib6KieAtnayphjY8=;
	b=arDpxXX2gK1beIIYcB/7ptMVLO6s0Gr6S4rMnA5Iiq+KSyqMU0l760UmMtNPsCSRipy5cu
	JS2RFZF08JXfP+EeveXmqHx/Djaaenq4Vt8xzCNi4sLZ5oAVoC/ysW+CovtSwa6pF6/Bf0
	0/o6NsxS7PPEvSVL+Vj2x29crj01IgLjzA8brnzAJW8VK5Q+JgjGcH7hED2Uh44ayRHKgD
	15OCy6hSQhHnNILSN6VgOTl8FtJsprdP2Jy4zrNyk+xBLPIbvhVGWD+0JnM53QSFE52IBR
	LXINR0YakdwQwMX+CfBEKjaIOy6GPkUAhGPrOjLTfLc5shrzPh9A3qyMFIVa5w==
From: Lukasz Majewski <lukma@denx.de>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org,
	imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	Lukasz Majewski <lukma@denx.de>
Subject: [PATCH 2/2] ARM: dts: mxs: Add support for second revision of the XEA board (imx287)
Date: Wed, 26 Mar 2025 18:34:00 +0100
Message-Id: <20250326173400.2697684-2-lukma@denx.de>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250326173400.2697684-1-lukma@denx.de>
References: <20250326173400.2697684-1-lukma@denx.de>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250326_103428_958629_0164795D 
X-CRM114-Status: GOOD (  16.93  )
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

Up till now the XEA had only single revision supported in Linux kernel.

As some in-HW adjustments were made - it has been required to extend
the support with second version.

Signed-off-by: Lukasz Majewski <lukma@denx.de>
---
 arch/arm/boot/dts/nxp/mxs/Makefile        |   3 +-
 arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dts |  29 ++++
 arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dts |  66 ++++++++
 arch/arm/boot/dts/nxp/mxs/imx28-xea.dts   | 100 -----------
 arch/arm/boot/dts/nxp/mxs/imx28-xea.dtsi  | 191 ++++++++++++++++++++++
 5 files changed, 288 insertions(+), 101 deletions(-)
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dts
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dts
 delete mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
 create mode 100644 arch/arm/boot/dts/nxp/mxs/imx28-xea.dtsi

diff --git a/arch/arm/boot/dts/nxp/mxs/Makefile b/arch/arm/boot/dts/nxp/mxs/Makefile
index 96dd31ea19ba..de4cafd820c2 100644
--- a/arch/arm/boot/dts/nxp/mxs/Makefile
+++ b/arch/arm/boot/dts/nxp/mxs/Makefile
@@ -31,4 +31,5 @@ dtb-$(CONFIG_ARCH_MXS) += \
 	imx28-sps1.dtb \
 	imx28-ts4600.dtb \
 	imx28-tx28.dtb \
-	imx28-xea.dtb
+	imx28-xea-1.dtb \
+	imx28-xea-2.dtb
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dts b/arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dts
new file mode 100644
index 000000000000..a56c9930752a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-xea-1.dts
@@ -0,0 +1,29 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025
+ * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
+ */
+
+/dts-v1/;
+#include "imx28-xea.dtsi"
+
+/ {
+	model = "XEA v1";
+};
+
+&pinctrl {
+	pinctrl-0 = <&hog_pins_a &hog_pins_tiva &hog_pins_rev1>;
+
+	hog_pins_rev1: hog@3 {
+		reg = <3>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP1_SCK__GPIO_2_12
+			MX28_PAD_SSP1_SCK__GPIO_2_12
+			MX28_PAD_SSP2_SS1__GPIO_2_20
+			MX28_PAD_SSP2_SS2__GPIO_2_21
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dts b/arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dts
new file mode 100644
index 000000000000..498905def9c1
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-xea-2.dts
@@ -0,0 +1,66 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025
+ * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
+ */
+
+/dts-v1/;
+#include "imx28-xea.dtsi"
+
+/ {
+	model = "XEA v2";
+};
+
+&pinctrl {
+	pinctrl-0 = <&hog_pins_a &hog_pins_tiva &hog_pins_rev1>;
+
+	hog_pins_rev1: hog@3 {
+		reg = <3>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SAIF0_LRCLK__GPIO_3_21
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	spi1_pins_a: spi1@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_SSP1_SCK__SSP1_SCK
+			MX28_PAD_SSP1_CMD__SSP1_CMD
+			MX28_PAD_SSP1_DATA0__SSP1_D0
+			MX28_PAD_SSP1_DATA3__GPIO_2_15
+		>;
+		fsl,drive-strength = <MXS_DRIVE_8mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_ENABLE>;
+	};
+};
+
+&ssp1 {
+	compatible = "fsl,imx28-spi";
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi1_pins_a>;
+	status = "okay";
+
+	spidev0@0 {
+		compatible = "lwn,btt";
+		spi-max-frequency = <100000000>;
+		reg = <0>;
+	};
+
+	spidev2@2 {
+		compatible = "lwn,btt";
+		spi-max-frequency = <100000000>;
+		reg = <2>;
+	};
+};
+
+&ssp3 {
+	spidev1@1 {
+		compatible = "lwn,btt";
+		spi-max-frequency = <100000000>;
+		reg = <1>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
deleted file mode 100644
index 6c5e6856648a..000000000000
--- a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dts
+++ /dev/null
@@ -1,100 +0,0 @@
-// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
-/*
- * Copyright 2021
- * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
- */
-
-/dts-v1/;
-#include "imx28-lwe.dtsi"
-
-/ {
-	model = "Liebherr XEA board";
-	compatible = "lwn,imx28-xea", "fsl,imx28";
-};
-
-&can0 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&can1_pins_a>;
-	status = "okay";
-};
-
-&i2c1 {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2c1_pins_b>;
-	status = "okay";
-};
-
-&pinctrl {
-	pinctrl-names = "default";
-	pinctrl-0 = <&hog_pins_a &hog_pins_tiva>;
-
-	hog_pins_a: hog@0 {
-		reg = <0>;
-		fsl,pinmux-ids = <
-			MX28_PAD_GPMI_D00__GPIO_0_0
-			MX28_PAD_GPMI_D02__GPIO_0_2
-			MX28_PAD_GPMI_D05__GPIO_0_5
-			MX28_PAD_GPMI_CE1N__GPIO_0_17
-			MX28_PAD_GPMI_RDY0__GPIO_0_20
-			MX28_PAD_GPMI_RDY1__GPIO_0_21
-			MX28_PAD_GPMI_RDY2__GPIO_0_22
-			MX28_PAD_GPMI_RDN__GPIO_0_24
-			MX28_PAD_GPMI_CLE__GPIO_0_27
-			MX28_PAD_LCD_VSYNC__GPIO_1_28
-			MX28_PAD_SSP1_SCK__GPIO_2_12
-			MX28_PAD_SSP1_CMD__GPIO_2_13
-			MX28_PAD_SSP2_SS1__GPIO_2_20
-			MX28_PAD_SSP2_SS2__GPIO_2_21
-			MX28_PAD_LCD_D00__GPIO_1_0
-			MX28_PAD_LCD_D01__GPIO_1_1
-			MX28_PAD_LCD_D02__GPIO_1_2
-			MX28_PAD_LCD_D03__GPIO_1_3
-			MX28_PAD_LCD_D04__GPIO_1_4
-			MX28_PAD_LCD_D05__GPIO_1_5
-			MX28_PAD_LCD_D06__GPIO_1_6
-		>;
-		fsl,drive-strength = <MXS_DRIVE_4mA>;
-		fsl,voltage = <MXS_VOLTAGE_HIGH>;
-		fsl,pull-up = <MXS_PULL_DISABLE>;
-	};
-
-	hog_pins_tiva: hog@1 {
-		reg = <1>;
-		fsl,pinmux-ids = <
-			MX28_PAD_GPMI_RDY3__GPIO_0_23
-			MX28_PAD_GPMI_WRN__GPIO_0_25
-		>;
-		fsl,voltage = <MXS_VOLTAGE_HIGH>;
-		fsl,pull-up = <MXS_PULL_DISABLE>;
-	};
-
-	hog_pins_coding: hog@2 {
-		reg = <2>;
-		fsl,pinmux-ids = <
-			MX28_PAD_GPMI_D01__GPIO_0_1
-			MX28_PAD_GPMI_D03__GPIO_0_3
-			MX28_PAD_GPMI_D04__GPIO_0_4
-			MX28_PAD_GPMI_D06__GPIO_0_6
-			MX28_PAD_GPMI_D07__GPIO_0_7
-		>;
-		fsl,voltage = <MXS_VOLTAGE_HIGH>;
-		fsl,pull-up = <MXS_PULL_DISABLE>;
-	};
-};
-
-&reg_fec_3v3 {
-	gpio = <&gpio0 0 0>;
-};
-
-&reg_usb_5v {
-	gpio = <&gpio0 2 0>;
-};
-
-&spi2_pins_a {
-	fsl,pinmux-ids = <
-		MX28_PAD_SSP2_SCK__SSP2_SCK
-		MX28_PAD_SSP2_MOSI__SSP2_CMD
-		MX28_PAD_SSP2_MISO__SSP2_D0
-		MX28_PAD_SSP2_SS0__GPIO_2_19
-	>;
-};
diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-xea.dtsi b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dtsi
new file mode 100644
index 000000000000..adbdc3871045
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/mxs/imx28-xea.dtsi
@@ -0,0 +1,191 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright 2025
+ * Lukasz Majewski, DENX Software Engineering, lukma@denx.de
+ */
+
+/dts-v1/;
+#include <dt-bindings/interrupt-controller/irq.h>
+#include "imx28-lwe.dtsi"
+
+/ {
+	compatible = "lwn,imx28-xea", "fsl,imx28";
+
+	reg_standby: regulator-standby {
+		compatible = "regulator-fixed";
+		gpio = <&gpio0 20 GPIO_ACTIVE_LOW>;
+		regulator-name = "enable-standby";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+};
+
+&can1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&can1_pins_a>;
+	xceiver-supply = <&reg_usb_5v>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c1_pins_b>;
+	status = "okay";
+};
+
+&eth_switch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mac0_pins_a>, <&mac1_pins_a>;
+	phy-supply = <&reg_fec_3v3>;
+	phy-reset-duration = <25>;
+	phy-reset-post-delay = <10>;
+	status = "okay";
+
+	ethernet-ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		mtip_port1: port@1 {
+			reg = <1>;
+			label = "lan0";
+			local-mac-address = [ 00 00 00 00 00 00 ];
+			phy-mode = "rmii";
+			phy-handle = <&ethphy0>;
+		};
+
+		mtip_port2: port@2 {
+			reg = <2>;
+			label = "lan1";
+			local-mac-address = [ 00 00 00 00 00 00 ];
+			phy-mode = "rmii";
+			phy-handle = <&ethphy1>;
+		};
+	};
+
+	mdio {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy0: ethernet-phy@0 {
+			reg = <0>;
+			smsc,disable-energy-detect;
+			/* Both PHYs (i.e. 0,1) have the same, single GPIO, */
+			/* line to handle both, their interrupts (AND'ed) */
+			interrupt-parent = <&gpio4>;
+			interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		};
+
+		ethphy1: ethernet-phy@1 {
+			reg = <1>;
+			smsc,disable-energy-detect;
+			interrupt-parent = <&gpio4>;
+			interrupts = <13 IRQ_TYPE_EDGE_FALLING>;
+		};
+	};
+};
+
+&mac0 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mac0_pins_a>;
+	phy-supply = <&reg_fec_3v3>;
+	phy-reset-duration = <100>;
+	local-mac-address = [ 00 11 B8 00 BF 8A ];
+	status = "okay";
+};
+
+&mac1 {
+	phy-mode = "rmii";
+	pinctrl-names = "default";
+	pinctrl-0 = <&mac1_pins_a>;
+	status = "okay";
+};
+
+&pinctrl {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hog_pins_a &hog_pins_tiva>;
+
+	hog_pins_a: hog@0 {
+		reg = <0>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_D00__GPIO_0_0
+			MX28_PAD_GPMI_D02__GPIO_0_2
+			MX28_PAD_GPMI_D05__GPIO_0_5
+			MX28_PAD_GPMI_CE1N__GPIO_0_17
+			MX28_PAD_GPMI_RDY0__GPIO_0_20
+			MX28_PAD_GPMI_RDY1__GPIO_0_21
+			MX28_PAD_GPMI_RDY2__GPIO_0_22
+			MX28_PAD_GPMI_RDN__GPIO_0_24
+			MX28_PAD_GPMI_CLE__GPIO_0_27
+			MX28_PAD_LCD_VSYNC__GPIO_1_28
+			MX28_PAD_LCD_D00__GPIO_1_0
+			MX28_PAD_LCD_D01__GPIO_1_1
+			MX28_PAD_LCD_D02__GPIO_1_2
+			MX28_PAD_LCD_D03__GPIO_1_3
+			MX28_PAD_LCD_D04__GPIO_1_4
+			MX28_PAD_LCD_D05__GPIO_1_5
+			MX28_PAD_LCD_D06__GPIO_1_6
+			MX28_PAD_LCD_D15__GPIO_1_15
+			MX28_PAD_LCD_D16__GPIO_1_16
+			MX28_PAD_LCD_D17__GPIO_1_17
+			MX28_PAD_LCD_D18__GPIO_1_18
+		>;
+		fsl,drive-strength = <MXS_DRIVE_4mA>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	hog_pins_tiva: hog@1 {
+		reg = <1>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_RDY3__GPIO_0_23
+			MX28_PAD_GPMI_WRN__GPIO_0_25
+		>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+
+	hog_pins_coding: hog@2 {
+		reg = <2>;
+		fsl,pinmux-ids = <
+			MX28_PAD_GPMI_D01__GPIO_0_1
+			MX28_PAD_GPMI_D03__GPIO_0_3
+			MX28_PAD_GPMI_D04__GPIO_0_4
+			MX28_PAD_GPMI_D06__GPIO_0_6
+			MX28_PAD_GPMI_D07__GPIO_0_7
+		>;
+		fsl,voltage = <MXS_VOLTAGE_HIGH>;
+		fsl,pull-up = <MXS_PULL_DISABLE>;
+	};
+};
+
+&reg_fec_3v3 {
+	gpio = <&gpio0 0 0>;
+};
+
+&reg_usb_5v {
+	gpio = <&gpio0 2 0>;
+};
+
+&ssp2 {
+	spidev1@1 {
+		compatible = "lwn,btt";
+		spi-max-frequency = <100000000>;
+		reg = <1>;
+	};
+
+	spidev2@2 {
+		compatible = "lwn,btt";
+		spi-max-frequency = <100000000>;
+		reg = <2>;
+	};
+};
+
+&spi2_pins_a {
+	fsl,pinmux-ids = <
+		MX28_PAD_SSP2_SCK__SSP2_SCK
+		MX28_PAD_SSP2_MOSI__SSP2_CMD
+		MX28_PAD_SSP2_MISO__SSP2_D0
+		MX28_PAD_SSP2_SS0__GPIO_2_19
+	>;
+};
-- 
2.39.5


