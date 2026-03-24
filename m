Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id CBEC1F532EC
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 24 Mar 2026 08:11:11 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=CPYqs6vcwl8V3lajlPrCBvrA1lJBhkKWz7WSQ19l1EU=; b=NxAJo1nW3UgW8dxUpxybFkZOxr
	hlFjoq69vmeo3bJgI8GlNftJ2xCMiebzmhcGsOVDZrQJ8qDO6QPPbHGCIOPkDROhvV2kwhxVrDykg
	nLz5almCHpPHlDDMtbscBoL+q1aqYZ9LtOIcWm9DyvH2ONNDz50yjsNTPQLgB6xNvzIsbCifB8Bkc
	ruV1F4tkTZSqPQM0g8wKbUPiCD2KAb2n48KeuDFPJnPNm8kgWZLQH9uyB1EpIw1oWTfgcEhLLc5xh
	eh3GD3qKJHiIcB9MJPSXnmb24eJKcV6jdvD5i0GSoe/uWxhuV0z/8Lil+FJtIspAcUhVKS+cHdFb4
	+WNiRHvg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wqx-00000000xxb-3f5n;
	Tue, 24 Mar 2026 08:11:07 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1w4wqv-00000000xwp-4050
	for linux-arm-kernel@lists.infradead.org;
	Tue, 24 Mar 2026 08:11:06 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 647FA600AC;
	Tue, 24 Mar 2026 08:11:05 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 7EF32C19424;
	Tue, 24 Mar 2026 08:10:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1774339865;
	bh=4wYp2kvlTe7W4BVFdfA1zitcIB2NluJJLog6Tzdvkkk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PZae4BgfB4ekHL2AdGZahorV88dAVhJoMjOdIDN4kGnh2AtSx37oCw9mNW5drc5W3
	 c5q8LipX2Wz/tPgcRJMLQ+c4fPeH2lWjIYh1d5rQxCmhgY30uJSkcalPtwMAVmPHS8
	 4dg69Erqr1Q7OuSdpX39UeWojv7k3pNUSov7CZc1xmHknqXdZsJjeqaztUVQKJNQBj
	 NyZYH58Zi5CfB2ejLmjdSH9I1JlGZv5aSYdp/uZ0FOYG8D7Xem52+fCYwDGBWhl0qv
	 okDIDYpdEGrl9AvXte3SFyHxkfBXcyugJb05Y9dtw/mWicZcXuwzvH71570LBnllqJ
	 Tpr+r8ov6Ho3A==
Date: Tue, 24 Mar 2026 13:40:50 +0530
From: Manivannan Sadhasivam <mani@kernel.org>
To: Richard Zhu <hongxing.zhu@nxp.com>
Cc: robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	bhelgaas@google.com, frank.li@nxp.com, l.stach@pengutronix.de, lpieralisi@kernel.org, 
	kwilczynski@kernel.org, s.hauer@pengutronix.de, kernel@pengutronix.de, 
	festevam@gmail.com, linux-pci@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 5/5] arm64: dts: imx943-evk: Add pcie[0,1] and
 pcie-ep[0,1] support
Message-ID: <jd6n4ibrf734npaieshkvoejtreplkmkyc34qsr6rkdfpydkou@mjzdo6ygo2dy>
References: <20260324023036.784466-1-hongxing.zhu@nxp.com>
 <20260324023036.784466-6-hongxing.zhu@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260324023036.784466-6-hongxing.zhu@nxp.com>
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

On Tue, Mar 24, 2026 at 10:30:36AM +0800, Richard Zhu wrote:
> Add pcie[0,1] and pcie-ep[0,1] support.
> 
> Signed-off-by: Richard Zhu <hongxing.zhu@nxp.com>
> ---
>  arch/arm64/boot/dts/freescale/Makefile       |  4 +
>  arch/arm64/boot/dts/freescale/imx943-evk.dts | 83 ++++++++++++++++++++
>  2 files changed, 87 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/Makefile b/arch/arm64/boot/dts/freescale/Makefile
> index bae24b53bce6..1366e25a9efd 100644
> --- a/arch/arm64/boot/dts/freescale/Makefile
> +++ b/arch/arm64/boot/dts/freescale/Makefile
> @@ -465,6 +465,10 @@ dtb-$(CONFIG_ARCH_MXC) += imx95-19x19-evk-sof.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-toradex-smarc-dev.dtb
>  dtb-$(CONFIG_ARCH_MXC) += imx95-tqma9596sa-mb-smarc-2.dtb
>  
> +imx943-evk-pcie0-ep-dtbs += imx943-evk.dtb imx-pcie0-ep.dtbo
> +imx943-evk-pcie1-ep-dtbs += imx943-evk.dtb imx-pcie1-ep.dtbo
> +dtb-$(CONFIG_ARCH_MXC) += imx943-evk-pcie0-ep.dtb imx943-evk-pcie1-ep.dtb
> +
>  imx95-15x15-evk-pcie0-ep-dtbs = imx95-15x15-evk.dtb imx-pcie0-ep.dtbo
>  dtb-$(CONFIG_ARCH_MXC) += imx95-15x15-evk-pcie0-ep.dtb
>  imx95-19x19-evk-pcie0-ep-dtbs += imx95-19x19-evk.dtb imx-pcie0-ep.dtbo
> diff --git a/arch/arm64/boot/dts/freescale/imx943-evk.dts b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> index 1d834379f602..ea0100b37d5c 100644
> --- a/arch/arm64/boot/dts/freescale/imx943-evk.dts
> +++ b/arch/arm64/boot/dts/freescale/imx943-evk.dts
> @@ -51,6 +51,20 @@ chosen {
>  		stdout-path = &lpuart1;
>  	};
>  
> +	pcie_ref_clk: clock-pcie-ref {
> +		compatible = "gpio-gate-clock";
> +		clocks = <&xtal25m>;
> +		#clock-cells = <0>;
> +		enable-gpios = <&pca9670_i2c3 7 GPIO_ACTIVE_LOW>;
> +	};
> +
> +	xtal25m: clock-xtal25m {
> +		compatible = "fixed-clock";
> +		#clock-cells = <0>;
> +		clock-frequency = <25000000>;
> +		clock-output-names = "xtal_25MHz";
> +	};
> +
>  	dmic: dmic {
>  		compatible = "dmic-codec";
>  		#sound-dai-cells = <0>;
> @@ -72,6 +86,15 @@ reg_m2_pwr: regulator-m2-pwr {
>  		startup-delay-us = <5000>;
>  	};
>  
> +	reg_slot_pwr: regulator-slot-pwr {
> +		compatible = "regulator-fixed";
> +		regulator-name = "PCIe slot-power";
> +		regulator-min-microvolt = <3300000>;
> +		regulator-max-microvolt = <3300000>;
> +		gpio = <&pcal6416_i2c3_u46 0 GPIO_ACTIVE_HIGH>;
> +		enable-active-high;
> +	};
> +
>  	reg_m2_wlan: regulator-wlan {
>  		compatible = "regulator-fixed";
>  		regulator-name = "WLAN_EN";
> @@ -704,6 +727,18 @@ IMX94_PAD_GPIO_IO28__LPI2C6_SCL		0x40000b9e
>  		>;
>  	};
>  
> +	pinctrl_pcie0: pcie0grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO20__PCIE1_CLKREQ_B	0x4000031e
> +		>;
> +	};
> +
> +	pinctrl_pcie1: pcie1grp {
> +		fsl,pins = <
> +			IMX94_PAD_GPIO_IO23__PCIE2_CLKREQ_B	0x4000031e
> +		>;
> +	};
> +
>  	pinctrl_pdm: pdmgrp {
>  		fsl,pins = <
>  			IMX94_PAD_PDM_CLK__PDM_CLK			0x31e
> @@ -878,6 +913,54 @@ IMX94_PAD_XSPI1_DQS__XSPI1_A_DQS	0x3fe
>  	};
>  };
>  
> +&pcie0 {
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +	clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
> +		 <&hsio_blk_ctl 0>,
> +		 <&pcie_ref_clk>;
> +	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
> +		      "ref", "extref";
> +	reset-gpio = <&pcal6416_i2c3_u46 3 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply = <&reg_m2_wlan>;
> +	supports-clkreq;
> +	status = "okay";
> +};
> +
> +&pcie0_ep {
> +	pinctrl-0 = <&pinctrl_pcie0>;
> +	pinctrl-names = "default";
> +	vpcie-supply = <&reg_m2_wlan>;
> +	status = "disabled";
> +};
> +
> +&pcie1 {
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +	clocks = <&scmi_clk IMX94_CLK_HSIO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL>,
> +		 <&scmi_clk IMX94_CLK_HSIOPLL_VCO>,
> +		 <&scmi_clk IMX94_CLK_HSIOPCIEAUX>,
> +		 <&hsio_blk_ctl 0>,
> +		 <&pcie_ref_clk>;
> +	clock-names = "pcie", "pcie_bus", "pcie_phy", "pcie_aux",
> +		      "ref", "extref";
> +	reset-gpio = <&pcal6416_i2c3_u46 1 GPIO_ACTIVE_LOW>;
> +	vpcie3v3aux-supply = <&reg_slot_pwr>;

I'd strongly recommend you to switch to Root Port binding and make use of
PWRCTRL_GENERIC driver to handle this supply. But this can be done later.

- Mani

> +	supports-clkreq;
> +	status = "okay";
> +};
> +
> +&pcie1_ep {
> +	pinctrl-0 = <&pinctrl_pcie1>;
> +	pinctrl-names = "default";
> +	vpcie-supply = <&reg_slot_pwr>;
> +	status = "disabled";
> +};
> +
>  &usb2 {
>  	dr_mode = "otg";
>  	disable-over-current;
> -- 
> 2.37.1
> 

-- 
மணிவண்ணன் சதாசிவம்

