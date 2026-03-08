Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 76CB3F55138
	for <linux-arm-kernel@archiver.kernel.org>; Sun,  8 Mar 2026 09:29:50 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=v90xSXfsMtWNuK0qeu7iVKZLJyeVg2wyj8b1flekYGk=; b=YRttD/K30+HAp35PHgDZFo7A4f
	iemvwRAKYmisBeIKFYwUpomQ8UOmBGy5TXULl/7XlvBZRzkBI34+evTAa8+qzOCjKRAglqGRjJMh9
	9Q2FooSucOSgOoCrAQGW03g19FUYZS1nz9cz77k5MksViqeaCkAHfsRGqN0ZfykajkTwAjsUS0Msj
	T4mBRbG8ZnpMrRFfwoK31WcJhvqQ2lA7f/M4Apskzcaq6rfbzxI4VRlrI50IVLeZNB/BYawHIbfE9
	CV4ozd8WkWH8FDROYTNsG8mIHKILnlGZkvrNDnpXRpJ7jLH3cGxWOoSpvUrgqQleGhLREqnIvouqY
	y146W3ig==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzASH-00000005qVf-1t25;
	Sun, 08 Mar 2026 09:29:45 +0000
Received: from sea.source.kernel.org ([172.234.252.31])
	by bombadil.infradead.org with esmtps (Exim 4.98.2 #2 (Red Hat Linux))
	id 1vzASF-00000005qVI-0kas
	for linux-arm-kernel@lists.infradead.org;
	Sun, 08 Mar 2026 09:29:44 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by sea.source.kernel.org (Postfix) with ESMTP id D29734011C;
	Sun,  8 Mar 2026 09:29:42 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 555F6C116C6;
	Sun,  8 Mar 2026 09:29:42 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1772962182;
	bh=UdO0glGyIlGGoMN5cN83CJyEO2V3A/5t+IUInVAdHz8=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=WYRJu4GMvJqQn6ZDF6I2d5snxNq8YjE3KL686bTQIV9zWBnu/ZEWs1hPZhYKrKoZP
	 HJOOOL3d1Bhjmy+onknBbUj8vyFWVZRRW0QEkm1QaFtKevKoxudsJ93X2m9CMAg0KL
	 UpBUqVYhLfkComUTzWe0VFr5P/VEHfjUhmgElLuQ7yLN8kZUWfJvbcNdgQDkhSPBmR
	 3Kt6Omo8fp89pvk7WTFYfXNeF3GqQm7/3TEJBhj8VRO6JFtw0P4y9a4Rv5pp4o7fwP
	 IPXFf2kKBmqcHfAMY/H6NPUdS1rstckuz9yG5O3xcPYJWng9+tHA3xKd3TstiYktoN
	 +eWczMeX+HyBQ==
Date: Sun, 8 Mar 2026 10:29:40 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Charan Pedumuru <charan.pedumuru@gmail.com>
Cc: Greg Kroah-Hartman <gregkh@linuxfoundation.org>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Claudiu Beznea <claudiu.beznea@tuxon.dev>, 
	Herve Codina <herve.codina@bootlin.com>, Nicolas Ferre <nicolas.ferre@microchip.com>, 
	Alexandre Belloni <alexandre.belloni@bootlin.com>, linux-usb@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v3 5/5] dt-bindings: usb: atmel,at91sam9rl-udc: convert
 to DT schema
Message-ID: <20260308-cherubic-misty-cricket-80fad0@quoll>
References: <20260307-atmel-usb-v3-0-3dc48fe772be@gmail.com>
 <20260307-atmel-usb-v3-5-3dc48fe772be@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20260307-atmel-usb-v3-5-3dc48fe772be@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20260308_012943_237833_2726EDF3 
X-CRM114-Status: GOOD (  13.85  )
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

On Sat, Mar 07, 2026 at 09:16:22AM +0000, Charan Pedumuru wrote:
> +
> +  reg:
> +    maxItems: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  clocks:
> +    minItems: 2

Drop

> +    maxItems: 2
> +
> +  clock-names:
> +    minItems: 2
> +    maxItems: 2
> +    items:
> +      enum: [pclk, hclk]

No, list the items instead. Why is this flexible? Nothing in commit msg
explains that.

> +
> +  atmel,vbus-gpio:
> +    description: GPIO used to detect the presence of VBUS, indicating that
> +      the USB cable is connected.
> +    maxItems: 1
> +
> +required:
> +  - compatible
> +  - reg
> +  - interrupts
> +  - clocks
> +  - clock-names
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +    #include <dt-bindings/clock/at91.h>
> +    #include <dt-bindings/gpio/gpio.h>
> +    gadget@fff78000 {
> +        compatible = "atmel,at91sam9g45-udc";
> +        reg = <0x00600000 0x80000
> +               0xfff78000 0x400>;
> +        interrupts = <27 IRQ_TYPE_LEVEL_HIGH 0>;
> +        clocks = <&pmc PMC_TYPE_PERIPHERAL 27>, <&pmc PMC_TYPE_CORE PMC_UTMI>;
> +        clock-names = "pclk", "hclk";
> +        atmel,vbus-gpio = <&pioC 15 GPIO_ACTIVE_HIGH>;
> +    };
> +...
> diff --git a/Documentation/devicetree/bindings/usb/atmel-usb.txt b/Documentation/devicetree/bindings/usb/atmel-usb.txt
> deleted file mode 100644
> index 12183ef47ee4..000000000000
> --- a/Documentation/devicetree/bindings/usb/atmel-usb.txt
> +++ /dev/null
> @@ -1,125 +0,0 @@
> -Atmel SOC USB controllers
> -
> -OHCI
> -
> -Required properties:
> - - compatible: Should be "atmel,at91rm9200-ohci" for USB controllers

Why do you remove OHCI here? There is no conversion of this compatible.
Don't combine multiple different changes in one commit.


Best regards,
Krzysztof


