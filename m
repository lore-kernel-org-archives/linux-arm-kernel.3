Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1FE5C3ABAA
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  5 May 2025 17:13:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=lAoWBXJ0xR4GfuRow16663wvskQIQfdwNMl2ANGijOc=; b=iyl+2oaBHXbMPnqxEJmlq+eutK
	Mo06GI3lyUQZU7lhk76AkGYZYvwfL1R5QI/CaHfzmgxlgFRMYd5C8NSenM2HF1QyEtSREzq0oek2V
	P7gpLeHXf+xb2DzC5k+uO+PGBU1ij/5H46DFbWef2O2j+5AB+nClmZleerBrZQIfznCIE0abphAaC
	xjh1EK3udcsO/eNRxRKpR5R9nC0s/IwK7kXPOqvq3t1kzmOUo+hZC8HH5j/1GRpLivogQpICh3Cke
	YOsBvSeKSSoNLTPYpRWB2bR5tM4nJ1YiFkeV5MABHZQiQrqo6qPvjPA8NJfyKNvE/zjvLnWTktVgb
	g0xEtd3A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uBzNT-0000000876O-3xNr;
	Mon, 05 May 2025 17:13:15 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uByzB-0000000832I-1Trk
	for linux-arm-kernel@lists.infradead.org;
	Mon, 05 May 2025 16:48:10 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 7C9601CDD;
	Mon,  5 May 2025 09:47:55 -0700 (PDT)
Received: from localhost.localdomain (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 5E09D3F673;
	Mon,  5 May 2025 09:48:03 -0700 (PDT)
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Cody Eksal <masterr3c0rd@epochal.quest>,
	Philippe Simons <simons.philippe@gmail.com>,
	devicetree@vger.kernel.org,
	linux-sunxi@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org
Subject: [PATCH 3/3] arm64: dts: allwinner: a100: add Liontron H-A133L board support
Date: Mon,  5 May 2025 17:47:29 +0100
Message-ID: <20250505164729.18175-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.3
In-Reply-To: <20250505164729.18175-1-andre.przywara@arm.com>
References: <20250505164729.18175-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250505_094809_478615_C40CA404 
X-CRM114-Status: GOOD (  17.89  )
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

The H-A133L board is an industrial development board made by Liontron.
It contains a number of dedicated JST connectors, to connect external
peripherals. It features:

- Allwinner A133 SoC (4 * Arm Cortex-A53 cores at up to 1.6 GHz)
- 1 GiB, 2 GiB or 4 GiB of LPDDR4 DRAM
- between 16 and 128 GiB eMMC flash
- AXP707 PMIC (compatible to AXP803)
- 100 Mbit/s RJ45 Ethernet socket, using an JLSemi JL1101 PHY
- XR829 WIFI+Bluetooth chip
- 2 * USB 2.0 USB-A ports, plus three sets of USB pins on connectors
  (connected via a USB hub connected to USB1 on the SoC)
- microSD card slot
- 3.5mm A/V port
- 12V power supply
- connectors for an LVDS or MIPI-DSI panel

Add the devicetree describing the board's peripherals and their
connections.

Despite being a devboard, the manufacturer does not publish a schematic
(I asked), so the PMIC rail assignments were bases on BSP dumps,
educated guesses and some experimentation. Dropping the always-on
property from any of the rails carrying it will make the board hang as
soon as the kernel turns off unused regulators.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../sun50i-a133-liontron-h-a133l.dts          | 214 ++++++++++++++++++
 2 files changed, 215 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index 790aad3a91e86..773cc02a13d04 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -18,6 +18,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-sopine-baseboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a64-teres-i.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-emlid-neutis-n5-devboard.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
new file mode 100644
index 0000000000000..682ed15d84854
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-liontron-h-a133l.dts
@@ -0,0 +1,211 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2025 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a100.dtsi"
+#include "sun50i-a100-cpu-opp.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+#include <dt-bindings/leds/common.h>
+
+/{
+	model = "Liontron H-A133L";
+	compatible = "liontron,h-a133l", "allwinner,sun50i-a100";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	leds {
+		compatible = "gpio-leds";
+
+		led {
+			function = LED_FUNCTION_POWER;
+			color = <LED_COLOR_ID_BLUE>;
+			gpios = <&pio 7 16 GPIO_ACTIVE_LOW>; /* PH16 */
+		};
+	};
+
+	reg_vcc5v: vcc5v {
+		/* board wide 5V supply from a 12V->5V regulator */
+		compatible = "regulator-fixed";
+		regulator-name = "vcc-5v";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	reg_usb1_vbus: regulator-usb1-vbus {
+		compatible = "regulator-fixed";
+		regulator-name = "usb1-vbus";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		vin-supply = <&reg_vcc5v>;
+		enable-active-high;
+		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>; /* PL8 */
+	};
+};
+
+&cpu0 {
+	cpu-supply = <&reg_dcdc2>;
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
+	vmmc-supply = <&reg_dcdc1>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	bus-width = <4>;
+	status = "okay";
+};
+
+&mmc2 {
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_eldo1>;
+	cap-mmc-hw-reset;
+	non-removable;
+	bus-width = <8>;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
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
+	vcc-pb-supply = <&reg_dcdc1>;
+	vcc-pc-supply = <&reg_eldo1>;
+	vcc-pf-supply = <&reg_dcdc1>;
+	vcc-ph-supply = <&reg_dcdc1>;
+};
+
+&r_i2c0 {
+	status = "okay";
+
+	axp803: pmic@34 {
+		compatible = "x-powers,axp803";
+		reg = <0x34>;
+		interrupt-parent = <&r_intc>;
+		interrupts = <0 IRQ_TYPE_LEVEL_LOW>;
+	};
+};
+
+#include "axp803.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&reg_aldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-codec-avcc";
+};
+
+&reg_aldo2 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-dram-1";
+};
+
+&reg_aldo3 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-usb-pl";
+};
+
+&reg_dcdc1 {
+	regulator-always-on;
+	regulator-min-microvolt = <3300000>;
+	regulator-max-microvolt = <3300000>;
+	regulator-name = "vcc-io-usb-pd-emmc";
+};
+
+&reg_dcdc2 {
+	regulator-always-on;
+	regulator-min-microvolt = <810000>;
+	regulator-max-microvolt = <1200000>;
+	regulator-name = "vdd-cpux";
+};
+
+&reg_dcdc3 {
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <900000>;
+	regulator-name = "vdd-usb-cpus";
+};
+
+&reg_dcdc4 {
+	regulator-always-on;
+	regulator-min-microvolt = <950000>;
+	regulator-max-microvolt = <950000>;
+	regulator-name = "vdd-sys";
+};
+
+&reg_dcdc5 {
+	regulator-always-on;
+	regulator-min-microvolt = <1100000>;
+	regulator-max-microvolt = <1100000>;
+	regulator-name = "vcc-dram";
+};
+
+/* DCDC6 unused */
+/* DLDO3 unused */
+/* DLDO4 unused */
+
+&reg_eldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-pc-emmc";
+};
+
+/* ELDO2 unused */
+/* ELDO3 unused */
+
+&reg_fldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <900000>;
+	regulator-name = "vdd-cpus-usb";
+};
+
+/* reg_drivevbus unused */
+/* dc1sw unused */
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "host";       /* USB A type receptable, always powered */
+	status = "okay";
+};
+
+&usbphy {
+	status = "okay";
+	usb1_vbus-supply = <&reg_usb1_vbus>;
+};
-- 
2.46.3


