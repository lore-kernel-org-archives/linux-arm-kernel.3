Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D4119C54F4C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 28 Jul 2026 14:40:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6NAYFFRdO0dAvQU4kkEvVp93IHO9/hVJijDurWj3G7E=; b=tXKTU8bugmqf9fhOzskatkg3td
	xpJBEuWbTagTQnrqIF4lnb2FKC5AL2Pype4f4cSwl1YjUYlSqN8N85+NqI1LGCw4Ky0WdvvkFhbKn
	ZDyZBBtYoDaAORJhTV8NDYOYb2GTYziJ26IP/q69RuWGOw+zVk7xiCzukX43HatsQd2uOw9UjUuLN
	NgvMZff0Luthn4X49kYnBTP6CfMqaaIx57P8u8bfjQlOB9/Rd+Kb750aPRiXAURCvehMVYx0y7efF
	b9xpMW7qufjQllnYW8+3OdJYtDJv6RlDUA+cq8m1Mr96FCxoK2smtLps+wM2u56QiWOdDzdSyfJHR
	xMjT3rhw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiyK-00000005Wk4-296P;
	Tue, 28 Jul 2026 14:39:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1woiyI-00000005Wjy-3x0E
	for linux-arm-kernel@lists.infradead.org;
	Tue, 28 Jul 2026 14:39:55 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 2980D600FC;
	Tue, 28 Jul 2026 14:39:54 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id B2A461F000E9;
	Tue, 28 Jul 2026 14:39:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785249593;
	bh=6NAYFFRdO0dAvQU4kkEvVp93IHO9/hVJijDurWj3G7E=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=FDtOR8XgwtsvtDPgyZjoHGVrcCiPkPncghk5Cjc9D5pj9ucIjOZ4kK6fpU3iv5Mke
	 3HVAa1da0Zi/Fqki63FpSMzCwRqwVL5sjW+yBjYlHWvWvxRRsPaGiqq1GRs86wxubb
	 bfe3WYU+1vVS/YO82IQcS3WpK1uL+uO4VgJYq16partyMmXC8dnaSkqEqAlNNF0kX/
	 x6lyx2p5+LuneRsJRiGRxybQgFoR/P3/L9y96D8dVLPeXrCKn+TzRJGVIF+/cpeDjl
	 qeid7XEkdJbVR441KDQBmbPn5o/o+GpXzLLwuXhZycf5WQZPxwoHde4w4MfAUlGFjb
	 deHwzg3KaX2FA==
Date: Tue, 28 Jul 2026 09:39:52 -0500
From: Rob Herring <robh@kernel.org>
To: Jacky Huang <jackyhuang@nvidia.com>
Cc: andrew@codeconstruct.com.au, joel@jms.id.au,
	krzysztof.kozlowski@oss.qualcomm.com, conor+dt@kernel.org,
	andrew@lunn.ch, devicetree@vger.kernel.org,
	linux-aspeed@lists.ozlabs.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, openbmc@lists.ozlabs.org
Subject: Re: [PATCH v4 2/2] ARM: dts: aspeed: Add NVIDIA VR-NVL BMC
Message-ID: <20260728143952.GA2121505-robh@kernel.org>
References: <20260728085640.1001890-1-jackyhuang@nvidia.com>
 <20260728085640.1001890-3-jackyhuang@nvidia.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260728085640.1001890-3-jackyhuang@nvidia.com>
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

On Tue, Jul 28, 2026 at 05:55:10PM +0900, Jacky Huang wrote:
> Add the device tree for the Aspeed AST2600 BMC for NVIDIA's Vera
> Rubin NVL compute platform.
> 
> MAC0 uses phy-mode = "rgmii-id" because the on-board PHY supplies
> both RGMII internal delays. The matching U-Boot device tree does not
> enable SoC-side MAC clock delays, leaving the MAC internal delay at
> zero so the PHY-provided delay is not doubled by the MAC controller.
> 
> The corresponding U-Boot change has been submitted to openbmc/u-boot:
> Link: https://lore.kernel.org/all/20260629105202.1417679-1-jackyhuang@nvidia.com/
> 
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> Signed-off-by: Jacky Huang <jackyhuang@nvidia.com>
> ---
> v4: address dt-check-style findings for property and child node ordering,
>     required blank lines, and line length. Retain 8 conventional multi-line
>     block comments with mixed-indent and 22 meaningful unused labels for
>     source readability and future references. They can be removed if
>     preferred.
> 
>  arch/arm/boot/dts/aspeed/Makefile             |   1 +
>  .../aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts   | 923 ++++++++++++++++++
>  2 files changed, 924 insertions(+)
>  create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> 
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed/Makefile
> index 6b68671f9379..07e10083a8bd 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -65,6 +65,7 @@ dtb-$(CONFIG_ARCH_ASPEED) += \
>  	aspeed-bmc-microsoft-olympus.dtb \
>  	aspeed-bmc-nvidia-gb200nvl-bmc.dtb \
>  	aspeed-bmc-nvidia-msx4-bmc.dtb \
> +	aspeed-bmc-nvidia-vr-nvl-bmc.dtb \
>  	aspeed-bmc-opp-lanyang.dtb \
>  	aspeed-bmc-opp-mowgli.dtb \
>  	aspeed-bmc-opp-nicole.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> new file mode 100644
> index 000000000000..1c04fd3e627c
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-nvidia-vr-nvl-bmc.dts
> @@ -0,0 +1,923 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2026 NVIDIA Corporation


> +&ehci1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	status = "okay";
> +
> +	hub@1 {
> +		reg = <1>;
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		hub@1 {
> +			reg = <1>;
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			hub@4 {
> +				reg = <4>;
> +				#address-cells = <1>;
> +				#size-cells = <0>;
> +
> +				/* port 1: BlueField-4 SMA mgmt */
> +				device@1 {
> +					reg = <1>;
> +					#address-cells = <2>;
> +					#size-cells = <0>;
> +
> +					interface@1 {
> +						reg = <1 1>;
> +					};
> +				};
> +
> +				cp2112g: device@2 {

This and other devices should have a compatible string and associated 
schema. The hub probably should too.

> +					reg = <2>;
> +					#gpio-cells = <2>;
> +					gpio-controller;
> +					gpio-line-names =
> +						"BF4_USB_MCU_RECOVERY_L",
> +						"BF4_USB_MCU_RST_L",
> +						"BF4_USB_FORCE_FNP_L",
> +						"BF4_GLOBAL_WP",
> +						"BF4_FORCE_POR_L",
> +						"BF4_BMC_EROT_RST_L",
> +						"BF4_BMC_EROT_RECOVERY_L",
> +						"BF4_THERM_SHUTDOWN";
> +					#interrupt-cells = <2>;
> +					interrupt-controller;
> +				};
> +			};
> +		};
> +

> +&fmc {
> +	status = "okay";
> +
> +	flash@0 {

Needs a compatible.

> +		label = "bmc";
> +
> +		status = "okay";

okay is the default, so not needed.

> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				reg = <0x0 0xe0000>;		/* 896 KiB */
> +				label = "u-boot";
> +			};
> +
> +			partition@100000 {
> +				reg = <0x100000 0x900000>;	/* 9 MiB */
> +				label = "kernel";
> +			};
> +
> +			partition@a00000 {
> +				/*
> +				 * extends to end of 64 MiB - 4 KiB; last
> +				 * 4 KiB reserved for EROT image
> +				 */
> +				reg = <0xa00000 0x35ff000>;
> +				label = "rofs";
> +			};
> +		};
> +	};
> +};


> +&spi2 {
> +	pinctrl-0 = <&pinctrl_spi2_default>;
> +	pinctrl-names = "default";
> +
> +	status = "okay";
> +
> +	flash@0 {
> +		label = "config";

Needs a compatible.

> +
> +		status = "okay";

Drop

> +
> +		partitions {
> +			compatible = "fixed-partitions";
> +			#address-cells = <1>;
> +			#size-cells = <1>;
> +
> +			partition@0 {
> +				reg = <0x0 0x40000>;	/* 256 KiB */
> +				label = "u-boot-env";
> +			};
> +
> +			partition@40000 {
> +				reg = <0x40000 0x1000000>;	/* 16 MiB */
> +				label = "rwfs";
> +			};
> +
> +			partition@1040000 {
> +				reg = <0x1040000 0x2800000>;	/* 40 MiB */
> +				label = "log";
> +			};
> +		};
> +	};
> +};

