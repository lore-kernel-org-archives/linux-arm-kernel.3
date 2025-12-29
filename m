Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9E13EE784BE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 29 Dec 2025 02:54:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=/NdGbuWp7ftRkPjnunLaD5jwXzwLePWBZ9bzlCxmCxo=; b=G2OdEIEWeYkKgNWuI71ZSrWspS
	sLVrq8WnPLVNakGShY2v9hN7Tl3MPUZ/6rUDSyqclGQoiBftMwSiKQPPp8XO033QerxOA2yrRZXiB
	Tmm3NAx+GGBrwIP4R5ncQYxuR3GYe/W24GqIwSoHxcFG5eeVf5q/y3ytszMvg8FRBLe9ZyF2CL1EK
	0yRqcVcAsAQQrAuIrMO64zZYeexqRZmMgGrC3fMXSc80CzRmGyM0kgfrhUG9K7uzvU4JTEy8CJycH
	QlSL58LZbRbNYZyzqXYnHgZ73mtQwymiEfdryCGudaqKX4cBfPEdYzs+IhVUrYcG5FJDH2FtyJVqH
	l7Y+Q0MA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3Of-00000003FXv-2Gaa;
	Mon, 29 Dec 2025 02:54:13 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1va3Oc-00000003FXQ-1xCb
	for linux-arm-kernel@lists.infradead.org;
	Mon, 29 Dec 2025 02:54:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id F13D64416F;
	Mon, 29 Dec 2025 02:54:09 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8CF3BC4CEFB;
	Mon, 29 Dec 2025 02:54:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1766976849;
	bh=QZM5mGv9VhE/uWGcqaujT1EMdVbiKWIz+MuunJJxOjM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=iJrBn4xBK+1bAL/v3+QJCND1+V5acXw3avlRpZ+QU3bHqTvGW1Oq1pzqTd0kQgP6X
	 7UIsAetPRDqmHvk91HvJgcmszrdS3AMLMy8frTQ2YcieiWCquyky+Dfu8KDrj5n1b/
	 QOAWBX7BWB52b6ageD1tkLRSEh2kO0V1A/bhagXQGFxfTlmzs7iUWvb0+kjefVBqQR
	 jnZrHbL5Ose0if437UDhiVbzjvZ2llT8FEBZNwfd0D7mKeGhYTi53xwviKgROKt7xW
	 IZJI6HMdV/sADIoxYUBGKsjDGwLXctDjhcM/CRM2BVFJX1duuxoGtEXfRO+jXRbDOc
	 CuflTHAgdButg==
Date: Mon, 29 Dec 2025 10:54:05 +0800
From: Shawn Guo <shawnguo@kernel.org>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	"open list:OPEN FIRMWARE AND FLATTENED DEVICE TREE BINDINGS" <devicetree@vger.kernel.org>,
	"open list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <imx@lists.linux.dev>,
	"moderated list:ARM/FREESCALE IMX / MXC ARM ARCHITECTURE" <linux-arm-kernel@lists.infradead.org>,
	open list <linux-kernel@vger.kernel.org>
Subject: Re: [PATCH 1/1] arm64: dts: imx8mp-evk: add camera ov5640 and
 related nodes
Message-ID: <aVHtTRNYQS6ju_yQ@dragon>
References: <20251114155001.1195702-1-Frank.Li@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251114155001.1195702-1-Frank.Li@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251228_185410_554426_240302BD 
X-CRM114-Status: GOOD (  14.45  )
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

On Fri, Nov 14, 2025 at 10:50:01AM -0500, Frank Li wrote:
> Add camera ov5640 and related nodes.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/imx8mp-evk.dts | 80 ++++++++++++++++++++
>  1 file changed, 80 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> index 3730792daf501..f5c19549acce5 100644
> --- a/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx8mp-evk.dts
> @@ -74,6 +74,27 @@ pcie0_refclk: pcie0-refclk {
>  		clock-frequency = <100000000>;
>  	};
>  
> +	reg_1v5: regulator-1v5 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v5";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;
> +	};
> +
> +	reg_1v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "1v8";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;

1800000 ?

> +	};
> +
> +	reg_2v8: regulator-1v8 {
> +		compatible = "regulator-fixed";
> +		regulator-name = "2v8";
> +		regulator-min-microvolt = <1500000>;
> +		regulator-max-microvolt = <1500000>;

2800000 ?

Shawn

> +	};
> +
>  	reg_audio_3v3: regulator-audio-3v3 {
>  		compatible = "regulator-fixed";
>  		regulator-name = "audio-3v3";
> @@ -556,6 +577,30 @@ &i2c2 {
>  	pinctrl-0 = <&pinctrl_i2c2>;
>  	status = "okay";
>  
> +	camera@3c {
> +	       compatible = "ovti,ov5640";
> +	       reg = <0x3c>;
> +	       pinctrl-names = "default";
> +	       pinctrl-0 = <&pinctrl_csi0_pwn>, <&pinctrl_csi0_rst>, <&pinctrl_csi_mclk>;
> +	       clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> +	       clock-names = "xclk";
> +	       assigned-clocks = <&clk IMX8MP_CLK_IPP_DO_CLKO2>;
> +	       assigned-clock-parents = <&clk IMX8MP_CLK_24M>;
> +	       assigned-clock-rates = <24000000>;
> +	       powerdown-gpios = <&gpio2 11 GPIO_ACTIVE_HIGH>;
> +	       AVDD-supply = <&reg_2v8>;
> +	       DVDD-supply = <&reg_1v5>;
> +	       DOVDD-supply = <&reg_1v8>;
> +	       status = "okay";
> +
> +	       port {
> +		       ov5640_mipi_0_ep: endpoint {
> +			       remote-endpoint = <&mipi_csi0_ep>;
> +			       data-lanes = <1 2>;
> +		       };
> +	       };
> +	};
> +
>  	hdmi@3d {
>  		compatible = "adi,adv7535";
>  		reg = <0x3d>;
> @@ -660,6 +705,10 @@ &i2c5 {
>  	 */
>  };
>  
> +&isi_0 {
> +	status = "okay";
> +};
> +
>  &lcdif1 {
>  	status = "okay";
>  };
> @@ -678,6 +727,19 @@ &micfil {
>  	status = "okay";
>  };
>  
> +&mipi_csi_0 {
> +	status = "okay";
> +
> +	ports {
> +	       port@0 {
> +		       mipi_csi0_ep: endpoint {
> +				remote-endpoint = <&ov5640_mipi_0_ep>;
> +				data-lanes = <1 2>;
> +		       };
> +	       };
> +	};
> +};
> +
>  &mipi_dsi {
>  	samsung,esc-clock-frequency = <10000000>;
>  	status = "okay";
> @@ -849,6 +911,24 @@ MX8MP_IOMUXC_SAI3_RXC__GPIO4_IO29		0xd6
>  		>;
>  	};
>  
> +	pinctrl_csi_mclk: csi_mclk_grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO15__CCM_CLKO2	0x50
> +		>;
> +	};
> +
> +	pinctrl_csi0_pwn: csi0_pwn_grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_SD1_STROBE__GPIO2_IO11	0x10
> +		>;
> +	};
> +
> +	pinctrl_csi0_rst: csi0_rst_grp {
> +		fsl,pins = <
> +			MX8MP_IOMUXC_GPIO1_IO06__GPIO1_IO06	0x10
> +		>;
> +	};
> +
>  	pinctrl_eqos: eqosgrp {
>  		fsl,pins = <
>  			MX8MP_IOMUXC_ENET_MDC__ENET_QOS_MDC				0x2
> -- 
> 2.34.1
> 

