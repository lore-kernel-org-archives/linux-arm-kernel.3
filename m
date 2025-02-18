Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0B7F4C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:49:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AcsMBz0WvMGOleLkk5ZIiMibQ6UUYcWf2fEdUfN37sI=; b=bv0yS2P+kWDpAPx181LFmRfdJJ
	WEBPnoQfi053E63aU373bDRvgKUlnyd3dsMTax6/gN2M/zPWJrwQmOJe16HzgzwrHunjNU7F4CfG7
	aL+JLeetzhwtM3p8HoWvqSWayxmOUDty6NrriJLkdF8M/2763mYBcIWc6Gmzscqbi4McCcoVamAgI
	JXj/C9rDCKBGrXb+2aMCDlxwV3UUqLKU4ZoK8q5Te8mwzyjAJfH164Y8D3DBBbN+JqrhX6hbK7q7X
	ghEWaGHR5EeurESKGlOALv4lax/TMy0Qu3PcFD0kXSfLNF0OzYCH+jtJF6WKw1eOBUTaAnNWx8GNA
	s6Oq5f3g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSel-00000009QXs-0v7p;
	Tue, 18 Feb 2025 18:49:19 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSUC-00000009Nyq-17Tl
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:38:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-0000H0-Ol; Tue, 18 Feb 2025 19:38:14 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-001dao-1T;
	Tue, 18 Feb 2025 19:38:14 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-00AL9G-16;
	Tue, 18 Feb 2025 19:38:14 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 18 Feb 2025 19:38:18 +0100
Subject: [PATCH v2 6/6] arm64: dts: imx8mp-skov: support new 7" panel board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-skov-imx8mp-new-boards-v2-6-4040379742ea@pengutronix.de>
References: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
In-Reply-To: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_103824_309835_BA67C234 
X-CRM114-Status: GOOD (  13.04  )
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

This board is very similar to the already upstream
imx8mp-skov-revb-mi1010ait-1cp1.dts with the difference that it uses a
different 7" LVDS panel.

Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
Note: The panel's binding is already in linux-next.
---
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../dts/freescale/imx8mp-skov-revc-tian-g07017.dts | 81 ++++++++++++++++++++++
 2 files changed, 82 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index 6ee3a7ffe4792106118b8201c1f5f51c8ecd0ff2..986c4f974da51fb8a6fb3bc7be1ec664f7db629e 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -198,6 +198,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-tian-g07017.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
new file mode 100644
index 0000000000000000000000000000000000000000..9a562c011f2c292861c2e57e0e74aa3acd063e0c
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-tian-g07017.dts
@@ -0,0 +1,81 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "imx8mp-skov-reva.dtsi"
+
+/ {
+	model = "SKOV IMX8MP CPU revC - TIAN G07017";
+	compatible = "skov,imx8mp-skov-revc-tian-g07017", "fsl,imx8mp";
+
+	panel {
+		compatible = "topland,tian-g07017-01";
+		backlight = <&backlight>;
+		power-supply = <&reg_tft_vcom>;
+
+		port {
+			in_lvds0: endpoint {
+				remote-endpoint = <&ldb_lvds_ch0>;
+			};
+		};
+	};
+};
+
+&backlight {
+	status = "okay";
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5506";
+		reg = <0x38>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_touchscreen>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <1024>;
+		touchscreen-size-y = <600>;
+		vcc-supply = <&reg_vdd_3v3>;
+		iovcc-supply = <&reg_vdd_3v3>;
+		wakeup-source;
+	};
+};
+
+&lcdif2 {
+	status = "okay";
+};
+
+&lvds_bridge {
+	assigned-clocks = <&clk IMX8MP_CLK_MEDIA_LDB>,
+				 <&clk IMX8MP_VIDEO_PLL1>;
+	assigned-clock-parents = <&clk IMX8MP_VIDEO_PLL1_OUT>;
+	/* IMX8MP_VIDEO_PLL1 = IMX8MP_CLK_MEDIA_DISP2_PIX * 2 * 7 */
+	assigned-clock-rates = <0>, <358400000>;
+	status = "okay";
+
+	ports {
+		port@1 {
+			ldb_lvds_ch0: endpoint {
+				remote-endpoint = <&in_lvds0>;
+			};
+		};
+	};
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
2.39.5


