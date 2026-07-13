Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BEB67C43458
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 13 Jul 2026 08:08:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=MEeeYFyr6eqQ/yT6VFmPtdxuuTe5rnxsXWSzOBfUurk=; b=wLr1TdhztB9y/rV1cpIp7AagDV
	XTh9oKK5NnKDcGJrCQcLddudEE7eqtN1XNrJxxwA4jpWntEIe7qKoHNFGcOkhzrw2YGa37pdQopOV
	g33KM++yY8YSjVK0xEyfXq/8cntpaH3r8qWwui7vjVc3mZWxQWTOcEmIHldC0QEAsZqqCnq8Ko2eL
	57ZAXKCWYlF5fRxtw8MfNlRi6uboiS/BsI3junaX4xMkudgNRqhd6s/rMj2HZwcd/mzl9ht1xlzCc
	cbtlfl/r6xi4QugwCQoYspNONlpoRd3suNTw/MsEEGxum9tW3aedVH/0fFkJgbYXjLZfiK+ycJ5kr
	crbEEagg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBi8-00000008Wq2-2c6f;
	Mon, 13 Jul 2026 08:08:20 +0000
Received: from bali.collaboradmins.com ([2a01:4f8:201:9162::2])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wjBi5-00000008Woj-1Bvi;
	Mon, 13 Jul 2026 08:08:19 +0000
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=collabora.com;
	s=mail; t=1783930094;
	bh=5Gulp6YHmUD9b3fvimUkpa5ZWbQVBzBtsKiZATPO1D4=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To:From;
	b=Ks9TfYWcOMNtwHAMq9y2TshVKSqsPnTrzZLVu1MdLLeTHQhN2SD9OQ7jRtkwzMYO2
	 ernmPMaCIpBClv0WD5UNggmoRK7FkNXXJSchLPQpH2DVZiu+4mMjpUFaMWH9P2O4Kz
	 emLNvqkYYieQCrXPug3DIaeZhnS3R8AuE573trGH7vwjMepbGKeSCAz8EZB3oOM6Fy
	 HwVsqquKTuYgSi/RxKQxdMIBOmm3tq91tlxQ7RY/YnOjVDjF6n8kqRNoH+POANw3F/
	 2EF3WXoaiNyxJqi6PCQ/8kNw/sE2OoQznhXOg8MWWgjtoAJ+rld37FnZNB3APQjA4B
	 qAZq2iyUALtHQ==
Received: from [100.64.1.21] (unknown [100.64.1.21])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange x25519 server-signature RSA-PSS (4096 bits) server-digest SHA256)
	(No client certificate requested)
	(Authenticated sender: kholk11)
	by bali.collaboradmins.com (Postfix) with ESMTPSA id 722CE17E05D3;
	Mon, 13 Jul 2026 10:08:13 +0200 (CEST)
Message-ID: <91800497-a452-40fb-9520-a9926b437eed@collabora.com>
Date: Mon, 13 Jul 2026 10:08:12 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 1/3] dt-bindings: pinctrl: mediatek: Add MT6858
To: nikolai.burov@jolla.com, Linus Walleij <linusw@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Matthias Brugger
 <matthias.bgg@gmail.com>, Sean Wang <sean.wang@kernel.org>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
 linux-mediatek@lists.infradead.org,
 Nikolai Burov <nikolai.burov+review@abscue.de>
References: <20260710-mt6858-pinctrl-v1-0-f75ab558f0df@jolla.com>
 <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
From: AngeloGioacchino Del Regno <angelogioacchino.delregno@collabora.com>
Content-Language: en-US
In-Reply-To: <20260710-mt6858-pinctrl-v1-1-f75ab558f0df@jolla.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.9.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260713_010817_488941_A827BA52 
X-CRM114-Status: GOOD (  18.69  )
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

On 7/10/26 17:00, Nikolai Burov via B4 Relay wrote:
> From: Nikolai Burov <nikolai.burov@jolla.com>
> 
> Add new DT bindings for the pin controller found in the MT6858
> (MediaTek Dimensity 7100) SoC.
> 
> Signed-off-by: Nikolai Burov <nikolai.burov@jolla.com>
> ---
>   .../bindings/pinctrl/mediatek,mt6858-pinctrl.yaml  | 190 +++++++++++++++++++++
>   1 file changed, 190 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
> new file mode 100644
> index 000000000000..263830a6e9db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pinctrl/mediatek,mt6858-pinctrl.yaml
> @@ -0,0 +1,190 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pinctrl/mediatek,mt6858-pinctrl.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: MediaTek MT6858 Pin Controller
> +
> +maintainers:
> +  - Nikolai Burov <nikolai.burov@jolla.com>
> +
> +description:
> +  The MediaTek's MT6858 Pin controller is used to control SoC pins.
> +
> +properties:
> +  compatible:
> +    const: mediatek,mt6858-pinctrl
> +
> +  reg:
> +    items:
> +      - description: gpio base
> +      - description: lm group IO
> +      - description: rb group IO
> +      - description: bm2 group IO
> +      - description: bm group IO
> +      - description: bm1 group IO

bm group io
bm1 group io
bm2 group io

> +      - description: lt group IO
> +      - description: lt1 group IO
> +      - description: rt group IO
> +      - description: rt1 group IO
> +      - description: eint-s group IO
> +      - description: eint-w group IO
> +      - description: eint-e group IO
> +      - description: eint-c group IO

description: eint-south group io
eint-west
eint-east
eint-center

> +
> +  reg-names:
> +    items:
> +      - const: base
> +      - const: lm
> +      - const: rb
> +      - const: bm2
> +      - const: bm
> +      - const: bm1

Obviously, same comment applies here.

> +      - const: lt
> +      - const: lt1
> +      - const: rt
> +      - const: rt1
> +      - const: eint-s
> +      - const: eint-w
> +      - const: eint-e
> +      - const: eint-c

eint0
eint1
eint2
eint3

P.S.: Don't forget to update the example too!

Cheers,
Angelo

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  gpio-ranges:
> +    maxItems: 1
> +
> +  gpio-line-names: true
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
> +              Supported pin number and mux varies for different SoCs, and are
> +              defined as macros in arch/arm64/boot/dts/mediatek/mt6858-pinfunc.h
> +              for this SoC.
> +
> +          drive-strength:
> +            enum: [2, 4, 6, 8, 10, 12, 14, 16]
> +
> +          bias-pull-down:
> +            oneOf:
> +              - type: boolean
> +                description: normal pull down.
> +              - enum: [100, 101, 102, 103]
> +                description: PUPD/R1/R0 pull down type. See MTK_PUPD_SET_R1R0_
> +                  defines in dt-bindings/pinctrl/mt65xx.h.
> +              - enum: [200, 201, 202, 203]
> +                description: RSEL pull down type. See MTK_PULL_SET_RSEL_ defines
> +                  in dt-bindings/pinctrl/mt65xx.h.
> +
> +          bias-pull-up:
> +            oneOf:
> +              - type: boolean
> +                description: normal pull up.
> +              - enum: [100, 101, 102, 103]
> +                description: PUPD/R1/R0 pull up type. See MTK_PUPD_SET_R1R0_
> +                  defines in dt-bindings/pinctrl/mt65xx.h.
> +              - enum: [200, 201, 202, 203]
> +                description: RSEL pull up type. See MTK_PULL_SET_RSEL_ defines
> +                  in dt-bindings/pinctrl/mt65xx.h.
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
> +    #include <dt-bindings/pinctrl/mt65xx.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #define PINMUX_GPIO149__FUNC_SCL5 (MTK_PIN_NO(149) | 1)
> +    #define PINMUX_GPIO150__FUNC_SDA5 (MTK_PIN_NO(150) | 1)
> +
> +    pio: pinctrl@10005000 {
> +        compatible = "mediatek,mt6858-pinctrl";
> +        reg = <0x10005000 0x1000>,
> +              <0x11b20000 0x1000>,
> +              <0x11c10000 0x1000>,
> +              <0x11d10000 0x1000>,
> +              <0x11d30000 0x1000>,
> +              <0x11d40000 0x1000>,
> +              <0x11e20000 0x1000>,
> +              <0x11e30000 0x1000>,
> +              <0x11ed0000 0x1000>,
> +              <0x11ee0000 0x1000>,
> +              <0x11b00000 0x1000>,
> +              <0x11e60000 0x1000>,
> +              <0x11e80000 0x1000>,
> +              <0x1c01e000 0x1000>;
> +        reg-names = "base", "lm", "rb", "bm2", "bm", "bm1", "lt", "lt1",
> +                    "rt", "rt1", "eint-s", "eint-w", "eint-e", "eint-c";
> +        gpio-controller;
> +        #gpio-cells = <2>;
> +        gpio-ranges = <&pio 0 0 197>;
> +        interrupt-controller;
> +        interrupts = <GIC_SPI 239 IRQ_TYPE_LEVEL_HIGH 0>;
> +        #interrupt-cells = <2>;
> +
> +        i2c5-pins {
> +            pins {
> +                pinmux = <PINMUX_GPIO149__FUNC_SCL5>,
> +                         <PINMUX_GPIO150__FUNC_SDA5>;
> +                bias-disable;
> +            };
> +        };
> +    };
> 

