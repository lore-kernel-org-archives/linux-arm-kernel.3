Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2948BEB26EA
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Feb 2026 16:54:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=OQXwaNe4psr2XNmq2suhAylWK2H2KTRKcPx7MaB8l+g=; b=0axOLBdAFkwEXUvzNBSB50G/7w
	rZEnzeyrwIxMJ2QiVguZQC50/vGJm5u9Hj3GHFz8ajRg8FftYa9qM/E09it9UM89YTLELiPcOwxwc
	yBenfAiGHk0ggT8orF7PTzdxS1Ry1nEgLr2MQoI0v4QdC66VnqnlQnGA2f7R+4sXBlbyFDgKubQr+
	I/bmZoRgiKLfr6FjKwkBoVtrnYrniRtQ3SRFiLIo2Cn4mvgwCnn1HGR6Wig5nD8nopLS/VDlkIk3Z
	zDxE6bfufxw9/D2L3KUVmsfGCSxWLOURc8MZwMYvNGJWQ4KuB9juDOiAiErG/PtGdGGXeR++CT9xn
	5K4VbARg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqzv-0000000HH17-3Mnp;
	Tue, 10 Feb 2026 16:53:59 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vpqzs-0000000HH0N-2OZz
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Feb 2026 16:53:58 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1770742434;
 bh=OQXwaNe4psr2XNmq2suhAylWK2H2KTRKcPx7MaB8l+g=;
 b=QQr2juHE2IYEiPCUbCf2imB8FGKCEnEmIBJE7a2W/SAKXqC9ulGcOafqnf+FtLAgyzVlpMq/s
 KQol6Y+yeJomAt9nK+M4B2qk0wJ39sJhcxiIub9q33l+gxE6g6wLFrFcn6m/NIqqyk/PrdzeMGB
 a1XNjvSI7gdu6riNJDcT7MssArDvtE5pYNWC8skhdSEwpZTi5dtAvliWRihdCuie4cVK4VwQHaf
 oxDABBkzZWhdVj6bOE2DkS73mJo1rrB/2/6ybn30oFSV3UOrQt6nBjc9RdcyrL5nykeKrLkaX1g
 ZOsxqEr1uTFEQ1D3RZD6fQkp2dKfsGkPuQ1WnDTRa8cw==
X-Forward-Email-ID: 698b629fe8cd0604c09e7484
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.3
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <a8c1bac7-9f67-4476-81ad-5271ff239b91@kwiboo.se>
Date: Tue, 10 Feb 2026 17:53:46 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v3 4/4] ARM: dts: rockchip: Add Onion Omega4 Evaluation
 Board
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 linux-kernel@vger.kernel.org, Fabio Estevam <festevam@nabladev.com>
References: <20260210144845.317048-1-festevam@gmail.com>
 <20260210144845.317048-4-festevam@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260210144845.317048-4-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260210_085357_028598_4ADB833D 
X-CRM114-Status: GOOD (  22.71  )
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

Hi Fabio,

On 2/10/2026 3:48 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> The Onion Omega4 Evaluation Board is based on the RV1103B SoC and has:
> 
>  - 256 MB of RAM
>  - 256 MB of SPI-NAND
>  - Ethernet
>  - USB OTG
>  - Wifi
>  - SD card
>  - Camera connector
> 
> The details can be found at:
> https://documentation.onioniot.com/omega4/getting-started/
> 
> Add the initial support for this board so that it can fully boot into
> Linux with the root file system stored in the SPI NAND.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
> Changes since v3:
> - Split it in the EVB and SoM dtsi.
> 
>  arch/arm/boot/dts/rockchip/Makefile           |  1 +
>  .../boot/dts/rockchip/rv1103b-omega4-evb.dts  | 94 +++++++++++++++++++
>  .../arm/boot/dts/rockchip/rv1103b-omega4.dtsi | 21 +++++
>  3 files changed, 116 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
> 
> diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
> index 716f5540e438..d0154fd7ff24 100644
> --- a/arch/arm/boot/dts/rockchip/Makefile
> +++ b/arch/arm/boot/dts/rockchip/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += \
> +	rv1103b-omega4-evb.dtb \
>  	rv1108-elgin-r1.dtb \
>  	rv1108-evb.dtb \
>  	rv1109-relfor-saib.dtb \
> diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
> new file mode 100644
> index 000000000000..686f2dd28eab
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4-evb.dts
> @@ -0,0 +1,94 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2025 plan44.ch/luz
> + * Copyright (c) 2025 Onion Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/leds/common.h>
> +#include "rv1103b-omega4.dtsi"
> +
> +/ {
> +	model = "Onion Omega4 Evaluation Board";
> +	compatible = "onion,rv1103b-omega4-evb", "onion,rv1103b-omega4", "rockchip,rv1103b";

nit: Is rv1103b needed in all three compatible strings? The last one is
already pointing out that this is the rv1103b soc, also the other Onion
Omega boards in-tree use onion,omega and onion,omega2+.

> +
> +	aliases {
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:115200n8";
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0	{
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&led>;
> +			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;
> +			function = LED_FUNCTION_STATUS;
> +			color = <LED_COLOR_ID_BLUE>;
> +			label = "sys";
> +			default-state = "on";
> +		};
> +	};
> +};
> +
> +&fspi0 {
> +	status = "okay";
> +
> +	spi_nand: flash@0 {
> +		compatible = "spi-nand";
> +		reg = <0>;
> +		bootph-pre-ram;
> +		bootph-some-ram;
> +		spi-max-frequency = <75000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <1>;
> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				label = "env";
> +				reg = <0x00000000 0x00040000>;
> +			};
> +
> +			partition@40000 {
> +				label = "idblock";
> +				reg = <0x00040000 0x00100000>;
> +				read-only;
> +			};
> +
> +			partition@140000 {
> +				label = "uboot";
> +				reg = <0x00140000 0x00100000>;
> +				read-only;
> +			};
> +
> +			partition@240000 {
> +				label = "boot";
> +				reg = <0x00240000 0x00800000>;
> +			};
> +
> +			partition@a40000 {
> +				label = "ubi";
> +				reg = <0x00a40000 0x0f5c0000>;
> +			};
> +		};
> +	};
> +};

The getting started guide [1] list the NAND Flash as part of SOM, should
probably be moved to som dtsi.

[1] https://documentation.onioniot.com/omega4/getting-started/

> +&pinctrl {
> +	leds {
> +		led: led {
> +			rockchip,pins = <0 RK_PA2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
> new file mode 100644
> index 000000000000..bf245b547ea2
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dtsi
> @@ -0,0 +1,21 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (c) 2022 Rockchip Electronics Co., Ltd.
> + * Copyright (c) 2025 plan44.ch/luz
> + * Copyright (c) 2025 Onion Corporation
> + */
> +
> +/dts-v1/;
> +
> +#include "rv1103b.dtsi"
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0m0_xfer>;
> +	bootph-all;

nit: Please sort bootph before pinctrl.

Regards,
Jonas

> +	status = "okay";
> +};
> +
> +&wdt {
> +	status = "okay";
> +};


