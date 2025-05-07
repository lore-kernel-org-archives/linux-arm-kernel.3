Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 29368C3ABC5
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  7 May 2025 09:19:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:CC:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=dlQASdhbOgM7Ty1+g6FVadE+Ok2Wx4Q/VcJ+AXEeFm4=; b=4QfNccKDn7wFMfMM88FxsbA5Uf
	9aLb6LqpItMG4dKPRgiPqbzArXobq226cMIO5gIlAvbkQP7hvQp1Gx0ipI/TYhZ69uJWbwyc7DbSn
	2SXCDv/xQUrUEmXUNmsnCRU6QUEf+TzmqLuxG0d0FDMORG+I16azviLyhkrroiCyM/eSHUWgjMj7w
	FJdcC24wtRAJJrJ+wmCmgwGDSuoaOS9VE9O4u+Eu13843BEdMyNG+Xdy9rNEEy74U+6LmQdRmqNv6
	DCR2mkoZwVU1t741EkSmUAW4p2xZ/52+UBFoETLq3y+6vLhRTdLLxXBeJIQwXNtTHKvGI5gfYhmZ5
	hYT17B0Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCavS-0000000Eu97-3WKV;
	Wed, 07 May 2025 09:18:50 +0000
Received: from lelvem-ot01.ext.ti.com ([198.47.23.234])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uCa13-0000000EiEl-26Da
	for linux-arm-kernel@lists.infradead.org;
	Wed, 07 May 2025 08:20:36 +0000
Received: from lelv0266.itg.ti.com ([10.180.67.225])
	by lelvem-ot01.ext.ti.com (8.15.2/8.15.2) with ESMTPS id 5478KIxO756425
	(version=TLSv1.2 cipher=DHE-RSA-AES256-GCM-SHA384 bits=256 verify=OK);
	Wed, 7 May 2025 03:20:18 -0500
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=ti.com;
	s=ti-com-17Q1; t=1746606018;
	bh=dlQASdhbOgM7Ty1+g6FVadE+Ok2Wx4Q/VcJ+AXEeFm4=;
	h=Date:Subject:To:CC:References:From:In-Reply-To;
	b=w1/Nf1UIMqKsI4mrIWhvls8Ww7lJsHfvs4TWwFU+ZHd7fIZDoWn4gaE1PxN8XhuTA
	 RbVMlIEhtxKuaP7lcnn7PZiAe2j5uID7TpqdfcyswRdxd78mxKKSRvae4rYL4sHhV1
	 Q18++KC7T4+DRulYOZd8hI6E/oBbR/vgNGbKm4fM=
Received: from DFLE115.ent.ti.com (dfle115.ent.ti.com [10.64.6.36])
	by lelv0266.itg.ti.com (8.15.2/8.15.2) with ESMTPS id 5478KIcm012894
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=FAIL);
	Wed, 7 May 2025 03:20:18 -0500
Received: from DFLE113.ent.ti.com (10.64.6.34) by DFLE115.ent.ti.com
 (10.64.6.36) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23; Wed, 7
 May 2025 03:20:17 -0500
Received: from lelvsmtp5.itg.ti.com (10.180.75.250) by DFLE113.ent.ti.com
 (10.64.6.34) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_128_CBC_SHA256_P256) id 15.1.2507.23 via
 Frontend Transport; Wed, 7 May 2025 03:20:17 -0500
Received: from [172.24.19.187] (lt5cd2489kgj.dhcp.ti.com [172.24.19.187])
	by lelvsmtp5.itg.ti.com (8.15.2/8.15.2) with ESMTP id 5478KD7n011099;
	Wed, 7 May 2025 03:20:14 -0500
Message-ID: <a6329e9d-409e-4f62-b26d-c4d0e49d772c@ti.com>
Date: Wed, 7 May 2025 13:50:12 +0530
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: ti: k3-j722s-evm: Add overlay for TEVI
 OV5640
To: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>, <nm@ti.com>,
        <vigneshr@ti.com>, <kristo@kernel.org>, <robh@kernel.org>,
        <krzk+dt@kernel.org>, <conor+dt@kernel.org>
CC: <vaishnav.a@ti.com>, <r-donadkar@ti.com>, <devicetree@vger.kernel.org>,
        <linux-arm-kernel@lists.infradead.org>, <jai.luthra@linux.dev>,
        <linux-kernel@vger.kernel.org>, <u-kumar1@ti.com>
References: <20250505115700.500979-1-y-abhilashchandra@ti.com>
 <20250505115700.500979-3-y-abhilashchandra@ti.com>
Content-Language: en-US
From: "Kumar, Udit" <u-kumar1@ti.com>
In-Reply-To: <20250505115700.500979-3-y-abhilashchandra@ti.com>
Content-Type: text/plain; charset="UTF-8"; format=flowed
Content-Transfer-Encoding: 7bit
X-C2ProcessedOrg: 333ef613-75bf-4e12-a4b1-8e3623f5dcea
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250507_012033_709921_FDBA548A 
X-CRM114-Status: GOOD (  21.95  )
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

Hello Vaishnav/Abhilash

Thanks for patch

On 5/5/2025 5:27 PM, Yemike Abhilash Chandra wrote:
> From: Vaishnav Achath <vaishnav.a@ti.com>
>
> TechNexion TEVI OV5640 camera is a 5MP camera that can be used with
> J722S EVM through the 22-pin CSI-RX connector. Add a reference overlay
> for quad TEVI OV5640 modules on J722S EVM.
>
> Signed-off-by: Vaishnav Achath <vaishnav.a@ti.com>
> Signed-off-by: Yemike Abhilash Chandra <y-abhilashchandra@ti.com>
> ---
>   arch/arm64/boot/dts/ti/Makefile               |   4 +
>   .../k3-j722s-evm-csi2-quad-tevi-ov5640.dtso   | 358 ++++++++++++++++++
>   2 files changed, 362 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
>
> diff --git a/arch/arm64/boot/dts/ti/Makefile b/arch/arm64/boot/dts/ti/Makefile
> index 829a3b028466..76b750e4b8a8 100644
> --- a/arch/arm64/boot/dts/ti/Makefile
> +++ b/arch/arm64/boot/dts/ti/Makefile
> @@ -123,6 +123,7 @@ dtb-$(CONFIG_ARCH_K3) += k3-j721s2-evm-pcie1-ep.dtbo
>   dtb-$(CONFIG_ARCH_K3) += k3-am67a-beagley-ai.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm.dtb
>   dtb-$(CONFIG_ARCH_K3) += k3-j722s-evm-csi2-quad-rpi-cam-imx219.dtbo
> [..]
> diff --git a/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> new file mode 100644
> index 000000000000..537224ea60e3
> --- /dev/null
> +++ b/arch/arm64/boot/dts/ti/k3-j722s-evm-csi2-quad-tevi-ov5640.dtso
> @@ -0,0 +1,358 @@
> +// SPDX-License-Identifier: GPL-2.0-only OR MIT
> +/*
> + * 4 x TEVI OV5640 MIPI Camera module on RPI camera connector.
> + *
> + * Copyright (C) 2024 Texas Instruments Incorporated - https://www.ti.com/
> + */
> +
> +/dts-v1/;
> +/plugin/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include "k3-pinctrl.h"
> +
> +&{/} {
> +	clk_ov5640_fixed: clock-24000000 {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <24000000>;
> +	};
> +

Please check once , this is clock is 25M or 24M .

As I see CDC6CE025000ADLXT/U28 is marked as 25M OSC

> +	reg_2p8v: regulator-2p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2P8V";
> +		regulator-min-microvolt = <2800000>;
> +		regulator-max-microvolt = <2800000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1p8v: regulator-1p8v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1P8V";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <1800000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};
> +
> +	reg_3p3v: regulator-3p3v {
> +		compatible = "regulator-fixed";
> +		regulator-name = "3P3V";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vdd_sd_dv>;
> +		regulator-always-on;
> +	};

Sorry but on connector QSH-020-01-L-D-DP-A-K/J27, I see only 3v3 available.

May be I am missing something here but how you are getting 1v8 and 2v8 
supply


> +};
> +
> +
> +&main_pmx0 {
> +	cam0_reset_pins_default: cam0-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x03c, PIN_OUTPUT, 7)
> +		>;
> +	};
> +

Please mark GPIO you are using for this in comment

example

J722S_IOPAD(0x1dc, PIN_INPUT, 0) /* (C22) MCAN0_RX */


> +	cam1_reset_pins_default: cam1-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x044, PIN_OUTPUT, 7)
> +		>;
> +	};
> +
> +	cam2_reset_pins_default: cam2-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x04c, PIN_OUTPUT, 7)
> +		>;
> +	};
> +
> +	cam3_reset_pins_default: cam3-default-reset-pins {
> +		pinctrl-single,pins = <
> +			J722S_IOPAD(0x054, PIN_OUTPUT, 7)
> +		>;
> +	};
> +};
> +
> +&exp1 {
> +	p06-hog{
> +		/* P06 - CSI01_MUX_SEL_2 */
> +		gpio-hog;
> +		gpios = <6 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI01_MUX_SEL_2";

As per table on page 29

CSI01_MUX_SEL_2 as low means, INPUT<-- A Port [CSI2 Connector]

Please check, if you want to drive this line high or low

> +	};
> +
> +	p07-hog{
> +		/* P01 - CSI23_MUX_SEL_2 */
> +		gpio-hog;
> +		gpios = <7 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI23_MUX_SEL_2";
> +	};

Same as for CSI01_MUX_SEL_2, table on page-30


> +};
> +
> +&main_gpio0 {
> +	p15-hog {
> +		/* P15 - CSI2_CAMERA_GPIO1 */
> +		gpio-hog;
> +		gpios = <15 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI2_CAMERA_GPIO1";
> +	};
> +
> +	p17-hog {
> +		/* P17 - CSI2_CAMERA_GPIO2 */
> +		gpio-hog;
> +		gpios = <17 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI2_CAMERA_GPIO2";
> +	};
> +
> +	p19-hog {
> +		/* P19 - CSI2_CAMERA_GPIO3 */
> +		gpio-hog;
> +		gpios = <19 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI2_CAMERA_GPIO3";
> +	};
> +
> +	p21-hog {
> +		/* P21 - CSI2_CAMERA_GPIO4 */
> +		gpio-hog;
> +		gpios = <21 GPIO_ACTIVE_HIGH>;
> +		output-high;
> +		line-name = "CSI2_CAMERA_GPIO4";
> +	};

Please check once if P21 and rest above are pin number of SOC ?


> +};
> +
> +&pca9543_0 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +
> +	i2c@0 {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0>;
> +
> +		ov5640_0: camera@3c {
> +			compatible = "ovti,ov5640";
> +			reg = <0x3c>;
> +			clocks = <&clk_ov5640_fixed>;
> +			clock-names = "xclk";
> +
> +			AVDD-supply = <&reg_2p8v>;
> +			DOVDD-supply = <&reg_1p8v>;
> +			DVDD-supply = <&reg_3p3v>;
> +
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&cam0_reset_pins_default>;

do you think, you should have reset-gpios as property for this ov5640 
and other nodes too ?


> +
> [..]

