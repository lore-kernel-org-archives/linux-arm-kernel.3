Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EA1ECC43458
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 30 Jun 2026 14:55:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=FrOy3rj9ErYPsJBF3jjZifi/JmWhngje4d+c3PkjfiI=; b=cujFw9ZUvPkCWZz2x804d+R78L
	Xyw7DpRvApDGJsftBDulpeDUndgp+7cF+U0N+QHCaiGZbqsLDhuXhVvmyu7KvOanNMFWA6paAxTP3
	yGpZ+vNpRRCkItLx/6/BIyMKI6hxKfA8VisWnRjlzT11q+GcDq2yZaB99/EBZYUkzAUNvMhkJiz/L
	hqAAkCs4ChMSowIB0mzEnb61L780OX8QXjAuIy/rjUZtsPekqAnu6h24pZQwcH2+daXO5iSwK/Qj/
	osGVE8Q0XeZzhWCkDHKSpj8keboMNI/GX98tgdZEOYRzC3kCLleQfFDwbns1XpSQnPieX6Rias7EE
	y2uOOhQw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZrj-0000000HJFH-0IoJ;
	Tue, 30 Jun 2026 14:55:11 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1weZrh-0000000HJEn-0uuH;
	Tue, 30 Jun 2026 14:55:09 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7E8D860018;
	Tue, 30 Jun 2026 14:55:07 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 73DB41F00A3E;
	Tue, 30 Jun 2026 14:54:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1782831307;
	bh=FrOy3rj9ErYPsJBF3jjZifi/JmWhngje4d+c3PkjfiI=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=oKfVzFZ6b/XSsHTT24iTlGuILVTem1fiPHNzbqfkkfEvgofuYcLnT0ZBgbClmJSyU
	 1Lje1eKxqCR4srhyHKb8b43TaGt/wOdQZXmv9MCfqI/QaKY0Sm3heWK7BVrIeOZDzf
	 P2zz/ZVNqH0yjYGkLQQLLiGvp654MVGM2V4RrpCvRDYfrZqeDqSFpN1iBK/jQBipio
	 GzOMvwzGE77O+3r4MhfmAyJvycRC+cbAkpZPfltFgLx+L3FcsZRkJbecwAdR5VffFu
	 7XRMQ3++8oaFXaRC4M35PtNbbbb3CmOuL7Rrw8sLRlduulgMHMNmiiOglxx3k9yzNS
	 XQhqm13RH8Dug==
Date: Tue, 30 Jun 2026 16:54:52 +0200
From: Manivannan Sadhasivam <mani@kernel.org>
To: Christian Marangi <ansuelsmth@gmail.com>
Cc: Bjorn Helgaas <bhelgaas@google.com>, 
	Lorenzo Pieralisi <lpieralisi@kernel.org>, Krzysztof =?utf-8?Q?Wilczy=C5=84ski?= <kwilczynski@kernel.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Ryder Lee <ryder.lee@mediatek.com>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Brian Masney <bmasney@redhat.com>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Jianjun Wang <jianjun.wang@mediatek.com>, 
	linux-pci@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-mediatek@lists.infradead.org, linux-clk@vger.kernel.org, linux-arm-kernel@lists.infradead.org
Subject: Re: [PATCH v3 3/4] dt-bindings: PCI: mediatek-gen3: Split Airoha
 schema and document 2-lanes
Message-ID: <alqqddz52csz4pcbiilfca7a47x6jsazf2um4ydwiqq6ejrgz4@4qhkbj4k5i5s>
References: <20260627121450.3529133-1-ansuelsmth@gmail.com>
 <20260627121450.3529133-4-ansuelsmth@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20260627121450.3529133-4-ansuelsmth@gmail.com>
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

On Sat, Jun 27, 2026 at 02:14:44PM +0200, Christian Marangi wrote:
> To permit proper documentation of required property to support PCIe
> configured for 2-lanes mode, split the Airoha schema part from the
> mediatek-gen3 schema to a dedicated schema.
> 
> A PCIe configured for 2-lanes mode require an additional reg for the
> secondary PCIe to be configured and the airoha,scu phandle to correctly
> configure the PCIe MUX.
> 
> Rework the mediatek-gen3 schema to drop any redundant constraint previsouly
> introduced for Airoha PCIe properties.
> 
> Signed-off-by: Christian Marangi <ansuelsmth@gmail.com>
> ---
>  .../bindings/pci/airoha,en7581-pcie.yaml      | 251 ++++++++++++++++++
>  .../bindings/pci/mediatek-pcie-gen3.yaml      |  77 +-----
>  2 files changed, 256 insertions(+), 72 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
> 
> diff --git a/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
> new file mode 100644
> index 000000000000..c690ba7f207c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pci/airoha,en7581-pcie.yaml
> @@ -0,0 +1,251 @@
> +# SPDX-License-Identifier: (GPL-2.0 OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pci/airoha,en7581-pcie.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Gen3 PCIe controller on Airoha SoCs
> +
> +maintainers:
> +  - Christian Marangi <ansuelsmth@gmail.com>
> +
> +description: |+
> +  PCIe Gen3 MAC controller for Airoha SoCs, it supports Gen3 speed
> +  and compatible with Gen2, Gen1 speed.
> +
> +  This PCIe controller supports up to 256 MSI vectors, the MSI hardware
> +  block diagram is as follows:
> +
> +                    +-----+
> +                    | GIC |
> +                    +-----+
> +                       ^
> +                       |
> +                   port->irq
> +                       |
> +               +-+-+-+-+-+-+-+-+
> +               |0|1|2|3|4|5|6|7| (PCIe intc)
> +               +-+-+-+-+-+-+-+-+
> +                ^ ^           ^
> +                | |    ...    |
> +        +-------+ +------+    +-----------+
> +        |                |                |
> +  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> +  |0|1|...|30|31|  |0|1|...|30|31|  |0|1|...|30|31| (MSI sets)
> +  +-+-+---+--+--+  +-+-+---+--+--+  +-+-+---+--+--+
> +   ^ ^      ^  ^    ^ ^      ^  ^    ^ ^      ^  ^
> +   | |      |  |    | |      |  |    | |      |  |  (MSI vectors)
> +   | |      |  |    | |      |  |    | |      |  |
> +
> +    (MSI SET0)       (MSI SET1)  ...   (MSI SET7)
> +
> +  With 256 MSI vectors supported, the MSI vectors are composed of 8 sets,
> +  each set has its own address for MSI message, and supports 32 MSI vectors
> +  to generate interrupt.
> +
> +properties:
> +  compatible:
> +    const: airoha,en7581-pcie
> +
> +  reg:
> +    minItems: 1
> +    maxItems: 2
> +
> +  reg-names:
> +    minItems: 1
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ranges:
> +    minItems: 1
> +    maxItems: 8

8 entries? Really?

> +
> +  iommu-map:
> +    maxItems: 1
> +
> +  iommu-map-mask:
> +    const: 0

Why these iommu properties are not present in the example?

> +
> +  resets:
> +    minItems: 1
> +    maxItems: 4
> +
> +  reset-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: sys-ck

sys-clk?

> +
> +  phys:
> +    maxItems: 1
> +
> +  phy-names:
> +    items:
> +      - const: pcie-phy

If there is going to be only one PHY, then I think you can drop the phy-names
property.

> +
> +  num-lanes:
> +    enum: [1, 2]
> +
> +  mediatek,pbus-csr:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to pbus-csr syscon
> +          - description: offset of pbus-csr base address register
> +          - description: offset of pbus-csr base address mask register
> +    description:
> +      Phandle with two arguments to the syscon node used to detect if
> +      a given address is accessible on PCIe controller.
> +
> +  airoha,scu:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    items:
> +      - items:
> +          - description: phandle to airoha SCU syscon
> +    description:
> +      Phandle to SCU syscon to configure PCIe MUX for 2 lines support.
> +
> +  '#interrupt-cells':
> +    const: 1
> +
> +  interrupt-controller:
> +    description: Interrupt controller node for handling legacy PCI interrupts.

s/legacy/INTx

> +    type: object
> +    properties:
> +      '#address-cells':
> +        const: 0
> +      '#interrupt-cells':
> +        const: 1
> +      interrupt-controller: true
> +
> +    required:
> +      - '#address-cells'
> +      - '#interrupt-cells'
> +      - interrupt-controller
> +
> +    additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - ranges
> +  - clocks
> +  - clock-names
> +  - '#interrupt-cells'
> +  - interrupt-controller
> +
> +allOf:
> +  - $ref: /schemas/pci/pci-host-bridge.yaml#
> +  - if:
> +      properties:
> +        num-lanes:
> +          const: 2
> +    then:
> +      properties:
> +        reg:
> +          minItems: 2
> +
> +        reg-names:
> +          items:
> +            - const: pcie-mac
> +            - const: sec-pcie-mac
> +
> +        resets:
> +          minItems: 4
> +
> +        reset-names:
> +          items:
> +            - const: phy-lane0
> +            - const: phy-lane1
> +            - const: perstout
> +            - const: sec-perstout
> +
> +      required:
> +        - airoha,scu
> +
> +    else:
> +      properties:
> +        reg:
> +          maxItems: 1
> +
> +        reg-names:
> +          items:
> +            - const: pcie-mac
> +
> +        resets:
> +          minItems: 2
> +          maxItems: 3
> +
> +        reset-names:
> +          minItems: 2
> +          items:
> +            - enum: [ phy-lane0, phy-lane1, phy-lane2 ]
> +            - enum: [ phy-lane1, perstout ]
> +            - const: phy-lane2
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    bus {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +

You can drop bus node.

- Mani

-- 
மணிவண்ணன் சதாசிவம்

