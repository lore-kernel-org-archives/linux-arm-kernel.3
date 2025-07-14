Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B1FAAC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 16:45:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=89xRQGn8GXYr5UNQ4gD+7wAxCvFCJdWFG9cHNOXippk=; b=BlFmaS5UxMsFJ8mlMfgzCYHD1f
	dL2M55FrWW83914eRVzR9rEGFWnmBd+v7cMz+eW5K4KhHqJlkrkef/i1UMSMEUzNTqHqSgwCAzjxM
	yRq4/1c+7+JZAnfzYVey4AMZ3LsBVAJZJhsjco2Zf3e+Y0r0UhTmYFdnjk2NQqRheYQVHUjE28f+F
	ekHyrCWVoTyamUwgzG76/v2NAhKhvPd7RsX6qlIUGYeOqSRXm6EFADMDqrFHvlBAnhCsB/W2RWTED
	STDH2j50vhhTu6YffvQlIw3xh1WIOX26FJZFmsyhxVb72o/2ez3iSrTjf8VXAv0TDts6zvZ/QrOZM
	oKoOFRXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubMIf-00000002s1h-1m4i;
	Mon, 14 Jul 2025 16:45:09 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubKVS-00000002WNq-496D;
	Mon, 14 Jul 2025 14:50:16 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1752504613;
	bh=4e1zFyaps4hCFIzS4+Rcitk2oT870HoKdMC/yPHqAVU=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=NLFbU2y+Ghe4oQNX/ihc7STFc76NGB1IiDG/zAHc2vzHKfl7HgNwe2Jshs6BmUl+8
	 C18ezrnm1fOwuQR9ESTnPgrxiQ6tIu+eMY2hVSxMz/noQIYWdGnqHjgpL2dcU7829n
	 9jz6jmML+guI+4F0+cELQx+ltFSXOoxNBpHFZpAL6OJP74qC+pnJTmbYhbJn8Yuw37
	 8/Hc5JeUq+UvR+1KhodPx6VHyd7UBYxOY4W1EGZY/iO58MIl9st9/QUDwpfe41C940
	 wGLb+nFRvId/cve67hpUc8uLwrLos8cLT0pt1bBPAE5LJhsNndEBfC8h50+bTEd6zg
	 kY7Xh7siHv66g==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 5C45817E0489;
	Mon, 14 Jul 2025 16:50:12 +0200 (CEST)
Message-ID: <7ecd1ae9-3940-4070-970b-c53ccaf9d850@collabora.com>
Date: Mon, 14 Jul 2025 16:50:11 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/3] arm64: dts: mt8189: Add mt8189 dts evaluation
 board and Mafefile
To: Sirius Wang <sirius.wang@mediatek.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Jiri Slaby <jirislaby@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-serial@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org, wenst@chromium.org,
 xavier.chang@mediatek.com
References: <20250714140608.2065966-1-sirius.wang@mediatek.com>
 <20250714140608.2065966-4-sirius.wang@mediatek.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250714140608.2065966-4-sirius.wang@mediatek.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250714_075015_352614_D826DDDD 
X-CRM114-Status: GOOD (  16.74  )
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

Il 14/07/25 16:06, Sirius Wang ha scritto:
> Add mt8189 dts evaluation board and Mafefile
> 
> Signed-off-by: Sirius Wang <sirius.wang@mediatek.com>
> ---
>   arch/arm64/boot/dts/mediatek/Makefile       |   1 +
>   arch/arm64/boot/dts/mediatek/mt8189-evb.dts |  20 +
>   arch/arm64/boot/dts/mediatek/mt8189.dtsi    | 419 ++++++++++++++++++++
>   3 files changed, 440 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8189-evb.dts
>   create mode 100644 arch/arm64/boot/dts/mediatek/mt8189.dtsi
> 
> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/mediatek/Makefile
> index a4df4c21399e..52c5b799308e 100644
> --- a/arch/arm64/boot/dts/mediatek/Makefile
> +++ b/arch/arm64/boot/dts/mediatek/Makefile
> @@ -88,6 +88,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku4.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku5.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku6.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8188-geralt-ciri-sku7.dtb
> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8189-evb.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-hayato-r1.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-asurada-spherion-r0.dtb
>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8192-evb.dtb
> diff --git a/arch/arm64/boot/dts/mediatek/mt8189-evb.dts b/arch/arm64/boot/dts/mediatek/mt8189-evb.dts
> new file mode 100644
> index 000000000000..e5d9ce1b8e61
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189-evb.dts
> @@ -0,0 +1,20 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (C) 2025 MediaTek Inc.
> + * Author: Sirius Wang <sirius.wang@mediatek.com>
> + */
> +/dts-v1/;
> +#include "mt8189.dtsi"
> +
> +/ {
> +	model = "MediaTek MT8189 evaluation board";
> +	compatible = "mediatek,mt8189-evb", "mediatek,mt8189";
> +
> +	chosen: chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +};
> +
> +&uart0 {
> +	status = "okay";
> +};
> diff --git a/arch/arm64/boot/dts/mediatek/mt8189.dtsi b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
> new file mode 100644
> index 000000000000..a484a40a036c
> --- /dev/null
> +++ b/arch/arm64/boot/dts/mediatek/mt8189.dtsi
> @@ -0,0 +1,419 @@
> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
> +/*
> + * Copyright (c) 2025 MediaTek Inc.
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +#include <dt-bindings/interrupt-controller/irq.h>
> +
> +/ {
> +	compatible = "mediatek,mt8189";
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	clk32k: oscillator-clk32k {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32000>;
> +		clock-output-names = "clk32k";
> +	};
> +
> +	clk13m: oscillator-clk13m {
> +		compatible = "fixed-factor-clock";
> +		#clock-cells = <0>;
> +		clocks = <&clk26m>;
> +		clock-mult = <1>;
> +		clock-div = <2>;
> +		clock-output-names = "clk13m";
> +	};
> +
> +	clk26m: oscillator-clk26m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <26000000>;
> +		clock-output-names = "clk26m";
> +	};
> +
> +	clk104m: oscillator-clk104m {
> +		compatible = "fixed-factor-clock";
> +		#clock-cells = <0>;
> +		clocks = <&clk26m>;
> +		clock-mult = <4>;
> +		clock-div = <1>;
> +		clock-output-names = "clk104m";
> +	};
> +
> +	ulposc: oscillator-ulposc {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <520000000>;
> +		clock-output-names = "ulposc";
> +	};
> +
> +	ulposc3: oscillator-ulposc3 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <26000000>;
> +		clock-output-names = "ulposc3";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x000>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <742>;
> +			cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu1: cpu@100 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x100>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <742>;
> +			cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu2: cpu@200 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x200>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <742>;
> +			cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu3: cpu@300 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x300>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <742>;
> +			cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu4: cpu@400 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x400>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <742>;
> +			cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu5: cpu@500 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a55";
> +			reg = <0x500>;
> +			enable-method = "psci";
> +			clock-frequency = <2000000000>;
> +			capacity-dmips-mhz = <742>;
> +			cpu-idle-states = <&cpu_off_l>, <&cpu_s2idle>;
> +			i-cache-size = <32768>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <128>;
> +			d-cache-size = <32768>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <128>;
> +			next-level-cache = <&l2_0>;
> +			performance-domains = <&performance 0>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu6: cpu@600 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a78";
> +			reg = <0x600>;
> +			enable-method = "psci";
> +			clock-frequency = <3000000000>;
> +			capacity-dmips-mhz = <958>;
> +			cpu-idle-states = <&cpu_off_b>, <&cpu_s2idle>;
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_1>;
> +			performance-domains = <&performance 1>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu7: cpu@700 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a78";
> +			reg = <0x700>;
> +			enable-method = "psci";
> +			clock-frequency = <3000000000>;
> +			capacity-dmips-mhz = <958>;
> +			cpu-idle-states = <&cpu_off_b>, <&cpu_s2idle>;
> +			i-cache-size = <65536>;
> +			i-cache-line-size = <64>;
> +			i-cache-sets = <256>;
> +			d-cache-size = <65536>;
> +			d-cache-line-size = <64>;
> +			d-cache-sets = <256>;
> +			next-level-cache = <&l2_1>;
> +			performance-domains = <&performance 1>;
> +			#cooling-cells = <2>;
> +		};
> +
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
> +				core4 {
> +					cpu = <&cpu4>;
> +				};
> +				core5 {
> +					cpu = <&cpu5>;
> +				};
> +				core6 {
> +					cpu = <&cpu6>;
> +				};
> +				core7 {
> +					cpu = <&cpu7>;
> +				};
> +			};
> +		};
> +
> +		idle-states {
> +			entry-method = "psci";
> +
> +			cpu_off_l: cpu-off-l {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00010000>;
> +				local-timer-stop;
> +				entry-latency-us = <25>;
> +				exit-latency-us = <57>;
> +				min-residency-us = <5700>;
> +			};
> +
> +			cpu_off_b: cpu-off-b {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x00010000>;
> +				local-timer-stop;
> +				entry-latency-us = <35>;
> +				exit-latency-us = <82>;
> +				min-residency-us = <1890>;
> +			};
> +
> +			cpu_cluster_off_l: cpu-cluster-off-l {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x01010001>;
> +				local-timer-stop;
> +				entry-latency-us = <57>;
> +				exit-latency-us = <134>;
> +				min-residency-us = <5700>;
> +			};
> +
> +			cpu_cluster_off_b: cpu-cluster-off-b {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x01010001>;
> +				local-timer-stop;
> +				entry-latency-us = <50>;
> +				exit-latency-us = <144>;
> +				min-residency-us = <2460>;
> +			};
> +
> +			cpu_mcusys_off_l: cpu-mcusys-off-l {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x02010007>;
> +				local-timer-stop;
> +				entry-latency-us = <863>;
> +				exit-latency-us = <1237>;
> +				min-residency-us = <5700>;
> +			};
> +
> +			cpu_mcusys_off_b: cpu-mcusys-off-b {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x02010007>;
> +				local-timer-stop;
> +				entry-latency-us = <648>;
> +				exit-latency-us = <1172>;
> +				min-residency-us = <4570>;
> +			};
> +
> +			cpu_system_vcore: cpu-system-vcore {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x020100ff>;
> +				local-timer-stop;
> +				entry-latency-us = <2400>;
> +				exit-latency-us = <4800>;
> +				min-residency-us = <35200>;
> +			};
> +
> +			cpu_s2idle: cpu-s2idle {
> +				compatible = "arm,idle-state";
> +				arm,psci-suspend-param = <0x020180ff>;
> +				local-timer-stop;
> +				entry-latency-us = <10000>;
> +				exit-latency-us = <10000>;
> +				min-residency-us = <4294967295>;
> +			};
> +		};
> +
> +		l2_0: l2-cache0 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-size = <131072>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			next-level-cache = <&l3_0>;
> +			cache-unified;
> +		};
> +
> +		l2_1: l2-cache1 {
> +			compatible = "cache";
> +			cache-level = <2>;
> +			cache-size = <262144>;
> +			cache-line-size = <64>;
> +			cache-sets = <512>;
> +			next-level-cache = <&l3_0>;
> +			cache-unified;
> +		};
> +
> +		l3_0: l3-cache {
> +			compatible = "cache";
> +			cache-level = <3>;
> +			cache-size = <1048576>;
> +			cache-line-size = <64>;
> +			cache-sets = <2048>;
> +			cache-unified;
> +		};
> +	};
> +
> +	memory: memory@40000000 {
> +		device_type = "memory";
> +		reg = <0 0x40000000 0 0xc0000000>;

The memory node is anyway filled in by the bootloader, so please just

		/* The memory size is filled in by the bootloader */
		reg = <0 0x40000000 0 0>;

> +	};
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	timer: timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_HIGH 0>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_HIGH 0>;
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +		dma-ranges = <0x0 0x0 0x0 0x0 0x10 0x0>;
> +
> +		performance: performance-controller@11bc10 {
> +			compatible = "mediatek,cpufreq-hw";
> +			reg = <0 0x0011bc10 0 0x120>, <0 0x0011bd30 0 0x120>;
> +			#performance-domain-cells = <1>;
> +		};
> +
> +		gic: interrupt-controller@c000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <4>;
> +			#address-cells = <2>;
> +			#size-cells = <2>;
> +			interrupt-parent = <&gic>;
> +			interrupt-controller;
> +			reg = <0 0xc000000 0 0x40000>, /* distributor */
> +			      <0 0xc040000 0 0x200000>; /* redistributor */
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_HIGH 0>;
> +
> +			ppi-partitions {
> +				ppi_cluster0: interrupt-partition-0 {
> +					affinity = <&cpu0 &cpu1 &cpu2 &cpu3 &cpu4 &cpu5>;
> +				};
> +
> +				ppi_cluster1: interrupt-partition-1 {
> +					affinity = <&cpu6 &cpu7>;
> +				};
> +			};
> +		};
> +
> +		uart0: serial@11001000 {
> +			compatible = "mediatek,mt8189-uart", "mediatek,mt6577-uart";
> +			reg = <0 0x11001000 0 0x1000>;
> +			interrupts = <GIC_SPI 397 IRQ_TYPE_LEVEL_HIGH 0>;
> +			clocks = <&clk26m>, <&clk26m>;

Instead of faking that clk26m, please just add the clock controller and use the
right clocks for this UART.

All of that is in its early stages and it doesn't make a lot of sense to start this
devicetree with just that - especially because, well, your target is to upstream
way more than that, right?

So just make it right - add the topckgen and infracfg_ao clocks and then just add
in all of the UART controllers with their CLK_INFRA_AO_UART(N) clock for an initial
devicetree.

Count that if you add the topckgen and infra_ao clocks, you'd be able to even add
the i2c, spi, mmc and others - but I will accept an initial devicetree with just
all of the UART controllers and without the extra busses for a start, there's no
problem with that. You can add those later if you wish.

Cheers,
Angelo

> +			clock-names = "baud", "bus";
> +			status = "disabled";
> +		};
> +	};
> +};


