Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB14E7719A
	for <linux-arm-kernel@archiver.kernel.org>; Sat, 11 Jan 2025 09:42:53 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=p0PvdyyA8A+UdtbGGyBfXQPktdqAIZJzrabZ5gBuj0c=; b=bmMuLoVEOiIkTx8xpMv8afxGXd
	bsqrg6wqDrFiCwdUK3zgFb/Mx0aGzxIjVJ1/+lp34NPjOX7Crn4Wxhhht6nrBBwOVK5wUWm9bz9KG
	AiwUqa7m+R3JgmZxkxLT6kGiZ7lbfT5/dv2XSxW69FrjCH+F2fbC6Z8jGKZxl9aWfFJkg4JQ/q9EG
	DWB9sckT/4N7hpTcu2Cwzw0QeII+SEYxUF+TpD3UphkbxxPMsrX3ADCyVLpeJ6mpmpV3fMidNVgf2
	rRwUajzOnvbH4eeqgkQbbHlQecTmT2Fuh8znf+ZQwO1R76fEVZcmn+a+MP7sftFa6h4NAIYPwMcKM
	Sa4Hu5Ag==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tWY0q-00000000Xcj-2PLq;
	Sat, 11 Jan 2025 09:42:36 +0000
Received: from nyc.source.kernel.org ([147.75.193.91])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tWXzd-00000000XVd-3S77;
	Sat, 11 Jan 2025 09:41:23 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5FBD0A406D8;
	Sat, 11 Jan 2025 09:39:32 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 84F75C4CED2;
	Sat, 11 Jan 2025 09:41:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1736588480;
	bh=N2CiOKl4IO7VYA0htePZV6dQy45186pHAoS2+zEndyY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JB8uxI4fL6BuzX4kp/L0rMg5AOp7YyL7Mhx0P7zggTV00JqJhkNBUEomUB/YKeeeR
	 cbnmiezAeb2+52k6SJXWLmoMW0CFF3UWyCGAROdDKUaWOa/N7OpVAiiJRagflEzdjk
	 e6DUwOtDZSIRblUgTJl2ghCHnyi/cah9nt8o/E/7u76ldJJvOGK+IfKc5qMoSl8tkL
	 H5zB6zrEtkG7meoOiHjyBrS96cBzw/02J3PY80jtTGsBrW5x8NpffpzV4AmBx4wTss
	 qvtDM2ePDGf1qj+3i+RxBSU2kzMzcw2eLh5cOXSbDP1zcSs1tQAi3+f1a9cBpF2QS1
	 c6WlqQBMyRxCw==
Date: Sat, 11 Jan 2025 10:41:16 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Cathy Xu <ot_cathy.xu@mediatek.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Matthias Brugger <matthias.bgg@gmail.com>, 
	AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>, Sean Wang <sean.wang@kernel.org>, Lei Xue <lei.xue@mediatek.com>, 
	wenbin.mei@mediatek.com, linux-gpio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-mediatek@lists.infradead.org, Guodong Liu <guodong.liu@mediatek.com>
Subject: Re: [PATCH v2 1/2] dt-bindings: pinctrl: mediatek: add support for
 mt8196
Message-ID: <dnjtaapqbn6zy55k5ky7zltswkbg7cjh2xwlnrmqdiz7tfm6rc@wbepc5koem6e>
References: <20250110104703.13625-1-ot_cathy.xu@mediatek.com>
 <20250110104703.13625-2-ot_cathy.xu@mediatek.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250110104703.13625-2-ot_cathy.xu@mediatek.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250111_014122_000855_9ED584B7 
X-CRM114-Status: GOOD (  29.27  )
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

On Fri, Jan 10, 2025 at 06:42:28PM +0800, Cathy Xu wrote:
> 1.Add pinctrl file on MediaTek mt8196.

Where? What is pinctrl file?

> 2.Add the new binding document for pinctrl on MediaTek mt8196.

Look at git history how commit msgs are written for such changes.

> 
> Signed-off-by: Guodong Liu <guodong.liu@mediatek.com>
> Signed-off-by: Cathy Xu <ot_cathy.xu@mediatek.com>
> ---
>  .../pinctrl/mediatek,mt8196-pinctrl.yaml      |  266 +++
>  include/dt-bindings/pinctrl/mt8196-pinfunc.h  | 1572 +++++++++++++++++
>  2 files changed, 1838 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
>  create mode 100644 include/dt-bindings/pinctrl/mt8196-pinfunc.h
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> new file mode 100644
> index 000000000000..abeb0d942cc4
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt8196-pinctrl.yaml
> @@ -0,0 +1,266 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt8196-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT8196 Pin Controller
> +
> +maintainers:
> +  - Lei Xue <lei.xue@mediatek.com>
> +  - Cathy Xu <ot_cathy.xu@mediatek.com>
> +
> +description:
> +  The MediaTek's MT8196 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt8196-pinctrl
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    description:
> +      Number of cells in GPIO specifier, should be two. The first cell is the
> +      pin number, the second cell is used to specify optional parameters which
> +      are defined in <dt-bindings/gpio/gpio.h>.
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true
> +
> +  reg:
> +    items:
> +      - description: gpio registers base address
> +      - description: rt group io configuration registers base address
> +      - description: rm1 group io configuration registers base address
> +      - description: rm2 group io configuration registers base address
> +      - description: rb group io configuration registers base address
> +      - description: bm1 group io configuration registers base address
> +      - description: bm2 group io configuration registers base address
> +      - description: bm3 group io configuration registers base address
> +      - description: lt group io configuration registers base address
> +      - description: lm1 group io configuration registers base address
> +      - description: lm2 group io configuration registers base address
> +      - description: lb1 group io configuration registers base address
> +      - description: lb2 group io configuration registers base address
> +      - description: tm1 group io configuration registers base address
> +      - description: tm2 group io configuration registers base address
> +      - description: tm3 group io configuration registers base address
> +
> +  reg-names:
> +    items:
> +      - const: iocfg0
> +      - const: iocfg_rt
> +      - const: iocfg_rm1
> +      - const: iocfg_rm2
> +      - const: iocfg_rb
> +      - const: iocfg_bm1
> +      - const: iocfg_bm2
> +      - const: iocfg_bm3
> +      - const: iocfg_lt
> +      - const: iocfg_lm1
> +      - const: iocfg_lm2
> +      - const: iocfg_lb1
> +      - const: iocfg_lb2
> +      - const: iocfg_tm1
> +      - const: iocfg_tm2
> +      - const: iocfg_tm3

Are you sure these are separate address spaces?

> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    description: The interrupt outputs to sysirq.
> +    maxItems: 1
> +
> +  mediatek,rsel-resistance-in-si-unit:
> +    type: boolean
> +    description:
> +      We provide two methods to select the resistance for I2C when pull up or
> +      pull down. The first is by RSEL definition value, another one is by
> +      resistance value(ohm). This flag is used to identify if the method is
> +      resistance(si unit) value.

What is the point of choosing it? This is one hardware, one SoC, so how
different boards can have different units? No, just use Ohms

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
> +        $ref: /schemas/pinctrl/pincfg-node.yaml
> +        additionalProperties: false
> +        description:
> +          A pinctrl node should contain at least one subnode representing the
> +          pinctrl groups available on the machine. Each subnode will list the
> +          pins it needs, and how they should be configured, with regard to muxer
> +          configuration, pullups, drive strength, input enable/disable and input
> +          schmitt.
> +
> +        properties:
> +          pinmux:
> +            description:
> +              Integer array, represents gpio pin number and mux setting.
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in dt-bindings/pinctrl/mt8196-pinfunc.h
> +              directly, for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          drive-strength-microamp:
> +            enum: [125, 250, 500, 1000]

Why duplicating properties? No, use only one.

> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8196 pull down PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8196 pull down RSEL type define value.
> +              - enum: [75000, 5000]
> +                description: mt8196 pull down RSEL type si unit value(ohm).
> +            description: |
> +              For pull down type is normal, it doesn't need add RSEL & R1R0
> +              define and resistance value.
> +              For pull down type is PUPD/R0/R1 type, it can add R1R0 define to
> +              set different resistance. It can support "MTK_PUPD_SET_R1R0_00" &
> +              "MTK_PUPD_SET_R1R0_01" & "MTK_PUPD_SET_R1R0_10" &
> +              "MTK_PUPD_SET_R1R0_11" define in mt8196.
> +              For pull down type is RSEL, it can add RSEL define & resistance
> +              value(ohm) to set different resistance by identifying property
> +              "mediatek,rsel-resistance-in-si-unit". It can support
> +              "MTK_PULL_SET_RSEL_000" & "MTK_PULL_SET_RSEL_001" &
> +              "MTK_PULL_SET_RSEL_010" & "MTK_PULL_SET_RSEL_011" &
> +              "MTK_PULL_SET_RSEL_100" & "MTK_PULL_SET_RSEL_101" &
> +              "MTK_PULL_SET_RSEL_110" & "MTK_PULL_SET_RSEL_111" define in
> +              mt8196. It can also support resistance value(ohm) "75000" & "5000"
> +              in mt8196.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +              - enum: [100, 101, 102, 103]
> +                description: mt8196 pull up PUPD/R0/R1 type define value.
> +              - enum: [200, 201, 202, 203, 204, 205, 206, 207]
> +                description: mt8196 pull up RSEL type define value.
> +              - enum: [1000, 1500, 2000, 3000, 4000, 5000, 10000, 75000]
> +                description: mt8196 pull up RSEL type si unit value(ohm).

Same problems.

> +++ b/include/dt-bindings/pinctrl/mt8196-pinfunc.h
> @@ -0,0 +1,1572 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2025 Mediatek Inc.
> + * Author: Guodong Liu <Guodong.Liu@mediatek.com>
> + */
> +
> +#ifndef __MT8196_PINFUNC_H
> +#define __MT8196_PINFUNC_H
> +
> +#include <dt-bindings/pinctrl/mt65xx.h>
> +
> +#define PINMUX_GPIO0__FUNC_GPIO0 (MTK_PIN_NO(0) | 0)
> +#define PINMUX_GPIO0__FUNC_DMIC1_CLK (MTK_PIN_NO(0) | 1)
> +#define PINMUX_GPIO0__FUNC_SPI3_A_MO (MTK_PIN_NO(0) | 3)
> +#define PINMUX_GPIO0__FUNC_FMI2S_B_LRCK (MTK_PIN_NO(0) | 4)
> +#define PINMUX_GPIO0__FUNC_SCP_DMIC1_CLK (MTK_PIN_NO(0) | 5)
> +#define PINMUX_GPIO0__FUNC_TP_GPIO14_AO (MTK_PIN_NO(0) | 6)

You got comment, so respond to it. Sending the same and expecting
different results is fast way to get a grumpy response.

Best regards,
Krzysztof


