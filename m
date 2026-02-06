Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 09C7AEE6B60
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Feb 2026 20:50:28 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=KjKy0DEi9PeeKMA6cFOEmoz6i/HCq6Rp2FX4gRpNp7s=; b=cYOzf67XDUR+8qlBExg7rJ+YA/
	6qqBDCpzuTiaX8fUS+KSuOypnwwwPWnahYJMge2s8KVmRAX00Gu5mVtze8kaB5w6uCd2ceqABpx3U
	nfJPu8MpUNoFLSowylFI6SU5ZfFE0lT5ePJngyGYzfmn89BY4Gtz2evaoftLrovIypslUX56BGeJy
	cXu9N4vjnDZT/fAor7oFDCCoXPegbjAcpEPdG/fUkCNrskhH03e2uMmbO+HXQTqt/u8t/qeUUEWBJ
	lKs5KF12o20XeTb+5WYlgtG4wvxfx+hRWmyNqAvM22EKQV2D3gyFi9nAUdUGpEhMCvydvtd0EvwGJ
	hOquapjA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSmT-0000000Bowf-08Ts;
	Fri, 06 Feb 2026 20:50:21 +0000
Received: from smtp.forwardemail.net ([121.127.44.73])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1voSmQ-0000000Bovw-2C13
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Feb 2026 20:50:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kwiboo.se;
 h=Content-Transfer-Encoding: Content-Type: In-Reply-To: From: References:
 Cc: To: Subject: MIME-Version: Date: Message-ID; q=dns/txt;
 s=fe-e1b5cab7be; t=1770411017;
 bh=KjKy0DEi9PeeKMA6cFOEmoz6i/HCq6Rp2FX4gRpNp7s=;
 b=TjtoYbQgFHG+3sRSJu9bQkEN1DUIzE8GXgajysIC/Wf5K+hyrKr+397yuznZu6ybtcsJjlNUl
 Roe5Aqs4zF+yLqObh/H9Yj4MwRYzk5dKnGLtn7MqEcRmSRt8SotW8v96iiDgg+XpMs79S4gSisV
 k6LZxoBqgGygGtZIeUB0l7sA9Ush+eGOPdif0TG+vY8yd+HLvfBdPBgTSksQIGaNiHqtUmkxTkp
 tELelAWzgOQlUu4LXDZXwXeeBU2U+0uNaWL6sAXlwxkO1QlzZNdBNV/lOWJD+wjreXF/DI2Fs/D
 M2y43cELNJe4WpxuKtaFFOC3oZtM0Hjf74BEIJ55dzfA==
X-Forward-Email-ID: 69865405a0945f6de12eac74
X-Forward-Email-Sender: rfc822; jonas@kwiboo.se, smtp.forwardemail.net,
 121.127.44.73
X-Forward-Email-Version: 2.6.1
X-Forward-Email-Website: https://forwardemail.net
X-Complaints-To: abuse@forwardemail.net
X-Report-Abuse: abuse@forwardemail.net
X-Report-Abuse-To: abuse@forwardemail.net
Message-ID: <36248f00-1ffe-43a1-bdc7-24738389f1ce@kwiboo.se>
Date: Fri, 6 Feb 2026 21:50:10 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 11/11] ARM: dts: rockchip: Add Onion RV1103B Omega4
To: Fabio Estevam <festevam@gmail.com>
Cc: heiko@sntech.de, robh@kernel.org, krzk+dt@kernel.org,
 conor+dt@kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-rockchip@lists.infradead.org,
 Fabio Estevam <festevam@nabladev.com>
References: <20260206181309.2696095-1-festevam@gmail.com>
 <20260206181309.2696095-12-festevam@gmail.com>
Content-Language: en-US
From: Jonas Karlman <jonas@kwiboo.se>
In-Reply-To: <20260206181309.2696095-12-festevam@gmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260206_125018_662671_A75D6E34 
X-CRM114-Status: GOOD (  24.91  )
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

On 2/6/2026 7:13 PM, Fabio Estevam wrote:
> From: Fabio Estevam <festevam@nabladev.com>
> 
> Onion Omega4 board is a board based on the RV1103B SoC that has:
> 
> - 256 MB of RAM
> - 256 MB of SPI-NAND
> - Ethernet
> - USB OTG
> - Wifi
> - SD card
> - Camera connector
> 
> Add the initial support for this board so that it can fully boot into
> Linux with the root file system stored in the SPI NAND.
> 
> Signed-off-by: Fabio Estevam <festevam@nabladev.com>
> ---
>  arch/arm/boot/dts/rockchip/Makefile           |  1 +
>  arch/arm/boot/dts/rockchip/rv1103b-omega4.dts | 92 +++++++++++++++++++
>  2 files changed, 93 insertions(+)
>  create mode 100644 arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
> 
> diff --git a/arch/arm/boot/dts/rockchip/Makefile b/arch/arm/boot/dts/rockchip/Makefile
> index 716f5540e438..d8cd5df138cc 100644
> --- a/arch/arm/boot/dts/rockchip/Makefile
> +++ b/arch/arm/boot/dts/rockchip/Makefile
> @@ -1,5 +1,6 @@
>  # SPDX-License-Identifier: GPL-2.0
>  dtb-$(CONFIG_ARCH_ROCKCHIP) += \
> +	rv1103b-omega4.dtb \
>  	rv1108-elgin-r1.dtb \
>  	rv1108-evb.dtb \
>  	rv1109-relfor-saib.dtb \
> diff --git a/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
> new file mode 100644
> index 000000000000..512b063bceb1
> --- /dev/null
> +++ b/arch/arm/boot/dts/rockchip/rv1103b-omega4.dts
> @@ -0,0 +1,92 @@
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
> +/ {
> +	model = "Onion RV1103 Omega4 Board";
> +	compatible = "onion,rv1103b-omega4", "rockchip,rv1103b";
> +
> +	chosen {
> +		stdout-path = &uart0;

Please add a serial0 alias and use the following form to match most
other Rockchip boards.

 		stdout-path = "serial0:115200n8";

> +	};
> +
> +	memory@0 {
> +		device_type = "memory";
> +		reg = <0x0 0x10000000>;
> +	};

Memory nodes is typically added by firmware on Rockchip platform.

Size of the DRAM is typically encoded in OS_REG2 by the DRAM init
code and can/should be picked up from there for next boot stages.

> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0	{
> +			gpios = <&gpio0 RK_PA2 GPIO_ACTIVE_HIGH>;

Please add pinctrl props for this pin. Also please add function and
color props.

> +			label = "sys";
> +			default-state = "on";
> +		};
> +	};
> +};
> +
> +&fspi0 {
> +	bootph-all;

This is not really needed in all boot phases, the initial phase only
initialize DRAM and then return to BootROM so does not need to know
about the spi flash.

Also adding it here is not enough, please instead add bootph props to
the flash@0 or possible partitions node.

For optimal boot performance and size consideration you should drop
this and add following bootph props.

> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "spi-nand";
> +		reg = <0>;

		bootph-pre-ram;
		bootph-some-ram;

Adding these here ensure that this and the parent node is included in
the second stage and the pre-relocation boot-phase, the only phases they
are needed.

Regards,
Jonas

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
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0m0_xfer_pins>;
> +	bootph-all;
> +	status = "okay";
> +};
> +
> +&wdt {
> +	bootph-all;
> +	status = "okay";
> +};


