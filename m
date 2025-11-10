Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 19827CCF9E3
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Nov 2025 05:16:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=uQM/kVDawNSMrDQ+4Q/Kqqeg38La7gpLi5kSZemkmyI=; b=bvONIone3A8i11ZUAhDSKkrpNs
	uViDGphev02WqRTmuiH+BGTPJ822b/zlWT7mSZeZcNTT1pA16I+exDwCkPVlLiKxtG4FYY4afxMxZ
	YpvzmvPop10g759I+cYSDt7p1tMtCfKNFP7QCXPSgTTH+1S3TPP0wwp4jzoTnH1mKbgVk6O95p6I2
	lBrIufgPL91VWacBoEjibUI+Cq1FcstdQEHgpUVBtPt7UJg2pBqhSCkT3sppbse/GhSLkTcIJPsTw
	wZ+GkR7hr7X/OzZ8+KUOUEcBfmIX7xCsdaT7nD+4tnkXL8mz3oLmM+C22GXr5TwnBXVK2GOfxGcYT
	dEdOpyZQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIKFq-00000004lW8-4Ajy;
	Mon, 10 Nov 2025 05:15:51 +0000
Received: from inva020.nxp.com ([92.121.34.13])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vIKFo-00000004lVd-1AqJ
	for linux-arm-kernel@lists.infradead.org;
	Mon, 10 Nov 2025 05:15:50 +0000
Received: from inva020.nxp.com (localhost [127.0.0.1])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 361281A2136;
	Mon, 10 Nov 2025 06:15:44 +0100 (CET)
Received: from aprdc01srsp001v.ap-rdc01.nxp.com (aprdc01srsp001v.ap-rdc01.nxp.com [165.114.16.16])
	by inva020.eu-rdc02.nxp.com (Postfix) with ESMTP id 96E341A214B;
	Mon, 10 Nov 2025 06:15:43 +0100 (CET)
Received: from lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com (lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com [10.52.9.99])
	by aprdc01srsp001v.ap-rdc01.nxp.com (Postfix) with ESMTP id 9DA781800087;
	Mon, 10 Nov 2025 13:15:40 +0800 (+08)
Date: Mon, 10 Nov 2025 14:15:39 +0900
From: Joseph Guo <qijian.guo@nxp.com>
To: Rogerio Pimentel <rpimentel.silva@gmail.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org,
	shawnguo@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de,
	festevam@gmail.com, alexander.stein@ew.tq-group.com,
	dario.binacchi@amarulasolutions.com, marex@denx.de,
	Markus.Niebel@tq-group.com, y.moog@phytec.de,
	joao.goncalves@toradex.com, frieder.schrempf@kontron.de,
	josua@solid-run.com, francesco.dolcini@toradex.com,
	primoz.fiser@norik.com, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, Xiaofeng Wei <xiaofeng.wei@nxp.com>,
	Justin Jiang <justin.jiang@nxp.com>
Subject: Re: [PATCH v4 2/2] arm64: dts: add support for NXP i.MX8MP FRDM board
Message-ID: <aRF0++cUigbETuPs@lsvm11u0000395.swis.ap-northeast-2.aws.nxp.com>
References: <20251109214515.121742-1-rpimentel.silva@gmail.com>
 <20251109214515.121742-2-rpimentel.silva@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251109214515.121742-2-rpimentel.silva@gmail.com>
X-Virus-Scanned: ClamAV using ClamSMTP
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251109_211548_767111_9EBF95DE 
X-CRM114-Status: GOOD (  24.99  )
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

On Sun, Nov 09, 2025 at 04:45:15PM -0500, Rogerio Pimentel wrote:
> The FRDM-i.MX8MP is an NXP development platform based on the i.MX8M Plus
> SoC, featuring a quad Cortex-A53, Cortex-M7 co-processor, 4GB LPDDR4,
> 32GB eMMC, Wi-Fi 6/Bluetooth 5.4/802.15.4 tri-radio, Ethernet, HDMI/MIPI
> display interfaces, camera connectors, and standard expansion headers.
> 
> Based on the device tree found in the NXP repository at github
> https://github.com/nxp-imx-support/meta-imx-frdm and on imx8mp-evk
> board kernel mainline device tree.

Hi Rogerio,

I'm maintainer of NXP mainline code for FRDM boards now.
Thanks for your contribution for FRDM boards upstreaming.
The imx8mp frdm board official name is FRDM-IMX8MP,
so please change the name from FRDM-i.MX8MP to FRDM-IMX8MP
in commit message.

The code you refer in meta-imx-frdm is based on 6.6.36 kernel which
is pretty old. Our new code based on 6.12 you can refer this link:
https://github.com/nxp-imx/linux-imx/blob/lf-6.12.y/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts

> 
> This is a basic device tree supporting:
> 
>  - Quad Cortex-A53
>  - 4GB LPDDR4 DRAM
>  - PCA9450C PMIC with regulators
>  - Two NXP PCAL6416 GPIO expanders
>  - RGB LEDs via GPIO expander
>  - I2C1, I2C2, I2C3 controllers
>  - UART2 (console) and UART3 (with RTS/CTS)
>  - USDHC3 (8-bit eMMC)
>  - SNVS power key (onboard power button)
> 
> Signed-off-by: Rogerio Pimentel <rpimentel.silva@gmail.com>
> Signed-off-by: Xiaofeng Wei <xiaofeng.wei@nxp.com>
> ---
> 
> Changes in v4:
> 
>  - Change label pcal6416 to pcal6416_0
> 
> Changes in v3:
> 
>  - Removing the following tags and names added
>  on v2 by mistake:
>  Reviewed-by: Daniel Baluta <daniel.baluta@gmail.com>
>  Signed-off-by: Anson Huang <Anson.Huang@nxp.com>
>  Signed-off-by: Shawn Guo <shawnguo@kernel.org>
> 
> Changes in v2:
> 
>  - Fixed dt-binding schema warnings
>  - Renamed nodes 'red, green and blue' to
>    'led-0, led-1 and led-2'
>  - Renamed led labels 'led-0, led-1 and led-2'
>    to 'red, green and blue'
>  - Added Reviewed-by and Signed-off-by tags
> 
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  arch/arm64/boot/dts/freescale/imx8mp-frdm.dts | 355 ++++++++++++++++++
>  2 files changed, 356 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 75676b908299..323e98c0cb48 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -206,6 +206,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-pdk3.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-dhcom-picoitx.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-edm-g-wb.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-evk.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-frdm.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-mate.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pro.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-hummingboard-pulse.dtb
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> new file mode 100644
> index 000000000000..242cce2f2029
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-frdm.dts
> @@ -0,0 +1,355 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2019 NXP
/s/2019/2025
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mp.dtsi"
> +
> +/ {
> +	model = "NXP i.MX8MPlus FRDM board";
> +	compatible = "fsl,imx8mp-frdm", "fsl,imx8mp";
	model = "NXP FRDM-IMX8MPLUS";
	compatible = "fsl,frdm-imx8mp", "fsl,imx8mp";
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	gpio-leds {
> +		compatible = "gpio-leds";
> +
> +		led-0 {
> +			label = "red";
> +			gpios = <&pcal6416_0 13 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +
> +		led-1 {
> +			label = "green";
> +			gpios = <&pcal6416_0 14 GPIO_ACTIVE_HIGH>;
> +			default-state = "on";
> +		};
> +
> +		led-2 {
> +			label = "blue";
> +			gpios = <&pcal6416_0 15 GPIO_ACTIVE_HIGH>;
> +			default-state = "off";
> +		};
> +	};
> +
> +	memory@40000000 {
> +		device_type = "memory";
> +		reg = <0x0 0x40000000 0 0xc0000000>,
> +		      <0x1 0x00000000 0 0x40000000>;
> +	};
> +};
> +
> +&A53_0 {
> +	cpu-supply = <&reg_arm>;
> +};
> +
> +&A53_1 {
> +	cpu-supply = <&reg_arm>;
> +};
> +
> +&A53_2 {
> +	cpu-supply = <&reg_arm>;
> +};
> +
> +&A53_3 {
> +	cpu-supply = <&reg_arm>;
> +};
> +
> +&i2c1 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c1>;
> +	status = "okay";
> +
> +	pmic@25 {
> +		compatible = "nxp,pca9450c";
> +		reg = <0x25>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pmic>;
> +		interrupt-parent = <&gpio1>;
> +		interrupts = <3 IRQ_TYPE_LEVEL_LOW>;
> +
> +		regulators {
> +			BUCK1 {
> +				regulator-name = "BUCK1";
> +				regulator-min-microvolt = <720000>;
> +				regulator-max-microvolt = <1000000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +			};
> +
> +			reg_arm: BUCK2 {
> +				regulator-name = "BUCK2";
> +				regulator-min-microvolt = <720000>;
> +				regulator-max-microvolt = <1025000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +				regulator-ramp-delay = <3125>;
> +				nxp,dvs-run-voltage = <950000>;
> +				nxp,dvs-standby-voltage = <850000>;
> +			};
> +
> +			BUCK4 {
> +				regulator-name = "BUCK4";
> +				regulator-min-microvolt = <3000000>;
> +				regulator-max-microvolt = <3600000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			reg_buck5: BUCK5 {
> +				regulator-name = "BUCK5";
> +				regulator-min-microvolt = <1650000>;
> +				regulator-max-microvolt = <1950000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			BUCK6 {
> +				regulator-name = "BUCK6";
> +				regulator-min-microvolt = <1045000>;
> +				regulator-max-microvolt = <1155000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			LDO1 {
> +				regulator-name = "LDO1";
> +				regulator-min-microvolt = <1650000>;
> +				regulator-max-microvolt = <1950000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			LDO3 {
> +				regulator-name = "LDO3";
> +				regulator-min-microvolt = <1710000>;
> +				regulator-max-microvolt = <1890000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +
> +			LDO5 {
> +				regulator-name = "LDO5";
> +				regulator-min-microvolt = <1800000>;
> +				regulator-max-microvolt = <3300000>;
> +				regulator-boot-on;
> +				regulator-always-on;
> +			};
> +		};
> +	};
> +
> +	pcal6416_0: gpio@20 {
> +		compatible = "nxp,pcal6416";
> +		reg = <0x20>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pcal6416_0_int>;
> +		interrupt-parent = <&gpio3>;
> +		interrupts = <16 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names = "CSI1_nRST",
> +			"CSI2_nRST",
> +			"DSI_CTP_RST",
> +			"EXT_PWREN1",
> +			"CAN_STBY",
> +			"EXP_P0_5",
> +			"EXP_P0_6",
> +			"P0_7",
> +			"LVDS0_BLT_EN",
> +			"LVDS1_BLT_EN",
> +			"LVDS0_CTP_RST",
> +			"LVDS1_CTP_RST",
> +			"SPK_PWREN",
> +			"RLED_GPIO",
> +			"GLED_GPIO",
> +			"BLED_GPIO";
> +	};
> +
> +	pcal6416_1: gpio@21 {
> +		compatible = "nxp,pcal6416";
> +		reg = <0x21>;
> +		gpio-controller;
> +		#gpio-cells = <2>;
> +		interrupt-controller;
> +		#interrupt-cells = <2>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_pcal6416_1_int>;
> +		interrupt-parent = <&gpio2>;
> +		interrupts = <11 IRQ_TYPE_LEVEL_LOW>;
> +		gpio-line-names = "P0_0",
> +			"P0_1",
> +			"AUD_nINT",
> +			"RTC_nINTA",
> +			"USB1_SS_SEL",
> +			"USB2_PWR_EN",
> +			"SPI_EXP_SEL",
> +			"P0_7",
> +			"W2_HOST_WAKE_SD_3V3",
> +			"W2_HOST_WAKE_BT_3V3",
> +			"EXP_WIFI_BT_PDN_3V3",
> +			"EXP_BT_RST_3V3",
> +			"W2_RST_IND_3V3",
> +			"SPI_nINT_3V3",
> +			"KEYM_PCIE_nWAKE",
> +			"P1_7";
> +	};
> +};
> +
> +&i2c2 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c2>;
> +	status = "okay";
> +};
> +
> +&i2c3 {
> +	clock-frequency = <400000>;
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_i2c3>;
> +	status = "okay";
> +};
> +
> +&snvs_pwrkey {
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	status = "okay";
> +};
> +
> +&uart3 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart3>;
> +	assigned-clocks = <&clk IMX8MP_CLK_UART3>;
> +	assigned-clock-parents = <&clk IMX8MP_SYS_PLL1_80M>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&usdhc3 {
> +	assigned-clocks = <&clk IMX8MP_CLK_USDHC3>;
> +	assigned-clock-rates = <400000000>;
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc3>;
> +	pinctrl-1 = <&pinctrl_usdhc3_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc3_200mhz>;
> +	bus-width = <8>;
> +	non-removable;
> +	status = "okay";
> +};
> +
> +&iomuxc {
> +	pinctrl_i2c1: i2c1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C1_SCL__I2C1_SCL	0x400001c2
> +			MX8MP_IOMUXC_I2C1_SDA__I2C1_SDA	0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c2: i2c2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C2_SCL__I2C2_SCL	0x400001c2
> +			MX8MP_IOMUXC_I2C2_SDA__I2C2_SDA	0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_i2c3: i2c3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_I2C3_SCL__I2C3_SCL	0x400001c2
> +			MX8MP_IOMUXC_I2C3_SDA__I2C3_SDA	0x400001c2
> +		>;
> +	};
> +
> +	pinctrl_pmic: pmicgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO03__GPIO1_IO03	0x000001c0
> +		>;
> +	};
> +
> +	pinctrl_pcal6416_0_int: pcal6416_0_int_grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_READY_B__GPIO3_IO16	0x146
> +		>;
> +	};
> +
> +	pinctrl_pcal6416_1_int: pcal6416_1_int_grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x146
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX	0x140
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX	0x140
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX	0x140
> +			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX	0x140
> +			MX8MP_IOMUXC_ECSPI1_SS0__UART3_DCE_RTS	0x140
> +			MX8MP_IOMUXC_ECSPI1_MISO__UART3_DCE_CTS	0x140
> +		>;
> +	};
> +
> +	pinctrl_usdhc3: usdhc3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x190
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d0
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d0
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d0
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d0
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d0
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d0
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d0
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d0
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d0
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x190
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_100mhz: usdhc3-100mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x194
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d4
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d4
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d4
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d4
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d4
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d4
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d4
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d4
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d4
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x194
> +		>;
> +	};
> +
> +	pinctrl_usdhc3_200mhz: usdhc3-200mhzgrp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_NAND_WE_B__USDHC3_CLK	0x196
> +			MX8MP_IOMUXC_NAND_WP_B__USDHC3_CMD	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA04__USDHC3_DATA0	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA05__USDHC3_DATA1	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA06__USDHC3_DATA2	0x1d6
> +			MX8MP_IOMUXC_NAND_DATA07__USDHC3_DATA3	0x1d6
> +			MX8MP_IOMUXC_NAND_RE_B__USDHC3_DATA4	0x1d6
> +			MX8MP_IOMUXC_NAND_CE2_B__USDHC3_DATA5	0x1d6
> +			MX8MP_IOMUXC_NAND_CE3_B__USDHC3_DATA6	0x1d6
> +			MX8MP_IOMUXC_NAND_CLE__USDHC3_DATA7	0x1d6
> +			MX8MP_IOMUXC_NAND_CE1_B__USDHC3_STROBE	0x196
> +		>;
> +	};
> +};
> -- 
> 2.25.1
> 

