Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 153C0CCD1BB
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 22 Oct 2025 13:51:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=AtDTc9ulEAs5EgCCeHyumoKPEYQQBoBgDLjN+7M6X3w=; b=0dk/QjhtxWrH84sCV16hFSRga8
	lvai57y7Ilz+fmtacq/YIWoIcCzZ/PtDoZMiAVJFigwgbpkFEuaFrJX7/u2fDkjn1WE4TJCXCnFKP
	jGcFoeDMHdmx5Oi8zU3XcZu4Sl6w+Ta1dbeCrGD0YK+/hG3jvXv2U7XhwnAnCRW9lRYkaC1MEXtb7
	ujbTRQNms9APBwTfaaOXiA2ONcy9k0QMnkBhgEuQ8Y3vanHQHeHAG27h3vCGNDG/OlCk+6OzZMQ3d
	PhMhXl2dxDmwgQSkl9ORd4MnFryhQgrfW4tQodglJYhk0Fle93Mhqg/OTlQdGfpbObbadOBR8sZcC
	0Y46LZLQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZF5-0000000365r-2Nj5;
	Wed, 22 Oct 2025 13:51:07 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vBZF2-0000000364z-0iyh
	for linux-arm-kernel@lists.infradead.org;
	Wed, 22 Oct 2025 13:51:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 95621602EE;
	Wed, 22 Oct 2025 13:51:03 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 089FFC4CEE7;
	Wed, 22 Oct 2025 13:51:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1761141063;
	bh=Rpb1fxIgPELCh+dgDZI2maIQUBucGAUYh2YiqPjgSHg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=H/rrnTIKtylDAqUvpgE+ID+wpERQf3+u9yMq2XxfY09sTDL1jN+xGw2vdltmMojXE
	 fZkbncDdJK9HWWrc5WUBmbEEntW/O8C+v2ImWSCUCOfcC09zvrtlpl3DVRT6MwHURB
	 H0lS0TTqul2FxNR5LafiRzAh5tm4R0/btDUU7dx8BVySISmZbQbhGdbXvNvbMEXFnQ
	 iSjPpDbge01TqilEMFv8mxav1QNrNveMRgn8aUiwbORwpcZJ7vzW4rDMNLlqobEkiY
	 wrPzqp0vpLOp7sgTsjm0V+91rv3ZrpcnWbG7upqSqo1VhQkvtitL4lwGTutT2zybtR
	 Hj5HIbFnXa6xQ==
Date: Wed, 22 Oct 2025 08:51:01 -0500
From: Rob Herring <robh@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	jk@codeconstruct.com.au, Kevin Chen <kevin_chen@aspeedtech.com>,
	linux-kernel@vger.kernel.org, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v5 1/3] dt-bindings: interrupt-controller:
 aspeed,ast2700: Add support for INTC hierarchy
Message-ID: <20251022135101.GA3349934-robh@kernel.org>
References: <20251022065507.1152071-1-ryan_chen@aspeedtech.com>
 <20251022065507.1152071-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251022065507.1152071-2-ryan_chen@aspeedtech.com>
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

On Wed, Oct 22, 2025 at 02:55:05PM +0800, Ryan Chen wrote:
> AST2700 contains two-level interrupt controllers (INTC0 and INTC1),
> each with its own register space and handling different sets of
> peripherals.

This is a mess!

How does this relate to the existing "aspeed,ast2700-intc-ic"? Its 
schema has a block diagram of connections which I can understand. This 
does not.

The use of child nodes here is questionable. A variable number of 
interrupt banks is not a reason to have child nodes. I'm only guessing 
that's what's happening here because you haven't explained it.

> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2700-intc0.yaml                 | 97 +++++++++++++++++++
>  .../aspeed,ast2700-intc1.yaml                 | 94 ++++++++++++++++++
>  2 files changed, 191 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml
>  create mode 100644 Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml
> new file mode 100644
> index 000000000000..93a5b142b0a2
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc0.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc0.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +title: ASPEED AST2700 Interrupt Controller 0
> +
> +description:
> +  This interrupt controller hardware is first level interrupt controller that
> +  is hooked to the GIC interrupt controller. It's useful to combine multiple
> +  interrupt sources into 1 interrupt to GIC interrupt controller.
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-intc0
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^interrupt-controller@":
> +    type: object
> +    description: A child interrupt controller node
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - aspeed,ast2700-intc0-ic
> +
> +      reg:
> +        maxItems: 1
> +
> +      '#interrupt-cells':
> +        const: 1
> +
> +      interrupt-controller: true
> +
> +      interrupts:
> +        minItems: 1
> +        maxItems: 10

What are the 10 different interrupts? You have to define what each one 
is.

> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupt-controller
> +      - '#interrupt-cells'
> +      - interrupts
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    intc0: interrupt-controller@12100000 {

This node is not an interrupt-controller.

> +        compatible = "aspeed,ast2700-intc0";
> +        reg = <0x12100000 0x4000>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x12100000 0x4000>;
> +
> +        intc0_11: interrupt-controller@1b00 {
> +            #interrupt-cells = <1>;
> +            interrupt-controller;
> +            compatible = "aspeed,ast2700-intc0-ic";
> +            reg = <0x1b00 0x10>;
> +            interrupts = <GIC_SPI 192 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 193 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 194 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 195 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 196 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 197 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 198 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 199 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 200 IRQ_TYPE_LEVEL_HIGH>,
> +                         <GIC_SPI 201 IRQ_TYPE_LEVEL_HIGH>;
> +        };
> +    };
> \ No newline at end of file

Fix.

> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml
> new file mode 100644
> index 000000000000..2f807d074211
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc1.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc1.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +maintainers:
> +  - Ryan Chen <ryan_chen@aspeedtech.com>
> +
> +title: ASPEED AST2700 Interrupt Controller 1
> +
> +description:
> +  This interrupt controller hardware is second level interrupt controller that
> +  is hooked to a parent interrupt controller. It's useful to combine multiple
> +  interrupt sources into 1 interrupt to parent interrupt controller.
> +
> +properties:
> +  compatible:
> +    const: aspeed,ast2700-intc1
> +
> +  reg:
> +    maxItems: 1
> +
> +  '#address-cells':
> +    const: 1
> +
> +  '#size-cells':
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^interrupt-controller@":
> +    type: object
> +    description: A child interrupt controller node
> +    additionalProperties: false
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - aspeed,ast2700-intc1-ic
> +
> +      reg:
> +        maxItems: 1
> +
> +      '#interrupt-cells':
> +        const: 1
> +
> +      interrupt-controller: true
> +
> +      interrupts-extended:
> +        minItems: 1
> +        maxItems: 1
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupt-controller
> +      - '#interrupt-cells'
> +      - interrupts-extended
> +
> +required:
> +  - compatible
> +  - reg
> +  - '#address-cells'
> +  - '#size-cells'
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    intc1: interrupt-controller@14c18000 {
> +        compatible = "aspeed,ast2700-intc1";
> +        reg = <0x14c18000 0x400>;
> +        #address-cells = <1>;
> +        #size-cells = <1>;
> +        ranges = <0x0 0x14c18000 0x400>;
> +
> +        intc1_0: interrupt-controller@100 {
> +            compatible = "aspeed,ast2700-intc1-ic";
> +            reg = <0x100 0x10>;
> +            #interrupt-cells = <1>;
> +            interrupt-controller;
> +            interrupts-extended = <&intc0_11 0>;
> +        };
> +
> +        intc1_1: interrupt-controller@110 {
> +            compatible = "aspeed,ast2700-intc1-ic";
> +            reg = <0x110 0x10>;
> +            #interrupt-cells = <1>;
> +            interrupt-controller;
> +            interrupts-extended = <&intc0_11 1>;
> +        };
> +    };
> \ No newline at end of file
> -- 
> 2.34.1
> 

