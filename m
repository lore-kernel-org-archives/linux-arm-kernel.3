Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B8EA6EB26EF
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 17:05:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9MVkB8lrQ34cNgWh1QfFiJOeYfoOLDuP+neEVhfWzFg=; b=QtSmcWW2icpmuZa8FlSLKfUsbL
	HyTgTluMuSxNIXVfTN+7CfrY4YL33i98lwrbHNqK2arMw3nlPernJWPYoN+5Ctp8SKDglkHiv2Lz9
	Agm3o3FqbcnzheHAzuPGvJD5/sxZYgYSM0h2Shv/wMKyrkZRd5MOOjV/jgaZsto03YhuUgv7F5F1n
	5Fze3P4fM1uAjJCuY+kVWlFhpDYQJv+Bj3u+P6aw6bEFQVbx6YHungi7Csleg9dIb72hugxFWJC0e
	dtCz6jZ+e9qO9dxth6HCY2dI+QH0Qoq2O529aZhUrWOVMgKhxTuKF56v8UL2/YKcGyBewMiBUYA8T
	CMHzBp0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprBJ-0000000HIXa-1uJB;
	Tue, 10 Feb 2026 17:05:45 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vprBF-0000000HIVu-2ezp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 17:05:43 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1770743139;
 bh=9MVkB8lrQ34cNgWh1QfFiJOeYfoOLDuP+neEVhfWzFg=;
 b=wAl6ZGw1vdb/n3rOzDXKcRf9RYcYX1LUdsU4UAUXTt82maywGFjAL2Zb9efVGPmQ2I8gh9iWh
 t3sGK1t17SRGaMEXixsYpS5ud3AxyCFTNjRUAb9DuAQcrWSmsSZ5K0jIc03ZcxMZfBCnKy0/ehX
 wuXx87ekNYTjskrYilDQ7xuKwv6P4DI8eKLXHr53nBdTw9DZvz+ak6HphKITFBjTmjUwM2ISnry
 WqfRT7KNCG5+cYJ+uF70vZPt9j3j5LMsddiIjhP64spEisHxSF5ZkQuBnWXqeUFJURAqnsuw++O
 ibsNitIUkUhyin7h7AioPlPtA2I9zdFBbQpsTfcSGLEg==
X-Forward-Email-ID: 698b6562e8cd0604c09e962b
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <5952b842-2ff5-4843-bf40-72364e2e4bec@kwiboo.se>
Date: Tue, 10 Feb 2026 18:05:34 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] ARM: dts: rockchip: Add support for RV1103B
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
References: <20260210144845.317048-1-festevam@gmail.com>
 <20260210144845.317048-2-festevam@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260210144845.317048-2-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_090541_802657_D29BD625 
X-CRM114-Status: GOOD (  23.17  )
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

On 2/10/2026 3:48 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add the initial RV1103B devicetree.
> 
> Based on the 5.10 Rockchip vendor kernel.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> The <dt-bindings/clock/rockchip,rv1103b-cru.h> header comes from another
> series:
> 
> https://lore.kernel.org/linux-devicetree/20260210022620.172570-1-festevam@gmail.com/
> 
> Maybe Heiko could apply the clock series as well?
> 
> Changes since v1:
> - Pass /omit-if-no-ref/
> - Removed redundant _pins suffix.
> - Dd not merge all GRF region.
> - Removed unnecessary clock rate from the UART nodes.
> - Removed "normal" and "idle" pinctrl entries and used "default" instead.
> - Added missing default pinctrl entries for emmc, sd and fspi.
> - Removed gpio-ranges.
>  
>  .../boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 962 ++++++++++++++++++
>  arch/arm/boot/dts/rockchip/rv1103b.dtsi       | 250 +++++
>  2 files changed, 1212 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi
> 
> diff --git a/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
> new file mode 100644
> index 000000000000..d859df6b6a97
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
> @@ -0,0 +1,962 @@
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

Node names should not contain _ (underscore), same for more pinctrl
groups.

> +		/omit-if-no-ref/
> +		cam_clk0: cam-clk0 {
> +			rockchip,pins =
> +				/* cam_clk0_out */
> +				<1 RK_PB5 1 &pcfg_pull_none>;
> +		};
> +	};

[snip]

> +};
> +
> +/*
> + * This part is edited manually.

Why not merged with above? What is the pin2dts tool, is it some vendor
script/tool?

> + */
> +&pinctrl {
> +	sdmmc0 {
> +		/omit-if-no-ref/
> +		sdmmc0_bus1: sdmmc0-bus1 {
> +			rockchip,pins =
> +				/* sdmmc0_d0 */
> +				<1 RK_PB0 1 &pcfg_pull_up_drv_level_2>;
> +		};
> +	};
> +
> +	sdmmc1 {
> +		sdmmc1_bus1: sdmmc1-bus1 {
> +			rockchip,pins =
> +				/* sdmmc1_d0 */
> +				<2 RK_PA1 1 &pcfg_pull_up_drv_level_2>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/rockchip/rv1103b.dtsi b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
> new file mode 100644
> index 000000000000..c3de700ade46
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b.dtsi
> @@ -0,0 +1,250 @@
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
> +#include <dt-bindings/soc/rockchip,boot-mode.h>
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
> +		bootph-all;
> +	};

As mentioned in prior review, this and other nodes should be grouped
under a soc node, please see e.g. rk3528, rk3562 or rk3576.dtsi.

> +	pmu_grf: syscon@20160000 {
> +		compatible = "rockchip,rv1103b-pmu-grf", "syscon", "simple-mfd";
> +		reg = <0x20160000 0x1000>;
> +
> +		reboot_mode: reboot-mode {
> +			compatible = "syscon-reboot-mode";
> +			offset = <0x200>;
> +			mode-normal = <BOOT_NORMAL>;
> +			mode-recovery = <BOOT_RECOVERY>;
> +			mode-bootloader = <BOOT_FASTBOOT>;
> +			mode-loader = <BOOT_BL_DOWNLOAD>;
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
> +		clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart0m0_xfer>;
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
> +		pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
> +		status = "disabled";
> +	};
> +
> +	uart1: serial@20870000 {
> +		compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
> +		reg = <0x20870000 0x100>;
> +		interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart1m0_xfer>;
> +		status = "disabled";
> +	};
> +
> +	uart2: serial@20880000 {
> +		compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
> +		reg = <0x20880000 0x100>;
> +		interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-shift = <2>;
> +		reg-io-width = <4>;
> +		clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +		clock-names = "baudclk", "apb_pclk";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&uart2m0_xfer>;
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
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdmmc0_det &sdmmc0_clk &sdmmc0_cmd &sdmmc0_bus4>;
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
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus4>;
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
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&fspi_bus4 &fspi_cs0 &fspi_clk>;
> +		status = "disabled";
> +	};

All nodes above should be grouped under the soc node. Unsure about the
sram and pinctrl, check the other most recent RK SoCs dtsi files.

Regards,
Jonas

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
> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +		};
> +	};
> +};
> +
> +#include "rv1103b-pinctrl.dtsi"


