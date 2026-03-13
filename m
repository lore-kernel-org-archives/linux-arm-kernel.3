Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 956DD106FD6B
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Mar 2026 03:21:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:MIME-Version:Date:Message-ID:From:References:To:
	Subject:Cc:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqzf+HK52AmiTGxUUo0EEx/IUhQ/Hmm7Tar4trEf9f4=; b=30c5/mBIB3ayFnXUjVVXTV47Kv
	EjEwg632A/pIggJbFzsRsi85FCILcKeJPpgMQ64wb7eDXcVHoSqvUwnnplmCYGwsNRpWlBECbhmYH
	I/WvDz7tbUCz1T5DSgRURMfnCoOcmWuO1ltqUKkSc4nPnxf+2gd385veHsMWDe8fKZEdaCgqIMyME
	WNZDfhibiK10oE/JB4+BB+MuEkRUTx8C5L8XXURuOCkmyV13owdiF03sU9w6IAzIM8h4wercHtfTH
	ws41nOvz8MQKtgbg3cHDuY1OClRWdgGz+nLOWPTLjPmRKlzRPQ6eyLRhUjJ1vY8vmt9kqH+4GauwK
	BYaV5Y/w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0t5r-0000000GMnP-0DrW;
	Fri, 13 Mar 2026 03:21:43 +0000
Received: from mail-m245.xmail.ntesmail.com ([45.195.24.5])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w0t5m-0000000GMmJ-37TB;
	Fri, 13 Mar 2026 03:21:41 +0000
Received: from [172.16.12.17] (unknown [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 36ca46954;
	Fri, 13 Mar 2026 11:16:23 +0800 (GMT+08:00)
Cc: shawn.lin@rock-chips.com, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
Subject: Re: [PATCH v6 2/4] ARM: dts: rockchip: Add support for RV1103B
To: Fabio Estevam <festevam@gmail.com>, heiko@sntech.de
References: <20260313024452.625064-1-festevam@gmail.com>
 <20260313024452.625064-2-festevam@gmail.com>
From: Shawn Lin <shawn.lin@rock-chips.com>
Message-ID: <19e49e21-81f1-1ba6-e946-94da9efdd66c@rock-chips.com>
Date: Fri, 13 Mar 2026 11:16:22 +0800
User-Agent: Mozilla/5.0 (Windows NT 10.0; Win64; x64; rv:78.0) Gecko/20100101
 Thunderbird/78.11.0
MIME-Version: 1.0
In-Reply-To: <20260313024452.625064-2-festevam@gmail.com>
Content-Type: text/plain; charset=gbk; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Tid: 0a9ce531f8a209cckunmd73d32d670470
X-HM-MType: 1
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh5NTVYeTxgZH0hOTxlJHUNWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
DKIM-Signature: a=rsa-sha256;
	b=Ii5yoWw3mZGBrBH4EGKc2cn7Brd6p3wzdvgdahtHNzybIAV4Iy2u+5mZ9kK/WlmDuHFyQeK/SIcV6FWIZg3koDTRrsbevDcgA90x+2i8q1HFI93VWf0ECZU2GyKTxHNYJogh0yBbr/JrMvFXJKarEzyfh7dzdYAKpFr/lv57wTA=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=iqzf+HK52AmiTGxUUo0EEx/IUhQ/Hmm7Tar4trEf9f4=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260312_202139_039061_BABF0247 
X-CRM114-Status: GOOD (  17.46  )
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

在 2026/03/13 星期五 10:44, Fabio Estevam 写道:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Add the initial RV1103B devicetree.
> 
> Based on the 5.10 Rockchip vendor kernel.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v5:
> - Remove unneeded x32k oscillator.
> - Sort the nodes without address unit.
> - Remove bootph-all.
> - Pass a more specific watchdog compatible.
> 
>   .../boot/dts/rockchip/rv1103b-pinctrl.dtsi    | 816 ++++++++++++++++++
>   arch/arm/boot/dts/rockchip/rv1103b.dtsi       | 249 ++++++
>   2 files changed, 1065 insertions(+)
>   create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
>   create mode 100644 arch/arm/boot/dts/rockchip/rv1103b.dtsi
> 
> diff --git a/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
> new file mode 100644
> index 000000000000..539d4d9510c1
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b-pinctrl.dtsi
> @@ -0,0 +1,816 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.

2026?

> + */
> +
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <arm64/rockchip/rockchip-pinconf.dtsi>
> +
> +&pinctrl {
> +	cam-clk0 {
> +		/omit-if-no-ref/
> +		cam_clk0: cam-clk0 {
> +			rockchip,pins =

...

> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2024 Rockchip Electronics Co., Ltd.

Ditto.

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
> +	xin24m: oscillator-24m {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +		#clock-cells = <0>;
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
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		cru: clock-controller@20000000 {
> +			compatible = "rockchip,rv1103b-cru";
> +			reg = <0x20000000 0x81000>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		pmu_grf: syscon@20160000 {
> +			compatible = "rockchip,rv1103b-pmu-grf", "syscon", "simple-mfd";
> +			reg = <0x20160000 0x1000>;
> +
> +			reboot_mode: reboot-mode {
> +				compatible = "syscon-reboot-mode";
> +				offset = <0x200>;
> +				mode-normal = <BOOT_NORMAL>;
> +				mode-recovery = <BOOT_RECOVERY>;
> +				mode-bootloader = <BOOT_FASTBOOT>;
> +				mode-loader = <BOOT_BL_DOWNLOAD>;
> +			};
> +		};
> +
> +		ioc: syscon@20170000 {
> +			compatible = "rockchip,rv1103b-ioc", "syscon";
> +			reg = <0x20170000 0x60000>;
> +		};
> +
> +		gic: interrupt-controller@20411000 {
> +			compatible = "arm,gic-400";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +
> +			reg = <0x20411000 0x1000>,
> +			      <0x20412000 0x2000>,
> +			      <0x20414000 0x2000>,
> +			      <0x20416000 0x2000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +		};
> +
> +		uart0: serial@20540000 {
> +			compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
> +			reg = <0x20540000 0x100>;
> +			interrupts = <GIC_SPI 69 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> +			clock-names = "baudclk", "apb_pclk";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&uart0m0_xfer>;
> +			status = "disabled";
> +		};
> +
> +		sdmmc1: mmc@20650000 {
> +			compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";
> +			reg = <0x20650000 0x4000>;
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru HCLK_SDMMC1>, <&cru CCLK_SDMMC1>;
> +			clock-names = "biu", "ciu";
> +			fifo-depth = <0x100>;
> +			max-frequency = <150000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sdmmc1_clk &sdmmc1_cmd &sdmmc1_bus4>;
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@20870000 {
> +			compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
> +			reg = <0x20870000 0x100>;
> +			interrupts = <GIC_SPI 70 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +			clock-names = "baudclk", "apb_pclk";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&uart1m0_xfer>;
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@20880000 {
> +			compatible = "rockchip,rv1103b-uart", "snps,dw-apb-uart";
> +			reg = <0x20880000 0x100>;
> +			interrupts = <GIC_SPI 71 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +			clock-names = "baudclk", "apb_pclk";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&uart2m0_xfer>;
> +			status = "disabled";
> +		};
> +
> +		wdt: watchdog@208d0000 {
> +			compatible = "rockchip,rv1103b-wdt", "snps,dw-wdt";
> +			reg = <0x208d0000 0x100>;
> +			clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
> +			clock-names = "tclk", "pclk";
> +			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +			status = "disabled";
> +		};
> +
> +		sdmmc0: mmc@20d20000 {
> +			compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";

This's a mistake. RV1103B is using the same IP version with RK3576.
So no ciu-drive and ciu-sample clks are needed as it uses internal phase
block. Here you should use "rockchip,rv1103b-dw-mshc", 
"rockchip,rk3576-dw-mshc".

> +			reg = <0x20d20000 0x4000>;
> +			interrupts = <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru HCLK_SDMMC0>, <&cru CCLK_SDMMC0>;
> +			clock-names = "biu", "ciu";
> +			fifo-depth = <0x100>;
> +			max-frequency = <150000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sdmmc0_det &sdmmc0_clk &sdmmc0_cmd &sdmmc0_bus4>;
> +			status = "disabled";
> +		};
> +
> +		emmc: mmc@20d30000 {
> +			compatible = "rockchip,rv1103b-dw-mshc", "rockchip,rk3288-dw-mshc";

Ditto

> +			reg = <0x20d30000 0x4000>;
> +			interrupts = <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru HCLK_EMMC>, <&cru CCLK_EMMC>;
> +			clock-names = "biu", "ciu";
> +			fifo-depth = <0x100>;
> +			max-frequency = <150000000>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&emmc_clk &emmc_cmd &emmc_bus4>;
> +			status = "disabled";
> +		};
> +
> +		fspi0: spi@20d40000 {
> +			compatible = "rockchip,sfc";
> +			reg = <0x20d40000 0x4000>;
> +			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru SCLK_SFC_2X>, <&cru HCLK_SFC>;
> +			clock-names = "clk_sfc", "hclk_sfc";
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&fspi_bus4 &fspi_cs0 &fspi_clk>;
> +			status = "disabled";
> +		};
> +
> +		system_sram: sram@210f6000 {
> +			compatible = "mmio-sram";
> +			reg = <0x210f6000 0x8000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x210f6000 0x8000>;
> +		};
> +	};
> +};
> +
> +#include "rv1103b-pinctrl.dtsi"
> 

