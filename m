Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 2C45EC282DE
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 10 Mar 2025 08:11:22 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=Nj0JxCcf5Cvzvp0KqM7r8IrbblgLZOaKHMZBNAxejMw=; b=BGYt3MMiQZAhEQqAW0WahWnPnH
	2ejoRkdD3jHJsjEfsiRIQVVxWzvFOhABZaE8urSblM/v17iq7K2wuWhmx7/ZXx62sCdf6hK5bH8G6
	v05KELR23H6vLHMXZ69mHWaS1LVSKLc/v3FM+1MTCGCh2QJ87zDv03lzB5x3zgmIZTYVt0sMA/Fsl
	efJluoa+qR0eHdpwJSZ8E8gUo3zpoq42q/C8VKq4MGsR1a46vXHIqpK4HEqLu1K8sExM8fWzSLAIv
	KMUGhXKRw7/03GzSRzZciB768O78ayhj4kB3xQ6xDeuMx8zFu2fL4qApa95Z7p7ZtgaPGQCl22a1V
	OFjyeCcA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1trYEC-00000001rMi-1ymy;
	Mon, 10 Mar 2025 08:11:12 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1trYCV-00000001r7d-1NYQ;
	Mon, 10 Mar 2025 08:09:28 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 56B3AA44D25;
	Mon, 10 Mar 2025 08:03:56 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 590AEC4CEE5;
	Mon, 10 Mar 2025 08:09:25 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1741594166;
	bh=gwas8E4kvvAA/eUvbABEADodAjBCs+rgr6xiwge6OXE=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=a+66pxfoikf19N4ZasCwPfg8jAydGU3Gk+jsm+rgiOAD3usvsqyWDS7W6OzK4ss47
	 JyaAG7IZNJHl3E0gHRNI0g0oUpdr0BeO/Wk1Cjtog4US8Elt69O3dllahJ8GrjQEcg
	 agdKCJ3hR+sOwTGvnQDAtc14qdFAwk6nc14R6CZhVyGKL2vove7TKEvpPur9qy5cxc
	 aEeH4JD80K987+bq+mfpRAecYzYAksY81JkSA9G9iuj7hCMpT3IRlA6xoK+oKOfY4K
	 IaeN09ULdgMOrS/mNZ4BCZDZRZLQLVj7087aDkIuex3SOUqq1/Xu4EKUi39Ju24HEK
	 64P5KU46tsj4Q==
Date: Mon, 10 Mar 2025 09:09:22 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Jan Dakinevich <jan.dakinevich@salutedevices.com>
Cc: Conor Dooley <conor+dt@kernel.org>, devicetree@vger.kernel.org, 
	Jaroslav Kysela <perex@perex.cz>, Jerome Brunet <jbrunet@baylibre.com>, 
	Kevin Hilman <khilman@baylibre.com>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Liam Girdwood <lgirdwood@gmail.com>, linux-amlogic@lists.infradead.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org, linux-sound@vger.kernel.org, 
	Mark Brown <broonie@kernel.org>, Martin Blumenstingl <martin.blumenstingl@googlemail.com>, 
	Neil Armstrong <neil.armstrong@linaro.org>, Rob Herring <robh@kernel.org>, Takashi Iwai <tiwai@suse.com>
Subject: Re: [PATCH v2 2/3] ASoC: dt-bindings: meson: t9015: add support for
 A1 SoC family
Message-ID: <20250310-smiling-gerbil-of-whirlwind-8fa4a5@krzk-bin>
References: <20250309181630.1322745-1-jan.dakinevich@salutedevices.com>
 <20250309181630.1322745-3-jan.dakinevich@salutedevices.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250309181630.1322745-3-jan.dakinevich@salutedevices.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250310_010927_496119_1CED452A 
X-CRM114-Status: GOOD (  14.56  )
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

On Sun, Mar 09, 2025 at 09:16:29PM +0300, Jan Dakinevich wrote:
> Add support for internal audio codec found A1 SoC family. On this SoC
> the component supports capturing from ADC and has specific configuration
> of input/output lines.
> 
> Signed-off-by: Jan Dakinevich <jan.dakinevich@salutedevices.com>
> ---
>  .../bindings/sound/amlogic,t9015.yaml         | 69 +++++++++++++++++--
>  1 file changed, 65 insertions(+), 4 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> index 5f5cccdbeb34..962795470601 100644
> --- a/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> +++ b/Documentation/devicetree/bindings/sound/amlogic,t9015.yaml
> @@ -9,9 +9,6 @@ title: Amlogic T9015 Internal Audio DAC
>  maintainers:
>    - Jerome Brunet <jbrunet@baylibre.com>
>  
> -allOf:
> -  - $ref: dai-common.yaml#
> -
>  properties:
>    $nodename:
>      pattern: "^audio-controller@.*"
> @@ -21,7 +18,9 @@ properties:
>  
>    compatible:
>      items:
> -      - const: amlogic,t9015
> +      - enum:
> +          - amlogic,t9015
> +          - amlogic,t9015-a1
>  
>    clocks:
>      items:
> @@ -43,6 +42,17 @@ properties:
>  
>    sound-name-prefix: true
>  
> +  lineout-left:

Missing vendor prefix.

> +    $ref: /schemas/types.yaml#/definitions/string

enum with values

> +  lineout-right:
> +    $ref: /schemas/types.yaml#/definitions/string
> +  linein-left:
> +    $ref: /schemas/types.yaml#/definitions/string
> +  linein-right:
> +    $ref: /schemas/types.yaml#/definitions/string
> +  micbias:

use proper unit suffix name, e.g. microvolt

> +    $ref: /schemas/types.yaml#/definitions/string
> +
>  required:
>    - "#sound-dai-cells"
>    - compatible
> @@ -52,6 +62,57 @@ required:
>    - resets
>    - AVDD-supply
>  
> +

Only one blank line

> +allOf:
> +  - $ref: dai-common.yaml#
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: amlogic,t9015-a1
> +    then:
> +      properties:
> +        lineout-left:
> +          items:

You do not have multiple items here, drop.

> +            - enum:
> +                - none
> +                - right
> +                - left-inverted
> +        lineout-right:
> +          items:
> +            - enum:
> +                - none
> +                - left
> +                - right-inverted
> +        linein-left:
> +          items:
> +            - enum:
> +                - none
> +                - differential
> +                - positive
> +                - negative
> +        linein-right:
> +          items:
> +            - enum:
> +                - none
> +                - differential
> +                - positive
> +                - negative

All these go to the top level.

> +        micbias:
> +          items:
> +            - enum:
> +                - 2.0V
> +                - 2.1V
> +                - 2.3V
> +                - 2.5V
> +                - 2.8V
> +    else:
> +      lineout-left: false
> +      lineout-right: false
> +      linein-left: false
> +      linein-right: false
> +      micbias: false

This is correct.

Best regards,
Krzysztof


