Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 73CD3606A328
	for <linux-arm-kernel@archiver.kernel.org>; Wed,  4 Nov 2026 14:03:44 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=CMXRd2Rk;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=G3zOtOlW
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=uknA9LO5XfZyma+M7n03w/JxLoJTVSxXbrmN0E2Qqwk=; b=CMXRd2Rkh8et3ykjqNCWKeo89P
	RtZrNQgFFPqajzxUmeleuBRl+AJVvQ4Ez9VsLg8588g6QHThiYR7+T2YdWsJ8RTaMgIda9QcbVpOZ
	r0MdV+G+mFRBDBj/6Jt/u8K/XSpAD4SSV4Ncd5M8Pqz7HTjZfPdGYS9xhibT1qESOelBf+elj2X6l
	lUxnRwzIGeq9G6ZmRAzNLZWZ/F3TqornxM73rpRCaZWlYTkWBb7Oejryr+0imYnw/hPOpbcy++9YN
	vc/7VM6aAfEyMleiedlL2fRq0zUV5u6fhCxO+MLJX7Azz7KYdUfVNO8MONVYRrZv7J3gW0EIqd2FT
	DiqJCgCw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObaU-00000005YMj-0aFR;
	Wed, 04 Nov 2026 14:03:38 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xObaS-00000005YMI-3Dal
	for linux-arm-kernel@lists.infradead.org;
	Wed, 04 Nov 2026 14:03:36 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 85E4A40351;
	Wed,  4 Nov 2026 14:03:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 6E94E1F000C1;
	Wed,  4 Nov 2026 14:03:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793801016;
	bh=uknA9LO5XfZyma+M7n03w/JxLoJTVSxXbrmN0E2Qqwk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=G3zOtOlWX3MGmRDd5z/B4xbOCZZdTwCaGj35JCzfNwkvryB8Lgtd5yWEpArAooh63
	 enx/9Uowo+XlfwgYddKPXN6IvHQ4UwitDFFZQoqMGWZ/5jrWG1mB7Ub2T8mrtnwK9C
	 10xfSV0BEtoZVLwAlTkPWG8llG+QezSFxQ/L6TrOof5EMwuow2nGs3tAziCJ68WAZW
	 46U0Jsi7d+s8ZenOVI99LKlKuV7LjsmcBEf85/SKzlI4/wLMBnG7KnScjRDe3ZQ9xR
	 GBMlM7hGYZfi6l728afXvYzWPew12XKhawrid3K7RnZ5BRXRuMKvRnPbK27W++r1iK
	 ngFpNwQY8LX+w==
Date: Wed, 4 Nov 2026 15:03:32 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Shan-Chun Hung <shanchun1218@gmail.com>
Cc: ychuang3@nuvoton.com, schung@nuvoton.com, vkoul@kernel.org, 
	Frank.Li@kernel.org, robh@kernel.org, krzk+dt@kernel.org, conor+dt@kernel.org, 
	kees@kernel.org, gustavoars@kernel.org, linux-arm-kernel@lists.infradead.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org
Subject: Re: [PATCH 1/2] dt-bindings: dma: nuvoton,ma35d1-pdma: Document
 MA35D1 PDMA controller
Message-ID: <20261104-vole-of-legendary-plenty-811cf1@quoll>
References: <20261103022202.2139674-1-shanchun1218@gmail.com>
 <20261103022202.2139674-2-shanchun1218@gmail.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103022202.2139674-2-shanchun1218@gmail.com>
X-BeenThere: linux-arm-kernel@lists.infradead.org
X-Mailman-Version: 2.1.34
Precedence: list
List-Id: <linux-arm-kernel.lists.infradead.org>
List-Archive: <http://lists.infradead.org/pipermail/linux-arm-kernel/>
List-Post: <mailto:linux-arm-kernel@lists.infradead.org>
List-Help: <mailto:linux-arm-kernel-request@lists.infradead.org?subject=help>
List-Subscribe: <http://lists.infradead.org/mailman/listinfo/linux-arm-kernel>,
 <mailto:linux-arm-kernel-request@lists.infradead.org?subject=subscribe>
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
X-Spam-Status: No, score=-15.9 required=3.0 tests=BAYES_00,DKIMWL_WL_HIGH,
	DKIM_SIGNED,DKIM_VALID,DKIM_VALID_AU,DKIM_VALID_EF,
	HEADER_FROM_DIFFERENT_DOMAINS,INCLUDES_CR_TRAILER,INCLUDES_PATCH,
	MAILING_LIST_MULTI,SPF_HELO_NONE,SPF_PASS autolearn=ham
	autolearn_force=no version=4.0.1
X-Spam-Checker-Version: SpamAssassin 4.0.1 (2024-03-26) on
	aws-us-west-2-korg-listserv-alma10-1

On Tue, Nov 03, 2026 at 10:22:01AM +0800, Shan-Chun Hung wrote:
> Add binding for Nuvoton MA35D1 PDMA controller.
> 

Looks like valid Sashiko review, so only few nits, not a full review:

> Signed-off-by: Shan-Chun Hung <shanchun1218@gmail.com>
> ---
>  .../bindings/dma/nuvoton,ma35d1-pdma.yaml     |  72 +++++++++++
>  include/dt-bindings/dma/ma35d1-pdma.h         | 113 ++++++++++++++++++
>  2 files changed, 185 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
>  create mode 100644 include/dt-bindings/dma/ma35d1-pdma.h
> 
> diff --git a/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
> new file mode 100644
> index 000000000000..cd752571242c
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/nuvoton,ma35d1-pdma.yaml
> @@ -0,0 +1,72 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/nuvoton,ma35d1-pdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Nuvoton MA35D1 PDMA controller
> +
> +description:
> +  This describes the devicetree bindings for four Peripheral DMA engines to perform

Do not describe what the binding document is describe. Just describe
that directly, so explain the hardware. Look at other examples.

> +  memory-to-memory, memory-to-peripheral, or peripheral-to-memory data transfer
> +  capable of supporting 10 channels, implemented in Nuvoton MA35D1 SoCs.
> +
> +maintainers:
> +  - Shan-Chun Hung <shanchun1218@gmail.com>
> +
> +allOf:
> +  - $ref: dma-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: nuvoton,ma35d1-pdma
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#dma-cells":
> +    const: 2
> +    description:
> +      The first cell is the channel number. The second cell is the
> +      peripheral request source (REQSRC) selection, which defines which
> +      peripheral is connected to that PDMA channel.
> +
> +  dma-channels:
> +    const: 10

Why isn't this implied by the compatible? Drop.

> +
> +additionalProperties: false

This goes after required block.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - interrupts
> +  - "#dma-cells"
> +  - dma-channels
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    #include <dt-bindings/clock/nuvoton,ma35d1-clk.h>
> +
> +    soc {
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dma-controller@40080000 {
> +            compatible = "nuvoton,ma35d1-pdma";
> +            reg = <0x0 0x40080000 0x0 0x2000>;
> +            interrupts = <GIC_SPI 18 IRQ_TYPE_LEVEL_HIGH>;
> +            clocks = <&clk PDMA0_GATE>;
> +            #dma-cells = <2>;
> +            dma-channels = <10>;
> +        };
> +    };
> +
> +...
> diff --git a/include/dt-bindings/dma/ma35d1-pdma.h b/include/dt-bindings/dma/ma35d1-pdma.h
> new file mode 100644
> index 000000000000..0ddc99d29661
> --- /dev/null
> +++ b/include/dt-bindings/dma/ma35d1-pdma.h

Filename must match the binding filename.

> @@ -0,0 +1,113 @@
> +/* SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause) */
> +/*
> + * Copyright (C) 2026 Nuvoton Technology Corp.
> + */
> +
> +#ifndef __DT_BINDINGS_DMA_MA35D1_PDMA_H__
> +#define __DT_BINDINGS_DMA_MA35D1_PDMA_H__
> +
> +#define MA35D1_PDMA_MEM			0


Hole

> +#define MA35D1_PDMA_UART0_TX		4
> +#define MA35D1_PDMA_UART0_RX		5
> +#define MA35D1_PDMA_UART1_TX		6
> +#define MA35D1_PDMA_UART1_RX		7
> +#define MA35D1_PDMA_UART2_TX		8
> +#define MA35D1_PDMA_UART2_RX		9
> +#define MA35D1_PDMA_UART3_TX		10
> +#define MA35D1_PDMA_UART3_RX		11
> +#define MA35D1_PDMA_UART4_TX		12
> +#define MA35D1_PDMA_UART4_RX		13
> +#define MA35D1_PDMA_UART5_TX		14
> +#define MA35D1_PDMA_UART5_RX		15
> +#define MA35D1_PDMA_UART6_TX		16
> +#define MA35D1_PDMA_UART6_RX		17
> +#define MA35D1_PDMA_UART7_TX		18
> +#define MA35D1_PDMA_UART7_RX		19
> +#define MA35D1_PDMA_UART8_TX		20
> +#define MA35D1_PDMA_UART8_RX		21
> +#define MA35D1_PDMA_UART9_TX		22
> +#define MA35D1_PDMA_UART9_RX		23
> +#define MA35D1_PDMA_UART10_TX		24
> +#define MA35D1_PDMA_UART10_RX		25
> +#define MA35D1_PDMA_UART11_TX		26
> +#define MA35D1_PDMA_UART11_RX		27
> +#define MA35D1_PDMA_UART12_TX		28
> +#define MA35D1_PDMA_UART12_RX		29
> +#define MA35D1_PDMA_UART13_TX		30
> +#define MA35D1_PDMA_UART13_RX		31
> +#define MA35D1_PDMA_UART14_TX		32
> +#define MA35D1_PDMA_UART14_RX		33
> +#define MA35D1_PDMA_UART15_TX		34
> +#define MA35D1_PDMA_UART15_RX		35
> +#define MA35D1_PDMA_UART16_TX		36
> +#define MA35D1_PDMA_UART16_RX		37
> +#define MA35D1_PDMA_QSPI0_TX		54

You should not have holes in the ABI or this is not DT ABI, so drop or
move out entire file from bindings.

Best regards,
Krzysztof


