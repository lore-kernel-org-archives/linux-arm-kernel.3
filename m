Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2AB8ECCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 21 Oct 2025 09:50:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=A1REa0dzHBKzz3cn0Ab7+SHLOniVTgR9AY4Q1QKl0Cc=; b=Bco90aS7znUwe40Upi6lsA5ZrM
	ekLl2jKTOd1U5V3WMBNAUxj45SzSwnYBpZuraL+CTuDWOzUB2sDzLBmPLSb3i6LKsB/58vpWcSKHt
	mlSX/Q968sSKu+HDkVsAGzWXpbAk2FRwXxQUEua4h5rzacuIrhNhqtpPmT5NHnfxph2TT3RIeV5LO
	9TLATvI2elzlEdWia8aqqY90Yzi4R64UguGINszgYof8wGYIepq/I+7/xUR201sFex5MGbrOub8sz
	Aayh8pS+cgXr8TTJiURqi9D032Rl9cjOQdzw8X8AZjZIZCrR5p/jdp3og0/rOdXh8Ce17NKwbKHoY
	HAOoXwfQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB90h-0000000GX2S-0jEJ;
	Tue, 21 Oct 2025 09:50:31 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vB90e-0000000GX1e-29gd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 21 Oct 2025 09:50:29 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mkl@pengutronix.de>)
	id 1vB90U-0007Cl-PC; Tue, 21 Oct 2025 11:50:18 +0200
Received: from moin.white.stw.pengutronix.de ([2a0a:edc0:0:b01:1d::7b] helo=bjornoya.blackshift.org)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mkl@pengutronix.de>)
	id 1vB90S-004hSx-16;
	Tue, 21 Oct 2025 11:50:16 +0200
Received: from pengutronix.de (p54b152ce.dip0.t-ipconnect.de [84.177.82.206])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(Client did not present a certificate)
	(Authenticated sender: mkl-all@blackshift.org)
	by smtp.blackshift.org (Postfix) with ESMTPSA id 087BF48BFEE;
	Tue, 21 Oct 2025 09:50:16 +0000 (UTC)
Date: Tue, 21 Oct 2025 11:50:13 +0200
From: Marc Kleine-Budde <mkl@pengutronix.de>
To: Primoz Fiser <primoz.fiser@norik.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Shawn Guo <shawnguo@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Fabio Estevam <festevam@gmail.com>, devicetree@vger.kernel.org, 
	upstream@lists.phytec.de, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, imx@lists.linux.dev
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Add phyBOARD-Segin-i.MX91
 support
Message-ID: <20251021-bright-brave-dolphin-906891-mkl@pengutronix.de>
References: <20251021093704.690410-1-primoz.fiser@norik.com>
 <20251021093704.690410-2-primoz.fiser@norik.com>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="7y2hkmghfrzgq4ye"
Content-Disposition: inline
In-Reply-To: <20251021093704.690410-2-primoz.fiser@norik.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mkl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251021_025028_553178_6AE2883A 
X-CRM114-Status: GOOD (  23.52  )
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


--7y2hkmghfrzgq4ye
Content-Type: text/plain; protected-headers=v1; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable
Subject: Re: [PATCH 2/2] arm64: dts: freescale: Add phyBOARD-Segin-i.MX91
 support
MIME-Version: 1.0

On 21.10.2025 11:37:04, Primoz Fiser wrote:
> Add initial support for the PHYTEC phyBOARD-Segin-i.MX91 board [1] based
> on the PHYTEC phyCORE-i.MX91 SoM (System-on-Module) [2].
>=20
> Supported features:
> * Audio
> * CAN
> * eMMC
> * Ethernet
> * I2C
> * RTC
> * SD-Card
> * UART
> * USB
>=20
> For more details see the product pages for the development board and the
> SoM:
>=20
> [1] https://www.phytec.eu/en/produkte/development-kits/phyboard-segin-kit/
> [2] https://www.phytec.eu/en/produkte/system-on-modules/phycore-imx-91-93/
>=20
> Signed-off-by: Primoz Fiser <primoz.fiser@norik.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../dts/freescale/imx91-phyboard-segin.dts    | 344 ++++++++++++++++++
>  .../boot/dts/freescale/imx91-phycore-som.dtsi | 304 ++++++++++++++++
>  3 files changed, 649 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx91-phycore-som.dtsi
>=20
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts=
/freescale/Makefile
> index 525ef180481d..34a81d34de39 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -344,6 +344,7 @@ dtb-$(CONFIG_ARCH_MXC) +=3D imx8qxp-tqma8xqps-mb-smar=
c-2.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8ulp-9x9-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx8ulp-evk.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-11x11-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) +=3D imx91-phyboard-segin.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx91-tqma9131-mba91xxca.dtb
>  dtb-$(CONFIG_ARCH_MXC) +=3D imx93-9x9-qsb.dtb
> =20
> diff --git a/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts b/arc=
h/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
> new file mode 100644
> index 000000000000..bb631439f9cf
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx91-phyboard-segin.dts
> @@ -0,0 +1,344 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright (C) 2025 PHYTEC Messtechnik GmbH
> + * Author: Christoph Stoidner <c.stoidner@phytec.de>
> + *
> + * Product homepage:
> + * phyBOARD-Segin carrier board is reused for the i.MX91 design.
> + * https://www.phytec.eu/en/produkte/single-board-computer/phyboard-segi=
n-imx6ul/
> + */
> +/dts-v1/;
> +
> +#include "imx91-phycore-som.dtsi"
> +
> +/{
> +	model =3D "PHYTEC phyBOARD-Segin-i.MX91";
> +	compatible =3D "phytec,imx91-phyboard-segin", "phytec,imx91-phycore-som=
",
> +		     "fsl,imx91";
> +
> +	aliases {
> +		ethernet1 =3D &eqos;
> +		gpio0 =3D &gpio1;
> +		gpio1 =3D &gpio2;
> +		gpio2 =3D &gpio3;
> +		gpio3 =3D &gpio4;
> +		i2c0 =3D &lpi2c1;
> +		i2c1 =3D &lpi2c2;
> +		mmc0 =3D &usdhc1;
> +		mmc1 =3D &usdhc2;
> +		rtc0 =3D &i2c_rtc;
> +		rtc1 =3D &bbnsm_rtc;
> +		serial0 =3D &lpuart1;
> +	};
> +
> +	chosen {
> +		stdout-path =3D &lpuart1;
> +	};
> +
> +	flexcan1_tc: can-phy0 {
> +		compatible =3D "ti,tcan1043";
> +		#phy-cells =3D <0>;
> +		max-bitrate =3D <1000000>;
> +		pinctrl-names =3D "default";
> +		pinctrl-0 =3D <&pinctrl_flexcan1_tc>;
> +		enable-gpios =3D <&gpio4 16 GPIO_ACTIVE_HIGH>;
> +	};

I think the tcan1043 is a CAN-FD transceiver. According to the datasheet
it support 2 MBit/s and 5 MBit/s in the "G" variant. However due to the
board layout, etc, the actual bit rate might still be limited to 1
MBit/s. Ask the HW engineers if in doubt.

regards,
Marc

--=20
Pengutronix e.K.                 | Marc Kleine-Budde          |
Embedded Linux                   | https://www.pengutronix.de |
Vertretung N=C3=BCrnberg              | Phone: +49-5121-206917-129 |
Amtsgericht Hildesheim, HRA 2686 | Fax:   +49-5121-206917-9   |

--7y2hkmghfrzgq4ye
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEn/sM2K9nqF/8FWzzDHRl3/mQkZwFAmj3V1IACgkQDHRl3/mQ
kZxWzAf/fxSz9NDY21Y3KxeV/w5epdWrucWsqqjsdEU0ACBO7vaDLgzQBWrWylM3
SbMwTG47o3YVQKQN9VZAz+niqnsspW+Zd5rka7aOkKN0m7omFZ0WZOqiLlURa1Xb
rXCDGM6ac6ZoCR9QBQkOvFjEEdPriF/nF5IUNiL+ks5846ZXclCTvoEjtDTuioxP
3Hjb3c3QyssbVWhUaHrSqnhqasjk54wRXEpnJjylB/Q2Qp5uuaETw2X4J1bowuDf
Z4GCVUwENM2y5kG7PW5Jz4fQgHc+AZJiMBPDQ3viDtZHBNlAJjybRdJE9k/p9ONq
gjwagBiM9rNg3GWhkkg0k8VTAv+5mw==
=pBli
-----END PGP SIGNATURE-----

--7y2hkmghfrzgq4ye--

