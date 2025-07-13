Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B1AFC83F20
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 13 Jul 2025 16:43:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7rsbYu2SV+pczTkzZ01Mx7M47S1CBAFTs46F+MKJUY8=; b=cYfairr3cm76cOj4nEu2wtKi4W
	YEb/6VoZgjPZRct58ZQDq5YWkP3g7ZzUjHCl8cHGTKWrX0mwuIyZyEbvhe3jQEMeJL+alZq2hogPz
	fnEZHxbsC/2vy91c0SfgtT1qNzE59dfZNig0kVGr7GbdZU3pu0XY0upw4d5JwEQTL25qw3ipHBtMc
	PrDVD6siyHZXNX3kIiu8ySSVWGSCg5PwwDRwP5iEJjQM3zFnVWel4J4f2j+RW1fX4vyU5MgPDixVu
	0sKk8ysZi5NU3FP+lU3LYuTm5dPwgYfTfUEQlcoeMebsrjhkXMqZzZM2knfDnXTytGMmIUzIWuSx8
	dlOyp/tg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uaznU-00000000OmP-4ABy;
	Sun, 13 Jul 2025 16:43:28 +0000
Received: from mail-pl1-x62e.google.com ([2607:f8b0:4864:20::62e])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uazeh-00000000O9G-1Gxh;
	Sun, 13 Jul 2025 16:34:24 +0000
Received: by mail-pl1-x62e.google.com with SMTP id d9443c01a7336-2349f096605so44942015ad.3;
        Sun, 13 Jul 2025 09:34:22 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1752424462; x=1753029262; darn=lists.infradead.org;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=7rsbYu2SV+pczTkzZ01Mx7M47S1CBAFTs46F+MKJUY8=;
        b=RQg/+qL+JaSS0u2QqkO419Sg9sSDkTKiyxAADdIP4m72IPvVU6xwP4NohIc1aSBTJD
         nzEHfrOqpB/zVr5hfIWksv90JL3REO1PqBJ1oVLnKopB9iwuKcMC5wiwbEyKYSmR1c8x
         B42sJWXz3LB3hSoTPatQHzuC5gQBreSdUnEAmMYw7jK/BeEwWYqJjKK1vcT1YfjKt1F9
         +rUo7RyIPEsMwVL1GxZriFFm4QtAJoSCJ2IgbwSvhjhQFCZJXoh3wdQanzKCIeW1GtJ+
         qBS4TLtOENkrFOwywyp0iftHHQMCgcYF1oNpuFFV6PkeZjoVTFUbQ8g3U21AxrB0sOIO
         aOyw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1752424462; x=1753029262;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=7rsbYu2SV+pczTkzZ01Mx7M47S1CBAFTs46F+MKJUY8=;
        b=OzV4FbTjvyVh6mr4trlBgB3VpB9x4obPeepjqtdpInEm1EN21HFLzH/tcIlF55uwPZ
         vGFi5YGEFfR2l8Keh70Xyct6vAdOwVR+uBWh2WH1DVyw4fODS2mhW9ZE79gUIExrMtsz
         MIiKNjeVO2XG8XhFoVrV7nbk9fJqp1OjyrPjej7tMuyzcsW0aXC4ffThKoiZvQKaGcEj
         9Qmc8kpc7kIKAydc4XK+lYvvjEN5NKUAJyqnE0jeZy+XSUcyOaox04R7RgVpL1pF2sC7
         ujDEe8lmGTyvwC76YKxzLDeoMjS0ZxCCPWbD4ggETrta9BCZfzeX2EHklVIhVRJzovbq
         oHWw==
X-Forwarded-Encrypted: i=1; AJvYcCUVLVFhpC3LoRLBgKRxKwZafp9WsyYhUyxEW2hgYyTLZlmFKd1cLh77LF7ZJNscvBI0Lsh+XTuzM6SDmegLYuXl@lists.infradead.org, AJvYcCUnkEcDizHXdBU7sASuCTn8OzebVh09fX04B1QJtomvnKc86+XvrWNvzmId7R1aFelpWifFbxlmdPL44CgTTtA=@lists.infradead.org
X-Gm-Message-State: AOJu0Ywiek/B+wKIA3zbjyNNvC7omH6moa47QbFDUvgjyMvPb+IgEajX
	irPbSC/DrCAABhd7gCYcZ1JeSQRo8jX8UBsXUEXlnamu9+OIrXI7rzbX
X-Gm-Gg: ASbGncsuFc4hd6LAw4YFwFYGQ7I+1idWf9/3AFNpgBf9NekWRGDkTA7Czc68quIaPJu
	5M39LC0ROGCmRaSL08Vs6oUKgrAhgLnUIKJeyAehwwfZknWd25ZsJpG2qyjcOY6ahv4LD/pIc5G
	i908vKRPCRuvIULknEpm6sJE3/Y859wNrkq5vPg7zGkfHH35VuFCBdOx10MRFbe3Nml5XDnt9/4
	iWOHYOargy6IbAWhUsE+c5P6idB1S3cPocLdW4HJwzYwznx4z8bRyVMLXKcW1D5v17hGkaMqGzx
	fJ26W/j6NPcKeIl6FcjKSqfV8qhQFQgvljxgdNth16D6nj8P7kzOafBv5/+WsEEe1akIyXu8oHC
	WV9jOcZFkmixmLEC15S8qYvxIJumJtOsr4qD/c/cLILifBg==
X-Google-Smtp-Source: AGHT+IGunyGjn1OtZc1b3/ATWYGmmh9dgbcVfeoJKZ5S0tk036d9F7Te3z2YIRjCS8Soz4e7jhVaaw==
X-Received: by 2002:a17:902:cecd:b0:235:1b91:9079 with SMTP id d9443c01a7336-23dee238341mr204312085ad.32.1752424462248;
        Sun, 13 Jul 2025 09:34:22 -0700 (PDT)
Received: from arch.localdomain ([155.117.228.70])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-23de4285ecbsm80809655ad.48.2025.07.13.09.33.59
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 13 Jul 2025 09:34:22 -0700 (PDT)
From: Jun Yan <jerrysteve1101@gmail.com>
To: robh@kernel.org,
	krzk+dt@kernel.org,
	conor+dt@kernel.org,
	heiko@sntech.de,
	quentin.schulz@cherry.de,
	dsimic@manjaro.org,
	naoki@radxa.com
Cc: devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-rockchip@lists.infradead.org,
	Jun Yan <jerrysteve1101@gmail.com>
Subject: [PATCH 3/3] arm64: dts: rockchip: Add OneThing Cloud OEC turbo
Date: Mon, 14 Jul 2025 00:32:55 +0800
Message-ID: <20250713163255.163669-4-jerrysteve1101@gmail.com>
X-Mailer: git-send-email 2.50.1
In-Reply-To: <20250713163255.163669-1-jerrysteve1101@gmail.com>
References: <20250713163255.163669-1-jerrysteve1101@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250713_093423_347411_8CD6F57A 
X-CRM114-Status: GOOD (  13.74  )
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

The OneThing Cloud OEC turbo features the RK3566 SoC, 4GB of RAM and 8GB of
eMMC storage, and supports one SATA interface and USB 3.0.

  Specification:
    - Rockchip RK3566
    - DDR4 4GB
    - eMMC 8GB
    - Gigabit ethernet
    - USB 3.0 x 1
    - USB-C 2.0 x 1
    - 12V DC Power supply
    - SATA 3.0 connector x 1

Signed-off-by: Jun Yan <jerrysteve1101@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../rk3566-onething-cloud-oec-turbo.dts       | 313 ++++++++++++++++++
 2 files changed, 314 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3566-onething-cloud-oec-turbo.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 4bf84622db47..39db4bba4f8a 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -97,6 +97,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353v.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg353vs.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-anbernic-rg503.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-odroid-m1s.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-onething-cloud-oec-turbo.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v1.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-orangepi-3b-v2.1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3566-pinenote-v1.1.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3566-onething-cloud-oec-turbo.dts b/arch/arm64/boot/dts/rockchip/rk3566-onething-cloud-oec-turbo.dts
new file mode 100644
index 000000000000..ed8ebade54cd
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3566-onething-cloud-oec-turbo.dts
@@ -0,0 +1,313 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pinctrl/rockchip.h>
+#include "rk3566.dtsi"
+
+/ {
+	model = "OneThing Cloud OEC turbo";
+	compatible = "onething,cloud-oec-turbo", "rockchip,rk3566";
+
+	aliases {
+		ethernet0 = &gmac1;
+		mmc0 = &sdhci;
+	};
+
+	chosen: chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	/* No hardware video output port */
+	/delete-node/ display-subsystem;
+
+	gmac1_clkin: external-gmac1-clock {
+		compatible = "fixed-clock";
+		clock-frequency = <125000000>;
+		clock-output-names = "gmac1_clkin";
+		#clock-cells = <0>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		rgb_led_r: rgb-led-r {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio0 RK_PC3 GPIO_ACTIVE_LOW>;
+		};
+
+		rgb_led_g: rgb-led-g {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio3 RK_PB4 GPIO_ACTIVE_LOW>;
+		};
+
+		rgb_led_b: rgb-led-b {
+			color = <LED_COLOR_ID_BLUE>;
+			default-state = "off";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	vcc12v0_dcin: regulator-vcc12v0-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc12v0_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <12000000>;
+		regulator-max-microvolt = <12000000>;
+	};
+
+	vcc5v0_sys: regulator-vcc5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc12v0_dcin>;
+	};
+
+	vcc3v3_sys: regulator-vcc3v3-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc12v0_dcin>;
+	};
+
+	vcc_3v3: regulator-vcc-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_usb_host: regulator-vcc5v0-usb-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpio = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&vcc5v0_usb_host_en>;
+		regulator-name = "vcc5v0_usb_host";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v8: regulator-vcc-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_fixed: regulator-vdd-fixed {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_fixed";
+		regulator-min-microvolt = <950000>;
+		regulator-max-microvolt = <950000>;
+		regulator-always-on;
+		regulator-boot-on;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_cpu: regulator-vdd-cpu {
+		compatible = "pwm-regulator";
+		pwms = <&pwm0 0 5000 1>;
+		regulator-name = "vdd_cpu";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1200000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-settling-time-up-us = <250>;
+		pwm-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_logic: regulator-vdd-logic {
+		compatible = "pwm-regulator";
+		pwms = <&pwm1 0 5000 1>;
+		regulator-name = "vdd_logic";
+		regulator-min-microvolt = <800000>;
+		regulator-max-microvolt = <1100000>;
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-settling-time-up-us = <250>;
+		pwm-supply = <&vcc5v0_sys>;
+	};
+};
+
+&combphy1 {
+	status = "okay";
+};
+
+&combphy2 {
+	status = "okay";
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_cpu>;
+};
+
+&gmac1 {
+	assigned-clocks = <&cru SCLK_GMAC1_RX_TX>, <&cru SCLK_GMAC1>;
+	assigned-clock-parents = <&cru SCLK_GMAC1_RGMII_SPEED>, <&gmac1_clkin>;
+	phy-mode = "rgmii";
+	clock_in_out = "input";
+	pinctrl-names = "default";
+	pinctrl-0 = <&gmac1m1_miim
+		    &gmac1m1_tx_bus2
+		    &gmac1m1_rx_bus2
+		    &gmac1m1_rgmii_clk
+		    &gmac1m1_rgmii_bus
+		    &gmac1m1_clkinout>;
+	snps,reset-gpio = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+	snps,reset-active-low;
+	/* Reset time is 20ms, 100ms for rtl8211f */
+	snps,reset-delays-us = <0 20000 100000>;
+
+	tx_delay = <0x4f>;
+	rx_delay = <0x2d>;
+	phy-handle = <&rgmii_phy1>;
+	status = "okay";
+};
+
+&gpu {
+	status = "okay";
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+	};
+};
+
+&pinctrl {
+	usb {
+		vcc5v0_usb_host_en: vcc5v0_usb_host_en {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+};
+
+&pmu_io_domains {
+	pmuio1-supply = <&vcc_3v3>;
+	pmuio2-supply = <&vcc_3v3>;
+	vccio1-supply = <&vcc_1v8>;
+	vccio3-supply = <&vcc_3v3>;
+	vccio4-supply = <&vcc_1v8>;
+	vccio5-supply = <&vcc_3v3>;
+	vccio6-supply = <&vcc_1v8>;
+	vccio7-supply = <&vcc_3v3>;
+	status = "okay";
+};
+
+&pwm0 {
+	status = "okay";
+};
+
+&pwm1 {
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sata2 {
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	mmc-hs200-1_8v;
+	non-removable;
+	status = "okay";
+};
+
+&tsadc {
+	/* tshut mode 0:CRU 1:GPIO */
+	rockchip,hw-tshut-mode = <1>;
+	/* tshut polarity 0:LOW 1:HIGH */
+	rockchip,hw-tshut-polarity = <0>;
+	status = "okay";
+};
+
+&uart2 {
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
+&usb_host1_ehci {
+	status = "okay";
+};
+
+&usb_host1_ohci {
+	status = "okay";
+};
+
+&usb_host1_xhci  {
+	status = "okay";
+};
+
+&usb2phy0 {
+	status = "okay";
+};
+
+&usb2phy0_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
+&usb2phy0_otg {
+	status = "okay";
+};
+
+&usb2phy1 {
+	status = "okay";
+};
+
+&usb2phy1_host {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
+
+&usb2phy1_otg {
+	phy-supply = <&vcc5v0_usb_host>;
+	status = "okay";
+};
-- 
2.50.1


