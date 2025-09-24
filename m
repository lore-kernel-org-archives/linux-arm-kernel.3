Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F056CCAC5B3
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 24 Sep 2025 08:34:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Cc:Content-ID:Content-Description:Resent-Date:Resent-From
	:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UrPkFZg9UXvWvVyQk7ot6ccfVBCiplzsPaS75y+4B4I=; b=My/2bGHo0W3KZ2rOPC3GNWLkyP
	D05PwpaeOgeDgiQSxY6jMdVeQh3Hf3562vaZub4LkYxLn076ytV83EMArmyQdMukjG46CcWaWkX5C
	uNt7xtqtKHA80ahJ/GZeYcqWqj2yvyrzFSj9GtePue9Xpfug0pz6SRJd3zDNIKNQPS0VdtTUTBSev
	t+XA2uOMMm65wlHmbdwqlmgYa9c+v65wsk+cdcx3VtdEmzq7b71qeskzCRHsRWbl62bq2peElvVYG
	o/GgvaqLgYvVbvogZ/yfPtjmILIoFcm/Ar5KCEEIG0naoLoiaGpP2tGAmqrlSRoGulCkWk2acQ1E9
	6NU1Aeeg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1Kxf-0000000FtSA-3kQD;
	Wed, 24 Sep 2025 08:34:51 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v1KxY-0000000FtOW-1A4B;
	Wed, 24 Sep 2025 08:34:45 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1758702881;
	bh=VdHX48lqCFSosZvX9FtA92m9ELKCKlcdOBW2HmyJPaM=;
	h=Date:Subject:To:References:From:In-Reply-To:From;
	b=XaqbDzooaatmy2NMad8g4HR8NWNtVigysbLC4clikTQdowbAu9cRmDqGPupLTTSfi
	 GznKPmokpz9GxBlxhuCJqpvH54YSXTtRflvHWKBj9CAO4PpSHyMGnOYYILmGRk2Ss5
	 FN2Rk6neTZfcu6lRLA2cl7Qr+p7HEjA8N7lZb43epZNKl7/VYjLhD1T1ELbfbrapbo
	 x9hxv/Pwt/xBu7dCBxZf2mXRilnLztWB3D1A1sgJ2D6YZD0J183k1U2kQ7QZXtGY0A
	 mvAO/amAv5R5IacKxafjJSmZj3+IQIvG4zfVfzvg+YeeJokTO6L4091wvneKSziXz+
	 plk67zSybeHJQ==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 6E54A17E0C21;
	Wed, 24 Sep 2025 10:34:41 +0200 (CEST)
Message-ID: <79b738be-d51c-4414-801d-3430c18f0b72@collabora.com>
Date: Wed, 24 Sep 2025 10:34:41 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: Add Airoha AN7583 SoC and AN7583
 Evaluation Board
To: Christian Marangi <ansuelsmth@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Felix Fietkau <nbd@nbd.name>, John Crispin <john@phrozen.org>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20250923185340.21526-1-ansuelsmth@gmail.com>
 <20250923185340.21526-2-ansuelsmth@gmail.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20250923185340.21526-2-ansuelsmth@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250924_013444_522384_7491849D 
X-CRM114-Status: GOOD (  18.30  )
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

Il 23/09/25 20:53, Christian Marangi ha scritto:
> Introduce Airoha AN7583 SoC initial DTSI and AN7583 Evaluation Board
> DTS and add the required entry in the Makefile.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
> Changes v2:
> - Fix DTB BOT warning (fix crypto compatible and OPP node name)
> 
>   arch/arm64/boot/dts/airoha/Makefile       |   1 +
>   arch/arm64/boot/dts/airoha/an7583-evb.dts |  22 ++
>   arch/arm64/boot/dts/airoha/an7583.dtsi    | 282 ++++++++++++++++++++++
>   3 files changed, 305 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/airoha/an7583-evb.dts
>   create mode 100644 arch/arm64/boot/dts/airoha/an7583.dtsi
> 
> diff --git a/arch/arm64/boot/dts/airoha/Makefile b/arch/arm64/boot/dts/airoha/Makefile
> index ebea112ce1d7..7a604ae249b5 100644
> --- a/arch/arm64/boot/dts/airoha/Makefile
> +++ b/arch/arm64/boot/dts/airoha/Makefile
> @@ -1,2 +1,3 @@
>   # SPDX-License-Identifier: GPL-2.0-only
>   dtb-$(CONFIG_ARCH_AIROHA) += en7581-evb.dtb
> +dtb-$(CONFIG_ARCH_AIROHA) += an7583-evb.dtb
> diff --git a/arch/arm64/boot/dts/airoha/an7583-evb.dts b/arch/arm64/boot/dts/airoha/an7583-evb.dts
> new file mode 100644
> index 000000000000..a7f83436825e
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7583-evb.dts
> @@ -0,0 +1,22 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +/dts-v1/;
> +
> +#include "an7583.dtsi"
> +
> +/ {
> +	model = "Airoha EN7583 Evaluation Board";

There's a typo - you wrote EN instead of AN.

> +	compatible = "airoha,an7583-evb", "airoha,an7583";
> +
> +	aliases {
> +		serial0 = &uart1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x80000000 0x2 0x00000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/airoha/an7583.dtsi b/arch/arm64/boot/dts/airoha/an7583.dtsi
> new file mode 100644
> index 000000000000..a6a5df60d0e1
> --- /dev/null
> +++ b/arch/arm64/boot/dts/airoha/an7583.dtsi
> @@ -0,0 +1,282 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +
> +#include <dt-bindings/interrupt-controller/irq.h>
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	interrupt-parent = <&gic>;
> +	#address-cells = <2>;
> +	#size-cells = <2>;
> +
> +	psci {
> +		compatible = "arm,psci-1.0";
> +		method = "smc";
> +	};
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu-map {
> +			cluster0 {
> +				core0 {
> +					cpu = <&cpu0>;
> +				};
> +
> +				core1 {
> +					cpu = <&cpu1>;
> +				};
> +			};
> +		};
> +
> +		cpu0: cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x0>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			enable-method = "psci";
> +			clocks = <&cpufreq>;
> +			clock-names = "cpu";
> +			power-domains = <&cpufreq>;
> +			power-domain-names = "perf";
> +			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		cpu1: cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0x1>;
> +			operating-points-v2 = <&cpu_opp_table>;
> +			enable-method = "psci";
> +			clocks = <&cpufreq>;
> +			clock-names = "cpu";
> +			power-domains = <&cpufreq>;
> +			power-domain-names = "perf";
> +			next-level-cache = <&l2>;
> +			#cooling-cells = <2>;
> +		};
> +
> +		l2: l2-cache {
> +			compatible = "cache";
> +			cache-size = <0x80000>;
> +			cache-line-size = <64>;
> +			cache-level = <2>;
> +			cache-unified;
> +		};
> +	};
> +
> +	cpufreq: cpufreq {
> +		compatible = "airoha,en7581-cpufreq";
> +
> +		operating-points-v2 = <&smcc_opp_table>;
> +
> +		#power-domain-cells = <0>;
> +		#clock-cells = <0>;
> +	};
> +
> +	cpu_opp_table: opp-table-cpu {
> +		compatible = "operating-points-v2";
> +		opp-shared;
> +
> +		opp-500000000 {
> +			opp-hz = /bits/ 64 <500000000>;
> +			required-opps = <&smcc_opp0>;
> +		};
> +
> +		opp-550000000 {
> +			opp-hz = /bits/ 64 <550000000>;
> +			required-opps = <&smcc_opp1>;
> +		};
> +
> +		opp-600000000 {
> +			opp-hz = /bits/ 64 <600000000>;
> +			required-opps = <&smcc_opp2>;
> +		};
> +
> +		opp-650000000 {
> +			opp-hz = /bits/ 64 <650000000>;
> +			required-opps = <&smcc_opp3>;
> +		};
> +
> +		opp-7000000000 {
> +			opp-hz = /bits/ 64 <700000000>;
> +			required-opps = <&smcc_opp4>;
> +		};
> +
> +		opp-7500000000 {
> +			opp-hz = /bits/ 64 <750000000>;
> +			required-opps = <&smcc_opp5>;
> +		};
> +
> +		opp-8000000000 {
> +			opp-hz = /bits/ 64 <800000000>;
> +			required-opps = <&smcc_opp6>;
> +		};
> +
> +		opp-8500000000 {
> +			opp-hz = /bits/ 64 <850000000>;
> +			required-opps = <&smcc_opp7>;
> +		};
> +
> +		opp-9000000000 {
> +			opp-hz = /bits/ 64 <900000000>;
> +			required-opps = <&smcc_opp8>;
> +		};
> +
> +		opp-9500000000 {
> +			opp-hz = /bits/ 64 <950000000>;
> +			required-opps = <&smcc_opp9>;
> +		};
> +
> +		opp-10000000000 {
> +			opp-hz = /bits/ 64 <1000000000>;
> +			required-opps = <&smcc_opp10>;
> +		};
> +
> +		opp-10500000000 {
> +			opp-hz = /bits/ 64 <1050000000>;
> +			required-opps = <&smcc_opp11>;
> +		};
> +
> +		opp-11000000000 {
> +			opp-hz = /bits/ 64 <1100000000>;
> +			required-opps = <&smcc_opp12>;
> +		};
> +
> +		opp-11500000000 {
> +			opp-hz = /bits/ 64 <1150000000>;
> +			required-opps = <&smcc_opp13>;
> +		};
> +
> +		opp-12000000000 {
> +			opp-hz = /bits/ 64 <1200000000>;
> +			required-opps = <&smcc_opp14>;
> +		};
> +	};
> +
> +	smcc_opp_table: opp-table-smcc {
> +		compatible = "operating-points-v2";
> +
> +		smcc_opp0: opp-0 {
> +			opp-level = <0>;
> +		};
> +
> +		smcc_opp1: opp-1 {
> +			opp-level = <1>;
> +		};
> +
> +		smcc_opp2: opp-2 {
> +			opp-level = <2>;
> +		};
> +
> +		smcc_opp3: opp-3 {
> +			opp-level = <3>;
> +		};
> +
> +		smcc_opp4: opp-4 {
> +			opp-level = <4>;
> +		};
> +
> +		smcc_opp5: opp-5 {
> +			opp-level = <5>;
> +		};
> +
> +		smcc_opp6: opp-6 {
> +			opp-level = <6>;
> +		};
> +
> +		smcc_opp7: opp-7 {
> +			opp-level = <7>;
> +		};
> +
> +		smcc_opp8: opp-8 {
> +			opp-level = <8>;
> +		};
> +
> +		smcc_opp9: opp-9 {
> +			opp-level = <9>;
> +		};
> +
> +		smcc_opp10: opp-10 {
> +			opp-level = <10>;
> +		};
> +
> +		smcc_opp11: opp-11 {
> +			opp-level = <11>;
> +		};
> +
> +		smcc_opp12: opp-12 {
> +			opp-level = <12>;
> +		};
> +
> +		smcc_opp13: opp-13 {
> +			opp-level = <13>;
> +		};
> +
> +		smcc_opp14: opp-14 {
> +			opp-level = <14>;
> +		};
> +	};
> +
> +	timer {
> +		compatible = "arm,armv8-timer";
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +	};
> +
> +	sys_hclk: clk-oscillator-100mhz {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <100000000>;
> +		clock-output-names = "sys_hclk";
> +	};
> +
> +	soc {
> +		compatible = "simple-bus";
> +		#address-cells = <2>;
> +		#size-cells = <2>;
> +		ranges;
> +
> +		gic: interrupt-controller@9000000 {
> +			compatible = "arm,gic-v3";
> +			interrupt-controller;
> +			#interrupt-cells = <3>;
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +			reg = <0x0 0x09000000 0x0 0x20000>,
> +			      <0x0 0x09080000 0x0 0x80000>,
> +			      <0x0 0x09400000 0x0 0x2000>,
> +			      <0x0 0x09500000 0x0 0x2000>,
> +			      <0x0 0x09600000 0x0 0x20000>;
> +			interrupts = <GIC_PPI 9 IRQ_TYPE_LEVEL_LOW>;
> +		};
> +
> +		crypto@1e004000 {
> +			compatible = "airoha,en7581-eip93", "inside-secure,safexcel-eip93ies";

First of all: sorry for not catching this in the first review.

This is wrong - the compatible string must contain the SoC compatible, but this is
AN7583, not EN7581.

Either of

compatible = "airoha,an7583-eip93", "inside-secure,safexcel-eip93ies";

or

compatible = "airoha,an7583-eip93", "airoha,en7581-eip93",
	     "inside-secure,safexcel-eip93ies";

is acceptable. Of course, you have to add that to the bindings.

> +			reg = <0x0 0x1fb70000 0x0 0x1000>;
> +
> +			interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>;
> +		};
> +
> +		uart1: serial@1fbf0000 {
> +			compatible = "ns16550";
> +			reg = <0x0 0x1fbf0000 0x0 0x30>;
> +			reg-io-width = <4>;
> +			reg-shift = <2>;
> +			interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +			clock-frequency = <1843200>;
> +		};
> +
> +		watchdog@1fbf0100 {
> +			compatible = "airoha,en7581-wdt";

compatible = "airoha,an7583-wdt", "airoha,en7581-wdt";

(and add to the bindings)

Everything else looks ok.

Cheers,
Angelo



