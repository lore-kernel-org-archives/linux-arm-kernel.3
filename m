Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 6B762CD0437
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  6 Jan 2026 04:34:20 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e9W1x3clAPae5FvpGm2Dr3QYLZITlWbf/ftE+MA/C0o=; b=IuN1wCT2WmUY2VdnwAp1WrWerA
	4EIfoHeZQyN9sCuRSjR5YI+4V0RwYXsqqYDiPaSwvaoT/ZZqZFv7fgYmgwBvXjmOzxEC/8sVUygkJ
	EYc9pME+sOhYkwnh+CVJ6ipSrh9RgwMWvpB70/qwROrkP3G5uDB/rSRvxWHBZ24uVZu4AtCeTXWQF
	PpRporGFNcBXgM68QOLc9wMj+WXsUVKf/6EJumUlPulpMkJcXOcQIXVSYwQgFmzMJPmcKtqlNihdr
	KbyhmHlV/IIs/CBgt7wCJi6sOZvbJjPBIzlRqARo3X6LcEBVMj1XIM6dlYn6OQhAKlErPJ8mNMyUE
	M6KXOOww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcyld-0000000CP8L-2aaY;
	Tue, 06 Jan 2026 04:34:01 +0000
Received: from mx.socionext.com ([202.248.49.38])
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vcyla-0000000CP7t-1c0k
	for linux-arm-kernel@lists.infradead.org;
	Tue, 06 Jan 2026 04:34:00 +0000
Received: from unknown (HELO iyokan3-ex.css.socionext.com) ([172.31.9.54])
  by mx.socionext.com with ESMTP; 06 Jan 2026 13:33:54 +0900
Received: from mail.mfilter.local (mail-arc01.css.socionext.com [10.213.46.36])
	by iyokan3-ex.css.socionext.com (Postfix) with ESMTP id 1E82D2091484;
	Tue,  6 Jan 2026 13:33:54 +0900 (JST)
Received: from iyokan3.css.socionext.com ([172.31.9.53]) by m-FILTER with ESMTP; Tue, 6 Jan 2026 13:33:53 +0900
Received: from [10.212.247.110] (unknown [10.212.247.110])
	by iyokan3.css.socionext.com (Postfix) with ESMTP id 0C09F10A003;
	Tue,  6 Jan 2026 13:33:53 +0900 (JST)
Message-ID: <2dde6891-a0e3-4e60-a773-302061a8e5a5@socionext.com>
Date: Tue, 6 Jan 2026 13:33:56 +0900
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2] dt-bindings: usb: Add Socionext Uniphier DWC3
 controller
To: "Rob Herring (Arm)" <robh@kernel.org>,
 Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
 Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley
 <conor+dt@kernel.org>, Masami Hiramatsu <mhiramat@kernel.org>
Cc: linux-usb@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260105162418.2842825-1-robh@kernel.org>
Content-Language: en-US
From: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>
In-Reply-To: <20260105162418.2842825-1-robh@kernel.org>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260105_203358_560544_A22A78A9 
X-CRM114-Status: GOOD (  18.93  )
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

On 2026/01/06 1:24, Rob Herring (Arm) wrote:
> The Socionext Uniphier DWC3 controller binding is already in use, but
> undocumented. It's a straight-forward binding similar to other DWC3
> bindings.
> 
> Signed-off-by: Rob Herring (Arm) <robh@kernel.org>
> ---
> v2:
>   - Allow 1 phy entry for Pro4
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
> index 000000000000..2b253339c199
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
> +    minItems: 1
> +    maxItems: 6
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

I've checked this with ARCH=arm and ARCH=arm64.

Reviewed-by: Kunihiko Hayashi <hayashi.kunihiko@socionext.com>

Thank you,

---
Best Regards
Kunihiko Hayashi

