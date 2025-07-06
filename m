Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 256CEC83F03
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  6 Jul 2025 15:01:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=2MN6oyVzKf08fA5byAyA13O+F6JcxQMmUUl2IT7VLbA=; b=K/7Lyqv21QZ1B1HWA8MFcqSR64
	OAb1dmJTQVk1VJQBAD/DFeIadxzmbTPBITiQFxBOl0ejvyI0vRgIs+FkIYx3uKfRP85z/DPv+Pzhz
	zN+VBph7HpLcqa3TJo19HyrNjrg2UV3BZrNdnnw7vCbNotu3Dk6NsuYrFx4U2NVl6nI0PNrOfW86B
	h4F2yLOLViYxQPIZPorwCDF4q6hBJ5WLrjrcXM+3y1TwpWVYavDgoiTeZubmpmbmvayW9h0D9nE9s
	DA/0l1RVL+3/QrrUjoIuGVgtK1ibSDbirqaq9jkiE9IaCEHRNundTGy4cCigLexpH0WxTYTVWDryM
	pTBMsBJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYQrP-00000000QgZ-3Du4;
	Sun, 06 Jul 2025 15:00:55 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uYQp3-00000000QUk-44oi
	for linux-arm-kernel@lists.infradead.org;
	Sun, 06 Jul 2025 14:58:32 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 8A6E4153B;
	Sun,  6 Jul 2025 07:58:15 -0700 (PDT)
Received: from minigeek.lan (usa-sjc-mx-foss1.foss.arm.com [172.31.20.19])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 107D93F694;
	Sun,  6 Jul 2025 07:58:26 -0700 (PDT)
Date: Sun, 6 Jul 2025 15:56:52 +0100
From: Andre Przywara <andre.przywara@arm.com>
To: Chen-Yu Tsai <wens@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>, Jernej
 Skrabec <jernej@kernel.org>, Samuel Holland <samuel@sholland.org>,
 devicetree@vger.kernel.org, linux-sunxi@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] arm64: dts: allwinner: t527: Add OrangePi 4A
 board
Message-ID: <20250706155652.70a2624a@minigeek.lan>
In-Reply-To: <20250628161608.3072968-6-wens@kernel.org>
References: <20250628161608.3072968-1-wens@kernel.org>
	<20250628161608.3072968-6-wens@kernel.org>
Organization: Arm Ltd.
X-Mailer: Claws Mail 4.2.0 (GTK 3.24.31; x86_64-slackware-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250706_075830_114710_D550A100 
X-CRM114-Status: GOOD (  29.05  )
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

On Sun, 29 Jun 2025 00:16:08 +0800
Chen-Yu Tsai <wens@kernel.org> wrote:

Hi,

> From: Chen-Yu Tsai <wens@csie.org>
> 
> The OrangePi 4A is a typical Raspberry Pi model B sized development
> board from Xunlong designed around an Allwinner T527 SoC.
> 
> The board has the following features:
> - Allwinner T527 SoC
> - AXP717B + AXP323 PMICs
> - Up to 4GB LPDDR4 DRAM
> - micro SD slot
> - optional eMMC module
> - M.2 slot for PCIe 2.0 x1
> - 16 MB SPI-NOR flash
> - 4x USB 2.0 type-A ports (one can be used in gadget mode)
> - 1x Gigabit ethernet w/ Motorcomm PHY (through yet to be supported GMAC200)
> - 3.5mm audio jack via internal audio codec
> - HDMI 2.0 output
> - eDP, MIPI CSI (2-lane and 4-lane) and MIPI DSI (4-lane) connectors
> - USB type-C port purely for power
> - AP6256 (Broadcom BCM4345) WiFi 5.0 + BT 5.0
> - unsoldered headers for ADC and an additional USB 2.0 host port
> - 40-pin GPIO header
> 
> Add a device tree for it, enabling all peripherals currently supported.

Looks good to me now, thanks for the changes!

> Signed-off-by: Chen-Yu Tsai <wens@csie.org>

Reviewed-by: Andre Przywara <andre.przywara@arm.com>

Cheers,
Andre

> ---
> Changes since v2:
> - Actually include cpusldo regulator name change and axp323 aldo1/dldo1
>   comments
> - Fix indentation of comment in usb_otg block
> 
> Changes since v1:
> - Fixed regulator names for bldo3 and bldo4
> - Dropped labels for aldo1, bldo3, and bldo4, which are not really used
> - Added voltage constraints to aldo2, based on specifications from
>   schematic
> - Appended "-usb-0v9" to cpusldo's regulator name
> - Added comments to explain how axp323 aldo1 and dldo1 are tied together
> ---
>  arch/arm64/boot/dts/allwinner/Makefile        |   1 +
>  .../dts/allwinner/sun55i-t527-orangepi-4a.dts | 385 ++++++++++++++++++
>  2 files changed, 386 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> 
> diff --git a/arch/arm64/boot/dts/allwinner/Makefile b/arch/arm64/boot/dts/allwinner/Makefile
> index 773cc02a13d0..780aeba0f3a4 100644
> --- a/arch/arm64/boot/dts/allwinner/Makefile
> +++ b/arch/arm64/boot/dts/allwinner/Makefile
> @@ -57,3 +57,4 @@ dtb-$(CONFIG_ARCH_SUNXI) += sun50i-h700-anbernic-rg35xx-sp.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun55i-a527-cubie-a5e.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun55i-h728-x96qpro+.dtb
>  dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-avaota-a1.dtb
> +dtb-$(CONFIG_ARCH_SUNXI) += sun55i-t527-orangepi-4a.dtb
> diff --git a/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> new file mode 100644
> index 000000000000..5f97505ec8f9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/allwinner/sun55i-t527-orangepi-4a.dts
> @@ -0,0 +1,385 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR MIT)
> +/*
> + * Copyright (C) 2025 Chen-Yu Tsai <wens@csie.org>
> + */
> +
> +/dts-v1/;
> +
> +#include "sun55i-a523.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	model = "OrangePi 4A";
> +	compatible = "xunlong,orangepi-4a", "allwinner,sun55i-t527";
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	ext_osc32k: ext-osc32k-clk {
> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "ext_osc32k";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		/* PWM capable pin, but PWM isn't supported yet. */
> +		led {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&pio 3 20 GPIO_ACTIVE_HIGH>; /* PD20 */
> +		};
> +	};
> +
> +	wifi_pwrseq: pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&r_pio 1 1 GPIO_ACTIVE_LOW>; /* PM1 */
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	reg_otg_vbus: regulator-otg-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "otg-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&reg_vcc5v>;
> +		gpio = <&r_pio 0 4 GPIO_ACTIVE_HIGH>;	/* PL4 */
> +		enable-active-high;
> +	};
> +
> +	reg_pcie_vcc3v3: regulator-pcie-vcc3v3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-pcie-3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&reg_vcc5v>;
> +		gpio = <&r_pio 0 8 GPIO_ACTIVE_HIGH>;	/* PL8 */
> +		enable-active-high;
> +	};
> +
> +	reg_usb_vbus: regulator-usb-vbus {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usb-vbus";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&reg_vcc5v>;
> +		gpio = <&r_pio 0 12 GPIO_ACTIVE_HIGH>;	/* PL12 */
> +		enable-active-high;
> +	};
> +
> +	reg_vcc5v: regulator-vcc5v {
> +		/* board wide 5V supply from USB type-C port */
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc-5v";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		regulator-always-on;
> +	};
> +};
> +
> +&ehci0 {
> +	status = "okay";
> +};
> +
> +&ehci1 {
> +	status = "okay";
> +};
> +
> +&mmc0 {
> +	vmmc-supply = <&reg_cldo3>;
> +	cd-gpios = <&pio 5 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>; /* PF6 */
> +	bus-width = <4>;
> +	status = "okay";
> +};
> +
> +&mmc1 {
> +	bus-width = <4>;
> +	mmc-pwrseq = <&wifi_pwrseq>;
> +	non-removable;
> +	vmmc-supply = <&reg_dldo1_323>;
> +	vqmmc-supply = <&reg_bldo1>;
> +	status = "okay";
> +
> +	brcmf: wifi@1 {
> +		compatible = "brcm,bcm4329-fmac";
> +		reg = <1>;
> +		interrupt-parent = <&r_pio>;
> +		interrupts = <1 0 IRQ_TYPE_LEVEL_LOW>; /* PM0 */
> +		interrupt-names = "host-wake";
> +	};
> +};
> +
> +&mmc2 {
> +	bus-width = <8>;
> +	cap-mmc-hw-reset;
> +	mmc-ddr-1_8v;
> +	mmc-hs200-1_8v;
> +	non-removable;
> +	vmmc-supply = <&reg_cldo3>;
> +	vqmmc-supply = <&reg_cldo1>;
> +	status = "okay";
> +};
> +
> +&ohci0 {
> +	status = "okay";
> +};
> +
> +&ohci1 {
> +	status = "okay";
> +};
> +
> +&pio {
> +	vcc-pb-supply = <&reg_cldo3>;	/* via VCC-IO */
> +	vcc-pc-supply = <&reg_cldo1>;
> +	vcc-pd-supply = <&reg_cldo3>;
> +	vcc-pe-supply = <&reg_aldo2>;
> +	vcc-pf-supply = <&reg_cldo3>;	/* VCC-IO for 3.3v; VCC-MCSI for 1.8v */
> +	vcc-pg-supply = <&reg_bldo1>;
> +	vcc-ph-supply = <&reg_cldo3>;	/* via VCC-IO */
> +	vcc-pi-supply = <&reg_cldo3>;
> +	vcc-pj-supply = <&reg_cldo1>;
> +	vcc-pk-supply = <&reg_cldo1>;
> +};
> +
> +&r_i2c0 {
> +	status = "okay";
> +
> +	axp717: pmic@35 {
> +		compatible = "x-powers,axp717";
> +		reg = <0x35>;
> +		interrupt-controller;
> +		#interrupt-cells = <1>;
> +		interrupts-extended = <&nmi_intc 0 IRQ_TYPE_LEVEL_LOW>;
> +
> +		vin1-supply = <&reg_vcc5v>;
> +		vin2-supply = <&reg_vcc5v>;
> +		vin3-supply = <&reg_vcc5v>;
> +		vin4-supply = <&reg_vcc5v>;
> +		aldoin-supply = <&reg_vcc5v>;
> +		bldoin-supply = <&reg_vcc5v>;
> +		cldoin-supply = <&reg_vcc5v>;
> +
> +		regulators {
> +			/* Supplies the "little" cluster (1.4 GHz cores) */
> +			reg_dcdc1: dcdc1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1160000>;
> +				regulator-name = "vdd-cpul";
> +			};
> +
> +			reg_dcdc2: dcdc2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <920000>;
> +				regulator-max-microvolt = <920000>;
> +				regulator-name = "vdd-gpu-sys";
> +			};
> +
> +			reg_dcdc3: dcdc3 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1160000>;
> +				regulator-max-microvolt = <1160000>;
> +				regulator-name = "vcc-dram";
> +			};
> +
> +			reg_dcdc4: dcdc4 {
> +				/* feeds 3.3V pin on GPIO header */
> +				regulator-always-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vdd-io";
> +			};
> +
> +			aldo1 {
> +				/* not actually connected */
> +				regulator-name = "avdd-csi";
> +			};
> +
> +			reg_aldo2: aldo2 {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc-pe";
> +			};
> +
> +			reg_aldo3: aldo3 {
> +				/* supplies the I2C pins for this PMIC */
> +				regulator-always-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc-pl-usb";
> +			};
> +
> +			reg_aldo4: aldo4 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc-pll-dxco-avcc";
> +			};
> +
> +			reg_bldo1: bldo1 {
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc-pg-wifi";
> +			};
> +
> +			reg_bldo2: bldo2 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc-pm-lpddr";
> +			};
> +
> +			bldo3 {
> +				/* not actually connected */
> +				regulator-name = "afvcc-csi";
> +			};
> +
> +			bldo4 {
> +				/* not actually connected */
> +				regulator-name = "dvdd-csi";
> +			};
> +
> +			reg_cldo1: cldo1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +				regulator-name = "vcc-cvp-pc-lvds-mcsi-pk-efuse-pcie-edp-1v8";
> +			};
> +
> +			reg_cldo2: cldo2 {
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc3v3-csi";
> +			};
> +
> +			reg_cldo3: cldo3 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc-io-mmc-nand-pd-pi-usb";
> +			};
> +
> +			reg_cldo4: cldo4 {
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc-3v3-phy1-lcd";
> +			};
> +
> +			reg_cpusldo: cpusldo {
> +				/* supplies the management core */
> +				regulator-always-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-name = "vdd-cpus-usb-0v9";
> +			};
> +		};
> +	};
> +
> +	axp323: pmic@36 {
> +		compatible = "x-powers,axp323";
> +		reg = <0x36>;
> +		#interrupt-cells = <1>;
> +		interrupt-controller;
> +		status = "okay";
> +
> +		vin1-supply = <&reg_vcc5v>;
> +		vin2-supply = <&reg_vcc5v>;
> +		vin3-supply = <&reg_vcc5v>;
> +
> +		regulators {
> +			reg_aldo1_323: aldo1 {
> +				/* less capable and shares load with dldo1 */
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc-wifi";
> +			};
> +
> +			reg_dldo1_323: dldo1 {
> +				/* more capable and shares load with aldo1 */
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-name = "vcc-wifi2";
> +			};
> +
> +			/* Supplies the "big" cluster (1.8 GHz cores) */
> +			reg_dcdc1_323: dcdc1 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <1150000>;
> +				regulator-name = "vdd-cpub";
> +			};
> +
> +			/* DCDC2 is polyphased with DCDC1 */
> +
> +			/* Some RISC-V management core related voltage */
> +			reg_dcdc3_323: dcdc3 {
> +				regulator-always-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <900000>;
> +				regulator-name = "vdd-dnr";
> +			};
> +		};
> +	};
> +};
> +
> +&r_pio {
> +/*
> + * Specifying the supply would create a circular dependency.
> + *
> + *	vcc-pl-supply = <&reg_aldo3>;
> + */
> +	vcc-pm-supply = <&reg_bldo2>;
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0_pb_pins>;
> +	status = "okay";
> +};
> +
> +&uart1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart1_pins>, <&uart1_rts_cts_pins>;
> +	uart-has-rtscts;
> +	status = "okay";
> +
> +	bluetooth {
> +		compatible = "brcm,bcm4345c5";
> +		clocks = <&rtc CLK_OSC32K_FANOUT>;
> +		clock-names = "lpo";
> +		vbat-supply = <&reg_aldo1_323>;
> +		vddio-supply = <&reg_bldo1>;
> +		device-wakeup-gpios = <&r_pio 1 3 GPIO_ACTIVE_HIGH>; /* PM3 */
> +		host-wakeup-gpios = <&r_pio 1 4 GPIO_ACTIVE_HIGH>; /* PM4 */
> +		shutdown-gpios = <&r_pio 1 2 GPIO_ACTIVE_HIGH>; /* PM2 */
> +	};
> +};
> +
> +&usb_otg {
> +	/*
> +	 * The OTG controller is connected to one of the type-A ports.
> +	 * There is a regulator, controlled by a GPIO, to provide VBUS power
> +	 * to the port, and a VBUSDET GPIO, to detect externally provided
> +	 * power. But without ID or CC pins there is no real way to do a
> +	 * runtime role detection.
> +	 */
> +	dr_mode = "host";
> +	status = "okay";
> +};
> +
> +&usbphy {
> +	usb0_vbus-supply = <&reg_otg_vbus>;
> +	usb0_vbus_det-gpios = <&r_pio 0 7 GPIO_ACTIVE_HIGH>; /* PL7 */
> +	usb1_vbus-supply = <&reg_usb_vbus>;
> +	status = "okay";
> +};


