Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 482D3E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 17:19:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0UXADI6UY7cXYvGleWxHIM8xew47tQ78gwJhY3WromA=; b=uUfO9NTZlfXgjKwxSHCBiuAkpb
	YBbuIPvc4FJ4k3bXL6k6LfqkTjh6VWNBaTdySsgTOtwDUUHWUzWTnrtkKqMdcylRIojyZXJDyefAX
	aoVWcwZH6YaTu84rVgTQOGEb0kdxgUKMyT9zmbtvWAInl86JLUJ+8ydGCpYaE/QNAm8no9mtR66rH
	55IvSc9jSavLPHOelmJ0fPcAJuWIKY1hScNqf6IV/UmmanuN8Jh7EvnHMaKBLEwqy4qr+hJW3Q6O/
	t8FQwCtKPLbX9trqwX20Eraw1WwBIvu0t8VwkAOq6rRc4jwrhM9juVYA2O6nGqpE2k4xdTFuy3DL0
	zrpUAIlA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOqu-0000000Axc1-0LSl;
	Thu, 02 Jan 2025 17:19:20 +0000
Received: from mail.netcube.li ([173.249.15.149])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTOpk-0000000AxUy-2ikQ
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 17:18:10 +0000
dkim-signature: v=1; a=rsa-sha256; d=netcube.li; s=s1;
	c=relaxed/relaxed; q=dns/txt; h=From:Subject:Date:Message-ID:To:CC:MIME-Version:Content-Transfer-Encoding:In-Reply-To:References;
	bh=0UXADI6UY7cXYvGleWxHIM8xew47tQ78gwJhY3WromA=;
	b=kM47hqlWhcNHUWu7/1Q0PJmNK2ZmGXBRj1r188MjoX6uq3ueIsqYGsjXmgbGfQrn7hQhU8HmxqMkLLPB2cKrg1XjXMp6rawDV/rglgt2Cjzq5lpRL+VKzaxulfOQnmRs5wvoc7+CRA7op1jNECe2NGdhbCMyRCIYi3PM6Jgc66U=
Received: from 854af3ed5e24.lan.sk100508.local (cm70-231.liwest.at [212.241.70.231])
	by mail.netcube.li with ESMTPA
	; Thu, 2 Jan 2025 18:17:44 +0100
From: Lukas Schmid <lukas.schmid@netcube.li>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Maxime Ripard <mripard@kernel.org>
Cc: Lukas Schmid <lukas.schmid@netcube.li>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org
Subject: [PATCH 3/3] ARM: dts: sunxi: add support for NetCube Systems Kumquat
Date: Thu,  2 Jan 2025 17:14:21 +0000
Message-Id: <20250102171424.3644-1-lukas.schmid@netcube.li>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
References: <32b5c286-9457-4b93-a93f-c8aff356ec10@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_091808_991059_772919C3 
X-CRM114-Status: GOOD (  17.20  )
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

NetCube Systems Kumquat is a board based on the Allwinner V3s SoC,
including:

- 64MB DDR2 included in SoC
- 10/100 Mbps Ethernet
- USB-C DRD
- Audio Codec
- Isolated CAN-FD
- ESP32 over SDIO
- 8MB SPI-NOR Flash for bootloader
- I2C EEPROM for MAC addresses
- SDIO Connector for eMMC or SD-Card
- 8x 12/24V IOs, 4x normally open relays
- DS3232 RTC
- QWIIC connectors for external I2C devices

Signed-off-by: Lukas Schmid <lukas.schmid@netcube.li>
---
 arch/arm/boot/dts/allwinner/Makefile          |   2 +
 .../allwinner/sun8i-v3s-netcube-kumquat.dts   | 286 ++++++++++++++++++
 arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi    |   6 +
 3 files changed, 294 insertions(+)
 create mode 100644 arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts

diff --git a/arch/arm/boot/dts/allwinner/Makefile b/arch/arm/boot/dts/allwinner/Makefile
index 48666f73e638..d799ad153b37 100644
--- a/arch/arm/boot/dts/allwinner/Makefile
+++ b/arch/arm/boot/dts/allwinner/Makefile
@@ -199,6 +199,7 @@ DTC_FLAGS_sun8i-h3-nanopi-r1 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc := -@
 DTC_FLAGS_sun8i-h3-bananapi-m2-plus-v1.2 := -@
 DTC_FLAGS_sun8i-h3-orangepi-pc-plus := -@
+DTC_FLAGS_sun8i-v3s-netcube-kumquat := -@
 dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-a23-evb.dtb \
 	sun8i-a23-gt90h-v4.dtb \
@@ -261,6 +262,7 @@ dtb-$(CONFIG_MACH_SUN8I) += \
 	sun8i-v3s-anbernic-rg-nano.dtb \
 	sun8i-v3s-licheepi-zero.dtb \
 	sun8i-v3s-licheepi-zero-dock.dtb \
+	sun8i-v3s-netcube-kumquat.dtb \
 	sun8i-v40-bananapi-m2-berry.dtb
 dtb-$(CONFIG_MACH_SUN9I) += \
 	sun9i-a80-optimus.dtb \
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
new file mode 100644
index 000000000000..e3e34d904c23
--- /dev/null
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s-netcube-kumquat.dts
@@ -0,0 +1,286 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (C) 2025 Lukas Schmid <lukas.schmid@netcube.li>
+ */
+
+/dts-v1/;
+#include "sun8i-v3s.dtsi"
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/gpio/gpio.h>
+
+/{
+	model = "NetCube Systems Kumquat";
+	compatible = "netcube,kumquat", "allwinner,sun8i-v3s";
+
+	aliases {
+		serial0 = &uart0;
+		ethernet0 = &emac;
+		rtc0 = &ds3232;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-heartbeat {
+			gpios = <&pio 4 4 GPIO_ACTIVE_HIGH>; /* PE4 */
+			linux,default-trigger = "heartbeat";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_HEARTBEAT;
+		};
+
+		led-mmc0-act {
+			gpios = <&pio 5 6 GPIO_ACTIVE_HIGH>; /* PF6 */
+			linux,default-trigger = "mmc0";
+			color = <LED_COLOR_ID_GREEN>;
+			function = LED_FUNCTION_DISK;
+		};
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys";
+		autorepeat;
+
+		key-user {
+			label = "GPIO Key User";
+			linux,code = <KEY_PROG1>;
+			gpios = <&pio 1 2 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PB2 */
+		};
+	};
+
+	/* K7805-1000R3 Switching Regulator supplied from main 12/24V terminal block */
+	reg_vcc5v0: regulator-5v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+	};
+
+	/* EA3036C Switching 3 Channel Regulator - Channel 2 */
+	reg_vcc3v3: regulator-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vcc5v0>;
+	};
+
+	/* XC6206-3.0 Linear Regualtor */
+	reg_vcc3v0: regulator-3v0 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc3v0";
+		regulator-min-microvolt = <3000000>;
+		regulator-max-microvolt = <3000000>;
+		vin-supply = <&reg_vcc3v3>;
+	};
+
+	/* 40 MHz Crystal Oscillator on PCB */
+	clk_can0: clock-can0 {
+		compatible = "fixed-clock";
+		#clock-cells = <0>;
+		clock-frequency  = <40000000>;
+	};
+};
+
+&mmc0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc0_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+&mmc1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&mmc1_pins>;
+	vmmc-supply = <&reg_vcc3v3>;
+	bus-width = <4>;
+	broken-cd;
+	status = "okay";
+};
+
+&usb_otg {
+	extcon = <&tusb320 0>;
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_id_det-gpios = <&pio 1 4 GPIO_ACTIVE_HIGH>; /* PB4 */
+	status = "okay";
+};
+
+&ehci {
+	status = "okay";
+};
+
+&ohci {
+	status = "okay";
+};
+
+&lradc {
+	vref-supply = <&reg_vcc3v0>;
+	status = "okay";
+};
+
+&codec {
+	allwinner,audio-routing =
+		"Headphone", "HP",
+		"Headphone", "HPCOM",
+		"MIC1", "Mic",
+		"Mic", "HBIAS";
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-0 = <&uart0_pb_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-0 = <&uart1_pe_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-0 = <&i2c0_pins>;
+	pinctrl-names = "default";
+	status = "okay";
+
+	eeprom0: eeprom@50 {
+		compatible = "atmel,24c02";		/* actually it's a 24AA02E48 */
+		pagesize = <16>;
+		read-only;
+		reg = <0x50>;
+		vcc-supply = <&reg_vcc3v3>;
+
+		#address-cells = <1>;
+		#size-cells = <1>;
+
+		eth0_macaddress: macaddress@fa {
+			reg = <0xfa 0x06>;
+		};
+	};
+
+	tusb320: typec@60 {
+		compatible = "ti,tusb320";
+		reg = <0x60>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 5 IRQ_TYPE_EDGE_FALLING>;
+	};
+
+	ds3232: rtc@68 {
+		compatible = "dallas,ds3232";
+		reg = <0x68>;
+	};
+};
+
+&emac {
+	allwinner,leds-active-low;
+	nvmem-cells = <&eth0_macaddress>;		/* custom nvmem reference */
+	nvmem-cell-names = "mac-address";		/* see ethernet-controller.yaml */
+	status = "okay";
+};
+
+&spi0 {
+	#address-cells = <1>;
+	#size-cells = <0>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&spi0_pins>;
+	cs-gpios = <0>, <&pio 1 0 GPIO_ACTIVE_LOW>; /* PB0 */
+	status = "okay";
+
+	flash@0 {
+		#address-cells = <1>;
+		#size-cells = <1>;
+		compatible = "jedec,spi-nor";
+		reg = <0>;
+		label = "firmware";
+		spi-max-frequency = <40000000>;
+	};
+
+	can@1 {
+		compatible = "microchip,mcp2518fd";
+		reg = <1>;
+		clocks = <&clk_can0>;
+		interrupt-parent = <&pio>;
+		interrupts = <1 1 IRQ_TYPE_LEVEL_LOW>;  /* PB1 */
+		spi-max-frequency = <20000000>;
+		vdd-supply = <&reg_vcc3v3>;
+		xceiver-supply = <&reg_vcc3v3>;
+	};
+};
+
+&pio {
+	vcc-pb-supply = <&reg_vcc3v3>;
+	vcc-pc-supply = <&reg_vcc3v3>;
+	vcc-pe-supply = <&reg_vcc3v3>;
+	vcc-pf-supply = <&reg_vcc3v3>;
+	vcc-pg-supply = <&reg_vcc3v3>;
+
+	gpio-reserved-ranges = <0 32>, <42 22>, <68 28>, <96 32>, <153 7>, <167 25>, <198 26>;
+	gpio-line-names = "", "", "", "", // PA
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "", 
+			  "CAN_nCS", "CAN_nINT", "USER_SW", "PB3", // PB
+			  "USB_ID", "USBC_nINT", "I2C0_SCL", "I2C0_SDA",
+			  "UART0_TX", "UART0_RX", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "SPI_MISO", "SPI_SCK", "FLASH_nCS", "SPI_MOSI", // PC
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "", 
+			  "", "", "", "", // PD
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "Q12", "Q11", "Q10", "Q9", // PE
+			  "LED_SYS0", "I1", "Q1", "Q2",
+			  "I2", "I3", "Q3", "Q4",
+			  "I4", "I5", "Q5", "Q6",
+			  "I6", "I7", "Q7", "Q8",
+			  "I8", "UART1_TXD", "UART1_RXD", "ESP_nRST",
+			  "ESP_nBOOT", "", "", "",
+			  "", "", "", "",
+			  "SD_D1", "SD_D0", "SD_CLK", "SD_CMD", // PF
+			  "SD_D3", "SD_D2", "LED_SYS1", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "ESP_CLK", "ESP_CMD", "ESP_D0", "ESP_D1", // PG
+			  "ESP_D2", "ESP_D3", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "",
+			  "", "", "", "";
+};
diff --git a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
index 9e13c2aa8911..f909b1d4dbca 100644
--- a/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
+++ b/arch/arm/boot/dts/allwinner/sun8i-v3s.dtsi
@@ -416,6 +416,12 @@ uart0_pb_pins: uart0-pb-pins {
 				function = "uart0";
 			};
 
+			/omit-if-no-ref/
+			uart1_pe_pins: uart1-pe-pins {
+				pins = "PE21", "PE22";
+				function = "uart1";
+			};
+
 			uart2_pins: uart2-pins {
 				pins = "PB0", "PB1";
 				function = "uart2";
-- 
2.47.1



