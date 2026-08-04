Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9C5F5C55184
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  4 Aug 2026 16:23:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VCKpBgog1YAJLaU/iNX+JAjB9W7f/UFxtbqeWTrwAOI=; b=YDXBrbx8LiFJYF0NFOHzuACr4X
	kU6FZha/1bTqy9VgDnvVoxTD5cbX1l36K6GPPpt8ft2c5cbLDAZTApg3F1b5a6sR5Bui08EQuiiHM
	azE6HWirSjnADEtep+BsEIbSaodhjGj8G9XxdJFpsqU5zFzMSaAf52Rt4X5ey6j+eqq1RDx7V2WCP
	VCLh6ZXtA2/+JH8kvARs6XYklZOn8W3bCPuwMD1tfgUC1jGETN2CrnBiapbq869Nv6Uy2Hssq8Fm3
	zIuElfp/mDZGHqsXRCn6ZsW7juZjNhszMigS2qG1iF9RBQTRddF8InZ/xd+mPQMMZe2tfibcHTZJI
	rJyPQmFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHvY-00000002JBb-0MmP;
	Tue, 04 Aug 2026 16:23:40 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wrHvV-00000002J97-2RnL
	for linux-arm-kernel@lists.infradead.org;
	Tue, 04 Aug 2026 16:23:39 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 344E411968F;
	Tue, 04 Aug 2026 18:23:31 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785860611; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VCKpBgog1YAJLaU/iNX+JAjB9W7f/UFxtbqeWTrwAOI=;
	b=PiNYx7Y9xNSfQN8+dmJlqG6k5WptzPc+nrRERcH1Qiv0WjIv7fryK2w9uBStOq3sHfDW2H
	MRJBhYX5pb4TAdoBLgIe/CaXXod6IABiY1MciR9FVxibE92KrQz1CTp1k3gAtZ0WkCpa//
	RqevGypDhjIw+WhdUq6vfx8GuOnk0pyri5myaRT7vLfJfKR0Zd/CveZYUr/gVLC3MeBIwe
	OXXvAHg+UOCvrKLijcuUGkpFoShk4cEByXsoKdpyc8RukpZDCsHhtfq7jHs2Vcq2yOW4w/
	AXQYwU2t/qB8BnF8dhysL1Gvb7YiZFGLeEeEM9B+GuCm8lih7wpmzVHoTZ9mnQ==
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
Subject: [PATCH v9 4/7] arm64: dts: imx8mm: imx8mp: Add HDMI DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Tue,  4 Aug 2026 18:22:48 +0200
Message-ID: <20260804162310.24374-4-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260804162310.24374-1-marex@nabladev.com>
References: <20260804162310.24374-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260804_092337_903288_D28DF439 
X-CRM114-Status: GOOD (  17.29  )
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

Add DT overlay for the DSI-to-HDMI adapter eDM-MOD-iMX8Mm-HDMI populated
with Lontium LT9611 bridge. This adapter can be optionally populated onto
the eDM SBC.

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
V4: Rebase on next-20260703
V5: No change
V6: Move compatible and reg properties to the beginning of lt9611_codec: hdmi-bridge@3b {} node
V7: No change
V8: No change
V9: No change
---
 arch/arm64/boot/dts/freescale/Makefile        | 12 +++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi | 94 +++++++++++++++++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso | 17 ++++
 ...l-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso | 17 ++++
 4 files changed, 140 insertions(+)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 4880f75805c3e..8406efbbb1fd6 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -120,6 +120,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdp-mba8xx.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8dxp-tqma8xdps-mb-smarc-2.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-beacon-kit.dtb
 
+imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
+
 imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
@@ -153,6 +157,8 @@ imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
 	imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
@@ -331,6 +337,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-beacon-kit.dtb
 DTC_FLAGS_imx8mp-cubox-m := -@
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-cubox-m.dtb
 
+imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo
+
 imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo
@@ -408,6 +418,8 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
 	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g101ice-l01.dtb \
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
new file mode 100644
index 0000000000000..59f15d5a33a28
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi
@@ -0,0 +1,94 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2026 Marek Vasut
+ */
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/arm-gic.h>
+
+&{/} {
+	hdmi-out {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi_con: endpoint {
+				remote-endpoint = <&lt9611_out>;
+			};
+		};
+	};
+};
+
+&i2c_display {	/* Display connector I2C */
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	lt9611_codec: hdmi-bridge@3b {
+		compatible = "lontium,lt9611";
+		reg = <0x3b>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_expansion>;
+		vcc-supply = <&buck4_reg>;	/* X400 pin 55, +3V3_S0 */
+		vdd-supply = <&buck5_reg>;	/* X400 pin 51, +1V8_S0 */
+
+		/* Audio I2S not described */
+		#sound-dai-cells = <1>;
+
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+
+				lt9611_a: endpoint {
+					remote-endpoint = <&mipi_dsi_bridge1_out>;
+				};
+			};
+
+			port@2 {
+				reg = <2>;
+
+				lt9611_out: endpoint {
+					remote-endpoint = <&hdmi_con>;
+				};
+			};
+		};
+	};
+
+	eeprom@50 {
+		compatible = "atmel,24c02";
+		reg = <0x50>;
+		pagesize = <16>;
+	};
+};
+
+&iomuxc {
+	/* Free &pinctrl_panel_expansion from hog for lt9611_codec above */
+	pinctrl-0 = <&pinctrl_hog_misc>, <&pinctrl_hog_feature>,
+		    <&pinctrl_hog_panel>, <&pinctrl_hog_sbc>;
+};
+
+&mipi_dsi {
+	/* HDMI 148.5 MHz x2 (DDR) x3 (24bpp / 8) */
+	samsung,burst-clock-frequency = <891000000>;
+	samsung,esc-clock-frequency = <10000000>;
+	status = "okay";
+
+	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		port@1 {
+			reg = <1>;
+
+			mipi_dsi_bridge1_out: endpoint {
+				clock-lanes = <0>;
+				data-lanes = <1 2 3 4>;
+				/* Clock and data lanes have DN/DP swapped */
+				lane-polarities = <1 1 1 1 1>;
+				remote-endpoint = <&lt9611_a>;
+			};
+		};
+	};
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
new file mode 100644
index 0000000000000..334ba299a3541
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi"
+
+&lt9611_codec {
+	interrupts-extended = <&gpio2 3 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio2 2 GPIO_ACTIVE_HIGH>;
+};
+
+&lcdif {
+	status = "okay";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
new file mode 100644
index 0000000000000..d8114fd869b54
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtso
@@ -0,0 +1,17 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2022-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-hdmi.dtsi"
+
+&lt9611_codec {
+	interrupts-extended = <&gpio4 19 IRQ_TYPE_EDGE_FALLING>;
+	reset-gpios = <&gpio4 0 GPIO_ACTIVE_HIGH>;
+};
+
+&lcdif1 {
+	status = "okay";
+};
-- 
2.53.0


