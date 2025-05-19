Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6F21AC2D0CD
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 19 May 2025 17:22:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=a8SX6Xb6eW0zoOWxoW64STLwWdAUaInEUtVSr+SNtVo=; b=38wGcg236nojcWXmXV9GgxS6w8
	UYH3zHo3shCxrOYnxegbvDUYzCN7CukFU1ptrMsLZWOdIJWLpJeK1mUuHP3Sw/OXaQST2UzeCxjg7
	/AfqMfQgWn3v+EsjWWQHyP6JY4uqMVri8/X7G4ag+Z02LhxlruMTpG6pZ7zMoaMJtAvGaXJZSpyTb
	6q1sOjY5kJf/oMQQwKolq1o4xwy6HXNKQHynGu9fQkXt9h/g8o9H0Uuq2a6LsPAYSxwXb8uWlcAL1
	crKoGtVcMmg53GEUt7NmLvHFbhOAgTOaMnAwEIOQMA7D2rr/FcJXUxb8XveQrB3oxteIHCtet7jyg
	TKkwF6uQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH4C3-00000009xDR-2aev;
	Mon, 19 May 2025 17:22:27 +0000
Received: from perceval.ideasonboard.com ([213.167.242.64])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uH1fy-00000009TYN-3yeY
	for linux-arm-kernel@lists.infradead.org;
	Mon, 19 May 2025 14:41:12 +0000
Received: from [192.168.0.43] (cpc141996-chfd3-2-0-cust928.12-3.cable.virginm.net [86.13.91.161])
	by perceval.ideasonboard.com (Postfix) with ESMTPSA id 36AD583D;
	Mon, 19 May 2025 16:40:49 +0200 (CEST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=ideasonboard.com;
	s=mail; t=1747665649;
	bh=+lCGecU6UroS0g1mRkv7CvKzSIbxkoQqwVoanzua238=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=u1p4ZpKhZ9iLv6NL/348fqsCJHcPbh0K63UKoX5y7fSOL0Yw/ZFYucYKniCQGQ8dD
	 1u4sRUDwA8r37xSg4wZeoEAeCcyPqZ2gJMtESVLI7qM3YcaIJ6IyV3cHxZslWlo3E6
	 Gjci4zevqUjptXRvCGYScNZ1BrAC2MY1gyE1pdng=
Message-ID: <ec426754-0277-4272-80ac-a5ed1d95a6bb@ideasonboard.com>
Date: Mon, 19 May 2025 15:41:06 +0100
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v9 05/17] dt-bindings: media: Add bindings for ARM
 mali-c55
To: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>,
 Laurent Pinchart <laurent.pinchart@ideasonboard.com>
Cc: Anthony.McGivern@arm.com, jacopo.mondi@ideasonboard.com,
 nayden.kanchev@arm.com, robh+dt@kernel.org, mchehab@kernel.org,
 krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
 jerome.forissier@linaro.org, kieran.bingham@ideasonboard.com,
 sakari.ailus@iki.fi, linux-media@vger.kernel.org,
 devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org
References: <20250519143409.451100-1-dan.scally@ideasonboard.com>
 <20250519143409.451100-6-dan.scally@ideasonboard.com>
Content-Language: en-US
From: Dan Scally <dan.scally@ideasonboard.com>
Autocrypt: addr=dan.scally@ideasonboard.com; keydata=
 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
In-Reply-To: <20250519143409.451100-6-dan.scally@ideasonboard.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250519_074111_133073_42BAFAC7 
X-CRM114-Status: GOOD (  21.13  )
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

Hi Krzysztof, Laurent

On 19/05/2025 15:33, Daniel Scally wrote:
> Add the yaml binding for ARM's Mali-C55 Image Signal Processor.
>
> Reviewed-by: Laurent Pinchart <laurent.pinchart@ideasonboard.com>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Acked-by: Nayden Kanchev <nayden.kanchev@arm.com>
> Co-developed-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Jacopo Mondi <jacopo.mondi@ideasonboard.com>
> Signed-off-by: Daniel Scally <dan.scally@ideasonboard.com>
> ---
> Changes in v9:
>
> 	- Added the arm,inline_mode property to differentiate between inline and
> 	  memory input configurations

I just wanted to specifically highlight that I made the change above, as I kept your R-b tags and I 
didn't want it to go unnoticed


Thanks

Dan

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
>
>   .../bindings/media/arm,mali-c55.yaml          | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100644 Documentation/devicetree/bindings/media/arm,mali-c55.yaml
>
> diff --git a/Documentation/devicetree/bindings/media/arm,mali-c55.yaml b/Documentation/devicetree/bindings/media/arm,mali-c55.yaml
> new file mode 100644
> index 000000000000..539fa8163bd0
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

