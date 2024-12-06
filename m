Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 784CFE77173
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  6 Dec 2024 13:05:40 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Bwc9LXDAAJZ9/0kvee7gl+JgDJP43qDkmP86iqZzvEQ=; b=n6IhEV3LxR5WbJWSLIbXUGZz0F
	7hH7Y7cr2G6nTr36z+ngg0zgZTtBMvNc3GyQSmrB04nvMsb22oeezRFpOdAOnJd3d5rHPW5f2hGdb
	caLbPwo+Emx3hdWvBDPmcj7Qj4qQGTTjGnYJWIdj1U+gERLMokkQZ0rQDe8swUCfrMPANUBpcdDJN
	LwQlPnhUN+EiIVNHG37UcsHKa7YyAuxAr2pT91kqM1ECnLTOEysNCFlcpni47p31AesSw5q/aVy2c
	nB7U1NT+syZDUzRrQWN6zTSRU8txGFnk5NSEWVu5b5pVfNBDDhGJtAXCihhLMzl3Qcc8t9FqDyQfY
	gcoc+K+w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY1M-00000001g89-1kXx;
	Fri, 06 Dec 2024 13:05:24 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tJY0J-00000001ft2-2iMi
	for linux-arm-kernel@lists.infradead.org;
	Fri, 06 Dec 2024 13:04:20 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 0406BA4423D;
	Fri,  6 Dec 2024 13:02:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id E0B17C4CEE0;
	Fri,  6 Dec 2024 13:04:17 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1733490258;
	bh=VLfoQRnwWe0Rvqit/Z+Tb+RfEtPz3Jei9eCUy65SVAU=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=Y0EpTmWLThG3R0PlwzAt7twm24nccovDnKlaPEcQS420UMIwrtO8xHxpRVxkymzH9
	 KH5TnQgF9SxF7RhZwz83d0UAZ7VrV6Mn2zCla7AcoZyDrKudTYbv5rqby013bXNGJo
	 f2lhAIDa8OwmIDCnwMLAPYGwWDFVA082tVGOO3ohR/GMKagavcsPEtMIJy80BcI5K5
	 pWjAoeR6vrve6+NdEWNQTKH+KPSJfEK2TmrH28pTH4f4KrY7SKWxtu4Ufk0dRGBCGq
	 TjtVm+G6AsBDUc0t8I2hBdKMw8+O31HQ9RfqgrWcXdX40FfDIJ9wWyM/pX1WP/Z+/5
	 0lHK18/yeAvAA==
Date: Fri, 6 Dec 2024 14:04:15 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Dario Binacchi <dario.binacchi@amarulasolutions.com>
Cc: linux-kernel@vger.kernel.org, linux-amarula@amarulasolutions.com, 
	Abel Vesa <abelvesa@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Fabio Estevam <festevam@gmail.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Michael Turquette <mturquette@baylibre.com>, Peng Fan <peng.fan@nxp.com>, 
	Pengutronix Kernel Team <kernel@pengutronix.de>, Rob Herring <robh@kernel.org>, 
	Sascha Hauer <s.hauer@pengutronix.de>, Shawn Guo <shawnguo@kernel.org>, Stephen Boyd <sboyd@kernel.org>, 
	devicetree@vger.kernel.org, imx@lists.linux.dev, linux-arm-kernel@lists.infradead.org, 
	linux-clk@vger.kernel.org
Subject: Re: [PATCH v5 15/20] dt-bindings: clock: imx8m-clock: support spread
 spectrum clocking
Message-ID: <gbymcmoya7dfmedq4nkopqpswh63d2ujxl2elc2x7x325b75bu@anp36sdya43v>
References: <20241205111939.1796244-1-dario.binacchi@amarulasolutions.com>
 <20241205111939.1796244-16-dario.binacchi@amarulasolutions.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241205111939.1796244-16-dario.binacchi@amarulasolutions.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241206_050419_872605_ADE26FE1 
X-CRM114-Status: GOOD (  22.04  )
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

On Thu, Dec 05, 2024 at 12:17:50PM +0100, Dario Binacchi wrote:
> The patch adds the DT bindings for enabling and tuning spread spectrum
> clocking generation.
> 
> Signed-off-by: Dario Binacchi <dario.binacchi@amarulasolutions.com>
> 
> ---
> 
> (no changes since v4)
> 
> Changes in v4:
> - Drop "fsl,ssc-clocks" property. The other added properties now refer
>   to the clock list.
> - Updated minItems and maxItems of
>   - clocks
>   - clock-names
>   - fsl,ssc-modfreq-hz
>   - fsl,ssc-modrate-percent
>   - fsl,ssc-modmethod
> - Updated the dts examples
> 
> Changes in v3:
> - Added in v3
> - The dt-bindings have been moved from fsl,imx8m-anatop.yaml to
>   imx8m-clock.yaml. The anatop device (fsl,imx8m-anatop.yaml) is
>   indeed more or less a syscon, so it represents a memory area
>   accessible by ccm (imx8m-clock.yaml) to setup the PLLs.
> 
> Changes in v2:
> - Add "allOf:" and place it after "required:" block, like in the
>   example schema.
> - Move the properties definition to the top-level.
> - Drop unit types as requested by the "make dt_binding_check" command.
> 
>  .../bindings/clock/imx8m-clock.yaml           | 77 +++++++++++++++++--
>  1 file changed, 71 insertions(+), 6 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> index c643d4a81478..83036f6d2274 100644
> --- a/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> +++ b/Documentation/devicetree/bindings/clock/imx8m-clock.yaml
> @@ -29,12 +29,12 @@ properties:
>      maxItems: 2
>  
>    clocks:
> -    minItems: 6
> -    maxItems: 7
> +    minItems: 7
> +    maxItems: 10

ABI break without mentioning, without any explanation in the commit msg.

>  
>    clock-names:
> -    minItems: 6
> -    maxItems: 7
> +    minItems: 7
> +    maxItems: 10
>  
>    '#clock-cells':
>      const: 1
> @@ -43,6 +43,34 @@ properties:
>        ID in its "clocks" phandle cell. See include/dt-bindings/clock/imx8m-clock.h
>        for the full list of i.MX8M clock IDs.
>  
> +  fsl,ssc-modfreq-hz:
> +    description:
> +      The values of modulation frequency (Hz unit) for each clock
> +      supporting spread spectrum.
> +    minItems: 7
> +    maxItems: 10

Why all cloks receive now spread spectrum? I had impression - and all
your previous versions were doing this - that you have only three or
four clocks with SSC.

Do existing clocks 1-6 support SSC?

> +
> +  fsl,ssc-modrate-percent:
> +    description:
> +      The percentage values of modulation rate for each clock
> +      supporting spread spectrum.
> +    minItems: 7
> +    maxItems: 10
> +
> +  fsl,ssc-modmethod:
> +    $ref: /schemas/types.yaml#/definitions/non-unique-string-array
> +    description:
> +      The modulation techniques for each clock supporting spread
> +      spectrum.
> +    minItems: 7
> +    maxItems: 10
> +    items:
> +      enum:
> +        - ""

Drop "", not sure why do you need it.

> +        - down-spread
> +        - up-spread
> +        - center-spread
> +
>  required:
>    - compatible
>    - reg
> @@ -76,6 +104,10 @@ allOf:
>              - const: clk_ext2
>              - const: clk_ext3
>              - const: clk_ext4
> +        fsl,ssc-modfreq-hz: false
> +        fsl,ssc-modrate-percent: false
> +        fsl,ssc-modmethod: false
> +
>      else:
>        properties:
>          clocks:
> @@ -86,6 +118,10 @@ allOf:
>              - description: ext2 clock input
>              - description: ext3 clock input
>              - description: ext4 clock input
> +            - description: audio1 PLL input
> +            - description: audio2 PLL input
> +            - description: dram PLL input
> +            - description: video PLL input

Also ABI break....

Best regards,
Krzysztof


