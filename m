Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 42E51CD13D3
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 30 Apr 2026 07:29:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=tSHrzZxh0grVDEmZyVWlHi5zi16KFCH6x0dBDuxWi+k=; b=4Zwe6bYyS58F+b6j7afIPe34Zi
	EenUlsHis4rz8GGppy4D+mtMxjV7jaNZz0FR5wo7EV9EOWtSzRjLSyH4eJwzJDTomJxp8UpoLjWSi
	xuaNEG2HHHgRixiNkLdieaRB5syovNCOuo0e8x+5Msc6vlbs3PB8H2YwegI/tTQFbbjvCLPDoDIjC
	GnutlorLwInYb9xzdKDOANva5+/CaQuZ+RyBc+oRx+koU99JOlxJTBsaVtYOCq5fKy13m8mJpcpLr
	B08E3O1DClhZPOTxXmiMH7go8DLhT4SjqP+GG+1dY1VCd/i3I3Tg0Hv8eGwcAj7Ds4MGrxd99ppjS
	6Mh045AA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILpe-00000004scg-12lq;
	Thu, 30 Apr 2026 07:29:10 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1wILpd-00000004scT-0Ssj
	for linux-arm-kernel@lists.infradead.org;
	Thu, 30 Apr 2026 07:29:09 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 3E46F60582;
	Thu, 30 Apr 2026 07:29:08 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 55EEBC2BCB3;
	Thu, 30 Apr 2026 07:29:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1777534147;
	bh=fX0LBlHuuGJ2LnBmpaYmRUok+v8NthOe/2YIwmNGOzA=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=cx7mViHT3laPzlfWs1tJJoJTi+e80hngfvmF8o66ggqSYS/+AXRLTo5XKGCLoP+wG
	 im5qhdJ/9tIetVAd6MzHGZDh9H9nYiujFbJF49unhxU7YRGTfJc9cYTjhXOy9Isr8B
	 /dybG9ZTdw/hiYxMyohM3UrfKMdTJ7Hy2V0go0BdRPdiE2q5YMnt8GBe247+ZfZ3ZQ
	 KxHvACKttt17qF/PN+kAKy1UvZdx5Sky5eNCn/zgtlhYLQsXesXGb/gWP1DA0/lvvY
	 27pBT5Oe8VIwafuXvJ2UsZocktgVxg9TFQ8URhAIMVJ1cmc1QkMJzQzBg3JtaQTAZ+
	 2A406CYfHMqlA==
Date: Thu, 30 Apr 2026 09:29:05 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com, 
	gehariprasath@ti.com
Subject: Re: [PATCH v6 13/19] dt-bindings: dma: ti: Add K3 BCDMA V2
Message-ID: <20260430-orthodox-athletic-agama-be4111@quoll>
References: <20260428085202.1724548-1-s-adivi@ti.com>
 <20260428085202.1724548-14-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260428085202.1724548-14-s-adivi@ti.com>
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

On Tue, Apr 28, 2026 at 02:21:42PM +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for

I don't see improvements.

> Texas Instruments K3 Block Copy DMA (BCDMA) V2.
> 
> BCDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 121 ++++++++++++++++++
>  1 file changed, 121 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> new file mode 100644
> index 0000000000000..28dcfce5633ce
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> @@ -0,0 +1,121 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024-25 Texas Instruments Incorporated
> +# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/ti/ti,am62l-dmss-bcdma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments K3 DMSS BCDMA V2
> +
> +maintainers:
> +  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
> +
> +description:
> +  The BCDMA V2 is intended to perform similar functions as the TR
> +  mode channels of K3 UDMA-P.
> +  BCDMA V2 includes block copy channels and Split channels.
> +
> +  Block copy channels mainly used for memory to memory transfers, but with
> +  optional triggers a block copy channel can service peripherals by accessing
> +  directly to memory mapped registers or area.
> +
> +  Split channels can be used to service PSI-L based peripherals.
> +  The peripherals can be PSI-L native or legacy, non PSI-L native peripherals
> +  with PDMAs. PDMA is tasked to act as a bridge between the PSI-L fabric and the
> +  legacy peripheral.
> +
> +allOf:
> +  - $ref: /schemas/dma/dma-controller.yaml#
> +
> +properties:
> +  compatible:
> +    const: ti,am62l-dmss-bcdma
> +
> +  reg:
> +    items:
> +      - description: BCDMA Control & Status Registers region
> +      - description: Block Copy Channel Realtime Registers region
> +      - description: Channel Realtime Registers region
> +      - description: Ring Realtime Registers region
> +
> +  reg-names:
> +    items:
> +      - const: gcfg
> +      - const: bchanrt
> +      - const: chanrt
> +      - const: ringrt
> +
> +  "#address-cells":
> +    const: 0

Why do you need address-cells?

> +
> +  "#dma-cells":
> +    const: 4
> +    description: |
> +      cell 1: Trigger type for the channel
> +        0 - disable / no trigger
> +        1 - internal channel event
> +        2 - external signal
> +        3 - timer manager event
> +
> +      cell 2: parameter for the trigger:
> +        if cell 1 is 0 (disable / no trigger):
> +          Unused, ignored
> +        if cell 1 is 1 (internal channel event):
> +          channel number whose TR event should trigger the current channel.
> +        if cell 1 is 2 or 3 (external signal or timer manager event):
> +          index of global interfaces that come into the DMA.
> +
> +          Please refer to the device documentation for global interface indexes.
> +
> +      cell 3: Channel number for the peripheral
> +
> +        Please refer to the device documentation for the channel map.
> +
> +      cell 4: ASEL value for the channel
> +
> +  interrupts:
> +    minItems: 1
> +    maxItems: 144
> +    description:
> +      Interrupts for DMA channels.

And interrupts are flexible because?

Best regards,
Krzysztof


