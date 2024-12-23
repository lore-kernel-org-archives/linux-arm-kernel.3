Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9CFC6E7718E
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 23 Dec 2024 17:51:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5693z/3J4PGDMLqeiaRqi2dq4QupPlz84CuitauxQ8A=; b=4DmLF9SMKckb7VkONiqnnNndRo
	uwpOnxicUaLjMenu4vipY+Y+LBuE89w0Q6eZZdb2k7MyOux9hoFSZh+UvQ9eFn6KHRA/jjXKurqx8
	Nwh7pn5Gy2oZniBoagCS9pxsWnjKCknJVZEBxi+C6dsrYAeGMqPjS2xrEdhMs/cvqDVWxGwX5GaPQ
	c00r/KB9kSbLy8N0MVEeOotRTEnTr0L2wDad/IX+/tZdJRhA2LRQY0GoI7nlRmoifIlwOMtPLuk8E
	wyJXWfS3VU97VnJQqqZKWZQR8iRc5BsDoQLcz/vS71U8liJvjkXYzsrBXkq2UTo535e/4kTreHDnq
	yGucVEwg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tPmaH-0000000AV5N-06kh;
	Mon, 23 Dec 2024 17:51:13 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tPlSd-0000000APkJ-0sLH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 23 Dec 2024 16:39:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0099AA4107E;
	Mon, 23 Dec 2024 16:37:24 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6D57CC4CED3;
	Mon, 23 Dec 2024 16:39:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734971953;
	bh=35KQeJOKwdFepWTkT6JRbqFbbopLPhFHAchljzxBXLE=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=N8HcjNGvtkZHL3tc8H4WTvFtrp+IEautC8kZG9BQ6Vi1keEJUAooKZQLBsKhGR2xe
	 x4r0tZrRgcA75GVecYI3vIXVfRB9S9xltBeUwXkrctyekjMVWvLxQA+i8hlFdbJoVt
	 EvVHe3uSYel9lyqc6fDE8Dov2WWPBoZIY8aLceKw3TjaVj9lG1Zg+8hfGdA829tPC3
	 RFTWfyvCC6yAOaAuTG+johEI9HrSHzSu2vsiCVPmJWpGuILMwAfjV8Da/O3qvaXn52
	 NVGHaLoXPtACwYyw+OfmsnFU9rJBDi25vDPehWODJ6sqcLmgoAeTbiduR2u93lP3py
	 yLqFmfkHMY3QQ==
Message-ID: <854c8108-261c-4585-be2e-d50758f3a777@kernel.org>
Date: Mon, 23 Dec 2024 17:39:08 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/4] arm64: dts: morello: Add support for common
 functionalities
To: Vincenzo Frascino <vincenzo.frascino@arm.com>,
 linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org
Cc: Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20241223162029.326997-1-vincenzo.frascino@arm.com>
 <20241223162029.326997-3-vincenzo.frascino@arm.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241223162029.326997-3-vincenzo.frascino@arm.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241223_083915_390861_BBE32A3B 
X-CRM114-Status: GOOD (  21.63  )
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

On 23/12/2024 17:20, Vincenzo Frascino wrote:
> The Morello architecture is an experimental extension to Armv8.2-A,
> which extends the AArch64 state with the principles proposed in
> version 7 of the Capability Hardware Enhanced RISC Instructions
> (CHERI) ISA.
> 
> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
> some functionalities that have conveniently been included in
> morello.dtsi to avoid duplication.
> 
> Introduce morello.dtsi.
> 
> Note: Morello fvp will be introduced with a future patch series.
> 
> Cc: Linus Walleij <linus.walleij@linaro.org>
> Cc: Rob Herring <robh@kernel.org>
> Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>
> Cc: Conor Dooley <conor+dt@kernel.org>
> Cc: Liviu Dudau <liviu.dudau@arm.com>
> Cc: Sudeep Holla <sudeep.holla@arm.com>
> Cc: Lorenzo Pieralisi <lpieralisi@kernel.org>
> Cc: Russell King <linux@armlinux.org.uk>
> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
> ---
>  arch/arm64/boot/dts/arm/morello.dtsi | 271 +++++++++++++++++++++++++++
>  1 file changed, 271 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
> 
> diff --git a/arch/arm64/boot/dts/arm/morello.dtsi b/arch/arm64/boot/dts/arm/morello.dtsi
> new file mode 100644
> index 000000000000..b9030007d9e6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/arm/morello.dtsi
> @@ -0,0 +1,271 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
> +/*
> + * Copyright (c) 2020-2024, Arm Limited. All rights reserved.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +	interrupt-parent = <&gic>;
> +
> +	aliases {
> +		serial0 = &uart0;

This belongs to DTS file.

> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";

As well.

> +	};
> +
> +	reserved-memory {
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		secure-firmware@ff000000 {
> +			reg = <0 0xff000000 0 0x01000000>;
> +			no-map;
> +		};
> +	};
> +
> +	cpus {
> +		#address-cells = <2>;
> +		#size-cells = <0>;

Blank line

> +		cpu0: cpu0@0 {
> +			compatible = "arm,neoverse-n1";
> +			reg = <0x0 0x0>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			clocks = <&scmi_dvfs 0>;
> +		};

Blank line between each device node.

> +		cpu1: cpu1@100 {
> +			compatible = "arm,neoverse-n1";
> +			reg = <0x0 0x100>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			clocks = <&scmi_dvfs 0>;
> +		};
> +		cpu2: cpu2@10000 {
> +			compatible = "arm,neoverse-n1";
> +			reg = <0x0 0x10000>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			clocks = <&scmi_dvfs 1>;
> +		};
> +		cpu3: cpu3@10100 {
> +			compatible = "arm,neoverse-n1";
> +			reg = <0x0 0x10100>;
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			clocks = <&scmi_dvfs 1>;
> +		};
> +	};
> +
> +	/* The first bank of memory, memory map is actually provided by UEFI. */
> +	memory@80000000 {
> +		device_type = "memory";
> +		/* [0x80000000-0xffffffff] */
> +		reg = <0x00000000 0x80000000 0x0 0x7F000000>;
> +	};
> +
> +	memory@8080000000 {
> +		device_type = "memory";
> +		/* [0x8080000000-0x83f7ffffff] */
> +		reg = <0x00000080 0x80000000 0x3 0x78000000>;
> +	};
> +
> +	gic: interrupt-controller@2c010000 {

You need 'soc' node. ARM DTS files have this unusual, I don't understand
why these were done like that. Don't use them as example. Take some
latest qcom (sm8650.dtsi) as an example.


> +		compatible = "arm,gic-v3";
> +		#address-cells = <2>;
> +		#interrupt-cells = <3>;
> +		#size-cells = <2>;
> +		ranges;
> +		interrupt-controller;
> +	};
> +
> +	pmu {
> +		compatible = "arm,armv8-pmuv3";
> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	spe-pmu {
> +		compatible = "arm,statistical-profiling-extension-v1";
> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-0.2";
> +		method = "smc";
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	soc_refclk50mhz: clock-50000000 {

Keep nodes ordered by name.

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +		clock-output-names = "apb_pclk";
> +	};
> +
> +	soc_refclk85mhz: clock-85000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <85000000>;
> +		clock-output-names = "iofpga:aclk";
> +	};
> +
> +	soc_uartclk: clock-50000000-uart {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <50000000>;
> +		clock-output-names = "uartclk";
> +	};
> +
> +	soc: soc {

Ah, so here is the soc. GIC should be inside.

> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		interrupt-parent = <&gic>;
> +		ranges;
> +
> +		mailbox: mhu@45000000 {
> +			compatible = "arm,mhu-doorbell", "arm,primecell";
> +			reg = <0x0 0x45000000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;

Misaligned. It should be aligned to previous <

> +			#mbox-cells = <2>;
> +			clocks = <&soc_refclk50mhz>;
> +			clock-names = "apb_pclk";
> +		};
> +
> +		sram: sram@45200000 {
> +			compatible = "mmio-sram";
> +			reg = <0x0 0x06000000 0x0 0x8000>;
> +
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			ranges = <0 0x0 0x06000000 0x8000>;

Ranges go immediately after reg (see DTS coding style)

> +
> +			cpu_scp_hpri0: scp-sram@0 {
> +				compatible = "arm,scmi-shmem";
> +				reg = <0x0 0x80>;
> +			};
> +
> +			cpu_scp_hpri1: scp-sram@80 {
> +				compatible = "arm,scmi-shmem";
> +				reg = <0x80 0x80>;
> +			};
> +		};
> +
> +		uart0: serial@2a400000 {
> +			compatible = "arm,pl011", "arm,primecell";
> +			reg = <0x0 0x2a400000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&soc_uartclk>, <&soc_refclk50mhz>;
> +			clock-names = "uartclk", "apb_pclk";

This should be disabled and board should enable it.

> +		};
> +
> +		smmu_pcie: iommu@4f400000 {
> +			compatible = "arm,smmu-v3";
> +			reg = <0 0x4f400000 0 0x40000>;
> +			interrupts = <GIC_SPI 235 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 237 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 40 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
> +			msi-parent = <&its2 0>;
> +			#iommu-cells = <1>;
> +			dma-coherent;
> +		};
> +
> +		pcie_ctlr: pcie@28c0000000 {
> +			compatible = "pci-host-ecam-generic";
> +			device_type = "pci";
> +			reg = <0x28 0xC0000000 0 0x10000000>;
> +			bus-range = <0 255>;
> +			linux,pci-domain = <0>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			dma-coherent;
> +			ranges = <0x01000000 0x00 0x00000000 0x00 0x6F000000 0x00 0x00800000>,
> +				 <0x02000000 0x00 0x60000000 0x00 0x60000000 0x00 0x0F000000>,
> +				 <0x42000000 0x09 0x00000000 0x09 0x00000000 0x1F 0xC0000000>;
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &gic 0 0 0 169 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &gic 0 0 0 170 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &gic 0 0 0 171 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &gic 0 0 0 172 IRQ_TYPE_LEVEL_HIGH>;
> +			msi-map = <0 &its_pcie 0 0x10000>;
> +			iommu-map = <0 &smmu_pcie 0 0x10000>;
> +			status = "okay";
> +		};
> +
> +		smmu_ccix: iommu@4f000000 {
> +			compatible = "arm,smmu-v3";
> +			reg = <0 0x4f000000 0 0x40000>;
> +			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 230 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 41 IRQ_TYPE_EDGE_RISING>,
> +					<GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
> +			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
> +			msi-parent = <&its1 0>;
> +			#iommu-cells = <1>;
> +			dma-coherent;
> +		};
> +
> +		ccix_pcie_ctlr: pcie@4fc0000000 {
> +			compatible = "pci-host-ecam-generic";
> +			device_type = "pci";
> +			reg = <0x4F 0xC0000000 0 0x10000000>;
> +			bus-range = <0 255>;
> +			linux,pci-domain = <1>;
> +			#address-cells = <3>;
> +			#size-cells = <2>;
> +			dma-coherent;
> +			ranges = <0x01000000 0x00 0x00000000 0x00 0x7F000000 0x00 0x00800000>,
> +				 <0x02000000 0x00 0x70000000 0x00 0x70000000 0x00 0x0F000000>,
> +				 <0x42000000 0x30 0x00000000 0x30 0x00000000 0x1F 0xC0000000>;
> +			#interrupt-cells = <1>;
> +			interrupt-map-mask = <0 0 0 7>;
> +			interrupt-map = <0 0 0 1 &gic 0 0 0 201 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 2 &gic 0 0 0 202 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 3 &gic 0 0 0 203 IRQ_TYPE_LEVEL_HIGH>,
> +					<0 0 0 4 &gic 0 0 0 204 IRQ_TYPE_LEVEL_HIGH>;
> +			msi-map = <0 &its_ccix 0 0x10000>;
> +			iommu-map = <0 &smmu_ccix 0 0x10000>;
> +			status = "okay";

Drop, everywhere

> +		};
> +
> +		firmware {

firmware is not part of soc.


> +			#address-cells = <2>;
> +			#size-cells = <2>;

Drop both

> +			interrupt-parent = <&gic>;
> +			ranges;

Drop ranges, this is all odd.

> +
> +			scmi {
> +				compatible = "arm,scmi";
> +				mbox-names = "tx", "rx";
> +				mboxes = <&mailbox 1 0>, <&mailbox 1 1>;
> +				shmem = <&cpu_scp_hpri0>, <&cpu_scp_hpri1>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +				scmi_dvfs: protocol@13 {
> +					reg = <0x13>;
> +					#clock-cells = <1>;
> +				};
> +				scmi_clk: protocol@14 {
> +					reg = <0x14>;
> +					#clock-cells = <1>;
> +				};
> +			};
> +		};
> +	};
> +};


Best regards,
Krzysztof

