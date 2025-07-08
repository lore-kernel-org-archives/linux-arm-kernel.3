Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DD169C8303C
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 23:01:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=eowzcy8ITG2aagOcds6bHgFeKHO9g+RqlX3pgIIMC1E=; b=FarFS7YnDMA4w6SznMKBkLSwwt
	n8NZQCYmuF3y4JYTa3ldyTo4mxTwZCoKhfIoHhdC2SwZspgx5DzZATYZK1LqMunfQux2DNNHueu4F
	4fvzI0JCnr7hnqJUvxBUE9kqhKTnL5S2VyGYbcWnCtFohUP3hkrWqindIEF92BqT0dR34P8yUMBiM
	SS0bHMLwgBt8pT4nUo/X9oO4waUa/y70adQWGZvVaOPJRd5DTHPemeLsZ8Y2UCi5YBheFTQiFTmkq
	t6KijLQnTiqsn5QICrZy5wm5iPIrzBCVwGYbkQ9ElMHU9pTVNzHUiCnTVboFLNxoBMMP8J93F0w9W
	PuvTUJLg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZHJl-00000006r8L-1He3;
	Tue, 08 Jul 2025 23:01:41 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZH8N-00000006pja-1eai
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 22:49:56 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: MIME-Version: References: In-Reply-To:
 Message-ID: Date: Subject: Cc: To: From; q=dns/txt; s=fe-e1b5cab7be;
 t=1752014994; bh=eowzcy8ITG2aagOcds6bHgFeKHO9g+RqlX3pgIIMC1E=;
 b=cmItHPxJNuh1ml+TNMbB4w/Hp8QdbV5fajDiEc+ZYNJk3E9B1b5a/ZzQgZVHZ+vMlolm/pKJ6
 XMn6m0bAhU6Ihn04LyDBUfSmDOL1ektSinymnQcZEeQI4u6F9rLSOli/0FYVOiadZsAuv4EKCTw
 kExkBG8d9cvB4MAHA2dpwPYI6+yFfSxiQE6SwiyjdCU/KiTTYwl84XCRikRhdwhV7+AznWIFtCs
 ws+1TS/qlgzcol/vb/BifiGL301+BnQJ8yEc1bR42ELh6ThLEWDa0Thnd9i6AubZCZ/K04hUHcR
 9ofuob8rPR/h5jTnJkRqsMcjsdpz5lj3jPItB65ctMQQ==
X-Forward-Email-ID: 686da09075317ad3cfdad41c
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 1.1.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
From: Jonas Karlman <jonas@kwiboo.se>
To: Heiko Stuebner <heiko@sntech.de>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>,
	Chukun Pan <amadeus@jmu.edu.cn>,
	linux-rockchip@lists.infradead.org,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Jonas Karlman <jonas@kwiboo.se>
Subject: [PATCH 4/6] arm64: dts: rockchip: Add ArmSoM Sige1
Date: Tue,  8 Jul 2025 22:48:54 +0000
Message-ID: <20250708224921.2254116-5-jonas@kwiboo.se>
X-Mailer: git-send-email 2.49.0
In-Reply-To: <20250708224921.2254116-1-jonas@kwiboo.se>
References: <20250708224921.2254116-1-jonas@kwiboo.se>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_154955_464488_81E728B7 
X-CRM114-Status: GOOD (  13.97  )
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

The Sige1 is a single board computer developed by ArmSoM, based on the
Rockchip RK3528A SoC.

Add initial device tree for the ArmSoM Sige1 board.

Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
---
Schematics: https://drive.google.com/drive/folders/15uvc2lcOAKP0enXezASUhVFLuzkq3IEX
---
 arch/arm64/boot/dts/rockchip/Makefile         |   1 +
 .../boot/dts/rockchip/rk3528-armsom-sige1.dts | 449 ++++++++++++++++++
 2 files changed, 450 insertions(+)
 create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts

diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
index d0d21f5029ea..e86131b03692 100644
--- a/arch/arm64/boot/dts/rockchip/Makefile
+++ b/arch/arm64/boot/dts/rockchip/Makefile
@@ -89,6 +89,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-screen.dtbo
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
+dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
 dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2f.dtb
diff --git a/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
new file mode 100644
index 000000000000..15d8d32572e8
--- /dev/null
+++ b/arch/arm64/boot/dts/rockchip/rk3528-armsom-sige1.dts
@@ -0,0 +1,449 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+
+/dts-v1/;
+
+#include <dt-bindings/input/input.h>
+#include <dt-bindings/leds/common.h>
+#include <dt-bindings/pwm/pwm.h>
+#include "rk3528.dtsi"
+
+/ {
+	model = "ArmSoM Sige1";
+	compatible = "armsom,sige1", "rockchip,rk3528";
+
+	aliases {
+		ethernet0 = &gmac1;
+		i2c0 = &i2c0;
+		mmc0 = &sdhci;
+		mmc1 = &sdmmc;
+		mmc2 = &sdio0;
+		serial0 = &uart0;
+		serial2 = &uart2;
+	};
+
+	chosen {
+		stdout-path = "serial0:1500000n8";
+	};
+
+	adc-keys {
+		compatible = "adc-keys";
+		io-channels = <&saradc 0>;
+		io-channel-names = "buttons";
+		keyup-threshold-microvolt = <1800000>;
+		poll-interval = <100>;
+
+		button-maskrom {
+			label = "MASKROM";
+			linux,code = <KEY_SETUP>;
+			press-threshold-microvolt = <0>;
+		};
+	};
+
+	leds {
+		compatible = "gpio-leds";
+		pinctrl-names = "default";
+		pinctrl-0 = <&g_led>, <&r_led>;
+
+		led-green {
+			color = <LED_COLOR_ID_GREEN>;
+			default-state = "on";
+			function = LED_FUNCTION_HEARTBEAT;
+			gpios = <&gpio3 RK_PB3 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "heartbeat";
+		};
+
+		led-red {
+			color = <LED_COLOR_ID_RED>;
+			default-state = "on";
+			function = LED_FUNCTION_STATUS;
+			gpios = <&gpio3 RK_PB2 GPIO_ACTIVE_HIGH>;
+			linux,default-trigger = "default-on";
+		};
+	};
+
+	vcc0v6_ddr: regulator-0v6-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc0v6_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <600000>;
+		regulator-max-microvolt = <600000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_0v9: regulator-0v9-vdd {
+		compatible = "regulator-fixed";
+		regulator-name = "vdd_0v9";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <900000>;
+		regulator-max-microvolt = <900000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_ddr: regulator-1v1-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1100000>;
+		regulator-max-microvolt = <1100000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_1v8: regulator-1v8-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_1v8";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc1v8_ddr: regulator-1v8-vcc-ddr {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc1v8_ddr";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_3v3: regulator-3v3-vcc {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_3v3";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_dcin>;
+	};
+
+	vcc3v3_sd: regulator-3v3-vcc-sd {
+		compatible = "regulator-fixed";
+		gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_pwren_l>;
+		regulator-name = "vcc3v3_sd";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&vcc_3v3>;
+	};
+
+	vcc5v0_sys: regulator-5v0-vcc-sys {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc5v0_sys";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc_dcin>;
+	};
+
+	vcc5v0_usb1_host: regulator-5v0-vcc-usb1-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PB1 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb20_host1_drv_h>;
+		regulator-name = "vcc5v0_usb1_host";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_usb2_host: regulator-5v0-vcc-usb2-host {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio4 RK_PB0 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb20_host2_drv_h>;
+		regulator-name = "vcc5v0_usb2_host";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc5v0_usb_otg: regulator-5v0-vcc-usb-otg {
+		compatible = "regulator-fixed";
+		enable-active-high;
+		gpios = <&gpio1 RK_PB4 GPIO_ACTIVE_HIGH>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&usb20_otg0_drv_h>;
+		regulator-name = "vcc5v0_usb_otg";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vcc_dcin: regulator-vcc-dcin {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc_dcin";
+		regulator-always-on;
+		regulator-boot-on;
+	};
+
+	vccio_sd: regulator-vccio-sd {
+		compatible = "regulator-gpio";
+		gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
+		regulator-name = "vccio_sd";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		states = <1800000 0x0>, <3300000 0x1>;
+		vin-supply = <&vcc5v0_sys>;
+	};
+
+	vdd_arm: regulator-vdd-arm {
+		compatible = "pwm-regulator";
+		pwms = <&pwm3 0 5000 PWM_POLARITY_INVERTED>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_arm";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <746000>;
+		regulator-max-microvolt = <1201000>;
+		regulator-settling-time-up-us = <250>;
+	};
+
+	vdd_logic: regulator-vdd-logic {
+		compatible = "pwm-regulator";
+		pwms = <&pwm2 0 5000 PWM_POLARITY_INVERTED>;
+		pwm-supply = <&vcc5v0_sys>;
+		regulator-name = "vdd_logic";
+		regulator-always-on;
+		regulator-boot-on;
+		regulator-min-microvolt = <705000>;
+		regulator-max-microvolt = <1006000>;
+		regulator-settling-time-up-us = <250>;
+	};
+
+	rfkill {
+		compatible = "rfkill-gpio";
+		label = "rfkill-wlan";
+		pinctrl-names = "default";
+		pinctrl-0 = <&wifi_reg_on_h>;
+		radio-type = "wlan";
+		shutdown-gpios = <&gpio1 RK_PA6 GPIO_ACTIVE_HIGH>;
+	};
+
+	rfkill-bt {
+		compatible = "rfkill-gpio";
+		label = "rfkill-bt";
+		pinctrl-names = "default";
+		pinctrl-0 = <&bt_reg_on_h>;
+		radio-type = "bluetooth";
+		shutdown-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu1 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu2 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&cpu3 {
+	cpu-supply = <&vdd_arm>;
+};
+
+&gmac1 {
+	clock_in_out = "output";
+	phy-handle = <&rgmii_phy>;
+	phy-mode = "rgmii-id";
+	phy-supply = <&vcc_3v3>;
+	pinctrl-names = "default";
+	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
+		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>;
+	status = "okay";
+};
+
+&gpu {
+	mali-supply = <&vdd_logic>;
+	status = "okay";
+};
+
+&i2c0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&i2c0m0_xfer>;
+	status = "okay";
+
+	hym8563: rtc@51 {
+		compatible = "haoyu,hym8563";
+		reg = <0x51>;
+		#clock-cells = <0>;
+		clock-output-names = "hym8563";
+		interrupt-parent = <&gpio4>;
+		interrupts = <RK_PA0 IRQ_TYPE_LEVEL_LOW>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&rtc_int_l>;
+		wakeup-source;
+	};
+};
+
+&mdio1 {
+	rgmii_phy: ethernet-phy@1 {
+		compatible = "ethernet-phy-ieee802.3-c22";
+		reg = <0x1>;
+		pinctrl-names = "default";
+		pinctrl-0 = <&gmac1_rstn_l>;
+		reset-assert-us = <20000>;
+		reset-deassert-us = <100000>;
+		reset-gpios = <&gpio4 RK_PB5 GPIO_ACTIVE_LOW>;
+	};
+};
+
+&pinctrl {
+	bluetooth {
+		bt_reg_on_h: bt-reg-on-h {
+			rockchip,pins = <1 RK_PC1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		bt_wake_host_h: bt-wake-host-h {
+			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+
+		host_wake_bt_h: host-wake-bt-h {
+			rockchip,pins = <3 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	ethernet {
+		gmac1_rstn_l: gmac1-rstn-l {
+			rockchip,pins = <4 RK_PB5 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	leds {
+		g_led: g-led {
+			rockchip,pins = <3 RK_PB3 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		r_led: r-led {
+			rockchip,pins = <3 RK_PB2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	rtc {
+		rtc_int_l: rtc-int-l {
+			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
+		};
+	};
+
+	sdmmc {
+		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
+			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		sdmmc_pwren_l: sdmmc-pwren-l {
+			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	usb {
+		usb20_host1_drv_h: usb20-host1-drv-h {
+			rockchip,pins = <4 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb20_host2_drv_h: usb20-host2-drv-h {
+			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		usb20_otg0_drv_h: usb20-otg0-drv-h {
+			rockchip,pins = <1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+	};
+
+	wifi {
+		wifi_reg_on_h: wifi-reg-on-h {
+			rockchip,pins = <1 RK_PA6 RK_FUNC_GPIO &pcfg_pull_none>;
+		};
+
+		wifi_wake_host_h: wifi-wake-host-h {
+			rockchip,pins = <1 RK_PA7 RK_FUNC_GPIO &pcfg_pull_down>;
+		};
+	};
+};
+
+&pwm2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm2m0_pins>;
+	status = "okay";
+};
+
+&pwm3 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&pwm3m0_pins>;
+	status = "okay";
+};
+
+&saradc {
+	vref-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdhci {
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-hs200-1_8v;
+	no-sd;
+	no-sdio;
+	non-removable;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdio0 {
+	bus-width = <4>;
+	cap-sd-highspeed;
+	cap-sdio-irq;
+	disable-wp;
+	keep-power-in-suspend;
+	no-mmc;
+	no-sd;
+	non-removable;
+	pinctrl-names = "default";
+	pinctrl-0 = <&sdio0_bus4>, <&sdio0_clk>, <&sdio0_cmd>, <&clkm1_32k_out>;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc_3v3>;
+	vqmmc-supply = <&vcc_1v8>;
+	status = "okay";
+};
+
+&sdmmc {
+	bus-width = <4>;
+	cap-mmc-highspeed;
+	cap-sd-highspeed;
+	disable-wp;
+	sd-uhs-sdr104;
+	vmmc-supply = <&vcc3v3_sd>;
+	vqmmc-supply = <&vccio_sd>;
+	status = "okay";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0m0_xfer>;
+	status = "okay";
+};
+
+&uart2 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart2m1_xfer>, <&uart2m1_ctsn>, <&uart2m1_rtsn>;
+	uart-has-rtscts;
+	status = "okay";
+};
-- 
2.49.0


