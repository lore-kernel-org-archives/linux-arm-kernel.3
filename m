Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D070FCD6E5D
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Jun 2026 08:59:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yQvmGCkRx1zbzWiK7vsQFih7vgr1uY9VEVjpH76oFfM=; b=VPdmUW+GEJW6ekCiBuvwSJstDZ
	G2Ugc+zZdU2rLdXrrUySL7L3+d2YZ+0khqjbcSS+sMJBhxvt3EX9TYHsyfK8+DWtMyG46zcEr7btF
	pqct+LwTPrh5pbnEj3QppBw1pvAxDsUIzf6zJFi4eGu36Rqu4NgsVni5G6xZBPqJGVe0w5lGSEbI2
	ptKm1jMbit2o5Xtt2KEDc7dqwIUx4Wd1H3Fc3xQF6WLrF/XMDTFTi6/WKuDD7Uw8J5fbJRw0LX9RB
	W/1CRs/EkicqOHt65eVe0fV/ned8FI3iyuIkZr3k7GK4ytVuKDNFqiNYajSsXPrLc+LkaW8bxaHbk
	iXSQT9Qw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQOd-00000000MBL-03jE;
	Fri, 05 Jun 2026 08:59:19 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wVQOa-00000000MAA-1whm
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Jun 2026 08:59:18 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id A162A1A1A7F;
	Fri,  5 Jun 2026 10:59:12 +0200 (CEST)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 6B2421A1A01;
	Fri,  5 Jun 2026 10:59:12 +0200 (CEST)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 0EBBC1800071;
	Fri,  5 Jun 2026 16:59:09 +0800 (+08)
Date: Fri, 5 Jun 2026 17:59:08 +0900
From: Joseph Guo <qijian.guo@nxp.com>
To: Francesco Valla <francesco@valla.it>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Daniel Baluta <daniel.baluta@nxp.com>, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, steven.yang@nxp.com
Subject: Re: [PATCH] arm64: dts: imx93-11x11-frdm: enable additional devices
Message-ID: <aiKP3EgdrCbqtUH0@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
References: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260115-imx93_devices-v1-1-b2c840cafa2e@valla.it>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260605_015916_766735_574990EB 
X-CRM114-Status: GOOD (  21.93  )
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

On Thu, Jan 15, 2026 at 06:11:34PM +0100, Francesco Valla wrote:
> Enable additional devices on the i.MX93 FRDM board:
> 
>   - CAN port and associated transceiver
>   - Bluetooth portion of the IW612 chipset
>   - WiFi SDIO port
>   - user buttons
> 
> The WiFi portion of the on-board IW612 chipset is still not supported
> upstream, but since SDIO is a discoverable bus it will be probed once it
> is.
> 
> Signed-off-by: Francesco Valla <francesco@valla.it>
> ---
> Applies on top of [0].
> 
> WiFi was tested using the nxpwifi driver proposed in [1].
> 
> [0] https://lore.kernel.org/all/20260113075002.561453-1-daniel.baluta@nxp.com/
> [1] https://lore.kernel.org/all/20251205065545.3325032-1-jeff.chen_1@nxp.com/
> 
> Reagrds,
> Francesco
> ---
>  arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts | 152 +++++++++++++++++++++
>  1 file changed, 152 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> index 5bb6ae0d154a655283295b6902fc29bf6f744d5c..bd14ba28690c081817111aaabef12fb56a7c56a4 100644
> --- a/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> +++ b/arch/arm64/boot/dts/freescale/imx93-11x11-frdm.dts
> @@ -9,6 +9,7 @@ / {
>  	model = "NXP i.MX93 11X11 FRDM board";
>  
>  	aliases {
> +		can0 = &flexcan2;
>  		ethernet0 = &fec;
>  		ethernet1 = &eqos;
>  		i2c0 = &lpi2c1;
> @@ -18,12 +19,40 @@ aliases {
>  		mmc1 = &usdhc2; /* uSD */
>  		rtc0 = &pcf2131;
>  		serial0 = &lpuart1;
> +		serial4 = &lpuart5;
>  	};
>  
>  	chosen {
>  		stdout-path = &lpuart1;
>  	};
>  
> +	flexcan2_phy: can-phy {
> +		compatible = "nxp,tja1051";
> +		#phy-cells = <0>;
> +		max-bitrate = <5000000>;
> +		silent-gpios = <&pcal6524 23 GPIO_ACTIVE_HIGH>;
> +	};
> +
> +	gpio-keys {
> +		compatible = "gpio-keys";
> +
> +		button-k2 {
> +			label = "Button K2";
> +			linux,code = <BTN_1>;
> +			gpios = <&pcal6524 5 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			interrupt-parent = <&pcal6524>;
> +			interrupts = <5 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +
> +		button-k3 {
> +			label = "Button K3";
> +			linux,code = <BTN_2>;
> +			gpios = <&pcal6524 6 (GPIO_ACTIVE_LOW | GPIO_PULL_UP)>;
> +			interrupt-parent = <&pcal6524>;
> +			interrupts = <6 IRQ_TYPE_EDGE_FALLING>;
> +		};
> +	};
> +
>  	reg_usdhc2_vmmc: regulator-usdhc2 {
>  		compatible = "regulator-fixed";
>  		off-on-delay-us = <12000>;
> @@ -37,6 +66,16 @@ reg_usdhc2_vmmc: regulator-usdhc2 {
>  		enable-active-high;
>  	};
>  
> +	reg_usdhc3_vmmc: regulator-usdhc3 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "VPCIe_3V3";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		startup-delay-us = <20000>;
> +		gpio = <&pcal6524 13 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reserved-memory {
>  		ranges;
>  		#address-cells = <2>;
> @@ -88,6 +127,11 @@ sound-mqs {
>  		audio-cpu = <&sai1>;
>  		audio-codec = <&mqs1>;
>  	};
> +
> +	usdhc3_pwrseq: mmc-pwrseq {
> +		compatible = "mmc-pwrseq-simple";
> +		reset-gpios = <&pcal6524 12 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &adc1 {
> @@ -157,11 +201,27 @@ ethphy2: ethernet-phy@2 {
>  	};
>  };
>  
> +&flexcan2 {
> +	phys = <&flexcan2_phy>;
> +	pinctrl-0 = <&pinctrl_flexcan2>;
> +	pinctrl-1 = <&pinctrl_flexcan2_sleep>;
> +	pinctrl-names = "default", "sleep";
> +	status = "okay";
> +};
> +
>  &lpi2c1 {
>  	clock-frequency = <400000>;
>  	pinctrl-0 = <&pinctrl_lpi2c1>;
>  	pinctrl-names = "default";
>  	status = "okay";
> +
> +	pcal6408: gpio@20 {
> +		compatible = "nxp,pcal6408";
> +		reg = <0x20>;
> +		#gpio-cells = <2>;
> +		gpio-controller;
> +		reset-gpios = <&pcal6524 20 GPIO_ACTIVE_LOW>;
> +	};
>  };
>  
>  &lpi2c2 {
> @@ -322,6 +382,21 @@ &lpuart1 { /* console */
>  	status = "okay";
>  };
>  
> +&lpuart5 {
> +	pinctrl-0 = <&pinctrl_uart5>;
> +	pinctrl-names = "default";
> +	status = "okay";
> +
> +	uart-has-rtscts;
> +
> +	bluetooth {
> +		compatible = "nxp,88w8987-bt";
> +		device-wakeup-gpios = <&pcal6408 3 GPIO_ACTIVE_HIGH>;
> +		reset-gpios = <&pcal6524 19 GPIO_ACTIVE_LOW>;
> +		vcc-supply = <&reg_usdhc3_vmmc>;
> +	};
> +};
Hi Francesco,

Do you ever tried bluetooth feature? The bluetooth failed to scan with 'device-wakeup-gpios' property.

Regards,
Joseph

> +
>  &mqs1 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_mqs1>;
> @@ -394,6 +469,20 @@ &usdhc2 {
>  	status = "okay";
>  };
>  
> +&usdhc3 {
> +	bus-width = <4>;
> +	keep-power-in-suspend;
> +	mmc-pwrseq = <&usdhc3_pwrseq>;
> +	non-removable;
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	pinctrl-3 = <&pinctrl_usdhc3_sleep>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz", "sleep";
> +	vmmc-supply = <&reg_usdhc3_vmmc>;
> +	status = "okay";
> +};
> +
>  &wdog3 {
>  	pinctrl-names = "default";
>  	pinctrl-0 = <&pinctrl_wdog>;
> @@ -486,6 +575,13 @@ MX93_PAD_GPIO_IO27__CAN2_RX			0x139e
>  		>;
>  	};
>  
> +	pinctrl_flexcan2_sleep: flexcan2sleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_GPIO_IO25__GPIO2_IO25			0x31e
> +			MX93_PAD_GPIO_IO27__GPIO2_IO27			0x31e
> +		>;
> +	};
> +
>  	pinctrl_lpi2c1: lpi2c1grp {
>  		fsl,pins = <
>  			MX93_PAD_I2C1_SCL__LPI2C1_SCL			0x40000b9e
> @@ -533,6 +629,15 @@ MX93_PAD_UART1_TXD__LPUART1_TX			0x31e
>  		>;
>  	};
>  
> +	pinctrl_uart5: uart5grp {
> +		fsl,pins = <
> +			MX93_PAD_DAP_TDO_TRACESWO__LPUART5_TX		0x31e
> +			MX93_PAD_DAP_TDI__LPUART5_RX			0x31e
> +			MX93_PAD_DAP_TMS_SWDIO__LPUART5_RTS_B		0x31e
> +			MX93_PAD_DAP_TCLK_SWCLK__LPUART5_CTS_B		0x31e
> +		>;
> +	};
> +
>  	/* need to config the SION for data and cmd pad, refer to ERR052021 */
>  	pinctrl_usdhc1: usdhc1grp {
>  		fsl,pins = <
> @@ -647,6 +752,53 @@ MX93_PAD_SD2_VSELECT__GPIO3_IO19	0x51e
>  		>;
>  	};
>  
> +		/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x1582
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x40001382
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x40001382
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x40001382
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x40001382
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x40001382
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x158e
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x4000138e
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x4000138e
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x4000138e
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x4000138e
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x4000138e
> +		>;
> +	};
> +
> +	/* need to config the SION for data and cmd pad, refer to ERR052021 */
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__USDHC3_CLK		0x15fe
> +			MX93_PAD_SD3_CMD__USDHC3_CMD		0x400013fe
> +			MX93_PAD_SD3_DATA0__USDHC3_DATA0	0x400013fe
> +			MX93_PAD_SD3_DATA1__USDHC3_DATA1	0x400013fe
> +			MX93_PAD_SD3_DATA2__USDHC3_DATA2	0x400013fe
> +			MX93_PAD_SD3_DATA3__USDHC3_DATA3	0x400013fe
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_sleep: usdhc3grpsleepgrp {
> +		fsl,pins = <
> +			MX93_PAD_SD3_CLK__GPIO3_IO20		0x31e
> +			MX93_PAD_SD3_CMD__GPIO3_IO21		0x31e
> +			MX93_PAD_SD3_DATA0__GPIO3_IO22		0x31e
> +			MX93_PAD_SD3_DATA1__GPIO3_IO23		0x31e
> +			MX93_PAD_SD3_DATA2__GPIO3_IO24		0x31e
> +			MX93_PAD_SD3_DATA3__GPIO3_IO25		0x31e
> +		>;
> +	};
> +
>  	pinctrl_wdog: wdoggrp {
>  		fsl,pins = <
>  			MX93_PAD_WDOG_ANY__WDOG1_WDOG_ANY	0x31e
> 
> ---
> base-commit: 8ce368ca61310f425012fea4549d2b6ad0c5c54c
> change-id: 20260114-imx93_devices-a98e116463b3
> 
> Best regards,
> -- 
> Francesco Valla <francesco@valla.it>
> 

