Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EF88ACCD184
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 14 Oct 2025 17:37:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Message-ID:Date:To:Cc:From:
	Subject:References:In-Reply-To:Content-Transfer-Encoding:MIME-Version:
	Content-Type:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=UEjPypUORKhRws139RZAuUi3dI0fiBWn7RnjShoZxVY=; b=KI2uV5QWVdns5jZOs4HiETuqSq
	jF4JNmCY0yGLT6ExG4WEqdBkjn+yGxc7mfpMHlNuypiQ8g6O7jeo+mLh0QQH1+3+jeZZsGBRgVdCX
	VQfSCrmw4bZjt2BV7gtGB2gtVzCWCvPvX2mw9/s2CZx4BkV36FVt/wx6RVZN0GhKfCZvxMwXInEXS
	IT+2g0p/0rcKVre3hAm4ILaLvjwvibT2t+g0QzIVcJSjnuo/8iVUuCrzqmf9dXqyHlivHFfcG1Niz
	NzvolugRGcky2pdiUFTbc80aSeldzOGpkbbvHOmDxJfezcTmRKL8kV/XMxnus7vucpksYdsuJJjPo
	2rSPTJEg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ixq-0000000H5gp-2TMg;
	Tue, 14 Oct 2025 17:37:34 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1v8ixn-0000000H5fr-1SmC
	for linux-arm-kernel@lists.infradead.org;
	Tue, 14 Oct 2025 17:37:32 +0000
Received: from pendragon.ideasonboard.com (cpc89244-aztw30-2-0-cust6594.18-1.cable.virginm.net [86.31.185.195])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 1B5A1741;
	Tue, 14 Oct 2025 19:35:48 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1760463348;
	bh=HiHxgPNFAWSB/iS1Eg4H0inrzfOnWi/it/DJfDndziA=;
	h=In-Reply-To:References:Subject:From:Cc:To:Date:From;
	b=q9jTq4a6Wd81pLyp1VGc5fLh85ad6D3pNvVulfbdw6nNHMFfwQHZ+9YodjLIwb/tf
	 OFUJHqcDSVDA1RGICzlwOuLLW8Jd6hpeXuJzD5A1yLJzUAHXvb1WykyTG/aJt3UuBv
	 yDqmkZJeiY5Z5R4V1MVbHtD4AkP2IQSy9vXuIVUs=
Content-Type: text/plain; charset="utf-8"
MIME-Version: 1.0
Content-Transfer-Encoding: quoted-printable
In-Reply-To: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
References: <20250916144710.1285650-1-kieran.bingham@ideasonboard.com>
Subject: Re: [PATCH] arm64: dts: freescale: debix-som-a-bmb-08: Enable HDMI output
From: Kieran Bingham <kieran.bingham@ideasonboard.com>
Cc: Shawn Guo <shawnguo2@yeah.net>, Marco Felsch <m.felsch@pengutronix.de>
To: Conor Dooley <conor+dt@kernel.org>, Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Date: Tue, 14 Oct 2025 18:37:23 +0100
Message-ID: <176046344348.1246375.13335893574135284814@ping.linuxembedded.co.uk>
User-Agent: alot/0.9.1
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251014_103731_527721_CD1749F1 
X-CRM114-Status: GOOD (  13.82  )
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

Hi All,

Quoting Kieran Bingham (2025-09-16 15:47:09)
> Enable the HDMI output on the Debix SOM A board, using the HDMI encoder
> present in the i.MX8MP SoC.
>=20
> Enable and configure all nodes required for the HDMI port usage.
>=20
> Signed-off-by: Kieran Bingham <kieran.bingham@ideasonboard.com>

One review tag at https://lore.kernel.org/all/20250925171744.5eyhqjlqp7skes=
qi@pengutronix.de/

Could anyone be able to review / collect / apply this one please?

--
Regards

Kieran


> ---
>=20
> This replicates 4880ee1c9046 ("arm64: dts: imx8mp-debix-model-a: Enable
> HDMI output") to support the Debix SOM as well.
>=20
>=20
>  .../freescale/imx8mp-debix-som-a-bmb-08.dts   | 47 +++++++++++++++++++
>  1 file changed, 47 insertions(+)
>=20
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts =
b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
> index d241db3743a9..04619a722906 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-debix-som-a-bmb-08.dts
> @@ -22,6 +22,18 @@ chosen {
>                 stdout-path =3D &uart2;
>         };
> =20
> +       hdmi-connector {
> +               compatible =3D "hdmi-connector";
> +               label =3D "hdmi";
> +               type =3D "a";
> +
> +               port {
> +                       hdmi_connector_in: endpoint {
> +                               remote-endpoint =3D <&hdmi_tx_out>;
> +                       };
> +               };
> +       };
> +
>         reg_baseboard_vdd3v3: regulator-baseboard-vdd3v3 {
>                 compatible =3D "regulator-fixed";
>                 regulator-min-microvolt =3D <3300000>;
> @@ -222,6 +234,28 @@ flash: flash@0 {
>         };
>  };
> =20
> +&hdmi_pvi {
> +       status =3D "okay";
> +};
> +
> +&hdmi_tx {
> +       pinctrl-names =3D "default";
> +       pinctrl-0 =3D <&pinctrl_hdmi>;
> +       status =3D "okay";
> +
> +       ports {
> +               port@1 {
> +                       hdmi_tx_out: endpoint {
> +                               remote-endpoint =3D <&hdmi_connector_in>;
> +                       };
> +               };
> +       };
> +};
> +
> +&hdmi_tx_phy {
> +       status =3D "okay";
> +};
> +
>  &i2c4 {
>         expander0: gpio@20 {
>                 compatible =3D "nxp,pca9535";
> @@ -276,6 +310,10 @@ ethmac2: mac-address@c {
>         };
>  };
> =20
> +&lcdif3 {
> +       status =3D "okay";
> +};
> +
>  &snvs_pwrkey {
>         status =3D "okay";
>  };
> @@ -430,6 +468,15 @@ MX8MP_IOMUXC_NAND_DATA03__FLEXSPI_A_DATA03      0x82
>                 >;
>         };
> =20
> +       pinctrl_hdmi: hdmigrp {
> +               fsl,pins =3D <
> +                       MX8MP_IOMUXC_HDMI_DDC_SCL__HDMIMIX_HDMI_SCL     0=
x1c3
> +                       MX8MP_IOMUXC_HDMI_DDC_SDA__HDMIMIX_HDMI_SDA     0=
x1c3
> +                       MX8MP_IOMUXC_HDMI_HPD__HDMIMIX_HDMI_HPD         0=
x19
> +                       MX8MP_IOMUXC_HDMI_CEC__HDMIMIX_HDMI_CEC         0=
x19
> +               >;
> +       };
> +
>         pinctrl_i2c1: i2c1grp {
>                 fsl,pins =3D <
>                         MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL                 0=
x400001c2
> --=20
> 2.50.1
>

