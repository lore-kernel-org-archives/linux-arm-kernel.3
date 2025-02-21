Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B6D3C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 21 Feb 2025 22:48:35 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=pRP8blxbOGHohg0vq/Ye1zPW/LisdnR2D5EVlQRA9PA=; b=zRVVBPzd6+4uVh8GzqzI7s9cxC
	yEioCCyX8C2G90uHCO7V9cDWDyWbuZys3DApvZTmdUy2a1YLJf3Vyk+vKe0AuNEsYwSNVhp0QQAzV
	le+9jwnXDWqDBpc0fyrqmIZzP43BF2/B0reeZ97J8c2ZzurgkyDij/7u4osIa3jeJXDNesOrP7O+f
	xZpShZ3V/a+LfW4ZJrK12nciNe5ibgG5QqiUH3fsf804VejV+Ii2pgcKaSwzWZQfRLQUNsHMGR+tB
	Q6XzVPiuVbbc5R6eE7GMJfnZIWUbvY5+6QU0iQcWNgLgPnxNtSbUxwcjq127bJM0kbTSsKqeuQ4VM
	80mrt8cw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbon-0000000754F-2t46;
	Fri, 21 Feb 2025 22:48:25 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tlbnK-000000074sH-0Z2W
	for linux-arm-kernel@lists.infradead.org;
	Fri, 21 Feb 2025 22:46:55 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 8A0AE5C6DE8;
	Fri, 21 Feb 2025 22:46:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 28C00C4CED6;
	Fri, 21 Feb 2025 22:46:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740178013;
	bh=Bj5XeMMlWNoOQqinEQeMbQ7s90ZmJ+tHoedMx1SjyTw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PGkQXt1/qiDU9PqRG/31BKqsYquB3kRz/AgzXjg0qHJf4pf6V+4nenrvojOZp1+N6
	 Ku2CohG2BCz/UqFF3eGk+B4Sxm4/1EIUECT94Ns6zb+ony1CY3viqGwiN6nRK+Ft2a
	 MkA8l7mUu27JpcFb3f+lunbDBRCQZNpBXpG5QFN+SZLOvkPyDKGmIY/Zk69d6QO8Fe
	 9S2F3CLRQKP3N0G60tztoim059YpcJxNzFW+qDsG7xxYKHjCxppp23eSctNs1tua2G
	 AjQumYwweVBfcSLz/zv/mjfZZEfBUVullfyOQ/TC19hIr3jskScFzdxiiGnzyKGVmQ
	 ZH5vuhtG0A+xA==
Date: Fri, 21 Feb 2025 16:46:51 -0600
From: Rob Herring <robh@kernel.org>
To: Peter Chen <peter.chen@cixtech.com>
Cc: krzk+dt@kernel.org, conor+dt@kernel.org, catalin.marinas@arm.com,
	will@kernel.org, arnd@arndb.de,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
	"Fugang . duan" <fugang.duan@cixtech.com>
Subject: Re: [PATCH 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
Message-ID: <20250221224651.GA195444-robh@kernel.org>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
 <20250220084020.628704-7-peter.chen@cixtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250220084020.628704-7-peter.chen@cixtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250221_144654_267036_85A64094 
X-CRM114-Status: GOOD (  18.38  )
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

On Thu, Feb 20, 2025 at 04:40:20PM +0800, Peter Chen wrote:
> CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> and Orion O6 is open source motherboard launched by Radxa.
> See below for detail:
> https://docs.radxa.com/en/orion/o6/getting-started/introduction
> 
> In this commit, it only adds limited components for running initramfs
> at Orion O6.
> 
> Acked-by: Fugang.duan <fugang.duan@cixtech.com>
> Signed-off-by: Peter Chen <peter.chen@cixtech.com>
> ---
>  arch/arm64/boot/dts/Makefile              |   1 +
>  arch/arm64/boot/dts/cix/Makefile          |   2 +
>  arch/arm64/boot/dts/cix/sky1-orion-o6.dts |  21 ++
>  arch/arm64/boot/dts/cix/sky1.dtsi         | 264 ++++++++++++++++++++++
>  4 files changed, 288 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/cix/Makefile
>  create mode 100644 arch/arm64/boot/dts/cix/sky1-orion-o6.dts
>  create mode 100644 arch/arm64/boot/dts/cix/sky1.dtsi
> 
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 79b73a21ddc2..8e7ccd0027bd 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -13,6 +13,7 @@ subdir-y += bitmain
>  subdir-y += blaize
>  subdir-y += broadcom
>  subdir-y += cavium
> +subdir-y += cix
>  subdir-y += exynos
>  subdir-y += freescale
>  subdir-y += hisilicon
> diff --git a/arch/arm64/boot/dts/cix/Makefile b/arch/arm64/boot/dts/cix/Makefile
> new file mode 100644
> index 000000000000..ed3713982012
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cix/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_CIX) += sky1-orion-o6.dtb
> diff --git a/arch/arm64/boot/dts/cix/sky1-orion-o6.dts b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> new file mode 100644
> index 000000000000..dbee1616076d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cix/sky1-orion-o6.dts
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "sky1.dtsi"
> +/ {
> +	model = "Radxa Orion O6";
> +	compatible = "radxa,orion-o6";
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +};
> +
> +&uart2 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/cix/sky1.dtsi b/arch/arm64/boot/dts/cix/sky1.dtsi
> new file mode 100644
> index 000000000000..d98735f782e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cix/sky1.dtsi
> @@ -0,0 +1,264 @@
> +// SPDX-License-Identifier: BSD-3-Clause
> +/*
> + * Copyright 2025 Cix Technology Group Co., Ltd.
> + *
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial2 = &uart2;
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&CPU0>;
> +				};
> +				core1 {
> +					cpu = <&CPU1>;
> +				};
> +				core2 {
> +					cpu = <&CPU2>;
> +				};
> +				core3 {
> +					cpu = <&CPU3>;
> +				};
> +				core4 {
> +					cpu = <&CPU4>;
> +				};
> +				core5 {
> +					cpu = <&CPU5>;
> +				};
> +				core6 {
> +					cpu = <&CPU6>;
> +				};
> +				core7 {
> +					cpu = <&CPU7>;
> +				};
> +				core8 {
> +					cpu = <&CPU8>;
> +				};
> +				core9 {
> +					cpu = <&CPU9>;
> +				};
> +				core10 {
> +					cpu = <&CPU10>;
> +				};
> +				core11 {
> +					cpu = <&CPU11>;
> +				};
> +			};
> +		};
> +
> +		CPU0: cpu0@0 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x0>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <403>;
> +		};
> +
> +		CPU1: cpu1@100 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x100>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <403>;
> +		};
> +
> +		CPU2: cpu2@200 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x200>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <403>;
> +		};
> +
> +		CPU3: cpu3@300 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x300>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <403>;
> +		};
> +
> +		CPU4: cpu4@400 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x400>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		CPU5: cpu5@500 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x500>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		CPU6: cpu6@600 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x600>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		CPU7: cpu7@700 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x700>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		CPU8: cpu8@800 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x800>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		CPU9: cpu9@900 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x900>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		CPU10: cpu10@a00 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0xa00>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +
> +		CPU11: cpu11@b00 {
> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0xb00>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <1024>;
> +		};
> +	};
> +
> +	arch_timer: timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +		clock-frequency = <1000000000>;
> +		interrupt-parent = <&gic>;
> +		arm,no-tick-in-suspend;
> +	};
> +
> +	memory@80000000 {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		device_type = "memory";
> +		reg = <0x00000000 0x80000000 0x1 0x00000000>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	pmu: pmu {
> +		compatible = "arm,armv8-pmuv3";

Also needs the CPU model specific compatible string.

> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gic>;
> +		status = "okay";

okay is the default, don't need status.

> +	};
> +
> +	pmu_spe: pmu_spe {
> +		compatible = "arm,statistical-profiling-extension-v1";
> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gic>;
> +		status = "okay";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x28000000>;
> +			linux,cma-default;
> +		};
> +
> +	};
> +
> +	sky1_fixed_clocks: fixed-clocks {

Drop this container node.

> +		uartclk: uartclk {

clock-100000000 for the node name.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <100000000>;
> +			clock-output-names = "uartclk";
> +		};
> +
> +		uart_apb_pclk: uart_apb_pclk {

Similar here.

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <200000000>;
> +			clock-output-names = "apb_pclk";
> +		};
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		dma-ranges;
> +
> +		uart2: uart@040d0000 {

serial@...

> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0x040d0000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-names = "uartclk", "apb_pclk";
> +			clocks = <&uartclk>, <&uart_apb_pclk>;
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@0e001000 {
> +			compatible = "arm,gic-v3";
> +			#address-cells = <2>;
> +			#interrupt-cells = <3>;
> +			#size-cells = <2>;
> +			ranges;
> +			interrupt-controller;
> +			#redistributor-regions = <1>;
> +			reg = <0x0 0x0e010000 0 0x10000>,	/* GICD */
> +			      <0x0 0x0e090000 0 0x300000>;       /* GICR * 12 */
> +			redistributor-stride = <0x40000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-parent = <&gic>;
> +
> +			its_pcie: its@e050000 {

msi-controller@...

> +				compatible = "arm,gic-v3-its";
> +				msi-controller;
> +				reg = <0x0 0x0e050000 0x0 0x30000>;
> +			};
> +		};
> +	};
> +};
> -- 
> 2.25.1
> 

