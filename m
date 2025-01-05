Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C6E1FE77197
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jan 2025 21:12:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:References
	:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:Subject:Date:
	From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TAY+qjwlYy4JtDCuiDAuRUFQEfqXapyf0f+4Spbqrns=; b=KGHSHz4h0GZv6gM+JgP17I+3my
	hk6+8f9+0XP5xYrejXn0FN9HBO4LgO6dPJsbwKFDoK16QLrbmpkn92D/iiBsrTSAGuRx5eorxGTgU
	OiKkL1wPjW/FkjRnn+1G5zmspB0YFP399M+h1/4dCMvX6Cf0ha18vj5xqG5OxyIrkLYilx8SW9qvn
	kufpfFmn/E/C5++hKEurO0VpELYOtu2J/eLfmlbDCjaYDqoQsow8A7oe7u5PF9+wk1uIriZnQrQJ9
	SnSXYbYT5mCIdgbQ2gQYIqBXXAJ4d9H0N1colbYXX54pgjvOtpcWDRJJw0jVeVz9q1olCbuHM4P8n
	R7PbyrDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tUXuc-0000000HPpu-2wM4;
	Sun, 05 Jan 2025 21:11:54 +0000
Received: from mail-lf1-x129.google.com ([2a00:1450:4864:20::129])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tUXrI-0000000HPSU-0ni6;
	Sun, 05 Jan 2025 21:08:29 +0000
Received: by mail-lf1-x129.google.com with SMTP id 2adb3069b0e04-5401ab97206so14360081e87.3;
        Sun, 05 Jan 2025 13:08:28 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1736111306; x=1736716106; darn=lists.infradead.org;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:from:to:cc:subject:date:message-id
         :reply-to;
        bh=TAY+qjwlYy4JtDCuiDAuRUFQEfqXapyf0f+4Spbqrns=;
        b=bppCAoY8wEkP0TPPZ1CR923qycf4z4CEkWVzrxT6NP+qwMedaLHwza9acz6y51W1aO
         vF0Esq6oUTle50bAeOJupZtyF9sDiZYzU/AbsMlIO3lj5p39vrBeJG0mq9YCd21dnWrg
         qNlSCnHSFFfrm0GK9IPnkVWcwmTK/6MouNP8pqOypKkvNw8lmgQHUd6ry0hUVhajob+1
         NUFBlmOS3y+3Dp/Zr5IHPhHuF48mH8c8+UO2i5Pd9S5XNYvqNMWuxc+6MBoh2tf8kOzN
         0jO0HsuxwIkD9LCnehvmod5gWhyURrUpQR7QhjtQLnHgfY4bdoh/1/oXU+pM8jxhSP4s
         HE8g==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1736111306; x=1736716106;
        h=cc:to:in-reply-to:references:message-id:content-transfer-encoding
         :mime-version:subject:date:from:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=TAY+qjwlYy4JtDCuiDAuRUFQEfqXapyf0f+4Spbqrns=;
        b=haMZ5iuWDMkYcGFLyJuUL32cN3Jot8Ka1NOzUExQBssDXzQv56YPZTQH91K0/qQtR5
         cDw3f/3KsU2z8tyRPjpMJSEjNQkkzSRt4FRjp41d9ILTONFZCOJdTqR3NkLd/vDolKjD
         Qx3TrCZ5rZfCXQd2lcB1tlBvdu3gASR4TnTduzWRsYr3bYd0EtkCHGyXdf4ziAD/4lwu
         fWkqsq6Tpp424wYUwq9kYoVMfLhxubDO3YhVIDtdkbot8V1y1Wn8T7UXcl2KEU7y2JqX
         OJY+b7dhehI/+N9/OSqrLx5mqd343mqINPKpkBQnJumUPcPSTEvhH6+We5jNJIjxCxof
         t4Qg==
X-Forwarded-Encrypted: i=1; AJvYcCUTEZ512JKG3hDlrruYZOTkohUHqNm8iCnHCJcqA6qYwXz93PB+liE7lLbgzpkOccSqTcnL4OgmIY/wJbLKYrQ=@lists.infradead.org, AJvYcCXSBXaUS/UyrwZrwztsF3aUjRM7xHl/tm+5o6QEOXbBfhLuzozq7h1e7XEADOQHb3YI/sbk1TC2soSsLZzl0PbK@lists.infradead.org
X-Gm-Message-State: AOJu0Yyy92Bj2UQ1FztTK7B6hDUgDAMOkdaLJpFHn/HDbGSOt6B1SVPd
	5SFr06k73whMrizhDoYoy3qS04exzljKa+P1XiNI15U80BYuQh13PIsHQ5wCDzk=
X-Gm-Gg: ASbGncvF4F1wrm6op/URngfR78yySlNwK7SzEhCYe5nGgMWg0mqYdPZ3NVMVVvcpo+Y
	bK+ITLF6vHftBJlk0UsX1S+nxjCo/eVYUEz7PRgjAS5MrY74YdxmhwlPruj0RSobBhEWahQlt1Y
	Z7PaYMxofZ/YOaIiZuQandCEZlP0vBcmQKrHs/KbdR9ElLD5Se9Aw5uziNSie9EKCdbI3LdMZ0I
	o+v33CLumPXQMmyMG2EZwtUkNayAI8skMjcK7pUw/VbMhJU0iMp
X-Google-Smtp-Source: AGHT+IF1QgXEPCFYKsBujsfD5FI34yp0Ul1bDehnMwPocE+fDJQxBpOUufV+QeaUrGhME2LRw6i4UA==
X-Received: by 2002:a05:6512:3049:b0:542:250d:eef2 with SMTP id 2adb3069b0e04-5422953c2f8mr16876916e87.20.1736111306011;
        Sun, 05 Jan 2025 13:08:26 -0800 (PST)
Received: from [10.42.0.1] ([185.204.1.212])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-54223813687sm4773419e87.137.2025.01.05.13.08.20
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 05 Jan 2025 13:08:24 -0800 (PST)
From: Alexey Charkov <alchark@gmail.com>
Date: Mon, 06 Jan 2025 01:07:18 +0400
Subject: [PATCH 2/2] arm64: dts: rockchip: Add H96 Max V58 TV Box based on
 RK3588 SoC
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20250106-rk3588-h96-max-v58-v1-2-d25255f851fc@gmail.com>
References: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
In-Reply-To: <20250106-rk3588-h96-max-v58-v1-0-d25255f851fc@gmail.com>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, Heiko Stuebner <heiko@sntech.de>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
 Alexey Charkov <alchark@gmail.com>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1736111288; l=19973;
 i=alchark@gmail.com; s=20240125; h=from:subject:message-id;
 bh=FZNwbWomaeVN9RnbVJBifmyvl2fOg8lIQ3j6AKNhZwk=;
 b=WNrhV50Bul+NeB45cr6KCxV3UGg+JWHzPkCvvcnHQYadVpOZjNerH08y5AwP+KZN/3RhGmcFu
 qQubQvtaBvJBkBQfdpjImVCGsbpDly5M+/a6Zge8bmnBw8TwRQAsEu5
X-Developer-Key: i=alchark@gmail.com; a=ed25519;
 pk=xRO8VeD3J5jhwe0za0aHt2LDumQr8cm0Ls7Jz3YGimk=
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250105_130828_444214_6B32FFF8 
X-CRM114-Status: GOOD (  13.69  )
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

H96 Max V58 is a compact Rockchip RK3588 based device that ships
with Android and is meant for use as a TV connected media box.

Its hardware includes:
 - Rockchip RK3588 SoC with a small aluminium heatsink
 - 4GB or 8GB LPDDR4 RAM
 - 32GB or 64GB eMMC 5.1 storage (HS400)
 - Onboard AP6275P wireless module providing 802.11ax 2x2 MIMO WiFi
   over PCIe connection and Bluetooth 5.3 over UART with two external
   detachable antennas
 - 1x GbE using the onboard GMAC and an RTL8211F PHY
 - 1x USB 2.0 Type-A (also serves as the Maskrom port)
 - 1x USB 3.0 Type-A
 - 1x HDMI 2.1 output
 - 1x optical SPDIF output (not yet enabled here)
 - LED line display ("88:88" digits plus icons) driven by an FD6551
   IC connected over bitbanged I2C (not yet enabled here)
 - GPIO connected CIR receiver
 - Single Rockchip RK806-1 PMIC
 - 12x onboard ambient LEDs lighting up the bottom of the device
 - 5v DCIN using a standard round 5.5mm connector

Signed-off-by: Alexey Charkov <alchark@gmail.com>
---
 arch/arm64/boot/dts/rockchip/Makefile              |   1 +
 .../arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts | 785 +++++++++++++++++++++
 2 files changed, 786 insertions(+)

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index 86cc418a2255cdc22f1d503e9519d2d9572d4e9d..47603d0fa128736305277abd2d5ad71adae6233e 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -138,6 +138,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-wifi.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6b-io.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-evb1-v10.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-friendlyelec-cm3588-nas.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-h96-max-v58.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-jaguar.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-nanopc-t6-lts.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
new file mode 100644
index 0000000000000000000000000000000000000000..457ec9c43aaca52cdfc8b7a80bdca7508a0b6c1c
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3588-h96-max-v58.dts
@@ -0,0 +1,785 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/soc/rockchip,vop2.h>
+#include "rk3588.dtsi"
+
+/ {
+	model = "H96 Max V58 TV Box";
+	compatible = "haochuangyi,h96-max-v58", "rockchip,rk3588";
+
+	aliases {
+		ethernet0 = &gmac1;
+		mmc0 = &sdhci;
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 1>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-function {
+			label = "Reset";
+			linux,code = <KEY_VENDOR>;
+			press-threshold-microvolt = <1750>;
+		};
+	};
+
+	chosen {
+		stdout-path = "serial2:1500000n8";
+	};
+
+	hdmi0-con {
+		compatible = "hdmi-connector";
+		type = "a";
+
+		port {
+			hdmi0_con_in: endpoint {
+				remote-endpoint = <&hdmi0_out_con>;
+			};
+		};
+	};
+
+	ir-receiver {
+		compatible = "gpio-ir-receiver";
+		gpios = <&gpio0 RK_PD4 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&ir_receiver_pin>;
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&led_pins>;
+
+		led {
+			color = <LED_COLOR_ID_BLUE>;
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio3 RK_PD4 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+	};
+
+	pcie_3v3: regulator-3v3-pcie {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_HIGH
+			 &gpio0 RK_PC4 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&pcie2_0_pow &wl_en>;
+		pinctrl-names = "default";
+		regulator-name = "pcie_3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_host: regulator-5v0-host {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_host";
+		regulator-boot-on;
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc5v0_host_en>;
+		pinctrl-names = "default";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_otg: regulator-5v0-otg {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_otg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		enable-active-high;
+		gpios = <&gpio4 RK_PA7 GPIO_ACTIVE_HIGH>;
+		pinctrl-0 = <&vcc5v0_otg_en>;
+		pinctrl-names = "default";
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_sys: regulator-5v0-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	vcc_1v1_nldo_s3: regulator-1v1 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v1_nldo_s3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+};
+
+&combphy0_ps {
+	status = "okay";
+};
+
+&combphy1_ps {
+	status = "okay";
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
+&hdmi0 {
+	status = "okay";
+};
+
+&hdmi0_in {
+	hdmi0_in_vp0: endpoint {
+		remote-endpoint = <&vp0_out_hdmi0>;
+	};
+};
+
+&hdmi0_out {
+	hdmi0_out_con: endpoint {
+		remote-endpoint = <&hdmi0_con_in>;
+	};
+};
+
+&hdptxphy_hdmi0 {
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
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		pinctrl-names = "default";
+		pinctrl-0 = <&hym8563_int>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
+		wakeup-source;
+	};
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy1>;
+	phy-mode = "rgmii-id";
+	pinctrl-0 = <&gmac1_miim
+		     &gmac1_tx_bus2
+		     &gmac1_rx_bus2
+		     &gmac1_rgmii_clk
+		     &gmac1_rgmii_bus>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&mdio1 {
+	rgmii_phy1: ethernet-phy@1 {
+		/* RTL8211F */
+		compatible = "ethernet-phy-id001c.c916";
+		reg = <0x1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtl8211f_rst>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pcie2x1l0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pcie2_0_rst>;
+	reset-gpios = <&gpio4 RK_PA5 GPIO_ACTIVE_HIGH>;
+	status = "okay";
+
+	pcie@0,0 {
+		reg = <0x200000 0 0 0 0>;
+		#address-cells = <3>;
+		#size-cells = <2>;
+		ranges;
+		device_type = "pci";
+		bus-range = <0x20 0x2f>;
+
+		wifi: wifi@0,0 {
+			compatible = "pci14e4,449d";
+			reg = <0x210000 0 0 0 0>;
+			clocks = <&hym8563>;
+			clock-names = "lpo";
+		};
+	};
+};
+
+&pinctrl {
+	hym8563 {
+		hym8563_int: hym8563-int {
+			rockchip,pins = <0 RK_PD3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	ir-receiver {
+		ir_receiver_pin: ir-receiver-pin {
+			rockchip,pins = <0 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		led_pins: led-pins {
+			rockchip,pins = <3 RK_PD4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	pcie2 {
+		pcie2_0_rst: pcie2-0-rst {
+			rockchip,pins = <4 RK_PA5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		pcie2_0_pow: pcie2-0-pow {
+			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	rtl8211f {
+		rtl8211f_rst: rtl8211f-rst {
+			rockchip,pins = <3 RK_PB7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+	};
+
+	usb {
+		vcc5v0_host_en: vcc5v0-host-en {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		vcc5v0_otg_en: vcc5v0-otg-en {
+			rockchip,pins = <4 RK_PA7 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifibt {
+		wl_en: wl-en {
+			rockchip,pins = <0 RK_PC4 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		wl_wake_host: wl-wake-host {
+			rockchip,pins = <0 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_en: bt-en {
+			rockchip,pins = <0 RK_PC6 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake: bt-wake {
+			rockchip,pins = <0 RK_PC5 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+
+		bt_wake_host: bt-wake-host {
+			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&saradc {
+	vref-supply = <&avcc_1v8_s0>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	no-sdio;
+	no-sd;
+	non-removable;
+	mmc-hs400-1_8v;
+	mmc-hs400-enhanced-strobe;
+	status = "okay";
+};
+
+&spi2 {
+	status = "okay";
+	assigned-clocks = <&cru CLK_SPI2>;
+	assigned-clock-rates = <200000000>;
+	num-cs = <1>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi2m2_cs0 &spi2m2_pins>;
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
+		vcc13-supply = <&vcc_1v1_nldo_s3>;
+		vcc14-supply = <&vcc_1v1_nldo_s3>;
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
+			vdd_gpu_s0: vdd_gpu_mem_s0: dcdc-reg1 {
+				regulator-name = "vdd_gpu_s0";
+				regulator-boot-on;
+				regulator-min-microvolt = <550000>;
+				regulator-max-microvolt = <950000>;
+				regulator-ramp-delay = <12500>;
+				regulator-enable-ramp-delay = <400>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+				};
+			};
+
+			vdd_cpu_lit_s0: vdd_cpu_lit_mem_s0: dcdc-reg2 {
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
+				regulator-max-microvolt = <750000>;
+				regulator-ramp-delay = <12500>;
+
+				regulator-state-mem {
+					regulator-off-in-suspend;
+					regulator-suspend-microvolt = <750000>;
+				};
+			};
+
+			vdd_vdenc_s0: vdd_vdenc_mem_s0: dcdc-reg4 {
+				regulator-name = "vdd_vdenc_s0";
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
+				};
+			};
+
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
+				regulator-min-microvolt = <750000>;
+				regulator-max-microvolt = <750000>;
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
+	vbus-supply = <&vcc5v0_otg_en>;
+	status = "okay";
+};
+
+&u2phy1 {
+	status = "okay";
+};
+
+&u2phy1_otg {
+	phy-supply = <&vcc5v0_host>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-0 = <&uart2m0_xfer>;
+	status = "okay";
+};
+
+&uart9 {
+	pinctrl-0 = <&uart9m0_xfer &uart9m0_ctsn &uart9m0_rtsn>;
+	pinctrl-names = "default";
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm43438-bt";
+		clocks = <&hym8563>;
+		clock-names = "lpo";
+		device-wakeup-gpios = <&gpio0 RK_PC5 GPIO_ACTIVE_HIGH>;
+		interrupt-parent = <&gpio0>;
+		interrupts = <RK_PA0 IRQ_TYPE_EDGE_FALLING>;
+		pinctrl-0 = <&bt_en>, <&bt_wake_host>, <&bt_wake>;
+		pinctrl-names = "default";
+		shutdown-gpios = <&gpio0 RK_PC6 GPIO_ACTIVE_HIGH>;
+	};
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
+&usb_host0_xhci {
+	dr_mode = "host";
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
+
+&vp0 {
+	vp0_out_hdmi0: endpoint@ROCKCHIP_VOP2_EP_HDMI0 {
+		reg = <ROCKCHIP_VOP2_EP_HDMI0>;
+		remote-endpoint = <&hdmi0_in_vp0>;
+	};
+};

-- 
2.47.1


