Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EC0A8C55167
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 22:44:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=VWSRrnjcpfjKpqa21AYolB4n6H1G3eGIp7mwtWsX2Zg=; b=PRwNATn2hppo4GOsebuTtwBxmH
	bWm/XLcN/Q3TDEwht8FQaEabUDA+JSoaYS4lfwda2XK4Od9JtFZEVHSaooQ9biCfGCRCdqmaTmcII
	oU4C5y1WjAFNn0rnjniZ/+/zeyBExwuVNgKiHrht9gqbrqvWpydlxmJT8C5K8UQ2cKpVaAKF4Aql0
	pVgx32XxtZLXAAiew3HtTC0FXkePze3JeIrt4ArEyrRoRxS3/DHJLRBW4dKNQB42GlyckG1HNOUBf
	YvRLElWWsnuNziGa1zi6GAMVxp9E1plLd/odwWgbmDJRL/ATx3n4nmQnAcmcdE9oh/CZiLDqCbyhh
	P33mttmQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZUK-0000000BRPr-0Iai;
	Thu, 30 Jul 2026 22:44:28 +0000
Received: from mx.nabladev.com ([2a00:f820:417:0:178:251:229:89])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpZUA-0000000BRNe-3Xsc
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 22:44:20 +0000
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id 79F7611B94C;
	Fri, 31 Jul 2026 00:44:10 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=nabladev.com;
	s=dkim; t=1785451451; h=from:subject:date:message-id:to:cc:mime-version:
	 content-transfer-encoding:in-reply-to:references;
	bh=VWSRrnjcpfjKpqa21AYolB4n6H1G3eGIp7mwtWsX2Zg=;
	b=CFs6GF474DglDdm0U+A4dTNk4DX/3WsZIPO52vP1C+7nU1ejtgoy7B9iCzKkzf4Y47LoS/
	wNGYbisBGnBs19e5y+UN06yQNTjSMmi137NtSL1T3brRqAreI/sMOzZAFa/axanr9GPSsI
	42t7B8n09p2Hv82stDdwxLSNwCY1Gqo/qlHP3BTucsTNz2Xh9C7Js4ty2fKN33L3fsQV3z
	KRRpx1azKRh3Bq5Ircjp/nSljV2gnHsvxlkrCk5726R1DmvDKzeKgs/o4g9j5dzj+Q4Od9
	dNtpyuNpzDWij/SzIeCwaX34DQt5KujrcyYrEC6YbEgXACnlAlpRTprE/0yuyw==
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
Subject: [PATCH v8 3/7] arm64: dts: imx8mm: imx8mp: Add legacy board DTOs for Data Modul i.MX8M Mini and Plus eDM SBC
Date: Fri, 31 Jul 2026 00:43:18 +0200
Message-ID: <20260730224351.95006-3-marex@nabladev.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <20260730224351.95006-1-marex@nabladev.com>
References: <20260730224351.95006-1-marex@nabladev.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260730_154419_163880_A3A5E831 
X-CRM114-Status: GOOD (  19.96  )
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

Add legacy board revision compatibility DT overlays for both i.MX8M Mini
and Plus eDM SBC boards. This adds adjustments to support legacy board
revisions.

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
V6: No change
V7: Add DTC_FLAGS_imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01 := -@
V8: No change
---
 arch/arm64/boot/dts/freescale/Makefile        | 38 +++++++-
 ...edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso | 18 ++++
 ...bc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso | 41 ++++++++
 ...bc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso | 14 +++
 ...edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso | 97 +++++++++++++++++++
 ...edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso | 69 +++++++++++++
 6 files changed, 275 insertions(+), 2 deletions(-)
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso
 create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 976c224f87d08..4880f75805c3e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -148,6 +148,10 @@ imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11-dtbs := \
 	imx8mm-data-modul-edm-sbc.dtb \
 	imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo
 
+imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900-dtbs := \
+	imx8mm-data-modul-edm-sbc.dtb \
+	imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
@@ -162,7 +166,9 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mm-data-modul-edm-sbc.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtb \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi0700a2t-30.dtbo \
 			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtb \
-			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo
+			  imx8mm-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-mi1010z1t-1cp11.dtbo \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtb \
+			  imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-ddr4-evk.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mm-emcon-avari.dtb
@@ -381,6 +387,26 @@ imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11-dtbs := \
 	imx8mp-data-modul-edm-sbc.dtb \
 	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtbo
 
+DTC_FLAGS_imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01 := -@
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900-dtbs := \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902-dtbs := \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo
+
+imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902-dtbs := \
+	imx8mp-data-modul-edm-sbc.dtb \
+	imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
+
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-mod-imx8mm-lvds-g070y2-l01.dtbo \
@@ -409,7 +435,15 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-data-modul-edm-sbc.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtb \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi0700a2t-30.dtbo \
 			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtb \
-			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtbo
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-mi1010z1t-1cp11.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtbo \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtb \
+			  imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtbo
 
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-model-a.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-debix-som-a-bmb-08.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso
new file mode 100644
index 0000000000000..14038215f298c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mm-data-modul-edm-sbc-overlay-edm-sbc-imx8mm-rev900.dtso
@@ -0,0 +1,18 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&fec1 {
+	phy-handle = <&fec1_phy_ath>;
+};
+
+&fec1_phy_ath {
+	status = "okay";
+};
+
+&fec1_phy_bcm {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
new file mode 100644
index 0000000000000..427585b78e45d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev900.dtso
@@ -0,0 +1,41 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&{/} {
+	reg_panel_vcc_raw: regulator-panel-vcc-raw {
+		compatible = "regulator-fixed";
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_panel_vcc_reg>;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "PANEL_VCC";
+	};
+};
+
+&panel {
+	power-supply = <&reg_panel_vcc_raw>;
+};
+
+&reg_backlight_en_level {
+	status = "disabled";
+};
+
+&reg_backlight_pwm_level {
+	status = "disabled";
+};
+
+&reg_panel_bl_supply {
+	status = "disabled";
+};
+
+&reg_panel_bl {
+	gpio = <&gpio3 0 0>;
+};
+
+&reg_panel_vcc {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso
new file mode 100644
index 0000000000000..a21fea27e0b41
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-lvds-rev902.dtso
@@ -0,0 +1,14 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+&reg_panel_bl {
+	gpio = <&gpio3 0 0>;
+};
+
+&reg_panel_vcc {
+	enable-gpios = <&gpio3 6 0>;
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso
new file mode 100644
index 0000000000000..ec861aa64541e
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev900.dtso
@@ -0,0 +1,97 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2023-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-pinfunc.h"
+
+&eeprom900 {
+	status = "okay";
+};
+
+&eeprom902 {
+	status = "disabled";
+};
+
+&eqos {	/* First ethernet */
+	phy-handle = <&phy_eqos_ath>;
+};
+
+&fec {	/* Second ethernet */
+	/* pinctrl_wifi is ENET2_INT# */
+	pinctrl-0 = <&pinctrl_fec &pinctrl_wifi>;
+	phy-handle = <&phy_fec_ath>;
+};
+
+&gpiolvds {
+	status = "disabled";
+};
+
+/*
+ * External pull ups on R242 and R243 on I2C2_SCL_3V3 and I2C2_SDA_3V3
+ * are not populated on this early board revision, activate in-SoC pull
+ * up resistors instead to work around the missing external pull ups.
+ */
+&pinctrl_i2c2 {
+	fsl,pins = <
+		MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL			0x400001c4
+		MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA			0x400001c4
+	>;
+};
+
+&pinctrl_i2c2_gpio {
+	fsl,pins = <
+		MX8MP_IOMUXC_I2C2_SCL__GPIO5_IO16		0x1c4
+		MX8MP_IOMUXC_I2C2_SDA__GPIO5_IO17		0x1c4
+	>;
+};
+
+&pcie_phy {
+	status = "disabled";
+};
+
+&pcie {
+	status = "disabled";
+};
+
+&phy_eqos_ath {
+	/*
+	 * The software support for combination of EEE capable PHY and EEE
+	 * capable MAC is so far missing from the Linux kernel. By default,
+	 * the AR8035 PHY does enable EEE functionality on the PHY side,
+	 * while the EQoS/DWMAC MAC expects to handle the EEE functionality
+	 * on the MAC side. Because the Linux kernel is currently unable to
+	 * align EEE configuration of the PHY and MAC, enabling EEE leads
+	 * to unreliable link. Disable EEE until the kernel support is in
+	 * place.
+	 */
+	eee-broken-100tx;
+	eee-broken-1000t;
+	status = "okay";
+};
+
+&phy_eqos_bcm {
+	status = "disabled";
+};
+
+&phy_fec_ath {
+	status = "okay";
+};
+
+&phy_fec_bcm {
+	status = "disabled";
+};
+
+&reg_pcie0 {
+	status = "disabled";
+};
+
+&tpm {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "disabled";
+};
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso
new file mode 100644
index 0000000000000..0141b5d77c6bd
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-data-modul-edm-sbc-overlay-edm-sbc-imx8mp-rev902.dtso
@@ -0,0 +1,69 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2024-2026 Marek Vasut
+ */
+/dts-v1/;
+/plugin/;
+
+#include "imx8mp-pinfunc.h"
+
+&pinctrl_hog_misc {
+	fsl,pins = <
+		/* ENET_WOL# -- shared by both PHYs */
+		MX8MP_IOMUXC_GPIO1_IO10__GPIO1_IO10		0x40000090
+
+		/* PG_V_IN_VAR# */
+		MX8MP_IOMUXC_NAND_CE0_B__GPIO3_IO01		0x40000000
+		/* CSI2_PD_1V8 */
+		MX8MP_IOMUXC_NAND_DATA02__GPIO3_IO08		0x0
+		/* CSI2_RESET_1V8# */
+		MX8MP_IOMUXC_NAND_DATA03__GPIO3_IO09		0x0
+
+		/* DIS_USB_DN1 */
+		MX8MP_IOMUXC_SAI2_RXFS__GPIO4_IO21		0x0
+		/* DIS_USB_DN2 */
+		MX8MP_IOMUXC_SAI2_RXC__GPIO4_IO22		0x0
+
+		/* EEPROM_WP_1V8# */
+		MX8MP_IOMUXC_NAND_DQS__GPIO3_IO14		0x100
+		/* PCIE_CLK_GEN_CLKPWRGD_PD_1V8# */
+		MX8MP_IOMUXC_SAI5_RXD0__GPIO3_IO21		0x0
+		/* GRAPHICS_PRSNT_1V8# */
+		MX8MP_IOMUXC_SAI1_TXD6__GPIO4_IO18		0x40000000
+
+		/* CLK_CCM_CLKO1_3V3 */
+		MX8MP_IOMUXC_GPIO1_IO14__CCM_CLKO1		0x10
+	>;
+};
+
+&pinctrl_pcie0 {
+	fsl,pins = <
+		/* M2_PCIE_RST# */
+		MX8MP_IOMUXC_GPIO1_IO05__GPIO1_IO05		0x2
+		/* M2_W_DISABLE1_1V8# */
+		MX8MP_IOMUXC_SAI5_RXD2__GPIO3_IO23		0x2
+		/* M2_W_DISABLE2_1V8# */
+		MX8MP_IOMUXC_SAI5_RXD3__GPIO3_IO24		0x2
+		/* CLK_M2_32K768 */
+		MX8MP_IOMUXC_GPIO1_IO00__CCM_EXT_CLK1		0x14
+		/* M2_PCIE_WAKE# */
+		MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x40000140
+		/* M2_PCIE_CLKREQ# */
+		MX8MP_IOMUXC_I2C4_SCL__PCIE_CLKREQ_B		0x61
+	>;
+};
+
+&pinctrl_uart4 {
+	fsl,pins = <
+		MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x49
+		MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x49
+	>;
+};
+
+&gpiowifi {
+	status = "disabled";
+};
+
+&uart4 {
+	status = "disabled";
+};
-- 
2.53.0


