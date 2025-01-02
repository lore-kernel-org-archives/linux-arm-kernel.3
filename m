Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8795AE77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:30:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IDRuAjiBYZGV3+IK5Z0CBam6TAY0we338+VBFhKbWKs=; b=bXaY1aue0JEqob8LLgIl6X1VPH
	w9+MrN8Lsvu4p2AmCXba7YloXXldLvtJyKcuHmXAgwhYcPBMMtBlwK+IOR9RKlqQrDNJvKaqZfdXa
	5Z7O9S3SvuwhHTJAcmJWpswxbpZwP5AYJB63AgR9YNXXGho2efkCfrYrGZQUXyKG1wiLXBZ67yPgL
	YMg+YCq8d5U2cb9pxDPCP6RGnhDJZoc2KmFtlZFbddvn0TbpbWIkl/9P1ML6ReTXOdP1yPRd5B3Lh
	mkpgdpYdmHWb7ri3teZ7yt9z37NM/XuXyCaIglsQsQCi/J3+06ED1FacS5qcJUduPYdrvfVoKXHkM
	YivmC7aw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHXK-0000000A2pf-0Vht;
	Thu, 02 Jan 2025 09:30:38 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHWA-0000000A2g9-2w3j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:29:28 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D246A75A;
	Thu,  2 Jan 2025 10:28:36 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735810117;
	bh=onqrZ9NPwzzCIC8p3BjmM6gfrgM7fWW/E8p+1b0xA1o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=AS9RF9/HaMlA5Tm0IJ0+t1rKXA8AV3vlNu4qb5Ox5C3VQ3Vzf2lL6J25vSESE9bbV
	 qmORlUtuDDUS8ObgfdOj9eWbdu7McLMrxw6c5sf3uB98U7g/pYc7Fs5gSKQxS7//VU
	 IyHEV/ffrtKK7gwa3C5K+OB+DvUVR/Zl7n/0mS2k=
Date: Thu, 2 Jan 2025 11:29:25 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
Cc: Mauro Carvalho Chehab <mchehab@kernel.org>,
	Rob Herring <robh@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Hans Verkuil <hverkuil-cisco@xs4all.nl>,
	Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>,
	linux-media@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, devicetree@vger.kernel.org
Subject: Re: [PATCH v12 1/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti MIPI CSI-2 Receiver
Message-ID: <20250102092925.GC554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-2-yuji2.ishikawa@toshiba.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_012926_899566_3DA4BDFB 
X-CRM114-Status: GOOD (  21.07  )
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

Hello Ishikawa-san,

Thank you for the patch.

On Mon, Nov 25, 2024 at 06:21:39PM +0900, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the MIPI CSI-2 Receiver found in Toshiba Visconti SoCs.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
> 
> Changelog v12:
> - Newly add bindings for CSI2RX driver 
> 
>  .../media/toshiba,visconti5-csi2rx.yaml       | 104 ++++++++++++++++++
>  1 file changed, 104 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> new file mode 100644
> index 000000000000..5488072bc82a
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-csi2rx.yaml
> @@ -0,0 +1,104 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/toshiba,visconti5-csi2rx.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti5 SoC MIPI CSI-2 receiver
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +description: |-

As Krzysztof mentioned, '|-' isn't needed. See
https://yaml-multiline.info/ for more information. The literal block
style indicator ('|') is only needed when line breaks need to be
preserved, e.g. when the description contains ASCII art.

> +  Toshiba Visconti5 SoC MIPI CSI-2 receiver device receives MIPI CSI-2 video
> +  stream. Use with VIIF device. T.B.D

T.B.D ?

> +
> +properties:
> +  compatible:
> +    const: toshiba,visconti5-csi2rx
> +
> +  reg:
> +    items:
> +      - description: Registers for CSI2 receiver control
> +
> +  interrupts:
> +    items:
> +      - description: CSI2 Receiver Interrupt
> +
> +  ports:
> +    $ref: /schemas/graph.yaml#/properties/ports
> +
> +    properties:
> +      port@0:
> +        $ref: /schemas/graph.yaml#/$defs/port-base
> +        unevaluatedProperties: false
> +        description:
> +          Input port node, single endpoint describing the CSI-2 transmitter.
> +
> +        properties:
> +          endpoint:
> +            $ref: video-interfaces.yaml#

Please use a full path for the ref:

            $ref: /schemas/media/video-interfaces.yaml#

> +            unevaluatedProperties: false
> +
> +            properties:
> +              data-lanes:
> +                description: CSI2 receiver supports 1, 2, 3 or 4 data lanes

You can drop the description. The video-interfaces.yaml schema has a
more complete description, and the fact that the receiver supports
between 1 and 4 lanes is conveyed by minItems and items below.

> +                minItems: 1
> +                items:
> +                  - const: 1
> +                  - const: 2
> +                  - const: 3
> +                  - const: 4
> +            required:
> +              - data-lanes
> +
> +      port@1:
> +        $ref: /schemas/graph.yaml#/properties/port
> +        description:
> +          Output port node, single endpoint describing the Visconti VIIF.
> +
> +    required:
> +      - port@0
> +      - port@1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - ports
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        csi2rx@1c008000 {

Node names should describe the function of the node, not the precise
model of the device. "csi2" would be a more appropriate name.

> +            compatible = "toshiba,visconti5-csi2rx";
> +            reg = <0 0x1c008000 0 0x400>;
> +            interrupts = <GIC_SPI 73 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            ports {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +                port@0 {
> +                    reg = <0>;
> +                    csi2rx_in0: endpoint {
> +                        data-lanes = <1 2>;
> +                        remote-endpoint = <&imx219_out0>;
> +                    };
> +                };
> +                port@1 {
> +                    reg = <1>;
> +                    csi2rx_out0: endpoint {
> +                        remote-endpoint = <&csi_in0>;
> +                    };
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart

