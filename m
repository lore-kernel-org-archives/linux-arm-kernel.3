Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id B7896C55165
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Jul 2026 14:12:01 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=xOfZ1XZtmIGv5xPs/JpL5IA5kDeBp4wZjvToK2htZEg=; b=afO+2CFDPjDjCPMEeh92Vn+TQQ
	lz6kREvJknCCRQ1UgYh/SfsLbpkjCTR0fXF40gfQl2kNKq6VoFMA/SEZ+YdJImvGyv8r3MOmjzkEw
	bvj6mhV/0gj0Q2PXu0Cz0VL7tDfqrnJqNoWMmbiG+ZHtIw/gufXKdLJIi7HUoYklJZzUb1pHQKTVp
	vVrbWY/3vCAgwOu82z9V33iLi4aNlXJLIPjf8FVNv2y2DX9pZ11//72Q1uI60kNN1B3dJV4q6Ew2f
	Y56zAEg8lpjV7Eo7+jxbrW2ntuorXCxQxkgr51TfVOyl7W+ymSLixXEDyJ7oDM+vsTJCbvrhnH9BM
	sftE+DaQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRUF-0000000AiFe-13op;
	Thu, 30 Jul 2026 14:11:51 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wpRUE-0000000AiFG-1EiM
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Jul 2026 14:11:50 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A120B40204;
	Thu, 30 Jul 2026 14:11:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 70AC31F000E9;
	Thu, 30 Jul 2026 14:11:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785420709;
	bh=xOfZ1XZtmIGv5xPs/JpL5IA5kDeBp4wZjvToK2htZEg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=Z8vLubTbVrC5ggTk1y2XualK8J6337oJ22xbo6bslpP7b4zn0dWTkMpUIQ9r2F1vd
	 wVgQx4rddZtSPRahJAUSCohb8kgDwjkOe/0FJzH9ieNLIiG6MR96um9+5hEimKYvL/
	 al4vXaF0SYqn4yr3k9vm1F4IHLxrex+cFKMj2FP2iwvdYCeY1dESMqfjP+wKT1aSAZ
	 DOyOQN5S1xNyPYjdZL9wIk5mMYrO+1bNzh1stF/vmBLT6xHQnRp4VP8U81ldpWcz6t
	 jEgq4ctZt4/UPYwlQeQl+RD46/tA3FfeX5ZVxDfq/wxEzU60d6kQ+0ZhQ/eG3ndBTN
	 mjIFhls78msYw==
Date: Thu, 30 Jul 2026 09:11:48 -0500
From: Rob Herring <robh@kernel.org>
To: Long Zhao <longzhao@ambarella.com>
Cc: Arnd Bergmann <arnd@arndb.de>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	linux-arm-kernel@lists.infradead.org, soc@lists.linux.dev,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>, linux-clk@vger.kernel.org,
	Linus Walleij <linusw@kernel.org>, linux-gpio@vger.kernel.org,
	Greg Kroah-Hartman <gregkh@linuxfoundation.org>,
	Jiri Slaby <jirislaby@kernel.org>, linux-serial@vger.kernel.org,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 03/10] dt-bindings: clock: add Ambarella CV75 RCT clock
 controller
Message-ID: <20260730141148.GA2828054-robh@kernel.org>
References: <20260730104330.81367-1-longzhao@ambarella.com>
 <20260730104330.81367-4-longzhao@ambarella.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20260730104330.81367-4-longzhao@ambarella.com>
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

On Thu, Jul 30, 2026 at 06:43:23PM +0800, Long Zhao wrote:
> Add the CV75 RCT clock controller binding and clock ID header.
> 
> Signed-off-by: Long Zhao <longzhao@ambarella.com>
> ---
>  .../bindings/clock/ambarella,cv75-rct.yaml    | 94 +++++++++++++++++++
>  .../dt-bindings/clock/ambarella,cv75-clock.h  | 17 ++++
>  2 files changed, 111 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
>  create mode 100644 include/dt-bindings/clock/ambarella,cv75-clock.h
> 
> diff --git a/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
> new file mode 100644
> index 000000000000..5ff5b6a4a0b9
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/clock/ambarella,cv75-rct.yaml
> @@ -0,0 +1,94 @@
> +# SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/clock/ambarella,cv75-rct.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Ambarella CV75 RCT Clock Controller
> +
> +maintainers:
> +  - Long Zhao <longzhao@ambarella.com>
> +
> +description: |
> +  The RCT (Reset and Clock Tree) block on the Ambarella CV75 SoC provides
> +  PLLs, clock muxes and dividers for on-chip peripherals.
> +
> +  The same register region is also exposed as a syscon for other drivers
> +  (e.g. pin drive-strength), hence the "syscon" compatible.
> +
> +  Clock indices are defined in
> +  include/dt-bindings/clock/ambarella,cv75-clock.h:
> +
> +  - CV75_GCLK_UART0: UART0 mux/div clock
> +  - CV75_GCLK_CORE: Core PLL (gclk_core)
> +  - CV75_GCLK_AHB: AHB bus clock (core / 2)
> +  - CV75_GCLK_APB: APB bus clock (core / 4)
> +
> +allOf:
> +  - $ref: /schemas/mfd/syscon-common.yaml#

Drop this.

> +
> +properties:
> +  $nodename:
> +    pattern: "^clock-controller(@.*)?$"

"^clock-controller@"

unit-address is not optional.

> +
> +  compatible:
> +    items:
> +      - const: ambarella,cv75-rct
> +      - const: syscon
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description: Reference crystal oscillator (typically 24 MHz)
> +    maxItems: 1
> +
> +  clock-names:
> +    const: osc
> +
> +  "#clock-cells":
> +    const: 1
> +

> +  assigned-clocks: true
> +
> +  assigned-clock-parents: true
> +
> +  assigned-clock-rates: true

Drop. These are implicitly allowed for any node with 'clocks'.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - clock-names
> +  - "#clock-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/ambarella,cv75-clock.h>
> +
> +    / {
> +        compatible = "ambarella,cv75-evk", "ambarella,cv75";
> +        #address-cells = <2>;
> +        #size-cells = <2>;

Drop all this, not relevant to this binding.

> +
> +        osc: oscillator {
> +            compatible = "fixed-clock";
> +            #clock-cells = <0>;
> +            clock-output-names = "osc";
> +            clock-frequency = <24000000>;
> +        };

Drop. We don't put providers in examples.

> +
> +        rct: clock-controller@ed080000 {
> +            compatible = "ambarella,cv75-rct", "syscon";
> +            reg = <0xff 0xed080000 0x0 0x1000>;
> +            clocks = <&osc>;
> +            clock-names = "osc";
> +            #clock-cells = <1>;
> +
> +            assigned-clocks = <&rct CV75_GCLK_UART0>;
> +            assigned-clock-parents = <&osc>;
> +            assigned-clock-rates = <24000000>;
> +        };
> +    };
> diff --git a/include/dt-bindings/clock/ambarella,cv75-clock.h b/include/dt-bindings/clock/ambarella,cv75-clock.h
> new file mode 100644
> index 000000000000..3d3314446e75
> --- /dev/null
> +++ b/include/dt-bindings/clock/ambarella,cv75-clock.h
> @@ -0,0 +1,17 @@
> +/* SPDX-License-Identifier: GPL-2.0-only OR BSD-2-Clause */
> +/*
> + * Copyright (C) 2026 Ambarella, Inc.
> + */
> +
> +#ifndef _DT_BINDINGS_CLOCK_AMBARELLA_CV75_CLOCK_H
> +#define _DT_BINDINGS_CLOCK_AMBARELLA_CV75_CLOCK_H
> +
> +/* Boot / bus clocks */
> +#define CV75_GCLK_UART0                0
> +#define CV75_GCLK_CORE         1
> +#define CV75_GCLK_AHB          2
> +#define CV75_GCLK_APB          3
> +
> +#define CV75_CLK_NUM           4
> +
> +#endif
> --
> 2.34.1
> 
> NOTE: This email (including attachments) contain Ambarella Proprietary and/or Confidential Information and is intended solely for the use of the individual(s) to whom it is addressed. Any unauthorized review, use, disclosure, distribute, copy, or print is prohibited. If you are not an intended recipient, please contact the sender by reply email and destroy all copies of the original message. Thank you.

You must remove this or we can't do anything with your patches.

Rob

