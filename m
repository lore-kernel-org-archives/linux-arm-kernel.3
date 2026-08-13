Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CFB01C5DF66
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 22:07:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zU1zh+2xnSpbv+2JvapkK/MkxD5INkmwoUDjTmGUnZ8=; b=qXD0fYMVq8kNBUiH9KEyVMYe2A
	LOjrWf6ijwLVkyk6O9Mpoj9ORnQ5wx7BTn9Pk/ly3rU/j237Mb8QxX2UPnMjQhxSXfHVo3mZkbjoA
	1c1toNTvjFQfyjCsg7eGp6xFUIfxq1o/kBRaqfRmrmSpCj1piO3ngNC13b+xHq08reKeAGIFK5a3w
	dJD6jAC4l+jDH0lCkhf2SW9QhKaQQwAR5nXNSPDYzmnODFIDr1+RJqLR2PvlAJYdcOAdV29AroEk7
	JtMwR1How2el5gG/NKen/B6PEltOkF9+t9+hCiRfT20/VH70TyZU79Umdiq9hM5eR9txkj5UcC12s
	cDdIwN7w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wudZd-00000001gB6-2Rcp;
	Thu, 13 Aug 2026 22:06:53 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wudZZ-00000001g9v-25Um
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 22:06:52 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1786658807;
 bh=zU1zh+2xnSpbv+2JvapkK/MkxD5INkmwoUDjTmGUnZ8=;
 b=R1AxefibOLpO/PP5KVdkhTuwCQ3XSRcWJ99XIh3O9XrFFMrGc+9yHeFNk4MYATc7WYRrpOsEC
 +cIhBlpODBdmqNrE6dOY6ZJtsSmtKD+5vwYdMvTEKBtzLnjXhsJ6vm0hTJQJGiB8RjiMJlGNAek
 JORktaQveiuYKZHzcSymtv/DPG7WEB1CzeyZZhPK5doa6PBxgw8lTj1AynbmRq7YRZSNvsAXgHM
 sxcSvcEWkO1g/40HUCgJdeYiYooAblqvIQagDt0s+VqMPLimeCnRTpKIkXOT02hmsvkHL8UzUVF
 aQiR3DwC+ppggKPoqmua1NoHssavKs5yYQD+8rEw0BNA==
X-Forward-Email-ID: 6a7e3ff3ec3883d7e2c9c323
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.13.16
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <77db5493-8f9b-45e3-b313-a90f7a2a8187@kwiboo.se>
Date: Fri, 14 Aug 2026 00:06:39 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/6] ARM: dts: rockchip: Add support for RV1106 and
 RV1103
To: Simon Glass <sjg@chromium.org>, Heiko Stuebner <heiko@sntech.de>
Cc: Fabio Estevam <festevam@nabladev.com>,
 linux-rockchip@lists.infradead.org, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, Albert Aribaud <albert.u.boot@aribaud.net>,
 Conor Dooley <conor+dt@kernel.org>, Jeffy Chen <jeffy.chen@rock-chips.com>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Rob Herring <robh@kernel.org>,
 huang lin <hl@rock-chips.com>, linux-kernel@vger.kernel.org
References: <20260729133609.3465563-1-sjg@chromium.org>
 <20260729133609.3465563-5-sjg@chromium.org>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260729133609.3465563-5-sjg@chromium.org>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260813_150650_006752_A4B38651 
X-CRM114-Status: GOOD (  22.64  )
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

Hi Simon,

On 7/29/2026 3:35 PM, Simon Glass wrote:
> Add the devicetree files for the Rockchip RV1106, a Cortex-A7 SoC
> aimed at IP cameras, and its RV1103 package variant, which has fewer
> pins and no GPIO2 bank. The pinctrl data comes from the vendor kernel in
> the Luckfox Pico  SDK [1] at commit 824b817f8 (a Linux 5.10.160 kernel
> tree).
> 
> [1] https://github.com/LuckfoxTECH/luckfox-pico
> 
> Signed-off-by: Simon Glass <sjg@chromium.org>
> ---
> 
> Changes in v3:
> - Use the per-bank IOC compatibles
> 
> Changes in v2:
> - Take the MMC drive and sample phase clocks from the CRU and drop the
>   grf-cru node
> - Give each GPIO bank a syscon for its own IOC block, referenced by a
>   rockchip,grf phandle in the bank node
> - Add gpio aliases, which the pin controller and gpio drivers use to
>   identify the bank; the rv1103 removes the gpio2 alias
> 
>  arch/arm/boot/dts/rockchip/rv1103.dtsi        |   16 +
>  .../arm/boot/dts/rockchip/rv1106-pinctrl.dtsi | 1398 +++++++++++++++++
>  arch/arm/boot/dts/rockchip/rv1106.dtsi        |  321 ++++
>  3 files changed, 1735 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1106-pinctrl.dtsi
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1106.dtsi
> 
> diff --git a/arch/arm/boot/dts/rockchip/rv1103.dtsi b/arch/arm/boot/dts/rockchip/rv1103.dtsi
> new file mode 100644
> index 000000000000..025fde5bf09c
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103.dtsi
> @@ -0,0 +1,16 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include "rv1106.dtsi"
> +
> +/ {
> +	compatible = "rockchip,rv1103";
> +
> +	aliases {
> +		/delete-property/ gpio2;
> +	};
> +};
> +
> +/delete-node/ &gpio2;

[snip]

> diff --git a/arch/arm/boot/dts/rockchip/rv1106.dtsi b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> new file mode 100644
> index 000000000000..70d3da6bd03e
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1106.dtsi
> @@ -0,0 +1,321 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + */
> +
> +#include <dt-bindings/clock/rockchip,rv1106-cru.h>
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	compatible = "rockchip,rv1106";
> +
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		gpio0 = &gpio0;
> +		gpio1 = &gpio1;
> +		gpio2 = &gpio2;
> +		gpio3 = &gpio3;
> +		gpio4 = &gpio4;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@f00 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a7";
> +			reg = <0xf00>;
> +			clocks = <&cru ARMCLK>;
> +		};
> +	};
> +
> +	arm-pmu {
> +		compatible = "arm,cortex-a7-pmu";
> +		interrupts = <GIC_SPI 126 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-affinity = <&cpu0>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv7-timer";
> +		clock-frequency = <24000000>;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +	};
> +
> +	xin24m: oscillator {
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +		clock-output-names = "xin24m";
> +		#clock-cells = <0>;
> +	};
> +
> +	pinctrl: pinctrl {
> +		compatible = "rockchip,rv1106-pinctrl";
> +		rockchip,grf = <&gpio1_ioc>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		gpio0: gpio@ff380000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0xff380000 0x100>;
> +			interrupts = <GIC_SPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_PMU_GPIO0>, <&cru DBCLK_PMU_GPIO0>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 0 32>;

This is incorrect hw description, only pins A0-A6 are used from gpio0.

> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			rockchip,grf = <&gpio0_ioc>;
> +		};
> +
> +		gpio1: gpio@ff530000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0xff530000 0x100>;
> +			interrupts = <GIC_SPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO1>, <&cru DBCLK_GPIO1>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 32 32>;

Same here, only  pins A0-A4, B0-B3, C0-C7 and D0-D3 are used from gpio1.

> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			rockchip,grf = <&gpio1_ioc>;
> +		};
> +
> +		gpio2: gpio@ff540000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0xff540000 0x100>;
> +			interrupts = <GIC_SPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO2>, <&cru DBCLK_GPIO2>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 64 32>;

And here, only pins A0-A7 and B0-B1 are used from gpio2.

> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			rockchip,grf = <&gpio2_ioc>;
> +		};
> +
> +		gpio3: gpio@ff550000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0xff550000 0x100>;
> +			interrupts = <GIC_SPI 11 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO3>, <&cru DBCLK_GPIO3>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 96 32>;

And here, only pins A1-A7, B0-B7, C0-C7 and D0-D3 from gpio3.

> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			rockchip,grf = <&gpio3_ioc>;
> +		};
> +
> +		gpio4: gpio@ff560000 {
> +			compatible = "rockchip,gpio-bank";
> +			reg = <0xff560000 0x100>;
> +			interrupts = <GIC_SPI 13 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru PCLK_GPIO4>, <&cru DBCLK_GPIO4>;
> +			gpio-controller;
> +			#gpio-cells = <2>;
> +			gpio-ranges = <&pinctrl 0 128 32>;

And here, only pins A1-A7, B0-B1 and C0-C1 from gpio4.

> +			interrupt-controller;
> +			#interrupt-cells = <2>;
> +			rockchip,grf = <&gpio4_ioc>;
> +		};
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges;
> +
> +		grf: syscon@ff000000 {
> +			compatible = "rockchip,rv1106-grf", "syscon";
> +			reg = <0xff000000 0x68000>;

If we decide to describe all GRFs as a single block, maybe add a comment
with names and base address of each individual GRF being grouped here?

  PERI_GRF	0xFF000000 
  VENC_GRF	0xFF010000 
  NPU_GRF	0xFF018000 
  PMU_GRF	0xFF020000 
  DDR_GRF	0xFF030000 
  CORE_GRF	0xFF040000 
  VI_GRF 	0xFF050000 
  VO_GRF	0xFF060000

> +		};
> +
> +		gic: interrupt-controller@ff1f0000 {
> +			compatible = "arm,gic-400";
> +			reg = <0xff1f1000 0x1000>,
> +			      <0xff1f2000 0x2000>,
> +			      <0xff1f4000 0x2000>,
> +			      <0xff1f6000 0x2000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(1) | IRQ_TYPE_LEVEL_HIGH)>;
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +		};
> +
> +		gpio0_ioc: syscon@ff388000 {
> +			compatible = "rockchip,rv1106-gpio0-ioc", "syscon";
> +			reg = <0xff388000 0x8000>;
> +		};
> +
> +		cru: clock-controller@ff3a0000 {
> +			compatible = "rockchip,rv1106-cru";
> +			reg = <0xff3a0000 0x20000>;
> +			clocks = <&xin24m>;
> +			clock-names = "xin24m";
> +			rockchip,grf = <&grf>;
> +			#clock-cells = <1>;
> +			#reset-cells = <1>;
> +		};
> +
> +		saradc: adc@ff3c0000 {
> +			compatible = "rockchip,rv1106-saradc", "rockchip,rk3588-saradc";
> +			reg = <0xff3c0000 0x100>;
> +			interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru CLK_SARADC>, <&cru PCLK_SARADC>;
> +			clock-names = "saradc", "apb_pclk";

Should probably add default pinctrl here.

> +			#io-channel-cells = <1>;
> +			status = "disabled";
> +		};
> +
> +		uart0: serial@ff4a0000 {
> +			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
> +			reg = <0xff4a0000 0x100>;
> +			interrupts = <GIC_SPI 25 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART0>, <&cru PCLK_UART0>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart1: serial@ff4b0000 {
> +			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
> +			reg = <0xff4b0000 0x100>;
> +			interrupts = <GIC_SPI 26 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART1>, <&cru PCLK_UART1>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart2: serial@ff4c0000 {
> +			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
> +			reg = <0xff4c0000 0x100>;
> +			interrupts = <GIC_SPI 27 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART2>, <&cru PCLK_UART2>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart3: serial@ff4d0000 {
> +			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
> +			reg = <0xff4d0000 0x100>;
> +			interrupts = <GIC_SPI 28 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART3>, <&cru PCLK_UART3>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart4: serial@ff4e0000 {
> +			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
> +			reg = <0xff4e0000 0x100>;
> +			interrupts = <GIC_SPI 29 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART4>, <&cru PCLK_UART4>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		uart5: serial@ff4f0000 {
> +			compatible = "rockchip,rv1106-uart", "snps,dw-apb-uart";
> +			reg = <0xff4f0000 0x100>;
> +			interrupts = <GIC_SPI 30 IRQ_TYPE_LEVEL_HIGH>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			clocks = <&cru SCLK_UART5>, <&cru PCLK_UART5>;
> +			clock-names = "baudclk", "apb_pclk";
> +			status = "disabled";
> +		};
> +
> +		gpio1_ioc: syscon@ff538000 {
> +			compatible = "rockchip,rv1106-gpio1-ioc", "syscon";
> +			reg = <0xff538000 0x8000>;
> +		};
> +
> +		gpio2_ioc: syscon@ff548000 {
> +			compatible = "rockchip,rv1106-gpio2-ioc", "syscon";
> +			reg = <0xff548000 0x8000>;
> +		};
> +
> +		gpio3_ioc: syscon@ff558000 {
> +			compatible = "rockchip,rv1106-gpio3-ioc", "syscon";
> +			reg = <0xff558000 0x8000>;
> +		};
> +
> +		gpio4_ioc: syscon@ff568000 {
> +			compatible = "rockchip,rv1106-gpio4-ioc", "syscon";
> +			reg = <0xff568000 0x8000>;
> +		};
> +
> +		wdt: watchdog@ff5a0000 {
> +			compatible = "rockchip,rv1106-wdt", "snps,dw-wdt";
> +			reg = <0xff5a0000 0x100>;
> +			interrupts = <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru TCLK_WDT_NS>, <&cru PCLK_WDT_NS>;
> +			clock-names = "tclk", "pclk";
> +			status = "disabled";
> +		};
> +
> +		system_sram: sram@ff6c0000 {
> +			compatible = "mmio-sram";
> +			reg = <0xff6c0000 0x40000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0xff6c0000 0x40000>;
> +		};
> +
> +		emmc: mmc@ffa90000 {
> +			compatible = "rockchip,rv1106-dw-mshc", "rockchip,rk3288-dw-mshc";
> +			reg = <0xffa90000 0x4000>;
> +			interrupts = <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru HCLK_EMMC>, <&cru CCLK_SRC_EMMC>,
> +				 <&cru SCLK_EMMC_DRV>, <&cru SCLK_EMMC_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			max-frequency = <200000000>;

Suggest you add default pinctrl here.

> +			status = "disabled";
> +		};
> +
> +		sdmmc: mmc@ffaa0000 {
> +			compatible = "rockchip,rv1106-dw-mshc", "rockchip,rk3288-dw-mshc";
> +			reg = <0xffaa0000 0x4000>;
> +			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru HCLK_SDMMC>, <&cru CCLK_SRC_SDMMC>,
> +				 <&cru SCLK_SDMMC_DRV>, <&cru SCLK_SDMMC_SAMPLE>;
> +			clock-names = "biu", "ciu", "ciu-drive", "ciu-sample";
> +			fifo-depth = <0x100>;
> +			max-frequency = <200000000>;

Same here.

> +			status = "disabled";
> +		};
> +
> +		sfc: spi@ffac0000 {
> +			compatible = "rockchip,sfc";
> +			reg = <0xffac0000 0x4000>;
> +			interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&cru SCLK_SFC>, <&cru HCLK_SFC>;
> +			clock-names = "clk_sfc", "hclk_sfc";

And here.

Regards,
Jonas

> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			status = "disabled";
> +		};
> +	};
> +};
> +
> +#include "rv1106-pinctrl.dtsi"


