Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 407AAC02182
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Jan 2025 08:12:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=log5WJR6IyFtuTXAcIDevkvz4g0SqLN743hcIngb+So=; b=XLyZTZF/Ee7fGdReI9TpjIgz46
	1HRdS/jug27iT1PPxiQbFjavbx75JtV9rvY7MTP8tLZ15nvwVnlAoK7Elq/Mi4E2Sy4oEZi8IUi5Z
	eMsakNNsRFxf+PFCiLPpte/WURSwHNdk2COdJS9Nvfoc2hdKMJ1cSLexhnbftzpIXGSvlTcpHAlrA
	n6tLhnaOB+j+FW95BmPJJY0Ac8wqCHjVkX2tQ+f3O8mNAFM8TeVZkidFkzFm2y4wXuJMjEGQ2oQOy
	J8NKdX85IHCkXWsb8738a7UUjeZmdjqOxRyjMpwXb0Wi5Rq5JcW+I64XuTFdSbZ7JkhF+w6ifYvYE
	7hV8ZfiA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9Mk-00000007E6H-2DgG;
	Tue, 21 Jan 2025 08:12:06 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1ta9LS-00000007DgO-3YD9
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Jan 2025 08:10:48 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 61E58A41082;
	Tue, 21 Jan 2025 08:08:58 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 12DDFC4CEDF;
	Tue, 21 Jan 2025 08:10:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737447045;
	bh=4E7ESDSaf4+a9ETUc/ps41hfuefD5kFw+WeQW47jS/w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XAPnB6Vhwla9Scsq5i5MuiaGhM3QVdz960fI6LZ/OI7koDCehme0oy9Rp1caBgxva
	 NZXRBTpVwhPlxlSm1hHI/Npl0Hge7XGmv1hirB71Bt7hH8k74bE5GBrtwvmV/pFaM7
	 5flnvBN+atF8z4a+oVz8GANOFhdGXcgiqYneXjGrgN0GbUG7LhdzgTythBzrq9tmuc
	 JnX2eIlcPaJ+HoJHE7tCrCL6JGa1+mGH6dCvmtOEcupihZ67hydxdiDizuDOcGjt6L
	 m+flK7O7RDyt7rFpwT15n9gKZ2+00ZtClZXdH9Fw38jUa17cxvixE7/Iuputf3ywmn
	 fn9oTH1iDRA1Q==
Date: Tue, 21 Jan 2025 09:10:42 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Marc Kleine-Budde <mkl@pengutronix.de>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	kernel@pengutronix.de, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Leonard =?utf-8?B?R8O2aHJz?= <l.goehrs@pengutronix.de>
Subject: Re: [PATCH stm32-next v2 2/2] ARM: dts: stm32: lxa-fairytux2: add
 Linux Automation GmbH FairyTux 2
Message-ID: <20250121-sparkling-screeching-bison-eadce1@krzk-bin>
References: <20250120-lxa-fairytux-v2-0-95f4a0eaa44d@pengutronix.de>
 <20250120-lxa-fairytux-v2-2-95f4a0eaa44d@pengutronix.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250120-lxa-fairytux-v2-2-95f4a0eaa44d@pengutronix.de>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250121_001047_014779_D85AD122 
X-CRM114-Status: GOOD (  20.02  )
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

On Mon, Jan 20, 2025 at 05:33:48PM +0100, Marc Kleine-Budde wrote:
> +&i2c1 {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&i2c1_pins_b>;
> +	pinctrl-1 =3D <&i2c1_sleep_pins_b>;
> +	status =3D "okay";
> +
> +	io_board_gpio: gpio6408@20 {

Not much improved here. I gave even link with examples and there is no
example there called "gpio48548796573467346574" or whatever number there
would be.

So again: node names should be generic. gpio@

> +		compatible =3D "ti,tca6408";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +		vcc-supply =3D <&v3v3_hdmi>;
> +		gpio-line-names =3D "LED1_GA_YK", "LED2_GA_YK", "LED1_GK_YA", "LED2_GK=
_YA",
> +				  "RS485_EN", "RS485_120R", "", "CAN_120R";
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
> +		label =3D "green:act";

I don't see improvements here either. Where is color property? Where is
function?

Again, drop label.

> +		gpios =3D <&io_board_gpio 1 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	led-3 {
> +		label =3D "orange:act";
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
> index 0000000000000000000000000000000000000000..f263e30e6bcee751b5d550e00=
a202d2100c5f9fc
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
> +	gpio-line-names =3D "", "", "", "", "",				/*  0 */
> +			  "", "", "", "", "",				/*  5 */
> +			  "", "", "", "", "",				/* 10 */
> +			  "";						/* 15 */
> +};
> +
> +&gpioh {
> +	gpio-line-names =3D "", "", "", "", "LCD_RESET",			/*  0 */
> +			  "", "", "", "", "",				/*  5 */
> +			  "", "", "GPIO1", "GPIO_INT", "",		/* 10 */
> +			  "";						/* 15 */
> +};
> +
> +&gpioi {
> +	gpio-line-names =3D "GPIO2", "", "", "", "",			/*  0 */
> +			  "", "", "", "ETH_", "",			/*  5 */
> +			  "", "USER_BTN1";				/* 10 */
> +};
> +
> +&i2c1 {
> +	pinctrl-names =3D "default", "sleep";
> +	pinctrl-0 =3D <&i2c1_pins_b>;
> +	pinctrl-1 =3D <&i2c1_sleep_pins_b>;
> +	status =3D "okay";
> +
> +	io_board_gpio: gpio6408@20 {

Same problem

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
> +				  "RS485_EN", "RS485_120R", "USB_CC_RESET", "CAN_120R";
> +	};
> +
> +	usb_c: tcpc@28 {

If this is typec, then typec@

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

BTW, keep order of nodes. Preferred is by unit address.

Best regards,
Krzysztof


