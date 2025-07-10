Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 49E02C83F1D
	for <linux-arm-kernel@archiver.kernel.org>; Thu, 10 Jul 2025 11:24:10 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=H3hxUHQ8yP6inIqIwquf317fNvdkQLVt+Zm6mfg/06w=; b=s9rMSEfftCScIngxGQ6do7k4Z+
	wQH1gKubYbNJjcptyMTy3fz1apyF2ISBVI0aq734lNaLiCV3YszXYuhy8Hf4Z9Nq/ZJhpzkc0aF9I
	/4s/x6NRyb1BD8sgLYo9ApMBsQkMiZ2e9V1olz+vXiGsU2BdOHxsTmiYx+RaMjKkibb6DminALCP7
	LBTdO9FH7R6YtN1LF+sUUCE81e2kOha6L41rS5sxgQBxyZLAOFBbnqtMQAKb9gKVouzKURbq234lJ
	G5S2lXlvllY4+oMH56E0SjQi31EpDZ+aWZ6DPoG7B1CmMQrc6NBJZENjdGo/IfMMHO/nk3y4QLcaN
	t2C6Bq0g==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZpNj-0000000BdDI-2m9a;
	Thu, 10 Jul 2025 11:24:03 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1uZo1Q-0000000BOqn-3s00;
	Thu, 10 Jul 2025 09:56:57 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id 8A1906146D;
	Thu, 10 Jul 2025 09:56:55 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A715FC4CEF1;
	Thu, 10 Jul 2025 09:56:54 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1752141415;
	bh=mUito/jbA4SgjLb2qRX3cKcksXc5sWgtFL2hulDmMws=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=XV5wYT8O1fidh5Sr+V3202O/eRFgVKLY/sfmxTdPe2Yrp/CcgeGmXOYEufI2YxgyP
	 XXec9GZnA4A0Mx8phUBpWboHXKztgfrV2HutjlBMShV94iZdwUPeMDDS77de8NC+7V
	 3xqxvM6Ne5orWGdUtH84sZzwQlZ5bq6GJNiOrVMQwpQETkzeD5/AhJO/1GKUHvoNSL
	 aErflbConbqcwRMz/10YcEzC2EmqzJsYggHixMHeskHjn3mN6BYBU9c+ef8evNFYiw
	 qzrxAUkSh0o09EIUOnH4ezlX8efg2g33SuaqPSNdR0q2BFL6Zg5ttMAByxLWICw475
	 A0t2hA+TVNCVA==
Date: Thu, 10 Jul 2025 11:56:52 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: jiebing chen <jiebing.chen@amlogic.com>
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
Subject: Re: [PATCH v5 1/6] dt-bindings: clock: meson: Add audio power domain
 for s4 soc
Message-ID: <20250710-polite-cuddly-platypus-5fe9dc@krzk-bin>
References: <20250710-audio_drvier-v5-0-d4155f1e7464@amlogic.com>
 <20250710-audio_drvier-v5-1-d4155f1e7464@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250710-audio_drvier-v5-1-d4155f1e7464@amlogic.com>
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

On Thu, Jul 10, 2025 at 11:35:37AM +0800, jiebing chen wrote:
> The audio power domain has been detected on S4 device.
> It must be enabled prior to audio operations.
> 
> Signed-off-by: jiebing chen <jiebing.chen@amlogic.com>
> ---
>  .../bindings/clock/amlogic,axg-audio-clkc.yaml     | 55 +++++++++++++++++++++-
>  1 file changed, 54 insertions(+), 1 deletion(-)
> 
> diff --git a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> index fd7982dd4ceab82389167079c2258a9acff51a76..c3f0bb9b2ff050394828ba339a7be0c9c48e9a76 100644
> --- a/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> +++ b/Documentation/devicetree/bindings/clock/amlogic,axg-audio-clkc.yaml
> @@ -21,6 +21,8 @@ properties:
>        - amlogic,axg-audio-clkc
>        - amlogic,g12a-audio-clkc
>        - amlogic,sm1-audio-clkc
> +      - amlogic,s4-audio-clkc
> +      - amlogic,clock-pads-clkc

Keep the list sorted.

>  
>    '#clock-cells':
>      const: 1
> @@ -100,13 +102,15 @@ properties:
>    resets:
>      description: internal reset line
>  
> +  power-domains:
> +    maxItems: 1
> +
>  required:
>    - compatible
>    - '#clock-cells'
>    - reg
>    - clocks
>    - clock-names
> -  - resets
>  
>  allOf:
>    - if:
> @@ -116,12 +120,37 @@ allOf:
>              enum:
>                - amlogic,g12a-audio-clkc
>                - amlogic,sm1-audio-clkc
> +              - amlogic,s4-audio-clkc

Keep it sorted.

>      then:
>        required:
>          - '#reset-cells'
>      else:
>        properties:
>          '#reset-cells': false
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
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - amlogic,clock-pads-clkc
> +    then:
> +      properties:
> +        resets: false
> +    else:
> +      required:
> +        - resets
>  
>  additionalProperties: false
>  
> @@ -129,6 +158,7 @@ examples:
>    - |
>      #include <dt-bindings/clock/axg-clkc.h>
>      #include <dt-bindings/reset/amlogic,meson-axg-reset.h>
> +    #include <dt-bindings/power/meson-s4-power.h>
>      apb {
>          #address-cells = <2>;
>          #size-cells = <2>;
> @@ -198,4 +228,27 @@ examples:
>                            "slv_lrclk9";
>              resets = <&reset RESET_AUDIO>;
>          };
> +      clk_pad: clock-controller@330e80 {

Inconsistent indentation. Look at the rest here.

Best regards,
Krzysztof


