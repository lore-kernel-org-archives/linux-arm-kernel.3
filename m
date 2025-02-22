Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B9948C021B5
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 22 Feb 2025 14:51:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TqbgxbkVzU0vFKAaxz7WMOzVzr7g/5INAssDURKZcLs=; b=1gs8Z3BWFFGPKxySoPfmurYQHk
	bpU/xEbXtVYBW7kHkE3LcybhIZBcFKJ6nrxZfzGVN4d4lO7f1r44jot1E56ZlRqBwyFoneje+HQ1G
	vjJkPvtGWnffA/W3AkLxqlW0OsTHtruRd973Iav2YqCi3XeSWAdG315B/UlYNh2wjkkx3uffaKj1w
	23Y/kvGgcX/GN1ByDPJc8bflzDCFGC/m3URTb+xotbh06NJnx7/uwa2RnSw6XoHegzuR//IZxGjG7
	ptdXfjjEjnGTzpdqYSTp/i3xKGwyI31grdkmooSscj+TtMexJr5QKA8KhqVv9WJGMbgepnh84dYU0
	BOPz6qCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqqv-00000008CzF-1O9w;
	Sat, 22 Feb 2025 14:51:37 +0000
Received: from mail-m16.yeah.net ([1.95.21.17])
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tlqlk-00000008CQP-3nE1
	for linux-arm-kernel@lists.infradead.org;
	Sat, 22 Feb 2025 14:46:18 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=yeah.net;
	s=s110527; h=Date:From:Subject:Message-ID:MIME-Version:
	Content-Type; bh=TqbgxbkVzU0vFKAaxz7WMOzVzr7g/5INAssDURKZcLs=;
	b=DqDxuzFVhkygDLpJg1P+jA/YgC5jjD3/YOMiaKS/RmSkadbY4jjZ3ASLVhYdHd
	8dD9mWMgxX74MILJdqgHVd9yGnDNiP+aqjW20TqQRxxsA8yIRfMBsmH6T9L7ImHk
	QtyzwcLLtC5d+roO61d0zQBePvsHh9QVlkr+bTOus/JFI=
Received: from dragon (unknown [])
	by gzsmtp2 (Coremail) with SMTP id Ms8vCgDHjiEa47lnC7+7CQ--.24083S3;
	Sat, 22 Feb 2025 22:45:48 +0800 (CST)
Date: Sat, 22 Feb 2025 22:45:46 +0800
From: Shawn Guo <shawnguo2@yeah.net>
To: Antonin Godard <antonin.godard@bootlin.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Thomas Petazzoni <thomas.petazzoni@bootlin.com>,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v2 2/3] ARM: dts: imx6ul: Add Variscite VAR-SOM-MX6UL SoM
 support
Message-ID: <Z7njGg4Hhc4wcZHU@dragon>
References: <20250127-varsom6ul-concerto-dts-v2-0-4dac29256989@bootlin.com>
 <20250127-varsom6ul-concerto-dts-v2-2-4dac29256989@bootlin.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250127-varsom6ul-concerto-dts-v2-2-4dac29256989@bootlin.com>
X-CM-TRANSID: Ms8vCgDHjiEa47lnC7+7CQ--.24083S3
X-Coremail-Antispam: 1Uf129KBjvJXoW3JFykGw15AF4DAry3XFyrJFb_yoWfGFWxpa
	yftFWDXr1DGr47t3WrX3Wqkr15Gws2krZ293sFv348Za17KasIqryjgrn8JF45JF4DC3yj
	vayq9rWjgan0gaUanT9S1TB71UUUUU7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDUYxBIdaVFxhVjvjDU0xZFpf9x07jhYFXUUUUU=
X-Originating-IP: [117.82.86.124]
X-CM-SenderInfo: pvkd40hjxrjqh1hdxhhqhw/1tbiEgX7ZWe50D04YwAAsh
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250222_064617_310965_24153863 
X-CRM114-Status: GOOD (  21.92  )
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

On Mon, Jan 27, 2025 at 04:31:01PM +0100, Antonin Godard wrote:
> Add support for the Variscite VAR_SOM-MX6UL SoM with:
> 
> - NXP i.MX6 UltraLite SoC
> - 128–1024 MB DDR3L
> - 8–128 GB eMMC
> - 128–512 MB SLC NAND
> - Camera Interface
> - LVDS / Parallel RGB interfaces (not configured)
> - Touch controller (not configured)
> - Ethernet RMII interface (not configured)
> - On-SoM Wi-Fi/Bluetooth with CYW43353 on SDIO Module (not configured)
> - SD/MMC/SDIO interface
> - USB Host + USB OTG interface
> - I2C interfaces
> - SPI interfaces
> - PCI-Express 2.0 interface
> - on-SoM Audio Codec (not configured)
> - S/PDIF interface (not configured)
> 
> Product website: https://www.variscite.com/product/system-on-module-som/cortex-a7/var-som-6ul-nxp-imx6ul-6ull-6ulz
> 
> Support is handled with a SoM-centric dtsi exporting the default
> interfaces along the default pinmuxing to be enabled by the board dts
> file.
> 
> I tested this on a VAR-SOM-6UL_G2_700C_512R_8N_IT_REV1.3A, which is why
> some of the features above are mentioned as "not configured" (I couldn't
> test them).
> 
> This file is based on the one provided by Variscite on their own kernel,
> but adapted for mainline.
> 
> Signed-off-by: Antonin Godard <antonin.godard@bootlin.com>
> ---
>  arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi | 232 ++++++++++++++++++++++++++
>  1 file changed, 232 insertions(+)
> 
> diff --git a/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> new file mode 100644
> index 000000000000..6eda5726f2f1
> --- /dev/null
> +++ b/arch/arm/boot/dts/nxp/imx/imx6ul-var-som.dtsi
> @@ -0,0 +1,232 @@
> +// SPDX-License-Identifier: GPL-2.0+
> +/*
> + * Support for Variscite VAR-SOM-MX6UL Module
> + *
> + * Copyright 2019 Variscite Ltd.
> + * Copyright 2025 Bootlin
> + */
> +
> +/dts-v1/;
> +
> +#include "imx6ul.dtsi"
> +#include <dt-bindings/clock/imx6ul-clock.h>
> +#include <dt-bindings/gpio/gpio.h>
> +
> +/ {
> +	model = "Variscite VAR-SOM-MX6UL module";
> +	compatible = "variscite,var-som-imx6ul", "fsl,imx6ul";
> +
> +	memory@80000000 {
> +		device_type = "memory";
> +		reg = <0x80000000 0x20000000>;
> +	};
> +
> +	reg_gpio_dvfs: reg-gpio-dvfs {
> +		compatible = "regulator-gpio";
> +		regulator-min-microvolt = <1300000>;
> +		regulator-max-microvolt = <1400000>;
> +		regulator-name = "gpio_dvfs";
> +		regulator-type = "voltage";
> +		gpios = <&gpio4 13 GPIO_ACTIVE_HIGH>;

Don't we need 'enable-active-high'?

> +		states = <1300000 0x1 1400000 0x0>;
> +	};
> +
> +	rmii_ref_clk: rmii-ref-clk-grp {

What does "-grp" in node name mean?

> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +		clock-output-names = "rmii-ref";
> +	};
> +};
> +
> +&cpu0 {
> +	dc-supply = <&reg_gpio_dvfs>;
> +};
> +
> +&clks {
> +	assigned-clocks = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
> +	assigned-clock-rates = <786432000>;
> +};
> +
> +&fec1 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_enet1>, <&pinctrl_enet1_gpio>, <&pinctrl_enet1_mdio>;
> +	phy-mode = "rmii";
> +	phy-reset-gpios = <&gpio5 0 GPIO_ACTIVE_LOW>;
> +	phy-reset-duration = <100>;
> +	phy-handle = <&ethphy0>;
> +	status = "okay";
> +
> +	mdio {
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +
> +		ethphy0: ethernet-phy@1 {
> +			compatible = "ethernet-phy-ieee802.3-c22";
> +			micrel,rmii-reference-clock-select-25-mhz = <1>;
> +			micrel,led-mode = <1>;
> +			clocks = <&rmii_ref_clk>;
> +			clock-names = "rmii-ref";
> +			reg = <1>;

We generally sort properties like:

  - compatible
  - reg
  - generic ones
  - vendor prefixed ones

So in this case, we will get:

	compatible = "ethernet-phy-ieee802.3-c22";
	reg = <1>;
	clocks = <&rmii_ref_clk>;
	clock-names = "rmii-ref";
	micrel,rmii-reference-clock-select-25-mhz = <1>;
	micrel,led-mode = <1>;

Shawn

> +		};
> +	};
> +};
> +
> +&iomuxc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_hog>;
> +
> +	pinctrl_hog: hoggrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SNVS_TAMPER4__GPIO5_IO04	0x1b0b0	/* BT Enable */
> +			MX6UL_PAD_SNVS_TAMPER6__GPIO5_IO06	0x03029	/* WLAN Enable */
> +		>;
> +	};
> +
> +	pinctrl_enet1_gpio: enet1-gpiogrp {
> +		fsl,pins = <
> +			MX6UL_PAD_SNVS_TAMPER0__GPIO5_IO00	0x1b0b0 /* fec1 reset */
> +		>;
> +	};
> +
> +	pinctrl_enet1: enet1grp {
> +		fsl,pins = <
> +			MX6UL_PAD_ENET1_RX_EN__ENET1_RX_EN	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_ER__ENET1_RX_ER	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_DATA0__ENET1_RDATA00	0x1b0b0
> +			MX6UL_PAD_ENET1_RX_DATA1__ENET1_RDATA01	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_EN__ENET1_TX_EN	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_DATA0__ENET1_TDATA00	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_DATA1__ENET1_TDATA01	0x1b0b0
> +			MX6UL_PAD_ENET1_TX_CLK__ENET1_REF_CLK1	0x4001b031
> +		>;
> +	};
> +
> +	pinctrl_enet1_mdio: enet1-mdiogrp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO06__ENET1_MDIO	0x1b0b0
> +			MX6UL_PAD_GPIO1_IO07__ENET1_MDC		0x1b0b0
> +		>;
> +	};
> +
> +	pinctrl_sai2: sai2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_JTAG_TDI__SAI2_TX_BCLK	0x17088
> +			MX6UL_PAD_JTAG_TDO__SAI2_TX_SYNC	0x17088
> +			MX6UL_PAD_JTAG_TRST_B__SAI2_TX_DATA	0x11088
> +			MX6UL_PAD_JTAG_TCK__SAI2_RX_DATA	0x11088
> +			MX6UL_PAD_JTAG_TMS__SAI2_MCLK		0x17088
> +		>;
> +	};
> +
> +	pinctrl_tsc: tscgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_GPIO1_IO01__GPIO1_IO01	0xb0
> +			MX6UL_PAD_GPIO1_IO02__GPIO1_IO02	0xb0
> +			MX6UL_PAD_GPIO1_IO03__GPIO1_IO03	0xb0
> +			MX6UL_PAD_GPIO1_IO04__GPIO1_IO04	0xb0
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_UART2_TX_DATA__UART2_DCE_TX	0x1b0b1
> +			MX6UL_PAD_UART2_RX_DATA__UART2_DCE_RX	0x1b0b1
> +			MX6UL_PAD_UART2_CTS_B__UART2_DCE_CTS	0x1b0b1
> +			MX6UL_PAD_UART2_RTS_B__UART2_DCE_RTS	0x1b0b1
> +		>;
> +	};
> +
> +	pinctrl_usdhc2: usdhc2grp {
> +		fsl,pins = <
> +			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x10069
> +			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x17059
> +			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x17059
> +			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x17059
> +			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x17059
> +			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x17059
> +			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x17059
> +			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x17059
> +			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x17059
> +			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x17059
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_100mhz: usdhc2-100mhzgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100b9
> +			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170b9
> +			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170b9
> +			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170b9
> +			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170b9
> +			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170b9
> +			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170b9
> +			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170b9
> +			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170b9
> +			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170b9
> +		>;
> +	};
> +
> +	pinctrl_usdhc2_200mhz: usdhc2-200mhzgrp {
> +		fsl,pins = <
> +			MX6UL_PAD_NAND_RE_B__USDHC2_CLK		0x100f9
> +			MX6UL_PAD_NAND_WE_B__USDHC2_CMD		0x170f9
> +			MX6UL_PAD_NAND_DATA00__USDHC2_DATA0	0x170f9
> +			MX6UL_PAD_NAND_DATA01__USDHC2_DATA1	0x170f9
> +			MX6UL_PAD_NAND_DATA02__USDHC2_DATA2	0x170f9
> +			MX6UL_PAD_NAND_DATA03__USDHC2_DATA3	0x170f9
> +			MX6UL_PAD_NAND_DATA04__USDHC2_DATA4	0x170f9
> +			MX6UL_PAD_NAND_DATA05__USDHC2_DATA5	0x170f9
> +			MX6UL_PAD_NAND_DATA06__USDHC2_DATA6	0x170f9
> +			MX6UL_PAD_NAND_DATA07__USDHC2_DATA7	0x170f9
> +		>;
> +	};
> +};
> +
> +&pxp {
> +	status = "okay";
> +};
> +
> +&sai2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_sai2>;
> +	assigned-clocks = <&clks IMX6UL_CLK_SAI2_SEL>,
> +			  <&clks IMX6UL_CLK_SAI2>;
> +	assigned-clock-parents = <&clks IMX6UL_CLK_PLL4_AUDIO_DIV>;
> +	assigned-clock-rates = <0>, <12288000>;
> +	fsl,sai-mclk-direction-output;
> +	status = "okay";
> +};
> +
> +&snvs_poweroff {
> +	status = "okay";
> +};
> +
> +&tsc {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_tsc>;
> +	xnur-gpios = <&gpio1 3 GPIO_ACTIVE_LOW>;
> +	measure-delay-time = <0xffff>;
> +	pre-charge-time = <0xfff>;
> +	status = "okay";
> +};
> +
> +&uart2 {
> +	pinctrl-names = "default";
> +	pinctrl-0 = <&pinctrl_uart2>;
> +	uart-has-rtscts;
> +	status = "okay";
> +};
> +
> +&usdhc2 {
> +	pinctrl-names = "default", "state_100mhz", "state_200mhz";
> +	pinctrl-0 = <&pinctrl_usdhc2>;
> +	pinctrl-1 = <&pinctrl_usdhc2_100mhz>;
> +	pinctrl-2 = <&pinctrl_usdhc2_200mhz>;
> +	bus-width = <8>;
> +	no-1-8-v;
> +	non-removable;
> +	keep-power-in-suspend;
> +	wakeup-source;
> +	status = "okay";
> +};
> 
> -- 
> 2.47.0.2.g7caf9f4c55.dirty
> 


