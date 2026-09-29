Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 99BB0CA5FA5
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 29 Sep 2026 08:42:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5rtCPENpmtMMjeAjed2RbvlHNfF2BKBVrFP7DRlYUzs=; b=rS8mEDGTQqiqQjhNIxb54sLvdf
	50nfpmYpmLhNeB/xjLvAI5oveO4mCQrDJHtlXMLtnUExvGQbcivZLwwTxU3YMb+o7xWWhQVx9pSlx
	xylJLbRmLEB7W6q4luOY0sBVuyGkhNCOX6eGNBWFN8ZYkzuTc2gccP3wda/wIru/iX/aZ4AVkeZVH
	V8BLtz8A7y+ebiBQkA/4sgQPr+XJNwdkg+QTLY8WPBu/y24c+0KAwqO1ByaAhezFkivic9FC59DFr
	5AoU5TTH6TC0VVPwwjs+SBhKWIyTzwipVn2xmA0bdhLjssS6+IGnP6jRCeFLLzKE1EtAelubYmH2Q
	U28+bgfw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTQ4-00000002pRr-1eqC;
	Tue, 29 Sep 2026 08:42:36 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xBTQ3-00000002pRd-1ocO
	for linux-arm-kernel@lists.infradead.org;
	Tue, 29 Sep 2026 08:42:35 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7ACFF60A62;
	Tue, 29 Sep 2026 08:42:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32E2C1F00899;
	Tue, 29 Sep 2026 08:42:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790671354;
	bh=5rtCPENpmtMMjeAjed2RbvlHNfF2BKBVrFP7DRlYUzs=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=PZU69NbqSmv6V4oncymr1RvBFBZeu1qW6BHj8QQCiyA3HcVoQrT13YglXRwtGHAZI
	 6+1IRA492yJ650qrx1dj4OF7Ixz+dv6EYf5QJLH6e7dJxmZJH2g5bi746Cj8z+X2GO
	 1betMD3DDQcYIIgpP3fpXTZzYOcjHpjo8ob+yuoNjl2BWRkd8wDJSkJxTPqyqM2+qn
	 tJKERAehFlFPXWukoY3A8WbW5HcyXOpbLCL9PZUvYcp7a9vIMUtlH+r5zFK+9rvVnB
	 h2tZNORlQLJlGs+oaLNdBo9kZKABlzT4RvZ9RYz4FvpAFdsBynq/kLeOA0F+q+tdK8
	 O7c6BAAdXffTA==
Date: Tue, 29 Sep 2026 10:42:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Stephen Boyd <sboyd@kernel.org>, Brian Masney <bmasney+clk@redhat.com>, 
	Jerome Brunet <jbrunet+clk@baylibre.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Chen-Yu Tsai <wens@kernel.org>, Jernej Skrabec <jernej.skrabec@gmail.com>, 
	Samuel Holland <samuel@sholland.org>, linux-clk@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-sunxi@lists.linux.dev
Subject: Re: [PATCH v3 2/4] dt-bindings: clock: sun55i-a523-ccu: Add A523 CPU
 CCU clock controller
Message-ID: <20260929-aggressive-uptight-rattlesnake-35fdca@quoll>
References: <20260925225112.14081-1-andre.przywara@arm.com>
 <20260925225112.14081-3-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260925225112.14081-3-andre.przywara@arm.com>
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

On Sat, Sep 26, 2026 at 12:51:10AM +0200, Andre Przywara wrote:
> There are four clock controllers in the A523 SoC, but only three are
> described in the DT binding so far.
> 
> Add a description for the CPU CCU, which provides separate clocks for
> the two CPU clusters and the DSU interconnect.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../clock/allwinner,sun55i-a523-ccu.yaml      | 38 ++++++++++++++++++-
>  .../dt-bindings/clock/sun55i-a523-cpu-ccu.h   | 13 +++++++
>  2 files changed, 50 insertions(+), 1 deletion(-)
>  create mode 100644 include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> index 58be701a720ea..8d5481fb63ae8 100644
> --- a/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> +++ b/Documentation/devicetree/bindings/clock/allwinner,sun55i-a523-ccu.yaml
> @@ -19,6 +19,7 @@ properties:
>    compatible:
>      enum:
>        - allwinner,sun55i-a523-ccu
> +      - allwinner,sun55i-a523-cpu-ccu
>        - allwinner,sun55i-a523-mcu-ccu
>        - allwinner,sun55i-a523-r-ccu
>  
> @@ -35,12 +36,23 @@ properties:
>  
>  required:
>    - "#clock-cells"
> -  - "#reset-cells"
>    - compatible
>    - reg
>    - clocks
>    - clock-names
>  
> +if:

This goes to the allOf block.

> +  properties:
> +    compatible:
> +      contains:
> +        const: allwinner,sun55i-a523-cpu-ccu
> +then:
> +  properties:
> +    "#reset-cells": false
> +else:
> +  required:
> +    - "#reset-cells"
> +
>  allOf:
>    - if:
>        properties:
> @@ -64,6 +76,30 @@ allOf:
>              - const: iosc
>              - const: losc-fanout
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-cpu-ccu
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: High Frequency Oscillator (usually at 24MHz)
> +            - description: Low Frequency Oscillator (usually at 32kHz)
> +            - description: Internal Oscillator
> +            - description: Peripherals PLL 0 (1200 MHz output)
> +            - description: Peripherals PLL 0 (600 MHz output)
> +
> +        clock-names:
> +          items:
> +            - const: hosc
> +            - const: losc
> +            - const: iosc
> +            - const: pll-periph0-2x
> +            - const: pll-periph0-600m
> +
>    - if:
>        properties:
>          compatible:
> diff --git a/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h
> new file mode 100644
> index 0000000000000..042f2310f64de
> --- /dev/null
> +++ b/include/dt-bindings/clock/sun55i-a523-cpu-ccu.h

Filename should match compatible.

> @@ -0,0 +1,13 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR MIT) */
> +/*
> + * Copyright 2025 Arm Ltd.
> + */
> +
> +#ifndef _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> +#define _DT_BINDINGS_CLK_SUN55I_A523_CPU_CCU_H_
> +
> +#define CLK_CPU_L		7

Indices start from 0 or 1

Best regards,
Krzysztof


