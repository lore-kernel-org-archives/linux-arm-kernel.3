Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 50283C0218C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 23 Jan 2025 09:43:41 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:References:Cc:
	Subject:To:From:Message-Id:Date:Content-Type:Content-Transfer-Encoding:
	Mime-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=igDCe1x3xTNsIM45RXmz5PFqCPI/aYPG1aPW/HcNGd4=; b=VJ0jdosmrLbsOHh3gn8Ta3bafp
	tKxpZjY3HijoYritQlZ7JVDT2g0d/b3NY/kpND6tq2G2DeUWZdBiqHmDP6QqkMmVkOkjUXfGLzEE5
	bfn3gM1Byq7JsURSZRnaRzr5BhzjFxkenuZUNzK8ps00RPJOgCloj9EfBj/GX96xOuBtLlqrzrkQ/
	1xz6phDCSsQIEAPseX2tEIiGZym3Ss9Dz5x600Xr0FTJP50oDOXj+QMWiMUVA3anYBDtoFkJYtcnn
	3NGZ7FN6SdZ0oyNazCTroP4J1+OkiLalZSn1vIPejyDN4O0W54HQXUdFCo/HibIuhxT/4TwM/wTgR
	SizKY6aQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tatkC-0000000C7RX-1KnJ;
	Thu, 23 Jan 2025 09:43:24 +0000
Received: from relay5-d.mail.gandi.net ([217.70.183.197])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tatit-0000000C7Im-0MQq
	for linux-arm-kernel@lists.infradead.org;
	Thu, 23 Jan 2025 09:42:04 +0000
Received: by mail.gandi.net (Postfix) with ESMTPSA id DBBE31C0003;
	Thu, 23 Jan 2025 09:41:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=bootlin.com; s=gm1;
	t=1737625318;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding:
	 in-reply-to:in-reply-to:references:references;
	bh=igDCe1x3xTNsIM45RXmz5PFqCPI/aYPG1aPW/HcNGd4=;
	b=UJ4zshe3EB8DFHjQ7p569pU14BPcj+YE2VPlKO9cqBCjMF07HiQG4iFVbG6osBFUxlUct6
	MlMsS2Vfbucho97qjn61wEt+MWThhmloPXdlpnyZmcqzIA9K50ZrIvNBciPetNC/SEY8P2
	Q1qjI/BSXLHFSesPWU+FxBbs59+QsOedCVGY9pEqwtpMsBSJGSvvL3mNAb5Fdy9hzibJlJ
	FIkmwF8IwIkKT8ZjODVYy0g2ES6FC9o8I9WEwKEV67R5cGp3GIh4SSwt49SRacU87xGI6E
	5gfXuca16Mv2dxBAgIr53X2OqYToKT46mzPHsmRbdyl6MJX5RpiHJfKSi3hLag==
Mime-Version: 1.0
Content-Transfer-Encoding: quoted-printable
Content-Type: text/plain; charset=UTF-8
Date: Thu, 23 Jan 2025 10:41:57 +0100
Message-Id: <D79CRMSWU0F1.30RZ853AES515@bootlin.com>
From: "Antonin Godard" <antonin.godard@bootlin.com>
To: "Krzysztof Kozlowski" <krzk@kernel.org>, "Rob Herring"
 <robh@kernel.org>, "Krzysztof Kozlowski" <krzk+dt@kernel.org>, "Conor
 Dooley" <conor+dt@kernel.org>, "Shawn Guo" <shawnguo@kernel.org>, "Sascha
 Hauer" <s.hauer@pengutronix.de>, "Pengutronix Kernel Team"
 <kernel@pengutronix.de>, "Fabio Estevam" <festevam@gmail.com>
Subject: Re: [PATCH 3/3] ARM: dts: imx6ul: Add Variscite Concerto board
 support
Cc: "Thomas Petazzoni" <thomas.petazzoni@bootlin.com>,
 <devicetree@vger.kernel.org>, <linux-kernel@vger.kernel.org>,
 <imx@lists.linux.dev>, <linux-arm-kernel@lists.infradead.org>
X-Mailer: aerc 0.18.2-100-gc2048ef30452-dirty
References: <20250121-varsom6ul-concerto-dts-v1-0-eb349acf0ac6@bootlin.com>
 <20250121-varsom6ul-concerto-dts-v1-3-eb349acf0ac6@bootlin.com>
 <56e74e80-8e90-4784-b284-bee1af35e37e@kernel.org>
In-Reply-To: <56e74e80-8e90-4784-b284-bee1af35e37e@kernel.org>
X-GND-Sasl: antonin.godard@bootlin.com
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250123_014203_389185_85C4EA7E 
X-CRM114-Status: GOOD (  25.05  )
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

Hi Krzysztof,

On Tue Jan 21, 2025 at 5:03 PM CET, Krzysztof Kozlowski wrote:
> On 21/01/2025 10:33, Antonin Godard wrote:
>> This patch adds support for the Variscite Concerto Carrier Board.
>
> Please do not use "This commit/patch/change", but imperative mood. See
> longer explanation here:
> https://elixir.bootlin.com/linux/v5.17.1/source/Documentation/process/sub=
mitting-patches.rst#L95

Will do in v2.

>>
>> This Carrier-Board has the following:
>> - LVDS interface for the VLCD-CAP-GLD-LVDS 7" LCD 800 x 480 touch
>>   display (not configured)
>> - USB Host + USB OTG Connector
>> - 10/100 Mbps Ethernet
>> - miniPCI-Express slot
>> - SD Card connector
>> - Audio Headphone/Line In jack connectors
>> - S-ATA
>> - On-board DMIC
>>=20
>> Product Page: https://www.variscite.com/product/single-board-computers/c=
oncerto-board
>>=20
>> This file is based on the one provided by Variscite on their own kernel,
>> but adapted for mainline.
>>=20
>> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
>> ---
>>  arch/arm/boot/dts/nxp/imx/Makefile                 |   1 +
>>  .../boot/dts/nxp/imx/imx6ul-var-som-concerto.dts   | 331 ++++++++++++++=
+++++++
>>  2 files changed, 332 insertions(+)
>>=20
>> diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/=
imx/Makefile
>> index 39a153536d2a2b8f75b5fbe4332660f89442064a..94c9bc94cc8e2daa1fb3b568=
6b0b58db1f6678b6 100644
>> --- a/arch/arm/boot/dts/nxp/imx/Makefile
>> +++ b/arch/arm/boot/dts/nxp/imx/Makefile
>> @@ -329,6 +329,7 @@ dtb-$(CONFIG_SOC_IMX6UL) +=3D \
>>  	imx6ul-tx6ul-0010.dtb \
>>  	imx6ul-tx6ul-0011.dtb \
>>  	imx6ul-tx6ul-mainboard.dtb \
>> +	imx6ul-var-som-concerto.dtb \
>>  	imx6ull-14x14-evk.dtb \
>>  	imx6ull-colibri-aster.dtb \
>>  	imx6ull-colibri-emmc-aster.dtb \
>> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arc=
h/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
>> new file mode 100644
>> index 0000000000000000000000000000000000000000..4289641d94c5a72ba985f339=
652039dbf13da40c
>> --- /dev/null
>> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
>> @@ -0,0 +1,331 @@
>> +// SPDX-License-Identifier: GPL-2.0+
>> +/*
>> + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-MX=
6UL
>> + * Variscite SoM mounted on it
>> + *
>> + * Copyright 2019 Variscite Ltd.
>> + * Copyright 2025 Bootlin
>> + */
>> +
>> +#include "imx6ul-var-som.dtsi"
>> +
>> +/ {
>> +	model =3D "Variscite VAR-SOM-MX6UL Concerto Board";
>> +	compatible =3D "variscite,mx6concerto", "variscite,var-som-imx6ul", "f=
sl,imx6ul";
>> +
>> +	backlight {
>> +		compatible =3D "pwm-backlight";
>> +		pwms =3D <&pwm4 0 20000 0>;
>> +		brightness-levels =3D <0 4 8 16 32 64 128 255>;
>> +		default-brightness-level =3D <6>;
>> +		status =3D "okay";
>
> Which file disables it?

This is a mistake, I forgot to remove this when removing the parts I couldn=
't
test. Will remove this node in v2.

>> +	};
>> +
>> +	chosen {
>> +		stdout-path =3D &uart1;
>> +	};
>> +
>> +	gpio-keys {
>> +		compatible =3D "gpio-keys";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pinctrl_gpio_key_back>, <&pinctrl_gpio_key_wakeup>;
>> +
>> +		key-back {
>> +			gpios =3D <&gpio4 14 GPIO_ACTIVE_LOW>;
>> +			linux,code =3D <KEY_BACK>;
>> +		};
>> +
>> +		key-wakeup {
>> +			gpios =3D <&gpio5 8 GPIO_ACTIVE_LOW>;
>> +			linux,code =3D <KEY_WAKEUP>;
>> +			wakeup-source;
>> +		};
>> +	};
>> +
>> +	leds {
>> +		compatible =3D "gpio-leds";
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pinctrl_gpio_leds>;
>> +
>> +		gpled2 {
>
> led-0
> led-1
> led-2

Will rename this node to led-0, and set the label to "gpled2" (this is how =
it's
named on the schematic/datasheet).

> Are there other leds here?

Nothing else is obvious to me on the schematic. There is no gpled0 or gpled=
1.

>> +			gpios =3D <&gpio1 25 GPIO_ACTIVE_HIGH>;
>> +			linux,default-trigger =3D "heartbeat";
>
> Missing function and color

Will set the function to STATUS, color green. This is a general purpose led=
 that
can be used for debugging purposes or as a status indicator, I think.

>> +		};
>> +	};
>> +};
>> +
>> +&can1 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&pinctrl_flexcan1>;
>> +	status =3D "okay";
>> +};
>> +
>> +&fec1 {
>> +	status =3D "disabled";
>> +};
>> +
>> +&fec2 {
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2=
_mdio>;
>> +	phy-mode =3D "rmii";
>> +	phy-handle =3D <&ethphy1>;
>> +	phy-reset-gpios =3D <&gpio5 5 GPIO_ACTIVE_LOW>;
>> +	phy-reset-duration =3D <100>;
>> +	status =3D "okay";
>> +
>> +	mdio {
>> +		#address-cells =3D <1>;
>> +		#size-cells =3D <0>;
>> +
>> +		ethphy1: ethernet-phy@3 {
>> +			compatible =3D "ethernet-phy-ieee802.3-c22";
>> +			micrel,rmii-reference-clock-select-25-mhz =3D <1>;
>> +			micrel,led-mode =3D <0>;
>> +			clocks =3D <&rmii_ref_clk>;
>> +			clock-names =3D "rmii-ref";
>> +			reg =3D <3>;
>> +		};
>> +	};
>> +};
>> +
>> +&i2c1 {
>> +	clock-frequency =3D <100000>;
>> +	pinctrl-names =3D "default";
>> +	pinctrl-0 =3D <&pinctrl_i2c1>;
>> +	status =3D "okay";
>> +
>> +	/* DS1337 RTC module */
>
> Drop comment, obvious. This cannot be anything else, because node name
> and compatible told that.

Will do in v2.

>> +	rtc@68 {
>> +		/*
>> +		 * To actually use this interrupt
>> +		 * connect pins J14.8 & J14.10 on the Concerto-Board.
>> +		 */
>> +		compatible =3D "dallas,ds1337";
>> +		reg =3D <0x68>;
>> +		pinctrl-names =3D "default";
>> +		pinctrl-0 =3D <&pinctrl_rtc>;
>> +		interrupt-parent =3D <&gpio1>;
>> +		interrupts =3D <10 IRQ_TYPE_EDGE_FALLING>;
>> +	};
>> +};
>
>
> Best regards,
> Krzysztof

Thanks for the review,
Antonin

--=20
Antonin Godard, Bootlin
Embedded Linux and Kernel engineering
https://bootlin.com

