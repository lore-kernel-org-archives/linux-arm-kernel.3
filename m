Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AE5C6C021B2
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 23 Feb 2025 04:05:06 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JIgRN+3XWpbCfDnE3nN0Ey2Rm2UwEB6WW3O8E2/greM=; b=wyAknuOd+UV2squ0EHPQQn+yUN
	zmHJaEons64981fg2rmoqeXmZpa8reOi+9D5hahW98Oj7u06wOkY4l5jnNttv0v6/O3y5kzoQGxqe
	eOt6dyh0PQRrToX2boKp0eJXrF2Jn1kTJeJT8catn1quiczx58QuPJGocJDaSIbt1i73Xf895NYHl
	dPd8S268m/LfV5mfNsHf36grlgI0QlnSkNyCj5EKLIY9c4/K9zZP0ugCpmA0i+1jr4S/NY6FdMG4J
	v+Xz7L+9Qtujwm0IfrL3E3hJ9Zr/Thd4YOTufH/fn8Uo7wkoHBZ3OVZOgB/N+YM+vt0/6A3P9TcYH
	Qu4iFXag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm3Ea-0000000AB9X-3MUR;
	Sun, 23 Feb 2025 04:04:52 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tm3D6-0000000AAkd-3po0
	for linux-arm-kernel@lists.infradead.org;
	Sun, 23 Feb 2025 04:03:22 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=JIgRN+3XWpbCfDnE3nN0Ey2Rm2UwEB6WW3O8E2/greM=;
	b=ZEx5XNFTiFbr2pRhIM56TXOExKvgiNVvoa9/oTHwGTqtXcxtydYDRufHTk9p+1
	K8/+114z56brO9VRWxiou3kcDvtHJBpgyNA83/HvdBdysTotDNrtm2cYFDO8zRLG
	O7g5v61Mwp4PcQZuRXoffIT1hcQkIU6n54GdxFmZ3ZYv0=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgAHj_D0nbpnJRTGCQ--.24347S3;
	Sun, 23 Feb 2025 12:03:01 +0800 (CST)
Date: Sun, 23 Feb 2025 12:03:00 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Mathew McBride <matt@traverse.com.au>
Cc: devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Shawn Guo <shawnguo@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>
Subject: Re: [PATCH] arm64: dts: freescale: ten64: add usb hub definition
Message-ID: <Z7qd9GPGM8+NBioH@dragon>
References: <20250129045352.10728-1-matt@traverse.com.au>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250129045352.10728-1-matt@traverse.com.au>
X-CM-TRANSID: Ms8vCgAHj_D0nbpnJRTGCQ--.24347S3
X-Coremail-Antispam: 1Uf129KBjvJXoWxGFyUGr45JF1rCr1DKr4fuFg_yoW5XF4kp3
	Z8ursrCrs5XFy7t3W2gF1xtFZ8Ww4rKF93Zr98Jr4UAryDuasrKrnFkr43uF1UXF18Cw4a
	vF4DZry2kFnIg3DanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07UoMKZUUUUU=
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiBBX7ZWe5p-zUGwABsE
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_200321_391904_6A0516C4 
X-CRM114-Status: GOOD (  18.34  )
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

On Wed, Jan 29, 2025 at 03:53:52PM +1100, Mathew McBride wrote:
> A device tree binding for the Microchip USB5744 hub controller
> was added in commit 02be19e914b8 ("dt-bindings: usb: Add support
> for Microchip usb5744 hub controller").
> 
> U-Boot will consume this binding in order to perform the
> necessary actions to enable the USB hub ports over I2C.
> (We previously used our own out-of-tree driver for
> this task)
> 
> The Ten64 board does not have any switchable supplies
> for the voltage rails utilized by the USB5744, so a
> pair of dummy supplies have been added to facilitate
> operation with U-Boot's hub driver.
> 
> Signed-off-by: Mathew McBride <matt@traverse.com.au>
> ---
>  .../boot/dts/freescale/fsl-ls1088a-ten64.dts  | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
> index bc0d89427fbe5..fc15c83d222f6 100644
> --- a/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
> +++ b/arch/arm64/boot/dts/freescale/fsl-ls1088a-ten64.dts
> @@ -87,6 +87,22 @@ sfp_xg1: dpmac1-sfp {
>  		los-gpios = <&sfpgpio 7 GPIO_ACTIVE_HIGH>;
>  		maximum-power-milliwatt = <2000>;
>  	};
> +
> +	usb1v2_supply: regulator {
> +		compatible = "regulator-fixed";
> +		regulator-name = "usbhub_1v2";
> +		regulator-min-microvolt = <1200000>;
> +		regulator-max-microvolt = <1200000>;
> +		regulator-always-on;
> +	};
> +
> +	system3v3_supply: regulator {

Same node name for two regulators above?  Won't kernel complain?

> +		compatible = "regulator-fixed";
> +		regulator-name = "system_3v3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		regulator-always-on;
> +	};
>  };
>  
>  /* XG1 - Upper SFP */
> @@ -231,6 +247,12 @@ at97sc: tpm@29 {
>  		compatible = "atmel,at97sc3204t";
>  		reg = <0x29>;
>  	};
> +
> +	usbhub: usb-hub@2d {
> +		compatible = "microchip,usb5744";
> +		reg = <0x2d>;
> +	};
> +
>  };
>  
>  &i2c2 {
> @@ -378,10 +400,33 @@ partition@9400000 {
>  	};
>  };
>  
> +/* LS1088A USB Port 0 - direct to bottom USB-A port */
>  &usb0 {
>  	status = "okay";
>  };
>  
> +/* LS1088A USB Port 1 - to Microchip USB5744 USB Hub */
>  &usb1 {
> +	#address-cells = <1>;
> +	#size-cells = <0>;
> +

Nit: unnecessary newline

Shawn

>  	status = "okay";
> +
> +	hub_2_0: hub@1 {
> +		compatible = "usb424,2744";
> +		reg = <1>;
> +		peer-hub = <&hub_3_0>;
> +		i2c-bus = <&usbhub>;
> +		vdd-supply = <&system3v3_supply>;
> +		vdd2-supply = <&usb1v2_supply>;
> +	};
> +
> +	hub_3_0: hub@2 {
> +		compatible = "usb424,5744";
> +		reg = <2>;
> +		peer-hub = <&hub_2_0>;
> +		i2c-bus = <&usbhub>;
> +		vdd-supply = <&system3v3_supply>;
> +		vdd2-supply = <&usb1v2_supply>;
> +	};
>  };
> -- 
> 2.45.1
> 


