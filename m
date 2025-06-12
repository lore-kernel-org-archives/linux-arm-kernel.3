Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id A3793C71148
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 12 Jun 2025 13:20:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=IV0DNTWViL5fniUSMrJGehibTGB7nNJ8GEB/Krl9ZLE=; b=PmBJZ2xAWVdPp3RjO0nDgJLktG
	/iOUr3aWtbKsCrVez1WZA/tF1xWTEoRKZmUPiLRYyv6iARAGAlaY47RzhY7eHlu7ctmHSGUqJVFNu
	w6HXh3k+S9M0yAH8PV/kWzY+ovKy/Trk5vRMktX+++BU5NGbleXLKFph8lHpVPrn5lgZlDIM6jTHu
	l6Sr4yGrLu1acWGBHyYjdNPpWwVogaisHSZJMakwGTP0ZS9PPLMO282Xb4PdidihLTSxrtYG7Xs7D
	xDkNmW+OV64SfdZRrppEf5zfYclQT75rDt0GUod0Q9AoyL5XVsiJCu25TMKZ9zHXHSipDfELfm8FW
	TCnfV6BQ==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPhrE-0000000DPQU-3ZpE;
	Thu, 12 Jun 2025 13:20:40 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uPh1M-0000000DFki-0H7j
	for linux-arm-kernel@lists.infradead.org;
	Thu, 12 Jun 2025 12:27:05 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D32765C5788;
	Thu, 12 Jun 2025 12:24:46 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EE706C4CEEA;
	Thu, 12 Jun 2025 12:27:02 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1749731223;
	bh=5MEjtAv0TqGxOCKaA9pBWp/Tk5XUhQhcp65ZW/zGUnc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=UcfBFAxr3a6JicMjX5aD0ukleYBYEeRoFZ+Pmer0DVHYGclj7exMVMdaEexYOHPuK
	 x0mAY62mxzio5CNVjOfKkExAONLtMqAZTKnqldh9SHu3cjxykNBZhlvgG5YeXEncL/
	 y4k+R/2mTgJzyYlxFgX/bn7tI91ryNNskeDgxRCRycgjrGcULabmcfo4tlRlwstQ14
	 BRrU0ts1myPa3jtRWg7nhuEFXG6ksLkfWPesebnBOg39aGrwXDHges66egPTFKRbM2
	 02rNYPTYuH2ZQV6psft2dEVwiCX0ygIeSaig+lMneQC4t1oZRGRdUMYB2JTYURK/24
	 4a4prVDWMBeIQ==
Date: Thu, 12 Jun 2025 07:27:01 -0500
From: Rob Herring <robh@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: Peter Ujfalusi <peter.ujfalusi@gmail.com>,
	Vinod Koul <vkoul@kernel.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Nishanth Menon <nm@ti.com>,
	Santosh Shilimkar <ssantosh@kernel.org>, dmaengine@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, praneeth@ti.com,
	vigneshr@ti.com, u-kumar1@ti.com, a-chavda@ti.com, p-mantena@ti.com
Subject: Re: [PATCH v2 12/17] dt-bindings: dma: ti: Add document for K3 BCDMA
 V2
Message-ID: <20250612122701.GA1171082-robh@kernel.org>
References: <20250612071521.3116831-1-s-adivi@ti.com>
 <20250612071521.3116831-13-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250612071521.3116831-13-s-adivi@ti.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250612_052704_180530_17C9454E 
X-CRM114-Status: GOOD (  22.52  )
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

On Thu, Jun 12, 2025 at 12:45:16PM +0530, Sai Sree Kartheek Adivi wrote:
> New binding document for
> Texas Instruments K3 Block Copy DMA (BCDMA) V2.

Drop 'document for' in the subject.

> 
> BCDMA V2 is introduced as part of AM62L.
> 
> Signed-off-by: Sai Sree Kartheek Adivi <s-adivi@ti.com>
> ---
>  .../bindings/dma/ti/k3-bcdma-v2.yaml          | 97 +++++++++++++++++++
>  1 file changed, 97 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.yaml
> 
> diff --git a/Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.yaml b/Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.yaml
> new file mode 100644
> index 0000000000000..9d86e515bdefb
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024-2025 Texas Instruments Incorporated
> +# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>

git records the author. Don't need it here.

> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/ti/k3-bcdma-v2.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Texas Instruments K3 DMSS BCDMA V2
> +
> +maintainers:
> +  - Sai Sree Kartheek Adivi <s-adivi@ti.com>
> +
> +description: |
> +  The BCDMA V2 is intended to perform similar functions as the TR
> +  mode channels of K3 UDMA-P.
> +  BCDMA V2 includes block copy channels and Split channels.

Is this one paragraph or 2? Either blank line between paragraphs or wrap 
at 80 char.

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
> +      - description: BCDMA Control /Status
> +      - description: Block Copy Channel Realtime
> +      - description: Channel Realtime
> +      - description: Ring Realtime
> +
> +  reg-names:
> +    items:
> +      - const: gcfg
> +      - const: bchanrt
> +      - const: chanrt
> +      - const: ringrt
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
> +required:
> +  - compatible
> +  - reg
> +  - reg-names
> +  - "#dma-cells"
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    cbass_main {

Don't use '_' in node names. 

> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +        dma-controller@485c4000 {
> +            compatible = "ti,dmss-bcdma-v2";
> +            reg = <0x00 0x485c4000 0x00 0x4000>,
> +                  <0x00 0x48880000 0x00 0x10000>,
> +                  <0x00 0x48800000 0x00 0x80000>,
> +                  <0x00 0x47000000 0x00 0x200000>;
> +            reg-names = "gcfg", "bchanrt", "chanrt", "ringrt";
> +            #dma-cells = <4>;
> +        };
> +    };
> -- 
> 2.34.1
> 

