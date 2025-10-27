Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E6D31CCF9E9
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 00:51:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Mfe/m5mRhKga9zLtu31a/sVqXTyfvHsMKaxlczQ85zs=; b=T8NJysuvdZyyAOvWKjN9C1mNlD
	NlJqBa4wCBmjxW5KMXZDzyr79wTHu4uzeLPvyUjAObdJ5VMK9wcLqf0a7nHlVu9VtfNsnCWmOmjot
	XOglLIikdFlPRS6onsrzrx7d17dA6PevLNkTTLtUtee2oAQxlq/ESLxpkpABtEIqhJ2bLeO/NZL9X
	bIaqqtO8LdTrfn1famzCsdYVoR2LgGKGO7AIAk7QU8ielcc6o+PCwtAXOc/vCgdimtMyzoLjrI/rB
	LSTOZazQ+3RMj1Za74b+dMnGzwJ4rPa/4y6ihe3BTmBKLLXhjRzC+Mv1lfih50Sy++heZc746okkg
	NDIvqJFA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBRq-0000000Cucn-3H0H;
	Mon, 27 Oct 2025 00:50:58 +0000
Received: from mail-m16.yeah.net ([1.95.21.16])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBRn-0000000Cuc2-2fwK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 00:50:57 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:To:Subject:Message-ID:MIME-Version:
	Content-Type; bh=Mfe/m5mRhKga9zLtu31a/sVqXTyfvHsMKaxlczQ85zs=;
	b=lQjAA7Flm3b7icS0LXV5lqPBu2tMioIDSh+mHMhH7vxjSynDEwGF0MZmsVi0UC
	o9yNOxpmkRMmM8pAPWW5iMFNNURoqVxpSOncm1I9rIVQd3XRR/QzDjYjxI+ZLdsU
	5N81f86PIssO//es7FueWFSvZH7sLuiEhKgBSXRf2pjt4=
Received: from dragon (unknown [])
	by gzsmtp3 (Coremail) with SMTP id M88vCgDn94u0wf5o7MO1AA--.46675S3;
	Mon, 27 Oct 2025 08:49:58 +0800 (CST)
Date: Mon, 27 Oct 2025 08:49:56 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com,
	Frank Li <Frank.Li@nxp.com>, Sascha Hauer <s.hauer@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>, Mark Brown <broonie@kernel.org>,
	Michael Trimarchi <michael@amarulasolutions.com>,
	Conor Dooley <conor+dt@kernel.org>,
	Fabio Estevam <festevam@gmail.com>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Rob Herring <robh@kernel.org>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [RESEND PATCH 2/3] ARM: dts: imx28-amarula-rmm: add I2S audio
Message-ID: <aP7BtHVgigfcdtcE@dragon>
References: <20250924130749.3012071-1-dario.binacchi@amarulasolutions.com>
 <20250924130749.3012071-2-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250924130749.3012071-2-dario.binacchi@amarulasolutions.com>
X-CM-TRANSID: M88vCgDn94u0wf5o7MO1AA--.46675S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxAFWkury8ur4ftFy7CFyrXrb_yoW5Cr47pr
	1vkw4fCry8Aw18J34rJa4DGFs3G3yDGrWq9rnaqr1UAF9Iv34UXrW0kw15uF93XrZ3Aw4a
	gF98ZFyIkws8t37anT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07U7UUUUUUUU=
X-Originating-IP: [117.80.155.87]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiNRZ33Gj+wbZOVwAA3w
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_175056_082427_FCFB5AB8 
X-CRM114-Status: GOOD (  16.32  )
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

On Wed, Sep 24, 2025 at 03:07:45PM +0200, Dario Binacchi wrote:
> Add support for I2S audio on Amarula rmm board. Audio codec
> TLV320AIC3X is connected as slave to SAIF0, which provides
> bitclock, frame and MCLK.
> 
> Co-developed-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Michael Trimarchi <michael@amarulasolutions.com>
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> ---
> 
>  .../boot/dts/nxp/mxs/imx28-amarula-rmm.dts    | 51 +++++++++++++++++++
>  1 file changed, 51 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> index af59211842fb..0c5b52f67178 100644
> --- a/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> +++ b/arch/arm/boot/dts/nxp/mxs/imx28-amarula-rmm.dts
> @@ -112,6 +112,29 @@ reg_usb1_vbus: regulator-usb1-vbus {
>  		enable-active-high;
>  		regulator-always-on;
>  	};
> +
> +	sound {
> +		compatible = "simple-audio-card";
> +		simple-audio-card,name = "imx28-mrmmi-tlv320aic3x-audio";
> +		simple-audio-card,format = "i2s";
> +		simple-audio-card,bitclock-master = <&cpu_dai>;
> +		simple-audio-card,frame-master = <&cpu_dai>;
> +		simple-audio-card,widgets =
> +			"Headphone", "Headphone Jack";
> +		simple-audio-card,routing =
> +			"Headphone Jack", "HPROUT",
> +			"Headphone Jack", "HPRCOM";
> +		simple-audio-card,mclk-fs = <512>;
> +
> +		cpu_dai: simple-audio-card,cpu {
> +			sound-dai = <&saif0>;
> +			clocks = <&saif0>;
> +		};
> +
> +		codec_dai: simple-audio-card,codec {
> +			sound-dai = <&tlv320aic3x>;
> +		};
> +	};
>  };
>  
>  &auart0 {
> @@ -154,6 +177,20 @@ &i2c0 {
>  	pinctrl-0 = <&i2c0_pins_a>;
>  	status = "okay";
>  
> +	tlv320aic3x: tlv320aic3x@18 {

Can we use a generic node name?

> +		compatible = "ti,tlv320aic3x";
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&tlv320aic3x_pins>;
> +		reg = <0x18>;
> +		reset-gpios = <&gpio2 4 GPIO_ACTIVE_LOW>;
> +		#sound-dai-cells = <0>;
> +

Nitpick: unnecessary newline

Shawn

> +		DVDD-supply = <&reg_1v8>;
> +		IOVDD-supply = <&reg_3v3>;
> +		AVDD-supply = <&reg_3v3>;
> +		DRVDD-supply = <&reg_3v3>;
> +	};
> +
>  	touchscreen: touchscreen@38 {
>  		compatible = "edt,edt-ft5306";
>  		reg = <0x38>;
> @@ -246,6 +283,14 @@ MX28_PAD_PWM1__GPIO_3_17
>  		fsl,voltage = <MXS_VOLTAGE_HIGH>;
>  	};
>  
> +	tlv320aic3x_pins: tlv320aic3x-pins@0 {
> +		reg = <0>;
> +		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA4__GPIO_2_4>;
> +		fsl,drive-strength = <MXS_DRIVE_4mA>;
> +		fsl,pull-up = <MXS_PULL_ENABLE>;
> +		fsl,voltage = <MXS_VOLTAGE_HIGH>;
> +	};
> +
>  	usb0_vbus_enable_pin: usb0-vbus-enable@0 {
>  		reg = <0>;
>  		fsl,pinmux-ids = <MX28_PAD_SSP0_DATA5__GPIO_2_5>;
> @@ -269,6 +314,12 @@ &pwm {
>  	status = "okay";
>  };
>  
> +&saif0 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&saif0_pins_a>;
> +	status = "okay";
> +};
> +
>  /* microSD */
>  &ssp0 {
>  	compatible = "fsl,imx28-mmc";
> -- 
> 2.43.0
> 
> base-commit: cec1e6e5d1ab33403b809f79cd20d6aff124ccfe
> branch: microgea-rmm-audio


