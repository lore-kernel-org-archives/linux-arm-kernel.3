Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AF1A1C7115B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Jun 2025 19:50:29 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-Id:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bGliekCkUSxtwv391ycRsSX6VrnJSnefV92RxuAv7bA=; b=QjC/YIRflW1/wSqhjfPoBd/RjL
	j3QWIJ1n6+fZ09PPaL9/dZRKm2AkXUJ+MdcEF6UuzxXtyIxOcc/wlttCvf9A00IK+HtxIcEs3rCac
	SGzGytFBdyJUR4qur/HNz2nw/R662egh2bumO3oMaOZ64rK9053IMrm+ArGtmr/y+chLMfDOJMn37
	7yeHdB42UwWPagl6x9adNltRIgApdOE7hOF+TM3i8jV9zJBxDoiMkBdbjRc6EHj3NdFslEjLYvzY0
	xED2dXt1JgJnjhERldY+DezdPG0uaJ2Fp4564JSibTawSlxY/M68bTf98QP0Q+qi7Sz1EKeq6l8DF
	MKJPBq8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSLHJ-0000000E8oi-1jWM;
	Thu, 19 Jun 2025 19:50:29 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uSJ5e-0000000Dn47-0Jns
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Jun 2025 17:30:19 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 193F0A54703;
	Thu, 19 Jun 2025 17:30:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8995AC4CEED;
	Thu, 19 Jun 2025 17:30:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750354216;
	bh=8qN3ZWTgWx6RQQNb7WkxIy/wj+YIJ7Mkr+3TW7ilrvo=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=XYEltRB7LR8oIdO4EIZXbS8brVFUGLsfxH3Ib2litRT2FXROnKKyFI2BrLy4kksk+
	 4YZJtcZnpT/eGQsUs8qcjMJteXHZhHw+NuNhEeNIghZTW+KswVxD+9L/f9tinVpED6
	 e4lJ2gaA1dlRgJeDb+zEEO4IhJvGcQeR73hjyUcYWoDjQOJYFWKMrDwnTRPUB5Wp4O
	 Zw8SrrQS+1uy3/718qb2SbgU7/QLydtaCR4J5A6Cutl38nIjUnN5Z+H3E8ZEOOAs17
	 ihNHFswdy14Vk0hge41UQ2hGbTHnIF5R/see86t5PY1+s5OI1ANeA46yNnrZcqUhM+
	 8arqND0syJRpQ==
Received: by wens.tw (Postfix, from userid 1000)
	id 3FE655FFF5; Fri, 20 Jun 2025 01:30:12 +0800 (CST)
From: Chen-Yu Tsai <wens@kernel.org>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej@kernel.org>,
	Samuel Holland <samuel@sholland.org>
Cc: devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	Andre Przywara <andre.przywara@arm.com>
Subject: [PATCH 5/5] arm64: dts: allwinner: t527: Add OrangePi 4A board
Date: Fri, 20 Jun 2025 01:30:07 +0800
Message-Id: <20250619173007.3367034-6-wens@kernel.org>
X-Mailer: git-send-email 2.39.5
In-Reply-To: <20250619173007.3367034-1-wens@kernel.org>
References: <20250619173007.3367034-1-wens@kernel.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250619_103018_263584_AA2310E4 
X-CRM114-Status: GOOD (  21.44  )
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

From: Chen-Yu Tsai <wens@csie.org>

The OrangePi 4A is a typical Raspberry Pi model B sized development
board from Xunlong designed around an Allwinner T527 SoC.

The board has the following features:
- Allwinner T527 SoC
- AXP717B + AXP323 PMICs
- Up to 4GB LPDDR4 DRAM
- micro SD slot
- optional eMMC module
- M.2 slot for PCIe 2.0 x1
- 16 MB SPI-NOR flash
- 4x USB 2.0 type-A ports (one can be used in gadget mode)
- 1x Gigabit ethernet w/ Motorcomm PHY (through yet to be supported GMAC200)
- 3.5mm audio jack via internal audio codec
- HDMI 2.0 output
- eDP, MIPI CSI (2-lane and 4-lane) and MIPI DSI (4-lane) connectors
- USB type-C port purely for power
- AP6256 (Broadcom BCM4345) WiFi 5.0 + BT 5.0
- unsoldered headers for ADC and an additional USB 2.0 host port
- 40-pin GPIO header

Add a device tree for it, enabling all peripherals currently supported.

Signed-off-by: Chen-Yu Tsai <wens@csie.org>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 378 ++++++++++++++++++
 2 files changed, 379 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 773cc02a13d0..780aeba0f3a4 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -57,3 +57,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
new file mode 100644
index 000000000000..8a62607e584c
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
@@ -0,0 +1,378 @@
+// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
+/*
+ * Copyright (C) 2025 Chen-Yu Tsai <wens@csie.org>
+ */
+
+/dts-v1/;
+
+#include "sun55i-a523.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/ {
+	model = "OrangePi 4A";
+	compatible = "xunlong,orangepi-4a", "allwinner,sun55i-t527";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	ext_osc32k: ext-osc32k-clk {
+		#clock-cells = <0>;
+		compatible = "fixed-clock";
+		clock-frequency = <32768>;
+		clock-output-names = "ext_osc32k";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		/* PWM capable pin, but PWM isn't supported yet. */
+		led {
+			function = LED_FUNCTION_STATUS;
+			color = <LED_COLOR_ID_GREEN>;
+			gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
+		};
+	};
+
+	wifi_pwrseq: pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&r_pio 1 1 GPIO_ACTIVE_LOW>; /* PM1 */
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "ext_clock";
+	};
+
+	reg_otg_vbus: regulator-otg-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "otg-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v>;
+		gpio = <&r_pio 0 4 GPIO_ACTIVE_HIGH>;	/* PL4 */
+		enable-active-high;
+	};
+
+	reg_pcie_vcc3v3: regulator-pcie-vcc3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-pcie-3v3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&reg_vcc5v>;
+		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>;	/* PL8 */
+		enable-active-high;
+	};
+
+	reg_usb_vbus: regulator-usb-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v>;
+		gpio = <&r_pio 0 12 GPIO_ACTIVE_HIGH>;	/* PL12 */
+		enable-active-high;
+	};
+
+	reg_vcc5v: regulator-vcc5v {
+		/* board wide 5V supply from USB type-C port */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+};
+
+&ehci0 {
+	status = "okay";
+};
+
+&ehci1 {
+	status = "okay";
+};
+
+&mmc0 {
+	vmmc-supply = <&reg_cldo3>;
+	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc1 {
+	bus-width = <4>;
+	mmc-pwrseq = <&wifi_pwrseq>;
+	non-removable;
+	vmmc-supply = <&reg_dldo1_323>;
+	vqmmc-supply = <&reg_bldo1>;
+	status = "okay";
+
+	brcmf: wifi@1 {
+		compatible = "brcm,bcm4329-fmac";
+		reg = <1>;
+		interrupt-parent = <&r_pio>;
+		interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
+		interrupt-names = "host-wake";
+	};
+};
+
+&mmc2 {
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	vmmc-supply = <&reg_cldo3>;
+	vqmmc-supply = <&reg_cldo1>;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
+};
+
+&ohci1 {
+	status = "okay";
+};
+
+&pio {
+	vcc-pb-supply = <&reg_cldo3>;	/* via VCC-IO */
+	vcc-pc-supply = <&reg_cldo1>;
+	vcc-pd-supply = <&reg_cldo3>;
+	vcc-pe-supply = <&reg_aldo2>;
+	vcc-pf-supply = <&reg_cldo3>;	/* VCC-IO for 3.3v; VCC-MCSI for 1.8v */
+	vcc-pg-supply = <&reg_bldo1>;
+	vcc-ph-supply = <&reg_cldo3>;	/* via VCC-IO */
+	vcc-pi-supply = <&reg_cldo3>;
+	vcc-pj-supply = <&reg_cldo1>;
+	vcc-pk-supply = <&reg_cldo1>;
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp717: pmic@35 {
+		compatible = "x-powers,axp717";
+		reg = <0x35>;
+		interrupt-controller;
+		#interrupt-cells = <1>;
+		interrupts-extended = <&nmi_intc 0 IRQ_TYPE_LEVEL_LOW>;
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+		vin4-supply = <&reg_vcc5v>;
+		aldoin-supply = <&reg_vcc5v>;
+		bldoin-supply = <&reg_vcc5v>;
+		cldoin-supply = <&reg_vcc5v>;
+
+		regulators {
+			/* Supplies the "little" cluster (1.4 GHz cores) */
+			reg_dcdc1: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-name = "vdd-cpul";
+			};
+
+			reg_dcdc2: dcdc2 {
+				regulator-always-on;
+				regulator-min-microvolt = <920000>;
+				regulator-max-microvolt = <920000>;
+				regulator-name = "vdd-gpu-sys";
+			};
+
+			reg_dcdc3: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <1160000>;
+				regulator-max-microvolt = <1160000>;
+				regulator-name = "vcc-dram";
+			};
+
+			reg_dcdc4: dcdc4 {
+				/* feeds 3.3V pin on GPIO header */
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vdd-io";
+			};
+
+			reg_aldo1: aldo1 {
+				regulator-name = "avdd-csi";
+			};
+
+			reg_aldo2: aldo2 {
+				regulator-name = "vcc-pe";
+			};
+
+			reg_aldo3: aldo3 {
+				/* supplies the I2C pins for this PMIC */
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-pl-usb";
+			};
+
+			reg_aldo4: aldo4 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pll-dxco-avcc";
+			};
+
+			reg_bldo1: bldo1 {
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pg-wifi";
+			};
+
+			reg_bldo2: bldo2 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-pm-lpddr";
+			};
+
+			reg_bldo3: bldo3 {
+				regulator-name = "dvdd-csi";
+			};
+
+			reg_bldo4: bldo4 {
+				/* not connected */
+			};
+
+			reg_cldo1: cldo1 {
+				regulator-always-on;
+				regulator-min-microvolt = <1800000>;
+				regulator-max-microvolt = <1800000>;
+				regulator-name = "vcc-cvp-pc-lvds-mcsi-pk-efuse-pcie-edp-1v8";
+			};
+
+			reg_cldo2: cldo2 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc3v3-csi";
+			};
+
+			reg_cldo3: cldo3 {
+				regulator-always-on;
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-io-mmc-nand-pd-pi-usb";
+			};
+
+			reg_cldo4: cldo4 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-3v3-phy1-lcd";
+			};
+
+			reg_cpusldo: cpusldo {
+				/* supplies the management core */
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd-cpus";
+			};
+		};
+	};
+
+	axp323: pmic@36 {
+		compatible = "x-powers,axp323";
+		reg = <0x36>;
+		#interrupt-cells = <1>;
+		interrupt-controller;
+		status = "okay";
+
+		vin1-supply = <&reg_vcc5v>;
+		vin2-supply = <&reg_vcc5v>;
+		vin3-supply = <&reg_vcc5v>;
+
+		regulators {
+			reg_aldo1_323: aldo1 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-wifi";
+			};
+
+			reg_dldo1_323: dldo1 {
+				regulator-min-microvolt = <3300000>;
+				regulator-max-microvolt = <3300000>;
+				regulator-name = "vcc-wifi2";
+			};
+
+			/* Supplies the "big" cluster (1.8 GHz cores) */
+			reg_dcdc1_323: dcdc1 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <1150000>;
+				regulator-name = "vdd-cpub";
+			};
+
+			/* DCDC2 is polyphased with DCDC1 */
+
+			/* Some RISC-V management core related voltage */
+			reg_dcdc3_323: dcdc3 {
+				regulator-always-on;
+				regulator-min-microvolt = <900000>;
+				regulator-max-microvolt = <900000>;
+				regulator-name = "vdd-dnr";
+			};
+		};
+	};
+};
+
+&r_pio {
+/*
+ * Specifying the supply would create a circular dependency.
+ *
+ *	vcc-pl-supply = <&reg_aldo3>;
+ */
+	vcc-pm-supply = <&reg_bldo2>;
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&uart1 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
+	uart-has-rtscts;
+	status = "okay";
+
+	bluetooth {
+		compatible = "brcm,bcm4345c5";
+		clocks = <&rtc CLK_OSC32K_FANOUT>;
+		clock-names = "lpo";
+		vbat-supply = <&reg_aldo1_323>;
+		vddio-supply = <&reg_bldo1>;
+		device-wakeup-gpios = <&r_pio 1 3 GPIO_ACTIVE_HIGH>; /* PM3 */
+		host-wakeup-gpios = <&r_pio 1 4 GPIO_ACTIVE_HIGH>; /* PM4 */
+		shutdown-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
+	};
+};
+
+&usb_otg {
+	 /*
+	  * The OTG controller is connected to one of the type-A ports.
+	  * There is a regulator, controlled by a GPIO, to provide VBUS power
+	  * to the port, and a VBUSDET GPIO, to detect externally provided
+	  * power. But without ID or CC pins there is no real way to do a
+	  * runtime role detection.
+	  */
+	dr_mode = "host";
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_otg_vbus>;
+	usb0_vbus_det-gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
+	usb1_vbus-supply = <&reg_usb_vbus>;
+	status = "okay";
+};
-- 
2.39.5


