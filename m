Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 53DBAC55175
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  3 Aug 2026 07:43:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oV3f+50ed4LkIgc2qygb/N6CZZlLTsBadYHjngUXyJU=; b=Nzpa+uSDikiaJUwsZCpWg7q57V
	bd6EU9XVGbX96pgi9GoVHL+Wl6G6jmaPIDG8RtufVhW7/7f+6idIHH8n2jz4zV/vXW0gjqOmHUX+P
	LpZRGEcybbCMiMhJmo0eMkIPgPm4rpscbmKMl2hBzd1c+c6obx+cJOJkrpJ5CL+xco4YDtJJtG396
	s97Wyf5jkYuFcyAwr5oSRDzPEbifbr5NMJP1i4tY0S5GSZcoqaxIs0iYniyvS0knIg0gxFi8AbH5q
	IXbm1vWvUdSZcLrfJIUxvvkhsaTVz8xCAYcADIk2UJgW3A6T4CWCamPH49MbFLp+p+znNHPcE8KEd
	SLb9qVew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKQ-0000000GXq5-2YiC;
	Mon, 03 Aug 2026 07:43:18 +0000
Received: from mail-wr1-x429.google.com ([2a00:1450:4864:20::429])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wqnKN-0000000GXjb-12Wm
	for linux-arm-kernel@lists.infradead.org;
	Mon, 03 Aug 2026 07:43:17 +0000
Received: by mail-wr1-x429.google.com with SMTP id ffacd0b85a97d-47c6e9a694bso1960678f8f.1
        for <linux-arm-kernel@lists.infradead.org>; Mon, 03 Aug 2026 00:43:14 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1785742993; x=1786347793; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to:content-type;
        bh=oV3f+50ed4LkIgc2qygb/N6CZZlLTsBadYHjngUXyJU=;
        b=Girl0heGW5qSCwJsz4ZvQ5ebzB+C9vgBA3GQPXpexldXetlmYA533sRNwvmp6kxGRZ
         2XS7kpgWaDzzTfWMt2LNF0Bhz3/CtiMvC65mmxEhn7CYH+J3jmNVed7PLn5dU0yn8AWt
         VJy1rFsmdsOafi8egjdO91bKjQqVL5PJaKhg8=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1785742993; x=1786347793;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to:content-type;
        bh=oV3f+50ed4LkIgc2qygb/N6CZZlLTsBadYHjngUXyJU=;
        b=OcRyfbJipheD5v9SYkUV/b1/IAwNjr0OQqTvwrhSZG5gUM4Ia/u9M+Y3w9bC6dALxZ
         X5BuVFFYbpfmoPV1LDf+bAZph5qXtt0FnQ8nycJcgw8PUJx+H+Bg+qDwD4yoMozsmObm
         sAB/sDgb/wP5SxU7e3frMkl7FhoAi9isrsXVSxyxayS+fq+BPD3cbpMZeE+OJRt1ETK+
         XWXbv5ZMJIcxfhXHZOVNOba2Oqzto2KQ4OFP7IN6OhZTdoO1V/gX2ngShtV9Vw6HbtTQ
         L7VjQA4XtP/+NrjGqWTm4DYGS2uQvm6FEZmp9puTEp4njRrVEvEt5fjwJopwNrwp7Rf8
         ppZA==
X-Forwarded-Encrypted: i=1; AHgh+Ro3UH0l0aIKo9nYzv5SQ74e6Vdjmu/vSpD4tMxVlDjC1fEweU5BtvM3UByFuY2ezFJrlQggLUVuAYadNeO4xCmV@lists.infradead.org
X-Gm-Message-State: AOJu0YzhMo/nVUJ1ysvaVliJGMXRWKX2Ec+QuOMjReFNejNEYVl98XNq
	v1Q8wNWoIShLu7TdyKst+pf1fqRyS70SXoyrAbZFi8iadcDQyAkyiUuGYmbJgXu67qwvMDfVkcv
	1JY++
X-Gm-Gg: AR+sD12RAMgeDlJgw77k7+dIegg504S/yHaD8CT6I/sUwqibnwsQ8Hpzsj/5c3Cx1wr
	9kaR9GqgCFjLgzxVEc6tSXC2Fz0KBW/QFuAlAaP0fNGpUEwhHSc7l2FTIdeKiMJDh8S/5jHofqf
	N6ELHt/nEx9Rbiw3HMv246aULpCcVvEq/jVbieyLZ1zkLzmpCsDW93BApWL2eVizAfC9zfaVs5M
	jghCUcctnuYWborVVC3NoADFTX/UuNiVeZjFz/7UaUPJ+ChHctaN+kB6u4egypiziJ0Cqlm4v0w
	mqB3KG23EELLvX5hZ3Qr1N/bKmiC7lq+4W7pAlnj2b3zUnBNdrrpezRxh5Glcio4OI1fDvCWxJw
	tROp0QIou0VU0GDCJS2zGlDN9ZzkHunudCm0oDCQD/PKS/d6ee9t69OD53wdhxMS9WaQdsZuAU2
	c5Y+08UGEeJ6Rg4KhiAGuyUnYul769VYW9zu7YTDyHpJtBLScO0sNKcLuVCVODf5TTYF/eKMhbO
	9eir8lYvRrkq81R58eDW09aI1/p9t4Xmz6Ie+nHwhlINdPNYGualh7sp8d22rsCB9/Hemv6fHsc
	tJbJ2svKV0aR5RVhVVcY7IzRXx0YxQh4veb5C0SVGekiu9ft7AF1NZDPNkQSE0Lt
X-Received: by 2002:adf:ff82:0:b0:47f:959f:f6a7 with SMTP id ffacd0b85a97d-47fd72c6c84mr17098474f8f.26.1785742993201;
        Mon, 03 Aug 2026 00:43:13 -0700 (PDT)
Received: from dario-ThinkPad-P14s-Gen-5.homenet.telecomitalia.it (host-79-17-119-233.retail.telecomitalia.it. [79.17.119.233])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-47fd41d1a58sm30370503f8f.7.2026.08.03.00.43.12
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 03 Aug 2026 00:43:12 -0700 (PDT)
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
To: linux-kernel@vger.kernel.org
Cc: domenico.acri@engicam.com,
	linux-amarula@amarulasolutions.com,
	michael@amarulasolutions.com,
	francesco.utel@engicam.com,
	Dario Binacchi <dario.binacchi@amarulasolutions.com>,
	Alexandre Torgue <alexandre.torgue@foss.st.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Maxime Coquelin <mcoquelin.stm32@gmail.com>,
	Rob Herring <robh@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-stm32@st-md-mailman.stormreply.com
Subject: [RESEND PATCH v7 15/16] arm64: dts: st: support Engicam MicroGEA-STM32MP257-RMM board
Date: Mon,  3 Aug 2026 09:26:10 +0200
Message-ID: <20260803074224.3821911-16-dario.binacchi@amarulasolutions.com>
X-Mailer: git-send-email 2.43.0
In-Reply-To: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
References: <20260803074224.3821911-1-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260803_004315_363696_8BBA316B 
X-CRM114-Status: GOOD (  16.31  )
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

Support for Engicam MicroGEA-STM32MP257-RMM board with:

 - 8 GB eMMC Flash
 - 2 GB LPDDR4 DRAM
 - CAN
 - LEDs
 - LCD panel with touchscreen
 - Micro SD card connector
 - Audio codec
 - Buzzer

Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>

---

(no changes since v5)

Changes in v5:
- Fix touchscreen resolution to 480x854
- Fix SPI1 CS0 polarity to GPIO_ACTIVE_LOW

Changes in v2:
- Drop the clocks property from the sai1 node in stm32mp257-engicam-microgea-rmm.dts
  to avoid overriding the peripheral bus clock reference defined in the base
  SoC device tree. Suggested by Sashiko.
- Reference the existing labeled nodes directly at the root level using
  &sai1a and &sai1b in stm32mp257-engicam-microgea-rmm.dts instead of
  redefining the entire node structure and redeclaring the labels. Suggested by Sashiko.
- Drop the #clock-cells property from sai1a and remove the reference to sai1a from
  the clocks array in sai1b, relying strictly on the st,sync property to handle
  internal synchronization.

 arch/arm64/boot/dts/st/Makefile               |   1 +
 .../st/stm32mp257-engicam-microgea-rmm.dts    | 319 ++++++++++++++++++
 2 files changed, 320 insertions(+)
 create mode 100644 arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts

diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
index 63908113ae36..386eca593c54 100644
--- a/arch/arm64/boot/dts/st/Makefile
+++ b/arch/arm64/boot/dts/st/Makefile
@@ -2,5 +2,6 @@
 dtb-$(CONFIG_ARCH_STM32) += \
 	stm32mp215f-dk.dtb \
 	stm32mp235f-dk.dtb \
+	stm32mp257-engicam-microgea-rmm.dtb \
 	stm32mp257f-dk.dtb \
 	stm32mp257f-ev1.dtb
diff --git a/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
new file mode 100644
index 000000000000..3aea0c2f6651
--- /dev/null
+++ b/arch/arm64/boot/dts/st/stm32mp257-engicam-microgea-rmm.dts
@@ -0,0 +1,319 @@
+// SPDX-License-Identifier: GPL-2.0
+/*
+ * Copyright (C) 2026 Amarula Solutions, Dario Binacchi <dario.binacchi@amarulasolutions.com>
+ * Copyright (C) 2026 Engicam srl
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+
+#include "stm32mp257-engicam-microgea.dtsi"
+
+/ {
+	model = "Engicam MicroGEA STM32MP257D RMM Board";
+	compatible = "engicam,microgea-stm32mp257-rmm",
+		     "engicam,microgea-stm32mp257", "st,stm32mp257";
+
+	aliases {
+		mmc0 = &sdmmc1;
+		mmc1 = &sdmmc2;
+		serial0 = &usart2;
+		serial1 = &usart1;
+	};
+
+	backlight: backlight {
+		compatible = "pwm-backlight";
+		brightness-levels = <0 100>;
+		num-interpolated-steps = <100>;
+		default-brightness-level = <85>;
+		pwms = <&pwm2 0 100000 0>;
+	};
+
+	buzzer {
+		compatible = "pwm-beeper";
+		pwms = <&pwm4 0 1000000 0>;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		framebuffer {
+			compatible = "simple-framebuffer";
+			clocks = <&rcc CK_BUS_LTDC>, <&rcc CK_KER_LTDC>;
+			lcd-supply = <&reg_3v3>;
+			status = "disabled";
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			gpios = <&gpioh 2 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			status = "okay";
+		};
+
+		led-1 {
+			gpios = <&gpioh 6 GPIO_ACTIVE_HIGH>;
+			default-state = "off";
+			status = "okay";
+		};
+	};
+
+	mclk: clock-mclk {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency = <24000000>;
+	};
+
+	reg_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1v8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+	};
+
+	reg_3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+	};
+
+	reg_ext_pwr: regulator-ext-pwr {
+		compatible = "regulator-fixed";
+		regulator-name = "ext-pwr";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		gpio = <&gpiog 0 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+		regulator-always-on;
+	};
+
+	sound {
+		compatible = "audio-graph-card";
+		label = "STM32MP25-RMM";
+		widgets = "Headphone", "Headphone Jack",
+			  "Microphone", "Microphone Jack";
+		routing = "Headphone Jack", "HP_OUT",
+			  "MIC_IN", "Microphone Jack",
+			  "Microphone Jack", "Mic Bias";
+		dais = <&sai1a_port &sai1b_port>;
+		status = "okay";
+	};
+};
+
+&arm_wdt {
+	timeout-sec = <32>;
+	status = "okay";
+};
+
+&i2c1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c1_pins_a>;
+	pinctrl-1 = <&i2c1_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	touchscreen@38 {
+		compatible = "edt,edt-ft5306";
+		reg = <0x38>;
+		interrupt-parent = <&gpiob>;
+		interrupts = <0 IRQ_TYPE_EDGE_FALLING>;
+		reset-gpios = <&gpiod 1 GPIO_ACTIVE_LOW>;
+		touchscreen-size-x = <480>;
+		touchscreen-size-y = <854>;
+	};
+};
+
+&i2c2 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&i2c2_pins_a>;
+	pinctrl-1 = <&i2c2_sleep_pins_a>;
+	i2c-scl-rising-time-ns = <185>;
+	i2c-scl-falling-time-ns = <20>;
+	status = "okay";
+	/* spare dmas for other usage */
+	/delete-property/dmas;
+	/delete-property/dma-names;
+
+	sgtl5000: codec@a {
+		compatible = "fsl,sgtl5000";
+		reg = <0x0a>;
+		#sound-dai-cells = <0>;
+		clocks = <&mclk>;
+
+		VDDA-supply = <&reg_3v3>;
+		VDDIO-supply = <&reg_3v3>;
+		VDDD-supply = <&reg_1v8>;
+
+		sgtl5000_port: port {
+			#address-cells = <1>;
+			#size-cells = <0>;
+
+			sgtl5000_tx_endpoint: endpoint@0 {
+				reg = <0>;
+				remote-endpoint = <&sai1a_endpoint>;
+				frame-master = <&sgtl5000_tx_endpoint>;
+				bitclock-master = <&sgtl5000_tx_endpoint>;
+			};
+
+			sgtl5000_rx_endpoint: endpoint@1 {
+				reg = <1>;
+				remote-endpoint = <&sai1b_endpoint>;
+				frame-master = <&sgtl5000_rx_endpoint>;
+				bitclock-master = <&sgtl5000_rx_endpoint>;
+			};
+		};
+	};
+};
+
+&ltdc {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&ltdc_pins_a>;
+	pinctrl-1 = <&ltdc_sleep_pins_a>;
+	status = "okay";
+
+	port {
+		ltdc_out: endpoint {
+			remote-endpoint = <&panel_in>;
+		};
+	};
+};
+
+&m_can1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&m_can1_pins_a>;
+	pinctrl-1 = <&m_can1_sleep_pins_a>;
+	status = "okay";
+};
+
+&sai1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&sai1a_pins_a>, <&sai1b_pins_a>;
+	pinctrl-1 = <&sai1a_sleep_pins_a>, <&sai1b_sleep_pins_a>;
+	status = "okay";
+};
+
+&sai1a {
+	dma-names = "tx";
+	status = "okay";
+
+	sai1a_port: port {
+		sai1a_endpoint: endpoint {
+			remote-endpoint = <&sgtl5000_tx_endpoint>;
+			dai-format = "i2s";
+			mclk-fs = <512>;
+		};
+	};
+};
+
+&sai1b {
+	dma-names = "rx";
+	st,sync = <&sai1a 2>;
+	clocks = <&rcc CK_KER_SAI1>;
+	clock-names = "sai_ck";
+	status = "okay";
+
+	sai1b_port: port {
+		sai1b_endpoint: endpoint {
+			remote-endpoint = <&sgtl5000_rx_endpoint>;
+			dai-format = "i2s";
+			mclk-fs = <512>;
+		};
+	};
+};
+
+/* MicroSD */
+&sdmmc1 {
+	pinctrl-names = "default", "opendrain", "sleep";
+	pinctrl-0 = <&sdmmc1_b4_pins_a>;
+	pinctrl-1 = <&sdmmc1_b4_od_pins_a>;
+	pinctrl-2 = <&sdmmc1_b4_sleep_pins_a>;
+	broken-cd;
+	disable-wp;
+	st,neg-edge;
+	bus-width = <4>;
+	vmmc-supply = <&scmi_v3v3>;
+	vqmmc-supply = <&scmi_vddio1>;
+	no-1-8-v;
+	status = "okay";
+};
+
+&spi1 {
+	pinctrl-names = "default", "sleep";
+	pinctrl-0 = <&spi1_pins_a>;
+	pinctrl-1 = <&spi1_sleep_pins_a>;
+	#address-cells = <1>;
+	#size-cells = <0>;
+	cs-gpios = <&gpioh 8 GPIO_ACTIVE_LOW>, <&gpioh 3 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	display: display@0 {
+		compatible = "rocktech,rk050hr345-ct106a", "ilitek,ili9806e";
+		reg = <0>;
+		vdd-supply = <&reg_3v3>;
+		spi-max-frequency = <10000000>;
+		reset-gpios = <&gpiob 6 GPIO_ACTIVE_LOW>;
+		backlight = <&backlight>;
+
+		port {
+			panel_in: endpoint {
+				remote-endpoint = <&ltdc_out>;
+			};
+		};
+	};
+};
+
+&timers2 {
+	status = "okay";
+
+	pwm2: pwm {
+		pinctrl-0 = <&pwm2_pins_a>;
+		pinctrl-1 = <&pwm2_sleep_pins_a>;
+		pinctrl-names = "default", "sleep";
+		status = "okay";
+	};
+};
+
+&timers4 {
+	status = "okay";
+
+	pwm4: pwm {
+		pinctrl-names = "default", "sleep";
+		pinctrl-0 = <&pwm4_pins_a>;
+		pinctrl-1 = <&pwm4_sleep_pins_a>;
+		status = "okay";
+	};
+};
+
+&usart1 {
+	pinctrl-names = "default", "idle", "sleep";
+	pinctrl-0 = <&usart1_pins_b>;
+	pinctrl-1 = <&usart1_idle_pins_b>;
+	pinctrl-2 = <&usart1_sleep_pins_b>;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+	status = "okay";
+};
+
+&usart2 {
+	pinctrl-names = "default", "idle", "sleep";
+	pinctrl-0 = <&usart2_pins_a>;
+	pinctrl-1 = <&usart2_idle_pins_a>;
+	pinctrl-2 = <&usart2_sleep_pins_a>;
+	/delete-property/ dmas;
+	/delete-property/ dma-names;
+	status = "okay";
+};
-- 
2.43.0


