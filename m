Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 46AD9E81A44
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 16 Feb 2026 16:56:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pbMUYX90oorNbiOH6+eDHwT+ZNvoGjptVI0ItPpXrFg=; b=QMt5qGxPy2LVe7moynU5BWe4Ui
	xVtYNWqE07Jmv3UU3Oz9jUAgL0CGs177y9OTeYlyF6ZE1EAceTOBv5/873eSinY5cvsYERPoOj06u
	CwvuJpWrwef0vV5G5hr7VYJRELwBgrY0dY7a7/k0OvWSfx2kWvzBvlNTdF2KfoZ/TpIW/mTqFJpmG
	mwJ2sVodMT83CJBrZkpySjF8uCSAl5CIX0nkDJ3iEHhDrJa4C/NrSh+ivnG9fxR1ByInWdHLClEn5
	JdZNtAJqRJsvN0g35VlIWEr6nSkdcbxKok6ao47ZmVaGFM2wrTp6LM22dDuhqZ2pjyCXCSWVu0cIz
	bAeBqV4A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1th-000000073hA-0JvM;
	Mon, 16 Feb 2026 16:56:33 +0000
Received: from smtpout-04.galae.net ([185.171.202.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vs1tZ-000000073c5-1GLe
	for linux-arm-kernel@lists.infradead.org;
	Mon, 16 Feb 2026 16:56:26 +0000
Received: from smtpout-01.galae.net (smtpout-01.galae.net [212.83.139.233])
	by smtpout-04.galae.net (Postfix) with ESMTPS id DBE35C16A27;
	Mon, 16 Feb 2026 16:56:34 +0000 (UTC)
Received: from mail.galae.net (mail.galae.net [212.83.136.155])
	by smtpout-01.galae.net (Postfix) with ESMTPS id CB620606CF;
	Mon, 16 Feb 2026 16:56:23 +0000 (UTC)
Received: from [127.0.0.1] (localhost [127.0.0.1]) by localhost (Mailerdaemon) with ESMTPSA id D1DC610368022;
	Mon, 16 Feb 2026 17:56:20 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=dkim;
	t=1771260982; h=from:subject:date:message-id:to:cc:mime-version:content-type:
	 content-transfer-encoding:in-reply-to:references;
	bh=pbMUYX90oorNbiOH6+eDHwT+ZNvoGjptVI0ItPpXrFg=;
	b=x1xPDPkKnGqeJRwV8OAfCuVBIiBDAVs/7OQ2nkwaFt+U74TcKUDJqKakIn87QIl1CeEYBD
	zbCTmIxwZ4gwVMl603QYfOn2IdPmJ7VsRhEkkW+0bKrmelzqfdnsJtvctJbXT2z9vrss0B
	BXp9L/QwAyQ4Ji78ZfO4cTAXkpUxTOYeeTzjP9U/iC9kpp5rOOxr7jYN8uofWK1s35jKHh
	JP4g3073kmEag/eLzCIHHR/jntb0sQIDoX/GETCaKx/PkqCaQIclgkq5onLSC+XOheR34Z
	w0Z0IIw0jvlk5myizbZ5Ult2ZSH1vo/im33qKovZjyfvcuweoHdC59t3HpxuyA==
From: "Kory Maincent (TI)" <kory.maincent@bootlin.com>
Date: Mon, 16 Feb 2026 17:55:54 +0100
Subject: [PATCH v2 3/3] ARM: dts: am335x: Add Seeed Studio BeagleBone HDMI
 cape overlay
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20260216-feature_bbge-v2-3-22805cfdbf62@bootlin.com>
References: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
In-Reply-To: <20260216-feature_bbge-v2-0-22805cfdbf62@bootlin.com>
To: Aaro Koskinen <aaro.koskinen@iki.fi>, 
 Andreas Kemnade <andreas@kemnade.info>, Kevin Hilman <khilman@baylibre.com>, 
 Roger Quadros <rogerq@kernel.org>, Tony Lindgren <tony@atomide.com>, 
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Russell King <linux@armlinux.org.uk>
Cc: Thomas Petazzoni <thomas.petazzoni@bootlin.com>, 
 linux-omap@vger.kernel.org, devicetree@vger.kernel.org, 
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 dri-devel@lists.freedesktop.org, Luca Ceresoli <luca.ceresoli@bootlin.com>, 
 Bajjuri Praneeth <praneeth@ti.com>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Maxime Ripard <mripard@kernel.org>, Thomas Zimmermann <tzimmermann@suse.de>, 
 Maarten Lankhorst <maarten.lankhorst@linux.intel.com>, 
 Louis Chauvet <louis.chauvet@bootlin.com>, 
 "Kory Maincent (TI)" <kory.maincent@bootlin.com>
X-Mailer: b4 0.14-dev-d4707
X-Last-TLS-Session-Version: TLSv1.3
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260216_085625_491612_3118795D 
X-CRM114-Status: GOOD (  14.24  )
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

Add devicetree overlay for the Seeed Studio BeagleBone HDMI cape, which
provides HDMI output via an ITE IT66121 HDMI bridge and audio support
through McASP.

The cape is designed for BeagleBone Green but is also compatible with
BeagleBone and BeagleBone Black due to pin compatibility.

Link: https://www.seeedstudio.com/Seeed-Studio-BeagleBoner-Green-HDMI-Cape.html
Signed-off-by: Kory Maincent (TI) <kory.maincent@bootlin.com>
---
 arch/arm/boot/dts/ti/omap/Makefile                 |   5 +
 .../boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso    | 157 +++++++++++++++++++++
 2 files changed, 162 insertions(+)

diff --git a/arch/arm/boot/dts/ti/omap/Makefile b/arch/arm/boot/dts/ti/omap/Makefile
index dcc6d4422e411..d70706e6d467b 100644
--- a/arch/arm/boot/dts/ti/omap/Makefile
+++ b/arch/arm/boot/dts/ti/omap/Makefile
@@ -82,6 +82,10 @@ dtb-$(CONFIG_ARCH_OMAP4) += \
 	omap4-var-stk-om44.dtb \
 	omap4-xyboard-mz609.dtb \
 	omap4-xyboard-mz617.dtb
+
+am335x-bonegreen-hdmi-00a0-dtbs := am335x-bonegreen-eco.dtb \
+	am335x-bone-hdmi-00a0.dtbo
+
 dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-baltos-ir2110.dtb \
 	am335x-baltos-ir3220.dtb \
@@ -94,6 +98,7 @@ dtb-$(CONFIG_SOC_AM33XX) += \
 	am335x-bonegreen.dtb \
 	am335x-bonegreen-wireless.dtb \
 	am335x-bonegreen-eco.dtb \
+	am335x-bonegreen-hdmi-00a0.dtb \
 	am335x-chiliboard.dtb \
 	am335x-cm-t335.dtb \
 	am335x-evm.dtb \
diff --git a/arch/arm/boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso b/arch/arm/boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso
new file mode 100644
index 0000000000000..f43f44c79c96d
--- /dev/null
+++ b/arch/arm/boot/dts/ti/omap/am335x-bone-hdmi-00a0.dtso
@@ -0,0 +1,157 @@
+// SPDX-License-Identifier: GPL-2.0-only
+/*
+ * 2017 Copyright (c) Seeed Technology Inc.  All right reserved.
+ * Author: Baozhu Zuo <zuobaozhu@gmail.com>
+ * Copyright (c) Bootlin 2026
+ *
+ * This device tree overlay is compatible with the BeagleBone Black, Green
+ * and their subversions.
+ */
+
+/dts-v1/;
+/plugin/;
+
+#include <dt-bindings/pinctrl/am33xx.h>
+#include <dt-bindings/interrupt-controller/irq.h>
+
+&{/} {
+	hdmi0: connector-hdmi {
+		compatible = "hdmi-connector";
+		label = "hdmi";
+		type = "a";
+		port {
+			hdmi_connector_in: endpoint {
+				remote-endpoint = <&it66121_out>;
+			};
+		};
+	};
+
+	clk_mcasp0_fixed: clk-mcasp0-fixed {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <24576000>;
+	};
+
+	clk_mcasp0: clk-mcasp0 {
+		#clock-cells = <0>;
+		compatible = "gpio-gate-clock";
+		clocks = <&clk_mcasp0_fixed>;
+		enable-gpios = <&gpio1 27 0>;
+	};
+
+	sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "TI BeagleBone Green HDMI cape";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,bitclock-master = <&sound_master>;
+		simple-audio-card,frame-master = <&sound_master>;
+
+		sound_master: simple-audio-card,cpu {
+			sound-dai = <&mcasp0>;
+			clocks = <&clk_mcasp0>;
+		};
+
+		simple-audio-card,codec {
+			sound-dai = <&it66121>;
+		};
+	};
+};
+
+&am33xx_pinmux {
+	bb_lcd_pins: pinmux-bb-lcd-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA0, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA1, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA2, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA3, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA4, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA5, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA6, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA7, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA8, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA9, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA10, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA11, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA12, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA13, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA14, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_DATA15, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_VSYNC, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_HSYNC, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_PCLK, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_LCD_AC_BIAS_EN, PIN_OUTPUT, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_ADVN_ALE, PIN_OUTPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_OEN_REN, PIN_OUTPUT_PULLDOWN, MUX_MODE7)
+			AM33XX_PADCONF(AM335X_PIN_GPMC_WEN, PIN_INPUT, MUX_MODE7)
+		>;
+	};
+	mcasp0_pins: mcasp0-pins {
+		pinctrl-single,pins = <
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKX, PIN_INPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_AHCLKR, PIN_OUTPUT_PULLDOWN, MUX_MODE2)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_FSX, PIN_OUTPUT_PULLUP, MUX_MODE0)
+			AM33XX_PADCONF(AM335X_PIN_MCASP0_ACLKX, PIN_OUTPUT_PULLDOWN, MUX_MODE0)
+		>;
+	};
+};
+
+&i2c2 {
+	status = "okay";
+	#address-cells = <1>;
+	#size-cells = <0>;
+
+	it66121: it66121 {
+		compatible = "ite,it66121";
+		reg = <0x4d>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&bb_lcd_pins>;
+
+		#sound-dai-cells = <0>;
+
+		interrupt-parent = <&gpio2>;
+		interrupts = <4 IRQ_TYPE_EDGE_RISING>;
+		ports {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			port@0 {
+				reg = <0>;
+				it66121_in: endpoint {
+					bus-width = <24>;
+					remote-endpoint = <&lcdc_0>;
+				};
+			};
+
+			port@1 {
+				reg = <1>;
+				it66121_out: endpoint {
+					remote-endpoint = <&hdmi_connector_in>;
+				};
+			};
+		};
+	};
+};
+
+&lcdc {
+	status = "okay";
+	blue-and-red-wiring = "straight";
+	port {
+		lcdc_0: endpoint@0 {
+			remote-endpoint = <&it66121_in>;
+		};
+	};
+};
+
+
+&mcasp0 {
+	status = "okay";
+	#sound-dai-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&mcasp0_pins>;
+	op-mode = <0>;
+	tdm-slots = <2>;
+	serial-dir = < 0 0 1 0 >;
+	tx-num-evt = <32>;
+	rx-num-evt = <32>;
+};
+

-- 
2.43.0


