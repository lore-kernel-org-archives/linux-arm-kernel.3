Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 23F99E9A04C
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 19 Feb 2026 07:43:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=sEQ20lZn5aC4pcK3zOmNpKgpHuHEHZwdosUQDLkxVds=; b=Yoc5AJnc8tuHwG4FcQTSTmH+UG
	jO6YAf/jeq0OwRvp6dR+cLzOCR7bNl7zrjva471jisE+UVdnEg8okZ5VwL5lOENiwBex9bflB/oFJ
	iZk2L9mactiZtmv0jNdFW7OVZb/nFnsPWFMwT71mWo8pmn0IEysAMbLEVdxxZwULWXaAb0LWxBmkC
	BMI7EPV3Z6i+67hPg8q3WbdstWB/nqVf1HGWcAdOJ2qAAgDSKqyXu+4+ExoAKZqAGg1eEMsZemHPN
	oIacas6TBAzTyRKrNyQIjmFQbB/Igy0H37/3SZAgEx9I33fn5jR5goERZeClkfWxWswCKmF1Cfx3/
	h4j1RiOg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsygr-0000000B3uQ-0rhc;
	Thu, 19 Feb 2026 07:43:13 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vsygp-0000000B3uI-3LkG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 19 Feb 2026 07:43:11 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id E1C8260128;
	Thu, 19 Feb 2026 07:43:10 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 08798C4CEF7;
	Thu, 19 Feb 2026 07:43:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1771486990;
	bh=EZbnBXFpdDmY3HCD/8ilJbQIHY5K83u0h3fNzYw/pC4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=jdbKhf8zttPjUjMASJ2uyl50RJ9RS1Y/5DCJ/mUg0/uB2fGsF3JONLgEXfVR9hKpm
	 YkUxak9x0GC7hs/ENIts6NSA5uCkpZrz8GmOYrx38wJO7i0JFu3++bsK9vmqyXg+3K
	 hei0MmYhikf6xPuct2JxXDXeJZ/4y3xpxe+X7NVBb4gV5agdpLeDq936KUGa7JJgN5
	 /l+MR2N7y+5TSyqIJtPiSxJFvM7HnxVB+DSnTKXEAPj0hi8fJD55ezVZT0FE+jEuvE
	 FKrAa8OhkVagkfFVdDH7MxuQevsVr6cN9Pb8c0H7NPanfTLnLbRisFn1oyz85nZtYo
	 pYcBcNNNULnuw==
Date: Thu, 19 Feb 2026 08:43:08 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, vigneshr@ti.com, Frank.li@nxp.com, r-sharma3@ti.com, 
	gehariprasath@ti.com
Subject: Re: [PATCH v5 12/18] dt-bindings: dma: ti: Add K3 BCDMA V2
Message-ID: <20260219-hopeful-intrepid-cuckoo-32967d@quoll>
References: <20260218095243.2832115-1-s-adivi@ti.com>
 <20260218095243.2832115-13-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260218095243.2832115-13-s-adivi@ti.com>
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

On Wed, Feb 18, 2026 at 03:22:37PM +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for

Fix wrapping - it's wrapped too early.

> Texas Instruments K3 Block Copy DMA (BCDMA) V2.
> 
> BCDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/ti,am62l-dmss-bcdma.yaml  | 120 ++++++++++++++++++
>  1 file changed, 120 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> new file mode 100644
> index 0000000000000..6fa08f22df375
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/ti,am62l-dmss-bcdma.yaml
> @@ -0,0 +1,120 @@
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
> +
> +  "#interrupt-cells":
> +    const: 1

I don't get why this is nexus but not a interrupt-controller.

Can you point me to DTS with complete picture using this?

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
> +  interrupt-map-mask:
> +    items:
> +      - const: 0x7ff
> +
> +  interrupt-map:
> +    description: |
> +      Maps internal BCDMA channel IDs to the parent GIC IRQ lines.

Isn't this mapping fixed in given device? IOW, not really part of DTS
description but deducible from the compatible.

You only need to provide interrupts for your device.


Best regards,
Krzysztof


