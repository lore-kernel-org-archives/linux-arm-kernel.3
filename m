Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id EB5FED609B6
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 27 Nov 2024 08:48:14 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=D1QZJARKSqYtRSWHqlw+Q26CuWHT+MYK9Hma6n1FbZ0=; b=G+zabRtKAYIlx1Um6wtNUQ9SX3
	o8xTAS1C4ixiNGGW4nNFCZRg7WDsoFsVG2DUS1Oz6LIyKNGgkP8UhN6bvHj3HZphIYukQzjVpJTEr
	Vs5Qh/EkAvpS81TKKGHdxfKk1U52SvOCvJxhOYqQ3H6zV7KcbRT7iz3jpvgqoF21jQ6//4aLbWGWV
	ztB+AfTPsl7LKYFHTYPQqolrkhc76+aaIn60fR2gIZ4o1YIemVA6Epkd1Dvwk2LydbAoq10VzNrmz
	LaTgDLgmSbS5bX67dzzEVQ35fHfOC60c4dmnQ9kiHB3YDirQ00gv/clYDSjjSQ9IUPRxcnHE303BT
	vbnFahYg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDiM-0000000Cc7O-24es;
	Wed, 27 Nov 2024 08:48:02 +0000
Received: from dfw.source.kernel.org ([139.178.84.217])
	by bombadil.infradead.org with esmtps (Exim 4.98 #2 (Red Hat Linux))
	id 1tGDhO-0000000Cc1C-0g9I
	for linux-arm-kernel@lists.infradead.org;
	Wed, 27 Nov 2024 08:47:03 +0000
Received: from smtp.kernel.org (transwarp.subspace.kernel.org [100.75.92.58])
	by dfw.source.kernel.org (Postfix) with ESMTP id 168585C5DF6;
	Wed, 27 Nov 2024 08:46:18 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3EFB8C4CECC;
	Wed, 27 Nov 2024 08:47:00 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1732697221;
	bh=GTmcK6810k0tMqXrtwzmbmpxoBbVpNLZAlHC/hMJFhw=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=LW/PkkEhxp5ZHRTGvjhuw/czVQewAiY6e02kmJqmxaJ3n47pujQfy/d1F4yHIeGOR
	 kpk+bSMPob9Q+nwu8YFxutG8iWfoaR144RqCbK38xUJXKpWst1/crHlHsed6HJgEYE
	 zNArY5xupPABAHzY9T8fWdCUDHmTfg4tI5He5PR22LP7eennCYgzGAMsPYyI8GWsq6
	 UHfLdyWL4IpyljmyCer0rIYFuTUzV5WXlLCx+JXZG4u2px2j1TfKQqcluWwRZ4vpIg
	 hApqiKmkN9eu5sQN9Lo5dx7gClbPch7av5WAZe9CImNbUdzevzyCIX0D3fudZxrHjK
	 AendJd75mE/2Q==
Date: Wed, 27 Nov 2024 09:46:57 +0100
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Sasha Finkelstein <fnkl.kernel@gmail.com>
Cc: Hector Martin <marcan@marcan.st>, Sven Peter <sven@svenpeter.dev>, 
	Alyssa Rosenzweig <alyssa@rosenzweig.io>, Dmitry Torokhov <dmitry.torokhov@gmail.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Henrik Rydberg <rydberg@bitmath.org>, asahi@lists.linux.dev, 
	linux-arm-kernel@lists.infradead.org, linux-input@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-kernel@vger.kernel.org
Subject: Re: [PATCH 1/4] dt-bindings: input: touchscreen: Add Z2 controller
Message-ID: <zwdpx6c6qxm5674u2sea5sgwdd2fwim4waijb2qvixf62wrshb@yqs6zurtf7ic>
References: <20241126-z2-v1-0-c43c4cc6200d@gmail.com>
 <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <20241126-z2-v1-1-c43c4cc6200d@gmail.com>
X-CRM114-Version: 20100106-BlameMichelson ( TRE 0.8.0 (BSD) ) MR-646709E3 
X-CRM114-CacheID: sfid-20241127_004702_293640_9395C993 
X-CRM114-Status: GOOD (  13.78  )
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

On Tue, Nov 26, 2024 at 09:47:59PM +0100, Sasha Finkelstein wrote:
> +properties:
> +  compatible:
> +    items:
> +      - enum:
> +          - apple,j293-touchbar
> +          - apple,j493-touchbar
> +      - const: apple,z2-touchbar
> +      - const: apple,z2-multitouch

What is the meaning of these two last compatibles in the list? What are
these devices?

> +
> +  interrupts:
> +    maxItems: 1
> +
> +  reset-gpios:
> +    maxItems: 1
> +
> +  cs-gpios:
> +    maxItems: 1
> +    description: |

Do not need '|' unless you need to preserve formatting.

> +      J293 has a hardware quirk where the CS line is unusable and has
> +      to the be driven by a GPIO pin instead
> +
> +  firmware-name:
> +    maxItems: 1
> +
> +  label:
> +    maxItems: 1

Why is this needed? I think it is not part of common touchscreen schema.
Drop, devices do not need labels - node name and unit address identify
it. If this is needed for something else, then come with generic
property matching all touchscreens.

> +
> +  touchscreen-size-x: true
> +  touchscreen-size-y: true

Drop these two

> +
> +required:
> +  - compatible
> +  - interrupts
> +  - reset-gpios
> +  - firmware-name
> +  - label
> +  - touchscreen-size-x
> +  - touchscreen-size-y
> +
> +unevaluatedProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/gpio/gpio.h>
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    spi {
> +        #address-cells = <1>;
> +        #size-cells = <0>;
> +
> +        touchscreen@0 {
> +            compatible = "apple,j293-touchbar", "apple,z2-touchbar",
> +                         "apple,z2-multitouch";
> +            reg = <0>;
> +            spi-max-frequency = <11500000>;
> +            reset-gpios = <&pinctrl_ap 139 0>;
> +            cs-gpios = <&pinctrl_ap 109 0>;

Use proper GPIO bindings constants. You included header for this, I
guess.

> +            interrupts-extended = <&pinctrl_ap 194 IRQ_TYPE_EDGE_FALLING>;
> +            firmware-name = "apple/dfrmtfw-j293.bin";
> +            touchscreen-size-x = <23045>;
> +            touchscreen-size-y = <640>;
> +            label = "MacBookPro17,1 Touch Bar";
> +        };
> +    };
> +
> +...
> 
> -- 
> 2.47.1
> 

