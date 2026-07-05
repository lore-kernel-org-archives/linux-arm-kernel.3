Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 0AC2BC43458
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  5 Jul 2026 09:24:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=kEQyb/LC51AZrqltCLED85HWv0m0zHup+ymLpFMfzG4=; b=Jhh/hPGVfT2kqyuTMScB3NYpB8
	PlL8nVXXJFXOlo8Xo46YbFCIhkXZAPV1UvBN9DXeKWQOyJPpDv9HegSxOWWhOvfaTSGBEGA33+0RS
	spG85+PCzo3VzAkjCCDi7loEYmxa2dXp2KYwvPL5vg5gYl6w/G+Igk2TkzpceZE1AZnJX733kkzKE
	3zjPZ8kXgC2vwHvj7D7oucnJOC/6Lv1AopNjmsmUUMkJyO3UcbAP/t75wgKe0phhks1EqhGrJHmjC
	V2M291qznyS4W7NDEyWV35kJK4HHiC1gItAjFJbsnsLp/Xne/wX44wNReL33zXzeQBg812pbH4kbS
	i3PsRUUA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJ5Y-00000009CBr-1XHp;
	Sun, 05 Jul 2026 09:24:36 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wgJ5W-00000009CBl-3Jnm
	for linux-arm-kernel@lists.infradead.org;
	Sun, 05 Jul 2026 09:24:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5CF4760052;
	Sun,  5 Jul 2026 09:24:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4BDFD1F000E9;
	Sun,  5 Jul 2026 09:24:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783243473;
	bh=kEQyb/LC51AZrqltCLED85HWv0m0zHup+ymLpFMfzG4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=BCKw8uE8aeaPxfe9eF1fQSsTL861gYyhSbiXpG5pH4bY2YJJkieCmsPNwUO+z6grC
	 bIRKnNU/FaubAQkUEjecAVRT11Y/yuTTb2ZQ/axaesBbKuOSMWGwbqr7yVeCz+3GPS
	 ReIdTYJY1vWWQ/NI3Mi9Suq94/M9F5EpjR+4KKXN16wz85f68flyWEGv/5ccclJLxT
	 iCy7yZJW2Tb4B9kDknwVidSyEDAf42RK0BB3g70RKMwVGOsBqX+4fpvFEeGFmNIgg1
	 9rddmR/jjV1f+k/e+f7yNnFayGe+ryD5DbWFlOdClc5vhaXw3Di3iHiXX5oWXYu9U7
	 rY0LMCb36PrLA==
Date: Sun, 5 Jul 2026 11:24:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Mikhail Kalashnikov <iuncuim@gmail.com>
Cc: Vasily Khoruzhick <anarsoul@gmail.com>, 
	Yangtao Li <tiny.windzz@gmail.com>, "Rafael J . Wysocki" <rafael@kernel.org>, 
	Daniel Lezcano <daniel.lezcano@kernel.org>, Zhang Rui <rui.zhang@intel.com>, 
	Lukasz Luba <lukasz.luba@arm.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, linux-pm@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 1/5] dt-bindings: thermal: sun8i: Add A523 THS0/1
 controllers
Message-ID: <20260705-agate-partridge-of-biology-1a44ae@quoll>
References: <20260704171411.1413349-1-iuncuim@gmail.com>
 <20260704171411.1413349-2-iuncuim@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260704171411.1413349-2-iuncuim@gmail.com>
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

On Sun, Jul 05, 2026 at 01:14:07AM +0800, Mikhail Kalashnikov wrote:
> Add dt-bindings description of the thermal sensors in the A523 processor.
> 
> The controllers require activation of the additional frequency of the
> associated gpadc controller, so a mod clock property required.
> 
> The calibration data for both thermal controllers (THS0, THS1) is split
> across two nvmem cells at different offsets, requiring the two cells
> to be read and merged. To maintain backward compatibility, the name of
> the old cell remains "calibration" and the new cell is named
> "calibration-second-part".
> 
> Signed-off-by: Mikhail Kalashnikov <iuncuim@gmail.com>
> Reviewed-by: Chen-Yu Tsai <wens@kernel.org>
> ---
>  .../thermal/allwinner,sun8i-a83t-ths.yaml     | 54 +++++++++++++++++--
>  1 file changed, 51 insertions(+), 3 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> index 3e61689f6..6f5b2f3b9 100644
> --- a/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> +++ b/Documentation/devicetree/bindings/thermal/allwinner,sun8i-a83t-ths.yaml
> @@ -24,6 +24,8 @@ properties:
>        - allwinner,sun50i-h5-ths
>        - allwinner,sun50i-h6-ths
>        - allwinner,sun50i-h616-ths
> +      - allwinner,sun55i-a523-ths0
> +      - allwinner,sun55i-a523-ths1
>  
>    clocks:
>      minItems: 1
> @@ -47,11 +49,16 @@ properties:
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
> @@ -107,6 +114,7 @@ allOf:
>              enum:
>                - allwinner,sun8i-h3-ths
>                - allwinner,sun20i-d1-ths
> +              - allwinner,sun55i-a523-ths0
>  
>      then:
>        properties:
> @@ -132,6 +140,29 @@ allOf:
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

Missing clock-names

Look at other variants here, how they did it.

> +        nvmem-cells:
> +          minItems: 2
> +        nvmem-cell-names:
> +          minItems: 2
> +    else:
> +      properties:
> +        nvmem-cells:
> +          maxItems: 1
> +        nvmem-cell-names:

maxItems instead

> +          items:
> +            - const: calibration
> +
>  required:
>    - compatible
>    - reg
> @@ -176,4 +207,21 @@ examples:
>          #thermal-sensor-cells = <1>;
>      };
>  
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/sun55i-a523-ccu.h>
> +    #include <dt-bindings/reset/sun55i-a523-ccu.h>
> +
> +    thermal-sensor@2009400 {

You already have three examples, it is enough. Drop. Actually two would be
enough already...

Best regards,
Krzysztof


