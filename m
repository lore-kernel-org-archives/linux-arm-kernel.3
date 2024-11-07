Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id AC92AD43346
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  7 Nov 2024 11:04:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=h7GI8ImiSFmMn/ByFin0ufEHoMIcEskZZRYYN8hVylc=; b=vl+MdUY5ndC6ktxtSN7ELS5EQf
	PfcBYr1DfXWQxuH5ByAj/+C+m2AHPinmzC2raJ3OYNLmaEEjejnk8SXWqlqdfwqL0KmroQttRauV6
	ZqQOx0eoTP5RIacA9keLQeUWQ0M7eo4mmFtMVUnEosxhNLNmlwd9wNaWGaOw475k7gdECGGEOtLRH
	zro5A41vAxbCau1AvSC/9z/5cLiFaFakMp7jAUEsfFPc3CzIx/Z8np6ausj5vhI21c2uWMLV3glGt
	Pjd3cuT3wLP39KnrzPklcoFxU7pXvpGl7uDJ2NJspVUiUaJRrvnnNDe7Vs57V2qGDuvctdm7Yfm6y
	l2ifJJ0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1t90JZ-00000006beW-0Gsn;
	Thu, 07 Nov 2024 11:04:37 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1t90Hc-00000006azB-2BLG
	for linux-arm-kernel@lists.infradead.org;
	Thu, 07 Nov 2024 11:02:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 30E395C57A8;
	Thu,  7 Nov 2024 11:01:51 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 1C1BDC4CED0;
	Thu,  7 Nov 2024 11:02:33 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1730977355;
	bh=XPXzTBydfU0tNU9z2BgGa6DkHPQcDioWlU+fnXhanAQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=p8tB6yZ258syUr1ek0tZTtb+RurPUY+6mR2sE7oxFqCjYJtywTKHCgYnfD0eYt8mw
	 GqgjRReTXPy3/m+SWUedidkbZRT/BYIdtaPeVo5wuHSmpg6uJmoPzOIKIEMr4PXB8x
	 iKFoboncs9qeaL1Nxe7dlszu8WyV5hsUPztKea8g9rCpeXKjiVW4VZe1ETnAEdTKQH
	 SeFG4JLYW3UVvFJtZUOTxdTEuPKu8NeqgXhznJDriEYHqgrN+etpVmaXuulaBpjPQB
	 pzOH3d/HDqzIkLOg1Q+xQDUI4BnKgzIxC4tkDSx+4MhrjBQmxywSAE+nnCaLiQDRce
	 r5GgHUzJIyYOQ==
Date: Thu, 7 Nov 2024 12:02:31 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Olivier Moysan <olivier.moysan@foss.st.com>
Cc: Arnaud Pouliquen <arnaud.pouliquen@foss.st.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Maxime Coquelin <mcoquelin.stm32@gmail.com>, Alexandre Torgue <alexandre.torgue@foss.st.com>, 
	linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-stm32@st-md-mailman.stormreply.com, linux-arm-kernel@lists.infradead.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/2] ASoC: dt-bindings: add stm32mp25 support for i2s
Message-ID: <ynddlgloyliun6eiiep2ry6l5h2uqu7ujkusrptpqe74nvan7t@j44ltlokati3>
References: <20241106152528.939232-1-olivier.moysan@foss.st.com>
 <20241106152528.939232-2-olivier.moysan@foss.st.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241106152528.939232-2-olivier.moysan@foss.st.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241107_030236_669524_37C9CAC1 
X-CRM114-Status: GOOD (  15.93  )
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

On Wed, Nov 06, 2024 at 04:25:27PM +0100, Olivier Moysan wrote:
> Add STM32MP25 support for STM32 I2S peripheral,
> through "st,stm32mp25-i2s" compatible.
> 
> Signed-off-by: Olivier Moysan <olivier.moysan@foss.st.com>
> ---
>  .../bindings/sound/st,stm32-i2s.yaml          | 60 +++++++++++++++----
>  1 file changed, 47 insertions(+), 13 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> index 8978f6bd63e5..8f08f1f28a1b 100644
> --- a/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> +++ b/Documentation/devicetree/bindings/sound/st,stm32-i2s.yaml
> @@ -13,13 +13,11 @@ description:
>    The SPI/I2S block supports I2S/PCM protocols when configured on I2S mode.
>    Only some SPI instances support I2S.
>  
> -allOf:
> -  - $ref: dai-common.yaml#
> -
>  properties:
>    compatible:
>      enum:
>        - st,stm32h7-i2s
> +      - st,stm32mp25-i2s
>  
>    "#sound-dai-cells":
>      const: 0
> @@ -28,18 +26,12 @@ properties:
>      maxItems: 1
>  
>    clocks:
> -    items:
> -      - description: clock feeding the peripheral bus interface.
> -      - description: clock feeding the internal clock generator.
> -      - description: I2S parent clock for sampling rates multiple of 8kHz.
> -      - description: I2S parent clock for sampling rates multiple of 11.025kHz.
> +    minItems: 2

Keep old list and just add minItms here

> +    maxItems: 4
>  
>    clock-names:
> -    items:
> -      - const: pclk
> -      - const: i2sclk
> -      - const: x8k
> -      - const: x11k
> +    minItems: 2

Ditto

> +    maxItems: 4
>  
>    interrupts:
>      maxItems: 1
> @@ -79,6 +71,48 @@ required:
>    - dmas
>    - dma-names
>  
> +allOf:
> +  - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32h7-i2s
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: clock feeding the peripheral bus interface.
> +            - description: clock feeding the internal clock generator.
> +            - description: I2S parent clock for sampling rates multiple of 8kHz.
> +            - description: I2S parent clock for sampling rates multiple of 11.025kHz.

Instead: minItems: 4

> +
> +        clock-names:
> +          items:
> +            - const: pclk
> +            - const: i2sclk
> +            - const: x8k
> +            - const: x11k

ditto

> +
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: st,stm32mp25-i2s
> +
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: clock feeding the peripheral bus interface.
> +            - description: clock feeding the internal clock generator.

instead: maxItems: 2

> +
> +        clock-names:
> +          items:
> +            - const: pclk
> +            - const: i2sclk

ditto

Thanks to this you keep the lists synchronized between variants - they
share the items.

Best regards,
Krzysztof


