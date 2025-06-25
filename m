Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 572C6C77B7C
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Jun 2025 03:30:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b1p84M9OEblyTnUDp7nOVwe418QLUEnyQ8pLOmNmdsw=; b=oI847i5XRkZbw3Uls4WdYHU92l
	QDW9SOIx/FfWMsMo4eLaY4rEUlHiq7EPewprChEwceHjZt3o45InrNT20u5iKXdCrCbtBpuizAB0i
	5o+YqkRtFbrEoUAdWHBEFDUPS0idnPxQnfy61DaTv5sLky7gJUijCQ61/x1CvAzwUJhZjonl3PDPl
	dFpUP8GVigeOo+j2JAUZPuIC9IeyrHBJo3n4JyrshYcv8EEOuZ4WQiwIWa7JbMf/rtdA+hJvF+v5j
	bd3vwaIaMo39kPXwu565SJPV7E/CaHOeT4RW29mGa0Rcornu8PEhpsjPu6rKcEPkUTX4wDyyI9/TK
	Ndboxe0A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGqL-00000007P5i-0Dlx;
	Wed, 25 Jun 2025 03:30:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uUGmx-00000007OvP-2GE5
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Jun 2025 03:27:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 89EEB5C025F;
	Wed, 25 Jun 2025 03:24:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 8E88EC4CEE3;
	Wed, 25 Jun 2025 03:27:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1750822025;
	bh=g8yJbDRU3cigldhY2jqAOJeXToTfsEDC/4DEmKLPWWE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=o2daXyu1mjcbU+WNa1Hiu8jmZ3UJdwfSQU96P8Zd2FSxQnnGPdN0LjmXFDnswdIb9
	 S04xiCXepWjrXqkU4SlgUejuciGOrrFoAe6lKClL+DqaVUOvgtwuHmEDuiVITGc95U
	 R4dUheblRKk172WbPW4bbuNXSABw7yWyf6Mqyo+MFHDK3npR0gPHmclnWxO3lYlg/m
	 2ANBAWl4y+dCe/rbzM0xxwDt/NIikHQbdwaDtqOUadQGVWuHah+btzObG55/Wl1fp/
	 jcIyp0wcD70eLgmlyiF9jHmV98kumRqBdzRrLEUtpamzvf/h9212ex4grqMwT7MBxh
	 uR9Il1AAbY0Pw==
Date: Tue, 24 Jun 2025 22:27:04 -0500
From: Rob Herring <robh@kernel.org>
To: Daniel Scally <dan.scally@ideasonboard.com>
Cc: linux-media@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, Anthony.McGivern@arm.com,
	jacopo.mondi@ideasonboard.com, nayden.kanchev@arm.com,
	mchehab@kernel.org, krzysztof.kozlowski+dt@linaro.org,
	conor+dt@kernel.org, jerome.forissier@linaro.org,
	kieran.bingham@ideasonboard.com, laurent.pinchart@ideasonboard.com,
	Sakari Ailus <sakari.ailus@linux.intel.com>,
	Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
Subject: Re: [PATCH v10 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
Message-ID: <20250625032704.GA2501351-robh@kernel.org>
References: <20250624-c55-v10-0-54f3d4196990@ideasonboard.com>
 <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250624-c55-v10-5-54f3d4196990@ideasonboard.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250624_202707_659603_A8A4A30C 
X-CRM114-Status: GOOD (  23.48  )
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

On Tue, Jun 24, 2025 at 11:21:18AM +0100, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
> 
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v10:
> 
> 	- None
> 
> Changes in v9:
> 
> 	- Added the arm,inline_mode property to differentiate between inline and
> 	  memory input configurations
> 
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
> ---
>  .../devicetree/bindings/media/arm,mali-c55.yaml    | 89 ++++++++++++++++++++++
>  1 file changed, 89 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..539fa8163bd07cf8a80c361012400cbcc7d073eb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> @@ -0,0 +1,89 @@
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
> +
> +    properties:
> +      endpoint:
> +        $ref: /schemas/graph.yaml#/properties/endpoint
> +
> +  arm,inline_mode:

arm,inline-mode

> +    description:
> +      The ISP can be either electrically connected to sensor and CSI-2 receiver
> +      or driven through a DMA input device. This property declares the ISP as
> +      being electrically connected to the source of image data.
> +    type: boolean
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

Drop unused labels.

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
> 
> -- 
> 2.34.1
> 

