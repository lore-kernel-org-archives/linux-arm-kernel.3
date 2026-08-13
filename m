Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6D9C4C5CFEB
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Aug 2026 08:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=o/6dxYzI0TD3UNzRgwz4x8rsUTTcR9wFV/sueb04ia0=; b=XJlN5PvuEbx4WSwwuJvjdMDLkD
	PC8fMyDhiKJerXbX1Si7CHNCVMnb5AirokVzeRoRd4nsg1GWkWgS7e9WvdRmkJU9ZWSF2NPDQ0K2r
	Rbc1fLMCNTT4TRwWWpzo5z967J/NWX/IFdkt1DouiuFkFv6j7VyD6XWhydBhw+fhqCEeqnMTVszOt
	eGD/JTBg+loBj1KIUNKn7HOOtruPtYoUadis/huSGTHi2hZyUVCl3kIdMU/tZCtFhXAG2cqCYQbC3
	eQN+CARYjj08Ttx1a6a6amy7gUwuSfZ858Tu6xM/nkkYQKmEW+g4hmzoFv6SI3yeF1783aWJs+BmN
	AgvH35vA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQha-000000007PM-10KN;
	Thu, 13 Aug 2026 08:22:14 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wuQhZ-000000007Os-0TUp
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Aug 2026 08:22:13 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 7C8D043719;
	Thu, 13 Aug 2026 08:22:12 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A921F000E9;
	Thu, 13 Aug 2026 08:22:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786609332;
	bh=o/6dxYzI0TD3UNzRgwz4x8rsUTTcR9wFV/sueb04ia0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=bfpnA+O1GmEyuQ0io8f+ZJOvIyFdpJvQUQX7u4jPrn1GRWdOvoh4PZQwoJW/27YsP
	 XX2T/B9QAtKw6jepWyiKK7IM86KtVda6YUguVLQ1Xz1mqXAoZwhqMBeyAOF7ugQ8VO
	 jVRtxAlbreCjU7dYHfOPpcEQ6GiV1pA3K/SvnGCBLWQHr9lasrSgzu6z+w7zyse7HK
	 stmaDVZA4ex7qOIH/TsreFPyXvPIuyZHJyDlSbVEw1T+/B8kKwYgYOiymEcarBR9gP
	 mxzIRPLFHehhblc+87K2w4XllSt7mZB8IaRAPDCO6XgQXtLmZL+jJ3f6jBkbHd4/Vo
	 l1hnDGZf8KRRQ==
Date: Thu, 13 Aug 2026 10:22:04 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mehmet Fide <mehmet.fide@gmail.com>
Cc: Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Stefan Agner <stefan@agner.ch>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Francesco Dolcini <francesco@dolcini.it>, 
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2 4/4] ARM: dts: vf: add Iris carrier board support for
 Colibri VF50 and VF61
Message-ID: <20260813-comical-elastic-beluga-abcb1d@quoll>
References: <20260810140053.2793495-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-1-mehmet.fide@gmail.com>
 <20260810142047.2811230-5-mehmet.fide@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260810142047.2811230-5-mehmet.fide@gmail.com>
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

On Mon, Aug 10, 2026 at 04:20:47PM +0200, Mehmet Fide wrote:
> diff --git a/arch/arm/boot/dts/nxp/vf/Makefile b/arch/arm/boot/dts/nxp/vf/Makefile
> index 0a4a7f9..47be8bc 100644
> --- a/arch/arm/boot/dts/nxp/vf/Makefile
> +++ b/arch/arm/boot/dts/nxp/vf/Makefile
> @@ -1,8 +1,10 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_SOC_VF610) += \
>  	vf500-colibri-eval-v3.dtb \
> +	vf500-colibri-iris.dtb \
>  	vf610-bk4.dtb \
>  	vf610-colibri-eval-v3.dtb \
> +	vf610-colibri-iris.dtb \
>  	vf610m4-colibri.dtb \
>  	vf610-cosmic.dtb \
>  	vf610m4-cosmic.dtb \
> diff --git a/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
> new file mode 100644
> index 0000000..d0fa107
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/vf/vf-colibri-iris.dtsi
> @@ -0,0 +1,125 @@
> +// SPDX-License-Identifier: GPL-2.0-or-later OR MIT

Odd license ("or later"), but I guess this is a derived work of existing
code.

> +/*
> + * Copyright 2026 Mehmet Fide
> + *
> + * Toradex Iris carrier board V1.1, common part for Colibri VF50 and VF61.
> + *
> + * The Colibri modules are pin compatible, so the carrier signals sit on the
> + * same SODIMM pins as they do for the i.MX modules, whose Iris device trees
> + * are already upstream. The two SODIMM pins below are taken from the Colibri
> + * VFxx datasheet (102 -> PTA12 -> PORT0[5], 104 -> PTD28 -> PORT2[2]).
> + *
> + * An Iris V2.0 carries the same signals on the same pins, so everything here
> + * works on it as well. What it adds is a regulator on SODIMM 100 that can cut
> + * power to the uSD slot, which this file does not describe.
> + */
> +
> +/ {
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	reg_5v0: regulator-5v0 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "5V";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};

This regulator is not really used. Drop, because there is no need to
represent chain of uncontrollable regulators whose purpose is only input
to other regulator.

> +
> +	reg_usbh_vbus: regulator-usbh-vbus {
> +		compatible = "regulator-fixed";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_usbh1_reg>;
> +		regulator-name = "VCC_USB[1-4]";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		gpio = <&gpio2 19 GPIO_ACTIVE_LOW>;	/* SODIMM 129, USBH_PEN */
> +		vin-supply = <&reg_5v0>;
> +	};
> +};

Best regards,
Krzysztof


