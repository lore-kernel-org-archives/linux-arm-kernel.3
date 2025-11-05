Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id DC982CCF9F8
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  5 Nov 2025 11:04:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5LZ++IERrV0M8GB8gjp46u/LoVU00TTyIOr8kz07rbk=; b=Ohtz+KVbNqCSgJxJdbshM8jOED
	z70iwLlRNHwVMIqSKgeIuN/IW+Kg4ClYA03Z0aVKyKDHLWXcT27Aj96eFq8x1a35uX5bl1Cb60y4G
	nyb1U8/+gr0y+aHYsmTJj9NhHp1D7zl7B4cz9W5+CQTcEVIXvN7pagfsV2WyaADgQtCcwl68hQ9ZB
	neUjJ0jaXqkAibeKEZuJpeY8CK+ZZNsvySyPITyCf53TcXF1t9m49nghSKr76/Beoq5oNrZ1cU+Fg
	Y/jBrEOGFYw4okOMZLwl8C1JqYErazO3OJdErLtx+dVCzS1kxN+BC1a0Sdl8Du56Egp9MlkDwIErq
	00gXfCyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbJl-0000000DWbK-3nP5;
	Wed, 05 Nov 2025 11:04:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vGbJj-0000000DWas-32OL;
	Wed, 05 Nov 2025 11:04:45 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9E72043C66;
	Wed,  5 Nov 2025 11:04:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 731D8C4CEF8;
	Wed,  5 Nov 2025 11:04:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1762340682;
	bh=mbWo9Mk4kGS5Mb8/GLBUBRNx4+Pv9osUt56v0VveUlA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=exmjBR9/2OeIiA17lbXcHtroB6zMOxHtKAjkqf5bH92oO93IrpDPofQFPpNj+PO4/
	 sswckaQ9lP/sfrMlxYPn5Np9bOkEtWSbId6kMqRwURznC1i+wEPPh2kzU73nMx05Bm
	 4m01084K8gC9N/KJxNs2vN57mmJW2f3V7HbwoP52meZPUkAnX+fMyJJnX2lTes9RXz
	 adRXHciCFlpaZKs1Zr7t21Qi/q4bbHalCUfUFE3/c/Valw603WrQmyhH+YqsOVsIZJ
	 i4At7dwLgffkgfIRgDQXRtSpNGjHMY+Ckh46mKhKFW+UmaUp8UjYcx3O3SpvIdp6Ko
	 Hphl/9r/1f1Uw==
Message-ID: <14b19124-ab99-4ee4-89c9-81e724c4b5bb@kernel.org>
Date: Wed, 5 Nov 2025 12:04:37 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: realtek: Add Kent SoC and EVB device
 trees
To: Yu-Chun Lin <eleanor.lin@realtek.com>, afaerber@suse.de, robh@kernel.org,
 krzk+dt@kernel.org, conor+dt@kernel.org, lee@kernel.org,
 james.tai@realtek.com
Cc: linux-arm-kernel@lists.infradead.org,
 linux-realtek-soc@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, cy.huang@realtek.com, stanley_chang@realtek.com
References: <20251105104452.6336-1-eleanor.lin@realtek.com>
 <20251105104452.6336-4-eleanor.lin@realtek.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20251105104452.6336-4-eleanor.lin@realtek.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251105_030443_815994_94051518 
X-CRM114-Status: GOOD (  16.60  )
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

On 05/11/2025 11:44, Yu-Chun Lin wrote:
> Add Device Tree hierarchy for Realtek Kent SoC family:
> 
> - kent.dtsi: base SoC layer
> - rtd<variant>.dtsi: SoC variant layer
> - rtd<variant>-<board>.dtsi: board layer
> - rtd<variant>-<board>-<config>.dts: board configuration layer
> 
> Include RTD1501S Phantom EVB (8GB), RTD1861B Krypton EVB (8GB), and
> RTD1920S Smallville EVB (4GB).
> 
> Signed-off-by: Yu-Chun Lin <eleanor.lin@realtek.com>
> ---
>  arch/arm64/boot/dts/realtek/Makefile          |   5 +
>  arch/arm64/boot/dts/realtek/kent.dtsi         | 179 ++++++++++++++++++
>  arch/arm64/boot/dts/realtek/rtd1501.dtsi      |  13 ++
>  .../boot/dts/realtek/rtd1501s-phantom-8gb.dts |  26 +++
>  .../boot/dts/realtek/rtd1501s-phantom.dtsi    | 135 +++++++++++++
>  arch/arm64/boot/dts/realtek/rtd1861.dtsi      |  13 ++
>  .../boot/dts/realtek/rtd1861b-krypton-8gb.dts |  26 +++
>  .../boot/dts/realtek/rtd1861b-krypton.dtsi    |  79 ++++++++
>  arch/arm64/boot/dts/realtek/rtd1920.dtsi      |  13 ++
>  .../dts/realtek/rtd1920s-smallville-4gb.dts   |  24 +++
>  .../boot/dts/realtek/rtd1920s-smallville.dtsi | 145 ++++++++++++++
>  11 files changed, 658 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/realtek/kent.dtsi
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1501.dtsi
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1861.dtsi
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton-8gb.dts
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1861b-krypton.dtsi
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1920.dtsi
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville-4gb.dts
>  create mode 100644 arch/arm64/boot/dts/realtek/rtd1920s-smallville.dtsi
> 
> diff --git a/arch/arm64/boot/dts/realtek/Makefile b/arch/arm64/boot/dts/realtek/Makefile
> index ef8d8fcbaa05..0ef0596681ad 100644
> --- a/arch/arm64/boot/dts/realtek/Makefile
> +++ b/arch/arm64/boot/dts/realtek/Makefile
> @@ -13,3 +13,8 @@ dtb-$(CONFIG_ARCH_REALTEK) += rtd1395-bpi-m4.dtb
>  dtb-$(CONFIG_ARCH_REALTEK) += rtd1395-lionskin.dtb
>  
>  dtb-$(CONFIG_ARCH_REALTEK) += rtd1619-mjolnir.dtb
> +
> +dtb-$(CONFIG_ARCH_REALTEK) += rtd1501s-phantom-8gb.dtb
> +dtb-$(CONFIG_ARCH_REALTEK) += rtd1861b-krypton-8gb.dtb
> +dtb-$(CONFIG_ARCH_REALTEK) += rtd1920s-smallville-4gb.dtb

Keep things still ordered alphabetically.

> +
> diff --git a/arch/arm64/boot/dts/realtek/kent.dtsi b/arch/arm64/boot/dts/realtek/kent.dtsi
> new file mode 100644
> index 000000000000..6af3efa0bda4
> --- /dev/null
> +++ b/arch/arm64/boot/dts/realtek/kent.dtsi
> @@ -0,0 +1,179 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +/*
> + * Realtek Kent SoC family
> + *
> + * Copyright (c) 2024 Realtek Semiconductor Corp.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	arch_timer: arch-timer {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI  9 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a78";
> +			reg = <0x0>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_0>;
> +			dynamic-power-coefficient = <454>;
> +			#cooling-cells = <2>;
> +
> +			l2_0: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-line-size = <64>;
> +				cache-sets = <256>;
> +				cache-size = <0x40000>;
> +				cache-unified;
> +				next-level-cache = <&l3>;
> +			};
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a78";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_1>;
> +			dynamic-power-coefficient = <454>;
> +			#cooling-cells = <2>;
> +
> +			l2_1: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-line-size = <64>;
> +				cache-sets = <256>;
> +				cache-size = <0x40000>;
> +				cache-unified;
> +				next-level-cache = <&l3>;
> +			};
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a78";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_2>;
> +			dynamic-power-coefficient = <454>;
> +			#cooling-cells = <2>;
> +
> +			l2_2: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-line-size = <64>;
> +				cache-sets = <256>;
> +				cache-size = <0x40000>;
> +				cache-unified;
> +				next-level-cache = <&l3>;
> +			};
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a78";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +			next-level-cache = <&l2_3>;
> +			dynamic-power-coefficient = <454>;
> +			#cooling-cells = <2>;
> +
> +			l2_3: l2-cache {
> +				compatible = "cache";
> +				cache-level = <2>;
> +				cache-line-size = <64>;
> +				cache-sets = <256>;
> +				cache-size = <0x40000>;
> +				cache-unified;
> +				next-level-cache = <&l3>;
> +			};
> +		};
> +
> +		l3: l3-cache {
> +			compatible = "cache";
> +			cache-level = <3>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			cache-size = <0x00200000>;
> +			cache-unified;
> +		};
> +	};
> +
> +	psci: psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0x00000000 0x00000000 0x00000000 0x00040000>, /* boot code */
> +			 <0x98000000 0x00000000 0x98000000 0x00ef0000>, /* reg-bus */
> +			 <0xa0000000 0x00000000 0xa0000000 0x10000000>, /* PCIE */
> +			 <0xff000000 0x00000000 0xff000000 0x00200000>; /* GIC */
> +
> +		rbus: reg-bus@98000000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).


> +			compatible = "simple-bus";
> +			reg = <0x98000000 0x00ef0000>;

This means it is not a simple-bus.

> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0x00000000 0x98000000 0x00ef0000>,
> +				 <0xa0000000 0xa0000000 0x10000000>; /* PCIE */
> +
> +			iso: syscon@7000 {
> +				compatible = "realtek,iso-system", "syscon", "simple-mfd";
> +				reg = <0x7000 0x1000>;
> +				#address-cells = <1>;
> +				#size-cells = <1>;
> +				ranges = <0x0 0x7000 0x1000>;

Please follow DTS coding style.

> +				reg-io-width = <4>;
No children. You must post complete picture here.

> +			};
> +		};
> +
> +		gic: interrupt-controller@ff100000 {
> +			compatible = "arm,gic-v3";
> +			reg = <0xff100000 0x10000>,
> +			      <0xff140000 0x80000>;
> +			interrupt-controller;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +			#address-cells = <1>;
> +			#interrupt-cells = <3>;
> +			#size-cells = <1>;
> +		};
> +	};
> +};
> +
> +&iso {

What are you overriding? There is no inclusion of other DTSI here.

> +	uart0: serial@800 {
> +		compatible = "snps,dw-apb-uart";
> +		reg = <0x800 0x100>;
> +		clock-frequency = <432000000>;
> +		interrupts = <GIC_SPI 68 IRQ_TYPE_LEVEL_HIGH>;
> +		reg-io-width = <4>;
> +		reg-shift = <2>;
> +		status = "disabled";
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/realtek/rtd1501.dtsi b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
> new file mode 100644
> index 000000000000..1df5d9843505
> --- /dev/null
> +++ b/arch/arm64/boot/dts/realtek/rtd1501.dtsi
> @@ -0,0 +1,13 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +/*
> + * Realtek RTD1501 SoC
> + *
> + * Copyright (c) 2024 Realtek Semiconductor Corp.
> + */
> +
> +#include "kent.dtsi"
> +
> +&uart0 {
> +	status = "okay";
> +};
> +
> diff --git a/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
> new file mode 100644
> index 000000000000..b0e03f3731e2
> --- /dev/null
> +++ b/arch/arm64/boot/dts/realtek/rtd1501s-phantom-8gb.dts
> @@ -0,0 +1,26 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +/*
> + * Realtek RTD1501S Phantom EVB
> + *
> + * Copyright (c) 2024 Realtek Semiconductor Corp.
> + */
> +
> +/dts-v1/;
> +
> +#include "rtd1501s-phantom.dtsi"
> +
> +/ {
> +	compatible = "realtek,phantom", "realtek,rtd1501s";
> +	model = "Realtek Phantom EVB Chromium (8GB)";
> +
> +	memory: memory@40000 {

Drop unused label.

> +		device_type = "memory";
> +		reg = <0x00000000 0x00050000 0x00000000 0x7ffb0000>,

0x0, don't inflate this.

> +		      <0x00000000 0x8a100000 0x00000000 0x0def0000>,
> +		      <0x00000000 0x98700000 0x00000000 0x07900000>,
> +		      <0x00000000 0xa0600000 0x00000000 0x5ea00000>,
> +		      <0x00000001 0x00000000 0x00000000 0xa0000000>,

<0x1 0x00000000 0x0 0xa0000000>,

> +		      <0x00000001 0xa0600000 0x00000000 0x5fa00000>;
> +	};
> +};
> +
> diff --git a/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi b/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
> new file mode 100644
> index 000000000000..bf1e499addf9
> --- /dev/null
> +++ b/arch/arm64/boot/dts/realtek/rtd1501s-phantom.dtsi
> @@ -0,0 +1,135 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-2-Clause)
> +/*
> + * Realtek RTD1501S Phantom EVB
> + *
> + * Copyright (c) 2024 Realtek Semiconductor Corp.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/thermal/thermal.h>
> +#include "rtd1501.dtsi"
> +
> +/ {
> +	chosen {
> +		bootargs = "earlycon=uart8250,mmio32,0x98007800
> +			    console=ttyS0,460800 8250.nr_uarts=2 init=/init
> +			    loglevel=8 max_loop=64 loop.max_part=7
> +			    firmware_class.path=/vendor/firmware/,/vendor/av_fw";

NAK, drop all bootargs. None of above are suitable for mainline. Don't
post all this android or custom initramfs stuff.

> +		stdout-path = "serial0:460800n8";

And you already even have here console!

> +	};
> +
> +	reserved_memory: reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		linux,cma {
> +			compatible = "shared-dma-pool";
> +			alignment = <0x0 0x00400000>;
> +			alloc-ranges = <0x0 0x00000000 0x0 0x20000000>;
> +			size = <0x0 0x02000000>;
> +			reusable;
> +			linux,cma-default;
> +		};
> +	};
> +
> +	cpu_opps: opp-table-cpu {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp800: opp-800000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			opp-microvolt = <830000 830000 1100000>;
> +			status = "okay";

Why? Where did you disable it?

...

Best regards,
Krzysztof

