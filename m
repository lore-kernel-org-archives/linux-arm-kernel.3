Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A320ACD8C88
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  7 Jun 2026 08:45:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=45cSvMa7vDWI7Fjd/qV78JqRiPhc3SzpDZcwTKRm9Hk=; b=lra6A5L5VHr/5zfIQRPfxskjlJ
	2pAQCO98XFcrI2xCRoXfBnpI9GMl11Gd+AZiPIOoX00i9WWvdDyZUpGHBFWl8oMOqiRPmtts1o8bj
	YiOkep2sDYYGIVS13YNXRNqtJ9HTHroMKsCnRXu8I8PM5Yb2nHIp8v9HVyibSmDpUvbAWVQBplYXr
	MmcyKdNk8rmA3HwWTYZ3uW6tvxL8P1YcozvWZMPAJl3FnYB1kZtuDNy85G2wYmRWCF83DJUZiDmly
	alD6zX75IMx0nLbypRdNk78dzB+uxHSZ16YKxdFg03wO3yuCoJ7sbMQ44DPoLvymR0+V6nKb36vMo
	7ByiFR7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW98c-000000029IF-2lYH;
	Sun, 07 Jun 2026 08:45:46 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wW98b-000000029I4-2jOC;
	Sun, 07 Jun 2026 08:45:45 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id D9E5F43FDD;
	Sun,  7 Jun 2026 08:45:43 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 218021F00893;
	Sun,  7 Jun 2026 08:45:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1780821943;
	bh=45cSvMa7vDWI7Fjd/qV78JqRiPhc3SzpDZcwTKRm9Hk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=U/+wCthyTzuKLedKqi3zGC9u8j3BbDTgHlHQGdmuose1HrKTsVvNL+sR9Ak4G+qAB
	 3dE7kJJOtGtr9CV5GZkTq4pfoKBY5ldX3I0YqQhIAKT3YXv3ss1c+P0iLHio4N1Qo6
	 pgyrH1OOsnBcv3GEnLwrngvgX525jkxAK7IecV4qhIzsdmVlggOilJMtmvsDqvulWi
	 415miu3dHrLCEm728qUEIIaVIGBbKotl+gOu1AW3bpgf6FFW6t1xSL53/OoF8s+Uvs
	 n+9dj0tHzv5hXMdzsj++SX7ERELJn9YYRQbl0qqbXLVAeFlcVYdx85F337j9qLtDZO
	 cq01jaHvc3RNQ==
Date: Sun, 7 Jun 2026 10:45:40 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 1/2] arm64: dts: rockchip: add Vicharak Axon board
Message-ID: <20260607-platypus-of-perfect-pluck-b7ffd0@quoll>
References: <20260601132529.139172-1-hrushirajg23@gmail.com>
 <20260601132529.139172-2-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260601132529.139172-2-hrushirajg23@gmail.com>
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

On Mon, Jun 01, 2026 at 06:55:28PM +0530, Hrushiraj Gandhi wrote:
> Add initial support for the Vicharak Axon single-board computer based on
> the Rockchip RK3588 SoC.
> 
> The board supports:
> 
> - eMMC storage
> - microSD card
> - Gigabit Ethernet
> - HDMI output (dual HDMI)
> - HDMI input
> - USB 2.0 host ports
> - PCIe 2.0 slots
> - PCIe 3.0 x4 slot
> - SATA
> - RTC
> - Status LEDs
> 
> The board uses an RK806 PMIC and provides the regulators required by
> the RK3588 SoC.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |    1 +
>  .../dts/rockchip/rk3588-vicharak-axon.dts     | 1038 +++++++++++++++++
>  2 files changed, 1039 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index cb55c6b70d0e..fcb115b02eff 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -179,6 +179,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3576-rock-4d.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3582-radxa-e52c.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-sige7.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-armsom-w3.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-vicharak-axon.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-evb.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-coolpi-cm5-genbook.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3588-edgeble-neu6a-io.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
> new file mode 100644
> index 000000000000..fecd13a52e88
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-vicharak-axon.dts
> @@ -0,0 +1,1038 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/linux-event-codes.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include <dt-bindings/usb/pd.h>
> +#include "rk3588.dtsi"
> +
> +/ {
> +	model = "Vicharak Axon";
> +	compatible = "vicharak,axon", "rockchip,rk3588";
> +
> +	aliases {
> +		mmc0 = &sdmmc;
> +		mmc1 = &sdhci;
> +		mmc2 = &sdio;
> +		serial2 = &uart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	hdmi0-con {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi0_con_in: endpoint {
> +				remote-endpoint = <&hdmi0_out_con>;
> +			};
> +		};
> +	};
> +
> +	hdmi1-con {
> +		compatible = "hdmi-connector";
> +		type = "a";
> +
> +		port {
> +			hdmi1_con_in: endpoint {
> +				remote-endpoint = <&hdmi1_out_con>;
> +			};
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +		status = "okay";

Which DTSI disabled it?

> +
> +		power_led: power-led {
> +			color = <LED_COLOR_ID_GREEN>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&pca9554 0 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "heartbeat";
> +		};
> +
> +		status_led: status-led {
> +			color = <LED_COLOR_ID_RED>;
> +			function = LED_FUNCTION_STATUS;
> +			gpios = <&pca9554 1 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger = "none";
> +		};
> +	};
> +
> +	pcie20_avdd0v85: regulator-pcie20-avdd0v85 {

Unused, drop. Don't add useless/non-controllable supplies without
consumers. They bring no benefits, except more review, slower kernel,
more code to maintain.

> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie20_avdd0v85";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <850000>;
> +		regulator-max-microvolt = <850000>;
> +		vin-supply = <&vdd_0v85_s0>;
> +	};
> +
> +	pcie20_avdd1v8: regulator-pcie20-avdd1v8 {

No users

> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie20_avdd1v8";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&avcc_1v8_s0>;
> +	};
> +
> +	pcie30_avdd0v75: regulator-pcie30-avdd0v75 {

Is any of this real?

> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie30_avdd0v75";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <750000>;
> +		regulator-max-microvolt = <750000>;
> +		vin-supply = <&vdd_0v75_s0>;
> +	};
> +
> +	pcie30_avdd1v8: regulator-pcie30-avdd1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "pcie30_avdd1v8";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&avcc_1v8_s0>;
> +	};
> +
> +	sata_vcc_5v0: regulator-sata-vcc-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "sata_vcc_5v0";
> +		startup-delay-us = <5000>;
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		clocks = <&hym8563>;
> +		clock-names = "ext_clock";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdio_reset_wifi>;
> +		reset-gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_LOW>;
> +		status = "okay";
> +	};
> +
> +	vcc0_4v0: vcc4v0_sys: regulator-vcc0-4v0 {

Odd sorting. And still not used!

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc0_4v0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <4000000>;
> +		regulator-max-microvolt = <4000000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};
> +
> +	vcc12v_dcin: regulator-vcc12v-dcin {

Also not used

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc12v_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
> +	vcc3v3_io_expander: regulator-vcc3v3-io-expander {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_io_expander";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +	};
> +
> +	vcc3v3_pcie20_sata30: regulator-vcc3v3-pcie20-sata30 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc3v3_pcie20_sata30";
> +		regulator-boot-on;
> +		regulator-always-on;
> +		enable-active-high;
> +		gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_HIGH>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-min-microvolt = <3300000>;
> +		vin-supply = <&vcc12v_dcin>;
> +	};

...

> +
> +&i2c0 {
> +	pinctrl-0 = <&i2c0m2_xfer>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	vdd_cpu_big0_s0: regulator@42 {
> +		compatible = "rockchip,rk8602";
> +		fcs,suspend-voltage-selector = <1>;
> +		reg = <0x42>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <1050000>;
> +		regulator-min-microvolt = <550000>;
> +		regulator-name = "vdd_cpu_big0_s0";
> +		regulator-ramp-delay = <2300>;
> +		vin-supply = <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vdd_cpu_big1_s0: regulator@43 {
> +		compatible = "rockchip,rk8603", "rockchip,rk8602";
> +		fcs,suspend-voltage-selector = <1>;
> +		reg = <0x43>;
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-max-microvolt = <1050000>;
> +		regulator-min-microvolt = <550000>;
> +		regulator-name = "vdd_cpu_big1_s0";
> +		regulator-ramp-delay = <2300>;
> +		vin-supply = <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +		clock-output-names = "hym8563";
> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rtc_int>;
> +		wakeup-source;
> +		status = "okay";


Why is this enabled but regulator above is not? What logic drivers this?


> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1m2_xfer>;
> +	status = "okay";
> +
> +	vdd_npu_s0: regulator@42 {
> +		compatible = "rockchip,rk8602";
> +		reg = <0x42>;
> +		fcs,suspend-voltage-selector = <1>;
> +		regulator-name = "vdd_npu_s0";
> +		regulator-boot-on;
> +		regulator-enable-ramp-delay = <500>;
> +		regulator-min-microvolt = <550000>;
> +		regulator-max-microvolt = <950000>;
> +		regulator-ramp-delay = <2300>;
> +		vin-supply = <&vcc5v0_sys>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +};
> +
> +&i2c6 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c6m0_xfer>;
> +	status = "okay";
> +
> +	pca9554: gpio@24 {
> +		compatible = "nxp,pca9554";
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reg = <0x24>;
> +		vcc-supply = <&vcc3v3_io_expander>;
> +		status = "okay";

Who disabled it?

Best regards,
Krzysztof


