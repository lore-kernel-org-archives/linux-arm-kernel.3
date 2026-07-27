Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 01F4EC54EFC
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jul 2026 09:43:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=SL/cuLkqxVoTdWSYcWlOCc/kE4RI+8CW0W1Amui1b/s=; b=aHVqPVvhrw8wBxyDLqcOsfl+Yx
	k3nGqW4gQAs8XBqXaI/d+GU22TD/ywMVnfgaoyWqcr0ncAAhLkmlC3K6j4XPe7DH4k9/VNpZn7/US
	eglCIhsk5DHewTqzspu/IohYJd2oHAn1HrKmvSSy+aSFvjADGnv6ufLYTFCyum0YzndX+TLe7XGKE
	2GTbY7Df9qtLKfbOZmnRPX01IPXmze63sf/cSsYrObiP/MQRy4aancgAWtR23spOPL/1Qbpv4cheP
	U8+bGyqULHM0mG7zWcMIgScwCulq8LhvJLnrsfjLIdJ/8eSrcdiHDunEWaxlwEW+9NnXx6I7Iue30
	0u5/pt4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHrO-00000002MC5-0V1m;
	Mon, 27 Jul 2026 09:42:58 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woHrE-00000002M7k-27LT
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jul 2026 09:42:51 +0000
Received: from ptz.office.stw.pengutronix.de ([2a0a:edc0:0:900:1d::77] helo=ratatoskr.trumtrar.info)
	by metis.whiteo.stw.pengutronix.de with esmtp (Exim 4.92)
	(envelope-from <s.trumtrar@pengutronix.de>)
	id 1woHqw-00009N-Pq; Mon, 27 Jul 2026 11:42:30 +0200
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 27 Jul 2026 11:42:15 +0200
Subject: [PATCH v5 3/5] arm64: dts: imx8mp-skov-revc: convert to overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-3-67faa5ee0bf6@pengutronix.de>
References: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
In-Reply-To: <20260727-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v5-0-67faa5ee0bf6@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
 Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=6513;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=pvB4zZcEUALSaOKN9RLacMLokyxRN2JRtA3hcxvTIRQ=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ1a6BssUwYMGNws9JWJDIxdxbFgjbD2Lo+jqjrXKc7x+l
 k3vtbnRUcrCIMbFICumyKKysIJP1OODZ+Q0ES6YOaxMIEMYuDgF4CJrGf7Hui3tMOS7V6lwJmj7
 1V8JhXdvLF7tZqxiFHk0YXWkSJoZI0MHb8nvjX/k07YVTp5xy+XW810bAieYdZ48lfg6IW0izzJ
 WAA==
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-SA-Exim-Connect-IP: 2a0a:edc0:0:900:1d::77
X-SA-Exim-Mail-From: s.trumtrar@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260727_024248_701321_6002CAE5 
X-CRM114-Status: GOOD (  13.49  )
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

The i.MX8MP Skov RevC jutouch 10" and Tian 7" variants are pretty
similar, apart from the Display and touch controller.

Move the common bindings to imx8mp-skov-revc-touch.dts and convert both
variants to use overlays applied on this base version.

Signed-off-by: Steffen Trumtrar <s.trumtrar@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  6 +++
 ...ts => imx8mp-skov-revc-jutouch-jt101tm023.dtso} | 44 ++++++----------------
 ...07017.dts => imx8mp-skov-revc-tian-g07017.dtso} | 33 ++++------------
 .../boot/dts/freescale/imx8mp-skov-revc-touch.dts  | 41 ++++++++++++++++++++
 4 files changed, 66 insertions(+), 58 deletions(-)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index b46f452f4b988..2caac104bec6e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -434,8 +434,14 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-hdmi.dtb
+
+imx8mp-skov-revc-jutouch-jt101tm023-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-jutouch-jt101tm023.dtbo
+imx8mp-skov-revc-tian-g07017-dtbs += imx8mp-skov-revc-touch.dtb \
+	imx8mp-skov-revc-tian-g07017.dtbo
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-jutouch-jt101tm023.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-toradex-smarc-dev.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
similarity index 65%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
index 3e320d6dea3a2..b50960879e82d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
@@ -1,10 +1,12 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 /dts-v1/;
+/plugin/;
 
-#include "imx8mp-skov-reva.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
-/ {
+&{/} {
 	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
 	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
 
@@ -21,13 +23,9 @@ in_lvds0: endpoint {
 	};
 };
 
-&backlight {
-	status = "okay";
-};
-
 &i2c2 {
-	clock-frequency = <100000>;
-	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	touchscreen@2a {
 		compatible = "eeti,exc81w32", "eeti,exc80h84";
@@ -42,38 +40,20 @@ touchscreen@2a {
 	};
 };
 
-&lcdif2 {
-	status = "okay";
-};
-
 &lvds_bridge {
-	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
-				 <&clk IMX8MP_VIDEO_PLL1>;
-	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
 	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 7 */
 	assigned-clock-rates = <0>, <506800000>;
-	status = "okay";
 
 	ports {
+		#address-cells = <1>;
+		#size-cells = <0>;
+
 		port@1 {
+			reg = <1>;
+
 			ldb_lvds_ch0: endpoint {
 				remote-endpoint = <&in_lvds0>;
 			};
 		};
-	};
-};
-
-&pwm4 {
-	status = "okay";
-};
-
-&pwm1 {
-	status = "okay";
-};
-
-&reg_tft_vcom {
-	regulator-min-microvolt = <3160000>;
-	regulator-max-microvolt = <3160000>;
-	voltage-table = <3160000 73>;
-	status = "okay";
+        };
 };
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
similarity index 68%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
index 9a562c011f2c2..4f37723dbe8a1 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
@@ -1,8 +1,10 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 /dts-v1/;
+/plugin/;
 
-#include "imx8mp-skov-reva.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
 / {
 	model = "SKOV IMX8MP CPU revC - TIAN G07017";
@@ -21,13 +23,9 @@ in_lvds0: endpoint {
 	};
 };
 
-&backlight {
-	status = "okay";
-};
-
 &i2c2 {
-	clock-frequency = <100000>;
-	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
 
 	touchscreen@38 {
 		compatible = "edt,edt-ft5506";
@@ -45,16 +43,14 @@ touchscreen@38 {
 };
 
 &lcdif2 {
+	#address-cells = <1>;
+	#size-cells = <0>;
 	status = "okay";
 };
 
 &lvds_bridge {
-	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
-				 <&clk IMX8MP_VIDEO_PLL1>;
-	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
 	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
 	assigned-clock-rates = <0>, <358400000>;
-	status = "okay";
 
 	ports {
 		port@1 {
@@ -64,18 +60,3 @@ ldb_lvds_ch0: endpoint {
 		};
 	};
 };
-
-&pwm4 {
-	status = "okay";
-};
-
-&pwm1 {
-	status = "okay";
-};
-
-&reg_tft_vcom {
-	regulator-min-microvolt = <3160000>;
-	regulator-max-microvolt = <3160000>;
-	voltage-table = <3160000 73>;
-	status = "okay";
-};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
new file mode 100644
index 0000000000000..f2206060bc7ce
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "imx8mp-skov-reva.dtsi"
+
+/ {
+	model = "SKOV IMX8MP CPU revC";
+	compatible = "skov,imx8mp-skov-revc", "fsl,imx8mp";
+};
+
+&backlight {
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+			  <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	status = "okay";
+};
+
+&pwm4 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&reg_tft_vcom {
+	regulator-min-microvolt = <3160000>;
+	regulator-max-microvolt = <3160000>;
+	voltage-table = <3160000 73>;
+	status = "okay";
+};

-- 
2.51.0


