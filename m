Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C9796E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 00:44:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MbmSEzqENJWzIC3Wyh8CVknPlW/UbbPUeOliXywBows=; b=4a78nqsUa/jkz3OhaUmejQ8/R6
	QZzll4zcBiTAlESnNFuy9/JbfK2lFRdhK+2x0CMvjKio2aF2YYb+YtA1MbTOVaM6s4hXv1rtBMbm6
	Vj1GQLzjfT/Af4bEsBDg5EVXmVbkxUkGFH9VjkQ3djv9t4A9xUSAm50VjpMfrzAiLBV1WdNdFN6rJ
	qsvSgVt4oAvorjSlsMgLXIL2s6O4ATLWa0cd+CJN9nA2ale3f598C6TUHDi4ClySE3oKp6TEiO5fh
	Poxvdy6zIuD+syvs1iZLFrDt+YEpwdsqiy+qd63ZUpvxML+//U7q4AO8SRmII306GETb2cBOmTsDD
	fVWWAcsg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVnU-0000000BmUA-3kKc;
	Fri, 03 Jan 2025 00:44:16 +0000
Received: from mail-oi1-x231.google.com ([2607:f8b0:4864:20::231])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTVl5-0000000Bm9n-2hb1;
	Fri, 03 Jan 2025 00:41:49 +0000
Received: by mail-oi1-x231.google.com with SMTP id 5614622812f47-3eba50d6da7so2952083b6e.2;
        Thu, 02 Jan 2025 16:41:47 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1735864906; x=1736469706; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MbmSEzqENJWzIC3Wyh8CVknPlW/UbbPUeOliXywBows=;
        b=PVhdguxPD+LKWRqcSjel6+Dl68t2mF5eOBCbxBJ0D3VBphrz80bMUWhnc96kgf5yVC
         qQwXamEiuIjhsDN3tRPs9aCePBMc5NbSrD0RV/EDGph7IbYo+yklankisVi5o5kTDKZy
         cIGnhBDZJu7Vx850GuFkqLLSEvbXszEyULTMy6P+Yomlm0r21jvdfn4cuJva/FPg22es
         80P9kaMlIPHC4Ag62lUEDJqUKlutPUeYEQO+LXKNPpUueXhMaegRugCP4btEGkKIjZZ7
         pbdEPPvGWYogql8Hrb7GDChz8t2x6tbJFK8qiNPTJXSfzAyPP3Xf09vjMeQGafRiFwns
         3/bQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1735864906; x=1736469706;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=MbmSEzqENJWzIC3Wyh8CVknPlW/UbbPUeOliXywBows=;
        b=J4KFt2cMQqUYmHBuf2czaF+/q5zcYNqwdYx0a8TuXUSqm0RoopOH50h2A9/wbaPdoU
         /ZwTRQ+4JPTNvG5FOLHCweJByzqf6GX8Q4A7QCYRpLzKNsfsC43RJ14y4upM3SAcDUMD
         4COMQzYpOF/htCT9BS2n24+N6scs8nSjbtO+py+ZkkYNQsYkCAuhGeLwTwmqNW5RWXnI
         ot7Ut4VE02oW2buNz/9b4ubKe8dR9eOx5pScgRylrkYjB598kAB6Y9k4XCZwQlhgcsFC
         rIqn2l4JEmdhX/getc+56NKLI3IzKgms/bbRdQ6oH7f21DW8VXWGtemSn7EFPdoAgRou
         zpkQ==
X-Forwarded-Encrypted: i=1; AJvYcCUs5VQUcDuicn5mWOgYZ/004xXwefmsmzLqk9RJJebXz2ABKwcwU5cRE69fQX5uJHsZ4Hyzq8zw+cm9vOhRWvU=@lists.infradead.org, AJvYcCUxV6ocHVKeAFNzpXq27NESqeW/PK+Rhl/XAdbSh5ljTxXf03hVEihIm5uJdvDPq7/WA9v89axAPIQ+m4wH0dC4@lists.infradead.org
X-Gm-Message-State: AOJu0YyzDlLudB0dCVoWWg7sUYQk76bot7Au9wYfMV1cqkmdRSg/K+E7
	3F8kJMpaUE1Jd7iVmnJHIHWAoMyd0tuG5kUThsoS3+WQzplkKsJF
X-Gm-Gg: ASbGncvzqorr3QRiVnt2UlbIdYoCQLknPNFvAdfPqrRl3BcoQfCbgoTcKatieeNnuFs
	hags3FK5jV7h3LnIEziHUSvxhDuGYyFMWPq23Iu7i2SREmKLQcfMuZ3CBHgAvjKYuEvVd0lXr1k
	r2nMHa+WG18ouEc38K1VU44+FbFD+9VXuHZh4pDj3O5chMFgpsvuBTEmjwTuCub0ovSJ5QwXFOu
	I+29QWWxS2n//hfgZ6l2M/z86fm9quuTzzZ6vu4SqD4XuPWoizt4e06mS6PpqG4ng==
X-Google-Smtp-Source: AGHT+IF/SNFKpHiFfPHdxAixmMEoCSLYn7bDoWVOYcOk1Fl1vC5RHFL81ggEKbk3nTE7vcEuRCcOjw==
X-Received: by 2002:a05:6808:2dc5:b0:3ec:b672:da89 with SMTP id 5614622812f47-3ed88ef757emr20309538b6e.14.1735864906315;
        Thu, 02 Jan 2025 16:41:46 -0800 (PST)
Received: from tower.cjhon.com ([2603:8081:ad00:4a:19f2:4f54:d97c:af6e])
        by smtp.gmail.com with ESMTPSA id 5614622812f47-3ece2549542sm8087778b6e.32.2025.01.02.16.41.43
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 02 Jan 2025 16:41:45 -0800 (PST)
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
Subject: [PATCH v5 1/4] arm64: dts: rockchip: refactor common rk3588-orangepi-5.dtsi
Date: Thu,  2 Jan 2025 18:41:10 -0600
Message-ID: <20250103004114.1902-2-honyuenkwun@gmail.com>
X-Mailer: git-send-email 2.47.1
In-Reply-To: <20250103004114.1902-1-honyuenkwun@gmail.com>
References: <20250103004114.1902-1-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_164147_700210_46332D8F 
X-CRM114-Status: GOOD (  11.90  )
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
 .../dts/rockchip/rk3588-orangepi-5-plus.dts   | 855 ++----------------
 .../boot/dts/rockchip/rk3588-orangepi-5.dtsi  | 798 ++++++++++++++++
 2 files changed, 863 insertions(+), 790 deletions(-)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi

diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-plus.dts
index 000d353645a9..a4a15ef1b71c 100644
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
@@ -124,100 +40,6 @@ rfkill {
 		shutdown-gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
 	};
 
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
 	vbus5v0_typec: vbus-typec-regulator {
 		compatible = "regulator-fixed";
 		enable-active-high;
@@ -229,67 +51,62 @@ vbus5v0_typec: vbus-typec-regulator {
 		regulator-max-microvolt = <5000000>;
 		vin-supply = <&vcc5v0_sys>;
 	};
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
-};
-
-&combphy0_ps {
-	status = "okay";
-};
-
-&combphy1_ps {
-	status = "okay";
 };
 
-&combphy2_psu {
+&speaker_amp {
+	enable-gpios = <&gpio3 RK_PC0 GPIO_ACTIVE_HIGH>;
 	status = "okay";
 };
 
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
@@ -312,50 +129,14 @@ &hdptxphy_hdmi0 {
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
+	pinctrl-0 = <&hym8563_int>;
 };
 
 &i2c6 {
-	clock-frequency = <400000>;
-	status = "okay";
-
 	usbc0: usb-typec@22 {
 		compatible = "fcs,fusb302";
 		reg = <0x22>;
@@ -406,85 +187,15 @@ usbc0_sbu: endpoint {
 			};
 		};
 	};
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
 };
 
-&i2c7 {
+&led_blue_gpio {
+	gpios = <&gpio3 RK_PA6 GPIO_ACTIVE_HIGH>;
 	status = "okay";
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
 };
 
-&i2s0_8ch {
-	pinctrl-names = "default";
-	pinctrl-0 = <&i2s0_lrck
-		     &i2s0_mclk
-		     &i2s0_sclk
-		     &i2s0_sdi0
-		     &i2s0_sdo0>;
-	status = "okay";
-};
-
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
@@ -508,16 +219,6 @@ &pcie2x1l2 {
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
@@ -571,422 +272,17 @@ &pwm3 {
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
-&u2phy0 {
-	status = "okay";
-};
-
-&u2phy0_otg {
-	status = "okay";
-};
-
-&u2phy1 {
-	status = "okay";
 };
 
 &u2phy1_otg {
 	phy-supply = <&vcc5v0_sys>;
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
@@ -999,7 +295,6 @@ &usbdp_phy0 {
 	orientation-switch;
 	sbu1-dc-gpios = <&gpio4 RK_PA6 GPIO_ACTIVE_HIGH>;
 	sbu2-dc-gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
-	status = "okay";
 
 	port {
 		#address-cells = <1>;
@@ -1017,21 +312,8 @@ usbdp_phy0_typec_sbu: endpoint@1 {
 	};
 };
 
-&usbdp_phy1 {
-	status = "okay";
-};
-
-&usb_host0_ehci {
-	status = "okay";
-};
-
-&usb_host0_ohci {
-	status = "okay";
-};
-
 &usb_host0_xhci {
 	usb-role-switch;
-	status = "okay";
 
 	port {
 		usb_host0_xhci_drd_sw: endpoint {
@@ -1040,25 +322,18 @@ usb_host0_xhci_drd_sw: endpoint {
 	};
 };
 
-&usb_host1_ehci {
-	status = "okay";
+&vcc3v3_pcie_eth {
+	gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
 };
 
-&usb_host1_ohci {
+&vcc3v3_wf {
 	status = "okay";
 };
 
-&usb_host1_xhci {
-	dr_mode = "host";
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
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
new file mode 100644
index 000000000000..944f21410860
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5.dtsi
@@ -0,0 +1,798 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2023 Ondřej Jirman <megi@xff.cz>
+ */
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include <dt-bindings/usb/pd.h>
+#include "rk3588.dtsi"
+
+/ {
+	aliases {
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	adc-keys-0 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "Mask Rom";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <2000>;
+		};
+	};
+
+	recovery_button: adc-keys-1 {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+		status = "disabled";
+
+		button-recovery {
+			label = "Recovery";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <2000>;
+		};
+	};
+
+	speaker_amp: speaker-audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "Speaker Amp";
+		status = "disabled";
+	};
+
+	headphone_amp: headphones-audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		sound-name-prefix = "Headphones Amp";
+	};
+
+	gpio-leds {
+		compatible = "gpio-leds";
+
+		led_blue_gpio: led {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <1>;
+			status = "disabled";
+		};
+	};
+
+	fan: pwm-fan {
+		compatible = "pwm-fan";
+		cooling-levels = <0 70 75 80 100>;
+		fan-supply = <&vcc5v0_sys>;
+		#cooling-cells = <2>;
+	};
+
+	pwm-leds {
+		compatible = "pwm-leds";
+
+		led_green_pwm: led-2 {
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_INDICATOR;
+			function-enumerator = <2>;
+			max-brightness = <255>;
+		};
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "rfkill-pcie-wlan";
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
+	};
+
+	analog_sound: sound {
+		compatible = "simple-audio-card";
+		simple-audio-card,name = "Analog";
+		simple-audio-card,format = "i2s";
+		simple-audio-card,mclk-fs = <256>;
+		simple-audio-card,bitclock-master = <&daicpu>;
+		simple-audio-card,frame-master = <&daicpu>;
+		/*TODO: SARADC_IN3 is used as MIC detection / key input */
+
+		daicpu: simple-audio-card,cpu {
+			sound-dai = <&i2s0_8ch>;
+			system-clock-frequency = <12288000>;
+		};
+
+		daicodec: simple-audio-card,codec {
+			sound-dai = <&es8388>;
+			system-clock-frequency = <12288000>;
+		};
+	};
+
+	vcc3v3_pcie30: regulator-vcc3v3-pcie30 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc3v3_pcie30";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <5000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc3v3_pcie_eth: regulator-vcc3v3-pcie-eth {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_pcie_eth";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc_3v3_s3>;
+	};
+
+	vcc3v3_wf: regulator-vcc3v3-wf {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio2 RK_PC5 GPIO_ACTIVE_HIGH>;
+		regulator-name = "vcc3v3_wf";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		startup-delay-us = <50000>;
+		vin-supply = <&vcc5v0_sys>;
+		status = "disabled";
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc5v0_usb20: regulator-vcc5v0-usb20 {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		regulator-name = "vcc5v0_usb20";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&combphy2_psu {
+	status = "okay";
+};
+
+&cpu_b0 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b1 {
+	cpu-supply = <&vdd_cpu_big0_s0>;
+};
+
+&cpu_b2 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_b3 {
+	cpu-supply = <&vdd_cpu_big1_s0>;
+};
+
+&cpu_l0 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l1 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l2 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&cpu_l3 {
+	cpu-supply = <&vdd_cpu_lit_s0>;
+};
+
+&gpu {
+	mali-supply = <&vdd_gpu_s0>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0m2_xfer>;
+	status = "okay";
+
+	vdd_cpu_big0_s0: regulator@42 {
+		compatible = "rockchip,rk8602";
+		reg = <0x42>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big0_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+
+	vdd_cpu_big1_s0: regulator@43 {
+		compatible = "rockchip,rk8603", "rockchip,rk8602";
+		reg = <0x43>;
+		fcs,suspend-voltage-selector = <1>;
+		regulator-name = "vdd_cpu_big1_s0";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <550000>;
+		regulator-max-microvolt = <1050000>;
+		regulator-ramp-delay = <2300>;
+		vin-supply = <&vcc5v0_sys>;
+
+		regulator-state-mem {
+			regulator-off-in-suspend;
+		};
+	};
+};
+
+&i2c6 {
+	clock-frequency = <400000>;
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		wakeup-source;
+	};
+};
+
+&i2c7 {
+	status = "okay";
+
+	/* PLDO2 vcca 1.8V, BUCK8 gated by PLDO2 being enabled */
+	es8388: audio-codec@11 {
+		compatible = "everest,es8388";
+		reg = <0x11>;
+		clocks = <&cru I2S0_8CH_MCLKOUT>;
+		clock-names = "mclk";
+		AVDD-supply = <&vcc_3v3_s0>;
+		DVDD-supply = <&vcc_1v8_s0>;
+		HPVDD-supply = <&vcc_3v3_s0>;
+		PVDD-supply = <&vcc_1v8_s0>;
+		assigned-clocks = <&cru I2S0_8CH_MCLKOUT>;
+		assigned-clock-rates = <12288000>;
+		#sound-dai-cells = <0>;
+	};
+};
+
+&i2s0_8ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s0_lrck
+		     &i2s0_mclk
+		     &i2s0_sclk
+		     &i2s0_sdi0
+		     &i2s0_sdo0>;
+	status = "okay";
+};
+
+&i2s2_2ch {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2s2m0_lrck
+		     &i2s2m0_sclk
+		     &i2s2m0_sdi
+		     &i2s2m0_sdo>;
+	status = "okay";
+};
+
+&package_thermal {
+	polling-delay = <1000>;
+
+	cooling-maps {
+		map0 {
+			trip = <&package_fan0>;
+			cooling-device = <&fan THERMAL_NO_LIMIT 1>;
+		};
+
+		map1 {
+			trip = <&package_fan1>;
+			cooling-device = <&fan 2 THERMAL_NO_LIMIT>;
+		};
+	};
+
+	trips {
+		package_fan0: package-fan0 {
+			temperature = <55000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+
+		package_fan1: package-fan1 {
+			temperature = <65000>;
+			hysteresis = <2000>;
+			type = "active";
+		};
+	};
+};
+
+&pcie30phy {
+	status = "okay";
+};
+
+&pcie3x4 {
+	reset-gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
+	vpcie3v3-supply = <&vcc3v3_pcie30>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8_s0>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	max-frequency = <200000000>;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cd-gpios = <&gpio0 RK_PA4 GPIO_ACTIVE_LOW>;
+	disable-wp;
+	max-frequency = <150000000>;
+	no-sdio;
+	no-mmc;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3_s3>;
+	vqmmc-supply = <&vccio_sd_s0>;
+	status = "okay";
+};
+
+&sfc {
+	status = "okay";
+
+	spi_flash: flash@0 {
+		compatible = "jedec,spi-nor";
+		reg = <0x0>;
+		spi-max-frequency = <100000000>;
+		spi-rx-bus-width = <4>;
+		spi-tx-bus-width = <1>;
+	};
+};
+
+&spi2 {
+	assigned-clocks = <&cru CLK_SPI2>;
+	assigned-clock-rates = <200000000>;
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
+	status = "okay";
+
+	pmic@0 {
+		compatible = "rockchip,rk806";
+		reg = <0x0>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <7 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&pmic_pins>, <&rk806_dvs1_null>,
+			    <&rk806_dvs2_null>, <&rk806_dvs3_null>;
+		spi-max-frequency = <1000000>;
+		system-power-controller;
+
+		vcc1-supply = <&vcc5v0_sys>;
+		vcc2-supply = <&vcc5v0_sys>;
+		vcc3-supply = <&vcc5v0_sys>;
+		vcc4-supply = <&vcc5v0_sys>;
+		vcc5-supply = <&vcc5v0_sys>;
+		vcc6-supply = <&vcc5v0_sys>;
+		vcc7-supply = <&vcc5v0_sys>;
+		vcc8-supply = <&vcc5v0_sys>;
+		vcc9-supply = <&vcc5v0_sys>;
+		vcc10-supply = <&vcc5v0_sys>;
+		vcc11-supply = <&vcc_2v0_pldo_s3>;
+		vcc12-supply = <&vcc5v0_sys>;
+		vcc13-supply = <&vdd2_ddr_s3>;
+		vcc14-supply = <&vdd2_ddr_s3>;
+		vcca-supply = <&vcc5v0_sys>;
+
+		gpio-controller;
+		#gpio-cells = <2>;
+
+		rk806_dvs1_null: dvs1-null-pins {
+			pins = "gpio_pwrctrl1";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs2_null: dvs2-null-pins {
+			pins = "gpio_pwrctrl2";
+			function = "pin_fun0";
+		};
+
+		rk806_dvs3_null: dvs3-null-pins {
+			pins = "gpio_pwrctrl3";
+			function = "pin_fun0";
+		};
+
+		regulators {
+			vdd_gpu_s0: dcdc-reg1 {
+				regulator-name = "vdd_gpu_s0";
+				regulator-boot-on;
+				regulator-enable-ramp-delay = <400>;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: dcdc-reg2 {
+				regulator-name = "vdd_cpu_lit_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_log_s0: dcdc-reg3 {
+				regulator-name = "vdd_log_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <825000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_vdenc_s0: dcdc-reg4 {
+				regulator-name = "vdd_vdenc_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <825000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_ddr_s0: dcdc-reg5 {
+				regulator-name = "vdd_ddr_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <675000>;
+				regulator-max-microvolt = <900000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			vdd2_ddr_s3: dcdc-reg6 {
+				regulator-name = "vdd2_ddr_s3";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+				};
+			};
+
+			vcc_2v0_pldo_s3: dcdc-reg7 {
+				regulator-name = "vdd_2v0_pldo_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <2000000>;
+				regulator-max-microvolt = <2000000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <2000000>;
+				};
+			};
+
+			vcc_3v3_s3: dcdc-reg8 {
+				regulator-name = "vcc_3v3_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <3300000>;
+				};
+			};
+
+			vddq_ddr_s0: dcdc-reg9 {
+				regulator-name = "vddq_ddr_s0";
+				regulator-always-on;
+				regulator-boot-on;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_1v8_s3: dcdc-reg10 {
+				regulator-name = "vcc_1v8_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avcc_1v8_s0: pldo-reg1 {
+				regulator-name = "avcc_1v8_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			/* shorted to avcc_1v8_s0 on the board */
+			vcc_1v8_s0: pldo-reg2 {
+				regulator-name = "vcc_1v8_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			avdd_1v2_s0: pldo-reg3 {
+				regulator-name = "avdd_1v2_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1200000>;
+				regulator-max-microvolt = <1200000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vcc_3v3_s0: pldo-reg4 {
+				regulator-name = "vcc_3v3_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vccio_sd_s0: pldo-reg5 {
+				regulator-name = "vccio_sd_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			pldo6_s3: pldo-reg6 {
+				regulator-name = "pldo6_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <1800000>;
+				};
+			};
+
+			vdd_0v75_s3: nldo-reg1 {
+				regulator-name = "vdd_0v75_s3";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+
+				regulator-state-mem {
+					regulator-on-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_ddr_pll_s0: nldo-reg2 {
+				regulator-name = "vdd_ddr_pll_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <850000>;
+				};
+			};
+
+			avdd_0v75_s0: nldo-reg3 {
+				regulator-name = "avdd_0v75_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				/*
+				 * The schematic mentions that actual setting
+				 * should be 0.8375V. RK3588 datasheet specifies
+				 * maximum as 0.825V. So we set datasheet max
+				 * here.
+				 */
+				regulator-min-microvolt = <825000>;
+				regulator-max-microvolt = <825000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v85_s0: nldo-reg4 {
+				regulator-name = "vdd_0v85_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <850000>;
+				regulator-max-microvolt = <850000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_0v75_s0: nldo-reg5 {
+				regulator-name = "vdd_0v75_s0";
+				regulator-always-on;
+				regulator-boot-on;
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+		};
+	};
+};
+
+&tsadc {
+	status = "okay";
+};
+
+&u2phy0 {
+	status = "okay";
+};
+
+&u2phy0_otg {
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	status = "okay";
+};
+
+&u2phy2 {
+	status = "okay";
+};
+
+&u2phy3 {
+	status = "okay";
+};
+
+&u2phy2_host {
+	phy-supply = <&vcc5v0_usb20>;
+	status = "okay";
+};
+
+&u2phy3_host {
+	phy-supply = <&vcc5v0_usb20>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m0_xfer>;
+	status = "okay";
+};
+
+&usbdp_phy0 {
+	status = "okay";
+};
+
+&usbdp_phy1 {
+	status = "okay";
+};
+
+&usb_host0_ehci {
+	status = "okay";
+};
+
+&usb_host0_ohci {
+	status = "okay";
+};
+
+&usb_host0_xhci {
+	status = "okay";
+};
+
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb_host1_xhci {
+	dr_mode = "host";
+	status = "okay";
+};
+
+&vop_mmu {
+	status = "okay";
+};
+
+&vop {
+	status = "okay";
+};
-- 
2.47.1


