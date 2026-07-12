Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 52AB8C44501
	for <linux-arm-kernel@archiver.kernel.org>; Sun, 12 Jul 2026 14:35:31 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=7RWLP70+Lk7x6klHiPJCyXJm7RPKA7hKo0HmQbHzxBo=; b=msS6avgSAYj815xuEmgb+8oz3j
	86ThRml/B83OIIwbDfID3RQvKfKVsGU2BDFwOepeSQAjpiuQlBgLKYp7VSwuiPFEUBCTc8cHiE6j0
	KLql8b/2N5vbuMJvlzKN022Ry0lvSKJOOv8/V0kcPCQLkq1MJTFmhgGVWWemlhqDSqrHz61hoB9mJ
	BQyojTPj0U5EU/sTWKJj9uSFYtfcaCbW6zBiNn2P26E5sxRcijo6yHcaT4im/d6hNJexZgo+lYdat
	4C7vpcMtrh7wB7KHrxRIJxEbJaBQaKPXKyT6unc/o2nksjNpjsMRYms00GQfOdUwV2NXj3x4guPJ8
	r3Narncw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivH9-00000007WEl-2j2H;
	Sun, 12 Jul 2026 14:35:23 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wivH7-00000007WEb-2daw;
	Sun, 12 Jul 2026 14:35:21 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 9FBE3408CB;
	Sun, 12 Jul 2026 14:35:20 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 76F021F000E9;
	Sun, 12 Jul 2026 14:35:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1783866920;
	bh=7RWLP70+Lk7x6klHiPJCyXJm7RPKA7hKo0HmQbHzxBo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=HsT6GE5sB5DUFUCMRQkNuUttWd6ae45mL6NHMgYoLcwatlYsmmGzSSeuoN4SwpbrE
	 IT+svOg66VoMcq0agaiYVBUdh4MfFXYOqG05kS1le79jwP59Yp4T9iaTG5i20I3ixs
	 Hnaszlbs0H7ItxEj9ncxu9i5jFuSIos3/5l4v5CEhE9QKMDMsdmHvd6+AkQabYVoni
	 F2sHw1IjVBiS1c2Mb+vSl2dUIp0tOfGAOoxZl9wRxT+a0tQMz+q9AStLX47/3AFeM6
	 nbh+DJ3IHV9Gjuc0EqmNRToJTUwUNzS5FF7T/QznODpqDSXOU9y+wPKhxceobGSCG2
	 V9B0EoktaUhwQ==
Date: Sun, 12 Jul 2026 16:35:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Junhui Liu <junhui.liu@pigmoral.tech>
Cc: Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, Philipp Zabel <p.zabel@pengutronix.de>, 
	Paul Walmsley <pjw@kernel.org>, Palmer Dabbelt <palmer@dabbelt.com>, 
	Albert Ou <aou@eecs.berkeley.edu>, Alexandre Ghiti <alex@ghiti.fr>, 
	Richard Cochran <richardcochran@gmail.com>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org, 
	linux-riscv@lists.infradead.org, netdev@vger.kernel.org, Jerome Brunet <jbrunet@baylibre.com>
Subject: Re: [PATCH v2 1/8] dt-bindings: clk: sun60i-a733-ccu: Add allwinner
 A733 support
Message-ID: <20260712-sexy-polar-cuckoo-cefee4@quoll>
References: <20260711-a733-clk-v2-0-974d188cbe0c@pigmoral.tech>
 <20260711-a733-clk-v2-1-974d188cbe0c@pigmoral.tech>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260711-a733-clk-v2-1-974d188cbe0c@pigmoral.tech>
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

On Sat, Jul 11, 2026 at 04:10:27PM +0800, Junhui Liu wrote:
> +properties:
> +  "#clock-cells":
> +    const: 1
> +
> +  "#reset-cells":
> +    const: 1
> +

Please order according to DTS coding style. compatible is ALWAYS the
first, then reg. Then name ordering, so reset-cells go to the end.


> +  compatible:
> +    enum:
> +      - allwinner,sun60i-a733-ccu
> +      - allwinner,sun60i-a733-r-ccu
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 4
> +    maxItems: 7
> +
> +  clock-names:
> +    minItems: 4
> +    maxItems: 7
> +
> +required:
> +  - "#clock-cells"
> +  - "#reset-cells"

As well.

> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun60i-a733-ccu
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: High Frequency Oscillator (19.2MHz, 24MHz, or 26MHz)
> +            - description: Low Frequency Oscillator (usually at 32kHz)
> +            - description: Internal Oscillator
> +            - description: Low Frequency Oscillator fanout
> +
> +        clock-names:
> +          items:
> +            - const: hosc
> +            - const: losc
> +            - const: iosc
> +            - const: losc-fanout
> +
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun60i-a733-r-ccu
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: High Frequency Oscillator (19.2MHz, 24MHz, or 26MHz)
> +            - description: Low Frequency Oscillator (usually at 32kHz)
> +            - description: Internal Oscillator
> +            - description: System 24MHz Clock
> +            - description: Peripherals PLL 0 (200 MHz output)
> +            - description: Peripherals PLL 0 (300 MHz output)
> +            - description: Peripherals PLL 1 (300 MHz output)
> +
> +        clock-names:
> +          items:
> +            - const: hosc
> +            - const: losc
> +            - const: iosc
> +            - const: sys-24m
> +            - const: pll-periph0-200m
> +            - const: pll-periph0-300m
> +            - const: pll-periph1-300m
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    clock-controller@2002000 {
> +      compatible = "allwinner,sun60i-a733-ccu";
> +      reg = <0x02002000 0x2000>;
> +      clocks = <&osc>, <&rtc 0>, <&rtc 2>, <&rtc 1>;
> +      clock-names = "hosc", "losc", "iosc", "losc-fanout";
> +      #clock-cells = <1>;
> +      #reset-cells = <1>;
> +    };
> +
> +...
> diff --git a/include/dt-bindings/clock/sun60i-a733-ccu.h b/include/dt-bindings/clock/sun60i-a733-ccu.h
> new file mode 100644
> index 000000000000..6742070e3086
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun60i-a733-ccu.h

Filename must match compatible.

> @@ -0,0 +1,290 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */

Why different license than the binding?

> +/*
> + * Copyright (C) 2026 Junhui Liu <junhui.liu@pigmoral.tech>

...

> +#define CLK_BUS_DSC		257
> +#define CLK_CSI_MASTER0		258
> +#define CLK_CSI_MASTER1		259
> +#define CLK_CSI_MASTER2		260
> +#define CLK_CSI			261
> +#define CLK_BUS_CSI		262
> +#define CLK_ISP			263
> +#define CLK_RES_DCAP_24M	264
> +#define CLK_APB2JTAG		265
> +#define CLK_FANOUT_24M		266
> +#define CLK_FANOUT_12M		267
> +#define CLK_FANOUT_16M		268
> +#define CLK_FANOUT_25M		269
> +#define CLK_FANOUT_27M		270
> +#define CLK_FANOUT_PCLK		271
> +#define CLK_FANOUT0		272
> +#define CLK_FANOUT1		273
> +#define CLK_FANOUT2		274
> +#define CLK_FANOUT3		275
> +
> +#endif /* _DT_BINDINGS_CLK_SUN60I_A733_CCU_H_ */
> diff --git a/include/dt-bindings/clock/sun60i-a733-r-ccu.h b/include/dt-bindings/clock/sun60i-a733-r-ccu.h
> new file mode 100644
> index 000000000000..1d3845b483bf
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun60i-a733-r-ccu.h

Here as well and so on (other places as well).

Best regards,
Krzysztof


