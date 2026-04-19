Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5EF31EA71A1
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Apr 2026 15:41:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:Message-ID:In-Reply-To:References:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=XVBz87Q16cqKzjUZPqFHkIMlPohkawUwKE+A6YDGreA=; b=FuY8OQVV0qjftth8C7JkPqpr49
	I9ouRfjdHT2vkSCAFG0l7u53vzkIjrm7qR4XWUgxrctcb0fmtFOHqV1Zl2z8Ow8O73SAHvAUhI+D9
	PsmKSurBF3yP1AxO6F/p0nmxe1laiPI+5Ka3mEnqWZLdx8fx0jAlBGB/f9IU4Xa9XonePe10c/Kn/
	uHjmCNvGx6pF9wUICYOJo583YZzYClZj9e1shFLPKkJq3EPMvTIvtGc/X+1Zp/2MZf3hQNVFyKj4N
	u434Hz6dm2BkZSCv1QkTEhGCp7p4/O9Xk6qqrvVFzIB5rwtBfw2nxNo+Htg/9YQBlSu55tv6ZBgzn
	ueQGG/7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEUGg-00000005tiz-40tY;
	Sun, 19 Apr 2026 15:41:07 +0000
Received: from out-179.mta0.migadu.com ([91.218.175.179])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wEUGd-00000005ti2-2UsN
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Apr 2026 15:41:05 +0000
Date: Sun, 19 Apr 2026 15:19:37 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=postmarketos.org;
	s=key1; t=1776613251;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=XVBz87Q16cqKzjUZPqFHkIMlPohkawUwKE+A6YDGreA=;
	b=HEefacLoAxC5pfY57EoUj1NR0mTU/2J7pyn5D2c4XeAO+e/AKp9/LbfLOuby1FCzHczPFz
	vX123rEEEnLw55pIu6BnPD4YZciaCFQ/BUJ+uZebehRLMYym5AG9TUqTyW4fdTTb0XvOBG
	5ciG3VpS8RaeGHn0S9Uphzz+okVB0JOcmMhfb1OSG1nQ90Pq7V87FuUiQPT/oNtmikc0Gw
	72noiBB4olSrT5WCKWmgp7vwPW2l2A/vFkF8mpiEsdhrraJQN3gMktuD4ksERc/gVgPGhe
	xbLRmkt/UCJ3VE3EDNxOEn0ZfML//qHAl5nx/DucoVyFqJocEu3oJrjI2HdMYA==
X-Report-Abuse: Please report any abuse attempt to abuse@migadu.com and include these headers.
From: Ferass El Hafidi <funderscore@postmarketos.org>
To: linux-amlogic@lists.infradead.org, christian.koever-draxl@student.uibk.ac.at, neil.armstrong@linaro.org, khilman@baylibre.com
Cc: linux-amlogic@lists.infradead.org, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, Christian Stefan K=?UTF-8?B?w7Y=?=v=?UTF-8?B?w6k=?=r-Draxl <christian.koever-draxl@student.uibk.ac.at>
Subject: Re: [PATCH] arm64: dts: amlogic: add support for Amedia X98Q
References: <20260419150855.121136-1-christian.koever-draxl@student.uibk.ac.at>
In-Reply-To: <20260419150855.121136-1-christian.koever-draxl@student.uibk.ac.at>
Message-ID: <tdqzjg.e0dtukngm56y@postmarketos.org>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit
Content-Type: text/plain; charset=utf-8; format=flowed
X-Migadu-Flow: FLOW_OUT
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260419_084103_928074_EB82AAC7 
X-CRM114-Status: GOOD (  18.28  )
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

Hi, some drive-by feedback

On Sun, 19 Apr 2026 15:08, christian.koever-draxl@student.uibk.ac.at wrote:
>From: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>
>The X98Q is a TV box based on the Amlogic S4 (S905W2) SoC.
>Add the device tree for this board and document the compatible string.
>
>Supported features:
>- 1GB/2GB RAM (via U-Boot memory fixup)
>- 10/100 Ethernet (Internal PHY)
>- eMMC and SD card storage
>- PWM-based CPU voltage regulation
>- UART (Serial console)
>
>Signed-off-by: Christian Stefan Kövér-Draxl <christian.koever-draxl@student.uibk.ac.at>
>---
>- The Wi-Fi chip on this board is Amlogic W150S1. I have left the SDIO node enabled
>  but omitted the specific chip sub-node due to lack of mainline drivers (yet).
>- The console uses uart_b at 921600 baud.
>- Verified memory via /proc/device-tree; U-Boot patches the node to around 2GB if board supports more than 1GB.
>- Tested on the 2GB RAM plus 16GB EMMC variant.
>
> .../devicetree/bindings/arm/amlogic.yaml      |   7 +
> arch/arm64/boot/dts/amlogic/Makefile          |   1 +
> .../boot/dts/amlogic/meson-s4-s905w2-x98q.dts | 244 ++++++++++++++++++
> 3 files changed, 252 insertions(+)
> create mode 100644 arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
>
>diff --git a/Documentation/devicetree/bindings/arm/amlogic.yaml b/Documentation/devicetree/bindings/arm/amlogic.yaml
>index a885278bc4e2..82671d58d1da 100644
>--- a/Documentation/devicetree/bindings/arm/amlogic.yaml
>+++ b/Documentation/devicetree/bindings/arm/amlogic.yaml
>@@ -254,6 +254,13 @@ properties:
>               - khadas,vim1s
>           - const: amlogic,s905y4
>           - const: amlogic,s4
>+      
>+      - description: Boards with the Amlogic Meson S4 S905W2 SoC
>+        items:
>+          - enum:
>+              - amediatech,x98q
>+          - const: amlogic,s905w2
>+          - const: amlogic,s4
> 
>       - description: Boards with the Amlogic S6 S905X5 SoC
>         items:

It is better to send the dt-binding changes separate from the actual
DTS. The golden rule is one commit per change.

You can (and should) send both patches as part of a patch series.

>diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
>index 15f9c817e502..6f0bdd5bdca2 100644
>--- a/arch/arm64/boot/dts/amlogic/Makefile
>+++ b/arch/arm64/boot/dts/amlogic/Makefile
>@@ -86,6 +86,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-gxm-vega-s96.dtb
> dtb-$(CONFIG_ARCH_MESON) += meson-gxm-wetek-core2.dtb
> dtb-$(CONFIG_ARCH_MESON) += meson-s4-s805x2-aq222.dtb
> dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905y4-khadas-vim1s.dtb
>+dtb-$(CONFIG_ARCH_MESON) += meson-s4-s905w2-x98q.dtb

Keep this file in alphabetic order.

> dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air-gbit.dtb
> dtb-$(CONFIG_ARCH_MESON) += meson-sm1-a95xf3-air.dtb
> dtb-$(CONFIG_ARCH_MESON) += meson-sm1-bananapi-m2-pro.dtb
>diff --git a/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
>new file mode 100644
>index 000000000000..f2db01730a3d
>--- /dev/null
>+++ b/arch/arm64/boot/dts/amlogic/meson-s4-s905w2-x98q.dts
>@@ -0,0 +1,244 @@
>+
>+// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>+/*
>+ * Copyright (c) 2026 Christian Stefan Köver-Draxl
>+ */

Did you base this DTS on another DTS that is already upstream? This
looks a lot like
https://git.kernel.org/pub/scm/linux/kernel/git/amlogic/linux.git/tree/arch/arm64/boot/dts/amlogic/meson-s4-s905y4-khadas-vim1s.dts?h=v7.1/arm64-dt

If so, then you should keep their copyright. Something like:

/*
 * Copyright (c) 2026 Christian Stefan Köver-Draxl
 * Based on <...>:
 *  - Copyright (c) <authors of the DTB this one is based on>
 */

Correct me if I'm wrong.

>+
>+/dts-v1/;
>+
>+#include "meson-s4.dtsi"
>+
>+/ {
>+	model = "Shenzhen Amedia X98Q";

Shouldn't this be
	model = "Shenzhen Amediatech Technology Co., Ltd X98Q";
?

There are other Amediatech boards supported currently:

dts/amlogic/meson-g12a-x96-max.dts:     model = "Shenzhen Amediatech Technology Co., Ltd X96 Max";
dts/amlogic/meson-sm1-x96-air-gbit.dts: model = "Shenzhen Amediatech Technology Co., Ltd X96 Air";
dts/amlogic/meson-sm1-x96-air.dts:      model = "Shenzhen Amediatech Technology Co., Ltd X96 Air";

I think it might be preferable to use a similar model format for
consistency.

It is also the documented vendor prefix for amediatech. (see
Documentation/devicetree/bindings/vendor-prefixes.yaml)

>+	compatible = "amediatech,x98q", "amlogic,s905w2", "amlogic,s4";
>+	interrupt-parent = <&gic>;
>+	#address-cells = <2>;
>+	#size-cells = <2>;
>+
>+	aliases {
>+		mmc0 = &emmc; /* eMMC */
>+		mmc1 = &sd; /* SD card */
>+		mmc2 = &sdio; /* SDIO */
>+		serial0 = &uart_b;
>+	};
>+
>+	memory@0 {
>+		device_type = "memory";
>+		reg = <0x0 0x0 0x0 0x40000000>;
>+	};
>+
>+	reserved-memory {
>+		#address-cells = <2>;
>+		#size-cells = <2>;
>+		ranges;
>+
>+		/* 52 MiB reserved for ARM Trusted Firmware */
>+		secmon_reserved: secmon@5000000 {
>+			reg = <0x0 0x05000000 0x0 0x3400000>;
>+			no-map;
>+		};
>+	};
>+
>+	emmc_pwrseq: emmc-pwrseq {
>+		compatible = "mmc-pwrseq-emmc";
>+		reset-gpios = <&gpio GPIOB_9 GPIO_ACTIVE_LOW>;
>+	};
>+
>+	sdio_32k: sdio-32k {
>+		compatible = "pwm-clock";
>+		#clock-cells = <0>;
>+		clock-frequency = <32768>;
>+		pwms = <&pwm_ef 0 30518 0>; /* PWM_E at 32.768KHz */
>+	};
>+
>+	sdio_pwrseq: sdio-pwrseq {
>+		compatible = "mmc-pwrseq-simple";
>+		reset-gpios = <&gpio GPIOX_6 GPIO_ACTIVE_LOW>;
>+		clocks = <&sdio_32k>;
>+		clock-names = "ext_clock";
>+	};
>+
>+	main_5v: regulator-main-5v {
>+		compatible = "regulator-fixed";
>+		regulator-name = "5V";
>+		regulator-min-microvolt = <5000000>;
>+		regulator-max-microvolt = <5000000>;
>+		regulator-always-on;
>+	};
>+
>+	sd_3v3: regulator-sd-3v3 {
>+		compatible = "regulator-fixed";
>+		regulator-name = "SD_3V3";
>+		regulator-min-microvolt = <3300000>;
>+		regulator-max-microvolt = <3300000>;
>+		gpio = <&gpio GPIOD_4 GPIO_ACTIVE_LOW>;
>+		regulator-always-on;
>+	};
>+
>+	vddio_sd: regulator-vddio-sd {
>+		compatible = "regulator-gpio";
>+		regulator-name = "VDDIO_SD";
>+		regulator-min-microvolt = <1800000>;
>+		regulator-max-microvolt = <3300000>;
>+		gpios = <&gpio GPIOD_9 GPIO_ACTIVE_HIGH>;
>+		gpios-states = <1>;
>+		states = <1800000 1
>+				3300000 0>;

nit: keep this in one line.

>+	};
>+
>+	vddao_3v3: regulator-vddao-3v3 {
>+		compatible = "regulator-fixed";
>+		regulator-name = "VDDAO_3V3";
>+		regulator-min-microvolt = <3300000>;
>+		regulator-max-microvolt = <3300000>;
>+		vin-supply = <&main_5v>;
>+		regulator-always-on;
>+	};
>+
>+	vddio_ao1v8: regulator-vddio-ao1v8 {
>+		compatible = "regulator-fixed";
>+		regulator-name = "VDDIO_AO1V8";
>+		regulator-min-microvolt = <1800000>;
>+		regulator-max-microvolt = <1800000>;
>+		vin-supply = <&vddao_3v3>;
>+		regulator-always-on;
>+	};
>+
>+	/* SY8120B1ABC DC/DC Regulator. */
>+	vddcpu: regulator-vddcpu {
>+		compatible = "pwm-regulator";
>+
>+		regulator-name = "VDDCPU";
>+		regulator-min-microvolt = <689000>;
>+		regulator-max-microvolt = <1049000>;
>+
>+		vin-supply = <&main_5v>;
>+
>+		pwms = <&pwm_ij 1 1500 0>;
>+		pwm-dutycycle-range = <100 0>;
>+
>+		regulator-boot-on;
>+		regulator-always-on;
>+		/* Voltage Duty-Cycle */
>+		voltage-table = <1049000 0>,
>+				<1039000 3>,
>+				<1029000 6>,
>+				<1019000 9>,
>+				<1009000 12>,
>+				<999000 14>,
>+				<989000 17>,
>+				<979000 20>,
>+				<969000 23>,
>+				<959000 26>,
>+				<949000 29>,
>+				<939000 31>,
>+				<929000 34>,
>+				<919000 37>,
>+				<909000 40>,
>+				<899000 43>,
>+				<889000 45>,
>+				<879000 48>,
>+				<869000 51>,
>+				<859000 54>,
>+				<849000 56>,
>+				<839000 59>,
>+				<829000 62>,
>+				<819000 65>,
>+				<809000 68>,
>+				<799000 70>,
>+				<789000 73>,
>+				<779000 76>,
>+				<769000 79>,
>+				<759000 81>,
>+				<749000 84>,
>+				<739000 87>,
>+				<729000 89>,
>+				<719000 92>,
>+				<709000 95>,
>+				<699000 98>,
>+				<689000 100>;
>+	};
>+};
>+
>+&emmc {
>+	status = "okay";
>+	pinctrl-0 = <&emmc_pins>, <&emmc_ds_pins>;
>+	pinctrl-1 = <&emmc_clk_gate_pins>;
>+	pinctrl-names = "default", "clk-gate";
>+
>+	bus-width = <8>;
>+	cap-mmc-highspeed;
>+	mmc-ddr-1_8v;
>+	mmc-hs200-1_8v;
>+	max-frequency = <200000000>;
>+	non-removable;
>+	disable-wp;
>+
>+	mmc-pwrseq = <&emmc_pwrseq>;
>+	vmmc-supply = <&vddao_3v3>;
>+	vqmmc-supply = <&vddio_ao1v8>;
>+};
>+
>+&ethmac {
>+	status = "okay";
>+	phy-handle = <&internal_ephy>;
>+	phy-mode = "rmii";
>+};
>+
>+&ir {
>+	status = "okay";
>+	pinctrl-0 = <&remote_pins>;
>+	pinctrl-names = "default";
>+};
>+
>+&pwm_ef {
>+	status = "okay";
>+	pinctrl-0 = <&pwm_e_pins1>;
>+	pinctrl-names = "default";
>+};
>+
>+&pwm_ij {
>+	status = "okay";
>+};
>+
>+&sd {
>+	status = "okay";
>+	pinctrl-0 = <&sdcard_pins>;
>+	pinctrl-1 = <&sdcard_clk_gate_pins>;
>+	pinctrl-names = "default", "clk-gate";
>+	bus-width = <4>;
>+	cap-sd-highspeed;
>+	max-frequency = <50000000>;
>+	disable-wp;
>+
>+	cd-gpios = <&gpio GPIOC_6 GPIO_ACTIVE_LOW>;
>+
>+	vmmc-supply = <&vddao_3v3>;
>+	vqmmc-supply = <&vddao_3v3>;
>+};
>+
>+&sdio {
>+	status = "okay";
>+	pinctrl-0 = <&sdio_pins>;
>+	pinctrl-1 = <&sdio_clk_gate_pins>;
>+	pinctrl-names = "default", "clk-gate";
>+	#address-cells = <1>;
>+	#size-cells = <0>;
>+	bus-width = <4>;
>+	cap-sd-highspeed;
>+	sd-uhs-sdr50;
>+	sd-uhs-sdr104;
>+	max-frequency = <200000000>;
>+	non-removable;
>+	disable-wp;
>+
>+	no-sd;
>+	no-mmc;
>+	mmc-pwrseq = <&sdio_pwrseq>;
>+	vmmc-supply = <&vddao_3v3>;
>+	vqmmc-supply = <&vddio_ao1v8>;
>+};

I suppose that's the Wi-Fi module you're talking about. I would put a comment
above to specify that it is indeed Wi-Fi and not yet supported.

Something like:

	/*
	 * Wireless SDIO Module (Amlogic W150S1)
	 * Note: There is no driver for this at the moment.
	 */

>+
>+&uart_b {
>+	status = "okay";
>+};
>-- 
>2.53.0

--
Best regards,
Ferass

