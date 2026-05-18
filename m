Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8C35ECD4F3C
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 18 May 2026 12:22:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:MIME-Version:
	Content-Transfer-Encoding:Content-Type:References:In-Reply-To:Date:Cc:To:From
	:Subject:Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oHFWziLvncRM91/hv45QHybaLAi9Rx72zyGVXfpBHSY=; b=Qy0xRWmmYPb5qq/1Ryxm36qk9v
	o6W4hWpFOuFbTcrlPlEjAmPeWw9UhxT4f1UGMpo+jsvIPB4npxCGzW7yMR/GFPW+IlcwKP0eELfbE
	6lRNowXieawCB1Dix2ZKsIro3trBcAYv3yIIRIhAfV+njixfCXBPm41RaVYJZazJ4orvIcs8SCsYk
	wk26ySr708WDNdQsWJoKP0S7Ty3MI7pMHESyyJKav5XU9FLgjr09tn/pWP4Yeq96Dd0b2tkbRzsMk
	EbKXEhIvjRLIO3FpdntPi4LPEg7WqT9YU2G/3A31pwsU+/G7FqlLRFgBbxgem46ZB8l4w4vzzGmQy
	inZmjWeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwz8-0000000Fc2E-2Pu5;
	Mon, 18 May 2026 12:22:14 +0000
Received: from pi.codeconstruct.com.au ([203.29.241.158] helo=codeconstruct.com.au)
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wOwz5-0000000Fc08-1atr
	for linux-arm-kernel@lists.infradead.org;
	Mon, 18 May 2026 12:22:13 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
	d=codeconstruct.com.au; s=2022a; t=1779106926;
	bh=oHFWziLvncRM91/hv45QHybaLAi9Rx72zyGVXfpBHSY=;
	h=Subject:From:To:Cc:Date:In-Reply-To:References;
	b=dwnG5/yL+eIioBdYDufbaQO2CbDUv/QlepkSyOxUnpJIvJqqekxWCN6gcZg5xxrjv
	 FPaUEVzokmrjgz3icibmQZ0nXfqNNItRZBLmFH13t9bP4Qfpu/ikoWMN+Mf3przGCa
	 +5NgQbpiYSTHytvXpZP1y3PVwUnwrfnmzasJgNYJgXPjzIshUmszQo5Z051BYFigz2
	 Ll8YPaQYGQDqYOSNLp7EgM1PTOdOir2aa1GKJXfAETkfLIOtdP9c4bq8UxzosrOStq
	 PBXt4X0AKUSfDYWnrWl3HFpnW/gwhSN4TeWIAIXJA5U5X4QA5geRKEjK8e3cTiK7lz
	 jvAYxcjUyqLVw==
Received: from [192.168.68.117] (unknown [180.150.112.11])
	by mail.codeconstruct.com.au (Postfix) with ESMTPSA id DFEF26024D;
	Mon, 18 May 2026 20:22:05 +0800 (AWST)
Message-ID: <e5d1cbdb34dddf17b4d474446fb9cebddc0894d9.camel@codeconstruct.com.au>
Subject: Re: [PATCH v13 2/2] arm: dts: aspeed: ventura: add Meta Ventura BMC
From: Andrew Jeffery <andrew@codeconstruct.com.au>
To: "P.K. Lee" <pkleequanta@gmail.com>, robh+dt@kernel.org, 
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org, joel@jms.id.au, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Cc: Jason-Hsu@quantatw.com, p.k.lee@quantatw.com
Date: Mon, 18 May 2026 21:52:05 +0930
In-Reply-To: <20260407081700.2658011-3-pkleequanta@gmail.com>
References: <20260407081700.2658011-1-pkleequanta@gmail.com>
	 <20260407081700.2658011-3-pkleequanta@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
User-Agent: Evolution 3.56.2-0+deb13u1 
MIME-Version: 1.0
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260518_052211_656269_5BC098E9 
X-CRM114-Status: GOOD (  17.96  )
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

Hi P.K.

On Tue, 2026-04-07 at 16:17 +0800, P.K. Lee wrote:
> Add Linux device tree related to Meta (Facebook) Ventura specific
> devices connected to the BMC (AST2600) SoC. The purpose of Ventura is to
> detect liquid leakage from all compute trays, switch trays and rack
> sensors within the rack, log the events, and take necessary actions
> accordingly.
>=20
> Signed-off-by: P.K. Lee <pkleequanta@gmail.com>
> ---
> =C2=A0arch/arm/boot/dts/aspeed/Makefile=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=
=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0=C2=A0 |=C2=A0=C2=A0=C2=A0 1 +
> =C2=A0.../aspeed/aspeed-bmc-facebook-ventura.dts=C2=A0=C2=A0=C2=A0 | 1636=
 +++++++++++++++++
> =C2=A02 files changed, 1637 insertions(+)
> =C2=A0create mode 100644 arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ven=
tura.dts
>=20
> diff --git a/arch/arm/boot/dts/aspeed/Makefile b/arch/arm/boot/dts/aspeed=
/Makefile
> index 0f0b5b707654..f5ac72d5933c 100644
> --- a/arch/arm/boot/dts/aspeed/Makefile
> +++ b/arch/arm/boot/dts/aspeed/Makefile
> @@ -32,6 +32,7 @@ dtb-$(CONFIG_ARCH_ASPEED) +=3D \
> =C2=A0	aspeed-bmc-facebook-minipack.dtb \
> =C2=A0	aspeed-bmc-facebook-santabarbara.dtb \
> =C2=A0	aspeed-bmc-facebook-tiogapass.dtb \
> +	aspeed-bmc-facebook-ventura.dtb \
> =C2=A0	aspeed-bmc-facebook-wedge40.dtb \
> =C2=A0	aspeed-bmc-facebook-wedge100.dtb \
> =C2=A0	aspeed-bmc-facebook-wedge400-data64.dtb \
> diff --git a/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts b/a=
rch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts
> new file mode 100644
> index 000000000000..6ce6201f7755
> --- /dev/null
> +++ b/arch/arm/boot/dts/aspeed/aspeed-bmc-facebook-ventura.dts
> @@ -0,0 +1,1636 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +// Copyright (c) 2023 Facebook Inc.
> +/dts-v1/;
> +
> +#include "aspeed-g6.dtsi"
> +#include <dt-bindings/i2c/i2c.h>
> +#include <dt-bindings/gpio/aspeed-gpio.h>
> +
> +/ {
> +	model =3D "Facebook ventura RMC";

I suggest capitalising 'Ventura'.

> +	compatible =3D "facebook,ventura-rmc", "aspeed,ast2600";
> +
> +	aliases {
> +		serial4 =3D &uart5;
> +		i2c16 =3D &i2c3mux0ch3;
> +		i2c17 =3D &i2c3mux0ch4;
> +		i2c18 =3D &i2c3mux0ch5;
> +		i2c19 =3D &i2c3mux0ch6;
> +		i2c20 =3D &i2c3mux0ch0;
> +		i2c21 =3D &i2c3mux0ch1;
> +		i2c22 =3D &i2c3mux0ch2;
> +		i2c23 =3D &i2c3mux0ch7;
> +		i2c24 =3D &i2c0mux0ch0;
> +		i2c25 =3D &i2c0mux0ch1;
> +		i2c26 =3D &i2c0mux0ch2;
> +		i2c27 =3D &i2c0mux0ch3;
> +		i2c28 =3D &i2c0mux0ch4;
> +		i2c29 =3D &i2c0mux0ch5;
> +		i2c30 =3D &i2c0mux0ch6;
> +		i2c31 =3D &i2c0mux0ch7;
> +		i2c32 =3D &i2c1mux0ch0;
> +		i2c33 =3D &i2c1mux0ch1;
> +		i2c34 =3D &i2c1mux0ch2;
> +		i2c35 =3D &i2c1mux0ch3;
> +		i2c36 =3D &i2c1mux0ch4;
> +		i2c37 =3D &i2c1mux0ch5;
> +		i2c38 =3D &i2c1mux0ch6;
> +		i2c39 =3D &i2c1mux0ch7;
> +		i2c40 =3D &i2c2mux0ch0;
> +		i2c41 =3D &i2c2mux0ch1;
> +		i2c42 =3D &i2c2mux0ch2;
> +		i2c43 =3D &i2c2mux0ch3;
> +		i2c44 =3D &i2c2mux0ch4;
> +		i2c45 =3D &i2c2mux0ch5;
> +		i2c46 =3D &i2c2mux0ch6;
> +		i2c47 =3D &i2c2mux0ch7;

Many of the buses aliased here don't have any devices described below
them. Can you add some commentary about why it's necessary to enable
and alias each of these?

> +	};
> +
> +	chosen {
> +		stdout-path =3D "serial4:57600n8";
> +	};
> +
> +	iio-hwmon {
> +		compatible =3D "iio-hwmon";
> +		io-channels =3D <&adc0 0>, <&adc0 1>, <&adc0 2>, <&adc0 3>,
> +			<&adc0 4>, <&adc0 5>, <&adc0 6>, <&adc0 7>,
> +			<&adc1 2>;
> +	};
> +

...

> +		i2c3mux0ch4: i2c@4 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <4>;
> +
> +			adc@1f {
> +				compatible =3D "ti,adc128d818";
> +				reg =3D <0x1f>;
> +				ti,mode =3D /bits/ 8 <1>;
> +			};
> +
> +			fan_leds_g2_gpio: gpio@21 {
> +				compatible =3D "nxp,pca9555";
> +				reg =3D <0x21>;
> +				gpio-controller;
> +				#gpio-cells =3D <2>;
> +
> +				gpio-line-names =3D
> +				"", "",
> +				"", "",
> +				"", "",
> +				"", "",
> +				"FAN2_PRSNT", "FAN3_PRSNT",
> +				"", "",
> +				"", "",
> +				"", "";
> +			};
> +
> +			adc@35 {
> +				compatible =3D "maxim,max11617";
> +				reg =3D <0x35>;
> +			};
> +
> +			// Fan Board 1 FRU

I'd rather we pick one commenting style (/* */). Can you please fix
that throughout?

> +			eeprom@56 {
> +				compatible =3D "atmel,24c128";
> +				reg =3D <0x56>;
> +			};
> +		};
> +
> +		i2c3mux0ch5: i2c@5 {
> +			#address-cells =3D <1>;
> +			#size-cells =3D <0>;
> +			reg =3D <5>;
> +
> +			pwm@20 {
> +				compatible =3D "maxim,max31790";
> +				reg =3D <0x20>;
> +				#address-cells =3D <1>;
> +				#size-cells =3D <0>;
> +				channel@2 {
> +					reg =3D <2>;
> +					sensor-type =3D "TACH";
> +				};
> +				channel@5 {
> +					reg =3D <5>;
> +					sensor-type =3D "TACH";
> +				};
> +			};
> +
> +			hwmon: hwmon@23 {
> +				compatible =3D "nuvoton,nct7363";
> +				reg =3D <0x23>;
> +				#pwm-cells =3D <2>;
> +
> +				//fan 0 IL

Can you please add a space between the comment marker and the comment
itself? This needs fixing throughout.

> +				fan-0 {
> +					pwms =3D <&hwmon 0 20000>;
> +					tach-ch =3D /bits/ 8 <0x09>;
> +				};
> +
> +				//fan 0 OL
> +				fan-1 {
> +					pwms =3D <&hwmon 0 20000>;
> +					tach-ch =3D /bits/ 8 <0x0B>;
> +				};
> +
> +				//fan 1 IL
> +				fan-2 {
> +					pwms =3D <&hwmon 4 20000>;
> +					tach-ch =3D /bits/ 8 <0x0A>;
> +				};
> +
> +				//fan 1 OL
> +				fan-3 {
> +					pwms =3D <&hwmon 4 20000>;
> +					tach-ch =3D /bits/ 8 <0x0D>;
> +				};
> +
> +				//fan 2 IL
> +				fan-4 {
> +					pwms =3D <&hwmon 6 20000>;
> +					tach-ch =3D /bits/ 8 <0x0F>;
> +				};
> +
> +				//fan 2 OL
> +				fan-5 {
> +					pwms =3D <&hwmon 6 20000>;
> +					tach-ch =3D /bits/ 8 <0x01>;
> +				};
> +
> +				//fan 3 IL
> +				fan-6 {
> +					pwms =3D <&hwmon 10 20000>;
> +					tach-ch =3D /bits/ 8 <0x00>;
> +				};
> +
> +				//fan 3 OL
> +				fan-7 {
> +					pwms =3D <&hwmon 10 20000>;
> +					tach-ch =3D /bits/ 8 <0x03>;
> +				};
> +			};
> +		};
> +
>=20

...

> +
> +&mdio0 {
> +	status =3D "okay";
> +	/* * Intentionally left empty.

The comment is a bit busted here. Can you please fix it?

Andrew

> +	 * Enabled to allow user-space tools (e.g., mdio)
> +	 * to access the unmanaged Marvell switch registers.
> +	 */
> +};
> +

