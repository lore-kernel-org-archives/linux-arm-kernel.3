Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 15BC6D59F75
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  6 Nov 2024 21:58:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IhKRfDhGVrx+OiuzPY94+zTpKLh1NipoPytgXyaUKdE=; b=ITjbzmPfEDSsCpm1rawPVBhvX0
	SwLKypvMxT5tZPs+gR0nod3XZ1GgacyZInw97/TEGo1r0ALT1JI3AvCz2y/WuPR1nnQCOYQpPf+le
	aZtnwMB55Av4WRFikRKiRvG9+SjFDUH7NHjuE2i9wc5lu0lpCFh+kk9xRw7xEfy8elklNuFEbw6h8
	OnvuFJ6TMZyIfNISnqmkALnPd0pRNUr5ZEXHLkY/Euc3pWkSiaozTNKaOqQklZ9yRO09iNLEouXdC
	TBgo7TFdt+XsL7aQCZ/pVhD7iUKD5TonpkIHMTTbdq5hFGpzFrIY+EKoUeSfXL+GIW4fxSMcqOw4A
	zn+CGk9g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t8o2q-00000004qxu-1eJa;
	Wed, 06 Nov 2024 21:58:32 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t8nz6-00000004qZq-3SYy
	for linux-arm-kernel@lists.infradead.org;
	Wed, 06 Nov 2024 21:54:42 +0000
Received: from pendragon.ideasonboard.com (81-175-209-231.bb.dnainternet.fi [81.175.209.231])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id D014A670;
	Wed,  6 Nov 2024 22:54:29 +0100 (CET)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1730930070;
	bh=vENICEnWjVMqE3gmHs1z3oU013ifba25gIzbAHFqT2w=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Qiq7frHc6wqs7Y6WaQAkle61hlwFJHd2vqhQWPVcCOPNDWyD9mq1rA8yke0EH1A7d
	 1Buid7tZRwDWoaWzetI8D2gbDL3L+FMvSdUH76PViMZpPWTI8dQunCYVEvsTSzi/Do
	 7dwcHh/iW88t8/KUJVHrMAmfgybuQGhoMKIUvgj8=
Date: Wed, 6 Nov 2024 23:54:32 +0200
From: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	robh+dt@kernel.org, mchehab@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
	sakari.ailus@iki.fi
Subject: Re: [PATCH v8 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20241106215432.GG21454@pendragon.ideasonboard.com>
References: <20241106100534.768400-1-dan.scally@ideasonboard.com>
 <20241106100534.768400-6-dan.scally@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106100534.768400-6-dan.scally@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241106_135441_034801_E06189DD 
X-CRM114-Status: GOOD (  26.21  )
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

Hi Dan,

Thank you for the patch.

On Wed, Nov 06, 2024 at 10:05:22AM +0000, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v8:
> 
> 	- Added the video clock back in. Now that we have actual hardware it's
> 	  clear that it's necessary.
> 	- Added reset lines 
> 	- Dropped R-bs
> 
> Changes in v7:
> 
> 	- None
> 
> Changes in v6:
> 
> 	- None
> 
> Changes in v5:
> 
> 	- None
> 
> Changes in v4:
> 
> 	- Switched to port instead of ports
> 
> Changes in v3:
> 
> 	- Dropped the video clock as suggested by Laurent. I didn't retain it
> 	for the purposes of the refcount since this driver will call .s_stream()
> 	for the sensor driver which will refcount the clock anyway.
> 	- Clarified that the port is a parallel input port rather (Sakari)
> 
> Changes in v2:
> 
> 	- Added clocks information
> 	- Fixed the warnings raised by Rob
> 
>  .../bindings/media/arm,mali-c55.yaml          | 82 +++++++++++++++++++
>  1 file changed, 82 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 000000000000..efc88fd2c447
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,82 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/media/arm,mali-c55.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ARM Mali-C55 Image Signal Processor
> +
> +maintainers:
> +  - Daniel Scally <dan.scally@ideasonboard.com>
> +  - Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> +
> +properties:
> +  compatible:
> +    const: arm,mali-c55

I have a feeling we may need to add an SoC-specific compatible string to
support platform-specific integration quirks. Let's see if we will have
a use for that in the RZ/V2H. It can also be addressed later if needed.

> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    items:
> +      - description: ISP Video Clock
> +      - description: ISP AXI clock
> +      - description: ISP AHB-lite clock
> +
> +  clock-names:
> +    items:
> +      - const: vclk
> +      - const: aclk
> +      - const: hclk
> +
> +  resets:
> +    items:
> +      - description: vclk domain reset
> +      - description: aclk domain reset
> +      - description: hclk domain reset
> +
> +  reset-names:
> +    items:
> +      - const: vresetn
> +      - const: aresetn
> +      - const: hresetn
> +
> +  port:
> +    $ref: /schemas/graph.yaml#/properties/port
> +    description: Input parallel video bus

Doesn't the ISP have two input ports, for two exposures ? Depending on
the SoC integration, could they be connected to two different devices,
with the two connections having to be modelled in DT ? Looking at the
changelog you've switched from 'ports' to 'port' in v4, but I think we
should either have two ports right away, or be ready for a second port
later if SoC integrations requires that. That could be a good enough
reason to use 'ports' right away, even with a single port.

> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - port
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    mali_c55: isp@400000 {
> +      compatible = "arm,mali-c55";
> +      reg = <0x400000 0x200000>;
> +      clocks = <&clk 0>, <&clk 1>, <&clk 2>;
> +      clock-names = "vclk", "aclk", "hclk";
> +      resets = <&resets 0>, <&resets 1>, <&resets 2>;
> +      reset-names = "vresetn", "aresetn", "hresetn";
> +      interrupts = <0>;
> +
> +      port {
> +        isp_in: endpoint {
> +            remote-endpoint = <&csi2_rx_out>;
> +        };
> +      };
> +    };
> +...

-- 
Regards,

Laurent Pinchart

