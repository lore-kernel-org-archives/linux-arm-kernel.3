Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2B356E7717D
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 13 Dec 2024 09:43:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=U5BBOUEVR42uel9HHxWh+SHmQ9PiN8sx6oPBZltT454=; b=vdv2TeVu7RuhqEAzzeNUiZbUPH
	A/rQIUIMJktaCuCP3aAwJprp0x7sSGsYFXfuQqhAS/IQZpySRF3Jz9DJDItQsRmiegqUYFGl+Q3yM
	tIasm9ojVr+zvO79VrJkoTN0YB6nrLEc4W3q2+ixSAwRZFGzFhksSKMUpM/zF10Zl+nQ2znVkWO2p
	N4n+3FA+t0spurey0+yxhmiqCxon3IVWjWtac5VQwZqUn49Zbt3RVyppFUfTK7/ixbyT+EN25Gg6T
	KIoSisCvSbyEC/oGjqokcnetNpV9SITp9TnZ0tCqLMMtP8P/XYIYf+88y6p6ylaaOGPF/lA29HzTX
	aST8VBTg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2CT-00000003Il4-0iKh;
	Fri, 13 Dec 2024 09:43:09 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tM2BN-00000003IQt-21wt
	for linux-arm-kernel@lists.infradead.org;
	Fri, 13 Dec 2024 09:42:02 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 42AAB5C57EA;
	Fri, 13 Dec 2024 09:41:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A51A8C4CED0;
	Fri, 13 Dec 2024 09:41:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1734082920;
	bh=9dl5Pi5hTSd3qJlZ0EL65blqpIeKz/rSV364t8uhYyc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=B/Ipk7S9z54So+yHMteQqYIBOL2mD4lqxqzYFABjyuDNg6AA83ZHk9uy3AfrTKjUz
	 1HlKVl+P6Nj1mquYaCQOV0ZPkXOSniTMM6apedU0jpFLjHUNsV4RFWPF21QOGQB8mn
	 DED5krilu+ndIK653dDEAqQ1z8XWyqAM7c8GoEkb5KnGUs7qQnupMElZ/Tie2Rn+eY
	 79oXjx10SyM2HyLX5w8CWYiirnFr+pFU1KkV3IcDduDO4PxzdBMCbQLoIfvxxArB6T
	 4uu6XeCjOut311xnrn81MqyHEeRrrx0yVWyAFR57/wzqAUPlW7CeXX3xiplMatziBX
	 qs9PbPvhFQ90g==
Date: Fri, 13 Dec 2024 10:41:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	kernel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH stm32-next 2/2] ARM: dts: stm32: lxa-fairytux2: add Linux
 Automation GmbH FairyTux 2
Message-ID: <lqw5blalkc2e4owzds5qs6bntsk6oh5jq5o6si3ugpa4sm7wu7@ssg4l3da6mww>
References: <20241210-lxa-fairytux-v1-0-9aea01cdb83e@pengutronix.de>
 <20241210-lxa-fairytux-v1-2-9aea01cdb83e@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20241210-lxa-fairytux-v1-2-9aea01cdb83e@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241213_014201_615520_BB1455BA 
X-CRM114-Status: GOOD (  20.20  )
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

On Tue, Dec 10, 2024 at 10:32:28AM +0100, Marc Kleine-Budde wrote:
> +&gpiof {
> +	gpio-line-names =3D "GPIO1", "GPIO2", "", "", "", /*  0 */
> +	"", "", "", "", "",                             /*  5 */

That's not really readable. Fix the alignment with opening ", see DTS
coding style.

> +	"", "", "", "", "",                             /* 10 */
> +	"";                                             /* 15 */
> +};
> +
> +&gpioh {
> +	gpio-line-names =3D "", "", "", "", "LCD_RESET", /*  0 */
> +	"", "", "", "", "",                            /*  5 */
> +	"", "", "", "GPIO3", "",                       /* 10 */
> +	"";                                            /* 15 */
> +};
> +
> +&gpioi {
> +	gpio-line-names =3D "", "", "", "", "", /*  0 */
> +	"", "", "", "ETH_", "",               /*  5 */
> +	"", "USER_BTN1";                      /* 10 */
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&i2c1_pins_b>;
> +	pinctrl-1 =3D <&i2c1_sleep_pins_b>;
> +	status =3D "okay";
> +
> +	io_board_gpio: tca6408@20 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetr=
ee-basics.html#generic-names-recommendation

> +		compatible =3D "ti,tca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&v3v3_hdmi>;
> +		gpio-line-names =3D "LED1_GA_YK", "LED2_GA_YK", "LED1_GK_YA", "LED2_GK=
_YA",
> +		"RS485_EN", "RS485_120R", "", "CAN_120R";
> +	};
> +};
> +
> +&led_controller_io {
> +	/*
> +	 * led-2 and led-3 are internally connected antiparallel to one
> +	 * another inside the ethernet jack like this:
> +	 * GPIO1 ---+---|led-2|>--+--- GPIO3
> +	 *          +--<|led-3|---+
> +	 * E.g. only one of the LEDs can be illuminated at a time while
> +	 * the other output must be driven low.
> +	 * This should likely be implemented using a multi color LED
> +	 * driver for antiparallel LEDs.
> +	 */
> +	led-2 {
> +		label =3D "fairytux2:green:act";

Drop "fairytux2" and rather use color and function properties.

> +		gpios =3D <&io_board_gpio 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	led-3 {
> +		label =3D "fairytux2:orange:act";
> +		gpios =3D <&io_board_gpio 3 GPIO_ACTIVE_HIGH>;
> +	};
> +};
> +
> +&usart3 {
> +	/*
> +	 * On Gen 1 FairyTux 2 only RTS can be used and not CTS as well,
> +	 * Because pins PD11 (CTS) and PI11 (USER_BTN1) share the same
> +	 * interrupt and only one of them can be used at a time.
> +	 */
> +	rts-gpios =3D <&gpiod 12 GPIO_ACTIVE_LOW>;
> +};
> +
> +&usbotg_hs {
> +	dr_mode =3D "peripheral";
> +};
> diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts b/ar=
ch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts
> new file mode 100644
> index 0000000000000000000000000000000000000000..c84f83a75731f70165c240812=
f7f4230bf9bfbb0
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2-gen2.dts
> @@ -0,0 +1,146 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2024 Leonard G=C3=B6hrs, Pengutronix
> + */
> +
> +/dts-v1/;
> +
> +#include "stm32mp153c-lxa-fairytux2.dtsi"
> +
> +/ {
> +	model =3D "Linux Automation GmbH FairyTux 2 Gen 2";
> +	compatible =3D "lxa,stm32mp153c-fairytux2-gen2", "oct,stm32mp153x-osd32=
", "st,stm32mp153";
> +
> +	gpio-keys {
> +		compatible =3D "gpio-keys";
> +
> +		button-left {
> +			label =3D "USER_BTN1";
> +			linux,code =3D <KEY_ESC>;
> +			gpios =3D <&gpioi 10 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +
> +		button-right {
> +			label =3D "USER_BTN2";
> +			linux,code =3D <KEY_HOME>;
> +			gpios =3D <&gpioe 9 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +		};
> +	};
> +};
> +
> +&gpiof {
> +	gpio-line-names =3D "", "", "", "", "", /*  0 */
> +	"", "", "", "", "",                   /*  5 */
> +	"", "", "", "", "",                   /* 10 */
> +	"";                                   /* 15 */
> +};
> +
> +&gpioh {
> +	gpio-line-names =3D "", "", "", "", "LCD_RESET", /*  0 */
> +	"", "", "", "", "",                            /*  5 */
> +	"", "", "GPIO1", "GPIO_INT", "",               /* 10 */
> +	"";                                            /* 15 */
> +};
> +
> +&gpioi {
> +	gpio-line-names =3D "GPIO2", "", "", "", "", /*  0 */
> +	"", "", "", "ETH_", "",                    /*  5 */
> +	"", "USER_BTN1";                           /* 10 */
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&i2c1_pins_b>;
> +	pinctrl-1 =3D <&i2c1_sleep_pins_b>;
> +	status =3D "okay";
> +
> +	io_board_gpio: tca6408@20 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetr=
ee-basics.html#generic-names-recommendation

> +		compatible =3D "ti,tca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		interrupt-parent =3D <&gpioh>;
> +		interrupts =3D <13 IRQ_TYPE_LEVEL_LOW>;
> +		interrupt-controller;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&board_tca6408_pins>;
> +		#interrupt-cells =3D <2>;
> +		vcc-supply =3D <&v3v3_hdmi>;
> +		gpio-line-names =3D "LED1_GA_YK", "LED2_GA_YK", "LED1_GK_YA", "USB_CC_=
ALERT",
> +		"RS485_EN", "RS485_120R", "USB_CC_RESET", "CAN_120R";

Messed alignment.

> +	};
> +
> +	usb_c: stusb1600@28 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetr=
ee-basics.html#generic-names-recommendation

> +		compatible =3D "st,stusb1600";
> +		reg =3D <0x28>;
> +		interrupt-parent =3D <&io_board_gpio>;
> +		interrupts =3D <3 IRQ_TYPE_EDGE_FALLING>;
> +		vdd-supply =3D <&reg_5v>;
> +		vsys-supply =3D <&v3v3_hdmi>;
> +
> +		connector {
> +			compatible =3D "usb-c-connector";
> +			label =3D "USB-C";
> +			power-role =3D "dual";
> +			typec-power-opmode =3D "default";
> +
> +			port {
> +				con_usbotg_hs_ep: endpoint {
> +					remote-endpoint =3D <&usbotg_hs_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +	io_board_eeprom: eeprom@56 {
> +		compatible =3D "atmel,24c04";
> +		reg =3D <0x56>;
> +		vcc-supply =3D <&v3v3_hdmi>;
> +	};
> +
> +	temperature-sensor@48 {
> +		compatible =3D "national,lm75a";
> +		reg =3D <0x48>;
> +		/*
> +		 * The sensor itself is powered by a voltage divider from the
> +		 * always-on 5V supply.
> +		 * The required pull-up resistors however are on v3v3_hdmi.
> +		 */
> +		vs-supply =3D <&v3v3_hdmi>;
> +	};
> +};
> +
> +&rtc {
> +	status =3D "okay";
> +};
> +
> +&led_controller_io {
> +	led-2 {
> +		label =3D "fairytux2:orange:act";
> +		gpios =3D <&io_board_gpio 1 GPIO_ACTIVE_LOW>;
> +	};
> +};
> +
> +&usart3 {
> +	rts-gpios =3D <&gpiod 12 GPIO_ACTIVE_LOW>;
> +	cts-gpios =3D <&gpiod 11 GPIO_ACTIVE_LOW>;
> +};
> +
> +&usbotg_hs {
> +	usb-role-switch;
> +
> +	port {
> +		usbotg_hs_ep: endpoint {
> +			remote-endpoint =3D <&con_usbotg_hs_ep>;
> +		};
> +	};
> +};
> +
> +&pinctrl {
> +	board_tca6408_pins: stusb1600-0 {
> +		pins {
> +			pinmux =3D <STM32_PINMUX('H', 13, GPIO)>;
> +			bias-pull-up;
> +		};
> +	};
> +};
> diff --git a/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi b/arch/a=
rm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
> new file mode 100644
> index 0000000000000000000000000000000000000000..0e0e1b36cb087dfbfb47e3830=
94c6044786a2c6a
> --- /dev/null
> +++ b/arch/arm/boot/dts/st/stm32mp153c-lxa-fairytux2.dtsi
> @@ -0,0 +1,394 @@
> +// SPDX-License-Identifier: (GPL-2.0-or-later OR BSD-3-Clause)
> +/*
> + * Copyright (C) 2020 STMicroelectronics - All Rights Reserved
> + * Copyright (C) 2021 Rouven Czerwinski, Pengutronix
> + * Copyright (C) 2023, 2024 Leonard G=C3=B6hrs, Pengutronix
> + */
> +
> +#include "stm32mp153.dtsi"
> +#include "stm32mp15xc.dtsi"
> +#include "stm32mp15xx-osd32.dtsi"
> +#include "stm32mp15xxac-pinctrl.dtsi"
> +
> +#include <dt-bindings/gpio/gpio.h>
> +#include <dt-bindings/input/input.h>
> +#include <dt-bindings/leds/common.h>
> +#include <dt-bindings/pwm/pwm.h>
> +
> +/ {
> +	aliases {
> +		can0 =3D &m_can1;
> +		ethernet0 =3D &ethernet0;
> +		i2c0 =3D &i2c1;
> +		i2c1 =3D &i2c4;
> +		mmc1 =3D &sdmmc2;
> +		serial0 =3D &uart4;
> +		serial1 =3D &usart3;
> +		spi0 =3D &spi4;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &uart4;
> +	};
> +
> +	backlight: backlight {
> +		compatible =3D "pwm-backlight";
> +		power-supply =3D <&v3v3>;
> +
> +		brightness-levels =3D <0 31 63 95 127 159 191 223 255>;
> +		default-brightness-level =3D <7>;
> +		pwms =3D <&led_pwm 3 1000000 0>;
> +	};
> +
> +	led-controller-cpu {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			label =3D "fairytux2:green:status";

Same comment.

> +			gpios =3D <&gpioa 13 GPIO_ACTIVE_HIGH>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +	};
> +
> +	led_controller_io: led-controller-io {
> +		compatible =3D "gpio-leds";
> +
> +		/*
> +		 * led-0 and led-1 are internally connected antiparallel to one
> +		 * another inside the ethernet jack like this:
> +		 * GPIO0 ---+---|led-0|>--+--- GPIO2
> +		 *          +--<|led-1|---+
> +		 * E.g. only one of the LEDs can be illuminated at a time while
> +		 * the other output must be driven low.
> +		 * This should likely be implemented using a multi color LED
> +		 * driver for antiparallel LEDs.
> +		 */
> +		led-0 {
> +			label =3D "fairytux2:green:link";
> +			gpios =3D <&io_board_gpio 0 GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-1 {
> +			label =3D "fairytux2:orange:link";
> +			gpios =3D <&io_board_gpio 2 GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	reg_5v: regulator-5v {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "5V";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	reg_1v2: regulator-1v2 {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "1V2";
> +		regulator-min-microvolt =3D <1200000>;
> +		regulator-max-microvolt =3D <1200000>;
> +		regulator-always-on;
> +		vin-supply =3D <&reg_5v>;
> +	};
> +};
> +
> +baseboard_eeprom: &sip_eeprom {
> +};
> +
> +&crc1 {
> +	status =3D "okay";
> +};
> +
> +&cryp1 {
> +	status =3D "okay";
> +};
> +
> +&dts {
> +	status =3D "okay";
> +};
> +
> +&ethernet0 {
> +	assigned-clocks =3D <&rcc ETHCK_K>, <&rcc PLL4_P>;
> +	assigned-clock-parents =3D <&rcc PLL4_P>;
> +	assigned-clock-rates =3D <125000000>; /* Clock PLL4 to 750Mhz in ATF */
> +
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&ethernet0_rgmii_pins_b>;
> +	pinctrl-1 =3D <&ethernet0_rgmii_sleep_pins_b>;
> +
> +	st,eth-clk-sel;
> +	phy-mode =3D "rgmii-id";
> +	phy-handle =3D <&ethphy>;
> +	status =3D "okay";
> +
> +	mdio {
> +		compatible =3D "snps,dwmac-mdio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		ethphy: ethernet-phy@3 { /* KSZ9031RN */
> +			reg =3D <3>;
> +			reset-gpios =3D <&gpioe 11 GPIO_ACTIVE_LOW>; /* ETH_RST# */
> +			interrupt-parent =3D <&gpioa>;
> +			interrupts =3D <6 IRQ_TYPE_EDGE_FALLING>; /* ETH_MDINT# */
> +			reset-assert-us =3D <10000>;
> +			reset-deassert-us =3D <300>;
> +			micrel,force-master;
> +		};
> +	};
> +};
> +
> +&gpioa {
> +	gpio-line-names =3D "", "", "", "", "", /*  0 */
> +	"", "ETH_INT", "", "", "",            /*  5 */

Really unreadable indentation. See DTS coding style.

Best regards,
Krzysztof


