Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5B232C021A0
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 13 Feb 2025 09:14:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=+LYqNM2YOh2CSpdKJZvKirP8vsqwkLkZDm/ACiFkCP0=; b=GJamELdoihrE8CieTiMH1/wpGQ
	bfkrTJvEzaVVQWstyN4WNvXxacueHhctqaRtT4EXomX/8BBCi2uMZNCO+pPFhLf8O92oOWrxvlbxw
	HQQ8gFfdthtCq9DXgbCqBX6nSt2Rk+tVP9MPOCJAkAcDRlZjST19aFVUYksGZMyQoLXYLx7M408oL
	lrcnwCTcZHftpeVyahbiyumcpKWJTxiYUgPzsV8xSFDmn+53XIJST03Mo/poJHWWcB9NOxYitoctx
	0eyRjS0opHTaYKcz3mVL0GFXZxnipwjeLMpOcb3ebbzfnEjiaS7M2BIZsdkPZRoAEm9KI+Hl4/S/H
	h0PrYOew==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tiVIP-0000000APPX-1ev0;
	Thu, 13 Feb 2025 09:14:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tiV8P-0000000ANMX-2D6t
	for linux-arm-kernel@lists.infradead.org;
	Thu, 13 Feb 2025 09:03:50 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 7F6885C0F75;
	Thu, 13 Feb 2025 09:03:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B6B1FC4CED1;
	Thu, 13 Feb 2025 09:03:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1739437428;
	bh=IEPqyHTmr/nEf5lzsdVqV6RZ6BK9t/GQNcR6dYu4yrc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ByHxqda+ehRnaFPRonkLDaCEP+8wA8PDPmvtoI2kdc+H7EAdvKyssJPdy+PmxOtos
	 xMsV+8ETqyHhHrYjpmNITbkVUfC6AwL0KbP2G9cw5GWfdSdHi1FbFRaLo5N+g3x2ar
	 WdsnpPfFtOl0q39m8O7+n56EpxRkckOhoKdBmbejCXUXDdaXkqPOhARMok7i5NZofa
	 kGheN/6yX7f4NqMYQUVPf3MYCjl9wJAgIV1+KP8cvvM3ug96f3M4UXsxL6ddGJvZy7
	 X2vqqOP/9tD69TKAIGsXR9DNCjUC2t5KpbyTNlE2289kmf2j5V9l4L0FAZ61tYVYHA
	 Ri9dCCdVanrPA==
Date: Thu, 13 Feb 2025 10:03:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Amelie Delaunay <amelie.delaunay@foss.st.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	Catalin Marinas <catalin.marinas@arm.com>, Will Deacon <will@kernel.org>, 
	Richard Cochran <richardcochran@gmail.com>, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, netdev@vger.kernel.org
Subject: Re: [PATCH 06/10] arm64: dts: st: add stm32mp235f-dk board support
Message-ID: <20250213-truthful-accurate-gaur-bd118f@krzk-bin>
References: <20250210-b4-stm32mp2_new_dts-v1-0-e8ef1e666c5e@foss.st.com>
 <20250210-b4-stm32mp2_new_dts-v1-6-e8ef1e666c5e@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-b4-stm32mp2_new_dts-v1-6-e8ef1e666c5e@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250213_010349_652526_98BA1C1D 
X-CRM114-Status: GOOD (  15.89  )
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

On Mon, Feb 10, 2025 at 04:21:00PM +0100, Amelie Delaunay wrote:
> Add STM32MP235F Discovery Kit board support. It embeds a STM32MP235FAK
> SoC, with 4GB of LPDDR4, 2*USB typeA, 1*USB3 typeC, 1*ETH, wifi/BT
> combo, DSI HDMI, LVDS connector ...
> 
> Signed-off-by: Amelie Delaunay <amelie.delaunay@foss.st.com>
> ---
>  arch/arm64/boot/dts/st/Makefile           |   1 +
>  arch/arm64/boot/dts/st/stm32mp235f-dk.dts | 115 ++++++++++++++++++++++++++++++
>  2 files changed, 116 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/st/Makefile b/arch/arm64/boot/dts/st/Makefile
> index 0cc12f2b1dfeea6510793ea26f599f767df77749..06364152206997863d0991c25589de73c63494fb 100644
> --- a/arch/arm64/boot/dts/st/Makefile
> +++ b/arch/arm64/boot/dts/st/Makefile
> @@ -1,4 +1,5 @@
>  # SPDX-License-Identifier: GPL-2.0-only
>  dtb-$(CONFIG_ARCH_STM32) += \
> +	stm32mp235f-dk.dtb \
>  	stm32mp257f-dk.dtb \
>  	stm32mp257f-ev1.dtb
> diff --git a/arch/arm64/boot/dts/st/stm32mp235f-dk.dts b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..08e330d310749506c5b0e7a1fb2f80dfa134400a
> --- /dev/null
> +++ b/arch/arm64/boot/dts/st/stm32mp235f-dk.dts
> @@ -0,0 +1,115 @@
> +// SPDX-License-Identifier: (GPL-2.0-only OR BSD-3-Clause)
> +/*
> + * Copyright (C) STMicroelectronics 2025 - All Rights Reserved
> + * Author: Amelie Delaunay <amelie.delaunay@foss.st.com> for STMicroelectronics.
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "stm32mp235.dtsi"
> +#include "stm32mp23xf.dtsi"
> +#include "stm32mp25-pinctrl.dtsi"
> +#include "stm32mp25xxak-pinctrl.dtsi"
> +
> +/ {
> +	model = "STMicroelectronics STM32MP235F-DK Discovery Board";
> +	compatible = "st,stm32mp235f-dk", "st,stm32mp235";
> +
> +	aliases {
> +		serial0 = &usart2;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-user-1 {
> +			label = "User-1";
> +			linux,code = <BTN_1>;
> +			gpios = <&gpioc 5 GPIO_ACTIVE_HIGH>;
> +			status = "okay";

Where is it disabled?

> +		};
> +
> +		button-user-2 {
> +			label = "User-2";
> +			linux,code = <BTN_2>;
> +			gpios = <&gpioc 11 GPIO_ACTIVE_HIGH>;
> +			status = "okay";

Same question

> +		};
> +	};

Best regards,
Krzysztof


