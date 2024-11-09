Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C36D6D5E37A
	for <linux-arm-kernel@archiver.kernel.org>; Sat,  9 Nov 2024 18:26:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Type:
	Content-Transfer-Encoding:MIME-Version:References:In-Reply-To:Message-ID:Date
	:Subject:Cc:To:From:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=vvB5H31tgUpM4qG4v/0WcfNheT0JvDREJderLKJjrc4=; b=kDbuHKJbMKIe/NWiflCClVGfeB
	661Vq6Wjnx1Z8FqbnFB23ZHrZJyAbA2c5YTBSYMrA7dF8NlGvkf1sZnUgP1nwwFpNESYjDOgt8CRj
	2Q3AGJiuC+WmC79zlP3x4SQa3xHW+F243h7HxX/d9mHRjih37P1UrZZBXhQ57msT/hj7bYUrVG1ew
	Tf8b9ldzjjR4XHRHKrsGT96DvympmDhiOnMQeJqN7LxGNxqnpNzfHoYvDvEZirUBfSpYelyDnAF5O
	YvoWCePFkF4bm/Ei3aCZSQPzZyUOoKzy1sNJIlS+RfDJ0DRYeWI45xOBuuzmOYCB+JT7q6c9SdpX2
	4G67eTgw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t9q9f-0000000DnVo-01gx;
	Sat, 09 Nov 2024 18:25:51 +0000
Received: from gloria.sntech.de ([185.11.138.130])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t9q7t-0000000DnDv-2irT;
	Sat, 09 Nov 2024 18:24:03 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=sntech.de;
	s=gloria202408; h=Content-Type:Content-Transfer-Encoding:MIME-Version:
	References:In-Reply-To:Message-ID:Date:Subject:Cc:To:From:Sender:Reply-To:
	Content-ID:Content-Description:Resent-Date:Resent-From:Resent-Sender:
	Resent-To:Resent-Cc:Resent-Message-ID:List-Id:List-Help:List-Unsubscribe:
	List-Subscribe:List-Post:List-Owner:List-Archive;
	bh=vvB5H31tgUpM4qG4v/0WcfNheT0JvDREJderLKJjrc4=; b=eN72TLBDCHOtblxBReVKBpU1df
	LD5vtrb00VQtoi3tv/EemDP0CCvYvqCeTwW9+KGZbyyPJR0sAfNytjKr6o06y07xpPD9+64BgUp9K
	lEQ3Uc+olS0xmYx0RhxK/T4yMSEdsjF3B2l2qiYexLeb80WUhIm6GOxxXx8/ap1tKHULRoMV9YhZT
	0KIAF2lkqCDU9u0GVBLy7Fh4RlO6ubKGP5lFj/EOLBgIsrgya0V9ZhFb9SnXq8A+4h8BW27Hsr3pI
	A0RhC295gEio6HVwed+1fiQo7h29z8Vbm54aLK7mXSmUVkzEDTsAYMuNpYIGf8be3VRgT6IHkT1Jc
	z18jf8kg==;
Received: from i53875b28.versanet.de ([83.135.91.40] helo=diego.localnet)
	by gloria.sntech.de with esmtpsa  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <heiko@sntech.de>)
	id 1t9q7f-0007Jz-54; Sat, 09 Nov 2024 19:23:47 +0100
From: Heiko =?ISO-8859-1?Q?St=FCbner?= <heiko@sntech.de>
To: Jimmy Hon <honyuenkwun@gmail.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Ondrej Jirman <megi@xff.cz>,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-rockchip@lists.infradead.org, Jimmy Hon <honyuenkwun@gmail.com>
Subject: Re: [PATCH 2/2] arm64: dts: rockchip: Add Orange Pi 5 Max board
Date: Sat, 09 Nov 2024 19:23:46 +0100
Message-ID: <23718124.6Emhk5qWAg@diego>
In-Reply-To: <20241031031528.23428-4-honyuenkwun@gmail.com>
References: <20241031031528.23428-2-honyuenkwun@gmail.com>
 <20241031031528.23428-4-honyuenkwun@gmail.com>
MIME-Version: 1.0
Content-Transfer-Encoding: 7Bit
Content-Type: text/plain; charset="us-ascii"
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241109_102401_744887_8AD7E18F 
X-CRM114-Status: GOOD (  19.67  )
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

Hi Jimmy,

Am Donnerstag, 31. Oktober 2024, 04:14:51 CET schrieb Jimmy Hon:
> diff --git a/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
> new file mode 100644
> index 000000000000..d31b13f99fdc
> --- /dev/null
> +++ b/arch/arm64/boot/dts/rockchip/rk3588-orangepi-5-max.dts
> @@ -0,0 +1,887 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +
> +/dts-v1/;
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pinctrl/rockchip.h>
> +#include <dt-bindings/soc/rockchip,vop2.h>
> +#include "rk3588.dtsi"

can you check how similar the rk3588-orangepi--5-max is to the
already existing orangepi-5-plus please?

For rk3588s-orangepi-5 and orangepi-5b we already have this nicely
shared dtsi for commit things, and somehow I assume this might be
similar for 5-plus vs 5-max.

> +
> +/ {
> +	model = "Xunlong Orange Pi 5 Max";
> +	compatible = "xunlong,orangepi-5-max", "rockchip,rk3588";
> +

[...]

> +	/* PMIC_EXT_EN */
> +	vcc_1v1_nldo_s3: vcc-1v1-ndlo-s3-regulator {

vcc_1v1_nldo_s3: regulator-vcc-1v1-ndlo-s3 {

preferred pattern for fixed-regulator nodenames is regulator-......

Same for the othe fixed regulators below.

> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_1v1_nldo_s3";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <1100000>;
> +		regulator-max-microvolt = <1100000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	/* pcie eth. not a real regulator. 33VAUX */
> +	vcc_3v3_aux: vcc-3v3-aux-regulator {
> +		compatible = "regulator-fixed";
> +		/* Ethernet_power_en */
> +		gpios = <&gpio0 RK_PD3 GPIO_ACTIVE_LOW>;
> +		regulator-name = "33vaux";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <50000>;
> +		vin-supply = <&vcc_3v3_s3>;
> +	};
> +
> +	vcc3v3_pcie30: vcc3v3-pcie30-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		/* PCIE_PWREN_H */
> +		gpios = <&gpio2 RK_PB6 GPIO_ACTIVE_HIGH>;
> +		regulator-name = "vcc3v3_pcie30";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <5000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	/* Regulator is enabled whenever vcc_1v8_s0 is on */
> +	vcc_3v3_s0: vcc-3v3-s0-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc_3v3_s0";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		vin-supply = <&vcc_3v3_s3>;
> +
> +		regulator-state-mem {
> +			regulator-off-in-suspend;
> +		};
> +	};
> +
> +	vcc5v0_sys: vcc5v0-sys-regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "vcc5v0_sys";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +	};
> +
> +	/* Represents the vcc5v0_usb20 in the schematic */
> +	/* Also represents the vcc5v0_usb30 in the schematic,
> +	   both regulators share the same enable gpio */

please make that one comment block and use appropriate formatting

/*
 * Represents the vcc5v0_usb20 and vcc5v0_usb30 in the schematic,
 * both regulators share the same enable gpio
 */


> +	vcc5v0_host: vcc5v0-host-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		/* USB_HOST_PWREN */
> +		gpios = <&gpio3 RK_PD5 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_host_pwren>;
> +		regulator-name = "vcc5v0_host";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +
> +	vcc5v0_usb30_otg: vcc5v0-usb30-otg-regulator {
> +		compatible = "regulator-fixed";
> +		enable-active-high;
> +		/* USB_OTG_PWREN */
> +		gpios = <&gpio4 RK_PB3 GPIO_ACTIVE_HIGH>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&usb_otg_pwren>;
> +		regulator-name = "vcc5v0_usb30_otg";
> +		regulator-always-on;
> +		regulator-boot-on;
> +		regulator-min-microvolt = <5000000>;
> +		regulator-max-microvolt = <5000000>;
> +		vin-supply = <&vcc5v0_sys>;
> +	};
> +};


> +	hym8563: rtc@51 {
> +		compatible = "haoyu,hym8563";
> +		reg = <0x51>;
> +		/* RTC_INT_L */

what does this comment try to explain? If that is the name of the pin,
just name the pinctrl below accordingly (instead of hym8563_int
if applicable) .

> +		interrupt-parent = <&gpio0>;
> +		interrupts = <RK_PC4 IRQ_TYPE_LEVEL_LOW>;
> +		#clock-cells = <0>;
> +		clock-output-names = "hym8563";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&hym8563_int>;
> +		wakeup-source;
> +	};
> +};
> +
> +&pwm9 {
> +	pinctrl-names = "active";

this needs to be "default" to actually work

> +	pinctrl-0 = <&pwm9m2_pins>;
> +	status = "okay";
> +};


Thanks
Heiko



