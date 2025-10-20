Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D55FDCCD193
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 20 Oct 2025 12:48:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qG38QouOAiJDe70jz6Us+02ZPOy6qlEZVBeSeQllsf4=; b=q49qzq3OWiv47Zl75IL49uIHLC
	mobqJiO+BLN02NRW1xh3cCHBN/kScHcOWIe33NnAnsPdD4EnUvmSz5ubo4EFao1qmVtDDDGjOwnV1
	OJRYrhYTwl75dWpIk/kbO4X4kaFTk7RWTZyOZXYBwX08axLxQiM/X8FnyAxNdoj0smyfCSUZEpyLI
	9XFfKZu1t5hhsfFERCmV04JjbqkbwzcfcupApyWySTuvOHj3QNj1yEm1qepmrgo22Zo7T2CIVd9n1
	UQNzaakV2es2CqYg90u+KjjcrnhpD+g9/EOnQihh+dcz/PUjDJpmN+Q1dfF3cHSwv2O4uAmxZFj/d
	S7omWZVw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApJN-0000000DclC-0Iby;
	Mon, 20 Oct 2025 12:48:29 +0000
Received: from mail-m16.yeah.net ([220.197.32.17])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vApJJ-0000000DckP-1jPV
	for linux-arm-kernel@lists.infradead.org;
	Mon, 20 Oct 2025 12:48:27 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=qG38QouOAiJDe70jz6Us+02ZPOy6qlEZVBeSeQllsf4=;
	b=GJNyNazGNH1J8Z23xlahfIB4N9k1UPOa5jeUmZ8DXTAMdQO1I67Jlq0Uk8toIZ
	J1haK204p9moPdukvCA4NwSzmBDsujtNmXTsCMTvc3Wt/t6GCzCxrCVIbAQTBsUx
	4V88hcHLLlhGEfIDbtMswv6J0CtRYphPBJ0yc1BYV1n9Y=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgD3X7GAL_ZocZNTAA--.29215S3;
	Mon, 20 Oct 2025 20:48:02 +0800 (CST)
Date: Mon, 20 Oct 2025 20:48:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Andreas Kemnade <akemnade@kernel.org>
Cc: Lee Jones <lee@kernel.org>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Alistair Francis <alistair@alistair23.me>,
	Liam Girdwood <lgirdwood@gmail.com>,
	Mark Brown <broonie@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <Frank.li@nxp.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	Peng Fan <peng.fan@nxp.com>
Subject: Re: [PATCH v3 3/3] ARM: dts: imx: e70k02: add sy7636
Message-ID: <aPYvgKWNvr0RxOKQ@dragon>
References: <20250917-sy7636-rsrc-v3-0-331237d507a2@kernel.org>
 <20250917-sy7636-rsrc-v3-3-331237d507a2@kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250917-sy7636-rsrc-v3-3-331237d507a2@kernel.org>
X-CM-TRANSID: M88vCgD3X7GAL_ZocZNTAA--.29215S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxtr4kuw4Uuw4fCw1fGF1rZwb_yoW7WrWkpa
	1Svrs5WrWxWF1fta43AasrCr1fCws2kr1v9w47uFy8Aa1qva4UJF4UKrn3Crn8XFs8Zw4Y
	vrn5ury7W3Wqv3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jezuAUUUUU=
X-Originating-IP: [121.224.201.6]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNALDKWj2L4I5uAAA3u
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251020_054825_857847_24549CA0 
X-CRM114-Status: GOOD (  16.34  )
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

On Wed, Sep 17, 2025 at 09:14:31AM +0200, Andreas Kemnade wrote:
> Add the EPD PMIC for the e70k02 based devices as a step towards full EPD
> support.
> 
> Acked-by: Alistair Francis <alistair@alistair23.me>
> Reviewed-by: Peng Fan <peng.fan@nxp.com>
> Signed-off-by: Andreas Kemnade <akemnade@kernel.org>
> ---
>  arch/arm/boot/dts/nxp/imx/e70k02.dtsi              | 25 +++++++++++++++++++++-
>  .../arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts | 24 +++++++++++++++++++++
>  .../arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts | 24 +++++++++++++++++++++
>  3 files changed, 72 insertions(+), 1 deletion(-)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> index dcc3c9d488a88..b4f42f71c6c49 100644
> --- a/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> +++ b/arch/arm/boot/dts/nxp/imx/e70k02.dtsi
> @@ -69,6 +69,14 @@ memory@80000000 {
>  		reg = <0x80000000 0x20000000>;
>  	};
>  
> +	epd_pmic_supply: regulator-epd-pmic-in {
> +		compatible = "regulator-fixed";
> +		regulator-name = "epd_pmic_supply";
> +		gpio = <&gpio2 14 GPIO_ACTIVE_HIGH>;
> +		startup-delay-us = <20000>;
> +		enable-active-high;

enable-active-high right after gpio = <... GPIO_ACTIVE_HIGH>, as it's a
supplement description for "gpio" property.

Shawn

> +	};
> +
>  	reg_wifi: regulator-wifi {
>  		compatible = "regulator-fixed";
>  		regulator-name = "SD3_SPWR";
> @@ -133,7 +141,22 @@ touchscreen@24 {
>  		vdd-supply = <&ldo5_reg>;
>  	};
>  
> -	/* TODO: SY7636 PMIC for E Ink at 0x62 */
> +	sy7636: pmic@62 {
> +		compatible = "silergy,sy7636a";
> +		reg = <0x62>;
> +		enable-gpios = <&gpio2 8 GPIO_ACTIVE_HIGH>;
> +		vcom-en-gpios = <&gpio2 3 GPIO_ACTIVE_HIGH>;
> +		epd-pwr-good-gpios = <&gpio2 13 GPIO_ACTIVE_HIGH>;
> +		vin-supply = <&epd_pmic_supply>;
> +
> +		#thermal-sensor-cells = <0>;
> +
> +		regulators {
> +			reg_epdpmic: vcom {
> +				regulator-name = "vcom";
> +			};
> +		};
> +	};
>  
>  };
>  
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
> index a2534c422a522..f8709a9524093 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sl-tolino-vision5.dts
> @@ -26,6 +26,11 @@ / {
>  	compatible = "kobo,tolino-vision5", "fsl,imx6sl";
>  };
>  
> +&epd_pmic_supply {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_epd_pmic_supply>;
> +};
> +
>  &gpio_keys {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpio_keys>;
> @@ -59,6 +64,12 @@ MX6SL_PAD_FEC_RXD1__GPIO4_IO18          0x10059 /* TP_RST */
>  		>;
>  	};
>  
> +	pinctrl_epd_pmic_supply: epd-pmic-supplygrp {
> +		fsl,pins = <
> +			MX6SL_PAD_EPDC_PWRWAKEUP__GPIO2_IO14    0x40010059
> +		>;
> +	};
> +
>  	pinctrl_gpio_keys: gpio-keysgrp {
>  		fsl,pins = <
>  			MX6SL_PAD_FEC_CRS_DV__GPIO4_IO25	0x17059	/* PWR_SW */
> @@ -159,6 +170,14 @@ MX6SL_PAD_KEY_COL2__GPIO3_IO28		0x1b8b1 /* ricoh619 bat_low_int */
>  		>;
>  	};
>  
> +	pinctrl_sy7636_gpio: sy7636-gpiogrp {
> +		fsl,pins = <
> +			MX6SL_PAD_EPDC_VCOM0__GPIO2_IO03        0x40010059 /* VCOM_CTRL */
> +			MX6SL_PAD_EPDC_PWRCTRL1__GPIO2_IO08     0x40010059 /* EN */
> +			MX6SL_PAD_EPDC_PWRSTAT__GPIO2_IO13      0x17059 /* PWR_GOOD */
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX6SL_PAD_UART1_TXD__UART1_TX_DATA 0x1b0b1
> @@ -329,6 +348,11 @@ &ricoh619 {
>  	pinctrl-0 = <&pinctrl_ricoh_gpio>;
>  };
>  
> +&sy7636 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sy7636_gpio>;
> +};
> +
>  &uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart1>;
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
> index 660620d226f71..19bbe60331b36 100644
> --- a/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
> +++ b/arch/arm/boot/dts/nxp/imx/imx6sll-kobo-librah2o.dts
> @@ -36,6 +36,11 @@ &cpu0 {
>  	soc-supply = <&dcdc1_reg>;
>  };
>  
> +&epd_pmic_supply {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_epd_pmic_supply>;
> +};
> +
>  &gpio_keys {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_gpio_keys>;
> @@ -69,6 +74,12 @@ MX6SLL_PAD_GPIO4_IO18__GPIO4_IO18	0x10059 /* TP_RST */
>  		>;
>  	};
>  
> +	pinctrl_epd_pmic_supply: epd-pmic-supplygrp {
> +		fsl,pins = <
> +			MX6SLL_PAD_EPDC_PWR_WAKE__GPIO2_IO14    0x40010059
> +		>;
> +	};
> +
>  	pinctrl_gpio_keys: gpio-keysgrp {
>  		fsl,pins = <
>  			MX6SLL_PAD_GPIO4_IO25__GPIO4_IO25	0x17059	/* PWR_SW */
> @@ -169,6 +180,14 @@ MX6SLL_PAD_KEY_COL2__GPIO3_IO28		0x1b8b1 /* ricoh619 bat_low_int */
>  		>;
>  	};
>  
> +	pinctrl_sy7636_gpio: sy7636-gpiogrp {
> +		fsl,pins = <
> +			MX6SLL_PAD_EPDC_VCOM0__GPIO2_IO03       0x40010059 /* VCOM_CTRL */
> +			MX6SLL_PAD_EPDC_PWR_CTRL1__GPIO2_IO08   0x40010059 /* EN */
> +			MX6SLL_PAD_EPDC_PWR_STAT__GPIO2_IO13    0x17059 /* PWR_GOOD */
> +		>;
> +	};
> +
>  	pinctrl_uart1: uart1grp {
>  		fsl,pins = <
>  			MX6SLL_PAD_UART1_TXD__UART1_DCE_TX 0x1b0b1
> @@ -319,6 +338,11 @@ &ricoh619 {
>  	pinctrl-0 = <&pinctrl_ricoh_gpio>;
>  };
>  
> +&sy7636 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sy7636_gpio>;
> +};
> +
>  &uart1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_uart1>;
> 
> -- 
> 2.47.3
> 


