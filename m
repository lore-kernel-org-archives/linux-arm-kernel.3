Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 821BDD116F3
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  3 Dec 2025 06:54:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:References:Cc:To:From:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=3EFi8QJE6ykJM2+FrRlx9YM4l+1GhAygSunectwPOFM=; b=a0FqKI2tTBqw8/oEF900I6TJyo
	29pc7TK8omdIP1H9g18Sn7m+YoMSeyDkmNdGySof6PGt+zA25vyUafkeKLTNwffA2cPK0FcyUidSR
	mPTj30XXdv++PIpgDQTv8UsvNg7aig1927PaKmT6xBWDXzp4dQQYlTIkG1CZKK96CggsXgaEKrKaf
	ctL+AgG60I2yKxKrcq793G6fvBNoxsBx620njIWc9XELO6V5I8KwQTBgwIlXMHdmQjJxm00VuI9z5
	3HB49TeC+jZkvIjGxAdjaHcYOI12cCCENDbLyMFWx62Vpu5OKc0BmiNwIR4ouGkk9Jcbxx1nzaEWa
	bu4H7GnA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQglK-00000006Dcv-2lpe;
	Wed, 03 Dec 2025 06:54:54 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vQglI-00000006DcB-0t53;
	Wed, 03 Dec 2025 06:54:53 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1764744888;
	bh=tgwAV+O4ndnMswcxaqqTQKTydOqpu8NAv26VnKx68oE=;
	h=Date:Subject:From:To:Cc:References:In-Reply-To:From;
	b=JsRj50u7OE6lfcatoc60NHMNO0BFb3nAwBcuOJmRE8YoeLxylgx0876UJAZEDGtxY
	 HyHXc2kNyPnl+tZg90OQv0KAB433m4sLzvynM/D2EwFjdTA3m/YrnEQII1nMiou1B4
	 /zMXNXDIK0fantHlhrN65RwKbGPRdwxhBlseioLQy7yCJldqI21n5VqndVT62vuSmR
	 ecb3IJfAXzWFMQ1PIDV6eg6OSZgPqPzXmESBTDAxnx6O2fFX1aHFzfw4r3/atnpxgU
	 jc9V92yWfW7HZj9Q0rccv45GWeO3EbrZv7Wy2ePtQqNpE6Y/E49kDONCyjvcjSTTfQ
	 q/wf7dEU/16Ag==
Received: from [192.168.1.100] (2-237-20-237.ip236.fastwebnet.it [2.237.20.237])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature RSA-PSS (4096 bits))
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id CB3CC17E0330;
	Wed,  3 Dec 2025 07:54:47 +0100 (CET)
Message-ID: <0b397409-bc6c-4d40-8dba-1d028b51de32@collabora.com>
Date: Wed, 3 Dec 2025 07:54:47 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v4 3/4] arm64: dts: mediatek: add device tree for Tungsten
 510 board
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
To: Gary Bisson <bisson.gary@gmail.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>,
 Sean Wang <sean.wang@mediatek.com>
Cc: devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
References: <20251202-review-v4-0-93f5cd2a0d4a@gmail.com>
 <20251202-review-v4-3-93f5cd2a0d4a@gmail.com>
 <e9edd5f2-c0ff-48fa-baf9-659dd0073e3d@collabora.com>
Content-Language: en-US
In-Reply-To: <e9edd5f2-c0ff-48fa-baf9-659dd0073e3d@collabora.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251202_225452_582758_B37DFBBF 
X-CRM114-Status: GOOD (  18.72  )
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

Il 03/12/25 07:50, AngeloGioacchino Del Regno ha scritto:
> Il 02/12/25 23:08, Gary Bisson ha scritto:
>> Add device tree to support Ezurio Tungsten 510 (MT8370) SMARC SOM [1] +
>> Universal SMARC carrier board [2].
>> It includes support for the MIPI-DSI BD070LIC3 display which uses the
>> Tianma TM070JDHG30 panel + TI SN65DSI84 MIPI-DSI to LVDS bridge [3].
>>
>> [1] https://www.ezurio.com/product/tungsten510-smarc
>> [2] https://www.ezurio.com/system-on-module/accessories/universal-smarc-carrier
>> [3] https://www.ezurio.com/product/bd070lic3-7-touchscreen-display
>>
>> Signed-off-by: Gary Bisson <bisson.gary@gmail.com>
>>
> 
> Hello!
> 
> Thanks for the patch, that's mostly good. Though, there are a few comments, please
> check below.
> 
>> ---
>> Changes in v2:
>> - Updated nodes to be generic (pmic, i2c, usb-typec)
>> Changed in v3:
>> - None
>> Changed in v4:
>> - Fixed remaining DTB warnings
>> ---
>>   arch/arm64/boot/dts/mediatek/Makefile              |    1 +
>>   .../boot/dts/mediatek/mt8370-tungsten-smarc.dts    |   14 +
>>   .../boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi   | 1510 ++++++++++++++++++++
>>   3 files changed, 1525 insertions(+)
>>
>> diff --git a/arch/arm64/boot/dts/mediatek/Makefile b/arch/arm64/boot/dts/ 
>> mediatek/Makefile
>> index a4df4c21399e..30d169a31b10 100644
>> --- a/arch/arm64/boot/dts/mediatek/Makefile
>> +++ b/arch/arm64/boot/dts/mediatek/Makefile
>> @@ -99,6 +99,7 @@ dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-demo.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8195-evb.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8365-evk.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-genio-510-evk.dtb
>> +dtb-$(CONFIG_ARCH_MEDIATEK) += mt8370-tungsten-smarc.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-genio-1200-evk.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8390-genio-700-evk.dtb
>>   dtb-$(CONFIG_ARCH_MEDIATEK) += mt8395-kontron-3-5-sbc-i1200.dtb
>> diff --git a/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts b/arch/arm64/ 
>> boot/dts/mediatek/mt8370-tungsten-smarc.dts
>> new file mode 100644
>> index 000000000000..d713ef77df3a
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt8370-tungsten-smarc.dts
>> @@ -0,0 +1,14 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2025 Ezurio LLC
>> + * Author: Gary Bisson <bisson.gary@gmail.com>
>> + */
>> +/dts-v1/;
>> +#include "mt8370.dtsi"
>> +#include "mt83x0-tungsten-smarc.dtsi"
>> +
>> +/ {
>> +    model = "Ezurio Tungsten510 SMARC (MT8370)";
>> +    compatible = "ezurio,mt8370-tungsten-smarc", "mediatek,mt8370",
>> +             "mediatek,mt8188";
>> +};
>> diff --git a/arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi b/arch/ 
>> arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi
>> new file mode 100644
>> index 000000000000..d71148d78781
>> --- /dev/null
>> +++ b/arch/arm64/boot/dts/mediatek/mt83x0-tungsten-smarc.dtsi

Sorry for the double email, I noticed that right after sending the first one.

Please, no wildcards in names.

Rename this file to mt8390-tungsten-smarc.dtsi.

Cheers!

>> @@ -0,0 +1,1510 @@
>> +// SPDX-License-Identifier: (GPL-2.0 OR MIT)
>> +/*
>> + * Copyright (C) 2025 Ezurio LLC
>> + * Author: Gary Bisson <bisson.gary@gmail.com>
>> + */
>> +
> 
> ..snip..
> 
>> +
>> +&disp_dsi0 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +    status = "okay";
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@0 {
>> +            reg = <0>;
>> +            dsi0_in: endpoint {
>> +                remote-endpoint = <&dither0_out>;
>> +            };
>> +        };
>> +
>> +        port@1 {
>> +            reg = <1>;
>> +            dsi0_out: endpoint {
>> +                remote-endpoint = <&sn65dsi84_bridge_in>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&dither0_in {
>> +    remote-endpoint = <&postmask0_out>;
>> +};
>> +
>> +&dither0_out {
>> +    remote-endpoint = <&dsi0_in>;
>> +};
>> +
>> +&eth {
>> +    phy-mode ="rgmii-id";
>> +    phy-handle = <&ethernet_phy0>;
>> +    pinctrl-names = "default", "sleep";
>> +    pinctrl-0 = <&eth_default_pins>;
>> +    pinctrl-1 = <&eth_sleep_pins>;
>> +    mediatek,mac-wol;
>> +    snps,reset-gpio = <&pio 27 GPIO_ACTIVE_LOW>;
>> +    snps,reset-active-low;
>> +    snps,reset-delays-us = <0 11000 1000>;
>> +    status = "okay";
>> +};
>> +
>> +&eth_mdio {
>> +    ethernet_phy0: ethernet-phy@7 {
>> +        compatible = "ethernet-phy-ieee802.3-c22";
>> +        reg = <0x7>;
>> +        interrupts-extended = <&pio 148 IRQ_TYPE_LEVEL_LOW>;
>> +    };
>> +};
>> +
>> +&gamma0_out {
>> +    remote-endpoint = <&postmask0_in>;
>> +};
>> +
>> +&gpu {
>> +    mali-supply = <&mt6359_vproc2_buck_reg>;
>> +    status = "okay";
>> +};
>> +
>> +&i2c0 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c0_pins>;
>> +    clock-frequency = <100000>;
>> +    status = "okay";
>> +
>> +    i2c-mux@73 {
>> +        compatible = "nxp,pca9546";
>> +        reg = <0x73>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&i2c0_mux_pins>;
>> +        reset-gpios = <&pio 6 GPIO_ACTIVE_LOW>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        i2c_mux_gp_0: i2c@0 {
>> +            clock-frequency = <100000>;
>> +            reg = <0>;
> 
> reg = <0>;
> clock-frequency = ...
> 
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +
>> +        i2c_mux_gp_1: i2c@1 {
>> +            clock-frequency = <100000>;
>> +            reg = <1>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +
>> +        i2c_mux_gp_2: i2c@2 {
>> +            clock-frequency = <100000>;
>> +            reg = <2>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +
>> +        i2c_mux_gp_3: i2c@3 {
>> +            clock-frequency = <100000>;
>> +            reg = <3>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +    };
>> +};
>> +
>> +&i2c1 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c1_pins>;
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +};
>> +
>> +&i2c2 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c2_pins>;
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +
>> +    i2c-mux@73 {
>> +        compatible = "nxp,pca9546";
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&i2c_mux_smarc_lcd_pins>;
>> +        reg = <0x73>;
>> +        reset-gpios = <&pio 5 GPIO_ACTIVE_LOW>;
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        i2c_mux_lcd_0: i2c@0 {
>> +            clock-frequency = <100000>;
>> +            reg = <0>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +
>> +        i2c_mux_lcd_1: i2c@1 {
>> +            clock-frequency = <100000>;
>> +            reg = <1>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +
>> +        i2c_mux_lcd_2: i2c@2 {
>> +            clock-frequency = <100000>;
>> +            reg = <2>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +
>> +        i2c_mux_lcd_3: i2c@3 {
>> +            clock-frequency = <100000>;
>> +            reg = <3>;
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +        };
>> +    };
>> +};
>> +
>> +&i2c3 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c3_pins>;
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +};
>> +
>> +&i2c4 {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&i2c4_pins>;
>> +    clock-frequency = <400000>;
>> +    status = "okay";
>> +};
>> +
>> +&i2c_mux_gp_0 {
>> +    rv3028: rtc@52 {
>> +        compatible = "microcrystal,rv3028";
>> +        reg = <0x52>;
>> +        interrupts-extended = <&pio 42 IRQ_TYPE_LEVEL_LOW>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&rv3028_pins>;
>> +        #clock-cells = <0>;
>> +        wakeup-source;
>> +    };
>> +};
>> +
>> +&i2c_mux_gp_1 {
>> +    usb-typec@60 {
>> +        compatible = "ti,hd3ss3220";
> 
> reg always goes after compatible.
> 
>> +        interrupts-extended = <&pio 45 IRQ_TYPE_LEVEL_LOW>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&hd3ss3220_pins>;
>> +        reg = <0x60>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                hd3ss3220_in_ep: endpoint {
>> +                    remote-endpoint = <&ss_ep>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                hd3ss3220_out_ep: endpoint {
>> +                    remote-endpoint = <&usb_role_switch>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&i2c_mux_gp_2 {
>> +    codec@1a {
> 
> compatible
> reg
> clocks
> gpio-cfg
> 
> supplies
> 
> P.S.: Please read
> https://docs.kernel.org/devicetree/bindings/dts-coding-style.html
> 
>> +        #sound-dai-cells = <0>;
>> +        AVDD-supply = <&reg_1v8>;
>> +        CPVDD-supply = <&reg_1v8>;
>> +        DBVDD-supply = <&reg_3v3>;
>> +        DCVDD-supply = <&reg_1v8>;
>> +        MICVDD-supply = <&reg_3v3>;
>> +        PLLVDD-supply = <&reg_1v8>;
>> +        SPKVDD1-supply = <&reg_5v>;
>> +        SPKVDD2-supply = <&reg_5v>;
>> +        clocks = <&topckgen CLK_TOP_I2SO1>;
>> +        compatible = "wlf,wm8962";
>> +        gpio-cfg = <
>> +            0x0000 /* n/c */
>> +            0x0000 /* gpio2: */
>> +            0x0000 /* gpio3: */
>> +            0x0000 /* n/c */
>> +            0x8081 /* gpio5:HP detect */
>> +            0x8095 /* gpio6:Mic detect */
>> +        >;
>> +        reg = <0x1a>;
>> +    };
>> +};
>> +
>> +&i2c_mux_lcd_2 {
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +
>> +    bridge@2c {
>> +        compatible = "ti,sn65dsi84";
>> +        reg = <0x2c>;
>> +        enable-gpios = <&pio 25 GPIO_ACTIVE_HIGH>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&dsi0_sn65dsi84_pins>;
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +
>> +                sn65dsi84_bridge_in: endpoint {
>> +                    remote-endpoint = <&dsi0_out>;
>> +                    data-lanes = <1 2 3 4>;
>> +                };
>> +            };
>> +
>> +            port@2 {
>> +                reg = <2>;
>> +
>> +                sn65dsi84_bridge_out: endpoint {
>> +                    remote-endpoint = <&dsi0_panel_in>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    touchscren@5d {
>> +        compatible = "goodix,gt911";
>> +        reg = <0x5d>;
>> +        pinctrl-names = "default";
>> +        pinctrl-0 = <&ts_dsi0_goodix_pins>;
>> +        interrupts-extended = <&pio 146 IRQ_TYPE_LEVEL_HIGH>;
>> +        irq-gpios = <&pio 146 GPIO_ACTIVE_HIGH>;
>> +        reset-gpios = <&pio 7 GPIO_ACTIVE_HIGH>;
>> +    };
>> +};
>> +
>> +&mfg0 {
>> +    domain-supply = <&mt6359_vproc2_buck_reg>;
>> +};
>> +
>> +&mfg1 {
>> +    domain-supply = <&mt6359_vsram_others_ldo_reg>;
>> +};
>> +
>> +&mmc0 {
>> +    status = "okay";
>> +    pinctrl-names = "default", "state_uhs";
>> +    pinctrl-0 = <&mmc0_default_pins>;
>> +    pinctrl-1 = <&mmc0_uhs_pins>;
>> +    bus-width = <8>;
>> +    max-frequency = <200000000>;
>> +    cap-mmc-highspeed;
>> +    cap-mmc-hw-reset;
>> +    mmc-hs200-1_8v;
>> +    mmc-hs400-1_8v;
>> +    supports-cqe;
>> +    cap-mmc-hw-reset;
> 
> You added cap-mmc-hw-reset twice.
> 
>> +    no-sdio;
>> +    no-sd;
>> +    hs400-ds-delay = <0x1481b>;
>> +    vmmc-supply = <&mt6359_vemc_1_ldo_reg>;
>> +    vqmmc-supply = <&mt6359_vufs_ldo_reg>;
>> +    non-removable;
> 
> Also, please reorder by name:
> 
> bus-width ...
> cap-mmc-highspeed;
> cap-mmc-hw-reset;
> hs400-ds-delay....
> max-frequency ....
> mmc-hs200-1_8v;
> mmc-hs400-1_8v;
> no-sd;
> no-sdio;
> non-removable;
> supports-cqe;
> 
> pinctrl properties
> 
> power supplies
> 
> status
> 
>> +};
>> +
>> +&mmc1 {
>> +    status = "okay";
>> +    pinctrl-names = "default", "state_uhs";
>> +    pinctrl-0 = <&mmc1_default_pins>;
>> +    pinctrl-1 = <&mmc1_uhs_pins>;
>> +    bus-width = <4>;
>> +    max-frequency = <200000000>;
>> +    cap-sd-highspeed;
>> +    sd-uhs-sdr50;
>> +    sd-uhs-sdr104;
>> +    cd-gpios = <&pio 2 GPIO_ACTIVE_LOW>;
>> +    vqmmc-supply = <&mt6359_vsim1_ldo_reg>;
>> +    vmmc-supply = <&sdcard_en_3v3>;
>> +};
>> +
>> +&mmc2 {
>> +    status = "okay";
> 
> status at the end please
> 
>> +    pinctrl-names = "default", "state_uhs", "state_eint";
>> +    pinctrl-0 = <&mmc2_default_pins>;
>> +    pinctrl-1 = <&mmc2_uhs_pins>;
>> +    pinctrl-2 = <&mmc2_eint_pins>;
> 
> Sorry, but I truly hate /delete-property/.
> 
>> +    /delete-property/ interrupts;
>> +    interrupt-names = "msdc", "sdio_wakeup";
>> +    interrupts-extended = <&gic GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>,
>> +                  <&pio 172 IRQ_TYPE_LEVEL_LOW>;
> 
> You're lucky in this case, though, because you're the first user of MMC2! :-)
> 
> The solution here is:
>   - Change the interrupts property in mt8188.dtsi on mmc@1125000 to
>     `interrupts-extended = <&gic GIC_SPI 136 IRQ_TYPE_LEVEL_HIGH 0>;`
>   - Override it here without `/delete-property/ interrupts;`
> 
>> +    bus-width = <4>;
> 
> Please order the properties by name (bar X-supply, Y-pwrseq, status that go at
> the end).
> 
>> +    max-frequency = <200000000>;
>> +    cap-sd-highspeed;
>> +    sd-uhs-sdr104;
>> +    keep-power-in-suspend;
>> +    wakeup-source;
>> +    cap-sdio-irq;
>> +    no-mmc;
>> +    no-sd;
>> +    non-removable;
>> +    vmmc-supply = <&mt6359_vcn33_2_bt_ldo_reg>;
>> +    vqmmc-supply = <&mt6359_vcn18_ldo_reg>;
>> +    mmc-pwrseq = <&wifi_pwrseq>;
>> +};
>> +
>> +&mipi_tx_config0 {
>> +    status = "okay";
>> +};
>> +
>> +&mt6359codec {
>> +    mediatek,mic-type-0 = <1>;
>> +    mediatek,mic-type-1 = <3>;
> 
> You can drop mic-type-2 and dmic-mode, as the defaults for these are already zero.
> 
>> +    mediatek,mic-type-2 = <0>;
>> +    mediatek,dmic-mode = <0>;
>> +};
>> +
> 
> ..snip..
> 
>> +
>> +&mt6359_vproc2_buck_reg {
>> +    /* The name "vgpu" is required by mtk-regulator-coupler */
>> +    regulator-name = "vgpu";
>> +    regulator-min-microvolt = <550000>;
>> +    regulator-max-microvolt = <800000>;
>> +    regulator-coupled-with = <&mt6359_vsram_others_ldo_reg>;
>> +    regulator-coupled-max-spread = <225000>;
>> +    regulator-always-on;
> 
> You don't need regulator-always-on here.
> 
>> +};
>> +
>> +&mt6359_vs2_buck_reg {
>> +    regulator-min-microvolt = <1600000>;
>> +    regulator-boot-on;
>> +};
>> +
>> +&mt6359_vpu_buck_reg {
>> +    regulator-name = "dvdd_adsp";
> 
> Is that for the MediaTek Audio DSP?
> 
> Thought Genio 500/700 were kind of "special" in having one just for that.
> 
> If so, you have to do this properly and add this to the ADSP power domain as a
> domain-supply, if this effectively enables basic power to the ADSP itself.
> 
> To do so, you must also change drivers/pmdomain/mediatek/mt8188-pm-domains.h and in
> MT8188_POWER_DOMAIN_ADSP you want to change `.caps` to
> 
> .caps = MTK_SCPD_KEEP_DEFAULT_OFF | MTK_SCPD_SRAM_ISO | MTK_SCPD_ACTIVE_WAKEUP |
>      MTK_SCPD_DOMAIN_SUPPLY,
> 
> ...so that you can remove the regulator-always-on property here, and benefit from a
> nice bump in power efficiency (as you stop power leakages like so).
> 
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vrf12_ldo_reg {
>> +    regulator-name = "va12_abb2_pmu";
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vsram_md_ldo_reg {
>> +    regulator-always-on;
>> +};
>> +
>> +&mt6359_vsram_others_ldo_reg {
>> +    /* The name "vsram_gpu" is required by mtk-regulator-coupler */
>> +    regulator-name = "vsram_gpu";
>> +    regulator-min-microvolt = <750000>;
>> +    regulator-max-microvolt = <800000>;
>> +    regulator-coupled-with = <&mt6359_vproc2_buck_reg>;
>> +    regulator-coupled-max-spread = <225000>;
>> +    regulator-always-on;
> 
> You don't need regulator-always-on here.
> 
>> +};
>> +
>> +&mt6359_vsim1_ldo_reg {
>> +    regulator-name = "vsim1_pmu";
>> +    regulator-max-microvolt = <1800000>;
>> +    regulator-enable-ramp-delay = <480>;
>> +};
>> +
>> +&mt6359_vufs_ldo_reg {
>> +    regulator-name = "vufs18_pmu";
>> +    regulator-always-on;
>> +};
>> +
>> +&ovl0_in {
>> +    remote-endpoint = <&vdosys0_ep_main>;
>> +};
>> +
>> +&pcie {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&pcie_default_pins>;
>> +    status = "okay";
>> +};
>> +
>> +&pciephy {
>> +    status = "okay";
>> +};
>> +
>> +&pmic {
>> +    interrupt-parent = <&pio>;
>> +    interrupts = <222 IRQ_TYPE_LEVEL_HIGH>;
> 
> Instead of interrupt-parent and interrupts, you can do:
> 
> interrupts-extended = <&pio 222 IRQ_TYPE_LEVEL_HIGH>;
> 
>> +
>> +    keys {
>> +        compatible = "mediatek,mt6359-keys";
>> +        mediatek,long-press-mode = <1>;
>> +        power-off-time-sec = <0>;
>> +
>> +        power-key {
>> +            linux,keycodes = <116>;
> 
> At the top of the file, properly ordered:
> #include <dt-bindings/input/linux-event-codes.h>
> 
> ...then, here:
> linux,keycodes = <KEY_POWER>;
> 
>> +            wakeup-source;
>> +        };
>> +    };
>> +};
>> +
>> +&postmask0_in {
>> +    remote-endpoint = <&gamma0_out>;
>> +};
>> +
>> +&postmask0_out {
>> +    remote-endpoint = <&dither0_in>;
>> +};
>> +
>> +&scp_cluster {
>> +    status = "okay";
>> +};
>> +
>> +&scp_c0 {
>> +    firmware-name = "mediatek/mt8188/scp.img";
> 
> You don't need (and can't have) firmware-name upstream: drop it.
> 
>> +    memory-region = <&scp_mem>;
>> +    status = "okay";
>> +};
>> +
>> +&spi0 {
>> +    pinctrl-0 = <&spi0_pins>;
>> +    pinctrl-names = "default";
>> +    mediatek,pad-select = <0>;
> 
> vendor properties always at the end, before status = "okay";
> 
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
> 
> ...but anyway, #address-cells, #size-cells are already declared in mt8188.dtsi and
> they even have the same values that you're assigning here. Drop those.
> 
>> +    status = "okay";
>> +};
>> +
>> +&spi1 {
>> +    pinctrl-0 = <&spi1_pins>;
>> +    pinctrl-names = "default";
>> +    mediatek,pad-select = <0>;
> 
> same comments apply here as well.
> 
>> +    #address-cells = <1>;
>> +    #size-cells = <0>;
>> +    status = "okay";
>> +};
>> +
> 
> ..snip..
> 
>> +&uart0 {
>> +    pinctrl-0 = <&uart0_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
>> +&uart1 {
>> +    pinctrl-0 = <&uart1_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
>> +&uart2 {
>> +    pinctrl-0 = <&uart2_pins>;
>> +    pinctrl-names = "default";
>> +    status = "okay";
>> +};
>> +
>> +&ssusb0 {
> 
> Please reorder:
> 
> dr_mode
> maximum-speed
> usb-role-switch;
> wakeup-source;
> pinctrl-0
> pinctrl-names
> vusb33-supply
> status
> 
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&usbotg_pins>;
>> +    maximum-speed = "high-speed";
>> +    usb-role-switch;
>> +    dr_mode = "otg";
>> +    vusb33-supply = <&mt6359_vusb_ldo_reg>;
>> +    wakeup-source;
>> +    status = "okay";
>> +
>> +    connector {
>> +        compatible = "usb-c-connector";
>> +        label = "USB-C";
>> +        data-role = "dual";
>> +
>> +        ports {
>> +            #address-cells = <1>;
>> +            #size-cells = <0>;
>> +
>> +            port@0 {
>> +                reg = <0>;
>> +                hs_ep: endpoint {
>> +                    remote-endpoint = <&usb_hs_ep>;
>> +                };
>> +            };
>> +
>> +            port@1 {
>> +                reg = <1>;
>> +                ss_ep: endpoint {
>> +                    remote-endpoint = <&hd3ss3220_in_ep>;
>> +                };
>> +            };
>> +        };
>> +    };
>> +
>> +    ports {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        port@0 {
>> +            reg = <0>;
>> +            usb_hs_ep: endpoint {
>> +                remote-endpoint = <&hs_ep>;
>> +            };
>> +        };
>> +
>> +        port@1 {
>> +            reg = <1>;
>> +            usb_role_switch: endpoint {
>> +                remote-endpoint = <&hd3ss3220_out_ep>;
>> +            };
>> +        };
>> +    };
>> +};
>> +
>> +&u2port0 {
>> +    status = "okay";
>> +};
>> +
>> +&u3phy0 {
>> +    status = "okay";
>> +};
>> +
>> +&xhci0 {
>> +    vbus-supply = <&usb_p0_vbus>;
>> +    vusb33-supply = <&mt6359_vusb_ldo_reg>;
>> +    status = "okay";
>> +};
>> +
>> +&ssusb1 {
> 
> Please reorder:
> 
> dr_mode
> maximum-speed
> wakeup-source
> pinctrl-0
> pinctrl-names
> vusb33-supply
> status
> 
>> +    pinctrl-0 = <&usb1_pins>;
>> +    pinctrl-names = "default";
>> +    vusb33-supply = <&mt6359_vusb_ldo_reg>;
>> +    dr_mode = "host";
>> +    wakeup-source;
>> +    status = "okay";
>> +};
>> +
>> +&u2port1 {
>> +    status = "okay";
>> +};
>> +
>> +&u3port1 {
>> +    status = "okay";
>> +};
>> +
>> +&u3phy1 {
>> +    status = "okay";
>> +};
>> +
>> +&xhci1 {
>> +    vbus-supply = <&usb_p1_vbus>;
>> +    vusb33-supply = <&mt6359_vusb_ldo_reg>;
>> +    status = "okay";
>> +};
>> +
>> +&ssusb2 {
> 
> Please reorder:
> 
> dr_mode
> maximum-speed
> wakeup-source
> vusb33-supply
> status
> 
>> +    maximum-speed = "high-speed";
>> +    dr_mode = "host";
>> +    vusb33-supply = <&mt6359_vusb_ldo_reg>;
>> +    status = "okay";
>> +    wakeup-source;
>> +};
>> +
> ..snip..
> 
>> +&vdosys0 {
>> +    port {
>> +        #address-cells = <1>;
>> +        #size-cells = <0>;
>> +
>> +        vdosys0_ep_main: endpoint@0 {
>> +            reg = <0>;
>> +            remote-endpoint = <&ovl0_in>;
>> +        };
>> +    };
>> +};
>> +
>> +&watchdog {
>> +    pinctrl-names = "default";
>> +    pinctrl-0 = <&watchdog_pins>;
>> +};
>> +
>> +&pio {
>> +    audio_pins: audio-pins {
>> +        pins-aud-pmic {
>> +            pinmux = <
>> +                PINMUX_GPIO101__FUNC_O_AUD_CLK_MOSI
>> +                PINMUX_GPIO102__FUNC_O_AUD_SYNC_MOSI
>> +                PINMUX_GPIO103__FUNC_O_AUD_DAT_MOSI0
>> +                PINMUX_GPIO104__FUNC_O_AUD_DAT_MOSI1
>> +                PINMUX_GPIO105__FUNC_I0_AUD_DAT_MISO0
>> +                PINMUX_GPIO106__FUNC_I0_AUD_DAT_MISO1
>> +            >;
> 
> You don't need the extra lines...
> 
>              pinmux = <PINMUX_GPIO101__FUNC_O_AUD_CLK_MOSI
>                    PINMUX_GPIO102__FUNC_O_AUD_SYNC_MOSI
>                    PINMUX_GPIO103__FUNC_O_AUD_DAT_MOSI0
>                    PINMUX_GPIO104__FUNC_O_AUD_DAT_MOSI1
>                    PINMUX_GPIO105__FUNC_I0_AUD_DAT_MISO0
>                    PINMUX_GPIO106__FUNC_I0_AUD_DAT_MISO1>;
> 
> here and everywhere else please :-)
> 
>> +        };
>> +
>> +        pins-pcm-wifi {
>> +            pinmux = <
>> +                PINMUX_GPIO121__FUNC_B0_PCM_CLK
>> +                PINMUX_GPIO122__FUNC_B0_PCM_SYNC
>> +                PINMUX_GPIO123__FUNC_O_PCM_DO
>> +                PINMUX_GPIO124__FUNC_I0_PCM_DI
>> +            >;
>> +        };
>> +
>> +        pins-i2s {
>> +            pinmux = <
>> +                PINMUX_GPIO119__FUNC_O_I2SO1_MCK
>> +                PINMUX_GPIO112__FUNC_O_I2SO1_WS
>> +                PINMUX_GPIO120__FUNC_O_I2SO1_BCK
>> +                PINMUX_GPIO113__FUNC_O_I2SO1_D0
>> +                PINMUX_GPIO110__FUNC_I0_I2SIN_D0
>> +            >;
>> +        };
>> +    };
>> +
>> +    disp_pwm0_pins: disp-pwm0-pins {
>> +        pins {
>> +            pinmux = <PINMUX_GPIO29__FUNC_O_DISP_PWM0>;
>> +            bias-pull-down;
>> +        };
>> +    };
>> +
>> +    dsi0_sn65dsi84_pins: dsi0-sn65dsi84-pins {
>> +        pins-irq {
>> +            pinmux = <PINMUX_GPIO128__FUNC_B_GPIO128>;
>> +            bias-pull-down;
>> +            input-enable;
>> +        };
>> +
>> +        pins-enable {
>> +            pinmux = <PINMUX_GPIO25__FUNC_B_GPIO25>;
>> +            bias-pull-down;
>> +        };
>> +    };
>> +
>> +    eth_default_pins: eth-default-pins {
>> +        pins-txd {
>> +            pinmux = <PINMUX_GPIO131__FUNC_O_GBE_TXD3>,
>> +                 <PINMUX_GPIO132__FUNC_O_GBE_TXD2>,
>> +                 <PINMUX_GPIO133__FUNC_O_GBE_TXD1>,
>> +                 <PINMUX_GPIO134__FUNC_O_GBE_TXD0>;
>> +            drive-strength = <MTK_DRIVE_8mA>;
> 
> Please don't use the MTK_DRIVE_x macros, we are in the process of removing them.
> 
> All those macros are defining the .. same number that you can read in the macro
> itself; as in:
> 
> MTK_DRIVE_(n)mA = n -> MTK_DRIVE_8mA = 8
> 
> So, remove all of them and use numbers directly.
> In this specific case it is `drive-strength = <8>;` - please do this here and
> everywhere else.
> 
> 
>> +        };
>> +        pins-cc {
>> +            pinmux = <PINMUX_GPIO139__FUNC_B0_GBE_TXC>,
>> +                 <PINMUX_GPIO142__FUNC_O_GBE_TXEN>,
>> +                 <PINMUX_GPIO141__FUNC_I0_GBE_RXDV>;
>> +            drive-strength = <MTK_DRIVE_8mA>;
>> +        };
>> +        pins-rxd {
>> +            pinmux = <PINMUX_GPIO135__FUNC_I0_GBE_RXD3>,
>> +                 <PINMUX_GPIO136__FUNC_I0_GBE_RXD2>,
>> +                 <PINMUX_GPIO137__FUNC_I0_GBE_RXD1>,
>> +                 <PINMUX_GPIO138__FUNC_I0_GBE_RXD0>,
>> +                 <PINMUX_GPIO140__FUNC_I0_GBE_RXC>;
>> +            drive-strength = <MTK_DRIVE_8mA>;
>> +            bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
>> +        };
>> +        pins-mdio {
>> +            pinmux = <PINMUX_GPIO143__FUNC_O_GBE_MDC>,
>> +                 <PINMUX_GPIO144__FUNC_B1_GBE_MDIO>;
>> +            drive-strength = <MTK_DRIVE_8mA>;
>> +            input-enable;
>> +        };
>> +        pins-power {
>> +            pinmux = <PINMUX_GPIO27__FUNC_B_GPIO27>; /* GP_EQOS_RESET */
>> +            output-high;
>> +        };
>> +        pins-intr {
>> +            pinmux = <PINMUX_GPIO148__FUNC_B_GPIO148>; /* GPIRQ_EQOS_PHY */
>> +            bias-pull-up = <MTK_PUPD_SET_R1R0_10>;
>> +            input-enable;
>> +        };
>> +    };
>> +
> 
> Cheers,
> Angelo


