Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12A5A106ACD1
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Mar 2026 23:35:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=3l08SSYkKyUf9NL2bxVN1z7H+hL8rduwqKbpotBG9fM=; b=3ED9np36RSlwQxXGVMIfGYE9Rh
	o0fehgo129YD4vKC5ioYNjVYcoV3GZKxwOYydVnzvg/4U9Mr+FqwTQz6MUvnoZHkac0deNS9LI2j5
	bbdCwdfYexc8tCxIV3TzrVOzwI2NpLBsSJYQOjFteT//FpCpQ58Z/TBYL8TMbQkff3S95/InGHFim
	Xg8eZadVuzjvNr3hHxydUu0wZtQkWftpc1uYpaZKngxz1f85KQzlxa+5dw3XiGdJnEYu9zE/KRNhF
	A4Bd7JrGKgr4PB/m8qKpeDe6ZE1slk4uZnZwN6dkwwJDG4keEQHxFptU9pQp8Codu2d9ilyxYO/4C
	96m1iu7Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0pYz-0000000FnNV-2yiS;
	Thu, 12 Mar 2026 23:35:33 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0pYx-0000000FnMo-07KZ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Mar 2026 23:35:32 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 8284A105AED;
	Fri, 13 Mar 2026 00:35:27 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1773358528; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding; bh=3l08SSYkKyUf9NL2bxVN1z7H+hL8rduwqKbpotBG9fM=;
	b=RmfNlTEert7CE85O/PjR0pUtHsaLxd/e5A2tB/Bm/4gr3NQHGDwyetqYke1BqKK82/dypV
	XClEIbZ2uE/G9RnlETqLSAa20ccgOjM5wwh5gIGs5IororsVhjSItHE9Z8Vmu9WVB1bKjb
	57bq/y2G9/9eA+ILm9SJVnwiaxoFMxpQeU9VkJ/2kdE5NrYP9/Z0rs/zMBFc4RjELSS34f
	+ZG+FyHXPs09VALRG4+azZgie8KSkRe1M3HXF6PfyrdcpL3FUwQ5r0N+CW7fFqfo6+Y/rK
	qG4BkSjIhFwHKHvwoOHnvzO/lcySBr2+fN4tbAD2jxGlQX3uF2/LCUMInb5IEw==
From: Marek Vasut <marex@nabladev.com>
To: linux-arm-kernel@lists.infradead.org
Cc: Marek Vasut <marex@nabladev.com>,
	Christoph Niedermaier <cniedermaier@dh-electronics.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Frank Li <Frank.Li@nxp.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	devicetree@vger.kernel.org,
	imx@lists.linux.dev,
	kernel@dh-electronics.com,
	linux-kernel@vger.kernel.org
Subject: [PATCH] ARM: dts: imx: Add DT overlays for DH i.MX6 DHCOM SoM and boards
Date: Fri, 13 Mar 2026 00:34:05 +0100
Message-ID: <20260312233526.200157-1-marex@nabladev.com>
X-Mailer: git-send-email 2.51.0
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_163531_369948_A7D0AF89 
X-CRM114-Status: GOOD (  18.08  )
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

Add DT overlays to support DH i.MX6 DHCOM SoM carrier board expansion
modules. The following DT overlays are implemented:
- PDK2:
  - DH 497-200 Display board in edge connector X12
  - DH 505-200 Display board in edge connector X12
  - DH 531-100 SPI/I2C board in header X21
  - DH 531-200 SPI/I2C board in header X22
  - DH 560-200 Display board in edge connector X12
- PicoITX:
  - DH 626-100 Display board in edge connector X2

Signed-off-by: Marek Vasut <marex@nabladev.com>
---
Cc: Christoph Niedermaier <cniedermaier@dh-electronics.com>
Cc: Conor Dooley <conor+dt@kernel.org>
Cc: Fabio Estevam <festevam@gmail.com>
Cc: Frank Li <Frank.Li@nxp.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
Cc: Pengutronix Kernel Team <kernel@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>
Cc: Sascha Hauer <s.hauer@pengutronix.de>
Cc: devicetree@vger.kernel.org
Cc: imx@lists.linux.dev
Cc: kernel@dh-electronics.com
Cc: linux-arm-kernel@lists.infradead.org
Cc: linux-kernel@vger.kernel.org
---
 arch/arm/boot/dts/nxp/imx/Makefile            | 37 +++++++++
 ...l-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi | 75 +++++++++++++++++++
 .../imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi  | 61 +++++++++++++++
 ...mx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso | 28 +++++++
 ...-pdk2-overlay-505-200-x12-ch101olhlwh.dtso | 26 +++++++
 ...mx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso | 32 ++++++++
 ...mx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso | 32 ++++++++
 ...mx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso | 39 ++++++++++
 ...icoitx-overlay-626-100-x2-ch101olhlwh.dtso |  8 ++
 .../boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi   |  2 +-
 10 files changed, 339 insertions(+), 1 deletion(-)
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
 create mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso

diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
index de4142e8f3ce8..856c9f21bd703 100644
--- a/arch/arm/boot/dts/nxp/imx/Makefile
+++ b/arch/arm/boot/dts/nxp/imx/Makefile
@@ -58,6 +58,31 @@ dtb-$(CONFIG_SOC_IMX53) += \
 	imx53-voipac-bsb.dtb
 imx53-qsb-hdmi-dtbs := imx53-qsb.dtb imx53-qsb-hdmi.dtbo
 imx53-qsrb-hdmi-dtbs := imx53-qsrb.dtb imx53-qsb-hdmi.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-497-200-x12-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-531-100-x21-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-531-100-x22-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtbo
+
+imx6qdl-dhcom-pdk2-overlay-560-200-x12-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtbo
+
+imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh-dtbs := \
+	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo
+
 dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6dl-alti6p.dtb \
 	imx6dl-apf6dev.dtb \
@@ -179,6 +204,18 @@ dtb-$(CONFIG_SOC_IMX6Q) += \
 	imx6q-cubox-i-som-v15.dtb \
 	imx6q-dfi-fs700-m60.dtb \
 	imx6q-dhcom-pdk2.dtb \
+	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtb \
+	imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtbo \
+	imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtb \
+	imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtbo \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtb \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtbo \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtb \
+	imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtbo \
+	imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtb \
+	imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtbo \
+	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtb \
+	imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtbo \
 	imx6q-display5-tianma-tm070-1280x768.dtb \
 	imx6q-dmo-edmqmx6.dtb \
 	imx6q-dms-ba16.dtb \
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
new file mode 100644
index 0000000000000..afdb936f1d4e3
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi
@@ -0,0 +1,75 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi.dtsi"
+
+&{/} {
+	lvds-encoder {
+		compatible = "onnn,fin3385", "lvds-encoder";
+		pclk-sample = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lvds_bridge_in: endpoint {
+					remote-endpoint = <&ipu1_dpi0_out>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+
+				lvds_bridge_out: endpoint {
+					remote-endpoint = <&panel_in>;
+				};
+			};
+		};
+	};
+};
+
+&display_bl {
+	pwms = <&pwm1 0 5000000 0>;
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@41 {
+		compatible = "ilitek,ili251x";
+		reg = <0x41>;
+		interrupt-parent = <&gpio4>;
+		interrupts = <7 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio1 4 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <16384>;
+		touchscreen-size-y = <9600>;
+		touchscreen-inverted-x;
+		touchscreen-inverted-y;
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c04";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&ipu1_dpi0_out {
+	remote-endpoint = <&lvds_bridge_in>;
+};
+
+&panel {
+	compatible = "chefree,ch101olhlwh-002";
+};
+
+&panel_in {
+	remote-endpoint = <&lvds_bridge_out>;
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
new file mode 100644
index 0000000000000..5db43e2e240b8
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-overlay-panel-dpi.dtsi
@@ -0,0 +1,61 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+#include <dt-bindings/pwm/pwm.h>
+
+&{/} {
+	display_bl: display-bl {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 16 22 30 40 55 75 102 138 188 255>;
+		default-brightness-level = <8>;
+		enable-gpios = <&gpio3 27 GPIO_ACTIVE_HIGH>;
+		status = "okay";
+	};
+
+	lcd_display: disp0 {
+		compatible = "fsl,imx-parallel-display";
+		#address-cells = <1>;
+		#size-cells = <0>;
+		interface-pix-fmt = "rgb24";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_ipu1_lcdif>;
+		status = "okay";
+
+		port@0 {
+			reg = <0>;
+
+			ipu1_display_in: endpoint {
+				remote-endpoint = <&ipu1_di0_disp0>;
+			};
+		};
+
+		port@1 {
+			reg = <1>;
+
+			ipu1_dpi0_out: endpoint {
+				remote-endpoint = <&panel_in>;
+			};
+		};
+	};
+
+	panel: panel {
+		backlight = <&display_bl>;
+
+		port {
+			panel_in: endpoint {
+			};
+		};
+	};
+};
+
+&ipu1_di0_disp0 {
+	remote-endpoint = <&ipu1_display_in>;
+};
+
+&pwm1 {
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
new file mode 100644
index 0000000000000..277278085442e
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-497-200-x12.dtso
@@ -0,0 +1,28 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi.dtsi"
+
+&display_bl {
+	pwms = <&pwm1 0 50000 PWM_POLARITY_INVERTED>;
+};
+
+&ipu1_dpi0_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&panel {
+	compatible = "dataimage,scf0700c48ggu18";
+};
+
+&panel_in {
+	remote-endpoint = <&ipu1_dpi0_out>;
+};
+
+&touch_i2c {	/* TSC2004 */
+	status = "okay";
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
new file mode 100644
index 0000000000000..43b96e7908392
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-505-200-x12-ch101olhlwh.dtso
@@ -0,0 +1,26 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi"
+
+&{/} {
+	gpio-keys {
+		/* BUTTON1 GPIO-B conflicts with touchscreen reset */
+		button-1 {
+			/* Use status as /delete-node/ does not work in DTOs */
+			status = "disabled";
+		};
+	};
+
+	led {
+		/* LED7 GPIO-H conflicts with touchscreen IRQ */
+		led-7 {
+			/* Use status as /delete-node/ does not work in DTOs */
+			status = "disabled";
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
new file mode 100644
index 0000000000000..3ce48b07e3ea6
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x21.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		pagesize = <16>;
+	};
+};
+
+&ecspi1 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@1 {
+		compatible = "microchip,25aa010a", "atmel,at25";
+		reg = <1>;
+		address-width = <8>;
+		pagesize = <16>;
+		size = <128>;
+		spi-max-frequency = <5000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
new file mode 100644
index 0000000000000..a8d81106c1647
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-531-100-x22.dtso
@@ -0,0 +1,32 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&i2c1 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		pagesize = <16>;
+	};
+};
+
+&ecspi2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	eeprom@0 {
+		compatible = "microchip,25aa010a", "atmel,at25";
+		reg = <0>;
+		address-width = <8>;
+		pagesize = <16>;
+		size = <128>;
+		spi-max-frequency = <5000000>;
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
new file mode 100644
index 0000000000000..16ad61545e933
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-pdk2-overlay-560-200-x12.dtso
@@ -0,0 +1,39 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2021 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi.dtsi"
+
+&display_bl {
+	pwms = <&pwm1 0 50000 PWM_POLARITY_INVERTED>;
+};
+
+&ipu1_dpi0_out {
+	remote-endpoint = <&panel_in>;
+};
+
+&panel {
+	compatible = "edt,etm0700g0edh6";
+};
+
+&panel_in {
+	remote-endpoint = <&ipu1_dpi0_out>;
+};
+
+&i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	touchscreen@38 {
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_dhcom_e>;
+		compatible = "edt,edt-ft5406";
+		reg = <0x38>;
+		/* Touchscreen IRQ GPIO-E conflicts with LED5 GPIO */
+		interrupt-parent = <&gpio4>;
+		interrupts = <5 IRQ_TYPE_EDGE_FALLING>; /* GPIO E */
+	};
+};
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
new file mode 100644
index 0000000000000..861306d74a58a
--- /dev/null
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-picoitx-overlay-626-100-x2-ch101olhlwh.dtso
@@ -0,0 +1,8 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR BSD-3-Clause)
+/*
+ * Copyright (C) 2023 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx6qdl-dhcom-overlay-panel-dpi-ch101olhlwh.dtsi"
diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
index af0d95396cd51..3a577d526bb9c 100644
--- a/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
+++ b/arch/arm/boot/dts/nxp/imx/imx6qdl-dhcom-som.dtsi
@@ -303,7 +303,7 @@ ldo2_reg: ldo2 {
 		};
 	};
 
-	touchscreen@49 { /* TSC2004 */
+	touch_i2c: touchscreen@49 { /* TSC2004 */
 		compatible = "ti,tsc2004";
 		interrupts-extended = <&gpio4 14 IRQ_TYPE_EDGE_FALLING>;
 		pinctrl-0 = <&pinctrl_tsc2004>;
-- 
2.51.0


