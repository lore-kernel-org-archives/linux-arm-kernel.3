Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 10EE2C021B3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 20 Feb 2025 12:55:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=9DffhNrPcUzIEElQIbfgvQkqEMxys90jw9y7T3DeJtc=; b=Bx4213Mm/iZvQYbxZx5Mw/8tl7
	VrtsfmnYMOIQ79fa7DQI74rqlIVfMc/FMtQDQvkEhJugtd7F5RmaieaTbvguGqKqHvbEArYtgrNgo
	sbYZspu5nKDyRN5vrO1Wg+fbhTySpHEcBQPv1yIxfDiFTviDm449hs044v6oZjazqbCucyZM99GuJ
	XX7HOa3c+RNwVQp0rlMFWc5Erlx6qgvxTCQcBU5OFl4XcjO24NPMbLIWpwBS3ZDuhFk67LH38N+u9
	D0bQkdpzqyofCIH939Z3JryiYNjDbQ1sF9AKW6Oo33zmlekyfU5MQ2crRJ7XQhGL31+Xv9PcGwjD1
	3R8aCWIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tl65E-00000000uIl-0FgE;
	Thu, 20 Feb 2025 12:55:16 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tl5a9-00000000lq9-2Bt5
	for linux-arm-kernel@lists.infradead.org;
	Thu, 20 Feb 2025 12:23:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3F9626141D;
	Thu, 20 Feb 2025 12:23:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 9AE41C4CED6;
	Thu, 20 Feb 2025 12:23:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1740054188;
	bh=zP3WV3mb1xbC31ux1gHd3T9UxMlHrw7icwz6IDkeOXg=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=PXeggeeU6bsLdtRGgrxmMbxGmmyDYMnqSGzqUNew9vJwXnoDC1A6H8d3IGlWhioqu
	 grtPRQbMrQGu2yUQdwpgTF6ZtWbDxuQ1MxeqdwpjzLAfgEd2m5ehNKdjj1miDq9oKg
	 v6AIiHYf7sqCBTNzd0X1HSgdMh5wIXa1V7fKrjgwltf9zGCSwbvEc6pq1Kpgy0oA1S
	 w9nSDXqeRzDqru2Ap0oPUB7X2DkSXWUlGXlHkn1X8IlnOFJVPj55RGWDn3S4vzpLT0
	 KvFOFjgU7IjFIML97sUKsMeKbprjYUnPuAZelJZZnU7PfgquE/rvj6Jw5XVjgWVuXy
	 fjuM6/NA/+jZA==
Message-ID: <f56e9c68-0745-43c1-ae80-e2dc0942ea07@kernel.org>
Date: Thu, 20 Feb 2025 13:23:03 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 6/6] arm64: dts: cix: add initial CIX P1(SKY1) dts support
To: Peter Chen <peter.chen@cixtech.com>, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, catalin.marinas@arm.com, will@kernel.org, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cix-kernel-upstream@cixtech.com,
 "Fugang . duan" <fugang.duan@cixtech.com>
References: <20250220084020.628704-1-peter.chen@cixtech.com>
 <20250220084020.628704-7-peter.chen@cixtech.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250220084020.628704-7-peter.chen@cixtech.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250220_042309_682011_4D75D9B7 
X-CRM114-Status: GOOD (  20.22  )
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

On 20/02/2025 09:40, Peter Chen wrote:
> CIX SKY1 SoC is high performance Armv9 SoC designed by Cixtech,
> and Orion O6 is open source motherboard launched by Radxa.
> See below for detail:
> https://docs.radxa.com/en/orion/o6/getting-started/introduction
> 
> In this commit, it only adds limited components for running initramfs
> at Orion O6.
> 

Test the patches before posting.

> Acked-by: Fugang.duan <fugang.duan@cixtech.com>

Again, difference in names...

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

Never tested.

It does not look like you tested the DTS against bindings. Please run
`make dtbs_check W=1` (see
Documentation/devicetree/bindings/writing-schema.rst or
https://www.linaro.org/blog/tips-and-tricks-for-validating-devicetree-sources-with-the-devicetree-schema/
for instructions).
Maybe you need to update your dtschema and yamllint. Don't rely on
distro packages for dtschema and be sure you are using the latest
released dtschema.

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

This is not part of the SoC, but board.

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

Labels are lowercase.

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

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation

cpu@

> +			compatible = "arm,armv8";
> +			enable-method = "psci";
> +			reg = <0x0 0x0>;
> +			device_type = "cpu";
> +			capacity-dmips-mhz = <403>;
> +		};
> +
> +		CPU1: cpu1@100 {

cpu@

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

This does not look like part of SoC.


> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		device_type = "memory";
> +		reg = <0x00000000 0x80000000 0x1 0x00000000>;

Order properties according to DTS coding style.

> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	pmu: pmu {

Keep some sort of order. See DTS coding style.

> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gic>;
> +		status = "okay";

Where did you disable it? Why only this has status=okay but other do not?

> +	};
> +
> +	pmu_spe: pmu_spe {

DTS coding style. No underscores.

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

This does not look like part of SoC.

> +			compatible = "shared-dma-pool";
> +			reusable;
> +			size = <0x0 0x28000000>;
> +			linux,cma-default;
> +		};
> +
> +	};
> +
> +	sky1_fixed_clocks: fixed-clocks {
> +		uartclk: uartclk {
> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-frequency = <100000000>;
> +			clock-output-names = "uartclk";
> +		};
> +
> +		uart_apb_pclk: uart_apb_pclk {

This code is not getting better...

Where are these clocks physically?

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

DTS coding style.

> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +			interrupt-parent = <&gic>;
> +
> +			its_pcie: its@e050000 {
> +				compatible = "arm,gic-v3-its";
> +				msi-controller;
> +				reg = <0x0 0x0e050000 0x0 0x30000>;
> +			};
> +		};
> +	};
> +};


Best regards,
Krzysztof

