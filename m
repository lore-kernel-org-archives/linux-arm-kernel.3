Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E7E86CAC583
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  9 Sep 2025 15:34:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=qQ3ys7Hbiu28GAwpyL5NtyaUw1G+3XCFD8hzPbkv7kI=; b=OomxPhrdoihMl1X4nAOxZYoaFJ
	EAzU0U/gBONRsUaN3pDQcbRxVsw0YMbRfpmD0A7ZnlFKDDLB+VcQDv6Hw6cD3mcXV3u40wBG73NAb
	1D+3tmr+5Iy12MYozA/eCvBCsO9u3zSo77kCIxkgxib9F8dpBkoXWrDcdtP1d8bp3niY60dcPBx1z
	Stb8sf/Fab5xUEG5Rnl4vg8iLja26UzwXxOH3h37BAmTVw/rvvv9aofByuBmOpR/oBOALFc3BLcYp
	7OFfcHLDkZc7MBddxpkAqUbY+N4vHkmW48vzIGQNs/zxOHnmAfzgHnangUtJWYTHOcZMxGPlzG2VO
	ToATObBw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uw0M8-000000085t1-1EIT;
	Tue, 09 Sep 2025 15:34:04 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uvsv6-00000005EA5-1btD;
	Tue, 09 Sep 2025 07:37:41 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id 03D61444A6;
	Tue,  9 Sep 2025 07:37:40 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4FAA5C4CEF4;
	Tue,  9 Sep 2025 07:37:39 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1757403459;
	bh=acORBv5pR0dL7OfFWOz7bIwEVi25cUViThTI06hdAIU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UX49abhitmL0DqTvMnmw2JD5Yfwhi9On6sWJ8WRknk0z7dNfTuDybQ5soyz60XSy+
	 5QZKyi+dkyjXuJik0BzNoVWYZ5lqPXdSFx6ZUtOiL6qzYTPse1g+1cgPf52nnw1W4q
	 Yf3R9fHZOYkL2PKVXDuJgqdQvvMCDKQyoo5DPFkGPqZ+V8nj2VECWY7VHik41N6YM/
	 H+W3atrzQvfUWnnzlo6if7Axjaw+Qp0A7thWODuRNJ1rGHqekmoIpHRTDswaKg0dKc
	 JK7yLPxnK7yFerWlIlXxyIIzKXZeni1YFqlxWOFvirOPb8j+YGVSzQEBl6vbuftwnQ
	 FKRXCkPb1smyQ==
Date: Tue, 9 Sep 2025 09:37:37 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Igor Belwon <igor.belwon@mentallysanemainliners.org>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-mediatek@lists.infradead.org
Subject: Re: [PATCH 1/4] dt-bindings: pinctrl: mediatek: Document MT6878 pin
 controller bindings
Message-ID: <20250909-mellow-eminent-duck-4c4619@kuoka>
References: <20250908-mt6878-pinctrl-support-v1-0-3fb78c8ab4e8@mentallysanemainliners.org>
 <20250908-mt6878-pinctrl-support-v1-1-3fb78c8ab4e8@mentallysanemainliners.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250908-mt6878-pinctrl-support-v1-1-3fb78c8ab4e8@mentallysanemainliners.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250909_003740_485999_A88791FD 
X-CRM114-Status: GOOD (  24.04  )
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

On Mon, Sep 08, 2025 at 09:17:55PM +0200, Igor Belwon wrote:
> Add device-tree bindings for the pin controller and the EINT controller
> found in the MediaTek MT6878 SoC.
> 
> Signed-off-by: Igor Belwon <igor.belwon@mentallysanemainliners.org>
> ---
>  .../bindings/pinctrl/mediatek,mt6878-pinctrl.yaml  |  209 ++++
>  include/dt-bindings/pinctrl/mt6878-pinfunc.h       | 1201 ++++++++++++++++++++
>  2 files changed, 1410 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
> new file mode 100644
> index 0000000000000000000000000000000000000000..ecd24ab23a0c41810828ddb8827ab39c4cd3d2fc
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6878-pinctrl.yaml
> @@ -0,0 +1,209 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6878-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6878 Pin Controller
> +
> +maintainers:
> +  - Igor Belwon <igor.belwon@mentallysanemainliners.org>
> +
> +description:
> +  The MediaTek MT6878 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6878-pinctrl
> +
> +  reg:
> +    items:
> +      - description: pin controller base
> +      - description: bl group IO
> +      - description: bm group IO
> +      - description: br group IO
> +      - description: bl1 group IO
> +      - description: br1 group IO
> +      - description: lm group IO
> +      - description: lt group IO
> +      - description: rm group IO
> +      - description: rt group IO
> +      - description: EINT controller E block
> +      - description: EINT controller S block
> +      - description: EINT controller W block
> +      - description: EINT controller C block
> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: bl
> +      - const: bm
> +      - const: br
> +      - const: bl1
> +      - const: br1
> +      - const: lm
> +      - const: lt
> +      - const: rm
> +      - const: rt
> +      - const: eint-e
> +      - const: eint-s
> +      - const: eint-w
> +      - const: eint-c
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier. Since the generic GPIO binding is used,
> +      the amount of cells must be specified as 2. See the below mentioned gpio
> +      binding representation for description of particular cells.
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true

How many GPIOs do you have? No limit?

> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +# PIN CONFIGURATION NODES
> +patternProperties:
> +  '-pins$':
> +    type: object
> +    additionalProperties: false
> +
> +    patternProperties:
> +      '^pins':
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> +        description:
> +          A pinctrl node should contain at least one subnodes representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux are defined as macros in
> +              arch/arm64/boot/dts/mediatek/mt8196-pinfunc.h for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          drive-strength-microamp:
> +            enum: [125, 250, 500, 1000]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [75000, 5000]
> +                description: Pull down RSEL type resistance values (in ohms)
> +            description:
> +              For normal pull down type there is no need to specify a resistance
> +              value, hence this can be specified as a boolean property.
> +              For RSEL pull down type a resistance value (in ohms) can be added.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [10000, 5000, 4000, 3000]
> +                description: Pull up RSEL type resistance values (in ohms)
> +            description:
> +              For normal pull up type there is no need to specify a resistance
> +              value, hence this can be specified as a boolean property.
> +              For RSEL pull up type a resistance value (in ohms) can be added.
> +
> +          bias-disable: true
> +
> +          output-high: true
> +
> +          output-low: true
> +
> +          input-enable: true
> +
> +          input-disable: true
> +
> +          input-schmitt-enable: true
> +
> +          input-schmitt-disable: true
> +
> +        required:
> +          - pinmux
> +
> +        additionalProperties: false
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - gpio-ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/pinctrl/mt65xx.h>

Why including mt65xx?

> +    #define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)

I don't understand why do you need it? Didn't you have header for that?
Or you prepared for header removal (see my further comment), but then it
is just confusing.

> +    #define PINMUX_GPIO99__FUNC_SCL0 (MTK_PIN_NO(99) | 1)
> +    #define PINMUX_GPIO100__FUNC_SDA0 (MTK_PIN_NO(100) | 1)
> +
> +    pio: pinctrl@10005000 {
> +        compatible = "mediatek,mt6878-pinctrl";
> +        reg = <0x10005000 0x1000>,
> +              <0x11d10000 0x1000>,
> +              <0x11d30000 0x1000>,
> +              <0x11d40000 0x1000>,
> +              <0x11d50000 0x1000>,
> +              <0x11d60000 0x1000>,
> +              <0x11e20000 0x1000>,
> +              <0x11e30000 0x1000>,
> +              <0x11eb0000 0x1000>,
> +              <0x11ec0000 0x1000>,
> +              <0x11ce0000 0x1000>,
> +              <0x11de0000 0x1000>,
> +              <0x11e60000 0x1000>,
> +              <0x1c01e000 0x1000>;
> +        reg-names = "base", "bl", "bm", "br", "bl1", "br1",
> +                    "lm", "lt", "rm", "rt", "eint-e", "eint-s",
> +                    "eint-w", "eint-c";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 220>;
> +        interrupt-controller;
> +        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #interrupt-cells = <2>;
> +
> +        gpio-pins {
> +            pins {
> +                pinmux = <PINMUX_GPIO0__FUNC_GPIO0>;
> +                bias-pull-up = <4000>;
> +                drive-strength = <6>;
> +            };
> +        };
> +
> +        i2c0-pins {
> +            pins-bus {
> +                pinmux = <PINMUX_GPIO99__FUNC_SCL0>,
> +                         <PINMUX_GPIO100__FUNC_SDA0>;
> +                bias-pull-down = <75000>;
> +                drive-strength-microamp = <1000>;
> +            };
> +        };
> +    };
> diff --git a/include/dt-bindings/pinctrl/mt6878-pinfunc.h b/include/dt-bindings/pinctrl/mt6878-pinfunc.h
> new file mode 100644
> index 0000000000000000000000000000000000000000..4e8e475a74549b513ac7075ac2ef0fe6f7f1d097
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/mt6878-pinfunc.h

This is now in DTS.

> @@ -0,0 +1,1201 @@
> +/* SPDX-License-Identifier: GPL-2.0 */

Otherwise wrong license and wrong filename (vendor prefix, filename
matching binding).

Best regards,
Krzysztof


