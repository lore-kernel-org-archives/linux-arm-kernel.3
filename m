Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 75FD9C369D3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 28 Apr 2025 10:04:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NL7rXic5Deq/XuNvQqdkSaO2B07wh3fSCUtIWJkyaKo=; b=4m25Pcy6d8aQGyxfIsSqsnZdCo
	rQun7FXoe+iHcOJeK9Cx1BiZCSl/NbrZhgTMEdLZh7asV3Y17+H0wLjg9BJDQRGBTKUVm89g4hYLA
	YnVjMLcFjObqKXCZ1KwwDiS/3ImkO0A6H59KWoqos+nsE/jvHasdyst4A4ADa8IfYKEbQrtISrWTY
	W3pxeUDExH49Kj7BbbXiDaVJmop+O9JrqktDLyt9pWIRSpuD58s5WB7hmrrY2jf0U88x5wJonY26O
	PrXyYOOAE8ucusphdAV9SJ7InRJ0kgFu6312pCdbTqDwnUvWbLtBRanaFm87VdJS/it3Qy4axjQvw
	OMUXV9dg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LLP-00000005kK1-0oHu;
	Mon, 28 Apr 2025 10:04:11 +0000
Received: from mail-m19731116.qiye.163.com ([220.197.31.116])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1u9LJP-00000005k9l-3QTB;
	Mon, 28 Apr 2025 10:02:09 +0000
Received: from [127.0.0.1] (gy-adaptive-ssl-proxy-3-entmail-virt135.gy.ntes [58.22.7.114])
	by smtp.qiye.163.com (Hmail) with ESMTP id 1365c5568;
	Mon, 28 Apr 2025 18:01:56 +0800 (GMT+08:00)
Message-ID: <cc0dd83c-a9f6-4c3d-b45f-29ce5480ae2c@rock-chips.com>
Date: Mon, 28 Apr 2025 18:01:56 +0800
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add rk3399-evb-ind board
To: Quentin Schulz <quentin.schulz@cherry.de>, Chaoyi Chen
 <kernel@airkyi.com>, Heiko Stuebner <heiko@sntech.de>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Jonas Karlman <jonas@kwiboo.se>,
 Kever Yang <kever.yang@rock-chips.com>,
 Jianfeng Liu <liujianfeng1994@gmail.com>, Dragan Simic <dsimic@manjaro.org>,
 Jimmy Hon <honyuenkwun@gmail.com>, FUKAUMI Naoki <naoki@radxa.com>,
 Cristian Ciocaltea <cristian.ciocaltea@collabora.com>,
 Alexey Charkov <alchark@gmail.com>,
 Geert Uytterhoeven <geert+renesas@glider.be>,
 Sebastian Reichel <sebastian.reichel@collabora.com>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250427094211.246-1-kernel@airkyi.com>
 <20250427094211.246-3-kernel@airkyi.com>
 <561d13ec-c487-4695-b50f-af8f2a65c61c@cherry.de>
From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
In-Reply-To: <561d13ec-c487-4695-b50f-af8f2a65c61c@cherry.de>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-HM-Spam-Status: e1kfGhgUHx5ZQUpXWQgPGg8OCBgUHx5ZQUlOS1dZFg8aDwILHllBWSg2Ly
	tZV1koWUFDSUNOT01LS0k3V1ktWUFJV1kPCRoVCBIfWUFZGh9ITlZCGklKTR1PHk9IHkpWFRQJFh
	oXVRMBExYaEhckFA4PWVdZGBILWUFZTkNVSUlVTFVKSk9ZV1kWGg8SFR0UWUFZT0tIVUpLSU9PT0
	hVSktLVUpCS0tZBg++
X-HM-Tid: 0a967bd8a0e003abkunm1365c5568
X-HM-MType: 1
X-HM-Sender-Digest: e1kMHhlZQR0aFwgeV1kSHx4VD1lBWUc6NBQ6Pww6TjJOETRNDxE#KTMw
	LDMwFBNVSlVKTE9OQ0hPTklPS05DVTMWGhIXVRgTGhQCElUYEx4VOwkUGBBWGBMSCwhVGBQWRVlX
	WRILWUFZTkNVSUlVTFVKSk9ZV1kIAVlBQk1PQjcG
DKIM-Signature: a=rsa-sha256;
	b=Mr1+vSMz1G1xqTNpa9kwj4mUF55N7iHA8PK+o9pSC/I2WBm/FAYsSodLTYiHFRwCBB1okowcpMitz98rSEThsGXOaa+RuO8AumPy3m6kGAmsC3+BBkFCDXBpfNCMu4wyOfZ9bnTvuWThnZqxLVUJqZELTNjHjU4YfN8bscfoBik=; s=default; c=relaxed/relaxed; d=rock-chips.com; v=1;
	bh=NL7rXic5Deq/XuNvQqdkSaO2B07wh3fSCUtIWJkyaKo=;
	h=date:mime-version:subject:message-id:from;
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250428_030208_380686_F414CA19 
X-CRM114-Status: GOOD (  16.59  )
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

On 2025/4/28 16:19, Quentin Schulz wrote:
> Hi Chaoyi,
>
> On 4/27/25 11:42 AM, Chaoyi Chen wrote:
>> From: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>>
>> General feature for rk3399 industry evaluation board:
>> - Rockchip RK3399
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
>
> Are there publicly available schematics by any chance?

Sorry, there is no publicly available information at present.


>
>> Tested with HDMI/GPU/USB2.0/USB3.0/Ethernet/TF card/emmc.
>>
>> Signed-off-by: Chaoyi Chen <chaoyi.chen@rock-chips.com>
>> ---
>>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>>   .../boot/dts/rockchip/rk3399-evb-ind.dts      | 222 ++++++++++++++++++
>>   2 files changed, 223 insertions(+)
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
>> index 000000000000..a995d4ff202d
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/rockchip/rk3399-evb-ind.dts
>> @@ -0,0 +1,222 @@
>> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
>> +/*
>> + * Copyright (c) 2025 Rockchip Electronics Co., Ltd.
>> + */
>> +
>> +/dts-v1/;
>> +#include "rk3399-base.dtsi"
>> +
>> +/ {
>> +    model = "Rockchip RK3399 EVB IND LPDDR4 Board";
>> +    compatible = "rockchip,rk3399-evb-ind", "rockchip,rk3399";
>> +
>> +    aliases {
>> +        ethernet0 = &gmac;
>> +        mmc0 = &sdhci;
>> +        mmc1 = &sdmmc;
>> +    };
>> +
>> +    chosen {
>> +        stdout-path = "serial2:1500000n8";
>> +    };
>> +
>> +    clkin_gmac: external-gmac-clock {
>> +        compatible = "fixed-clock";
>> +        clock-frequency = <125000000>;
>> +        clock-output-names = "clkin_gmac";
>> +        #clock-cells = <0>;
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
>> +
>> +    vcc_phy: regulator-vcc-phy {
>> +        compatible = "regulator-fixed";
>> +        regulator-always-on;
>> +        regulator-boot-on;
>> +        regulator-name = "vcc_phy";
>> +    };
>> +};
>> +
>> +&emmc_phy {
>> +    status = "okay";
>> +};
>> +
>> +&gmac {
>> +    assigned-clocks = <&cru SCLK_RMII_SRC>;
>> +    assigned-clock-parents = <&clkin_gmac>;
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&rgmii_pins>;
>> +    clock_in_out = "input";
>> +    phy-supply = <&vcc_phy>;
>> +    phy-mode = "rgmii";
>> +    snps,reset-gpio = <&gpio3 RK_PB7 GPIO_ACTIVE_LOW>;
>> +    snps,reset-active-low;
>> +    snps,reset-delays-us = <0 10000 150000>;
>> +    tx_delay = <0x22>;
>> +    rx_delay = <0x23>;
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
>> +&hdmi_in_vopl {
>> +    status = "disabled";
>> +};
>> +
>
> Why disabled?
Will fix this on v2.
>
>> +&hdmi_sound {
>> +    status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +    clock-frequency = <400000>;
>> +    i2c-scl-falling-time-ns = <4>;
>> +    i2c-scl-rising-time-ns = <168>;
>> +    status = "okay";
>> +
>> +    vdd_gpu: tcs4526@10 {
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
> No RK80x PMIC on this board?

It has a RK809 PMIC on this board.  I will add this on v2.


>
>> +    };
>> +};
>> +
>
> Missing io_domains here no? I guess it'll rely on the addition of the 
> RK80x PMIC for this to work?

Yes, I will add this on v2.


>
>> +&sdmmc {
>> +    bus-width = <4>;
>> +    cap-mmc-highspeed;
>> +    cap-sd-highspeed;
>> +    cd-gpios = <&gpio0 RK_PA7 GPIO_ACTIVE_LOW>;
>> +    disable-wp;
>> +    max-frequency = <150000000>;
>
> It's already defaulting to that frequency in rk3399-base.dtsi so no 
> need to duplicate the info here.
Will fix this on v2.
>
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&sdmmc_clk &sdmmc_cmd &sdmmc_bus4>;
>> +    status = "okay";
>> +};
>> +
>> +&sdhci {
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
>> +    pmic {
>> +        vsel2_gpio: vsel2-gpio {
>> +            rockchip,pins = <1 RK_PB6 RK_FUNC_GPIO &pcfg_pull_down>;
>> +        };
>> +    };
>> +};
>> +
>> +&vopb {
>> +    status = "okay";
>> +};
>> +
>> +&vopb_mmu {
>> +    status = "okay";
>> +};
>
> Why no vopl?
Will enable vopl in v2.
>
> Cheers,
> Quentin
>
>




