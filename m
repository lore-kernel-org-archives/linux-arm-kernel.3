Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9D26AEF06EE
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Feb 2026 22:50:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qO2n1t+o89ZZeIRUp8YAof/887drGtlHh59NH+3vQVI=; b=ocmpt1PUxj9uu7kIKgoRyTelJl
	kQbgr7GDz988GMBQI04dMgVxYFtOvDvGMOe7ls3kQ/g4+jZgvlAAq8h4f9vFeaeNxODVIggVcG3ah
	HAt6A7dgN1fUkSzlrJ7D+uOS9rwagAm5oh15aFZwyvX49ol5OMIeGXsEzpqBtmSLgWdbKQ282g47X
	aFU/sj3VaxjIL69jVpacFAWltJJY2sYJz0mUikUm/SR9CaL4LBz9o69Q9pbMQVJEF5ktX16faXit9
	mOI2USkgI+aBQenJ0S38Q3gIe+R1awFQzZmOJoajowQ0a07XuRNlgusQ83x+hPFa8cgEZ7+S/MahJ
	PO9GSsXw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpDbL-0000000EXJe-380V;
	Sun, 08 Feb 2026 22:49:59 +0000
Received: from smtp.forwardemail.net ([149.28.215.223])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpDbJ-0000000EXIQ-09WM
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Feb 2026 22:49:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1770590996;
 bh=qO2n1t+o89ZZeIRUp8YAof/887drGtlHh59NH+3vQVI=;
 b=jBDZuyxMMSmqGAMmhzvyHKF4F9bq3Y8WttpOFvOSmW8kFUWOZ/huA/RTtPimBzEWXFPXMVTWK
 Xl5QULexpo2WRH786cFwLnhDMAlOAFxzt1WslKXl4cryIG00la5U3/OJmhWeR7I5YAgKulDmoHM
 KVbamxaMBwbM6GX8BA270uCDACXdQi9ev2vHsdf+fDxCqjp4qfXJfKhmKFFTwlpB/iiprg+fXbM
 oUFOiFgSqi7wlYAqs/28Q9/XGh/kUtpsf/S0Kw/JaAFzh8rHrn0acq8ax0v0iT+/1iRH51gWyFX
 n7tPNlK9y8Hh8VjIjDrfTsmlf9+Zt4kMxjJXrBmIuHpg==
X-Forward-Email-ID: 6989130ea6487c2810b1bc60
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 149.28.215.223
X-Forward-Email-Version: 2.6.2
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <bd1827ed-76dd-493f-a74b-d38ad1dac605@kwiboo.se>
Date: Sun, 8 Feb 2026 23:49:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] ARM: dts: rockchip: Add support for RV1103B
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Fabio Estevam <festevam@nabladev.com>
References: <20260207131803.2834749-1-festevam@gmail.com>
 <20260207131803.2834749-2-festevam@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260207131803.2834749-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260208_144957_122924_2B5C5EB1 
X-CRM114-Status: GOOD (  25.49  )
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

Hi Fabio,

On 2/7/2026 2:18 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add the initial RV1103B devicetree.
> 
> Based on the 5.10 Rockchip vendor kernel driver.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v1:
> - None.
> 
>  .../boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 831 ++++++++++++++++++
>  arch/arm/boot/dts/rockchip/rv1103b.dtsi       | 266 ++++++
>  2 files changed, 1097 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi
> 
> diff --git a/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
> new file mode 100644
> index 000000000000..bc4d8fcdfaf7
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
> @@ -0,0 +1,831 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <arm64/rockchip/rockchip-pinconf.dtsi>
> +
> +/*
> + * This file is auto generated by pin2dts tool, please keep these code
> + * by adding changes at end of this file.
> + */
> +&pinctrl {
> +	cam_clk0 {

This is missing omit-if-no-ref, please add for all:

		/omit-if-no-ref/

> +		cam_clk0_pins: cam-clk0-pins {
> +			rockchip,pins =
> +				/* cam_clk0_out */
> +				<1 RK_PB5 1 &pcfg_pull_none>;
> +		};
> +	};
> +
> +	cam_clk1 {
> +		cam_clk1_pins: cam-clk1-pins {
> +			rockchip,pins =
> +				/* cam_clk1_out */
> +				<1 RK_PB6 1 &pcfg_pull_none>;
> +		};
> +	};
> +
> +	cam_spi {
> +		cam_spi_bus4_pins: cam-spi-bus4-pins {
> +			rockchip,pins =
> +				/* cam_spi_d0 */
> +				<0 RK_PB5 4 &pcfg_pull_up_drv_level_2>,
> +				/* cam_spi_d1 */
> +				<0 RK_PB2 4 &pcfg_pull_up_drv_level_2>,
> +				/* cam_spi_d2 */
> +				<0 RK_PB1 4 &pcfg_pull_up_drv_level_2>,
> +				/* cam_spi_d3 */
> +				<0 RK_PB0 4 &pcfg_pull_up_drv_level_2>;
> +		};
> +		cam_spi_clk_pins: cam-spi-clk-pins {
> +			rockchip,pins =
> +				/* cam_spi_clk */
> +				<0 RK_PB4 4 &pcfg_pull_none>;
> +		};
> +		cam_spi_cs0n_pins: cam-spi-cs0n-pins {
> +			rockchip,pins =
> +				/* cam_spi_cs0n */
> +				<0 RK_PB3 4 &pcfg_pull_none>;
> +		};
> +	};
> +
> +	clk {
> +		clk_32k_pins: clk-32k-pins {
> +			rockchip,pins =
> +				/* clk_32k */
> +				<0 RK_PA0 2 &pcfg_pull_none>;
> +		};
> +	};
> +
> +	clk_24m {
> +		clk_24m_out_pins: clk-24m-out-pins {
> +			rockchip,pins =
> +				/* clk_24m_out */
> +				<0 RK_PA0 3 &pcfg_pull_none>;
> +		};
> +	};
> +
> +	cpu {
> +		cpu_pins: cpu-pins {
> +			rockchip,pins =
> +				/* cpu_avs */
> +				<0 RK_PA1 2 &pcfg_pull_none>;
> +		};
> +	};
> +
> +	emmc {
> +		emmc_bus4_pins: emmc-bus4-pins {
> +			rockchip,pins =
> +				/* emmc_d0 */
> +				<1 RK_PA1 1 &pcfg_pull_up_drv_level_2>,
> +				/* emmc_d1 */
> +				<1 RK_PA2 1 &pcfg_pull_up_drv_level_2>,
> +				/* emmc_d2 */
> +				<1 RK_PA3 1 &pcfg_pull_up_drv_level_2>,
> +				/* emmc_d3 */
> +				<1 RK_PA0 1 &pcfg_pull_up_drv_level_2>;
> +		};
> +		emmc_clk_pins: emmc-clk-pins {
> +			rockchip,pins =
> +				/* emmc_clk */
> +				<1 RK_PA4 1 &pcfg_pull_up_drv_level_2>;
> +		};
> +		emmc_cmd_pins: emmc-cmd-pins {
> +			rockchip,pins =
> +				/* emmc_cmd */
> +				<1 RK_PA5 1 &pcfg_pull_up_drv_level_2>;
> +		};

The _pins suffix seem reduntant, at least where there is only a single
pin in the group?

> +	};
> +
> +	emmc_testclk {
> +		emmc_testclk_clk_pins: emmc-testclk-clk-pins {
> +			rockchip,pins =
> +				/* emmc_testclk_out */
> +				<1 RK_PA7 3 &pcfg_pull_up_drv_level_2>;
> +		};
> +	};
> +
> +	emmc_testdata {
> +		emmc_testdata_out_pins: emmc-testdata-out-pins {
> +			rockchip,pins =
> +				/* emmc_testdata_out */
> +				<1 RK_PB0 3 &pcfg_pull_none>;
> +		};
> +	};

[snip]

> diff --git a/arch/arm/boot/dts/rockchip/rv1103b.dtsi b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
> new file mode 100644
> index 000000000000..380637b63ef5
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
> @@ -0,0 +1,266 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/clock/rockchip,rv1103b-cru.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	compatible = "rockchip,rv1103b";
> +
> +	interrupt-parent = <&gic>;
> +
> +	arm-pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 127 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>;
> +	};
> +
> +	xin32k: oscillator-32k {
> +		compatible = "fixed-clock";
> +		clock-frequency = <32768>;
> +		clock-output-names = "xin32k";
> +		#clock-cells = <0>;
> +	};
> +
> +	xin24m: oscillator-24m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +		#clock-cells = <0>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0x0>;
> +			clocks = <&cru ARMCLK>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +		clock-frequency = <24000000>;
> +	};
> +
> +	cru: clock-controller@20000000 {
> +		compatible = "rockchip,rv1103b-cru";
> +		reg = <0x20000000 0x81000>;
> +		#clock-cells = <1>;
> +		#reset-cells = <1>;
> +
> +		assigned-clocks = <&cru PLL_GPLL>, <&cru CLK_GPLL_DIV12>;
> +		assigned-clock-rates = <1188000000>, <100000000>;
> +	};

This and all other MIMO nodes should be places inside a /soc node,
please see other recent Rockchip SoCs, like RK3576, RK3528 and RK3562.

> +	/*
> +	 * Merge all GRF, each independent GRF offset is shown as bellow:
> +	 * VEPU_GRF:		0x20100000
> +	 * NPU_GRF:		0x20110000
> +	 * VI_GRF:		0x20120000
> +	 * CPU_GRF:		0x20130000
> +	 * DDR_GRF:		0x20140000
> +	 * SYS_GRF:		0x20150000
> +	 * PMU_GRF:		0x20160000

This merge is something we have avoided for other Rockchip SoCs and is
something downstream mostly have done to simplify software not to 
accurately represent the hw.

Please split the GRFs like has been done on other recent Rockchip SoCs.

> +	 */
> +	grf: syscon@20100000 {
> +		compatible = "rockchip,rv1103b-grf", "syscon", "simple-mfd";
> +		reg = <0x20100000 0x61000>;
> +
> +		reboot_mode: reboot-mode {
> +			compatible = "syscon-reboot-mode";
> +			offset = <0x60200>;
> +		};
> +	};
> +
> +	ioc: syscon@20170000 {
> +		compatible = "rockchip,rv1103b-ioc", "syscon";
> +		reg = <0x20170000 0x60000>;
> +	};
> +
> +	gic: interrupt-controller@20411000 {
> +		compatible = "arm,gic-400";
> +		interrupt-controller;
> +		#interrupt-cells = <3>;
> +		#address-cells = <0>;
> +
> +		reg = <0x20411000 0x1000>,
> +		      <0x20412000 0x2000>,
> +		      <0x20414000 0x2000>,
> +		      <0x20416000 0x2000>;
> +		interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	uart0: serial@20540000 {
> +		compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
> +		reg = <0x20540000 0x100>;
> +		interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clock-frequency = <24000000>;

Any reason to define the clock rate here, the clock already report this
rate?

> +		clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart0m0_xfer_pins>;
> +		status = "disabled";
> +	};
> +
> +	sdmmc1: mmc@20650000 {
> +		compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x20650000 0x4000>;
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC1>, <&cru CCLK_SDMMC1>;
> +		clock-names = "biu", "ciu";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdmmc1_clk_pins &sdmmc1_cmd_pins &sdmmc1_bus4_pins>;
> +		status = "disabled";
> +	};
> +
> +	uart1: serial@20870000 {
> +		compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
> +		reg = <0x20870000 0x100>;
> +		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clock-frequency = <24000000>;
> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart1m0_xfer_pins>;
> +		status = "disabled";
> +	};
> +
> +	uart2: serial@20880000 {
> +		compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
> +		reg = <0x20880000 0x100>;
> +		interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clock-frequency = <24000000>;
> +		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart2m0_xfer_pins>;
> +		status = "disabled";
> +	};
> +
> +	wdt: watchdog@208d0000 {
> +		compatible = "snps,dw-wdt";
> +		reg = <0x208d0000 0x100>;
> +		clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
> +		clock-names = "tclk", "pclk";
> +		interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +		status = "disabled";
> +	};
> +
> +	sdmmc0: mmc@20d20000 {
> +		compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x20d20000 0x4000>;
> +		interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_SDMMC0>, <&cru CCLK_SDMMC0>;
> +		clock-names = "biu", "ciu";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;
> +		pinctrl-names = "normal", "idle";

What is "normal" and "idle" and how are they used, something downstream
specific? Should probably just be "default".

> +		pinctrl-0 = <&sdmmc0_det_pins
> +			     &sdmmc0_clk_pins
> +			     &sdmmc0_cmd_pins
> +			     &sdmmc0_bus4_pins>;
> +		pinctrl-1 = <&sdmmc0_det_pins
> +			     &sdmmc0_clk_idle_pins
> +			     &sdmmc0_cmd_idle_pins
> +			     &sdmmc0_bus4_idle_pins>;
> +		status = "disabled";
> +	};
> +
> +	emmc: mmc@20d30000 {
> +		compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
> +		reg = <0x20d30000 0x4000>;
> +		interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru HCLK_EMMC>, <&cru CCLK_EMMC>;
> +		clock-names = "biu", "ciu";
> +		fifo-depth = <0x100>;
> +		max-frequency = <150000000>;

This seem to be missing the default pinctrl, any reason they are?

> +		status = "disabled";
> +	};
> +
> +	fspi0: spi@20d40000 {
> +		compatible = "rockchip,sfc";
> +		reg = <0x20d40000 0x4000>;
> +		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +		clocks = <&cru SCLK_SFC_2X>, <&cru HCLK_SFC>;
> +		clock-names = "clk_sfc", "hclk_sfc";
> +		#address-cells = <1>;
> +		#size-cells = <0>;

Same here.

> +		status = "disabled";
> +	};
> +
> +	system_sram: sram@210f6000 {
> +		compatible = "mmio-sram";
> +		reg = <0x210f6000 0x8000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x210f6000 0x8000>;
> +	};
> +
> +	pinctrl: pinctrl {
> +		compatible = "rockchip,rv1103b-pinctrl";
> +		rockchip,grf = <&ioc>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gpio0: gpio@20520000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x20520000 0x200>;
> +			interrupts = <GIC_SPI 75 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_PMU_GPIO0>, <&cru DBCLK_PMU_GPIO0>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 0 32>;

Looking at the datasheet and code for rv1103b/rv1106b there does not
seem to be full use of the 32 pins, and only up to 14 pins are routed?

> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio1: gpio@20d80000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x20d80000 0x200>;
> +			interrupts = <GIC_SPI 79 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 32 32>;

Similar here, only up to pin 29 is routed?

> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +
> +		gpio2: gpio@20840000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0x20840000 0x200>;
> +			interrupts = <GIC_SPI 83 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 64 32>;

And here only up to 16 pins.

I would recommend you drop the gpio-ranges for now until this has been
cleared up.

Regards,
Jonas

> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> +
> +#include "rv1103b-pinctrl.dtsi"


