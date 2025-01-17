Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 8CFD3C02183
	for <linux-arm-kernel@archiver.kernel.org>; Fri, 17 Jan 2025 08:50:32 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=TVDp1lFFfsuHmJ4qD47ArN/EdDiChaOWcVP/1fGzoa8=; b=spcjdQ5Gtv60KzxNHbtlkryUDM
	mvVv89mFz20zNhQ/Mv2XZXvOEfmyAPFHAU0CJcug7tMIshQ2cJt/E5/ZdCkF06LzoJhncGMHePnWD
	omT5n/hSJv9Oxb/m426VXnmZP9X9QDJtj086pyjHjnF81Jiz4HMwe8dwlUAiqvFJZyNwM0ssl49HW
	7z/QUFeeN1oLaROvoEU8lgIOML0uYQAHZq5GfCt6iwpEEilQUaUCdIXKRBc5mwdTdtgulnwtj19PA
	rOWfOMgUYxviSrbIaQ7xLxeCqcG8clbDa93fDlPSjnFoGeAOXxUz4lPT08FlYkBPIT5s89EtkIvgw
	pggVSIaw==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tYi3Z-0000000HNQr-1Hr0;
	Fri, 17 Jan 2025 08:50:21 +0000
Received: from nyc.source.kernel.org ([2604:1380:45d1:ec00::3])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tYi2J-0000000HNCc-0CPV;
	Fri, 17 Jan 2025 08:49:04 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by nyc.source.kernel.org (Postfix) with ESMTP id 5278CA42A01;
	Fri, 17 Jan 2025 08:47:14 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 0B432C4CEDD;
	Fri, 17 Jan 2025 08:49:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1737103741;
	bh=cQc0hGk7FmLHCcBWPKPQA14Ij0b8LuFcpjJiNw1Al5c=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=NbxWSK2dXtW/eIQj7Jp2UZaUEQ5m2cq0XzCoNalsUP/cs8UOjJIFtRKn4GXgjIVc2
	 cVHPBZHe1m6gPhu9dhqWsjWzchuJxQ5Z4gzWiRtjeVHD0V7eEGyQm8rKf4NpMhYBIr
	 FePfAT3Ct/y8zT99TRC7+18AuIWun55wpfgatDdn9jeUIMWcJ3/zW9miSzifTEEiJ6
	 TCz114oXKXvNWRqEY9l/7uC1ixWI8VbBnWwBlZIB2bCFUMNw9tTt6erxuRDLdXNCD3
	 noIQucuR7dgo/xV8TFHSl6/CqhZPx41qr6vOrchadt9VRanW+bNO+9eSPKC0BtiTHU
	 y3UqzrSERrkaQ==
Date: Fri, 17 Jan 2025 09:48:58 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Xianwei Zhao <xianwei.zhao@amlogic.com>
Cc: Linus Walleij <linus.walleij@linaro.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Neil Armstrong <neil.armstrong@linaro.org>, 
	Kevin Hilman <khilman@baylibre.com>, Jerome Brunet <jbrunet@baylibre.com>, 
	Martin Blumenstingl <martin.blumenstingl@googlemail.com>, Bartosz Golaszewski <brgl@bgdev.pl>, linux-gpio@vger.kernel.org, 
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-amlogic@lists.infradead.org
Subject: Re: [PATCH v3 1/5] dt-bindings: pinctrl: Add support for Amlogic SoCs
Message-ID: <20250117-intrepid-nano-horse-98e817@krzk-bin>
References: <20250115-amlogic-pinctrl-v3-0-2b8536457aba@amlogic.com>
 <20250115-amlogic-pinctrl-v3-1-2b8536457aba@amlogic.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20250115-amlogic-pinctrl-v3-1-2b8536457aba@amlogic.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20250117_004903_215455_42A810AA 
X-CRM114-Status: GOOD (  10.22  )
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

On Wed, Jan 15, 2025 at 02:41:59PM +0800, Xianwei Zhao wrote:
> +properties:
> +  compatible:
> +    const: amlogic,pinctrl-a4
> +
> +  "#address-cells":
> +    const: 2
> +
> +  "#size-cells":
> +    const: 2

Why this moved to '2'? 32-bit was not enough?

> +
> +  ranges: true
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"

Keep required after patternProperties

> +
> +patternProperties:
> +  "^gpio@[0-9a-f]+$":
> +    type: object
> +
> +    properties:
> +      reg:
> +        minItems: 1
> +        items:
> +          - description: pin config register
> +          - description: pin mux setting register (some special pin fixed function)
> +          - description: pin drive strength register (optionanl)

typo: optional

> +
> +      reg-names:
> +        minItems: 1
> +        items:
> +          - const: gpio
> +          - const: mux
> +          - const: ds
> +
> +      gpio-controller: true
> +
> +      "#gpio-cells":
> +        const: 2
> +
> +      gpio-ranges:
> +        maxItems: 1
> +
> +      bank-number:
> +        description: |
> +          bank-number are provided by the pin controller header file at:
> +          <include/dt-bindings/pinctrl/amlogic,pinctrl.h>
> +        $ref: /schemas/types.yaml#/definitions/uint32

gpio-ranges tell you that, don't they?

Anyway, you would need here minimum and maximum.

> +
> +    required:
> +      - reg
> +      - reg-names
> +      - gpio-controller
> +      - "#gpio-cells"
> +      - gpio-ranges
> +      - bank-number
> +
> +    additionalProperties: false
> +
> +  "^func-[0-9a-z-]+$":
> +    type: object
> +    patternProperties:
> +      "^group-[0-9a-z-]+$":
> +        type: object
> +        allOf:
> +          - $ref: /schemas/pinctrl/pincfg-node.yaml
> +          - $ref: /schemas/pinctrl/pinmux-node.yaml

Missing required pinmux and maybe other properties.

> +    additionalProperties: false
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/pinctrl/amlogic,pinctrl.h>
> +    apb {
> +      #address-cells = <2>;
> +      #size-cells = <2>;
> +      periphs_pinctrl: pinctrl {
> +        compatible = "amlogic,pinctrl-a4";
> +        #address-cells = <2>;
> +        #size-cells = <2>;
> +        ranges;
> +
> +        gpio@14 {
> +          reg = <0 0x14 0 0x10>,
> +                <0 0x14 0 0x10>;

One line.

> +          reg-names = "gpio", "mux";
> +          gpio-controller;
> +          #gpio-cells = <2>;
> +          bank-number = <AMLOGIC_GPIO_B>;
> +          gpio-ranges = <&periphs_pinctrl 0 8 10>;
> +        };

Best regards,
Krzysztof


