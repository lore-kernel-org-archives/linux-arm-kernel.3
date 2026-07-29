Return-Path: <linux-arm-kernel-bounces+linux-arm-kernel=archiver.kernel.org@lists.infradead.org>
X-Spam-Checker-Version: SpamAssassin 3.4.0 (2014-02-07) on
	aws-us-west-2-korg-lkml-1.web.codeaurora.org
Received: from bombadil.infradead.org (bombadil.infradead.org [198.137.202.133])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.lore.kernel.org (Postfix) with ESMTPS id D7EB5C54F51
	for <linux-arm-kernel@archiver.kernel.org>; Wed, 29 Jul 2026 08:03:38 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; q=dns/txt; c=relaxed/relaxed;
	d=lists.infradead.org; s=bombadil.20210309; h=Sender:List-Subscribe:List-Help
	:List-Post:List-Archive:List-Unsubscribe:List-Id:Content-Transfer-Encoding:
	Content-Type:In-Reply-To:From:References:Cc:To:Subject:MIME-Version:Date:
	Message-ID:Reply-To:Content-ID:Content-Description:Resent-Date:Resent-From:
	Resent-Sender:Resent-To:Resent-Cc:Resent-Message-ID:List-Owner;
	bh=JteUNebrq8Y5BoF6qFLQtjZt8zz9HlOcVSVsWZpTXkA=; b=c/hxY7NpWmX4b/bXcuDtA/PWJ9
	E/YeYIcVtKwm7SuqhoWPJcxQFG/aNtYV0W+HcpeR3XVQuqdNDyrhoHqfpK5hlxGHIEjXdUE7j10Sp
	RbdoVAXwj8JYrFbMLpq0REQrY6hCkzFkJMph+cD8WFqx0bKEKh3Q3iCavvwRWSIoajKgxBfZORQr8
	6FlyAH1VsGT9idHftreeVnKlxwpL09f0K3yGa+PYl+Efr63cd0JFW1hxab0QNlqN7uXqK8OQzQENI
	sbndRtde6vAP7mNj0b3wTM46dtQWEVKeFuiLZzgW/lx4bph76oQfyfFEdcJ+rKi7rALrMi2CTbQ3b
	elBpGTVg==;
Received: from localhost ([::1] helo=bombadil.infradead.org)
	by bombadil.infradead.org with esmtp (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozGB-00000007BsO-0Ary;
	Wed, 29 Jul 2026 08:03:27 +0000
Received: from sea.source.kernel.org ([2600:3c0a:e001:78e:0:1991:8:25])
	by bombadil.infradead.org with esmtps (Exim 4.99.1 #2 (Red Hat Linux))
	id 1wozG9-00000007Bs7-3DOa
	for linux-arm-kernel@lists.infradead.org;
	Wed, 29 Jul 2026 08:03:25 +0000
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	by sea.source.kernel.org (Postfix) with ESMTP id 2CCC8411F0;
	Wed, 29 Jul 2026 08:03:25 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 449DA1F000E9;
	Wed, 29 Jul 2026 08:03:19 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1785312205;
	bh=JteUNebrq8Y5BoF6qFLQtjZt8zz9HlOcVSVsWZpTXkA=;
	h=Date:Subject:To:Cc:References:From:In-Reply-To;
	b=IQ179P4CWgJQUfIO/xTq6P8zIgK/o1owHEh2nTPZngI7nTSouMh1AAPQGX2SPtybA
	 9TNXfo9m0yvDhta7jDb+MjlOM2UPaKBX6ll6ehaYxKrFmGHtkCJCgNwwZYXl0RZ/B6
	 0mEjmr1SfBPBoXAMwSPV3ZVrywogrGNy1UCka6tQnyDJUmv/1z7pQPylwCbvK8LRyI
	 3i83/lt0DkSA6bGzzWCpRajoLUkcSs/IaBEdUgYlnY5PODfPvLa/M1wdw3LG5ubFso
	 5pH8H4j2+JCn0VVtW4HoWrC3k/eSYM+NKpRaG+XeObT2VvRbmtjcuZGx7TCISUsDmc
	 a42YPQ2BWxJyg==
Message-ID: <986fac76-3bcd-4523-a902-701027aff1bf@kernel.org>
Date: Wed, 29 Jul 2026 10:03:16 +0200
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH v2 1/2] dt-bindings: gpio: Add Axiado SGPIO controller
To: Petar Stepanovic <pstepanovic@axiado.com>, Tzu-Hao Wei <twei@axiado.com>,
 Swark Yang <syang@axiado.com>, Prasad Bolisetty <pbolisetty@axiado.com>,
 Linus Walleij <linusw@kernel.org>, Bartosz Golaszewski <brgl@kernel.org>,
 Rob Herring <robh@kernel.org>, Krzysztof Kozlowski <krzk+dt@kernel.org>,
 Conor Dooley <conor+dt@kernel.org>, Harshit Shah <hshah@axiado.com>,
 SriNavmani A <srinavmani@axiado.com>, Karthikeyan Mitran <kmitran@axiado.com>
Cc: linux-gpio@vger.kernel.org, devicetree@vger.kernel.org,
 linux-arm-kernel@lists.infradead.org, linux-kernel@vger.kernel.org
References: <20260729-axiado-ax3000-sgpio-controller-v2-0-976f4ed11438@axiado.com>
 <20260729-axiado-ax3000-sgpio-controller-v2-1-976f4ed11438@axiado.com>
From: Krzysztof Kozlowski <krzk@kernel.org>
Content-Language: en-US
Autocrypt: addr=krzk@kernel.org; keydata=
 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
In-Reply-To: <20260729-axiado-ax3000-sgpio-controller-v2-1-976f4ed11438@axiado.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit
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

On 29/07/2026 09:02, Petar Stepanovic wrote:
> +description: |
> +  The Axiado SGPIO controller provides a serial GPIO expansion interface
> +  that multiplexes multiple GPIO signals over a small set of physical lines.
> +
> +  The controller operates as a shift-based interface, where output values
> +  are serialized on a data output line and input values are sampled from a
> +  data input line in synchronization with a shift clock. A latch signal is
> +  used to update output states after each transfer cycle.
> +
> +  The interface uses data output (DOUT), data input (DIN), shift clock
> +  (SCLK), and latch signal (LATCH).
> +
> +  Each SGPIO position provides one fixed-direction input GPIO and one
> +  fixed-direction output GPIO. Input GPIOs support edge-triggered
> +  interrupts.
> +
> +  GPIOs are organized in banks of 32 signals, with registers controlling
> +  output values, input sampling, and interrupt status. The number of GPIO
> +  lines depends on the hardware variant.
> +
> +  The controller detects changes on input GPIOs. Interrupt events are
> +  aggregated and signaled through a single interrupt line to the parent
> +  interrupt controller.
> +
> +  Register access is performed over the APB bus. The SGPIO shift clock is
> +  derived from the APB clock using a programmable divider.
> +
> +properties:
> +  compatible:
> +    enum:
> +      - axiado,ax3000-sgpio
> +      - axiado,ax3005-sgpio
> +
> +  reg:
> +    maxItems: 1
> +
> +  clocks:
> +    description:
> +      APB clock used for register access and SGPIO shift clock generation
> +    maxItems: 1
> +
> +  bus-frequency:
> +    description: SGPIO shift clock frequency in Hz
> +    minimum: 1

Such property is not allowed. Why you cannot calculate it automatically?

> +
> +  gpio-controller: true
> +
> +  '#gpio-cells':
> +    const: 2
> +
> +  interrupt-controller: true
> +
> +  '#interrupt-cells':
> +    const: 2
> +
> +  interrupts:
> +    maxItems: 1
> +
> +  ngpios:
> +    description:
> +      Number of SGPIO positions. Each position provides one input GPIO and
> +      one output GPIO.
> +    enum: [128, 512]
> +
> +allOf:
> +  - if:
> +      properties:
> +        compatible:
> +          const: axiado,ax3000-sgpio
> +    then:
> +      properties:
> +        ngpios:
> +          const: 128

else what? 3005 has 512? Then these are implied by compatible, no?

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - bus-frequency
> +  - gpio-controller
> +  - '#gpio-cells'
> +  - interrupt-controller
> +  - '#interrupt-cells'
> +  - interrupts
> +  - ngpios
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/interrupt-controller/irq.h>
> +
> +    sgpio@a000 {

git grep sgpio@

No results (except well known poor coding style platform). I already
commented on this.

> +        compatible = "axiado,ax3005-sgpio";
> +        reg = <0xa000 0x800>;
> +        clocks = <&apb_clk>;
> +        bus-frequency = <1000000>;
> +        gpio-controller;
Best regards,
Krzysztof

