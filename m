Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id ABBC1EB3637
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 21:42:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=SbUPvehf+QyZOUPTnLgB6JAtmjiDQpVgtr3+W2oHI28=; b=CdLYtehlage3UB
	W+FxxSab9gO8PitWmknCcHCULtX/77WUhSpQNKHJlJI9a+X8eirGODcW+tUF0hMPkXRUfRDZvVEKp
	SKapU7fJjqN3QB70oaKu/LWJ15Zd4+3wOZ7osgZhlwssr/kVJzCInFA6i93xInkSwn33e0Mtz3JM0
	tSz2m13Jfc6vTQ01hmx3my4OINBtlancbZ6Kp8cnAAZpnwmiQA7aQbJg6WDQ3IjeTcYXuyBeOTT1Q
	7YJfZdHc92M51qbM6dUXF0hfv5nuSiygcLpBa7FbjVZOKyqa0TSJHeWgTf1S1VfP62s3oS0S3qHZL
	6gv+7vR1fwIwbwXwVg7A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxB2P-0000000E383-36eP;
	Mon, 02 Mar 2026 21:42:49 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxB2N-0000000E37f-1fqu
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 21:42:48 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=SbUPvehf+QyZOUPTnLgB6JAtmjiDQpVgtr3+W2oHI28=; b=utmx1okq7eUH/KjH8E+HRAMnSK
	5B1DGn9AaCRO6FWjYexpr10Jd0KPzuakm9jE9JEhIMKMPgjkGVsOSXfU8WKZ6rvhj3lXFhCD28abK
	cxJqqWoc0XkF7o7gPezUo+VhP6XWaXPYgmxpPReFQUHKI3gZ8OMve5+vD7e1HP2wmq0w=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:35228 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vxB28-0005MW-Lf; Mon, 02 Mar 2026 16:42:33 -0500
Date: Mon, 2 Mar 2026 16:42:31 -0500
From: Hugo Villeneuve <hugo@hugovil.com>
To: Frank Li <Frank.li@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
 andrzej.hajda@intel.com, neil.armstrong@linaro.org, rfoss@kernel.org,
 Laurent.pinchart@ideasonboard.com, jonas@kwiboo.se,
 jernej.skrabec@gmail.com, airlied@gmail.com, simona@ffwll.ch,
 maarten.lankhorst@linux.intel.com, mripard@kernel.org, tzimmermann@suse.de,
 s.hauer@pengutronix.de, kernel@pengutronix.de, festevam@gmail.com,
 shawnguo@kernel.org, laurent.pinchart+renesas@ideasonboard.com,
 antonin.godard@bootlin.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, dri-devel@lists.freedesktop.org,
 imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, Hugo Villeneuve
 <hvilleneuve@dimonoff.com>
Message-Id: <20260302164231.616bd69c106cbcdd107d9cbb@hugovil.com>
In-Reply-To: <aaX6P_ulJTq_pipa@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
	<20260302190953.669325-10-hugo@hugovil.com>
	<aaX6P_ulJTq_pipa@lizhi-Precision-Tower-5810>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH 09/14] ARM: dts: imx6ul-var-som: add proper Wifi and
 Bluetooth support
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_134247_569652_0FBBDAE1 
X-CRM114-Status: GOOD (  33.42  )
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

On Mon, 2 Mar 2026 15:59:43 -0500
Frank Li <Frank.li@nxp.com> wrote:

> On Mon, Mar 02, 2026 at 02:03:45PM -0500, Hugo Villeneuve wrote:
> > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> >
> > The existing configuration of the optional Wifi/Bluetooth module was
> > copied from the original Variscite kernel tree, and requires custom
> > scripts to properly configure the Wifi/Bluetooth module.
> >
> > Add proper support for the optional Wifi and Bluetooth configuration on
> > VAR-SOM-6UL so that it works out of the box, without any custom scripts.
> >
> > The SD card interface cannot be used if the Wifi/BT module is in use.
> 
> ARM: dts: imx6ul-var-som: add proper Wifi and Bluetooth support

This looks identical to the initial commit message?

> Add the optional Wifi and Bluetooth dtb on AR-SOM-6UL so that it works out
> of the box.

See comments below about name of dtb.


> The SD card interface cannot be used if the Wifi/BT module is in use.
> 
> 
> >
> > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > ---
> >  arch/arm/boot/dts/nxp/imx/Makefile            |  2 +
> >  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    | 18 ++---
> >  .../nxp/imx/imx6ul-var-som-concerto-full.dts  | 18 +++++
> >  .../boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi | 75 +++++++++++++++++++
> >  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 15 ++++
> >  .../nxp/imx/imx6ull-var-som-concerto-full.dts | 18 +++++
> >  .../arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi | 15 ++++
> >  7 files changed, 151 insertions(+), 10 deletions(-)
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> >
> > diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> > index bc534d0fb1412..c7f24ee63071f 100644
> > --- a/arch/arm/boot/dts/nxp/imx/Makefile
> > +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> > @@ -339,6 +339,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> >  	imx6ul-tx6ul-0011.dtb \
> >  	imx6ul-tx6ul-mainboard.dtb \
> >  	imx6ul-var-som-concerto.dtb \
> > +	imx6ul-var-som-concerto-full.dtb \
> 
> how about imx6ul-var-som-concerto-wifi.dtb?

There is an exponential number of possible configurations (sd + wifi,
eemc + wifi, eemc + eth and no wifi, etc). To simplify, I am simply
adding a full DTB which will support all options on the EVK.

Hugo.


> >  	imx6ull-14x14-evk.dtb \
> >  	imx6ull-colibri-aster.dtb \
> >  	imx6ull-colibri-emmc-aster.dtb \
> > @@ -377,6 +378,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> >  	imx6ull-tqma6ull2-mba6ulx.dtb \
> >  	imx6ull-tqma6ull2l-mba6ulx.dtb \
> >  	imx6ull-var-som-concerto.dtb \
> > +	imx6ull-var-som-concerto-full.dtb \
> >  	imx6ull-uti260b.dtb \
> >  	imx6ulz-14x14-evk.dtb \
> >  	imx6ulz-bsh-smm-m2.dtb
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > index dd4ecff1eb786..af8c5d2db53d4 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > @@ -19,6 +19,14 @@ memory@80000000 {
> >  		reg = <0x80000000 0x20000000>;
> >  	};
> >
> > +	reg_3p3v: regulator-3p3v {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "3P3V";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		regulator-always-on;
> > +	};
> > +
> >  	reg_gpio_dvfs: reg-gpio-dvfs {
> >  		compatible = "regulator-gpio";
> >  		regulator-min-microvolt = <1300000>;
> > @@ -68,9 +76,6 @@ ethphy0: ethernet-phy@1 {
> >  };
> >
> >  &iomuxc {
> > -	pinctrl-names = "default";
> > -	pinctrl-0 = <&pinctrl_hog>;
> > -
> >  	pinctrl_enet1: enet1grp {
> >  		fsl,pins = <
> >  			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
> > @@ -97,13 +102,6 @@ MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
> >  		>;
> >  	};
> >
> > -	pinctrl_hog: hoggrp {
> > -		fsl,pins = <
> > -			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
> > -			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
> > -		>;
> > -	};
> > -
> >  	pinctrl_i2c1: i2c1grp {
> >  		fsl,pins = <
> >  			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> > new file mode 100644
> > index 0000000000000..519250b31db24
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-full.dts
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > + * Variscite SoM mounted on it (6UL CPU variant).
> > + *
> > + * Copyright 2026 Dimonoff
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx6ul-var-som.dtsi"
> > +#include "imx6ul-var-som-concerto-common.dtsi"
> > +#include "imx6ul-var-som-wifi.dtsi"
> > +
> > +/ {
> > +	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> > +	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> > new file mode 100644
> > index 0000000000000..6d16ff7909dab
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-wifi.dtsi
> > @@ -0,0 +1,75 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support optional Wifi/Bluetooth on Variscite VAR-SOM-6UL module.
> > + *
> > + * Copyright 2019-2024 Variscite Ltd.
> > + * Copyright 2026 Dimonoff
> > + */
> > +
> > +/ {
> > +	reg_sd1_vmmc: regulator_sd1_vmmc {
> > +		compatible = "regulator-fixed";
> > +		regulator-name = "VMMC1";
> > +		regulator-min-microvolt = <3300000>;
> > +		regulator-max-microvolt = <3300000>;
> > +		gpio = <&gpio5 2 GPIO_ACTIVE_HIGH>;
> > +		enable-active-high;
> > +		startup-delay-us = <10000>;
> > +	};
> > +
> > +	usdhc1_pwrseq: usdhc1-pwrseq {
> > +		compatible = "mmc-pwrseq-simple";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_brcm_wifi>;
> > +		reset-gpios = <&gpio5 6 GPIO_ACTIVE_LOW>;
> > +	};
> > +};
> > +
> > +&iomuxc {
> > +	pinctrl_32k_clk: 32kclkgrp {
> > +		/*
> > +		 * For TP option, an additional oscillator is assembled on the
> > +		 * SOM to provide 32 kHz to the WiFi module. Without TP option,
> > +		 * this pin is configured to provide the 32 KHz clock to the
> > +		 * WiFi module.
> > +		 */
> > +		fsl,pins = <
> > +			MX6UL_PAD_GPIO1_IO03__OSC32K_32K_OUT	0x03029
> > +		>;
> > +	};
> > +};
> > +
> > +&tsc {
> > +	status = "disabled";
> > +};
> > +
> > +/* Bluetooth UART */
> > +&uart2 {
> > +	bluetooth {
> > +		compatible = "brcm,bcm43438-bt";
> > +		pinctrl-names = "default";
> > +		pinctrl-0 = <&pinctrl_brcm_bt>;
> > +		shutdown-gpios = <&gpio5 4 GPIO_ACTIVE_HIGH>;
> > +		vbat-supply = <&reg_3p3v>;
> > +		vddio-supply = <&reg_3p3v>;
> > +	};
> > +};
> > +
> > +&usdhc1 {
> > +	#address-cells = <1>;
> > +	#size-cells = <0>;
> > +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > +	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_32k_clk>;
> > +	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_32k_clk>;
> > +	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_32k_clk>;
> > +	no-1-8-v;
> > +	non-removable;
> > +	mmc-pwrseq = <&usdhc1_pwrseq>;
> > +	vmmc-supply = <&reg_sd1_vmmc>;
> > +	status = "okay";
> > +
> > +	brcmf: wifi@1 {
> > +		compatible = "brcm,bcm4329-fmac"; /* LWB option: Sterling LWB5 */
> > +		reg = <1>;
> > +	};
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > index 35a0c0b3603fd..b4e6a9316dd81 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> > @@ -15,3 +15,18 @@ / {
> >  	model = "Variscite VAR-SOM-6UL module";
> >  	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
> >  };
> > +
> > +&iomuxc {
> > +	pinctrl_brcm_bt: brcm-bt-grp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
> > +		>;
> > +	};
> > +
> > +	pinctrl_brcm_wifi: brcm-wifi-grp {
> > +		fsl,pins = <
> > +			MX6UL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
> > +			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
> > +		>;
> > +	};
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> > new file mode 100644
> > index 0000000000000..7c0e313603630
> > --- /dev/null
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto-full.dts
> > @@ -0,0 +1,18 @@
> > +// SPDX-License-Identifier: GPL-2.0+
> > +/*
> > + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > + * Variscite SoM mounted on it (6ULL CPU variant).
> > + *
> > + * Copyright 2026 Dimonoff
> > + */
> > +
> > +/dts-v1/;
> > +
> > +#include "imx6ull-var-som.dtsi"
> > +#include "imx6ul-var-som-concerto-common.dtsi"
> > +#include "imx6ul-var-som-wifi.dtsi"
> > +
> > +/ {
> > +	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> > +	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
> > +};
> > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > index ba482a97623b2..3067ff6a1bc74 100644
> > --- a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som.dtsi
> > @@ -13,3 +13,18 @@ / {
> >  	model = "Variscite VAR-SOM-6UL module";
> >  	compatible = "variscite,var-som-imx6ull", "fsl,imx6ull";
> >  };
> > +
> > +&iomuxc {
> > +	pinctrl_brcm_bt: brcm-bt-grp {
> > +		fsl,pins = <
> > +			MX6ULL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT_REG_ON (BT_EN) */
> > +		>;
> > +	};
> > +
> > +	pinctrl_brcm_wifi: brcm-wifi-grp {
> > +		fsl,pins = <
> > +			MX6ULL_PAD_SNVS_TAMPER2__GPIO5_IO02	0x1b0b0	/* WL_PWR (WIFI_PWR 5G) */
> > +			MX6ULL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x1b0b0	/* WL_REG_ON (WIFI_EN) */
> > +		>;
> > +	};
> > +};
> > --
> > 2.47.3
> >
> 


-- 
Hugo Villeneuve

