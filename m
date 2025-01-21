Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B350EC0218C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 11:18:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kTXMzJiD9m+uAC6QrW3khFZeJaxZOSB2CQBwlgvhF70=; b=SCRAKZlMYzZAcCkc0C+pbpTQSV
	Go4IpdU7Tgq0OHL/wFRvUknY9TmJNKtnf+ocmMkaDVxeYddUHsAehbIRX04BgBsxYinvpHBnuUMO5
	GN03RukLErfFfB9ZcFu+9SOGCiCbRW7tmZw84OkMLVCcMKmNkqyLC4HmDlEYbQiJVhpVFifgTbm2R
	ODtAhtAZBHQdm3RQFoa31Orpp9GnyHi79aYmhgoC9mX79pywnubhYfa0TrrQQw1ZSCvIBmkhaK8t5
	pmK2D11cWn5ciqFSjrGlQayc6AO3SMyzE13puaKW3vxtZsBtezUqdIbdA1ZzQeuixujGOEDXM2x2g
	SQl1UpfA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1taCGv-00000007jSK-2nTc;
	Tue, 21 Jan 2025 11:18:17 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1taCD7-00000007iLe-3fc9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 11:14:24 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1taCD6-0000Ww-MK
	for linux-arm-kernel@lists.infradead.org; Tue, 21 Jan 2025 12:14:20 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1taCD6-00168o-1Z
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 12:14:20 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 2A5753AD9BA
	for <linux-arm-kernel@lists.infradead.org>; Tue, 21 Jan 2025 11:14:20 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id A4B593AD9A9;
	Tue, 21 Jan 2025 11:14:18 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 5356d6f1;
	Tue, 21 Jan 2025 11:14:17 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 21 Jan 2025 12:14:06 +0100
Subject: [PATCH stm32-next v3 2/2] ARM: dts: stm32: lxa-fairytux2: add
 Linux Automation GmbH FairyTux 2
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250121-lxa-fairytux-v3-2-8d42d7d232fb@pengutronix.de>
References: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
In-Reply-To: <20250121-lxa-fairytux-v3-0-8d42d7d232fb@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
X-Mailer: b4 0.15-dev-1b0d6
X-Developer-Signature: v=1; a=openpgp-sha256; l=17124; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=dUCzv5PVr4PmVJJzkU+YnBMaJFg7OzMRk3sRxR1WXPc=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnj4GGlG4ZYsScJk1Tji55p7PRqpQdcDyVDdlGt
 63s9jULmpGJATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZ4+BhgAKCRAoOKI+ei28
 byq4B/40TePa1AON2UPyGWT7IAGrO3Vp/2Q3lv/RznYJ4d5F2GLOcbaAjBiSXq7fQjFMWSs2EVX
 jON2oHfZwbGes8za7mVEy7buU/tj9mwHCG1xpsSqDoJAH2qf9LYI1/bp0nxCSyYs8EXEzWWbjQX
 2fwb29bWy85pE1um1rmSeWl6jcyS9BPauHPi1JacdMSpt9F/+OpTb9x/EcjwpQht1evVW25l7Gj
 v9sh6zEK67VSucEY8pXcSIjSL6xlf9obX3lCy74soZBLnZSF8JuL4CAacNTgXlSk6j8oU6YXx6U
 SaxNRTy9CG9biKSiia6l5Awa0MeRAv0d1oiUljorUXMsw2sQ
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_031422_237553_327822E7 
X-CRM114-Status: GOOD (  21.85  )
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

From: Leonard Göhrs <l.goehrs@pengutronix.de>

The Linux Automation GmbH FairyTux2 is a small Linux device based on
an Octavo Systems OSD32MP153c SiP, that occupies just two slots on a
DIN rail.

The device contains an eMMC for storage, a gigabit Ethernet
connection, a CAN bus and a RS485 transceiver.

Add support for the lxa-fairytux2 generation 1 and 2 boards based on
the STM32MP153c.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm/boot/dts/st/Makefile                      |   2 +
 .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts | 103 ++++++
 .../boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts | 147 ++++++++
 .../arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi | 397 +++++++++++++++++++++
 4 files changed, 649 insertions(+)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index b7d5d305cbbeb78cfae9fab05271992959f6fa56..f68da19d7cbf33fc5424e4900d301b2706d03e5e 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -39,6 +39,8 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp151c-mect1s.dtb \
 	stm32mp153c-dhcom-drc02.dtb \
 	stm32mp153c-dhcor-drc-compact.dtb \
+	stm32mp153c-lxa-fairytux2-gen1.dtb \
+	stm32mp153c-lxa-fairytux2-gen2.dtb \
 	stm32mp153c-lxa-tac-gen3.dtb \
 	stm32mp153c-mecio1r1.dtb \
 	stm32mp157a-avenger96.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts
new file mode 100644
index 0000000000000000000000000000000000000000..3a0e84262424313ab102c907d22695b8f8eb758b
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen1.dts
@@ -0,0 +1,103 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2024 Leonard Göhrs, Pengutronix
+ */
+
+/dts-v1/;
+
+#include "stm32mp153c-lxa-fairytux2.dtsi"
+
+/ {
+	model = "Linux Automation GmbH FairyTux 2 Gen 1";
+	compatible = "lxa,stm32mp153c-fairytux2-gen1", "oct,stm32mp153x-osd32", "st,stm32mp153";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-left {
+			label = "USER_BTN1";
+			linux,code = <KEY_ESC>;
+			gpios = <&gpioi 11 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+
+		button-right {
+			label = "USER_BTN2";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpioe 9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+};
+
+&gpiof {
+	gpio-line-names = "GPIO1", "GPIO2", "", "", "",			/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "", "", "", "",				/* 10 */
+			  "";						/* 15 */
+};
+
+&gpioh {
+	gpio-line-names = "", "", "", "", "LCD_RESET",			/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "", "", "GPIO3", "",			/* 10 */
+			  "";						/* 15 */
+};
+
+&gpioi {
+	gpio-line-names = "", "", "", "", "",				/*  0 */
+			  "", "", "", "ETH_", "",			/*  5 */
+			  "", "USER_BTN1";				/* 10 */
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_b>;
+	pinctrl-1 = <&i2c1_sleep_pins_b>;
+	status = "okay";
+
+	io_board_gpio: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		vcc-supply = <&v3v3_hdmi>;
+		gpio-line-names = "LED1_GA_YK", "LED2_GA_YK", "LED1_GK_YA", "LED2_GK_YA",
+				  "RS485_EN", "RS485_120R", "", "CAN_120R";
+	};
+};
+
+&led_controller_io {
+	/*
+	 * led-2 and led-3 are internally connected antiparallel to one
+	 * another inside the ethernet jack like this:
+	 * GPIO1 ---+---|led-2|>--+--- GPIO3
+	 *          +--<|led-3|---+
+	 * E.g. only one of the LEDs can be illuminated at a time while
+	 * the other output must be driven low.
+	 * This should likely be implemented using a multi color LED
+	 * driver for antiparallel LEDs.
+	 */
+	led-2 {
+		color = <LED_COLOR_ID_GREEN>;
+		function = LED_FUNCTION_ACTIVITY;
+		gpios = <&io_board_gpio 1 GPIO_ACTIVE_HIGH>;
+	};
+
+	led-3 {
+		color = <LED_COLOR_ID_ORANGE>;
+		function = LED_FUNCTION_ACTIVITY;
+		gpios = <&io_board_gpio 3 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&usart3 {
+	/*
+	 * On Gen 1 FairyTux 2 only RTS can be used and not CTS as well,
+	 * Because pins PD11 (CTS) and PI11 (USER_BTN1) share the same
+	 * interrupt and only one of them can be used at a time.
+	 */
+	rts-gpios = <&gpiod 12 GPIO_ACTIVE_LOW>;
+};
+
+&usbotg_hs {
+	dr_mode = "peripheral";
+};
diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts
new file mode 100644
index 0000000000000000000000000000000000000000..66e6da912508cd9d16298e75d1eb0704ea12d247
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts
@@ -0,0 +1,147 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2024 Leonard Göhrs, Pengutronix
+ */
+
+/dts-v1/;
+
+#include "stm32mp153c-lxa-fairytux2.dtsi"
+
+/ {
+	model = "Linux Automation GmbH FairyTux 2 Gen 2";
+	compatible = "lxa,stm32mp153c-fairytux2-gen2", "oct,stm32mp153x-osd32", "st,stm32mp153";
+
+	gpio-keys {
+		compatible = "gpio-keys";
+
+		button-left {
+			label = "USER_BTN1";
+			linux,code = <KEY_ESC>;
+			gpios = <&gpioi 10 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+
+		button-right {
+			label = "USER_BTN2";
+			linux,code = <KEY_HOME>;
+			gpios = <&gpioe 9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
+		};
+	};
+};
+
+&gpiof {
+	gpio-line-names = "", "", "", "", "",				/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "", "", "", "",				/* 10 */
+			  "";						/* 15 */
+};
+
+&gpioh {
+	gpio-line-names = "", "", "", "", "LCD_RESET",			/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "", "GPIO1", "GPIO_INT", "",		/* 10 */
+			  "";						/* 15 */
+};
+
+&gpioi {
+	gpio-line-names = "GPIO2", "", "", "", "",			/*  0 */
+			  "", "", "", "ETH_", "",			/*  5 */
+			  "", "USER_BTN1";				/* 10 */
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_b>;
+	pinctrl-1 = <&i2c1_sleep_pins_b>;
+	status = "okay";
+
+	io_board_gpio: gpio@20 {
+		compatible = "ti,tca6408";
+		reg = <0x20>;
+		gpio-controller;
+		#gpio-cells = <2>;
+		interrupt-parent = <&gpioh>;
+		interrupts = <13 IRQ_TYPE_LEVEL_LOW>;
+		interrupt-controller;
+		pinctrl-names = "default";
+		pinctrl-0 = <&board_tca6408_pins>;
+		#interrupt-cells = <2>;
+		vcc-supply = <&v3v3_hdmi>;
+		gpio-line-names = "LED1_GA_YK", "LED2_GA_YK", "LED1_GK_YA", "USB_CC_ALERT",
+				  "RS485_EN", "RS485_120R", "USB_CC_RESET", "CAN_120R";
+	};
+
+	usb_c: typec@28 {
+		compatible = "st,stusb1600";
+		reg = <0x28>;
+		interrupt-parent = <&io_board_gpio>;
+		interrupts = <3 IRQ_TYPE_EDGE_FALLING>;
+		vdd-supply = <&reg_5v>;
+		vsys-supply = <&v3v3_hdmi>;
+
+		connector {
+			compatible = "usb-c-connector";
+			label = "USB-C";
+			power-role = "dual";
+			typec-power-opmode = "default";
+
+			port {
+				con_usbotg_hs_ep: endpoint {
+					remote-endpoint = <&usbotg_hs_ep>;
+				};
+			};
+		};
+	};
+
+	temperature-sensor@48 {
+		compatible = "national,lm75a";
+		reg = <0x48>;
+		/*
+		 * The sensor itself is powered by a voltage divider from the
+		 * always-on 5V supply.
+		 * The required pull-up resistors however are on v3v3_hdmi.
+		 */
+		vs-supply = <&v3v3_hdmi>;
+	};
+
+	io_board_eeprom: eeprom@56 {
+		compatible = "atmel,24c04";
+		reg = <0x56>;
+		vcc-supply = <&v3v3_hdmi>;
+	};
+};
+
+&rtc {
+	status = "okay";
+};
+
+&led_controller_io {
+	led-2 {
+		color = <LED_COLOR_ID_ORANGE>;
+		function = LED_FUNCTION_ACTIVITY;
+		gpios = <&io_board_gpio 1 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&usart3 {
+	rts-gpios = <&gpiod 12 GPIO_ACTIVE_LOW>;
+	cts-gpios = <&gpiod 11 GPIO_ACTIVE_LOW>;
+};
+
+&usbotg_hs {
+	usb-role-switch;
+
+	port {
+		usbotg_hs_ep: endpoint {
+			remote-endpoint = <&con_usbotg_hs_ep>;
+		};
+	};
+};
+
+&pinctrl {
+	board_tca6408_pins: stusb1600-0 {
+		pins {
+			pinmux = <STM32_PINMUX('H', 13, GPIO)>;
+			bias-pull-up;
+		};
+	};
+};
diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
new file mode 100644
index 0000000000000000000000000000000000000000..9eeb9d6b5eb0ed35d4a83b743e8007f19422e2ed
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
@@ -0,0 +1,397 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2020 STMicroelectronics - All Rights Reserved
+ * Copyright (C) 2021 Rouven Czerwinski, Pengutronix
+ * Copyright (C) 2023, 2024 Leonard Göhrs, Pengutronix
+ */
+
+#include "stm32mp153.dtsi"
+#include "stm32mp15xc.dtsi"
+#include "stm32mp15xx-osd32.dtsi"
+#include "stm32mp15xxac-pinctrl.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
+
+/ {
+	aliases {
+		can0 = &m_can1;
+		ethernet0 = &ethernet0;
+		i2c0 = &i2c1;
+		i2c1 = &i2c4;
+		mmc1 = &sdmmc2;
+		serial0 = &uart4;
+		serial1 = &usart3;
+		spi0 = &spi4;
+	};
+
+	chosen {
+		stdout-path = &uart4;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		power-supply = <&v3v3>;
+
+		brightness-levels = <0 31 63 95 127 159 191 223 255>;
+		default-brightness-level = <7>;
+		pwms = <&led_pwm 3 1000000 0>;
+	};
+
+	led-controller-cpu {
+		compatible = "gpio-leds";
+
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpioa 13 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	led_controller_io: led-controller-io {
+		compatible = "gpio-leds";
+
+		/*
+		 * led-0 and led-1 are internally connected antiparallel to one
+		 * another inside the ethernet jack like this:
+		 * GPIO0 ---+---|led-0|>--+--- GPIO2
+		 *          +--<|led-1|---+
+		 * E.g. only one of the LEDs can be illuminated at a time while
+		 * the other output must be driven low.
+		 * This should likely be implemented using a multi color LED
+		 * driver for antiparallel LEDs.
+		 */
+		led-0 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&io_board_gpio 0 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-1 {
+			color = <LED_COLOR_ID_ORANGE>;
+			function = LED_FUNCTION_LAN;
+			gpios = <&io_board_gpio 2 GPIO_ACTIVE_HIGH>;
+		};
+	};
+
+	reg_5v: regulator-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_1v2: regulator-1v2 {
+		compatible = "regulator-fixed";
+		regulator-name = "1V2";
+		regulator-min-microvolt = <1200000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		vin-supply = <&reg_5v>;
+	};
+};
+
+baseboard_eeprom: &sip_eeprom {
+};
+
+&crc1 {
+	status = "okay";
+};
+
+&cryp1 {
+	status = "okay";
+};
+
+&dts {
+	status = "okay";
+};
+
+&ethernet0 {
+	assigned-clocks = <&rcc ETHCK_K>, <&rcc PLL4_P>;
+	assigned-clock-parents = <&rcc PLL4_P>;
+	assigned-clock-rates = <125000000>; /* Clock PLL4 to 750Mhz in ATF */
+
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ethernet0_rgmii_pins_b>;
+	pinctrl-1 = <&ethernet0_rgmii_sleep_pins_b>;
+
+	st,eth-clk-sel;
+	phy-mode = "rgmii-id";
+	phy-handle = <&ethphy>;
+	status = "okay";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		ethphy: ethernet-phy@3 { /* KSZ9031RN */
+			reg = <3>;
+			reset-gpios = <&gpioe 11 GPIO_ACTIVE_LOW>; /* ETH_RST# */
+			interrupt-parent = <&gpioa>;
+			interrupts = <6 IRQ_TYPE_EDGE_FALLING>; /* ETH_MDINT# */
+			reset-assert-us = <10000>;
+			reset-deassert-us = <300>;
+			micrel,force-master;
+		};
+	};
+};
+
+&gpioa {
+	gpio-line-names = "", "", "", "", "",				/*  0 */
+			  "", "ETH_INT", "", "", "",			/*  5 */
+			  "", "", "", "BOOTROM_LED", "",		/* 10 */
+			  "";						/* 15 */
+};
+
+&gpiob {
+	gpio-line-names = "", "", "", "", "",				/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "", "", "", "",				/* 10 */
+			  "";						/* 15 */
+};
+
+&gpioc {
+	gpio-line-names = "", "", "", "", "",				/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "";					/* 10 */
+};
+
+&gpiod {
+	gpio-line-names = "", "", "", "", "",				/*  0 */
+			  "", "", "LCD_TE", "", "",			/*  5 */
+			  "LCD_DC", "", "", "", "",			/* 10 */
+			  "";						/* 15 */
+};
+
+&gpioe {
+	gpio-line-names = "LCD_CS", "", "", "", "",			/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "", "", "", "",				/* 10 */
+			  "";						/* 15 */
+};
+
+&gpiof {
+	gpio-line-names = "GPIO1", "GPIO2", "", "", "",			/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "", "", "", "",				/* 10 */
+			  "";						/* 15 */
+};
+
+&gpiog {
+	gpio-line-names = "", "", "", "", "",				/*  0 */
+			  "", "", "", "", "",				/*  5 */
+			  "", "", "", "", "",				/* 10 */
+			  "";						/* 15 */
+};
+
+&gpioz {
+	gpio-line-names = "HWID0", "HWID1", "HWID2", "HWID3", "",	/*  0 */
+			  "", "HWID4", "HWID5";				/*  5 */
+};
+
+&hash1 {
+	status = "okay";
+};
+
+&iwdg2 {
+	timeout-sec = <8>;
+	status = "okay";
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_b>;
+	pinctrl-1 = <&m_can1_sleep_pins_b>;
+	status = "okay";
+	termination-gpios = <&io_board_gpio 7 GPIO_ACTIVE_HIGH>;
+	termination-ohms = <120>;
+};
+
+&pmic {
+	regulators {
+		buck1-supply = <&reg_5v>;	/* VIN */
+		buck2-supply = <&reg_5v>;	/* VIN */
+		buck3-supply = <&reg_5v>;	/* VIN */
+		buck4-supply = <&reg_5v>;	/* VIN */
+		ldo2-supply = <&reg_5v>;	/* PMIC_LDO25IN */
+		ldo4-supply = <&reg_5v>;	/* VIN */
+		ldo5-supply = <&reg_5v>;	/* PMIC_LDO25IN */
+		vref_ddr-supply = <&reg_5v>;	/* VIN */
+		boost-supply = <&reg_5v>;	/* PMIC_BSTIN */
+		pwr_sw2-supply = <&bst_out>;	/* PMIC_SWIN */
+	};
+};
+
+&pwr_regulators {
+	vdd-supply = <&vdd>;
+	vdd_3v3_usbfs-supply = <&vdd_usb>;
+};
+
+&sdmmc2 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc2_b4_pins_a &sdmmc2_d47_pins_b>;
+	pinctrl-1 = <&sdmmc2_b4_od_pins_a &sdmmc2_d47_pins_b>;
+	pinctrl-2 = <&sdmmc2_b4_sleep_pins_a &sdmmc2_d47_sleep_pins_b>;
+	vmmc-supply = <&v3v3>;
+
+	bus-width = <8>;
+	mmc-ddr-3_3v;
+	no-1-8-v;
+	non-removable;
+	no-sd;
+	no-sdio;
+	st,neg-edge;
+
+	status = "okay";
+};
+
+&spi4 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi4_pins_a>;
+	cs-gpios = <&gpioe 0 GPIO_ACTIVE_LOW>;
+	status = "okay";
+
+	lcd: display@0 {
+		compatible = "shineworld,lh133k", "panel-mipi-dbi-spi";
+		reg = <0>;
+		power-supply = <&v3v3>;
+		io-supply = <&v3v3>;
+		backlight = <&backlight>;
+		dc-gpios = <&gpiod 10 GPIO_ACTIVE_HIGH>;
+		reset-gpios = <&gpioh 4 GPIO_ACTIVE_HIGH>;
+		spi-3wire;
+		spi-max-frequency = <32000000>;
+
+		width-mm = <23>;
+		height-mm = <23>;
+		rotation = <180>;
+
+		panel-timing {
+			hactive = <240>;
+			vactive = <240>;
+			hback-porch = <0>;
+			vback-porch = <0>;
+
+			clock-frequency = <0>;
+			hfront-porch = <0>;
+			hsync-len = <0>;
+			vfront-porch = <0>;
+			vsync-len = <0>;
+		};
+	};
+};
+
+&timers2 {
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	status = "okay";
+
+	timer@1 {
+		status = "okay";
+	};
+};
+
+&timers3 {
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	status = "okay";
+
+	timer@2 {
+		status = "okay";
+	};
+};
+
+&timers4 {
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	status = "okay";
+
+	timer@3 {
+		status = "okay";
+	};
+};
+
+&timers8 {
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	status = "okay";
+
+	led_pwm: pwm {
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm8_pins_b>;
+		pinctrl-1 = <&pwm8_sleep_pins_b>;
+		status = "okay";
+	};
+};
+
+&uart4 {
+	label = "debug";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart4_pins_a>;
+
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	status = "okay";
+};
+
+&usart3 {
+	label = "external";
+
+	pinctrl-names = "default";
+	pinctrl-0 = <&usart3_pins_a>;
+
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	status = "okay";
+};
+
+&usbh_ehci {
+	phys = <&usbphyc_port0>;
+	phy-names = "usb";
+
+	status = "okay";
+};
+
+&usbotg_hs {
+	phys = <&usbphyc_port1 0>;
+	phy-names = "usb2-phy";
+
+	vusb_d-supply = <&vdd_usb>;
+	vusb_a-supply = <&reg18>;
+
+	status = "okay";
+};
+
+&usbphyc {
+	status = "okay";
+};
+
+&usbphyc_port0 {
+	phy-supply = <&vdd_usb>;
+};
+
+&usbphyc_port1 {
+	phy-supply = <&vdd_usb>;
+};
+
+&v3v3_hdmi {
+	regulator-enable-ramp-delay = <1000>;
+};

-- 
2.45.2



