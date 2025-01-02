Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6BFA1E77188
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  2 Jan 2025 09:57:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=M+nNfV05am8p8Wpujlwlk8ouXeCgyv59uKv7H3CM+Xs=; b=SrzsdWSVo+OEv9HTe83a3gMqwt
	XE01p7hiI3w3e29oRZLdmPrqvGy8yFWTEM9HOS45pSV069NpZorBWhBSkxHeEkRDETy7VfNhJdFBE
	sIyFpGjNoQdY1zujxhpEcd5k/w+YqjBOta55o9NSF51zO4KCO42hUEalz9XK7hCGwW1SO4Iobf2Pi
	JV5XltYCSFAmloeZ9qEjVkVGMtlmh89hSx2DcO+v/6dKFGUtw5nS9Z/M9Wtwe7YjplcLM9NjzMlPp
	T27mZ4G3iXJGsWAg8+Mxulu7vkmuz7CxXqphPaTUJnCB7/O5pEXgMRFcN0m/pvTcskq9aIEDdfkNC
	viwi7hnw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHx7-0000000A6O6-1D98;
	Thu, 02 Jan 2025 09:57:17 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tTHvt-0000000A6GL-2qEl
	for linux-arm-kernel@lists.infradead.org;
	Thu, 02 Jan 2025 09:56:03 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id DA94575A;
	Thu,  2 Jan 2025 10:55:11 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1735811712;
	bh=SwKcsYldoVTlPiegaDxvUarCv6o2PSToU5HzUy3D6TA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=vN7C9aQlcBOVibGqhImQTW0YgjW3fNP6LtVD1Sp7FgEGQCE8vvIWTmq8TqO3AQPJu
	 +w2EqvPVvUBaQ5Es3IZqOpQ4gPFfpAii6kRK+jXnuiOigSsnvIdNI8oDvC6wjjoL8p
	 V6mFSjKwH30ky85452xP0lDSq+w3fQ1zD+0gis6E=
Date: Thu, 2 Jan 2025 11:56:00 +0200
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
Subject: Re: [PATCH v12 2/8] dt-bindings: media: platform: visconti: Add
 Toshiba Visconti Video Input Interface
Message-ID: <20250102095600.GE554@pendragon.ideasonboard.com>
References: <20241125092146.1561901-1-yuji2.ishikawa@toshiba.co.jp>
 <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241125092146.1561901-3-yuji2.ishikawa@toshiba.co.jp>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250102_015601_917495_A53EC0AC 
X-CRM114-Status: GOOD (  29.52  )
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

Hi Ishikawa-san,

Thank you for the patch.

On Mon, Nov 25, 2024 at 06:21:40PM +0900, Yuji Ishikawa wrote:
> Adds the Device Tree binding documentation that allows to describe
> the Video Input Interface found in Toshiba Visconti SoCs.
> 
> Signed-off-by: Yuji Ishikawa <yuji2.ishikawa@toshiba.co.jp>
> Reviewed-by: Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> ---
> Changelog v2:
> - no change
> 
> Changelog v3:
> - no change
> 
> Changelog v4:
> - fix style problems at the v3 patch
> - remove "index" member
> - update example
> 
> Changelog v5:
> - no change
> 
> Changelog v6:
> - add register definition of BUS-IF and MPU
> 
> Changelog v7:
> - remove trailing "bindings" from commit header message
> - remove trailing "Device Tree Bindings" from title
> - fix text wrapping of description
> - change compatible to visconti5-viif
> - explicitly define allowed properties for port::endpoint
> 
> Changelog v8:
> - Suggestion from Krzysztof Kozlowski
>   - rename bindings description file
>   - use block style array instead of inline style
>   - remove clock-lane (as it is fixed at position 0)
>   - update sample node's name
>   - use lowercase hex for literals
> - Suggestion from Laurent Pinchart
>   - update description message port::description
>   - remove port::endpoint::bus-type as it is fixed to <4>
>   - remove port::endpoint::clock-lanes from example
>   - add port::endpoint::data-lanes to required parameters list
>   - fix sequence of data-lanes: <1 2 3 4> because current driver does not support data reordering
>   - update port::endpoint::data-lanes::description
>   - remove redundant type definition for port::endpoint::data-lanes
> 
> Changelog v9:
> - place "required" after "properties"
> - dictionary ordering of properties
> 
> Changelog v10:
> - no change
> 
> Changelog v11:
> - no change
> 
> Changelog v12:
> - remove property "clock-noncontinuous" as VIIF switches both modes automatically
> - remove property "link-frequencies" as VIIF does not use the information
> - remove reg[2] and interrupts[3] which are used for CSI2RX driver
> - update example to refer csi2rx for remote-endpoint
> 
>  .../media/toshiba,visconti5-viif.yaml         | 95 +++++++++++++++++++
>  1 file changed, 95 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> new file mode 100644
> index 000000000000..ef0452a47e98
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/toshiba,visconti5-viif.yaml
> @@ -0,0 +1,95 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/toshiba,visconti5-viif.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Toshiba Visconti5 SoC Video Input Interface
> +
> +maintainers:
> +  - Nobuhiro Iwamatsu <nobuhiro1.iwamatsu@toshiba.co.jp>
> +
> +description: |-
> +  Toshiba Visconti5 SoC Video Input Interface (VIIF) receives videostream
> +  from MIPI CSI-2 receiver device, processes the stream with image signal
> +  processors (L1ISP, L2ISP), then stores pictures to main memory.
> +
> +properties:
> +  compatible:
> +    const: toshiba,visconti5-viif
> +
> +  reg:
> +    items:
> +      - description: Registers for capture control
> +      - description: Registers for bus interface unit control
> +      - description: Registers for Memory Protection Unit

I'm a bit surprised by the lack of clocks.

> +
> +  interrupts:
> +    items:
> +      - description: Sync Interrupt
> +      - description: Status (Error) Interrupt
> +      - description: L1ISP Interrupt
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/$defs/port-base
> +    unevaluatedProperties: false
> +    description: CSI-2 input port, with a single endpoint connected to the CSI-2 transmitter.
> +
> +    properties:
> +      endpoint:
> +        $ref: video-interfaces.yaml#
> +        additionalProperties: false
> +
> +        properties:
> +          data-lanes:
> +            description: VIIF supports 1, 2, 3 or 4 data lanes
> +            minItems: 1
> +            items:
> +              - const: 1
> +              - const: 2
> +              - const: 3
> +              - const: 4

Now that the CSI-2 receiver is modeled as a separate DT node, I don't
think data-lanes is applicable anymore. The interface between the CSI-2
receiver and the VIIF isn't a CSI-2 bus.

I think you can simplify the bindings by switching from port-base to
port, as you don't need to specify additional properties for the
endpoint:

  port:
    $ref: /schemas/graph.yaml#/$defs/port
    description:
      CSI-2 input port, with a single endpoint connected to the CSI-2
      transmitter.

Please test this though (by running the DT bindings checks).

> +
> +          remote-endpoint: true
> +
> +        required:
> +          - data-lanes
> +          - remote-endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - port
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
> +        video@1c000000 {
> +            compatible = "toshiba,visconti5-viif";
> +            reg = <0 0x1c000000 0 0x6000>,
> +                  <0 0x1c00e000 0 0x1000>,
> +                  <0 0x2417a000 0 0x1000>;
> +            interrupts = <GIC_SPI 64 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 67 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 76 IRQ_TYPE_LEVEL_HIGH>;
> +
> +            port {
> +                #address-cells = <1>;
> +                #size-cells = <0>;
> +
> +                csi_in0: endpoint {
> +                    data-lanes = <1 2>;
> +                    remote-endpoint = <&csi2rx_out0>;
> +                };
> +            };
> +        };
> +    };

-- 
Regards,

Laurent Pinchart

