Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C0A8CD8CB9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 10 Jun 2026 11:50:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p9gCzY/q5Z1sRpig6VS1UI50f98P4vKi/SmRJA3oCtA=; b=tR1w3gBEginf3+4FMt5vQPgAh7
	kALik9gQg6RBhyXfoomvTEtjKMsJpoMqbLkt8XeTwIW/+iWPQbtziW00VH85rLFcQEEWodIB2Eya9
	MeG5wv7aNzwjIjhyynUbkDB5DFdGrtghq5SyD8mYmYKclcqJcDXeUS8JlJVQebbM5tG/jM4F4Xmlx
	++WGDe370k+dsXZQWUW9NqAJxPNVN/nxCLSruGSUhHLlyewlRujKB2LWobhcKw3vW1zm/CtpZ+GaI
	w7bzUlD3monsKGfojBVnpTFh2mF/8MtwiSyxzPsWFAgNVBXuYbNnehZoCUDqb0HMqNQWQiVjd3Y1+
	zQDzxiFg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHRV-00000007ZLK-2eKd;
	Wed, 10 Jun 2026 11:49:57 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wXHRU-00000007ZL7-0eW6
	for linux-arm-kernel@lists.infradead.org;
	Wed, 10 Jun 2026 11:49:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 621276020A;
	Wed, 10 Jun 2026 11:49:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EEEFA1F00893;
	Wed, 10 Jun 2026 11:49:51 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1781092195;
	bh=p9gCzY/q5Z1sRpig6VS1UI50f98P4vKi/SmRJA3oCtA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=Oh6srEHmKfGj4szvDStmB1WlE+WaFA52T113HKsQnjyGu31HJ77Yip/l/g8oCS6LH
	 Wpaw5/+1GH38BTXQFU1t8u9AB7f7nMxWAUzQ7yTMgXRMNM4HKXNvutbnU4Hjwljz84
	 u0yOJAZ+L6qr8LWFLHYNLmfNanh3tzgiuaUl9jpa7TGvqE1PW5XwkYtaxp4vSJJBr9
	 WyElHdQ85JW8oRBc37gR6xKLhgubQa3sFJQIxxKJMTZQjoDH5G5o2OOSASQYrvIR7q
	 4YUXQBEKWplPGaxOVScpVC4Zk/Cqi/et/3+/JFeAqFO5E77MnWjAD0b2ft0dwVpiWG
	 7mcvwK3tK3UoQ==
Message-ID: <2fd7077e-1180-47eb-9d13-5a570b0959a4@kernel.org>
Date: Wed, 10 Jun 2026 13:49:50 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: cortina-access: Add DTS for CA8289 SoC
 and Venus board
To: Jason Li <jason.lee651024@gmail.com>, jason.li@cortina-access.com,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Catalin Marinas
 <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>,
 Arnd Bergmann <arnd@arndb.de>, linux-serial@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
References: <20260610112821.3030099-1-jason.li@cortina-access.com>
 <20260610112821.3030099-5-jason.li@cortina-access.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260610112821.3030099-5-jason.li@cortina-access.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 10/06/2026 13:28, Jason Li wrote:
> Add SoC DTSI for the Cortina-Access CA8289 (Venus) and a board DTS for
> the Venus engineering board. The description covers the minimum set of
> hardware nodes needed to boot a kernel with an INITRD rootfs: CPUs,
> GIC, timer, PSCI, fixed clock and UART.
> 
> Signed-off-by: Jason Li <jason.li@cortina-access.com>
> Assisted-by: Claude:claude-opus-4-8

SoB should be the last tag.

Also, it does not match From field.

> ---
>  MAINTAINERS                                   |   1 +
>  arch/arm64/Kconfig.platforms                  |  10 ++
>  arch/arm64/boot/dts/Makefile                  |   1 +
>  arch/arm64/boot/dts/cortina-access/Makefile   |   2 +
>  .../dts/cortina-access/ca8289-engboard.dts    |  31 +++++
>  .../boot/dts/cortina-access/ca8289-soc.dtsi   | 118 ++++++++++++++++++
>  6 files changed, 163 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/cortina-access/Makefile
>  create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
>  create mode 100644 arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
> 
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 515d89d96472..ebfdb9c267cc 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -2826,6 +2826,7 @@ L:	linux-arm-kernel@lists.infradead.org (moderated for non-subscribers)
>  S:	Maintained
>  F:	Documentation/devicetree/bindings/arm/cortina-access.yaml
>  F:	Documentation/devicetree/bindings/serial/cortina-access,serial.yaml
> +F:	arch/arm64/boot/dts/cortina-access/
>  
>  ARM/CORTINA SYSTEMS GEMINI ARM ARCHITECTURE
>  M:	Hans Ulli Kroll <ulli.kroll@googlemail.com>
> diff --git a/arch/arm64/Kconfig.platforms b/arch/arm64/Kconfig.platforms
> index dc995a732117..ba6dda0660c3 100644
> --- a/arch/arm64/Kconfig.platforms
> +++ b/arch/arm64/Kconfig.platforms
> @@ -134,6 +134,16 @@ config ARCH_CIX
>  	  This enables support for the Cixtech SoC family,
>  	  like P1(sky1).
>  
> +config ARCH_CORTINA_ACCESS
> +	bool "Cortina-Access SoC Family"
> +	select GPIOLIB
> +	select PINCTRL
> +	help
> +	  This enables support for Cortina-Access SoCs.  The family
> +	  includes ARMv8-based devices targeting networking and access
> +	  applications.
> +	  If you have a Cortina-Access board, say Y here.
> +
>  config ARCH_EXYNOS
>  	bool "Samsung Exynos SoC family"
>  	select COMMON_CLK_SAMSUNG
> diff --git a/arch/arm64/boot/dts/Makefile b/arch/arm64/boot/dts/Makefile
> index 98ec8f1b76e4..a599f525fb9a 100644
> --- a/arch/arm64/boot/dts/Makefile
> +++ b/arch/arm64/boot/dts/Makefile
> @@ -16,6 +16,7 @@ subdir-y += broadcom
>  subdir-y += bst
>  subdir-y += cavium
>  subdir-y += cix
> +subdir-y += cortina-access
>  subdir-y += exynos
>  subdir-y += freescale
>  subdir-y += hisilicon
> diff --git a/arch/arm64/boot/dts/cortina-access/Makefile b/arch/arm64/boot/dts/cortina-access/Makefile
> new file mode 100644
> index 000000000000..554893f381fe
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cortina-access/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0
> +dtb-$(CONFIG_ARCH_CORTINA_ACCESS) += ca8289-engboard.dtb
> diff --git a/arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts b/arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
> new file mode 100644
> index 000000000000..c8289a0f8269
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cortina-access/ca8289-engboard.dts
> @@ -0,0 +1,31 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dts file for Cortina Access Venus Engineering Board
> + *
> + * Copyright (C) 2026, Cortina Access Inc.
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "ca8289-soc.dtsi"
> +
> +/ {
> +	model = "Cortina Access Venus Engineering Board";
> +	compatible = "cortina-access,ca8289-engboard";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@0 {	/* 512MB */
> +		device_type = "memory";
> +		reg = <0x00000000 0x00000000 0x0 0x20000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi b/arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
> new file mode 100644
> index 000000000000..8e7ffcf4ccab
> --- /dev/null
> +++ b/arch/arm64/boot/dts/cortina-access/ca8289-soc.dtsi
> @@ -0,0 +1,118 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * dts file for Cortina Access CA8289 SoC
> + *
> + * Copyright (C) 2026, Cortina Access Inc.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			compatible = "arm,cortex-a55", "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x0>;
> +			enable-method = "psci";
> +		};

Missing blank lines. Look at existing code how this is supposed to look
like.

> +		cpu1: cpu@100 {
> +			compatible = "arm,cortex-a55", "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x100>;
> +			enable-method = "psci";
> +		};
> +		cpu2: cpu@200 {
> +			compatible = "arm,cortex-a55", "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x200>;
> +			enable-method = "psci";
> +		};
> +		cpu3: cpu@300 {
> +			compatible = "arm,cortex-a55", "arm,armv8";
> +			device_type = "cpu";
> +			reg = <0x0 0x300>;
> +			enable-method = "psci";
> +		};
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +				core2 {
> +					cpu = <&cpu2>;
> +				};
> +				core3 {
> +					cpu = <&cpu3>;
> +				};
> +			};
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	gic: interrupt-controller@4f8000000 {

And now you repeat basic mistakes:
1. Pointed out by W=1 dtbs_check build
2. Fixed long time in every source
3. Explicitly documented in writing bindings and DTS coding style


> +		compatible = "arm,gic-v3";
> +		#interrupt-cells = <3>;
> +		interrupt-controller;
> +		#redistributor-regions = <1>;
> +		reg = <0x00000004 0xF8000000 0 0x10000>,
> +		      <0x00000004 0xF8040000 0 0x80000>;

Read DTS coding style.

> +	};
> +
> +	apb_pclk: apb-pclk {

Nope, drop entire node.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <125000000>;
> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		/* TrustZone reserved region; must not be mapped by the kernel */
> +		tz_pool: tz-buffer@f000000 {
> +			reg = <0x0 0x0F000000 0x0 0x1000000>;
> +			no-map;
> +		};
> +	};
> +
> +	/* See Documentation/devicetree/bindings/timer/arm,arch_timer.yaml */
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +		clock-frequency = <25000000>;
> +	};
> +
> +	uart0: serial@f4329188 {
> +		device_type = "serial";
> +		compatible = "cortina-access,serial";
> +		reg = <0x00000000 0xf4329188 0x0 0x30>;

This is AI slop. Whatever Claude convinced you to do, it is nothing like
upstream kernel source.

Best regards,
Krzysztof

