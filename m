Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C1E9C83F09
	for <linux-arm-kernel@archiver.kernel.org>; Tue,  8 Jul 2025 21:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=88Jy9nRaNbiJf/UJMSU1sxeSxDA4k9Az6CO4gOFGt+M=; b=pmZl5nDs0TZewJi8LdrTUs1o+f
	VVQXMO38ylHI6/6PZm8iMmbKPYdqKlnfvSovM6/OF9YeX+7YGiJVdJBnzWaZ5p5VSAR3l4hAeFYkf
	i0MkSTB3a4AMHZl/AyRu41KdaGCqEfE75MKFPhzxCCrFm4TLvr3qfgp7KR603HBoIABwzDXxNWOfg
	ubKfoo5AwXSX9JgKn8MX9lgueIp1/XOcKKcKoIS0IPLSJRhKy6W7zZo65ukprldQfWEzx0XbMjUpd
	rVL4gNN6RogxIH2UKirO2UbZgzYZqMtBiAh3VuPqBT50fMKgikEze/kKiQXBpZYRJe87OHUkzAyC0
	q+06ZGKA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZG07-00000006gPx-16zo;
	Tue, 08 Jul 2025 21:37:19 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZFu7-00000006fhP-1Z4s
	for linux-arm-kernel@lists.infradead.org;
	Tue, 08 Jul 2025 21:31:08 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 83F56A544AA;
	Tue,  8 Jul 2025 21:31:06 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0F3F5C4CEED;
	Tue,  8 Jul 2025 21:31:05 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752010266;
	bh=muHKFMk3+FAqjA0IzFbxIYjKJ0jfprPa6PDJaUth2bE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=FGVcmEvmklitC/oRvIIlzZDODGrxGHGZMrPtrgRGSFM4SODotqhCuqlMpYIaMZTd8
	 oAq0yve0BQTlIu+xdjj0pDceX0WMK/IAwinjabWbHUp9n0rqXL2XWbl2advUAWFdFQ
	 KLRHLRDy7tn1GtMOMk+rkqnbwQ8R1DNJmNDOzpKnJi2FR5CK11s8qQod+3dUbRoOXn
	 aAk6+sRmRRENypWzalxuvmE3SWwpfzj49366mHzVCtedI+CtjurXdkou89KYFBm934
	 vad1SKWyOf3050iK9v3LZ9HU45NoX0coAkK+GgQhfbRpyiX5lcgBZ1gD01C3AsPL1r
	 6wyjO1oLjv++g==
Date: Tue, 8 Jul 2025 16:31:05 -0500
From: Rob Herring <robh@kernel.org>
To: iuncuim <iuncuim@gmail.com>
Cc: Srinivas Kandagatla <srini@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>,
	Vasily Khoruzhick <anarsoul@gmail.com>,
	Yangtao Li <tiny.windzz@gmail.com>,
	"Rafael J . Wysocki" <rafael@kernel.org>,
	Daniel Lezcano <daniel.lezcano@linaro.org>,
	Zhang Rui <rui.zhang@intel.com>, Lukasz Luba <lukasz.luba@arm.com>,
	Philipp Zabel <p.zabel@pengutronix.de>,
	Maxime Ripard <mripard@kernel.org>, devicetree@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev,
	linux-kernel@vger.kernel.org, linux-pm@vger.kernel.org
Subject: Re: [PATCH v2 2/8] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
Message-ID: <20250708213105.GA1082606-robh@kernel.org>
References: <20250703151132.2642378-1-iuncuim@gmail.com>
 <20250703151132.2642378-3-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250703151132.2642378-3-iuncuim@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250708_143107_539567_0F43394D 
X-CRM114-Status: GOOD (  22.51  )
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

On Thu, Jul 03, 2025 at 11:11:26PM +0800, iuncuim wrote:
> From: Mikhail Kalashnikov <iuncuim@gmail.com>
> 
> Add a binding for D1/T113s thermal sensor controller. Add dt-bindings
> description of the thermal sensors in the A523 processor.
> The controllers require activation of the additional frequency of the
> associated gpadc controller, so a new clock property has been added.
> 
> The calibration data is split into two cells that are in different areas
> of nvmem. Both controllers require access to both memory cell, so a new
> property nvmem-cells has been added. To maintain backward compatibility,
> the name of the old cell remains the same and the new nvmem-cell-names is
> called calibration-second-part
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 49 +++++++++++++++++--
>  1 file changed, 46 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> index 3e61689f6..80657435a 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> @@ -24,18 +24,22 @@ properties:
>        - allwinner,sun50i-h5-ths
>        - allwinner,sun50i-h6-ths
>        - allwinner,sun50i-h616-ths
> +      - allwinner,sun55i-a523-ths0
> +      - allwinner,sun55i-a523-ths1
>  
>    clocks:
>      minItems: 1
>      items:
>        - description: Bus Clock
>        - description: Module Clock
> +      - description: GPADC Clock

You add a 3rd clock for everyone, but I don't see a conditional schema 
keeping the existing users at 2 clocks (maxItems: 2).

>  
>    clock-names:
>      minItems: 1
>      items:
>        - const: bus
>        - const: mod
> +      - const: gpadc
>  
>    reg:
>      maxItems: 1
> @@ -47,11 +51,16 @@ properties:
>      maxItems: 1
>  
>    nvmem-cells:
> -    maxItems: 1
> -    description: Calibration data for thermal sensors
> +    minItems: 1
> +    items:
> +      - description: Calibration data for thermal sensors
> +      - description: Additional cell in case of separate calibration data
>  
>    nvmem-cell-names:
> -    const: calibration
> +    minItems: 1
> +    items:
> +      - const: calibration
> +      - const: calibration-second-part
>  
>    allwinner,sram:
>      maxItems: 1
> @@ -107,6 +116,7 @@ allOf:
>              enum:
>                - allwinner,sun8i-h3-ths
>                - allwinner,sun20i-d1-ths
> +              - allwinner,sun55i-a523-ths0
>  
>      then:
>        properties:
> @@ -132,6 +142,26 @@ allOf:
>          - clock-names
>          - resets
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - allwinner,sun55i-a523-ths0
> +              - allwinner,sun55i-a523-ths1
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +        clock-names:
> +          items:
> +            - const: bus
> +            - const: gpadc

But if there's really still just 2 clocks, you need the last entry to be 
'enum: [ mod, gpadc ]'

Though really, how can this h/w now not have a clock for itself? 


> +        nvmem-cells:
> +          minItems: 2
> +        nvmem-cell-names:
> +          minItems: 2

Everyone else needs 'maxItems: 1'

> +
>  required:
>    - compatible
>    - reg
> @@ -176,4 +206,17 @@ examples:
>          #thermal-sensor-cells = <1>;
>      };
>  
> +  - |
> +    thermal-sensor@2009400 {
> +      compatible = "allwinner,sun55i-a523-ths1";
> +      reg = <0x02009400 0x400>;
> +      interrupts = <GIC_SPI 62 IRQ_TYPE_LEVEL_HIGH>;
> +      clocks = <&ccu CLK_BUS_THS>, <&ccu CLK_GPADC1>;
> +      clock-names = "bus", "gpadc";
> +      resets = <&ccu RST_BUS_THS>;
> +      nvmem-cells = <&ths_calibration0>, <&ths_calibration1>;
> +      nvmem-cell-names = "calibration",
> +             "calibration-second-part";
> +      #thermal-sensor-cells = <1>;
> +    };
>  ...
> -- 
> 2.49.0
> 

