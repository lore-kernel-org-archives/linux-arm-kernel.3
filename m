Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 095BFCD6E55
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  1 Jun 2026 11:20:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=NFsX5M3/BQWYPsdxRionmlvwUFJ6cNSjd2k05kOY7uE=; b=WHaM5dayYZkj76Y8faXIHjGzms
	Pd+cJDSHiM9oH5sokb/Q4tMeVY+dBuJ+RQT+J4uPiVY1/HhWlB8MUZZ6Zwc3LjZauYVyXRdCr6mZg
	4G7e8RIzIcVTsd+GAppFG3hCPHfGgRW8QkC+sGWgrLCH77QYbStjIn55FZougbG1x3HbhaX+IR83z
	y0R5SObNrDA27+4eFkSqq4kd+lKJ55G/ExIldVqnCzsrUJnKINijeeX75awIVkt6RMoj1PCLY31ov
	yTsK/wvFtRbl/Q91sSDlbCrU/Gs9j2SLbdH61afZhSnWiG9NSFxbdpc91GifzhBVNC6m9ww+74v00
	ywCTKEpQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0h6-0000000Aisl-0mqp;
	Mon, 01 Jun 2026 11:20:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wU0h4-0000000Airz-18aU
	for linux-arm-kernel@lists.infradead.org;
	Mon, 01 Jun 2026 11:20:31 +0000
Received: from monstersaurus.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1DB8B9D5;
	Mon,  1 Jun 2026 13:20:03 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1780312803;
	bh=EyLdGsu6HchzDPHk/fFMAtANQEe1SwYJEZN/XxQKdTg=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=ctwdNsWgZU8o4KjBqbSuZicvapSDvNqQQqjJiD9SYIZTUpNT4ixTeyY9OmRcSXqix
	 d/I5x3ov4E0nPfyjrDVqjf+L7Pz9yt9LAEB8VOMHqS0EqkjmrGyo4N9QaIpkRF/ojS
	 BGGpDrBqC3KZueC1q5flOYtbS+kmobL31LCQLnlA=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20260529132334.3333294-2-robby.cai@nxp.com>
References: <20260529132334.3333294-1-robby.cai@nxp.com> <20260529132334.3333294-2-robby.cai@nxp.com>
Subject: Re: [PATCH v3 1/2] arm64: dts: imx8mq-evk: Enable MIPI CSI and dual OV5640 cameras
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: kernel@pengutronix.de, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
To: Frank.Li@nxp.com, Robby Cai <robby.cai@nxp.com>, conor+dt@kernel.org, festevam@gmail.com, krzk+dt@kernel.org, mchehab@kernel.org, p.zabel@pengutronix.de, robh@kernel.org, s.hauer@pengutronix.de, sakari.ailus@linux.intel.com, sebastian.krzyszkowiak@puri.sm, slongerbeam@gmail.com
Date: Mon, 01 Jun 2026 12:20:22 +0100
Message-ID: <178031282290.662668.15145642423417739969@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260601_042030_463861_97473A97 
X-CRM114-Status: GOOD (  13.64  )
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

Quoting Robby Cai (2026-05-29 14:23:33)
> Enable the MIPI CSI-2 host controllers and CSI bridges, and add two
> OV5640 sensors on I2C1 and I2C2, forming two media pipelines:
>=20
>   - OV5640 (I2C2) -> MIPI CSI1 -> CSI1 bridge
>   - OV5640 (I2C1) -> MIPI CSI2 -> CSI2 bridge
>=20
> On the i.MX8MQ EVK, both sensors share a single reset GPIO line,
> while each sensor has an independent powerdown (PWDN) GPIO.
>=20
> Both sensors also share the same MCLK source (CLKO2), configured
> identically as required by the hardware design.

Shouldn't these be overlays? Does *every* IMX8MQ-EVK always have 2 x
OV5640 modules attached? And never anything else ?

--
Regards

Kieran

>=20
> Signed-off-by: Robby Cai <robby.cai@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mq-evk.dts | 150 +++++++++++++++++++
>  1 file changed, 150 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts b/arch/arm64/bo=
ot/dts/freescale/imx8mq-evk.dts
> index d48f901487d4..7ff1a763890a 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mq-evk.dts
> @@ -6,6 +6,7 @@
> =20
>  /dts-v1/;
> =20
> +#include <dt-bindings/media/video-interfaces.h>
>  #include "imx8mq.dtsi"
> =20
>  / {
> @@ -50,6 +51,20 @@ reg_usdhc2_vmmc: regulator-vsd-3v3 {
>                 enable-active-high;
>         };
> =20
> +       reg_1v5: regulator-1v5 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "DVDD_1V5";
> +               regulator-min-microvolt =3D <1500000>;
> +               regulator-max-microvolt =3D <1500000>;
> +       };
> +
> +       reg_2v8: regulator-2v8 {
> +               compatible =3D "regulator-fixed";
> +               regulator-name =3D "AVDD_2V8";
> +               regulator-min-microvolt =3D <2800000>;
> +               regulator-max-microvolt =3D <2800000>;
> +       };
> +
>         buck2_reg: regulator-buck2 {
>                 pinctrl-names =3D "default";
>                 pinctrl-0 =3D <&pinctrl_buck2>;
> @@ -172,6 +187,14 @@ &A53_3 {
>         cpu-supply =3D <&buck2_reg>;
>  };
> =20
> +&csi1 {
> +       status =3D "okay";
> +};
> +
> +&csi2 {
> +       status =3D "okay";
> +};
> +
>  &ddrc {
>         operating-points-v2 =3D <&ddrc_opp_table>;
>         status =3D "okay";
> @@ -330,12 +353,103 @@ vgen6_reg: vgen6 {
>                         };
>                 };
>         };
> +
> +       camera@3c {
> +               compatible =3D "ovti,ov5640";
> +               reg =3D <0x3c>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_camera2_pwdn>;
> +               clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +               clock-names =3D "xclk";
> +               assigned-clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +               assigned-clock-parents =3D <&clk IMX8MQ_SYS2_PLL_200M>;
> +               assigned-clock-rates =3D <20000000>;
> +               powerdown-gpios =3D <&gpio1 5 GPIO_ACTIVE_HIGH>;
> +               reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
> +               DOVDD-supply =3D <&sw4_reg>;
> +               AVDD-supply =3D <&reg_2v8>;
> +               DVDD-supply =3D <&reg_1v5>;
> +
> +               port {
> +                       camera2_ep: endpoint {
> +                               remote-endpoint =3D <&mipi_csi2_in_ep>;
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                       };
> +               };
> +       };
> +};
> +
> +&i2c2 {
> +       clock-frequency =3D <100000>;
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_i2c2>;
> +       status =3D "okay";
> +
> +       camera@3c {
> +               compatible =3D "ovti,ov5640";
> +               reg =3D <0x3c>;
> +               pinctrl-names =3D "default";
> +               pinctrl-0 =3D <&pinctrl_camera1_pwdn>;
> +               clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +               clock-names =3D "xclk";
> +               assigned-clocks =3D <&clk IMX8MQ_CLK_CLKO2>;
> +               assigned-clock-parents =3D <&clk IMX8MQ_SYS2_PLL_200M>;
> +               assigned-clock-rates =3D <20000000>;
> +               powerdown-gpios =3D <&gpio1 3 GPIO_ACTIVE_HIGH>;
> +               reset-gpios =3D <&gpio1 6 GPIO_ACTIVE_LOW>;
> +               DOVDD-supply =3D <&sw4_reg>;
> +               AVDD-supply =3D <&reg_2v8>;
> +               DVDD-supply =3D <&reg_1v5>;
> +
> +               port {
> +                       camera1_ep: endpoint {
> +                               remote-endpoint =3D <&mipi_csi1_in_ep>;
> +                               clock-lanes =3D <0>;
> +                               data-lanes =3D <1 2>;
> +                       };
> +               };
> +       };
>  };
> =20
>  &lcdif {
>         status =3D "okay";
>  };
> =20
> +&mipi_csi1 {
> +       assigned-clock-rates =3D <266000000>, <200000000>, <66000000>;
> +       status =3D "okay";
> +
> +       ports {
> +               port@0 {
> +                       reg =3D <0>;
> +
> +                       mipi_csi1_in_ep: endpoint {
> +                               remote-endpoint =3D <&camera1_ep>;
> +                               data-lanes =3D <1 2>;
> +                               bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                       };
> +               };
> +       };
> +};
> +
> +&mipi_csi2 {
> +       assigned-clock-rates =3D <266000000>, <200000000>, <66000000>;
> +       status =3D "okay";
> +
> +       ports {
> +               port@0 {
> +                       reg =3D <0>;
> +
> +                       mipi_csi2_in_ep: endpoint {
> +                               remote-endpoint =3D <&camera2_ep>;
> +                               data-lanes =3D <1 2>;
> +                               bus-type =3D <MEDIA_BUS_TYPE_CSI2_DPHY>;
> +                       };
> +               };
> +       };
> +};
> +
>  &mipi_dsi {
>         #address-cells =3D <1>;
>         #size-cells =3D <0>;
> @@ -532,12 +646,34 @@ &wdog1 {
>  };
> =20
>  &iomuxc {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_mclk>, <&pinctrl_camera_reset>;
> +
>         pinctrl_buck2: vddarmgrp {
>                 fsl,pins =3D <
>                         MX8MQ_IOMUXC_GPIO1_IO13_GPIO1_IO13              0=
x19
>                 >;
>         };
> =20
> +       pinctrl_camera1_pwdn: camera1pwdngrp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_GPIO1_IO03_GPIO1_IO3               0=
x19
> +               >;
> +       };
> +
> +       pinctrl_camera2_pwdn: camera2pwdngrp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_GPIO1_IO05_GPIO1_IO5               0=
x19
> +               >;
> +       };
> +
> +       /* Shared reset line for cameras on CSI1 and CSI2. */
> +       pinctrl_camera_reset: cameraresetgrp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_GPIO1_IO06_GPIO1_IO6               0=
x19
> +               >;
> +       };
> +
>         pinctrl_fec1: fec1grp {
>                 fsl,pins =3D <
>                         MX8MQ_IOMUXC_ENET_MDC_ENET1_MDC                 0=
x3
> @@ -565,12 +701,26 @@ MX8MQ_IOMUXC_I2C1_SDA_I2C1_SDA                    0=
x4000007f
>                 >;
>         };
> =20
> +       pinctrl_i2c2: i2c2grp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_I2C2_SCL_I2C2_SCL                  0=
x4000007f
> +                       MX8MQ_IOMUXC_I2C2_SDA_I2C2_SDA                  0=
x4000007f
> +               >;
> +       };
> +
>         pinctrl_ir: irgrp {
>                 fsl,pins =3D <
>                         MX8MQ_IOMUXC_GPIO1_IO12_GPIO1_IO12              0=
x4f
>                 >;
>         };
> =20
> +       /* Shared MCLK for cameras on CSI1 and CSI2. */
> +       pinctrl_mclk: mclkgrp {
> +               fsl,pins =3D <
> +                       MX8MQ_IOMUXC_GPIO1_IO15_CCMSRCGPCMIX_CLKO2      0=
x59
> +               >;
> +       };
> +
>         pinctrl_mipi_dsi: mipidsigrp {
>                 fsl,pins =3D <
>                         MX8MQ_IOMUXC_ECSPI1_SCLK_GPIO5_IO6              0=
x16
> --=20
> 2.50.1
>

