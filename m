Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 93811CAC582
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 17:17:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v/rddP+tdCcEtm7DeNGo+eAsu5QxKUyw2PNqwrOGlvw=; b=kjVu/AwoJqRIMR2JUeX1Sf1SDU
	P1QJQecoCCk/dQYTfEH+Wds3HpqBZqz6SktdjdAVyN/DhNv1TfpwEo54v9jw3Nl2GU1niPGOr66fu
	Pnx5XgA/TQyd/4m71xkAogTJHbj4BEvUf60lGTkCeSsrgJfzyGzuPF4SuXgbouJpSdcwBbrAXhJen
	hOp+GzxCTdbFsl79ZB1PtJpEEG/yFxdDITkAkZwXikfnIbRmJI+QW7HbJryONt5/6QVnVd8NFTmHn
	Fq0kOe2VjvRiRF4GEEJ+mQnHVDL7usJI1YFiBDEdiuvE9RO7AFoMaMgnlsBhHy3VxHbxNQ4oXThF6
	epHFoPtg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw1y8-00000008r9x-0wIj;
	Tue, 09 Sep 2025 17:17:24 +0000
Received: from smtpbguseast3.qq.com ([54.243.244.52])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvxU2-000000074fj-1ZGm;
	Tue, 09 Sep 2025 12:30:04 +0000
X-QQ-mid: zesmtpip2t1757420941t79943ff4
X-QQ-Originating-IP: RKBBz/qmYYGaSanPg4a2CVN0ECXgc4JJML1w9U/i8TM=
Received: from [IPV6:240f:10b:7440:1:dc35:ccd3 ( [localhost])
	by bizesmtp.qq.com (ESMTP) with 
	id ; Tue, 09 Sep 2025 20:28:57 +0800 (CST)
X-QQ-SSF: 0000000000000000000000000000000
X-QQ-GoodBg: 0
X-BIZMAIL-ID: 12332205339878697842
Message-ID: <B055BC95C67D129C+d7a2ff39-8367-48cf-8697-f12fd9f885a4@radxa.com>
Date: Tue, 9 Sep 2025 21:28:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 3/3] arm64: dts: rockchip: Add Radxa E24C
To: Jonas Karlman <jonas@kwiboo.se>, Heiko Stuebner <heiko@sntech.de>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>
Cc: Yao Zi <ziyao@disroot.org>, Chukun Pan <amadeus@jmu.edu.cn>,
 devicetree@vger.kernel.org, linux-rockchip@lists.infradead.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20250727144409.327740-1-jonas@kwiboo.se>
 <20250727144409.327740-4-jonas@kwiboo.se>
Content-Language: en-US
From: FUKAUMI Naoki <naoki@radxa.com>
In-Reply-To: <20250727144409.327740-4-jonas@kwiboo.se>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-QQ-SENDSIZE: 520
Feedback-ID: zesmtpip:radxa.com:qybglogicsvrgz:qybglogicsvrgz8a-1
X-QQ-XMAILINFO: MACXe2l6e7j9v35cxXlys+2ZFxeV/hmj07TE5OTy1dk/3t05JcX7Nn3t
	fEauqVXwNDocF/1HGKvCq2yFwjftCfuZkw5SapEVro8FRj/Wb5NPp1ERcPbFAhVD4Q/i7nk
	KnFnXjQ8pr2fYA+Qt4BhAXFt6l9vWsa6k47w6pet6ZkCg9oUn/REwLlfssArIs9nnNvG2Ip
	zlNe4CK9HWnS8tW4p05HCqwhTMtYeWZS6fs4SStSlW8CDZabt0zE42cQM/MRujAC8mIAcky
	XoSllRyQADQqgfVWfPSNpjFtUwO0qbpi2DSUxOykcTUUxTrdh5ilckvpZhWp3l/6PMJl/06
	V86Ew1fegjmeymEMpoyECvAuaCroQytTwsdnntmE8sDw/kDcMCeqF+uL6SrPRln65Eqk0Rs
	5OQbeHTHCxnOhiFK2HrciMIFtkdvRtQJyT5PCC6UupNr2ohgfNby393eZd8nRAw1FnZXXoy
	m3G8eQPzUhVEd1WPgsMlg13N95I4SyrxCJLQY5fSK9LIr2T6lvH9UcFFgyZukh/S1KStch7
	RfEnIdTOlPdxs3J1Pj698A2DIQaYJknOupcoEeaHiHNRt3HBplteUSQF9+4DXGi9aWbJKoY
	uyeAavYmXFRHkaW1pvD4pOPhgu7pLoerqQrcvVq6qlD6RZhQVxkPx19vyZEi0xC9OiPz7TF
	ziYBH+9D6qBMxoaFgl/f95tA/VhONq1vzShZnxLhc3HdC9WHERhJBUxc0Q38NRIVPqlT8qY
	tk6qfz4qGoexliwcx45MgLvGfobXJP9VSzn3qofDck0FWZs7IwJwbPCMC6H1or7vsdu7U6I
	APpJAyZ9YtsQykepW907WEF0Q8ltP15zEKXReYNzkvAbzWwkl7isGhx2Ari+5vlvOFKtO1o
	AU6Vwju8ifcpeN2Lwn02at8oxmDAsdT1rNmSZJCExolRtWZMm498V5pOF8yyBppeFOhhc7b
	FxNq+PScortXteAUM71wrfqH7eum3xx50BG9ba9QkyNwNrzrma1zgKyp3
X-QQ-XMRINFO: OD9hHCdaPRBwq3WW+NvGbIU=
X-QQ-RECHKSPAM: 0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_053003_004080_41C15128 
X-CRM114-Status: GOOD (  14.67  )
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

Hi Jonas,

On 7/27/25 23:44, Jonas Karlman wrote:
> The Radxa E24C is a compact, high-performance network computer
> developed by Radxa, based on the Rockchip RK3528A SoC.
> 
> Add initial device tree for the Radxa E24C.
> 
> Signed-off-by: Jonas Karlman <jonas@kwiboo.se>
> Reviewed-by: Andrew Lunn <andrew@lunn.ch>
> ---
> Schematics: https://dl.radxa.com/e/e24c/docs/radxa_e24c_v1200_schematic.pdf
> ---
>   arch/arm64/boot/dts/rockchip/Makefile         |   1 +
>   .../boot/dts/rockchip/rk3528-radxa-e24c.dts   | 519 ++++++++++++++++++
>   2 files changed, 520 insertions(+)
>   create mode 100644 arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
> 
> diff --git a/arch/arm64/boot/dts/rockchip/Makefile b/arch/arm64/boot/dts/rockchip/Makefile
> index 0662fcf00628..dc62fd5305be 100644
> --- a/arch/arm64/boot/dts/rockchip/Makefile
> +++ b/arch/arm64/boot/dts/rockchip/Makefile
> @@ -92,6 +92,7 @@ dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3399pro-rock-pi-n10.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-armsom-sige1.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-nanopi-zero2.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e20c.dtb
> +dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-radxa-e24c.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2a.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3528-rock-2f.dtb
>   dtb-$(CONFIG_ARCH_ROCKCHIP) += rk3562-evb2-v10.dtb
> diff --git a/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
> new file mode 100644
> index 000000000000..225f2b0c5339
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3528-radxa-e24c.dts
> @@ -0,0 +1,519 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include "rk3528.dtsi"
> +
> +/ {
> +	model = "Radxa E24C";
> +	compatible = "radxa,e24c", "rockchip,rk3528";
> +
> +	aliases {
> +		ethernet0 = &gmac1;
> +		i2c0 = &i2c0;
> +		i2c1 = &i2c1;
> +		i2c5 = &i2c5;
> +		mmc0 = &sdhci;
> +		mmc1 = &sdmmc;
> +		rtc0 = &hym8563;
> +		rtc1 = &rk805;
> +		serial0 = &uart0;
> +	};
> +
> +	chosen {
> +		stdout-path = "serial0:1500000n8";
> +	};
> +
> +	adc-keys {
> +		compatible = "adc-keys";
> +		io-channels = <&saradc 0>;
> +		io-channel-names = "buttons";
> +		keyup-threshold-microvolt = <1800000>;
> +		poll-interval = <100>;
> +
> +		button-maskrom {
> +			label = "MASKROM";
> +			linux,code = <KEY_SETUP>;
> +			press-threshold-microvolt = <0>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio0_a0_user>;
> +
> +		button-user {
> +			gpios = <&gpio0 RK_PA0 GPIO_ACTIVE_LOW>;
> +			label = "USER";
> +			linux,code = <BTN_1>;

I prefer to assign BTN_0 to the 1st button :)

Best regards,

--
FUKAUMI Naoki
Radxa Computer (Shenzhen) Co., Ltd.

> +			wakeup-source;
> +		};
> +	};
> +
> +	leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "on";
> +			function = LED_FUNCTION_HEARTBEAT;
> +			gpios = <&gpio4 RK_PA1 GPIO_ACTIVE_LOW>;
> +			label = "SYS";
> +			linux,default-trigger = "heartbeat";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&sys_led_g>;
> +		};
> +
> +		led-1 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "off";
> +			function = LED_FUNCTION_WAN;
> +			gpios = <&gpio4 RK_PA0 GPIO_ACTIVE_HIGH>;
> +			label = "WAN";
> +			linux,default-trigger = "netdev";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&wan_led_g>;
> +		};
> +
> +		led-2 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "off";
> +			function = LED_FUNCTION_LAN;
> +			gpios = <&gpio1 RK_PB0 GPIO_ACTIVE_HIGH>;
> +			label = "LAN1";
> +			linux,default-trigger = "netdev";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lan1_led_g>;
> +		};
> +
> +		led-3 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "off";
> +			function = LED_FUNCTION_LAN;
> +			gpios = <&gpio1 RK_PB1 GPIO_ACTIVE_HIGH>;
> +			label = "LAN2";
> +			linux,default-trigger = "netdev";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lan2_led_g>;
> +		};
> +
> +		led-4 {
> +			color = <LED_COLOR_ID_GREEN>;
> +			default-state = "off";
> +			function = LED_FUNCTION_LAN;
> +			gpios = <&gpio1 RK_PB4 GPIO_ACTIVE_HIGH>;
> +			label = "LAN3";
> +			linux,default-trigger = "netdev";
> +			pinctrl-names = "default";
> +			pinctrl-0 = <&lan3_led_g>;
> +		};
> +	};
> +
> +	vcc3v3_mkey: regulator-3v3-vcc-mkey {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio4 RK_PC6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&mkey_pwr_en>;
> +		regulator-name = "vcc3v3_mkey";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	vcc5v0_sys: regulator-5v0-vcc-sys {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc_12v>;
> +	};
> +
> +	vcc5v0_usb20: regulator-5v0-vcc-usb20 {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio1 RK_PA3 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_host_en>;
> +		regulator-name = "vcc5v0_usb20";
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	vcc_12v: regulator-12v0-vcc {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_12v";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <12000000>;
> +		regulator-max-microvolt = <12000000>;
> +	};
> +
> +	avddl_1v1: avddh_3v3: avdd_rtl8367rb: regulator-avdd-rtl8367rb {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		gpios = <&gpio1 RK_PC3 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&gpio_8367_en>;
> +		regulator-name = "avdd_rtl8367rb";
> +		startup-delay-us = <10000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	vccio_sd: regulator-vccio-sd {
> +		compatible = "regulator-gpio";
> +		gpios = <&gpio4 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&sdmmc_vol_ctrl_h>;
> +		regulator-name = "vccio_sd";
> +		regulator-min-microvolt = <1800000>;
> +		regulator-max-microvolt = <3300000>;
> +		states = <1800000 0x0>, <3300000 0x1>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +};
> +
> +&cpu0 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu1 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu2 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&cpu3 {
> +	cpu-supply = <&vdd_arm>;
> +};
> +
> +&gmac1 {
> +	clock_in_out = "output";
> +	phy-mode = "rgmii-id";
> +	phy-supply = <&avdd_rtl8367rb>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&rgmii_miim>, <&rgmii_tx_bus2>, <&rgmii_rx_bus2>,
> +		    <&rgmii_rgmii_clk>, <&rgmii_rgmii_bus>, <&gmac1_rstn_l>;
> +	status = "okay";
> +
> +	fixed-link {
> +		speed = <1000>;
> +		full-duplex;
> +	};
> +};
> +
> +&gpu {
> +	mali-supply = <&vdd_logic>;
> +	status = "okay";
> +};
> +
> +&i2c0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c0m0_xfer>;
> +	status = "okay";
> +
> +	rk805: pmic@18 {
> +		compatible = "rockchip,rk805";
> +		reg = <0x18>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <RK_PB2 IRQ_TYPE_LEVEL_LOW>;
> +		#clock-cells = <1>;
> +		clock-output-names = "rk805-clkout1", "rk805-clkout2";
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pmic_int>;
> +		system-power-controller;
> +		wakeup-source;
> +
> +		vcc1-supply = <&vcc5v0_sys>;
> +		vcc2-supply = <&vcc5v0_sys>;
> +		vcc3-supply = <&vcc5v0_sys>;
> +		vcc4-supply = <&vcc5v0_sys>;
> +		vcc5-supply = <&vcc5v0_sys>;
> +		vcc6-supply = <&vcc5v0_sys>;
> +
> +		regulators {
> +			vdd_arm: DCDC_REG1 {
> +				regulator-name = "vdd_arm";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <712500>;
> +				regulator-max-microvolt = <1450000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vdd_logic: DCDC_REG2 {
> +				regulator-name = "vdd_logic";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <712500>;
> +				regulator-max-microvolt = <1450000>;
> +				regulator-ramp-delay = <12500>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_ddr: DCDC_REG3 {
> +				regulator-name = "vcc_ddr";
> +				regulator-always-on;
> +				regulator-boot-on;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +				};
> +			};
> +
> +			vcc_3v3: DCDC_REG4 {
> +				regulator-name = "vcc_3v3";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <3300000>;
> +				regulator-max-microvolt = <3300000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <3300000>;
> +				};
> +			};
> +
> +			vcc_1v8: LDO_REG1 {
> +				regulator-name = "vcc_1v8";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vcc1v8_emmc: LDO_REG2 {
> +				regulator-name = "vcc1v8_emmc";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <1800000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <1800000>;
> +				};
> +			};
> +
> +			vdd_0v9_p: LDO_REG3 {
> +				regulator-name = "vdd_0v9_p";
> +				regulator-always-on;
> +				regulator-boot-on;
> +				regulator-min-microvolt = <900000>;
> +				regulator-max-microvolt = <900000>;
> +
> +				regulator-state-mem {
> +					regulator-on-in-suspend;
> +					regulator-suspend-microvolt = <900000>;
> +				};
> +			};
> +		};
> +	};
> +};
> +
> +&i2c1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c1m0_xfer>;
> +	status = "okay";
> +
> +	eeprom@50 {
> +		compatible = "belling,bl24c16a", "atmel,24c16";
> +		reg = <0x50>;
> +		pagesize = <16>;
> +		read-only;
> +		vcc-supply = <&vcc_3v3>;
> +	};
> +};
> +
> +&i2c5 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&i2c5m0_xfer>;
> +	status = "okay";
> +
> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		#clock-cells = <0>;
> +		interrupt-parent = <&gpio4>;
> +		interrupts = <RK_PB0 IRQ_TYPE_LEVEL_LOW>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&rtc_int_l>;
> +		wakeup-source;
> +	};
> +};
> +
> +&mdio1 {
> +	reset-delay-us = <25000>;
> +	reset-gpios = <&gpio4 RK_PC2 GPIO_ACTIVE_LOW>;
> +	reset-post-delay-us = <100000>;
> +};
> +
> +&pinctrl {
> +	ethernet {
> +		gmac1_rstn_l: gmac1-rstn-l {
> +			rockchip,pins = <4 RK_PC2 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		gpio_8367_en: gpio-8367-en {
> +			rockchip,pins = <1 RK_PC3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		rtl8367rb_eint: rtl8367rb-eint {
> +			rockchip,pins = <1 RK_PC2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	gpio-keys {
> +		gpio0_a0_user: gpio0-a0-user {
> +			rockchip,pins = <0 RK_PA0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	leds {
> +		lan1_led_g: lan1-led-g {
> +			rockchip,pins = <1 RK_PB0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		lan2_led_g: lan2-led-g {
> +			rockchip,pins = <1 RK_PB1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		lan3_led_g: lan3-led-g {
> +			rockchip,pins = <1 RK_PB4 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		sys_led_g: sys-led-g {
> +			rockchip,pins = <4 RK_PA1 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +
> +		wan_led_g: wan-led-g {
> +			rockchip,pins = <4 RK_PA0 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pcie {
> +		mkey_pwr_en: mkey-pwr-en {
> +			rockchip,pins = <4 RK_PC6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	pmic {
> +		pmic_int: pmic-int {
> +			rockchip,pins = <4 RK_PB2 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	rtc {
> +		rtc_int_l: rtc-int-l {
> +			rockchip,pins = <4 RK_PB0 RK_FUNC_GPIO &pcfg_pull_up>;
> +		};
> +	};
> +
> +	sdmmc {
> +		sdmmc_vol_ctrl_h: sdmmc-vol-ctrl-h {
> +			rockchip,pins = <4 RK_PB6 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +
> +	usb {
> +		usb_host_en: usb-host-en {
> +			rockchip,pins = <1 RK_PA3 RK_FUNC_GPIO &pcfg_pull_none>;
> +		};
> +	};
> +};
> +
> +&saradc {
> +	vref-supply = <&vcc_1v8>;
> +	status = "okay";
> +};
> +
> +&sdhci {
> +	bus-width = <8>;
> +	cap-mmc-highspeed;
> +	mmc-hs200-1_8v;
> +	no-sd;
> +	no-sdio;
> +	non-removable;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vcc1v8_emmc>;
> +	status = "fail";
> +};
> +
> +&sdmmc {
> +	bus-width = <4>;
> +	cap-mmc-highspeed;
> +	cap-sd-highspeed;
> +	disable-wp;
> +	sd-uhs-sdr104;
> +	vmmc-supply = <&vcc_3v3>;
> +	vqmmc-supply = <&vccio_sd>;
> +	status = "okay";
> +};
> +
> +&sfc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&fspi_csn0>, <&fspi_pins>;
> +	status = "okay";
> +
> +	flash@0 {
> +		compatible = "jedec,spi-nor";
> +		reg = <0>;
> +		spi-max-frequency = <50000000>;
> +		spi-rx-bus-width = <4>;
> +		spi-tx-bus-width = <1>;
> +		vcc-supply = <&vcc1v8_emmc>;
> +	};
> +};
> +
> +&u2phy {
> +	status = "okay";
> +};
> +
> +&u2phy_host {
> +	phy-supply = <&vcc5v0_usb20>;
> +	status = "okay";
> +};
> +
> +&u2phy_otg {
> +	status = "okay";
> +};
> +
> +&uart0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&uart0m0_xfer>;
> +	status = "okay";
> +};
> +
> +&usb_host0_ehci {
> +	status = "okay";
> +};
> +
> +&usb_host0_xhci {
> +	extcon = <&u2phy>;
> +	maximum-speed = "high-speed";
> +	phys = <&u2phy_otg>;
> +	phy-names = "usb2-phy";
> +	status = "okay";
> +};


