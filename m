Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4EDE7E9A745
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 09:21:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M8KntcjXhStth25cptnDw+Tp7ncmtoHLEvhFMwBdb0o=; b=Z/ODNttgo5HHdOY6HlZN8FV7w1
	0jebbGwZAv0e6/8wDLUDSv2xC47bEls2EKrQkmQWehwZP9kGT9wfzIEJVOOttj8PKiydrE9Wl5A4B
	6H0hhXHMcx5KtxCNyGQeZ4geLOiy0cpN5RghuJmN52ZW75n6tl/QOr9UW8vlCNdLwQ8pvg/YdElEm
	LltFMO+UeCJDwDv/1CX0fnljVSyrfGNxX64HEX4eYbdarpWHJQxGXZ60A/2ldj9Tb/QKUs31q9Z8T
	jyI0LGKvpVJMwPuX/wb+YgT1tP/Y2l2W28qXYgJAE+mKUqdrZ8X//Di+Ba9ybNH3ZWmTUuj4RfkJU
	o9j3f0zA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xwY-000000014yv-1Vu3;
	Tue, 24 Mar 2026 09:20:59 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4xwU-000000014ya-3iE7
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 09:20:56 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id ACDB644264;
	Tue, 24 Mar 2026 09:20:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0545AC2BC9E;
	Tue, 24 Mar 2026 09:20:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774344053;
	bh=w5xTSyD9au6QJlfLkBDAjSdfDSrRJuHsjffbvMb4zBU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Gu61lEDKm40+ng6AZkyQBKS7A9c0sXDbweFMh5nr6rZvZKFGJ21wuj2BXaPEtBGU/
	 Jyy7GgOl0QkcpPbczyutOluHQhpxFu5Kdt9J0Z1irM6QKTE6bBVuphxT7OSK8F57ey
	 jdlJb0V7WgCorzL4CmcwKQv55yn9aREJmxaQKF/Re2KgywZWOGNA7cqWDLB/KGCPo8
	 IYC1bc0Q0zycrBiZhthQiH8QJdieLraP2U3IFr1KNB1iWh1nDauJ6hr8lZrqkS1AM+
	 ti/55+iKO8FmQ8VIpqfSw6hrxqTYYzPEMsWiVnQ1VZny5ktdKJzSF9InmfOWyfDa4w
	 RJaa8rGQE2j3A==
Date: Tue, 24 Mar 2026 10:20:51 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: nick.hawkins@hpe.com
Cc: Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jean-Marie Verdun <verdun@hpe.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 3/3] arm64: dts: hpe: Add HPE GSC SoC and DL340 Gen12
 board DTS
Message-ID: <20260324-valiant-copperhead-of-psychology-fe202e@quoll>
References: <20260323194223.683487-1-nick.hawkins@hpe.com>
 <20260323194223.683487-4-nick.hawkins@hpe.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260323194223.683487-4-nick.hawkins@hpe.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260324_022054_987106_59D2183D 
X-CRM114-Status: GOOD (  19.07  )
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

On Mon, Mar 23, 2026 at 02:42:23PM -0500, nick.hawkins@hpe.com wrote:
> From: Nick Hawkins <nick.hawkins@hpe.com>
> 
> Add SoC-level DTSI for the HPE GSC ARM64 BMC SoC, covering the CPU
> cluster, GIC v3 interrupt controller, ARM64 generic timer, and console
> UART.
> 
> Add the board-level DTS for the HPE DL340 Gen12, which includes
> gsc.dtsi and adds memory and chosen nodes.
> 
> Signed-off-by: Nick Hawkins <nick.hawkins@hpe.com>
> ---
>  arch/arm64/boot/dts/hpe/Makefile           |   2 +
>  arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts |  18 ++++
>  arch/arm64/boot/dts/hpe/gsc.dtsi           | 106 +++++++++++++++++++++
>  3 files changed, 126 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/hpe/Makefile
>  create mode 100644 arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
>  create mode 100644 arch/arm64/boot/dts/hpe/gsc.dtsi
> 
> diff --git a/arch/arm64/boot/dts/hpe/Makefile b/arch/arm64/boot/dts/hpe/Makefile
> new file mode 100644
> index 000000000000..804f7c54e9b6
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/Makefile
> @@ -0,0 +1,2 @@
> +# SPDX-License-Identifier: GPL-2.0-only
> +dtb-$(CONFIG_ARCH_HPE_GSC) += gsc-dl340gen12.dtb
> diff --git a/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
> new file mode 100644
> index 000000000000..42cfeac99029
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/gsc-dl340gen12.dts
> @@ -0,0 +1,18 @@
> +// SPDX-License-Identifier: GPL-2.0-only
> +/dts-v1/;
> +
> +#include "gsc.dtsi"
> +
> +/ {
> +	compatible = "hpe,gsc-dl340gen12", "hpe,gsc";
> +	model = "HPE ProLiant DL340 Gen12";
> +
> +	chosen {
> +		stdout-path = &uartc;
> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x00000000 0x40000000>;
> +	};
> +};
> diff --git a/arch/arm64/boot/dts/hpe/gsc.dtsi b/arch/arm64/boot/dts/hpe/gsc.dtsi
> new file mode 100644
> index 000000000000..3433c4a18512
> --- /dev/null
> +++ b/arch/arm64/boot/dts/hpe/gsc.dtsi
> @@ -0,0 +1,106 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Device Tree file for HPE GSC
> + */
> +
> +#include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +/ {
> +	#address-cells = <1>;
> +	#size-cells = <1>;
> +
> +	cpus {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		cpu@0 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <0>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0xa0008048>;
> +		};
> +
> +		cpu@1 {
> +			device_type = "cpu";
> +			compatible = "arm,cortex-a53";
> +			reg = <1>;
> +			enable-method = "spin-table";
> +			cpu-release-addr = <0 0xa0008048>;
> +		};
> +	};
> +
> +	clocks {

Drop node

> +		osc: osc {

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

> +			compatible = "fixed-clock";
> +			#clock-cells = <0>;
> +			clock-output-names = "osc";
> +			clock-frequency = <33333333>;
> +		};
> +	};
> +
> +	timer {

Any particular reason not to follow DTS coding style for ordering nodes?

> +		compatible = "arm,armv8-timer";
> +		interrupts = <GIC_PPI 13 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 14 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 11 IRQ_TYPE_LEVEL_LOW>,
> +			     <GIC_PPI 10 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-parent = <&gic>;
> +	};
> +
> +	ahb: ahb@80000000 {

Convention is rather soc@

> +		compatible = "simple-bus";
> +		#address-cells = <1>;
> +		#size-cells = <1>;
> +		reg = <0x80000000 0x80000000>;
> +		ranges;
> +
> +		gic: gic@ce000000 {
> +			compatible = "arm,gic-v3";
> +			#interrupt-cells = <3>;
> +			#address-cells = <0>;
> +			interrupt-controller;
> +			redistributor-stride = <0x0 0x20000>;
> +			#redistributor-regions = <1>;
> +			reg = <0xce000000 0x10000>,
> +			      <0xce060000 0x40000>,
> +			      <0xce200000 0x40000>;

Same question - any reason to deviate from DTS coding style?

> +		};
> +
> +		uartc: serial@c00000f0 {
> +			compatible = "ns16550a";
> +			reg = <0xc00000f0 0x8>;
> +			interrupts = <0 19 4>;

Use proper defines.

Best regards,
Krzysztof


