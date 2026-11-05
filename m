Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3C55A606D80F
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  5 Nov 2026 11:57:25 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=EjZH/TmY;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=MTkmDUel
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=r6Zmr2w7yD8Ip+j9uCT09/R1QkyDYQmRF/et5N9k+lg=; b=EjZH/TmYk0u8saADD84KPimlV8
	U8f285UlicxPSfHM2DlfpFyw/Ac9qrizK8sFZNZ/UvQYqxqfv62I6F2XzuaVKXxsjs/02LDXkaWDM
	CSZWZJfMoCHqIXkN8DAAmwT9P6LpaPh5Ac+AlaQViLc54RM4bN+OqGPPDfrb9QwI6JVKW4dIkheIh
	McTYhLw8kP4wReQ6vllCa7cvhuYVWSdmIhO8W1i11Q6b4SwFjuFs1qFkEolDgbX6+NDpAZwJ7Bi2g
	EY0M19w648I74MLq55oWCRrwsSem1Kbjyf5GZXcGKj6iOaTpPtfSZlkiS3Smsqg+r4HDDJ59+ORpi
	vIeohXJA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw5n-00000008nG9-0xbm;
	Thu, 05 Nov 2026 11:57:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xOw5k-00000008nFL-1n6S;
	Thu, 05 Nov 2026 11:57:16 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id CC7ED4181D;
	Thu,  5 Nov 2026 11:57:15 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id D883C1F00919;
	Thu,  5 Nov 2026 11:57:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793879835;
	bh=r6Zmr2w7yD8Ip+j9uCT09/R1QkyDYQmRF/et5N9k+lg=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=MTkmDUel1hF5mX4WG1FDvygwC/sBvJsmKJkN64N5mS8ZMC5a+f8oTJ3ISN3ZVOWL4
	 mTwQMwzNLuNL7ibPktJ939U+6EknlJPb0RQVm9fvpkbNjMuxnqCH7Z+5s3SKedkLpT
	 tswdGkv5+25IksudFLaP9sdC1WSzb8JDtPh7MzFwtmHvzKcXsA1dA8Ay8B8ABMhFWG
	 SBQloVwIXjSJYDGz//5Ki3wtQ1USwZTIyRLvva27DNrEnEtZbQdtOQyP1+Ys7fKuq5
	 odxSGWc/CcDNvfIH+EqM0668iEdTHRVt8TUj1HyDVWyCpAIp4XxyD68l97DnZ8xdfK
	 kovsJbSrlHQGw==
Date: Thu, 5 Nov 2026 12:57:12 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Lucas Tanure <tanure@linux.com>
Cc: xianwei.zhao@amlogic.com, Andrew Lunn <andrew+netdev@lunn.ch>, 
	davem@davemloft.net, Eric Dumazet <edumazet@kernel.org>, 
	Jakub Kicinski <kuba@kernel.org>, Paolo Abeni <pabeni@redhat.com>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Jerome Brunet <jbrunet@baylibre.com>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Maxime Chevallier <maxime.chevallier@bootlin.com>, Maxime Coquelin <mcoquelin.stm32@gmail.com>, 
	Alexandre Torgue <alexandre.torgue@foss.st.com>, netdev@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v5 2/7] dt-bindings: net: amlogic,meson-dwmac: add
 amlogic,t7-dwmac
Message-ID: <20261105-stoic-cricket-of-tolerance-cb3014@quoll>
References: <20261103163715.385394-1-tanure@linux.com>
 <20261103163715.385394-3-tanure@linux.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261103163715.385394-3-tanure@linux.com>
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

On Tue, Nov 03, 2026 at 04:37:10PM +0000, Lucas Tanure wrote:
> 
> Assisted-by: LLM

Drop this one.

> Signed-off-by: Lucas Tanure <tanure@linux.com>
> ---
>  .../bindings/net/amlogic,meson-dwmac.yaml     | 59 +++++++++++++++++++
>  1 file changed, 59 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> index e769c9bb70d8..6de013e3e8f6 100644
> --- a/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> +++ b/Documentation/devicetree/bindings/net/amlogic,meson-dwmac.yaml
> @@ -23,6 +23,7 @@ select:
>            - amlogic,meson-gxbb-dwmac
>            - amlogic,meson-axg-dwmac
>            - amlogic,meson-g12a-dwmac
> +          - amlogic,t7-dwmac
>    required:
>      - compatible
>  
> @@ -57,6 +58,59 @@ allOf:
>              - const: clkin1
>              - const: timing-adjustment
>  
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t7-dwmac
> +    then:
> +      properties:
> +        clocks:
> +          items:
> +            - description: GMAC main clock
> +            - description: First parent clock of the internal mux
> +            - description: Second parent clock of the internal mux
> +            - description:
> +                clock of the pipeline stage inserted in the bus path between
> +                the controller and the DRAM. Without it, the controller cannot
> +                complete DMA transfers.
> +            - description:
> +                clock of the register block holding PRG_ETH0 and PRG_ETH1.
> +                Without it, the block reads as zero and ignores writes.

This sounds like you take clock from other block. That's wrong, that
device should take its own clock.


> +
> +        clock-names:
> +          items:
> +            - const: stmmaceth
> +            - const: clkin0
> +            - const: clkin1
> +            - const: pipeline
> +            - const: pclk
> +
> +        # The PHY adds the 2ns RGMII delays, see ethernet-controller.yaml.
> +        # The RX delay line of this glue is fine tuning in 200ps steps,
> +        # added on top of what phy-mode describes. The TX side has no fine
> +        # tuning: its only step is a quarter of the clock period, the full
> +        # 2ns at 1Gbit/s, so the TX property is not accepted.
> +        tx-internal-delay-ps: false
> +
> +        # Deprecated: new SoCs use the standard *-internal-delay-ps
> +        # properties instead.
> +        amlogic,tx-delay-ns: false
> +        amlogic,rx-delay-ns: false
> +
> +  # Delay definitions for Meson8b and newer
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,meson8b-dwmac
> +              - amlogic,meson8m2-dwmac
> +              - amlogic,meson-gxbb-dwmac
> +              - amlogic,meson-axg-dwmac
> +              - amlogic,meson-g12a-dwmac
> +    then:
> +      properties:
>          amlogic,tx-delay-ns:
>            enum: [0, 2, 4, 6]
>            default: 2
> @@ -106,6 +160,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,meson-g12a-dwmac
> +              - amlogic,t7-dwmac
>      then:
>        properties:
>          rx-internal-delay-ps:
> @@ -142,6 +197,10 @@ properties:
>        - items:
>            - const: amlogic,meson6-dwmac
>            - const: snps,dwmac
> +      - items:
> +          - const: amlogic,t7-dwmac
> +          - const: snps,dwmac-5.10a
> +          - const: snps,dwmac

I see no such hunk in the code, so not sure how to review this.

Best regards,
Krzysztof


