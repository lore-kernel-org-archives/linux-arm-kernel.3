Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 7D2D5D42B9C
	for <linux-arm-kernel@archiver.kernel.org>; Tue, 12 Nov 2024 15:40:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=6WajROjexQbb+MQN1qDe7dBD5puv5r/Mp7RMIHPFX3k=; b=do3Ct385ouDtZtdfHv3KxIkLWt
	v9pcSBJ9WBBhVUTJ6bi24SKePOnwyDpoyZa8aqPqrH1QEG64iziv9Uln7zhtOK65osS30jBbI1Car
	0Co4Doi1GrYXaMdi2KhM2t0gLXAbI7UKA51eyvZBN6wxl8EvhtILSJu7SiwawO+BqdDRgvqU8EyvE
	A61PXQQm3EWMivGLLOYEm9tM2ffj4Bn0PaNjyjwyfMU4bOwgG4n27EY9HsNzM7U9lMK8rXcHBuO1c
	qOwj8f8yUbi3mtnOeBSUT3DyIV/BPbAdFtoFkkZcZRMxUUjKM69Dm1i2glY8fdkYlPkSIpwT0ReMB
	sR/FePqA==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tAszo-00000003z8u-3PmN;
	Tue, 12 Nov 2024 15:40:00 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tAsy1-00000003yse-0VUd
	for linux-arm-kernel@lists.infradead.org;
	Tue, 12 Nov 2024 15:38:10 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id D54C75C5606;
	Tue, 12 Nov 2024 15:37:23 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A9CF6C4CECD;
	Tue, 12 Nov 2024 15:38:07 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1731425887;
	bh=LderstpxSgPN9AQQ54sK0KMm1/rECKfSC1bhnvoipzk=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=pyL1R2OC1CdLh5fRnZtEhAqE73rSUIgeErdt0pem3+OmQ4sP3kOT/j8t+zFD7IMua
	 8LOBDP1nvwEm/jr5R8b/QlNtj+Cwi956Ji9wlBEW9dVK+EzFli7zNKSKEr2sttprt8
	 YdEH8MYvgChVfaZJ+MQX9wCxKufrklILzBDu5YA8C5vpS8R27Td4vdOWcWOI7G48vO
	 xeO3dF/oyqLtNRljmTR3vyKoYam6IepSKCQeFHCf89+FN1r+t37hQIAXs9UqAKYhWA
	 1cSx/LSHIEtFy+rK7DvFWIp31DCc57XBto3VyZYXt4vGsMsUWIGgw7Zg6y0x5D65br
	 Gcls+pD7pj40g==
Date: Tue, 12 Nov 2024 09:38:05 -0600
From: Rob Herring <robh@kernel.org>
To: Andre Przywara <andre.przywara@arm.com>
Cc: Linus Walleij <linus.walleij@linaro.org>,
	Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Chen-Yu Tsai <wens@csie.org>,
	Jernej Skrabec <jernej.skrabec@gmail.com>,
	Samuel Holland <samuel@sholland.org>, linux-gpio@vger.kernel.org,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-sunxi@lists.linux.dev, linux-kernel@vger.kernel.org
Subject: Re: [PATCH 5/7] dt-bindings: pinctrl: add compatible for Allwinner
 A523/T527
Message-ID: <20241112153805.GA951271-robh@kernel.org>
References: <20241111005750.13071-1-andre.przywara@arm.com>
 <20241111005750.13071-6-andre.przywara@arm.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20241111005750.13071-6-andre.przywara@arm.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241112_073809_265377_83A74F26 
X-CRM114-Status: GOOD (  18.21  )
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

On Mon, Nov 11, 2024 at 12:57:48AM +0000, Andre Przywara wrote:
> The A523 contains a pin controller similar to previous SoCs, although
> using 10 GPIO banks (PortB-PortK), all of them being IRQ capable.
> This introduces a new style of binding, where the pinmux values for each
> pin group is stored in the new "allwinner,pinmux" property in the DT
> node, instead of requiring every driver to store a mapping between the
> function names and the required pinmux.
> 
> Add the new name to the list of compatible strings, and required it to
> have 10 interrupts described. Also add the new pinmux property.
> 
> Signed-off-by: Andre Przywara <andre.przywara@arm.com>
> ---
>  .../pinctrl/allwinner,sun4i-a10-pinctrl.yaml  | 23 +++++++++++++++++--
>  1 file changed, 21 insertions(+), 2 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> index 4502405703145..6fc18e92e1e94 100644
> --- a/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> +++ b/Documentation/devicetree/bindings/pinctrl/allwinner,sun4i-a10-pinctrl.yaml
> @@ -56,6 +56,8 @@ properties:
>        - allwinner,sun50i-h6-r-pinctrl
>        - allwinner,sun50i-h616-pinctrl
>        - allwinner,sun50i-h616-r-pinctrl
> +      - allwinner,sun55i-a523-pinctrl
> +      - allwinner,sun55i-a523-r-pinctrl
>        - allwinner,suniv-f1c100s-pinctrl
>        - nextthing,gr8-pinctrl
>  
> @@ -64,7 +66,7 @@ properties:
>  
>    interrupts:
>      minItems: 1
> -    maxItems: 8
> +    maxItems: 10
>      description:
>        One interrupt per external interrupt bank supported on the
>        controller, sorted by bank number ascending order.
> @@ -119,13 +121,17 @@ patternProperties:
>          $ref: /schemas/types.yaml#/definitions/uint32
>          enum: [10, 20, 30, 40]
>  
> +      allwinner,pinmux:
> +        $ref: /schemas/types.yaml#/definitions/uint32-array
> +        description: pinmux selector for each pin

Please add some constraints and/or description about what goes in the 
array.

> +
>      required:
>        - pins
>        - function
>  
>      additionalProperties: false
>  
> -  "^vcc-p[a-ilm]-supply$":
> +  "^vcc-p[a-klm]-supply$":
>      description:
>        Power supplies for pin banks.
>  
> @@ -156,6 +162,17 @@ allOf:
>          - interrupts
>          - interrupt-controller
>  
> +  - if:
> +      properties:
> +        compatible:
> +          enum:
> +            - allwinner,sun55i-a523-pinctrl
> +
> +    then:
> +      properties:
> +        interrupts:
> +          minItems: 10
> +
>    - if:
>        properties:
>          compatible:
> @@ -166,6 +183,7 @@ allOf:
>        properties:
>          interrupts:
>            minItems: 8
> +          maxItems: 8
>  
>    - if:
>        properties:
> @@ -244,6 +262,7 @@ allOf:
>              - allwinner,sun8i-v3s-pinctrl
>              - allwinner,sun9i-a80-r-pinctrl
>              - allwinner,sun50i-h6-r-pinctrl
> +            - allwinner,sun55i-a523-r-pinctrl
>  
>      then:
>        properties:
> -- 
> 2.46.2
> 

