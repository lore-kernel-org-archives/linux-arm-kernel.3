Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 673A5CA5FD4
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  2 Oct 2026 09:22:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Y4MhxGPWNVsIW0cEl2zxh9wEpBK5rmMA5OP/Lml+1LY=; b=R6uRrlGoTR3anI0Ye3glhRVXEa
	ZANUwVT75VJeJQlAqCkM5iSwz2FGrBJefdVtlibmKOME3T+sfoxLPBelMAqSzdc2+0SmgvGvT70by
	m+eDRi7JJ3V3f5jetJq7+Ep2SY/25mk49qMybR4LEDZmrLJ6BVM+CiWbti5JxMvpbcf0hAI8RzzEY
	DprXCOQK55zavfhoNU2+0JNb2r13JhHWuqaqRrbgCM/XKS2V1z6hL65DMu+JlcYmPpBJ8HNtbXKsm
	fnVEuc+YkfMxwFWU/q9l3GSSdGgM42tBsLn6LY/BOehACb2/beIyCvtNoFSJ7jkBUgCHY/KdVkklg
	53Awq3LA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZTP-0000000B7r5-1gLo;
	Fri, 02 Oct 2026 09:22:35 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xCZTO-0000000B7qp-2Fsf
	for linux-arm-kernel@lists.infradead.org;
	Fri, 02 Oct 2026 09:22:34 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 91EC160A6A;
	Fri,  2 Oct 2026 09:22:33 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 82CBE1F00898;
	Fri,  2 Oct 2026 09:22:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790932953;
	bh=Y4MhxGPWNVsIW0cEl2zxh9wEpBK5rmMA5OP/Lml+1LY=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=DqgocHX56cUk5RvK+w9yVALm7u1GpCYswRyI/vhbLsfhsa+ocs/Uag+AbTLlNk26n
	 zIukj0YT4paG6Oylt1uxBb88WkMkVvcaEv5/fFYuaZsRs/V7yE9vfcQgw3c2/gC1yR
	 SjwUOYKmc+bDJpIA2ezmpkyI2IArXWogYmGC/ViwvcOLyFXZMXLNeMvEvwAyYckPbE
	 sMJaidNFO8ii24fd4iM9dTwrMPfbzIh1I7/55oOIYZ0p71YbKwhusd4H8nP9GdParb
	 hHOI+eowsRqLTJmDZE6OC18semZT1uB+Bce1O9PrHvLbLEafdDlPqbDtWUzr5EPXYd
	 7IjYirxM0UQkQ==
Date: Fri, 2 Oct 2026 11:22:29 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: add bindings for stm32 mdf
 filter
Message-ID: <20261002-pragmatic-smart-piculet-cacb3e@quoll>
References: <20261001145702.2628429-1-olivier.moysan@foss.st.com>
 <20261001145702.2628429-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001145702.2628429-2-olivier.moysan@foss.st.com>
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

On Thu, Oct 01, 2026 at 04:56:45PM +0200, Olivier Moysan wrote:
> Add bindings that describes STM32 MDF settings to support
> digital filtering for Pulse Density Modulation (PDM) microphones
> and analog sigma delta modulators.

You already received review, so a few things on top to spare you one
more cycle:

A nit, subject: drop second/last, redundant "bindings for". The
"dt-bindings" prefix is already stating that these are bindings.
See also:
https://elixir.bootlin.com/linux/v7.1-rc7/source/Documentation/devicetree/bindings/submitting-patches.rst#L23

> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/iio/adc/st,stm32-mdf-adc.yaml    | 383 ++++++++++++++++++
>  1 file changed, 383 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml b/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml
> new file mode 100644
> index 000000000000..f2fbc3e150e8
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/iio/adc/st,stm32-mdf-adc.yaml

Filename follows compatible, so st,stm32mp23-mdf

> @@ -0,0 +1,383 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/iio/adc/st,stm32-mdf-adc.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: STMicroelectronics STM32 Multi-function Digital Filter (MDF) ADC
> +
> +maintainers:
> +  - Olivier Moysan <olivier.moysan@foss.st.com>
> +
> +description: |
> +  STM32 MDF ADC is a sigma delta analog-to-digital converter dedicated to
> +  interface external sigma delta modulators to STM32 micro controllers.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - st,stm32mp25-mdf
> +      - st,stm32mp23-mdf

Why reversed order?

> +  ranges: true
> +
> +  clock-ranges: true

Do you need it here?

> +
> +  resets:
> +    maxItems: 1
> +
> +  reset-names:
> +    items:
> +      - const: mdf

Drop

> +
> +  access-controllers:
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +    description: |
> +      Phandle to the rifsc device to check access right.

Look at other code how this is done. Don't come with own stuff.

> +
> +  power-domains:
> +    maxItems: 1
> +
> +  st,interleave:
> +    description: |
> +      List of phandles of interleaved filters. The indexes of interleaved filters must be
> +      consecutives starting from 0 (i.e in range [0..N]). The samples from interleaved filters
> +      are muxed in a single channel and retrieved through the device associated to the filter 0.
> +      The filters 1..N have to be enabled, but inherit their configuration from filter 0.
> +    $ref: /schemas/types.yaml#/definitions/phandle-array
> +
> +required:
> +  - compatible
> +  - reg
> +  - ranges
> +  - clocks
> +  - clock-names
> +  - clock-ranges
> +  - "#address-cells"
> +  - "#size-cells"
> +
> +additionalProperties: false
> +
> +patternProperties:

And this has odd order. Please look at example-schema.

> +  "^sitf@[0-9]+$":
> +    type: object
> +    description: Serial interface child node
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - st,stm32mp25-sitf-mdf
> +
> +      reg:
> +        description: Specify the SITF serial interface instance
> +        maxItems: 1
> +
> +      clocks:
> +        description: |
> +          Serial interface clock (optional depending on interface mode)
> +        maxItems: 1
> +
> +      st,sitf-mode:
> +        description: |
> +          Select serial interface protocol
> +          - spi: SPI mode
> +          - lf_spi: low frequency SPI mode for low power applications
> +        $ref: /schemas/types.yaml#/definitions/string
> +        enum:
> +          - spi
> +          - lf_spi
> +
> +    required:
> +      - reg
> +      - st,sitf-mode
> +
> +    additionalProperties: false
> +
> +  "^filter@[0-9]+$":
> +    type: object
> +    description: Digital filter path child node
> +
> +    properties:
> +      compatible:
> +        enum:
> +          - st,stm32mp25-mdf-dmic
> +          - st,stm32mp25-mdf-adc
> +
> +      reg:
> +        description: Specify the MDF filter instance
> +        maxItems: 1
> +
> +      interrupts:
> +        maxItems: 1
> +
> +      clocks:
> +        minItems: 1

Heh? so here min? Is there any logic in your choices of code style?

> +        description: Internal clock used for MDF digital processing and control blocks.
> +
> +      clock-names:
> +        items:
> +          - const: ker_ck
> +
> +      dmas:
> +        maxItems: 1
> +
> +      dma-names:
> +        items:
> +          - const: rx
> +
> +      "#io-channel-cells":
> +        const: 1
> +
> +      '#address-cells':
> +        const: 1
> +
> +      '#size-cells':
> +        const: 0
> +
> +      st,cic-mode:
> +        description: |
> +          Cascaded-integrator-comb (CIC) filter configuration
> +          - 0: MCIC & ACIC filters in FastSinc mode
> +          - [1-3]: MCIC & ACIC filters in Sinc mode order 1 to 3
> +          - [4-5]: Single CIC filter in Sinc mode order 4 to 5
> +          For audio purpose it is recommended to use CIC Sinc4 or Sinc5
> +          This property is mandatory for filter 0 or filters not used in interleave mode.
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        minimum: 0
> +        maximum: 5
> +
> +      st,delay:
> +        description: Filter delay in samples
> +        $ref: /schemas/types.yaml#/definitions/uint32
> +        maximum: 127
> +
> +      st,rs-filter-bypass:
> +        description: Bypass RSFLT reshaping filter.
> +        $ref: /schemas/types.yaml#/definitions/flag
> +
> +      st,hpf-filter-cutoff-bp:
> +        description: |
> +          High Pass Filter (HPF) cut-off frequency expressed as a fraction of the PCM sampling rate.
> +          Cut-off frequency = st,hpf-filter-cutoff-bp x Fpcm / 10000.
> +          If this property is not defined the HPF is disabled.
> +        enum: [625, 1250, 2500, 9500]
> +
> +      st,sync:
> +        description:
> +          Synchronize to another filter.
> +          Must contain the phandle of the filter providing the synchronization.
> +        allOf:
> +          - $ref: /schemas/types.yaml#/definitions/phandle-array
> +          - maxItems: 1
> +
> +      st,sitf:
> +        $ref: /schemas/types.yaml#/definitions/phandle-array
> +        items:
> +          - items:
> +              - description: Phandle of the serial interface connected to the digital filter
> +              - description: |
> +                  The phandle's argument selects the bitstream on the falling or rising edge
> +                  of the serial interface clock:
> +                  - 0: rising edge
> +                  - 1: falling edge
> +                enum: [0, 1]
> +                default: 0
> +        description:
> +          Should be phandle/bitstream pair.
> +
> +    required:
> +      - compatible
> +      - reg
> +      - interrupts
> +      - dmas
> +      - dma-names
> +      - "#io-channel-cells"
> +      - "#address-cells"
> +      - "#size-cells"
> +      - st,sitf
> +
> +    unevaluatedProperties: false
> +
> +    patternProperties:
> +      "^channel@([0-7])$":
> +        type: object
> +        $ref: adc.yaml
> +        description: Represents the external channel which is connected to the MDF.
> +
> +        properties:
> +          reg:
> +            maximum: 7
> +
> +          io-backends:
> +            description:
> +              Used to pipe external sigma delta modulator or internal ADC backend to MDF
> +              channel.
> +            maxItems: 1
> +
> +        required:
> +          - reg
> +
> +        unevaluatedProperties: false
> +
> +    allOf:
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: st,stm32mp25-mdf-adc
> +
> +        then:
> +          patternProperties:
> +            "^channel@[0-7]$":
> +              required:
> +                - io-backends
> +
> +      - if:
> +          properties:
> +            compatible:
> +              contains:
> +                const: st,stm32mp25-mdf-dmic
> +
> +        then:
> +          patternProperties:
> +            "^mdf-dai+$":

This makes no sense. Why is this a pattern and why mdf-daiiiii is
correct name?

Not mentioning that your are not supposed to define properties in if
block (do you see any code like that?). Mixing addressable and
non-addressable children is another odd thing.

This entire schema is quite chaotic and overcomplicated.

> +              type: object
> +              description: child node
> +
> +              properties:
> +                compatible:
> +                  enum:
> +                    - st,stm32mp25-mdf-dai
> +
> +                "#sound-dai-cells":
> +                  const: 0
> +
> +                io-channels:
> +                  description:
> +                    From common IIO binding. Used to pipe external sigma delta
> +                    modulator or internal ADC output to MDF channel.
> +
> +                power-domains:
> +                  maxItems: 1
> +
> +                port:
> +                  $ref: /schemas/sound/audio-graph-port.yaml#
> +                  unevaluatedProperties: false
> +
> +              required:
> +                - compatible
> +                - "#sound-dai-cells"
> +                - io-channels
> +
> +              additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/st,stm32mp25-rcc.h>
> +    #include <dt-bindings/interrupt-controller/arm-gic.h>
> +    mdf1: mdf@504d0000 {

Node names should be generic. See also an explanation and list of
examples (not exhaustive) in DT specification:
https://devicetree-specification.readthedocs.io/en/latest/chapter2-devicetree-basics.html#generic-names-recommendation
If you cannot find a name matching your device, please check in kernel
sources for similar cases or you can grow the spec (via pull request to
DT spec repo).

And drop unused labels.

> +      compatible = "st,stm32mp25-mdf";
> +      ranges = <0 0x504d0000 0x1000>;
> +      reg = <0x504d0000 0x8>, <0x504d0ff0 0x10>;

Address ranges of 2 and 4 words?

Best regards,
Krzysztof


