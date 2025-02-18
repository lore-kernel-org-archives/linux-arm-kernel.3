Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DED25C021AA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 18 Feb 2025 18:47:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=q+Jyn+jdW5rMasfbzdDzyFkIudIUO29Rgzp5bgXsj2s=; b=dEhARPKjJhXHXetoswGIXuYTKW
	8nUm47AEZltGXV9zEGIINrFP59yaralKdOc2C9FkQAnwPZy2XrTawL1lswB34N3fz+cGJ9syJuoyd
	sPuVTEbcDWkVx82t24DRQotGAZFhn/ZWinc4YRExjU8DnZjni/Q5Bp/oHaLxJq4veU2fm1eRpIbXJ
	faq9Ge+ntHMkghJP9xmvi43TI051X59Dya9P+bnGsVgqL00BdBL9ZfePCxVOXV1uu6YfEzM37yAgU
	lgj+oyaCd+SsPtcR4qHmSIQgoy017i9MeHcFIMt3PG3Dvnjbu2zpiC3qwpNosjaAWim9Qe/IUAZ5k
	fHcBi4hA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSdK-00000009QDV-2C3b;
	Tue, 18 Feb 2025 18:47:50 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tkSUC-00000009Nyp-14mq
	for linux-arm-kernel@lists.infradead.org;
	Tue, 18 Feb 2025 18:38:25 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-0000Gz-PW; Tue, 18 Feb 2025 19:38:14 +0100
Received: from dude05.red.stw.pengutronix.de ([2a0a:edc0:0:1101:1d::54])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-001dan-1T;
	Tue, 18 Feb 2025 19:38:14 +0100
Received: from localhost ([::1] helo=dude05.red.stw.pengutronix.de)
	by dude05.red.stw.pengutronix.de with esmtp (Exim 4.96)
	(envelope-from <a.fatoum@pengutronix.de>)
	id 1tkSU2-00AL9G-15;
	Tue, 18 Feb 2025 19:38:14 +0100
From: Ahmad Fatoum <a.fatoum@pengutronix.de>
Date: Tue, 18 Feb 2025 19:38:17 +0100
Subject: [PATCH v2 5/6] arm64: dts: imx8mp-skov: add revC BD500 board
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250218-skov-imx8mp-new-boards-v2-5-4040379742ea@pengutronix.de>
References: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
In-Reply-To: <20250218-skov-imx8mp-new-boards-v2-0-4040379742ea@pengutronix.de>
To: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
 Pengutronix Kernel Team <kernel@pengutronix.de>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
 Oleksij Rempel <o.rempel@pengutronix.de>, 
 Ahmad Fatoum <a.fatoum@pengutronix.de>
X-Mailer: b4 0.14.2
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: a.fatoum@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250218_103824_302678_21E95138 
X-CRM114-Status: GOOD (  13.66  )
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

The BD500 replaces the touch display with 3 bicolor LEDs and a push
button on top of a Skov i.MX8-CPU revision C.

Signed-off-by: Oleksij Rempel <o.rempel@pengutronix.de>
Signed-off-by: Ahmad Fatoum <a.fatoum@pengutronix.de>
---
 arch/arm64/boot/dts/freescale/Makefile             |  1 +
 .../boot/dts/freescale/imx8mp-skov-revc-bd500.dts  | 91 ++++++++++++++++++++++
 2 files changed, 92 insertions(+)

diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
index ea4da899b44be0aaac745f6a0503bed3bb8ba20c..6ee3a7ffe4792106118b8201c1f5f51c8ecd0ff2 100644
--- a/arch/arm64/boot/dts/freescale/Makefile
+++ b/arch/arm64/boot/dts/freescale/Makefile
@@ -197,6 +197,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-basic.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-hdmi.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-lt6.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revb-mi1010ait-1cp1.dtb
+dtb-$(CONFIG_ARCH_MXC) += imx8mp-skov-revc-bd500.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mpxl.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-tqma8mpql-mba8mp-ras314.dtb
 dtb-$(CONFIG_ARCH_MXC) += imx8mp-var-som-symphony.dtb
diff --git a/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dts b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dts
new file mode 100644
index 0000000000000000000000000000000000000000..b816c6cd3bca60b14cf6bc7f40cb780aa893958d
--- /dev/null
+++ b/arch/arm64/boot/dts/freescale/imx8mp-skov-revc-bd500.dts
@@ -0,0 +1,91 @@
+// SPDX-License-Identifier: (GPL-2.0 OR MIT)
+
+/dts-v1/;
+
+#include "imx8mp-skov-reva.dtsi"
+
+/ {
+	model = "SKOV IMX8MP CPU revC - bd500";
+	compatible = "skov,imx8mp-skov-revc-bd500", "fsl,imx8mp";
+
+	leds {
+		led_system_red: led-3 {
+			label = "bd500:system:red";
+			color = <LED_COLOR_ID_RED>;
+			/* Inverted compared to others due to NMOS inverter */
+			gpios = <&gpioexp 3 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+		};
+
+		led_system_green: led-4 {
+			label = "bd500:system:green";
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&gpioexp 2 GPIO_ACTIVE_LOW>;
+			default-state = "on";
+		};
+
+		led_lan1_red: led-5 {
+			label = "bd500:lan1:act";
+			color = <LED_COLOR_ID_RED>;
+			linux,default-trigger = "netdev";
+			gpios = <&gpioexp 1 GPIO_ACTIVE_LOW>;
+		};
+
+		led_lan1_green: led-6 {
+			label = "bd500:lan1:link";
+			color = <LED_COLOR_ID_GREEN>;
+			linux,default-trigger = "netdev";
+			gpios = <&gpioexp 0 GPIO_ACTIVE_LOW>;
+		};
+
+		led_lan2_red: led-7 {
+			label = "bd500:lan2:act";
+			color = <LED_COLOR_ID_RED>;
+			linux,default-trigger = "netdev";
+			gpios = <&gpioexp 6 GPIO_ACTIVE_LOW>;
+		};
+
+		led_lan2_green: led-8 {
+			label = "bd500:lan2:link";
+			color = <LED_COLOR_ID_GREEN>;
+			linux,default-trigger = "netdev";
+			gpios = <&gpioexp 7 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-1 {
+			label = "S1";
+			linux,code = <KEY_CONFIG>;
+			gpios = <&gpioexp 5 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&i2c2 {
+	clock-frequency = <100000>;
+	status = "okay";
+
+	gpioexp: gpio@20 {
+		compatible = "nxp,pca6408";
+		reg = <0x20>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pinctrl_gpio_exp>;
+		interrupts-extended = <&gpio4 28 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpio4 29 GPIO_ACTIVE_LOW>;
+		vcc-supply = <&reg_vdd_3v3>;
+		gpio-controller;
+		#gpio-cells = <2>;
+	};
+};
+
+&iomuxc {
+	pinctrl_gpio_exp: gpioexpgrp {
+		fsl,pins = <
+			MX8MP_IOMUXC_SAI3_RXFS__GPIO4_IO28	0x0
+			MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29	0x0
+		>;
+	};
+};

-- 
2.39.5


