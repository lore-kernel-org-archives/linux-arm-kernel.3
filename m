Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9B3CACCF9E5
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Oct 2025 01:03:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ECaVeQ8mpbghHK+xp9jKZCJBAEvooLvjz5n7cCSlKtA=; b=m645cC3p4wLbjLjCkHCZZ3QxWk
	R3hfpb3PNphi3Ur7cqon6qQ3MjpJKvxwuicRuBzSexDc4LjsYWDAAd51TfLz+RfAO6laxhscJ01w0
	4sdwyrZPu4kRX/9/BF2RPORAO7qLgf6/PJ69vpLZu/NP7Xjk8MyKwV/5QGfZXbhuADdzeXTivQ7ja
	D7Y1/pDaoELlhh0MBKjHcvNuhqI4XLtI0enlqva38WOwbLT3OGl+8ly7LwybVRlIY0UnYH4lvd7Hi
	GW4vwGBJv0CuYVrZnOqJHP/WE4F+gMYWKcAqSje27q3W08X33iJZQ1BDQSKsOPelsJDUQ4hUBbPOF
	pr01DiZg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBdl-0000000CvF1-1hzk;
	Mon, 27 Oct 2025 01:03:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vDBdi-0000000CvEW-2v7Y
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Oct 2025 01:03:15 +0000
Received: from pendragon.ideasonboard.com (82-203-161-16.bb.dnainternet.fi [82.203.161.16])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id 58884E1F;
	Mon, 27 Oct 2025 02:01:24 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1761526884;
	bh=TRf7E6Wmq0Mv8cybHM8FwxOjKlKmGcf5vNcSFqxCThQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=RCfMUIpoNetOTMMslAZo8oCNJc6hYAi95o22PZvksxmAUO19SFB+PB07bK1H/R2LB
	 JoeoFI4mfyf22ZCFddAV/tPcpMTPMntNVNMXZpHnO8aEdAHzphDoacWleOlqImVTax
	 JVA+qtIU7pdO/71BuxqZVjEiCLRvaHln3uEiqSGg=
Date: Mon, 27 Oct 2025 03:02:57 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Philipp Zabel <p.zabel@pengutronix.de>, Frank Li <Frank.Li@nxp.com>,
	linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v7 5/5] arm64: dts: imx8ulp: Add CSI and ISI Nodes
Message-ID: <20251027010257.GQ13023@pendragon.ideasonboard.com>
References: <20251023-csi2_imx8ulp-v7-0-5ecb081ce79b@nxp.com>
 <20251023-csi2_imx8ulp-v7-5-5ecb081ce79b@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20251023-csi2_imx8ulp-v7-5-5ecb081ce79b@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251026_180314_873390_9128E375 
X-CRM114-Status: GOOD (  16.27  )
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

On Thu, Oct 23, 2025 at 05:19:46PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The CSI-2 in the i.MX8ULP is almost identical to the version present
> in the i.MX8QXP/QM and is routed to the ISI. Add both the ISI and CSI
> nodes and mark them as disabled by default since capture is dependent
> on an attached camera.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>

Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>

> ---
>  arch/arm64/boot/dts/freescale/imx8ulp.dtsi | 67 ++++++++++++++++++++++++++++++
>  1 file changed, 67 insertions(+)
> 
> diff --git a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> index 13b01f3aa2a4950c37e72e04f6bfb5995dc19178..99271d55dfb60ed2cbfe664d928be179eb257674 100644
> --- a/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> +++ b/arch/arm64/boot/dts/freescale/imx8ulp.dtsi
> @@ -7,6 +7,7 @@
>  #include <dt-bindings/gpio/gpio.h>
>  #include <dt-bindings/interrupt-controller/arm-gic.h>
>  #include <dt-bindings/power/imx8ulp-power.h>
> +#include <dt-bindings/reset/imx8ulp-pcc-reset.h>
>  #include <dt-bindings/thermal/thermal.h>
>  
>  #include "imx8ulp-pinfunc.h"
> @@ -842,6 +843,72 @@ spdif: spdif@2dab0000 {
>  				dma-names = "rx", "tx";
>  				status = "disabled";
>  			};
> +
> +			isi: isi@2dac0000 {
> +				compatible = "fsl,imx8ulp-isi";
> +				reg = <0x2dac0000 0x10000>;
> +				interrupts = <GIC_SPI 119 IRQ_TYPE_LEVEL_HIGH>;
> +				clocks = <&pcc5 IMX8ULP_CLK_ISI>,
> +					 <&cgc2 IMX8ULP_CLK_LPAV_AXI_DIV>;
> +				clock-names = "axi", "apb";
> +				power-domains = <&scmi_devpd IMX8ULP_PD_ISI>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +						isi_in: endpoint {
> +							remote-endpoint = <&mipi_csi_out>;
> +						};
> +					};
> +				};
> +			};
> +
> +			mipi_csi: csi@2daf0000 {
> +				compatible = "fsl,imx8ulp-mipi-csi2";
> +				reg = <0x2daf0000 0x10000>,
> +				      <0x2dad0000 0x10000>;
> +				clocks = <&pcc5 IMX8ULP_CLK_CSI>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
> +					 <&pcc5 IMX8ULP_CLK_CSI_REGS>;
> +				clock-names = "core", "esc", "ui", "pclk";
> +				assigned-clocks = <&pcc5 IMX8ULP_CLK_CSI>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_CLK_ESC>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_CLK_UI>,
> +						  <&pcc5 IMX8ULP_CLK_CSI_REGS>;
> +				assigned-clock-parents = <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV1>,
> +							 <&cgc2 IMX8ULP_CLK_PLL4_PFD1_DIV2>,
> +							 <&cgc2 IMX8ULP_CLK_PLL4_PFD0_DIV1>;
> +				assigned-clock-rates = <200000000>,
> +						       <80000000>,
> +						       <100000000>,
> +						       <79200000>;
> +				power-domains = <&scmi_devpd IMX8ULP_PD_MIPI_CSI>;
> +				resets = <&pcc5 PCC5_CSI_SWRST>,
> +					 <&pcc5 PCC5_CSI_REGS_SWRST>;
> +				status = "disabled";
> +
> +				ports {
> +					#address-cells = <1>;
> +					#size-cells = <0>;
> +
> +					port@0 {
> +						reg = <0>;
> +					};
> +
> +					port@1 {
> +						reg = <1>;
> +
> +						mipi_csi_out: endpoint {
> +							remote-endpoint = <&isi_in>;
> +						};
> +					};
> +				};
> +			};
>  		};
>  
>  		gpiod: gpio@2e200000 {

-- 
Regards,

Laurent Pinchart

