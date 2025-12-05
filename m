Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id BC4A4D32D8E
	for <linux-arm-kernel@archiver.kernel.org>; Fri,  5 Dec 2025 14:49:44 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=yBbh9YfFHCCqVeddEkBPEg6ghYqmMa7/9RWA+WpI8VU=; b=tXlUFF+v4PNU6fwrzqHIiX6haW
	RJlj8ADkTu+ebfeBH502kKrHSgx60HIlVag1m6GzjkVfplaH7/6DkxtdAoNjvep6i/5C/Wn5EFxUa
	cj2pQ8mBo/Rcmt+8UB61XimaQv20jZOfyLOoYoJnL3WMX7I4CZla03eczbuDiENTed1+QPvJdtyyG
	Vkw01jIoTNQGael/kl4IGDU+/zzji4eawLIGxAluK3k4xR54jc11nIzx/ekX/kHG7Z1w/B+R/tG0Z
	Cg0ei0/18KlrUfJ3fDVZ7dtSd+PhNsYLLz9AO89444MefhlCo1pqWAEWychOAk/1BI8WGFRL3xcJC
	ep+3Q8ww==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRX7r-00000009c4k-3Ne2;
	Fri, 05 Dec 2025 14:49:39 +0000
Received: from tor.source.kernel.org ([172.105.4.254])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vRX7p-00000009c4T-2iSU
	for linux-arm-kernel@lists.infradead.org;
	Fri, 05 Dec 2025 14:49:37 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by tor.source.kernel.org (Postfix) with ESMTP id C33B160156;
	Fri,  5 Dec 2025 14:49:36 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 49447C4CEF1;
	Fri,  5 Dec 2025 14:49:36 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1764946176;
	bh=y46lOh3uiDJdon0wY2+qojpA7h8dJLDS70+GF62iHwo=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ceyFAXvxphL0FT5av2Xs7vcxFoSccfTGt/iVLs9wP/iXQUsfJccu6awsubBHZ46Zz
	 oftzNfAjw+rTQfd4d2Hj1S0DzVRt2bLZ3mFgwyuTBHgsnQBn2QvotZct+5eTAmHrhR
	 lsRZm8CXbm4oRZwCKjmQDMsBYu9nd5M5XsfX/fDgMn4KrBc7+bFxCwbBJoowEyuRDg
	 bVwUMixp7XwNJ3+1Ne46bXzmmWkfBEgwpJHpOZVuZk9FpTWUwYlC9QXA8YCPEJIadx
	 9AXqkt7DygY7c+Wh3L9WfG/WnHy6VtkBGNj9uXQyDuafH4j8vWvvOhAdyGfwzy2wAA
	 o0GuaxsFmrOGA==
Date: Fri, 5 Dec 2025 08:49:29 -0600
From: Rob Herring <robh@kernel.org>
To: Rebecca Cran <rebecca@bsdio.com>
Cc: Krzysztof Kozlowski <krzk+dt@kernel.org>,
	Conor Dooley <conor+dt@kernel.org>, Joel Stanley <joel@jms.id.au>,
	Andrew Jeffery <andrew@codeconstruct.com.au>,
	devicetree@vger.kernel.org, linux-arm-kernel@lists.infradead.org,
	linux-aspeed@lists.ozlabs.org, linux-kernel@vger.kernel.org,
	Billy Tsai <billy_tsai@aspeedtech.com>
Subject: Re: [PATCH v3 3/3] dt-bindings: hwmon: (aspeed,g5-pwm-tacho) Move
 info from txt to yaml
Message-ID: <20251205144929.GA76422-robh@kernel.org>
References: <20251204210238.40742-1-rebecca@bsdio.com>
 <20251204210238.40742-4-rebecca@bsdio.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20251204210238.40742-4-rebecca@bsdio.com>
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

On Thu, Dec 04, 2025 at 02:02:36PM -0700, Rebecca Cran wrote:
> Move the documentation for the aspeed,ast2400-pwm-tacho and
> aspeed,ast2500-pwm-tacho devices from a text file to yaml file.
> 
> This allows for dts files containing these devices to be validated.
> 
> Where the text file documenation of required properties differ from the
> implementation, prefer the implementation and update the schema to
> match.
> 
> "#size-cells" was 1 but implementation is 0.
> "#cooling-cells" was marked as required but appears optional.
> 
> In the fan subnode, "cooling-levels" is optional according to the code
> in drivers/hwmon/aspeed-pwm-tacho.c.

Please see this one:

https://lore.kernel.org/all/20251029185448.2121857-1-robh@kernel.org/

> 
> Signed-off-by: Rebecca Cran <rebecca@bsdio.com>
> ---
>  Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml | 91 ++++++++++++++++++++
>  Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt  | 73 ----------------
>  2 files changed, 91 insertions(+), 73 deletions(-)
> 
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml b/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml
> new file mode 100644
> index 000000000000..b23c3519604b
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/hwmon/aspeed,pwm-tacho.yaml
> @@ -0,0 +1,91 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +# Copyright (C) 2023 Aspeed, Inc.
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/hwmon/aspeed,g5-pwm-tacho.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: ASPEED AST2400/AST2500 PWM and Fan Tacho controller
> +
> +maintainers:
> +  - Billy Tsai <billy_tsai@aspeedtech.com>
> +
> +description: |
> +  The ASPEED PWM controller can support up to 8 PWM outputs. The ASPEED Fan
> +  Tacho controller can support up to 16 Fan tachometer inputs.
> +
> +  There can be up to 8 fans supported. Each fan can have one PWM output and
> +  one/two Fan tach inputs.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - aspeed,ast2400-pwm-tacho
> +      - aspeed,ast2500-pwm-tacho
> +
> +  "#address-cells":
> +    const: 1
> +
> +  "#size-cells":
> +    const: 0
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  resets:
> +    maxItems: 1
> +
> +patternProperties:
> +  "^fan@[0-9]+$":
> +    $ref: fan-common.yaml#
> +    unevaluatedProperties: false
> +    properties:
> +      aspeed,fan-tach-ch:
> +        description:
> +          The tach channel used for the fan.
> +        $ref: /schemas/types.yaml#/definitions/uint8-array
> +
> +    required:
> +      - reg
> +      - aspeed,fan-tach-ch
> +
> +required:
> +  - compatible
> +  - "#address-cells"
> +  - "#size-cells"
> +  - reg
> +  - pinctrl-names
> +  - pinctrl-0
> +  - clocks
> +  - resets
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/aspeed-clock.h>
> +    pwm_tacho: pwmtachocontroller@1e786000 {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +        #cooling-cells = <2>;
> +        reg = <0x1E786000 0x1000>;
> +        compatible = "aspeed,ast2500-pwm-tacho";
> +        clocks = <&syscon ASPEED_CLK_APB>;
> +        resets = <&syscon ASPEED_RESET_PWM>;
> +        pinctrl-names = "default";
> +        pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> +
> +        fan@0 {
> +                reg = <0x00>;
> +                cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
> +                aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> +        };
> +
> +        fan@1 {
> +                reg = <0x01>;
> +                aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
> +        };
> +    };
> diff --git a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt b/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> deleted file mode 100644
> index 8645cd3b867a..000000000000
> --- a/Documentation/devicetree/bindings/hwmon/aspeed-pwm-tacho.txt
> +++ /dev/null
> @@ -1,73 +0,0 @@
> -ASPEED AST2400/AST2500 PWM and Fan Tacho controller device driver
> -
> -The ASPEED PWM controller can support upto 8 PWM outputs. The ASPEED Fan Tacho
> -controller can support upto 16 Fan tachometer inputs.
> -
> -There can be upto 8 fans supported. Each fan can have one PWM output and
> -one/two Fan tach inputs.
> -
> -Required properties for pwm-tacho node:
> -- #address-cells : should be 1.
> -
> -- #size-cells : should be 1.
> -
> -- #cooling-cells: should be 2.
> -
> -- reg : address and length of the register set for the device.
> -
> -- pinctrl-names : a pinctrl state named "default" must be defined.
> -
> -- pinctrl-0 : phandle referencing pin configuration of the PWM ports.
> -
> -- compatible : should be "aspeed,ast2400-pwm-tacho" for AST2400 and
> -	       "aspeed,ast2500-pwm-tacho" for AST2500.
> -
> -- clocks : phandle to clock provider with the clock number in the second cell
> -
> -- resets : phandle to reset controller with the reset number in the second cell
> -
> -fan subnode format:
> -===================
> -Under fan subnode there can upto 8 child nodes, with each child node
> -representing a fan. If there are 8 fans each fan can have one PWM port and
> -one/two Fan tach inputs.
> -For PWM port can be configured cooling-levels to create cooling device.
> -Cooling device could be bound to a thermal zone for the thermal control.
> -
> -Required properties for each child node:
> -- reg : should specify PWM source port.
> -	integer value in the range 0 to 7 with 0 indicating PWM port A and
> -	7 indicating PWM port H.
> -
> -- cooling-levels: PWM duty cycle values in a range from 0 to 255
> -                  which correspond to thermal cooling states.
> -
> -- aspeed,fan-tach-ch : should specify the Fan tach input channel.
> -                integer value in the range 0 through 15, with 0 indicating
> -		Fan tach channel 0 and 15 indicating Fan tach channel 15.
> -		At least one Fan tach input channel is required.
> -
> -Examples:
> -
> -pwm_tacho: pwmtachocontroller@1e786000 {
> -	#address-cells = <1>;
> -	#size-cells = <1>;
> -	#cooling-cells = <2>;
> -	reg = <0x1E786000 0x1000>;
> -	compatible = "aspeed,ast2500-pwm-tacho";
> -	clocks = <&syscon ASPEED_CLK_APB>;
> -	resets = <&syscon ASPEED_RESET_PWM>;
> -	pinctrl-names = "default";
> -	pinctrl-0 = <&pinctrl_pwm0_default &pinctrl_pwm1_default>;
> -
> -	fan@0 {
> -		reg = <0x00>;
> -		cooling-levels = /bits/ 8 <125 151 177 203 229 255>;
> -		aspeed,fan-tach-ch = /bits/ 8 <0x00>;
> -	};
> -
> -	fan@1 {
> -		reg = <0x01>;
> -		aspeed,fan-tach-ch = /bits/ 8 <0x01 0x02>;
> -	};
> -};
> -- 
> 2.47.3
> 

