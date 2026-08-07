Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 9007DC2A09B
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  7 Aug 2026 06:07:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=L9tU9pcxg+3S2Ft6tVACbmzA71Uk5jr59+MtaRvQsfQ=; b=JCxJTnkq97cn7sg8ZF9Tkkeb+Y
	XpCVGd3Zp12Sovj+RRvMWEhkXzdSUIbgk195amDabqcE39BFJ/VZYcmvX/rvazEM1GUignM8T91oj
	4IwUjznz3fil919fkLhgI3Ot1oyYAzT2jvQn7oBgEbPayV3cZo6Z9md/EqKYgplYC6aHvjO+dZcLq
	jjHTiCS/5xI4EpIBXNW2ppVAsY95tjcKk0ohoSy8z7KJdDcs0ZK0pVvlCMnkeOgLRZj8/8e6WDzX+
	rjr87pp64f7VpXbvnk7ko/Tjh0vmY4r9Wq/ssBYaE5AANNhPvOP1sU8A+DNbqkLjmJfCIK5uaWFxc
	rGzQiM5w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDjM-000000079dV-3jLG;
	Fri, 07 Aug 2026 06:06:56 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wsDjM-000000079dO-1EOQ
	for linux-arm-kernel@lists.infradead.org;
	Fri, 07 Aug 2026 06:06:56 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 66A60600B1;
	Fri,  7 Aug 2026 06:06:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1D0251F000E9;
	Fri,  7 Aug 2026 06:06:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1786082815;
	bh=L9tU9pcxg+3S2Ft6tVACbmzA71Uk5jr59+MtaRvQsfQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=fL1GeBVzFTDJO+OxlnCdamnGAWnSq9h+zuv8RDed3xjeGl9LzXoDcTmyqgOSA6CCJ
	 dk5EwCirGTGyK1NCU/t1EAmcblh+EM4qd0uDl4Jh0auAZ3d7ezb7JWL/PacLHG+FE0
	 IPIkYFjBnaHPVb768H0qV1JnxFKganZt4p1bIRFK9QuzPv1Rfo3d0HtANkO7f9TREY
	 KXvEsQQ3EiLdlIbSzdzz7ZQxNsEwXBOG73tjKIkYom8KYJq7Nu7jYFoW/hxQOu5zcM
	 ZPwj/KtHYdiN3asbO6tkQkKsIxRe6+W1IBEBub6apb7BiCFW9ZVtm8SydeFREguI4f
	 hqEKO8qUfPosA==
Date: Fri, 7 Aug 2026 08:06:50 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Stephen Boyd <sboyd@kernel.org>, 
	Linus Walleij <linusw@kernel.org>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Jiri Slaby <jirislaby@kernel.org>, Catalin Marinas <catalin.marinas@arm.com>, 
	Will Deacon <will@kernel.org>, Arnd Bergmann <arnd@arndb.de>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org, linux-clk@vger.kernel.org, linux-gpio@vger.kernel.org, 
	linux-serial@vger.kernel.org, soc@lists.linux.dev
Subject: Re: [PATCH v2 04/10] dt-bindings: pinctrl: add Ambarella CV75 pinctrl
Message-ID: <20260807-slim-amusing-jaybird-0bd13a@quoll>
References: <20260806-longzhao-upstream-cv75-v2-v2-0-6b09707c5fe9@ambarella.com>
 <20260806-longzhao-upstream-cv75-v2-v2-4-6b09707c5fe9@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260806-longzhao-upstream-cv75-v2-v2-4-6b09707c5fe9@ambarella.com>
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

On Thu, Aug 06, 2026 at 05:34:12PM +0800, Long Zhao wrote:
> Add the CV75 pin controller binding.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../bindings/pinctrl/ambarella,cv75-pinctrl.yaml   | 175 +++++++++++++++++++++
>  1 file changed, 175 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
> new file mode 100644
> index 000000000000..3fa30b275e51
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/ambarella,cv75-pinctrl.yaml
> @@ -0,0 +1,175 @@
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
> +  drive strength for the main GPIO banks. Pin groups and their mux settings
> +  are defined by the pin controller driver and selected by function and group
> +  names.
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    const: ambarella,cv75-pinctrl
> +
> +  reg:
> +    maxItems: 1
> +    description: IOMUX registers
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
> +    const: 1
> +
> +  ranges: true
> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +    additionalProperties: false
> +
> +    properties:
> +      reg:
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
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
> +      - interrupts
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +      - interrupt-controller
> +      - "#interrupt-cells"
> +
> +  "^[a-z0-9-]+-pins$":

Mixing MMIO and non-MMIO nodes in a bus is discouraged. Sloppy code.

Why the pins aren't per gpio-controller?

> +    type: object
> +    allOf:
> +      - $ref: pinmux-node.yaml#
> +      - $ref: pincfg-node.yaml#
> +    additionalProperties: false
> +
> +    properties:
> +      function:
> +        const: uart0

If the function is fixed, then you do not need any of this.

You must post COMPLETE bindings, see writing bindings doc.

> +
> +      groups:
> +        $ref: /schemas/types.yaml#/definitions/string-array
> +        items:
> +          enum: [uart0tx, uart0rx]

Same here, pointless/redunadnt.

> +        minItems: 2
> +        maxItems: 2
> +        uniqueItems: true
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
> +      - groups
> +
> +required:
> +  - compatible
> +  - reg
> +  - ambarella,drive-strength-syscon
> +  - ambarella,pull-syscon
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    rct: rct {
> +    };
> +
> +    scratchpad: scratchpad {
> +    };

Drop above, irrelevant. Do you see any other bindings doing this?

> +
> +    pinctrl: pinctrl@e4010000 {
> +        compatible = "ambarella,cv75-pinctrl";
> +        #address-cells = <1>;
> +        #size-cells = <1>;

You need to follow DTS coding style.

> +        reg = <0xe4010000 0x1000>;
> +        ranges;
> +        ambarella,drive-strength-syscon = <&rct>;
> +        ambarella,pull-syscon = <&scratchpad>;

Best regards,
Krzysztof


