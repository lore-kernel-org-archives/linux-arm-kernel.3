Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2465FC02188
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 27 Jan 2025 20:47:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=W2OvkTeiU8CLmu/CahRt3MiE25JagiReC9rHTAsZFDg=; b=EbCOIsXW3gibZFhSG9XEbFZOsQ
	EulpNb/HL7ggEUILnEmiolDrPAOTgS0rJ8nz+wH/ze0UoznJmI/hWMNWkXQqjMfqiTkSZFuncpaJS
	b1I/VGKrQudwvBIToOKO/zcjCJVZSQnfBenS+fXTvf98AzZckM06vU1aZHfpMuujqD381OPbW8B7F
	4lXcmPv/DAOlM/wibDv/lpwjiH/Aq7lWSz6QlFxdly/M8RbNQJrrAObTsOXAAk/53/0UOyl4y4ESj
	QmTWqLojPVeAatvtXPKy0LSdQNML9hTjM8jhLqNyhddZxXV+zuKdCBPN5b8ErdPT/DRmEcxC2/cpJ
	WN4J9hyw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tcW1C-00000003EsW-1atg;
	Mon, 27 Jan 2025 20:47:38 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tcVzr-00000003Emx-0iZH
	for linux-arm-kernel@lists.infradead.org;
	Mon, 27 Jan 2025 20:46:16 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 46D805C58D1;
	Mon, 27 Jan 2025 20:45:34 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0FFCC4CED2;
	Mon, 27 Jan 2025 20:46:13 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738010774;
	bh=xcZUmOduASjcFU2l+TPt7JE9O9AsRQh+pMzUv+ptJHc=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=khvpONAKiR1DtKZJ2UCgl6U//jcW6XTfUiAFHlfEAxRNNbH1etcuw5z/RLFswNQR/
	 cHA5zIBXfElNqzx8lODH7OlPxDw5X6Zr3Yp+yUBNKTJmRj7IVFuaUAE5DJY7g7Oes1
	 NYDIwT9Ihoxs9wXaCFbw+OGCysISDtjJ6PPuwZvyNOsirwGdUXUdJ0CqUqhBZntH7u
	 6UpTp+Br+j4tnZbPBuMC8Bic9LHs7SltPvxXwGPSX6WqbamHj9TUpj1TV4v/im+Yza
	 pAUH/Ro999TQ5aClY+4VUUXZYsc7JisZ1EPxiZydP8EGMjiEE0zcviV7zXm5rtsU6t
	 wSIldBurN9vmA==
Date: Mon, 27 Jan 2025 14:46:13 -0600
From: Rob Herring <robh@kernel.org>
To: Charan Pedumuru <charan.pedumuru@microchip.com>
Subject: Re: [PATCH v3] dt-bindings: dma: convert atmel-dma.txt to YAML
Message-ID: <20250127204613.GA820642-robh@kernel.org>
References: <20250127-test-v3-1-1b5f5b3f64fc@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250127-test-v3-1-1b5f5b3f64fc@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250127_124615_298786_505AB7C1 
X-CRM114-Status: GOOD (  27.26  )
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
Cc: devicetree@vger.kernel.org, Conor Dooley <conor+dt@kernel.org>, Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-kernel@vger.kernel.org, Vinod Koul <vkoul@kernel.org>, dmaengine@vger.kernel.org, Ludovic Desroches <ludovic.desroches@microchip.com>, Durai Manickam KR <durai.manickamkr@microchip.com>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, Andrei Simion <andrei.simion@microchip.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Mon, Jan 27, 2025 at 03:51:58PM +0530, Charan Pedumuru wrote:
> From: Durai Manickam KR <durai.manickamkr@microchip.com>
> 
> Add a description, required properties, appropriate compatibles and
> missing properties like clocks and clock-names which are not defined in
> the text binding for all the SoCs that are supported by microchip.
> Update the text binding name `atmel-dma.txt` to
> `atmel,at91sam9g45-dma.yaml` for the files which reference to
> `atmel-dma.txt`. Drop Tudor name from maintainers.
> 
> Signed-off-by: Durai Manickam KR <durai.manickamkr@microchip.com>
> Signed-off-by: Charan Pedumuru <charan.pedumuru@microchip.com>
> ---
> Changes in v3:
> - Renamed the text binding name `atmel-dma.txt` to
>   `atmel,at91sam9g45-dma.yaml` for the files which reference to
>   `atmel-dma.txt`.
> - Removed `oneOf` and add a blank line in properties.
> - Dropped Tudor name from maintainers.
> - Link to v2: https://lore.kernel.org/r/20250123-dma-v1-1-054f1a77e733@microchip.com
> 
> Changes in v2:
> - Renamed the yaml file to a compatible.
> - Removed `|` and description for common properties.
> - Modified the commit message.
> - Dropped the label for the node in examples.
> - Link to v1: https://lore.kernel.org/all/20240215-dmac-v1-1-8f1c6f031c98@microchip.com
> ---
>  .../bindings/dma/atmel,at91sam9g45-dma.yaml        | 66 ++++++++++++++++++++++
>  .../devicetree/bindings/dma/atmel-dma.txt          | 42 --------------
>  .../devicetree/bindings/misc/atmel-ssc.txt         |  2 +-
>  MAINTAINERS                                        |  2 +-
>  4 files changed, 68 insertions(+), 44 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml b/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
> new file mode 100644
> index 000000000000..d6d16869b7db
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/dma/atmel,at91sam9g45-dma.yaml
> @@ -0,0 +1,66 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/dma/atmel,at91sam9g45-dma.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel Direct Memory Access Controller (DMA)
> +
> +maintainers:
> +  - Ludovic Desroches <ludovic.desroches@microchip.com>
> +
> +description:
> +  The Atmel Direct Memory Access Controller (DMAC) transfers data from a source
> +  peripheral to a destination peripheral over one or more AMBA buses. One channel
> +  is required for each source/destination pair. In the most basic configuration,
> +  the DMAC has one master interface and one channel. The master interface reads
> +  the data from a source and writes it to a destination. Two AMBA transfers are
> +  required for each DMAC data transfer. This is also known as a dual-access transfer.
> +  The DMAC is programmed via the APB interface.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - atmel,at91sam9g45-dma
> +      - atmel,at91sam9rl-dma
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  "#dma-cells":
> +    description:
> +      Must be <2>, used to represent the number of integer cells in the dmas
> +      property of client devices.

You failed to address Conor's comment on this. The above is useless 
because the schema says it is 2 and the description is for any #dma-cells. 

What's missing is answering "what do the 2 cells contain exactly?" That 
was captured in this text:

> -The three cells in order are:
> -
> -1. A phandle pointing to the DMA controller.
> -2. The memory interface (16 most significant bits), the peripheral interface
> -(16 less significant bits).
> -3. Parameters for the at91 DMA configuration register which are device
> -dependent:
> -  - bit 7-0: peripheral identifier for the hardware handshaking interface. The
> -  identifier can be different for tx and rx.
> -  - bit 11-8: FIFO configuration. 0 for half FIFO, 1 for ALAP, 2 for ASAP.

Adapt this for the description. (Note it is phandle plus 2 cells, not 3 
cells, so you *can* omit the phandle part.)

Rob

