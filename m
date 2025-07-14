Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42818C83F1A
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 14 Jul 2025 08:29:43 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Subject:Message-Id:
	References:In-Reply-To:To:Cc:From:MIME-Version:Content-Transfer-Encoding:
	Content-Type:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JSKx5SHEq33VxDPO5OHD3/BWPCuVvoi++4d98EY2cf0=; b=ByLZVjPnDU2qHEpUaEb4WIg5C3
	XNzTIRH7M15etzBwbqwjr4Lj6sVROz7Bp/dcJat5RSSvD9XRN+el1QGkmBGde8T8XIuQtjvOMF/P1
	lIHGJHg8vYoRU9BBTJWj+arR/FFw+tgN3edrru6FxyEihrZD6hNpPzpLF3rlxHx9NJLKVyrKpEjF6
	AJZ4ksoF35W24M6ylk/8+mzH479BF0W0zB7jm7+AEzfthrGxDe/M8GUNVgCoVRYON8oEVd5NkjAGJ
	qP/BeLebC8f/NlRHET6HDP+/pOOBdJxI/1hQqeqBtxUngL8o4Eb+O6zMwMBbQBjTndtqDOeRgHKz2
	ZtYA0mWQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubEZ8-00000001ed4-08Le;
	Mon, 14 Jul 2025 08:29:38 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1ubENt-00000001bjO-0PSM
	for linux-arm-kernel@lists.infradead.org;
	Mon, 14 Jul 2025 08:18:01 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 83A4660052;
	Mon, 14 Jul 2025 08:17:30 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 23362C4CEED;
	Mon, 14 Jul 2025 08:17:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752481050;
	bh=HU6qaRX0H63WQNkChMnnlLrTNSnQpYkD+nlgW/FZX3w=;
	h=Date:From:Cc:To:In-Reply-To:References:Subject:From;
	b=JjU9wg+caJG31D0CW4bhBC6zj/xORL/KaedDTektBzMxDD00Ne35k+DcPKouPhcZ8
	 V+siYdxAN+xOF3XN/bSuv/wv6lQ8iIT5gqFGEW76EZCU87Kf3pqQecKJ2hfIPDR6u0
	 GMH73EEQQ1FXlyjMXNtfxfDUd+r3Fnln5FctxZNOazceKS1QOrgTSsWGT7d+MeHEn7
	 4HOruxq8gJLGD0xTE2fSGNtNkHiBiu+8dhSOkb5pOvIZOgqfqokMFd8ZqkBAEOQra5
	 Y6Ylb6tA4w1496Umb7Lueq4Ut1Xfy2/YoanxIIhR1M3Z/Ca7GM2S38NAJ2eV/1v62f
	 S2XmkXcPA39tw==
Date: Mon, 14 Jul 2025 03:17:29 -0500
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 8bit
MIME-Version: 1.0
From: "Rob Herring (Arm)" <robh@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Joel Stanley <joel@jms.id.au>, 
 linux-kernel@vger.kernel.org, linux-aspeed@lists.ozlabs.org, 
 Krzysztof Kozlowski <krzk+dt@kernel.org>, 
 linux-arm-kernel@lists.infradead.org, 
 Andrew Jeffery <andrew@codeconstruct.com.au>, 
 Conor Dooley <conor+dt@kernel.org>, Kevin Chen <kevin_chen@aspeedtech.com>, 
 devicetree@vger.kernel.org
To: Ryan Chen <ryan_chen@aspeedtech.com>
In-Reply-To: <20250714071753.2653620-1-ryan_chen@aspeedtech.com>
References: <20250714071753.2653620-1-ryan_chen@aspeedtech.com>
Message-Id: <175248104913.1053585.2976024588034663905.robh@kernel.org>
Subject: Re: [PATCH] dt-bindings: interrupt-controller: aspeed: Refine
 AST2700 binding description and example
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


On Mon, 14 Jul 2025 15:17:53 +0800, Ryan Chen wrote:
> - Update block diagram for better readability and accuracy.
> - Clarify the relationship and function of INTC0, INTC1, and the GIC.
> - Documentation and example refine.
> 
> This enhances the documentation quality and helps developers understand
> the interrupt controller hierarchy and usage.
> 
> Signed-off-by: Ryan Chen <ryan_chen@aspeedtech.com>
> ---
>  .../aspeed,ast2700-intc.yaml                  | 155 +++++++++++++-----
>  1 file changed, 112 insertions(+), 43 deletions(-)
> 

My bot found errors running 'make dt_binding_check' on your patch:

yamllint warnings/errors:

dtschema/dtc warnings/errors:
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml: address-cells: missing type definition
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.yaml: size-cells: missing type definition
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dts:39.15-41: Warning (reg_format): /example-0/bus/interrupt-controller@12100000/interrupt-controller@1b00:reg: property has invalid length (12 bytes) (#address-cells == 2, #size-cells == 2)
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: Warning (pci_device_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: Warning (pci_device_bus_num): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: Warning (simple_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: Warning (i2c_bus_reg): Failed prerequisite 'reg_format'
Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: Warning (spi_bus_reg): Failed prerequisite 'reg_format'
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: interrupt-controller@12100000 (aspeed,ast2700-intc0): '#address-cells', '#size-cells' do not match any of the regexes: '^interrupt-controller@', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: interrupt-controller@12100000 (aspeed,ast2700-intc0): interrupt-controller@1b00:reg:0: [0, 303045376, 16] is too short
	from schema $id: http://devicetree.org/schemas/reg.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: interrupt-controller@14c18000 (aspeed,ast2700-intc1): '#address-cells', '#size-cells' do not match any of the regexes: '^interrupt-controller@', '^pinctrl-[0-9]+$'
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#
/builds/robherring/dt-review-ci/linux/Documentation/devicetree/bindings/interrupt-controller/aspeed,ast2700-intc.example.dtb: interrupt-controller@14c18000 (aspeed,ast2700-intc1): interrupt-controller@100: 'interrupts' is a required property
	from schema $id: http://devicetree.org/schemas/interrupt-controller/aspeed,ast2700-intc.yaml#

doc reference errors (make refcheckdocs):

See https://patchwork.ozlabs.org/project/devicetree-bindings/patch/20250714071753.2653620-1-ryan_chen@aspeedtech.com

The base for the series is generally the latest rc1. A different dependency
should be noted in *this* patch.

If you already ran 'make dt_binding_check' and didn't see the above
error(s), then make sure 'yamllint' is installed and dt-schema is up to
date:

pip3 install dtschema --upgrade

Please check and re-submit after running the above command yourself. Note
that DT_SCHEMA_FILES can be set to your schema file to speed up checking
your schema. However, it must be unset to test all examples with your schema.


