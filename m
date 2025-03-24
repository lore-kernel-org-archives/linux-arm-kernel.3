Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 411A0C36002
	for <linux-arm-kernel@archiver.kernel.org>; Mon, 24 Mar 2025 16:57:49 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:
	Content-Transfer-Encoding:Content-Type:MIME-Version:References:Message-ID:
	Subject:Cc:To:From:Date:Reply-To:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=60q46KmdQZehKq1+kNfcfffvKPOs4x/Ca6caezCNXyg=; b=fY50v8550XjmpwNfbLfjn21c43
	UxwgnzgYodzoklyyMYLMQFPrxxtsKzSx6AM2PwQKxIBtMQw+mor77a1Y0Jg1G1MrNCLbcEesxmAqm
	2HiPf9hVfAiO0OaLtb5KjvR/DNH4GH2kzpHqRSkReUwATLpGuDavsyW67UwLt9u29ikSbZ/ECXswC
	7XRTfCo821+g+va2/v+0gj4Z9YrriDvvmAXnbvfpCETKOJ0icSguvm4xBdTwKLcmuAF8yKsL2eLjI
	2xwiK0LpHZ5UgKqfUh8sw1uV2EH8+Wxvg0PG8sHHS3hJ623GnOZm4nGWwtfbn9FvyrekVghi8NOLu
	PciOqW8Q==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1twl7L-00000003ird-1tk0;
	Mon, 24 Mar 2025 16:57:39 +0000
Received: from dfw.source.kernel.org ([2604:1380:4641:c500::1])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1twl5L-00000003iW3-3BCK
	for linux-arm-kernel@lists.infradead.org;
	Mon, 24 Mar 2025 16:55:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 2BD9F5C6152;
	Mon, 24 Mar 2025 16:53:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A3487C4CEE9;
	Mon, 24 Mar 2025 16:55:34 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1742835334;
	bh=leI/26fAMdgexlql7vDFs6dgMQzJt9QqAf7u9gfEMO4=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=JYSAXdYoQskTzAicwQysyjewZ7NgWvm2mB+vWKjVTyvbGNjJC6Mab0i8SvwvUHRe9
	 MKJcJgxQ5E2WckMD4Sm54HxuHHBk+u+IFwN0Iq83FhptK9Sa3Kxa6dStg4XQibQRzT
	 rGPzsm1oSPNaeDBF/tjXjbbvpttx6xLEfAtAhkQ58ljQn4nmasDhHb641OnLmKFla0
	 YB1YcJ+r3nxZGoZH6Dqiu8i1lofuhvZViOqh4B0JEY5pTMwyYxZ6+bEx1166zmm9Uf
	 P3ejB1+JDH+XGkSpJtIvSJ4lGMXl3ycbwTrjzP1drYVbfctBYrDnIgQyrYLxSA1g0j
	 rp4SKjETLLi8g==
Date: Mon, 24 Mar 2025 11:55:33 -0500
From: Rob Herring <robh@kernel.org>
To: =?iso-8859-1?Q?Andr=E9?= Draszik <andre.draszik@linaro.org>
Cc: Krzysztof Kozlowski <krzk@kernel.org>, Lee Jones <lee@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>,
	Sylwester Nawrocki <s.nawrocki@samsung.com>,
	Chanwoo Choi <cw00.choi@samsung.com>,
	Alim Akhtar <alim.akhtar@samsung.com>,
	Michael Turquette <mturquette@baylibre.com>,
	Stephen Boyd <sboyd@kernel.org>,
	Russell King <linux@armlinux.org.uk>,
	Catalin Marinas <catalin.marinas@arm.com>,
	Will Deacon <will@kernel.org>,
	Alexandre Belloni <alexandre.belloni@bootlin.com>,
	Peter Griffin <peter.griffin@linaro.org>,
	Tudor Ambarus <tudor.ambarus@linaro.org>,
	Will McVicker <willmcvicker@google.com>, kernel-team@android.com,
	linux-kernel@vger.kernel.org, linux-samsung-soc@vger.kernel.org,
	devicetree@vger.kernel.org, linux-clk@vger.kernel.org,
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org
Subject: Re: [PATCH 01/34] dt-bindings: mfd: samsung,s2mps11: add s2mpg10
Message-ID: <20250324165533.GA521455-robh@kernel.org>
References: <20250323-s2mpg10-v1-0-d08943702707@linaro.org>
 <20250323-s2mpg10-v1-1-d08943702707@linaro.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: 8bit
In-Reply-To: <20250323-s2mpg10-v1-1-d08943702707@linaro.org>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250324_095535_930983_9DE7C41A 
X-CRM114-Status: GOOD (  21.58  )
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

On Sun, Mar 23, 2025 at 10:39:17PM +0000, André Draszik wrote:
> The Samsung S2MPG10 PMIC is similar to the existing PMICs supported by
> this binding.
> 
> It is a Power Management IC for mobile applications with buck
> converters, various LDOs, power meters, RTC, clock outputs, and
> additional GPIOs interfaces.
> 
> Unlike other Samsung PMICs, communication is not via I2C, but via the
> Samsung ACPM firmware, it therefore doesn't need a 'reg' property but a
> handle to the ACPM firmware node instead.

Can it be a child node of the ACPM node instead?

> 
> S2MPG10 can also act as a system power controller allowing
> implementation of a true cold-reset of the system.
> 
> Support for the other components will be added in subsequent future
> patches.
> 
> Signed-off-by: André Draszik <andre.draszik@linaro.org>
> ---
>  .../devicetree/bindings/mfd/samsung,s2mps11.yaml   | 34 ++++++++++++++++++++--
>  1 file changed, 32 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> index ac5d0c149796b6a4034b5d4245bfa8be0433cfab..ae8adb80b3af7ec3722c2a5718ad8fddf0a5df34 100644
> --- a/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> +++ b/Documentation/devicetree/bindings/mfd/samsung,s2mps11.yaml
> @@ -20,6 +20,7 @@ description: |
>  properties:
>    compatible:
>      enum:
> +      - samsung,s2mpg10-pmic
>        - samsung,s2mps11-pmic
>        - samsung,s2mps13-pmic
>        - samsung,s2mps14-pmic
> @@ -43,6 +44,12 @@ properties:
>      description:
>        List of child nodes that specify the regulators.
>  
> +  exynos,acpm-ipc:
> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description: |

Don't need '|' if no formatting to preserve.

> +      Phandle to the ACPM node for when ACPM is used to communicate with the
> +      PMIC, rather than I2C.
> +
>    samsung,s2mps11-acokb-ground:
>      description: |
>        Indicates that ACOKB pin of S2MPS11 PMIC is connected to the ground so
> @@ -58,16 +65,39 @@ properties:
>        reset (setting buck voltages to default values).
>      type: boolean
>  
> +  system-power-controller: true
> +
>    wakeup-source: true
>  
>  required:
>    - compatible
> -  - reg
> -  - regulators
>  
>  additionalProperties: false
>  
>  allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            const: samsung,s2mpg10-pmic
> +    then:
> +      properties:
> +        regulators: false
> +        samsung,s2mps11-acokb-ground: false
> +        samsung,s2mps11-wrstbi-ground: false
> +
> +      required:
> +        - exynos,acpm-ipc
> +
> +    else:
> +      properties:
> +        exynos,acpm-ipc: false
> +        system-power-controller: false
> +
> +      required:
> +        - reg
> +        - regulators
> +
>    - if:
>        properties:
>          compatible:
> 
> -- 
> 2.49.0.395.g12beb8f557-goog
> 

