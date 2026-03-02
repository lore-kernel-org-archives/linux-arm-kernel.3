Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D5550EB3637
	for <linux-arm-kernel@archiver.kernel.org>; Mon,  2 Mar 2026 21:36:57 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:
	Content-Transfer-Encoding:Content-Type:Mime-Version:References:In-Reply-To:
	Message-Id:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:
	Resent-Date:Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Owner; bh=9Cguxj7EOWTjHwYQdeUqgX4glLTApmhoEnyCBh2QAgA=; b=aBg8t0ydzYIBbV
	VRF/pvN7hYvmg5fJBYmqk9VFj4Fa9sEzdTR4TEWysJ44BVyRhIYCuY43EcFD2LW+gkj0CI8CgxutH
	M0lAINEZJgcdTvPWetaEnjmHR77tYR/3mIeERYrL0Sg7CUhQkaxlbuoLhCtESxCCRvEW8joLkvJsX
	aLr/pZPYsuisDv2DDk8WUciMvVaQtZPEbHNXK8OJSyEGAymbOTge4Fu8L3DRiC/Cye78LDAy4NsDu
	NTRd4FzRfau0JWtD1fXJEDY5AFcVKmwiEZWuZSOgWcajFAkaIVS+NaFNh6gtNfwruax3LOgKnEK7C
	m9nykKi4+zvl6yjmsUmA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAwd-0000000E2ZJ-1YIL;
	Mon, 02 Mar 2026 21:36:51 +0000
Received: from mail.hugovil.com ([162.243.120.170])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vxAwa-0000000E2YW-0XAE
	for linux-arm-kernel@lists.infradead.org;
	Mon, 02 Mar 2026 21:36:49 +0000
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed; d=hugovil.com
	; s=x; h=Subject:Content-Transfer-Encoding:Mime-Version:Message-Id:Cc:To:From
	:Date:subject:date:message-id:reply-to;
	bh=9Cguxj7EOWTjHwYQdeUqgX4glLTApmhoEnyCBh2QAgA=; b=UmQcdciQtPByPWptKVn+zb4l8z
	jAxlfGQgOMjG6+mXMBApcldBvT8qkwicIaXHVIB700vsCewhK5zv9bEozG52abT5Jm1RwbTCr82oJ
	ImbKA1jB3/tQJK13ldkm+BljWlRSzYLsiaFIyBQU6es8fGQ8XqZ/Sum6d4kAXxHTmWS4=;
Received: from modemcable168.174-80-70.mc.videotron.ca ([70.80.174.168]:32982 helo=pettiford.lan)
	by mail.hugovil.com with esmtpa (Exim 4.92)
	(envelope-from <hugo@hugovil.com>)
	id 1vxAwH-00058g-BQ; Mon, 02 Mar 2026 16:36:30 -0500
Date: Mon, 2 Mar 2026 16:36:28 -0500
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
Message-Id: <20260302163628.edb561b4c591d08f0f6de91a@hugovil.com>
In-Reply-To: <aaYA8YjxugSHW6TF@lizhi-Precision-Tower-5810>
References: <20260302190953.669325-1-hugo@hugovil.com>
	<20260302190953.669325-8-hugo@hugovil.com>
	<aaX4DYzfR2HifTtf@lizhi-Precision-Tower-5810>
	<20260302160731.0b6dd8fc1709a91236289fea@hugovil.com>
	<aaYA8YjxugSHW6TF@lizhi-Precision-Tower-5810>
X-Mailer: Sylpheed 3.8.0beta1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Mime-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit
X-SA-Exim-Connect-IP: 70.80.174.168
X-SA-Exim-Mail-From: hugo@hugovil.com
Subject: Re: [PATCH 07/14] ARM: dts: imx6ul-var-som-concerto: Factor out
 common parts for all CPU variants
X-SA-Exim-Version: 4.2.1 (built Wed, 08 May 2019 21:11:16 +0000)
X-SA-Exim-Scanned: Yes (on mail.hugovil.com)
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260302_133648_416459_02FFE270 
X-CRM114-Status: GOOD (  30.93  )
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

On Mon, 2 Mar 2026 16:28:17 -0500
Frank Li <Frank.li@nxp.com> wrote:

> On Mon, Mar 02, 2026 at 04:07:31PM -0500, Hugo Villeneuve wrote:
> > Hi Frank,
> >
> > On Mon, 2 Mar 2026 15:50:21 -0500
> > Frank Li <Frank.li@nxp.com> wrote:
> >
> > > On Mon, Mar 02, 2026 at 02:03:43PM -0500, Hugo Villeneuve wrote:
> > > > From: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > >
> > > > Export common parts to the Variscite VAR-SOM-6UL dtsi so that they can be
> > > > reused on other boards.
> > > >
> > > > This will simplify adding future dedicated device tree files for each CPU
> > > > variant.
> > >
> > > Simplify adding ...
> > >
> > > >
> > > > Add i2c1 pinctrl to var-som dtsi pinmux, so that it can be reused by other
> > > > boards.
> > > >
> > > > Reorder pinctrl_gpio_leds to respect alphabetical order.
> > >
> > > this one use new patch.
> >
> > I'm not sure what you mean by that? Do you mean to move this change to a
> > separate patch?
> 
> yes

Ok, will do for V2.

Thnak you,
Hugo.


> 
> Frank
> >
> >
> > >
> > > >
> > > > Signed-off-by: Hugo Villeneuve <hvilleneuve@dimonoff.com>
> > > > ---
> > > >  arch/arm/boot/dts/nxp/imx/Makefile            |   1 +
> > > >  .../dts/nxp/imx/imx6ul-var-som-common.dtsi    |   7 +
> > > >  ...ts => imx6ul-var-som-concerto-common.dtsi} |  17 +-
> > > >  .../dts/nxp/imx/imx6ul-var-som-concerto.dts   | 312 +-----------------
> > > >  .../dts/nxp/imx/imx6ull-var-som-concerto.dts  |  17 +
> > > >  5 files changed, 33 insertions(+), 321 deletions(-)
> > > >  copy arch/arm/boot/dts/nxp/imx/{imx6ul-var-som-concerto.dts => imx6ul-var-som-concerto-common.dtsi} (95%)
> > > >  create mode 100644 arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > > >
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/Makefile b/arch/arm/boot/dts/nxp/imx/Makefile
> > > > index de4142e8f3ce8..bc534d0fb1412 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/Makefile
> > > > +++ b/arch/arm/boot/dts/nxp/imx/Makefile
> > > > @@ -376,6 +376,7 @@ dtb-$(CONFIG_SOC_IMX6UL) += \
> > > >  	imx6ull-tarragon-slavext.dtb \
> > > >  	imx6ull-tqma6ull2-mba6ulx.dtb \
> > > >  	imx6ull-tqma6ull2l-mba6ulx.dtb \
> > > > +	imx6ull-var-som-concerto.dtb \
> > >
> > > keep alphabet order
> >
> > Ok
> >
> > >
> > > Frank
> > > >  	imx6ull-uti260b.dtb \
> > > >  	imx6ulz-14x14-evk.dtb \
> > > >  	imx6ulz-bsh-smm-m2.dtb
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > > index 2072e8ba4d469..22b0c4e0725a5 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-common.dtsi
> > > > @@ -104,6 +104,13 @@ MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
> > > >  		>;
> > > >  	};
> > > >
> > > > +	pinctrl_i2c1: i2c1grp {
> > > > +		fsl,pins = <
> > > > +			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > > > +			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> > > > +		>;
> > > > +	};
> > > > +
> > > >  	pinctrl_sai2: sai2grp {
> > > >  		fsl,pins = <
> > > >  			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > > > similarity index 95%
> > > > copy from arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > > copy to arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > > > index d16e75164fd18..10a23ae104359 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto-common.dtsi
> > > > @@ -1,19 +1,15 @@
> > > >  // SPDX-License-Identifier: GPL-2.0+
> > > >  /*
> > > >   * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > > > - * Variscite SoM mounted on it
> > > > + * Variscite SoM mounted on it, for all CPU variants.
> > > >   *
> > > >   * Copyright 2019 Variscite Ltd.
> > > >   * Copyright 2025 Bootlin
> > > >   */
> > > >
> > > > -#include "imx6ul-var-som.dtsi"
> > > >  #include <dt-bindings/leds/common.h>
> > > >
> > > >  / {
> > > > -	model = "Variscite VAR-SOM-6UL Concerto Board";
> > > > -	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> > > > -
> > > >  	chosen {
> > > >  		stdout-path = &uart1;
> > > >  	};
> > > > @@ -144,22 +140,15 @@ MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059
> > > >  		>;
> > > >  	};
> > > >
> > > > -	pinctrl_gpio_leds: gpio-ledsgrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
> > > > -		>;
> > > > -	};
> > > > -
> > > >  	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
> > > >  		fsl,pins = <
> > > >  			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059
> > > >  		>;
> > > >  	};
> > > >
> > > > -	pinctrl_i2c1: i2c1grp {
> > > > +	pinctrl_gpio_leds: gpio-ledsgrp {
> > > >  		fsl,pins = <
> > > > -			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > > > -			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> > > > +			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
> > > >  		>;
> > > >  	};
> > > >
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > > index d16e75164fd18..11b45f105b7ad 100644
> > > > --- a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som-concerto.dts
> > > > @@ -1,320 +1,18 @@
> > > >  // SPDX-License-Identifier: GPL-2.0+
> > > >  /*
> > > >   * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > > > - * Variscite SoM mounted on it
> > > > + * Variscite SoM mounted on it (6UL CPU variant).
> > > >   *
> > > >   * Copyright 2019 Variscite Ltd.
> > > >   * Copyright 2025 Bootlin
> > > >   */
> > > >
> > > > +/dts-v1/;
> > > > +
> > > >  #include "imx6ul-var-som.dtsi"
> > > > -#include <dt-bindings/leds/common.h>
> > > > +#include "imx6ul-var-som-concerto-common.dtsi"
> > > >
> > > >  / {
> > > > -	model = "Variscite VAR-SOM-6UL Concerto Board";
> > > > +	model = "Variscite VAR-SOM-6UL Concerto Board (6UL CPU)";
> > > >  	compatible = "variscite,mx6ulconcerto", "variscite,var-som-imx6ul", "fsl,imx6ul";
> > > > -
> > > > -	chosen {
> > > > -		stdout-path = &uart1;
> > > > -	};
> > > > -
> > > > -	gpio-keys {
> > > > -		compatible = "gpio-keys";
> > > > -		pinctrl-names = "default";
> > > > -		pinctrl-0 = <&pinctrl_gpio_key_back>, <&pinctrl_gpio_key_wakeup>;
> > > > -
> > > > -		key-back {
> > > > -			gpios = <&gpio4 14 GPIO_ACTIVE_LOW>;
> > > > -			linux,code = <KEY_BACK>;
> > > > -		};
> > > > -
> > > > -		key-wakeup {
> > > > -			gpios = <&gpio5 8 GPIO_ACTIVE_LOW>;
> > > > -			linux,code = <KEY_WAKEUP>;
> > > > -			wakeup-source;
> > > > -		};
> > > > -	};
> > > > -
> > > > -	leds {
> > > > -		compatible = "gpio-leds";
> > > > -		pinctrl-names = "default";
> > > > -		pinctrl-0 = <&pinctrl_gpio_leds>;
> > > > -
> > > > -		led-0 {
> > > > -			function = LED_FUNCTION_STATUS;
> > > > -			color = <LED_COLOR_ID_GREEN>;
> > > > -			label = "gpled2";
> > > > -			gpios = <&gpio1 25 GPIO_ACTIVE_HIGH>;
> > > > -			linux,default-trigger = "heartbeat";
> > > > -		};
> > > > -	};
> > > > -};
> > > > -
> > > > -&can1 {
> > > > -	pinctrl-names = "default";
> > > > -	pinctrl-0 = <&pinctrl_flexcan1>;
> > > > -	status = "okay";
> > > > -};
> > > > -
> > > > -&fec1 {
> > > > -	status = "disabled";
> > > > -};
> > > > -
> > > > -&fec2 {
> > > > -	pinctrl-names = "default";
> > > > -	pinctrl-0 = <&pinctrl_enet2>, <&pinctrl_enet2_gpio>, <&pinctrl_enet2_mdio>;
> > > > -	phy-mode = "rmii";
> > > > -	phy-handle = <&ethphy1>;
> > > > -	status = "okay";
> > > > -
> > > > -	mdio {
> > > > -		#address-cells = <1>;
> > > > -		#size-cells = <0>;
> > > > -
> > > > -		ethphy1: ethernet-phy@3 {
> > > > -			compatible = "ethernet-phy-ieee802.3-c22";
> > > > -			reg = <3>;
> > > > -			clocks = <&rmii_ref_clk>;
> > > > -			clock-names = "rmii-ref";
> > > > -			reset-gpios = <&gpio5 5 GPIO_ACTIVE_LOW>;
> > > > -			reset-assert-us = <100000>;
> > > > -			micrel,led-mode = <0>;
> > > > -			micrel,rmii-reference-clock-select-25-mhz;
> > > > -		};
> > > > -	};
> > > > -};
> > > > -
> > > > -&i2c1 {
> > > > -	clock-frequency = <100000>;
> > > > -	pinctrl-names = "default";
> > > > -	pinctrl-0 = <&pinctrl_i2c1>;
> > > > -	status = "okay";
> > > > -
> > > > -	rtc@68 {
> > > > -		/*
> > > > -		 * To actually use this interrupt
> > > > -		 * connect pins J14.8 & J14.10 on the Concerto-Board.
> > > > -		 */
> > > > -		compatible = "dallas,ds1337";
> > > > -		reg = <0x68>;
> > > > -		pinctrl-names = "default";
> > > > -		pinctrl-0 = <&pinctrl_rtc>;
> > > > -		interrupt-parent = <&gpio1>;
> > > > -		interrupts = <10 IRQ_TYPE_EDGE_FALLING>;
> > > > -	};
> > > > -};
> > > > -
> > > > -&iomuxc {
> > > > -	pinctrl_enet2: enet2grp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_ENET2_RX_EN__ENET2_RX_EN	0x1b0b0
> > > > -			MX6UL_PAD_ENET2_RX_ER__ENET2_RX_ER	0x1b0b0
> > > > -			MX6UL_PAD_ENET2_RX_DATA0__ENET2_RDATA00	0x1b0b0
> > > > -			MX6UL_PAD_ENET2_RX_DATA1__ENET2_RDATA01	0x1b0b0
> > > > -			MX6UL_PAD_ENET2_TX_EN__ENET2_TX_EN	0x1b0b0
> > > > -			MX6UL_PAD_ENET2_TX_DATA0__ENET2_TDATA00	0x1b0b0
> > > > -			MX6UL_PAD_ENET2_TX_DATA1__ENET2_TDATA01	0x1b0b0
> > > > -			MX6UL_PAD_ENET2_TX_CLK__ENET2_REF_CLK2	0x4001b031
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_enet2_gpio: enet2-gpiogrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_SNVS_TAMPER5__GPIO5_IO05	0x1b0b0 /* fec2 reset */
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_enet2_mdio: enet2-mdiogrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_GPIO1_IO06__ENET2_MDIO	0x1b0b0
> > > > -			MX6UL_PAD_GPIO1_IO07__ENET2_MDC		0x1b0b0
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_flexcan1: flexcan1grp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_UART3_RTS_B__FLEXCAN1_RX	0x1b020
> > > > -			MX6UL_PAD_UART3_CTS_B__FLEXCAN1_TX	0x1b020
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_gpio_key_back: gpio-key-backgrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_NAND_CE1_B__GPIO4_IO14	0x17059
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_gpio_leds: gpio-ledsgrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_UART3_RX_DATA__GPIO1_IO25	0x1b0b0	/* GPLED2 */
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_gpio_key_wakeup: gpio-keys-wakeupgrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_SNVS_TAMPER8__GPIO5_IO08	0x17059
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_i2c1: i2c1grp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_CSI_PIXCLK__I2C1_SCL		0x4001b8b0
> > > > -			MX6UL_PAD_CSI_MCLK__I2C1_SDA		0x4001b8b0
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_pwm4: pwm4grp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_GPIO1_IO05__PWM4_OUT		0x110b0
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_rtc: rtcgrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_JTAG_MOD__GPIO1_IO10		0x1b0b0 /* RTC alarm IRQ */
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_uart1: uart1grp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_UART1_TX_DATA__UART1_DCE_TX	0x1b0b1
> > > > -			MX6UL_PAD_UART1_RX_DATA__UART1_DCE_RX	0x1b0b1
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_uart5: uart5grp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_CSI_DATA00__UART5_DCE_TX	0x1b0b1
> > > > -			MX6UL_PAD_CSI_DATA01__UART5_DCE_RX	0x1b0b1
> > > > -			MX6UL_PAD_GPIO1_IO09__UART5_DCE_CTS	0x1b0b1
> > > > -			MX6UL_PAD_GPIO1_IO08__UART5_DCE_RTS	0x1b0b1
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_usb_otg1_id: usbotg1idgrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_UART3_TX_DATA__ANATOP_OTG1_ID	0x17059
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_usdhc1: usdhc1grp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x17059
> > > > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x17059
> > > > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x17059
> > > > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x17059
> > > > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x17059
> > > > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x17059
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_usdhc1_100mhz: usdhc1-100mhzgrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170b9
> > > > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100b9
> > > > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170b9
> > > > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170b9
> > > > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170b9
> > > > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170b9
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_usdhc1_200mhz: usdhc1-200mhzgrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_SD1_CMD__USDHC1_CMD		0x170f9
> > > > -			MX6UL_PAD_SD1_CLK__USDHC1_CLK		0x100f9
> > > > -			MX6UL_PAD_SD1_DATA0__USDHC1_DATA0	0x170f9
> > > > -			MX6UL_PAD_SD1_DATA1__USDHC1_DATA1	0x170f9
> > > > -			MX6UL_PAD_SD1_DATA2__USDHC1_DATA2	0x170f9
> > > > -			MX6UL_PAD_SD1_DATA3__USDHC1_DATA3	0x170f9
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_usdhc1_gpio: usdhc1-gpiogrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_GPIO1_IO00__GPIO1_IO00	0x1b0b1 /* CD */
> > > > -		>;
> > > > -	};
> > > > -
> > > > -	pinctrl_wdog: wdoggrp {
> > > > -		fsl,pins = <
> > > > -			MX6UL_PAD_GPIO1_IO01__WDOG1_WDOG_B	0x78b0
> > > > -		>;
> > > > -	};
> > > > -};
> > > > -
> > > > -&pwm4 {
> > > > -	pinctrl-names = "default";
> > > > -	pinctrl-0 = <&pinctrl_pwm4>;
> > > > -	status = "okay";
> > > > -};
> > > > -
> > > > -&snvs_pwrkey {
> > > > -	status = "disabled";
> > > > -};
> > > > -
> > > > -&snvs_rtc {
> > > > -	status = "disabled";
> > > > -};
> > > > -
> > > > -&tsc {
> > > > -	/*
> > > > -	 * Conflics with wdog1 ext-reset-output & SD CD pins,
> > > > -	 * so we keep it disabled by default.
> > > > -	 */
> > > > -	status = "disabled";
> > > > -};
> > > > -
> > > > -/* Console UART */
> > > > -&uart1 {
> > > > -	pinctrl-names = "default";
> > > > -	pinctrl-0 = <&pinctrl_uart1>;
> > > > -	status = "okay";
> > > > -};
> > > > -
> > > > -/* ttymxc4 UART */
> > > > -&uart5 {
> > > > -	pinctrl-names = "default";
> > > > -	pinctrl-0 = <&pinctrl_uart5>;
> > > > -	uart-has-rtscts;
> > > > -	status = "okay";
> > > > -};
> > > > -
> > > > -&usbotg1 {
> > > > -	pinctrl-names = "default";
> > > > -	pinctrl-0 = <&pinctrl_usb_otg1_id>;
> > > > -	dr_mode = "otg";
> > > > -	disable-over-current;
> > > > -	srp-disable;
> > > > -	hnp-disable;
> > > > -	adp-disable;
> > > > -	status = "okay";
> > > > -};
> > > > -
> > > > -&usbotg2 {
> > > > -	dr_mode = "host";
> > > > -	disable-over-current;
> > > > -	status = "okay";
> > > > -};
> > > > -
> > > > -&usdhc1 {
> > > > -	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> > > > -	pinctrl-0 = <&pinctrl_usdhc1>, <&pinctrl_usdhc1_gpio>;
> > > > -	pinctrl-1 = <&pinctrl_usdhc1_100mhz>, <&pinctrl_usdhc1_gpio>;
> > > > -	pinctrl-2 = <&pinctrl_usdhc1_200mhz>, <&pinctrl_usdhc1_gpio>;
> > > > -	cd-gpios = <&gpio1 0 GPIO_ACTIVE_LOW>;
> > > > -	no-1-8-v;
> > > > -	keep-power-in-suspend;
> > > > -	wakeup-source;
> > > > -	status = "okay";
> > > > -};
> > > > -
> > > > -&wdog1 {
> > > > -	pinctrl-names = "default";
> > > > -	pinctrl-0 = <&pinctrl_wdog>;
> > > > -	/*
> > > > -	 * To actually use ext-reset-output
> > > > -	 * connect pins J17.3 & J17.8 on the Concerto-Board
> > > > -	 */
> > > > -	fsl,ext-reset-output;
> > > >  };
> > > > diff --git a/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > > > new file mode 100644
> > > > index 0000000000000..7c601af2657d7
> > > > --- /dev/null
> > > > +++ b/arch/arm/boot/dts/nxp/imx/imx6ull-var-som-concerto.dts
> > > > @@ -0,0 +1,17 @@
> > > > +// SPDX-License-Identifier: GPL-2.0+
> > > > +/*
> > > > + * Support for Variscite MX6 Concerto Carrier board with the VAR-SOM-6UL
> > > > + * Variscite SoM mounted on it (6ULL CPU variant).
> > > > + *
> > > > + * Copyright 2026 Dimonoff
> > > > + */
> > > > +
> > > > +/dts-v1/;
> > > > +
> > > > +#include "imx6ull-var-som.dtsi"
> > > > +#include "imx6ul-var-som-concerto-common.dtsi"
> > > > +
> > > > +/ {
> > > > +	model = "Variscite VAR-SOM-6UL Concerto Board (6ULL CPU)";
> > > > +	compatible = "variscite,mx6ullconcerto", "variscite,var-som-imx6ull", "fsl,imx6ull";
> > > > +};
> > > > --
> > > > 2.47.3
> > > >
> > >
> >
> >
> > --
> > Hugo Villeneuve
> 


-- 
Hugo Villeneuve

