Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB919C44514
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jul 2026 09:14:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=hdEdwOk9Yi6Snu3myq/DFMCAWJnPUUX85o2H98P1x9Q=; b=FL020THZ9K0Srq2u0e8gLm4qZr
	ySXHZWvhMMZgZrXxuK/L+eK97C94ePjDFtFstOo4HIpZ9OIObrDF1sgM4Z0x9Go4mzocxLZneFNKB
	kotg5fSsqG4JikyQ4eX8NgJdhKlMf0RSApfNpPuiHm9OLeEdC9hUcCCJfiEox+Yx7KnsTRyqTRZtd
	rZddprhVQD3QI/bbwDo2ZGqNcd9ED74gzaa6Sq0DR0qQbqWuNdbEWY1A1o92PnoTpxJpe7BnNcch5
	l6o/3X4wySJyUMSMMPmOFS34On8lm9JxVucGSmlM8gLoLwB1aRcK5+Q1lgCtQ2jjMapf2CRfKDKbI
	6GVMINnQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkedv-00000001nh2-1cnK;
	Fri, 17 Jul 2026 09:14:03 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wkedt-00000001ngc-3wqI;
	Fri, 17 Jul 2026 09:14:01 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id AEEB8403D3;
	Fri, 17 Jul 2026 09:14:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 67AA01F000E9;
	Fri, 17 Jul 2026 09:14:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1784279641;
	bh=hdEdwOk9Yi6Snu3myq/DFMCAWJnPUUX85o2H98P1x9Q=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=M8d0K+41rR4c7K+sMXbp/wtNyXxoel/OeMKi3n7FSO0g5t/RPAB6B3wc/GhtlKZdg
	 bbULax718vZJ/jOH4jp5e8jhHW1ZGQB7+XJB6anuVB9tWPYtCHzFGWVY8jQiXAn16u
	 48SGhLGaA5aVJpbew1r9kPR1FEopmWOKHcE0wBfVhyLnUhaSzdOUE1jPsUSeWT9oT3
	 5efFsLC+6616LV5ivDnraCQI+9hxyRGUFy5hJRcM0K6Tg0Nbm4BWy+d0ZN4VH2Ell6
	 c026376Q/pv5QolAD8BlrvQAiIiVHV6PN/1EOaW4vlurHfNiduMyK0NepH8CIj2ydY
	 dm54SL5F/XTgw==
Date: Fri, 17 Jul 2026 11:13:57 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Hrushiraj Gandhi <hrushirajg23@gmail.com>
Cc: Heiko Stuebner <heiko@sntech.de>, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Vicharak Vaaman board
Message-ID: <20260717-robust-nondescript-husky-ed6c5f@quoll>
References: <20260716092859.512306-1-hrushirajg23@gmail.com>
 <20260716092859.512306-3-hrushirajg23@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260716092859.512306-3-hrushirajg23@gmail.com>
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

On Thu, Jul 16, 2026 at 02:58:59PM +0530, Hrushiraj Gandhi wrote:
> Add initial devicetree support for the Vicharak Vaaman, an RK3399-based
> single-board computer.
> 
> Supported peripherals:
> - RK808 PMIC with core/logic/IO regulators
> - SYR827/SYR828 (vdd_cpu_b/vdd_gpu) CPU-big and GPU regulators
> - Mali GPU
> - Gigabit Ethernet (RGMII, via &gmac)
> - eMMC (HS400, enhanced strobe)
> - microSD card slot
> - SARADC and TSADC
> - PWM-based vdd_log regulator
> - UART2 serial console
> 
> Tested by booting to a userspace shell over the serial console and
> verifying eMMC and microSD storage, and Ethernet link-up.
> 
> Signed-off-by: Hrushiraj Gandhi <hrushirajg23@gmail.com>
> ---
>  arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>  .../dts/rockchip/rk3399-vicharak-vaaman.dts   | 438 ++++++++++++++++++
>  2 files changed, 439 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 761d82b4f4f2..e1b974502915 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -90,6 +90,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-rockpro64-screen.dtbo
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-sapphire-excavator.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-vicharak-vaaman.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
> new file mode 100644
> index 000000000000..6060365bf731
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3399-vicharak-vaaman.dts
> @@ -0,0 +1,438 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Vicharak Computers Pvt Ltd
> + */
> +
> +/dts-v1/;
> +#include "rk3399.dtsi"
> +
> +/ {
> +	model = "Vicharak Vaaman";
> +	compatible = "vicharak,vaaman", "rockchip,rk3399";
> +
> +	aliases {
> +		ethernet0 = &gmac;
> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial2:1500000n8";
> +	};
> +
> +	clkin_gmac: external-gmac-clock {
> +		compatible = "fixed-clock";
> +		clock-frequency = <125000000>;
> +		clock-output-names = "clkin_gmac";
> +		#clock-cells = <0>;
> +	};
> +
> +	vcc12v_dcin: vcc12v-dcin-regulator {

foo-regulator yes?

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc12v_dcin";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};

This regulator is completely unused (other non-controllable do not
matter).

> +
> +	vcc3v3_lan: regulator-vcc3v3-lan {

so why here regulator-foo? Decide.

Please use name for all fixed regulators which matches current format
recommendation: 'regulator-[0-9]v[0-9]'
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/regulator/fixed-regulator.yaml


Best regards,
Krzysztof


