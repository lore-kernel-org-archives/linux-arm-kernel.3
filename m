Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 90A00D2F011
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 27 Jan 2026 13:22:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:MIME-Version:References:In-Reply-To:Message-ID:Subject:Cc:To:
	From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=zJWI1iXUrVZ/D5lUZV6z+EfYKIvbLMgEQnmYWHnjpe0=; b=QO0Jqi4Wp8EzlkLS1SLLY1oXOh
	b6qAgUtk8Gl5TbodeewxW0fQ8EOozsh3QJ1ldEzKlvCOpzk1IzLkqsq+Y902xd05//aPCMLDd0TY9
	TgZvWQCOJtu8tpaRtkI6N20f+3cY53PfmEaaymowzVIsE2fZK+6OdumIIkqRmmFJFTAy+6K+CD6u/
	bLveCMYixXX4KHE5Dm8jBiz0PiGYGc0JJ2AXMxQRWwvCvvJRV7gKtqzhQigiYekdpbC2CxrfDfDYn
	gdNQlKE+pN7m8rqAPjb46ev5n4ktM+RG9DEoLO0f/Avdw3qWjfoqSttODLaM3rIqUeFburkBbHfqS
	31EU01Kg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkj1f-0000000EIgv-29K1;
	Tue, 27 Jan 2026 13:22:35 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vkj1c-0000000EIgU-3WBp
	for linux-arm-kernel@lists.infradead.org;
	Tue, 27 Jan 2026 13:22:34 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 15C8D1595;
	Tue, 27 Jan 2026 05:22:23 -0800 (PST)
Received: from donnerap.manchester.arm.com (usa-sjc-imap-foss1.foss.arm.com [10.121.207.14])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B21533F632;
	Tue, 27 Jan 2026 05:22:27 -0800 (PST)
Date: Tue, 27 Jan 2026 13:22:06 +0000
From: Andre Przywara <andre.przywara@arm.com>
To: Debbie Horsfall <debbie.horsfall@arm.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>, Lorenzo Pieralisi
 <lpieralisi@kernel.org>, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH 2/2] arm64: dts: zena: Add support for Zena CSS
Message-ID: <20260127132206.036892e4@donnerap.manchester.arm.com>
In-Reply-To: <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
References: <20260123-zena-css-v1-0-34adb95cdf89@arm.com>
 <20260123-zena-css-v1-2-34adb95cdf89@arm.com>
Organization: ARM
X-Mailer: Claws Mail 3.18.0 (GTK+ 2.24.32; aarch64-unknown-linux-gnu)
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260127_052232_981671_321F7CB4 
X-CRM114-Status: GOOD (  34.51  )
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

On Fri, 23 Jan 2026 17:37:47 +0000
Debbie Horsfall <debbie.horsfall@arm.com> wrote:

Hi Debbie,

thanks for taking the time to send this upstream!

> Introduce the Zena CSS Fixed Virtual Platform (FVP) dts. This is
> currently the only Zena CSS variant, however the common definitions are
> included in a common dtsi for extensibility.
> 
> Signed-off-by: Debbie Horsfall <debbie.horsfall@arm.com>
> ---
>  MAINTAINERS                              |   1 +
>  arch/arm64/boot/dts/arm/Makefile         |   1 +
>  arch/arm64/boot/dts/arm/zena-css-fvp.dts |  55 ++
>  arch/arm64/boot/dts/arm/zena-css.dtsi    | 826 +++++++++++++++++++++++++++++++
>  4 files changed, 883 insertions(+)
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 90d88137adf1..d1d2dae6a71e 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -3727,6 +3727,7 @@ ARM/ZENA CSS PLATFORM
>  M:	Debbie Horsfall <debbie.horsfall@arm.com>
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/arm,zena-css.yaml
> +F:	arch/arm64/boot/dts/arm/zena-css*
>  
>  ARM/ZYNQ ARCHITECTURE
>  M:	Michal Simek <michal.simek@amd.com>
> diff --git a/arch/arm64/boot/dts/arm/Makefile b/arch/arm64/boot/dts/arm/Makefile
> index f30ee045dc95..770fb145b4a9 100644
> --- a/arch/arm64/boot/dts/arm/Makefile
> +++ b/arch/arm64/boot/dts/arm/Makefile
> @@ -8,3 +8,4 @@ dtb-$(CONFIG_ARCH_VEXPRESS) += vexpress-v2f-1xv7-ca53x2.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += fvp-base-revc.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += corstone1000-fvp.dtb corstone1000-mps3.dtb
>  dtb-$(CONFIG_ARCH_VEXPRESS) += morello-sdp.dtb morello-fvp.dtb
> +dtb-$(CONFIG_ARCH_VEXPRESS) += zena-css-fvp.dtb
> diff --git a/arch/arm64/boot/dts/arm/zena-css-fvp.dts b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
> new file mode 100644
> index 000000000000..d3c649e894d1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/arm/zena-css-fvp.dts
> @@ -0,0 +1,55 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2025, Arm Limited. All rights reserved.
> + */
> +
> +/dts-v1/;
> +
> +#include "zena-css.dtsi"
> +
> +/ {
> +	model = "Zena CSS Fixed Virtual Platform";
> +	compatible = "arm,zena-css-fvp", "arm,zena-css";
> +
> +	chosen {
> +		stdout-path = &soc_serial0;
> +	};
> +};
> +
> +&soc {
> +	virtio@30060000 {
> +		compatible = "virtio,mmio";
> +		reg = <0x0 0x30060000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 261 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	virtio@30020000 {

I think the nodes should be ordered by their address. Do you make any
assumptions about naming of devices (/dev/vda, /dev/vdb) in your setup?

> +		compatible = "virtio,mmio";
> +		reg = <0x0 0x30020000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 257 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	virtio@30030000 {
> +		compatible = "virtio,mmio";
> +		reg = <0x0 0x30030000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 258 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	virtio@30040000 {
> +		compatible = "virtio,mmio";
> +		reg = <0x0 0x30040000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 259 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	virtio@30050000 {
> +		compatible = "virtio,mmio";
> +		reg = <0x0 0x30050000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 260 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +

Do you know if there is something at 0x30070000? Maybe something that
needs explicit enablement on the model command line? In this case we might
want a comment here.

> +	virtio@30080000 {
> +		compatible = "virtio,mmio";
> +		reg = <0x0 0x30080000 0x0 0x10000>;
> +		interrupts = <GIC_SPI 263 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/arm/zena-css.dtsi b/arch/arm64/boot/dts/arm/zena-css.dtsi
> new file mode 100644
> index 000000000000..7825e93df0a6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/arm/zena-css.dtsi
> @@ -0,0 +1,826 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2025, Arm Limited. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		/*
> +		 * The latency and residency numbers below are for illustrative
> +		 * purpose only and may vary on actual silicon. These values are
> +		 * considered just to demonstrate that the cpuidle governor
> +		 * logic works.
> +		 */
> +		idle-states {
> +			entry-method = "psci";
> +
> +			CPU_SLEEP: cpu-sleep {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x0010000>;
> +				local-timer-stop;
> +				entry-latency-us = <800>;
> +				exit-latency-us = <3200>;
> +				min-residency-us = <4200>;
> +			};
> +			CLUSTER_SLEEP: cluster-sleep {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x1010000>;
> +				local-timer-stop;
> +				entry-latency-us = <1000>;
> +				exit-latency-us = <3200>;
> +				min-residency-us = <4500>;
> +			};
> +		};
> +
> +		cpu-map {
> +
> +			cluster0 {
> +
> +				core0 {
> +					cpu = <&CPU0>;
> +				};
> +
> +				core1 {
> +					cpu = <&CPU1>;
> +				};
> +
> +				core2 {
> +					cpu = <&CPU2>;
> +				};
> +
> +				core3 {
> +					cpu = <&CPU3>;
> +				};
> +			};
> +
> +			cluster1 {
> +
> +				core0 {
> +					cpu = <&CPU4>;
> +				};
> +
> +				core1 {
> +					cpu = <&CPU5>;
> +				};
> +
> +				core2 {
> +					cpu = <&CPU6>;
> +				};
> +
> +				core3 {
> +					cpu = <&CPU7>;
> +				};
> +			};
> +
> +			cluster2 {
> +
> +				core0 {
> +					cpu = <&CPU8>;
> +				};
> +
> +				core1 {
> +					cpu = <&CPU9>;
> +				};
> +
> +				core2 {
> +					cpu = <&CPU10>;
> +				};
> +
> +				core3 {
> +					cpu = <&CPU11>;
> +				};
> +			};
> +
> +			cluster3 {
> +
> +				core0 {
> +					cpu = <&CPU12>;
> +				};
> +
> +				core1 {
> +					cpu = <&CPU13>;
> +				};
> +
> +				core2 {
> +					cpu = <&CPU14>;
> +				};
> +
> +				core3 {
> +					cpu = <&CPU15>;
> +				};
> +			};
> +		};
> +
> +		CPU0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a720ae";
> +			reg = <0x00 0x00>;
> +			enable-method = "psci";
> +			i-cache-size = <0x10000>;
> +			i-cache-line-size = <0x40>;
> +			i-cache-sets = <0x100>;

So for those numbers that are meaningful in decimal (64 bytes cache line,
256 sets), I think it's better to express them in decimal directly.
For the small size here you could do it as well, though for the bigger
sizes (L2 and L3 below) it's probably better left in hex.

> +			d-cache-size = <0x10000>;
> +			d-cache-line-size = <0x40>;
> +			d-cache-sets = <0x100>;
> +			clocks = <&scmi_dvfs 0x00>;
> +			cpu-idle-states = <&CPU_SLEEP &CLUSTER_SLEEP>;
> +			next-level-cache = <&CL0_L2_0>;
> +
> +			CL0_L2_0: l2-cache {
> +				compatible = "cache";
> +				cache-unified;
> +				cache-level = <0x02>;

Same here, cache-level should be just <2>.

> +				/* 512KB */
> +				cache-size = <0x80000>;

Please add the comment right behind the number, that disrupts the flow
less, I feel.

> +				/* 64B */
> +				cache-line-size = <0x40>;

... and as above, just write <64>, also allows you to lose the comment.

> +				/* 8-way set */
> +				cache-sets = <0x400>;
> +				next-level-cache = <&CL0_L3>;
> +			};
> +		};
> +
> +		CPU1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a720ae";
> +			reg = <0x00 0x100>;

for the records: I verified that the other CPU nodes are the same, except
for their obvious differences in cache numbers and MPIDRs.

<snip>

> +
> +		CL0_L3: l3-cache0 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <0x03>;
> +			/* 4MB */
> +			cache-size = <0x400000>;
> +			/* 64B */
> +			cache-line-size = <0x40>;
> +			/* 16-way set */
> +			cache-sets = <0x1000>;
> +		};
> +
> +		CL1_L3: l3-cache1 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <0x03>;
> +			/* 4MB */
> +			cache-size = <0x400000>;
> +			/* 64B */
> +			cache-line-size = <0x40>;
> +			/* 16-way set */
> +			cache-sets = <0x1000>;
> +		};
> +
> +		CL2_L3: l3-cache2 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <0x03>;
> +			/* 4MB */
> +			cache-size = <0x400000>;
> +			/* 64B */
> +			cache-line-size = <0x40>;
> +			/* 16-way set */
> +			cache-sets = <0x1000>;
> +		};
> +
> +		CL3_L3: l3-cache3 {
> +			compatible = "cache";
> +			cache-unified;
> +			cache-level = <0x03>;
> +			/* 4MB */
> +			cache-size = <0x400000>;
> +			/* 64B */
> +			cache-line-size = <0x40>;
> +			/* 16-way set */
> +			cache-sets = <0x1000>;
> +		};
> +	};
> +
> +	dsu-pmu-0 {
> +		compatible = "arm,dsu-pmu";
> +		cpus = <&CPU0 &CPU1 &CPU2 &CPU3>;
> +		interrupts = <GIC_SPI 216 IRQ_TYPE_EDGE_RISING>;

Shouldn't that IRQ number be 184? According to the (internal) IRQ
map document this lists 216 as the GIC interrupt ID, but the SPI ID would
then need to be 32 less, so 184 (the column next to it in the spreadsheet).
Same for the other DSU PMUs, but the other SPIs seem to be correct (timer,
UART, ...).

> +	};
> +
> +	dsu-pmu-1 {
> +		compatible = "arm,dsu-pmu";
> +		cpus = <&CPU4 &CPU5 &CPU6 &CPU7>;
> +		interrupts = <GIC_SPI 217 IRQ_TYPE_EDGE_RISING>;
> +	};
> +
> +	dsu-pmu-2 {
> +		compatible = "arm,dsu-pmu";
> +		cpus = <&CPU8 &CPU9 &CPU10 &CPU11>;
> +		interrupts = <GIC_SPI 218 IRQ_TYPE_EDGE_RISING>;
> +	};
> +
> +	dsu-pmu-3 {
> +		compatible = "arm,dsu-pmu";
> +		cpus = <&CPU12 &CPU13 &CPU14 &CPU15>;
> +		interrupts = <GIC_SPI 219 IRQ_TYPE_EDGE_RISING>;
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +
> +		/* Bank 0: start = 0x0000_0000_8000_0000, size = ~2 GiB (0x7F00_0000) */

That comment is somewhat redundant, as it mirrors the line below.
If we need a comment, I'd suggest something like: ~2GB mapped at 2GB,
another 2GB at 2TB.

> +		reg = <
> +			0x00000000  0x80000000  0x00000000  0x7F000000
> +			0x00000200  0x00000000  0x00000000  0x80000000
> +		>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			<GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			<GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			<GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>,
> +			<GIC_PPI 12 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	soc_clk24mhz: clock-24000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "refclk24mhz";
> +	};
> +
> +	soc: soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		timer@1a810000 {
> +			compatible = "arm,armv7-timer-mem";
> +			reg = <0x0 0x1a810000 0 0x10000>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			/* Map child space [0x0..0x30000) to parent @ 0x1a810000 */
> +			ranges = <0x0 0x0 0x1a810000 0x00030000>;
> +
> +			frame@20000 {
> +				frame-number = <0>;
> +				interrupts = <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>;
> +				reg = <0x20000 0x10000>;
> +			};
> +		};
> +
> +		gic: interrupt-controller@20800000 {
> +			compatible = "arm,gic-v3";
> +			#redistributor-regions = <16>;
> +			reg = <0x0 0x20800000 0x0 0x10000>,    /* GICD */
> +				<0x0 0x20880000 0x0 0x40000>,    /* 16 * GICR */
> +				<0x0 0x208c0000 0x0 0x40000>,

Those look as if they are all contiguous, aren't they?
Then you wouldn't need the #redistributor-regions property above, and can
just go with one big GICR region.

> +				<0x0 0x20900000 0x0 0x40000>,
> +				<0x0 0x20940000 0x0 0x40000>,
> +				<0x0 0x20980000 0x0 0x40000>,
> +				<0x0 0x209c0000 0x0 0x40000>,
> +				<0x0 0x20a00000 0x0 0x40000>,
> +				<0x0 0x20a40000 0x0 0x40000>,
> +				<0x0 0x20a80000 0x0 0x40000>,
> +				<0x0 0x20ac0000 0x0 0x40000>,
> +				<0x0 0x20b00000 0x0 0x40000>,
> +				<0x0 0x20b40000 0x0 0x40000>,
> +				<0x0 0x20b80000 0x0 0x40000>,
> +				<0x0 0x20bc0000 0x0 0x40000>,
> +				<0x0 0x20c00000 0x0 0x40000>,
> +				<0x0 0x20c40000 0x0 0x40000>;
> +			#interrupt-cells = <3>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			ranges;
> +			interrupt-controller;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH>;
> +
> +			its1: msi-controller@20840000 {

Are there multiple ITSes, and some are just not shown here?
If not, please just use "its" as the label name.

> +				compatible = "arm,gic-v3-its";
> +				reg = <0x0 0x20840000 0x0 0x40000>;
> +				msi-controller;
> +				#msi-cells = <1>;
> +			};
> +		};
> +
> +		/* UART is fixed as 24MHz, both UARTCLK and PCLK */
> +		soc_serial0: serial@1a400000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0x1a400000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&soc_clk24mhz>, <&soc_clk24mhz>;
> +			clock-names = "uartclk", "apb_pclk";
> +		};
> +
> +		watchdog@1a420000 {
> +			compatible = "arm,sbsa-gwdt";
> +			reg = <0x0 0x1a420000 0x0 0x10000>,
> +			      <0x0 0x1a430000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		rtc@300d0000 {
> +			compatible = "arm,pl031", "arm,primecell";
> +			reg = <0x0 0x300d0000 0x0 0x10000>;
> +			interrupts = <GIC_SPI 268 IRQ_TYPE_LEVEL_HIGH>;

Can you please double check this interrupt ID? The IRQ mapping document
just lists some "expansion range" here, but I cannot verify if this is
using the SPI offset of 32 or not.

> +			clocks = <&soc_clk24mhz>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0", "arm,psci-0.2", "arm,psci";

You don't need compatibility to the pre 0.2 PSCI standard, so drop the
last compatible name.

> +		method = "smc";
> +		cpu_suspend = <0xc4000001>;
> +		cpu_off = <0x84000002>;
> +		cpu_on = <0xc4000003>;

And those three function IDs are only needed for this pre-0.2 name, so you
can remove them.

> +	};
> +
> +	sram: sram@104000 {
> +		compatible = "mmio-sram";
> +		reg = <0x0 0x104000 0x0 0x00001000>;
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		ranges = <0 0x0 0x104000 0x00001000>;
> +
> +		scmi_shmem_tx: scpshmem-sram-section@0 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x0 0x100>;
> +		};
> +		scmi_shmem_rx: scpshmem-sram-section@100 {
> +			compatible = "arm,scmi-shmem";
> +			reg = <0x100 0x100>;
> +		};
> +	};
> +
> +	mbox_db_tx: mailbox@40020000 {
> +		compatible = "arm,mhuv3";
> +		reg = <0x0 0x40020000 0x0 0x30000>;
> +		clocks = <&soc_clk24mhz>;
> +		#mbox-cells = <3>;
> +		interrupts = <GIC_SPI 112 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "combined";
> +	};
> +
> +	mbox_db_rx: mailbox@40060000 {
> +		compatible = "arm,mhuv3";
> +		reg = <0x0 0x40060000 0x0 0x30000>;
> +		clocks = <&soc_clk24mhz>;
> +		#mbox-cells = <3>;
> +		interrupts = <GIC_SPI 113 IRQ_TYPE_LEVEL_HIGH>;
> +		interrupt-names = "combined";
> +	};
> +
> +	firmware {
> +		scmi {
> +			compatible = "arm,scmi";
> +			mbox-names = "tx", "rx";
> +			mboxes = <&mbox_db_tx 0 0 0 &mbox_db_rx 0 0 0 &mbox_db_rx 0 0 2>;

What is this third mailbox about? I think this would have to match
mbox-names also? I guess this is not needed?

Cheers,
Andre

> +			shmem = <&scmi_shmem_tx &scmi_shmem_rx>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			scmi_dvfs: protocol@13 {
> +				reg = <0x13>;
> +				#clock-cells = <1>;
> +			};
> +		};
> +	};
> +};
> 


