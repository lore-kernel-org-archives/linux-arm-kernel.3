Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0D299C8303F
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  1 Jul 2025 19:55:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=czCr7lgNW1/qOrc/EZCi4HY+hOJT7Z7oQRQo8KOMQVg=; b=UUv0mQEtqMEipL3POEse+Gg3Af
	6V5EwBVoCf/UcsdWHEtn7bJAERV8PiMvSwuXlEFECG/VCvqEOPgBcFonUxbTFE8NRWwUB5pY7NLT2
	+S2wYEPFjBnDKqNTh1kp3daHjSj9UsQOlmkcaSJcj8S917vp5eHkzSbMnbXXjg2hriY+nMY5ZnpuS
	VX5aJViXvR78n2cwhmvumwFg3VVhdAMwZNt8a4I5YfyTiURZOBeq+yh9my9PRA+MeXtR2MNKTW07t
	VSy1MRQZXDpbezhh/GhLgIaXkYgEb60oOQ31RTkTiVuhrQ62DJGraPAuSbstgRw/ImE0xVkkf1rdU
	40LDCzEw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWh4k-00000006Vr3-0g4M;
	Tue, 01 Jul 2025 19:55:30 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uWgjL-00000006Tqs-1klS
	for linux-arm-kernel@lists.infradead.org;
	Tue, 01 Jul 2025 19:33:25 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with UTF8SMTPSA id E2056778;
	Tue,  1 Jul 2025 21:32:56 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1751398377;
	bh=e0LWiiDV7mWe0O80pfeWjuB7jaudkzgYWw5HdH9efCA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a27X8C34QS5VN4dnhLZAKZSUd6LBGiQLq4F//Qhwj82D7UqXa6QniZMFYVbBPThKq
	 aRM8wspnHZVliCC3L6fwPQzCJe5cxY6RPNn0Em9d8xjueZhI9cTI3K+5Jf3FW0XGOJ
	 mLz8q8cTw5EXbXeOUJH/AdoqAuVcMAp/2dw8JkJg=
Date: Tue, 1 Jul 2025 22:32:53 +0300
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Frank Li <Frank.li@nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>,
	Rui Miguel Silva <rmfrfs@gmail.com>,
	Martin Kepplinger <martink@posteo.de>,
	Purism Kernel Team <kernel@puri.sm>, Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Philipp Zabel <p.zabel@pengutronix.de>, linux-media@vger.kernel.org,
	imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	Alice Yuan <alice.yuan@nxp.com>
Subject: Re: [PATCH 2/5] dt-bindings: media: add i.MX parallel csi support
Message-ID: <20250701193253.GC16835@pendragon.ideasonboard.com>
References: <20250630-imx8qxp_pcam-v1-0-eccd38d99201@nxp.com>
 <20250630-imx8qxp_pcam-v1-2-eccd38d99201@nxp.com>
 <20250630225340.GE15184@pendragon.ideasonboard.com>
 <aGP2yT9ID1E0BepB@lizhi-Precision-Tower-5810>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <aGP2yT9ID1E0BepB@lizhi-Precision-Tower-5810>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250701_123323_738175_91A12FA5 
X-CRM114-Status: GOOD (  30.99  )
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

On Tue, Jul 01, 2025 at 10:55:32AM -0400, Frank Li wrote:
> On Tue, Jul 01, 2025 at 01:53:40AM +0300, Laurent Pinchart wrote:
> > On Mon, Jun 30, 2025 at 06:28:18PM -0400, Frank Li wrote:
> > > From: Alice Yuan <alice.yuan@nxp.com>
> > >
> > > Document the binding for parallel CSI controller found in i.MX8QXP, i.MX93
> > > and i.MX91 SoCs.
> > >
> > > Signed-off-by: Alice Yuan <alice.yuan@nxp.com>
> > > Signed-off-by: Frank Li <Frank.Li@nxp.com>
> > > ---
> > >  .../bindings/media/fsl,imx93-parallel-csi.yaml     | 108 +++++++++++++++++++++
> > >  MAINTAINERS                                        |   1 +
> > >  2 files changed, 109 insertions(+)
> > >
> > > diff --git a/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > > new file mode 100644
> > > index 0000000000000..b4657c913adad
> > > --- /dev/null
> > > +++ b/Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > > @@ -0,0 +1,108 @@
> > > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > > +%YAML 1.2
> > > +---
> > > +$id: http://devicetree.org/schemas/media/fsl,imx93-parallel-csi.yaml#
> > > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > > +
> > > +title: i.MX8/9 Parallel Camera Interface
> > > +
> > > +maintainers:
> > > +  - Frank Li <Frank.Li@nxp.com>
> > > +
> > > +description: |
> > > +  This is device node for the Parallel Camera Interface which enables the
> > > +  chip to connect directly to external Parallel CMOS image sensors.
> > > +  Supports up to 80MHz input clock from sensor.
> > > +  Supports the following input data formats
> > > +    - 8-bit/10-bit Camera Sensor Interface (CSI)
> > > +    - 8-bit data port for RGB, YCbCr, and YUV data input
> > > +    - 8-bit/10-bit data ports for Bayer data input
> > > +  Parallel Camera Interface is hooked to the Imaging subsystem via the
> > > +  Pixel Link.
> > > +
> > > +properties:
> > > +  compatible:
> > > +    oneOf:
> > > +      - const: fsl,imx8qxp-parallel-csi
> >
> > Is there any chance we could avoid calling this "csi", given that the
> > whole block is called "Parallel Capture Interface" in the reference
> > manual ? "CSI" is horribly confusing as it usually refers to MIPI CSI-2.
> > I suppose calling it "PCI" for "Parallel Capture Interface" wouldn't
> > help :-/
> 
> PCI is too famous for PCI(Peripheral Component Interconnec) bus. It will be
> more confused.

Yes, I wasn't really proposing it. We have too few TLAs :)

> Can we use pcam? fsl,imx8qxp-pcam

Brainstorming a bit, we could use use pcif (Pixel Capture InterFace).

> > > +      - items:
> > > +          - enum:
> > > +              - fsl,imx91-parallel-csi
> > > +          - const: fsl,imx93-parallel-csi
> > > +      - const: fsl,imx93-parallel-csi
> > > +
> > > +  reg:
> > > +    maxItems: 1
> > > +
> > > +  clocks:
> > > +    maxItems: 2
> > > +
> > > +  clock-names:
> > > +    items:
> > > +      - const: pixel
> > > +      - const: ipg
> > > +
> > > +  power-domains:
> > > +    maxItems: 1
> > > +
> > > +  ports:
> > > +    $ref: /schemas/graph.yaml#/properties/ports
> > > +
> > > +    properties:
> > > +      port@0:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Input port node.
> > > +
> > > +      port@1:
> > > +        $ref: /schemas/graph.yaml#/$defs/port-base
> > > +        unevaluatedProperties: false
> > > +        description:
> > > +          Output port node.
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +  - clocks
> > > +  - clock-names
> > > +  - ports
> >
> > Patch 4/5 lists a power domain, and so does the example below for
> > i.MX93. Should the power-domains property be mandatory ?
> >
> > > +
> > > +additionalProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    #include <dt-bindings/clock/imx93-clock.h>
> > > +    #include <dt-bindings/power/fsl,imx93-power.h>
> > > +
> > > +    parallel-csi@4ac10070 {
> > > +        compatible = "fsl,imx93-parallel-csi";
> > > +        reg = <0x4ac10070 0x10>;
> >
> > The i.MX93 reference manual doesn't document the register set for this
> > block, so I have a hard time reviewing this. Is there a plan to publish
> > a new version of the reference manual with the complete documentation
> > for the parallel interface ?
> >
> > > +        clocks = <&clk IMX93_CLK_MIPI_CSI_GATE>,
> > > +                 <&clk IMX93_CLK_MEDIA_APB>;
> > > +        clock-names = "pixel", "ipg";
> > > +        assigned-clocks = <&clk IMX93_CLK_CAM_PIX>;
> > > +        assigned-clock-parents = <&clk IMX93_CLK_VIDEO_PLL>;
> > > +        assigned-clock-rates = <140000000>;
> > > +        power-domains = <&media_blk_ctrl IMX93_MEDIABLK_PD_MIPI_CSI>;
> > > +
> > > +        ports {
> > > +            #address-cells = <1>;
> > > +            #size-cells = <0>;
> > > +
> > > +            port@0 {
> > > +                reg = <0>;
> > > +
> > > +                endpoint {
> > > +                    remote-endpoint = <&mt9m114_ep>;
> > > +                };
> > > +            };
> > > +
> > > +            port@1 {
> > > +                reg = <1>;
> > > +                endpoint {
> > > +                    remote-endpoint = <&isi_in>;
> > > +                };
> > > +            };
> > > +        };
> > > +    };
> > > +...
> > > diff --git a/MAINTAINERS b/MAINTAINERS
> > > index 8dc0f6609d1fe..3bd6772c11539 100644
> > > --- a/MAINTAINERS
> > > +++ b/MAINTAINERS
> > > @@ -15107,6 +15107,7 @@ L:	linux-media@vger.kernel.org
> > >  S:	Maintained
> > >  T:	git git://linuxtv.org/media.git
> > >  F:	Documentation/admin-guide/media/imx7.rst
> > > +F:	Documentation/devicetree/bindings/media/fsl,imx93-parallel-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx-mipi-csi2.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx7-csi.yaml
> > >  F:	Documentation/devicetree/bindings/media/nxp,imx8mq-mipi-csi2.yaml

-- 
Regards,

Laurent Pinchart

