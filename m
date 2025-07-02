Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 84A90C83013
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  2 Jul 2025 12:46:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=wBXlSC69fbi2XFqfrqDMl3EtGUg9hXSoIw8ig2CbnBo=; b=CVJ3nf03OlUxe6inNQUarP4PfW
	phJ/EQOBx7/IUrJEfHemrWW1bOyhS9YRJys4k31cfkCyqBdtc3L7t9kh1aR8NKefhExRqnf5sPJzl
	cTVbYihkksZsWzwzHroBTupdunQctb227eyxKd0OpUFg21cg7e8hXZkx/c/ovsLxEuSGnQHP9PDsD
	h45dI5mm+IMe3UxVH7ByDBwWQyVeanDjzpbXWfcshoblmS38yxRCU6lqgkH8BS6GkVtCJ+n9gtgOr
	hBsdXT/+qOv8tbcd5GL0+qNhvtQchZOHK6TiDOPObToSUCZG/qzH5KSszmjymB7IFDsflB7oWYbne
	d+bXXnRg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwqP-00000008LYI-3BLS;
	Wed, 02 Jul 2025 12:45:45 +0000
Received: from foss.arm.com ([217.140.110.172])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWwN0-00000008GvH-2nWL
	for linux-arm-kernel@lists.infradead.org;
	Wed, 02 Jul 2025 12:15:24 +0000
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id BAA6722D9;
	Wed,  2 Jul 2025 05:15:04 -0700 (PDT)
Received: from [10.1.27.90] (010265703453.arm.com [10.1.27.90])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id B9E7D3F58B;
	Wed,  2 Jul 2025 05:15:15 -0700 (PDT)
Message-ID: <b287de09-223c-4916-8ea1-ab474df407ef@arm.com>
Date: Wed, 2 Jul 2025 13:15:13 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 6/8] arm64: dts: bst: add support for Black Sesame
 Technologies C1200 CDCU1.0 board and defconfig
To: Albert Yang <yangzh0906@thundersoft.com>, robh@kernel.org,
 krzk+dt@kernel.org, krzk@kernel.org, conor+dt@kernel.org, gordon.ge@bst.ai,
 catalin.marinas@arm.com, geert.uytterhoeven@gmail.com, will@kernel.org,
 ulf.hansson@linaro.org, adrian.hunter@intel.com, arnd@arndb.de
Cc: linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org,
 devicetree@vger.kernel.org, linux-mmc@vger.kernel.org, soc@lists.linux.dev,
 bst-upstream@bstai.top, neil.armstrong@linaro.org,
 jonathan.cameron@huawei.com, bigfoot@classfun.cn, kever.yang@rock-chips.com,
 mani@kernel.org, geert+renesas@glider.be, andersson@kernel.org, nm@ti.com,
 nfraprado@collabora.com, quic_tdas@quicinc.com, ebiggers@google.com,
 victor.shih@genesyslogic.com.tw, shanchun1218@gmail.com,
 ben.chuang@genesyslogic.com.tw
References: <20250528085403.481055-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-1-yangzh0906@thundersoft.com>
 <20250702094444.3523973-7-yangzh0906@thundersoft.com>
From: Robin Murphy <robin.murphy@arm.com>
Content-Language: en-GB
In-Reply-To: <20250702094444.3523973-7-yangzh0906@thundersoft.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250702_051522_800652_89AE353C 
X-CRM114-Status: GOOD (  13.11  )
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

On 2025-07-02 10:44 am, Albert Yang wrote:
[...]
> diff --git a/arch/arm64/boot/dts/bst/bstc1200.dtsi b/arch/arm64/boot/dts/bst/bstc1200.dtsi
> new file mode 100644
> index 000000000000..ddff2cb82cb0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/bst/bstc1200.dtsi
> @@ -0,0 +1,117 @@
> +// SPDX-License-Identifier: GPL-2.0
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible = "bst,c1200";
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_cache>;
> +			reg = <0>;
> +		};
> +
> +		cpu@1 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_cache>;
> +			reg = <0x100>;
> +		};
> +
> +		cpu@2 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_cache>;
> +			reg = <0x200>;
> +		};
> +
> +		cpu@3 {
> +			compatible = "arm,cortex-a78";
> +			device_type = "cpu";
> +			enable-method = "psci";
> +			next-level-cache = <&l2_cache>;
> +			reg = <0x300>;
> +		};
> +
> +		l2_cache: l2-cache-1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-unified;
> +		};
> +	};
> +
> +	clk_mmc: clock-4000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <4000000>;
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		always-on;
> +		interrupts = <GIC_PPI 13 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 14 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 11 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>,
> +			     <GIC_PPI 10 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;

Your PPIs target 8 of the 4 CPUS? Either way you don't have GICv2, 
please use the GICv3 binding.

> +	};
> +
> +	soc: soc@0 {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges = <0x0 0x0 0x0 0x0 0xffffffff 0xffffffff>;
> +		interrupt-parent = <&gic>;
> +
> +		mmc0: mmc@22200000 {
> +			compatible = "bst,c1200-dwcmshc-sdhci";
> +			reg = <0x0 0x22200000 0x0 0x1000>,
> +			      <0x0 0x23006000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 144 IRQ_TYPE_LEVEL_HIGH>;
> +			clocks = <&clk_mmc>;
> +			clock-names = "core";
> +			max-frequency = <200000000>;
> +			bus-width = <8>;
> +			non-removable;
> +			dma-coherent;

Given the funky DMA setup, I can't help be mildly suspicious of this - 
is the device genuinely I/O coherent and capable of snooping the CPU 
caches, or are you only getting away with it because 
dma_init_coherent_memory() happens to remap as non-cacheable regardless?

Thanks,
Robin.

> +			status = "disabled";
> +		};
> +
> +		uart0: serial@20008000 {
> +			compatible = "snps,dw-apb-uart";
> +			reg = <0x0 0x20008000 0x0 0x1000>;
> +			interrupts = <GIC_SPI 211 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency = <25000000>;
> +			reg-shift = <2>;
> +			reg-io-width = <4>;
> +			status = "disabled";
> +		};
> +
> +		gic: interrupt-controller@32800000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			interrupt-controller;
> +			ranges;
> +			reg = <0x0 0x32800000 0x0 0x10000>,
> +			      <0x0 0x32880000 0x0 0x100000>;
> +			interrupts = <GIC_PPI 9 (GIC_CPU_MASK_SIMPLE(8) | IRQ_TYPE_LEVEL_LOW)>;
> +		};
> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +};
> diff --git a/arch/arm64/configs/defconfig b/arch/arm64/configs/defconfig
> index 897fc686e6a9..0a1cfaa19688 100644
> --- a/arch/arm64/configs/defconfig
> +++ b/arch/arm64/configs/defconfig
> @@ -45,6 +45,7 @@ CONFIG_ARCH_BCMBCA=y
>   CONFIG_ARCH_BRCMSTB=y
>   CONFIG_ARCH_BERLIN=y
>   CONFIG_ARCH_BLAIZE=y
> +CONFIG_ARCH_BST=y
>   CONFIG_ARCH_EXYNOS=y
>   CONFIG_ARCH_SPARX5=y
>   CONFIG_ARCH_K3=y


