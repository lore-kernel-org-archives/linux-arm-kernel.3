Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B5033C02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 19:01:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=b5SurI4xvF7l2bQqzcjl/tfX1uEvVhhN+dYQTzjx8vg=; b=m6054rcdvrgA7QXjAPPrzD4dQl
	1Wh9H58nN6xbMQ+gl4n+l41bHKk1AdhMm4O6+H7vgQT0d8RObZa/+sMoFudP6QqfMLS1xDrIPckRK
	oX73TRA3XLnfWbTdba/47h8a49t/84aVia8vnzWEPj2rvY67CMyBpfwper1pn8A/s74Me8ZIKE2OZ
	mf7egMpDphj5SZ3U/BJkKVOSIpkbjsM2yV3hA5vROhT+QY6SAf3OBn8LFriRnjGDOy0dJLhyvSQ68
	lzebTOZZm+/PfFtG6cc9cjH5ER+NhkYVH2W6hxo13ILxw4QqhJZ+DfcJmMiXFBVKwy/7A1gDGd6v5
	gxb4UiPA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUM6-000000034xw-3BB7;
	Mon, 27 Jan 2025 19:01:06 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcUKk-000000034k3-0ruC;
	Mon, 27 Jan 2025 18:59:43 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 4D4CF5C585C;
	Mon, 27 Jan 2025 18:59:01 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E06F4C4CEE0;
	Mon, 27 Jan 2025 18:59:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738004381;
	bh=AT2ZxPgXT3E2xTLKhdLn/GaF61LTdzus5efSC1f26Ec=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=n2GuMsTJaSw9Mfj2FiENWbgqSZ3wVfIMQVmbhkHkNsb4TkeGqalzHollxY5Po4kFl
	 zR/58oZx75I0QDtGdU8SnurUP3wh+ZxKX0TSeE3UpXkUQ6/HolK2IkCQzbcOSsaeyk
	 BL9WaFgF4rYqdorlvRYcMXpXp3xUS80VJnZf0s1gPya+S36lOItgt7kqKok2wkEWRH
	 prvblDTG1V5kOjWoPBWwun9/gnwm6tp1Ocqw/pSLzBE5b6x9C4aQkIahwLeMzgXXfv
	 Ft1Z46PiuEm9Hc72XP1kVd4F9ol0tet1H6N53hascvHxfGWRPntgNUWLaXLNfA/PU2
	 Zge4E+02FFkog==
Date: Mon, 27 Jan 2025 12:59:39 -0600
From: Rob Herring <robh@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Neil Armstrong <neil.armstrong@linaro.org>,
	Kevin Hilman <khilman@baylibre.com>,
	Jerome Brunet <jbrunet@baylibre.com>,
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>,
	Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org,
	linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v4 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
Message-ID: <20250127185939.GA612868-robh@kernel.org>
References: <20250122-amlogic-pinctrl-v4-0-4677b2e18ff1@amlogic.com>
 <20250122-amlogic-pinctrl-v4-1-4677b2e18ff1@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250122-amlogic-pinctrl-v4-1-4677b2e18ff1@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_105942_335682_D0718B1B 
X-CRM114-Status: GOOD (  19.93  )
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

On Wed, Jan 22, 2025 at 11:25:59AM +0800, Xianwei Zhao wrote:
> Add the dt-bindings for Amlogic pin controller, and add a new
> dt-binding header file which document the GPIO bank names of
> all Amlogic subsequent SoCs.

Did you mean 'all subsequent Amlogic SoCs'? How can you know that? 
Future SoCs may be different.

Update the subject to say this is for A4 SoC.

> 
> Signed-off-by: Xianwei Zhao <xianwei.zhao@amlogic.com>
> ---
>  .../bindings/pinctrl/amlogic,pinctrl-a4.yaml       | 127 +++++++++++++++++++++
>  include/dt-bindings/pinctrl/amlogic,pinctrl.h      |  46 ++++++++
>  2 files changed, 173 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> new file mode 100644
> index 000000000000..c4fdcd69bbf5
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/amlogic,pinctrl-a4.yaml
> @@ -0,0 +1,127 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/amlogic,pinctrl-a4.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Amlogic pinmux controller
> +
> +maintainers:
> +  - Xianwei Zhao <xianwei.zhao@amlogic.com>
> +
> +allOf:
> +  - $ref: pinctrl.yaml#
> +
> +properties:
> +  compatible:
> +    const: amlogic,pinctrl-a4
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Do you really need 2^64 address space to define the GPIO nodes?

> +
> +  ranges: true
> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        minItems: 1
> +        items:
> +          - description: pin config register
> +          - description: pin mux setting register (some special pin fixed function)
> +          - description: pin drive strength register (optional)
> +
> +      reg-names:
> +        minItems: 1
> +        items:
> +          - const: gpio
> +          - const: mux
> +          - const: ds
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +    required:
> +      - reg
> +      - reg-names
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +
> +    additionalProperties: false

Move this above 'properties'

> +
> +  "^func-[0-9a-z-]+$":
> +    type: object
> +    patternProperties:
> +      "^group-[0-9a-z-]+$":
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml
> +
> +        required:
> +          - pinmux
> +    additionalProperties: false

Move this above 'patternProperties'

> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - ranges
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
> +    apb {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      periphs_pinctrl: pinctrl {
> +        compatible = "amlogic,pinctrl-a4";
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        gpio@14 {
> +          reg = <0 0x14 0 0x10>, <0 0x14 0 0x10>;

Both registers at the same address? I hope that's a typo.

> +          reg-names = "gpio", "mux";
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          gpio-ranges = <&periphs_pinctrl 0 8 10>;
> +        };
> +
> +        func-uart-b {
> +          group-default {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 1, 4)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +
> +          group-pins1 {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 5, 2)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +        };
> +
> +        func-uart-c {
> +          group-default {
> +            pinmux = <AML_PINMUX(AMLOGIC_GPIO_B, 3, 1)>,
> +                     <AML_PINMUX(AMLOGIC_GPIO_B, 2, 1)>;
> +            bias-pull-up;
> +            drive-strength-microamp = <4000>;
> +          };
> +        };
> +      };
> +    };
> diff --git a/include/dt-bindings/pinctrl/amlogic,pinctrl.h b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
> new file mode 100644
> index 000000000000..7d40aecc7147
> --- /dev/null
> +++ b/include/dt-bindings/pinctrl/amlogic,pinctrl.h
> @@ -0,0 +1,46 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright (c) 2024 Amlogic, Inc. All rights reserved.
> + * Author: Xianwei Zhao <xianwei.zhao@amlogic.com>
> + */
> +
> +#ifndef _DT_BINDINGS_AMLOGIC_PINCTRL_H
> +#define _DT_BINDINGS_AMLOGIC_PINCTRL_H
> +/* Normal PIN bank */
> +#define AMLOGIC_GPIO_A		0
> +#define AMLOGIC_GPIO_B		1
> +#define AMLOGIC_GPIO_C		2
> +#define AMLOGIC_GPIO_D		3
> +#define AMLOGIC_GPIO_E		4
> +#define AMLOGIC_GPIO_F		5
> +#define AMLOGIC_GPIO_G		6
> +#define AMLOGIC_GPIO_H		7
> +#define AMLOGIC_GPIO_I		8
> +#define AMLOGIC_GPIO_J		9
> +#define AMLOGIC_GPIO_K		10
> +#define AMLOGIC_GPIO_L		11
> +#define AMLOGIC_GPIO_M		12
> +#define AMLOGIC_GPIO_N		13
> +#define AMLOGIC_GPIO_O		14
> +#define AMLOGIC_GPIO_P		15
> +#define AMLOGIC_GPIO_Q		16
> +#define AMLOGIC_GPIO_R		17
> +#define AMLOGIC_GPIO_S		18
> +#define AMLOGIC_GPIO_T		19
> +#define AMLOGIC_GPIO_U		20
> +#define AMLOGIC_GPIO_V		21
> +#define AMLOGIC_GPIO_W		22
> +#define AMLOGIC_GPIO_X		23
> +#define AMLOGIC_GPIO_Y		24
> +#define AMLOGIC_GPIO_Z		25
> +
> +/* Special PIN bank */
> +#define AMLOGIC_GPIO_DV		26
> +#define AMLOGIC_GPIO_AO		27
> +#define AMLOGIC_GPIO_CC		28
> +#define AMLOGIC_GPIO_TEST_N	29
> +#define AMLOGIC_GPIO_ANALOG	30
> +
> +#define AML_PINMUX(bank, offset, mode)	(((((bank) << 8) + (offset)) << 8) | (mode))
> +
> +#endif /* _DT_BINDINGS_AMLOGIC_PINCTRL_H */
> 
> -- 
> 2.37.1
> 

