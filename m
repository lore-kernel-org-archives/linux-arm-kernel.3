Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 687CDF357D5
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 25 Feb 2026 10:22:55 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=HVT+ZSx7T4oPrgmiv2YvZmR/BfC8GcMEfeGXA5dhKEo=; b=mbjVJesdgXFWZWfubrX702Dy4l
	I2mLgf846L0+B4XJJdVU4kTTcqFy++lhWipFhAmSDYY6ntwjVsf/h5yKbIbB2Jnhgyj2KzhKlB3dX
	hnBTuunLxTh6f+5Wa+4ltp1gwEVgtH1Lxj6d/jA1Zy6x9L2lyBH5aijNdhEWuekA2IcArJeuPKjBm
	svTwmvdBTTb9pHzcAnmehL0nqSM4PEM+Aw6T4LC/RMrfn6D5rzqq0S+QEGJYUMlvMvk7QWMOjZ98W
	yvmbO55Qk6i9z2vX6NirfYcRvSJVbZtn7sX5afl3QIiqezUVFCIsgNccCjvz2oXr83HZJol7ikXsv
	1Q4UN0+A==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC2a-00000003lcS-3Dwo;
	Wed, 25 Feb 2026 10:22:48 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vvC2Z-00000003lcH-2vO8
	for linux-arm-kernel@lists.infradead.org;
	Wed, 25 Feb 2026 10:22:47 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id CD8D060053;
	Wed, 25 Feb 2026 10:22:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D3937C116D0;
	Wed, 25 Feb 2026 10:22:45 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772014966;
	bh=m8Npz5IATdXMAbbfXgeZWqeu8QwnEwLElv4fs71BWes=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=hUXCSxmcI4NdgFuO9hQuq7Nggs53GCTwhopJGsfRKKs7h6evOZq3AOh4WiU4eo5pQ
	 GUAswkyEYS5jlQqrghlzGIVqfUn+8efZUcWvb2auSYN/0f//5xn7X/l6k8nJtfL0db
	 3LxMQbZYeOL4bS+7ndEoN5Nlo3RICVJfn75rJnUKz01KiuxL90bt9Hil7l60MbFjEY
	 iMb0BC2lAmcvlDrRcXQXcdl21aZR49mP8bu62MpJSyqzK26t2t/8i6VQeBji+eDEqK
	 uc39RYVKFoL0Ip5yh6qMc/KExjgqhFGgvOD/aI3rLo93jmNC5f1oLEl+M+0x+8zOs2
	 3I8ivBz9xpgTg==
Date: Wed, 25 Feb 2026 11:22:43 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Abin Joseph <abin.joseph@amd.com>
Cc: vkoul@kernel.org, Frank.Li@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, michal.simek@amd.com, 
	radhey.shyam.pandey@amd.com, git@amd.com, dmaengine@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH v2] dt-bindings: dmaengine: xlnx,axi-dma: Convert
 bindings into yaml
Message-ID: <20260225-cerise-oryx-of-pluck-8e2f30@quoll>
References: <20260225050521.160724-1-abin.joseph@amd.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260225050521.160724-1-abin.joseph@amd.com>
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

On Wed, Feb 25, 2026 at 10:35:21AM +0530, Abin Joseph wrote:
> Convert the bindings document for Xilinx DMA from txt to yaml.
> No changes to existing binding description.
> 
> Signed-off-by: Abin Joseph <abin.joseph@amd.com>
> ---
> 
> v2:
> -> Add examples for each compatible

No, why? We did not ask for that and (see writing schema) we ask for one
example, more only if they are different.


...


> +properties:
> +  compatible:
> +    enum:
> +      - xlnx,axi-cdma-1.00.a
> +      - xlnx,axi-dma-1.00.a
> +      - xlnx,axi-mcdma-1.00.a
> +      - xlnx,axi-vdma-1.00.a
> +
> +  reg:
> +    maxItems: 1
> +
> +  "#dma-cells":
> +    const: 1
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 1
> +
> +  interrupts:
> +    items:
> +      - description: Interrupt for single channel (MM2S or S2MM)
> +      - description: Interrupt for dual channel configuration
> +    minItems: 1
> +    description:
> +      Interrupt lines for the DMA controller. Only used when
> +      xlnx,axistream-connected is present (DMA connected to AXI Stream
> +      IP). When child dma-channel nodes are present, interrupts are
> +      specified in the child nodes instead.
> +
> +  clocks:
> +    minItems: 1
> +    maxItems: 5
> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 5
> +
> +  dma-ranges: true
> +
> +  xlnx,addrwidth:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    enum: [32, 64]
> +    description: The DMA addressing size in bits.
> +
> +  xlnx,num-fstores:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 1
> +    maximum: 32
> +    description: Should be the number of framebuffers as configured in h/w.
> +
> +  xlnx,flush-fsync:
> +    type: boolean
> +    description: Tells which channel to Flush on Frame sync.
> +
> +  xlnx,sg-length-width:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 8
> +    maximum: 26
> +    default: 23
> +    description:
> +      Width in bits of the length register as configured in hardware.
> +
> +  xlnx,irq-delay:
> +    $ref: /schemas/types.yaml#/definitions/uint32
> +    minimum: 0
> +    maximum: 255
> +    description:
> +      Tells the interrupt delay timeout value. Valid range is from 0-255.
> +      Setting this value to zero disables the delay timer interrupt.
> +      1 timeout interval = 125 * clock period of SG clock.
> +
> +  xlnx,axistream-connected:
> +    type: boolean
> +    description: Tells whether DMA is connected to AXI stream IP.
> +
> +patternProperties:
> +  "^dma-channel(-mm2s|-s2mm)?$":
> +    type: object
> +    description:
> +      Should have at least one channel and can have up to two channels per
> +      device. This node specifies the properties of each DMA channel.
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - xlnx,axi-vdma-mm2s-channel
> +          - xlnx,axi-vdma-s2mm-channel
> +          - xlnx,axi-cdma-channel
> +          - xlnx,axi-dma-mm2s-channel
> +          - xlnx,axi-dma-s2mm-channel
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      xlnx,datawidth:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        enum: [32, 64, 128, 256, 512, 1024]
> +        description: Should contain the stream data width, take values {32,64...1024}.
> +
> +      xlnx,include-dre:
> +        type: boolean
> +        description: Tells hardware is configured for Data Realignment Engine.
> +
> +      xlnx,genlock-mode:
> +        type: boolean
> +        description: Tells Genlock synchronization is enabled/disabled in hardware.
> +
> +      xlnx,enable-vert-flip:
> +        type: boolean
> +        description:
> +          Tells vertical flip is enabled/disabled in hardware(S2MM path).
> +
> +      dma-channels:
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        description: Number of dma channels in child node.
> +
> +    required:
> +      - compatible
> +      - interrupts
> +      - xlnx,datawidth
> +
> +    additionalProperties: false
> +
> +allOf:
> +  - $ref: ../dma-controller.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,axi-vdma-1.00.a
> +    then:
> +      properties:
> +        clock-names:
> +          contains:
> +            const: s_axi_lite_aclk

This is REALLY unexpected syntax. You are supposed to have strictly
ordered list - why do you need need it to be so flexible? And if element
is required it should be the first item. There is no single DTS even
mentioning it!

> +          items:
> +            enum:
> +              - s_axi_lite_aclk
> +              - m_axi_mm2s_aclk
> +              - m_axi_s2mm_aclk
> +              - m_axis_mm2s_aclk
> +              - s_axis_s2mm_aclk
> +          minItems: 1
> +          maxItems: 5
> +      patternProperties:
> +        "^dma-channel(-mm2s|-s2mm)?$":
> +          properties:
> +            compatible:
> +              enum:
> +                - xlnx,axi-vdma-mm2s-channel
> +                - xlnx,axi-vdma-s2mm-channel
> +      required:
> +        - xlnx,num-fstores
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: xlnx,axi-cdma-1.00.a
> +    then:
> +      properties:
> +        clock-names:
> +          items:
> +            - const: s_axi_lite_aclk
> +            - const: m_axi_aclk
> +      patternProperties:
> +        "^dma-channel(-mm2s|-s2mm)?$":
> +          properties:
> +            compatible:
> +              enum:
> +                - xlnx,axi-cdma-channel
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,axi-dma-1.00.a
> +              - xlnx,axi-mcdma-1.00.a
> +    then:
> +      properties:
> +        clock-names:
> +          contains:
> +            const: s_axi_lite_aclk

Why do you need this?

> +          items:
> +            enum:
> +              - s_axi_lite_aclk
> +              - m_axi_mm2s_aclk
> +              - m_axi_s2mm_aclk
> +              - m_axi_sg_aclk

Why this cannot be ordered list like we expect (see writing bindings)?


> +          minItems: 1
> +          maxItems: 4
> +      patternProperties:
> +        "^dma-channel(-mm2s|-s2mm)?(@[0-9a-f]+)?$":
> +          properties:
> +            compatible:
> +              enum:
> +                - xlnx,axi-dma-mm2s-channel
> +                - xlnx,axi-dma-s2mm-channel
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - xlnx,axi-cdma-1.00.a
> +              - xlnx,axi-mcdma-1.00.a
> +              - xlnx,axi-dma-1.00.a
> +    then:
> +      properties:
> +        interrupts: false

Why interrupts are flexible in other case?

This should be probably squashed in each of previous if:then:.


> +
> +required:
> +  - "#dma-cells"
> +  - reg
> +  - xlnx,addrwidth
> +  - dma-ranges
> +  - clocks
> +  - clock-names
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dma-controller@40030000 {
> +        compatible = "xlnx,axi-vdma-1.00.a";
> +        #dma-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        reg = <0x40030000 0x10000>;
> +        dma-ranges = <0x0 0x0 0x40000000>;
> +        xlnx,num-fstores = <8>;
> +        xlnx,flush-fsync;
> +        xlnx,addrwidth = <32>;
> +        clocks = <&clk 0>, <&clk 1>, <&clk 2>, <&clk 3>, <&clk 4>;
> +        clock-names = "s_axi_lite_aclk", "m_axi_mm2s_aclk",
> +                      "m_axi_s2mm_aclk", "m_axis_mm2s_aclk",
> +                      "s_axis_s2mm_aclk";
> +
> +        dma-channel-mm2s {
> +            compatible = "xlnx,axi-vdma-mm2s-channel";
> +            interrupts = <GIC_SPI 54 IRQ_TYPE_LEVEL_HIGH>;
> +            xlnx,datawidth = <64>;
> +        };
> +
> +        dma-channel-s2mm {
> +            compatible = "xlnx,axi-vdma-s2mm-channel";
> +            interrupts = <GIC_SPI 53 IRQ_TYPE_LEVEL_HIGH>;
> +            xlnx,datawidth = <64>;
> +        };
> +    };
> +
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    dma-controller@a4030000 {
> +        compatible = "xlnx,axi-dma-1.00.a";
> +        #dma-cells = <1>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        reg = <0xa4030000 0x10000>;
> +        dma-ranges = <0x0 0x0 0x40000000>;
> +        xlnx,addrwidth = <32>;
> +        xlnx,sg-length-width = <14>;
> +        clocks = <&clk 0>, <&clk 1>, <&clk 2>, <&clk 3>;
> +        clock-names = "s_axi_lite_aclk", "m_axi_mm2s_aclk",
> +                      "m_axi_s2mm_aclk", "m_axi_sg_aclk";
> +
> +        dma-channel-mm2s {
> +            compatible = "xlnx,axi-dma-mm2s-channel";
> +            interrupts = <GIC_SPI 86 IRQ_TYPE_LEVEL_HIGH>;
> +            xlnx,datawidth = <64>;
> +            xlnx,include-dre;
> +        };
> +
> +        dma-channel-s2mm {
> +            compatible = "xlnx,axi-dma-s2mm-channel";
> +            interrupts = <GIC_SPI 87 IRQ_TYPE_LEVEL_HIGH>;
> +            xlnx,datawidth = <64>;
> +            xlnx,include-dre;
> +        };
> +    };
> +

Drop all examples past this point.

Best regards,
Krzysztof


