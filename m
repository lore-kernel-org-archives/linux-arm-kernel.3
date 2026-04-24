Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 3FD6DFE51F4
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 24 Apr 2026 09:37:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Date:Subject:Cc:
	To:From:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vtG9ryUpXaA3g5Jnj/VxKyr4WUiVR8itH9Y90O6bAZ0=; b=l9TYZW8lXWD0ba+W9btZPe7ePO
	cHG3XsGQsVuG2aZdxdJoY+1ZbT4FT4mE8Xteq5ySpW4oLT6ib9m4Rm2Z++NDAslWaFUfnf56MTjfR
	eGfxWsJ5J3NVZwXA/07/kxN/x6tdp8XZoCAkJDzPuDVsBo5s0cEp6zBPmA2feBSTw+tjII4wz2yP7
	E0i4Tz9yP7M0ZmaZM3/xIo4kW83BBfQHk8lblVhx1FMBe1jSLZ68Gw0hOIdem9qrfw3op+ePn0j0A
	3brsjrfTz4y85CHtwyFGSUCVjDec5T6IDDE/jZqeT6KupnfvfA73I9TqvQdKVHX+q07jo4zSmRCwp
	3+rYw8Rw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCyP-0000000CwbN-1gyy;
	Fri, 24 Apr 2026 09:37:21 +0000
Received: from smtp.uibk.ac.at ([138.232.1.140])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wGCyC-0000000CwWn-1OiA;
	Fri, 24 Apr 2026 09:37:13 +0000
Received: from surface-pro-5 (77.119.189.242.wireless.dyn.drei.com [77.119.189.242])
	(authenticated bits=0)
	by smtp.uibk.ac.at (8.15.2/8.15.2/F1) with ESMTPSA id 63O9agoB1184944
	(version=TLSv1.3 cipher=TLS_AES_256_GCM_SHA384 bits=256 verify=NOT);
	Fri, 24 Apr 2026 11:36:55 +0200
DKIM-Filter: OpenDKIM Filter v2.11.0 smtp.uibk.ac.at 63O9agoB1184944
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=student.uibk.ac.at;
	s=prod24a; t=1777023416;
	bh=vtG9ryUpXaA3g5Jnj/VxKyr4WUiVR8itH9Y90O6bAZ0=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=C9Mn7oN9Xepx/TzBsJ6uVR/5oFnewznAKw1wJG0yQbZmoQ40cGANJldIQIaQX2GnN
	 gOESh+bOlrIGcrvhptpUtHaK7voNEBcn+XGTRhbZcn9yGITqbSFtSnkJ2102iYZkSq
	 9q+xi8pwD5uKWrV1ZFS+OlhEiQCKJltGnngAZi8o=
From: christian.koever-draxl@student.uibk.ac.at
To: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
        neil.armstrong@linaro.org, khilman@baylibre.com
Cc: jbrunet@baylibre.com, martin.blumenstingl@googlemail.com,
        devicetree@vger.kernel.org, linux-amlogic@lists.infradead.org,
        linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
        =?UTF-8?q?Christian=20Stefan=20K=C3=B6v=C3=A9r-Draxl?= <christian.koever-draxl@student.uibk.ac.at>
Subject: [PATCH v5 2/2] arm64: dts: amlogic: add support for Amediatech X98Q
Date: Fri, 24 Apr 2026 11:36:33 +0200
Message-ID: <20260424093633.10734-3-christian.koever-draxl@student.uibk.ac.at>
X-Mailer: git-send-email 2.54.0
In-Reply-To: <20260424093633.10734-1-christian.koever-draxl@student.uibk.ac.at>
References: <20260424093633.10734-1-christian.koever-draxl@student.uibk.ac.at>
MIME-Version: 1.0
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 8bit
X-Scanned-By: MIMEDefang_3.2_at_uibk.ac.at
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260424_023708_983558_514C4FA7 
X-CRM114-Status: GOOD (  11.16  )
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

From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>

Add dts enabling core hardware for the Amediatech X98Q TV box.

The board features:
- Amlogic S905W2 (Meson S4) SoC
- 1 GiB RAM (2 GiB variants exist)
- eMMC and microSD card slot
- SDIO-based WiFi module (unsupported)
- RMII Ethernet with internal PHY
- IR receiver and UART console
- Status LED

Enabled peripherals:
- eMMC (HS200)
- SD card interface
- SDIO bus (WiFi, no driver yet)
- Ethernet (RMII)
- UART_B
- IR receiver
- PWM-controlled CPU regulator
- PWM and Fixed regulators for core and IO rails

Known limitations:
- No support for the onboard WiFi module
- Missing multimedia (HDMI/audio)

Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
---
 arch/arm64/boot/dts/amlogic/Makefile          |   1 +
 .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 249 ++++++++++++++++++
 2 files changed, 250 insertions(+)
 create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts

diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
index 15f9c817e502..c7752684dea6 100644
--- a/arch/arm64/boot/dts/amlogic/Makefile
+++ b/arch/arm64/boot/dts/amlogic/Makefile
@@ -85,6 +85,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-ugoos-am3.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
+dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905w2-x98q.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905y4-khadas-vim1s.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
 dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
index 000000000000..fe84259a20f3
--- /dev/null
+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
@@ -0,0 +1,249 @@
+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
+/*
+ * Copyright (c) 2026 Christian Stefan Köver-Draxl
+ * Based on meson-s4-s905y4-khadas-vim1s.dts:
+ *  - Copyright (c) 2026 Khadas Technology Co., Ltd.
+ */
+
+/dts-v1/;
+
+#include "meson-s4.dtsi"
+
+/ {
+	model = "Shenzhen Amediatech Technology Co., Ltd X98Q";
+	compatible = "amediatech,x98q", "amlogic,s905w2", "amlogic,s4";
+	interrupt-parent = <&gic>;
+	#address-cells = <2>;
+	#size-cells = <2>;
+
+	aliases {
+		mmc0 = &emmc; /* eMMC */
+		mmc1 = &sd; /* SD card */
+		mmc2 = &sdio; /* SDIO */
+		serial0 = &uart_b;
+	};
+
+	memory@0 {
+		device_type = "memory";
+		reg = <0x0 0x0 0x0 0x40000000>;
+	};
+
+	reserved-memory {
+		#address-cells = <2>;
+		#size-cells = <2>;
+		ranges;
+
+		/* 52 MiB reserved for ARM Trusted Firmware */
+		secmon_reserved: secmon@5000000 {
+			reg = <0x0 0x05000000 0x0 0x3400000>;
+			no-map;
+		};
+	};
+
+	emmc_pwrseq: emmc-pwrseq {
+		compatible = "mmc-pwrseq-emmc";
+		reset-gpios = <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
+	};
+
+	sdio_32k: sdio-32k {
+		compatible = "pwm-clock";
+		#clock-cells = <0>;
+		clock-frequency = <32768>;
+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
+	};
+
+	sdio_pwrseq: sdio-pwrseq {
+		compatible = "mmc-pwrseq-simple";
+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
+		clocks = <&sdio_32k>;
+		clock-names = "ext_clock";
+	};
+
+	main_5v: regulator-main-5v {
+		compatible = "regulator-fixed";
+		regulator-name = "5V";
+		regulator-min-microvolt = <5000000>;
+		regulator-max-microvolt = <5000000>;
+		regulator-always-on;
+	};
+
+	sd_3v3: regulator-sd-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "SD_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		gpio = <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
+		regulator-always-on;
+	};
+
+	vddio_sd: regulator-vddio-sd {
+		compatible = "regulator-gpio";
+		regulator-name = "VDDIO_SD";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <3300000>;
+		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
+		gpios-states = <1>;
+		states = <1800000 1 3300000 0>;
+	};
+
+	vddao_3v3: regulator-vddao-3v3 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDAO_3V3";
+		regulator-min-microvolt = <3300000>;
+		regulator-max-microvolt = <3300000>;
+		vin-supply = <&main_5v>;
+		regulator-always-on;
+	};
+
+	vddio_ao1v8: regulator-vddio-ao1v8 {
+		compatible = "regulator-fixed";
+		regulator-name = "VDDIO_AO1V8";
+		regulator-min-microvolt = <1800000>;
+		regulator-max-microvolt = <1800000>;
+		vin-supply = <&vddao_3v3>;
+		regulator-always-on;
+	};
+
+	/* SY8120B1ABC DC/DC Regulator. */
+	vddcpu: regulator-vddcpu {
+		compatible = "pwm-regulator";
+
+		regulator-name = "VDDCPU";
+		regulator-min-microvolt = <689000>;
+		regulator-max-microvolt = <1049000>;
+
+		vin-supply = <&main_5v>;
+
+		pwms = <&pwm_ij 1 1500 0>;
+		pwm-dutycycle-range = <100 0>;
+
+		regulator-boot-on;
+		regulator-always-on;
+		/* Voltage Duty-Cycle */
+		voltage-table = <1049000 0>,
+				<1039000 3>,
+				<1029000 6>,
+				<1019000 9>,
+				<1009000 12>,
+				<999000 14>,
+				<989000 17>,
+				<979000 20>,
+				<969000 23>,
+				<959000 26>,
+				<949000 29>,
+				<939000 31>,
+				<929000 34>,
+				<919000 37>,
+				<909000 40>,
+				<899000 43>,
+				<889000 45>,
+				<879000 48>,
+				<869000 51>,
+				<859000 54>,
+				<849000 56>,
+				<839000 59>,
+				<829000 62>,
+				<819000 65>,
+				<809000 68>,
+				<799000 70>,
+				<789000 73>,
+				<779000 76>,
+				<769000 79>,
+				<759000 81>,
+				<749000 84>,
+				<739000 87>,
+				<729000 89>,
+				<719000 92>,
+				<709000 95>,
+				<699000 98>,
+				<689000 100>;
+	};
+};
+
+&emmc {
+	status = "okay";
+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
+	pinctrl-1 = <&emmc_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+
+	bus-width = <8>;
+	cap-mmc-highspeed;
+	mmc-ddr-1_8v;
+	mmc-hs200-1_8v;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+
+	mmc-pwrseq = <&emmc_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+};
+
+&ethmac {
+	status = "okay";
+	phy-handle = <&internal_ephy>;
+	phy-mode = "rmii";
+};
+
+&ir {
+	status = "okay";
+	pinctrl-0 = <&remote_pins>;
+	pinctrl-names = "default";
+};
+
+&pwm_ef {
+	status = "okay";
+	pinctrl-0 = <&pwm_e_pins1>;
+	pinctrl-names = "default";
+};
+
+&pwm_ij {
+	status = "okay";
+};
+
+&sd {
+	status = "okay";
+	pinctrl-0 = <&sdcard_pins>;
+	pinctrl-1 = <&sdcard_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	bus-width = <4>;
+	cap-sd-highspeed;
+	max-frequency = <50000000>;
+	disable-wp;
+
+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
+
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddao_3v3>;
+};
+
+&sdio {
+	status = "okay";
+	pinctrl-0 = <&sdio_pins>;
+	pinctrl-1 = <&sdio_clk_gate_pins>;
+	pinctrl-names = "default", "clk-gate";
+	#address-cells = <1>;
+	#size-cells = <0>;
+	bus-width = <4>;
+	cap-sd-highspeed;
+	sd-uhs-sdr50;
+	sd-uhs-sdr104;
+	max-frequency = <200000000>;
+	non-removable;
+	disable-wp;
+
+	no-sd;
+	no-mmc;
+	mmc-pwrseq = <&sdio_pwrseq>;
+	vmmc-supply = <&vddao_3v3>;
+	vqmmc-supply = <&vddio_ao1v8>;
+
+	wifi: wifi@1 {
+		/* Amlogic W150S1 */
+		reg = <1>;
+	};
+};
+
+&uart_b {
+	status = "okay";
+};
-- 
2.54.0


