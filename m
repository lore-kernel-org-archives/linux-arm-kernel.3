Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id BD168606A320
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 28 Oct 2026 14:48:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=lists.infradead.org header.i=@lists.infradead.org header.a=rsa-sha256 header.s=bombadil.20210309 header.b=dMiMBU+J;
	dkim=pass (2048-bit key, unprotected) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=mPDjmvlj
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:
	List-Unsubscribe-Post:List-Owner;
	bh=Dji3XbcxBruXL4du3GW6afPCNwFUKBPPMSrHsKB8V0o=; b=dMiMBU+JIGIiB6CMU0it6s1vgk
	4/8b1szAYMFyeuPjGrLl9MEaU98n6ZCIiot0W+LaWxJz4Ccc8GxWa3pn61AYAJH8QYxWm+4ZYbPwX
	fKngVW6PKJM+uLdZe/3lFh2TuKYis5eCbm169jTQzq0MK8+vOCRtMSeSwaa9/mhQsr1tKyW6pxD61
	sySvt1YK5vQRt3UqQYbHL3STXfTEhsKZ1aDIPUQFRbd8u5G4G49hghrCN+J/pFvCN4+RLQw6SIm5S
	NyHwO/L8l5P1KXlkL5zdLfU4KD+RA8B3rvN7uK54Y+3RER8F6buK5gRz3YVT4b8rnVG6EQYPh3bap
	xDuqPCeA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4xN-00000007FWl-2SJJ;
	Wed, 28 Oct 2026 14:48:49 +0000
Received: from tor.source.kernel.org ([2600:3c04:e001:324:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.100.1 #2 (Red Hat Linux))
	id 1xM4xM-00000007FWB-21zG;
	Wed, 28 Oct 2026 14:48:48 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by tor.source.kernel.org (Postfix) with ESMTP id 7F62560207;
	Wed, 28 Oct 2026 14:48:47 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 32D111F01825;
	Wed, 28 Oct 2026 14:48:46 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1793198927;
	bh=Dji3XbcxBruXL4du3GW6afPCNwFUKBPPMSrHsKB8V0o=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=mPDjmvljOWfR2WCxVwsCMCTrrxvR3gprOSt1d3iQG3Qb0xD9wFM1J/3w9sbph10It
	 cfx84oETwlzAKrIiQ1InLY4zxXMSOUETRFKw0qRKkk/gwxI4cFM2FgAVhHFo5R3JRy
	 oo1c1TrYYvEb2eOouY+/Lo5PccLaI6Sb+nUbo4iLkfC3+YC91aqqBUCJBktlfYcmNh
	 BPCHOxSPtKKcMD2o4nAQnmfSa/mbqnRBpWTp9gZpuMAr6ValcNIVVPHrnKu7fHLEsX
	 lEoWiPm+Dcwg93VSIP3LXYCU9pY7ooaZCc4z5Tct5z6CO0IxJQoxu6KN+u9ygxEUjf
	 s3Qp0AyDNNxsw==
Date: Wed, 28 Oct 2026 15:48:44 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jiebing Chen <jiebing.chen@amlogic.com>
Cc: Jerome Brunet <jbrunet@baylibre.com>, 
	Liam Girdwood <lgirdwood@gmail.com>, Mark Brown <broonie@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Jaroslav Kysela <perex@perex.cz>, Takashi Iwai <tiwai@suse.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Kevin Hilman <khilman@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Michael Turquette <mturquette@baylibre.com>, 
	Stephen Boyd <sboyd@kernel.org>, linux-sound@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org, linux-arm-kernel@lists.infradead.org, 
	linux-amlogic@lists.infradead.org, linux-clk@vger.kernel.org, jian.xu@amlogic.com, 
	shuai.li@amlogic.com, zhe.wang@amlogic.com
Subject: Re: [PATCH v7 1/5] dt-bindings: clock: meson: Add audio power domain
 for S4 soc
Message-ID: <20261028-sparkling-objective-cricket-a428bd@quoll>
References: <20261021-audio_drvier-v7-0-2b9aeae9cb8a@amlogic.com>
 <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
X-Archived-By: <archiver.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261021-audio_drvier-v7-1-2b9aeae9cb8a@amlogic.com>
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

On Wed, Oct 21, 2026 at 03:08:28PM +0800, Jiebing Chen wrote:
> The audio power domain has been found on S4 device.
> It must be enabled prior to audio operations.
> 
> Signed-off-by: Jiebing Chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml          | 17 ++++++++++++++++-
>  1 file changed, 16 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4cea..69f5fef5f14a 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -20,6 +20,7 @@ properties:
>      enum:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
> +      - amlogic,s4-audio-clkc
>        - amlogic,sm1-audio-clkc
>  
>    '#clock-cells':
> @@ -100,6 +101,8 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    maxItems: 1

Missing blank line.

>  required:
>    - compatible
>    - '#clock-cells'
> @@ -115,6 +118,7 @@ allOf:
>            contains:
>              enum:
>                - amlogic,g12a-audio-clkc
> +              - amlogic,s4-audio-clkc
>                - amlogic,sm1-audio-clkc
>      then:
>        required:
> @@ -122,7 +126,18 @@ allOf:
>      else:
>        properties:
>          '#reset-cells': false
> -
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,s4-audio-clkc
> +    then:
> +      required:
> +        - power-domains
> +    else:
> +      properties:
> +        power-domains: false

And here as well.

Best regards,
Krzysztof


