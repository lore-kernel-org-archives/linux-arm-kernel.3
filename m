Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E20E0CD5BD1
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 26 May 2026 09:13:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=bHZrt2oEKfcUJ3Z2x7gDTIu2NBBHpvQFe8iNftnVzxA=; b=FWt7qmELA7ehv//Hwxe+//GpAF
	Rddr6hw3b7D/KhIOk0ffu2dRA51iipCrIXG/086PqYNvDpp0gxgmPsTAsmK/c97sW8gl0TV/KaZx4
	8xNree8u55hxqMmc9h9m/rbuO4ckGcEoPQGcp+uEYS4QzhgB/EKcSvDZMqqsjnDPGTf+lgV4k0dmW
	Jf2o5luwu15dofPOibxTRUuxO4rBYWx00NEl+CVd/PIeaw0b4gba4JJtZ/dOicdiZmmMHY3ne4GML
	HNqfcRkV50W/J8kxyCQThhF8RwuYsEX5oV9A3wNHhsekmR7z49YVtOJQ0LaMOkWLKo2fL5rNDGCEL
	6g3zKLzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnr2-00000001Tap-1uX5;
	Tue, 26 May 2026 09:13:40 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wRnr1-00000001Taa-0I2c
	for linux-arm-kernel@lists.infradead.org;
	Tue, 26 May 2026 09:13:39 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 823CE6008A;
	Tue, 26 May 2026 09:13:38 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6BF541F000E9;
	Tue, 26 May 2026 09:13:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1779786818;
	bh=bHZrt2oEKfcUJ3Z2x7gDTIu2NBBHpvQFe8iNftnVzxA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=c6zxmQGnBxR+kA7NuN6x50uIQ68e7CIQ1zeRlwj6LIT/3kzkdt+6gfhXOj4R2NaVr
	 OMkuNnJKxCxkQW9STBVZeaC35K7/3kZb8tp9ER2jDnx025CkeDUAFeuJ67gEUM7FOD
	 NTaJ7Gg/v+R8L1EC8g1smfOFU24+CqmOf+3wmMaK5VdEmalhzRCrbZOZopnR5ZtWVp
	 eULAw84eA1Lxa7/xkARXVriKP0gyvua8QL/TJxu0ieVMUlJSNZxKzMBE1TJ9orS0Nl
	 mp+zaPOIHJLYUUABR6ikcht6+SXS7k7hDQ11OHBQG8gD1nLPFA36kj99hngQ3zGFZ5
	 gv3Rhlsk9bxrw==
Date: Tue, 26 May 2026 11:13:35 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Guoniu Zhou <guoniu.zhou@oss.nxp.com>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Shawn Guo <shawnguo@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Pengutronix Kernel Team <kernel@pengutronix.de>, 
	Fabio Estevam <festevam@gmail.com>, Laurent Pinchart <laurent.pinchart@ideasonboard.com>, 
	Frank Li <frank.li@nxp.com>, imx@lists.linux.dev, linux-media@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, Guoniu Zhou <guoniu.zhou@nxp.com>, 
	Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>
Subject: Re: [PATCH v8 1/2] media: dt-bindings: Add CSI Pixel Formatter DT
 bindings
Message-ID: <20260526-towering-essential-civet-19a5ad@quoll>
References: <20260525-csi_formatter-v8-0-6b646231224b@oss.nxp.com>
 <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260525-csi_formatter-v8-1-6b646231224b@oss.nxp.com>
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

On Mon, May 25, 2026 at 04:12:22PM +0800, Guoniu Zhou wrote:
> From: Guoniu Zhou <guoniu.zhou@nxp.com>
> 
> The i.MX95 CSI pixel formatting module uses packet info, pixel and
> non-pixel data from the CSI-2 host controller and reformat them to
> match Pixel Link(PL) definition.
> 
> Reviewed-by: Frank Li <Frank.Li@nxp.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@oss.qualcomm.com>

Drop both review tags and request re-review since you made significant
changes.

> Signed-off-by: Guoniu Zhou <guoniu.zhou@nxp.com>
> ---
> Changes in v8:
> - Use standard port reference instead of video-interfaces.yaml

Why? Properties are not applicable?

> - Add parent syscon node in example to show device integration
> - Add required constraints for port@0 and port@1 in ports node
> 
> Changes in v7:
> - Change compatible to imx95-csi-formatter as IP is i.MX95 specific per Marco's suggestion
>   Link: https://lore.kernel.org/linux-media/20260511-csi_formatter-v6-0-01028e312e2b@oss.nxp.com/T/#mcd135b3de179b3cb69daa1fd6e0e8e27c85b3332
> ---
>  .../bindings/media/fsl,imx95-csi-formatter.yaml    | 92 ++++++++++++++++++++++
>  1 file changed, 92 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> new file mode 100644
> index 000000000000..bc2f5d448fe5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/fsl,imx95-csi-formatter.yaml
> @@ -0,0 +1,92 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/fsl,imx95-csi-formatter.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: i.MX95 CSI Pixel Formatter
> +
> +maintainers:
> +  - Guoniu Zhou <guoniu.zhou@nxp.com>
> +
> +description:
> +  The CSI pixel formatting module found on i.MX95 uses packet info, pixel
> +  and non-pixel data from the CSI-2 host controller and reformat them to
> +  match Pixel Link(PL) definition.
> +
> +properties:
> +  compatible:
> +    const: fsl,imx95-csi-formatter
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: MIPI CSI-2 RX IDI interface
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description: Pixel Link Interface
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - power-domains
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/nxp,imx95-clock.h>
> +
> +    syscon@4ac10000 {
> +        compatible = "nxp,imx95-camera-csr", "syscon";

Drop entire node, not relevant. Or actually this example could be in the
parent binding example.


> +        reg = <0x0 0x4ac10000 0x0 0x10000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +
> +        formatter@20 {
> +            compatible = "fsl,imx95-csi-formatter";
> +            reg = <0x20 0x100>;
> +            clocks = <&cameramix_csr IMX95_CLK_CAMBLK_CSI2_FOR0>;
> +            power-domains = <&scmi_devpd 3>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                port@0 {
> +                    reg = <0>;
> +
> +                    endpoint {
> +                        remote-endpoint = <&mipi_csi_0_out>;
> +                };
> +            };
> +
> +                port@1 {

Messed indentation.

Best regards,
Krzysztof


