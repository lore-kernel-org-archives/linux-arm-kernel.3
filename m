Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9A5EAC44512
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 19 Jul 2026 09:40:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wSEu9/tPhby54KUOcjTniSUiXkLMLT3qB89UaElhX30=; b=GDuKoCXns/PKSlrCe4of2pUe0S
	rWF/jXUQLBYG5RKmG0RPjD++PZ1TqkppW8HsV1GVWBgpzhcSvCXLACMRHwXdvUjuJBijULAcpEEXD
	SflbqDMF+SZoAbBfRfqVFEy3ddNSrRbv2U69WY93SSwFSn+h1U9ssSM9UUSrSYuuxJx0B2Y4wwVu5
	Jh0U9hbok5JefVncIsZkcn8dcu+mmx3yRqqhiZrgx2q1GfT81XjY/aZFve727ZVeHeueEpKx6isPX
	D3BFWfovOFS2syLfj1EpEuB3lGzbHtUoZcSfeezAcFQAfnoUOnLgPEdO/mP1k3ze8dwDAez6zBZo1
	DY2vDFDA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlO0p-00000004tLy-1569;
	Sun, 19 Jul 2026 09:40:43 +0000
Received: from mail.cyberchaos.dev ([2a0f:4ac0::3a11])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wlO0n-00000004tLa-0snp
	for linux-arm-kernel@lists.infradead.org;
	Sun, 19 Jul 2026 09:40:42 +0000
Message-ID: <a5f180dd-de55-41b7-8c71-5fe8c4dce226@cyberchaos.dev>
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=cyberchaos.dev;
	s=mail; t=1784454018;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=wSEu9/tPhby54KUOcjTniSUiXkLMLT3qB89UaElhX30=;
	b=aw4wzNa/heknOmC6KDFIo9p2zgv8n9GJgFTeppaY8JDzO/ittDOXtwp29B4VgAFYgCpcxJ
	b+drSA+kQny9ufWUzUCIY8bh2UvF0hve/hc8gxri9SH1N9hl8NM3M+BmxH1Og+yMgdsH8o
	HF3Nsru3133obC+c7AY6plERDsoHT8Y=
Date: Sun, 19 Jul 2026 11:40:15 +0200
MIME-Version: 1.0
Subject: Re: [PATCH v2 09/10] arm64: dts: apple: Initial T603[124] (M3 Max and
 Ultra) device trees
To: Janne Grunau <j@jannau.net>, Sven Peter <sven@kernel.org>,
 Neal Gompa <neal@gompa.dev>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Thomas Gleixner <tglx@kernel.org>,
 Wim Van Sebroeck <wim@linux-watchdog.org>, Guenter Roeck
 <linux@roeck-us.net>, Andi Shyti <andi.shyti@kernel.org>,
 =?UTF-8?Q?Uwe_Kleine-K=C3=B6nig?= <ukleinek@kernel.org>,
 Sasha Finkelstein <k@chaosmail.tech>
Cc: asahi@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-watchdog@vger.kernel.org, linux-i2c@vger.kernel.org,
 linux-pwm@vger.kernel.org
References: <20260715-apple-t603x-initial-devices-v2-0-df65b2485710@jannau.net>
 <20260715-apple-t603x-initial-devices-v2-9-df65b2485710@jannau.net>
Content-Language: en-US
From: Yureka Lilian <yureka@cyberchaos.dev>
In-Reply-To: <20260715-apple-t603x-initial-devices-v2-9-df65b2485710@jannau.net>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260719_024041_448839_E812031D 
X-CRM114-Status: GOOD (  24.35  )
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

On 7/15/26 11:11, Janne Grunau wrote:
> Contains minimal device trees for all M3 Max and Ultra Apple silicon
> devices. Those are 14-inch and 16-inch MacBook Pros with M3 Max released
> in November 2023 and Mac Studio with M3 Ultra released in 2025.
> This does not include M3 Pro since it is separate SoC and not a smaller
> variant of the M3 Max contrary to the M1 and M2 generations.
> The smaller M3 Max variant (10 performance cores) has its own chip
> variant (T6034) but is clearly the same design as T6031. Besides fewer
> CPU performance cores and GPU cores it misses also on fourth of the
> memory controllers and thus has an aggregated bus width of 384 bit
> instead of 512 bit.
> Both M3 Ultra variants (28 or 32 CPU cores) are based on T6031 judging
> by the advertised memory bandwidth of 819GB/s.
> This uses the same multi-die macros as t600x*.dtsi and t602x.dtsi to
> support M3 Max and M3 Ultra without duplicating device nodes. Since the
> M3 Pro can't use the same .dtsi files "t6031*.dtsi" are used to define
> common nodes for T6031, T6032 and T6034.
> The device trees have devices nodes for CPU cores, timer, interrupt
> controller, power states, watchdog, serial, pin controller, i2c,
> PWM based keyboard LED illumination and the boot framebuffer.
>
> Signed-off-by: Janne Grunau <j@jannau.net>
> ---
>   arch/arm64/boot/dts/apple/Makefile             |    5 +
>   arch/arm64/boot/dts/apple/t6031-base.dtsi      |  297 +++
>   arch/arm64/boot/dts/apple/t6031-die0.dtsi      |  197 ++
>   arch/arm64/boot/dts/apple/t6031-dieX.dtsi      |  107 ++
>   arch/arm64/boot/dts/apple/t6031-gpio-pins.dtsi |   53 +
>   arch/arm64/boot/dts/apple/t6031-j514c.dts      |   18 +
>   arch/arm64/boot/dts/apple/t6031-j516c.dts      |   18 +
>   arch/arm64/boot/dts/apple/t6031-pmgr.dtsi      | 2400 ++++++++++++++++++++++++
>   arch/arm64/boot/dts/apple/t6031.dtsi           |   48 +
>   arch/arm64/boot/dts/apple/t6032-j575d.dts      |   46 +
>   arch/arm64/boot/dts/apple/t6032.dtsi           |  416 ++++
>   arch/arm64/boot/dts/apple/t6034-j514m.dts      |   18 +
>   arch/arm64/boot/dts/apple/t6034-j516m.dts      |   18 +
>   arch/arm64/boot/dts/apple/t6034.dtsi           |   12 +
>   arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi |   66 +
>   15 files changed, 3719 insertions(+)
>
> diff --git a/arch/arm64/boot/dts/apple/Makefile b/arch/arm64/boot/dts/apple/Makefile
> index 6fc3349a5842..a22b4a8068b6 100644
> --- a/arch/arm64/boot/dts/apple/Makefile
> +++ b/arch/arm64/boot/dts/apple/Makefile
> @@ -87,6 +87,11 @@ dtb-$(CONFIG_ARCH_APPLE) += t6021-j416c.dtb
>   dtb-$(CONFIG_ARCH_APPLE) += t6020-j474s.dtb
>   dtb-$(CONFIG_ARCH_APPLE) += t6021-j475c.dtb
>   dtb-$(CONFIG_ARCH_APPLE) += t6022-j475d.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t6031-j514c.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t6031-j516c.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t6032-j575d.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t6034-j514m.dtb
> +dtb-$(CONFIG_ARCH_APPLE) += t6034-j516m.dtb
>   dtb-$(CONFIG_ARCH_APPLE) += t8112-j413.dtb
>   dtb-$(CONFIG_ARCH_APPLE) += t8112-j415.dtb
>   dtb-$(CONFIG_ARCH_APPLE) += t8112-j473.dtb
> diff --git a/arch/arm64/boot/dts/apple/t6031-base.dtsi b/arch/arm64/boot/dts/apple/t6031-base.dtsi
> new file mode 100644
> index 000000000000..0bb7373b3f06
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t6031-base.dtsi
> @@ -0,0 +1,297 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Nodes common for T6031, T6032 and T6034 family SoCs (M3 Max/Ultra)
> + *
> + * Other names: H15J, H15S, "Palma"
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu_e00>;
> +				};
> +				core1 {
> +					cpu = <&cpu_e01>;
> +				};
> +				core2 {
> +					cpu = <&cpu_e02>;
> +				};
> +				core3 {
> +					cpu = <&cpu_e03>;
> +				};
> +			};
> +
> +			cluster1 {
> +				core0 {
> +					cpu = <&cpu_p00>;
> +				};
> +				core1 {
> +					cpu = <&cpu_p01>;
> +				};
> +				core2 {
> +					cpu = <&cpu_p02>;
> +				};
> +				core3 {
> +					cpu = <&cpu_p03>;
> +				};
> +				core4 {
> +					cpu = <&cpu_p04>;
> +				};
> +				core5 {
> +					cpu = <&cpu_p05>;
> +				};
> +			};
> +
> +			cluster2 {
> +				core0 {
> +					cpu = <&cpu_p10>;
> +				};
> +				core1 {
> +					cpu = <&cpu_p11>;
> +				};
> +				core2 {
> +					cpu = <&cpu_p12>;
> +				};
> +				core3 {
> +					cpu = <&cpu_p13>;
> +				};
> +				core4 {
> +					cpu = <&cpu_p14>;
> +				};
> +				core5 {
> +					cpu = <&cpu_p15>;
> +				};
> +			};
> +		};
> +
> +		cpu_e00: cpu@0 {
> +			compatible = "apple,sawtooth";
> +			device_type = "cpu";
> +			reg = <0x0 0x0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_0>;
> +			i-cache-size = <0x20000>;
> +			d-cache-size = <0x10000>;
> +		};
> +
> +		cpu_e01: cpu@1 {
> +			compatible = "apple,sawtooth";
> +			device_type = "cpu";
> +			reg = <0x0 0x1>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_0>;
> +			i-cache-size = <0x20000>;
> +			d-cache-size = <0x10000>;
> +		};
> +
> +		cpu_e02: cpu@2 {
> +			compatible = "apple,sawtooth";
> +			device_type = "cpu";
> +			reg = <0x0 0x2>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_0>;
> +			i-cache-size = <0x20000>;
> +			d-cache-size = <0x10000>;
> +		};
> +
> +		cpu_e03: cpu@3 {
> +			compatible = "apple,sawtooth";
> +			device_type = "cpu";
> +			reg = <0x0 0x3>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* to be filled by loader */
> +			next-level-cache = <&l2_cache_0>;
> +			i-cache-size = <0x20000>;
> +			d-cache-size = <0x10000>;
> +		};
> +
> +		cpu_p00: cpu@10100 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10100>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p01: cpu@10101 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10101>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p02: cpu@10102 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10102>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p03: cpu@10103 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10103>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p04: cpu@10104 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10104>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p05: cpu@10105 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10105>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_1>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p10: cpu@10200 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10200>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p11: cpu@10201 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10201>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p12: cpu@10202 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10202>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p13: cpu@10203 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10203>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p14: cpu@10204 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10204>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		cpu_p15: cpu@10205 {
> +			compatible = "apple,everest";
> +			device_type = "cpu";
> +			reg = <0x0 0x10205>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0>; /* To be filled by loader */
> +			next-level-cache = <&l2_cache_2>;
> +			i-cache-size = <0x30000>;
> +			d-cache-size = <0x20000>;
> +		};
> +
> +		l2_cache_0: l2-cache-0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x400000>;
> +		};
> +
> +		l2_cache_1: l2-cache-1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x1000000>;
> +		};
> +
> +		l2_cache_2: l2-cache-2 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +			cache-size = <0x1000000>;
> +		};
> +	 };
Nit: The indentation is weird here. The parenthesis close is not aligned 
with the "timer" in the next section.
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&aic>;
> +		interrupt-names = "phys", "virt", "hyp-phys", "hyp-virt";
> +		interrupts = <AIC_FIQ 0 AIC_TMR_GUEST_PHYS IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_FIQ 0 AIC_TMR_GUEST_VIRT IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_FIQ 0 AIC_TMR_HV_PHYS IRQ_TYPE_LEVEL_HIGH>,
> +			     <AIC_FIQ 0 AIC_TMR_HV_VIRT IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	clkref: clock-ref {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +		clock-output-names = "clkref";
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +	};
> +};
>
[...]
> diff --git a/arch/arm64/boot/dts/apple/t6034.dtsi b/arch/arm64/boot/dts/apple/t6034.dtsi
> new file mode 100644
> index 000000000000..aa73af9c512d
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t6034.dtsi
> @@ -0,0 +1,12 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * Apple T6034 "M3 Max" SoC
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +#include "t6031.dtsi"
> +
> +/ {
> +	compatible = "apple,t6034", "apple,arm-platform";
> +};

You mentioned the reduced number of memory channels on the 14-core 
variant, but the corresponding pmgr nodes are not disabled here.


> diff --git a/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
> new file mode 100644
> index 000000000000..517b84c183ca
> --- /dev/null
> +++ b/arch/arm64/boot/dts/apple/t603x-j514-j516.dtsi
> @@ -0,0 +1,66 @@
> +// SPDX-License-Identifier: GPL-2.0+ OR MIT
> +/*
> + * MacBook Pro (14/16-inch, 2023)
> + *
> + * This file contains the parts common to J514 and J516 devices with t6030,
> + * t6031 and t6034.
> + *
> + * target-type: J514s / J514m / J514c / J516s / J516m / J516c
> + *
> + * Copyright The Asahi Linux Contributors
> + */
> +
> +/*
> + * These models are essentially identical to the previous generations, other
> + * than the GPIO indices and using SPMI based USB Type-C port controllers.
> + */
> +
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	chassis-type = "laptop";
> +
> +	aliases {
> +		serial0 = &serial0;
> +	};
> +
> +	chosen {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		stdout-path = "serial0";
> +
> +		framebuffer0: framebuffer@0 {
> +			compatible = "apple,simple-framebuffer", "simple-framebuffer";
> +			reg = <0 0 0 0>; /* To be filled by loader */
> +			/* Format properties will be added by loader */
> +			status = "disabled";
> +			power-domains = <&ps_disp_fe>;
> +		};
> +	};
> +
> +	memory@10000000000 {
> +		device_type = "memory";
> +		reg = <0x100 0 0x2 0>; /* To be filled by loader */
> +	};
> +
> +	led-controller {
> +		compatible = "pwm-leds";
> +		led-0 {
> +			pwms = <&fpwm0 0 40000>;
> +			function = LED_FUNCTION_KBD_BACKLIGHT;
> +			color = <LED_COLOR_ID_WHITE>;
> +			max-brightness = <255>;
> +			default-state = "keep";
> +		};
> +	};
> +};
> +
> +&serial0 {
> +	status = "okay";
> +};
> +
> +&fpwm0 {
> +	status = "okay";
> +};


Thanks!

— Yureka


