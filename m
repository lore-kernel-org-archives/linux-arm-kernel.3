Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0FD8CC83F17
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 23 Jul 2025 05:06:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Gbtt60PGwmO59soLlUcJpi8t7rKj2cyeP/n/zoRS0Rw=; b=Oxm4fgg2g/gpBBdVJcBTcbqBwC
	SjrDfSqO+ttXGeioiaZswCg30Hax2wF1F/0zkoRITm88LtpuCCtDsyxFSR88whzhAshkC0AQHdh2a
	StsuwIOudTVRoZQBrGkwYrCwuEkFqqLzDJ5L/cmRcSa2zi+2+Ypt90W79ZS4JT8NzSp+1sZVUh9gs
	nICWrwld1B6DX3Cw5z3KziMcaY1ufbKbmeBU/ur4YDgNPd1aC8DixaLP7lRLFRjjyhGGZcQSiuV9E
	JddRuNnJrJb2W2/YFFDsD0zT5UMoghX33VsnW3s7BkRj8pmzxYOSMsmpzMInseV6d9Cn+mxIWUKw8
	HOEcj+ZA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRg9-0000000424j-3tj9;
	Wed, 23 Jul 2025 05:06:09 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ueRbW-000000041is-1YDf
	for linux-arm-kernel@lists.infradead.org;
	Wed, 23 Jul 2025 05:01:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FC1A46424;
	Wed, 23 Jul 2025 05:01:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4F254C4AF0D;
	Wed, 23 Jul 2025 05:01:21 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1753246881;
	bh=nr7OfTTQrE+gjAhHnV5WWfzbsPjiUAEdRwGAk43q3eI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cuhHmj/h/2uh5LXRhhsVjfjHHrUKXBRdr1z0kVTGl5x5086/1ix8pOobaIalqgpJ1
	 QurkgEcQj7LUZm0AxLoRw41hSmyTi8lFTTzTFDd9YIXxmzJVI15dAb8bNQoxhmQYgq
	 lJultjtbR/SxGDiif4Tqif7W/JkFpDibILCFduZdUyJDdnvzYjvikEbz7Z1ru1pjMT
	 0PmppaUR2/N7waKD5LLo0J/+tTlb4J9Fg5QH7QM8HL3bELgdtqUosctWrDb/ydLR4p
	 bAyr0qJBwVBEHJEw8AjUctRr0K3vnl9vZzdiDAecVQWBJ7p3CrDoHvEOCkdtxnMGrt
	 9Ttx035BFu5lQ==
Date: Wed, 23 Jul 2025 00:01:20 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	Kevin Chen <kevin_chen@aspeedtech.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v3 1/2] dt-bindings: interrupt-controller: aspeed: Add
 parent node compatibles and refine documentation
Message-ID: <20250723050120.GA1231854-robh@kernel.org>
References: <20250722095156.1672873-1-ryan_chen@aspeedtech.com>
 <20250722095156.1672873-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250722095156.1672873-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250722_220122_460418_1B3B873D 
X-CRM114-Status: GOOD (  30.57  )
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

On Tue, Jul 22, 2025 at 05:51:55PM +0800, Ryan Chen wrote:
> The AST2700 SoC contains two independent top-level interrupt controllers
> (INTC0 and INTC1), each responsible for handling different peripheral
> groups and occupying separate register spaces. Above them, PSP(CA35) GIC
> controller acts as the root interrupt aggregator. Accurately describing
> this hierarchical hardware structure in the device tree requires distinct
> compatible strings for the parent nodes of INTC0 and INTC1.
> 
> - Adds 'aspeed,ast2700-intc0' and 'aspeed,ast2700-intc1' compatible
>  strings for parent interrupt controller nodes. (in addition to the
>  existing 'aspeed,ast2700-intc-ic' for child nodes)
> - Clarifies the relationship and function of INTC0 parent
>  (intc0_0~x: child), INTC1 parent (intc1_0~x: child), and the GIC
>  in the documentation.
> - Updates block diagrams and device tree examples to illustrate
>  the hierarchy and compatible usage.
> - Refines documentation and example formatting.
> 
> This change allows the device tree and driver to distinguish between
> parent (top-level) and child (group) interrupt controller nodes,
> enabling more precise driver matching SOC register space allocation.

That's nice, but is an ABI break.

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2700-intc.yaml                  | 158 +++++++++++++-----
>  1 file changed, 115 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> index 55636d06a674..bdc4d8835843 100644
> --- a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> @@ -10,6 +10,33 @@ description:
>    This interrupt controller hardware is second level interrupt controller that
>    is hooked to a parent interrupt controller. It's useful to combine multiple
>    interrupt sources into 1 interrupt to parent interrupt controller.
> +  Depend to which INTC0 or INTC1 used.
> +  INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
> +  status registers for use.
> +  INTC0 is used to assert GIC if interrupt in INTC1 asserted.
> +  INTC1 is used to assert INTC0 if interrupt of modules asserted.
> +  +-----+   +---------+
> +  | GIC |---|  INTC0  |
> +  +-----+   +---------+
> +            +---------+
> +            |         |---module0
> +            | INTC0_0 |---module1
> +            |         |---...
> +            +---------+---module31
> +            |---....  |
> +            +---------+
> +            |         |     +---------+
> +            | INTC0_11| +---| INTC1   |
> +            |         |     +---------+
> +            +---------+     +---------+---module0
> +                            | INTC1_0 |---module1
> +                            |         |---...
> +                            +---------+---module31
> +                            ...
> +                            +---------+---module0
> +                            | INTC1_5 |---module1
> +                            |         |---...
> +                            +---------+---module31
>  
>  maintainers:
>    - Kevin Chen <kevin_chen@aspeedtech.com>
> @@ -17,49 +44,70 @@ maintainers:
>  properties:
>    compatible:
>      enum:
> -      - aspeed,ast2700-intc-ic
> +      - aspeed,ast2700-intc0
> +      - aspeed,ast2700-intc1
>  
>    reg:
>      maxItems: 1
>  
> -  interrupt-controller: true
> +  '#address-cells':
> +    const: 2
>  
> -  '#interrupt-cells':
> +  '#size-cells':
>      const: 2
> -    description:
> -      The first cell is the IRQ number, the second cell is the trigger
> -      type as defined in interrupt.txt in this directory.
> -
> -  interrupts:
> -    maxItems: 6
> -    description: |
> -      Depend to which INTC0 or INTC1 used.
> -      INTC0 and INTC1 are two kinds of interrupt controller with enable and raw
> -      status registers for use.
> -      INTC0 is used to assert GIC if interrupt in INTC1 asserted.
> -      INTC1 is used to assert INTC0 if interrupt of modules asserted.
> -      +-----+   +-------+     +---------+---module0
> -      | GIC |---| INTC0 |--+--| INTC1_0 |---module2
> -      |     |   |       |  |  |         |---...
> -      +-----+   +-------+  |  +---------+---module31
> -                           |
> -                           |   +---------+---module0
> -                           +---| INTC1_1 |---module2
> -                           |   |         |---...
> -                           |   +---------+---module31
> -                          ...
> -                           |   +---------+---module0
> -                           +---| INTC1_5 |---module2
> -                               |         |---...
> -                               +---------+---module31
>  
> +  ranges: true
> +
> +patternProperties:
> +  "^interrupt-controller@":
> +    type: object
> +    description: Interrupt group child nodes
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - aspeed,ast2700-intc-ic
> +
> +      reg:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      '#interrupt-cells':
> +        const: 2
> +        description: |

Don't need '|'.

> +          The first cell is the IRQ number, the second cell is the trigger
> +          type as defined in interrupt.txt in this directory.

Don't add links to legacy documents.

> +
> +      interrupts:
> +        minItems: 1
> +        maxItems: 6
> +        description: |
> +          The interrupts provided by this interrupt controller.
> +
> +      interrupts-extended:

Why do you have both interrupts and interrupts-extended? They are 
mutually exclusive and both are auto-magically supported. The schemas 
only have to document 'interrupts'.

> +        minItems: 1
> +        maxItems: 6
> +        description: |
> +          This property is required when defining a cascaded interrupt controller
> +          that is connected under another interrupt controller. It specifies the
> +          parent interrupt(s) in the upstream controller to which this controller
> +          is connected.
> +
> +    oneOf:
> +      - required: [interrupts]
> +      - required: [interrupts-extended]
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupt-controller
> +      - '#interrupt-cells'
>  
>  required:
>    - compatible
>    - reg
> -  - interrupt-controller
> -  - '#interrupt-cells'
> -  - interrupts
>  
>  additionalProperties: false
>  
> @@ -68,19 +116,43 @@ examples:
>      #include <dt-bindings/interrupt-controller/arm-gic.h>
>  
>      bus {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +
> +      intc0: interrupt-controller@12100000 {

This node isn't an interrupt-controller.

> +        compatible = "aspeed,ast2700-intc0";
> +        reg = <0 0x12100000 0 0x4000>;
> +        ranges = <0x0 0x0 0x0 0x12100000 0x0 0x4000>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        intc0_11: interrupt-controller@1b00 {
> +          compatible = "aspeed,ast2700-intc-ic";
> +          reg = <0 0x12101b00 0 0x10>;
> +          #interrupt-cells = <2>;
> +          interrupt-controller;
> +          interrupts = <GIC_SPI 192 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 193 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 194 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 195 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 196 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>,
> +                       <GIC_SPI 197 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
> +        };
> +      };
> +
> +      intc1: interrupt-controller@14c18000 {
> +        compatible = "aspeed,ast2700-intc1";
> +        reg = <0 0x14c18000 0 0x400>;
> +        ranges = <0x0 0x0 0x0 0x14c18000 0x0 0x400>;
>          #address-cells = <2>;
>          #size-cells = <2>;
>  
> -        interrupt-controller@12101b00 {
> -            compatible = "aspeed,ast2700-intc-ic";
> -            reg = <0 0x12101b00 0 0x10>;
> -            #interrupt-cells = <2>;
> -            interrupt-controller;
> -            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> -                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>;
> +        intc1_0: interrupt-controller@100 {
> +          compatible = "aspeed,ast2700-intc-ic";
> +          reg = <0x0 0x100 0x0 0x10>;
> +          #interrupt-cells = <2>;
> +          interrupt-controller;
> +          interrupts-extended = <&intc0_11 0 (GIC_CPU_MASK_SIMPLE(4) | IRQ_TYPE_LEVEL_HIGH)>;
>          };
> +      };
>      };
> -- 
> 2.34.1
> 

