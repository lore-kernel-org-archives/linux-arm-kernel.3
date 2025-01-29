Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 615DEC0218D
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jan 2025 08:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:Cc:List-Subscribe:
	List-Help:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Type:MIME-Version:References:Message-ID:Subject:To:From:Date:Reply-To
	:Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=iqxOXBHDlLnQQiE03qR5pTExJh6npYgxrOnJCsIBdGM=; b=gvF1fVawZkb/GgMuSKWgflqcOf
	LwBMmVM64COpKjWJ1AHlS0Hnk2Gh1WlTZE4t2E2uLmayjGIsvqhVvaOABtBqk3EM4oii1NGqz9Pgq
	69A20iH7t7b7szjAgmwBRC9je5eUGgqcF7kYME0nnURQYBPlq6YMw7Unl40jNMIDPK81wvsjVWiwN
	TYuiEYGa4AhXLYe2HOLF3UGKHq0MUJVxBLVpdgyvUvj9dFt7uKiTIoJTL6DYlT/zaAvOppSx7OfLn
	TpPfyo3DKvoaZCp4bZFAdv6mLRe4wzYXg5IG/+eF6xx1Qv/BmuOyJ6KPD/sPuZiRnS0JguYud3NZf
	R3ahRmzw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1td3DV-00000006XJo-45eZ;
	Wed, 29 Jan 2025 08:14:33 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1td3CA-00000006X3d-2K1a
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jan 2025 08:13:12 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id D896AA4161D;
	Wed, 29 Jan 2025 08:11:22 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 68C2FC4CED3;
	Wed, 29 Jan 2025 08:13:08 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1738138389;
	bh=lbo3t5sugwm+oOrpE6VWW61CU9LFvh/0XBikVI2WjHQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=s0KvxGZNnt5658TDCXz1u92A+19VLGg1a9XCEOm/sYaKlbRu4IP1DOkt5JuOaoPP/
	 D7vLNoHgOoB0zcCIgET+PMCLpPkujnegABPA0vCrrFnD2I8fO2Fx8uxABlLw4SSc9U
	 unniSXvXsJ9uMEvcRtqZ+J1+DpFRdyAfZadMZ7CnZMEBTu7gngkR4NrE0K61igJYCP
	 PaLx3+CbmPYCeAJGdLHmo5bXSe0s/iJsF1xB4e7B1XLIyPBGLV3OMlvEbXUe0uHFbe
	 ctZQKjJzXCQ144PkuKNROVovF4c3oUS+/b6bD3F8Uilf3IdWNDzKtKZcQ7caWR6rZ6
	 htmRJ+iabysZg==
Date: Wed, 29 Jan 2025 09:13:05 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Andrei Simion <andrei.simion@microchip.com>
Subject: Re: [PATCH 1/2] dt-bindings: misc: atmel,at91-ssc: Convert to YAML
 format
Message-ID: <20250129-vagabond-scrupulous-scorpion-b57db9@krzk-bin>
References: <20250128161842.44541-1-andrei.simion@microchip.com>
 <20250128161842.44541-2-andrei.simion@microchip.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250128161842.44541-2-andrei.simion@microchip.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250129_001310_729171_25A57DE8 
X-CRM114-Status: GOOD (  18.89  )
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
Cc: robh@kernel.org, conor+dt@kernel.org, alexandre.belloni@bootlin.com, devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, claudiu.beznea@tuxon.dev, broonie@kernel.org, krzk+dt@kernel.org, linux-arm-kernel@lists.infradead.org
Sender: "linux-arm-kernel" <linux-arm-kernel-bounces@lists.infradead.org>
Errors-To: linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org

On Tue, Jan 28, 2025 at 06:18:43PM +0200, Andrei Simion wrote:
> Convert devicetree binding atmel-ssc.txt to YAML format.
> 
> Signed-off-by: Andrei Simion <andrei.simion@microchip.com>
> ---
>  .../bindings/misc/atmel,at91-ssc.yaml         | 111 ++++++++++++++++++
>  .../devicetree/bindings/misc/atmel-ssc.txt    |  50 --------
>  2 files changed, 111 insertions(+), 50 deletions(-)
>  create mode 100644 Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml

Please place it in sound directory. Or soc if this is not ASoC, but
including dai-common is clear indication.

>  delete mode 100644 Documentation/devicetree/bindings/misc/atmel-ssc.txt
> 
> diff --git a/Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml b/Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml
> new file mode 100644
> index 0000000000000..a37ee5e58fa58
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/misc/atmel,at91-ssc.yaml
> @@ -0,0 +1,111 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/misc/atmel,at91-ssc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Atmel Serial Synchronous Serial (SSC)
> +
> +maintainers:
> +  - Andrei Simion <andrei.simion@microchip.com>
> +
> +description:
> +  The Atmel Synchronous Serial Controller (SSC) provides a versatile
> +  synchronous communication link for audio and telecom applications,
> +  supporting protocols like I2S, Short Frame Sync, and Long Frame Sync.
> +
> +properties:
> +  compatible:
> +    oneOf:
> +      - enum:
> +          - atmel,at91rm9200-ssc
> +          - atmel,at91sam9g45-ssc
> +      - items:
> +          - const: microchip,sam9x7-ssc

This wasn't in the binding and your commit msg is silent. You need to
explain all changes done to the binding during conversion.

> +          - const: atmel,at91sam9g45-ssc
> +
> +  reg:
> +    maxItems: 1
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  clock-names:
> +    items:
> +      - const: pclk
> +
> +  dmas:
> +    items:
> +      - description: TX DMA Channel
> +      - description: RX DMA Channel
> +
> +  dma-names:
> +    description: Names of the DMA channels.

Drop description

> +    items:
> +      - const: tx
> +      - const: rx
> +
> +  atmel,clk-from-rk-pin:
> +    description:
> +      Specify the clock source for the SSC (Synchronous Serial Controller)
> +      when operating in slave mode. By default, the clock is sourced from
> +      the TK pin. Set this property to true to source the clock from

You cannot set this property to true. This can be present or can be
missing

> +      the RK pin instead, based on your hardware design requirements.
> +    type: boolean
> +

Missing dai-cells. Old binding said 0, now you say anything...

Missing required block

> +allOf:
> +  - $ref: ../sound/dai-common.yaml#

Full path, so /schemas/

> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - atmel,at91sam9g45-ssc
> +    then:
> +      required:
> +        - compatible
> +        - reg
> +        - interrupts
> +        - dmas
> +        - dma-names

So only dmas?

> +        - clocks
> +        - clock-names
> +    else:
> +      required:
> +        - compatible
> +        - reg
> +        - interrupts
> +        - clocks
> +        - clock-names

Drop entire required:

> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/dma/at91.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    ssc@100000 {
> +       compatible = "atmel,at91sam9g45-ssc";
> +       reg = <0x100000 0x4000>;
> +       interrupts = <28 IRQ_TYPE_LEVEL_HIGH 5>;
> +       dmas = <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
> +                     AT91_XDMAC_DT_PERID(38))>,
> +              <&dma0 (AT91_XDMAC_DT_MEM_IF(0) | AT91_XDMAC_DT_PER_IF(1) |
> +                     AT91_XDMAC_DT_PERID(39))>;
> +       dma-names = "tx", "rx";
> +       clocks = <&pmc PMC_TYPE_PERIPHERAL 28>;
> +       clock-names = "pclk";

Make the binding complee - dai properties.

Best regards,
Krzysztof


