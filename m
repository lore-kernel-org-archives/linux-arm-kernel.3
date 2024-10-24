Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 89353CFA457
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 24 Oct 2024 10:19:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dA2WfLmhQLiqoDQoC2DJMoy1FastSCswdFy5YTo8qZQ=; b=YYvtqw2MxLwVig3Dhg6H5GoDzD
	uHdByLkt4c+s5JghXY4ofUnfvohbQFwdYzGP3oh888o7xlxA62GztVP74oiPSyj1k1ajwo1onc8yD
	OGd93MCmTO5sibFMduVY4sedAsU7oq1x3JIEcQXgPV1FbQQOjSzrk9h/LWcI4TdYiBq8JvXyg58Ns
	gDpQ7IzXFJvy+2e7q3C+HFCVmI4vfsapq72nkCJrozQCJLHelkmE4dksEXS1XLDOrY10MD+nNS/c0
	duEnUxB5KhJ0Fo3SxDMbpQkPCfOO9G8/mjaoXjj5aK/pdqeVe5d/S2TwjL7lNfFHsxLmVJaAuCK1m
	0rkgQXDw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t3uvv-000000002Ub-1f4R;
	Thu, 24 Oct 2024 10:19:11 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t3usL-000000001oo-3UEi
	for linux-arm-kernel@lists.infradead.org;
	Thu, 24 Oct 2024 10:15:31 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id EB296A452BE;
	Thu, 24 Oct 2024 10:15:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id BBDBBC4CEC7;
	Thu, 24 Oct 2024 10:15:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1729764927;
	bh=pM1PKZp1R+TXlQ8+p/PynYznWUaRhv+bSuOtAgtk/VY=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Chvd5AzujH23BqSpFBvAXQ86/I+tuZKyoPw+paf+IR/Pa5xpWtcej2n9DV6/FB24L
	 tmYXsmV1UKPqeZX94yiR6xazvIwJXpTf1VpPQUubsfoQJwQMbZqClDBjjFj/iXRIFv
	 h34dO1TVF60x/IC+LJOBWn3Xbofk2BJSHInO58TARYCwQu/EZYhhJf57wDJo+spZ8s
	 /Tl5/zMzPmm/GFLGf40XuP2QXvC0kIQ2BjH/OOP84xTlDPYGC+hmzVsXhUS2fl5hBC
	 vTlL3o7swFQenAqQgNR9OFPDBIRkNCyYpa9hCG6K+09+5eOg8fPKgkwIbIJrlzRNb6
	 JPQfjFZwaW6YA==
Message-ID: <94757582-92db-4b5a-86e0-75d5f74c52e6@kernel.org>
Date: Thu, 24 Oct 2024 12:15:19 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/12] arm64: dts: exynos: Add Exynos9810 SoC support
To: Markuss Broks <markuss.broks@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Lorenzo Pieralisi <lpieralisi@kernel.org>,
 Alim Akhtar <alim.akhtar@samsung.com>,
 Sylwester Nawrocki <s.nawrocki@samsung.com>,
 Linus Walleij <linus.walleij@linaro.org>, Tomasz Figa
 <tomasz.figa@gmail.com>, Will Deacon <will@kernel.org>,
 Mark Rutland <mark.rutland@arm.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-samsung-soc@vger.kernel.org,
 linux-gpio@vger.kernel.org, Ivaylo Ivanov <ivo.ivanov.ivanov1@gmail.com>,
 Maksym Holovach <nergzd@nergzd723.xyz>
References: <20241024-exynos9810-v1-0-ed14d0d60d08@gmail.com>
 <20241024-exynos9810-v1-11-ed14d0d60d08@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20241024-exynos9810-v1-11-ed14d0d60d08@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241024_031530_051767_66A62AD7 
X-CRM114-Status: GOOD (  18.20  )
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

On 24/10/2024 00:36, Markuss Broks wrote:
> Exynos 9810 is an ARMv8 mobile SoC found in various Samsung devices,
> such as Samsung Galaxy S9 (starlte), S9 Plus (star2lte),
> Note 9 (crownlte) and perhaps others.
> 
> Add minimal support for this SoC, including basic stuff like:
> - PSCI for bringing up secondary cores
> - ARMv8 generic timer
> - GPIO and pinctrl.
> 
> The firmware coming with the devices based on this SoC is buggy
> and doesn't configure CNTFRQ_EL0, as required by spec, so it's
> needed to hardcode the frequency in the timer node.
> 
> Co-authored-by: Maksym Holovach <nergzd@nergzd723.xyz>
> Signed-off-by: Markuss Broks <markuss.broks@gmail.com>
> ---
>  arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi | 525 +++++++++++++++++++++
>  arch/arm64/boot/dts/exynos/exynos9810.dtsi         | 256 ++++++++++
>  2 files changed, 781 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi b/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..4b2ee59dc7241b0ec31c99fd909d1c5e25aa77e0
> --- /dev/null
> +++ b/arch/arm64/boot/dts/exynos/exynos9810-pinctrl.dtsi
> @@ -0,0 +1,525 @@
> +// SPDX-License-Identifier: GPL-2.0 OR BSD-3-Clause
> +/*
> + * Samsung's Exynos 9810 SoC pin-mux and pin-config device tree source
> + *
> + * Copyright (c) 2024 Markuss Broks <markuss.broks@gmail.com>
> + * Copyright (c) 2024 Maksym Holovach <nergzd@nergzd723.xyz>
> + */
> +
> +#include "exynos-pinctrl.h"
> +
> +&pinctrl_alive {
> +	wakeup-interrupt-controller {

This is part of SoC DTSI.

> +		compatible = "samsung,exynos9810-wakeup-eint",
> +			     "samsung,exynos850-wakeup-eint",
> +			     "samsung,exynos7-wakeup-eint";
> +	};
> +
> +	etc1: etc1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa0: gpa0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 36 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 37 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 38 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 39 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 40 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 41 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 42 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 43 IRQ_TYPE_LEVEL_HIGH>;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa1: gpa1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 44 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 45 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 46 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 47 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 48 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 49 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 50 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 51 IRQ_TYPE_LEVEL_HIGH>;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa2: gpa2-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 52 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 55 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 56 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 57 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 58 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 59 IRQ_TYPE_LEVEL_HIGH>;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa3: gpa3-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		interrupt-parent = <&gic>;
> +		interrupts = <GIC_SPI 60 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 61 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 63 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 65 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 66 IRQ_TYPE_LEVEL_HIGH>,
> +			     <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpa4: gpa4-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpq0: gpq0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +};
> +
> +&pinctrl_aud {
> +	gpb0: gpb0-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb1: gpb1-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +
> +	gpb2: gpb2-gpio-bank {
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +	};
> +};
> +
> +&pinctrl_chub {
> +	interrupts = <GIC_SPI 109 IRQ_TYPE_LEVEL_HIGH>;

Please do not introduce different style than all other files.


Best regards,
Krzysztof


