Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 66FB4C71132
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 10 Jun 2025 10:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:Cc:To:Subject:Message-ID:Date:From:In-Reply-To:References:
	MIME-Version:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=d9dEIw1urmXPXSyEjfiptdSoKUNx7ybVNTHvf2bqei8=; b=UH/AB1/0PS5sWezW4YFzmbv2Wm
	vmgUUxC/J6GJdp5ULwtICkWfpP4BzeXE0yKEGW10yZ0EVdI5RUD4crGuVxHa5mQmajMx/V53U/h8K
	On/NyuoYG4kfvkvt+2jdnhwm3HZXQtAETOUbQcebvROPVEdTBgJLtIcqPxDf53LOZgNJx1tOTKS2X
	c3bU0wJ3P1kI/haTMvDesGCykWuvZteJMlZ8xTzepl7oIJF13BuKgt761Kj6J3WbzolhOcljT4ksE
	iq711V2x/z1CFG3drWTVJ7aJ3Zvm3OhWijWog+OjezNmpCfXY3jWhepu+W93LuHJ4Wyvl8gcdr5EH
	RFk71gng==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOwey-00000006Y6D-0CP2;
	Tue, 10 Jun 2025 10:56:52 +0000
Received: from mail-yb1-xb33.google.com ([2607:f8b0:4864:20::b33])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uOvjh-00000006QJ1-3Z9x
	for linux-arm-kernel@lists.infradead.org;
	Tue, 10 Jun 2025 09:57:43 +0000
Received: by mail-yb1-xb33.google.com with SMTP id 3f1490d57ef6-e7d925ff60bso4225555276.2
        for <linux-arm-kernel@lists.infradead.org>; Tue, 10 Jun 2025 02:57:41 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=amarulasolutions.com; s=google; t=1749549461; x=1750154261; darn=lists.infradead.org;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=d9dEIw1urmXPXSyEjfiptdSoKUNx7ybVNTHvf2bqei8=;
        b=IrJSbKNXmL4ubYsxuYhSyzsc7pC0CsqJ1Es0T775EWAPwVpxXLTYlrPuP7IJyX5Z7u
         zTQY1OrZ4AOwdAtLBGHX/2FMomKGbPMfbQNsiE7GV5eKdbPsma+d7GXJ2nsYJXM/noUc
         SRoixhiT/3I9le6WnE1VqpNlHUKD/Km7W/L2c=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749549461; x=1750154261;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=d9dEIw1urmXPXSyEjfiptdSoKUNx7ybVNTHvf2bqei8=;
        b=G5mUUrQBmElSG2de6wReIAVArgm1RV2oDtH+hEhSb0Hrpyb0G0CZl1FVuyuIryycoI
         7MsFAzKCRq7hQAzTo6mMUQ+PwbeWss3lln52uFygBcwKUbEhCq65l2vTbL9wjHaSuIkc
         zeQhProULQlaUAX+LbfBaZuhYyoMXWoA7omGrDa1Q9ha6HBmSn2ayZsfsEfFabkwhxyr
         Y6ZOfW8RKLPUyI5Nnpghdya8FV6hwMrTXPDTSaKtdxTt4xm1244rEuEkBQt4Z6L+DILp
         Bb0fE9rkhQDOVQlnKtDpmviZplc/igqQNLFmmwqOWAc0mFCWHc+9MllQ2jCo2N3fOoQ2
         qEiw==
X-Forwarded-Encrypted: i=1; AJvYcCXrKSLx158ACxcO6kDyZd4q0H2WSLLKV4yEP8k2D4EOLnv6YYywf5Ai6twPLSRAvPxDYqTNm/ZnuJspQ4ASCqW+@lists.infradead.org
X-Gm-Message-State: AOJu0YwHOEcY6sa3d41WB2xUyfKzegNH5e1Xr4juANGFXjIwQS60fvWm
	yDN4g69v20yIfhT7lzcnYoEzUv4E0n38unjLg7QepYumGAGNAO/3sJtj5y9dCHrO1+mDZaJoIQc
	w8qrzkoZw5QeEsdHwAGHI9+s2MfJomgR4gqKT6Jghyw==
X-Gm-Gg: ASbGncuWDDSfPKHEXf0j+jG5GbXJxGogpepHhhd9/SvbPshkuApjMCVaRiYp89exGeX
	gbfpf1BFLxeFOZPpU6BEou4TcEkL4lkfvw5rq3rl0zQUAyP/GaDEUwqb2uG1DgE0QWzYtFpokm2
	VQPiIuJYG6eC2+Up9P2RVvUdgk9oPPVgilKkMG5s/6oA==
X-Google-Smtp-Source: AGHT+IFodtS1VYnVo9bbt5qXymWY3lsJGCo0KtXDocUtEfb/F89rGPTFtUZIHa5j2tOsbpXapJCL6XzrNaw6xaDkRr0=
X-Received: by 2002:a05:6902:2841:b0:e81:45da:4aed with SMTP id
 3f1490d57ef6-e81a215345amr21634275276.26.1749549460846; Tue, 10 Jun 2025
 02:57:40 -0700 (PDT)
MIME-Version: 1.0
References: <20250609101637.2322809-1-dario.binacchi@amarulasolutions.com>
 <20250609101637.2322809-3-dario.binacchi@amarulasolutions.com> <aEb6uQNDHYRKpiI6@lizhi-Precision-Tower-5810>
In-Reply-To: <aEb6uQNDHYRKpiI6@lizhi-Precision-Tower-5810>
From: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Date: Tue, 10 Jun 2025 11:57:29 +0200
X-Gm-Features: AX0GCFvXGARRqo4WtdQpGt4geFTzn6cBu8i4y7nYSpclBk1GV6MofVQXo2ClbwU
Message-ID: <CABGWkvp4aEb-QusmJPat=khJk9cAaqq6CVxcC8ma8Wzqecbvfg@mail.gmail.com>
Subject: Re: [PATCH v2 02/10] ARM: dts: imx6ul: support Engicam MicroGEA-MX6UL SoM
To: Frank Li <Frank.li@nxp.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Matteo Lisi <matteo.lisi@engicam.com>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, devicetree@vger.kernel.org, 
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250610_025741_905158_8092E102 
X-CRM114-Status: GOOD (  26.27  )
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

Hi Frank,

On Mon, Jun 9, 2025 at 5:16=E2=80=AFPM Frank Li <Frank.li@nxp.com> wrote:
>
> On Mon, Jun 09, 2025 at 12:15:35PM +0200, Dario Binacchi wrote:
> > Support Engicam MicroGEA-MX6UL SoM with:
> >
> >  - 256 Mbytes NAND Flash
> >  - 512 Mbytes DRAM DDR2
> >  - Ethernet MAC
> >
> > Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> >
> > ---
> >
> > Changes in v2:
> > - Change local-mac-address to 00 00 00 00 00 00. The actual value will
> >   be set by the bootloader. The previous one was assigned to Freescale
> >   Semiconductor.
> >
> >  .../dts/nxp/imx/imx6ull-engicam-microgea.dtsi | 96 +++++++++++++++++++
> >  1 file changed, 96 insertions(+)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.=
dtsi
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi b/=
arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > new file mode 100644
> > index 000000000000..38971f6512a2
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-engicam-microgea.dtsi
> > @@ -0,0 +1,96 @@
> > +// SPDX-License-Identifier: GPL-2.0
> > +/*
> > + * Copyright (C) 2025 Amarula Solutions, Dario Binacchi <dario.binacch=
i@amarulasolutions.com>
> > + * Copyright (C) 2025 Engicam srl
> > + */
> > +
> > +/dts-v1/;
> > +
> > + #include "imx6ull.dtsi"
> > +
> > +/ {
> > +     compatible =3D "engicam,microgea-imx6ull", "fsl,imx6ull";
> > +
> > +     memory@80000000 {
> > +             device_type =3D "memory";
> > +             reg =3D <0x80000000 0x20000000>;
> > +     };
> > +};
> > +
> > +&fec1 {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_enet1>, <&pinctrl_phy_reset>;
> > +     phy-mode =3D "rmii";
> > +     phy-handle =3D <&ethphy0>;
> > +     local-mac-address =3D [00 00 00 00 00 00];
> > +     status =3D "okay";
> > +
> > +     mdio {
> > +             #address-cells =3D <1>;
> > +             #size-cells =3D <0>;
> > +
> > +             ethphy0: ethernet-phy@0 {
> > +                     compatible =3D "ethernet-phy-ieee802.3-c22";
> > +                     reg =3D <0>;
> > +                     reset-gpios =3D <&gpio5 9 GPIO_ACTIVE_LOW>;
> > +                     reset-assert-us =3D <4000>;
> > +                     reset-deassert-us =3D <4000>;
> > +             };
> > +     };
> > +};
> > +
> > +/* NAND */
> > +&gpmi {
> > +     pinctrl-names =3D "default";
> > +     pinctrl-0 =3D <&pinctrl_gpmi_nand>;
> > +     nand-ecc-mode =3D "hw";
> > +     nand-ecc-strength =3D <0>;
> > +     nand-ecc-step-size =3D <0>;
> > +     nand-on-flash-bbt;
>
> Not related this patch, latest device tree binding for nand-controler sho=
uld
> look like
>
>         nand@0 {
>                 reg =3D <0>;
>                 nand-ecc-mode =3D "hw";
>                 ...
>         }
>
> I am not sure if above dts work at your ul board.

I tested the change you suggested, but it's not working on my board.

I also did a search through various DTS files on the i.MX6ULL SOM, and inde=
ed,
the scheme I adopted is used by other boards that have already been merged.

Thanks and regards,
Dario

>
> Frank
>
> > +     status =3D "okay";
> > +};
> > +
> > +&iomuxc {
> > +
> > +     pinctrl_enet1: enet1grp {
> > +             fsl,pins =3D <
> > +                     MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN      0x1b0b0
> > +                     MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00 0x1b0b0
> > +                     MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01 0x1b0b0
> > +                     MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN      0x1b0b0
> > +                     MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00 0x1b0b0
> > +                     MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01 0x1b0b0
> > +                     MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1  0x4001b00=
9
> > +                     MX6UL_PAD_GPIO1_IO07__ENET1_MDC         0x1b0b0
> > +                     MX6UL_PAD_GPIO1_IO06__ENET1_MDIO        0x1b0b0
> > +             >;
> > +     };
> > +
> > +     pinctrl_gpmi_nand: gpminandgrp {
> > +             fsl,pins =3D <
> > +                     MX6UL_PAD_NAND_CLE__RAWNAND_CLE         0xb0b1
> > +                     MX6UL_PAD_NAND_ALE__RAWNAND_ALE         0xb0b1
> > +                     MX6UL_PAD_NAND_WP_B__RAWNAND_WP_B       0xb0b1
> > +                     MX6UL_PAD_NAND_READY_B__RAWNAND_READY_B 0xb000
> > +                     MX6UL_PAD_NAND_CE0_B__RAWNAND_CE0_B     0xb0b1
> > +                     MX6UL_PAD_NAND_RE_B__RAWNAND_RE_B       0xb0b1
> > +                     MX6UL_PAD_NAND_WE_B__RAWNAND_WE_B       0xb0b1
> > +                     MX6UL_PAD_NAND_DATA00__RAWNAND_DATA00   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA01__RAWNAND_DATA01   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA02__RAWNAND_DATA02   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA03__RAWNAND_DATA03   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA04__RAWNAND_DATA04   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA05__RAWNAND_DATA05   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA06__RAWNAND_DATA06   0xb0b1
> > +                     MX6UL_PAD_NAND_DATA07__RAWNAND_DATA07   0xb0b1
> > +             >;
> > +     };
> > +};
> > +
> > +&iomuxc_snvs {
> > +     pinctrl_phy_reset: phy-resetgrp {
> > +             fsl,pins =3D <
> > +                     MX6ULL_PAD_SNVS_TAMPER9__GPIO5_IO09     0x1b0b0
> > +             >;
> > +     };
> > +};
> > --
> > 2.43.0
> >



--=20

Dario Binacchi

Senior Embedded Linux Developer

dario.binacchi@amarulasolutions.com

__________________________________


Amarula Solutions SRL

Via Le Canevare 30, 31100 Treviso, Veneto, IT

T. +39 042 243 5310
info@amarulasolutions.com

www.amarulasolutions.com

