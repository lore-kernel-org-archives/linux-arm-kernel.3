Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EE08FE7718F
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 29 Dec 2024 18:46:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b8BY8QtWq5OBvIWwFBGSDYVL4Q15ZIpsskd9b5fxCg4=; b=GFCSVoLetEn7OBct+7GrO1hGsS
	4fToEyUKG7poG72sX5j3ezwPPsEmqXlGaPHxvcgZeRzRZJt0yRhl7fLGHJVPYqW0VDMXv4289HTjU
	1sFz5MQmShydcxjPjPPEbjpgnw8CsHsdQaOIVzx6dyoUxnZkDOSc1zxDf5RNPQ0yhKmgJ4GjKiqKW
	P1x/fS3uuaXE2m3zkWj+R9kuVc1FOQHJbad4ORs+u4nTN6erjsQVuVFYOuuv85zM7X0UWNEzpBbVT
	dcFhj/V8z13M39tiGb1tralL8BpCcSxOzokHWIs20VOesCpfQ8IGrMdA7gMtJLCI33UywT31ZDCBV
	MypCKb6Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyIs-00000003lLB-2K85;
	Sun, 29 Dec 2024 18:46:18 +0000
Received: from mail-oi1-x230.google.com ([2607:f8b0:4864:20::230])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tRyGk-00000003l60-3Tmt;
	Sun, 29 Dec 2024 18:44:08 +0000
Received: by mail-oi1-x230.google.com with SMTP id 5614622812f47-3eb98b3b63dso1707339b6e.1;
        Sun, 29 Dec 2024 10:44:06 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735497845; x=1736102645; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=b8BY8QtWq5OBvIWwFBGSDYVL4Q15ZIpsskd9b5fxCg4=;
        b=YIJzN0FWGffalZ1wCUtm41HwKyu1pi6OlORkDn30SCdT6HKyfUgmY/inWac6JQZkay
         BnfnoYRMsTikB333I4tQ+Lp3GzuaebjBZqoGUmu5TZFowAMbcGAop09xJjpj+B/af2y4
         346dAo1vkgjSDiU19ZC+mWm09dDAh+xWWr43GADpMTGIQzQJ4NmsozZ0bQKJCIMg567B
         IChJ1UFNl2KPihpvmIKbptml5jV+W89oiBvPwKUqNFhQf9smiyaAOVhAkUoieEalcoQ8
         +FKh33xZ0y13GsP7ww0nm+2cshdnuNzPpRPjgmdaC9fhvVTlK+BM8gRFqFFDEfXMS4xM
         ClOQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735497845; x=1736102645;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=b8BY8QtWq5OBvIWwFBGSDYVL4Q15ZIpsskd9b5fxCg4=;
        b=a3Oo7tXxIs75gTtbFawYF1P7rmzxeCkAr+6qpXN56hIDU9iMtpH0Qtji92VKVcoXlI
         890kHPpU5fFss0Cioo9+lRRaKDGOLwZPv2qQYPP1Xzq/8ATAcqSC4UNvLwigyiPu1N7N
         xtaxi9kBkA9elMjnT0xJbFNLKQitt+dDxSmV9x431o1XtIVQn6AnaVGDLWfmcIsDIxb4
         FFgf9Wpxct/rcqrzdduZaK47Sf0x4jUq3P6ppe/7fh/+kNRSXYXNFvZkw1eiTC2ahuag
         y6W9nzIwZb3VN84ZYe7jGIV0tu0Sj6ScmQKN+HkSULz1CraAShFjBIL6qIV11J0J2fPO
         AiBw==
X-Forwarded-Encrypted: i=1; AJvYcCU0v7D72aT8DlEnAbib0OH7pY8in6cQ/brq4UDO1VRL2ZbloYKYSdVh6e/qpT3mjqYw7Pwn1dvEs5zuO5yhejxs@lists.infradead.org, AJvYcCVlTQW8PMww2MiBLhIucSGPOH0f4o2LtoHtKiwnq3NexC7OKF2oLkZTtjODElUFsc0TQen2Zw+Zde2gWDlqo2g=@lists.infradead.org
X-Gm-Message-State: AOJu0YyaZ6xyn8RB7LVk9ZmUeZP8w+ddPu9fla4E5xWjP2QNW/EmbM/d
	LjGaUfbvoAkgrHG4XfyLudgZ51zVGo4u8byBRtvVmT9qrGrC+EJc
X-Gm-Gg: ASbGnctnDYFAh9iBJbwdpNEhd2Tm4Sf+MQp7SjCboQRBFh1EQPOMqHjIMaH4DCMarlO
	7enyptnxKkA/UoHLG+9Y9CWYRq38wr0nQiPt53C1aJF4qoVo8anMX2sLRLoxphaIaYuz/r05MWd
	JJXFhJgPXCfpSk4dZYPQrUwBBIG6lsq3/P6vFP3/auCEWMh6C9+6Fkabvg3KQYGrEXtEjES8TJW
	s36C1k8iKV4G0CNJLSDzP+bb+dy8HwK6DsJmiWDTnd54l1fdplqd3a54wENQHKq
X-Google-Smtp-Source: AGHT+IHkZw0kqMOWBrXK7fO7Whbx0euKOXmkX35VmE0qEcKOXJwMq+oT8i7syTfYIz1bddxcrjdjsA==
X-Received: by 2002:a05:6830:6e0e:b0:71d:58df:3277 with SMTP id 46e09a7af769-720ff8f9cb5mr18197736a34.24.1735497844924;
        Sun, 29 Dec 2024 10:44:04 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:e765:a49c:5c4:1103])
        by smtp.gmail.com with ESMTPSA id 46e09a7af769-71fc97d6fafsm5515645a34.31.2024.12.29.10.44.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 29 Dec 2024 10:44:03 -0800 (PST)
From: Jimmy Hon <honyuenkwun@gmail.com>
To: Heiko Stuebner <heiko@sntech.de>
Cc: Ondrej Jirman <megi@xff.cz>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jimmy Hon <honyuenkwun@gmail.com>
Subject: [PATCH 1/7] arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
Date: Sun, 29 Dec 2024 12:41:26 -0600
Message-ID: <20241229184256.1870-3-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20241229184256.1870-2-honyuenkwun@gmail.com>
References: <20241229184256.1870-2-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241229_104406_888626_B9BB9BCC 
X-CRM114-Status: GOOD (  10.52  )
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

for Orange Pi 5 Plus/Max/Ultra and AI Max
---
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 833 ++----------------
 ...gepi-5-plus.dts => rk3588-orangepi-5.dtsi} | 195 +---
 2 files changed, 77 insertions(+), 951 deletions(-)
 copy arch/arm64/boot/dts/rockchip/{rk3588-orangepi-5-plus.dts => rk3588-orangepi-5.dtsi} (80%)

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 9f5a38b290bf..fd49a7c8a381 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
@@ -6,86 +6,15 @@
 /dts-v1/;
 
 #include <dt-bindings/gpio/gpio.h>
-#include <dt-bindings/leds/common.h>
-#include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
 #include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
-#include "rk3588.dtsi"
+#include "rk3588-orangepi-5.dtsi"
 
 / {
 	model = "Xunlong Orange Pi 5 Plus";
 	compatible = "xunlong,orangepi-5-plus", "rockchip,rk3588";
 
-	aliases {
-		mmc0 = &sdhci;
-		mmc1 = &sdmmc;
-	};
-
-	chosen {
-		stdout-path = "serial2:1500000n8";
-	};
-
-	adc-keys-0 {
-		compatible = "adc-keys";
-		io-channels = <&saradc 0>;
-		io-channel-names = "buttons";
-		keyup-threshold-microvolt = <1800000>;
-		poll-interval = <100>;
-
-		button-maskrom {
-			label = "Mask Rom";
-			linux,code = <KEY_SETUP>;
-			press-threshold-microvolt = <2000>;
-		};
-	};
-
-	adc-keys-1 {
-		compatible = "adc-keys";
-		io-channels = <&saradc 1>;
-		io-channel-names = "buttons";
-		keyup-threshold-microvolt = <1800000>;
-		poll-interval = <100>;
-
-		button-recovery {
-			label = "Recovery";
-			linux,code = <KEY_VENDOR>;
-			press-threshold-microvolt = <2000>;
-		};
-	};
-
-	speaker_amp: speaker-audio-amplifier {
-		compatible = "simple-audio-amplifier";
-		enable-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
-		sound-name-prefix = "Speaker Amp";
-	};
-
-	headphone_amp: headphones-audio-amplifier {
-		compatible = "simple-audio-amplifier";
-		enable-gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_HIGH>;
-		sound-name-prefix = "Headphones Amp";
-	};
-
-	ir-receiver {
-		compatible = "gpio-ir-receiver";
-		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&ir_receiver_pin>;
-	};
-
-	gpio-leds {
-		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&blue_led_pin>;
-
-		led {
-			color = <LED_COLOR_ID_BLUE>;
-			function = LED_FUNCTION_INDICATOR;
-			function-enumerator = <1>;
-			gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
 	hdmi0-con {
 		compatible = "hdmi-connector";
 		type = "a";
@@ -97,24 +26,11 @@ hdmi0_con_in: endpoint {
 		};
 	};
 
-	fan: pwm-fan {
-		compatible = "pwm-fan";
-		cooling-levels = <0 70 75 80 100>;
-		fan-supply = <&vcc5v0_sys>;
-		pwms = <&pwm3 0 50000 0>;
-		#cooling-cells = <2>;
-	};
-
-	pwm-leds {
-		compatible = "pwm-leds";
-
-		led {
-			color = <LED_COLOR_ID_GREEN>;
-			function = LED_FUNCTION_INDICATOR;
-			function-enumerator = <2>;
-			max-brightness = <255>;
-			pwms = <&pwm2 0 25000 0>;
-		};
+	ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ir_receiver_pin>;
 	};
 
 	rfkill {
@@ -123,161 +39,62 @@ rfkill {
 		radio-type = "wlan";
 		shutdown-gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
 	};
-
-	sound {
-		compatible = "simple-audio-card";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hp_detect>;
-		simple-audio-card,name = "Analog";
-		simple-audio-card,aux-devs = <&speaker_amp>, <&headphone_amp>;
-		simple-audio-card,format = "i2s";
-		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD3 GPIO_ACTIVE_LOW>;
-		simple-audio-card,bitclock-master = <&daicpu>;
-		simple-audio-card,frame-master = <&daicpu>;
-		/*TODO: SARADC_IN3 is used as MIC detection / key input */
-
-		simple-audio-card,widgets =
-			"Microphone", "Onboard Microphone",
-			"Microphone", "Microphone Jack",
-			"Speaker", "Speaker",
-			"Headphone", "Headphones";
-
-		simple-audio-card,routing =
-			"Headphones", "LOUT1",
-			"Headphones", "ROUT1",
-			"Speaker", "LOUT2",
-			"Speaker", "ROUT2",
-
-			"Headphones", "Headphones Amp OUTL",
-			"Headphones", "Headphones Amp OUTR",
-			"Headphones Amp INL", "LOUT1",
-			"Headphones Amp INR", "ROUT1",
-
-			"Speaker", "Speaker Amp OUTL",
-			"Speaker", "Speaker Amp OUTR",
-			"Speaker Amp INL", "LOUT2",
-			"Speaker Amp INR", "ROUT2",
-
-			/* single ended signal to LINPUT1 */
-			"LINPUT1", "Microphone Jack",
-			"RINPUT1", "Microphone Jack",
-			/* differential signal */
-			"LINPUT2", "Onboard Microphone",
-			"RINPUT2", "Onboard Microphone";
-
-		daicpu: simple-audio-card,cpu {
-			sound-dai = <&i2s0_8ch>;
-			system-clock-frequency = <12288000>;
-		};
-
-		daicodec: simple-audio-card,codec {
-			sound-dai = <&es8388>;
-			system-clock-frequency = <12288000>;
-		};
-	};
-
-	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
-		regulator-name = "vcc3v3_pcie30";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <5000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
-	vcc3v3_pcie_eth: regulator-vcc3v3-pcie-eth {
-		compatible = "regulator-fixed";
-		gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
-		regulator-name = "vcc3v3_pcie_eth";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <50000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
-	vcc3v3_wf: regulator-vcc3v3-wf {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpios = <&gpio2 RK_PC5 GPIO_ACTIVE_HIGH>;
-		regulator-name = "vcc3v3_wf";
-		regulator-min-microvolt = <3300000>;
-		regulator-max-microvolt = <3300000>;
-		startup-delay-us = <50000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
-
-	vcc5v0_sys: regulator-vcc5v0-sys {
-		compatible = "regulator-fixed";
-		regulator-name = "vcc5v0_sys";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-	};
-
-	vcc5v0_usb20: regulator-vcc5v0-usb20 {
-		compatible = "regulator-fixed";
-		enable-active-high;
-		gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_usb20_en>;
-		regulator-name = "vcc5v0_usb20";
-		regulator-min-microvolt = <5000000>;
-		regulator-max-microvolt = <5000000>;
-		vin-supply = <&vcc5v0_sys>;
-	};
 };
 
-&combphy0_ps {
+&speaker_amp {
+	enable-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
-&combphy1_ps {
-	status = "okay";
-};
-
-&combphy2_psu {
-	status = "okay";
-};
-
-&cpu_b0 {
-	cpu-supply = <&vdd_cpu_big0_s0>;
+&headphone_amp {
+	enable-gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_HIGH>;
 };
 
-&cpu_b1 {
-	cpu-supply = <&vdd_cpu_big0_s0>;
-};
-
-&cpu_b2 {
-	cpu-supply = <&vdd_cpu_big1_s0>;
-};
-
-&cpu_b3 {
-	cpu-supply = <&vdd_cpu_big1_s0>;
-};
-
-&cpu_l0 {
-	cpu-supply = <&vdd_cpu_lit_s0>;
-};
-
-&cpu_l1 {
-	cpu-supply = <&vdd_cpu_lit_s0>;
+&analog_sound {
+	pinctrl-names = "default";
+	pinctrl-0 = <&hp_detect>;
+	simple-audio-card,aux-devs = <&speaker_amp>, <&headphone_amp>;
+	simple-audio-card,hp-det-gpios = <&gpio1 RK_PD3 GPIO_ACTIVE_LOW>;
+	simple-audio-card,widgets =
+		"Microphone", "Onboard Microphone",
+		"Microphone", "Microphone Jack",
+		"Speaker", "Speaker",
+		"Headphone", "Headphones";
+
+	simple-audio-card,routing =
+		"Headphones", "LOUT1",
+		"Headphones", "ROUT1",
+		"Speaker", "LOUT2",
+		"Speaker", "ROUT2",
+
+		"Headphones", "Headphones Amp OUTL",
+		"Headphones", "Headphones Amp OUTR",
+		"Headphones Amp INL", "LOUT1",
+		"Headphones Amp INR", "ROUT1",
+
+		"Speaker", "Speaker Amp OUTL",
+		"Speaker", "Speaker Amp OUTR",
+		"Speaker Amp INL", "LOUT2",
+		"Speaker Amp INR", "ROUT2",
+
+		/* single ended signal to LINPUT1 */
+		"LINPUT1", "Microphone Jack",
+		"RINPUT1", "Microphone Jack",
+		/* differential signal */
+		"LINPUT2", "Onboard Microphone",
+		"RINPUT2", "Onboard Microphone";
 };
 
-&cpu_l2 {
-	cpu-supply = <&vdd_cpu_lit_s0>;
+&combphy0_ps {
+	status = "okay";
 };
 
-&cpu_l3 {
-	cpu-supply = <&vdd_cpu_lit_s0>;
+&combphy1_ps {
+	status = "okay";
 };
 
-&gpu {
-	mali-supply = <&vdd_gpu_s0>;
-	status = "okay";
+&fan {
+	pwms = <&pwm3 0 50000 0>;
 };
 
 &hdmi0 {
@@ -300,128 +117,20 @@ &hdptxphy_hdmi0 {
 	status = "okay";
 };
 
-&i2c0 {
+&hym8563 {
+	interrupt-parent = <&gpio0>;
+	interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
 	pinctrl-names = "default";
-	pinctrl-0 = <&i2c0m2_xfer>;
-	status = "okay";
-
-	vdd_cpu_big0_s0: regulator@42 {
-		compatible = "rockchip,rk8602";
-		reg = <0x42>;
-		fcs,suspend-voltage-selector = <1>;
-		regulator-name = "vdd_cpu_big0_s0";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <550000>;
-		regulator-max-microvolt = <1050000>;
-		regulator-ramp-delay = <2300>;
-		vin-supply = <&vcc5v0_sys>;
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-	};
-
-	vdd_cpu_big1_s0: regulator@43 {
-		compatible = "rockchip,rk8603", "rockchip,rk8602";
-		reg = <0x43>;
-		fcs,suspend-voltage-selector = <1>;
-		regulator-name = "vdd_cpu_big1_s0";
-		regulator-always-on;
-		regulator-boot-on;
-		regulator-min-microvolt = <550000>;
-		regulator-max-microvolt = <1050000>;
-		regulator-ramp-delay = <2300>;
-		vin-supply = <&vcc5v0_sys>;
-
-		regulator-state-mem {
-			regulator-off-in-suspend;
-		};
-	};
-};
-
-&i2c6 {
-	clock-frequency = <400000>;
-	status = "okay";
-
-	hym8563: rtc@51 {
-		compatible = "haoyu,hym8563";
-		reg = <0x51>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
-		#clock-cells = <0>;
-		clock-output-names = "hym8563";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hym8563_int>;
-		wakeup-source;
-	};
+	pinctrl-0 = <&hym8563_int>;
 };
 
-&i2c7 {
-	status = "okay";
-
-	/* PLDO2 vcca 1.8V, BUCK8 gated by PLDO2 being enabled */
-	es8388: audio-codec@11 {
-		compatible = "everest,es8388";
-		reg = <0x11>;
-		clocks = <&cru I2S0_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_1v8_s0>;
-		DVDD-supply = <&vcc_1v8_s0>;
-		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
-		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
-		assigned-clock-rates = <12288000>;
-		#sound-dai-cells = <0>;
-	};
-};
-
-&i2s0_8ch {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2s0_lrck
-		     &i2s0_mclk
-		     &i2s0_sclk
-		     &i2s0_sdi0
-		     &i2s0_sdo0>;
+&led_blue_gpio {
+	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
-&i2s2_2ch {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2s2m0_lrck
-		     &i2s2m0_sclk
-		     &i2s2m0_sdi
-		     &i2s2m0_sdo>;
-	status = "okay";
-};
-
-&package_thermal {
-	polling-delay = <1000>;
-
-	cooling-maps {
-		map0 {
-			trip = <&package_fan0>;
-			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
-		};
-
-		map1 {
-			trip = <&package_fan1>;
-			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
-		};
-	};
-
-	trips {
-		package_fan0: package-fan0 {
-			temperature = <55000>;
-			hysteresis = <2000>;
-			type = "active";
-		};
-
-		package_fan1: package-fan1 {
-			temperature = <65000>;
-			hysteresis = <2000>;
-			type = "active";
-		};
-	};
+&led_green_pwm {
+	pwms = <&pwm2 0 25000 0>;
 };
 
 /* phy1 - M.KEY socket */
@@ -445,16 +154,6 @@ &pcie2x1l2 {
 	status = "okay";
 };
 
-&pcie30phy {
-	status = "okay";
-};
-
-&pcie3x4 {
-	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc3v3_pcie30>;
-	status = "okay";
-};
-
 &pinctrl {
 	hym8563 {
 		hym8563_int: hym8563-int {
@@ -498,405 +197,13 @@ &pwm3 {
 	status = "okay";
 };
 
-&saradc {
-	vref-supply = <&vcc_1v8_s0>;
-	status = "okay";
-};
-
-&sdhci {
-	bus-width = <8>;
-	no-sdio;
-	no-sd;
-	non-removable;
-	max-frequency = <200000000>;
-	mmc-hs400-1_8v;
-	mmc-hs400-enhanced-strobe;
-	status = "okay";
-};
-
-&sdmmc {
-	bus-width = <4>;
-	cap-sd-highspeed;
-	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
-	disable-wp;
-	max-frequency = <150000000>;
-	no-sdio;
-	no-mmc;
-	sd-uhs-sdr104;
-	vmmc-supply = <&vcc_3v3_s3>;
-	vqmmc-supply = <&vccio_sd_s0>;
+&recovery_button {
 	status = "okay";
 };
 
 &sfc {
 	pinctrl-names = "default";
 	pinctrl-0 = <&fspim1_pins>;
-	status = "okay";
-
-	spi_flash: flash@0 {
-		compatible = "jedec,spi-nor";
-		reg = <0x0>;
-		spi-max-frequency = <100000000>;
-		spi-rx-bus-width = <4>;
-		spi-tx-bus-width = <1>;
-	};
-};
-
-&spi2 {
-	assigned-clocks = <&cru CLK_SPI2>;
-	assigned-clock-rates = <200000000>;
-	num-cs = <1>;
-	pinctrl-names = "default";
-	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
-	status = "okay";
-
-	pmic@0 {
-		compatible = "rockchip,rk806";
-		reg = <0x0>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
-			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
-		spi-max-frequency = <1000000>;
-		system-power-controller;
-
-		vcc1-supply = <&vcc5v0_sys>;
-		vcc2-supply = <&vcc5v0_sys>;
-		vcc3-supply = <&vcc5v0_sys>;
-		vcc4-supply = <&vcc5v0_sys>;
-		vcc5-supply = <&vcc5v0_sys>;
-		vcc6-supply = <&vcc5v0_sys>;
-		vcc7-supply = <&vcc5v0_sys>;
-		vcc8-supply = <&vcc5v0_sys>;
-		vcc9-supply = <&vcc5v0_sys>;
-		vcc10-supply = <&vcc5v0_sys>;
-		vcc11-supply = <&vcc_2v0_pldo_s3>;
-		vcc12-supply = <&vcc5v0_sys>;
-		vcc13-supply = <&vdd2_ddr_s3>;
-		vcc14-supply = <&vdd2_ddr_s3>;
-		vcca-supply = <&vcc5v0_sys>;
-
-		gpio-controller;
-		#gpio-cells = <2>;
-
-		rk806_dvs1_null: dvs1-null-pins {
-			pins = "gpio_pwrctrl1";
-			function = "pin_fun0";
-		};
-
-		rk806_dvs2_null: dvs2-null-pins {
-			pins = "gpio_pwrctrl2";
-			function = "pin_fun0";
-		};
-
-		rk806_dvs3_null: dvs3-null-pins {
-			pins = "gpio_pwrctrl3";
-			function = "pin_fun0";
-		};
-
-		regulators {
-			vdd_gpu_s0: dcdc-reg1 {
-				regulator-name = "vdd_gpu_s0";
-				regulator-boot-on;
-				regulator-enable-ramp-delay = <400>;
-				regulator-min-microvolt = <550000>;
-				regulator-max-microvolt = <950000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_cpu_lit_s0: dcdc-reg2 {
-				regulator-name = "vdd_cpu_lit_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <550000>;
-				regulator-max-microvolt = <950000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_log_s0: dcdc-reg3 {
-				regulator-name = "vdd_log_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <675000>;
-				regulator-max-microvolt = <825000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <750000>;
-				};
-			};
-
-			vdd_vdenc_s0: dcdc-reg4 {
-				regulator-name = "vdd_vdenc_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <550000>;
-				regulator-max-microvolt = <825000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_ddr_s0: dcdc-reg5 {
-				regulator-name = "vdd_ddr_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <675000>;
-				regulator-max-microvolt = <900000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <850000>;
-				};
-			};
-
-			vdd2_ddr_s3: dcdc-reg6 {
-				regulator-name = "vdd2_ddr_s3";
-				regulator-always-on;
-				regulator-boot-on;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-				};
-			};
-
-			vcc_2v0_pldo_s3: dcdc-reg7 {
-				regulator-name = "vdd_2v0_pldo_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <2000000>;
-				regulator-max-microvolt = <2000000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <2000000>;
-				};
-			};
-
-			vcc_3v3_s3: dcdc-reg8 {
-				regulator-name = "vcc_3v3_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <3300000>;
-				};
-			};
-
-			vddq_ddr_s0: dcdc-reg9 {
-				regulator-name = "vddq_ddr_s0";
-				regulator-always-on;
-				regulator-boot-on;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vcc_1v8_s3: dcdc-reg10 {
-				regulator-name = "vcc_1v8_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <1800000>;
-				};
-			};
-
-			avcc_1v8_s0: pldo-reg1 {
-				regulator-name = "avcc_1v8_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <1800000>;
-				};
-			};
-
-			/* shorted to avcc_1v8_s0 on the board */
-			vcc_1v8_s0: pldo-reg2 {
-				regulator-name = "vcc_1v8_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <1800000>;
-				};
-			};
-
-			avdd_1v2_s0: pldo-reg3 {
-				regulator-name = "avdd_1v2_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1200000>;
-				regulator-max-microvolt = <1200000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vcc_3v3_s0: pldo-reg4 {
-				regulator-name = "vcc_3v3_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <3300000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vccio_sd_s0: pldo-reg5 {
-				regulator-name = "vccio_sd_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <3300000>;
-				regulator-ramp-delay = <12500>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			pldo6_s3: pldo-reg6 {
-				regulator-name = "pldo6_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <1800000>;
-				regulator-max-microvolt = <1800000>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <1800000>;
-				};
-			};
-
-			vdd_0v75_s3: nldo-reg1 {
-				regulator-name = "vdd_0v75_s3";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <750000>;
-
-				regulator-state-mem {
-					regulator-on-in-suspend;
-					regulator-suspend-microvolt = <750000>;
-				};
-			};
-
-			vdd_ddr_pll_s0: nldo-reg2 {
-				regulator-name = "vdd_ddr_pll_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <850000>;
-				regulator-max-microvolt = <850000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-					regulator-suspend-microvolt = <850000>;
-				};
-			};
-
-			avdd_0v75_s0: nldo-reg3 {
-				regulator-name = "avdd_0v75_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				/*
-				 * The schematic mentions that actual setting
-				 * should be 0.8375V. RK3588 datasheet specifies
-				 * maximum as 0.825V. So we set datasheet max
-				 * here.
-				 */
-				regulator-min-microvolt = <825000>;
-				regulator-max-microvolt = <825000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_0v85_s0: nldo-reg4 {
-				regulator-name = "vdd_0v85_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <850000>;
-				regulator-max-microvolt = <850000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-
-			vdd_0v75_s0: nldo-reg5 {
-				regulator-name = "vdd_0v75_s0";
-				regulator-always-on;
-				regulator-boot-on;
-				regulator-min-microvolt = <750000>;
-				regulator-max-microvolt = <750000>;
-
-				regulator-state-mem {
-					regulator-off-in-suspend;
-				};
-			};
-		};
-	};
-};
-
-&tsadc {
-	status = "okay";
-};
-
-&u2phy2 {
-	status = "okay";
-};
-
-&u2phy3 {
-	status = "okay";
-};
-
-&u2phy2_host {
-	phy-supply = <&vcc5v0_usb20>;
-	status = "okay";
-};
-
-&u2phy3_host {
-	phy-supply = <&vcc5v0_usb20>;
-	status = "okay";
-};
-
-&uart2 {
-	pinctrl-0 = <&uart2m0_xfer>;
-	status = "okay";
 };
 
 &uart9 {
@@ -904,28 +211,18 @@ &uart9 {
 	status = "okay";
 };
 
-&usb_host0_ehci {
-	status = "okay";
+&vcc3v3_pcie_eth {
+	gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
 };
 
-&usb_host0_ohci {
+&vcc3v3_wf {
 	status = "okay";
 };
 
-&usb_host1_ehci {
-	status = "okay";
-};
-
-&usb_host1_ohci {
-	status = "okay";
-};
-
-&vop_mmu {
-	status = "okay";
-};
-
-&vop {
-	status = "okay";
+&vcc5v0_usb20 {
+	gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&vcc5v0_usb20_en>;
 };
 
 &vp0 {
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
similarity index 80%
copy from arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
copy to arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
index 9f5a38b290bf..d72afd368d8b 100644
--- a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -9,14 +9,10 @@
 #include <dt-bindings/leds/common.h>
 #include <dt-bindings/input/input.h>
 #include <dt-bindings/pinctrl/rockchip.h>
-#include <dt-bindings/soc/rockchip,vop2.h>
 #include <dt-bindings/usb/pd.h>
 #include "rk3588.dtsi"
 
 / {
-	model = "Xunlong Orange Pi 5 Plus";
-	compatible = "xunlong,orangepi-5-plus", "rockchip,rk3588";
-
 	aliases {
 		mmc0 = &sdhci;
 		mmc1 = &sdmmc;
@@ -40,12 +36,13 @@ button-maskrom {
 		};
 	};
 
-	adc-keys-1 {
+	recovery_button: adc-keys-1 {
 		compatible = "adc-keys";
 		io-channels = <&saradc 1>;
 		io-channel-names = "buttons";
 		keyup-threshold-microvolt = <1800000>;
 		poll-interval = <100>;
+		status = "disabled";
 
 		button-recovery {
 			label = "Recovery";
@@ -56,44 +53,23 @@ button-recovery {
 
 	speaker_amp: speaker-audio-amplifier {
 		compatible = "simple-audio-amplifier";
-		enable-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
 		sound-name-prefix = "Speaker Amp";
+		status = "disabled";
 	};
 
 	headphone_amp: headphones-audio-amplifier {
 		compatible = "simple-audio-amplifier";
-		enable-gpios = <&gpio3 RK_PA7 GPIO_ACTIVE_HIGH>;
 		sound-name-prefix = "Headphones Amp";
 	};
 
-	ir-receiver {
-		compatible = "gpio-ir-receiver";
-		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_LOW>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&ir_receiver_pin>;
-	};
-
 	gpio-leds {
 		compatible = "gpio-leds";
-		pinctrl-names = "default";
-		pinctrl-0 = <&blue_led_pin>;
 
-		led {
+		led_blue_gpio: led {
 			color = <LED_COLOR_ID_BLUE>;
 			function = LED_FUNCTION_INDICATOR;
 			function-enumerator = <1>;
-			gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
-		};
-	};
-
-	hdmi0-con {
-		compatible = "hdmi-connector";
-		type = "a";
-
-		port {
-			hdmi0_con_in: endpoint {
-				remote-endpoint = <&hdmi0_out_con>;
-			};
+			status = "disabled";
 		};
 	};
 
@@ -101,19 +77,17 @@ fan: pwm-fan {
 		compatible = "pwm-fan";
 		cooling-levels = <0 70 75 80 100>;
 		fan-supply = <&vcc5v0_sys>;
-		pwms = <&pwm3 0 50000 0>;
 		#cooling-cells = <2>;
 	};
 
 	pwm-leds {
 		compatible = "pwm-leds";
 
-		led {
+		led_green_pwm: led-2 {
 			color = <LED_COLOR_ID_GREEN>;
 			function = LED_FUNCTION_INDICATOR;
 			function-enumerator = <2>;
 			max-brightness = <255>;
-			pwms = <&pwm2 0 25000 0>;
 		};
 	};
 
@@ -124,48 +98,15 @@ rfkill {
 		shutdown-gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
 	};
 
-	sound {
+	analog_sound: sound {
 		compatible = "simple-audio-card";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hp_detect>;
 		simple-audio-card,name = "Analog";
-		simple-audio-card,aux-devs = <&speaker_amp>, <&headphone_amp>;
 		simple-audio-card,format = "i2s";
 		simple-audio-card,mclk-fs = <256>;
-		simple-audio-card,hp-det-gpios = <&gpio1 RK_PD3 GPIO_ACTIVE_LOW>;
 		simple-audio-card,bitclock-master = <&daicpu>;
 		simple-audio-card,frame-master = <&daicpu>;
 		/*TODO: SARADC_IN3 is used as MIC detection / key input */
 
-		simple-audio-card,widgets =
-			"Microphone", "Onboard Microphone",
-			"Microphone", "Microphone Jack",
-			"Speaker", "Speaker",
-			"Headphone", "Headphones";
-
-		simple-audio-card,routing =
-			"Headphones", "LOUT1",
-			"Headphones", "ROUT1",
-			"Speaker", "LOUT2",
-			"Speaker", "ROUT2",
-
-			"Headphones", "Headphones Amp OUTL",
-			"Headphones", "Headphones Amp OUTR",
-			"Headphones Amp INL", "LOUT1",
-			"Headphones Amp INR", "ROUT1",
-
-			"Speaker", "Speaker Amp OUTL",
-			"Speaker", "Speaker Amp OUTR",
-			"Speaker Amp INL", "LOUT2",
-			"Speaker Amp INR", "ROUT2",
-
-			/* single ended signal to LINPUT1 */
-			"LINPUT1", "Microphone Jack",
-			"RINPUT1", "Microphone Jack",
-			/* differential signal */
-			"LINPUT2", "Onboard Microphone",
-			"RINPUT2", "Onboard Microphone";
-
 		daicpu: simple-audio-card,cpu {
 			sound-dai = <&i2s0_8ch>;
 			system-clock-frequency = <12288000>;
@@ -190,12 +131,11 @@ vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
 
 	vcc3v3_pcie_eth: regulator-vcc3v3-pcie-eth {
 		compatible = "regulator-fixed";
-		gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
 		regulator-name = "vcc3v3_pcie_eth";
 		regulator-min-microvolt = <3300000>;
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <50000>;
-		vin-supply = <&vcc5v0_sys>;
+		vin-supply = <&vcc_3v3_s3>;
 	};
 
 	vcc3v3_wf: regulator-vcc3v3-wf {
@@ -207,6 +147,7 @@ vcc3v3_wf: regulator-vcc3v3-wf {
 		regulator-max-microvolt = <3300000>;
 		startup-delay-us = <50000>;
 		vin-supply = <&vcc5v0_sys>;
+		status = "disabled";
 	};
 
 	vcc5v0_sys: regulator-vcc5v0-sys {
@@ -221,9 +162,6 @@ vcc5v0_sys: regulator-vcc5v0-sys {
 	vcc5v0_usb20: regulator-vcc5v0-usb20 {
 		compatible = "regulator-fixed";
 		enable-active-high;
-		gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_HIGH>;
-		pinctrl-names = "default";
-		pinctrl-0 = <&vcc5v0_usb20_en>;
 		regulator-name = "vcc5v0_usb20";
 		regulator-min-microvolt = <5000000>;
 		regulator-max-microvolt = <5000000>;
@@ -231,14 +169,6 @@ vcc5v0_usb20: regulator-vcc5v0-usb20 {
 	};
 };
 
-&combphy0_ps {
-	status = "okay";
-};
-
-&combphy1_ps {
-	status = "okay";
-};
-
 &combphy2_psu {
 	status = "okay";
 };
@@ -280,26 +210,6 @@ &gpu {
 	status = "okay";
 };
 
-&hdmi0 {
-	status = "okay";
-};
-
-&hdmi0_in {
-	hdmi0_in_vp0: endpoint {
-		remote-endpoint = <&vp0_out_hdmi0>;
-	};
-};
-
-&hdmi0_out {
-	hdmi0_out_con: endpoint {
-		remote-endpoint = <&hdmi0_con_in>;
-	};
-};
-
-&hdptxphy_hdmi0 {
-	status = "okay";
-};
-
 &i2c0 {
 	pinctrl-names = "default";
 	pinctrl-0 = <&i2c0m2_xfer>;
@@ -347,12 +257,8 @@ &i2c6 {
 	hym8563: rtc@51 {
 		compatible = "haoyu,hym8563";
 		reg = <0x51>;
-		interrupt-parent = <&gpio0>;
-		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
 		#clock-cells = <0>;
 		clock-output-names = "hym8563";
-		pinctrl-names = "default";
-		pinctrl-0 = <&hym8563_int>;
 		wakeup-source;
 	};
 };
@@ -365,10 +271,11 @@ es8388: audio-codec@11 {
 		compatible = "everest,es8388";
 		reg = <0x11>;
 		clocks = <&cru I2S0_8CH_MCLKOUT>;
-		AVDD-supply = <&vcc_1v8_s0>;
+		clock-names = "mclk";
+		AVDD-supply = <&vcc_3v3_s0>;
 		DVDD-supply = <&vcc_1v8_s0>;
 		HPVDD-supply = <&vcc_3v3_s0>;
-		PVDD-supply = <&vcc_3v3_s0>;
+		PVDD-supply = <&vcc_1v8_s0>;
 		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
 		assigned-clock-rates = <12288000>;
 		#sound-dai-cells = <0>;
@@ -424,27 +331,6 @@ package_fan1: package-fan1 {
 	};
 };
 
-/* phy1 - M.KEY socket */
-&pcie2x1l0 {
-	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc3v3_wf>;
-	status = "okay";
-};
-
-/* phy2 - right ethernet port */
-&pcie2x1l1 {
-	reset-gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc3v3_pcie_eth>;
-	status = "okay";
-};
-
-/* phy0 - left ethernet port */
-&pcie2x1l2 {
-	reset-gpios = <&gpio4 RK_PA2 GPIO_ACTIVE_HIGH>;
-	vpcie3v3-supply = <&vcc3v3_pcie_eth>;
-	status = "okay";
-};
-
 &pcie30phy {
 	status = "okay";
 };
@@ -455,49 +341,6 @@ &pcie3x4 {
 	status = "okay";
 };
 
-&pinctrl {
-	hym8563 {
-		hym8563_int: hym8563-int {
-			rockchip,pins = <0 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
-	leds {
-		blue_led_pin: blue-led {
-			rockchip,pins = <3 RK_PA6 RK_FUNC_GPIO &pcfg_pull_up>;
-		};
-	};
-
-	ir-receiver {
-		ir_receiver_pin: ir-receiver-pin {
-			rockchip,pins = <4 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
-	sound {
-		hp_detect: hp-detect {
-			rockchip,pins = <1 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-
-	usb {
-		vcc5v0_usb20_en: vcc5v0-usb20-en {
-			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
-		};
-	};
-};
-
-&pwm2 {
-	pinctrl-0 = <&pwm2m1_pins>;
-	pinctrl-names = "default";
-	status = "okay";
-};
-
-&pwm3 {
-	pinctrl-0 = <&pwm3m1_pins>;
-	status = "okay";
-};
-
 &saradc {
 	vref-supply = <&vcc_1v8_s0>;
 	status = "okay";
@@ -529,8 +372,6 @@ &sdmmc {
 };
 
 &sfc {
-	pinctrl-names = "default";
-	pinctrl-0 = <&fspim1_pins>;
 	status = "okay";
 
 	spi_flash: flash@0 {
@@ -899,11 +740,6 @@ &uart2 {
 	status = "okay";
 };
 
-&uart9 {
-	pinctrl-0 = <&uart9m0_xfer>;
-	status = "okay";
-};
-
 &usb_host0_ehci {
 	status = "okay";
 };
@@ -927,10 +763,3 @@ &vop_mmu {
 &vop {
 	status = "okay";
 };
-
-&vp0 {
-	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
-		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
-		remote-endpoint = <&hdmi0_in_vp0>;
-	};
-};
-- 
2.47.1


