Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA3C0C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:40:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZA6kBPukKRIi3Mfz30EIOD2hXvPMp1JAh/I+UCvwj8k=; b=AjkaX8OCYdOp4qER3oqmqrjNZC
	p37p56YxOeppcKRRNqMfF8i+7kcygz4fsTTHwGgkDBJkTEymJPdaBi+iVC//bjMDefaAVo6pq0LIP
	1STohqTQT1nWj4dZBnQtt0pucGOTgozz//Xlt4NAvw+roufo2P1V1PPoDYyx0pu0PxIo5HDjBXswj
	NrihXJ9B6AdD/pWHd3HzEvdpWpmnB4Ty2Dybl9PKlHOIAHbXbhaVPO6FqHLxA0KbsU87RbLT7OkS6
	wY1iNZPcgbiMKPTI9FLN8xCsjcYm+BZv9yjkmDjBtcPUaixKeyoRyFEvANfjtA1V7ghLLUgoDT1aa
	P4mz+fLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4rL-0000000CZ2z-2pIQ;
	Wed, 30 Apr 2025 10:40:11 +0000
Received: from mail-m1973175.qiye.163.com ([220.197.31.75])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4Xy-0000000CVaC-3Ays;
	Wed, 30 Apr 2025 10:20:13 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-2-entmail-virt205.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 13aa67b01;
	Wed, 30 Apr 2025 18:19:43 +0800 (GMT+08:00)
Message-ID: <0236c7e7-a633-409d-8a05-fa485299bc26@rock-chips.com>
Date: Wed, 30 Apr 2025 18:19:40 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
To: Quentin Schulz <quentin.schulz@cherry.de>, Chaoyi Chen
 <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Andrew Lunn <andrew@lunn.ch>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Jimmy Hon <honyuenkwun@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250430074848.539-1-kernel@airkyi.com>
 <20250430074848.539-3-kernel@airkyi.com>
 <31f5c9dc-d6cc-4fca-82ad-7be0da62d10c@cherry.de>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <31f5c9dc-d6cc-4fca-82ad-7be0da62d10c@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZQ0hLTVYdHxlPT00aTU9LGktWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a968635a28803abkunm13aa67b01
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6K1E6HSo*LzJJTiIWIiwhNAFR
	PQhPFBBVSlVKTE9NS0tDSEJKTE1KVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBSUhJT0M3Bg++
DKIM-Signature: a=rsa-sha256;
	b=RWLVf9/nAsZaT3V1+DtbbFsCNWV6AATxT2Go3PJHteVG2HTIqDpZIcASSVyrYhLm/8s1G6LSRon8qYyyDaqkwJmklkfw0kwmN4Rk6lMpKiA9yRaIX5T3KajIRVuJv3mZWhJvnM3hSmC7T1nw66earX3oZaorVaf7VodzPXnahRY=; c=relaxed/relaxed; s=default; d=rock-chips.com; v=1;
	bh=ZA6kBPukKRIi3Mfz30EIOD2hXvPMp1JAh/I+UCvwj8k=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250430_032011_501348_8D8E7C72 
X-CRM114-Status: GOOD (  30.63  )
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

Hi Quentin,

On 2025/4/30 16:39, Quentin Schulz wrote:
> Hi Chaoyi Chen,
>
> On 4/30/25 9:48 AM, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> General feature for rk3399 industry evaluation board:
>> - Rockchip RK3399
>
> Quick question, is this really an RK3399 or rather an RK3399K (the 
> industrial grade)? If it's a K variant, then we need a new 
> rk3399-k.dtsi with the appropriate OPPs and include that instead.

Yes, it is really an RK3399.


>
>> - 4GB LPDDR4
>> - emmc5.1
>> - SDIO3.0 compatible TF card
>> - 1x HDMI2.0a TX
>> - 1x HDMI1.4b RX with TC358749XBG HDMI to MIPI CSI2 bridge chip
>> - 1x type-c DisplayPort
>> - 3x USB3.0 Host
>> - 1x USB2.0 Host
>> - 1x Ethernet / USB3.0 to Ethernet
>>
>> Tested with HDMI/GPU/USB2.0/USB3.0/TF card/emmc.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>
>> Changes in v2:
>> - Remove gmac
>> - Add rk809 PMIC
>> - Add CPU supply
>> - Fix io-domain for sdmmc
>> - Enable vopl
>>
>>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>   .../boot/dts/rockchip/rk3399-evb-ind.dts      | 466 ++++++++++++++++++
>>   2 files changed, 467 insertions(+)
>>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
>>
>> diff --git a/arch/arm64/boot/dts/rockchip/Makefile 
>> b/arch/arm64/boot/dts/rockchip/Makefile
>> index 3e8771ef69ba..8a3adb7482ca 100644
>> --- a/arch/arm64/boot/dts/rockchip/Makefile
>> +++ b/arch/arm64/boot/dts/rockchip/Makefile
>> @@ -40,6 +40,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-px5-evb.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3368-r88.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-eaidk-610.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb.dtb
>> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-evb-ind.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-ficus.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-firefly.dtb
>>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399-gru-bob.dtb
>> diff --git a/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts 
>> b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
>> new file mode 100644
>> index 000000000000..ebfe7e56b3f5
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
>> @@ -0,0 +1,466 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
>> + */
>> +
>> +/dts-v1/;
>> +#include "rk3399-base.dtsi"
>> +
>
> You're supposed to include one device tree include with OPPs. I see 
> that the rk3399-evb is the only one that does that.
>
> According to 296602b8e5f7 ("arm64: dts: rockchip: Move RK3399 OPPs to 
> dtsi files for SoC variants"), this was done because:
>
>     The only exception to the "include only a SoC variant dtsi" is 
> found in
>     rk3399-evb.dts, which includes rk3399-base.dtsi instead of 
> rk3399.dtsi.
>     This is intentional, because this board dts file doesn't enable 
> the TSADC,
>     so including rk3399.dtsi would enable the SoC to go into higher 
> OPPs with
>     no thermal throttling in place.  Let's hope that people interested 
> in this
>     board will fix this in the future.
>
> Soooo, maybe you could fix that now? At the very least for the 
> industrial variant (but it would also be most welcomed for the 
> "normal" EVB).
>
I think this should include "rk3399.dtsi", since this is just the normal 
version of RK3399. I will investigate further about rk3399-evb.


>> +/ {
>> +    model = "Rockchip RK3399 EVB IND LPDDR4 Board";
>> +    compatible = "rockchip,rk3399-evb-ind", "rockchip,rk3399";
>> +
>> +    aliases {
>> +        ethernet0 = &gmac;
>
> Considering gmac is gone from the DT, maybe you want to have that one 
> in the patch that will add Ethernet support?

Yes, there will be an additional series. I will remove them in v3 for now.


>
>> +        mmc0 = &sdhci;
>> +        mmc1 = &sdmmc;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = "serial2:1500000n8";
>> +    };
>> +
>> +    vcc5v0_sys: regulator-vcc5v0-sys {
>> +        compatible = "regulator-fixed";
>> +        enable-active-high;
>> +        gpio = <&gpio4 RK_PD2 GPIO_ACTIVE_HIGH>;
>> +        regulator-name = "vcc5v0_sys";
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        regulator-max-microvolt = <5000000>;
>> +        regulator-min-microvolt = <5000000>;
>> +    };
>> +};
>> +
>> +&cpu_l0 {
>> +    cpu-supply = <&vdd_cpu_l>;
>> +};
>> +
>> +&cpu_l1 {
>> +    cpu-supply = <&vdd_cpu_l>;
>> +};
>> +
>> +&cpu_l2 {
>> +    cpu-supply = <&vdd_cpu_l>;
>> +};
>> +
>> +&cpu_l3 {
>> +    cpu-supply = <&vdd_cpu_l>;
>> +};
>> +
>> +&cpu_b0 {
>> +    cpu-supply = <&vdd_cpu_b>;
>> +};
>> +
>> +&cpu_b1 {
>> +    cpu-supply = <&vdd_cpu_b>;
>> +};
>> +
>
> Please order the nodes alphabetically, so cpu_bX before cpu_lX. See 
> https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

Will fix in v3.


>
>> +&emmc_phy {
>> +    status = "okay";
>> +};
>> +
>> +&gpu {
>> +    mali-supply = <&vdd_gpu>;
>> +    status = "okay";
>> +};
>> +
>> +&hdmi {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&hdmi_i2c_xfer>, <&hdmi_cec>;
>> +    status = "okay";
>> +};
>> +
>> +&hdmi_sound {
>> +    status = "okay";
>> +};
>> +
>
> hdmi_sound requires i2s2 controller to be enabled too, but I don't see 
> it in this device tree?

Will fix in v3.


>
>> +&i2c0 {
>> +    clock-frequency = <400000>;
>> +    i2c-scl-falling-time-ns = <4>;
>> +    i2c-scl-rising-time-ns = <168>;
>> +    status = "okay";
>> +
>> +    rk809: pmic@20 {
>> +        compatible = "rockchip,rk809";
>> +        reg = <0x20>;
>> +        interrupt-parent = <&gpio1>;
>> +        interrupts = <RK_PC5 IRQ_TYPE_LEVEL_LOW>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&pmic_int_l>;
>> +        rockchip,system-power-controller;
>> +        #clock-cells = <1>;
>> +        pmic-reset-func = <0>;
>> +        wakeup-source;
>> +        clock-output-names = "xin32k", "rk808-clkout2";
>> +
>
> Please order properties correctly, see 
> https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

Will fix in v3.


>
>> +        vcc1-supply = <&vcc5v0_sys>;
>> +        vcc2-supply = <&vcc5v0_sys>;
>> +        vcc3-supply = <&vcc5v0_sys>;
>> +        vcc4-supply = <&vcc5v0_sys>;
>> +        vcc5-supply = <&vcc_buck5>;
>> +        vcc6-supply = <&vcc_buck5>;
>> +        vcc7-supply = <&vcc5v0_sys>;
>> +        vcc8-supply = <&vcc3v3_sys>;
>> +        vcc9-supply = <&vcc5v0_sys>;
>> +
>> +        regulators {
>> +            vdd_center: DCDC_REG1 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-initial-mode = <0x2>;
>> +                regulator-max-microvolt = <1350000>;
>> +                regulator-min-microvolt = <750000>;
>> +                regulator-ramp-delay = <6001>;
>> +                regulator-name = "vdd_center";
>
> Missing blank line between last property and first child node, see 
> https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html. 
> Same remark for all other regulators.

Will fix them in v3.


>
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vdd_cpu_l: DCDC_REG2 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-initial-mode = <0x2>;
>> +                regulator-max-microvolt = <1350000>;
>> +                regulator-min-microvolt = <750000>;
>> +                regulator-ramp-delay = <6001>;
>> +                regulator-name = "vdd_cpu_l";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vcc_ddr: DCDC_REG3 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-initial-mode = <0x2>;
>> +                regulator-name = "vcc_ddr";
>> +                regulator-state-mem {
>> +                    regulator-on-in-suspend;
>> +                };
>> +            };
>> +
>> +            vcc3v3_sys: DCDC_REG4 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-initial-mode = <0x2>;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-min-microvolt = <3300000>;
>> +                regulator-name = "vcc3v3_sys";
>> +                regulator-state-mem {
>> +                    regulator-on-in-suspend;
>> +                    regulator-suspend-microvolt = <3300000>;
>> +                };
>> +            };
>> +
>> +            vcc_buck5: DCDC_REG5 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <2200000>;
>> +                regulator-min-microvolt = <2200000>;
>> +                regulator-name = "vcc_buck5";
>> +                regulator-state-mem {
>> +                    regulator-on-in-suspend;
>> +                    regulator-suspend-microvolt = <2200000>;
>> +                };
>> +            };
>> +
>> +            vcca_0v9: LDO_REG1 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <900000>;
>> +                regulator-min-microvolt = <900000>;
>> +                regulator-name = "vcca_0v9";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vcc_1v8: LDO_REG2 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-name = "vcc_1v8";
>> +                regulator-state-mem {
>> +                    regulator-on-in-suspend;
>> +                    regulator-suspend-microvolt = <1800000>;
>> +                };
>> +            };
>> +
>> +            vcc0v9_soc: LDO_REG3 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <900000>;
>> +                regulator-min-microvolt = <900000>;
>> +                regulator-name = "vcc0v9_soc";
>> +                regulator-state-mem {
>> +                    regulator-on-in-suspend;
>> +                    regulator-suspend-microvolt = <900000>;
>> +                };
>> +            };
>> +
>> +            vcca_1v8: LDO_REG4 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <1800000>;
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-name = "vcca_1v8";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vdd1v5_dvp: LDO_REG5 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <1500000>;
>> +                regulator-min-microvolt = <1500000>;
>> +                regulator-name = "vdd1v5_dvp";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vcc_1v5: LDO_REG6 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <1500000>;
>> +                regulator-min-microvolt = <1500000>;
>> +                regulator-name = "vcc_1v5";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vcc_3v0: LDO_REG7 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <3000000>;
>> +                regulator-min-microvolt = <3000000>;
>> +                regulator-name = "vcc_3v0";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vccio_sd: LDO_REG8 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-min-microvolt = <1800000>;
>> +                regulator-name = "vccio_sd";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vcc_sd: LDO_REG9 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-max-microvolt = <3300000>;
>> +                regulator-min-microvolt = <3300000>;
>> +                regulator-name = "vcc_sd";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +
>> +            vcc5v0_usb: SWITCH_REG1 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-name = "vcc5v0_usb";
>> +                regulator-state-mem {
>> +                    regulator-on-in-suspend;
>> +                };
>> +            };
>> +
>> +            vccio_3v3: SWITCH_REG2 {
>> +                regulator-always-on;
>> +                regulator-boot-on;
>> +                regulator-name = "vccio_3v3";
>> +                regulator-state-mem {
>> +                    regulator-off-in-suspend;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    vdd_cpu_b: tcs4525@1c {
>
> Please set the node name to regulator@1c.

Will fix in v3.

>
>> +        compatible = "tcs,tcs4525";
>> +        reg = <0x1c>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&vsel1_gpio>;
>> +        fcs,suspend-voltage-selector = <1>;
>> +        vin-supply = <&vcc5v0_sys>;
>> +        vsel-gpios = <&gpio1 RK_PC1 GPIO_ACTIVE_HIGH>;
>> +        regulator-compatible = "fan53555-reg";
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        regulator-initial-state = <3>;
>> +        regulator-max-microvolt = <1500000>;
>> +        regulator-min-microvolt = <712500>;
>> +        regulator-name = "vdd_cpu_b";
>> +        regulator-ramp-delay = <1000>;
>> +        regulator-state-mem {
>> +            regulator-off-in-suspend;
>> +        };
>
> Properties order and blank line before child node, see 
> https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

Will fix in v3.


>
>> +    };
>> +
>> +    vdd_gpu: tcs4526@10 {
>
> Please set node name to regulator@10.
>
> Please order child nodes in busses based on their address, i.e.:
>
> vdd_gpu
> vdd_cpu_b
> rk809
>
> in this case.

Will fix in v3.


>
>
>> +        compatible = "tcs,tcs4525";
>> +        reg = <0x10>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&vsel2_gpio>;
>> +        fcs,suspend-voltage-selector = <1>;
>> +        vin-supply = <&vcc5v0_sys>;
>> +        vsel-gpios = <&gpio1 RK_PB6 GPIO_ACTIVE_HIGH>;
>> +        regulator-compatible = "fan53555-reg";
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        regulator-initial-state = <3>;
>> +        regulator-max-microvolt = <1500000>;
>> +        regulator-min-microvolt = <712500>;
>> +        regulator-name = "vdd_gpu";
>> +        regulator-ramp-delay = <1000>;
>> +        regulator-state-mem {
>> +            regulator-off-in-suspend;
>> +        };
>
> Properties order and blank line before child node, see 
> https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html

Will fix in v3.


>
>> +    };
>> +};
>> +
>> +&io_domains {
>> +    audio-supply = <&vcca_1v8>;
>> +    bt656-supply = <&vcc_3v0>;
>> +    gpio1830-supply = <&vcc_3v0>;
>> +    sdmmc-supply = <&vccio_sd>;
>> +    status = "okay";
>> +};
>
> What about pmu_io_domains too?
>
Sorry, I missed it. Will fix in v3.


>> +
>> +&sdmmc {
>> +    bus-width = <4>;
>> +    cap-mmc-highspeed;
>> +    cap-sd-highspeed;
>> +    disable-wp;
>> +    no-sdio;
>> +    no-mmc;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
>> +    sd-uhs-sdr104;
>> +    vmmc-supply = <&vcc_sd>;
>> +    vqmmc-supply = <&vccio_sd>;
>> +    status = "okay";
>> +};
>> +
>> +&sdhci {
>
> This should be before sdmmc

Will fix in v3.


>
>> +    bus-width = <8>;
>> +    keep-power-in-suspend;
>> +    mmc-hs400-1_8v;
>> +    mmc-hs400-enhanced-strobe;
>> +    no-sdio;
>> +    no-sd;
>> +    non-removable;
>> +    status = "okay";
>> +};
>> +
>> +&tcphy0 {
>> +    status = "okay";
>> +};
>> +
>> +&tcphy1 {
>> +    status = "okay";
>> +};
>> +
>
> What about tsadc?

Oh, there's a tsadc. I'll add it in v3.


>
>> +&u2phy0 {
>> +    status = "okay";
>> +};
>> +
>> +&u2phy0_host {
>> +    status = "okay";
>> +};
>> +
>> +&u2phy0_otg {
>> +    status = "okay";
>> +};
>> +
>> +&u2phy1 {
>> +    status = "okay";
>> +};
>> +
>> +&u2phy1_host {
>> +    status = "okay";
>> +};
>> +
>> +&u2phy1_otg {
>> +    status = "okay";
>> +};
>> +
>> +&uart2 {
>> +    status = "okay";
>> +};
>> +
>> +&usbdrd_dwc3_0 {
>> +    status = "okay";
>> +};
>> +
>> +&usbdrd3_0 {
>> +    status = "okay";
>> +};
>> +
>> +&usbdrd3_1 {
>> +    status = "okay";
>> +};
>> +
>> +&usbdrd_dwc3_1 {
>> +    dr_mode = "host";
>> +    status = "okay";
>> +};
>> +
>> +&usb_host0_ehci {
>> +    status = "okay";
>> +};
>> +
>> +&usb_host0_ohci {
>> +    status = "okay";
>> +};
>> +
>> +&usb_host1_ehci {
>> +    status = "okay";
>> +};
>> +
>> +&usb_host1_ohci {
>> +    status = "okay";
>> +};
>> +
>> +&pinctrl {
>
> This needs to be ordered alphabetically, see 
> https://www.kernel.org/doc/html/latest/devicetree/bindings/dts-coding-style.html 
> (so before sdhci here).

Thank you for the quick reply! I will fix them in v3.


> Cheers,
> Quentin
>
>

