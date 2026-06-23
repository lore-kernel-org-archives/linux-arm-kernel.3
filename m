Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 12E8ECD98F2
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 23 Jun 2026 11:43:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:Message-ID:Date:Subject:Cc:To:From:Reply-To:Content-Type:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:In-Reply-To:References:List-Owner;
	bh=yb7UQDLlZzHtaJasaGAKrl3Sd5Bz4UqqdhtbFQ14iyI=; b=GATZqTs3xpXvbQYg9EK4XwKgEN
	NNB19b77DuE51iPc6lwYvvB8IYUegiih+4pg3O7MjtFcyeEtsmdn1XJ+1hl+vNsSiG7iDh+w/KT4B
	Jc2lsSSBZXnkWoJoeAJ5VQydaCEn9/Crru3g8gWE8qAFvIHwYdGN3hWKsXPLwehp8+hnjyk9gzT1x
	6QkuAkXPhEUoQgelmZdgFyVq4k54a2h20CN4ZyIX23uiT050DqIXi7QAdhdWEj0UifW7VsJqv58pF
	cmBhwZQpuEZi0K7jjkqPT2yIbGu4B63rAnlci+pl52fBAnxUeBh5KU3IWDX8N7ZIwW9QpmcFYQk9s
	8znW5Odw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzXj-00000006CBK-0MOH;
	Tue, 23 Jun 2026 11:43:51 +0000
Received: from mail11.truemail.it ([2001:4b7e:0:8::81])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wbzXf-00000006CAF-1Lx5
	for linux-arm-kernel@lists.infradead.org;
	Tue, 23 Jun 2026 11:43:50 +0000
Received: from francesco-nb.corp.toradex.com (248.201.173.83.static.wline.lns.sme.cust.swisscom.ch [83.173.201.248])
	by mail11.truemail.it (Postfix) with ESMTPA id BCABE1FA3E;
	Tue, 23 Jun 2026 13:43:39 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=dolcini.it;
	s=default; t=1782215020;
	bh=yb7UQDLlZzHtaJasaGAKrl3Sd5Bz4UqqdhtbFQ14iyI=; h=From:To:Subject;
	b=zBYG71BeieZ6hEoP8aqXPIYezzJDMVt5aUWYdAV1z8603//yFkLxtrvX/bHfmljHv
	 5tjVsyze63BdPd80M9jaBDPRhsxeNutX37ooW0Zinwlv6W4zH89is8nT1HNcRBW/wm
	 I2tIel5ssTRjKq0bNspbYSzeS20+iZmU9Zr9I1FMM2JCmc4UYqiFoujTZchpyeBa+l
	 YWYPxZi+0hHISQwcuqRPTy9Drqwnm4Ss5jiwyZHMCqnWrtEJAXAp89Gk98MdHy3Okl
	 KKU+Hf9TNoUpuoErhceTcpPYVIUCoQvVS3NguXt287wljt1J4/EKy0jMIho8+/Qv5C
	 6KyeAGjS7E+Ug==
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
Subject: [PATCH v1] arm64: dts: ti: k3-am62-verdin: Add RPi Touch Display 2 7-inch
Date: Tue, 23 Jun 2026 13:43:28 +0200
Message-ID: <20260623114329.63142-1-francesco@dolcini.it>
X-Mailer: git-send-email 2.47.3
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260623_044348_271928_06DC0489 
X-CRM114-Status: GOOD (  11.95  )
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

Add a device tree overlay for the Raspberry Pi Touch Display 2 7" on
the Verdin DSI_1 interface.

Link: https://www.raspberrypi.com/products/touch-display-2/
Signed-off-by: Francesco Dolcini <francesco.dolcini@toradex.com>
---
 arch/arm64/boot/dts/ti/Makefile               |   5 +
 .../ti/k3-am625-verdin-rpi-display-2-7in.dtso | 102 ++++++++++++++++++
 2 files changed, 107 insertions(+)
 create mode 100644 arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso

diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
index 371f9a043fe5..f7f5448fcd84 100644
--- a/arch/arm64/boot/dts/ti/Makefile
+++ b/arch/arm64/boot/dts/ti/Makefile
@@ -48,6 +48,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-ov5640.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-dsi.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-10inch-lvds.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-rpi-display-2-7in.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-uart4-mcu.dtbo
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-dsi-to-hdmi.dtb
 dtb-$(CONFIG_ARCH_K3) += k3-am625-verdin-wifi-dahlia-panel-cap-touch-10inch-dsi.dtb
@@ -244,6 +245,9 @@ k3-am625-verdin-wifi-dev-ov5640-dtbs := k3-am625-verdin-wifi-dev.dtb \
 k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi-dtbs := \
 	k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-panel-cap-touch-7inch-dsi.dtbo
+k3-am625-verdin-wifi-dev-rpi-display-2-7in-dtbs := \
+	k3-am625-verdin-wifi-dev.dtb \
+	k3-am625-verdin-rpi-display-2-7in.dtbo
 k3-am625-verdin-wifi-dev-uart4-mcu-dtbs := k3-am625-verdin-wifi-dev.dtb \
 	k3-am625-verdin-uart4-mcu.dtbo
 k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds-dtbs := \
@@ -357,6 +361,7 @@ dtb- += k3-am625-beagleplay-csi2-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-ov5640-24mhz.dtb \
 	k3-am625-verdin-wifi-dev-ov5640.dtb \
 	k3-am625-verdin-wifi-dev-panel-cap-touch-7inch-dsi.dtb \
+	k3-am625-verdin-wifi-dev-rpi-display-2-7in.dtb \
 	k3-am625-verdin-wifi-dev-uart4-mcu.dtb \
 	k3-am625-verdin-wifi-mallow-panel-cap-touch-10inch-lvds.dtb \
 	k3-am62-lp-sk-hdmi-audio.dtb \
diff --git a/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
new file mode 100644
index 000000000000..9a2e7a170a28
--- /dev/null
+++ b/arch/arm64/boot/dts/ti/k3-am625-verdin-rpi-display-2-7in.dtso
@@ -0,0 +1,102 @@
+// SPDX-License-Identifier: GPL-2.0-or-later OR MIT
+/*
+ * Copyright (c) Toradex
+ *
+ * Raspberry Pi Touch Display 2 7" on Verdin DSI_1 and I2C_2_DSI
+ *
+ * https://www.raspberrypi.com/products/touch-display-2/
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/gpio/gpio.h>
+
+&{/} {
+	backlight_rpi: backlight-rpi-display {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 31>;
+		default-brightness-level = <15>;
+		num-interpolated-steps = <31>;
+		pwms = <&mcu_display_rpi 0 200000 0>;
+	};
+
+	reg_display_rpi: regulator-rpi-display {
+		compatible = "regulator-fixed";
+		regulator-max-microvolt = <5000000>;
+		regulator-min-microvolt = <5000000>;
+		regulator-name = "rpi-display";
+	};
+
+	reg_display_rpi_touch: regulator-rpi-display-touch {
+		compatible = "regulator-fixed";
+		gpio = <&mcu_display_rpi 1 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-max-microvolt = <3300000>;
+		regulator-min-microvolt = <3300000>;
+		regulator-name = "rpi-display-touch";
+		startup-delay-us = <50000>;
+	};
+
+};
+
+/* Verdin I2C_2_DSI */
+&main_i2c2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	mcu_display_rpi: regulator@45 {
+		compatible = "raspberrypi,touchscreen-panel-regulator-v2";
+		reg = <0x45>;
+		#gpio-cells = <2>;
+		#pwm-cells = <3>;
+		gpio-controller;
+	};
+
+	touchscreen@5d {
+		compatible = "goodix,gt911";
+		reg = <0x5d>;
+		AVDD28-supply = <&reg_display_rpi_touch>;
+		touchscreen-size-x = <720>;
+		touchscreen-size-y = <1280>;
+	};
+};
+
+&dsi_bridge {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	status = "okay";
+
+	panel@0 {
+		compatible = "raspberrypi,dsi-7inch", "ilitek,ili9881c";
+		reg = <0>;
+		backlight = <&backlight_rpi>;
+		power-supply = <&reg_display_rpi>;
+		reset-gpios = <&mcu_display_rpi 0 GPIO_ACTIVE_LOW>;
+
+		port {
+			dsi_panel_in: endpoint {
+				remote-endpoint = <&dsi_bridge_out>;
+			};
+		};
+	};
+};
+
+&dsi_bridge_ports {
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	port@1 {
+		reg = <1>;
+
+		dsi_bridge_out: endpoint {
+			data-lanes = <1 2>;
+			remote-endpoint = <&dsi_panel_in>;
+		};
+	};
+};
+
+&dss {
+	status = "okay";
+};
-- 
2.47.3


