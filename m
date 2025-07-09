Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D1B91C83F03
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  9 Jul 2025 10:51:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TX8rwhd/eQpiL20q7sD2aBsil/azxD7yn3HxJP0nvPY=; b=Z0x6AZiOOPF5+CxsqchpCm1+1l
	pOQ/+bnplpo7oT9Kmxkl2chtDXPjXWayy6uh+Tk8g73ViwN2LFVSonRShMK2YVliJoTALrHXAYty/
	3Y7p+f/BB3lmf3Z/j4eA4fVdcEjhO98x55hwqbNA+UIvGzkpb7BbzXaNGCgf18le7h3VgQOqFNtg+
	lj7385vzW/8dXam3Po3A0WAjD/cu0EbPMEeX1S65dEYluq+FbyQDyY0ykJ0/94jLFZv4Vup2T8EjZ
	56nmDXN5UDxcdRHOYmDQqyipXoKnjPw6yByAHiQVzSA0ZJsy8EspH5ypfKZ9TUD9Hp+Srms3k0Qo2
	jJ4nGUBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZSP1-00000008NYg-2vlh;
	Wed, 09 Jul 2025 10:51:51 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZQQc-000000080mL-09Gc
	for linux-arm-kernel@lists.infradead.org;
	Wed, 09 Jul 2025 08:45:22 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 6673F6144A;
	Wed,  9 Jul 2025 08:45:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 45F47C4CEEF;
	Wed,  9 Jul 2025 08:45:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752050718;
	bh=/iZqQHcDXyZQ9cwtIYRpNd8Z1fTX2ngQbJlE+f0g2zQ=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=jspYD02obGxQ2tUFOxZlC6vJlTefCqrLp2n2f5K96myvjFXRbYh9H9CSnzCut6jbD
	 KsZurATCD7D0U2G+/uZwUtY2GW2vc7RO/5Tg49gcKCskvXO1yxCioBLOmh/DZmACY4
	 NKMlsBWNt1z6HjnqlsoQanCGvbP6h7542HBD8ocyI1uECEZJE+VRENE9jXaT4bjPIV
	 s2lNVcOY2vWlIkmJkZ5S38O2K7ufQD33tpRglqhPm7lu6JUUfC6qVPsa7i2d2vIinU
	 LRQmKmjAiYmMKQot7XNqwsw5GiGtBYw/aouw/AbKcodJ9QRXlMwIE7kBvOo/vUvu6g
	 tkvLIYWTHbSRQ==
Message-ID: <b42ae6bf-8505-4f39-a53a-3866d4f10fe6@kernel.org>
Date: Wed, 9 Jul 2025 10:45:13 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v1 3/3] arm64: dts: ti: Add support for Variscite
 VAR-SOM-AM62P Symphony Board
To: Stefano Radaelli <stefano.radaelli21@gmail.com>,
 devicetree@vger.kernel.org, linux-kernel@vger.kernel.org
Cc: Nishanth Menon <nm@ti.com>, Vignesh Raghavendra <vigneshr@ti.com>,
 Tero Kristo <kristo@kernel.org>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
References: <20250708184841.72933-1-stefano.radaelli21@gmail.com>
 <20250708184841.72933-4-stefano.radaelli21@gmail.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 a/A=
In-Reply-To: <20250708184841.72933-4-stefano.radaelli21@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 08/07/2025 20:48, Stefano Radaelli wrote:
> Add device tree support for the Variscite Symphony carrier board with
> the VAR-SOM-AM62P system on module.
> 
> The Symphony board includes
> - uSD Card support
> - USB ports and OTG
> - Additional Gigabit Ethernet interface
> - Uart interfaces
> - OV5640 Camera support
> - GPIO Expander
> - CAN, I2C and general purpose interfaces
> 
> Link: https://www.variscite.it/product/single-board-computers/symphony-board/
> 
> Signed-off-by: Stefano Radaelli <stefano.radaelli21@gmail.com>
> ---
>  .../dts/ti/k3-am62p5-var-som-symphony.dts     | 545 ++++++++++++++++++
>  1 file changed, 545 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
> 
> diff --git a/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
> new file mode 100644
> index 000000000000..ec6bdd28d57f
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-am62p5-var-som-symphony.dts
> @@ -0,0 +1,545 @@
> +// SPDX-License-Identifier: GPL-2.0
> +/*
> + * Variscite Symphony carrier board for VAR-SOM-AM62P
> + *
> + * Copyright (C) 2021-2022 Texas Instruments Incorporated - https://www.ti.com/
> + * Copyright (C) 2025 Variscite Ltd. - https://www.variscite.com/
> + *
> + */
> +
> +/dts-v1/;
> +
> +#include "k3-am62p5-var-som.dtsi"
> +
> +/ {
> +	model = "Variscite VAR-SOM-AM62P on Symphony-Board";

Missing compatible.

> +
> +	aliases {
> +		ethernet0 = &cpsw_port1;
> +		ethernet1 = &cpsw_port2;
> +		mmc0 = &sdhci0;
> +		mmc1 = &sdhci1;
> +		mmc2 = &sdhci2;
> +		serial0 = &main_uart0;
> +		serial2 = &main_uart2;
> +		serial5 = &main_uart5;
> +		serial6 = &main_uart6;
> +		spi5 = &main_spi2;
> +		usb0 = &usb0;
> +		usb1 = &usb1;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +		bootargs = "console=ttyS0,115200n8 earlycon=ns16550a,mmio32,0x02800000";

Drop bootargs. It duplicates stdout-path and introduces debugging
earlycon. Mainline usage should not be debugging one.

> +	};
> +
> +	clk_ov5640_fixed: clock {

Please use name for all fixed clocks which matches current format
recommendation: 'clock-<freq>' (see also the pattern in the binding for
any other options).

https://git.kernel.org/pub/scm/linux/kernel/git/torvalds/linux.git/tree/Documentation/devicetree/bindings/clock/fixed-clock.yaml?h=v6.11-rc1

> +		#clock-cells = <0>;
> +		compatible = "fixed-clock";
> +		clock-frequency = <24000000>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		status = "okay";

Why? Drop.

> +		back {

Never checked/tested. I finish my review here. You have same issues,
like this and earlier one, in other places as well.

Best regards,
Krzysztof

