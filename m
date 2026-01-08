Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B09D7D1489A
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  8 Jan 2026 04:38:27 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=8w+4kS8oviIJ1/b1qQY5a5+JdYhA96gyY7sZoMxlfMA=; b=mlzonGsbLzRJ2APuYFv0TTiEbF
	69Dhpt1BT65CxKkXYXfoLtjWTvn14SozWhQYQwc1gPfiOYPMCbAcVrooV4noFMfUwkBKoa4caSm2/
	0tRVwDxQZXdM+wGLiubB/YudgY9FafoBoeiJlJc67IBoeLkOXzrjHL2MywX5nt+x7QEwkPv8+xal7
	tAu74F1+v83gw/T+KgpoWJBGA43gba09Ipwb3Wgp8NoQDKLAW37sq6rXKhwHKe7SLeePIZRwJUOlm
	vLrT6nANIMVL7BP9lD1LTCTLbe2nWDS+8CPDk6A2p0vazOoSGlLdmK6vx01MX3GRFTJFaJnfdUqRM
	Oca+MUDg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdhmp-0000000FulG-0kQf;
	Thu, 08 Jan 2026 04:38:15 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vdhmj-0000000Fukq-0pcO
	for linux-arm-kernel@lists.infradead.org;
	Thu, 08 Jan 2026 04:38:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1767847080;
	bh=8w+4kS8oviIJ1/b1qQY5a5+JdYhA96gyY7sZoMxlfMA=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=Y+4sqjh7NQpfRBHAH2pqggJOoc0Ka3hgEv8VB89PR6jhWoSGcIUvp2F9Nsw3AIBoi
	 za1MHiStDrgGOUif7LAivufaHT5LBmrSufhMWecXMp/d/QAoJQVT0e36/riX1HHM4E
	 6Xyf4xH3U/6ZUaphkUJqfHzpojV5jHcqrbWwlcue8EEqyZiYb4ePiFkKAWzucU68ke
	 kDKoCHBa1gHpanV7R06mzD9b7ExkhFyGrLt10OBvnCqTmAyq2Nwk6/qTu2KH3Zj9G2
	 7oXw+rTYU/mUuLvlagR/8rJ2HKQsJiNWpNSGceBipC3kmpSpd1wJJ9D79jxx4O/GqC
	 zQnQzg3VS6MMA==
Received: from [192.168.68.115] (unknown [180.150.112.60])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id E1E4979F8C;
	Thu,  8 Jan 2026 12:37:58 +0800 (AWST)
Message-ID: <baa2e4e86b0b6851a56ef97501f6cad67d7970e6.camel@codeconstruct.com.au>
Subject: Re: [PATCH v2 2/2] ARM: dts: aspeed: ventura2: Add Meta ventura2 BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: Kyle Hsieh <kylehsieh1995@gmail.com>, Rob Herring <robh@kernel.org>, 
 Krzysztof Kozlowski
	 <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, Joel Stanley
	 <joel@jms.id.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Date: Thu, 08 Jan 2026 15:07:58 +1030
In-Reply-To: <20251224-ventura2_initial_dts-v2-2-f193ba5d4073@gmail.com>
References: <20251224-ventura2_initial_dts-v2-0-f193ba5d4073@gmail.com>
	 <20251224-ventura2_initial_dts-v2-2-f193ba5d4073@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260107_203811_985213_E478C1ED 
X-CRM114-Status: GOOD (  18.78  )
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

On Wed, 2025-12-24 at 14:44 +0800, Kyle Hsieh wrote:
> Add linux device tree entry related to the Meta(Facebook) rmc-node.
> The system use an AT2600 BMC.
> This node is named "ventura2".
>=20
> Signed-off-by: Kyle Hsieh <kylehsieh1995@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=
=A0=C2=A0=C2=A0 1 +
> =C2=A0.../dts/aspeed/aspeed-bmc-facebook-ventura2.dts=C2=A0=C2=A0=C2=A0 |=
 2945 ++++++++++++++++++++
> =C2=A02 files changed, 2946 insertions(+)
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 9adf9278dc94..6b96997629d4 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-facebook-minipack.dtb \
> =C2=A0	aspeed-bmc-facebook-santabarbara.dtb \
> =C2=A0	aspeed-bmc-facebook-tiogapass.dtb \
> +	aspeed-bmc-facebook-ventura2.dtb \
> =C2=A0	aspeed-bmc-facebook-wedge40.dtb \
> =C2=A0	aspeed-bmc-facebook-wedge100.dtb \
> =C2=A0	aspeed-bmc-facebook-wedge400-data64.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts b/=
arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> new file mode 100644
> index 000000000000..e22bbaf519ea
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura2.dts
> @@ -0,0 +1,2945 @@
> +// SPDX-License-Identifier: GPL-2.0
> +// Copyright (c) 2023 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model =3D "Facebook ventura2 RMC";
> +	compatible =3D "facebook,ventura2-rmc", "aspeed,ast2600";
> +	aliases {
> +		serial4 =3D &uart5;
> +
> +	=09

*snip*

> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial4:57600n8";
> +	};
> +
> +	iio-hwmon {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +		<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +		<&adc1 2>;
> +	};
> +
> +	leds {
> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			label =3D "bmc_heartbeat_amber";
> +			gpios =3D <&gpio0 ASPEED_GPIO(P, 7) GPIO_ACTIVE_LOW>;
> +			linux,default-trigger =3D "heartbeat";
> +		};
> +
> +		led-1 {
> +			label =3D "fp_id_amber";
> +			default-state =3D "off";
> +			gpios =3D <&gpio0 ASPEED_GPIO(B, 5) GPIO_ACTIVE_HIGH>;
> +		};
> +
> +		led-2 {
> +			label =3D "bmc_ready_noled";
> +			default-state =3D "on";
> +			gpios =3D <&gpio0 ASPEED_GPIO(B, 3) (GPIO_ACTIVE_HIGH|GPIO_TRANSITORY=
)>;
> +		};
> +
> +		led-3 {
> +			label =3D "power_blue";
> +			default-state =3D "off";
> +			gpios =3D <&gpio0 ASPEED_GPIO(P, 4) GPIO_ACTIVE_HIGH>;
> +		};
> +	};
> +
> +	fan_leds {

Can you please order these unit-address-less nodes (iio-hwmon, leds,
fan_leds, etc) alphabetically?

> +		compatible =3D "gpio-leds";
> +
> +		led-0 {
> +			label =3D "fcb0fan0_ledd1_blue";
> +			default-state =3D "off";
> +			gpios =3D <&fan_io_expander0 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-1 {
> +			label =3D "fcb0fan1_ledd2_blue";
> +			default-state =3D "off";
> +			gpios =3D <&fan_io_expander0 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-2 {
> +			label =3D "fcb0fan2_ledd3_blue";
> +			default-state =3D "off";
> +			gpios =3D <&fan_io_expander1 0 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-3 {
> +			label =3D "fcb0fan3_ledd4_blue";
> +			default-state =3D "off";
> +			gpios =3D <&fan_io_expander1 1 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-4 {
> +			label =3D "fcb0fan0_ledd1_amber";
> +			default-state =3D "off";
> +			gpios =3D <&fan_io_expander0 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-5 {
> +			label =3D "fcb0fan1_ledd2_amber";
> +			default-state =3D "off";
> +			gpios =3D <&fan_io_expander0 5 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-6 {
> +			label =3D "fcb0fan2_ledd3_amber";
> +			default-state =3D "off";
> +			gpios =3D <&fan_io_expander1 4 GPIO_ACTIVE_LOW>;
> +		};
> +
> +		led-7 {
> +			label =3D "fcb0fan3_ledd4_amber";
> +			default-state =3D "off";
> +			gpios =3D <&fan_io_expander1 5 GPIO_ACTIVE_LOW>;
> +		};
> +	};
> +
> +	memory@80000000 {
> +		device_type =3D "memory";
> +		reg =3D <0x80000000 0x80000000>;
> +	};
> +
> +	p1v8_bmc_aux: regulator-p1v8-bmc-aux {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "p1v8_bmc_aux";
> +		regulator-min-microvolt =3D <1800000>;
> +		regulator-max-microvolt =3D <1800000>;
> +		regulator-always-on;
> +	};
> +
> +	p2v5_bmc_aux: regulator-p2v5-bmc-aux {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "p2v5_bmc_aux";
> +		regulator-min-microvolt =3D <2500000>;
> +		regulator-max-microvolt =3D <2500000>;
> +		regulator-always-on;
> +	};
> +
> +	p5v_dac_aux: regulator-p5v-bmc-aux {
> +		compatible =3D "regulator-fixed";
> +		regulator-name =3D "p5v_dac_aux";
> +		regulator-min-microvolt =3D <5000000>;
> +		regulator-max-microvolt =3D <5000000>;
> +		regulator-always-on;
> +	};
> +
> +	spi1_gpio: spi {
> +		compatible =3D "spi-gpio";
> +		#address-cells =3D <1>;
> +		#size-cells =3D <0>;
> +
> +		sck-gpios =3D <&gpio0 ASPEED_GPIO(Z, 3) GPIO_ACTIVE_HIGH>;
> +		mosi-gpios =3D <&gpio0 ASPEED_GPIO(Z, 4) GPIO_ACTIVE_HIGH>;
> +		miso-gpios =3D <&gpio0 ASPEED_GPIO(Z, 5) GPIO_ACTIVE_HIGH>;
> +		cs-gpios =3D <&gpio0 ASPEED_GPIO(Z, 0) GPIO_ACTIVE_LOW>;
> +		num-chipselects =3D <1>;
> +
> +		tpm@0 {
> +			compatible =3D "infineon,slb9670", "tcg,tpm_tis-spi";
> +			spi-max-frequency =3D <33000000>;
> +			reg =3D <0>;
> +		};
> +	};
> +};
> +
> +&fmc {
> +	status =3D "okay";
> +	flash@0 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "bmc";
> +		spi-max-frequency =3D <50000000>;
> +		#include "openbmc-flash-layout-128.dtsi"
> +	};
> +	flash@1 {
> +		status =3D "okay";
> +		m25p,fast-read;
> +		label =3D "alt-bmc";
> +		spi-max-frequency =3D <50000000>;
> +	};
> +};
> +
> +&peci0 {
> +	status =3D "okay";
> +};
> +
> +&mac2 {

Same for all the phandle-referenced nodes throughout: please order them
alphabetically. Another possible ordering is in unit address order, but
I prefer alphabetical in the dts because there's no unit address in
sight (it's in the corresponding dtsi).

> +	status =3D "okay";
> +	phy-mode =3D "rmii";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii3_default>;
> +	fixed-link {
> +		speed =3D <100>;
> +		full-duplex;
> +	};

Andrew Lunn asked for a comment justifying the fixed-link node in [1]
and you said you'd add it in [2], but there's no comment? Can you
please add it?

[1]: https://lore.kernel.org/all/32ff7ca8-9cb0-4889-adb0-a6dae735630b@lunn.=
ch/
[2]: https://lore.kernel.org/all/CAF7HswMRrs9hwKo_uHCLMtx7+h46-DPEJRcEqu0-z=
EG4CVvvjg@mail.gmail.com/

> +};
> +
> +&mac3 {
> +	status =3D "okay";
> +	pinctrl-names =3D "default";
> +	pinctrl-0 =3D <&pinctrl_rmii4_default>;
> +	use-ncsi;
> +};
>=20

*snip*

> +
> +&sgpiom0 {
> +	status =3D "okay";
> +	ngpios =3D <128>;
> +	bus-frequency =3D <2000000>;
> +	gpio-line-names =3D
> +	/*"input pin","output pin"*/
> +	/*A0 - A7*/
> +	"power-chassis-good","FM_PLD_HEARTBEAT_LVC3_R",
> +	"host0-ready","",
> +	"CONTROL_VT2_SUPPLY1_CLOSE","FM_MDIO_SW_SEL_PLD",
> +	"CONTROL_VT2_SUPPLY2_CLOSE","FM_88E6393X_BIN_UPDATE_EN_N",
> +	"CONTROL_VT2_SUPPLY3_CLOSE","Sequence_TransFR_Alert",
> +	"RETURN_CNTL1_FB","WATER_VALVE1_OPEN",
> +	"RETURN_CNTL2_FB","WATER_VALVE2_OPEN",
> +	"RETURN_CNTL3_FB","WATER_VALVE3_OPEN",
> +	/*B0 - B7*/
> +	"IT_STOP_PUMP_R_CPLD","WATER_VALVE1_CLOSE",
> +	"IT_STOP_PUMP_SPARE_R_CPLD","WATER_VALVE2_CLOSE",
> +	"IT_STOP_PUMP_2_R_CPLD","WATER_VALVE3_CLOSE",
> +	"IT_STOP_PUMP_SPARE_2_R_CPLD","REPORT_VT2_SUPPLY1_CLOSE",
> +	"RPU_2_READY_SPARE_PLD_R","REPORT_VT2_SUPPLY2_CLOSE",
> +	"RPU_2_READY_PLD_R","REPORT_VT2_SUPPLY3_CLOSE",
> +	"RPU_READY_SPARE_PLD_R","PCIE_SSD1_PRSNT_N",
> +	"RPU_READY_PLD_R","",
> +	/*C0 - C7*/
> +	"IOEXP8_INT_N","",
> +	"SUPPLY_CNTL1_FB","",
> +	"SUPPLY_CNTL2_FB","",
> +	"SUPPLY_CNTL3_FB","",
> +	"PRSNT_TRAY1_TO_40_R_BUF_N","",
> +	"PWRGD_TRAY1_TO_40_R_BUF","",
> +	"SMALL_LEAK_TRAY1_TO_40_R_BUF_N","",
> +	"LEAK_DETECT_TRAY1_TO_40_R_BUF_N","",
> +	/*D0 - D7*/
> +	"PRSNT_CANBUSP1_TRAY1_TO_32_N","",
> +	"PWRGD_CANBUSP1_TRAY1_TO_32_PWROK","",
> +	"SMALL_LEAK_CANBUSP1_TRAY1_TO_32_N","",
> +	"LEAK_DETECT_CANBUSP1_TRAY1_TO_32_N","",
> +	"PRSNT_CANBUSP2_TRAY1_TO_32_N","",
> +	"PWRGD_CANBUSP2_TRAY1_TO_32_PWROK","",
> +	"SMALL_LEAK_CANBUSP2_TRAY1_TO_32_N","",
> +	"LEAK_DETECT_CANBUSP2_TRAY1_TO_32_N","",
> +	/*E0 - E7*/
> +	"PRSNT_CANBUSP3_TRAY1_TO_32_N","",
> +	"PWRGD_CANBUSP3_TRAY1_TO_32_PWROK","",
> +	"SMALL_LEAK_CANBUSP3_TRAY1_TO_32_N","",
> +	"LEAK_DETECT_CANBUSP3_TRAY1_TO_32_N","",
> +	"PRSNT_CANBUSP4_TRAY1_TO_32_N","",
> +	"PWRGD_CANBUSP4_TRAY1_TO_32_PWROK","",
> +	"SMALL_LEAK_CANBUSP4_TRAY1_TO_32_N","",
> +	"LEAK_DETECT_CANBUSP4_TRAY1_TO_32_N","",
> +	/*F0 - F7*/
> +	"PRSNT_CANBUSP5_TRAY1_TO_32_N","",
> +	"PWRGD_CANBUSP5_TRAY1_TO_32_PWROK","",
> +	"SMALL_LEAK_CANBUSP5_TRAY1_TO_32_N","",
> +	"LEAK_DETECT_CANBUSP5_TRAY1_TO_32_N","",
> +	"PRSNT_CANBUSP6_TRAY1_TO_32_N","",
> +	"PWRGD_CANBUSP6_TRAY1_TO_32_PWROK","",
> +	"SMALL_LEAK_CANBUSP6_TRAY1_TO_32_N","",
> +	"LEAK_DETECT_CANBUSP6_TRAY1_TO_32_N","",
> +	/*G0 - G7*/
> +	"PRSNT_CANBUSP7_TRAY1_TO_32_N","",
> +	"PWRGD_CANBUSP7_TRAY1_TO_32_PWROK","",
> +	"SMALL_LEAK_CANBUSP7_TRAY1_TO_32_N","",
> +	"LEAK_DETECT_CANBUSP7_TRAY1_TO_32_N","",
> +	"PRSNT_CANBUSP8_TRAY1_TO_32_N","",
> +	"PWRGD_CANBUSP8_TRAY1_TO_32_PWROK","",
> +	"SMALL_LEAK_CANBUSP8_TRAY1_TO_32_N","",
> +	"LEAK_DETECT_CANBUSP8_TRAY1_TO_32_N","",
> +	/*H0 - H7*/
> +	"wCHASSIS0_LEAK_Q_N_R","",
> +	"wCHASSIS1_LEAK_Q_N_R","",
> +	"wCHASSIS2_LEAK_Q_N_R","",
> +	"wCHASSIS3_LEAK_Q_N_R","",
> +	"wCHASSIS4_LEAK_Q_N_R","",
> +	"wCHASSIS5_LEAK_Q_N_R","",
> +	"wCHASSIS6_LEAK_Q_N_R","",
> +	"wCHASSIS7_LEAK_Q_N_R","",
> +	/*I0 - I7*/
> +	"wCHASSIS8_LEAK_Q_N_R","",
> +	"wCHASSIS9_LEAK_Q_N_R","",
> +	"wCHASSIS10_LEAK_Q_N_R","",
> +	"wCHASSIS11_LEAK_Q_N_R","",
> +	"wAALC_RPU_READY","",

Out of curiosity, what's going on with the lower-case 'w' prefix here
(and again below)?

> +	"","",
> +	"","",
> +	"","",
> +	/*J0 - J7*/
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	/*K0 - K7*/
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	/*L0 - L7*/
> +	"wIT_GEAR_RPU_2_LINK_PRSNT_SPARE_N_R","",
> +	"wIT_GEAR_RPU_2_LINK_PRSNT_N_R","",
> +	"wIT_GEAR_RPU_LINK_PRSNT_SPARE_N_R","",
> +	"wIT_GEAR_RPU_LINK_PRSNT_N_R","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	/*M0 - M7*/
> +	"","",
> +	"","",
> +	"wPRSNT_SENSOR_N","",
> +	"wPRSNT3_VT2_PLD_N","",
> +	"wPRSNT2_VT2_PLD_N","",
> +	"wPRSNT1_VT2_PLD_N","",
> +	"wPRSNT3_RETURN_PLD_N","",
> +	"wPRSNT2_RETURN_PLD_N","",
> +	/*N0 - N7*/
> +	"wPRSNT1_RETURN_PLD_N","",
> +	"wPRSNT3_SUPPLY_PLD_N","",
> +	"wPRSNT2_SUPPLY_PLD_N","",
> +	"wPRSNT1_SUPPLY_PLD_N","",
> +	"wPRSNT_LEAK11_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK10_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK9_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK8_SENSOR_R_PLD_N","",
> +	/*O0 - O7*/
> +	"wPRSNT_LEAK7_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK6_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK5_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK4_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK3_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK2_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK1_SENSOR_R_PLD_N","",
> +	"wPRSNT_LEAK0_SENSOR_R_PLD_N","",
> +	/*P0 - P7*/
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","",
> +	"","";
> +};
>=20
>=20

*snip*

> +
> +&i2c6 {
> +	status =3D "okay";
> +
> +	eeprom@50 {
> +		compatible =3D "atmel,24c64";
> +		reg =3D <0x50>;
> +	};
> +
> +	io_expander0: gpio@20 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x20>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	io_expander1: gpio@21 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x21>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	io_expander2: gpio@22 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x22>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	io_expander7: gpio@23 {
> +		compatible =3D "nxp,pca9555";
> +		reg =3D <0x23>;
> +		gpio-controller;
> +		#gpio-cells =3D <2>;
> +	};
> +
> +	rtc@51 {
> +		compatible =3D "nxp,pcf8563";
> +		reg =3D <0x51>;
> +	};
> +};
> +

*snip*

> +
> +&io_expander0 {

io_expander0 is a label you've defined in this same dts, just above.
Please just include the properties in the original node directly, don't
separate them like this.

Same applies to all other cases of the same pattern.

Andrew

> +	gpio-line-names =3D
> +	"RST_POE_BMC_N", "POE_DISABLE_BMC_N_R",
> +	"RST_FT4232_1_BMC_N_R", "RST_FT4232_2_BMC_N_R",
> +	"RST_FT4232_3_BMC_N_R", "PRSNT_FANBP_0_PWR_N",
> +	"PRSNT_FANBP_0_SIG_N", "PRSNT_POE_PWR_N",
> +	"PRSNT_POE_SIG_N", "IRQ_POE_BMC_N_R",
> +	"PWRGD_P3V3_ISO_POE_BMC_R", "88E6393X_INT_N_R",
> +	"P48V_HSC_ALERT_N", "SMB_TMC75_TEMP_ALERT_N_R",
> +	"DEV_DIS_N", "PCI_DIS_N";
> +};
> +

