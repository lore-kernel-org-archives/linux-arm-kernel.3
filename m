Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id F3709D5B15E
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 13 Dec 2025 18:14:18 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=0IFoIugpU9eoL8xJLghafRqCRaP5rdpyU3WF1ur7oPM=; b=oUsEUS59iCIog5BpdSShwf0DUl
	UzDuvdG/+QlJquCXhwkQAg2ZyQtbjAniAqGeZThMaqr4uWFdgafzMgPUzG5nSHVToYUWWGbJtHQbR
	4Yd3Qzuj4GWA+5bdp6ileIKbJfOBYuSPiH+6Lo9tCdnnY8osxDpoMUoR8eHlQgD/LlFoCup1oFX06
	LtJ7y/x97T19A+gIDA3LJiq+D8tjTj+wy/D+68QLzvzjP8NqZ3umVCkYRuZYBN6uHevN4iZcQkih/
	Z7UBl+Pjkj2p73Y45JiXwN0WI2NfyxdgClOv8HMIvKySJ83kfxbajmiNfZsLljlS6WhRXmO4ExU3S
	Z+7DYTmw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUU88-00000001p6w-1p7z;
	Sat, 13 Dec 2025 18:14:08 +0000
Received: from metis.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::104])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vUU82-00000001p5u-0GZ8
	for linux-arm-kernel@lists.infradead.org;
	Sat, 13 Dec 2025 18:14:05 +0000
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUU7S-00011q-8I; Sat, 13 Dec 2025 19:13:26 +0100
Received: from pty.whiteo.stw.pengutronix.de ([2a0a:edc0:2:b01:1d::c5])
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUU7Q-005UpD-2e;
	Sat, 13 Dec 2025 19:13:24 +0100
Received: from mfe by pty.whiteo.stw.pengutronix.de with local (Exim 4.96)
	(envelope-from <mfe@pengutronix.de>)
	id 1vUU7Q-005FlK-2A;
	Sat, 13 Dec 2025 19:13:24 +0100
Date: Sat, 13 Dec 2025 19:13:24 +0100
From: Marco Felsch <m.felsch@pengutronix.de>
To: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Geert Uytterhoeven <geert+renesas@glider.be>,
	Magnus Damm <magnus.damm@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	linux-renesas-soc@vger.kernel.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	imx@lists.linux.dev, barebox@lists.infradead.org
Subject: Re: [PATCH] ARM: dts: nxp/imx6: Drop unused .dtsi
Message-ID: <20251213181324.u32ztfblkknfpz44@pengutronix.de>
References: <20251212203226.458694-5-robh@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251212203226.458694-5-robh@kernel.org>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: mfe@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: linux-arm-kernel@lists.infradead.org
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251213_101402_128831_F8718749 
X-CRM114-Status: GOOD (  18.84  )
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

Hi Rob,

On 25-12-12, Rob Herring (Arm) wrote:
> These .dtsi files are not included anywhere in the tree and can't be
> tested.

not in the tree but by other projects, please see below.

> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>  .../dts/nxp/imx/imx6dl-kontron-samx6i.dtsi    | 12 -----
>  .../dts/nxp/imx/imx6q-kontron-samx6i.dtsi     | 12 -----
>  .../boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi  | 45 ----------------
>  .../boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi  | 54 -------------------
>  4 files changed, 123 deletions(-)
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
>  delete mode 100644 arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> deleted file mode 100644
> index 5a9b819d7ee8..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6dl-kontron-samx6i.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR X11
> -/*
> - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> - */
> -
> -#include "imx6dl.dtsi"
> -#include "imx6qdl-kontron-samx6i.dtsi"
> -
> -/ {
> -	model = "Kontron SMARC-sAMX6i Dual-Lite/Solo";
> -	compatible = "kontron,imx6dl-samx6i", "fsl,imx6dl";
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi b/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> deleted file mode 100644
> index e76963436079..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6q-kontron-samx6i.dtsi
> +++ /dev/null
> @@ -1,12 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0 OR X11
> -/*
> - * Copyright 2019 (C) Pengutronix, Marco Felsch <kernel@pengutronix.de>
> - */
> -
> -#include "imx6q.dtsi"
> -#include "imx6qdl-kontron-samx6i.dtsi"
> -
> -/ {
> -	model = "Kontron SMARC-sAMX6i Quad/Dual";
> -	compatible = "kontron,imx6q-samx6i", "fsl,imx6q";
> -};

I can't speak for the other two .dtsi files but both kontron .dtsi files
are used by barebox:

 - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6dl-samx6i.dts#L8
 - https://elixir.bootlin.com/barebox/v2025.11.0/source/arch/arm/dts/imx6q-samx6i.dts#L8

Removing them here will cause a regression for barebox.

Regards,
  Marco


> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> deleted file mode 100644
> index 3a968782e854..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-dwarf.dtsi
> +++ /dev/null
> @@ -1,45 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -//
> -// Copyright 2017 NXP
> -
> -#include "imx6qdl-pico.dtsi"
> -
> -/ {
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led {
> -			label = "gpio-led";
> -			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> -
> -};
> -
> -&i2c1 {
> -	mpl3115@60 {
> -		compatible = "fsl,mpl3115";
> -		reg = <0x60>;
> -	};
> -};
> -
> -&i2c2 {
> -	io-expander@25 {
> -		compatible = "nxp,pca9554";
> -		reg = <0x25>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -	};
> -
> -};
> -
> -&iomuxc {
> -	pinctrl_gpio_leds: gpioledsgrp {
> -		fsl,pins = <
> -			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
> -		>;
> -	};
> -};
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi b/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> deleted file mode 100644
> index 3d56a4216448..000000000000
> --- a/arch/arm/boot/dts/nxp/imx/imx6qdl-pico-nymph.dtsi
> +++ /dev/null
> @@ -1,54 +0,0 @@
> -// SPDX-License-Identifier: GPL-2.0+ OR MIT
> -
> -#include "imx6qdl-pico.dtsi"
> -
> -/ {
> -	leds {
> -		compatible = "gpio-leds";
> -		pinctrl-names = "default";
> -		pinctrl-0 = <&pinctrl_gpio_leds>;
> -
> -		led {
> -			label = "gpio-led";
> -			gpios = <&gpio5 31 GPIO_ACTIVE_HIGH>;
> -		};
> -	};
> -
> -};
> -
> -&i2c1 {
> -	adc@52 {
> -		compatible = "ti,adc081c";
> -		reg = <0x52>;
> -		vref-supply = <&reg_2p5v>;
> -	};
> -};
> -
> -&i2c2 {
> -	io-expander@25 {
> -		compatible = "nxp,pca9554";
> -		reg = <0x25>;
> -		gpio-controller;
> -		#gpio-cells = <2>;
> -		#interrupt-cells = <2>;
> -	};
> -};
> -
> -&i2c3 {
> -	rtc@68 {
> -		compatible = "dallas,ds1337";
> -		reg = <0x68>;
> -	};
> -};
> -
> -&pcie {
> -	status = "okay";
> -};
> -
> -&iomuxc {
> -	pinctrl_gpio_leds: gpioledsgrp {
> -		fsl,pins = <
> -			MX6QDL_PAD_CSI0_DAT13__GPIO5_IO31	0x1b0b0
> -		>;
> -	};
> -};
> -- 
> 2.51.0
> 
> 
> 

-- 
#gernperDu 
#CallMeByMyFirstName

Pengutronix e.K.                           |                             |
Steuerwalder Str. 21                       | https://www.pengutronix.de/ |
31137 Hildesheim, Germany                  | Phone: +49-5121-206917-0    |
Amtsgericht Hildesheim, HRA 2686           | Fax:   +49-5121-206917-9    |

