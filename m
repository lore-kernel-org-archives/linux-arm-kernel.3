Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id E18F0CA5FCE
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  1 Oct 2026 05:56:58 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=ZDxsokV5obQ5C8QUjCgm5Et9Kq1WK82QzPRqqhS1oSo=; b=doYDGSTbdk6ieoCBtEhoEa7y/v
	6e7repoflzGJcaDaoEU8FIzS8r3b0LTrqOX9y6SS7jwZQGrUlOv+Zr6Qrf8l3LtENvsAH9gtzzEUl
	cZPZcMamSHyjjbrb/WvwNhAIXm5/7QFcJCyXaCTx9VN+XNKlb+OsIbDhfUloTLFZpYX8vIdMBnvaD
	AjZlwhvkwvwPyvxUMTbAE8sj1sNCMexuCY9OZqLgwcHRnPeYwqnOjunSkZXy3P/yuNE317G7S7VWX
	wkRwIcaVqc6IooE8zJuBbzARpO2ARBWiO6Cohw/k/hitw1qHZpcRljsv6VRVEea0MSQa3a9FpFWyt
	OURA23eA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9mm-00000007qux-0epV;
	Thu, 01 Oct 2026 05:56:52 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1xC9ml-00000007quq-0TH6
	for linux-arm-kernel@lists.infradead.org;
	Thu, 01 Oct 2026 05:56:51 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id A21BC43693;
	Thu,  1 Oct 2026 05:56:49 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 54AB81F000FF;
	Thu,  1 Oct 2026 05:56:48 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1790834209;
	bh=ZDxsokV5obQ5C8QUjCgm5Et9Kq1WK82QzPRqqhS1oSo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=JS1OLHY7AHmn7gnE2QX4jLhMDKzXZfIViXHr4j4k0n84XCeGcPItrHrlq4kwPc/g7
	 VWuc+LL0Aw0XmJSh9tYVPvlj28ZO6K7GVqrPD75ctqrAeWX3eNL4SYtrnYDgCRwiiH
	 pGhCtHnoJpzsIIVWMaW35sYlNJLZXFMxRTtI/dBNg172RjS0GPVSBjmVlIAFeA4wI+
	 R+Zsy0mRxV+xjjEcNMWcQccSGH6piG6qRlp4MkMI8VX+H0CQ1gXQ6LfAafU4ZSTj6w
	 GrbimXZxT3+1HTdKmwMey2dnVlNCcLPFTtzNr6xvjrXjxzWxsvuw49o8uWT8ZsIYIA
	 fp+L5qpppAvSw==
Date: Thu, 1 Oct 2026 07:56:44 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Billy Tsai <billy_tsai@aspeedtech.com>
Cc: Jonathan Cameron <jic23@kernel.org>, 
	David Lechner <dlechner@baylibre.com>, Nuno =?utf-8?B?U8Oh?= <nuno.sa@analog.com>, 
	Andy Shevchenko <andy@kernel.org>, Rob Herring <robh@kernel.org>, 
	Krzysztof Kozlowski <krzk+dt@kernel.org>, Conor Dooley <conor+dt@kernel.org>, 
	Joel Stanley <joel@jms.id.au>, Andrew Jeffery <andrew@codeconstruct.com.au>, 
	Ryan Chen <ryan_chen@aspeedtech.com>, linux-iio@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/3] dt-bindings: iio: adc: Add syscon property for
 multi-SCU SoCs
Message-ID: <20261001-obedient-stimulating-worm-0ae11c@quoll>
References: <20261001-ast27xx-adc-upstream-v1-0-5ace57533418@aspeedtech.com>
 <20261001-ast27xx-adc-upstream-v1-1-5ace57533418@aspeedtech.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20261001-ast27xx-adc-upstream-v1-1-5ace57533418@aspeedtech.com>
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

On Thu, Oct 01, 2026 at 11:28:44AM +0800, Billy Tsai wrote:
> The ADC's reference-voltage trimming data lives in a System Control
> Unit (SCU) register. SoCs with a single SCU instance let the driver
> locate it without any additional information, but SoCs such as AST2700
> that expose more than one SCU node need an explicit phandle to
> disambiguate which one holds the trimming data.
> 
> Add an optional "syscon" phandle property, and require it for the
> AST2700 compatibles since they are the first multi-SCU SoCs supported
> by this driver.
> 
> Signed-off-by: Billy Tsai <billy_tsai@aspeedtech.com>
> Assisted-by: Claude:claude-sonnet-5
> ---
>  .../bindings/iio/adc/aspeed,ast2600-adc.yaml       | 28 ++++++++++++++++++++++
>  1 file changed, 28 insertions(+)
> 
> diff --git a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> index 249101b55cf4e..0d6b10450cfa8 100644
> --- a/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> +++ b/Documentation/devicetree/bindings/iio/adc/aspeed,ast2600-adc.yaml
> @@ -67,6 +67,11 @@ properties:
>      description:
>        Inform the driver that last channel will be used to sensor battery.
>  
> +  syscon:

Missing vendor and descriptive name. Please read writing bindings.

> +    $ref: /schemas/types.yaml#/definitions/phandle
> +    description:
> +      Required on SoCs with more than one SCU instance (e.g. AST2700).

Describe the purpose, not open code schema.

> +
>  required:
>    - compatible
>    - reg
> @@ -74,6 +79,18 @@ required:
>    - resets
>    - "#io-channel-cells"
>  
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          contains:
> +            enum:
> +              - aspeed,ast2700-adc0
> +              - aspeed,ast2700-adc1
> +    then:
> +      required:
> +        - syscon
> +
>  additionalProperties: false
>  
>  examples:
> @@ -95,4 +112,15 @@ examples:
>          #io-channel-cells = <1>;
>          aspeed,int-vref-microvolt = <2500000>;
>      };
> +  - |
> +    #include <dt-bindings/clock/aspeed,ast2700-scu.h>
> +    #include <dt-bindings/reset/aspeed,ast2700-scu.h>

No need for a new exmaple for one new property.

Best regards,
Krzysztof


