Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 26FD4CD5BD0
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:44:56 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TDRHDmGEsWoGhX4hRehGVfE9UV2CZph1ARQ/RBNtl1Y=; b=gt0iuRXPEe22W9ohYgGhV6RNbB
	Ejx4gOyBDlhNSOKCmoBbNekOb5Rtm3sQSFoV249lNA6QjEaZXoirXKQdZODiNLeeT8a0kKDt6GUka
	cT7j9uwqHqEZQlrcN4ugF7gnDC7M3r4UayeJx3eWAL3rGuLfwBImAsB+4JE/iPcUBfVfUfDG2ZaoI
	lA19XmRKZRxcC4qMNBVd1GjKpGa7cE0csNLIiGcpofHAqI7GYZtkE8N+obbTYAlMZaaHMjK49K0KW
	Md9dcgtNDIimsUXaJ3/Lpt7IT+B8KfXc0xlEYv2Gs6aHkae/PGHDLgzAYqtkKp3BaTN0NwbNZwCtw
	EiOr8zqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoL9-00000001YiX-2u4B;
	Tue, 26 May 2026 09:44:47 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRoL6-00000001Yhd-2E1w
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:44:46 +0000
Received: from killaraus.ideasonboard.com (unknown [146.0.25.242])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id A9E1A492;
	Tue, 26 May 2026 11:44:21 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1779788661;
	bh=U2+ZqPjvAiVmxd7qt0wOerBLfKuC1rSIN5i69jydn5k=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=PvhOmsToRO3rC28XupWVRACpG//74c+zZot9GLddRpSbnxeuPf/vOixR7V9Bl3cpb
	 jCB7tuhVixoWh4HX02RVmNxldN6d2LGQq/vry4oFR6F1HwGIBhs6OJ4qKyydu2wSD/
	 jjw6GYpYF3RiFLHCYc/P4cHrI3LRDeKD8YxQVI/Q=
Date: Tue, 26 May 2026 11:44:38 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Krzysztof Kozlowski <krzk@kernel.org>
Cc: Guoniu Zhou <guoniu.zhou@oss.nxp.com>,
	Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>,
	Sascha Hauer <s.hauer@pengutronix.de>,
	Pengutronix Kernel Team <kernel@pengutronix.de>,
	Fabio Estevam <festevam@gmail.com>, Frank Li <frank.li@nxp.com>,
	imx@lists.linux.dev, linux-media@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260526094438.GE228394@killaraus.ideasonboard.com>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
 <20260526-towering-essential-civet-19a5ad@quoll>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260526-towering-essential-civet-19a5ad@quoll>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260526_024444_724121_87EFC4A4 
X-CRM114-Status: GOOD (  24.55  )
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

On Tue, May 26, 2026 at 11:13:35AM +0200, Krzysztof Kozlowski wrote:
> On Mon, May 25, 2026 at 04:12:22PM +0800, Guoniu Zhou wrote:
> > From: Guoniu Zhou <guoniu.zhou@nxp.com>
> > 
> > The i.MX95 CSI pixel formatting module uses packet info, pixel and
> > non-pixel data from the CSI-2 host controller and reformat them to
> > match Pixel Link(PL) definition.
> > 
> > Reviewed-by: Frank Li <Frank.Li@nxp.com>
> > Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
> 
> Drop both review tags and request re-review since you made significant
> changes.
> 
> > Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> > ---
> > Changes in v8:
> > - Use standard port reference instead of video-interfaces.yaml
> 
> Why? Properties are not applicable?
> 
> > - Add parent syscon node in example to show device integration
> > - Add required constraints for port@0 and port@1 in ports node
> > 
> > Changes in v7:
> > - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
> >   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> > ---
> >  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92 ++++++++++++++++++++++
> >  1 file changed, 92 insertions(+)
> > 
> > diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> > new file mode 100644
> > index 000000000000..bc2f5d448fe5
> > --- /dev/null
> > +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> > @@ -0,0 +1,92 @@
> > +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> > +%YAML 1.2
> > +---
> > +$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
> > +$schema: http://devicetree.org/meta-schemas/core.yaml#
> > +
> > +title: i.MX95 CSI Pixel Formatter
> > +
> > +maintainers:
> > +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> > +
> > +description:
> > +  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
> > +  and non-pixel data from the CSI-2 host controller and reformat them to
> > +  match Pixel Link(PL) definition.
> > +
> > +properties:
> > +  compatible:
> > +    const: fsl,imx95-csi-formatter
> > +
> > +  reg:
> > +    maxItems: 1
> > +
> > +  clocks:
> > +    maxItems: 1
> > +
> > +  power-domains:
> > +    maxItems: 1
> > +
> > +  ports:
> > +    $ref: /schemas/graph.yaml#/properties/ports
> > +
> > +    properties:
> > +      port@0:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: MIPI CSI-2 RX IDI interface
> > +
> > +      port@1:
> > +        $ref: /schemas/graph.yaml#/properties/port
> > +        description: Pixel Link Interface
> > +
> > +    required:
> > +      - port@0
> > +      - port@1
> > +
> > +required:
> > +  - compatible
> > +  - reg
> > +  - clocks
> > +  - power-domains
> > +  - ports
> > +
> > +additionalProperties: false
> > +
> > +examples:
> > +  - |
> > +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> > +
> > +    syscon@4ac10000 {
> > +        compatible = "nxp,imx95-camera-csr", "syscon";
> 
> Drop entire node, not relevant. Or actually this example could be in the
> parent binding example.

I asked for this in the review of a previous version. The example only
stated "formatter@20" and it was not mentioned anywhere that the device
was supposed to be a child node of a syscon. The driver reads the reg
property and uses it as an offset to the regmap of the syscon, I wanted
to see where/how the node was meant to be integrated in DT.

> > +        reg = <0x0 0x4ac10000 0x0 0x10000>;
> > +        #address-cells = <1>;
> > +        #size-cells = <1>;
> > +
> > +        formatter@20 {
> > +            compatible = "fsl,imx95-csi-formatter";
> > +            reg = <0x20 0x100>;
> > +            clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> > +            power-domains = <&scmi_devpd 3>;
> > +
> > +            ports {
> > +                #address-cells = <1>;
> > +                #size-cells = <0>;
> > +
> > +                port@0 {
> > +                    reg = <0>;
> > +
> > +                    endpoint {
> > +                        remote-endpoint = <&mipi_csi_0_out>;
> > +                };
> > +            };
> > +
> > +                port@1 {
> 
> Messed indentation.

-- 
Regards,

Laurent Pinchart

