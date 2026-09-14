Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7177AC88E7F
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Sep 2026 21:06:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:
	Reply-To:Content-Type:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=GAPAVdOZ4tMrqQf2eKWNLSa6dtJ8xL/VOAc5uPDcgck=; b=shyqZdY9mNogOm+jFwdGzxuvB5
	fEjf8I987q0AoQt+7jlDnrSbW0istttZaZvlBDWpxs5Ytv5V8pxnFPEtGJfaNL7LDOjVr7kJ2ywgJ
	Tt8Q+Rpq/Q5ss3PePOwX4of+LraFqMODICewFcrGCj4S0VtuZcVWSginETkXqI4X4rHkLkbe47dRD
	xlF7AsfcItnEYS/hjmRcm5UbKugshoU6/FzxCbv+k4K1WNQjl19yPPi8PNlHyJAyIF3AcXyQzXvPg
	oaKQXDdh0flbCXnIdaa8uXUdaAIihhRh7JIG7NNiztHU4hJIgTkSpa3gFHPGht8b0v0UZoS+HQAs+
	yRTXXlgg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DsS-00000004eve-2I2A;
	Mon, 14 Sep 2026 21:06:12 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x6DsP-00000004euO-1hon
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Sep 2026 21:06:11 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BBF2F1D15;
	Mon, 14 Sep 2026 14:06:03 -0700 (PDT)
Received: from ryzen.fritz.box (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 740113F882;
	Mon, 14 Sep 2026 14:06:05 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=simple/simple; d=arm.com; s=foss;
	t=1789419967; bh=FJTn15qto8SkZuW/rQdvfilVulV/vGsboJv3j1Pdpq4=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References:From;
	b=SObcF8V6uXSG7UCTMAZ3a4JwB1TVnACf+JrREO51S7Jj859p/73Q4YETsHVaztt3o
	 3Uc3Ps1FpX0iiOzQKjVZApIOF0tA2/piYUNu1N1QLgf2rTP40yQ3YUtP7CJen1oGxS
	 UqM8KoWJ3tL1dg5q2FOzfyIJ28voL2/TENoajg+8=
From: Andre Przywara <andre.przywara@arm.com>
To: Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Chen-Yu Tsai <wens@kernel.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>
Cc: Paul Kocialkowski <paulk@sys-base.io>,
	devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev
Subject: [PATCH 3/3] arm64: dts: allwinner: A133: add basic support for Teclast P80 tablet
Date: Mon, 14 Sep 2026 23:01:15 +0200
Message-ID: <20260914210115.28151-4-andre.przywara@arm.com>
X-Mailer: git-send-email 2.46.4
In-Reply-To: <20260914210115.28151-1-andre.przywara@arm.com>
References: <20260914210115.28151-1-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260914_140610_221513_D4E47109 
X-CRM114-Status: GOOD (  15.91  )
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

The Teclast P80 tablet is an 8 inch entry-level tablet from around 2020,
featuring an Allwinner A133 SoC. It features:
    - Allwinner A133 SoC (4*Arm Cortex-A53) at 1.6 GHz
    - 2 GiB LPDDR4 DRAM
    - 32GiB eMMC
    - microSD card slot
    - AXP707 PMIC
    - USB-C OTG port (also for charging)
    - 800x1200 pixel 8" IPS panel
    - unknown Bluetooth and WiFi
    - secure boot, but takes any key

Add initial support for the tablet, including UART, PMIC, eMMC, SD, USB.
The tablet uses secure boot, so it needs a signed TOC0 wrapped image to
boot, but it has no key hash burnt into the efuses, so it accepts an
image signed with any key.

Please note that there are older models also being named P80: a device
with an Mediatek SoC from around 2018, based on 32-bit ARM cores, and an
Intel Atom based one from around 2014.
This device here is sometimes listed as G4, the Mediatek one as G3.

Signed-off-by: Andre Przywara <andre.przywara@arm.com>
---
 arch/arm64/boot/dts/allwinner/Makefile        |   1 +
 .../dts/allwinner/sun50i-a133-teclast-p80.dts | 205 ++++++++++++++++++
 2 files changed, 206 insertions(+)
 create mode 100644 arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts

diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
index aa21f58a4be1f..d1f768dd6461d 100644
--- a/arch/arm64/boot/dts/allwinner/Makefile
+++ b/arch/arm64/boot/dts/allwinner/Makefile
@@ -26,6 +26,7 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h64-remix-mini-pc.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a100-allwinner-perf1.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-helperboard.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-liontron-h-a133l.dtb
+dtb-$(CONFIG_ARCH_SUNXI) += sun50i-a133-teclast-p80.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-bananapi-m2-plus-v1.2.dtb
 dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h5-emlid-neutis-n5-devboard.dtb
diff --git a/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts b/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts
new file mode 100644
index 0000000000000..47b5f2ac824ae
--- /dev/null
+++ b/arch/arm64/boot/dts/allwinner/sun50i-a133-teclast-p80.dts
@@ -0,0 +1,205 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Arm Ltd.
+ */
+
+/dts-v1/;
+
+#include "sun50i-a100.dtsi"
+#include "sun50i-a100-cpu-opp.dtsi"
+
+#include <dt-bindings/gpio/gpio.h>
+
+/{
+	model = "Teclast P80";
+	compatible = "teclast,p80", "allwinner,sun50i-a133";
+	chassis-type = "tablet";
+
+	aliases {
+		serial0 = &uart0;
+	};
+
+	chosen {
+		stdout-path = "serial0:115200n8";
+	};
+
+	reg_vcc5v: vcc5v {
+		/* external power input from the USB-C port*/
+		compatible = "regulator-fixed";
+		regulator-always-on;
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-name = "vcc-5v";
+	};
+
+	speaker_amp: audio-amplifier {
+		compatible = "simple-audio-amplifier";
+		enable-gpios = <&pio 7 6 GPIO_ACTIVE_HIGH>; /* PH6 */
+		sound-name-prefix = "Speaker Amp";
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
+&mmc0 {
+	bus-width = <4>;
+	cd-gpios = <&pio 5 6 GPIO_ACTIVE_LOW>; /* PF6 */
+	disable-wp;
+	vmmc-supply = <&reg_dcdc1>;
+	status = "okay";
+};
+
+&mmc2 {
+	bus-width = <8>;
+	cap-mmc-hw-reset;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	non-removable;
+	vmmc-supply = <&reg_dcdc1>;
+	vqmmc-supply = <&reg_eldo1>;
+	status = "okay";
+};
+
+&ohci0 {
+	status = "okay";
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
+		x-powers,drive-vbus-en;
+	};
+};
+
+#include "axp803.dtsi"
+
+&ac_power_supply {
+	status = "okay";
+};
+
+&battery_power_supply {
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
+	regulator-name = "vcc-io-usb-pd-mmc";
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
+&reg_dc1sw {
+	regulator-name = "vcc-dc1sw";
+};
+
+&reg_drivevbus {
+	regulator-name = "usb0-vbus";
+	status = "okay";
+};
+
+&reg_dldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-dldo1";
+};
+
+&reg_eldo1 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-eldo1";
+};
+
+&reg_eldo3 {
+	regulator-min-microvolt = <1800000>;
+	regulator-max-microvolt = <1800000>;
+	regulator-name = "vcc-eldo3";
+};
+
+&reg_fldo1 {
+	regulator-always-on;
+	regulator-min-microvolt = <900000>;
+	regulator-max-microvolt = <900000>;
+	regulator-name = "vdd-cpus-usb";
+};
+
+&uart0 {
+	pinctrl-names = "default";
+	pinctrl-0 = <&uart0_pb_pins>;
+	status = "okay";
+};
+
+&usb_otg {
+	dr_mode = "otg";
+	status = "okay";
+};
+
+&usb_power_supply {
+	status = "okay";
+};
+
+&usbphy {
+	usb0_vbus-supply = <&reg_drivevbus>;
+	usb0_id_det-gpios = <&pio 7 8 GPIO_ACTIVE_HIGH>; /* PH8 */
+	status = "okay";
+};
-- 
2.46.4


