Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 20F8BC54F5C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:42:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=E4DLZ84B2BESiFuGefIEusgQoPfjZ0wtckI0bRmiws0=; b=vJuHglPa35SbRvMDjUWeB6Qs+E
	a/RjopyuWRxWjBxZnDRYbqiCAlYdS0p4q+ghI3ObeGqbp5QO6l4VQoqn+DeZ9/S6PNQPNqo0TlDUw
	KNMCmRp8raHjgoKez08PctO7V93Eo5XjGBnFDzBqpeLm40nZX1AWvPYhADUmxZVG6yISy6EXJlJD2
	C1HvbW3rGBK0HdWY9H7gVLTG9OsuESLCxXlVPTlxnUsMdWgamAjfyjyiriSKqfZKz4bz3nlvcWPXv
	eqV1mkIc7QH1CALyEj/gz7Z+fvXtPb1GW/4H6Vz9xmww1x8S4UyHgwuEGODeBHRWBpnPB1pt7qU/D
	T3NniFCQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozrQ-00000007GSP-2zNr;
	Wed, 29 Jul 2026 08:41:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozrO-00000007GRh-3E4u;
	Wed, 29 Jul 2026 08:41:54 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id EF29060A99;
	Wed, 29 Jul 2026 08:41:53 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A93CA1F000E9;
	Wed, 29 Jul 2026 08:41:52 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785314513;
	bh=E4DLZ84B2BESiFuGefIEusgQoPfjZ0wtckI0bRmiws0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=VU67Yz/VZt1jw8NK3WzilBxruMtwBV+ANQo/GxzLo2HOaDn+r0IVMDUAjYe8mXl0p
	 QwaIFZSViM+cHwEDsUnKVg5QQehbmTqDtT/Jj/8/ndncGJz5bF2zRadomOk9Y5+b/k
	 XiUEPdsmZSYexcbSnRika7PT96iR5zxUqX+4HOkZIw6hxgBYUs8y5XCI61QNTknGpV
	 WrsCHbhzZ3gneMNQS/KR2xyM3vq07CnD59XYQoNvw2F7tsYx4c6ZfOorDxsrOi6ER8
	 1t+Mn6RV4T3BEz9PqhsNBnzuiOv7IfTOBtwyaZo8C1QKj0axOVcXn+851b1yxd/I4+
	 fZWLxQbonzzrg==
Date: Wed, 29 Jul 2026 10:41:49 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Alberto Robazza <robazza.alberto@proton.me>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	neil.armstrong@linaro.org, khilman@baylibre.com, jbrunet@baylibre.com, 
	martin.blumenstingl@googlemail.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, 
	Alberto Robazza <robazzalberto@gmail.com>
Subject: Re: [PATCH v3 3/3] arm64: dts: amlogic: add support for Orbbec Zora
 P1
Message-ID: <20260729-kind-funny-boar-d06d29@quoll>
References: <20260728151636.236393-1-robazzalberto@gmail.com>
 <20260728151636.236393-4-robazzalberto@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260728151636.236393-4-robazzalberto@gmail.com>
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

On Tue, Jul 28, 2026 at 05:16:36PM +0200, Alberto Robazza wrote:
> The Orbbec Zora P1 is an A311D (Meson G12B) board with 2/4 GiB DDR4,
> an Ampak AP6256 combo module (Broadcom BCM43456 Wi-Fi over SDIO and
> BCM4345C5 Bluetooth over UART_A).
> 
> According to the original Linux dts, the board is a modded version
> of the ODROID-N2, with Amlogic A311D instead of the original S922X
> and WiFi and Bluetooth support.
> So the device tree builds on meson-g12b-a311d.dtsi and
> meson-g12b-odroid-n2.dtsi (using same vddcpu values of N2+),
> extended with the board-specific GPIO wiring for the AP6256 handling,
> and some modifications for the led, GPIO_ACTIVE_LOW instead of
> GPIO_ACTIVE_HIGH and different label (it is a green led, not blue as
> in the Odroid N2).
> Add the new DTB to the Makefile.
> 
> Signed-off-by: Alberto Robazza <robazzalberto@gmail.com>
> ---
>  arch/arm64/boot/dts/amlogic/Makefile          |   1 +
>  .../boot/dts/amlogic/meson-g12b-zora-p1.dts   | 105 ++++++++++++++++++
>  2 files changed, 106 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> 
> diff --git a/arch/arm64/boot/dts/amlogic/Makefile b/arch/arm64/boot/dts/amlogic/Makefile
> index 57bc440fa..83fb38b94 100644
> --- a/arch/arm64/boot/dts/amlogic/Makefile
> +++ b/arch/arm64/boot/dts/amlogic/Makefile
> @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_MESON) += meson-g12b-radxa-zero2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-bananapi-m2s.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-s922x-khadas-vim3.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-g12b-ugoos-am6.dtb
> +dtb-$(CONFIG_ARCH_MESON) += meson-g12b-zora-p1.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-kii-pro.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nanopi-k2.dtb
>  dtb-$(CONFIG_ARCH_MESON) += meson-gxbb-nexbox-a95x.dtb
> diff --git a/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> new file mode 100644
> index 000000000..d003582fd
> --- /dev/null
> +++ b/arch/arm64/boot/dts/amlogic/meson-g12b-zora-p1.dts
> @@ -0,0 +1,105 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2026 Alberto Robazza <robazza.alberto@proton.me>
> + */
> +
> +/dts-v1/;
> +
> +#include "meson-g12b-a311d.dtsi"
> +#include "meson-g12b-odroid-n2.dtsi"
> +#include <dt-bindings/leds/common.h>
> +
> +/ {
> +	compatible = "orbbec,zora-p1", "amlogic,a311d", "amlogic,g12b";
> +	model = "Orbbec Zora P1";
> +
> +	leds {
> +		/* Status led on Zora is actually green, same pin as N2, but reversed polarity */
> +		led-blue {
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_GREEN>;
> +			gpios = <&gpio_ao GPIOAO_11 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	sdio_pwrseq: sdio-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&gpio GPIOX_16 GPIO_ACTIVE_LOW>;
> +		clocks = <&wifi32k>;
> +		clock-names = "ext_clock";
> +	};
> +
> +	wifi32k: wifi32k {

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).
https://web.git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml

Or any other reasonable name based on generic prefix. wifi32k is for
sure nothing related to clock...


> +		compatible = "pwm-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <32768>;
> +		pwms = <&pwm_ef 0 30518 0>;
> +	};
> +
> +	sound {
> +		model = "ZORA-P1";
> +	};
> +};

Best regards,
Krzysztof


