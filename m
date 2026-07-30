Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 792BDC55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:21:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qr2zNnHjplGtyB5hdoOxSOD8DyZRyErx54DxXFIYXP0=; b=NrrtLgZC3JzEDP1z2kvX9Q7OPf
	+RMUBlL48MjH3eWkllwbPLT4UHHUZJA997rzeY5uKfJZ1tiOC2YtMQGgzG9SRqTzkfxnk3mUAPN2+
	loOfpHJcZ4EDNuFzXsQVnl0huEvaDl1GhfbMAoyFUK/Je+D7HGy94cHXk495M9N3zoDxWVCF+JkGZ
	cokO8x97fwt8Gx78stdczPGUW2DvVEilmfE/rXmwAt/k3YTPtpUUvyPj0O3OQbX7ZSBcHYaBkqevd
	s6qFwgL7BUrdvLThGxFZypwNYVFEAKegn1Hd8zslUdrFoZ9dUs8V0JPpJUoJHXEAhM4YG95AU3UzF
	WLSSmq+Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRdV-0000000Ajk1-1inB;
	Thu, 30 Jul 2026 14:21:25 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRdU-0000000Ajjm-12lS
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:21:24 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id AE5F7600B0;
	Thu, 30 Jul 2026 14:21:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4A0A21F00A3D;
	Thu, 30 Jul 2026 14:21:23 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785421283;
	bh=qr2zNnHjplGtyB5hdoOxSOD8DyZRyErx54DxXFIYXP0=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=ZMf7bEHkIttfkrZA+Z/z8PuF/NtQrck8+3kHY4qGEVwV5CosLsrrRQg4HpSvZWDyK
	 y1Zs9iY631bZsBPI7v7dbmuFTaMPvY60BQjlRn6rMbtE5gI8hsBpOOV4zk6ULOTfME
	 c+xGxVNwDBJhmbfB1uPaWShyUwQsUEj7af0i9N4H3SXEm35nDHJSO6akpN+3ctvwCD
	 f3d8E78VyO8KHLEhQua0/ZkwSQqqdIBaPSDtK+SZWq2pff9ZmrANjT1qnfOhzkfq3W
	 iTwcPV3QhO2EaBXaEwTaDv+/eb+y7DRC+m6y0A6jp5NGF1Rv15As9mH5boHgG0m+oE
	 GpRIBdk6pIguQ==
Date: Thu, 30 Jul 2026 09:21:22 -0500
From: Rob Herring <robh@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 04/10] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
Message-ID: <20260730142122.GA2952224-robh@kernel.org>
References: <20260730104330.81367-1-longzhao@ambarella.com>
 <20260730104330.81367-5-longzhao@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730104330.81367-5-longzhao@ambarella.com>
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

On Thu, Jul 30, 2026 at 06:43:24PM +0800, Long Zhao wrote:
> Add the CV75 pin controller binding and pinmux ID header.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../pinctrl/ambarella,cv75-pinctrl.yaml       | 167 ++++++++++++++++++
>  .../dt-bindings/pinctrl/ambarella,pinctrl.h   |  11 ++
>  2 files changed, 178 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/ambarella,pinctrl.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
> new file mode 100644
> index 000000000000..8a331c642fad
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
> @@ -0,0 +1,167 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/ambarella,cv75-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ambarella CV75 Pin Controller
> +
> +maintainers:
> +  - Long Zhao <longzhao@ambarella.com>
> +
> +description:
> +  The Ambarella CV75 pin controller configures pin multiplexing, bias and
> +  drive strength for the main GPIO banks. Pin multiplexing entries encode
> +  the pin number and alternate function with the AMBA_PINMUX() macro from
> +  dt-bindings/pinctrl/ambarella,pinctrl.h.
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    const: ambarella,cv75-pinctrl
> +
> +  reg:
> +    items:
> +      - description: GPIO bank 0 registers
> +      - description: GPIO bank 1 registers
> +      - description: GPIO bank 2 registers
> +      - description: IOMUX registers

I'm not really convinced this is 1 h/w block. Looks more like 4 to me.

> +
> +  reg-names:
> +    items:
> +      - const: gpio0
> +      - const: gpio1
> +      - const: gpio2
> +      - const: iomux
> +
> +  interrupts:
> +    items:
> +      - description: GPIO bank 0 interrupt
> +      - description: GPIO bank 1 interrupt
> +      - description: GPIO bank 2 interrupt

These go in the child nodes or your really should have 3 instances of 
your GPIO h/w.

> +
> +  ambarella,drive-strength-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: RCT syscon containing the drive-strength registers.
> +
> +  ambarella,pull-syscon:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: Secure scratchpad syscon containing the pull registers.
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1

If the child nodes stay, this should be the MMIO GPIO bank address, not 
a made up bank number.

> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +      interrupt-controller: true
> +
> +      "#interrupt-cells":
> +        const: 2
> +
> +    required:
> +      - reg
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +
> +  "^[a-z0-9-]+-pins$":
> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      function: true
> +
> +      pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        minItems: 1
> +        maxItems: 96
> +
> +      bias-disable: true
> +      bias-pull-down: true
> +      bias-pull-up: true
> +
> +      drive-strength:
> +        enum: [3, 4, 5, 6, 7, 8, 9, 12]
> +
> +    required:
> +      - function
> +      - pinmux
> +
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - interrupts
> +  - ambarella,drive-strength-syscon
> +  - ambarella,pull-syscon
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/ambarella,pinctrl.h>
> +
> +    rct: rct {
> +    };
> +
> +    scratchpad: scratchpad {
> +    };
> +
> +    pinctrl: pinctrl@e4013000 {
> +        compatible = "ambarella,cv75-pinctrl";
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        reg = <0xe4013000 0x1000>, <0xe4014000 0x1000>,
> +              <0xe4015000 0x1000>, <0xe4010000 0x1000>;

The alignment and size of these blocks is what tells me these are 
separate blocks, not 1 block.

Rob

