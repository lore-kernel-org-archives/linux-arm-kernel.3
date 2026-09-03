Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id 11C87C624A4
	for <linux-arm-kernel@archiver.kernel.org>; Thu,  3 Sep 2026 09:35:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:In-Reply-To:Content-Type:
	MIME-Version:References:Message-ID:Subject:Cc:To:From:Date:Reply-To:
	Content-Transfer-Encoding:Content-ID:Content-Description:Resent-Date:
	Resent-From:Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=e4MqcvwfSek3Uh8sK+hGYqBTyKKqy+6qL3osBo5IZyQ=; b=npgHkmWYmnSjY50Sf04OAWI5i4
	y0XjpvN/uH1vWr3mUMW70dUaZmwXKnhzKPW81JWaDV+vWnDF0uI4rgXQh5RE6R9ZwD5WUxPquQXXN
	e6Tfce8gbPo38zh+hj4PfeaNvdMu0+dVGEhpsUKv27QUnqSvYugd7Saaf9kV00X7lmHQ7RsO/ArDZ
	NBVnA+xVIyYcBONtMS8ZTWmKwS0sLZphUs8IF46YS4z5V608yhlRtQNb2GeSTV+A3XeStE0N3bi5x
	3giQiHk3C5V0yot3V6o/AAKGQgypwNWWyYUmzfwFBzig98tUyQaUCmJuUHCralez5EnHAxktsZeqK
	ks5nps3w==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23qp-0000000Gy0X-1dE8;
	Thu, 03 Sep 2026 09:35:19 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1x23qn-0000000Gy0O-2w9D
	for linux-arm-kernel@lists.infradead.org;
	Thu, 03 Sep 2026 09:35:17 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 0FEF141A12;
	Thu,  3 Sep 2026 09:35:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 395BD1F00A3A;
	Thu,  3 Sep 2026 09:35:16 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1788428116;
	bh=e4MqcvwfSek3Uh8sK+hGYqBTyKKqy+6qL3osBo5IZyQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To;
	b=UU/t6hzXnpRkQcrdXubrgSCptBhgXKgc89Lf2kykuVir48C9US3P0/7/+W3SyGe9F
	 IuuOBgoZ9R7nnsAoZwEhUOl9EcPWoytwnsR3RiwbPF1jU5ktFY96+nW9Y0XkSuuXFG
	 mpzijgIMLDeVkWyNJEtCTy44Vdus/P/9ijSfI4fQ78cA9/xQZQP1Al6J5FpLSh7ovK
	 89UDuaUaGDz6s7vrJ99mheOY7p5AqB/6ALgb/2nfqZH+nrkY3l2OkBH0P1Da8Ysjxl
	 eHwn2hZ1FFoiK9m5DNAlzM4Q7SA8YcxHcta3NLNnhTRYk57DqCR9JmjeuOFOR8sdkk
	 mSYpT7YQ5zVgA==
Date: Thu, 3 Sep 2026 11:35:13 +0200
From: Krzysztof Kozlowski <krzk@kernel.org>
To: Markus Probst <markus.probst@posteo.de>
Cc: Alexandre Belloni <alexandre.belloni@bootlin.com>, 
	Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>, 
	Conor Dooley <conor+dt@kernel.org>, Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <uwe@kleine-koenig.org>, 
	Andrew Lunn <andrew@lunn.ch>, Gregory Clement <gregory.clement@bootlin.com>, 
	Sebastian Hesselbarth <sebastian.hesselbarth@gmail.com>, Michael Langer <michael.brainbug.langer@googlemail.com>, 
	Andrew Morton <akpm@linux-foundation.org>, Linus Walleij <linusw@kernel.org>, 
	linux-arm-kernel@lists.infradead.org, linux-rtc@vger.kernel.org, devicetree@vger.kernel.org, 
	linux-gpio@vger.kernel.org, linux-kernel@vger.kernel.org
Subject: Re: [PATCH v8 1/6] dt-bindings: rtc: Add pinctrl for S35390A
Message-ID: <20260903-honest-pink-poodle-a3f64a@quoll>
References: <20260831-rtc_s35390a_int1-v8-0-dac1dc86ce1f@posteo.de>
 <20260831-rtc_s35390a_int1-v8-1-dac1dc86ce1f@posteo.de>
 <20260901-proud-furious-bison-0edeec@quoll>
 <c4b9b6c6033774a02be50cf07a6729a6b1e9e5ba.camel@posteo.de>
MIME-Version: 1.0
Content-Type: text/plain; charset=utf-8
Content-Disposition: inline
In-Reply-To: <c4b9b6c6033774a02be50cf07a6729a6b1e9e5ba.camel@posteo.de>
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

On Tue, Sep 01, 2026 at 01:28:36PM +0000, Markus Probst wrote:
> On Tue, 2026-09-01 at 12:05 +0200, Krzysztof Kozlowski wrote:
> > > +patternProperties:
> > > +  "^pins":
> > > +    type: object
> > > +    additionalProperties: false
> > > +
> > > +    patternProperties:
> > > +      "-pins$":
> > > +        type: object
> > > +        additionalProperties: false
> > > +
> > > +        allOf:
> > > +          - $ref: /schemas/pinctrl/pinmux-node.yaml#
> > > +
> > > +        properties:
> > > +          pins:
> > > +            minItems: 1
> > > +            items:
> > > +              enum:
> > > +                - int1
> > > +                - int2
> > > +
> > > +          function:
> > > +            description: |
> > > +              Pin function:
> > > +              - ignore:  Preserve the previous state.
> > > +              - disable: Disable pin output.
> > > +              - wakeup:  Output wakes up the system.
> > > +              - clock:   Output clock pulse.
> > > +              - pmin1:   Minute periodical output with 50% duty.
> > > +              - pmin2:   Minute periodical output L for 7.81 ms.
> > > +                         Can only be used with pin int1.
> > > +            enum:
> > > +              - ignore
> > > +              - disable
> > > +              - wakeup
> > > +              - clock
> > > +              - pmin1
> > > +              - pmin2
> > > +
> > > +        required:
> > > +          - pins
> > > +          - function
> > > +
> > > +required:
> > > +  - compatible
> > > +  - reg
> > > +
> > > +unevaluatedProperties: false
> > > +
> > > +examples:
> > > +  - |
> > > +    i2c {
> > > +        #address-cells = <1>;
> > > +        #size-cells = <0>;
> > > +
> > > +        rtc@30 {
> > > +            compatible = "sii,s35390a";
> > > +            reg = <0x30>;
> > > +            pinctrl-0 = <&rtc_pins_default>;
> > > +            pinctrl-names = "default";
> > > +
> > > +            wakeup-parent = <&int>;
> > 
> > I don't understand this need. Device does not generate interrupts - no
> > interrupts property - thus how can it wakeup?
> It is just an example.

But examplep should be complete and represent some real thing, not just
stiched random properties.

> 
> > 
> > As explained in commit msg, the signal at int1 goes to the SoC, right?
> I assume.
> 
> > So where does it go? To which pin of which device? &int?
> For my Synology DS923+ NAS, I do not have schematics. I only know for
> sure from source code that INT1 is used for wakeup and I can confirm
> that this does indeed wake the device up. 
> 
> > 
> > Can you show complete upstream DTS using this?
> There is arch/arm/boot/dts/ti/omap/am3517-som.dtsi, which has the pin
> output of INT1 routed to a gpio pin. INT2 isn't connected at all.
> According to the public schematic [1], this looks accurate.

And INT1 is part of the interrupts.

What I do not get, how this can wakeup anything without generating
an interrupt?

Best regards,
Krzysztof


