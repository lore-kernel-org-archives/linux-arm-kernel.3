Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D82F3D5B87E
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 16 Dec 2025 01:21:03 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZyOwp6RmevGUbD/lNzWBfibKcK4CTFY+oYaPcmZD4u0=; b=WyJCuKLtCIZHAYNOKXwWlRy5nZ
	sTT4smv1EuwR0HyqqBwxRv8NDPnwvj8O72ae+FjIGk3uINz8THK5WS60KfswYaEctxvRIrRc9fqHn
	moyWQ3w7ieFyhBjIKHDY0Ziv1WafJzM+YE69X450jlYMD0HI34X4OXA8E/9SmHg6uVhHvSakWc2W9
	xfSNn62Q93baeARFjV9SuzeK5uZJAy4TNUbGvAeUPy8kThvEyoETWWAdR/rLvULln81wjkCmdc/gw
	lOx2XbcB0tOhv5nAuU8/1DTPsODjc8f8+TfROynj9IRrdbVdKvw7QEOMez68C+Ww/ftNmxoS477SM
	tOorFZXg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJkI-00000004UKi-1yLy;
	Tue, 16 Dec 2025 01:20:58 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vVJkF-00000004UJz-388N
	for linux-arm-kernel@lists.infradead.org;
	Tue, 16 Dec 2025 01:20:57 +0000
Received: from unknown (HELO kinkan3-ex.css.socionext.com) ([172.31.9.52])
  by mx.socionext.com with ESMTP; 16 Dec 2025 10:20:52 +0900
Received: from mail.mfilter.local (mail-arc02.css.socionext.com [10.213.46.40])
	by kinkan3-ex.css.socionext.com (Postfix) with ESMTP id 6651D2069FC4;
	Tue, 16 Dec 2025 10:20:52 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 16 Dec 2025 10:20:52 +0900
Received: from [10.212.247.110] (unknown [10.212.247.110])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 6BFA010A00E;
	Tue, 16 Dec 2025 10:20:51 +0900 (JST)
Message-ID: <0775e913-e531-44b5-b191-7ce0cf4d1e3a@socionext.com>
Date: Tue, 16 Dec 2025 10:20:54 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] dt-bindings: usb: Add Socionext Uniphier DWC3 controller
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20251215212507.3317805-1-robh@kernel.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20251215212507.3317805-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20251215_172055_908572_57D7928A 
X-CRM114-Status: GOOD (  18.71  )
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

Hi Rob,

On 2025/12/16 6:25, Rob Herring (Arm) wrote:
> The Socionext Uniphier DWC3 controller binding is already in use, but
> undocumented. It's a straight-forward binding similar to other DWC3
> bindings.

After being pointed out by Krzysztof at OSSJapan, I've checked the bindings
and was preparing some additions or fixes to resolve the warning.

It's almost the same as my proposal, however, I add a little.

> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
>   .../bindings/usb/socionext,uniphier-dwc3.yaml | 89 +++++++++++++++++++
>   1 file changed, 89 insertions(+)
>   create mode 100644
> Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> 
> diff --git
> a/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> new file mode 100644
> index 000000000000..892ae3458c1b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/usb/socionext,uniphier-dwc3.yaml
> @@ -0,0 +1,89 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/usb/socionext,uniphier-dwc3.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Socionext Uniphier SuperSpeed DWC3 USB SoC controller
> +
> +maintainers:
> +  - Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
> +  - Masami Hiramatsu <mhiramat@kernel.org>
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: socionext,uniphier-dwc3
> +  required:
> +    - compatible
> +
> +properties:
> +  compatible:
> +    items:
> +      - const: socionext,uniphier-dwc3
> +      - const: snps,dwc3
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    minItems: 1
> +    items:
> +      - description: Host or single combined interrupt
> +      - description: Peripheral interrupt
> +
> +  interrupt-names:
> +    minItems: 1
> +    items:
> +      - enum:
> +          - dwc_usb3
> +          - host
> +      - const: peripheral
There's no problem, but how about the following description
following snps,dwc3.yaml?

   interrupt-names:
     oneOf:
       - const: dwc_usb3
       - items:
           enum: [host, peripheral]

> +
> +  clocks:
> +    maxItems: 3
> +
> +  clock-names:
> +    items:
> +      - const: ref
> +      - const: bus_early
> +      - const: suspend
> +
> +  phys:
> +    description: 1 to 4 HighSpeed PHYs followed by 1 or 2 SuperSpeed PHYs
> +    minItems: 2
> +    maxItems: 6

Since Pro4 only has one PHY, so:
     minItems: 1

> +
> +  resets:
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +  - phys
> +
> +unevaluatedProperties: false
> +
> +allOf:
> +  - $ref: snps,dwc3.yaml#
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +
> +    usb@65a00000 {
> +        compatible = "socionext,uniphier-dwc3", "snps,dwc3";
> +        reg = <0x65a00000 0xcd00>;
> +        interrupt-names = "dwc_usb3";
> +        interrupts = <GIC_SPI 134 IRQ_TYPE_LEVEL_HIGH>;
> +        clock-names = "ref", "bus_early", "suspend";
> +        clocks = <&sys_clk 12>, <&sys_clk 12>, <&sys_clk 12>;
> +        resets = <&usb0_rst 15>;
> +        phys = <&usb0_hsphy0>, <&usb0_hsphy1>,
> +               <&usb0_ssphy0>, <&usb0_ssphy1>;
> +        dr_mode = "host";
> +    };

Thank you,

-- 
---
Best Regards
Kunihiko Hayashi

