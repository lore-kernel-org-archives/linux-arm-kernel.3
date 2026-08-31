Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C2C7BC61DE2
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 31 Aug 2026 08:18:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=c+OdTGUZN+WT8dq7KUU2F9hITYV4aaAtXKu8QTQ/3fA=; b=WDa5mSVqWKAXSZSXaLYZrLGk5T
	NFbnYRAv4Tj8cqoUfVxbcgKWx09/sDLOFXYLkgv/3neqiutEiwDAOk47VRZkV87Z107weyNo94jWO
	aA4fGa9Yig/ByDpaEXKJT12Y7tW9N3BDj2SLGBiTDHu6V4XHgxkv4Rn5utX1kyYwUER696OBVJRdq
	Gza0kqDkAUhdUFKGXvoXjYrevmTBWVHdikZqE8CrTik13SMM5fVBykgJRbqJ6/z9YLy3MrGmhdCtL
	n5Yxs3oqlHZSDAHg3znHKwOCgT1Da9SHp5MV2av+0LlqhfIcEPdFGCcQhD49GLQyEHmfAZM6wSJpK
	LAEhSTqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xDg-00000008ovd-3lze;
	Mon, 31 Aug 2026 08:18:20 +0000
Received: from mx1.white.stw.pengutronix.de ([185.203.200.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x0xDU-00000008ooX-2Hpy
	for linux-arm-kernel@lists.infradead.org;
	Mon, 31 Aug 2026 08:18:10 +0000
Received: from ratatoskr.trumtrar.info (unknown [IPv6:2a00:1f:f805:4b01:1e0e:d42d:4ec8:33b2])
	(Authenticated sender: str@pengutronix.de)
	by mx1.white.stw.pengutronix.de (Postfix) with ESMTPSA id 59D46201D0F;
	Mon, 31 Aug 2026 10:18:04 +0200 (CEST)
From: Steffen Trumtrar <s.trumtrar@pengutronix.de>
Date: Mon, 31 Aug 2026 10:17:40 +0200
Subject: [PATCH v8 3/5] arm64: dts: imx8mp-skov-revc: convert to overlays
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-3-e2e635452ba9@pengutronix.de>
References: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
In-Reply-To: <20260831-v7-0-topic-imx8mp-skov-dts-jutouch-7inch-v8-0-e2e635452ba9@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Frank Li <Frank.Li@nxp.com>, 
 Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Fabio Estevam <festevam@gmail.com>, Shawn Guo <shawnguo@kernel.org>
Cc: Steffen Trumtrar <s.trumtrar@pengutronix.de>, 
 =?utf-8?q?S=C3=B8ren_Andersen?= <san@skov.dk>, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, imx@lists.linux.dev, 
 linux-arm-kernel@lists.infradead.org
X-Mailer: b4 0.15.2
X-Developer-Signature: v=1; a=openpgp-sha256; l=7012;
 i=s.trumtrar@pengutronix.de; h=from:subject:message-id;
 bh=zIXDhvl0xZGo11ShoaF1/LYK8iSCk6TMC6ZQp0Ouftw=;
 b=owGbwMvMwCUmtVehiCsuTInxtFoSQ9ZUi53prifqj+8u3xo2Y98b4y9GMVxe5yc3/7jvp/wx9
 lLUlE9HO0pZGMS4GGTFFFlUFlbwiXp88IycJsIFM4eVCWQIAxenAEzEppuR4WvxyaLs4CcWDVX/
 Dm3edE1qlmwEi6rXywtXBLa0939UkmNk6N60smdKVY9DpM7XTRde/pN4eeNLqJTuxsrbYUGHaqT
 Z2QE=
X-Developer-Key: i=s.trumtrar@pengutronix.de; a=openpgp;
 fpr=24A1780E1548F0495996140A1ABD20720A5E5622
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260831_011808_746553_DC70D88C 
X-CRM114-Status: GOOD (  12.79  )
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
 ...ts => imx8mp-skov-revc-jutouch-jt101tm023.dtso} | 46 ++++++----------------
 ...07017.dts => imx8mp-skov-revc-tian-g07017.dtso} | 44 ++++++---------------
 .../boot/dts/freescale/imx8mp-skov-revc-touch.dts  | 45 +++++++++++++++++++++
 4 files changed, 76 insertions(+), 65 deletions(-)

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
similarity index 60%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
index 3e320d6dea3a2..b19912e6e0db0 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-jutouch-jt101tm023.dtso
@@ -1,12 +1,14 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 /dts-v1/;
+/plugin/;
 
-#include "imx8mp-skov-reva.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
-/ {
+&{/} {
 	model = "SKOV IMX8MP CPU revC - JuTouch JT101TM023";
-	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "fsl,imx8mp";
+	compatible = "skov,imx8mp-skov-revc-jutouch-jt101tm023", "skov,imx8mp-skov-revc-touch", "fsl,imx8mp";
 
 	panel {
 		compatible = "jutouch,jt101tm023";
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
similarity index 61%
rename from arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
rename to arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
index 9a562c011f2c2..13c83855cfd6d 100644
--- a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dtso
@@ -1,12 +1,14 @@
 // SPDX-License-Identifier: (GPL-2.0 OR MIT)
 
 /dts-v1/;
+/plugin/;
 
-#include "imx8mp-skov-reva.dtsi"
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/interrupt-controller/irq.h>
 
-/ {
+&{/} {
 	model = "SKOV IMX8MP CPU revC - TIAN G07017";
-	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
+	compatible = "skov,imx8mp-skov-revc-tian-g07017", "skov,imx8mp-skov-revc-touch", "fsl,imx8mp";
 
 	panel {
 		compatible = "topland,tian-g07017-01";
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
@@ -44,38 +42,20 @@ touchscreen@38 {
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
 	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
 	assigned-clock-rates = <0>, <358400000>;
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
index 0000000000000..46be8c2e1619c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-touch.dts
@@ -0,0 +1,45 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "imx8mp-skov-reva.dtsi"
+
+/ {
+	model = "SKOV IMX8MP CPU revC";
+	compatible = "skov,imx8mp-skov-revc-touch", "fsl,imx8mp";
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
+&lcdif2 {
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


