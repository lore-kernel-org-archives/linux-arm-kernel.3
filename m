Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E50B7C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 14:14:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kOgt6PeUb9nbgfqg21LOO4TVPKJS04tI1hVpLlheIxQ=; b=HrqvUeU1dvr2gpSopFmISHhZw4
	/kB4SOcp1g8QENWWwgklQUdl+SOYSLMNDtszsO0pRojtnMBPNzoxKFiC7AEXplb20WhJQMQ+B3z04
	0NFb/7QdGL/+pJmrIHRPv4MvJ2rlSf8u0/lY/MZP47oTmNCzWW81NfhF+SdHxZCXCELd5TlhbLfbu
	fFY4g2bs9OBVJHXa+2BoMTce79ujAq9P9mNX7sDHDA24t+75pjUTUm9xovSo4heSAoE6yWkbF2Lk7
	3lYwm6XvjD3H+8R0boBq8d5EzkfCVKSi7UdDFKzy3dmPaimXMeHik4tjNlFi2zODMLlW2cYVlxXKV
	9Mp2kWCA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnzg-0000000BAfY-1AX4;
	Thu, 27 Mar 2025 14:14:04 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txnxv-0000000BAEk-0QmP
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 14:12:17 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 779B1A42A80;
	Thu, 27 Mar 2025 14:06:45 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A35F5C4CEE4;
	Thu, 27 Mar 2025 14:12:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1743084734;
	bh=134GSiWcxpyA+nb2QAzQCVgQQlB7JfT36Nzs4Nd+N5w=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=n91MCIAA9L04IBMx3K989AvpoQDaKEtFBCZxRD37xCuOD0zTxViTJO0E1cUgpxE6h
	 qygHtmo1Gg0t/lPLgwoonlYJPVYAApVH3mm+cfUzVRjtn6pvXb9HgWlju9/V0aKOCR
	 STSd8Y+rOB4aeV/Nns2qUIdxPKGBHgWVWU/cqKPq6SDCGAOJ34vKTwAhgoNeTkmjc0
	 MrTf7XYCHQXARxzafXaUg0CJxxXvOxub+W0qDXIBe3+19QHCewTB+QuKDen3wgYpOq
	 tPZMP2E4N6Z76EuPNchNPGzyXallHyRGu9xDim0D97Pgg1fZUiznzj3of8Ga5JGKKK
	 xI/upvR15SwVw==
Message-ID: <5064ddcb-a8dc-4f6f-a019-c34a982ed7ce@kernel.org>
Date: Thu, 27 Mar 2025 15:12:05 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] arm64: dts: imx8mp: Add device tree for Nitrogen8M
 Plus ENC Carrier Board
To: Martyn Welch <martyn.welch@collabora.com>, Rob Herring <robh@kernel.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
 Sascha Hauer <s.hauer@pengutronix.de>,
 Pengutronix Kernel Team <kernel@pengutronix.de>,
 Fabio Estevam <festevam@gmail.com>
Cc: kernel@collabora.com, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, imx@lists.linux.dev,
 linux-arm-kernel@lists.infradead.org
References: <20250327123907.542132-1-martyn.welch@collabora.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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 fv0=
In-Reply-To: <20250327123907.542132-1-martyn.welch@collabora.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_071215_282865_D44FA2AF 
X-CRM114-Status: GOOD (  18.46  )
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

On 27/03/2025 13:39, Martyn Welch wrote:
> Add support for Boundary Devices/Ezurio Nitrogen8M Plus ENC Carrier
> Board and it's SOM. Supported interfaces:
> 
>  - Serial Console
>  - EQoS Ethernet
>  - USB
>  - eMMC
>  - HDMI
> 
> Signed-off-by: Martyn Welch <martyn.welch@collabora.com>
> ---
> 
> Changes in v2:
>  - Add missing entries to binding documents.
> 
>  .../devicetree/bindings/arm/fsl.yaml          |   6 +
>  arch/arm64/boot/dts/freescale/Makefile        |   1 +
>  .../imx8mp-nitrogen-enc-carrier-board.dts     | 478 ++++++++++++++++++
>  .../dts/freescale/imx8mp-nitrogen-som.dtsi    | 415 +++++++++++++++
>  4 files changed, 900 insertions(+)
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
>  create mode 100644 arch/arm64/boot/dts/freescale/imx8mp-nitrogen-som.dtsi
> 
> diff --git a/Documentation/devicetree/bindings/arm/fsl.yaml b/Documentation/devicetree/bindings/arm/fsl.yaml
> index 6e0dcf4307f1..de42f684c462 100644
> --- a/Documentation/devicetree/bindings/arm/fsl.yaml
> +++ b/Documentation/devicetree/bindings/arm/fsl.yaml
> @@ -1113,6 +1113,12 @@ properties:
>            - const: avnet,sm2s-imx8mp              # SM2S-IMX8PLUS SoM
>            - const: fsl,imx8mp
>  
> +      - description: Boundary Device Nitrogen8M Plus ENC Carrier Board
> +        items:
> +          - const: boundary,imx8mp-nitrogen-enc-carrier-board
> +          - const: boundary,imx8mp-nitrogen-som
> +          - const: fsl,imx8mp
> +
>        - description: Boundary Device Nitrogen8MP Universal SMARC Carrier Board
>          items:
>            - const: boundary,imx8mp-nitrogen-smarc-universal-board

That's a separate patch.

> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index 42e6482a31cb..58b33708e4ee 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -184,6 +184,7 @@ dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-dl.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-kontron-smarc-eval-carrier.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-msc-sm2s-ep1.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-navqp.dtb
> +dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-enc-carrier-board.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-nitrogen-smarc-universal-board.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx8mp-phyboard-pollux-rdk.dtb
>  imx8mp-phyboard-pollux-rdk-no-eth-dtbs += imx8mp-phyboard-pollux-rdk.dtb imx8mp-phycore-no-eth.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> new file mode 100644
> index 000000000000..323e10b3bc58
> --- /dev/null
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-nitrogen-enc-carrier-board.dts
> @@ -0,0 +1,478 @@
> +// SPDX-License-Identifier: (GPL-2.0+ OR MIT)
> +/*
> + * Copyright 2020 Boundary Devices
> + * Copyright 2025 Collabora Ltd.
> + */
> +
> +/dts-v1/;
> +
> +#include "imx8mp-nitrogen-som.dtsi"
> +
> +/ {
> +	model = "Boundary Devices Nitrogen8M Plus ENC Carrier Board";
> +	compatible = "boundary,imx8mp-nitrogen-enc-carrier-board",
> +			"boundary,imx8mp-nitrogen-som", "fsl,imx8mp";
> +
> +	chosen {
> +		stdout-path = &uart2;
> +	};
> +
> +	connector {
> +		compatible = "usb-c-connector";
> +		label = "USB-C";
> +		data-role = "dual";
> +
> +		ports {
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +
> +			port@0 {
> +				reg = <0>;
> +				hs_ep: endpoint {
> +					remote-endpoint = <&usb3_hs_ep>;
> +				};
> +			};
> +
> +			port@1 {
> +				reg = <1>;
> +				ss_ep: endpoint {
> +					remote-endpoint = <&hd3ss3220_in_ep>;
> +				};
> +			};
> +		};
> +	};
> +
> +

Just one blank line

> +	hdmi-connector {
> +		compatible = "hdmi-connector";
> +		label = "hdmi";
> +		type = "a";

...

> +
> +&hdmi_tx_phy {
> +	status = "okay";
> +};
> +
> +&i2c2 {
> +	pca9546: i2cmux9546@70 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +		compatible = "nxp,pca9546";
> +		#address-cells = <1>;
> +		#size-cells = <0>;
> +		reg = <0x70>;
> +		pinctrl-names = "default";
> +		pinctrl-0 = <&pinctrl_i2c2_pca9546>;
> +		reset-gpios = <&gpio1 5 GPIO_ACTIVE_LOW>;
> +
> +		i2c2a: i2c2@0 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation


> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <0>;
> +			clock-frequency = <100000>;
> +		};
> +
> +		i2c2b: i2c2@1 {
> +			/* J9  - camera*/
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <1>;
> +			clock-frequency = <100000>;
> +		};
> +
> +		i2c2c: i2c2@2 {
> +			/* J10 - camera */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <2>;
> +			clock-frequency = <100000>;
> +		};
> +
> +		i2c2d: i2c2@3 {
> +			/* rtc, J11 mipi */
> +			#address-cells = <1>;
> +			#size-cells = <0>;
> +			reg = <3>;
> +			clock-frequency = <100000>;
> +
> +			rtc@52 {
> +				compatible = "microcrystal,rv3028";
> +				reg = <0x52>;
> +				pinctrl-names = "default";
> +				pinctrl-0 = <&pinctrl_rv3028>;
> +				interrupts-extended = <&gpio1 4 IRQ_TYPE_LEVEL_LOW>;
> +				wakeup-source;
> +			};
> +		};
> +	};
> +};
> +
> +&i2c4 {
> +	usb_mux: hd3ss3220@47 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation




...

> +	pinctrl_reg_usb1_vbus: reg-usb1_vbusgrp {

No underscores in node names.

> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x100
> +		>;
> +	};
> +
> +	pinctrl_uart2: uart2grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART2_RXD__UART2_DCE_RX		0x140
> +			MX8MP_IOMUXC_UART2_TXD__UART2_DCE_TX		0x140
> +		>;
> +	};
> +
> +	pinctrl_uart3: uart3grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_ECSPI1_MOSI__UART3_DCE_TX		0x140
> +			MX8MP_IOMUXC_ECSPI1_SCLK__UART3_DCE_RX		0x140
> +		>;
> +	};
> +
> +	pinctrl_uart4: uart4grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_UART4_RXD__UART4_DCE_RX		0x140
> +			MX8MP_IOMUXC_UART4_TXD__UART4_DCE_TX		0x140
> +		>;
> +	};
> +
> +	pinctrl_usb3_0: usb3-0grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO13__USB1_OTG_OC		0x1c0
> +		>;
> +	};
> +
> +	pinctrl_usb3_1: usb3-1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06		0x16
> +		>;
> +	};
> +
> +	pinctrl_usdhc1: usdhc1grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO03__USDHC1_VSELECT		0x116
> +			MX8MP_IOMUXC_SD1_CLK__USDHC1_CLK		0x190
> +			MX8MP_IOMUXC_SD1_CMD__USDHC1_CMD		0x1d0
> +			MX8MP_IOMUXC_SD1_DATA0__USDHC1_DATA0		0x1d0
> +			MX8MP_IOMUXC_SD1_DATA1__USDHC1_DATA1		0x1d0
> +			MX8MP_IOMUXC_SD1_DATA2__USDHC1_DATA2		0x1d0
> +			MX8MP_IOMUXC_SD1_DATA3__USDHC1_DATA3		0x1d0
> +		>;
> +	};
> +
> +	pinctrl_usdhc1_100mhz: usdhc1grp-100mhz {

I don't think you tested this. We changed this long time ago, so it
means you just sent us something based on downstream or whatever old was
there.

Start from scratch from latest sources, so you won't repeat the same
mistakes we already fixed.


Best regards,
Krzysztof

