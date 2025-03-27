Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C5D12C3600B
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 27 Mar 2025 18:46:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y42thsRJL5Id4F+wzG/Zk574KysDPxvMrEO3PSfCsTo=; b=y5gvTHfjGlvVrC9o2I7LSFBr3d
	DVueiw84o0Tm5NDTndo86p5Nr5w69BYCPRtvWgnBLGeX2Qnd6ip5IP2lZjULwhRQ1ofsUBzfFXUrX
	my0vovUqWCtfZj4BJDhIw13kSyOdi8ej1oNwG8zZOujXFlZz/LUSNwDLsA6X3fOMarN/tS0Qt+PYq
	aCgoWPHLCF/eTUu3TBwmK7a6r/OKZUYUoEEK5y6RvScwNfsSNIkx7EjaXVAcgsDESWErS1EsD/emT
	c/7SvBbNKCA6fSoDr74/fkHxJ0wohWouM05hhHiJU88xolRSutOvnJluTk99GH+izeiJkg/MePwwv
	+y3LUCxA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsFV-0000000Bl1B-1Z7w;
	Thu, 27 Mar 2025 18:46:41 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.1 #2 (Red Hat Linux))
	id 1txsDl-0000000Bktd-20bd
	for linux-arm-kernel@lists.infradead.org;
	Thu, 27 Mar 2025 18:44:55 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 86313F6;
	Thu, 27 Mar 2025 19:42:59 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1743100979;
	bh=pXUIm6nWnAiapPhAoHswMtXLIViBhZ7ZAd3Lbpjo7xw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=tYG9mACBY3ADn8xf8BAp4rvGTUig2Ub9OwTOGcYXs7m0wfTboN/gUbqk8+wZxuQEr
	 jzKsTEQDbnexPVO83zdmMzRTbieG8k+RnIJG6S+XXbeTOro0xUaeAlGhB1XAnmTp7V
	 DT5jS0qBeICGqbnY67zMyf+kPnyb/njiK32QVMTM=
Date: Thu, 27 Mar 2025 20:44:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.Li@nxp.com>
Cc: Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Dong Aisheng <aisheng.dong@nxp.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, devicetree@vger.kernel.org,
	linux-kernel@vger.kernel.org, imx@lists.linux.dev,
	linux-arm-kernel@lists.infradead.org, linux-media@vger.kernel.org,
	Robert Chiras <robert.chiras@nxp.com>,
	"Guoniu.zhou" <guoniu.zhou@nxp.com>
Subject: Re: [PATCH v3 03/12] media: dt-bindings: Add binding doc for
 i.MX8QXP and i.MX8QM ISI
Message-ID: <20250327184425.GE4861@pendragon.ideasonboard.com>
References: <20250210-8qxp_camera-v3-0-324f5105accc@nxp.com>
 <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250210-8qxp_camera-v3-3-324f5105accc@nxp.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250327_114453_659363_E9B53CFC 
X-CRM114-Status: GOOD (  24.42  )
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

Hi Frank,

Thank you for the patch.

On Mon, Feb 10, 2025 at 03:59:22PM -0500, Frank Li wrote:
> Add binding documentation for i.MX8QXP and i.MX8QM ISI. The clock-names,
> power-domains, and ports differ significantly from the existing
> nxp,imx8-isi.yaml. Create a new file to avoid complex if-else branches.

Mixed feelings about having different bindings files for what is
essentially the same IP, but I won't object.

> Add new file to MAINTAINERS.
> 
> Signed-off-by: Frank Li <Frank.Li@nxp.com>
> ---
> change from v2 to v3
> - none
> change from v1 to v2
> - create new file for 8qm and 8qxp accroding rob's suggestion.
> ---
>  .../devicetree/bindings/media/fsl,imx8qm-isi.yaml  | 117 +++++++++++++++++++++
>  .../devicetree/bindings/media/fsl,imx8qxp-isi.yaml | 103 ++++++++++++++++++
>  MAINTAINERS                                        |   1 +
>  3 files changed, 221 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
> new file mode 100644
> index 0000000000000..61c551673e2a4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx8qm-isi.yaml
> @@ -0,0 +1,117 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx8qm-isi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX8QM Image Sensing Interface
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  The Image Sensing Interface (ISI) combines image processing pipelines with
> +  DMA engines to process and capture frames originating from a variety of
> +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qm-isi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 8
> +
> +  clock-names:
> +    items:
> +      - const: per0
> +      - const: per1
> +      - const: per2
> +      - const: per3
> +      - const: per4
> +      - const: per5
> +      - const: per6
> +      - const: per7
> +
> +  interrupts:
> +    maxItems: 8
> +
> +  power-domains:
> +    maxItems: 8

This surprises me. The reference manual does list 8 clocks and
interrupts, but only 6 channels in the ISI section (for instance in
15.6.1.1.4). Which one is wrong ?

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MIPI CSI-2 RX 0
> +      port@3:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MIPI CSI-2 RX 1
> +      port@4:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: HDMI RX

Figure 15-59 in the reference manual list MIPI CSI-2 RX 0 and RX 1 as
connected to inputs 0 and 1 respectively.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/imx8-clock.h>
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    image-controller@58100000 {
> +        compatible = "fsl,imx8qm-isi";
> +        reg = <0x58100000 0x90000>;

The memory map in the reference manual lists the "Pixel DMA" region as
ending at 0x5817ffff. Shouldn't the length of the region be 0x80000 ?

> +        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 298 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 299 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 300 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma1_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma2_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma3_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
> +        clock-names = "per0", "per1", "per2", "per3",
> +                      "per4", "per5", "per6", "per7";
> +        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH1>,
> +                        <&pd IMX_SC_R_ISI_CH2>, <&pd IMX_SC_R_ISI_CH3>,
> +                        <&pd IMX_SC_R_ISI_CH4>, <&pd IMX_SC_R_ISI_CH5>,
> +                        <&pd IMX_SC_R_ISI_CH6>, <&pd IMX_SC_R_ISI_CH7>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@2 {
> +                reg = <2>;
> +                endpoint {
> +                    remote-endpoint = <&mipi_csi0_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
> new file mode 100644
> index 0000000000000..818fea0e4679f
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx8qxp-isi.yaml
> @@ -0,0 +1,103 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx8qxp-isi.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX8QXP Image Sensing Interface
> +
> +maintainers:
> +  - Frank Li <Frank.Li@nxp.com>
> +
> +description:
> +  The Image Sensing Interface (ISI) combines image processing pipelines with
> +  DMA engines to process and capture frames originating from a variety of
> +  sources. The inputs to the ISI go through Pixel Link interfaces, and their
> +  number and nature is SoC-dependent. They cover both capture interfaces (MIPI
> +  CSI-2 RX, HDMI RX, ...) and display engine outputs for writeback support.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - fsl,imx8qxp-isi
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 5
> +
> +  clock-names:
> +    items:
> +      - const: per0
> +      - const: per4
> +      - const: per5
> +      - const: per6
> +      - const: per7
> +
> +  interrupts:
> +    maxItems: 5
> +
> +  power-domains:
> +    maxItems: 5

Here you have 5 channels, while the reference manual lists 8 interrupts
and 6 channels in the ISI documentation.

> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +    properties:
> +      port@2:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MIPI CSI-2 RX 0
> +      port@6:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: CSI-2 Parallel RX

Table 15-6 in the reference manual lists the parallel port as input 4.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/imx8-clock.h>
> +    #include <dt-bindings/clock/imx8-lpcg.h>
> +    #include <dt-bindings/firmware/imx/rsrc.h>
> +
> +    image-controller@58100000 {
> +        compatible = "fsl,imx8qxp-isi";
> +        reg = <0x58100000 0x90000>;

Same comment here about the registers range.

> +        interrupts = <GIC_SPI 297 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 301 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 302 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 303 IRQ_TYPE_LEVEL_HIGH>,
> +                     <GIC_SPI 304 IRQ_TYPE_LEVEL_HIGH>;
> +        clocks = <&pdma0_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma4_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma5_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma6_lpcg IMX_LPCG_CLK_0>,
> +                 <&pdma7_lpcg IMX_LPCG_CLK_0>;
> +        clock-names = "per0", "per4", "per5", "per6", "per7";
> +        power-domains = <&pd IMX_SC_R_ISI_CH0>, <&pd IMX_SC_R_ISI_CH4>,
> +                        <&pd IMX_SC_R_ISI_CH5>, <&pd IMX_SC_R_ISI_CH6>,
> +                        <&pd IMX_SC_R_ISI_CH7>;
> +
> +        ports {
> +            #address-cells = <1>;
> +            #size-cells = <0>;
> +
> +            port@2 {
> +                reg = <2>;
> +                endpoint {
> +                    remote-endpoint = <&mipi_csi0_out>;
> +                };
> +            };
> +        };
> +    };
> +...
> diff --git a/MAINTAINERS b/MAINTAINERS
> index 40d1b7ec30fde..f243257ef7653 100644
> --- a/MAINTAINERS
> +++ b/MAINTAINERS
> @@ -17000,6 +17000,7 @@ NXP i.MX 8M ISI DRIVER
>  M:	Laurent Pinchart <laurent.pinchart@ideasonboard.com>
>  L:	linux-media@vger.kernel.org
>  S:	Maintained
> +F:	Documentation/devicetree/bindings/media/fsl,imx8*-isi.yaml
>  F:	Documentation/devicetree/bindings/media/nxp,imx8-isi.yaml

Should nxp,imx8-isi.yaml be renamed to fsl,imx8-isi.yaml ?

>  F:	drivers/media/platform/nxp/imx8-isi/
>  

-- 
Regards,

Laurent Pinchart

