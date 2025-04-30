Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 4C816C369D9
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 30 Apr 2025 10:52:09 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=5zbGxdPPM0Q4u9tQCImRBz8/sSpy8dLQEfEEPOAifNk=; b=i1vX9osAYaG3FIE+myMGScENX1
	C4iao5MXJBnk5elBSQgbWl7fZEOgrtPRmsHeImd5mpJ+2cgUqa4LQnlGOAvWkOOIsPmDvQ6+sPi41
	SrUt6ksHkoyOB6Rw2KUxfePvR2ZteQkQjMR81oU9LDc6Lkh2WqhE4H8nZ03eIJCYcgUNk1E5xvXpZ
	9EJMRAPoX1geXqoeRdbawR37zav5J+u4CHA/e5CH/YkoFcBOHmeAYx5SWTP9ToKwaPWoEFOqKIGL0
	FZZv3xwZ8spUr67sKGusrajxlthIPpk9EZQ2g1TYKi8LtW7FCaadjzaSkRrfIJK9iKzEZ2F4Vohvw
	VqkF+n5Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA52m-0000000Cb8y-2D5G;
	Wed, 30 Apr 2025 10:52:00 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uA4dj-0000000CWK8-1bAn
	for linux-arm-kernel@lists.infradead.org;
	Wed, 30 Apr 2025 10:26:07 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 2B3826111C;
	Wed, 30 Apr 2025 10:25:39 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0A074C4CEEA;
	Wed, 30 Apr 2025 10:26:04 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1746008765;
	bh=U83C1fx4RiCnbON4J3BLjckTisNNBrWzMaUOSyTeN0g=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=DKNx2/KNqd+nIiX4NgFYdjgXQ3RpDGD4sxrkCgK2xt3GfgNMkmBZZN+VNcOa4SSG9
	 SfgTPNdYVW9SX4QG71IdLI4kqaEHXn9OCgIEKA2PfIwLzx3FufqMnyqJ4ETIGqFupY
	 03zFpqIr/+nDjrLyHYhKWIpzgfJgnzGykS5glGuoE0WwercwS5QWCWWqfLIyxpAse+
	 kNgclIfc0SEVVCtKaW7DCZiK41oQEknEEV7/oOMqzLWc1K842QffIu5A2LzKw0F8Iz
	 Lp7nGHhBw0fVRIU0cJ0Q4I4BpQIzHgdkRKOYywgrUDctamkiURw8mD4L4c1ZlvRuWD
	 ZyWJZzq1bH/Fg==
Date: Wed, 30 Apr 2025 12:26:02 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sai Sree Kartheek Adivi <s-adivi@ti.com>
Cc: peter.ujfalusi@gmail.com, vkoul@kernel.org, robh@kernel.org, 
	krzk+dt@kernel.org, conor+dt@kernel.org, nm@ti.com, ssantosh@kernel.org, 
	dmaengine@vger.kernel.org, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, praneeth@ti.com, vigneshr@ti.com, u-kumar1@ti.com, 
	a-chavda@ti.com
Subject: Re: [PATCH 1/8] dt-bindings: dma: ti: Add document for K3 BCDMA V2
Message-ID: <20250430-energetic-hippo-from-tartarus-bf4b65@kuoka>
References: <20250428072032.946008-1-s-adivi@ti.com>
 <20250428072032.946008-2-s-adivi@ti.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250428072032.946008-2-s-adivi@ti.com>
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

On Mon, Apr 28, 2025 at 12:50:25PM GMT, Sai Sree Kartheek Adivi wrote:
> New binding document for
> Texas Instruments K3 Block Copy DMA (BCDMA) V2.
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
> index 0000000000000..af4aa3839fd66
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/ti/k3-bcdma-v2.yaml
> @@ -0,0 +1,97 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2024-2025 Texas Instruments Incorporated
> +# Author: Sai Sree Kartheek Adivi <s-adivi@ti.com>
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
> +    const: ti,dmss-bcdma-v2

SoC compatibles instead.

> +
> +  reg:
> +    items:
> +      - description: BCDMA Control /Status Registers region

s/Registers region//

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
> +  - "#dma-cells"
> +  - reg
> +  - reg-names

Keep same order as in properties: block.

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |+

Drop +

> +    cbass_main {

Follow DTS coding style... or just make it like all other SoC bindings.

> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +
> +      main_bcdma: dma-controller@485c4000 {

Messed indentation.


Best regards,
Krzysztof


