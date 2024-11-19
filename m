Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 71C1DD44148
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 19 Nov 2024 11:41:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Xn1RMwCb8pSDe3D3EYp+Vlp38D8HpsZSiR1a5AboFNI=; b=X7Fwv3zWfHU2FGB6zuUYAbiAWD
	0zI3ay0yOxYrWi2aNbEPej2B8xo2RWsCUP3vjjz9vb+LGE/9kdY/FpW+SgSEA6+9oaOC0JyHA8sKY
	sGfu5rLTrvG/SDccKPPJ7vM+Sqz3SvkUtMHCLzi9ujDsWIr2irF425TjkSvhXgFTS6TV8ZXJXlJ4r
	LRmF9LRxbE8jPPJbADkpSAq6M/gw/jRTiuMoA5CdCbhcq89pa1QeXuU7FmoLb5Yiyo95iwFZlTYxj
	Kf/SrIDStCJfaGR08EvoliM8mDE+Gxn0tjjwsBTMy7QBdVHb9NwISJtsZjOUPlj3GRwkAwFgVzzhj
	BPpGbU+g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMbG-0000000CFTp-1smt;
	Tue, 19 Nov 2024 11:40:54 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tDMVo-0000000CEIS-3pTg
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 11:35:18 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVn-0004lE-Lx
	for linux-arm-kernel@lists.infradead.org; Tue, 19 Nov 2024 12:35:15 +0100
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1tDMVm-001Ygq-22
	for linux-arm-kernel@lists.infradead.org;
	Tue, 19 Nov 2024 12:35:14 +0100
Received: from dspam.blackshift.org (localhost [127.0.0.1])
	by bjornoya.blackshift.org (Postfix) with SMTP id 4E2F6377080
	for <linux-arm-kernel@lists.infradead.org>; Tue, 19 Nov 2024 11:35:14 +0000 (UTC)
Received: from hardanger.blackshift.org (unknown [172.20.34.65])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	by bjornoya.blackshift.org (Postfix) with ESMTPS id 8F63D377041;
	Tue, 19 Nov 2024 11:35:10 +0000 (UTC)
Received: from [172.20.34.65] (localhost [::1])
	by hardanger.blackshift.org (OpenSMTPD) with ESMTP id 959326aa;
	Tue, 19 Nov 2024 11:35:09 +0000 (UTC)
From: Marc Kleine-Budde <mkl@pengutronix.de>
Date: Tue, 19 Nov 2024 12:35:03 +0100
Subject: [PATCH 6/6] ARM: dts: stm32: lxa-tac: Add support for generation 3
 devices
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20241119-lxa-tac-gen3-v1-6-e0ab0a369372@pengutronix.de>
References: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
In-Reply-To: <20241119-lxa-tac-gen3-v1-0-e0ab0a369372@pengutronix.de>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
 Alexandre Torgue <alexandre.torgue@foss.st.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, 
 linux-stm32@st-md-mailman.stormreply.com, 
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Marc Kleine-Budde <mkl@pengutronix.de>, 
 =?utf-8?q?Leonard_G=C3=B6hrs?= <l.goehrs@pengutronix.de>
X-Mailer: b4 0.15-dev-355e8
X-Developer-Signature: v=1; a=openpgp-sha256; l=7442; i=mkl@pengutronix.de;
 h=from:subject:message-id; bh=By4pwqAedJvXzN4bGaqFPMZUX2CP5A0SNlNBPYGkLo8=;
 b=owEBbQGS/pANAwAKASg4oj56LbxvAcsmYgBnPHfrdQg035FqZYwjXusVOsW1i7FLwzgrdiAcG
 biva8lby+2JATMEAAEKAB0WIQRQQLqG4LYE3Sm8Pl8oOKI+ei28bwUCZzx36wAKCRAoOKI+ei28
 byjuB/46WKe4cOci99+3casvuIAIGX4Jq5cTHiME2iyJmWXedaIzkYRyo6dPIVkwFJIhklPDy5P
 ytBCCvPhNn0lX+r2xK6vaTJWLhjNa1MjGOebgHrnbbU9rmuoymkx+CxxmUOJ6fm1y493KoCl+No
 ZLfn09QhQoBby7ivU8q9X+XGvXX2pvXg4l57HrGsmbEtekqe4k91Um2vjW7sgUoUylzdTj5rfe2
 HfL3yBNCRJ6yXqDeXfUOp20dEkPTrc/iJWsTfDQEhMPWjMLx90TNgcNBsDogdaX/pkC8XkwkBzs
 goNODTJVO+2JGxtmTcrMxq72PBjqrCoSpniC4Fll0nADfEuy
X-Developer-Key: i=mkl@pengutronix.de; a=openpgp;
 fpr=C1400BA0B3989E6FBC7D5B5C2B5EE211C58AEA54
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241119_033517_122306_145305B6 
X-CRM114-Status: GOOD (  17.16  )
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

Add support for the lxa-tac generation 3 board based on the
STM32MP153c.

Signed-off-by: Leonard Göhrs <l.goehrs@pengutronix.de>
Signed-off-by: Marc Kleine-Budde <mkl@pengutronix.de>
---
 arch/arm/boot/dts/st/Makefile                     |   1 +
 arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts | 267 ++++++++++++++++++++++
 2 files changed, 268 insertions(+)

diff --git a/arch/arm/boot/dts/st/Makefile b/arch/arm/boot/dts/st/Makefile
index eab3a9bd435f5fcb792ed3b59b2a1cef4aef25ed..b7d5d305cbbeb78cfae9fab05271992959f6fa56 100644
--- a/arch/arm/boot/dts/st/Makefile
+++ b/arch/arm/boot/dts/st/Makefile
@@ -39,6 +39,7 @@ dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp151c-mect1s.dtb \
 	stm32mp153c-dhcom-drc02.dtb \
 	stm32mp153c-dhcor-drc-compact.dtb \
+	stm32mp153c-lxa-tac-gen3.dtb \
 	stm32mp153c-mecio1r1.dtb \
 	stm32mp157a-avenger96.dtb \
 	stm32mp157a-dhcor-avenger96.dtb \
diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts b/arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts
new file mode 100644
index 0000000000000000000000000000000000000000..a40b0eae8da3c633c36b433f69a006744fd4fd77
--- /dev/null
+++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-tac-gen3.dts
@@ -0,0 +1,267 @@
+// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
+/*
+ * Copyright (C) 2020 STMicroelectronics - All Rights Reserved
+ * Copyright (C) 2021 Rouven Czerwinski, Pengutronix
+ * Copyright (C) 2023, 2024 Leonard Göhrs, Pengutronix
+ */
+
+/dts-v1/;
+
+#include "stm32mp153.dtsi"
+#include "stm32mp15xc-lxa-tac.dtsi"
+
+/ {
+	model = "Linux Automation Test Automation Controller (TAC) Gen 3";
+	compatible = "lxa,stm32mp153c-tac-gen3", "oct,stm32mp153x-osd32", "st,stm32mp153";
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
+	reg_iobus_12v: regulator-iobus-12v {
+		compatible = "regulator-fixed";
+		vin-supply = <&reg_12v>;
+		gpio = <&gpioh 13 GPIO_ACTIVE_LOW>;
+		regulator-max-microvolt = <12000000>;
+		regulator-min-microvolt = <12000000>;
+		regulator-name = "12V_IOBUS";
+	};
+
+	led-controller-1 {
+		compatible = "pwm-leds-multicolor";
+
+		multi-led {
+			color = <LED_COLOR_ID_RGB>;
+			function = LED_FUNCTION_STATUS;
+			max-brightness = <65535>;
+
+			led-red {
+				active-low;
+				color = <LED_COLOR_ID_RED>;
+				pwms = <&led_pwm 0 1000000 0>;
+			};
+
+			led-green {
+				active-low;
+				color = <LED_COLOR_ID_GREEN>;
+				pwms = <&led_pwm 2 1000000 0>;
+			};
+
+			led-blue {
+				active-low;
+				color = <LED_COLOR_ID_BLUE>;
+				pwms = <&led_pwm 1 1000000 0>;
+			};
+		};
+	};
+
+	led-controller-2 {
+		compatible = "gpio-leds";
+
+		led-5 {
+			label = "tac:green:iobus";
+			gpios = <&gpiog 1 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-6 {
+			label = "tac:green:can";
+			gpios = <&gpiof 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-7 {
+			label = "tac:green:out0";
+			gpios = <&gpiob 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-8 {
+			label = "tac:green:out1";
+			gpios = <&gpiog 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-9 {
+			label = "tac:green:uarttx";
+			gpios = <&gpiod 3 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-10 {
+			label = "tac:green:uartrx";
+			gpios = <&gpiof 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-11 {
+			label = "tac:green:usbh1";
+			gpios = <&gpioc 8 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-12 {
+			label = "tac:green:usbh2";
+			gpios = <&gpiod 6 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-13 {
+			label = "tac:green:usbh3";
+			gpios = <&gpiob 9 GPIO_ACTIVE_HIGH>;
+		};
+
+		led-14 {
+			label = "tac:green:usbg";
+			gpios = <&gpiod 14 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "usb-gadget";
+		};
+
+		led-15 {
+			label = "tac:green:dutpwr";
+			gpios = <&gpioa 15 GPIO_ACTIVE_HIGH>;
+		};
+	};
+};
+
+&adc {
+	pinctrl-names = "default";
+	pinctrl-0 = <&board_adc1_ain_pins>;
+	vdd-supply = <&vdd>;
+	vdda-supply = <&vdda>;
+	vref-supply = <&vrefbuf>;
+	status = "okay";
+
+	adc1: adc@0 {
+		st,adc-channels = <2 5 9 10 13 14 15 18>;
+		st,min-sample-time-nsecs = <5000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		channel@2 {
+			reg = <2>;
+			label = "OUT_0_FB";
+		};
+
+		channel@5 {
+			reg = <5>;
+			label = "IOBUS_CURR_FB";
+		};
+
+		channel@9 {
+			reg = <9>;
+			label = "IOBUS_VOLT_FB";
+		};
+
+		channel@10 {
+			reg = <10>;
+			label = "OUT_1_FB";
+		};
+
+		channel@13 {
+			reg = <13>;
+			label = "HOST_CURR_FB";
+		};
+
+		channel@14 {
+			reg = <14>;
+			label = "HOST_3_CURR_FB";
+		};
+
+		channel@15 {
+			reg = <15>;
+			label = "HOST_1_CURR_FB";
+		};
+
+		channel@18 {
+			reg = <18>;
+			label = "HOST_2_CURR_FB";
+		};
+	};
+
+	adc2: adc@100 {
+		st,adc-channels = <12>;
+		st,min-sample-time-nsecs = <500000>;
+		#address-cells = <1>;
+		#size-cells = <0>;
+		status = "okay";
+
+		channel@12 {
+			reg = <12>;
+			label = "TEMP_INTERNAL";
+		};
+	};
+};
+
+&gpioa {
+	gpio-line-names = "", "", "", "", "",              /*  0 */
+	"ETH_GPIO1", "ETH_INT", "", "", "",                /*  5 */
+	"", "", "", "BOOTROM_LED", "ETH_LAB_LEDRP",        /* 10 */
+	"";                                                /* 15 */
+};
+
+&gpioc {
+	gpio-line-names = "", "DUT_PWR_DISCH", "", "", "", /*  0 */
+	"", "", "", "", "",                                /*  5 */
+	"", "";                                            /* 10 */
+};
+
+&gpioe {
+	gpio-line-names = "TP35", "", "", "", "CAN_1_120R", /*  0 */
+	"", "", "USER_BTN2", "DUT_PWR_EN", "UART_TX_EN",    /*  5 */
+	"UART_RX_EN", "TP24", "", "TP25", "TP26",           /* 10 */
+	"TP27";                                             /* 15 */
+};
+
+&gpiog {
+	gpio-line-names = "ETH_RESET", "", "", "", "",               /*  0 */
+	"IOBUS_FLT_FB", "", "USER_LED2", "ETH1_PPS_A", "CAN_0_120R", /*  5 */
+	"POWER_ADC_RESET", "", "", "", "",                           /* 10 */
+	"";                                                          /* 15 */
+};
+
+&m_can2 {
+	termination-gpios = <&gpioe 4 GPIO_ACTIVE_HIGH>;
+	termination-ohms = <120>;
+};
+
+&pinctrl {
+	board_adc1_ain_pins: board-adc1-ain-0 {
+		pins {
+			pinmux = <STM32_PINMUX('F', 11, ANALOG)>, /* ADC1_INP2 */
+				 <STM32_PINMUX('B', 1, ANALOG)>, /* ADC1_INP5 */
+				 <STM32_PINMUX('B', 0, ANALOG)>, /* ADC1_INP9 */
+				 <STM32_PINMUX('C', 0, ANALOG)>, /* ADC1_INP10 */
+				 <STM32_PINMUX('C', 3, ANALOG)>, /* ADC1_INP13 */
+				 <STM32_PINMUX('A', 2, ANALOG)>, /* ADC1_INP14 */
+				 <STM32_PINMUX('A', 3, ANALOG)>, /* ADC1_INP15 */
+				 <STM32_PINMUX('A', 4, ANALOG)>; /* ADC1_INP18 */
+		};
+	};
+};
+
+&spi2 {
+	adc@0 {
+		compatible = "ti,lmp92064";
+		reg = <0>;
+
+		reset-gpios = <&gpiog 10 (GPIO_ACTIVE_HIGH | GPIO_OPEN_DRAIN)>;
+		shunt-resistor-micro-ohms = <15000>;
+		spi-max-frequency = <5000000>;
+		vdd-supply = <&reg_pb_3v3>;
+		vdig-supply = <&reg_pb_3v3>;
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

-- 
2.45.2



