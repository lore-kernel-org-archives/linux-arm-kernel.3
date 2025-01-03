Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 40D38E77188
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  3 Jan 2025 15:36:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hga/45Cr8l9RbEnQNSQlGsnyJv2plkGbf1TQSdUDnqQ=; b=2aVV3KgGFoiXslrHjCyPWMog75
	qiUlYU+rStCIPKXVuoBs+JGLreXle71Fe4GRhbAfS+PkpFe4Xcnx+nHAonk00DanyvlHmoDd4z4O3
	cTXtD0uHil6tobQm8Wt19TVzu7Swhw+6A5bif+e9BNOv7pnZ4Y3W2lhrnH9fbYXG5/SLosXlph0qU
	wgYyF4fX24hxcs1AR5ohrTc1EsFFhwNI7j684XozohciKTwXr97FpZ4vrkDJq2aI57Zqn27By9Gq6
	c8QmWXE+DHFpVvsYR9fU+NHXhXhwkhJUWs2Ju632i4bf8gPoaOOLzHVDR9OH+kaktiy4Q+J+bxPXG
	XJmmVZUg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjim-0000000DJBP-3Iw2;
	Fri, 03 Jan 2025 15:36:20 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTjfL-0000000DIJR-2u7S
	for linux-arm-kernel@lists.infradead.org;
	Fri, 03 Jan 2025 15:32:48 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id A94E81480;
	Fri,  3 Jan 2025 07:33:14 -0800 (PST)
Received: from [10.1.196.72] (e119884-lin.cambridge.arm.com [10.1.196.72])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 7E4BB3F6A8;
	Fri,  3 Jan 2025 07:32:44 -0800 (PST)
Message-ID: <9f430795-03c4-4ff4-ad71-92273877459a@arm.com>
Date: Fri, 3 Jan 2025 15:32:42 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 2/4] arm64: dts: morello: Add support for common
 functionalities
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org,
 Linus Walleij <linus.walleij@linaro.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Liviu Dudau <liviu.dudau@arm.com>,
 Sudeep Holla <sudeep.holla@arm.com>,
 Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Russell King <linux@armlinux.org.uk>
References: <20250102155416.13159-1-vincenzo.frascino@arm.com>
 <20250102155416.13159-3-vincenzo.frascino@arm.com>
 <b6grcxwvic33ojj3o46sjjvlyc2xwcy247n7ls4lyzkwhd73gs@pxi533kjm3yx>
Content-Language: en-US
From: Vincenzo Frascino <vincenzo.frascino@arm.com>
In-Reply-To: <b6grcxwvic33ojj3o46sjjvlyc2xwcy247n7ls4lyzkwhd73gs@pxi533kjm3yx>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250103_073247_849286_BD7E6937 
X-CRM114-Status: GOOD (  28.50  )
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



On 03/01/2025 07:53, Krzysztof Kozlowski wrote:
> On Thu, Jan 02, 2025 at 03:54:14PM +0000, Vincenzo Frascino wrote:
>> The Morello architecture is an experimental extension to Armv8.2-A,
>> which extends the AArch64 state with the principles proposed in
>> version 7 of the Capability Hardware Enhanced RISC Instructions
>> (CHERI) ISA.
>>
>> The Morello Platform (soc) and the Fixed Virtual Platfom (fvp) share
>> some functionalities that have conveniently been included in
>> morello.dtsi to avoid duplication.
>>
>> Introduce morello.dtsi.
>>
>> Note: Morello fvp will be introduced with a future patch series.
>>
>> Signed-off-by: Vincenzo Frascino <vincenzo.frascino@arm.com>
>> ---
>>  arch/arm64/boot/dts/arm/morello.dtsi | 341 +++++++++++++++++++++++++++
>>  1 file changed, 341 insertions(+)
>>  create mode 100644 arch/arm64/boot/dts/arm/morello.dtsi
>>
>> diff --git a/arch/arm64/boot/dts/arm/morello.dtsi b/arch/arm64/boot/dts/arm/morello.dtsi
>> new file mode 100644
>> index 000000000000..67bc960f4596
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/arm/morello.dtsi
>> @@ -0,0 +1,341 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR BSD-3-Clause)
>> +/*
>> + * Copyright (c) 2020-2024, Arm Limited. All rights reserved.
>> + */
>> +
>> +#include <dt-bindings/interrupt-controller/arm-gic.h>
>> +
>> +/ {
>> +	interrupt-parent = <&gic>;
>> +
>> +	#address-cells = <2>;
>> +	#size-cells = <2>;
>> +
>> +	chosen { };
> 
> Drop

Fine, I will do it in the next iteration. The file you asked me to see
(sm8650.dtsi) has the same expression. Why this is incorrect? What's the rationale?

> 
>> +
>> +	clocks {
>> +		soc_refclk50mhz: clock-50000000 {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <50000000>;
>> +			clock-output-names = "apb_pclk";
>> +		};
>> +
>> +		soc_refclk85mhz: clock-85000000 {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <85000000>;
>> +			clock-output-names = "iofpga:aclk";
>> +		};
>> +
>> +		soc_uartclk: clock-50000000-uart {
> 
> Keep nodes sorted by name.
> 

I missed this one. I will reorder it in the next iteration.

>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <50000000>;
>> +			clock-output-names = "uartclk";
>> +		};
>> +
>> +		dpu_aclk: dpu-aclk {
> 
> Keep consistent naming. If others use "clock-" then why this has
> different pattern?
> 

Ok, I will change it.

> 
>> +			/* 77.1 MHz derived from 24 MHz reference clock */
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <350000000>;
>> +			clock-output-names = "aclk";
>> +		};
>> +
>> +		dpu_pixel_clk: dpu-pixel-clk {
>> +			compatible = "fixed-clock";
>> +			#clock-cells = <0>;
>> +			clock-frequency = <148500000>;
>> +			clock-output-names = "pxclk";
>> +		};
>> +	};
>> +
>> +	cpus {
>> +		#address-cells = <2>;
>> +		#size-cells = <0>;
>> +
>> +		cpu0: cpu0@0 {
> 
> cpu@0
> 

Ok, will fix in the next iteration.

>> +			compatible = "arm,neoverse-n1";
>> +			reg = <0x0 0x0>;
>> +			device_type = "cpu";
>> +			enable-method = "psci";
>> +			clocks = <&scmi_dvfs 0>;
>> +		};
>> +
>> +		cpu1: cpu1@100 {
> 
> cpu@100
> 
> This applies to the entire patchset.
> 
> 
>> +			compatible = "arm,neoverse-n1";
>> +			reg = <0x0 0x100>;
>> +			device_type = "cpu";
>> +			enable-method = "psci";
>> +			clocks = <&scmi_dvfs 0>;
>> +		};
>> +
>> +		cpu2: cpu2@10000 {
>> +			compatible = "arm,neoverse-n1";
>> +			reg = <0x0 0x10000>;
>> +			device_type = "cpu";
>> +			enable-method = "psci";
>> +			clocks = <&scmi_dvfs 1>;
>> +		};
>> +
>> +		cpu3: cpu3@10100 {
>> +			compatible = "arm,neoverse-n1";
>> +			reg = <0x0 0x10100>;
>> +			device_type = "cpu";
>> +			enable-method = "psci";
>> +			clocks = <&scmi_dvfs 1>;
>> +		};
> 
> Missing cache nodes and properties.
> 

All right, I will have a look.

> 
>> +	};
>> +
>> +	firmware {
>> +		interrupt-parent = <&gic>;
>> +
>> +		scmi {
>> +			compatible = "arm,scmi";
>> +			mbox-names = "tx", "rx";
>> +			mboxes = <&mailbox 1 0>, <&mailbox 1 1>;
>> +			shmem = <&cpu_scp_hpri0>, <&cpu_scp_hpri1>;
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +
>> +			scmi_dvfs: protocol@13 {
>> +				reg = <0x13>;
>> +				#clock-cells = <1>;
>> +			};
>> +
>> +			scmi_clk: protocol@14 {
>> +				reg = <0x14>;
>> +				#clock-cells = <1>;
>> +			};
>> +		};
>> +	};
>> +
>> +	/* The first bank of memory, memory map is actually provided by UEFI. */
>> +	memory@80000000 {
>> +		device_type = "memory";
>> +		/* [0x80000000-0xffffffff] */
>> +		reg = <0x00000000 0x80000000 0x0 0x7F000000>;
>> +	};
>> +
>> +	memory@8080000000 {
>> +		device_type = "memory";
>> +		/* [0x8080000000-0x83f7ffffff] */
>> +		reg = <0x00000080 0x80000000 0x3 0x78000000>;
>> +	};
>> +
>> +	pmu {
>> +		compatible = "arm,armv8-pmuv3";
>> +		interrupts = <GIC_PPI 7 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>> +	psci {
>> +		compatible = "arm,psci-0.2";
>> +		method = "smc";
>> +	};
>> +
>> +	reserved-memory {
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		ranges;
>> +
>> +		secure-firmware@ff000000 {
>> +			reg = <0 0xff000000 0 0x01000000>;
>> +			no-map;
>> +		};
>> +	};
>> +
>> +	spe-pmu {
>> +		compatible = "arm,statistical-profiling-extension-v1";
>> +		interrupts = <GIC_PPI 5 IRQ_TYPE_LEVEL_HIGH>;
>> +	};
>> +
>> +	soc: soc {
>> +		compatible = "simple-bus";
>> +		#address-cells = <2>;
>> +		#size-cells = <2>;
>> +		interrupt-parent = <&gic>;
>> +		ranges;
>> +
>> +		dp0: display@2cc00000 {
>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			compatible = "arm,mali-d32", "arm,mali-d71";
> 
> I am pretty sure I asked for this: order properties according to DTS
> coding style, not random.
> 

You have, I missed this iteration.

>> +			reg = <0 0x2cc00000 0 0x20000>;
>> +			interrupts = <0 69 4>;
>> +			clocks = <&dpu_aclk>;
>> +			clock-names = "aclk";
>> +			iommus = <&smmu_dp 0>, <&smmu_dp 1>, <&smmu_dp 2>, <&smmu_dp 3>,
>> +				<&smmu_dp 8>;
>> +
>> +			pl0: pipeline@0 {
>> +				reg = <0>;
>> +				clocks = <&dpu_pixel_clk>;
>> +				clock-names = "pxclk";
>> +				port {
>> +					dp_pl0_out0: endpoint {
>> +						remote-endpoint = <&tda998x_0_input>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		i2c: i2c@1c0f0000 {
>> +			compatible = "cdns,i2c-r1p14";
>> +			reg = <0x0 0x1c0f0000 0x0 0x1000>;
> 
> And here order is correct... why each node is formatted differently?
> 

I tried to format them all in the same way. But I clearly missed some iterations.
Maybe providing an automated tool (e.g. extend checkpatch.pl) would save time to
developers and reviewers.

>> +			#address-cells = <1>;
>> +			#size-cells = <0>;
>> +			clock-frequency = <100000>;
> 
> This is usually property of the board, unless this is somehow blurred
> here.
> 

Ok, I will move it around.

>> +			interrupts = <GIC_SPI 138 IRQ_TYPE_LEVEL_HIGH>;
>> +			clocks = <&dpu_aclk>;
>> +
>> +			hdmi_tx: hdmi-transmitter@70 {
>> +				compatible = "nxp,tda998x";
>> +				reg = <0x70>;
>> +				video-ports = <0x234501>;
>> +				port {
>> +					tda998x_0_input: endpoint {
>> +						remote-endpoint = <&dp_pl0_out0>;
>> +					};
>> +				};
>> +			};
>> +		};
>> +
>> +		gic: interrupt-controller@2c010000 {
>> +			compatible = "arm,gic-v3";
>> +			#address-cells = <2>;
>> +			#interrupt-cells = <3>;
>> +			#size-cells = <2>;
>> +			ranges;
> 
> 
> Missing reg.... and why do you have ranges here? No children.
> 

I will remove it in the next iteration.

>> +			interrupt-controller;
>> +		};
>> +
>> +		smmu_dp: iommu@2ce00000 {
>> +			compatible = "arm,smmu-v3";
>> +			reg = <0 0x2ce00000 0 0x40000>;
>> +			interrupts = <GIC_SPI 76 IRQ_TYPE_EDGE_RISING>,
>> +					<GIC_SPI 80 IRQ_TYPE_EDGE_RISING>,
>> +					<GIC_SPI 78 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "eventq", "gerror", "cmdq-sync";
>> +			#iommu-cells = <1>;
>> +		};
>> +
>> +		smmu_ccix: iommu@4f000000 {
>> +			compatible = "arm,smmu-v3";
>> +			reg = <0 0x4f000000 0 0x40000>;
> 
> No hex here in reg but...
> 

Fine.

>> +			interrupts = <GIC_SPI 228 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 230 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 41 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 229 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
>> +			msi-parent = <&its1 0>;
>> +			#iommu-cells = <1>;
>> +			dma-coherent;
>> +		};
>> +
>> +		smmu_pcie: iommu@4f400000 {
>> +			compatible = "arm,smmu-v3";
>> +			reg = <0 0x4f400000 0 0x40000>;
>> +			interrupts = <GIC_SPI 235 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 237 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 40 IRQ_TYPE_EDGE_RISING>,
>> +				     <GIC_SPI 236 IRQ_TYPE_EDGE_RISING>;
>> +			interrupt-names = "eventq", "gerror", "priq", "cmdq-sync";
>> +			msi-parent = <&its2 0>;
>> +			#iommu-cells = <1>;
>> +			dma-coherent;
>> +		};
>> +
>> +		mailbox: mhu@45000000 {
>> +			compatible = "arm,mhu-doorbell", "arm,primecell";
>> +			reg = <0x0 0x45000000 0x0 0x1000>;
> 
> here hex. Well, one more inconsistency in the same file. It's usually
> hex everywhere in reg and ranges.
> 

Fine.

>> +			interrupts = <GIC_SPI 318 IRQ_TYPE_LEVEL_HIGH>,
>> +				     <GIC_SPI 316 IRQ_TYPE_LEVEL_HIGH>;
>> +			#mbox-cells = <2>;
>> +			clocks = <&soc_refclk50mhz>;
>> +			clock-names = "apb_pclk";
>> +		};
>> +
>> +		pcie_ctlr: pcie@28c0000000 {
>> +			compatible = "pci-host-ecam-generic";
>> +			device_type = "pci";
>> +			reg = <0x28 0xC0000000 0 0x10000000>;
>> +			ranges = <0x01000000 0x00 0x00000000 0x00 0x6F000000 0x00 0x00800000>,
>> +				 <0x02000000 0x00 0x60000000 0x00 0x60000000 0x00 0x0F000000>,
>> +				 <0x42000000 0x09 0x00000000 0x09 0x00000000 0x1F 0xC0000000>;
> 
> lowercase hex
>

Ok.

>> +			bus-range = <0 255>;
>> +			linux,pci-domain = <0>;
>> +			#address-cells = <3>;
> 
> Best regards,
> Krzysztof
> 

-- 
Regards,
Vincenzo


