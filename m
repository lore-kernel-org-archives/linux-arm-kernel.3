Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id C1939CA0EDC
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 14 Aug 2025 08:29:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W1AAD98/pMC4llkuyRBMvH/G0ZNX1c8a6i9RG3YNpCM=; b=VVf79V9piLF5iQ6TeSW4BwM7uC
	Z29cRGOR8JLdEI8k+/7u+MnmpPzrzGvnfsPLskML9wpsdRnHlDmEwDWKjkLGpJ9KfvYrAXRh0/rQN
	jVn2jyn9Zr3zubMuvY79QHfsXm+uA7xt2Pp37XqdXX39lSt0Ini76DTkZKIRV+ANUSnBYzqco6F2S
	ZH3F7zRdTlsPirIW0vA3oEzYUXpgVk5R3LhspTQjRTBMHdYUYgCgLj2tDaIqaS7+Uc9muCfy01vB8
	ZpKEJoUF14ncfN3EKWEJLjahwW2WRMBIw9gt+619AJuY4L722R83+jNCDssE2HynO1Geza9lQXV0A
	nc7CyUIw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umTKq-0000000GFED-0Btj;
	Thu, 14 Aug 2025 08:29:20 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1umSwG-0000000GBjM-1WuF
	for linux-arm-kernel@lists.infradead.org;
	Thu, 14 Aug 2025 08:03:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id E6D5E44518;
	Thu, 14 Aug 2025 08:03:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 342F5C4CEEF;
	Thu, 14 Aug 2025 08:03:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1755158635;
	bh=X3Zkv1GgYGEV/PFrhjV6JjLBSwA81+ffdc9QPdchXLk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0QPM3oCyMK9LWNRNmg59i3pAgrctvv8lnJBbGzCuDxjDcLS7utfL0DmwKI0yFcs3
	 KL+xoza2Ywl9NslWcJ9zrBL25photeR9qQI+4PtMKU0RrWpuWjwSmj+ujtvvkyKqWi
	 xcC9OH2qzbJOqjV6OHFgnYBbEiwPKUllpthQbNaTQqhk+piDNONSb2KXV6HuC3O3nx
	 zRw2GLuDnxvEYkz0oYB8TnHK690hqLWxX884VsND1y8fe7d+sxk37Pcxs9k8HHS9RP
	 OAFT8UjwaXQ02146plSOQyVNK4hhbUb3WIrFLwX7wWywlsx4m8yZFvSbWRt4UvVQPN
	 EW6hIEZvRnGEQ==
Date: Thu, 14 Aug 2025 10:03:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Ryan Chen <ryan_chen@aspeedtech.com>
Cc: Thomas Gleixner <tglx@linutronix.de>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Kevin Chen <kevin_chen@aspeedtech.com>, linux-kernel@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org
Subject: Re: [PATCH v4 1/2] dt-bindings: interrupt-controller: aspeed: Add
 parent compatibles and refine documentation
Message-ID: <20250814-auspicious-thundering-jaybird-b76f4f@kuoka>
References: <20250812100830.145578-1-ryan_chen@aspeedtech.com>
 <20250812100830.145578-2-ryan_chen@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250812100830.145578-2-ryan_chen@aspeedtech.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250814_010356_443913_C8FFB5D6 
X-CRM114-Status: GOOD (  27.23  )
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

On Tue, Aug 12, 2025 at 06:08:29PM +0800, Ryan Chen wrote:
> AST2700 contains two independent top-level interrupt controllers (INTC0,
> INTC1). Each occupies its own register space and handles different sets of
> peripherals. Above them, the PSP (CA35) GIC is the root interrupt
> aggregator. In hardware, INTC1 outputs are routed into INTC0, and INTC0
> outputs are routed into the GIC.
> 
> Introduce distinct compatibles for these parent blocks so the DT can model
> the hierarchy and register space layout accurately:
> 
>   - aspeed,ast2700-intc0  (parent node at 0x12100000)
>   - aspeed,ast2700-intc1  (parent node at 0x14c18000)
> 
> The existing child compatible:
> 
>   - aspeed,ast2700-intc-ic
> 
> continues to describe the interrupt-controller instances within each INTC
> block (e.g. INTC0_0..INTC0_11 and INTC1_0..INTC1_5).
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2700-intc.yaml                  | 158 +++++++++++++-----
>  1 file changed, 115 insertions(+), 43 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml b/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml
> index 55636d06a674..81304b53c112 100644
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

Same problem as last time. This tells me intc0 has not children...

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

...This tells that inc1 has no children (only intc0_11, which you said
is aspeed,ast2700-intc-ic !!!)....
(keep scrolling)

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

... but this tells me that intc0 and intc1 has children.

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
> +        description:
> +          The first cell is the IRQ number, the second cell is the trigger
> +          type.
> +
> +      interrupts:
> +        minItems: 1
> +        maxItems: 6
> +        description: |
> +          The interrupts provided by this interrupt controller.
> +
> +      interrupts-extended:
> +        minItems: 1
> +        maxItems: 6
> +        description: |
> +          This property is required when defining a cascaded interrupt controller
> +          that is connected under another interrupt controller. It specifies the
> +          parent interrupt(s) in the upstream controller to which this controller
> +          is connected.

No, you do not define two. Only interrupts.

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
> +        compatible = "aspeed,ast2700-intc0";
> +        reg = <0 0x12100000 0 0x4000>;
> +        ranges = <0x0 0x0 0x0 0x12100000 0x0 0x4000>;
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        intc0_11: interrupt-controller@1b00 {
> +          compatible = "aspeed,ast2700-intc-ic";
> +          reg = <0 0x12101b00 0 0x10>;


... and that's quite wrong unit address. Also no resources in the
parent, so this entire split seems superficial and incorrect.

This binding is not improving. You are not responding to REAL problems
described to you. What's more, you send it in a way making our life
difficult, look:

b4 diff '20250812100830.145578-2-ryan_chen@aspeedtech.com'
Using cached copy of the lookup
---
Analyzing 3 messages in the thread
Could not find lower series to compare against.

Best regards,
Krzysztof


