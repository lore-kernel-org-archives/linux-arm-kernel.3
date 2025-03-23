Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5E2F0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Mar 2025 12:46:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Reply-To:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:Cc:To:In-Reply-To:
	References:Message-Id:Content-Transfer-Encoding:Content-Type:MIME-Version:
	Subject:Date:From:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Yj6b42PiQqXL41DOBIL3EssC87fbu3EAZxYc7TENF3U=; b=RwBZEu7cQ1YDFSBp08/n0V9/u8
	2IYP+3ICncSVAt0g+//PbbyiBiHtnju8vwwP7m0J9x1BxrNXQzOC36GgKW3+93m5ixXJ55ZwJFi9q
	kSRh2dl8l+b2q6oeWtNoVBF2PdQekSptW1zU4cRweGoa7Pc7gvREoODRPJgAS64ZLmFzIMm/StI2v
	oFw21Z5n6l0e/+luoWqY9RhFA5qieBFkGPhDMVBURuIHXZaC1i88F0eln2GuhT+J/hu9nAIiAGBgc
	DDRWmszFtEKSgFmF3hJjor54878AMUXB0Yr3rcUoo12aF9ifolAfRvOTYrcHr+8eIpyaHZJZm/nC5
	XyUxTxqg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twKiw-00000001Cri-1yyn;
	Sun, 23 Mar 2025 12:46:42 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twKat-00000001BmK-3SM5;
	Sun, 23 Mar 2025 12:38:26 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id AA7CBA48731;
	Sun, 23 Mar 2025 12:32:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPS id 6C73BC4CEEE;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742733502;
	bh=WXZBvUNpLqj7CE01EVJ9STMr0ipIfAnh3GhfPcVHupc=;
	h=From:Date:Subject:References:In-Reply-To:To:Cc:Reply-To:From;
	b=EtH150yS4L2dZnywKCOvUFktbKXENicvT1voKAqjpI1B80oKU6DLTCeySykmlNt0E
	 lZftcC79mXTnRLiVwJkbXryeEu3aEVrKBZtFiS4uFl8v2/voRfop8E0314taOsKHdh
	 9/P0KH0lQjDNO7J1/mxN3MP+2bYsPkJ7D+qKVymSJ8hRXPlZYWphWFPBzWhbr1iPdE
	 KPmut9fDUTgYxjXQZk/pw6tE3PJ+gYdgKjO8dSsYre7sGRbTbqe1PKdg6YR+w1Q7oJ
	 m+qlvS3uC5kz+vQprb4AG+M1otjamrre/TEnlXKCNrpv1oLoQ2mAYRfpeMxxRPLBE8
	 xYgcq+EnfIvWQ==
Received: from aws-us-west-2-korg-lkml-1.web.codeaurora.org (localhost.localdomain [127.0.0.1])
	by smtp.lore.kernel.org (Postfix) with ESMTP id 5C1A4C3600C;
	Sun, 23 Mar 2025 12:38:22 +0000 (UTC)
From: =?utf-8?q?J=2E_Neusch=C3=A4fer_via_B4_Relay?= <devnull+j.ne.posteo.net@kernel.org>
Date: Sun, 23 Mar 2025 13:37:52 +0100
Subject: [PATCH 3/3] ARM: dts: amlogic: Add TCU Fernsehfee 3.0
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
Message-Id: <20250323-fernsehfee-v1-3-2621341cd37a@posteo.net>
References: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
In-Reply-To: <20250323-fernsehfee-v1-0-2621341cd37a@posteo.net>
To: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 Conor Dooley <conor+dt@kernel.org>, 
 Neil Armstrong <neil.armstrong@linaro.org>, 
 Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
 Jerome Brunet <jbrunet@baylibre.com>, Kevin Hilman <khilman@baylibre.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
 linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
 =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-Mailer: b4 0.14.2
X-Developer-Signature: v=1; a=ed25519-sha256; t=1742733500; l=7003;
 i=j.ne@posteo.net; s=20240329; h=from:subject:message-id;
 bh=CRTxKSaqOs4QahTgYoU3CL/n6Ja8DUjhizoM0f/ZdlY=;
 b=CZVV61NDm96d+7CJNVbC5FrL5FSH6xdjd9xHnwVQz9HPH9Znb6feSAwXeBSND5la9q7jKHoKB
 JIp19v1CT/ODhiPiqeLLz51EghaMnNPjxAo9LoR00kAY4H4otnu+h3A
X-Developer-Key: i=j.ne@posteo.net; a=ed25519;
 pk=NIe0bK42wNaX/C4bi6ezm7NJK0IQE+8MKBm7igFMIS4=
X-Endpoint-Received: by B4 Relay for j.ne@posteo.net/20240329 with
 auth_id=156
X-Original-From: =?utf-8?q?J=2E_Neusch=C3=A4fer?= <j.ne@posteo.net>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250323_053824_009639_6E2159DE 
X-CRM114-Status: GOOD (  15.15  )
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
Reply-To: j.ne@posteo.net
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

From: "J. Neuschäfer" <j.ne@posteo.net>

Fernsehfee[1] ("TV fairy") 3.0 is a set-top box with HDMI input and
output ports. It originally ran Android 4.4 and a Linux 3.10 kernel.

The following features are tested and known to work:

- Ethernet
- Power LED (switching between green and red)
- Power button
- eMMC
- SD Card
- USB
- Wifi

The following features are untested or not working:

- HDMI input and output
- Infrared remote control input and output

[1]: https://fernsehfee.de/ (German), https://telefairy.com/ (English)

Signed-off-by: J. Neuschäfer <j.ne@posteo.net>
---
 arch/arm/boot/dts/amlogic/Makefile               |   1 +
 arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts | 219 +++++++++++++++++++++++
 arch/arm/boot/dts/amlogic/meson8.dtsi            |  18 ++
 3 files changed, 238 insertions(+)

diff --git a/arch/arm/boot/dts/amlogic/Makefile b/arch/arm/boot/dts/amlogic/Makefile
index 504c533b1173298ec7f45099888d88b2fb74b978..3c8a1e88b386cd7fb9b5f41f47d7ff78fe7eeacc 100644
--- a/arch/arm/boot/dts/amlogic/Makefile
+++ b/arch/arm/boot/dts/amlogic/Makefile
@@ -1,6 +1,7 @@
 # SPDX-License-Identifier: GPL-2.0
 dtb-$(CONFIG_MACH_MESON8) += \
 	meson8-minix-neo-x8.dtb \
+	meson8-fernsehfee3.dtb \
 	meson8b-ec100.dtb \
 	meson8b-mxq.dtb \
 	meson8b-odroidc1.dtb \
diff --git a/arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts b/arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts
new file mode 100644
index 0000000000000000000000000000000000000000..47507316ac4a56f2bcf84ad0446a06ea9fe890cd
--- /dev/null
+++ b/arch/arm/boot/dts/amlogic/meson8-fernsehfee3.dts
@@ -0,0 +1,219 @@
+// SPDX-License-Identifier: GPL-2.0-only OR MIT
+// Copyright (C) 2025 J. Neuschäfer <j.ne@posteo.net>
+
+/dts-v1/;
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/input/linux-event-codes.h>
+#include <dt-bindings/leds/common.h>
+
+#include "meson8.dtsi"
+
+/ {
+	model = "Fernsehfee 3.0";
+	compatible = "tcu,fernsehfee3", "amlogic,meson8";
+
+	aliases {
+		serial0 = &uart_AO;
+		gpiochip0 = &gpio;
+		gpiochip1 = &gpio_ao;
+		i2c0 = &i2c_AO;
+		i2c1 = &i2c_B;
+		mmc0 = &sdhc;
+		mmc1 = &sdio;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x40000000>;  /* 1 GiB */
+	};
+
+	gpio-keys {
+		compatible = "gpio-keys-polled";
+		poll-interval = <100>;
+
+		power-button {
+			label = "Power button";
+			linux,code = <KEY_POWER>;
+			gpios = <&gpio_ao GPIOAO_3 GPIO_ACTIVE_LOW>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led-0 {
+			/*
+			 * The power LED can be turned red, otherwise it is green.
+			 */
+			gpios = <&gpio_ao GPIO_TEST_N GPIO_ACTIVE_LOW>;
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_RED>;
+		};
+	};
+
+	vcc_5v: regulator-5v {
+		/* 5V rail, always on as long as the system is running */
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	vcc_3v3: regulator-3v3 {
+		/* Chipown AP2420 step-down converter */
+		compatible = "regulator-fixed";
+		regulator-name = "3.3V";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_5v>;
+	};
+
+	vcc_1v8: regulator-1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "1.8V";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	wifi_3v3: regulator-wifi {
+		compatible = "regulator-fixed";
+		regulator-name = "3.3V-WIFI";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3>;
+		gpio = <&gpio GPIOX_11 GPIO_ACTIVE_HIGH>;
+		enable-active-high;
+	};
+};
+
+&ethmac {
+	status = "okay";
+	pinctrl-0 = <&eth_pins>;
+	pinctrl-names = "default";
+	phy-handle = <&eth_phy0>;
+	phy-mode = "rmii";
+
+	mdio {
+		compatible = "snps,dwmac-mdio";
+		#address-cells = <1>;
+		#size-cells = <0>;
+
+		eth_phy0: ethernet-phy@0 {
+			/* IC Plus IP101A (0x02430c54) */
+			reg = <0>;
+
+			reset-assert-us = <10000>;
+			reset-deassert-us = <10000>;
+			reset-gpios = <&gpio GPIOH_4 GPIO_ACTIVE_LOW>;
+		};
+	};
+};
+
+&i2c_AO {
+	status = "okay";
+	pinctrl-0 = <&i2c_ao_pins>;
+	pinctrl-names = "default";
+
+	pmic@32 {
+		compatible = "ricoh,rn5t618";
+		reg = <0x32>;
+		system-power-controller;
+	};
+
+	eeprom@50 {
+		/* Fairchild FM24C08A */
+		compatible = "atmel,24c08";
+		reg = <0x50>;
+		pagesize = <16>;
+		wp-gpios = <&gpio GPIOH_3 GPIO_ACTIVE_HIGH>;
+		num-addresses = <4>;
+	};
+};
+
+&i2c_B {
+	status = "okay";
+	pinctrl-0 = <&i2c_b_pins>;
+	pinctrl-names = "default";
+
+	/* TODO: SiI9293 HDMI receiver @ 0x39 */
+};
+
+&sdhc {
+	status = "okay";
+	pinctrl-0 = <&sdxc_c_pins>;
+	pinctrl-names = "default";
+
+	/* eMMC */
+	bus-width = <8>;
+	max-frequency = <100000000>;
+
+	disable-wp;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	no-sdio;
+
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+};
+
+&sdio {
+	status = "okay";
+	pinctrl-0 = <&sd_b_pins>;
+
+	/* SD card */
+	sd_card_slot: slot@1 {
+		compatible = "mmc-slot";
+		reg = <1>;
+		status = "okay";
+
+		bus-width = <4>;
+		cap-mmc-highspeed;
+		cap-sd-highspeed;
+		disable-wp;
+
+		cd-gpios = <&gpio CARD_6 GPIO_ACTIVE_LOW>;
+
+		vmmc-supply = <&vcc_3v3>;
+	};
+};
+
+&uart_AO {
+	status = "okay";
+	pinctrl-0 = <&uart_ao_a_pins>;
+	pinctrl-names = "default";
+};
+
+&usb0 {
+	status = "okay";
+};
+
+&usb0_phy {
+	status = "okay";
+};
+
+&usb1 {
+	status = "okay";
+	dr_mode = "host";
+	/*
+	 * This bus features a Realtek RTL8188 2.4GHz WiFi module, with a
+	 * 3.3V supply voltage that must be enabled before use.
+	 */
+	vbus-supply = <&wifi_3v3>;
+};
+
+&usb1_phy {
+	status = "okay";
+};
+
+&ir_receiver {
+	status = "okay";
+	pinctrl-0 = <&ir_recv_pins>;
+	pinctrl-names = "default";
+};
diff --git a/arch/arm/boot/dts/amlogic/meson8.dtsi b/arch/arm/boot/dts/amlogic/meson8.dtsi
index 9ff142d9fe3f4576fdd3230a966c8a6250870de7..300eccbfc0071ce10290be1c496132ac6b6a4dbc 100644
--- a/arch/arm/boot/dts/amlogic/meson8.dtsi
+++ b/arch/arm/boot/dts/amlogic/meson8.dtsi
@@ -477,6 +477,14 @@ gpio: bank@80 {
 			gpio-ranges = <&pinctrl_cbus 0 0 120>;
 		};
 
+		i2c_b_pins: i2c-b {
+			mux {
+				groups = "i2c_sda_b", "i2c_sck_b";
+				function = "i2c_b";
+				bias-disable;
+			};
+		};
+
 		sd_a_pins: sd-a {
 			mux {
 				groups = "sd_d0_a", "sd_d1_a", "sd_d2_a",
@@ -522,6 +530,16 @@ mux {
 			};
 		};
 
+		sdxc_c_pins: sdxc-c {
+			mux {
+				groups = "sdxc_d0_c", "sdxc_d13_c",
+					"sdxc_clk_c", "sdxc_cmd_c",
+					"sdxc_d47_c";
+				function = "sdxc_c";
+				bias_pull_up;
+			};
+		};
+
 		spdif_out_pins: spdif-out {
 			mux {
 				groups = "spdif_out";

-- 
2.48.0.rc1.219.gb6b6757d772



