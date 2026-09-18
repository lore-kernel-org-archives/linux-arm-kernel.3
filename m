Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 5D2F7C982D7
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 18 Sep 2026 09:54:30 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=oPIGgBDhH03Eoz0mlE8Uu2/zfLPJIqNjxdqPk5XPMcM=; b=WcsOAdslzlw5rCTDzOmsDZ+2C+
	tnuEf0I+ekB+G7+gpkbNeKvmMD4UHuy2Got+f+I2XV+fFZ1OxsmVcqeNtE8ojgJsFQxs2I6ORrdoz
	XAcx7l9C/OeR5jnq8STttQFrg0ZWX7fuAlJdvRcCntt+O0wzA4bT0dZQ07SnKlRSrauFUjbG5oyxB
	Vc+NqWojl4MKULrby6phAEakussqJgNpw9RSo1ZgRwv3I4xIafNdufJpR3mx/Jzbjz/dBqsB7HItx
	0RgeDajxygAvndM0FZ+n5ifzFGVInQtdJj8RYvLgOrxL4yYBz5LmnXsn1C89Ey8sRzx9pigm8I5kO
	NK7UMDTw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VIW-0000000E0An-23qe;
	Fri, 18 Sep 2026 09:54:24 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x7VIV-0000000E0AJ-2Jbr
	for linux-arm-kernel@lists.infradead.org;
	Fri, 18 Sep 2026 09:54:23 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 5955E60A59;
	Fri, 18 Sep 2026 09:54:21 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E59E51F000FF;
	Fri, 18 Sep 2026 09:54:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1789725261;
	bh=oPIGgBDhH03Eoz0mlE8Uu2/zfLPJIqNjxdqPk5XPMcM=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=XSpUbo6aq/Fg94VYY9JYLyXLx34uec7Fw47RkWYJ4pfm+uu78EGxeKVV6V69IV22H
	 5dZKgdRuaBMu3OM60N8HGkulPKH6/vQawO5YBLOnYKn/XwL6IQt+WDlFCsRnPXbuIx
	 p+y7H4+nyx29lm2fhzoKFznJyEuZyV73qidivvgmnFy84JDsde5qXN7jLc2xxc9Kd6
	 mg5/OoMT/wl61fJlFeBLYSb8Jqn2PcKmm5Ufj8+OHi369h+ziCnem36wKe9jKojjK7
	 DjFuO3q2jAv4lm1Uy/xp25sIyHuAJJn/Xf0WuiaCmfWqJMtpvaxm1LMsDheTyG/E5E
	 BJ8h1UhSH4RQg==
Date: Fri, 18 Sep 2026 11:54:16 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Selvarasu Ganesan <selvarasu.g@samsung.com>
Cc: peter.griffin@linaro.org, alim.akhtar@samsung.com, 
	gregkh@linuxfoundation.org, robh@kernel.org, conor+dt@kernel.org, Thinh.Nguyen@synopsys.com, 
	mani@kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-samsung-soc@vger.kernel.org, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, jh0801.jung@samsung.com, h10.kim@samsung.com, 
	dh10.jung@samsung.com, akash.m5@samsung.com, hongpooh.kim@samsung.com, 
	eomji.oh@samsung.com, shijie.cai@samsung.com, muhammed.ali@samsung.com, 
	thiagu.r@samsung.com
Subject: Re: [PATCH v2 2/3] dt-bindings: usb: Introduce samsung,snps-dwc3
Message-ID: <20260918-burgundy-marmoset-of-focus-c9b9a7@quoll>
References: <20260916122229.2604003-1-selvarasu.g@samsung.com>
 <CGME20260916122354epcas5p401fd6470d6cef75951af732b03aa5970@epcas5p4.samsung.com>
 <20260916122229.2604003-3-selvarasu.g@samsung.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260916122229.2604003-3-selvarasu.g@samsung.com>
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

On Wed, Sep 16, 2026 at 05:52:28PM +0530, Selvarasu Ganesan wrote:
> +maintainers:
> +  - Krzysztof Kozlowski <krzk@kernel.org>
> +  - Selvarasu Ganesan <selvarasu.g@samsung.com>
> +
> +description:
> +  Describes the DWC3 USB controller block implemented on Samsung Exynos SoCs.
> +
> +select:
> +  properties:
> +    compatible:
> +      contains:
> +        const: samsung,snps-dwc3
> +  required:
> +    - compatible

This select is not needed.

> +
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - samsung,exynos8855-dwc3
> +      - const: samsung,snps-dwc3

And this fallback is not really accurate. Samsung does not have snps
device, because snps is a vendor. Anyway, generic fallbacks should go
away, drop, so you are left with samsung,exynos8855-dwc3 only.

Filename should be then samsung,exynos8855-dwc3.yaml.

> +
> +  reg:
> +    maxItems: 1
> +
> +  power-domains:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    description: |
> +      Several clocks are used, depending on the variant. Typical ones are:
> +       - ref: Reference clock for SOF/ITP generation.
> +       - bus: Bus (APB) clock for register access.

You have only one variant, no? Or you mean one SoC has different
variants?

> +    minItems: 1
> +    maxItems: 4

Nope, you to list items.

> +
> +  clock-names:
> +    minItems: 1
> +    maxItems: 4
> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - interrupts
> +
> +allOf:
> +  - $ref: snps,dwc3-common.yaml#
> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,exynos8855-dwc3
> +    then:
> +      properties:
> +        clocks:
> +          minItems: 2
> +          maxItems: 2

How can it be two if you have ONLY one device in the binding and that
device has between 1 and 4?

This entire if is redundant, no? How many clocks do you actually have
there?

> +        clock-names:
> +          items:
> +            - const: ref
> +            - const: bus
> +
> +unevaluatedProperties: false

Best regards,
Krzysztof


